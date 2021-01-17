from . import views
from django.urls import path, include
from django.conf.urls.static import static
from django.conf import settings

urlpatterns = [
    path('', views.blog_posts, name='home'),
    # path('<slug:slug>/', views.PostDetail.as_view(), name='post_detail'),
    path('blog/<int:pk>/', views.post, name='post_detail'),
    path('newblog/', views.blog_posts, name='blog'),
    path('markdownx/', include('markdownx.urls')),
] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)