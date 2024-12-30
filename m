Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 283C4E77188
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Dec 2024 09:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I8mCXOEhoAkkTwvTMZVSvC6sgQ/jZRVJcLn/S1+2b+0=; b=TJrzTe9AC8Ylvo
	8CWmUIP8O7Ljvq+z5uO+v8Fyd0FgqqyzONabEEpigHDOq1rkRPJ2ltzHKqv3K2Ei2mYadIbPdpKIC
	6btg4Tq4Kc5ofgundh0k8ech9MKpyr9XGixk+BF56wRwk429AVmZuk4CNal1G3C4diPXbIa0OCFo9
	P4f6UWsS2Crog2ccaAmZ88yT2+lBhLx3eUoX8CZqP1wnu8mfGtr4xd79U6Yqo7NI0LRRphQqtHIdL
	bHEQZHqvZ1KAl2dCXmcAkOUYkb6qdK3FtOOK9MsdjRc6js6fkCfRPj+84GATr3HdezQrBUNuxA1d4
	pZj0KuATzW/kxwsP9ksw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSBwD-00000004uwA-499r;
	Mon, 30 Dec 2024 09:19:50 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSBn2-00000004sYE-31Wt
	for linux-riscv@lists.infradead.org;
	Mon, 30 Dec 2024 09:10:22 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-21619108a6bso107029155ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 30 Dec 2024 01:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735549820; x=1736154620; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qA0mhWnXo6upWemI3POPEc6VJyAkyxFJggkOB6WNq2k=;
        b=Ay2uO+oQ9ZMicfGr72kTrpArfMgM+qu9/EQQXyZsrBVmvr23JWeprgDQ2+6sI1hpJ4
         JdvfOn1jwbmINmY1bNDeKZE80+23mwEdHaQPvHNwhmXoTm6GABGs80obK9M/LMAXPBuW
         S1S+jlbtczzK5eQSeyOTtbsQQ7KMBR5NdQi4pquEjJLOg1fJ1D3jnoL7Gx5za4Keqdd7
         Jo7C8V8NKapS2Z3esQUeQUG+ikT6plcas5uWhVM+MdvU0kSUMNwNRYSuz5tR+cs4nAFb
         RQqJ/0UW/7tTzAnUl3acQMN5rckarCy2yPx2vsG/6LtZlMBNuAe6ngjGPU7C29EtQ3/D
         W0fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735549820; x=1736154620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qA0mhWnXo6upWemI3POPEc6VJyAkyxFJggkOB6WNq2k=;
        b=NhMsI3oxBGkV6yoFIXX2P/whjA7A70kSp6W8qylNbXC2Aqn1JOOH/0RyEPqKRx8eQ6
         QQPF9MszOxBTbJyuLtHyfQcIpJRHjIOu41SAXLPSkzthKhMU5datYn+FUQbbAzib1QZD
         pda5aCT7CS5zhRCec1/x/RGr390CFNLqB0XKqS+K/6ogMQGlVgX8Kk/8JmSIpUrGsjbl
         y8DzmkVeG2uq8u8HB4dfVNBa2QxlacNf/Qb7KKAlQ87DGzkfZkTB571KsfuxIw/i46EA
         kMecTKXA632U8BCCGmXGgWeTFKSTROEbNtmL5RZIOO7LGp+LxoafdXjQLD0kWXYlyJLF
         A3bQ==
X-Forwarded-Encrypted: i=1; AJvYcCXI63WcHuKglQJ8+vOiZ2u6WHVeYQVW63eVae8AT+T4e6/V8TtRByi+oBPVouv3RVM/XMqaj/+cFRrEOg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzMr2myymHxObM2yaccbTnxKlVPsuxNdQf/UjYczYojeGGVI+ZG
	sTdH/kHC9twKJKMC1dxMXDTHNihgLiC3VHtwZSxh5VELFSO8NGOcblcmvh6pzk8=
X-Gm-Gg: ASbGnctz0rZPLhFoZm/9hXXmRmOXD1Ddx2tK/zLg61AhnI8GuCXUqSX1N1jOq0fhfSm
	r7FLdqoLi6uCG9NLSVUclo7nlNfqiLzx/usB64EmLb8DnhwrteqOcFwdxecTCbM//Ilr4qXIwVH
	fh0Ow7ITiOvfl/qdHZVJVR25WT4ylj1ij72du2v283hhRb5WUfd0f0RqJJ4GLzq8O/4FzbrGfHD
	0e5n0xqcXtoZJfX8pIm1CQz2pqFE1DboUtKMleRZk4TzdOC1ikt4KpDoWwxLHyqJn0Iw3CVlIts
	j0UxTPFZQ9qZHTdZHlKepA==
X-Google-Smtp-Source: AGHT+IFX/3Df8AQRXbgF3uoP6h0ZSX98E/foDuPWt5IdgjLk00IpLZqU8w+lhMMb/JJOCncpjT7B0g==
X-Received: by 2002:a05:6a21:670b:b0:1dc:7907:6d67 with SMTP id adf61e73a8af0-1e5e081c8d0mr60502051637.40.1735549820172;
        Mon, 30 Dec 2024 01:10:20 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842aba72f7csm17057841a12.4.2024.12.30.01.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 01:10:19 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
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
Subject: [PATCH v4 08/15] arm: pgtable: move pagetable_dtor() to __tlb_remove_table()
Date: Mon, 30 Dec 2024 17:07:43 +0800
Message-Id: <955162bfbbcd9fbb3b074e1fe2aef4f64b61d6f9.1735549103.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1735549103.git.zhengqi.arch@bytedance.com>
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_011020_810717_D66341E9 
X-CRM114-Status: GOOD (  10.30  )
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
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm/include/asm/tlb.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm/include/asm/tlb.h b/arch/arm/include/asm/tlb.h
index ef79bf1e8563f..264ab635e807a 100644
--- a/arch/arm/include/asm/tlb.h
+++ b/arch/arm/include/asm/tlb.h
@@ -26,12 +26,14 @@
 
 #else /* !CONFIG_MMU */
 
-#include <linux/swap.h>
 #include <asm/tlbflush.h>
 
 static inline void __tlb_remove_table(void *_table)
 {
-	free_page_and_swap_cache((struct page *)_table);
+	struct ptdesc *ptdesc = (struct ptdesc *)_table;
+
+	pagetable_dtor(ptdesc);
+	pagetable_free(ptdesc);
 }
 
 #include <asm-generic/tlb.h>
@@ -41,8 +43,6 @@ __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte, unsigned long addr)
 {
 	struct ptdesc *ptdesc = page_ptdesc(pte);
 
-	pagetable_dtor(ptdesc);
-
 #ifndef CONFIG_ARM_LPAE
 	/*
 	 * With the classic ARM MMU, a pte page has two corresponding pmd
@@ -61,7 +61,6 @@ __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmdp, unsigned long addr)
 #ifdef CONFIG_ARM_LPAE
 	struct ptdesc *ptdesc = virt_to_ptdesc(pmdp);
 
-	pagetable_dtor(ptdesc);
 	tlb_remove_ptdesc(tlb, ptdesc);
 #endif
 }
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
