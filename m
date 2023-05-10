Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A84C77B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 05:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DgE4yXabn3QK8U6v6QIRqpud9gcysWbSMK7Ux85qoUw=; b=EynOIKV/D36GgM
	waqJrg8ECzIPlG53yBontoIfDCPd2rLHjr8CJ9M/igOeWKD2lKkropKYhbu/XDDA7bYUMccM9Qc1K
	Z4JZSkAUVm0kblUBXx0qYuQeEl9VgPMs326+Ad8czHMg/A8vjWFfOFgCMOLBmgfmAFO1BuMiRIz98
	mhjrypj9kzGC2rNEAD+gaopUUv/x0Zv3NXVpgAzWuLOQvotT3lBiQHHgz2HSRqCHMsPdeR+Y4637I
	XeA4O8FqDJzIdP+e7Zm9Jx1LrP+Ho39lecMqtOKMt//ovOhU6pFqif35txTm0vxfmH+o7o+qu7sqS
	r6f6+5SBZ2ix7QuKTgdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwc0T-0056Lt-2G;
	Wed, 10 May 2023 05:04:53 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwc0R-0056Kp-1J
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 05:04:52 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-55a214572e8so104475877b3.0
        for <linux-riscv@lists.infradead.org>; Tue, 09 May 2023 22:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683695090; x=1686287090;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LRrENG7fj4nSEA3qiqmp7KZ6RwcG7U0j5SldGyBNlNI=;
        b=QuBkLiQNgKJXlZ/XtUu/Zcc1TO/yNvtmxeCEZWPuo0Ut+/Dr2uj7N/fYaVeLSLWaoT
         dm0LsrTZl+fdsuIU70XZlX8Jdat219pOrdD5tmXxlOJq6I9xvJ8OBX2I3sC2/GzC7pIG
         XUtWl6K8CddosokWCD5JWnq8C0Qt/Y0GNquPBcUW8sOkTJGqV76KRSYlIi1jOPSqgjjT
         xhQu7yGeLyA8b6NgZMivw3GAn6e1+z3lgr3LgyDkQncSxt5H12sTmgDyT6BBdhQ0rxwG
         mDoCtTBYmNMU6XzQs1MJn/66oGLzS3WRb3BIObV6fJVnQHGlEpGSXCP7I8vkrI+sg4mt
         TgtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683695090; x=1686287090;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LRrENG7fj4nSEA3qiqmp7KZ6RwcG7U0j5SldGyBNlNI=;
        b=WJIT4x9EY7LmmrT/Pucl7EzZL7vu9JjgBgIUWYpS2p8SUpVQA+7JpUlM1F1a6QPmnX
         x91eoRldGuqimUHRNH3tg4ynqCNuO2IzQJiBxHzLUAfD34IRTz/RBff/7+ZNs78Lf2KR
         RD7g9ViujBSE5BNLKowGvsLNvTY1cfL92Dfx0BjQ4hzlR454/RiLOP0eWcPM0sikb42v
         8d4x4KWpSu/JxfpI4Dm5I92pThs4jvWot3H63BtdWcYQRTXhbQZa18BWZ1pb3Lypf91k
         oBAIkmGN8PqIwHlvmbHmjUiv2NZn2VA87w5tUKKBWzGa6fpx62RJTGyK+4iuaxY6jDSM
         VuJg==
X-Gm-Message-State: AC+VfDy8a5b/KX12eRJDfBw/GVJZ3L/TT9epLJtj5wq67GRIXH2fwxe4
	+iGzx/Om621jw1IZPKNL4LKn0w==
X-Google-Smtp-Source: ACHHUZ53GGioj5bo+FVmOpbhwfbbVyWZfbgJBuIz6ozNT3hKZWLtYauVGFRQKbnj4naBNbfMS7YmUw==
X-Received: by 2002:a81:488c:0:b0:55a:6769:1197 with SMTP id v134-20020a81488c000000b0055a67691197mr18307004ywa.41.1683695090358;
        Tue, 09 May 2023 22:04:50 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id z184-20020a8189c1000000b00560beb1c97bsm948270ywf.97.2023.05.09.22.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 22:04:50 -0700 (PDT)
Date: Tue, 9 May 2023 22:04:46 -0700 (PDT)
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
Subject: [PATCH 18/23] sparc/hugetlb: pte_alloc_huge() pte_offset_huge()
In-Reply-To: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
Message-ID: <da29d71e-111-65d5-eb7f-5ad97e406e70@google.com>
References: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_220451_453580_DB06DC4B 
X-CRM114-Status: GOOD (  12.82  )
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
 arch/sparc/mm/hugetlbpage.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/sparc/mm/hugetlbpage.c b/arch/sparc/mm/hugetlbpage.c
index d8e0e3c7038d..d7018823206c 100644
--- a/arch/sparc/mm/hugetlbpage.c
+++ b/arch/sparc/mm/hugetlbpage.c
@@ -298,7 +298,7 @@ pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
 		return NULL;
 	if (sz >= PMD_SIZE)
 		return (pte_t *)pmd;
-	return pte_alloc_map(mm, pmd, addr);
+	return pte_alloc_huge(mm, pmd, addr);
 }
 
 pte_t *huge_pte_offset(struct mm_struct *mm,
@@ -325,7 +325,7 @@ pte_t *huge_pte_offset(struct mm_struct *mm,
 		return NULL;
 	if (is_hugetlb_pmd(*pmd))
 		return (pte_t *)pmd;
-	return pte_offset_map(pmd, addr);
+	return pte_offset_huge(pmd, addr);
 }
 
 void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
-- 
2.35.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
