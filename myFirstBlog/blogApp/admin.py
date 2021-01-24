from django.contrib import admin
from django.db import models

from .models import BlogPost, GenericConfig, UploadedImage

from markdownx.admin import MarkdownxModelAdmin

# class PostAdmin(admin.ModelAdmin):
#     list_display = ('title', 'slug', 'status', 'created_on')
#     list_filter = ("status",)
#     search_fields = ['title', 'content']
#     prepopulated_fields = {'slug': ('title',)}


# admin.site.register(Post, PostAdmin)

@admin.register(GenericConfig)
class GenericConfigAdmin(admin.ModelAdmin):
    list_display = ('config_name', 'blog_name', 'in_use')

class ImageInline(admin.TabularInline):
    model = UploadedImage
    extra = 3

@admin.register(BlogPost)
class BlogPostAdmin(MarkdownxModelAdmin):
    list_display = ('title',  "status", 'created_date', 'mod_date',)
    list_filter = ('created_date', 'mod_date', "status",)
    search_fields = ('title',)
    prepopulated_fields = {'slug': ('title',)}

    inlines = [ ImageInline, ]
