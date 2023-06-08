Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B7E6C7EE29
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 19:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qrWEqRZhTU3lJ5+vdVYlmweHynRo1ff5f96fhq0Gs9I=; b=X5w8f+TGymQqTD
	Yk+pWwYjkdOVUfIdaAUfm7cE4T6dCqFqhOo9xp7Dk6yH0o4x2km0BZcuvIzl+k3PsoNqy6TbW66k8
	WTGau/k9k2bDHvREADCWBzKIiWi5yHATCU2CFiGxCWchECXHd8ebPgm6nS/ewwtn7crHVA28xAzww
	wUQoGukLFwN19oAHnWFHlZ0+AY3adWVHV37TQZiVGsAOi9y1Nt7wctapYCeoJTJPKyPphD8HZPgb5
	/AaXd4liGsKqgDH1dYeW3zjUGGvMfwR2W/FScCJ0ixHLyDyRvvSLl+p0wz1RQMZ4Et3sWB86R79Dk
	lDIp1DW8JnTBrraQcjJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7L4V-00AHlA-0l;
	Thu, 08 Jun 2023 19:13:23 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7L4S-00AHi8-0U
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jun 2023 19:13:21 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-6b2bdca0884so32422a34.2
        for <linux-riscv@lists.infradead.org>; Thu, 08 Jun 2023 12:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686251598; x=1688843598;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=H3hlbyYK7pDzwaZxcFIBlWQ9GVphTFdOhlIQXeLYhe0=;
        b=dJgo7fXPVEPfP5aOx2rlF6fhL0MOp6kKeclo0mcv4zTOiWrzHWntcp0lBZsfoj54Se
         XolJoU7BuSvwRUfmeldzR5qRMBOJZmJVG9boQPdpvF4oDnjII17h4IF7WTHJDAtPgKTK
         wCc48eCwjyNX1CCKOKbCJn6rCHbIrfq0gOAhHT/Cld5PzM9jgz6HhRaRcDPho1O+ftQz
         NYl5ZbGuf+ZDQqB6/nkOeRBoiE7Z3JRWHBfKCJGlqU4xYE9mQ0/j0JkL0Hi8bff5nmw2
         hyNF+dGcaX/VDgXb0gWmoFHLFIjjowl5ieph5brNA6Ro0AVROhwI1SIjSa8mT9DDlpOJ
         kD5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686251598; x=1688843598;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H3hlbyYK7pDzwaZxcFIBlWQ9GVphTFdOhlIQXeLYhe0=;
        b=f7bsui84KmlwtLOO6p1OR6CGxcsdhGP1pnmBJrLS5+/AqdnH3YA/+FPEmf7ZwVmvGO
         Mtlr0XiuJwImk/N0gIkCz6XGEF2RkG4YyAe6N4Yzq+tELuSCxjcJNcxm1VZeZ5DBGvem
         rTaPrxni0R9FRNRjU2mKaSlaIGE+oVJIpfAi5nWM733H6naYSSUDbtkuT/22tnyET6P5
         fXWUyc91fiu3G6Wrk3dO82y03OpRUZJ9lwdVDFW4TiOzdFbKT8vVUpsQlY+FZyPIB/dm
         a/ugEHKSVTINqeS0x/qeVyC2CbcHIxoiHxlVtOFxuJQ3e0I3CVh5OBOtOpnk/S+5syna
         xrJg==
X-Gm-Message-State: AC+VfDyuiWUcI23KBISkHjzJDyI7H/9NkohA0txAQopr/pe98pNeyaQX
	oVtdUbwVNJfpcZMHZnt0LsNChQ==
X-Google-Smtp-Source: ACHHUZ7k4j5F178ZxkLqaj/gNdJycBqILZgmndfFTMZvJsxEKmjnaCgTvlswNo/GmMXGG825y1l48g==
X-Received: by 2002:a9d:7849:0:b0:6b2:a879:406a with SMTP id c9-20020a9d7849000000b006b2a879406amr5080795otm.18.1686251597829;
        Thu, 08 Jun 2023 12:13:17 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id d188-20020a2568c5000000b00b9def138173sm449426ybc.1.2023.06.08.12.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 12:13:17 -0700 (PDT)
Date: Thu, 8 Jun 2023 12:13:13 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
cc: Mike Kravetz <mike.kravetz@oracle.com>, Mike Rapoport <rppt@kernel.org>, 
    "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
    Matthew Wilcox <willy@infradead.org>, David Hildenbrand <david@redhat.com>, 
    Suren Baghdasaryan <surenb@google.com>, 
    Qi Zheng <zhengqi.arch@bytedance.com>, 
    Peter Zijlstra <peterz@infradead.org>, 
    Russell King <linux@armlinux.org.uk>, 
    Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, 
    Greg Ungerer <gerg@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Helge Deller <deller@gmx.de>, John David Anglin <dave.anglin@bell.net>, 
    "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, 
    Michael Ellerman <mpe@ellerman.id.au>, 
    Alexandre Ghiti <alexghiti@rivosinc.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Heiko Carstens <hca@linux.ibm.com>, 
    Christian Borntraeger <borntraeger@linux.ibm.com>, 
    Claudio Imbrenda <imbrenda@linux.ibm.com>, 
    Alexander Gordeev <agordeev@linux.ibm.com>, 
    John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
    "David S. Miller" <davem@davemloft.net>, Chris Zankel <chris@zankel.net>, 
    Max Filippov <jcmvbkbc@gmail.com>, x86@kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, 
    linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
    linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
    linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
    linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH v2 03/23] arm64/hugetlb: pte_alloc_huge() pte_offset_huge()
In-Reply-To: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
Message-ID: <5849464-7191-40c5-c55f-fba9c3802e5d@google.com>
References: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_121320_187022_C231E47B 
X-CRM114-Status: GOOD (  14.20  )
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

pte_alloc_map() expects to be followed by pte_unmap(), but hugetlb omits
that: to keep balance in future, use the recently added pte_alloc_huge()
instead; with pte_offset_huge() a better name for pte_offset_kernel().

Signed-off-by: Hugh Dickins <hughd@google.com>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
---
 arch/arm64/mm/hugetlbpage.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 95364e8bdc19..21716c940682 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -307,14 +307,7 @@ pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
 			return NULL;
 
 		WARN_ON(addr & (sz - 1));
-		/*
-		 * Note that if this code were ever ported to the
-		 * 32-bit arm platform then it will cause trouble in
-		 * the case where CONFIG_HIGHPTE is set, since there
-		 * will be no pte_unmap() to correspond with this
-		 * pte_alloc_map().
-		 */
-		ptep = pte_alloc_map(mm, pmdp, addr);
+		ptep = pte_alloc_huge(mm, pmdp, addr);
 	} else if (sz == PMD_SIZE) {
 		if (want_pmd_share(vma, addr) && pud_none(READ_ONCE(*pudp)))
 			ptep = huge_pmd_share(mm, vma, addr, pudp);
@@ -366,7 +359,7 @@ pte_t *huge_pte_offset(struct mm_struct *mm,
 		return (pte_t *)pmdp;
 
 	if (sz == CONT_PTE_SIZE)
-		return pte_offset_kernel(pmdp, (addr & CONT_PTE_MASK));
+		return pte_offset_huge(pmdp, (addr & CONT_PTE_MASK));
 
 	return NULL;
 }
-- 
2.35.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
