Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18EFDC02185
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 10:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kKaVV9qGzt0VC+EvR8lvqcIOmDYHC3RThFd9pVf5ZFo=; b=KD9hnfdFA+gYR2
	Rob5iG9bod9wx5pX3jtsXpyMeQY4UzsGu9DAXTYzgx1PdzdXqQzo7kbSpqg3ioA+aEgX1gjKnajGu
	E5ZT/LC6e592SXOib8J1oeqoO9pYFVDJaTgSqUIPzNAkInk1IVeVc5b4rvb3yV8Q5+6lRIxPLXywD
	VWcmgV0ee7lo2nsqXVnoB3WBoaNeUMUU3VBmaHZS28tmmgCBjT2SUINX5NgBOtxgRIhdDc37RTo8Z
	8fFH6vGglBboloFi89jtg8igJV1vLJsSqBmreNCnFChkc5u5w47B4lmFw8KbSMAjqR23dkPAty2/X
	zc+TNEe/k0/ARSsU6Pqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taB5u-00000007W28-1D6z;
	Tue, 21 Jan 2025 10:02:50 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taB5r-00000007W0v-3koQ
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jan 2025 10:02:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 84BF6A41412;
	Tue, 21 Jan 2025 10:00:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39776C4CEDF;
	Tue, 21 Jan 2025 10:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737453766;
	bh=Q6TsjNYIIprFxCUPZ9GtMLBRF/ZSTzZhy68jSq2lqBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mOmfQ/CouM9psLIfX+6WLjQI1DnfrPm0jwMpQHhAHvTPLdRuZO2mm2jaCD0r57hfR
	 AJuJReUzRS8Q3e/Tmfov8jC2S+HD5vKH9uOcq0WN5FLoV+S4ajQoJGPoGoULgTtQC2
	 hnlkMkEssj8YB+v5oW1sgpDZLw/RL904b+q92ob9X+f4tqJm04bpdSi6Zrbe4lIH7C
	 t8vlUk/mBD/nmvrInq6JkvtIaTH1R6bqJADZmHHB0ta9AVoBz9S7nB2S+NZgcihALA
	 k9OuOfpRxotV/572BpKTpQuJVjcw1k1n04QcKZomBbX2AX0Zti1nEnfucpVOitYBWY
	 j2u9SyrQUxw7w==
Date: Tue, 21 Jan 2025 11:02:44 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org, 
	wefu@redhat.com, jassisinghbrar@gmail.com, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, frank.binns@imgtec.com, 
	matt.coster@imgtec.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, ulf.hansson@linaro.org, 
	jszhang@kernel.org, p.zabel@pengutronix.de, m.szyprowski@samsung.com, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Subject: Re: [RFC v3 05/18] pmdomain: thead: Add power-domain driver for
 TH1520
Message-ID: <20250121-mature-marigold-ammonite-b379d2@krzk-bin>
References: <20250120172111.3492708-1-m.wilczynski@samsung.com>
 <CGME20250120172125eucas1p141540607f423eea4c55b2bd22ff5adf0@eucas1p1.samsung.com>
 <20250120172111.3492708-6-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250120172111.3492708-6-m.wilczynski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_020248_070498_C9575F8B 
X-CRM114-Status: GOOD (  18.40  )
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

On Mon, Jan 20, 2025 at 06:20:58PM +0100, Michal Wilczynski wrote:
> The T-Head TH1520 SoC contains multiple power islands that can be
> programmatically turned on and off using the AON (Always-On) protocol
> and a hardware mailbox [1]. The relevant mailbox driver has already been
> merged into the mainline kernel in commit 5d4d263e1c6b ("mailbox:
> Introduce support for T-head TH1520 Mailbox driver");
> 
> This commit introduces a power-domain driver for the TH1520 SoC, which

Please do not use "This commit/patch/change", but imperative mood. See
longer explanation here:
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

> is using AON firmware protocol to communicate with E902 core through the
> hardware mailbox. This way it can send power on/off commands to the E902
> core.

...

> diff --git a/drivers/pmdomain/thead/Makefile b/drivers/pmdomain/thead/Makefile
> new file mode 100644
> index 000000000000..adfdf5479c68
> --- /dev/null
> +++ b/drivers/pmdomain/thead/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_TH1520_PM_DOMAINS)		+= th1520-pm-domains.o
> diff --git a/drivers/pmdomain/thead/th1520-pm-domains.c b/drivers/pmdomain/thead/th1520-pm-domains.c
> new file mode 100644
> index 000000000000..d913ad40fb76
> --- /dev/null
> +++ b/drivers/pmdomain/thead/th1520-pm-domains.c
> @@ -0,0 +1,174 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2021 Alibaba Group Holding Limited.
> + * Copyright (c) 2024 Samsung Electronics Co., Ltd.
> + * Author: Michal Wilczynski <m.wilczynski@samsung.com>
> + */
> +
> +#include <linux/firmware/thead/thead,th1520-aon.h>
> +#include <linux/slab.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
> +
> +#include <dt-bindings/firmware/thead,th1520-aon.h>

So here it is used... I don't understand why power domain is under
firmware. Please move it to proper directory and name the file exactly
the same as bindings doc which this belongs to.


> +
> +struct th1520_power_domain {
> +	struct th1520_aon_chan *aon_chan;
> +	struct generic_pm_domain genpd;
> +	u32 rsrc;
> +};
> +
> +struct th1520_power_info {
> +	const char *name;
> +	u32 rsrc;
> +};
> +
> +static const struct th1520_power_info th1520_pd_ranges[] = {
> +	{ "vdec", TH1520_AON_VDEC_PD },

Why TH1520_AON_XXX aren't the indices?

> +	{ "npu", TH1520_AON_NPU_PD },
> +	{ "venc", TH1520_AON_VENC_PD },
> +	{ "gpu", TH1520_AON_GPU_PD },
> +	{ "dsp0", TH1520_AON_DSP0_PD },
> +	{ "dsp1", TH1520_AON_DSP1_PD }
> +};

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
