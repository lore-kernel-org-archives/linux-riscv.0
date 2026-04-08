Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58FB9FD5F7F
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Apr 2026 06:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:Cc:To:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3GqAx3csrWsgKnOkwDXlYvOwcRx/oPxA4x3K4P12qg8=; b=cHmLhWrneU1ozG
	ggB9/OoNKQ2TNw17Uu0i2xS3x3Ig3GoLEGg7la9oT9z7VDS+FmykHD4fGBRqo6237aY1Pqju7siPt
	rmpVsu+JuZZn7zWiigfsw+yEz6fWTbUlokQ60o1WDjQkLCymXhyhUTEbJy0Zwt/DLrLeQRxuyWgSV
	nCtd92omt8UVSYO1ADi2k5R/tbEviyMmO4r4/TYsIDaarkHambZlc4Z3GddXylk7yUlgAmPt2tQ2+
	2pjCN5xBRek5W6TyvhH4GQiO/zhV33REgKdBs/Fk85b+iGsfCXVJjbvzdMQGUAB1RQFuBB6TJWucf
	R1S0R1n7WosAUVprmeYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAM5J-00000008K12-1OK8;
	Wed, 08 Apr 2026 06:08:17 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAM5F-00000008Jza-2Kia
	for linux-riscv@lists.infradead.org;
	Wed, 08 Apr 2026 06:08:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1775628415;
	bh=no1dg2bhGU2mzkCqgY19UTI25nEWspHV7sUY1GVTWhI=;
	h=Mime-Version:Date:Message-Id:From:To:Subject;
	b=SxXBYudOYE0oLS47kABmhjvAWTHk2t8bu3UJgbBHvTC+jrYky5L4UUHmGQk1t6ZIo
	 6n8vgt35uyVDjkfqCrMhQPR8+FyHYCwwtzpSU7/xnVySOX2PECzLqvfO++vHx9KZmG
	 vgGEk1B83QU10TUqN8WO9DbvsY+jgZsKnCeW+LUY=
X-QQ-mid: zesmtpgz1t1775628413t4a8fe448
X-QQ-Originating-IP: QkEPQATJLhwf83tFudRqpareIp2YizfiakDOlTwdVtg=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 08 Apr 2026 14:06:51 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5636326700936019550
EX-QQ-RecipientCnt: 19
Mime-Version: 1.0
Date: Wed, 08 Apr 2026 14:06:51 +0800
Message-Id: <DHNJQN4PPTH8.MEVXM2TL2MT7@linux.spacemit.com>
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Sandie Cao" <sandie.cao@deepcomputing.io>, "Yixun Lan"
 <dlan@kernel.org>, "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Cc: "Conor Dooley" <conor+dt@kernel.org>, "Emil Renner Berthing"
 <kernel@esmil.dk>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Paul Walmsley" <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Heinrich Schuchardt" <heinrich.schuchardt@canonical.com>, "Michael
 Opdenacker" <michael.opdenacker@rootcommit.com>, "Guodong Xu"
 <guodong@riscstar.com>, "Hendrik Hamerlinck"
 <hendrik.hamerlinck@hammernet.be>, "Yangyu Chen" <cyy@cyyself.name>,
 <spacemit@lists.linux.dev>, <linux-riscv@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] riscv: dts: spacemit: add DeepComputing FML13V05
 board device tree
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260407055557.1202713-1-sandie.cao@deepcomputing.io>
 <20260407055738.1202750-1-sandie.cao@deepcomputing.io>
In-Reply-To: <20260407055738.1202750-1-sandie.cao@deepcomputing.io>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Mo0XQZ8Jr/+fG8Nw/IerivJXsRB8pfi9mbzXyaN077kf8joeF0Efm4oS
	M2w1vQPhJH8e3YPJZsrj3wf5GxoSuZKSR6alQYZEGt/PwJ0w0OpCgJd3BU/gCtpGN/YzZBd
	9SDipZxARkyJqihUuXrLnVpTGnzCt7u2jrUCOL92VgJjaimiCINzo1/sqtyi9X6g3gvL9Kl
	nUVCpa0IDWFZM3RrTkOfQWyzPLfJ0TAPXHfz2SueWVW6UcAGpEHwJ+mf6OMTGfPJmETjDvN
	Acl3D+pkoF/Og3FVQphYTAZbPZ4ldfKD7Lh2IB5Qv/5pSbGfR0Cn8eiz9+rBd7sPsgJibDC
	BBM0bWMd0Z/0nDM6LIVPea9fBXqP2rms6pSBRnIl8cKtw6dl70N5sJkA7iWZjXkg2AAiLIA
	gsy+oXYQm7jBSg/nV1aDCrcXCg/NpJgtUravDCtbs36woXc3tgxwuS9exP7wQzw6ItSHl1J
	ddH8bfW3kWexl1kKGJSbVFncIv9iigwzJRPC2ky7rtaJ1koavXoDBe9sm/EiyROEUjvmrz/
	XtbxAIv6rT67loF+tx3LdjmMzUXZDiLD4+ulfEEc3lZJ8nDfU58MguJTUCAD20JeSmXZsS2
	95kp2S8LMnOeCMSdcsh0CAwbwww8tph4qVmgRu4IyHbrOfjXeBlL8o189qGk7iI2ZAzOO0W
	NZ1sNa4DbLx+DrcINa73NaLNVUaGfv4mi6eAgd2Ac2TYiBjBvXAfpj/N+QGefu/o7wS3dJ2
	Nt4W2bFyi0hgDTkcFTK+NEkxnzFbP8GTvoV4NYxMxcTk6H0IG+3nXZbLpjyDfBt9nXxBRr3
	ZokHtJUbAlD7Fw0PyS8FNMcMNJA9bosFZu2TcSNHSTDIYHCa/C0s6PUhRUd6lEtMjRrp9Fo
	6x8PIqxuFeaa4QHhqVDlaB3+CbwQV8rlYO+u2OYNTkxzUS+DpyEeZ4JQn4ygiPV21W+Icm8
	72dY4UVDCh81ANIHIfOn1fBAr3SuboRWGBV0AQgVeAx+W7cOEZ9KQRMIsgm76WmgJ3aBrzS
	CBnY7BfjOXwoJXKcXvm5hd7ez0MRHOPnwkJNl8+5uZsFYzX+OlNzkLv4Y7w0Vlbt3LQrx6p
	7fiX4QkL+f0kN8RKUKoO6OC7xFEL8EGeWXhqxn5v8aLIX1u/mDvIfN2IMQ9PxwmPQ==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_230814_201305_50C14B2A 
X-CRM114-Status: GOOD (  12.97  )
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

On Tue Apr 7, 2026 at 1:57 PM CST, Sandie Cao wrote:
> The FML13V05 board from DeepComputing incorporates a SpacemiT K3 RISC-V
> SoC.It is a mainboard designed for the Framework Laptop 13 Chassis,
> which has (Framework) SKU FRANHQ0001.
>
> The FML13V05 board features:
> - SpacemiT K3 RISC-V SoC
> - LPDDR5 16GB or 32GB
> - eMMC 32GB ~128GB (Optional)
> - UFS 3.1 256G (Optional)
> - QSPI Flash
> - MicroSD Slot
> - PCIe-based Wi-Fi
> - 4 USB-C Ports
>  - Port 1: PD 3.0 (65W Max), USB 3.2 Gen 1
>  - Port 2: PD 3.0 (65W Max), USB 3.2 Gen 1, DP 1.4 (4K@60Hz)
>  - Port 3 & 4: USB 3.2 Gen 1
>
> This minimal device tree enables booting into a serial console with UART
> output.
>
> Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
> ---
>  arch/riscv/boot/dts/spacemit/Makefile         |  1 +
>  .../spacemit/k3-deepcomputing-fml13v05.dts    | 31 +++++++++++++++++++
>  2 files changed, 32 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
>
> diff --git a/arch/riscv/boot/dts/spacemit/Makefile b/arch/riscv/boot/dts/spacemit/Makefile
> index 7e2b87702571..acb993c452ba 100644
> --- a/arch/riscv/boot/dts/spacemit/Makefile
> +++ b/arch/riscv/boot/dts/spacemit/Makefile
> @@ -4,4 +4,5 @@ dtb-$(CONFIG_ARCH_SPACEMIT) += k1-milkv-jupiter.dtb
>  dtb-$(CONFIG_ARCH_SPACEMIT) += k1-musepi-pro.dtb
>  dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-r2s.dtb
>  dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-rv2.dtb
> +dtb-$(CONFIG_ARCH_SPACEMIT) += k3-deepcomputing-fml13v05.dtb
>  dtb-$(CONFIG_ARCH_SPACEMIT) += k3-pico-itx.dtb
> diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> new file mode 100644
> index 000000000000..783066fc7ad7
> --- /dev/null
> +++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> @@ -0,0 +1,31 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2024 DeepComputing (HK) Limited
                    ^^^^
Just like Yixun said, it needs to cover this year.

                          - Troy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
