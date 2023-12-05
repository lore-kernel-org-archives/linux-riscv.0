Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5244CC4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 13:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m2Ls+7jInRgphwD6hqvfwAAZY8NLWEugBA1UhlYoGPg=; b=nrEdqa5+SEYXge
	07PH1P0YmxrnFKFAEShFoWgUxT7j5nG2Hc0v3nEtNVeVA/tum4JtlY+Vs7jgBXh4Dd/lCXBW834A1
	8KrRfa8+SZrK6m8ZyjLUH9cMr/kdf1MQuChBvHd86IT7TgeXmJ3O1JgqybJods1K4ca4PSjAJwpk2
	OS4AieQBFSLbQJMbbItTPJeHyJSEKFoLuj9rhJsRRDh34KVb6E9zBFRe1FeGaneyzTgw0/a/LcjcI
	to2IshXbCojkRfCuKvs8NIYrL49QwEHuruNPdI82ZXXA6jA8DEa7qvZGxzTCEaz6Pwmt2qQJlUauF
	iODdQEqQzbS8UGL/36aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAVG0-007Tjx-1O;
	Tue, 05 Dec 2023 13:14:36 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAVFx-007Thr-1c
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 13:14:35 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-5d8e816f77eso20031917b3.0
        for <linux-riscv@lists.infradead.org>; Tue, 05 Dec 2023 05:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701782069; x=1702386869; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RP6DoGJILfqmy1XRBZpJUGL68RBYKtscZDmXA9WTIyQ=;
        b=Po5sjL1OQe1t0+Bdre8QjdUtykKqH4Rh2YspnvsYDK5NUg7/5LOIvbYoe3es6CdWOK
         7mwQitao+EcfrjYF81P94m24AX9/HYvEnOfOLjxq8aXnDxHxrRh7j73ZVtYqAHZGaFwE
         CW0/OKXIQo68i5xnYYUse4yQmVBZH6lPat1XvDjbXMsO5fx4zaUnNgPsIh8Bogw/x0iJ
         Swa7sOjd8wXq9GanUioxs1m8721RjjNB3Bgy3VVbYbtlC4wxXobnC51oa1dNKjTIf4MM
         SiZ8lSas8m4NM3/1cY9Gl2MSYA5+NrrF8FzpTFhbBDzmmEqYC9GBIL41HwcrYuahZt+N
         SKsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701782069; x=1702386869;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RP6DoGJILfqmy1XRBZpJUGL68RBYKtscZDmXA9WTIyQ=;
        b=Gx09PCiPUEmX//h0XKskQzMeS6nPerM8pK8VhON1wI3Sro9jxe7bsm3kptD7tFqFN6
         jUUKT82R4reEZw3Te5bBjUFvrNDbCCiCmkbH4MjP5ziJvhKwm1kfLl1PE77AP3yA+vV4
         C0UcrbG68ol9IJuMhmoCgBX1Blx+aQe3YDfHJ+04LnuXjmWCSDm/etj4FIQkpFrPJdLm
         l5M+TgOzM5Sin1K7+GIHZLGTTTpXRYY4Knf5zMbFGot4DKPLHfG+e7KKmHvh3HQX7TUF
         bHv1ruAYO/eWLMsvLOWSkwLb2WCtPcC9yok5gOYdypZ3np39K7wJiUPGOoA9B2MuGwhj
         lJbA==
X-Gm-Message-State: AOJu0YzX5+VJbseNJZzwvykqXA0wC44FyqzRZ8QCTz5VbOGaZjRAbo+m
	oecgt4L+VN0c3qibk37URWvVh7stR5ehOmjMwIj8Tg==
X-Google-Smtp-Source: AGHT+IHbSJqNsFEXveuMibmZBNRZsuf+9DC72phNshumYLwBucPL5ttq33PeU+/+iNM375ASYoUA54K2ADr/+cMlMyI=
X-Received: by 2002:a81:f011:0:b0:5d7:1940:b39d with SMTP id
 p17-20020a81f011000000b005d71940b39dmr4692636ywm.105.1701782069416; Tue, 05
 Dec 2023 05:14:29 -0800 (PST)
MIME-Version: 1.0
References: <20231204123315.28456-1-keith.zhao@starfivetech.com> <20231204123315.28456-7-keith.zhao@starfivetech.com>
In-Reply-To: <20231204123315.28456-7-keith.zhao@starfivetech.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 5 Dec 2023 15:14:18 +0200
Message-ID: <CAA8EJpqbQKjTeEdOpwNy7P+dJK-nnZzZYefyzoG+JWKVgsS=rw@mail.gmail.com>
Subject: Re: [v3 6/6] drm/vs: simple encoder
To: Keith Zhao <keith.zhao@starfivetech.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	aou@eecs.berkeley.edu, suijingfeng@loongson.cn, tzimmermann@suse.de, 
	paul.walmsley@sifive.com, mripard@kernel.org, xingyu.wu@starfivetech.com, 
	jack.zhu@starfivetech.com, palmer@dabbelt.com, 
	krzysztof.kozlowski+dt@linaro.org, william.qiu@starfivetech.com, 
	shengyang.chen@starfivetech.com, changhuang.liang@starfivetech.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_051433_544732_F82419E0 
X-CRM114-Status: GOOD (  27.54  )
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
> add simple encoder for dsi bridge

This doesn't look like a proper commit message.

>
> Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
> ---
>  drivers/gpu/drm/verisilicon/Makefile        |   4 +-
>  drivers/gpu/drm/verisilicon/vs_drv.c        |   2 +
>  drivers/gpu/drm/verisilicon/vs_simple_enc.c | 195 ++++++++++++++++++++
>  drivers/gpu/drm/verisilicon/vs_simple_enc.h |  23 +++
>  4 files changed, 223 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_simple_enc.c
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_simple_enc.h
>
> diff --git a/drivers/gpu/drm/verisilicon/Makefile b/drivers/gpu/drm/verisilicon/Makefile
> index 71fadafcee13..cd5d0a90bcfe 100644
> --- a/drivers/gpu/drm/verisilicon/Makefile
> +++ b/drivers/gpu/drm/verisilicon/Makefile
> @@ -5,6 +5,8 @@ vs_drm-objs := vs_dc_hw.o \
>                 vs_crtc.o \
>                 vs_drv.o \
>                 vs_modeset.o \
> -               vs_plane.o
> +               vs_plane.o \
> +               vs_simple_enc.o
> +
>  vs_drm-$(CONFIG_DRM_VERISILICON_STARFIVE_HDMI) += starfive_hdmi.o
>  obj-$(CONFIG_DRM_VERISILICON) += vs_drm.o
> diff --git a/drivers/gpu/drm/verisilicon/vs_drv.c b/drivers/gpu/drm/verisilicon/vs_drv.c
> index d7e5199fe293..946f137ab124 100644
> --- a/drivers/gpu/drm/verisilicon/vs_drv.c
> +++ b/drivers/gpu/drm/verisilicon/vs_drv.c
> @@ -23,6 +23,7 @@
>  #include "vs_drv.h"
>  #include "vs_modeset.h"
>  #include "vs_dc.h"
> +#include "vs_simple_enc.h"
>
>  #define DRV_NAME       "verisilicon"
>  #define DRV_DESC       "Verisilicon DRM driver"
> @@ -217,6 +218,7 @@ static struct platform_driver *drm_sub_drivers[] = {
>  #ifdef CONFIG_DRM_VERISILICON_STARFIVE_HDMI
>         &starfive_hdmi_driver,
>  #endif
> +       &simple_encoder_driver,
>  };
>
>  static struct component_match *vs_drm_match_add(struct device *dev)
> diff --git a/drivers/gpu/drm/verisilicon/vs_simple_enc.c b/drivers/gpu/drm/verisilicon/vs_simple_enc.c
> new file mode 100644
> index 000000000000..c5a8d82bc469
> --- /dev/null
> +++ b/drivers/gpu/drm/verisilicon/vs_simple_enc.c
> @@ -0,0 +1,195 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2020 VeriSilicon Holdings Co., Ltd.
> + */
> +#include <linux/component.h>
> +#include <linux/of_device.h>
> +#include <linux/module.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_of.h>
> +#include <linux/regmap.h>
> +#include <linux/media-bus-format.h>
> +#include <linux/mfd/syscon.h>
> +
> +#include "vs_crtc.h"
> +#include "vs_simple_enc.h"
> +
> +static const struct simple_encoder_priv dsi_priv = {

Please use proper prefix for all the struct and function names.
vs_simple_encoder sounds better. Or vs_dsi_encoder.

> +       .encoder_type = DRM_MODE_ENCODER_DSI
> +};
> +
> +static inline struct simple_encoder *to_simple_encoder(struct drm_encoder *enc)
> +{
> +       return container_of(enc, struct simple_encoder, encoder);
> +}
> +
> +static int encoder_parse_dt(struct device *dev)
> +{
> +       struct simple_encoder *simple = dev_get_drvdata(dev);
> +       unsigned int args[2];
> +
> +       simple->dss_regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node,
> +                                                                 "starfive,syscon",
> +                                                                 2, args);
> +
> +       if (IS_ERR(simple->dss_regmap)) {
> +               return dev_err_probe(dev, PTR_ERR(simple->dss_regmap),
> +                                    "getting the regmap failed\n");
> +       }
> +
> +       simple->offset = args[0];
> +       simple->mask = args[1];
> +
> +       return 0;
> +}
> +
> +void encoder_atomic_enable(struct drm_encoder *encoder,
> +                          struct drm_atomic_state *state)
> +{
> +       struct simple_encoder *simple = to_simple_encoder(encoder);
> +
> +       regmap_update_bits(simple->dss_regmap, simple->offset, simple->mask,
> +                          simple->mask);
> +}
> +
> +int encoder_atomic_check(struct drm_encoder *encoder,
> +                        struct drm_crtc_state *crtc_state,
> +                        struct drm_connector_state *conn_state)
> +{
> +       struct vs_crtc_state *vs_crtc_state = to_vs_crtc_state(crtc_state);
> +       struct drm_connector *connector = conn_state->connector;
> +       int ret = 0;
> +
> +       struct drm_bridge *first_bridge = drm_bridge_chain_get_first_bridge(encoder);
> +       struct drm_bridge_state *bridge_state = ERR_PTR(-EINVAL);
> +
> +       vs_crtc_state->encoder_type = encoder->encoder_type;
> +
> +       if (first_bridge && first_bridge->funcs->atomic_duplicate_state)
> +               bridge_state = drm_atomic_get_bridge_state(crtc_state->state, first_bridge);

Please don't poke into others' playground. This should go into your
DSI bridge's atomic_check() instead.

> +
> +       if (IS_ERR(bridge_state)) {
> +               if (connector->display_info.num_bus_formats)
> +                       vs_crtc_state->output_fmt = connector->display_info.bus_formats[0];
> +               else
> +                       vs_crtc_state->output_fmt = MEDIA_BUS_FMT_FIXED;
> +       } else {
> +               vs_crtc_state->output_fmt = bridge_state->input_bus_cfg.format;
> +       }
> +
> +       switch (vs_crtc_state->output_fmt) {
> +       case MEDIA_BUS_FMT_FIXED:
> +       case MEDIA_BUS_FMT_RGB565_1X16:
> +       case MEDIA_BUS_FMT_RGB666_1X18:
> +       case MEDIA_BUS_FMT_RGB888_1X24:
> +       case MEDIA_BUS_FMT_RGB666_1X24_CPADHI:
> +       case MEDIA_BUS_FMT_RGB101010_1X30:
> +       case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
> +       case MEDIA_BUS_FMT_UYVY8_1X16:
> +       case MEDIA_BUS_FMT_YUV8_1X24:
> +       case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
> +       case MEDIA_BUS_FMT_UYVY10_1X20:
> +       case MEDIA_BUS_FMT_YUV10_1X30:
> +               ret = 0;
> +               break;
> +       default:
> +               ret = -EINVAL;
> +               break;
> +       }
> +
> +       /* If MEDIA_BUS_FMT_FIXED, set it to default value */
> +       if (vs_crtc_state->output_fmt == MEDIA_BUS_FMT_FIXED)
> +               vs_crtc_state->output_fmt = MEDIA_BUS_FMT_RGB888_1X24;
> +
> +       return ret;
> +}
> +
> +static const struct drm_encoder_helper_funcs encoder_helper_funcs = {
> +       .atomic_check = encoder_atomic_check,
> +       .atomic_enable = encoder_atomic_enable,
> +};
> +
> +static int encoder_bind(struct device *dev, struct device *master, void *data)
> +{
> +       struct drm_device *drm_dev = data;
> +       struct simple_encoder *simple = dev_get_drvdata(dev);
> +       struct drm_encoder *encoder;
> +       struct drm_bridge *bridge;
> +       int ret;
> +
> +       encoder = &simple->encoder;
> +
> +       ret = drmm_encoder_init(drm_dev, encoder, NULL, simple->priv->encoder_type, NULL);
> +       if (ret)
> +               return ret;
> +
> +       drm_encoder_helper_add(encoder, &encoder_helper_funcs);
> +
> +       encoder->possible_crtcs =
> +                       drm_of_find_possible_crtcs(drm_dev, dev->of_node);
> +
> +       /* output port is port1*/
> +       bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
> +       if (IS_ERR(bridge))
> +               return 0;
> +
> +       return drm_bridge_attach(encoder, bridge, NULL, 0);
> +}
> +
> +static const struct component_ops encoder_component_ops = {
> +       .bind = encoder_bind,
> +};
> +
> +static const struct of_device_id simple_encoder_dt_match[] = {
> +       { .compatible = "starfive,dsi-encoder", .data = &dsi_priv},
> +       {},
> +};
> +MODULE_DEVICE_TABLE(of, simple_encoder_dt_match);
> +
> +static int encoder_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct simple_encoder *simple;
> +       int ret;
> +
> +       simple = devm_kzalloc(dev, sizeof(*simple), GFP_KERNEL);
> +       if (!simple)
> +               return -ENOMEM;
> +
> +       simple->priv = of_device_get_match_data(dev);
> +
> +       simple->dev = dev;
> +
> +       dev_set_drvdata(dev, simple);
> +
> +       ret = encoder_parse_dt(dev);
> +       if (ret)
> +               return ret;
> +
> +       return component_add(dev, &encoder_component_ops);
> +}
> +
> +static int encoder_remove(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +
> +       component_del(dev, &encoder_component_ops);
> +       dev_set_drvdata(dev, NULL);
> +
> +       return 0;
> +}
> +
> +struct platform_driver simple_encoder_driver = {
> +       .probe = encoder_probe,
> +       .remove = encoder_remove,
> +       .driver = {
> +               .name = "vs-simple-encoder",
> +               .of_match_table = of_match_ptr(simple_encoder_dt_match),
> +       },
> +};
> +
> +MODULE_DESCRIPTION("Simple Encoder Driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/gpu/drm/verisilicon/vs_simple_enc.h b/drivers/gpu/drm/verisilicon/vs_simple_enc.h
> new file mode 100644
> index 000000000000..fb33ca9e18d6
> --- /dev/null
> +++ b/drivers/gpu/drm/verisilicon/vs_simple_enc.h
> @@ -0,0 +1,23 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2022 VeriSilicon Holdings Co., Ltd.
> + */
> +
> +#ifndef __VS_SIMPLE_ENC_H_
> +#define __VS_SIMPLE_ENC_H_
> +
> +struct simple_encoder_priv {
> +       unsigned char encoder_type;
> +};
> +
> +struct simple_encoder {
> +       struct drm_encoder encoder;
> +       struct device *dev;
> +       const struct simple_encoder_priv *priv;
> +       struct regmap *dss_regmap;
> +       unsigned int offset;
> +       unsigned int mask;
> +};
> +
> +extern struct platform_driver simple_encoder_driver;
> +#endif /* __VS_SIMPLE_ENC_H_ */
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
