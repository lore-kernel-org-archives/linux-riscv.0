Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A64F1C7EE25
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 04:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hVpt9v54Y5EW+aFoiZwyA2fLHWYnZo/tjYRY1KIcTkw=; b=PLfz2N85JwVqnS
	rMVWFX+aOlYijqDcxMwVu5gyG8+jbpRS4JNbTQZIgOMg1nMccBhvKYYAbLpd9+iP3MlJgpOwE4haO
	r75QGNsMvt0M1Q5Nnjq3CwWyGXG2EpVWEGjtAt/l7phcFUzx0hPQ/LXwf+EnImjMD5VfS+WyZlsvs
	SRlJ5rGbN7OswNc5XgeH9uyCiJDjmeZLG0jFhqWWL83lFIDCtXmBrdhQg64mbI9TnDQ+XcFppexDR
	jEbJa8Upatu64EoPVn9eZKH9fY2YHJsUwm19VhnG+O/0Lg6Llki7gyfJPgc3RUNlITxxYvWFhaW/6
	lhAZMvAxCa6SHDo+DGWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwbrM-0054ti-27;
	Wed, 10 May 2023 04:55:28 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwbrJ-0054s8-1Z
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 04:55:27 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-55a14807e4cso121007327b3.1
        for <linux-riscv@lists.infradead.org>; Tue, 09 May 2023 21:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683694524; x=1686286524;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=alKFmwAdxdkIViw1WjkjX/OCKeQtR2IpGs2zcY6rd0M=;
        b=x62YCY0VbtXBlAlTlrXst8L8I4Klp5jHuIkAXWeopDmvUXAbp7vfKzA00bYNToXaoh
         jicsfIaPz1O7U+TdGvn8r6E/DcCNuMjdSP+L+rcocZxL69l/kttcZnaGKZv3QHFP73NA
         pwziDs2dpT8TywS3eBGCmWf5OZTvKDvRn5iqAcCmFi7ZDxOpEnJaXZsg4chuls0Conw6
         1BHyDKqM9ymKdiyVbkRMd5EkORJUOPu5k/Dt9X7/wDI/4JSqAZEDqusgNEXsSQSkAunQ
         L5ABejKB++Tm9XQd6rM3WeiGICDJg3QSoGYLUowekQIKv98a1U+1e3RQQ2gzWsEHyeuU
         f9fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683694524; x=1686286524;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=alKFmwAdxdkIViw1WjkjX/OCKeQtR2IpGs2zcY6rd0M=;
        b=EFi0sViwBRuvsQm1+zHUVtQsbMAmRYm47ZuwRd6hSX8Xy+WgBBybMqGx6ne0Ja9k/l
         Z7eR/v+RFCR5U2GhIE32uG1MffkIE8DsFg4TiIiGiHHd9SB0BqQUUZSb+C2OUlLf9QuX
         b1xd1JJ68dgYo3vM+HnasopafUujOtol9QofYOLOFrQvT6w9YKDweWzlx6q4hrlofr/P
         ZXhd5aPoiAG/qb1e9zmsz7Kz2JjYtRRv594G1EK5cUVn4qsMsZPsD+slg06OD43JhsiC
         dKTF+s47eGCXafPgh0B3ONyOEO3+fJCh2V7eWL7VawzUSeXk8mWPnO17x+/RSzqcquQ8
         STBQ==
X-Gm-Message-State: AC+VfDwuqXER9khj8kOVs8rxHw6dUNxGjcwqIEfeQOJar8w+mEEgPkbm
	6UhPFJJ2TZBwPPOUOhw/Gz/0aA==
X-Google-Smtp-Source: ACHHUZ64xP5yCWBSXd1pkCU9S6oVULY9BGDq0OyW51W97Dv6Ixjw6iQVWcUZjR+Rvr+uTi8eh8kq2A==
X-Received: by 2002:a0d:f545:0:b0:55a:ab98:a2ef with SMTP id e66-20020a0df545000000b0055aab98a2efmr17944134ywf.40.1683694524456;
        Tue, 09 May 2023 21:55:24 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id c1-20020a81df01000000b0055a29ec6504sm3793706ywn.81.2023.05.09.21.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 21:55:24 -0700 (PDT)
Date: Tue, 9 May 2023 21:55:20 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
cc: Mike Kravetz <mike.kravetz@oracle.com>, Mike Rapoport <rppt@kernel.org>, 
    "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
    Matthew Wilcox <willy@infradead.org>, David Hildenbrand <david@redhat.com>, 
    Suren Baghdasaryan <surenb@google.com>, 
    Qi Zheng <zhengqi.arch@bytedance.com>, 
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
    John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
    "David S. Miller" <davem@davemloft.net>, Chris Zankel <chris@zankel.net>, 
    Max Filippov <jcmvbkbc@gmail.com>, x86@kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, 
    linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
    linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
    linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
    linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH 10/23] parisc/hugetlb: pte_alloc_huge() pte_offset_huge()
In-Reply-To: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
Message-ID: <8552705d-e0c1-a3a6-c26b-b887d4f61288@google.com>
References: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_215525_528368_D3361DD8 
X-CRM114-Status: GOOD (  13.06  )
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
