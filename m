Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33DD2C7EE29
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 19:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Da43WPMZ7wstLddhgKt8Z8kUCya/gN//77qXFg8Oz4g=; b=eZK36SejpzMUjN
	hYGbgqzLNU/YVTg1n01RCBh0bLhxn79eGxCfrHYI1en7TlcsCmdCjorBG2cHDVwV/JFpkvCwL/1RQ
	5mNh1wZb8uH+och5jRW3o67Q+o3zsmOvXlDg9h7uBpkH6RBG5HrQRNBV7EkbS7vfaiEBS0GNl66fM
	XgfrxGf/is/mgOuOCzUDoQfKLA/rm5bJXS6tjI9dVcTfTmi2Ye6Ma6cmpK6nddA8ZEnla1szVPIDS
	FkbQy4DkwZ5ySrfFmpW9a2r8CVZ4/3sS0y2mJDKJAPolqhSpLuART565KMTrZprzs15p7GbSqQYtv
	0lYWvearfr1m4IChCOYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7LSI-00AP1b-0l;
	Thu, 08 Jun 2023 19:37:58 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7LSE-00AOyt-0e
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jun 2023 19:37:56 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-568af2f6454so8891407b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 08 Jun 2023 12:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686253073; x=1688845073;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4B5saBu/vw3gaGnlmIPZ9pQkqfzbj7+JgYM5jpygjcc=;
        b=wrjU6S4EMiU3Ufcg2KZPT551Y8sNhg4QKjD2hAgSPlGh9yj39Rxf3Ke0FjcZO6VxtG
         ALh4CVjSqM9GtJPRdIfEgNIlV/EEkptkG6e4IMSsrcpQSqGrj44uojyylNmPW3FhQBzm
         h+3YVxQpJctPazelaypN7o1DBk1YFmyjCLOyVuE0ZSJNDZN1IWkDf39Bng35IMFfYc2S
         OuTO6+N3JH4bhYslynL29X9VjGEwK1A0ffza+fgs91l3oerVxPUep2x461PcKgDhp6i7
         yNPgK4idQjhQRO3vK4IICQL9mYykeSLt5G3Lqvr2ymPPunZsH8KwR6J1BbGlfhLHc47C
         HKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686253073; x=1688845073;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4B5saBu/vw3gaGnlmIPZ9pQkqfzbj7+JgYM5jpygjcc=;
        b=XuAlcDobB7yu0VKRQLhf+FtL1UkM7+RBcCGnYyhg4ZXoQeS95cK6dFNMIepKAelnAG
         jQArJ5jlfmYXpyqG4PGTmggNj8W7lE/qZBAPFhyVouFN5a+KOctlXReP1BNBjQ//g2Ac
         BB4Y8gpb6Eh9vGzfRugngIOp4tD7Vp7fGuVoZGiCnGZul6WS00nI30p2qJKpmND0xdch
         4yQck+sAGqJ1XhYCcnX57bpKE1ENZvErOo7NWvI6Jt3dfrZ8s4W0YkZXriJelo6QKCEY
         RhI4MRmJlQ2LurDE99cZcF0LOHi/UyXuROWL/tsMgAdq88UPeF6WrEIhoxfZSKIzD38v
         Ph/g==
X-Gm-Message-State: AC+VfDw6+iY9bEfPsTVrzjq5Hr27pXc3Jd2jtDTs82PL6ali1pGGA67i
	cjlZotXIe9C95jnkzGo7pZGfXg==
X-Google-Smtp-Source: ACHHUZ7Ebli0p9041CLEfO4CyQQvBmxN41VJwJsuM0MQnf822wu8ZsrJRZ2ru1aILLAWUog5xqYpmw==
X-Received: by 2002:a81:72d4:0:b0:560:f6ae:a71b with SMTP id n203-20020a8172d4000000b00560f6aea71bmr508956ywc.48.1686253073290;
        Thu, 08 Jun 2023 12:37:53 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id i133-20020a816d8b000000b0056953ab06c5sm114950ywc.95.2023.06.08.12.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 12:37:52 -0700 (PDT)
Date: Thu, 8 Jun 2023 12:37:48 -0700 (PDT)
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
Subject: [PATCH v2 23/23] xtensa: add pte_unmap() to balance
 pte_offset_map()
In-Reply-To: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
Message-ID: <ab2581eb-daa6-894e-4aa6-97c81de3b8c@google.com>
References: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_123754_244631_2D780B4B 
X-CRM114-Status: GOOD (  13.48  )
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

To keep balance in future, remember to pte_unmap() after a successful
pte_offset_map().  And act as if get_pte_for_vaddr() really needs a map
there, to read the pteval before "unmapping", to be sure page table is
not removed.

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 arch/xtensa/mm/tlb.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/xtensa/mm/tlb.c b/arch/xtensa/mm/tlb.c
index 27a477dae232..0a11fc5f185b 100644
--- a/arch/xtensa/mm/tlb.c
+++ b/arch/xtensa/mm/tlb.c
@@ -179,6 +179,7 @@ static unsigned get_pte_for_vaddr(unsigned vaddr)
 	pud_t *pud;
 	pmd_t *pmd;
 	pte_t *pte;
+	unsigned int pteval;
 
 	if (!mm)
 		mm = task->active_mm;
@@ -197,7 +198,9 @@ static unsigned get_pte_for_vaddr(unsigned vaddr)
 	pte = pte_offset_map(pmd, vaddr);
 	if (!pte)
 		return 0;
-	return pte_val(*pte);
+	pteval = pte_val(*pte);
+	pte_unmap(pte);
+	return pteval;
 }
 
 enum {
-- 
2.35.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
