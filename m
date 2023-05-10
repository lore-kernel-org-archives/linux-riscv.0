Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5501C77B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 04:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tl8mltQwQKKszAeGELg4dHmzlYPyRsW0+YhNaGkOjL8=; b=gN6CwayfaEht4i
	q42z8OKeFGrX6wCqH/U8iMfHVPJCyl4SLHrOoaatLCEKQnq+zr69xwg0CHDObEPoMk8LhsGCcJNWe
	toH6ue2SJvbfJ4iRJlFy/5KXcs+vUMHO1WZ5y/wCeZwgNRbAtigSCUnc06i9FHKHxqYyFpEAGrfpa
	LaJA2FZV0bUsQA3grnX515CmbYjFR24PXZuxtJ0FNamVzEKIYEB2x2scF5wpvI3RXNiSTUIMYbfcS
	DUueWDHL8G5dwsLjg8rId0TvtIGGrHikLLXzogssiFDz/T3iXIVu5fBbd/OJFYgwm3JnbZD2Q/w5j
	wH9I+R/FRxoZCXpxKsrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwbod-0054Jx-31;
	Wed, 10 May 2023 04:52:39 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwboa-0054Ia-2d
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 04:52:38 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-559de1d36a9so97972337b3.1
        for <linux-riscv@lists.infradead.org>; Tue, 09 May 2023 21:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683694356; x=1686286356;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=q/pWRyMl+DKjSxR+96RJZ1aR1tS5RvJyhJKXen2hGiQ=;
        b=xdSNWZzA71Dn4PjSJ/2LhqeF5r1JevaGaRgpoS69f1WOD9bhyOsVwChSsl62EbUoE2
         9cnM7TV7zP/+dkaQIS04gEZsgS+3y2H8ZK/Bphg85NyOLG7YB4uljYqtMwzBINkb9uAc
         Qg8lSbjmhMLr4mA9fzJNs5WYmacpWClDgIdvFtjewDeSGePxRCKcQAns2EMoohHps9+8
         S/YpDXqiv4vPhVzyygfg06y+shcq7WCfEpVB4klTCpxP9lMZUivNHG3zXi2wJbvPV+fq
         bKOy9gNDnov9JiPlPv0RSMj3z9ndQZvcZqYURqj9IDWet3DFKA/Lg6LIl2Rd/fMVxLQn
         5Dvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683694356; x=1686286356;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q/pWRyMl+DKjSxR+96RJZ1aR1tS5RvJyhJKXen2hGiQ=;
        b=NQRIuP3jkzU7SQHiYENdm1iS3Szo3EOUFAAqGCuac6MlyFvnuDo/SHkGHDypqJ/WQs
         UerGh/0Ei+J/XrjSIETl8PiKRDeddHbdrPYsIZcYCa5M4Ov2XMSxYAciZefYuEdnMbgO
         PyKv6yWiJOnlLWic/3oOOkGO/kcBdneQjhM1Ga1bedRtMJHgC+opCMyxfT5ljKX4oJKV
         /uTcymHJoVV03J1hCCQ5YJSot6GvryT19weR6KoMyNDqwP14dkX7Mb/r8vjYWeL3D23w
         Yvf5hOiu51szjH/nVdILAIL9DSC7hbOMbVrPc2EuHhYyUv74wibnNHhrsVADhm6PfnFJ
         JRpQ==
X-Gm-Message-State: AC+VfDwXvZGLOqsOpMweWBzPyvfvpbrxoHZm7rTvyRFSt4hJKdc9f2DX
	x5gx17GThJB97xapjTW5+peBlg==
X-Google-Smtp-Source: ACHHUZ6J+F8J+T+3sf+ZeNloEZY2mqXZ4z6wckfThiZ54x80vQ+jP1v1hMPi/dn45eihWxG2Dt7Wzw==
X-Received: by 2002:a25:344e:0:b0:b9d:b79b:3b89 with SMTP id b75-20020a25344e000000b00b9db79b3b89mr17243065yba.18.1683694355907;
        Tue, 09 May 2023 21:52:35 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id h6-20020a258a86000000b00b9a80b9e08esm3435393ybl.12.2023.05.09.21.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 21:52:35 -0700 (PDT)
Date: Tue, 9 May 2023 21:52:31 -0700 (PDT)
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
Subject: [PATCH 08/23] parisc: add pte_unmap() to balance get_ptep()
In-Reply-To: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
Message-ID: <44ebbf90-5fbb-2815-17c7-fcfe3c87d78e@google.com>
References: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_215236_860187_9035889E 
X-CRM114-Status: GOOD (  17.56  )
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
get_ptep().  And (we might as well) pretend that flush_cache_pages()
really needed a map there, to read the pfn before "unmapping".

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 arch/parisc/kernel/cache.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 1d3b8bc8a623..b0c969b3a300 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -425,10 +425,15 @@ void flush_dcache_page(struct page *page)
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
@@ -560,14 +565,20 @@ EXPORT_SYMBOL(flush_kernel_dcache_page_addr);
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
+		needs_flush = pte_needs_flush(*ptep))
+		pte_unmap(ptep);
+	}
+	if (needs_flush)
 		flush_cache_page(vma, vmaddr, pfn);
 }
 
@@ -634,17 +645,22 @@ static void flush_cache_pages(struct vm_area_struct *vma, unsigned long start, u
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
