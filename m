Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69832C7EE29
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 19:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hVpt9v54Y5EW+aFoiZwyA2fLHWYnZo/tjYRY1KIcTkw=; b=ZP/orRPiTmCAC4
	aiNiHJoU9/IEp49x325RJxkbcFD3ocpUVJvxkbIcHlXAcuqMgsk+zQrCYTrk9LfvGgMKB6qrQviZ8
	IJ+CSYUgmLoJ3ljye2dKDQJBruCyzp3eGRqrC57KwWxa7rqd9zI/VxGfSRmCH3hsbi7rmJEgLV5Ff
	VXSUB1UHZU74ewNRSmHmyoBWrw4JiTJ9BbIIWC9zNgGVX7w5XfPvXT6XrhdeOGGDd5ZWWmhhZUxl6
	mpKJtSV5WOHRR8/JESRcOwzRnuH1x959F8qP8H7ifOOZqduABBmc2Aq3JZY2iNVHSChmjc2qqMzXo
	ZEiRcuCcDgpr7UcY84Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7LC9-00AK93-0y;
	Thu, 08 Jun 2023 19:21:17 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7LC5-00AK68-1i
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jun 2023 19:21:14 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-565ba53f434so9045617b3.3
        for <linux-riscv@lists.infradead.org>; Thu, 08 Jun 2023 12:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686252072; x=1688844072;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=alKFmwAdxdkIViw1WjkjX/OCKeQtR2IpGs2zcY6rd0M=;
        b=HKd31LqvAwT3pdB9H8RTJjakAJAT9HvglTvKC+OkvKmv5VhsoaZHAtLpo2tFkCpDhK
         eaJn1uAawotb3pLd5xLGg7DzD6kDQrKAHxas7kU/r2KN0gO+8LwEgaLotjlfcSI+ExXP
         OsTJ1O2tfGB1hyPd2BGfO1Hv0XjmUpnPR5LgmonoIasqGq2fAG/aN3V/iTrXbCwGdrUM
         I50yE5ZJKvbdrlam2CeJEmfXKvbJkG9Wl49W11ZHf6B9xR5DJRVBfUy3eWMAtZhLeFU3
         MFev89ALFBnRCYsOlrl0s+V0pK/HvUPQhOTjtpCkmArqzAHuVaF4G3AF2HiTPrlcql5n
         hmyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686252072; x=1688844072;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=alKFmwAdxdkIViw1WjkjX/OCKeQtR2IpGs2zcY6rd0M=;
        b=J5XwPKvyyCsgG5/tNYah1YTFWOJKocMON0J+Atm0gNy95MltjjQRreHIx5jgRo+MVy
         Jg77FLOMPhQiGk3M0IP8WXsosev6SEhOvDSLA8sTlzM9yqdtXLG099M4p3XMfwBmb8Hg
         4K0QtCYCbyFjVPxFNtj3H7Ob3htrbdS/P+rluyyuYj4JT0IBhO9fDECSc+bDWl9/cOPN
         q5rwL1/swldVMvfGF4g2uwsdQWsO7F9MDZ77U7tzryymIxTM0bKJJwWmLWTRHOHB3kBz
         0QdTcVPs+bx3xE5raSuWSdYwB8UudP5NdIIFjUACquRLRPn4HrB0aAV+LLLXD/VlDwvv
         g3Bw==
X-Gm-Message-State: AC+VfDxfRJSLfXS61e79vfOOEiYDKNeL76loG8t85qVhHrSUh+Rje5zq
	TcaR+8XEKQIzoWbQvuKuqWWPLQ==
X-Google-Smtp-Source: ACHHUZ6osQDL46P3M+nFsTgwfoyN2ZCBLpMaIBhxVjRNKZnry7+6/FcNKdRpu6hPkSNVLheeDpiVWQ==
X-Received: by 2002:a0d:d98f:0:b0:565:ba4b:aa81 with SMTP id b137-20020a0dd98f000000b00565ba4baa81mr612161ywe.45.1686252072277;
        Thu, 08 Jun 2023 12:21:12 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id f184-20020a0ddcc1000000b00552ccda9bb3sm108635ywe.92.2023.06.08.12.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 12:21:11 -0700 (PDT)
Date: Thu, 8 Jun 2023 12:21:07 -0700 (PDT)
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
Subject: [PATCH v2 10/23] parisc/hugetlb: pte_alloc_huge()
 pte_offset_huge()
In-Reply-To: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
Message-ID: <7963aeed-f7d2-e0-f3c6-3680c5572444@google.com>
References: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_122113_572119_C2389DD0 
X-CRM114-Status: GOOD (  12.87  )
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
---
 arch/parisc/mm/hugetlbpage.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/parisc/mm/hugetlbpage.c b/arch/parisc/mm/hugetlbpage.c
index d1d3990b83f6..a8a1a7c1e16e 100644
--- a/arch/parisc/mm/hugetlbpage.c
+++ b/arch/parisc/mm/hugetlbpage.c
@@ -66,7 +66,7 @@ pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
 	if (pud) {
 		pmd = pmd_alloc(mm, pud, addr);
 		if (pmd)
-			pte = pte_alloc_map(mm, pmd, addr);
+			pte = pte_alloc_huge(mm, pmd, addr);
 	}
 	return pte;
 }
@@ -90,7 +90,7 @@ pte_t *huge_pte_offset(struct mm_struct *mm,
 			if (!pud_none(*pud)) {
 				pmd = pmd_offset(pud, addr);
 				if (!pmd_none(*pmd))
-					pte = pte_offset_map(pmd, addr);
+					pte = pte_offset_huge(pmd, addr);
 			}
 		}
 	}
-- 
2.35.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
