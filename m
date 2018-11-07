Return-Path: <SRS0=abkI=NS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 064ABC0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Nov 2018 20:12:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB6D92081D
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Nov 2018 20:12:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l9MqtxJj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="KlBgPbEk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB6D92081D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z4xP8lfgGIu6m+/qStOza2tyjmVD8SNHrLN2IhfAU/Q=; b=l9MqtxJjzeiWZj
	s13abcJLGJZNTANwKsSaoO7/wZtk5AQKfse1huNeDTiKkPSutvjx1nEt5JTZYgCXU2YJsMZp0CC+n
	+6QHBL5uo3HWLDIRlzasXZ8zt7j8VXiti+bTJMtQsy3rx1cenghP41O7888wEEJOtf9tvAAwvafmb
	huzJyNqxAD/Z/pE77hnSQqSUVL0KHTEks4EeBGhItWccZrnwjVgfeBXcxMl6LQUlyk1T/+l9asb/k
	HXV3xwleO89tnSBVIoFydMHbLEUqXoV0UUP1Tg8FqFtKeBJWSg+ZMb4gbIav1Unv/+TfVwCaemliC
	S3k7qD1zBoVeXollbMwQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gKUBc-00039e-0W; Wed, 07 Nov 2018 20:12:24 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKUBV-00033F-Eu; Wed, 07 Nov 2018 20:12:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m9wV/bYhCz24ophtcrmgYX+kXPydL1U6PiamHtK62Ms=; b=KlBgPbEkg52ba3a9BbvqauvEPF
 zvyGMhJgAIiaENMoHRDsSnAGTMpEImChrVDi8CWWDlTkWwAucYlGQUyMt/VzDueQg+CCm62rfQE2h
 sjCeXcRHGHrtUwMbCrpKlu5RISLrTvOTz1snmdiPZNdenRg29Cr0RC2FrFp8ijZ+ellr98F3gLsv1
 HApgE5Xq7uHEMR5Lc10NyIrAFFyHF3tXltlr84efQkK+pq0yYqzGIaS5jhQ++EB4d+qCtvRT/6vas
 D7nvG2tz9ADaBW9zAvGSI+cm9fRE7SS4+PS22rXmbWkUo3PrpEimjxiXc1u6RaIE1MYB21xCEiAuX
 5L/QHDeg==;
Received: from mail.linuxfoundation.org ([140.211.169.12])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKUBR-0001Nr-JZ; Wed, 07 Nov 2018 20:12:15 +0000
Received: from akpm3.svl.corp.google.com (unknown [104.133.8.65])
 by mail.linuxfoundation.org (Postfix) with ESMTPSA id E5BB0AB5;
 Wed,  7 Nov 2018 20:12:00 +0000 (UTC)
Date: Wed, 7 Nov 2018 12:11:59 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Logan Gunthorpe <logang@deltatee.com>
Subject: Re: [PATCH 1/2] mm: Introduce common STRUCT_PAGE_MAX_SHIFT define
Message-Id: <20181107121159.b8c9add7c61fb97f48ddd7de@linux-foundation.org>
In-Reply-To: <20181107173859.24096-2-logang@deltatee.com>
References: <20181107173859.24096-1-logang@deltatee.com>
 <20181107173859.24096-2-logang@deltatee.com>
X-Mailer: Sylpheed 3.6.0 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181107_201213_831002_25C036F0 
X-CRM114-Status: GOOD (  19.31  )
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
Cc: linux-arch@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, linux-sh@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org, Stephen Bates <sbates@raithlin.com>,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181107201159.8zohJz96Hp3B-ocMHxX3-coLXR3yvdf4fsCgAApHWCs@z>

On Wed,  7 Nov 2018 10:38:58 -0700 Logan Gunthorpe <logang@deltatee.com> wrote:

> This define is used by arm64 to calculate the size of the vmemmap
> region. It is defined as the log2 of the upper bound on the size
> of a struct page.
> 
> We move it into mm_types.h so it can be defined properly instead of
> set and checked with a build bug. This also allows us to use the same
> define for riscv.
> 
> --- a/arch/arm64/include/asm/memory.h
> +++ b/arch/arm64/include/asm/memory.h
> @@ -34,15 +34,6 @@
>   */
>  #define PCI_IO_SIZE		SZ_16M
>  
> -/*
> - * Log2 of the upper bound of the size of a struct page. Used for sizing
> - * the vmemmap region only, does not affect actual memory footprint.
> - * We don't use sizeof(struct page) directly since taking its size here
> - * requires its definition to be available at this point in the inclusion
> - * chain, and it may not be a power of 2 in the first place.
> - */
> -#define STRUCT_PAGE_MAX_SHIFT	6

Well that was lame.

> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -206,6 +206,11 @@ struct page {
>  #endif
>  } _struct_page_alignment;
>  
> +/*
> + * Used for sizing the vmemmap region on some architectures
> + */
> +#define STRUCT_PAGE_MAX_SHIFT	(order_base_2(sizeof(struct page)))

Much better.

Acked-by: Andrew Morton <akpm@linux-foundation.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
