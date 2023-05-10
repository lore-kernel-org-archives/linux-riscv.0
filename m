Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0124CC7EE24
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 04:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Td835b2Xu5US0P1witVWqxFXwCqslEcLyEFxdVqZmNU=; b=azmXF7Poh7EiiW
	/sRYl61H0eUBvN4Gby9iDIMariuDY0xavQCsbCFjd2usd0yyI+QL/fEcd4MCGFyApkyEjy+7vdquM
	MJoGFTmCbgjldShiXGFCvD4lwnSOHvj9doh6XCWt0ru7nCA8EB+lnd87VxUG8N0Pl5AGmwBePu8Sl
	l9FGd9NhMOzti3EabdYxx/zr7zzrj6zJwoEMUq1kdo96k4I8jIKaYkhIDrgC481yNhg5irH/OH1Ud
	mJq3IqlQR0cQNq7GrjV9hZVt7b3aWeQzaEHFRBYQ7mACOAbTewlZZYaZaBFjRAjM/gZ0RmgUfo706
	etxK+07dmUvZB2a9Zn+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwbui-0055Ps-1q;
	Wed, 10 May 2023 04:58:56 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwbuf-0055OU-1c
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 04:58:54 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-55a10577911so98140167b3.0
        for <linux-riscv@lists.infradead.org>; Tue, 09 May 2023 21:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683694732; x=1686286732;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=i7vs80eeAHoowuGiB3IXr1R0pQ52ZVhylKFRPge1iSc=;
        b=P9kK3Ha7kM6a70P/N9uB2lWXrssqQgUHBWNV/ZpJwPmg2mPzx8gUi6+Y5U3HPMDHz9
         0fAlFOi/bTART9baPPENUGYRX+MazYzuiDcAIMOosxi9lXkJsm3mNsaLjOWtnLwgcry5
         sP0r/lFyFBNCqz3voFtKwARlNZyj767HfljqLFdQYp3UaORt42cJzHdk0VN4kJ5NQH/7
         DWlXvI97puE4OaBtmUgMd/qH5Lin+XJ2aRjT13gN8vWtWVfPYNVNo8e918/mLGqALa1y
         O7U3+kDK92dAzqxBb57AmVgMsRrk/0cmMw+aKo8waotZHzpB3mgtMwAgWyIj42FB5uoU
         5erQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683694732; x=1686286732;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i7vs80eeAHoowuGiB3IXr1R0pQ52ZVhylKFRPge1iSc=;
        b=E2KmTkbgWyN+N8ZY4DipqZ6RunxQ/fRb3dcgHJdvL9WZiyk5O+2E6ntwzUQXYbpuo+
         oAXkczL/bxRwAuPXLHGliPxDs6Oy3sXFRZbBdYLaVqLlJJWA0x8WNP0T0wXzBiDWkUue
         4Xm/xnxlujfiSuVXdhmNdjQEDORI2FCFUjVFujUvzainnWR1WVNbug7CHkaTXTZIYnzI
         P5hewDS1oIygF9VxgDn9GBp4N1AmQq0VY0BRrcWcrfM2mEeNNxxACCMBfyuw14JyD413
         AFl46kuy8yT227pqxcueUmLFpu9XY0cuuq9EXpsOQzMAKtQ337BvtSFSYnEoArzXD9sH
         tpQQ==
X-Gm-Message-State: AC+VfDyNGXKBD3tgX3h1ePwPctGfbr3+RYhSCrrL6bR2b/GcuOxilfqn
	m1vsuZE+cDZP1JC7BC3YkbI0mQ==
X-Google-Smtp-Source: ACHHUZ6HrZAnm+aaG2sOhULY3F7mb+ht2GRzSsBKsJ/KT5tYwkiRpQQy7lJKEHctJdijcfVx9gaq3w==
X-Received: by 2002:a25:d352:0:b0:ba2:16b6:b11e with SMTP id e79-20020a25d352000000b00ba216b6b11emr16144172ybf.0.1683694732647;
        Tue, 09 May 2023 21:58:52 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id h66-20020a252145000000b00b9550fcb12fsm3461906ybh.64.2023.05.09.21.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 21:58:52 -0700 (PDT)
Date: Tue, 9 May 2023 21:58:48 -0700 (PDT)
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
Subject: [PATCH 13/23] powerpc/hugetlb: pte_alloc_huge()
In-Reply-To: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
Message-ID: <1a3ee4d4-a829-35d4-d94e-885d5d4d6a8a@google.com>
References: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_215853_539258_8F165E4D 
X-CRM114-Status: GOOD (  13.37  )
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
