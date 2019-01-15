Return-Path: <SRS0=k4h2=PX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BB18C43613
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 13:47:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFE7E20651
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 13:47:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dYBmVgd6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFE7E20651
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y5+t1iY13bReYt82QsAcsIi8pUe30H3249k+1rsX7sI=; b=dYBmVgd6hdDraI
	yd2UxPaCgxhHpF6PofUGT9dltSSpB/BWOnXNi1hzI36dY8Sblz8Do8IwoT4h7fSfspn2d+gIXaiqv
	mjBkNYKCClPRcOUPrRU2qgXc9GQryQNzoZLiCAmyzTn27Jia55BT6LORDDJp3w6XTJxvQRguW9CHW
	AKQVQJRrtf1W7WsQLU0kEd9ADRDpSmaQYy5Jar6ndX/IW2rbCLUbrJvMwQihQDx/TGtc5REWk27TO
	IkG+wQZi5X8K1DrO47pFAr8hwUzX7nbll0mDB9ebNT7xii6vU5JePi01XhtIDUU4EDrcFji1zx8jI
	WdBf0IMwLo+faDO4WBOg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjP4G-0007So-Vn; Tue, 15 Jan 2019 13:47:48 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gjP4F-0007SO-0D; Tue, 15 Jan 2019 13:47:47 +0000
Date: Tue, 15 Jan 2019 05:47:46 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH 5/5] RISC-V: Implement compile-time fixed mappings
Message-ID: <20190115134746.GF13216@infradead.org>
References: <20190107161047.10516-1-anup@brainfault.org>
 <20190107161047.10516-6-anup@brainfault.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190107161047.10516-6-anup@brainfault.org>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Palmer Dabbelt <palmer@sifive.com>, Anup Patel <anup.patel@wdc.com>,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <atish.patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jan 07, 2019 at 09:40:47PM +0530, Anup Patel wrote:
> From: Anup Patel <anup.patel@wdc.com>
> 
> This patch implements compile-time virtual to physical
> mappings. These compile-time fixed mappings can be used
> by earlycon, ACPI, and early ioremap for creating fixed
> mappings when FIX_EARLYCON_MEM=y.
> 
> To start with, we have enabled compile-time fixed
> mappings for earlycon.
> 
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  arch/riscv/Kconfig              |  3 ++
>  arch/riscv/include/asm/fixmap.h | 52 +++++++++++++++++++++++++++++++++
>  arch/riscv/mm/init.c            | 32 ++++++++++++++++++++
>  3 files changed, 87 insertions(+)
>  create mode 100644 arch/riscv/include/asm/fixmap.h
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index e0d7d61779a6..66094aba9a59 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -86,6 +86,9 @@ config GENERIC_CSUM
>  config GENERIC_HWEIGHT
>  	def_bool y
>  
> +config FIX_EARLYCON_MEM
> +	def_bool y
> +

Can you please throw in a prep patch to move FIX_EARLYCON_MEM to
drivers/tty/serial/Kconfig and only select it from the architectures
that use it?

> + * fixmap.h: compile-time virtual memory allocation

No need to mention the header name.

> + */
> +
> +#ifndef _ASM_RISCV_FIXMAP_H
> +#define _ASM_RISCV_FIXMAP_H
> +
> +#ifndef __ASSEMBLY__

As far as I can tell we never include this header from assembly files,
so this ifdef should not be needed.

> +/*
> + * Here we define all the compile-time 'special' virtual
> + * addresses. The point is to have a constant address at
> + * compile time, but to set the physical address only
> + * in the boot process.
> + *
> + * These 'compile-time allocated' memory buffers are
> + * page-sized. Use set_fixmap(idx,phys) to associate
> + * physical memory with fixmap indices.
> + */

Please use up the available 80 chars per line for comments.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
