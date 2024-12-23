Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3ECBE7718B
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Dec 2024 16:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TzbYXmCpmkC2kuuLyX/IjFIo+MJl8mVxWnSmm45TLeM=; b=flgxonH3msW4k2
	GO7XoNBvWorqG9mzp0xnXEKHxRS8Mw0lDXtAeSznIdEzml17BYpD8iO2iAJl1CTjI2C00d5GvYvGJ
	rgzMmN3gidTCdabMBDtgG9xEfrvAm5MH7KLNIiPV6H9y3UhRl4Vqz2NrGBcfrqLYqXu8+dB/LYM9M
	PEsCNdM0ePYvNuN7dF72zfmJbXr4K2zcwlLHB/dcXqHqu/YRtaZ5oj3CFVLARMZRqrf2OhCa+xnK7
	hb1VI+H8kDfzK82/mPpe89qVTYxiP7DzEGWEqzvHFzYDbdA9UueJJ9vWZEYL1QWTrmpttn6zwOach
	SXVOtJc81JXd7PiUnS6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPlAc-0000000ANBV-0xDR;
	Mon, 23 Dec 2024 16:20:38 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPlAZ-0000000ANB5-0FOS
	for linux-riscv@lists.infradead.org;
	Mon, 23 Dec 2024 16:20:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1E5DAA40E68;
	Mon, 23 Dec 2024 16:18:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30517C4CED3;
	Mon, 23 Dec 2024 16:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734970833;
	bh=7wlSzIwoKKWjdoIdeSM+QZG2X3+f0y+yiHRgSv58THs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sxWdDGj9YSbSC1WBGRHWSYTewVb+ZPldkEqXL4vM0AeJanifQ2kPqdckE167NKRSp
	 BAqUhuEMso39C17m4XHtWbP8liF5eHdJ0J9ogSBNaH0JLipvAdqt6iP++V8GPkXXPm
	 ChDcNNSnqCgQaN1+pa0Powj6NdZ2JGSRTeMB2PWtrFi2aGB7jTxriC0ezwoGCfCBGf
	 zznf9hJEC44mQQR3/4kfgoz4U1kZRT9czeYjZj0Q8aDocDLE4OAJdZu91Wf0GGgbeY
	 hc9KhMPinfbswIRvYIrNPwETK2JC1M2dXh816N8lVO6by0Po3LPm9icsogHV/wFdoP
	 fPd38yk0QnD+Q==
Message-ID: <902bfbef-7ebd-4397-b229-86611e65f4fa@kernel.org>
Date: Mon, 23 Dec 2024 17:20:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 06/19] soc: thead: power-domain: Add power-domain
 driver for TH1520
To: Michal Wilczynski <m.wilczynski@samsung.com>, mturquette@baylibre.com,
 sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 drew@pdp7.com, guoren@kernel.org, wefu@redhat.com, jassisinghbrar@gmail.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 frank.binns@imgtec.com, matt.coster@imgtec.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, ulf.hansson@linaro.org,
 jszhang@kernel.org, p.zabel@pengutronix.de, m.szyprowski@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
References: <20241223125553.3527812-1-m.wilczynski@samsung.com>
 <CGME20241223125608eucas1p25f0be9eb6fb7ab906f942201560dd881@eucas1p2.samsung.com>
 <20241223125553.3527812-7-m.wilczynski@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20241223125553.3527812-7-m.wilczynski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_082035_241344_BA15E070 
X-CRM114-Status: GOOD (  20.13  )
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

On 23/12/2024 13:55, Michal Wilczynski wrote:
> The T-Head TH1520 SoC contains multiple power islands that can be
> programmatically turned on and off using the AON (Always-On) protocol
> and a hardware mailbox [1]. The relevant mailbox driver has already been
> merged into the mainline kernel in commit 5d4d263e1c6b ("mailbox:
> Introduce support for T-head TH1520 Mailbox driver");
> 
> This commit introduces a power-domain driver for the TH1520 SoC, which
> is using AON firmware protocol to communicate with E902 core through the
> hardware mailbox. This way it can send power on/off commands to the E902
> core.
> 
> Link: https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf [1]
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>

Please use subject prefixes matching the subsystem. You can get them for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

E.g.
pmdomain: thead: Add driver for TH1520 AON


> ---
>  MAINTAINERS                                |   1 +
>  drivers/pmdomain/Kconfig                   |   1 +
>  drivers/pmdomain/Makefile                  |   1 +
>  drivers/pmdomain/thead/Kconfig             |  12 ++
>  drivers/pmdomain/thead/Makefile            |   2 +
>  drivers/pmdomain/thead/th1520-pm-domains.c | 181 +++++++++++++++++++++
>  6 files changed, 198 insertions(+)
>  create mode 100644 drivers/pmdomain/thead/Kconfig
>  create mode 100644 drivers/pmdomain/thead/Makefile
>  create mode 100644 drivers/pmdomain/thead/th1520-pm-domains.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 42aef66bd257..173eeaf3bbe8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20200,6 +20200,7 @@ F:	drivers/firmware/thead,th1520-aon.c
>  F:	drivers/mailbox/mailbox-th1520.c
>  F:	drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
>  F:	drivers/pinctrl/pinctrl-th1520.c
> +F:	drivers/pmdomain/thead/
>  F:	include/dt-bindings/clock/thead,th1520-clk-ap.h
>  F:	include/linux/firmware/thead/thead,th1520-aon.h
>  
> diff --git a/drivers/pmdomain/Kconfig b/drivers/pmdomain/Kconfig
> index 23c64851a5b0..91f04ace35d4 100644
> --- a/drivers/pmdomain/Kconfig
> +++ b/drivers/pmdomain/Kconfig
> @@ -16,6 +16,7 @@ source "drivers/pmdomain/st/Kconfig"
>  source "drivers/pmdomain/starfive/Kconfig"
>  source "drivers/pmdomain/sunxi/Kconfig"
>  source "drivers/pmdomain/tegra/Kconfig"
> +source "drivers/pmdomain/thead/Kconfig"
>  source "drivers/pmdomain/ti/Kconfig"
>  source "drivers/pmdomain/xilinx/Kconfig"
>  
> diff --git a/drivers/pmdomain/Makefile b/drivers/pmdomain/Makefile
> index a68ece2f4c68..7030f44a49df 100644
> --- a/drivers/pmdomain/Makefile
> +++ b/drivers/pmdomain/Makefile
> @@ -14,6 +14,7 @@ obj-y					+= st/
>  obj-y					+= starfive/
>  obj-y					+= sunxi/
>  obj-y					+= tegra/
> +obj-y					+= thead/
>  obj-y					+= ti/
>  obj-y					+= xilinx/
>  obj-y					+= core.o governor.o
> diff --git a/drivers/pmdomain/thead/Kconfig b/drivers/pmdomain/thead/Kconfig
> new file mode 100644
> index 000000000000..3b61e92dde43
> --- /dev/null
> +++ b/drivers/pmdomain/thead/Kconfig
> @@ -0,0 +1,12 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config TH1520_PM_DOMAINS
> +	tristate "Support TH1520 Power Domains"
> +	depends on TH1520_AON_PROTOCOL || COMPILE_TEST


What sort of dependency is this? Looks build time, but you miss handling
modules. You might need: https://lwn.net/Articles/944368/

Test if it really builds if TH1520_AON_PROTOCOL is a module.

> +	select REGMAP_MMIO
> +	help
> +	  This driver enables power domain management for the T-HEAD
> +	  TH-1520 SoC. On this SoC there are number of power domains,
> +	  which can be managed independently. For example GPU, NPU,
> +	  and DPU reside in their own power domains which can be
> +	  turned on/off.
> diff --git a/drivers/pmdomain/thead/Makefile b/drivers/pmdomain/thead/Makefile
> new file mode 100644
> index 000000000000..adfdf5479c68

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
