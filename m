Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B8C2C44501
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Jul 2026 05:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3bXqEPysg1zRM8GdpU6e28aHRgxV5GHWzICY1mHaOyA=; b=C5McoDOnImknpn
	2iXbTm+TgYTlHXx/E1uVZR5+pBYWtZN/DULwWyqaPq/nDen4jdEDNuY8u0XBw300w5vKPrQDS0+dW
	bHgGYcq164SoxvYpmDzFe4xXw7HBdE4ganfI9pjvv9kXbnbYlXIVxlpgJTobVb6gcg2i3AlIr0rI/
	ZsxjRf/f5oa9xVtaFX0b7sBb05MKCOQZSNReHI3Q+HgL5zeS9Z5pp9GMApH0bGyiOtAZXWbUnzmoS
	4Yt5iEuZAjA4viK8g9wGS7aVn625mKtenkPdpfoBRWgQarg7ciEY632dTMcpWo90r8cZh6ph1cvGX
	OzSv7VE1HwmRJYKT0HDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1win0r-00000007B8R-3L18;
	Sun, 12 Jul 2026 05:46:01 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1win0p-00000007B7o-1oJB
	for linux-riscv@lists.infradead.org;
	Sun, 12 Jul 2026 05:46:00 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso2863860a91.1
        for <linux-riscv@lists.infradead.org>; Sat, 11 Jul 2026 22:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783835158; x=1784439958; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p5T9DanspdTbxdaM1wq6G9SRiLHrncHsKrVHDW8gIgM=;
        b=IOuk/AHUqKDNqLlvv9X5Fx1f8E7if9LCZkN0MpJuYzKKyk4T58llhV6BOInSFmh450
         NURLn3Mh7NN5UkQ/WsFa/+WK/VDg64ATT7VWCTEJMky246WGe+iVoenY4NSpzPElikun
         XwO208IbN332VBjJK5EUxuwVbW3QBXPTni94dgyQ1ujeatfV4HnLkPio7JAOtCvaGA2s
         14JBowStc1DhzxfV6GygbFJC0r//ujXyeOpj0HsokxHK+SJJgbLUn1/bq7ducDEIbwJw
         PZ+upiX+2TAJiWab8c/j4h8mvi95U9JApbQGEs3BJljULheIsm7cLn9Iwqa9i8HXW76y
         GyzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783835158; x=1784439958;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p5T9DanspdTbxdaM1wq6G9SRiLHrncHsKrVHDW8gIgM=;
        b=IhSpQc3JdpLFSziVHwe6e44JDK/684a3h+p8r5fI/EuyPLi9w6iMXbGjmKqLPtOEWq
         3V51DUfVERoHGzw7fVfMhlisK49u7mXCzFsQUO2fh8Fygj/Qg0wlq5oYG6EMHFQJ7/z1
         NRoCOei4ST+h0WiFsTD4/v1ENhCDqoUDawpIWWoi1SV+Pj3+g8R2x/zwv+E+hrBzPzVe
         XlZ7s8va5Q5lRcINio8JyWNPIFaE6XVnfJeHc0HSPZMSrvGSwjOD/IshrJ0+G2W1pH9e
         SjGwBon4vlJrcbTpeSDsjLiwKo3fxsCBZnrq04UJg0ds5z9aSHqCMFoiEMZydC8wG1V7
         anOA==
X-Forwarded-Encrypted: i=1; AHgh+RoLqA2mQW9T/L56f3vfNR7AokwdxPxlmCj175N1i8pmBzNangHKRogF06HFuVZbF8KyvbeZMhSzzuslUA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyHqAUXyV2d2Np4HJNH2Ko8ah6zO7Tr0ivCWxlGss+ddpHuir5y
	KyLs2WXKRsPMXfLxqsWAM5etGaKMMI+V9ZreN5LB0zo4Uhu+FBb6EquD
X-Gm-Gg: AfdE7cmWsFHLH35eCow2CgNthwcxYUKXrJQSQe5p63uMIhCdlNXyTWkQSqZyxAQ5Jas
	n9eQuqy1IYZJVg4A1+/whR/eKtLtac03u9hA35kekrCM5omej/u48kMOLvLVvk83nurWH2FfSrp
	WIrcrhuoNF1IUFUA2OpJ2WPD0ptWikXxkUISL3TyqyPWRslLtEvQ2HdasXYOiAbszYT1sZ/mEZ/
	W8ziJrHOfLCCJK7Q3ZiNXoMRWvSHUxO7esETI+IF6H4b4OWgcdDlEfDaWc73Q6vgSq+Km3xIszu
	QY78gaCPbb6X4hKOaj6n40BQ3t2NZkXIlepMCU6gD3GE0fNeZxZGibZxzd/PPssOLY+NNEhjuB8
	2a1+yZqdftzsYalxL4h+26q9CE5ETyzQ6+hrpnSVflWQdbSAny5ZOWmZUd4HH2L5r
X-Received: by 2002:a17:90b:4a43:b0:37f:9ce1:cda4 with SMTP id 98e67ed59e1d1-38dc773bf14mr5210607a91.26.1783835158527;
        Sat, 11 Jul 2026 22:45:58 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38d11b82d32sm1866372a91.0.2026.07.11.22.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 22:45:58 -0700 (PDT)
Date: Sun, 12 Jul 2026 13:45:15 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Christian Bruel <christian.bruel@foss.st.com>, 
	Frank Li <Frank.Li@nxp.com>, Nam Cao <namcao@linutronix.de>, 
	Qiang Yu <qiang.yu@oss.qualcomm.com>, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Xincheng Zhang <zhangxincheng@ultrarisc.com>, Alex Elder <elder@riscstar.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Vidya Sagar <vidyas@nvidia.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v4 6/6] PCI: spacemit-k1: Add Spacemit K3 PCIe host
 controller support
Message-ID: <alMpuGY3z1DTmqez@inochi.infowork>
References: <20260709040027.958400-1-inochiama@gmail.com>
 <20260709040027.958400-7-inochiama@gmail.com>
 <ak9L7k-_aivk1_Uu@ashevche-desk.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ak9L7k-_aivk1_Uu@ashevche-desk.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_224559_477087_954EAEA2 
X-CRM114-Status: GOOD (  20.28  )
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

On Thu, Jul 09, 2026 at 10:21:18AM +0300, Andy Shevchenko wrote:
> On Thu, Jul 09, 2026 at 12:00:26PM +0800, Inochi Amaoto wrote:
> > The PCIe controller on Spacemit K3 is almost a standard Synopsys
> > DesignWare PCIe IP with extra link and reset control. Unlike
> > the PCIe controller on K1, this controller supports external MSI
> > interrupt controller and can use multiple PHYs at the same time.
> > 
> > Add driver to support PCIe controller on Spacemit K3 PCIe.
> 
> ...
> 
> > +	/* K3: Set IGNORE_PERSTN and drive PERSTN_OE high (assert reset) */
> > +	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
> > +			PCIE_IGNORE_PERSTN | PCIE_PERSTN_OE | PCIE_PERSTN_OUT);
> > +	usleep_range(1000, 2000);
> 
> fsleep(1 * USEC_PER_MSEC)
> 
> > +	regmap_clear_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC, PCIE_PERSTN_OUT);
> > +
> > +	msleep(PCIE_T_PVPERL_MS);
> 
> If PCIE_T_PVPERL_MS is too small, msleep() maybe not a good choice,
> perhaps
> 
> fsleep(PCIE_T_PVPERL_MS * USEC_PER_MSEC)
> 
> ...
> 
> > +	val = u32_replace_bits(val, BIT(7),
> > +			       GEN3_EQ_CONTROL_OFF_PSET_REQ_VEC);
> 
> It's perfectly a single line.
> 
> ...
> 
> >  static const struct of_device_id k1_pcie_of_match_table[] = {
> >  	{ .compatible = "spacemit,k1-pcie", .data = &k1_pcie_device_data},
> > +	{ .compatible = "spacemit,k3-pcie", .data = &k3_pcie_device_data},
> 
> Missed space.
> 
> >  	{ }
> >  };
> 
> I don't see (and haven't checked) the context, do you have
> MODULE_DEVICE_TABLE() for this?
> 

IIRC there is already a patch for adding this, so I won't add
MODULE_DEVICE_TABLE there.

I will take other advice, thanks.

> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
