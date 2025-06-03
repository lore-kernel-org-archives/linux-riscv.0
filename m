Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01911C5AD49
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jun 2025 13:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sjCBRocjZq8BI4tHHptNIUkvjS1re+WcS/QYvfqmpkU=; b=f6oPweLxNRRDo2
	jxmQmnKq5NhmbPceip+p/3xfErufTMASjgs/0vlPM3rpI4bRJEIvyC/4SflNRGqAd8fSzFdHEkhTf
	1DIMpjc94pX51AxjvK+YcV4FkyCh+Ew9uY2i0NCd2O86G9PuoT1++hH3uEt4TgvHHChhJ39ftLlbG
	DteiZqKab+I4NOHqvLfHyzTD3/ylmcUapVPKPD3n+iN5FXvOkfGtw2AbT8GH905ktb6L3dRzy0kcy
	eELrxO6IoiH2zJqvQORFpiS/tM0HbHE2seVk0IoMiTqanAPmeYidmnyVtN6IHMK4MJoaZl8KrRCbW
	i1UU9axKZMgEJqyyH0fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMRjs-0000000B2Xe-3Xt9;
	Tue, 03 Jun 2025 13:31:36 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMRhO-0000000B2BD-44FM
	for linux-riscv@lists.infradead.org;
	Tue, 03 Jun 2025 13:29:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 05F17A5014A;
	Tue,  3 Jun 2025 13:29:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0E95C4CEED;
	Tue,  3 Jun 2025 13:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748957341;
	bh=F0kJRudsurFWvAfw/NQZAGVoSklCQBdR6GXq+HvgSFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pK/iBtt299lLbE8VT7t/nTvPQLQVpuxt5Mgy8NKyug+Kt5+dx9+NGP4u5u+xdIGw7
	 ErxkyqUEmTwVK8pfVCa230zvl0NCQzrf3gs4jun/ohCWBw8rFBIXlVwzYLwRcsS1Ic
	 CHh7aoQw4ekcNVsGJPzkCevQ0PH3UFCJowUBmOKXOQmELF49W2lmENetlz4Nvsjhjr
	 +4fHeeAQTOEU3759B95m8c1QxZZ4T+J1XLEn35Nsvskz2ObDUBGPhFQe2K8vdWYnC2
	 Yt7RU+p+f31JlTY9kylbg1nKXUV3Gz5ipo+T4Avup6q0JOG9Odz6Rq3rF3E2B8yXf6
	 5V9tpkm6HY6hQ==
Date: Tue, 3 Jun 2025 15:28:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 3/8] drm/imagination: Use pwrseq for TH1520 GPU power
 management
Message-ID: <20250603-whispering-jaybird-of-thunder-f87867@kuoka>
References: <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
 <CGME20250529222405eucas1p18ed1254bf1b2d78468734656fec537e1@eucas1p1.samsung.com>
 <20250530-apr_14_for_sending-v3-3-83d5744d997c@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250530-apr_14_for_sending-v3-3-83d5744d997c@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_062903_145569_F116C8BB 
X-CRM114-Status: GOOD (  26.41  )
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

On Fri, May 30, 2025 at 12:23:50AM GMT, Michal Wilczynski wrote:
> Update the Imagination PVR DRM driver to leverage the pwrseq framework
> for managing the power sequence of the GPU on the T-HEAD TH1520 SoC.
> 
> In pvr_device_init(), the driver now attempts to get a handle to the
> "gpu-power" sequencer target using devm_pwrseq_get(). If successful,
> the responsibility for powering on and off the GPU's core clocks and
> resets is delegated to the power sequencer. Consequently, the GPU
> driver conditionally skips acquiring the GPU reset line if the pwrseq
> handle is obtained, as the sequencer's match function will acquire it.
> Clock handles are still acquired by the GPU driver for other purposes
> like devfreq.
> 
> The runtime PM callbacks, pvr_power_device_resume() and
> pvr_power_device_suspend(), are modified to call pwrseq_power_on() and
> pwrseq_power_off() respectively when the sequencer is present.  If no
> sequencer is found, the driver falls back to its existing manual clock
> and reset management. A helper function,
> pvr_power_off_sequence_manual(), is introduced to encapsulate the manual
> power-down logic.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  drivers/gpu/drm/imagination/Kconfig      |  1 +
>  drivers/gpu/drm/imagination/pvr_device.c | 33 +++++++++++--
>  drivers/gpu/drm/imagination/pvr_device.h |  6 +++
>  drivers/gpu/drm/imagination/pvr_power.c  | 82 +++++++++++++++++++++-----------
>  4 files changed, 89 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/imagination/Kconfig b/drivers/gpu/drm/imagination/Kconfig
> index 3bfa2ac212dccb73c53bdc2bc259bcba636e7cfc..737ace77c4f1247c687cc1fde2f139fc2e118c50 100644
> --- a/drivers/gpu/drm/imagination/Kconfig
> +++ b/drivers/gpu/drm/imagination/Kconfig
> @@ -11,6 +11,7 @@ config DRM_POWERVR
>  	select DRM_SCHED
>  	select DRM_GPUVM
>  	select FW_LOADER
> +  select POWER_SEQUENCING

Messed indent.

>  	help
>  	  Choose this option if you have a system that has an Imagination
>  	  Technologies PowerVR (Series 6 or later) or IMG GPU.
> diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
> index 8b9ba4983c4cb5bc40342fcafc4259078bc70547..19d48bbc828cf2b8dbead602e90ff88780152124 100644
> --- a/drivers/gpu/drm/imagination/pvr_device.c
> +++ b/drivers/gpu/drm/imagination/pvr_device.c
> @@ -25,6 +25,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/pwrseq/consumer.h>
>  #include <linux/reset.h>
>  #include <linux/slab.h>
>  #include <linux/stddef.h>
> @@ -631,10 +632,34 @@ pvr_device_init(struct pvr_device *pvr_dev)
>  	if (err)
>  		return err;
>  
> -	/* Get the reset line for the GPU */
> -	err = pvr_device_reset_init(pvr_dev);
> -	if (err)
> -		return err;
> +	/*
> +	 * Try to get a power sequencer. If successful, it will handle clocks
> +	 * and resets. Otherwise, we fall back to managing them ourselves.
> +	 */
> +	pvr_dev->pwrseq = devm_pwrseq_get(dev, "gpu-power");
> +	if (IS_ERR(pvr_dev->pwrseq)) {
> +		int pwrseq_err = PTR_ERR(pvr_dev->pwrseq);
> +
> +		/*
> +		 * If the error is -EPROBE_DEFER, it's because the
> +		 * optional sequencer provider is not present
> +		 * and it's safe to fall back on manual power-up.

It is safe but why it is desirable? The rule is rather to defer the
probe, assuming this is probe path.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
