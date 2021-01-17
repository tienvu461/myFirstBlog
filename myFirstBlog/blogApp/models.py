from django.db import models
from django.contrib.auth.models import User
from django.utils import timezone
from markdownx.models import MarkdownxField
from markdownx.utils import markdownify
from datetime import datetime

STATUS = (
    (0, "Draft"),
    (1, "Publish")
)


class Post(models.Model):
    title = models.CharField(max_length=200, unique=True)
    slug = models.SlugField(max_length=200, unique=True)
    author = models.ForeignKey(
        User, on_delete=models.CASCADE, related_name='blog_posts')
    updated_on = models.DateTimeField(auto_now=True)
    content = models.TextField()
    created_on = models.DateTimeField(auto_now_add=True)
    status = models.IntegerField(choices=STATUS, default=0)

    class Meta:
        ordering = ['-created_on']

    def __str__(self):
        return self.title


class DateCreateModMixin(models.Model):
    class Meta:
        abstract = True

    created_date = models.DateTimeField(default=timezone.now)
    mod_date = models.DateTimeField(blank=True, null=True)

class BlogPost(DateCreateModMixin):
    title = models.CharField(max_length=50)
    body = MarkdownxField()
    background_image = models.ImageField(default='img/header.jpg', upload_to=datetime.now().strftime('backgrounds/%Y/%m/%d'))

    def formatted_markdown(self):
        return markdownify(self.body)

    def body_summary(self):
        return markdownify(self.body[:300] + "...")

# Note: background_image is just for my header background, not MarkdownX
