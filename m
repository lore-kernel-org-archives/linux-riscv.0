Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A1DCA0FE8
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 15:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l12OQWqXsO9UgCdBIX2YPy2fBFwsMfZTQ+UTgpTml+M=; b=2qEFmV0fS22fMZ
	YoPZyNJ9R+dy/LIob9Pi3THP/UahTJS2/ki3qqijZtX+O3j79ozgz5tHIW1cyaUSDHBQmWsCemc2Q
	OfpSyQfEJNiOX535Ot9ehvbuFuiEFOMb7BblwNa8lIxfhGK1eO0Eg7dZX6RrMkxH2rB5KEUuI8y5e
	SWWkeoaUpeV/VpXINZ7q4SoOf3//a0Vb2LW6B+jHeoN3kCHvozDSSljSaftKNkHRa7liB30u8FPvM
	2/dBLUtSsW9ccnHZxusJqCN2vtZZdD7nLSbRbFRM2OOXnpIa4Gj8Xk6q78+tofkBXB5OItM+KLzJV
	WINvg1moRH0LEqJm5Adw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTmj-000000032Ud-0Jo4;
	Fri, 22 Aug 2025 15:34:33 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upNO3-00000001yF7-1dYl
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 08:44:40 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-71fb85c4b59so30304757b3.1
        for <linux-riscv@lists.infradead.org>; Fri, 22 Aug 2025 01:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755852278; x=1756457078; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KBPTqKB5JiRTVwfLpAbpF1wwChhoA4ZKdUAledVVxVE=;
        b=Rji3BaojTwG5mnUWZp/Lv9TEI1J+i+y+X3KxUkmzQijymt9kSCXz9lnqaxASNP0CaJ
         SLrywzHK5SWFpqmS4LQjwxGclFl/z5Z/bbphpRBEGfs7iQrLpkEha+LhuqLLpupZ7RlH
         QwclkOb+eiXV8DBTewnVbgc5H0bO3JZDiMBHTebxcEz2hEBNnr7pyp31l3y9PXH+s51G
         qNX9+bDIFXHUbdhKFEdKdmH8diLq8Z86dWfYFMe4B9JBZnGRG1NSjeB9kc/nG3bgqahf
         GS3sOq6J18pSwsHkJmGA/a16D2PuN/AH3JMbestox/d9Yr6m8+t3IRrnyWzzkT2LZ61b
         N4RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755852278; x=1756457078;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KBPTqKB5JiRTVwfLpAbpF1wwChhoA4ZKdUAledVVxVE=;
        b=IX5wzK6ssH/cknddTbzm6PgUOESSo2/BH+KVilcak3MG71THFHdgt9FI8sXIdDHNqo
         k3cdTzi6TslOMxrg2uWv+jraxy1fPDZEQ5uykFQWeq3QvVZxBdAEkYQY4us2d0b56gcb
         vC3XeLewWRRbVCvRrMh2V2IxxI5YWFWy1CgXyONnKRq8ITHds6Dvm4tx1d3aiLLmeViJ
         hNzscB2yCNbe81OVqsgwGZuW8cLPEVgcqxuWGUvMoFCNDd3H+FTLPj07cNiiMKNOSeLT
         hFdh1tOg30IV9XD58Z5fjxJW1wesUDOGEfwFQHYaWkmOsclZEwVes4560BD+vIu4fPXR
         uVHQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4/aTyl50v26s2M2tva9fYwXN8k1tCf335pZxafrL5iho6P6eUgOro98vY4/2t2v9nj8hT5nzD/MUT1g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyZ4OwqH41+TWohisAVr/z4l7IZoUA2pV8IafVsPgccCqiSPHHC
	RkqHejJsxOYKWZUgDGoQgl8wdZYBxrkcR/bzzGYyvgg/7QSdqAabr7+QHf3Ohhoz6vSru7l2DSf
	4heswIVuVoNhUAc4OAe3avXfFp2W1cEcX+xWjMDPDuw==
X-Gm-Gg: ASbGnctui9RlpZ+xn35dk18R4b9fMtW4pVGwqqZ2uouL9pyD/2ZC1nBVmQcq3KfMIks
	G0gHHuw/8bacBHdYeFgxfP+Cq4VDiYUF92yVL2iLH9uQd4WyXL+wrHGfbjlP2ZIi6HSruV3tl7S
	hUx8MiW5jv0GKFgsmx3HOelHCoQm1vFaqTp6lz1WQi1s+MVgAi9VvtP0oZWkEg3ySFHW5wuoOvx
	CuJm25Z
X-Google-Smtp-Source: AGHT+IHA1sL4TZ9Ut/1rHRDjs85vXaUh9yetzlegp6n46yEHqFpv/mMS2IBi36yPxq8b4JUlId403ACHtfrZSxK6Sqg=
X-Received: by 2002:a05:690c:9519:b0:71b:9230:1bc3 with SMTP id
 00721157ae682-71fc9f69ffamr49083147b3.19.1755852277530; Fri, 22 Aug 2025
 01:44:37 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250821222020eucas1p20e40b85b991da0b4d867df76e55350ed@eucas1p2.samsung.com>
 <20250822-apr_14_for_sending-v13-0-af656f7cc6c3@samsung.com> <20250822-apr_14_for_sending-v13-1-af656f7cc6c3@samsung.com>
In-Reply-To: <20250822-apr_14_for_sending-v13-1-af656f7cc6c3@samsung.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 22 Aug 2025 10:44:00 +0200
X-Gm-Features: Ac12FXzDGTLn5NdJ-_l-YYMwB6YuhC7f6K9vZlhNmbbblUzf5m33DJiHU9BpEaE
Message-ID: <CAPDyKFrpGtJ8ZAMjJLEJeOK=0Qpdky3sQ4w-n6Pg=+Dd9qUZ+A@mail.gmail.com>
Subject: Re: [PATCH v13 1/4] drm/imagination: Use pwrseq for TH1520 GPU power management
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Drew Fustini <fustini@kernel.org>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_014439_445417_AB7C3C55 
X-CRM114-Status: GOOD (  37.82  )
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

On Fri, 22 Aug 2025 at 00:20, Michal Wilczynski
<m.wilczynski@samsung.com> wrote:
>
> Update the Imagination PVR DRM driver to leverage the pwrseq framework
> for managing the complex power sequence of the GPU on the T-HEAD TH1520
> SoC.
>
> To cleanly separate platform-specific logic from the generic driver,
> this patch introduces an `init` callback to the `pwr_power_sequence_ops`
> struct. This allows for different power management strategies to be
> selected at probe time based on the device's compatible string.
>
> A `pvr_device_data` struct, associated with each compatible in the
> of_device_id table, points to the appropriate ops table (manual or
> pwrseq).
>
> At probe time, the driver now calls the `->init()` op. For pwrseq-based
> platforms, this callback calls `devm_pwrseq_get("gpu-power")`, deferring
> probe if the sequencer is not yet available. For other platforms, it
> falls back to the existing manual clock and reset handling. The runtime
> PM callbacks continue to call the appropriate functions via the ops
> table.
>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  drivers/gpu/drm/imagination/pvr_device.c |  22 +----
>  drivers/gpu/drm/imagination/pvr_device.h |  17 ++++
>  drivers/gpu/drm/imagination/pvr_drv.c    |  23 ++++-
>  drivers/gpu/drm/imagination/pvr_power.c  | 158 +++++++++++++++++++++++--------
>  drivers/gpu/drm/imagination/pvr_power.h  |  15 +++
>  5 files changed, 176 insertions(+), 59 deletions(-)
>
> diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
> index 8b9ba4983c4cb5bc40342fcafc4259078bc70547..294b6019b4155bb7fdb7de73ccf7fa8ad867811f 100644
> --- a/drivers/gpu/drm/imagination/pvr_device.c
> +++ b/drivers/gpu/drm/imagination/pvr_device.c
> @@ -23,6 +23,7 @@
>  #include <linux/firmware.h>
>  #include <linux/gfp.h>
>  #include <linux/interrupt.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/reset.h>
> @@ -121,21 +122,6 @@ static int pvr_device_clk_init(struct pvr_device *pvr_dev)
>         return 0;
>  }
>
> -static int pvr_device_reset_init(struct pvr_device *pvr_dev)
> -{
> -       struct drm_device *drm_dev = from_pvr_device(pvr_dev);
> -       struct reset_control *reset;
> -
> -       reset = devm_reset_control_get_optional_exclusive(drm_dev->dev, NULL);
> -       if (IS_ERR(reset))
> -               return dev_err_probe(drm_dev->dev, PTR_ERR(reset),
> -                                    "failed to get gpu reset line\n");
> -
> -       pvr_dev->reset = reset;
> -
> -       return 0;
> -}
> -
>  /**
>   * pvr_device_process_active_queues() - Process all queue related events.
>   * @pvr_dev: PowerVR device to check
> @@ -618,6 +604,9 @@ pvr_device_init(struct pvr_device *pvr_dev)
>         struct device *dev = drm_dev->dev;
>         int err;
>
> +       /* Get the platform-specific data based on the compatible string. */
> +       pvr_dev->device_data = of_device_get_match_data(dev);
> +
>         /*
>          * Setup device parameters. We do this first in case other steps
>          * depend on them.
> @@ -631,8 +620,7 @@ pvr_device_init(struct pvr_device *pvr_dev)
>         if (err)
>                 return err;
>
> -       /* Get the reset line for the GPU */
> -       err = pvr_device_reset_init(pvr_dev);
> +       err = pvr_dev->device_data->pwr_ops->init(pvr_dev);
>         if (err)
>                 return err;
>
> diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
> index 7cb01c38d2a9c3fc71effe789d4dfe54eddd93ee..ab8f56ae15df6c2888feb16b1d87b59510961936 100644
> --- a/drivers/gpu/drm/imagination/pvr_device.h
> +++ b/drivers/gpu/drm/imagination/pvr_device.h
> @@ -37,6 +37,9 @@ struct clk;
>  /* Forward declaration from <linux/firmware.h>. */
>  struct firmware;
>
> +/* Forward declaration from <linux/pwrseq/consumer.h> */
> +struct pwrseq_desc;
> +
>  /**
>   * struct pvr_gpu_id - Hardware GPU ID information for a PowerVR device
>   * @b: Branch ID.
> @@ -57,6 +60,14 @@ struct pvr_fw_version {
>         u16 major, minor;
>  };
>
> +/**
> + * struct pvr_device_data - Platform specific data associated with a compatible string.
> + * @pwr_ops: Pointer to a structure with platform-specific power functions.
> + */
> +struct pvr_device_data {
> +       const struct pvr_power_sequence_ops *pwr_ops;
> +};
> +
>  /**
>   * struct pvr_device - powervr-specific wrapper for &struct drm_device
>   */
> @@ -98,6 +109,9 @@ struct pvr_device {
>         /** @fw_version: Firmware version detected at runtime. */
>         struct pvr_fw_version fw_version;
>
> +       /** @device_data: Pointer to platform-specific data. */
> +       const struct pvr_device_data *device_data;
> +
>         /** @regs_resource: Resource representing device control registers. */
>         struct resource *regs_resource;
>
> @@ -148,6 +162,9 @@ struct pvr_device {
>          */
>         struct reset_control *reset;
>
> +       /** @pwrseq: Pointer to a power sequencer, if one is used. */
> +       struct pwrseq_desc *pwrseq;
> +
>         /** @irq: IRQ number. */
>         int irq;
>
> diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
> index b058ec183bb30ab5c3db17ebaadf2754520a2a1f..916b40ced7eb0408fe985ba1b83b3be2eb024bae 100644
> --- a/drivers/gpu/drm/imagination/pvr_drv.c
> +++ b/drivers/gpu/drm/imagination/pvr_drv.c
> @@ -1480,15 +1480,33 @@ static void pvr_remove(struct platform_device *plat_dev)
>         pvr_power_domains_fini(pvr_dev);
>  }
>
> +static const struct pvr_device_data pvr_device_data_manual = {
> +       .pwr_ops = &pvr_power_sequence_ops_manual,
> +};
> +
> +static const struct pvr_device_data pvr_device_data_pwrseq = {
> +       .pwr_ops = &pvr_power_sequence_ops_pwrseq,
> +};
> +
>  static const struct of_device_id dt_match[] = {
> -       { .compatible = "img,img-rogue", .data = NULL },
> +       {
> +               .compatible = "thead,th1520-gpu",
> +               .data = &pvr_device_data_pwrseq,
> +       },
> +       {
> +               .compatible = "img,img-rogue",
> +               .data = &pvr_device_data_manual,
> +       },
>
>         /*
>          * This legacy compatible string was introduced early on before the more generic
>          * "img,img-rogue" was added. Keep it around here for compatibility, but never use
>          * "img,img-axe" in new devicetrees.
>          */
> -       { .compatible = "img,img-axe", .data = NULL },
> +       {
> +               .compatible = "img,img-axe",
> +               .data = &pvr_device_data_manual,
> +       },
>         {}
>  };
>  MODULE_DEVICE_TABLE(of, dt_match);
> @@ -1513,4 +1531,5 @@ MODULE_DESCRIPTION(PVR_DRIVER_DESC);
>  MODULE_LICENSE("Dual MIT/GPL");
>  MODULE_IMPORT_NS("DMA_BUF");
>  MODULE_FIRMWARE("powervr/rogue_33.15.11.3_v1.fw");
> +MODULE_FIRMWARE("powervr/rogue_36.52.104.182_v1.fw");
>  MODULE_FIRMWARE("powervr/rogue_36.53.104.796_v1.fw");
> diff --git a/drivers/gpu/drm/imagination/pvr_power.c b/drivers/gpu/drm/imagination/pvr_power.c
> index 187a07e0bd9adb2f0713ac2c8e091229f4027354..c6e7ff9e935d3b348eff6953c633c72410fdf507 100644
> --- a/drivers/gpu/drm/imagination/pvr_power.c
> +++ b/drivers/gpu/drm/imagination/pvr_power.c
> @@ -18,6 +18,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/pwrseq/consumer.h>
>  #include <linux/reset.h>
>  #include <linux/timer.h>
>  #include <linux/types.h>
> @@ -234,6 +235,118 @@ pvr_watchdog_init(struct pvr_device *pvr_dev)
>         return 0;
>  }
>
> +static int pvr_power_init_manual(struct pvr_device *pvr_dev)
> +{
> +       struct drm_device *drm_dev = from_pvr_device(pvr_dev);
> +       struct reset_control *reset;
> +
> +       reset = devm_reset_control_get_optional_exclusive(drm_dev->dev, NULL);
> +       if (IS_ERR(reset))
> +               return dev_err_probe(drm_dev->dev, PTR_ERR(reset),
> +                                    "failed to get gpu reset line\n");
> +
> +       pvr_dev->reset = reset;
> +
> +       return 0;
> +}
> +
> +static int pvr_power_on_sequence_manual(struct pvr_device *pvr_dev)
> +{
> +       int err;
> +
> +       err = clk_prepare_enable(pvr_dev->core_clk);
> +       if (err)
> +               return err;
> +
> +       err = clk_prepare_enable(pvr_dev->sys_clk);
> +       if (err)
> +               goto err_core_clk_disable;
> +
> +       err = clk_prepare_enable(pvr_dev->mem_clk);
> +       if (err)
> +               goto err_sys_clk_disable;
> +
> +       /*
> +        * According to the hardware manual, a delay of at least 32 clock
> +        * cycles is required between de-asserting the clkgen reset and
> +        * de-asserting the GPU reset. Assuming a worst-case scenario with
> +        * a very high GPU clock frequency, a delay of 1 microsecond is
> +        * sufficient to ensure this requirement is met across all
> +        * feasible GPU clock speeds.
> +        */
> +       udelay(1);
> +
> +       err = reset_control_deassert(pvr_dev->reset);
> +       if (err)
> +               goto err_mem_clk_disable;
> +
> +       return 0;
> +
> +err_mem_clk_disable:
> +       clk_disable_unprepare(pvr_dev->mem_clk);
> +
> +err_sys_clk_disable:
> +       clk_disable_unprepare(pvr_dev->sys_clk);
> +
> +err_core_clk_disable:
> +       clk_disable_unprepare(pvr_dev->core_clk);
> +
> +       return err;
> +}
> +
> +static int pvr_power_off_sequence_manual(struct pvr_device *pvr_dev)
> +{
> +       int err;
> +
> +       err = reset_control_assert(pvr_dev->reset);
> +
> +       clk_disable_unprepare(pvr_dev->mem_clk);
> +       clk_disable_unprepare(pvr_dev->sys_clk);
> +       clk_disable_unprepare(pvr_dev->core_clk);
> +
> +       return err;
> +}
> +
> +const struct pvr_power_sequence_ops pvr_power_sequence_ops_manual = {
> +       .init = pvr_power_init_manual,
> +       .power_on = pvr_power_on_sequence_manual,
> +       .power_off = pvr_power_off_sequence_manual,
> +};
> +
> +static int pvr_power_init_pwrseq(struct pvr_device *pvr_dev)
> +{
> +       struct device *dev = from_pvr_device(pvr_dev)->dev;
> +
> +       pvr_dev->pwrseq = devm_pwrseq_get(dev, "gpu-power");
> +       if (IS_ERR(pvr_dev->pwrseq)) {
> +               /*
> +                * This platform requires a sequencer. If we can't get it, we
> +                * must return the error (including -EPROBE_DEFER to wait for
> +                * the provider to appear)
> +                */
> +               return dev_err_probe(dev, PTR_ERR(pvr_dev->pwrseq),
> +                                    "Failed to get required power sequencer\n");
> +       }
> +
> +       return 0;
> +}
> +
> +static int pvr_power_on_sequence_pwrseq(struct pvr_device *pvr_dev)
> +{
> +       return pwrseq_power_on(pvr_dev->pwrseq);
> +}
> +
> +static int pvr_power_off_sequence_pwrseq(struct pvr_device *pvr_dev)
> +{
> +       return pwrseq_power_off(pvr_dev->pwrseq);
> +}
> +
> +const struct pvr_power_sequence_ops pvr_power_sequence_ops_pwrseq = {
> +       .init = pvr_power_init_pwrseq,
> +       .power_on = pvr_power_on_sequence_pwrseq,
> +       .power_off = pvr_power_off_sequence_pwrseq,
> +};
> +
>  int
>  pvr_power_device_suspend(struct device *dev)
>  {
> @@ -252,11 +365,7 @@ pvr_power_device_suspend(struct device *dev)
>                         goto err_drm_dev_exit;
>         }
>
> -       clk_disable_unprepare(pvr_dev->mem_clk);
> -       clk_disable_unprepare(pvr_dev->sys_clk);
> -       clk_disable_unprepare(pvr_dev->core_clk);
> -
> -       err = reset_control_assert(pvr_dev->reset);
> +       err = pvr_dev->device_data->pwr_ops->power_off(pvr_dev);
>
>  err_drm_dev_exit:
>         drm_dev_exit(idx);
> @@ -276,53 +385,22 @@ pvr_power_device_resume(struct device *dev)
>         if (!drm_dev_enter(drm_dev, &idx))
>                 return -EIO;
>
> -       err = clk_prepare_enable(pvr_dev->core_clk);
> +       err = pvr_dev->device_data->pwr_ops->power_on(pvr_dev);
>         if (err)
>                 goto err_drm_dev_exit;
>
> -       err = clk_prepare_enable(pvr_dev->sys_clk);
> -       if (err)
> -               goto err_core_clk_disable;
> -
> -       err = clk_prepare_enable(pvr_dev->mem_clk);
> -       if (err)
> -               goto err_sys_clk_disable;
> -
> -       /*
> -        * According to the hardware manual, a delay of at least 32 clock
> -        * cycles is required between de-asserting the clkgen reset and
> -        * de-asserting the GPU reset. Assuming a worst-case scenario with
> -        * a very high GPU clock frequency, a delay of 1 microsecond is
> -        * sufficient to ensure this requirement is met across all
> -        * feasible GPU clock speeds.
> -        */
> -       udelay(1);
> -
> -       err = reset_control_deassert(pvr_dev->reset);
> -       if (err)
> -               goto err_mem_clk_disable;
> -
>         if (pvr_dev->fw_dev.booted) {
>                 err = pvr_power_fw_enable(pvr_dev);
>                 if (err)
> -                       goto err_reset_assert;
> +                       goto err_power_off;
>         }
>
>         drm_dev_exit(idx);
>
>         return 0;
>
> -err_reset_assert:
> -       reset_control_assert(pvr_dev->reset);
> -
> -err_mem_clk_disable:
> -       clk_disable_unprepare(pvr_dev->mem_clk);
> -
> -err_sys_clk_disable:
> -       clk_disable_unprepare(pvr_dev->sys_clk);
> -
> -err_core_clk_disable:
> -       clk_disable_unprepare(pvr_dev->core_clk);
> +err_power_off:
> +       pvr_dev->device_data->pwr_ops->power_off(pvr_dev);
>
>  err_drm_dev_exit:
>         drm_dev_exit(idx);
> diff --git a/drivers/gpu/drm/imagination/pvr_power.h b/drivers/gpu/drm/imagination/pvr_power.h
> index ada85674a7ca762dcf92df40424230e1c3910342..b853d092242cc90cb98cf66100679a309055a1dc 100644
> --- a/drivers/gpu/drm/imagination/pvr_power.h
> +++ b/drivers/gpu/drm/imagination/pvr_power.h
> @@ -41,4 +41,19 @@ pvr_power_put(struct pvr_device *pvr_dev)
>  int pvr_power_domains_init(struct pvr_device *pvr_dev);
>  void pvr_power_domains_fini(struct pvr_device *pvr_dev);
>
> +/**
> + * struct pvr_power_sequence_ops - Platform specific power sequence operations.
> + * @init: Pointer to the platform-specific initialization function.
> + * @power_on: Pointer to the platform-specific power on function.
> + * @power_off: Pointer to the platform-specific power off function.
> + */
> +struct pvr_power_sequence_ops {
> +       int (*init)(struct pvr_device *pvr_dev);
> +       int (*power_on)(struct pvr_device *pvr_dev);
> +       int (*power_off)(struct pvr_device *pvr_dev);
> +};
> +
> +extern const struct pvr_power_sequence_ops pvr_power_sequence_ops_manual;
> +extern const struct pvr_power_sequence_ops pvr_power_sequence_ops_pwrseq;
> +
>  #endif /* PVR_POWER_H */
>
> --
> 2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
