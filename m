Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86DA8C7EE29
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 19:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Td835b2Xu5US0P1witVWqxFXwCqslEcLyEFxdVqZmNU=; b=GHJUfnpJQ/ufc1
	HBsyxx/L8LuvHyp8Szp8m5qSTr7ieWF0LwdtP+tQPEnNq3AybuVH0dORxgKRIWEEbSlU/Yg+2Nnga
	dpvR8iIsacbINwtsnr91ygJJ9C3a0DWp31AbCqoeY8M84qppNMSIMxGTQFvPfkUzcumU0ifdUQe2V
	slZ9AFMXuCrUNTZQ6FVUqkUzIkIFVq7FxAxNaaaoYSALgLJGoi4psXG9VHvELX4cM8u2eqdXIoGlL
	ybf8MBWqOu76msQBFat58H5CXGzLTbqQcaJ7rg0rmxo2Uzuuxk+cuoI0mbmHFDI2acBLQcNlPYx3i
	kh/51Juyo2BWn7uGcxuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7LFQ-00ALKC-2O;
	Thu, 08 Jun 2023 19:24:40 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7LFO-00ALIE-1W
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jun 2023 19:24:39 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-558cf19575dso654330eaf.3
        for <linux-riscv@lists.infradead.org>; Thu, 08 Jun 2023 12:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686252277; x=1688844277;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=i7vs80eeAHoowuGiB3IXr1R0pQ52ZVhylKFRPge1iSc=;
        b=lAbPn6TcDCUCTkrULodoVCGNfKG29FVY67FgbeiJ5jxFkI0SdPfY3Q7zS2ZpB7B3Ka
         0+4DsALOBzmN/g4lrWz7UdF0za/OEXw8SnfDQq1bPnyXWLOXOAsMtp2m31wtLhDZlK78
         7+DeIInQk+60ERlpdJIaV5UTMyntDTdkDirFIOhMv9y2YwphvkDig23XCp6gxOUbA13q
         4lZI9pGfmXS3JD9BQJwcFxfyA+9jCzBdEd+VDAYdC+2isApPdQtgU3FZBqK+7UR/EWUH
         D2UVD7UjPKNuWET/rAcvrMmiLHiIQqQKIfHIGZVLeph+JjJffo26O8bMN6hZwTbiPah7
         9aAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686252277; x=1688844277;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i7vs80eeAHoowuGiB3IXr1R0pQ52ZVhylKFRPge1iSc=;
        b=IkmuthQe8L+cNaSnJ9g3PjflIZWyhGlad97jfuLJ/NJd8cMv6o/DNzNPZDK4Foxjd5
         BGfCz+svUhu7BtX++Lge0LvQ1ZQBtP2k1ihzc99d9mev2Ufwvlj10xRmeVL8O+sdgVhc
         GYbtMKrXYIIvPCguWLssogtvz5StskGXdAqoFKdmScxOxfAt9/1Dr9NdDuueH23CNGA6
         K44BT1nmUacBuQ0dRJI9UQteygAkckjy9zgJcXtynHCz2A7FofTaBs4doiUiLMDkAZhF
         W1/x03CUWszfCamKsriUW/t3xIhidakdsK+pSLhYGVYE99m0kPG5RpR/degAdecQ8iDf
         0sUQ==
X-Gm-Message-State: AC+VfDyNoQmGaUOVGIp2OpApcUrYJBO8PQZxNzqcsBUNoBWMCV4pkTl9
	XZdIUFrWVojOe3OXN797z6GeJg==
X-Google-Smtp-Source: ACHHUZ7q/V1z+M3JmfzPQUSgwqST3P0/aMtaG97EoZD5q0BXyKYRTA5dvNNFRGy2eGKWgHikkJ/mpQ==
X-Received: by 2002:aca:231a:0:b0:398:2e8d:3ca8 with SMTP id e26-20020aca231a000000b003982e8d3ca8mr9311006oie.52.1686252276532;
        Thu, 08 Jun 2023 12:24:36 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id p127-20020a0dcd85000000b0055db91a6ddfsm111980ywd.73.2023.06.08.12.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 12:24:35 -0700 (PDT)
Date: Thu, 8 Jun 2023 12:24:32 -0700 (PDT)
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
Subject: [PATCH v2 13/23] powerpc/hugetlb: pte_alloc_huge()
In-Reply-To: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
Message-ID: <36b4e5d-954b-8569-4fe2-bd1797362441@google.com>
References: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_122438_505773_79F1F366 
X-CRM114-Status: GOOD (  13.18  )
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
instead.  huge_pte_offset() is using __find_linux_pte(), which is using
pte_offset_kernel() - don't rename that to _huge, it's more complicated.

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 arch/powerpc/mm/hugetlbpage.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index b900933507da..f7c683b672c1 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -183,7 +183,7 @@ pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
 		return NULL;
 
 	if (IS_ENABLED(CONFIG_PPC_8xx) && pshift < PMD_SHIFT)
-		return pte_alloc_map(mm, (pmd_t *)hpdp, addr);
+		return pte_alloc_huge(mm, (pmd_t *)hpdp, addr);
 
 	BUG_ON(!hugepd_none(*hpdp) && !hugepd_ok(*hpdp));
 
-- 
2.35.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
