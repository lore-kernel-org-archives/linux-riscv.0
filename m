Return-Path: <SRS0=bkE6=I6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF775C433B4
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Apr 2021 06:37:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5263C600EF
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Apr 2021 06:37:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5263C600EF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6a0FIR4eL4InTWYG2kZJhRTIzNBX61WZ/g/L5udm/MY=; b=YMVdsg5+Car198M9nh9QlEZlv
	72HF9pJkNjrxXWQVVHtmHM7Fok1xtOVsBWyg509g3Zrm7jr1vU773NjxFPaOnFEBRHdL4EBMscrs5
	rFFV6KuxnNyFfk3GfqJwrUSnl5zSzyri4Oj3kI0dJlCGplMlBqURtOvqqjqMSI61vR6jp81gDx4nE
	TKwieZpCA2lKZrYJqQal/DKs96C8FgsnatmqpfAAmdOc2lbh77rxP5bWkfmunUyr0KEFfzsJ/MOCW
	AuHtiNr044pwkrPz/RG6H4w/SlBbuwIiMJi0D8vQs7wDtmI9xLsU2mYEvFIamgGHDUWY0wa4Oyh5B
	9XwaSLHpQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRqxH-008guA-HY; Thu, 01 Apr 2021 06:37:23 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRqxD-008gtu-RD
 for linux-riscv@desiato.infradead.org; Thu, 01 Apr 2021 06:37:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=UnDsqWuvOuHdfoPwQZfisLiRixlJIZ0mZK0rwiZPBp4=; b=SeItDScDzhSk2FeB9nhoeHpmMQ
 FBuWTRohENB5eGO7fbkSTwV4gkO3YRWGqoAna5JxXiM1HIoPtwoR2ZU8k1rv79Xf1jXKjTDJqyU2s
 YnqWzS/O8iSgduV7PVWtbbczvwuWyxihagsNNeOD5JeHosFoo90yGpm9fJfcw3Nb1DOfTAyrqdG6K
 tUia+hUBgVON7cFLNbJANP9SdrVz4gC4/m3ksuGbhfc36f1kphPMARvOhfZJQcXeN/N0oxlaRdcOC
 nvt9q/5/hV7qps0n6k7ad/ZR6dBLkXp9mlMV6dMWoQ1wO17Ne0i5LIUInFVgy7gLZdtkfS5tOOumu
 l3sWMCiQ==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lRqx1-005ibZ-0P; Thu, 01 Apr 2021 06:37:10 +0000
Date: Thu, 1 Apr 2021 07:37:07 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Jiuyang Liu <liu@jiuyang.me>
Cc: Alex Ghiti <alex@ghiti.fr>, Andrew Waterman <waterman@eecs.berkeley.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Morton <akpm@linux-foundation.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] implement flush_cache_vmap and flush_cache_vunmap for
 RISC-V
Message-ID: <20210401063707.GA1362465@infradead.org>
References: <20210329015510.44110-1-liu@jiuyang.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210329015510.44110-1-liu@jiuyang.me>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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

On Mon, Mar 29, 2021 at 01:55:09AM +0000, Jiuyang Liu wrote:
> +/*
> + * flush_cache_vmap and flush_cache_vunmap might modify PTE, needs SFENCE.VMA.
> + * - flush_cache_vmap is invoked after map_kernel_range() has installed the page table entries.
> + * - flush_cache_vunmap is invoked before unmap_kernel_range() deletes the page table entries
> + */

Please never ever write comments > 80 chars.  And please read the
coding style document.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
