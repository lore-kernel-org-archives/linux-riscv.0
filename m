Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 674D8C4451B
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Jul 2026 02:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q7ytMypoYVUjff9PgpxXkCauAuz2rTM8K5EMGRICn5E=; b=rjDaQbGNjYMOha
	G7pnXBORSPD4U3nDNHWrwjB5ZvoFJSA7PTIdlY13OfFTncHLoGC0qRd3OPDwEUw7D22Kp9/JkIpks
	4ZOCZ02h24exz5q6GNfRGzeiYBZVAlnsk3NfvYeHWXdcM6Q7ZqA3MFMQsEDp8Xy3jxEL+fXCKpARD
	1yykEjwr/PongSBk3PHtSB41tvnLoX84NMt8J4yXDZ+tS+F1ve6nE9QyBx2+oI6RvQLgsMeUk+RR0
	AyR8aO+8hQWnJCCLRkXrkJ77cw/JY5gfEbF5t5ZK+gKnjoikr89M6czc8CWwSrSy/UYFceNS+KQDk
	Qg4StyYn/4viXWONF2qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkuid-00000003Xxl-3PWO;
	Sat, 18 Jul 2026 02:23:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkuic-00000003Xxb-13vS
	for linux-riscv@lists.infradead.org;
	Sat, 18 Jul 2026 02:23:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6F93860A7F;
	Sat, 18 Jul 2026 02:23:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F2D81F000E9;
	Sat, 18 Jul 2026 02:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1784341435;
	bh=iQ/Yf7wVnFQB+IHSZULMU8+KgGXBXMuHZZzMw8HGnT0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=qq65hb0S0liK/slomG4DFDFnkLSsN81uHm/Ra4fwu8UvpcI9Mwxck8gwrLG1l/XuI
	 ScCKZpN3gWmZwuORrLBh/IY6L+g8Jx3/js0HYQ9ZGYgpKmFeJOOuwvwhDFeZPetdK7
	 2hqYr/OcRIOofpgk5ZBh7PW80cAQ/Przn13h2cHI=
Date: Fri, 17 Jul 2026 19:23:54 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, David
 Hildenbrand <david@kernel.org>, Guo Ren <guoren@kernel.org>, Mike Rapoport
 <rppt@kernel.org>, Vishal Moola <vishal.moola@gmail.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Junhui Liu
 <junhui.liu@pigmoral.tech>, Kiryl Shutsemau <kas@kernel.org>, Muchun Song
 <muchun.song@linux.dev>, Nam Cao <namcao@linutronix.de>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Vivian Wang
 <wangruikang@iscas.ac.cn>
Subject: Re: [PATCH] riscv/mm: use physical alignment for vmemmap_start_pfn
Message-Id: <20260717192354.045ed96b3f67e78b00a0319d@linux-foundation.org>
In-Reply-To: <20260716115326.3466926-1-xujiakai2025@iscas.ac.cn>
References: <20260716115326.3466926-1-xujiakai2025@iscas.ac.cn>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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

On Thu, 16 Jul 2026 11:53:25 +0000 Jiakai Xu <xujiakai2025@iscas.ac.cn> wrote:

> RISC-V computes vmemmap_start_pfn by rounding phys_ram_base down to
> VMEMMAP_ADDR_ALIGN. That alignment must therefore be expressed in the
> physical-address domain.
> 
> Commit 476849b0fba4 ("riscv/mm: align vmemmap to maximal folio size")
> attempted to account for the maximal folio alignment by feeding
> MAX_FOLIO_VMEMMAP_ALIGN directly into VMEMMAP_ADDR_ALIGN. However,
> MAX_FOLIO_VMEMMAP_ALIGN is measured in bytes of struct page storage,
> whereas VMEMMAP_ADDR_ALIGN is used to align a physical address.
> 
> The mask-based compound_info encoding requires pfn_to_page(0) to be
> naturally aligned to MAX_FOLIO_VMEMMAP_ALIGN. Commit 9f94db4c7eaa
> ("mm/sparse: check memmap alignment for compound_info_has_mask()")
> added a check for that requirement and exposed the unit mismatch on
> systems such as QEMU virt, where the DRAM base is not aligned to
> MAX_FOLIO_NR_PAGES * PAGE_SIZE.
> 
> Convert MAX_FOLIO_VMEMMAP_ALIGN to the equivalent physical alignment
> before using it in VMEMMAP_ADDR_ALIGN. This keeps the existing
> round_down() logic while making the resulting vmemmap base satisfy the
> mask-alignment requirement.

Thanks.

> Fixes: 476849b0fba4 ("riscv/mm: align vmemmap to maximal folio size")

That's in 7.1, so I'll add a cc:stable to help ensure this gets
backported.

The changelog doesn't tell people *why* we're proposing a backport - to
understand that we should tell them how the bug affects users.  So I'll
paste your following boot-time warning messages into the changelog.

> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -63,7 +63,8 @@ EXPORT_SYMBOL(phys_ram_base);
>  
>  #ifdef CONFIG_SPARSEMEM_VMEMMAP
>  #define VMEMMAP_ADDR_ALIGN	max(1ULL << SECTION_SIZE_BITS, \
> -				    MAX_FOLIO_VMEMMAP_ALIGN)
> +				    PFN_PHYS(MAX_FOLIO_VMEMMAP_ALIGN / \
> +					     sizeof(struct page)))
>  
>  unsigned long vmemmap_start_pfn __ro_after_init;
>  EXPORT_SYMBOL(vmemmap_start_pfn);

I'll queue this as a backportable hotfix and shall await reviewer input
(please).


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
