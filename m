Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C23C7EE22
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 05:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8VzXakGnK2Hs2uc7+RavU+w+QioIGIUEFtwDSwRoxfA=; b=n4OjKZXQm48zfV
	DVUeKaiRji8pP+n7EErUHtFd6RtkUXcLHkGgi1W6hAyKxSb7uPJrocPrIV7k1pcTFtcpwXkW01MV+
	J7fKqDKfKoUkaAHQJDL225F4kqQWybzWX9cCEhE6Yx4YPkU8/Hmv8w/WAzIYPyBko9cMD/4sIg7FD
	8IjkfdA+tu7lZwWE1nq8hn0iZ2Ub5y0gWLZCvZHEV1VhyYludsiN3eYI/X0UHrnRtfu0s81bKqEkn
	E8PsOVHEoksTGEzx3uxOIwfYLnbnHhm9xHq1X41nsXxGgVOjvSV865fkrYINMTB0cfg1pwSWsIHk1
	KdJh8YTTB2R2ZB96AQog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwbzR-0056Aq-0B;
	Wed, 10 May 2023 05:03:49 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwbzN-005693-2i
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 05:03:47 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-55a79671a4dso104271187b3.2
        for <linux-riscv@lists.infradead.org>; Tue, 09 May 2023 22:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683695024; x=1686287024;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mCwP+3tlZqvvMSbN25I242CI8N2o4w3/6RVIlVlj13g=;
        b=f+IDJIOxeE7pBv/ncUF3Dg8yBdNeigyWPgONUVZVc2EQnlwiXg/VQTMZqIyi1FwbhF
         hB12dPYWMlW78XVP1iXq4ueyFowA50D/X9k7kSng633zgtc6Ft9O69KyiELqvbNIUVet
         ZV3CNBYMAMk1NaEigxnnVZgnTZDfN2Zgt7qDs5DqEMg/xKQN3cvE2DpHKAZxvYja2q57
         EzxbR8ATmL4FQRq126r5Vter9+9PB+pvzYqq8Q0Kq08+IAz0Ct1bpmRKsD6HzoQSgfyW
         CVzetCsMpC4GogX7r4Ise+/fDJ+qVHJTfa1OEDnQ873jx9nxbHKiO6uVblFCp5x/gnEx
         bWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683695024; x=1686287024;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mCwP+3tlZqvvMSbN25I242CI8N2o4w3/6RVIlVlj13g=;
        b=Kzj42QXJTg81Qp/F90V6uDmXm1LY3sZBfRYCGD3LbiZlDFbxYWXEGoEiOrrTjdJvXk
         RjiF+R2YJ6lhGUFTLJqCjnv69N99j7V0/vc1HJ8MS6HEFskwh+lCcx+zh+KS0hT2TGNg
         orZxXig+ZdCHPAbJ05QvXmtMfzbBH8paEWi2B6DXuGzkkFba3BDAsYbl67mVuKrXru0h
         EbBsjeDB1LlnOw1ZUzRQlQ6JL/FHlkf9gyz+kXNwu78j0Ik+4DYmVrNWg5B+HTkURcGA
         HtwfAqHipeRlUUniBCp5HOuyVjIj7CsVS6FDLCOt4+QICZbkwCTSHe9gGuZH/uPpfPkn
         QB7g==
X-Gm-Message-State: AC+VfDwSgoO2WfgC1FpXc8Rnn7+wes9vZJX5kxPJTg7/0v4HbNtZR+1j
	ta0zBnbsBTlqw8uIgcSQj1RKaA==
X-Google-Smtp-Source: ACHHUZ57BibEP8l5nJ6F5+RjmWOH1yRU/GU0ORzVTyycrrSkC73g/4H986WkI3WYpSdD5+TSi7jmbQ==
X-Received: by 2002:a81:6c42:0:b0:55a:1022:7814 with SMTP id h63-20020a816c42000000b0055a10227814mr19292393ywc.28.1683695023901;
        Tue, 09 May 2023 22:03:43 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id i189-20020a816dc6000000b005463239c01esm3871312ywc.51.2023.05.09.22.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 22:03:43 -0700 (PDT)
Date: Tue, 9 May 2023 22:03:39 -0700 (PDT)
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
Subject: [PATCH 17/23] sh/hugetlb: pte_alloc_huge() pte_offset_huge()
In-Reply-To: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
Message-ID: <85eeffe5-95f2-2574-365e-c9af663c8672@google.com>
References: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_220345_884241_55E0C6DC 
X-CRM114-Status: GOOD (  13.10  )
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
 arch/sh/mm/hugetlbpage.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/sh/mm/hugetlbpage.c b/arch/sh/mm/hugetlbpage.c
index 999ab5916e69..6cb0ad73dbb9 100644
--- a/arch/sh/mm/hugetlbpage.c
+++ b/arch/sh/mm/hugetlbpage.c
@@ -38,7 +38,7 @@ pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
 			if (pud) {
 				pmd = pmd_alloc(mm, pud, addr);
 				if (pmd)
-					pte = pte_alloc_map(mm, pmd, addr);
+					pte = pte_alloc_huge(mm, pmd, addr);
 			}
 		}
 	}
@@ -63,7 +63,7 @@ pte_t *huge_pte_offset(struct mm_struct *mm,
 			if (pud) {
 				pmd = pmd_offset(pud, addr);
 				if (pmd)
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
