Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E117FC47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 04:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qcvpCEED0It/EbtQ04L50Y4KCybYxBmXEmNm2oR6zQM=; b=MrK2E5XlaPTbq2
	+HWq87RmbIEBHB6+uPhrWG3z2UOpGjTlSlZ+oNbvVKAmhfOxjWWD8NLM2dohAmMxL2N+xnraNT6rc
	XQDfyE8cqofPJFoxsqQPCg/HbADM7dSJXw45nC0Oqx6CM3p+g2rABmR0ToK7QQPY2vpLHVpCmB6lX
	6CYVPsVBPx7knYaN8oc952LAbfuaOBam2USA/dbvjv5Bx2xA9YNhONhmngz2tqR1ynb6s+WLE4+F4
	1Hq4IHeuPG95McJyKfTLqTtJ01IZwxIHvj5g2P1YBrI/tO74lzJE5PfzH7BcF64S9m2oetSMroNGO
	Co+tHXkkcEBmwLUsbIFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpLFu-00000007SU6-1aV4;
	Wed, 27 Mar 2024 04:51:18 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpLFb-00000007SCZ-44DA
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 04:51:03 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-5a4817189c8so3716064eaf.1
        for <linux-riscv@lists.infradead.org>; Tue, 26 Mar 2024 21:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711515057; x=1712119857; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A+Ju3+5NsQ7zqLi78mVdBh82QtKzTZZzrfFOA+rFDFs=;
        b=b+NGbJGayM7JfvvbQ5CZzTposj+4Z3Ftg8bnqzEk1jW8sRKB7wYbf6K0g6CaGiWDNQ
         cLQUyeoJKG15i1cu5gZxP0waak/MD1wUxSv2UtRzMMEZkDWVn57UO3C+mHnCgA0nb+ah
         Q6mHElMaV+l/WSEOgiLFMuiGPJJOmlCev44N/zsQvH45Ju3CBLjNuE1I3sBs0nAt2S+s
         kVErFSe3kOHJ3dExtkTH9BCPN+oFpbnPtLYPndR81mbTxJls10132Fs84crlJia8BCzH
         ldC2tsOCdUq7At1zZ/JJw2a4BW+ORvOkxqZ2Y0Z5rdOX5taO3mt0+JdFXvnD9ojJzr+h
         NndA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711515057; x=1712119857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A+Ju3+5NsQ7zqLi78mVdBh82QtKzTZZzrfFOA+rFDFs=;
        b=NviCz3JyAFQn093bMye4buk+OsN+0J+42BHrJD4ub2fenlm4VGhT+PMIodTf7GnUxf
         hRgbgLaAFqS67vYAGQ6TW6TX0GDNzmO9h4loBogC6IoQukIrM448CgLQYmI4vPQKFPAx
         WV9pEygq+8zzqbAkomR8RsM34GuFuEi1eBzc5KJTeN43vg5UQJWgc1R8o8nxZ7JBgX2u
         /J4cfQiLvAErQp+FU4+AcpfFw86L4ry0fi7y+Lm2BV1RLs9jhujOvS9bJCgTAaRKGu6r
         0O5Wz4VLKvK4BZyu8e4RS4n+6n2B+gbhdKJ8d00rKB60smi9k+l+/qb0U7XIox5/pBAG
         zBAA==
X-Forwarded-Encrypted: i=1; AJvYcCXFLIrrP0Hof7ZbM7JtPHyal88kuvqWgQfT5j/VXWtq7PzM/FJzIU5qi+tRz434Ea1GSKp0D6tFTVUr7jtcyl6+I43CmdGGBGusjtZQtpkc
X-Gm-Message-State: AOJu0YzoQ7i8StdLBS+7plpzVGn+t/3DZ8wjCcDo0vzsNRafe+V+alOq
	1wwvT1OW5VcUb/rcvBQ9tmpBT4A1rNkPlbemQrSKTnPQ6bmPli3mrTXJwTmtvb4=
X-Google-Smtp-Source: AGHT+IE4clbeICIX6LaCSNcjSNKRNzkyOLoTskHKcKR+t8ek8fOhgjRruwacqNmtd1HR0FedGGJk+g==
X-Received: by 2002:a05:6358:6397:b0:17e:c8d9:328 with SMTP id k23-20020a056358639700b0017ec8d90328mr5244771rwh.11.1711515057489;
        Tue, 26 Mar 2024 21:50:57 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id e31-20020a63501f000000b005e4666261besm8351500pgb.50.2024.03.26.21.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 21:50:56 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v6 10/13] riscv: mm: Use a fixed layout for the MM context ID
Date: Tue, 26 Mar 2024 21:49:51 -0700
Message-ID: <20240327045035.368512-11-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240327045035.368512-1-samuel.holland@sifive.com>
References: <20240327045035.368512-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_215100_394179_B83FB282 
X-CRM114-Status: GOOD (  12.60  )
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

Currently, the size of the ASID field in the MM context ID dynamically
depends on the number of hardware-supported ASID bits. This requires
reading a global variable to extract either field from the context ID.
Instead, allocate the maximum possible number of bits to the ASID field,
so the layout of the context ID is known at compile-time.

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

 arch/riscv/include/asm/mmu.h      | 4 ++--
 arch/riscv/include/asm/tlbflush.h | 2 --
 arch/riscv/mm/context.c           | 6 ++----
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/include/asm/mmu.h b/arch/riscv/include/asm/mmu.h
index a550fbf770be..dc0273f7905f 100644
--- a/arch/riscv/include/asm/mmu.h
+++ b/arch/riscv/include/asm/mmu.h
@@ -26,8 +26,8 @@ typedef struct {
 #endif
 } mm_context_t;
 
-#define cntx2asid(cntx)		((cntx) & asid_mask)
-#define cntx2version(cntx)	((cntx) & ~asid_mask)
+#define cntx2asid(cntx)		((cntx) & SATP_ASID_MASK)
+#define cntx2version(cntx)	((cntx) & ~SATP_ASID_MASK)
 
 void __init create_pgd_mapping(pgd_t *pgdp, uintptr_t va, phys_addr_t pa,
 			       phys_addr_t sz, pgprot_t prot);
diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index 8e329721375b..72e559934952 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -15,8 +15,6 @@
 #define FLUSH_TLB_NO_ASID       ((unsigned long)-1)
 
 #ifdef CONFIG_MMU
-extern unsigned long asid_mask;
-
 static inline void local_flush_tlb_all(void)
 {
 	__asm__ __volatile__ ("sfence.vma" : : : "memory");
diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index b562b3c44487..5315af06cd4d 100644
--- a/arch/riscv/mm/context.c
+++ b/arch/riscv/mm/context.c
@@ -22,7 +22,6 @@ DEFINE_STATIC_KEY_FALSE(use_asid_allocator);
 
 static unsigned long asid_bits;
 static unsigned long num_asids;
-unsigned long asid_mask;
 
 static atomic_long_t current_version;
 
@@ -128,7 +127,7 @@ static unsigned long __new_context(struct mm_struct *mm)
 		goto set_asid;
 
 	/* We're out of ASIDs, so increment current_version */
-	ver = atomic_long_add_return_relaxed(num_asids, &current_version);
+	ver = atomic_long_add_return_relaxed(BIT(SATP_ASID_BITS), &current_version);
 
 	/* Flush everything  */
 	__flush_context();
@@ -247,7 +246,6 @@ static int __init asids_init(void)
 	/* Pre-compute ASID details */
 	if (asid_bits) {
 		num_asids = 1 << asid_bits;
-		asid_mask = num_asids - 1;
 	}
 
 	/*
@@ -255,7 +253,7 @@ static int __init asids_init(void)
 	 * at-least twice more than CPUs
 	 */
 	if (num_asids > (2 * num_possible_cpus())) {
-		atomic_long_set(&current_version, num_asids);
+		atomic_long_set(&current_version, BIT(SATP_ASID_BITS));
 
 		context_asid_map = bitmap_zalloc(num_asids, GFP_KERNEL);
 		if (!context_asid_map)
-- 
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
