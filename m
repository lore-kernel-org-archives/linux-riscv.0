Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95854E6F095
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Nov 2024 00:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UtoLdrJDvbFDeFO+MAOIWXiuNlvgL8I+OYMvMgVNHbs=; b=oSvx3IQFHx+SiA
	LPoxom4m6W8yV/mpeBvecR84SssY4jVMPcYV5GR9fGaQd/Jg6k01qZJRfbNfRvscmP3/jiZtsfxj+
	DOZieIou1VYrN7UehAOOMUUtlj29GHmd9/kqTlnezC14zzkQVzO5/IivGODjU6bwu5pW9D8hgOE8s
	+wow5sPa5wTCBpXl0GbCUsMz9cQiBWpk1FtnHqthMboA8q3AzTkktaO/Ts2Q/OWBxnJzoz3FM+jet
	Gfd4L+4iRxif+kL8XnfFYUT6/zUv9hv6NqVZq9eRZ/sC/Oevj15XtTDiP5MhxbzJ9PIkeztUY2iyq
	4CIxyRYp9GWTygV2JfdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t71hN-00000008a5p-2CWN;
	Sat, 02 Nov 2024 00:09:01 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t71hJ-00000008a1P-0Lu9
	for linux-riscv@lists.infradead.org;
	Sat, 02 Nov 2024 00:08:59 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-207115e3056so24316985ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 01 Nov 2024 17:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1730506136; x=1731110936; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VLWTqwFTklP5kOAS4tWrZE7o6PRbxvUdE0W7VG/oyEc=;
        b=C3EOTHbFKEmHXkCKGvXix/0usMVUC7SoJDEREJ0EM2gRr5ZcWGR37I4tzNN/KCf6GZ
         URbKFNAMqPROfcE/2vYSwLiYn5Dt0Hd+VR7te7INKYw9nWsyLfv5ak/RflnNOIjvYmTD
         GlmzLT2fqd2a8C14i+OL4jmgKeJDv+5kRBwCQhJ8KymKX8FKQXyBaYqhqu68tO1Ia4kD
         D7ST5eRW2wVZCLWsgf6mjxGuj5vtRvSg7/9r/kYQ5TjVFB+tTxF2mrAWjCSRwbAqdVuS
         vud4OHzQRsPTU6P6xU91BP4+m/Fn4QoUBCeNS+uTJokFPTH/+a5vPbEh8ZYQeKzFyHbQ
         UAyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730506136; x=1731110936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VLWTqwFTklP5kOAS4tWrZE7o6PRbxvUdE0W7VG/oyEc=;
        b=SIRs+yAj6OzGzSpv+8Cl8yMxKoF7YnXieKlnCmSIF8laooNEDkNHUxQuqBc2Vj2G5o
         KoCWQifpmChdPTnu7LxC5kN42WHGmVGhe1ZqAT/kM2rqCWs/+tuwb1Wo1gsTHm9UDuni
         Hzp2mKWFSSgQAY5/E+uUIFO6pnacB9nnIoLHs3hP4vBKYMZ9IYVrIoIbS/pLD9a50lal
         PSKOr+srIe4W5B0fLHr8tVBv6/GIkQ3D6kMzteTYJwZegG3CZRPpN6OQBSVooKVuAekv
         ciwcHFT3ppzW9hQpb0N6+2q1JS0ZA1ApZOwlni6PZuS2mAiwVCmDj/Ug6lOnQOsuiU2Z
         FeVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSsA0f9FbigqZYbi6wmwHRM/m6xiFok4Wl7EuFIVHbmi8PeiAoHg3oUHaX3vePvS286tIa3A9IJS9TAw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwgsFGW8Qe61fwmZFSSi6Bph5/6vipKegJ/QglkWqpurmLEHtCs
	smU9zwKg2xC0EwK/aJIXzfDmfouV50QMpayEzuFxyB/8klqSFx59mS4ww1vobk0=
X-Google-Smtp-Source: AGHT+IFrBzJx8mZGS+kpSXYQaBncFZYtUSdQlG/06GLokAQ9rvGT8eZfFNaYR53VSzsL3JuFc3E7IQ==
X-Received: by 2002:a17:902:ecc3:b0:20c:f292:3a21 with SMTP id d9443c01a7336-210c6892a36mr346018705ad.15.1730506135958;
        Fri, 01 Nov 2024 17:08:55 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e92fc00856sm5505749a91.54.2024.11.01.17.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 17:08:55 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Conor Dooley <conor@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 07/11] riscv: mm: Expose all page table bits to assembly code
Date: Fri,  1 Nov 2024 17:08:01 -0700
Message-ID: <20241102000843.1301099-8-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241102000843.1301099-1-samuel.holland@sifive.com>
References: <20241102000843.1301099-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_170857_296382_43653261 
X-CRM114-Status: GOOD (  13.97  )
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

pgtable-32.h and pgtable-64.h are not usable by assembly code, so move
all page table field definitions to pgtable-bits.h.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/include/asm/pgtable-32.h   | 11 -------
 arch/riscv/include/asm/pgtable-64.h   | 30 -------------------
 arch/riscv/include/asm/pgtable-bits.h | 42 +++++++++++++++++++++++++--
 3 files changed, 40 insertions(+), 43 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable-32.h b/arch/riscv/include/asm/pgtable-32.h
index b422a15fb464..ba50b65b434b 100644
--- a/arch/riscv/include/asm/pgtable-32.h
+++ b/arch/riscv/include/asm/pgtable-32.h
@@ -17,17 +17,6 @@
 
 #define MAX_POSSIBLE_PHYSMEM_BITS 34
 
-/*
- * rv32 PTE format:
- * | XLEN-1  10 | 9             8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0
- *       PFN      reserved for SW   D   A   G   U   X   W   R   V
- */
-#define _PAGE_PFN_MASK  GENMASK(31, 10)
-
-#define _PAGE_NOCACHE		0
-#define _PAGE_IO		0
-#define _PAGE_MTMASK		0
-
 #define ALT_FIXUP_MT(_val)
 #define ALT_UNFIX_MT(_val)
 
diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
index 4e8a32f035d7..174b6a5837c2 100644
--- a/arch/riscv/include/asm/pgtable-64.h
+++ b/arch/riscv/include/asm/pgtable-64.h
@@ -68,20 +68,6 @@ typedef struct {
 #define __pmd(x)        ((pmd_t) { (x) })
 #define PTRS_PER_PMD    (PAGE_SIZE / sizeof(pmd_t))
 
-/*
- * rv64 PTE format:
- * | 63 | 62 61 | 60 54 | 53  10 | 9             8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0
- *   N      MT     RSV    PFN      reserved for SW   D   A   G   U   X   W   R   V
- */
-#define _PAGE_PFN_MASK  GENMASK(53, 10)
-
-/*
- * [63] Svnapot definitions:
- * 0 Svnapot disabled
- * 1 Svnapot enabled
- */
-#define _PAGE_NAPOT_SHIFT	63
-#define _PAGE_NAPOT		BIT(_PAGE_NAPOT_SHIFT)
 /*
  * Only 64KB (order 4) napot ptes supported.
  */
@@ -111,18 +97,6 @@ enum napot_cont_order {
 
 #ifdef CONFIG_RISCV_ISA_SVPBMT
 
-/*
- * [62:61] Svpbmt Memory Type definitions:
- *
- *  00 - PMA    Normal Cacheable, No change to implied PMA memory type
- *  01 - NC     Non-cacheable, idempotent, weakly-ordered Main Memory
- *  10 - IO     Non-cacheable, non-idempotent, strongly-ordered I/O memory
- *  11 - Rsvd   Reserved for future standard use
- */
-#define _PAGE_NOCACHE		(1UL << 61)
-#define _PAGE_IO		(2UL << 61)
-#define _PAGE_MTMASK		(3UL << 61)
-
 /*
  * [63:59] T-Head Memory Type definitions:
  * bit[63] SO - Strong Order
@@ -182,10 +156,6 @@ enum napot_cont_order {
 
 #else
 
-#define _PAGE_NOCACHE		0
-#define _PAGE_IO		0
-#define _PAGE_MTMASK		0
-
 #define ALT_FIXUP_MT(_val)
 #define ALT_UNFIX_MT(_val)
 
diff --git a/arch/riscv/include/asm/pgtable-bits.h b/arch/riscv/include/asm/pgtable-bits.h
index a8f5205cea54..96710d4c1817 100644
--- a/arch/riscv/include/asm/pgtable-bits.h
+++ b/arch/riscv/include/asm/pgtable-bits.h
@@ -6,6 +6,16 @@
 #ifndef _ASM_RISCV_PGTABLE_BITS_H
 #define _ASM_RISCV_PGTABLE_BITS_H
 
+/*
+ * rv32 PTE format:
+ * | XLEN-1  10 | 9             8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0
+ *       PFN      reserved for SW   D   A   G   U   X   W   R   V
+ *
+ * rv64 PTE format:
+ * | 63 | 62 61 | 60 54 | 53 10 | 9             8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0
+ *   N      MT     RSV     PFN    reserved for SW   D   A   G   U   X   W   R   V
+ */
+
 #define _PAGE_ACCESSED_OFFSET 6
 
 #define _PAGE_PRESENT   (1 << 0)
@@ -22,6 +32,36 @@
 #define _PAGE_DEVMAP    (1 << 9)    /* RSW, devmap */
 #define _PAGE_TABLE     _PAGE_PRESENT
 
+#define _PAGE_PFN_SHIFT		10
+#ifdef CONFIG_64BIT
+#define _PAGE_PFN_MASK		GENMASK(53, 10)
+#else
+#define _PAGE_PFN_MASK		GENMASK(31, 10)
+#endif /* CONFIG_64BIT */
+
+#ifdef CONFIG_RISCV_ISA_SVPBMT
+/*
+ * [62:61] Svpbmt Memory Type definitions:
+ *
+ *  00 - PMA    Normal Cacheable, No change to implied PMA memory type
+ *  01 - NC     Non-cacheable, idempotent, weakly-ordered Main Memory
+ *  10 - IO     Non-cacheable, non-idempotent, strongly-ordered I/O memory
+ *  11 - Rsvd   Reserved for future standard use
+ */
+#define _PAGE_NOCACHE		(UL(1) << 61)
+#define _PAGE_IO		(UL(2) << 61)
+#define _PAGE_MTMASK		(UL(3) << 61)
+#else
+#define _PAGE_NOCACHE		0
+#define _PAGE_IO		0
+#define _PAGE_MTMASK		0
+#endif /* CONFIG_RISCV_ISA_SVPBMT */
+
+#ifdef CONFIG_RISCV_ISA_SVNAPOT
+#define _PAGE_NAPOT_SHIFT	63
+#define _PAGE_NAPOT		BIT(_PAGE_NAPOT_SHIFT)
+#endif /* CONFIG_RISCV_ISA_SVNAPOT */
+
 /*
  * _PAGE_PROT_NONE is set on not-present pages (and ignored by the hardware) to
  * distinguish them from swapped out pages
@@ -31,8 +71,6 @@
 /* Used for swap PTEs only. */
 #define _PAGE_SWP_EXCLUSIVE _PAGE_ACCESSED
 
-#define _PAGE_PFN_SHIFT 10
-
 /*
  * when all of R/W/X are zero, the PTE is a pointer to the next level
  * of the page table; otherwise, it is a leaf PTE.
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
