from . import views
from django.urls import path, include
from django.conf.urls.static import static
from django.conf import settings

urlpatterns = [
    path('', views.home, name='home'),
    # path('<slug:slug>/', views.PostDetail.as_view(), name='post_detail'),
    path('post/<int:pk>/', views.post, name='post_detail'),
    path('markdownx/', include('markdownx.urls')),
] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
