from django.views.generic.base import TemplateView


class Index(TemplateView):
    template_name = 'index.html'

    def get_context_data(self, **context):
        context['message'] = 'Welcome'
        return context
