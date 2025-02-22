Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD3CC021B5
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Feb 2025 00:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/S4oMzKo54HihBfLyyk2QfM/yLfmopuRF8MfDLXsK44=; b=4xeBoM6kV1RsDl
	cH4olGVdMH2g9O8Ig4ejUxJ5+zzPpZ60fSNJi6KYwmC++YlVFsa62bfpkVBGZweE7iOdi8NGKEvyg
	9LIlngvh+C1uplI2tjx974mxg3+AF8vJ/9wUrDM8Kb175ENA2pIOYD+iAgl+IhKAEh+3It3sdJ0lo
	cQ9q23rjEM+3BFrmLVwQsAmx7JvHklKoYD/6U/mPErvpE1PCsjtYGVBnnkpzAqqNY2vGYTXTOJm4U
	OQvCtbUhYAgu6ocs3i3Q3yWEEPFBUiD7w0LaP7dP7ab34oG06TB2J8BIHK+7Z5Qi8sCTkj3vh4HAY
	w+OJ3jsifMmQG9q0jgHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tldPY-00000007Df6-168f;
	Sat, 22 Feb 2025 00:30:28 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tldPV-00000007DeE-3JBb
	for linux-riscv@lists.infradead.org;
	Sat, 22 Feb 2025 00:30:26 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-6e6719e6e82so21825706d6.2
        for <linux-riscv@lists.infradead.org>; Fri, 21 Feb 2025 16:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740184222; x=1740789022; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5jZqoRf6sss+7D2DNzyKiOZnwgWa7edWmqX7FcgvgLo=;
        b=jtkk2w+R+oNq1al4Rbs0G+1H+mfHaV/57+Y0HX7CeEZnMneLjMhxVbDLQmJR+8gMb9
         6pfWnuvqxiNZ4lU40BNUZY7OYAkJejzMLLcMRotbkD+Amx2dofHjDsKmbVexL/mtkbCh
         YlilTT20yrwXzvS1iZ4q0nzfybfjsymAkzptnWju3KJIdCdpNStVtYHvA1FX9/8usqKk
         +a0EgMaLUbo5UOxjvYZwNsh6LfRCztJrnowz/doq1M2Pe0AqCOSuuWybk8CrUOOyFT+I
         vNcjWbVGUMPgGv0VEdlBfkmmNVk1BmFaYiUlYDoZA3sQugHDLpW8lcWCSUcZIYbcRBga
         pqQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740184222; x=1740789022;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5jZqoRf6sss+7D2DNzyKiOZnwgWa7edWmqX7FcgvgLo=;
        b=GC3HL4GAIftEYs3gdnnaGGvCIfysI6SskaBQPeoVdVcSFj9mkKy/3boGlAK5BC1zEZ
         cCa8snpBIH0D9yyOQOIDXCfumPu4G1Flwb0nW8f33sYRa8WRWjVCV7NIDSpPgtEbEkAr
         9Ln7qnx3ZxXclSm0V1ttg4IZjOiefR3Vszmw/KFMiQ5Y13jWIZWcD2ocrD4jD4htxKZg
         LTGH0/0rm7c+ZFSY8VabR7QU2JdfhEG5RO+k101FS95opEnZBxxzlYMh6BnCPQxtBCdB
         8NiHbXRlJuv0mFfcV60UOjdmzqPNdoLX0cJ6u/rVJ8RZKTW/mGQEBShl+G+CWuHqlN+q
         iNlg==
X-Forwarded-Encrypted: i=1; AJvYcCXoX76sfjeZzWMCEQH4GCS/587S9JtKm71Zukb6SZR5ZvjLdcl3bSUYAVfwjHxCdv8x0V7dbPNV0MRm2Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy731ulIC1lJkxQxhjY6xZKWgjpL2nm+VHRYw0RewLDJSDdRhPq
	c2RZz9nSYHIzhd2P4Q7bm+W4g/LXg6gS8awbs+V3V9csArEXXYOS
X-Gm-Gg: ASbGncuaXg4eq3g+2nqY4MTjyYEIpqC1QXKxnkIEORlXAiwaaLE6Cxz5Wlr/JBsKk/7
	3HzYM8ss8YavIHGzePTo9C7vQrARK6PnW7EQdJkjxAxeUa3TiwsWpxqvtq/2TESXpInh4oRn9Mp
	lIY7i6f8emjSI0xKWQt/2cdOML+utbUwvxl6kMLy6Lau/wr9aWYyRfX8PM3JO/Cdpn+X5g6maEX
	GhuQlE6Vdg/aFTyCwZVZ77NLNw/vy27+xsAFTq/6VPO+30jRXMbTWXc5utWBPn1amoTeAemvUON
	9g==
X-Google-Smtp-Source: AGHT+IGzSztHttj2eqWBMxKIMx7sJIW+3HS3UjtU9KRJWKyCjr0SAYSd6roWKk1avtZ7VxOsb59iBA==
X-Received: by 2002:a05:6214:d65:b0:6e4:2f90:a9ca with SMTP id 6a1803df08f44-6e6b0036108mr76427546d6.3.1740184222448;
        Fri, 21 Feb 2025 16:30:22 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c0a71326b4sm586886485a.4.2025.02.21.16.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 16:30:21 -0800 (PST)
Date: Sat, 22 Feb 2025 08:30:04 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
	Inochi Amaoto <inochiama@gmail.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Niklas Cassel <cassel@kernel.org>, Shashank Babu Chinta Venkata <quic_schintav@quicinc.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/2] PCI: sophgo-dwc: Add Sophgo SG2044 PCIe driver
Message-ID: <sbvui5ezehqtfxttga62jlkyzytnwq4fzra3kxfmbmqtxigfyx@zuzs2hcaymmv>
References: <20250221013758.370936-1-inochiama@gmail.com>
 <20250221013758.370936-3-inochiama@gmail.com>
 <d31a48ebfc0f91de615af75e313caa6afbdd597d.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d31a48ebfc0f91de615af75e313caa6afbdd597d.camel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_163025_825050_06E81580 
X-CRM114-Status: GOOD (  19.28  )
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

On Fri, Feb 21, 2025 at 10:07:54AM +0100, Philipp Zabel wrote:
> On Fr, 2025-02-21 at 09:37 +0800, Inochi Amaoto wrote:
> > Add support for DesignWare-based PCIe controller in SG2044 SoC.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  drivers/pci/controller/dwc/Kconfig          |  10 +
> >  drivers/pci/controller/dwc/Makefile         |   1 +
> >  drivers/pci/controller/dwc/pcie-dw-sophgo.c | 282 ++++++++++++++++++++
> >  3 files changed, 293 insertions(+)
> >  create mode 100644 drivers/pci/controller/dwc/pcie-dw-sophgo.c
> > 
> [...]
> > diff --git a/drivers/pci/controller/dwc/pcie-dw-sophgo.c b/drivers/pci/controller/dwc/pcie-dw-sophgo.c
> > new file mode 100644
> > index 000000000000..a4ca4f1e26e0
> > --- /dev/null
> > +++ b/drivers/pci/controller/dwc/pcie-dw-sophgo.c
> > @@ -0,0 +1,282 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * PCIe host controller driver for Sophgo SoCs.
> > + *
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/irqchip/chained_irq.h>
> > +#include <linux/irqdomain.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/module.h>
> > +#include <linux/phy/phy.h>
> > +#include <linux/property.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +#include <linux/reset.h>
> 
> Drop this ...
> 
> > +
> > +#include "pcie-designware.h"
> > +
> > +#define to_sophgo_pcie(x)		dev_get_drvdata((x)->dev)
> > +
> > +#define PCIE_INT_SIGNAL			0xc48
> > +#define PCIE_INT_EN			0xca0
> > +
> > +#define PCIE_SIGNAL_INTX_SHIFT		5
> > +
> > +#define PCIE_INT_EN_INTX_SHIFT		1
> > +#define PCIE_INT_EN_INT_SII		BIT(0)
> > +#define PCIE_INT_EN_INT_INTA		BIT(1)
> > +#define PCIE_INT_EN_INT_INTB		BIT(2)
> > +#define PCIE_INT_EN_INT_INTC		BIT(3)
> > +#define PCIE_INT_EN_INT_INTD		BIT(4)
> > +#define PCIE_INT_EN_INT_MSI		BIT(5)
> > +
> > +struct sophgo_pcie {
> > +	struct dw_pcie pci;
> > +	void __iomem *app_base;
> > +	struct clk_bulk_data *clks;
> > +	unsigned int clk_cnt;
> > +	struct reset_control *rst;
> 
> ... and this. It is unused.
> 
> 
> regards
> Philipp

Thanks, I will remove this.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
