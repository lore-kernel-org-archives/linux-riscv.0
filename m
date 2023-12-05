Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE1FC4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 11:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SA7xDrTdRptCS6N1TclWImkfbLwIK3sJS1i6htJCkRA=; b=eA9n8OFyvKdTOo
	EgAwMJX9QqMFFk9FdWaCHbAUCrgWy0qn9PJwJjBPU2DzILimP2EBuxcKyTqTjxKOTtUt9v6wQ8kWq
	Glc+xTpu4O7Q1UTvpeW0jwmHdk2Vpnu1Md1LUuskbdShnTrRgUYDLR6p1wV8xRRP6zSly+5EMRAEZ
	sqdPAxgJ7ciAHMQ0DKKQKZv3WNO6YpMgon0NCs/DURBpvuBaYThIu1fH6XK1PKJHqkc9yJJtmP4VK
	G+cxltJJh7dhFjyIGNGb/YLeR36ZBZuMgrYruhYMvU94T8H3sV0KSj8fP/leX/B8T6KC+dQPa6a6d
	iTY03sASQ1lvUtOwnNlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rATgh-0078fu-1a;
	Tue, 05 Dec 2023 11:34:03 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rATgd-0078fH-30
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 11:34:02 +0000
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-dae7cc31151so3893823276.3
        for <linux-riscv@lists.infradead.org>; Tue, 05 Dec 2023 03:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701776036; x=1702380836; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZhsRabMwHLdT/83BOzk87yIZ/nT96lpL8CbTHmgEiXY=;
        b=TQuWJQJ0s6X0IUObgLRiB/FClhITv/GNraoPyZbb9c7CEhpB3RZoWoKHSfW79UP4Rq
         VrpsjlWnUIcQw4ARX85fzt5GVdJyGEy4fxrF5v39CqVoBkc70nf4Oc1RCPSKX8kRSsAb
         fjm1p506xgy17U/d8UaxydQrTfRjkDmL0x1DRG9HFZWYRcLtQJxwVMEnhtHXcUFohdQM
         FmKahvaOiMVLj2GcuRKsw2ici+W/HTVdkNOLy2R1cOKhRQDpzU3MrI20w0puLfJEeYpF
         //hS7gyPdxeyXInt5CXBh2lQVFbbWZ1DTUIVmzHAEAizHDBHcoT0qu3NVqa/+KNpJ9Nw
         s8yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701776036; x=1702380836;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZhsRabMwHLdT/83BOzk87yIZ/nT96lpL8CbTHmgEiXY=;
        b=wZfcoA8vz+8oRYlNNitidFPmcdYQAupcyD8ot7o0qwJQ/Jyw5sToxK/Uc6/uoeSJ1j
         5BzLJtjzVYat691STbRljlifm+4IkpIcsPdoXd9wlwRBi51tFKc4D9x/idgWyqpjEeaG
         M5cdRJbB6XccMhtFWO9itH8Ydwz2zKQZUrVF90GLFZJNuH7qDtLNp/VC7UiMQFGmidEc
         8KGRyIa1e9QlHqigz+jFF9IXdPmfN+Ofs2mgSaQ6q225+Gi2KMtrASTyrlXa4MqYn+QS
         5P6QpWlSwYV54JmK24oKzadgpRShOzaB7JlMSBYYnKiK65599gOPoJ3UfLBAOxexxqSa
         Welw==
X-Gm-Message-State: AOJu0Yy+9OUoSPhFLzqJvcsw2L8q9RSc3H9so8EhN0wydi7cAOFMiWA4
	PkofFmZXuV2b/m988nLQgdlAB7hW3lcbeqq3Se9wng==
X-Google-Smtp-Source: AGHT+IEYX0mlAXrPoEqnAG4It1U3rjYFagPejC1cjhV8FDSQilebuKlVLTmrSJdwmk4gdJOPTf5nWSvplQ0sZq7CrmE=
X-Received: by 2002:a25:ccd5:0:b0:db7:dacf:6ff4 with SMTP id
 l204-20020a25ccd5000000b00db7dacf6ff4mr4673468ybf.124.1701776036477; Tue, 05
 Dec 2023 03:33:56 -0800 (PST)
MIME-Version: 1.0
References: <20231204123315.28456-1-keith.zhao@starfivetech.com> <20231204123315.28456-4-keith.zhao@starfivetech.com>
In-Reply-To: <20231204123315.28456-4-keith.zhao@starfivetech.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 5 Dec 2023 13:33:45 +0200
Message-ID: <CAA8EJpr784=-W9SuM6XH3++G1UXP2acnfRJoBktmx61_NMsZ0w@mail.gmail.com>
Subject: Re: [v3 3/6] drm/vs: Register DRM device
To: Keith Zhao <keith.zhao@starfivetech.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	aou@eecs.berkeley.edu, suijingfeng@loongson.cn, tzimmermann@suse.de, 
	paul.walmsley@sifive.com, mripard@kernel.org, xingyu.wu@starfivetech.com, 
	jack.zhu@starfivetech.com, palmer@dabbelt.com, 
	krzysztof.kozlowski+dt@linaro.org, william.qiu@starfivetech.com, 
	shengyang.chen@starfivetech.com, changhuang.liang@starfivetech.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_033359_981645_698A3B9E 
X-CRM114-Status: GOOD (  33.68  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 4 Dec 2023 at 14:33, Keith Zhao <keith.zhao@starfivetech.com> wrote:
>
> Implement drm device registration interface
>
> Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
> ---
>  MAINTAINERS                              |   1 +
>  drivers/gpu/drm/Kconfig                  |   2 +
>  drivers/gpu/drm/Makefile                 |   1 +
>  drivers/gpu/drm/verisilicon/Kconfig      |  13 +
>  drivers/gpu/drm/verisilicon/Makefile     |   6 +
>  drivers/gpu/drm/verisilicon/vs_drv.c     | 316 +++++++++++++++++++++++
>  drivers/gpu/drm/verisilicon/vs_drv.h     |  42 +++
>  drivers/gpu/drm/verisilicon/vs_modeset.c |  39 +++
>  drivers/gpu/drm/verisilicon/vs_modeset.h |  10 +
>  9 files changed, 430 insertions(+)
>  create mode 100644 drivers/gpu/drm/verisilicon/Kconfig
>  create mode 100644 drivers/gpu/drm/verisilicon/Makefile
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_drv.c
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_drv.h
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_modeset.c
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_modeset.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7caaadb83f3f..8dc9ebfe4605 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6887,6 +6887,7 @@ L:        dri-devel@lists.freedesktop.org
>  S:     Maintained
>  T:     git git://anongit.freedesktop.org/drm/drm-misc
>  F:     Documentation/devicetree/bindings/display/starfive/
> +F:     drivers/gpu/drm/verisilicon/
>
>  DRM DRIVER FOR TI DLPC3433 MIPI DSI TO DMD BRIDGE
>  M:     Jagan Teki <jagan@amarulasolutions.com>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 3eee8636f847..e8d53c2e7c86 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -394,6 +394,8 @@ source "drivers/gpu/drm/solomon/Kconfig"
>
>  source "drivers/gpu/drm/sprd/Kconfig"
>
> +source "drivers/gpu/drm/verisilicon/Kconfig"
> +
>  config DRM_HYPERV
>         tristate "DRM Support for Hyper-V synthetic video device"
>         depends on DRM && PCI && MMU && HYPERV
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 8e1bde059170..29e04acded06 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -198,3 +198,4 @@ obj-$(CONFIG_DRM_HYPERV) += hyperv/
>  obj-y                  += solomon/
>  obj-$(CONFIG_DRM_SPRD) += sprd/
>  obj-$(CONFIG_DRM_LOONGSON) += loongson/
> +obj-$(CONFIG_DRM_VERISILICON) += verisilicon/
> diff --git a/drivers/gpu/drm/verisilicon/Kconfig b/drivers/gpu/drm/verisilicon/Kconfig
> new file mode 100644
> index 000000000000..e10fa97635aa
> --- /dev/null
> +++ b/drivers/gpu/drm/verisilicon/Kconfig
> @@ -0,0 +1,13 @@
> +# SPDX-License-Identifier: GPL-2.0
> +config DRM_VERISILICON
> +       tristate "DRM Support for VeriSilicon"
> +       depends on DRM
> +       select DRM_KMS_HELPER
> +       select DRM_GEM_DMA_HELPER
> +       select CMA
> +       select DMA_CMA
> +       help
> +         Choose this option if you have a VeriSilicon soc chipset.
> +         This driver provides VeriSilicon kernel mode
> +         setting and buffer management. It does not
> +         provide 2D or 3D acceleration.
> diff --git a/drivers/gpu/drm/verisilicon/Makefile b/drivers/gpu/drm/verisilicon/Makefile
> new file mode 100644
> index 000000000000..d785a1dfaa7f
> --- /dev/null
> +++ b/drivers/gpu/drm/verisilicon/Makefile
> @@ -0,0 +1,6 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +vs_drm-objs := vs_drv.o \
> +              vs_modeset.o
> +
> +obj-$(CONFIG_DRM_VERISILICON) += vs_drm.o
> diff --git a/drivers/gpu/drm/verisilicon/vs_drv.c b/drivers/gpu/drm/verisilicon/vs_drv.c
> new file mode 100644
> index 000000000000..4fb1f29ef84b
> --- /dev/null
> +++ b/drivers/gpu/drm/verisilicon/vs_drv.c
> @@ -0,0 +1,316 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
> + */
> +#include <linux/clk.h>
> +#include <linux/component.h>
> +#include <linux/of_clk.h>
> +#include <linux/pm_runtime.h>
> +
> +#include <drm/drm_aperture.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_fb_helper.h>
> +#include <drm/drm_fbdev_generic.h>
> +#include <drm/drm_file.h>
> +#include <drm/drm_gem_dma_helper.h>
> +#include <drm/drm_module.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_vblank.h>
> +
> +#include "vs_drv.h"
> +#include "vs_modeset.h"
> +
> +#define DRV_NAME       "verisilicon"
> +#define DRV_DESC       "Verisilicon DRM driver"
> +#define DRV_DATE       "20230516"
> +#define DRV_MAJOR      1
> +#define DRV_MINOR      0
> +
> +static int vs_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
> +                             struct drm_mode_create_dumb *args)
> +{
> +       struct vs_drm_device *priv = to_vs_drm_private(dev);
> +       unsigned int pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
> +
> +       args->pitch = ALIGN(pitch, priv->pitch_alignment);
> +       return drm_gem_dma_dumb_create_internal(file, dev, args);
> +}
> +
> +DEFINE_DRM_GEM_FOPS(vs_drm_fops);
> +
> +static struct drm_driver vs_drm_driver = {
> +       .driver_features        = DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_GEM,
> +
> +       DRM_GEM_DMA_DRIVER_OPS_WITH_DUMB_CREATE(vs_gem_dumb_create),
> +
> +       .fops                   = &vs_drm_fops,
> +       .name                   = DRV_NAME,
> +       .desc                   = DRV_DESC,
> +       .date                   = DRV_DATE,
> +       .major                  = DRV_MAJOR,
> +       .minor                  = DRV_MINOR,
> +};
> +
> +static void vs_drm_device_release_clocks(void *res)
> +{
> +       struct vs_drm_device *priv = res;
> +       unsigned int i;
> +
> +       reset_control_bulk_assert(priv->nrsts, priv->rst_vout);
> +
> +       for (i = 0; i < priv->clk_count; ++i) {
> +               if (priv->clks[i]) {
> +                       clk_disable_unprepare(priv->clks[i]);
> +                       clk_put(priv->clks[i]);
> +               }
> +       }
> +}
> +
> +static const char * const vout_resets[] = {
> +       "axi",
> +       "ahb",
> +       "core",
> +};
> +
> +static int vs_drm_device_init_clocks(struct vs_drm_device *priv)
> +{
> +       struct drm_device *dev = &priv->base;
> +       struct platform_device *pdev = to_platform_device(dev->dev);
> +       struct device_node *of_node = pdev->dev.of_node;
> +       struct clk *clock;
> +       unsigned int i;
> +       int ret;
> +
> +       if (dev_get_platdata(&pdev->dev) || !of_node)
> +               return 0;

Drop dev_get_platdata(), you don't seem to use it.

> +
> +       priv->nrsts = ARRAY_SIZE(priv->rst_vout);
> +       for (int i = 0; i < priv->nrsts; ++i)
> +               priv->rst_vout[i].id = vout_resets[i];
> +       ret = devm_reset_control_bulk_get_shared(dev->dev, priv->nrsts,
> +                                                priv->rst_vout);
> +       if (ret) {
> +               drm_err(dev, "Failed to get reset controls\n");
> +               return ret;
> +       }
> +
> +       priv->clk_count = of_clk_get_parent_count(of_node);
> +       if (!priv->clk_count)
> +               return 0;
> +
> +       priv->clks = drmm_kzalloc(dev, priv->clk_count * sizeof(priv->clks[0]),
> +                                 GFP_KERNEL);
> +       if (!priv->clks)
> +               return -ENOMEM;
> +
> +       for (i = 0; i < priv->clk_count; ++i) {
> +               clock = of_clk_get(of_node, i);
> +               if (IS_ERR(clock)) {
> +                       ret = PTR_ERR(clock);
> +                       if (ret == -EPROBE_DEFER)
> +                               goto err;
> +                       drm_err(dev, "clock %u not found: %d\n", i, ret);
> +                       continue;
> +               }
> +               ret = clk_prepare_enable(clock);
> +               if (ret) {
> +                       drm_err(dev, "failed to enable clock %u: %d\n",
> +                               i, ret);
> +                       clk_put(clock);
> +                       continue;
> +               }
> +               priv->clks[i] = clock;
> +       }

This can be rewritten as devm_clk_bulk_get_all()

> +
> +       ret = reset_control_bulk_deassert(priv->nrsts, priv->rst_vout);
> +       if (ret)
> +               return ret;

It is a bad idea to mix get_resources kind of function with the actual
resource control. Please move reset deassertion upwards.

> +
> +       return devm_add_action_or_reset(&pdev->dev,
> +                                       vs_drm_device_release_clocks,
> +                                       priv);
> +
> +err:
> +       while (i) {
> +               --i;
> +               if (priv->clks[i]) {
> +                       clk_disable_unprepare(priv->clks[i]);
> +                       clk_put(priv->clks[i]);
> +               }
> +       }
> +       return ret;
> +}
> +
> +static int vs_drm_bind(struct device *dev)
> +{
> +       struct platform_device *pdev = to_platform_device(dev);
> +       struct vs_drm_device *priv;
> +       int ret;
> +       struct drm_device *drm_dev;
> +
> +       /* Remove existing drivers that may own the framebuffer memory. */
> +       ret = drm_aperture_remove_framebuffers(&vs_drm_driver);
> +       if (ret)
> +               return ret;

If anything happens during the probe, your platform is left with no
display output. I think it might be better to call this when the
driver has acquired all the resources and is ready to start hw init.

> +
> +       priv = devm_drm_dev_alloc(dev, &vs_drm_driver, struct vs_drm_device, base);
> +       if (IS_ERR(priv))
> +               return PTR_ERR(priv);
> +
> +       priv->pitch_alignment = 64;
> +
> +       ret = dma_set_coherent_mask(priv->base.dev, DMA_BIT_MASK(40));
> +       if (ret)
> +               return ret;
> +
> +       drm_dev = &priv->base;
> +       platform_set_drvdata(pdev, drm_dev);
> +
> +       ret = vs_drm_device_init_clocks(priv);
> +       if (ret)
> +               return ret;
> +
> +       vs_mode_config_init(drm_dev);
> +
> +       /* Now try and bind all our sub-components */
> +       ret = component_bind_all(dev, drm_dev);
> +       if (ret)
> +               return ret;
> +
> +       ret = drm_vblank_init(drm_dev, drm_dev->mode_config.num_crtc);
> +       if (ret)
> +               return ret;
> +
> +       drm_mode_config_reset(drm_dev);
> +
> +       drm_kms_helper_poll_init(drm_dev);
> +
> +       ret = drm_dev_register(drm_dev, 0);
> +       if (ret)
> +               return ret;

Teardown path is missing.

> +
> +       drm_fbdev_generic_setup(drm_dev, 32);
> +
> +       return 0;
> +}
> +
> +static void vs_drm_unbind(struct device *dev)
> +{
> +       struct drm_device *drm_dev = dev_get_drvdata(dev);
> +
> +       drm_dev_unregister(drm_dev);
> +       drm_kms_helper_poll_fini(drm_dev);
> +       component_unbind_all(drm_dev->dev, drm_dev);
> +}
> +
> +static const struct component_master_ops vs_drm_ops = {
> +       .bind = vs_drm_bind,
> +       .unbind = vs_drm_unbind,
> +};
> +
> +static struct platform_driver *drm_sub_drivers[] = {
> +};
> +
> +static struct component_match *vs_drm_match_add(struct device *dev)
> +{
> +       struct component_match *match = NULL;
> +       int i;
> +
> +       for (i = 0; i < ARRAY_SIZE(drm_sub_drivers); ++i) {
> +               struct platform_driver *drv = drm_sub_drivers[i];
> +               struct device *p = NULL, *d;
> +
> +               while ((d = platform_find_device_by_driver(p, &drv->driver))) {
> +                       put_device(p);
> +
> +                       drm_of_component_match_add(dev, &match, component_compare_of,
> +                                                  d->of_node);
> +                       p = d;
> +               }
> +               put_device(p);
> +       }
> +
> +       return match ? match : ERR_PTR(-ENODEV);
> +}
> +
> +static int vs_drm_platform_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct component_match *match;
> +
> +       match = vs_drm_match_add(dev);
> +       if (IS_ERR(match))
> +               return PTR_ERR(match);
> +
> +       return component_master_add_with_match(dev, &vs_drm_ops, match);

I wonder if you can use drm_of_component_probe() instead?

> +}
> +
> +static int vs_drm_platform_remove(struct platform_device *pdev)

I think this should be void vs_drm_platform_remove() and .remove_new

> +{
> +       component_master_del(&pdev->dev, &vs_drm_ops);
> +       return 0;
> +}
> +
> +#ifdef CONFIG_PM_SLEEP
> +static int vs_drm_suspend(struct device *dev)
> +{
> +       return drm_mode_config_helper_suspend(dev_get_drvdata(dev));
> +}
> +
> +static int vs_drm_resume(struct device *dev)
> +{
> +       drm_mode_config_helper_resume(dev_get_drvdata(dev));

return drm_mode_config_helper_resume()

> +
> +       return 0;
> +}
> +#endif
> +
> +static SIMPLE_DEV_PM_OPS(vs_drm_pm_ops, vs_drm_suspend, vs_drm_resume);
> +
> +static const struct of_device_id vs_drm_dt_ids[] = {
> +       { .compatible = "starfive,display-subsystem", },
> +       { },
> +};
> +
> +MODULE_DEVICE_TABLE(of, vs_drm_dt_ids);
> +
> +static struct platform_driver vs_drm_platform_driver = {
> +       .probe = vs_drm_platform_probe,
> +       .remove = vs_drm_platform_remove,
> +
> +       .driver = {
> +               .name = DRV_NAME,
> +               .of_match_table = vs_drm_dt_ids,
> +               .pm = &vs_drm_pm_ops,
> +       },
> +};
> +
> +static int __init vs_drm_init(void)
> +{
> +       int ret;
> +
> +       ret = platform_register_drivers(drm_sub_drivers, ARRAY_SIZE(drm_sub_drivers));
> +       if (ret)
> +               return ret;
> +
> +       ret = drm_platform_driver_register(&vs_drm_platform_driver);
> +       if (ret)
> +               platform_unregister_drivers(drm_sub_drivers, ARRAY_SIZE(drm_sub_drivers));
> +
> +       return ret;
> +}
> +
> +static void __exit vs_drm_fini(void)
> +{
> +       platform_driver_unregister(&vs_drm_platform_driver);
> +       platform_unregister_drivers(drm_sub_drivers, ARRAY_SIZE(drm_sub_drivers));
> +}
> +
> +late_initcall_sync(vs_drm_init);
> +module_exit(vs_drm_fini);
> +
> +MODULE_DESCRIPTION("VeriSilicon DRM Driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/gpu/drm/verisilicon/vs_drv.h b/drivers/gpu/drm/verisilicon/vs_drv.h
> new file mode 100644
> index 000000000000..ea2189772980
> --- /dev/null
> +++ b/drivers/gpu/drm/verisilicon/vs_drv.h
> @@ -0,0 +1,42 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
> + */
> +
> +#ifndef __VS_DRV_H__
> +#define __VS_DRV_H__
> +
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_gem.h>
> +#include <drm/drm_managed.h>
> +#include <linux/clk.h>
> +#include <linux/reset.h>
> +
> +enum rst_vout {
> +       RST_VOUT_AXI = 0,
> +       RST_VOUT_AHB,
> +       RST_VOUT_CORE,
> +       RST_VOUT_NUM
> +};

Do you need these values? They can easily get out of sync with vout_rsts.

> +
> +/*@pitch_alignment: buffer pitch alignment required by sub-devices.*/
> +struct vs_drm_device {
> +       struct drm_device base;
> +       unsigned int pitch_alignment;
> +       /* clocks */
> +       unsigned int clk_count;
> +       struct clk **clks;
> +
> +       struct reset_control_bulk_data rst_vout[RST_VOUT_NUM];
> +       int     nrsts;
> +};
> +
> +static inline struct vs_drm_device *
> +to_vs_drm_private(const struct drm_device *dev)
> +{
> +       return container_of(dev, struct vs_drm_device, base);
> +}
> +
> +#endif /* __VS_DRV_H__ */
> diff --git a/drivers/gpu/drm/verisilicon/vs_modeset.c b/drivers/gpu/drm/verisilicon/vs_modeset.c
> new file mode 100644
> index 000000000000..eaf406c1b7c7
> --- /dev/null
> +++ b/drivers/gpu/drm/verisilicon/vs_modeset.c
> @@ -0,0 +1,39 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
> + */
> +
> +#include <linux/module.h>
> +
> +#include <drm/drm_damage_helper.h>
> +#include <drm/drm_fb_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +
> +#include "vs_modeset.h"
> +
> +static const struct drm_mode_config_funcs vs_mode_config_funcs = {
> +       .fb_create                       = drm_gem_fb_create,
> +       .atomic_check            = drm_atomic_helper_check,
> +       .atomic_commit           = drm_atomic_helper_commit,
> +};
> +
> +static struct drm_mode_config_helper_funcs vs_mode_config_helpers = {
> +       .atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
> +};
> +
> +void vs_mode_config_init(struct drm_device *dev)
> +{
> +       int ret;
> +
> +       ret = drmm_mode_config_init(dev);
> +       if (ret)
> +               return;
> +
> +       dev->mode_config.min_width  = 0;
> +       dev->mode_config.min_height = 0;
> +       dev->mode_config.max_width  = 4096;
> +       dev->mode_config.max_height = 4096;
> +
> +       dev->mode_config.funcs = &vs_mode_config_funcs;
> +       dev->mode_config.helper_private = &vs_mode_config_helpers;
> +}
> diff --git a/drivers/gpu/drm/verisilicon/vs_modeset.h b/drivers/gpu/drm/verisilicon/vs_modeset.h
> new file mode 100644
> index 000000000000..bd04f81d2ad2
> --- /dev/null
> +++ b/drivers/gpu/drm/verisilicon/vs_modeset.h
> @@ -0,0 +1,10 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2020 VeriSilicon Holdings Co., Ltd.
> + */
> +
> +#ifndef __VS_MODESET_H__
> +#define __VS_MODESET_H__
> +
> +void vs_mode_config_init(struct drm_device *dev);
> +#endif /* __VS_FB_H__ */
> --
> 2.34.1
>


-- 
With best wishes
Dmitry

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
