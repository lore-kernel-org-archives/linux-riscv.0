Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F27FC7EE22
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 04:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eyQwzVsaoQdHiXJKl2pXqaoDydAOYxGGT0GoRXWSsRg=; b=0eogscyNrBViOM
	q+tbaDLZhfPJrtYJw3Vq2yjRIm8OZncs0TMooyGt0a0fLKlhrpEC8zyI2IDNBgFbFXqCa+wGhdiQN
	st9ZPX3nwCx2/QCJCL2noHIAmb5QGEJHFF/2Dgt7mT3U9XbaaiCcjaDdzOy5zLJtDQW6LF2i/NTME
	hBDU8osgJKkC15cxoMgehIDZImVyYbspWckTmOJzS7q2e3DTSyIQQE3N36+/xwAspSS8Jg7w/R7Vo
	tHfoLTlA05nMvB/QBEMmCTlIgbxthK3ZP91WdUYkToIaY/ZFwDzbNoau+xpX4fASgIrFPHwDjLdXl
	0IliQW3wQ+LeiuKpSTww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwbjU-0053Oc-1z;
	Wed, 10 May 2023 04:47:20 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwbjR-0053Ma-1W
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 04:47:19 +0000
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-b9a7e639656so10168420276.0
        for <linux-riscv@lists.infradead.org>; Tue, 09 May 2023 21:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683694036; x=1686286036;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hqbvyW6crf6toTfKG311uSxHzLZVjYgM3m9zpPIhyDA=;
        b=o+pw/FxefUIAOoasXSGcewgZKtzCiK6gey4asLS52yE6RcSKCLcg/5+Oke4t4tL5mt
         WY+uEeh7LusBVdVQVoeJLXBzhVEJAgg/+wrnr5YnLWD3Y+xgGcCb1JLs6JvP8/f0rR6I
         tOIJAEnPqeFziCHRIMxBgLXFbcRpC1yoUKiEwz+VxRsKMOaCzI+eqG6JH5jyJ802ZkSp
         N+BiAknrKD5ka0lvzxWcjKQzAZAWQASg3Zoa2F4mVxsPlzCTR7qCguvvguU/AtX+AHcL
         WDe1lJ7cP45MCFknO9sG2YoZVBoQ/kny4LfOudEYqHVSkK2nfJ78GhDEjEHbvmzj6Rt9
         PQHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683694036; x=1686286036;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hqbvyW6crf6toTfKG311uSxHzLZVjYgM3m9zpPIhyDA=;
        b=bgvYpiOzOPwMXzYOWrxok9ZLGh/hRB8hsye7D+bAzpWVZ5xWEk7C/zgUmhuMNm3MIi
         qKII0nYDfSsVEN1xFkr0RiDCDtFT8LvaPM8Aigm0aJqfLuHon8EDK0EfrX0XN8YkQOLX
         lY1bW6m2X2uiHQhgBmEm6lcrVkLp2/nMiN100j+JUq8CWGkEVxrf1wtd75y3rGfFuqYV
         IVJTnQZo0Yav8W8CZu4IW2ne4oxafuzmvMv7yRBs+S2NxhjF6jFo23QGJDrk+1M6Xotx
         Zg/54nwpcvIPoaxHjnzxqadRMUmz1HZHou3UVx1w9Rzojm7k6fR8PCqpAsQMzUqc2tfA
         vjHQ==
X-Gm-Message-State: AC+VfDxhB0wMPN3IEYlkNkc7xreB4WmfFFfQVpnvzTPck42d9nTq+t1v
	kjuV9HGf4zIYRl+My5V/txv1XQ==
X-Google-Smtp-Source: ACHHUZ7chwpqHYv2bkU0Ao/t6DWECrNjxiYg/IB0spMttiifVb5o/XZ8DrM/lCVX0msD4U/PtCIM9g==
X-Received: by 2002:a05:6902:1883:b0:b9d:58d9:8c with SMTP id cj3-20020a056902188300b00b9d58d9008cmr22251628ybb.11.1683694035986;
        Tue, 09 May 2023 21:47:15 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 185-20020a2506c2000000b00b9dc4620f95sm3505720ybg.6.2023.05.09.21.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 21:47:15 -0700 (PDT)
Date: Tue, 9 May 2023 21:47:11 -0700 (PDT)
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
Subject: [PATCH 04/23] ia64/hugetlb: pte_alloc_huge() pte_offset_huge()
In-Reply-To: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
Message-ID: <baef2acf-7368-79a-a27-a87c2f2dfcb@google.com>
References: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_214717_508041_056904DC 
X-CRM114-Status: GOOD (  13.17  )
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
 arch/ia64/mm/hugetlbpage.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/ia64/mm/hugetlbpage.c b/arch/ia64/mm/hugetlbpage.c
index 78a02e026164..adc49f2d22e8 100644
--- a/arch/ia64/mm/hugetlbpage.c
+++ b/arch/ia64/mm/hugetlbpage.c
@@ -41,7 +41,7 @@ huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
 	if (pud) {
 		pmd = pmd_alloc(mm, pud, taddr);
 		if (pmd)
-			pte = pte_alloc_map(mm, pmd, taddr);
+			pte = pte_alloc_huge(mm, pmd, taddr);
 	}
 	return pte;
 }
@@ -64,7 +64,7 @@ huge_pte_offset (struct mm_struct *mm, unsigned long addr, unsigned long sz)
 			if (pud_present(*pud)) {
 				pmd = pmd_offset(pud, taddr);
 				if (pmd_present(*pmd))
-					pte = pte_offset_map(pmd, taddr);
+					pte = pte_offset_huge(pmd, taddr);
 			}
 		}
 	}
-- 
2.35.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
