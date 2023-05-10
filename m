Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 557B1C7EE22
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 04:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HkG/bnR8Xqiaj4cUPlPjZOPTDCrkFu1qmAILA01kEV0=; b=Q9Bs2u8OrSgf1N
	Am+fse/HwOV2GSNObL10oIcwny9WEfC1fiDUr4XVUtbn6RSQjGD76+f4wcWwATCMKlTgcKmbF95Br
	aslCuW9tSid+B3k+u6KSAwMbLQbIq7oTu7jLfOYNvyuX8dDQdgDVnqAD675h6hpnogETUieEdrfHe
	dRzBBFr+eBjVNJTXhWdrHAKC+A1bXkK9bWUB8v9TqBUvdK4CJ4VcHrU1I8ckNkOYMIs/f9QrXk3Ri
	xXCsm5RE3u3PHxYVSM+pOqcDwABJdrY3UpVWrMcEB5d7/7N8OP643DrULFx9qWFJNigdV0PT437Sc
	Cfl9Qje43WJQJCok+byQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwblc-0053sJ-36;
	Wed, 10 May 2023 04:49:32 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwbla-0053pv-11
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 04:49:31 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-b9a6eec8611so34126256276.0
        for <linux-riscv@lists.infradead.org>; Tue, 09 May 2023 21:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683694167; x=1686286167;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fUQgmWpeb8XZ+Q95Ceu0Qoh2H5+Z0fgN6mScmqt4vh8=;
        b=UYgN7SHJ+Kw138ag8h0xP8PheSyb+TyI5VHSIDjj4n9RShp4GncXL3XJ5EHxhXiibK
         bWM2WA341yCPavofD2L+dwTh/k8wbtnqGHGh+6b5/c/SY6HIHVlS/8x1ncbIt6FJFxer
         ySWLGEH9EXtIKdzeP4dp9W7nQnr+88zaaLX+AbAlYcn/Ke5bUTdA+Amtpc+UhTK8ZOe6
         nlHKHHzGDYa0yETI6dqk3ia7Fkbq7SWABYpcMHvXrsQB+4fKcTN3DFHn/90Y6UPXvP9F
         JN8mOaRS8n0XqBndVMSP+yTIoj8bABXUPMMg0RRYx7fWa70GyDb3jL+GXnDzUgXw6flR
         jauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683694167; x=1686286167;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fUQgmWpeb8XZ+Q95Ceu0Qoh2H5+Z0fgN6mScmqt4vh8=;
        b=JRjbIzmBia95f6uE511JzRSNPhTnMc/1R8he2THh5lLBvjZ93hnMumgC/NTf7+rsHr
         fJWuPT/R1OjlkGEVPTg49egbyOMrlK21Y8q9mBQnk6nOykl8IgLDN8DrPIfJvmBP1XIF
         g6CBrm3RwFWBE7FX2qRSykh5B0qy6AJZo4Yeo6psGR4FoPDr5+gyyXrxnOwq2d3iBENC
         dqQjZPqZyxFxzXpA1Fm66HolJS2oVnAx6e8vHWJtKiwC0hOFTXtW4JtZNlTFE/Z7cBOy
         zvHuVVoi0qmWHqT9o7IYRyHlK3VYVN2WmPRi7q2awZpV6WQOcA0iISeXg9bSovQju8TO
         zVXw==
X-Gm-Message-State: AC+VfDz4lVmuDK4ujfV1cBjCuBW5V+6TGLYMgLtRS7OFNnGusBMZIMQL
	4vNooUTwyd16otmpS9M65f1J2Q==
X-Google-Smtp-Source: ACHHUZ4tqpw6+aM6rxWFz6kp/xXo9T82LwXaR685ltqxNG0QuiQjYqghFAwvEDZVatjZsBeLNAG4xw==
X-Received: by 2002:a0d:c604:0:b0:55a:3502:d2ca with SMTP id i4-20020a0dc604000000b0055a3502d2camr16180522ywd.13.1683694166794;
        Tue, 09 May 2023 21:49:26 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id h67-20020a0df746000000b0054601a8399csm18738ywf.119.2023.05.09.21.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 21:49:26 -0700 (PDT)
Date: Tue, 9 May 2023 21:49:22 -0700 (PDT)
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
Subject: [PATCH 06/23] microblaze: allow pte_offset_map() to fail
In-Reply-To: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
Message-ID: <12141321-df3-a8bf-18e-e27d13f24b74@google.com>
References: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_214930_353820_93034910 
X-CRM114-Status: GOOD (  13.82  )
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
