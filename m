Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E66C41535
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 15:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z4ZQnKifK1mTtIyGhnqQT01Y4pX1hk6QDGuzdBfenTo=; b=4ItmLMUuAQBbIY
	XrNIAYN3vYJ3REylhiT+vgRCBp4ZVJgxlUtUkbddJBEUOSMUL8lrI0ipzJTI8EYEJ+Ziuzd8BJIBt
	xCaWJRg2SsLMcVVMK9OnRLnktfe+jxpRFRGWgycYsZoYxPyD4VEGsMzBkPpspkAtZv3vgP+ohvTx/
	DvBahxu9kPM7e5oMCYLh2YT3CwIisgyq1/+CkUko+bdU08vUztD7IpILh70zV2mxlaQuGPnwiHxI0
	KRf8Ecd53s6zPZulhDH4yhBYIkXXfkCHgFUy9LR267cFnmaXVSp0J2zd2YBHBbrHkH3CdlxL6VonF
	M22YThfNwgSAVgCQGacA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGh4j-006Amn-1N;
	Fri, 22 Dec 2023 15:04:33 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGh4f-006Akk-0C
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 15:04:31 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 96F8668BEB; Fri, 22 Dec 2023 16:04:18 +0100 (CET)
Date: Fri, 22 Dec 2023 16:04:17 +0100
From: Christoph Hellwig <hch@lst.de>
To: Conor Dooley <conor@kernel.org>
Cc: Maxim Kochetkov <fido_max@inbox.ru>, Christoph Hellwig <hch@lst.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	robh@kernel.org, mpe@ellerman.id.au, aou@eecs.berkeley.edu,
	palmer@dabbelt.com, paul.walmsley@sifive.com
Subject: Re: [PATCH 1/1] riscv: set ARCH_DMA_DEFAULT_COHERENT if
 RISCV_DMA_NONCOHERENT is not set
Message-ID: <20231222150417.GA23363@lst.de>
References: <20231221185152.327231-1-fido_max@inbox.ru> <20231221-discount-decade-e306e5878c46@spud> <f31d929c-fa0a-4046-be05-38e92afa5d92@flygoat.com> <20231222041428.GA2803@lst.de> <c53c22dd-c482-4808-bdd7-e81c01c04f9e@inbox.ru> <20231222-outburst-spoiling-75082a7826dd@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231222-outburst-spoiling-75082a7826dd@spud>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_070429_268392_397D9992 
X-CRM114-Status: GOOD (  13.59  )
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

On Fri, Dec 22, 2023 at 02:54:19PM +0000, Conor Dooley wrote:
> > of_dma_is_coherent() affects only DT devices. And we can override it with
> > "dma-coherent"/"dma-noncoherent". ACPI devices can specify by
> > "attr == DEV_DMA_COHERENT". But all other devices (platform_device, usb,
> 
> I would have expected that usb devices "inherit" the value from the usb
> controller whose bus they are on. Similarly, platform devices are on a
> bus that should be marked as non-coherent if that is the case.
> Christoph certainly knows better how things operate here however.

usb is not a DMAable devices, you need to use the USB layer helpers
that call the DMA API on the host controller's device.  platform_device
must have a device tree and the dma-noncoherent attribute somewhere in
the hierarchy.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
