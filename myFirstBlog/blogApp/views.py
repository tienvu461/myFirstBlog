from django.shortcuts import render
from django.views import generic
from django.shortcuts import get_object_or_404
from .models import Post

from .models import BlogPost

def blog_posts(request):
    """Display all blog posts"""
    print("blog_post")
    print(request)
    posts = BlogPost.objects.all().order_by('-created_date')
    print("posts={}".format(posts))
    return render(request, 'blog.html', {'posts': posts})


def post(request, pk):
    """Display specific blog posts"""

    post_detail = get_object_or_404(BlogPost, pk=pk)

    return render(request, 'post.html', {'post_detail': post_detail})