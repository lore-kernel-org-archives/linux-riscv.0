Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0304CC77B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 05:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Pv30/BJjaaItMhMTDWaaB976jKfDa1neye0tcfoovw=; b=k/DAblU0le7UAo
	hyDqfQCqha/fe5hawQNATwbSrRJtYlx7ubw/GklqJ6S0FpRTwprnKZLnqwdBkNhBDSsuk9MBHsR/j
	u/yJ2L54v4yKpgbdTXZ1Yt87r6Wt+gUfF8ZSdo3CrgCtk4J7DA4Ti27aR1enDctehtqYHAj1IQAtB
	WiDNROQ/N5boHz1Q6n8XN1HIbs4YgZZgGHBzsjRZBV6TwF/dKPWk1aR/d+jDEswM56E608cQali9r
	qE+qQelJnDWUySgqrfRPIktSqzydIYvJhzU7OZyT04MLmDW/gsafk8eYXETWqtu06PZJm41tVs0iU
	H3WeasyZTNH96a+O6xqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwbvr-0055dQ-2z;
	Wed, 10 May 2023 05:00:07 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwbvp-0055b4-38
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 05:00:07 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-b9e2b65d006so10158083276.3
        for <linux-riscv@lists.infradead.org>; Tue, 09 May 2023 22:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683694801; x=1686286801;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZMaWjOOzBzTq25y2V3ItGl/gYmS8RRtg1cvEbj+mQng=;
        b=v/0fedI97pPSEeG4JjmhWFM2zERS146SPiMJXKFktyRt8gcu3XnU9flpdOBzk+uwM5
         s0LxqY4B95aIsZsh2mJFZGGaGczJQ5vlt2ZTVgohuP0YCEpkq6BqvaluTpoYqvCHZPxl
         zKN6HOjwjx0yrNqF5dlqaMyYDGE2Vrd5Uv3cHsjFUAt+EAmeWDDRNYI0YlpbNo86b8bG
         Aipz8AqM9zEa9JBFP7+dKHJaNOyMjOSxB2cpapkuH6PjkheDE/u4eOtK4ivf5fV5d230
         xxAVZ1lBfR2A1vI9J151/+XOuCwLBzeq8s5a10eXtHtu5Hbfr7aLXi+072D/bPReNYVX
         IS4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683694801; x=1686286801;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZMaWjOOzBzTq25y2V3ItGl/gYmS8RRtg1cvEbj+mQng=;
        b=Tea5cKtZCNhX2u98uk157XVgFWHgz1GjZdU3ayeyLn0686gwNl32JUtvi1ZfUO15B9
         m0JugV03Eh6UnEbCvUitGK6TqjjHjEr3vpAAWjnI6MKp8jKcWUdyD8iv8Y0VzBwPcXMS
         w6ihS/Qapr0Ao6Ls5kCxM4sAwzgo/f46oBnhXvx76pqV+WcXRQ5nB401/qplp0n0HZPv
         uvLEr+DjQUG6fl84J6qZ3VEZFezyyCBH/ByfkJxu9eccMgorNuSLjseNfYkS3zzi5a88
         38iLk07EjORWdOsiRj4lXGhjJA14+tYHAuEth7r0LKPFnobxuxfmlSBpBC4vxodPknSm
         XrTg==
X-Gm-Message-State: AC+VfDzc2+Nqz4zxJDDXAgBi6DeXWIiDb8qVQT14U1DMnAoVcNsD84Y4
	lil4/e3g4hMjfR9lJi6CweY7iw==
X-Google-Smtp-Source: ACHHUZ52JqpHXNjwopV1qONCz4ZhxlIYDhhrgvgpvQjGO/cy7NhTIg/35E50jddhJVH/CVSemNKwJA==
X-Received: by 2002:a25:a1c8:0:b0:b9d:9500:9d29 with SMTP id a66-20020a25a1c8000000b00b9d95009d29mr17308461ybi.45.1683694801383;
        Tue, 09 May 2023 22:00:01 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id b4-20020a256704000000b00ba2da98431fsm1603597ybc.56.2023.05.09.21.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 22:00:01 -0700 (PDT)
Date: Tue, 9 May 2023 21:59:57 -0700 (PDT)
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
Subject: [PATCH 14/23] riscv/hugetlb: pte_alloc_huge() pte_offset_huge()
In-Reply-To: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
Message-ID: <d1e54510-9ea2-edf-3851-fa7635ce1e5e@google.com>
References: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_220006_012026_E993DC98 
X-CRM114-Status: GOOD (  13.35  )
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
 arch/riscv/mm/hugetlbpage.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index a163a3e0f0d4..80926946759f 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -43,7 +43,7 @@ pte_t *huge_pte_alloc(struct mm_struct *mm,
 
 	for_each_napot_order(order) {
 		if (napot_cont_size(order) == sz) {
-			pte = pte_alloc_map(mm, pmd, addr & napot_cont_mask(order));
+			pte = pte_alloc_huge(mm, pmd, addr & napot_cont_mask(order));
 			break;
 		}
 	}
@@ -90,7 +90,7 @@ pte_t *huge_pte_offset(struct mm_struct *mm,
 
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
