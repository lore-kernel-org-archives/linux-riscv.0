Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8CB6C0032E
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 03:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O+MBNJFI33IaVdO2C9kOj7mgqPYW9UdeDV0BKZUPSp4=; b=sKl4nD3Qq3briW
	TEujU4I/4v1OrPtJ0JcL/ozrAw/67+r2ZGWRLPRZH7qEVV9j+cbbdWPrqiafopgwqrfZxFdIyBGB5
	2BRWR23NSe7+kd6xhWoVTk3E3wUI4IaUy02T3915ONXWI2jfOq+kvPDEmHAXjwxb3Q6wdR2POSsSJ
	7PLGOOYU1HIpyb1AoDElfNHijt7r5gYTQxf+x3YwfDvGEAKfNViR2k/yushyxBhtjMER3V4f6UcOU
	aZBcAWjej8I1GE6YJblnE7QIOF4UHxkHDmjqh2tLBIASfxl/Ph1JWg0+R/32ic6cwvFDRQSM/Ompj
	riC8deYMGdn5jvd3kmbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvUY1-00BGRb-0I;
	Wed, 25 Oct 2023 03:27:09 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1qvUXx-00BGRH-1B;
	Wed, 25 Oct 2023 03:27:05 +0000
Date: Tue, 24 Oct 2023 20:27:05 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	Conor Dooley <conor@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: linux-next: Tree for Oct 24 (drivers/soc/renesas/Kconfig)
Message-ID: <ZTiLCfrAimsnogzX@infradead.org>
References: <20231024174818.1137914a@canb.auug.org.au>
 <31264b8b-4509-4972-97f8-0926bc843147@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <31264b8b-4509-4972-97f8-0926bc843147@infradead.org>
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

On Tue, Oct 24, 2023 at 05:22:43PM -0700, Randy Dunlap wrote:
> WARNING: unmet direct dependencies detected for DMA_GLOBAL_POOL
>   Depends on [n]: !ARCH_HAS_DMA_SET_UNCACHED [=n] && !DMA_DIRECT_REMAP [=y]
>   Selected by [y]:
>   - ARCH_R9A07G043 [=y] && SOC_RENESAS [=y] && RISCV [=y] && NONPORTABLE [=y] && RISCV_ALTERNATIVE [=y] && RISCV_SBI [=y]

This is known and just waiting for the fixes here:

https://lore.kernel.org/linux-riscv/20231018052654.50074-1-hch@lst.de/T/#t

to be applied.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
