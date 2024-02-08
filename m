Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7533FC4829C
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Feb 2024 06:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dyg+BqxMdZIgjJHJnHq+WoDAgr0/VXpw1EN778GAa2I=; b=wxGjIsRw8qMnsB
	CBD5HfiENFVdEcmuRPqbnRpXGNsSw1AeiOdPytqz+TMzc8vGHtzYUDwbYsDV7XcpFhv9f5SdlY0cB
	TU+UWOPbQ0PzTpmitEXrx9DVnym4o/LMzQWMyxJMq17v3RALC+kXlSDxbL4CG2N4VpyNgBuGcfrex
	L0EkjSguLXzBlLtay6p89OJ727RHJPd5Hc2ZNpNYcf96UeDfYZqLcOFZrbnGeTqeeEziq+9xoRF8R
	3t7tzhqf6Vio/de8EeOBiSFWwJ7NFzIJ4S7fQfb35OpJbnJ/BRa8YSalfSf/wEzQ89CXD1iuK4yy5
	XKalVej/s2ZeofyQx75w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXxlO-0000000CmG9-0Rh4;
	Thu, 08 Feb 2024 06:19:58 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXxlK-0000000CmE9-1zaY;
	Thu, 08 Feb 2024 06:19:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9BEE6CE1B8E;
	Thu,  8 Feb 2024 06:19:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF2B9C433C7;
	Thu,  8 Feb 2024 06:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707373191;
	bh=nxciaXphWmGCQZgRp+6AraxUwzLXbBBeY7cwt8JPcBc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dfNiMFhazIYH10xRr5CgSsEUKx1/MHtqdKR5dLOtoLSCnzVdAATtU7nxrVFXM4BpC
	 gCGwotvDn7ACXKus06eXzj+eZFYm9wAopITxFL8a8tezWcb5Lap0xHbr493kIoHncD
	 Ji8m2xjisvxTYwQzAoYpx49/a9Zp+h1Kt+4N1ta6uMLLzeAGNNcMHTSIzdp5pDP730
	 wyrBnBWla/DtCF/gympbDZ+QYOcvjC5PLvCSqHgYCqiQyCQdmHKGPyxvZv6QkTBUnH
	 M9Idx2TB81kcYGZKOss9xP7XeuY91FZ5wUyl1ETidkY4l1k3mGk5EtF84qqV9GR0PD
	 xUtpEa/HDCbrA==
Date: Thu, 8 Feb 2024 08:19:27 +0200
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	"David S. Miller" <davem@davemloft.net>,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: Re: [PATCH v3 08/15] mm/pgtable: make pte_next_pfn() independent of
 set_ptes()
Message-ID: <ZcRyb2o_lq2XITH_@kernel.org>
References: <20240129124649.189745-1-david@redhat.com>
 <20240129124649.189745-9-david@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240129124649.189745-9-david@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_221954_697509_B1A215CD 
X-CRM114-Status: GOOD (  16.55  )
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

On Mon, Jan 29, 2024 at 01:46:42PM +0100, David Hildenbrand wrote:
> Let's provide pte_next_pfn(), independently of set_ptes(). This allows for
> using the generic pte_next_pfn() version in some arch-specific set_ptes()
> implementations, and prepares for reusing pte_next_pfn() in other context.
> 
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  include/linux/pgtable.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index f6d0e3513948..351cd9dc7194 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -212,7 +212,6 @@ static inline int pmd_dirty(pmd_t pmd)
>  #define arch_flush_lazy_mmu_mode()	do {} while (0)
>  #endif
>  
> -#ifndef set_ptes
>  
>  #ifndef pte_next_pfn
>  static inline pte_t pte_next_pfn(pte_t pte)
> @@ -221,6 +220,7 @@ static inline pte_t pte_next_pfn(pte_t pte)
>  }
>  #endif
>  
> +#ifndef set_ptes
>  /**
>   * set_ptes - Map consecutive pages to a contiguous range of addresses.
>   * @mm: Address space to map the pages into.
> -- 
> 2.43.0
> 
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
