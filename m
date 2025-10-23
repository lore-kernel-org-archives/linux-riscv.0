Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2952CCD193
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 04:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zd1TtyGgHWB4UUMErHRhkB7+vicjx+CriZn7mYyGKLk=; b=WkaBezxXx58e4M
	kY8ggZ9XfPDYR66SLriaTgZ06qB316z+Y0+/bdRA7pXAAxumJjVwowACpcIi8SArBtXGnGDnz91xc
	4dNbfaRbGJHqKUzdVUTLFKzgNMgqYppdNWw96aKKgTYQEVVCg8oiRKBDLqQzvBIx3Rz88bLhvIwyO
	a5qWriZoWAEA9Zplf8lJ9qITEv9zCL+nanIH1SFJl55C21+46FFeapbNUIjOPxg8NhUyezDZxEokF
	drj3wKB1ThqXg1kXEKAJzF4uLfE2cbZ8r60se1K+dbdS3svAiLZgIcV2qSXwdZs+OoKGhwlo70ZGT
	MnlStH7Sup34j0gIQITA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBmZ8-00000004zyG-0OTF;
	Thu, 23 Oct 2025 04:04:42 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBmZ5-00000004zxY-3pLm
	for linux-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 04:04:41 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-63bea08a326so425697a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 22 Oct 2025 21:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1761192277; x=1761797077; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HHSZMDPvtfAX1xsUrEgKm9tbChBih95VIvPG69sbWIA=;
        b=U7Wr75ScnVoXKODGzgj50UNTurzzN2o+vQuH+7LZop9qrd6cmNpFbpi37+yu2pviT/
         4nzWlCcn9I6cPmQz6Fe2k2ic0GIg2tJDpUHuPAUpyVf0kpphdPD4kMfr7En/plHN/7li
         ejfA1SuEdb+boLXMGZpefLZOXmsMSsCsTICIiDesOVo/ipJ+dkXX5WwtF/Gi4nN3M8ax
         nIjJskSN6gZX4o9VlAmxm67/mS99vP9Km1mEJTo6gW20nlYLLJIVBU40nqIYPZrbP/wb
         Qyzbued50PWQXcldh7GH7ux5mfO1UXseFNK37FBjMUTBHc1xUCDwRUO9pDH4e7K5O6Gx
         SnjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761192277; x=1761797077;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HHSZMDPvtfAX1xsUrEgKm9tbChBih95VIvPG69sbWIA=;
        b=uzDESnMgA+lIbvSLgpdEKI/bH1CDb8geKUMHUomY90NG6hX1VV+z9/MlE4kmWYJcOr
         JsTU4OO96Jwf/OfwMUmSc7lHhuSdvIeV0T0E0LhTe8Fw5B5riElssmAp3hVTw6jh18rc
         hW9m7OSVzzmGWFGaM/t0yfG9TbHysCvXhcyB9V3eJAzoG478kfTbtB4GYIpTIUcqNSK/
         fSqY+Jg7Z9PEj/ZqTp32GLhRZ4AuMWGLB+FAs6/X7ndcK0khiHEVGP8VH7Vdq+PHwIk/
         /lrmJrgf87fTMtv/XFNmOj2Yo9QRPHRBdQDUvLc+0yxTqQ9JwralrK4IEPETC0wzsSwV
         QSEw==
X-Forwarded-Encrypted: i=1; AJvYcCWqmskkKlGrX9vJDjJn2PxxWerMtFBgGZj3tQWnylZth9kDTYDMGNTcx/6SssDjp++pDjhsrzM6KWCpMQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzSGt0MKezRccgE6ci5jIafc7lpSjE5zz75AiwkL3PuSuaolZqv
	hGCbdrz0Y7tda3PzbWH5cLQ6+FUSQomwLto26wUDRLaGCQj0XUoJqQFvG74MsSwMKo0=
X-Gm-Gg: ASbGncuefwUWfexmAIG3+EyHFADJxs9Y52XZDok8W1Jjio+F4shab5l2Pr/gL62FXhB
	l2EBAbgIH0ZmMpAr2TVKGJS2aYvm41mgEH2jNBe3ITu4ItmpdcXOSXxBT8Bj9BCKAoyuvY0QJbh
	cBY/lRTf+2VbNxv2QSpLMhk6r5y3g8+rDAoIie80woyekdSALVNtBsKEoojfsvuiZ5fVhHnPt2F
	fta08lF6h4xmEuUYvgDgENwECqs0V9cDDCqxVanqx9Zoyso6cWU6wS5vpeo88RiBde4dHZupK8W
	7plTW1iApY+flriESWQHJ04mcvLP9yopcU3FYTNLI8tsRuHU/kM5J8MRsE/exou9kS1VAQVtorZ
	0pfiU/vv8z0X6iHJ/L88fZ8fmQb7sUBejReGVDjFj8n9CgrNmr5ohmkQK8AbJJgfIY50/hXy444
	X34uNcKdlj
X-Google-Smtp-Source: AGHT+IGJiS3xjlcmck6jYeKg58UKDvZ1VJYr2SNmkONX0VTIjq/vCHDBgtScrL9mLTDQswuRHlg1UQ==
X-Received: by 2002:a50:c949:0:b0:637:e271:8071 with SMTP id 4fb4d7f45d1cf-63c1f6d5dd8mr18546472a12.27.1761192276905;
        Wed, 22 Oct 2025 21:04:36 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.151])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e3ebb3738sm579215a12.3.2025.10.22.21.04.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 21:04:35 -0700 (PDT)
Message-ID: <41dbea85-8aa1-4034-8106-e28c37e398b8@tuxon.dev>
Date: Thu, 23 Oct 2025 07:04:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/9] soc: microchip: add mfd drivers for two syscon
 regions on PolarFire SoC
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 pierre-henry.moussay@microchip.com, valentina.fernandezalanis@microchip.com,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251013-album-bovine-faf9f5ebc5d4@spud>
 <20251013-patient-matrimony-6162c8f92e2e@spud>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20251013-patient-matrimony-6162c8f92e2e@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_210440_123635_8705B896 
X-CRM114-Status: GOOD (  27.51  )
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

Hi, Conor,

On 10/13/25 20:45, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The control-scb and mss-top-sysreg regions on PolarFire SoC both fulfill
> multiple purposes. The former is used for mailbox functions in addition
> to the temperature & voltage sensor while the latter is used for clocks,
> resets, interrupt muxing and pinctrl.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  drivers/soc/microchip/Kconfig               | 13 ++++++
>  drivers/soc/microchip/Makefile              |  1 +
>  drivers/soc/microchip/mpfs-control-scb.c    | 45 +++++++++++++++++++
>  drivers/soc/microchip/mpfs-mss-top-sysreg.c | 48 +++++++++++++++++++++
>  4 files changed, 107 insertions(+)
>  create mode 100644 drivers/soc/microchip/mpfs-control-scb.c
>  create mode 100644 drivers/soc/microchip/mpfs-mss-top-sysreg.c
> 
> diff --git a/drivers/soc/microchip/Kconfig b/drivers/soc/microchip/Kconfig
> index 19f4b576f822..31d188311e05 100644
> --- a/drivers/soc/microchip/Kconfig
> +++ b/drivers/soc/microchip/Kconfig
> @@ -9,3 +9,16 @@ config POLARFIRE_SOC_SYS_CTRL
>  	  module will be called mpfs_system_controller.
>  
>  	  If unsure, say N.
> +
> +config POLARFIRE_SOC_SYSCONS
> +	bool "PolarFire SoC (MPFS) syscon drivers"
> +	default y
> +	depends on ARCH_MICROCHIP
> +	select MFD_CORE
> +	help
> +	  These drivers add support for the syscons on PolarFire SoC (MPFS).
> +	  Without these drivers core parts of the kernel such as clocks
> +	  and resets will not function correctly.
> +
> +	  If unsure, and on a PolarFire SoC, say y.
> +

This empty line could be dropped.

> diff --git a/drivers/soc/microchip/Makefile b/drivers/soc/microchip/Makefile
> index 14489919fe4b..1a3a1594b089 100644
> --- a/drivers/soc/microchip/Makefile
> +++ b/drivers/soc/microchip/Makefile
> @@ -1 +1,2 @@
>  obj-$(CONFIG_POLARFIRE_SOC_SYS_CTRL)	+= mpfs-sys-controller.o
> +obj-$(CONFIG_POLARFIRE_SOC_SYSCONS)	+= mpfs-control-scb.o mpfs-mss-top-sysreg.o
> diff --git a/drivers/soc/microchip/mpfs-control-scb.c b/drivers/soc/microchip/mpfs-control-scb.c
> new file mode 100644
> index 000000000000..d1a8e79c232e
> --- /dev/null
> +++ b/drivers/soc/microchip/mpfs-control-scb.c
> @@ -0,0 +1,45 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/array_size.h>

Looks like this one can be dropped or maybe you want to use
ARRAY_SIZE(mpfs_control_scb_devs) as 4th argument of mfd_add_devices().

> +#include <linux/of.h>
> +#include <linux/of_address.h>

Looks like this one can be dropped.

> +#include <linux/mfd/core.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/of_platform.h>

Same with this one?

> +#include <linux/platform_device.h>
> +
> +static const struct mfd_cell mpfs_control_scb_devs[] = {
> +	{ .name = "mpfs-tvs", },

I think you can use:

MFD_CELL_NAME("mpfs-tvs")

> +};
> +
> +static int mpfs_control_scb_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	int ret;
> +
> +	ret = mfd_add_devices(dev, PLATFORM_DEVID_NONE, mpfs_control_scb_devs,
> +			      1, NULL, 0, NULL);
> +	if (ret)
> +		return ret;
> +
> +	return 0;

You can use directly:

	return mfd_add_device(...);

> +}
> +
> +static const struct of_device_id mpfs_control_scb_of_match[] = {
> +	{.compatible = "microchip,mpfs-control-scb", },

This looks un-documented.

> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, mpfs_control_scb_of_match);
> +
> +static struct platform_driver mpfs_control_scb_driver = {
> +	.driver = {
> +		.name = "mpfs-control-scb",
> +		.of_match_table = mpfs_control_scb_of_match,
> +	},
> +	.probe = mpfs_control_scb_probe,
> +};
> +module_platform_driver(mpfs_control_scb_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Conor Dooley <conor.dooley@microchip.com>");
> +MODULE_DESCRIPTION("PolarFire SoC control scb driver");
> diff --git a/drivers/soc/microchip/mpfs-mss-top-sysreg.c b/drivers/soc/microchip/mpfs-mss-top-sysreg.c
> new file mode 100644
> index 000000000000..9b2e7b84cdba
> --- /dev/null
> +++ b/drivers/soc/microchip/mpfs-mss-top-sysreg.c
> @@ -0,0 +1,48 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/array_size.h>

Looks like this one can be dropped or maybe you want to use
ARRAY_SIZE(mpfs_mss_top_sysreg_devs) as 4th argument of mfd_add_devices()

> +#include <linux/of.h>
> +#include <linux/of_address.h>

Unused?

> +#include <linux/mfd/core.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/of_platform.h>

Unused?

> +#include <linux/platform_device.h>
> +
> +static const struct mfd_cell mpfs_mss_top_sysreg_devs[] = {
> +	{ .name = "mpfs-reset", },

MFD_CELL_NAME() ?

> +};
> +
> +static int mpfs_mss_top_sysreg_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	int ret;
> +
> +	ret = mfd_add_devices(dev, PLATFORM_DEVID_NONE, mpfs_mss_top_sysreg_devs,
> +			      1, NULL, 0, NULL);
> +	if (ret)
> +		return ret;
> +
> +	if (devm_of_platform_populate(dev))
> +		dev_err(dev, "Error populating children\n");

Is it OK return 0 above if there are failures here?

> +
> +	return 0;
> +}
> +
> +static const struct of_device_id mpfs_mss_top_sysreg_of_match[] = {
> +	{.compatible = "microchip,mpfs-mss-top-sysreg", },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, mpfs_mss_top_sysreg_of_match);
> +
> +static struct platform_driver mpfs_mss_top_sysreg_driver = {
> +	.driver = {
> +		.name = "mpfs-mss-top-sysreg",
> +		.of_match_table = mpfs_mss_top_sysreg_of_match,
> +	},
> +	.probe = mpfs_mss_top_sysreg_probe,
> +};
> +module_platform_driver(mpfs_mss_top_sysreg_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Conor Dooley <conor.dooley@microchip.com>");
> +MODULE_DESCRIPTION("PolarFire SoC mss top sysreg driver");


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
