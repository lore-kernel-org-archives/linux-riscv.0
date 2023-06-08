Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C00BC7EE23
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 19:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=824VjSi7TZds90rQUoi8UAsDhAxF8fQkcueoHyrOlvA=; b=ETsZ6mUVvdt/wn
	bjJZUzbeTNsRAWZ6dti11JCJhS2BbGpboCRPElKRUziTOKJE7O7/bD0yysHeJYmH+FqhESKmb28Lc
	fnducOcnPplN/ZsmJMyk/kj8KGz8PNfNv2fvR6mvjqhK3iJQJT4ShoEmAFfiWwGuDaWhMauE65ej6
	9KT1daXQw3BmzPEdKhyIgM4vqxy0A7HZ4RN/LSkgg7Ddm9Skj+0VlYjD2g/t3C14kpgzNRZ5RLT7f
	ycAFjOZbSUCRr4DXojPO3BQyxSFfBdxRmtxciObeasX/heyO9V2pwV6fSwqXxBWt1wDIAmcxoNR9o
	H1XoZ0hVWLaDS+FZDa9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7LGZ-00ALaP-2z;
	Thu, 08 Jun 2023 19:25:51 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7LGW-00ALYT-20
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jun 2023 19:25:50 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-565c3aa9e82so9335137b3.2
        for <linux-riscv@lists.infradead.org>; Thu, 08 Jun 2023 12:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686252347; x=1688844347;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OY1uPF9EWokdB4SqfwvScqZ05vH5KIzX3bnt2mFlrzM=;
        b=WSe0O+xWHB2ydCbpeLzjHJf6lubD6yWbrbalQ09CW2PLGKbnuv/YCHcTjEklbftlDZ
         Bn+TBag489vYl0Kx/QEnd/hNvW0BHOeSak/CZxA051qj0HRROKgCePvrRb9MuwQ21RPo
         UFNVPP0fFgD2zP3vXEkAAHs7IbIEd7kCFa41GIq/o5fS7gcYFt1t9fsorCogUddAyQAa
         gvgPXc4Mu6L9KlRIpGfWDTGDmUnx/ZwV5Hsai5H4jlYjdflYF6WjfS5QYRdpLJc33lMM
         tuIWNkxAGrXRoIS+Re+Ik8k2cuYZR70rphrz9RjLzYXiNApKIhKEFjqSjiunuGbiEcPL
         13ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686252347; x=1688844347;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OY1uPF9EWokdB4SqfwvScqZ05vH5KIzX3bnt2mFlrzM=;
        b=Q9XikTiMH2Zz0XddC+hHAPstE+Uw6c9tFNRad7FUat/gqfSYts1n3mgDyAWlbjgjxf
         ObERLt18oWSMuffJozZj8ACmuzUkw3J2sosAyRoWVAYmzcl6O9tsZueFsU8i0c5Jsa64
         RgcrRIE77jOBmkrHcC7nRI2BCOq6oxWuPod58JosKBjIGWbZPz6hw5omObtyBjV8Y7MA
         ILrAJu3ODs86Ukk/O7pIdaFKXD1Qnvi8025E25ZXmmh7s/N+JeyeaD10gcdfLWY/fHbr
         uujPzHCS1/Jn3XZVq/DP+0jNi++VSE4+hjZ6hGo77Q3g4sIRzX+yLSrZWEEJ4LUjVQ9J
         L7Hg==
X-Gm-Message-State: AC+VfDzAzkNW0nVtx4c0uknyY6zf93VeWueSQYcqwIUHNXqAI5IJh0OD
	hVotES+owlKUcpV5pH4PqcoRMQ==
X-Google-Smtp-Source: ACHHUZ7VI0tdmqfD7RJHlpvasneu0EKZSOUA0Xhotxo3WPVI6HmobTXuS5JzWFFLHVldGCNyYtlCDw==
X-Received: by 2002:a81:9144:0:b0:561:da0d:6488 with SMTP id i65-20020a819144000000b00561da0d6488mr460871ywg.50.1686252347196;
        Thu, 08 Jun 2023 12:25:47 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id y62-20020a0dd641000000b00568938ca41bsm117859ywd.53.2023.06.08.12.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 12:25:46 -0700 (PDT)
Date: Thu, 8 Jun 2023 12:25:42 -0700 (PDT)
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
Subject: [PATCH v2 14/23] riscv/hugetlb: pte_alloc_huge() pte_offset_huge()
In-Reply-To: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
Message-ID: <291f20-5947-9f5f-ec7f-96a18df336d9@google.com>
References: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_122548_664282_7D1681EE 
X-CRM114-Status: GOOD (  13.13  )
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
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosync.com>
---
 arch/riscv/mm/hugetlbpage.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index e0ef56dc57b9..542883b3b49b 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -67,7 +67,7 @@ pte_t *huge_pte_alloc(struct mm_struct *mm,
 
 	for_each_napot_order(order) {
 		if (napot_cont_size(order) == sz) {
-			pte = pte_alloc_map(mm, pmd, addr & napot_cont_mask(order));
+			pte = pte_alloc_huge(mm, pmd, addr & napot_cont_mask(order));
 			break;
 		}
 	}
@@ -114,7 +114,7 @@ pte_t *huge_pte_offset(struct mm_struct *mm,
 
 	for_each_napot_order(order) {
 		if (napot_cont_size(order) == sz) {
-			pte = pte_offset_kernel(pmd, addr & napot_cont_mask(order));
+			pte = pte_offset_huge(pmd, addr & napot_cont_mask(order));
 			break;
 		}
 	}
-- 
2.35.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
