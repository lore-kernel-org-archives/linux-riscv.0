Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F381DC7EE2E
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jun 2023 08:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qGpTeHpNByCbR+rXgCKERTYqeGdeAMmgVtp/EiGz4pQ=; b=tZZA7CTcVhYxRL
	LLG4My00DStVzk8reD8qKv5kWi8LvWq15VJ4TE/PF4uFKMybItP1WSIAXm9LIpfFjOdZVPh0pfBgF
	RV82wOpkk2jdHhl62eQp7PY+HPv4PmOxLJENxsuD8+LWuikhZ9bw77WusQbNBJthSf9vzRQsodZR6
	6m8ZRQV6jjNFOnBhvlGQQQhJfTIhg30B+s3mXCXLV1vm+c3b4rB7HCTbdusxSVoUqv6hbuK3vdeMR
	SuxmL2TZwpqxLJ0VUWOZPg4SRx0r1ON6beYIX6prUMjLDjfIOmVPRDngHjavGiDDcqkgpIOes0NPX
	jh8ObC8sRyY+ux8vcoRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7XBG-00CBAu-1l;
	Fri, 09 Jun 2023 08:09:10 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7XBD-00CB9I-1S
	for linux-riscv@lists.infradead.org;
	Fri, 09 Jun 2023 08:09:08 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-565e6beb7aaso13701817b3.2
        for <linux-riscv@lists.infradead.org>; Fri, 09 Jun 2023 01:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686298146; x=1688890146;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=D+JG9ScbeIgWCoIoD1lrBSynxF7pZ7ZmtCOtSuAlDGQ=;
        b=RfeoHUBLwqk9vTTBDLCpOuzNXpllWDEkPYc6yjXtxGCPNmX/rvie991AU10lJs4XbF
         9RzbOtcSEpi5Rh8KstlxITQN3Ffo4ROyfYENBHFqs9HkcG3CFgO7j5lBQrxeeGMGBjp2
         NZdxOQon49qNf9HZ1Qgrz3xC18+gnVg36Hvk5SsHYUm7h4j5tszvUdFL2KV4ehwHCBOk
         gyj3AdqSIMMtQdGmRCxc7HYtfEU+n7ezPeWYkyEIY3KjdS94V8qvWswp+jF2hFiGMFim
         NoPZGExtzKBOx7SOm5zC/zUvIhzRSqstVSVI3uYZkXeW9ex9SLXGk6aLeA5PY5ojGjGB
         epOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686298146; x=1688890146;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D+JG9ScbeIgWCoIoD1lrBSynxF7pZ7ZmtCOtSuAlDGQ=;
        b=FT/MboedOILSPzm82VtyGyMYvk0fFrMMB3iqpEAWzc1eDzGMVNRDDuETn9xsuwyLkY
         1Eo9gr0Ua2npq2jc/OgJsspX3Mn2YHfDqEOtEqoz71I7o+GTzGjhnMbkM2yI99W7BLDR
         WRfzAescpu1txTZJrkxCYbGvuzJ2T7pDIVq3gM8NeRFWU0UG0PXXTIqsdjhd0IiYQw/3
         B5+lf5Nq0c7rvTe2xUun1IAqLNGLUuMQuZdLzMd//u1354cYeM2UtK9ujc7ofdEHHNjT
         1W8r2DrkdhjsAg9fKSgYuQnl9NgBJNcLRciVa265aIsWPPFcvzpbmvZBdoq7R7fc5wO8
         2Vzw==
X-Gm-Message-State: AC+VfDxwgPkR8b0+pZ2rhJs6zNXBHT/XU7NoTkuVYwe1R8F375yZSdBt
	AAwOC3SBTuG3bTqNRJNltP6SMA==
X-Google-Smtp-Source: ACHHUZ5DQYcZ9JTl8EUp4l7QLImYygbjncdx8ql55YYe3IsFqc7F1XNEab87Po2zAxMo3TGE3P0BfA==
X-Received: by 2002:a0d:e684:0:b0:565:e87f:a78f with SMTP id p126-20020a0de684000000b00565e87fa78fmr500342ywe.25.1686298145738;
        Fri, 09 Jun 2023 01:09:05 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id n19-20020a819c53000000b005688f7596ccsm453200ywa.78.2023.06.09.01.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 01:09:04 -0700 (PDT)
Date: Fri, 9 Jun 2023 01:08:52 -0700 (PDT)
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
Subject: [PATCH v2 07/23 fix] mips: update_mmu_cache() can replace __update_tlb():
 fix
In-Reply-To: <178970b0-1539-8aac-76fd-972c6c46ec17@google.com>
Message-ID: <6852be98-64e6-6092-d1c-13124b97bc75@google.com>
References: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com> <178970b0-1539-8aac-76fd-972c6c46ec17@google.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_010907_487509_2C7FFA85 
X-CRM114-Status: GOOD (  14.20  )
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

I expect this to fix the
arch/mips/mm/tlb-r4k.c:300:16: warning: variable 'pmdp' set but not used
reported by the kernel test robot; but I am uncomfortable rearranging
lines in this tlb_probe_hazard() area, and would be glad for review and
testing by someone familiar with mips - thanks in advance!

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202306091304.cNVIspK0-lkp@intel.com/
Signed-off-by: Hugh Dickins <hughd@google.com>
---
 arch/mips/mm/tlb-r4k.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/mips/mm/tlb-r4k.c b/arch/mips/mm/tlb-r4k.c
index c96725d17cab..80fc90d8d2f1 100644
--- a/arch/mips/mm/tlb-r4k.c
+++ b/arch/mips/mm/tlb-r4k.c
@@ -293,11 +293,13 @@ void local_flush_tlb_one(unsigned long page)
 void update_mmu_cache(struct vm_area_struct *vma,
 		      unsigned long address, pte_t *ptep)
 {
-	unsigned long flags;
+#ifdef CONFIG_MIPS_HUGE_TLB_SUPPORT
 	pgd_t *pgdp;
 	p4d_t *p4dp;
 	pud_t *pudp;
 	pmd_t *pmdp;
+#endif
+	unsigned long flags;
 	int idx, pid;
 
 	/*
@@ -316,15 +318,15 @@ void update_mmu_cache(struct vm_area_struct *vma,
 		pid = read_c0_entryhi() & cpu_asid_mask(&current_cpu_data);
 		write_c0_entryhi(address | pid);
 	}
-	pgdp = pgd_offset(vma->vm_mm, address);
 	mtc0_tlbw_hazard();
 	tlb_probe();
 	tlb_probe_hazard();
+	idx = read_c0_index();
+#ifdef CONFIG_MIPS_HUGE_TLB_SUPPORT
+	pgdp = pgd_offset(vma->vm_mm, address);
 	p4dp = p4d_offset(pgdp, address);
 	pudp = pud_offset(p4dp, address);
 	pmdp = pmd_offset(pudp, address);
-	idx = read_c0_index();
-#ifdef CONFIG_MIPS_HUGE_TLB_SUPPORT
 	/* this could be a huge page  */
 	if (ptep == (pte_t *)pmdp) {
 		unsigned long lo;
-- 
2.35.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
