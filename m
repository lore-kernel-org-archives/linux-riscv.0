Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DAE0C7EE29
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 19:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HkG/bnR8Xqiaj4cUPlPjZOPTDCrkFu1qmAILA01kEV0=; b=N+sR2sSXqLAb6J
	fFqiN/THIynzQW/TLPR2TY9rIk/cHiZ9SEBtC2xlJIzN0+YoM/nmB8PcNO0QUhCkt/DuF2rU3rGPm
	vnUzwjlp5qITVEZm95HsUyDNhW5hvpu9gjr9Y4pA8US/Mxhi5hFQfq1/uLvzhXwD6gKqLNetp8Zaq
	GAqzZok8VUkRKT607iN+brL4+ag7HpsgNA7i/41vARk5AKD3WKBT8cMIVRfRCpR2U6OQmp37ydzJo
	AKRJbtceZyQkyhkKPomH3KB9gp0x/kKiweKcdswgoqsNKNyqFIFcUYSeSqh+JFcnWXRARmR69OhSr
	gqORAd3mBagk0CCrCYSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7L7S-00AIpr-1G;
	Thu, 08 Jun 2023 19:16:26 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7L7O-00AImy-2d
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jun 2023 19:16:24 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-39c82204e62so33591b6e.1
        for <linux-riscv@lists.infradead.org>; Thu, 08 Jun 2023 12:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686251779; x=1688843779;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fUQgmWpeb8XZ+Q95Ceu0Qoh2H5+Z0fgN6mScmqt4vh8=;
        b=Xts+xHOkrh/u1lklJ9jF3D7S9f/kLV8GPG892l7zD8MlHgN8wPrMqgrCwto/Q1X+Pk
         W1+dBhBpd/nxZGkRw7Je76Rv8ScIxWS7YhmGg7SCpWHyKB1Cka/5vVCHo+mJDQWdRl3m
         u500Id80G1EkjsXNB0mtCuxFaZBYzNUs8Dvvd2LdfZ44ADa4Y8aQBNX2j9WdcdQ881QF
         GqyzpCVHN9rDUPFg5SeHYjmoNQ/CJXz81UrJdT3zX813tHx7kBAl3bNlJp8cLIqFQaDy
         L3QDpbP/aGZ6VEQHFKJzDm28XHlRNu1JajJiE2WmrxtPA9CVcv6EWsa+OLyEs2Vz0giA
         l8jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686251779; x=1688843779;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fUQgmWpeb8XZ+Q95Ceu0Qoh2H5+Z0fgN6mScmqt4vh8=;
        b=fEsKfkmMVVMdhfpHKhDUjSWF8rve4aF0Dzx1zRUFqQlzVj7qS0e85C38UV4ad+7GSY
         U48ziqLT30+kPRcG6KChDlqupv6iaOV56zbNaqnmViKN46q6zDvvIiLFVSWXS0L3I+HT
         khC+L6QPrQu/jnwTA/mWJX5iReVn+YHmFEe5zwL8XlG+Kf3eNvekk9p3wOfR7czyRURE
         8emLSrtgAQmMPlQzaTXQD73o0+1NM68d73IyACMefnOllVys+iSM+U6HcTE9xqJ5LCd8
         a1DXY2ufdzxqqL/eEcdbl2nbI6U4ic1VmgugDuWjpH/Qhn/jMNPJP19tRZIjYf/10WwF
         meIA==
X-Gm-Message-State: AC+VfDyByjjEe/UadjJfSYMgSUFWkKQg6YfRX9iqaAGLLjTrjrtcsn1u
	cTBmCW0IQjthZG2ehjn44+Ne0g==
X-Google-Smtp-Source: ACHHUZ7LNWBjev2z0u+SFnM7tyBRgdoNXbEUc0/f74NGgApbHQPTQerveZROpTXi1Z/8SDXbKzu99A==
X-Received: by 2002:aca:650c:0:b0:39b:da91:8749 with SMTP id m12-20020aca650c000000b0039bda918749mr6427430oim.50.1686251778936;
        Thu, 08 Jun 2023 12:16:18 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id h200-20020a816cd1000000b0055aafcef659sm120593ywc.5.2023.06.08.12.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 12:16:18 -0700 (PDT)
Date: Thu, 8 Jun 2023 12:16:14 -0700 (PDT)
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
Subject: [PATCH v2 06/23] microblaze: allow pte_offset_map() to fail
In-Reply-To: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
Message-ID: <eab66faf-c0ab-3a8f-47bf-8a7c5af638f@google.com>
References: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_121622_859038_95365308 
X-CRM114-Status: GOOD (  13.63  )
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

In rare transient cases, not yet made possible, pte_offset_map() and
pte_offset_map_lock() may not find a page table: handle appropriately.

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 arch/microblaze/kernel/signal.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/microblaze/kernel/signal.c b/arch/microblaze/kernel/signal.c
index c3aebec71c0c..c78a0ff48066 100644
--- a/arch/microblaze/kernel/signal.c
+++ b/arch/microblaze/kernel/signal.c
@@ -194,7 +194,7 @@ static int setup_rt_frame(struct ksignal *ksig, sigset_t *set,
 
 	preempt_disable();
 	ptep = pte_offset_map(pmdp, address);
-	if (pte_present(*ptep)) {
+	if (ptep && pte_present(*ptep)) {
 		address = (unsigned long) page_address(pte_page(*ptep));
 		/* MS: I need add offset in page */
 		address += ((unsigned long)frame->tramp) & ~PAGE_MASK;
@@ -203,7 +203,8 @@ static int setup_rt_frame(struct ksignal *ksig, sigset_t *set,
 		invalidate_icache_range(address, address + 8);
 		flush_dcache_range(address, address + 8);
 	}
-	pte_unmap(ptep);
+	if (ptep)
+		pte_unmap(ptep);
 	preempt_enable();
 	if (err)
 		return -EFAULT;
-- 
2.35.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
