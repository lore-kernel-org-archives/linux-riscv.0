Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0637DC36000
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 16:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mnrd5kvaqKdqKKkZ5Nfbcq8tPoIPDKRKZWzzzQDoEzk=; b=TSlvxENcpnmEI/
	cNVqer4aJ/tgy4efbysLCN/3CtsoWHr/2oei8dBXmk0SbFiOOeezVGwJ4z2zThqOZiK2uGd8F4K4T
	dij+uNF3oTo11ZwQiIUdD2eV19p6CSwYnhiKUsFCLrEipluJEURboHxpphgqS+vsgii2PXS/EXuI5
	2Uz8opW5sppqITP1RFSiJnpnQClbZH3f2BtV6DY2e4JcTWSX8KDbO8dSBzl9cGAUfwTPlZcjmbwoq
	sHpLOe87xvFt21mNBaIlScNPwqKpm1yTHKv7x5Bcq7lj5L/KlSI4JjsU8qRAeV9k04Ko3yj0Zin0V
	BXcCwI5pOzlMxZj2+Xuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvfaZ-0000000FaWG-2ktZ;
	Fri, 21 Mar 2025 16:51:19 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvfaW-0000000FaV1-1OeG
	for linux-riscv@lists.infradead.org;
	Fri, 21 Mar 2025 16:51:17 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-85e14ce87ceso67358439f.1
        for <linux-riscv@lists.infradead.org>; Fri, 21 Mar 2025 09:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742575875; x=1743180675; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pzK1WGYHzNSQEzJMM5cCsywytwS/BE8E1AY6ka1PBNQ=;
        b=lkAHPjEdXZQleOCRcCswbAJXF0cF/j5WuOlU6ErmcTZSE9pQem/h3eTxT9RnpTIl4v
         Yvcjss4VLRa8iVUgrk+kYbBQKE2kj8jHVXcnI3DnGmVPf7ac+0pT7nzoHSPODNg5Drjm
         BoowQHvNUi3hsMHhKM2JZfnfOYcP6eu25QkACXi0SqkvMAUJfEtKCz6PjqS9nqKpsN/t
         kYvH/vpDuJQ1mi0gXY9hzL3cs389hM+JWzkU5ojRD2+QOHn+tOTg2a7ON96m1hDevb5R
         Jtublx4qb5ykjEWh3drqJ20kV8Jw31Zt7wNogRffTdRE6eOZYKwgzj7zmSdo7BeAoOrH
         qctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742575875; x=1743180675;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pzK1WGYHzNSQEzJMM5cCsywytwS/BE8E1AY6ka1PBNQ=;
        b=OSAFr+JQKL9I20il4PC6vQdIURs8A49fplqFSZbGxCT+YYXYNAhTJR0c41bq9bG35o
         PVnZOF7ETGavKHPdh2by6Vo7YRdw4Dw+915FbA6Rpkxvcy+iV5/eRKc0QDN3bFO4DtFN
         N2nHE/U16winarK4xFBoNNi4gXPpoRbKkfPMtuzvWvHOc0SCdluBYDwVHA02sDIqAAF6
         jCKhEuUVNmr6Kil+3f3+j/9+NNFWppL9QDoGbpseEe2iYdmImU72M+uy2PzwSXczFYz6
         bNLMxrOrpB+29gysw3++2t+Nkf6MJJkSZXl1CrV6Mk4BezAt9UVpSxE29gx3jzJQNtI4
         q1zg==
X-Forwarded-Encrypted: i=1; AJvYcCUAPlotGIwbUCAg4fQSlt2zh2hFfRajrbmOeh3iComDMDgfL3sj8vxUw7wiy3IlKXVQcL3JYfP1nEk6kw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzjFGB52Ee49fXcryAD9Vv7IEDoZWKLDuUrmx8ZJ2JAZ8NtngBX
	f2r5BqG6EcBRoylWy2AQEY68bT0AcaihkGH+7YP50a6EKYLA15NvDUgVar6r7nk=
X-Gm-Gg: ASbGncuuXMWNkvy61l+Y0UbtSJUP+1P5/a59sZYh6rDNmtImQrqKl5uEjNxNPgfa8uT
	4GK2BYeKy5g4ytMsNjrb845F/nY2x0NQb9pyNuRzamcPlKXz76D+o77mHDIeeMTNZTbqB1Kji3M
	e7Zk1PEeqA+91BV7Ta3kCRfbzIJHAhyIdZFqekPGVIW4F5aoAJzrn2+tv1SLxhqncz154U9pJ6W
	KvYy6QGSRI7XZjWJxIXQFpJoiv68M/cf74V3FroMj2e9lss64PIM9eBmHHYW7Bgkjr5kTO01QNy
	EAYo73sCh+M1CTuJ2LCDNBdSVLP1Of/ycoSwc24vFENSwhEHbyhml4VOaupa7Vr0lQoYC9dWTNt
	2BY0Ws+yxwwE6wZbPiw==
X-Google-Smtp-Source: AGHT+IH20L7xZ9FbSSWQT43kyWkhTGHjv6LRqusofBtW84SCRx5VKyrgNItG2BhiTqAgVRCVgxE9tA==
X-Received: by 2002:a05:6602:6a89:b0:85b:4cb9:5cf6 with SMTP id ca18e2360f4ac-85e2bc71838mr361639039f.0.1742575875339;
        Fri, 21 Mar 2025 09:51:15 -0700 (PDT)
Received: from [10.211.55.5] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-85e2bc13d74sm45863839f.11.2025.03.21.09.51.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 09:51:14 -0700 (PDT)
Message-ID: <b0583550-eb2c-4918-b9e7-7041d3fd2e9e@riscstar.com>
Date: Fri, 21 Mar 2025 11:51:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/2] mmc: sdhci-of-k1: add support for SpacemiT K1 SoC
To: Yixun Lan <dlan@gentoo.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250213-20-k1-sdhci-v1-0-1f4362a980cd@gentoo.org>
 <20250213-20-k1-sdhci-v1-2-1f4362a980cd@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250213-20-k1-sdhci-v1-2-1f4362a980cd@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_095116_647637_6A8375F3 
X-CRM114-Status: GOOD (  22.71  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2/13/25 4:58 AM, Yixun Lan wrote:
> The SDHCI controller found in SpacemiT K1 SoC features SD,
> SDIO, eMMC support, such as:
> 
> - Compatible for 4-bit SDIO 3.0 UHS-I protocol, up to SDR104
> - Compatible for 4-bit SD 3.0 UHS-I protocol, up to SDR104
> - Compatible for 8bit eMMC5.1, up to HS400
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>

Why is this RFC? Have you tested it?

I have a few minor comments but this seems reasonable to me.

> ---
>   drivers/mmc/host/Kconfig       |  14 ++
>   drivers/mmc/host/Makefile      |   1 +
>   drivers/mmc/host/sdhci-of-k1.c | 320 +++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 335 insertions(+)

. . .

> +#define SDHC_PHY_DLLCFG			0x168
> +#define  DLL_PREDLY_NUM			0x04
> +#define  DLL_FULLDLY_RANGE		0x10
> +#define  DLL_VREG_CTRL			0x40
> +#define  DLL_ENABLE			0x80000000
> +#define  DLL_REFRESH_SWEN_SHIFT		0x1C
> +#define  DLL_REFRESH_SW_SHIFT		0x1D
> +
> +#define SDHC_PHY_DLLCFG1		0x16C
> +#define  DLL_REG2_CTRL			0x0C
> +#define  DLL_REG3_CTRL_MASK		0xFF

As Adrian said, please use GENMASK() (or BIT()) to define
these masks, and FIELD_GET() or similar to manipulate them.
I prefer lower-case hex digits too.

> +#define  DLL_REG3_CTRL_SHIFT		0x10
> +#define  DLL_REG2_CTRL_MASK		0xFF
> +#define  DLL_REG2_CTRL_SHIFT		0x08
> +#define  DLL_REG1_CTRL			0x92
> +#define  DLL_REG1_CTRL_MASK		0xFF
> +#define  DLL_REG1_CTRL_SHIFT		0x00
> +
> +#define SDHC_PHY_DLLSTS			0x170
> +#define  DLL_LOCK_STATE			0x01
> +
> +#define SDHC_PHY_DLLSTS1		0x174
> +#define  DLL_MASTER_DELAY_MASK		0xFF
> +#define  DLL_MASTER_DELAY_SHIFT		0x10
> +
> +#define SDHC_PHY_PADCFG_REG		0x178
> +#define  RX_BIAS_CTRL			BIT(5)
> +#define  PHY_DRIVE_SEL_MASK		0x7
> +#define  PHY_DRIVE_SEL_DEFAULT		0x4
> +
> +struct spacemit_sdhci_host {
> +	struct clk *clk_core;
> +	struct clk *clk_io;
> +};
> +

I don't think the next few functions add any real value.

Just call sdhci_writel() and sdhci_readl() directly.  It
might even take fewer characters (but above all, I think
it's clearer without the function hiding what's done).

> +static inline void spacemit_sdhci_setbits(struct sdhci_host *host, u32 val, int reg)
> +{
> +	sdhci_writel(host, sdhci_readl(host, reg) | val, reg);
> +}
> +
> +static inline void spacemit_sdhci_clrbits(struct sdhci_host *host, u32 val, int reg)
> +{
> +	sdhci_writel(host, sdhci_readl(host, reg) & ~val, reg);
> +}
> +

This too, just open-code this function in the two places it's used.

> +static inline void spacemit_sdhci_clrsetbits(struct sdhci_host *host, u32 clr, u32 set, int reg)
> +{
> +	u32 val = sdhci_readl(host, reg);
> +
> +	val = (val & ~clr) | set;
> +	sdhci_writel(host, val, reg);
> +}
> +
> +static void spacemit_sdhci_reset(struct sdhci_host *host, u8 mask)
> +{
> +	struct platform_device *pdev;
> +

. . .

> +	udelay(5);
> +
> +	spacemit_sdhci_setbits(host, PHY_FUNC_EN | PHY_PLL_LOCK, SDHC_PHY_CTRL_REG);
> +}
> +

I don't feel as strongly about this, but...

Here too, what the next function does is very typical and all
of it could go in the probe function.  I do understand that it
groups the clock-related code though.

But aside from that, I think assigning pltfm_host->clock could
be done in the probe function rather than hiding it in here.

> +static inline int spacemit_sdhci_get_clocks(struct device *dev,
> +					    struct sdhci_pltfm_host *pltfm_host)
> +{
> +	struct spacemit_sdhci_host *sdhst = sdhci_pltfm_priv(pltfm_host);
> +
> +	sdhst->clk_core = devm_clk_get_enabled(dev, "core");
> +	if (IS_ERR(sdhst->clk_core))
> +		return -EINVAL;
> +
> +	sdhst->clk_io = devm_clk_get_enabled(dev, "io");
> +	if (IS_ERR(sdhst->clk_io))
> +		return -EINVAL;
> +
> +	pltfm_host->clk = sdhst->clk_io;
> +
> +	return 0;
> +}
> +
> +static const struct sdhci_ops spacemit_sdhci_ops = {
> +	.get_max_clock		= spacemit_sdhci_clk_get_max_clock,
> +	.reset			= spacemit_sdhci_reset,
> +	.set_bus_width		= sdhci_set_bus_width,
> +	.set_clock		= spacemit_sdhci_set_clock,
> +	.set_uhs_signaling	= spacemit_sdhci_set_uhs_signaling,
> +};
> +

I think you should make the next structure be used as platform
data for "spacemit,k1-sdhci", rather than just a global.  That
way you could conceivably use the same driver with slightly
different (or even the same) quirks for future hardware.

					-Alex

> +static const struct sdhci_pltfm_data spacemit_sdhci_k1_pdata = {
> +	.ops = &spacemit_sdhci_ops,
> +	.quirks = SDHCI_QUIRK_DATA_TIMEOUT_USES_SDCLK |
> +		  SDHCI_QUIRK_NO_ENDATTR_IN_NOPDESC |
> +		  SDHCI_QUIRK_32BIT_ADMA_SIZE |
> +		  SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN |
> +		  SDHCI_QUIRK_BROKEN_CARD_DETECTION |
> +		  SDHCI_QUIRK_BROKEN_TIMEOUT_VAL,
> +	.quirks2 = SDHCI_QUIRK2_BROKEN_64_BIT_DMA |
> +		   SDHCI_QUIRK2_PRESET_VALUE_BROKEN,
> +};
> +. . .

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
