Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B9DEC7EE2E
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 19:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v845klhp5pwEQoHqv/Arov4eUglFaxYUO2LhClAScb0=; b=aPRECeBdy1+3KE
	/zFs6srwE0/I95hrBkXRY7KXeRcp9JBBxSvPcLCR+oM2Dl3rKOigcSfA59YuJbeXVOB8vdcpuu1AL
	Lmm1nHJJ1gz9jTZDoS0D9TjKRki+KGeUrq+rZ1CYoocqlwqOgQTVo9kjPPh5WVAKIwKz2NYtWJY/B
	hy8DXLGHVTIa/z1ruabZV9/TL+Dfaif+RSZ9c7x8jRWte0iSOVMRsyP1hil7AbHdgBXyj2qMOriQU
	4zrfMI7bGtfvdX3V+WV9dKv5kwWmjvsi6r5KGkFR64ltGipiOPYMiF6P6OEmTR9NEvZJg/u1Sj6+f
	mQXHwmBJYEe8V31Hykdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7L9h-00AJWU-0V;
	Thu, 08 Jun 2023 19:18:45 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7L9e-00AJUO-1l
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jun 2023 19:18:43 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-bacfa9fa329so1078208276.0
        for <linux-riscv@lists.infradead.org>; Thu, 08 Jun 2023 12:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686251920; x=1688843920;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WLKDOkdQ4oq0ww1Vlfy/KRTEhctwBXtXyzZrgpalkvM=;
        b=HEwZycAEZshzMQG1RY6xWzkEzRNEN/UEaemUkYXNmWskdkmVKrA8S+97io6IqWp9/V
         /Ki/r1s4TSfiiefdOd1an7zeCiAQCXani7OPWb0Yu0dH1JXoMBV7ddckrsj8wmhXsvpX
         lxVVQwwTUjyQXS/CCeF4VIDT1g2/zM6/NDtUcqQOoZLozwlnlFrDor/PrqoADqkak2qo
         deaYgmKHf6xqfmf4KVoYNd/vj1wQpn8eoXEC4WQqeZC4WPbGo41LYWdy4IN4tXqheqG/
         6B0lxLrh+XpboJCYpvDK5+1gNhnxK8xFzRPNdKypeMnMcoGI/ayoAWXa0T/S7aKkyUXg
         eIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686251920; x=1688843920;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WLKDOkdQ4oq0ww1Vlfy/KRTEhctwBXtXyzZrgpalkvM=;
        b=SQjBvrzOXDOlPFb/3lNRmgsmt7zZUxwI02y7H135YExgBfB0TDkffYL+YiGuFRtrct
         i1Ld/8Qw+1+c5/rvtaL9eViiI4yGW3+BEEi6D+bzq3VoM34eAGxW/PR4yI4xeMtBhKiC
         xho5+BYhgLj+A8yKQIfoyM8q0ZDwRxC2z4GC2oLdcBT2Vgp+beOZ913lIKxuw6L8IFwm
         pLFli3/8cB73iV1E4Csc0t0cFZIXXfTXGvQjEK99Ctq02SGWrqFh7Ho2i5MRtf5jDxJh
         IFxuAm367IRP3wtpzHFcTP0RdChEmYif4cxK9LcDXzzg4bDUDLeNUOrB93D/w9A6swYZ
         Sbsw==
X-Gm-Message-State: AC+VfDyfrT8bTSekwdfAIUFgVn7/r0WjJU+ulzOxY8jhcTzTC6DGbD1z
	PQu9EPuIgSloJT4vNuaDCEgysA==
X-Google-Smtp-Source: ACHHUZ78uQ3KAa2UlmiLkPkJ1ItAoVICWyvDzVcoJt54uwUIKvQ1XvbxMYD2Oe7/oQdSR2X0isfU0g==
X-Received: by 2002:a25:e307:0:b0:ba8:7f98:4afa with SMTP id z7-20020a25e307000000b00ba87f984afamr579046ybd.26.1686251920409;
        Thu, 08 Jun 2023 12:18:40 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 22-20020a250316000000b00bb2f5dda19bsm432908ybd.47.2023.06.08.12.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 12:18:39 -0700 (PDT)
Date: Thu, 8 Jun 2023 12:18:35 -0700 (PDT)
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
Subject: [PATCH v2 08/23] parisc: add pte_unmap() to balance get_ptep()
In-Reply-To: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
Message-ID: <653369-95ef-acd2-d6ea-e95f5a997493@google.com>
References: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_121842_584213_976414D6 
X-CRM114-Status: GOOD (  17.13  )
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
get_ptep().  And act as if flush_cache_pages() really needs a map there,
to read the pfn before "unmapping", to be sure page table is not removed.

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 arch/parisc/kernel/cache.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index ca4a302d4365..501160250bb7 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -426,10 +426,15 @@ void flush_dcache_page(struct page *page)
 		offset = (pgoff - mpnt->vm_pgoff) << PAGE_SHIFT;
 		addr = mpnt->vm_start + offset;
 		if (parisc_requires_coherency()) {
+			bool needs_flush = false;
 			pte_t *ptep;
 
 			ptep = get_ptep(mpnt->vm_mm, addr);
-			if (ptep && pte_needs_flush(*ptep))
+			if (ptep) {
+				needs_flush = pte_needs_flush(*ptep);
+				pte_unmap(ptep);
+			}
+			if (needs_flush)
 				flush_user_cache_page(mpnt, addr);
 		} else {
 			/*
@@ -561,14 +566,20 @@ EXPORT_SYMBOL(flush_kernel_dcache_page_addr);
 static void flush_cache_page_if_present(struct vm_area_struct *vma,
 	unsigned long vmaddr, unsigned long pfn)
 {
-	pte_t *ptep = get_ptep(vma->vm_mm, vmaddr);
+	bool needs_flush = false;
+	pte_t *ptep;
 
 	/*
 	 * The pte check is racy and sometimes the flush will trigger
 	 * a non-access TLB miss. Hopefully, the page has already been
 	 * flushed.
 	 */
-	if (ptep && pte_needs_flush(*ptep))
+	ptep = get_ptep(vma->vm_mm, vmaddr);
+	if (ptep) {
+		needs_flush = pte_needs_flush(*ptep);
+		pte_unmap(ptep);
+	}
+	if (needs_flush)
 		flush_cache_page(vma, vmaddr, pfn);
 }
 
@@ -635,17 +646,22 @@ static void flush_cache_pages(struct vm_area_struct *vma, unsigned long start, u
 	pte_t *ptep;
 
 	for (addr = start; addr < end; addr += PAGE_SIZE) {
+		bool needs_flush = false;
 		/*
 		 * The vma can contain pages that aren't present. Although
 		 * the pte search is expensive, we need the pte to find the
 		 * page pfn and to check whether the page should be flushed.
 		 */
 		ptep = get_ptep(vma->vm_mm, addr);
-		if (ptep && pte_needs_flush(*ptep)) {
+		if (ptep) {
+			needs_flush = pte_needs_flush(*ptep);
+			pfn = pte_pfn(*ptep);
+			pte_unmap(ptep);
+		}
+		if (needs_flush) {
 			if (parisc_requires_coherency()) {
 				flush_user_cache_page(vma, addr);
 			} else {
-				pfn = pte_pfn(*ptep);
 				if (WARN_ON(!pfn_valid(pfn)))
 					return;
 				__flush_cache_page(vma, addr, PFN_PHYS(pfn));
-- 
2.35.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
