Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EDB2E7719A
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jan 2025 07:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yi90s/GwDT71H8rooIsUKjD1uCqK9lUyeijqC8LPm00=; b=vLqJe5CtysE9Tn
	1BZXw0PfusU8xEVT8E4ksRk3fWMDerH+tJ5ELJdPfm1NM6T07J5D+kaC2tgRcWpEcDsZVDfntchLw
	hUEc1FkmXXhIxkgJ5KiMPcukyf0lEfcxgmCYcL0ornpmqMwLcoxcB5tBRTS5BKryUdXzII1CZGxJF
	A8Z5q3W9LjWXe8/AMmKGt9VHuRTuLcJTgDc11V1oof6vwpDa2lDN6RAjbG8zWnfHpjnYCyS/9fAoW
	XvXEidlNsjaC153ZiT+F9PbWMExVm+ZcsuJGDKzfP44QtG6uCw492blTUrJRhADyVOoAF+shk3/nY
	OBCenDVw/ahaWb/XaMpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVQHj-00000007Oal-29DO;
	Wed, 08 Jan 2025 07:15:23 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVQ4N-00000007L8f-2n5r
	for linux-riscv@lists.infradead.org;
	Wed, 08 Jan 2025 07:01:37 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-21680814d42so205554865ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 07 Jan 2025 23:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736319695; x=1736924495; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HOmYFC5rDCHPndkDeYhMazAtFRSG5eQpr+EJP/iMn+M=;
        b=gqu+isMJ+NTsLZgmpi5F3hmHO5Gfm9kHp3GW3Md+8UiOY06aK+Z0md8ELh8SQ4VupA
         rLRgKBNzP/BVjM5TJAAdLN5ealulZyib3MNJB912NVDUnSxeq1DcXmS8s56ekwfo6ztP
         tgqn2oG6Wx7JV3P9hlkHncJKBewAZ+pZoCvq9r86RwN3JrVk4WHEO9APmeUvJFNNRhb/
         G8pHPbyBZZMinBG+NT119zGbxqRYtC4iDdy39wCRiTf36ujHPCVLin24F3fFJ1aB/S5M
         fVy3TvqXoVQqhBScuKV2TE8xFMUe4vVIrWMnFFj3CHw3Fhwzs95qwfUbLG4t5U7N/Pgr
         YiDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736319695; x=1736924495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HOmYFC5rDCHPndkDeYhMazAtFRSG5eQpr+EJP/iMn+M=;
        b=otqq2vUyD4kOZNPQCKdV4JNjFUowfGl3Xg1N2yJGPk0zbONXLwvtr90JYBgYrf3Wut
         1Y4AFMwiiypWx5u7kCuJmFbIczaJ/T6ReS9mQgEqMA6KTCHzYDkeSFUP+WrMt/LFp2p1
         heXO+qPyxLBxH4WGpuPLwD6fTUOzoVuaX8xiQUcRKRC604bOHpFcvSmZWHbXY6XOSnW3
         yBE7mfR8589d9kkpYfuP+oIlMePZFm11VNeRi0hGMrrSL9+BeKBPAUaD9XHI8krMaIyH
         FYblU3rFMiCstXV2Hmw5sgHrhqJbzhMks4FCd0mgzUmTtYpSDfcEk+/6CmjInwAlB80x
         IFGA==
X-Forwarded-Encrypted: i=1; AJvYcCVbWXyWhPuCAc0vxxiDHN7pJgRWNok5VrKsTULoTvAcamGZgHK02ACAedIvuicf+rp8mDaFulQ+YyULog==@lists.infradead.org
X-Gm-Message-State: AOJu0YwZMTew6UHanq1e88axR/Il0EuWPfS8JrB9cwKgaVqAaFZ1oLI3
	OxTiz2oUWrA9PuVPwfgn73TVf1ogx5xOlDBMzilD+0oCRv9B4BYFcne0QCgS+BE=
X-Gm-Gg: ASbGncv/TX4J9fVv6yBGShzAr0iPC7ZNWsRI5Xdpt38xmR3dGU/vpg1Nn8uUdJTVP47
	yebV9aUKITRcJ2gZo0UPx87namZhvwfyTlKs1aqTYL7R2nHIBeltKsSy3n2/OOdQ688sk+hPGAc
	5iFNLViMIPbUG04IBt/wSRl0LPBenZiSTNkC4LmlVXfEnWHOCXWf05+voyhnXW2hnVeV3xOxVhP
	X96cQe2O4B40WMTNx3VhnKsAFp6fhgMFzcc6swSsDC3MYxS2rmNVI8kvICuuUEjzE/xHIqgLqJv
	cWlRpGuozyU/GoZFRaZ9JL+f1W4=
X-Google-Smtp-Source: AGHT+IG2O0LK8ylHfVSG3OwO7HgAN7h4l7Hu7AhiZODZJ2StNi5+XwyqKLd4EhZPQDdK0Gl46ps1VQ==
X-Received: by 2002:a17:902:d50d:b0:215:7421:27c with SMTP id d9443c01a7336-21a83f696a9mr29561025ad.29.1736319695027;
        Tue, 07 Jan 2025 23:01:35 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca023a3sm320067275ad.250.2025.01.07.23.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 23:01:34 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	alex@ghiti.fr,
	andreas@gaisler.com,
	palmer@dabbelt.com,
	tglx@linutronix.de,
	david@redhat.com,
	jannh@google.com,
	hughd@google.com,
	yuzhao@google.com,
	willy@infradead.org,
	muchun.song@linux.dev,
	vbabka@kernel.org,
	lorenzo.stoakes@oracle.com,
	akpm@linux-foundation.org,
	rientjes@google.com,
	vishal.moola@gmail.com,
	arnd@arndb.de,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	dave.hansen@linux.intel.com,
	rppt@kernel.org,
	ryan.roberts@arm.com
Cc: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v5 09/17] arm64: pgtable: move pagetable_dtor() to __tlb_remove_table()
Date: Wed,  8 Jan 2025 14:57:25 +0800
Message-Id: <cf4b847caf390f96a3e3d534dacb2c174e16c154.1736317725.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1736317725.git.zhengqi.arch@bytedance.com>
References: <cover.1736317725.git.zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_230135_723045_FBEC09E9 
X-CRM114-Status: GOOD (  10.24  )
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

Move pagetable_dtor() to __tlb_remove_table(), so that ptlock and page
table pages can be freed together (regardless of whether RCU is used).
This prevents the use-after-free problem where the ptlock is freed
immediately but the page table pages is freed later via RCU.

Page tables shouldn't have swap cache, so use pagetable_free() instead of
free_page_and_swap_cache() to free page table pages.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm64/include/asm/tlb.h | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/tlb.h b/arch/arm64/include/asm/tlb.h
index 408d0f36a8a8f..93591a80b5bfb 100644
--- a/arch/arm64/include/asm/tlb.h
+++ b/arch/arm64/include/asm/tlb.h
@@ -9,11 +9,13 @@
 #define __ASM_TLB_H
 
 #include <linux/pagemap.h>
-#include <linux/swap.h>
 
 static inline void __tlb_remove_table(void *_table)
 {
-	free_page_and_swap_cache((struct page *)_table);
+	struct ptdesc *ptdesc = (struct ptdesc *)_table;
+
+	pagetable_dtor(ptdesc);
+	pagetable_free(ptdesc);
 }
 
 #define tlb_flush tlb_flush
@@ -82,7 +84,6 @@ static inline void __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte,
 {
 	struct ptdesc *ptdesc = page_ptdesc(pte);
 
-	pagetable_dtor(ptdesc);
 	tlb_remove_ptdesc(tlb, ptdesc);
 }
 
@@ -92,7 +93,6 @@ static inline void __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmdp,
 {
 	struct ptdesc *ptdesc = virt_to_ptdesc(pmdp);
 
-	pagetable_dtor(ptdesc);
 	tlb_remove_ptdesc(tlb, ptdesc);
 }
 #endif
@@ -106,7 +106,6 @@ static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pudp,
 	if (!pgtable_l4_enabled())
 		return;
 
-	pagetable_dtor(ptdesc);
 	tlb_remove_ptdesc(tlb, ptdesc);
 }
 #endif
@@ -120,7 +119,6 @@ static inline void __p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4dp,
 	if (!pgtable_l5_enabled())
 		return;
 
-	pagetable_dtor(ptdesc);
 	tlb_remove_ptdesc(tlb, ptdesc);
 }
 #endif
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
