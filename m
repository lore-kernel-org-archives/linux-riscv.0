Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A86FC71136
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 15:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PrBCCmzxzF/5zr5exnnS7oYAprf6fJCtCs4bSqTie+w=; b=JvdeHmr50P3YY5
	7N4rtGrrDmHcdKEX10F0ux/7rVzhApmjYRSiWe7BEVr6Hn01QMkWEs+4qVio9DYFPjm6l6W6KohX1
	8xJE+XgHp7DiMAbGaPQRPx90TZBOFwz0ROp7ky+KufXMVkwS4toA9lkICLgw2GUEZLjoCm9lndoPv
	K78xUfS6e6W9wQ91Q4yQ8dVGQncTiteHqem+TcYVtxi4mTFkqk8rrDGd3PRFMZfzJ7jfKZvwpuTSR
	Lcl6lpj0P33cqGAD2J1R/lnpxTot7GlQvhuN5YA2+t/4kdT8vUki7VhEHanT5+XPIQA5a3V9/5R/v
	KPA5iZPZNwgBkg2ltQvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6DS-0000000Gr2E-0HgW;
	Fri, 13 Jun 2025 15:21:14 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ5Be-0000000GejW-1ON0
	for linux-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 14:15:21 +0000
Received: from localhost (gy-adaptive-ssl-proxy-2-entmail-virt205.gy.ntes [27.18.107.32])
	by smtp.qiye.163.com (Hmail) with ESMTP id 18992ed15;
	Fri, 13 Jun 2025 22:15:06 +0800 (GMT+08:00)
Date: Fri, 13 Jun 2025 22:15:05 +0800
From: Ze Huang <huangze@whut.edu.cn>
To: Vivian Wang <uwu@dram.page>, Guodong Xu <guodong@riscstar.com>,
	vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, dlan@gentoo.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	p.zabel@pengutronix.de, drew@pdp7.com,
	emil.renner.berthing@canonical.com, inochiama@gmail.com,
	geert+renesas@glider.be, tglx@linutronix.de,
	hal.feng@starfivetech.com, joel@jms.id.au, duje.mihanovic@skole.hr,
	Ze Huang <huangze@whut.edu.cn>
Cc: elder@riscstar.com, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 5/8] riscv: dts: spacemit: Add dma bus and PDMA node for
 K1 SoC
Message-ID: <aEwyaQF6W7hXNC6N@jean.localdomain>
References: <20250611125723.181711-1-guodong@riscstar.com>
 <20250611125723.181711-6-guodong@riscstar.com>
 <2b17769e-2620-4f22-9ea5-f15d4adcb27b@dram.page>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2b17769e-2620-4f22-9ea5-f15d4adcb27b@dram.page>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCQk9JVkMfHUMdHkhPQkMaTFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VKS0xVSElZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSEJVSktLVUpCS0
	tZBg++
X-HM-Tid: 0a9769a4ed6f03a1kunm2a6912051f6b0a
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Njo6Ojo*VjE3E0oZLw4*LFYY
	CRZPCRJVSlVKTE9CQ0lPSktNQk5NVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VKS0xVSElZV1kIAVlBSUNITjcG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_071518_579515_9F9A098F 
X-CRM114-Status: GOOD (  14.08  )
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

On Fri, Jun 13, 2025 at 11:06:43AM +0800, Vivian Wang wrote:
> Hi Guodong,
> 
> On 6/11/25 20:57, Guodong Xu wrote:
> > <snip>
> >
> > -			status = "disabled";
> > +		dma_bus: bus@4 {
> > +			compatible = "simple-bus";
> > +			#address-cells = <2>;
> > +			#size-cells = <2>;
> > +			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
> > +				     <0x1 0x00000000 0x1 0x80000000 0x3 0x00000000>;
> > +			ranges;
> >  		};
> 
> Can the addition of dma_bus and movement of nodes under it be extracted
> into a separate patch, and ideally, taken up by Yixun Lan without going
> through dmaengine? Not specifically "dram_range4", but all of these
> translations affects many devices on the SoC, including ethernet and
> USB3. See:
> 
> https://lore.kernel.org/all/20250526-b4-k1-dwc3-v3-v4-2-63e4e525e5cb@whut.edu.cn/
> https://lore.kernel.org/all/20250613-net-k1-emac-v1-0-cc6f9e510667@iscas.ac.cn/
> 
> (I haven't put eth{0,1} under dma_bus5 because in 6.16-rc1 there is
> none, but ideally we should fix this.)
> 
> DMA address translation does not depend on PDMA. It would be best if we
> get all the possible dma-ranges buses handled in one place, instead of
> everyone moving nodes around.

Agree

> 
> @Ze Huang: This affects your "MBUS" changes as well. Please take a look,
> thanks.

Thanks for reminding. I would drop MBUS and follow the "dma_bus" approach.

> 
> >  
> >  		gpio: gpio@d4019000 {
> > @@ -792,3 +693,124 @@ pwm19: pwm@d4022c00 {
> >  		};
> >  	};
> >  };
> > +
> > +&dma_bus {
> >
> > <snip>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
