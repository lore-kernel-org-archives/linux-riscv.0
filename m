Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1E9C7115B
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jun 2025 11:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xmaGZ260u50eY3UPA020XTwgnV3LbZmKX0ucSwcuyII=; b=nvC6p1gcLW3opb
	aRG8kWMif88ZdQsgasCA1nxIzqAaeUgPI5LYhn+/xdysKRg8Ek5XGWFtzwr/49oScOIQzfNYmE45B
	dD2HruO6eT4jzvtQvNlBJVuvAvME/hcKnwha5DDBjBXGTSQA+31oKO6r0LTC1Cdpwybz1wxARAR9q
	n9Obtf0ddw1cF7RjrqG0hf9dGVCDxNrVjVAXmbUisWtolZtCe86ueg+j+gSDebkhzNAAu+G9hav4m
	Q308MnisE6JF0JdO2SyIVogdSgUejLsvq4uVC/EhIEB4HnP/TbDvhbhCM5aypsLAA3OPriFofT8BM
	YN1DkOLehQLkMEuc4mRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSDRJ-0000000CrjA-0OB2;
	Thu, 19 Jun 2025 11:28:17 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSCSS-0000000CkVL-2QXg
	for linux-riscv@lists.infradead.org;
	Thu, 19 Jun 2025 10:25:25 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-e812fc35985so554259276.0
        for <linux-riscv@lists.infradead.org>; Thu, 19 Jun 2025 03:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750328723; x=1750933523; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ua4ESBOBusXcEPYVXoT+f1Oc5QbUn+Vjv+tNr5h2kMY=;
        b=Zn5X7ZlKc89oQ0TyoMG2IAhLdNG99WBHw0p8wA2mf7W/xwCa/8NQf64faLIOd1ADZF
         H0XPfxszt/fTWdNsezaMoPD1VRwzcjIb1Wk1HL876H7l5qFWcXTrRHvNo9gI3fRL6KgW
         Uav9AiaTi5Vc/a6mXBQF2qXHc+MW4lcPnY1bkWlsAbqMHLlnHhO0WRBDc7hw6qk8OzpS
         yeaizUK8e5ar5DqMO5y6lleNI5LK4I0olsfPkJNqukbWo+FFHs1pAWcV7r3gAGQ4Ssb+
         BqzjTLxX+IOeZuLKsGJrIhmDbISsXLoaqPHOdERx//97hc0sf40YhNnNApMagkrtKo4E
         1l5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750328723; x=1750933523;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ua4ESBOBusXcEPYVXoT+f1Oc5QbUn+Vjv+tNr5h2kMY=;
        b=nBW4NclRAzfWJ9uNhOb1igvYYPWiOm1GSC+N3S+8tP95UipfWbGMmwNvAH8BbFnK4g
         i2NqxpOG0uG9Uhi0k3Xbjkg4gcmfO21JiaFvvUVppmNYIo9qoUwbU4nUv+jXxEKvX8bS
         yeNRk/O/W7HhJiU20wTKlHxL2v/ctRpUzaEWAnrKx+PO6FqHujbkq+2j0EbEhplUvXYt
         shc7ZaApNlZos+HXuLvGKvUb+4K+0WoaGiTxr+qVJInKP5iG0UND5sI/aTvgLNjlXwYu
         P0WOAxpeGUGlo13avfhky3xuEcY7AySqnQ1+6lITeSo/vgK6xs9uJucZ347S3wOUVQaZ
         yDyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEnq9zzoZ5P2M8cK4WG7fZrtzdNoXF7240oXgivucMQDAVRuBjKVPBeKLUGtl6Ld7Tqv9fFV75C32auw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyHn9EXJmCE6XvosdMpPpcTtphvYh9qowuM5chX8BbhLU1J23OF
	/1iFKazf6Z5GUbG0T/TRLQxDJpEPjIO6U7e+sIGmq8dteD3aHQhjSZGBxoafytvYUxouGGxe9x6
	wWPfvM5Mfsi4mWnUfkdNyFiMvmsJchAZfvR5LGksPaQ==
X-Gm-Gg: ASbGncv5ef+DgksraMHk1rP5C5PKed82JnV7Zdn5QetN62EBFwPlNmuTeTPZfT5MSGy
	E4fwxcLjeQzh46yvWy2EPItRwfuuB/R0je2dlnxlyy2uYDdgAQTrHzSVa2JVD++CokRtVmRI8Nr
	cPQpqN9fQtLZYQM5p+S1cMXSMb7iq281XkycN5pzp1gXPK
X-Google-Smtp-Source: AGHT+IEd1Y2dYwu5kQzmOiqV3OZ5X0v2pCQJYBuRmzgW1uRqeViVETMJf6n3heh0RuoVtnPHqbuzFhL0HpKezAowQ9Y=
X-Received: by 2002:a05:6902:1207:b0:e7d:13f2:943c with SMTP id
 3f1490d57ef6-e822ad92dedmr26314262276.41.1750328723568; Thu, 19 Jun 2025
 03:25:23 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250618102228eucas1p1906803f73cc004e68f281b2bdf871da3@eucas1p1.samsung.com>
 <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com> <20250618-apr_14_for_sending-v5-3-27ed33ea5c6f@samsung.com>
In-Reply-To: <20250618-apr_14_for_sending-v5-3-27ed33ea5c6f@samsung.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 19 Jun 2025 12:24:47 +0200
X-Gm-Features: Ac12FXzw77jNMgM4ecKpiOyLqo41UGjlRF2A49p8Af0bxhXr8nkUTTfXWCm5OqM
Message-ID: <CAPDyKFq_4W7bPr1NiuEGzMDoY6tQuHbw5uOXrkJagbEbtmqMWg@mail.gmail.com>
Subject: Re: [PATCH v5 3/8] pmdomain: thead: Instantiate GPU power sequencer
 via auxiliary bus
To: Michal Wilczynski <m.wilczynski@samsung.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, 
	Matt Coster <matt.coster@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_032524_645363_80779979 
X-CRM114-Status: GOOD (  29.86  )
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

On Wed, 18 Jun 2025 at 12:22, Michal Wilczynski
<m.wilczynski@samsung.com> wrote:
>
> In order to support the complex power sequencing required by the TH1520
> GPU, the AON power domain driver must be responsible for initiating the
> corresponding sequencer driver. This functionality is specific to
> platforms where the GPU power sequencing hardware is controlled by the
> AON block.
>
> Extend the AON power domain driver to check for the presence of the
> "gpu-clkgen" reset in its own device tree node.
>
> If the property is found, create and register a new auxiliary device.
> This device acts as a proxy that allows the dedicated `pwrseq-thead-gpu`
> auxiliary driver to bind and take control of the sequencing logic.
>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

It looks like there is another re-spin needed, but thinking of the
merge-strategy I could potentially take patch1->patch3 via my pmdomain
tree, as it seems reasonable to keep those changes together. Unless
Bartosz sees any problem with that, of course.

Kind regards
Uffe

> ---
>  drivers/pmdomain/thead/Kconfig             |  1 +
>  drivers/pmdomain/thead/th1520-pm-domains.c | 51 ++++++++++++++++++++++++++++++
>  2 files changed, 52 insertions(+)
>
> diff --git a/drivers/pmdomain/thead/Kconfig b/drivers/pmdomain/thead/Kconfig
> index 7d52f8374b074167d508a80fd807929c53faef12..208828e0fa0dc91256bf808b905bea32bb84250d 100644
> --- a/drivers/pmdomain/thead/Kconfig
> +++ b/drivers/pmdomain/thead/Kconfig
> @@ -4,6 +4,7 @@ config TH1520_PM_DOMAINS
>         tristate "Support TH1520 Power Domains"
>         depends on TH1520_AON_PROTOCOL
>         select REGMAP_MMIO
> +       select AUXILIARY_BUS
>         help
>           This driver enables power domain management for the T-HEAD
>           TH-1520 SoC. On this SoC there are number of power domains,
> diff --git a/drivers/pmdomain/thead/th1520-pm-domains.c b/drivers/pmdomain/thead/th1520-pm-domains.c
> index f702e20306f469aeb0ed15e54bd4f8309f28018c..9040b698e7f7f2400163841530fecacfb0f917bc 100644
> --- a/drivers/pmdomain/thead/th1520-pm-domains.c
> +++ b/drivers/pmdomain/thead/th1520-pm-domains.c
> @@ -5,6 +5,7 @@
>   * Author: Michal Wilczynski <m.wilczynski@samsung.com>
>   */
>
> +#include <linux/auxiliary_bus.h>
>  #include <linux/firmware/thead/thead,th1520-aon.h>
>  #include <linux/slab.h>
>  #include <linux/platform_device.h>
> @@ -128,6 +129,50 @@ static void th1520_pd_init_all_off(struct generic_pm_domain **domains,
>         }
>  }
>
> +static void th1520_pd_pwrseq_unregister_adev(void *adev)
> +{
> +       auxiliary_device_delete(adev);
> +       auxiliary_device_uninit(adev);
> +}
> +
> +static int th1520_pd_pwrseq_gpu_init(struct device *dev)
> +{
> +       struct auxiliary_device *adev;
> +       int ret;
> +
> +       /*
> +        * Correctly check only for the property's existence in the DT node.
> +        * We don't need to get/claim the reset here; that is the job of
> +        * the auxiliary driver that we are about to spawn.
> +        */
> +       if (device_property_match_string(dev, "reset-names", "gpu-clkgen") < 0)
> +               /*
> +                * This is not an error. It simply means the optional sequencer
> +                * is not described in the device tree.
> +                */
> +               return 0;
> +
> +       adev = devm_kzalloc(dev, sizeof(*adev), GFP_KERNEL);
> +       if (!adev)
> +               return -ENOMEM;
> +
> +       adev->name = "pwrseq-gpu";
> +       adev->dev.parent = dev;
> +
> +       ret = auxiliary_device_init(adev);
> +       if (ret)
> +               return ret;
> +
> +       ret = auxiliary_device_add(adev);
> +       if (ret) {
> +               auxiliary_device_uninit(adev);
> +               return ret;
> +       }
> +
> +       return devm_add_action_or_reset(dev, th1520_pd_pwrseq_unregister_adev,
> +                                       adev);
> +}
> +
>  static int th1520_pd_probe(struct platform_device *pdev)
>  {
>         struct generic_pm_domain **domains;
> @@ -186,8 +231,14 @@ static int th1520_pd_probe(struct platform_device *pdev)
>         if (ret)
>                 goto err_clean_genpd;
>
> +       ret = th1520_pd_pwrseq_gpu_init(dev);
> +       if (ret)
> +               goto err_clean_provider;
> +
>         return 0;
>
> +err_clean_provider:
> +       of_genpd_del_provider(dev->of_node);
>  err_clean_genpd:
>         for (i--; i >= 0; i--)
>                 pm_genpd_remove(domains[i]);
>
> --
> 2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
