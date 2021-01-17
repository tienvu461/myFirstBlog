from django.shortcuts import render
from django.views import generic
from django.shortcuts import get_object_or_404
from .models import BlogPost, GenericConfig

def home(request):
    """Display all blog posts"""

    posts = BlogPost.objects.all().order_by('-created_date')
    generic_config = GenericConfig.objects.get(in_use=True)
    print(generic_config)
    return render(request, 'index.html', {'posts': posts, 'generic_config': generic_config})


def post(request, pk):
    """Display specific blog posts"""
    
    generic_config = GenericConfig.objects.get(in_use=True)
    post_detail = get_object_or_404(BlogPost, pk=pk)

    return render(request, 'post.html', {'post_detail': post_detail, 'generic_config': generic_config})