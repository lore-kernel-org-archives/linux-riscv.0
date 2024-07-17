Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B96D1C3DA4B
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 06:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JA0iXQUOQcwo12i7GB1NZA8PAj3hecAayYZa1LFiz/Q=; b=WBtrvhhdlereZ/
	rLSP3hGEkLPOhBgkIDdi2x6vCz89h+szhtS+TF+zo2APTfTR8RKIh87FQ3UYVqX4xHC7MbXLGhGsO
	GMY2DyR+UPWA/vsp4ZBfYt8jNfDITgJmanuhWMmiRWTTHHWnK75t2wWX4wTbcio5XpIDbsUzh9ZeT
	mABdXKrlR5zl9ioIhxxT62QiE6d2G0QCi/yfFN4WPzYodytdl7unAeVBgKvUSFYVAXA01Rm9UqyuQ
	bjsKE3mHU+heesKQjrfZlj8nAfEaVAut2ijBuljTWcxTw8x3Rz7E9lOU52PiJVldXMG/0bvN5JZIK
	aHE4xiJt2dgBNUusj0Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTxnZ-0000000Clqt-1ANf;
	Wed, 17 Jul 2024 06:05:57 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTxnH-0000000CllZ-3Art
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 06:05:41 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-427c4843840so818055e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 16 Jul 2024 23:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721196338; x=1721801138; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZQT7T4D4OYiXP5aLvX/ZPT3Ko40XHhQXHQMq6Si+lCQ=;
        b=NHfSEuPFGyqKx4zzwjEHmVXneWhP11g1yLPWrT/2qx44ZXISLWNhXnlr+JfLn3zQC3
         dGgEH3OtNnmdxHz4J2X9wyakc1XIYn/0radNkZ2om3B00wnjFmHQ2i7pf1MQ0E0pxBKx
         /VD4hhAlc+NK0zrguzqS2i6ol8Yi8J/9xe5FawT6EK8CBhX6bWuYk06N9AyixxQPYAZB
         OL+hB3HdevfH+3AXPtpRRd9cf9aq3MXkPAbDTojC7GLuZ1hqsM5iLdBGXwDfe0uY+HBs
         IQ1UUJQefq97ENZBYqD7Q+SxngSiMZgS0uxDgBpvEzS5wzNY90Oi1niLk4qdSeX/Fe2O
         4L5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721196338; x=1721801138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZQT7T4D4OYiXP5aLvX/ZPT3Ko40XHhQXHQMq6Si+lCQ=;
        b=HLFfaxdBXVwvzSxdrClmHTVmu1UTsj4adr+1jl7n85EaWPGVIsWDVk0oBOMcvEsHKA
         107WlyY2NXei1yWcf5Au6QTUZENLBwy82t/YmukvK8kHgHWtdL31KT0qwVaDFNs2CBX/
         I+lg8C5QeNSEc9sn/NsMekrT5bmuUwJlMIXfI9BFgeete7dhh+jSohasbQYNjIO+qlNE
         OKYDK4wshXgkAfw+3ZU4f6zfs5h3J7Cl5HTRxeZZwj/Tzgk1SAO2fdfSr3NrlzLgd1hK
         bivWnisc8y8mOgFb8UoGWaR8VACTIChYlAJWvGiB8CqtshRZFgxykFXdp1McztUdJtT6
         z/WA==
X-Forwarded-Encrypted: i=1; AJvYcCW7mZ7Kt+cnhWnfKb2/wCjo1Xv9leIFhu3dKhlwYx8+V1CV1blvKMYM0dOEq06glsjteuw3VthkyGRhIMazS9AfbI+Rjzj5xOAqZTxnuNIO
X-Gm-Message-State: AOJu0YzEHBurq1cYPmLWTP5TWcgANTzDmb0DwL/68sb4Jv5DtpHNU7BJ
	zuNUcgajsABvs99NXhnLDJUdXpnwhlYLEtmmIPILBBA78Y9ltI4qeABsT4Ad8Hc=
X-Google-Smtp-Source: AGHT+IEQqqsHVBQzuLlWNCNqvz+HzbR2Qu8oxbxrJwmk7GCmEw2/2fyCAGSldEtDwshPiZQG+MKGzw==
X-Received: by 2002:a5d:624b:0:b0:365:8547:90b1 with SMTP id ffacd0b85a97d-36831657d1amr462626f8f.39.1721196338221;
        Tue, 16 Jul 2024 23:05:38 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680dab3cc6sm10834293f8f.11.2024.07.16.23.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 23:05:37 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Ved Shanbhogue <ved@rivosinc.com>,
	Matt Evans <mev@rivosinc.com>,
	yunhui cui <cuiyunhui@bytedance.com>,
	Anup Patel <anup@brainfault.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v4 4/4] riscv: Stop emitting preventive sfence.vma for new userspace mappings with Svvptc
Date: Wed, 17 Jul 2024 08:01:25 +0200
Message-Id: <20240717060125.139416-5-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240717060125.139416-1-alexghiti@rivosinc.com>
References: <20240717060125.139416-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_230539_837000_02E44C2D 
X-CRM114-Status: GOOD (  14.80  )
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

The preventive sfence.vma were emitted because new mappings must be made
visible to the page table walker but Svvptc guarantees that it will
happen within a bounded timeframe, so no need to sfence.vma for the uarchs
that implement this extension, we will then take gratuitous (but very
unlikely) page faults, similarly to x86 and arm64.

This allows to drastically reduce the number of sfence.vma emitted:

* Ubuntu boot to login:
Before: ~630k sfence.vma
After:  ~200k sfence.vma

* ltp - mmapstress01
Before: ~45k
After:  ~6.3k

* lmbench - lat_pagefault
Before: ~665k
After:   832 (!)

* lmbench - lat_mmap
Before: ~546k
After:   718 (!)

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h | 16 +++++++++++++++-
 arch/riscv/mm/pgtable.c          | 13 +++++++++++++
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index aad8b8ca51f1..4ed85329317d 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -476,6 +476,9 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
 		struct vm_area_struct *vma, unsigned long address,
 		pte_t *ptep, unsigned int nr)
 {
+	asm goto(ALTERNATIVE("nop", "j %l[svvptc]", 0, RISCV_ISA_EXT_SVVPTC, 1)
+		 : : : : svvptc);
+
 	/*
 	 * The kernel assumes that TLBs don't cache invalid entries, but
 	 * in RISC-V, SFENCE.VMA specifies an ordering constraint, not a
@@ -485,12 +488,23 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
 	 */
 	while (nr--)
 		local_flush_tlb_page(address + nr * PAGE_SIZE);
+
+svvptc:;
+	/*
+	 * Svvptc guarantees that the new valid pte will be visible within
+	 * a bounded timeframe, so when the uarch does not cache invalid
+	 * entries, we don't have to do anything.
+	 */
 }
 #define update_mmu_cache(vma, addr, ptep) \
 	update_mmu_cache_range(NULL, vma, addr, ptep, 1)
 
 #define __HAVE_ARCH_UPDATE_MMU_TLB
-#define update_mmu_tlb update_mmu_cache
+static inline void update_mmu_tlb(struct vm_area_struct *vma,
+				  unsigned long address, pte_t *ptep)
+{
+	flush_tlb_range(vma, address, address + PAGE_SIZE);
+}
 
 static inline void update_mmu_cache_pmd(struct vm_area_struct *vma,
 		unsigned long address, pmd_t *pmdp)
diff --git a/arch/riscv/mm/pgtable.c b/arch/riscv/mm/pgtable.c
index 533ec9055fa0..4ae67324f992 100644
--- a/arch/riscv/mm/pgtable.c
+++ b/arch/riscv/mm/pgtable.c
@@ -9,6 +9,9 @@ int ptep_set_access_flags(struct vm_area_struct *vma,
 			  unsigned long address, pte_t *ptep,
 			  pte_t entry, int dirty)
 {
+	asm goto(ALTERNATIVE("nop", "j %l[svvptc]", 0, RISCV_ISA_EXT_SVVPTC, 1)
+		 : : : : svvptc);
+
 	if (!pte_same(ptep_get(ptep), entry))
 		__set_pte_at(vma->vm_mm, ptep, entry);
 	/*
@@ -16,6 +19,16 @@ int ptep_set_access_flags(struct vm_area_struct *vma,
 	 * the case that the PTE changed and the spurious fault case.
 	 */
 	return true;
+
+svvptc:
+	if (!pte_same(ptep_get(ptep), entry)) {
+		__set_pte_at(vma->vm_mm, ptep, entry);
+		/* Here only not svadu is impacted */
+		flush_tlb_page(vma, address);
+		return true;
+	}
+
+	return false;
 }
 
 int ptep_test_and_clear_young(struct vm_area_struct *vma,
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
