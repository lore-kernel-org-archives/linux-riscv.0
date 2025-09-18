Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6320CA1013
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Sep 2025 14:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oc7izVG5YEPalC32hG2h7wqTRV5m8V/RZ9y7XdTTMso=; b=o+DU8LIiZbmbzl
	x7bKw99M+0LhRxJ7YUHAd22eiMQ0NZHqEVm83TsrFxvpdRVYs7tijwd2R20ypy2nju6cIIHJj9+DF
	qb45AA7qWuiDQUIOcK9sQi1RQnuyMxbvpMqCqJi1GxAxIEySC+IXGboIqww7m7DZx0DLZhEddYD88
	FqOznLPPirWg+ROv8K9VEGGo1zzwgqvvSE/Ve77HEDmL77UGgjgFT20ft3Cw1JTEHx9gVqvnB1O9Q
	WhqM06WGxsiTRc0WzD4O0vpidTyEhVpxRNvm9UPY0XvHn15HRSxZRjYU2tMyMwKfHmoKnENRuGEeS
	057l+BZm/84rXli6u32g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzG46-00000000EF9-1ehZ;
	Thu, 18 Sep 2025 14:56:54 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzG43-00000000EDx-2tiM
	for linux-riscv@lists.infradead.org;
	Thu, 18 Sep 2025 14:56:52 +0000
Received: from localhost (unknown [180.158.240.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 51221341B26;
	Thu, 18 Sep 2025 14:56:50 +0000 (UTC)
Date: Thu, 18 Sep 2025 22:56:44 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	p.zabel@pengutronix.de, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] spi: spacemit: introduce SpacemiT K1 SPI controller
 driver
Message-ID: <20250918145644-GYC1274501@gentoo.org>
References: <20250917220724.288127-1-elder@riscstar.com>
 <20250917220724.288127-3-elder@riscstar.com>
 <20250918124120-GYA1273705@gentoo.org>
 <034cecd3-c168-4c8d-9ad5-10cc1853894b@riscstar.com>
 <20250918143928-GYB1274501@gentoo.org>
 <cedaad98-1eba-431f-af4a-b84e106e5f65@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cedaad98-1eba-431f-af4a-b84e106e5f65@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_075651_748576_8DAAD411 
X-CRM114-Status: GOOD (  17.67  )
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

Hi Alex,

On 09:47 Thu 18 Sep     , Alex Elder wrote:
> On 9/18/25 9:39 AM, Yixun Lan wrote:
> >>>> +	u32 data_reg_addr;		/* DMA address of the data register */
> >>> s/data_reg_addr/ssp_data/? I just feel uncomfortable with redundant 'reg_addr'
> >> My convention is normally "virt" or maybe "base" to represent
> >> a virtual address, and "addr" to represent I/O addresses.
> >>
> >> This symbol represents the physical address that underlies the
> >> "SSP Data Register", which fills the TX FIFO when written and
> >> drains the RX FIFO when read.
> >>
> >> How about "data_addr"?  I know you wouldn't like "reg_addr".
> >>
> > another idea here, instead of introducing a variable here,
> > how about simply using plain iores->start + SSP_DATAR?
> > 
> > so you can cache "iores" instead..
> 
> This code has gone through a huge amount of refactoring.
> 
> I hadn't looked, but now I see this field is used exactly one
> place in the code, in k1_spi_prepare_dma_io().  It's still
> needed though.
> 
> Here's what I plan to do.  Rather than saving data_reg_addr,
> I will simply save base_addr, which is the I/O resource start
> address that corresponds to the mapped virtual pointer, "base".
> 
> Then in k1_spi_prepare_dma_io() I'll use base_addr + SSP_DATAR.
> 
> OK?
> 
Yes, this is what I'm suggesting
-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
