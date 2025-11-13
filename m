Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 637F2CD4F3A
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 01:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x3RNbwec13fzKoTUXN5EssePbW4RZBgnex/q57zdnwo=; b=Uet1eFyIrqYZnM
	EPLyzemUoR1SYDGMVVXrDzthe80jWJUWJm+BE5cDPGpLmmC7ncwBDFY3PLOVHdhlKylrt3j7CiwKP
	thzfF+e1Cx1mZIwq3s4jsQQ01LcNZFGZM/DWydLVezDpQgFWqzBrG8C45n1mm8ANhvFxF1rWW6q7T
	BCyuYUZNW0VBZQyYoVnL+RkSDt9W8PfUW8bYuYTjiQBGPFUtzO8dFv7oHpi2yIra2AAI2oI3iskxU
	EEtEiR5vQweVMmAvvuUgAGvcYfF//kYualEysdS+kl1YTYCkwSKT+POa7qEcED4PxFGb+0mxAuoeF
	tTU523rU6ibCSJqpWVUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJMQo-00000009jvb-3QJe;
	Thu, 13 Nov 2025 01:47:26 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJMQk-00000009jrf-2pJt
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 01:47:23 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-bc0d7255434so186290a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 12 Nov 2025 17:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1762998442; x=1763603242; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LCfGLyHTlwnlWI3FvQiRrpmgPRI/lUHNtrwWz9sKS0g=;
        b=H7oXcJpyNJuvqZiDP9BP9ilY4wKDsUbM+8GDhpw5F3e8GQZRyB6t5oL9CaRzok3Ehq
         hYMephxCFS/KaNYqAgdVG84a4zofZ6U+cGw+OK3nznoj6haBrJIWzK0QKFftxd6dyqdL
         iLrE3MDd+meLjtQJt9SLIL4b5AjFXJBZNj1Mdc82dVnpfNVoHdjmH+36KW4+p9OSzJ4i
         o6jIKw5Mg7MNQQc2QghibcyzETX4EvBIeLcNdnTs0PWo0Gx37/s0JlwaHIaaAvK4MxqT
         42HK4th++1mp5V+J9YU2+hdRlzY/CMXJdtyyJRd6Umnjb47mNi3vJiwzAIIc9WU/khgb
         HxmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762998442; x=1763603242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LCfGLyHTlwnlWI3FvQiRrpmgPRI/lUHNtrwWz9sKS0g=;
        b=CtOCBwnPBThXnSQU/9na00LcC9sBJv1RLjoL7AOqtxljfiuixV6jc4xwddYauqN20h
         Eg0KBSOsPqUEcoi44sgNu2EleidLKS4kjag19Qb3CX1J2BRRPf1kQqmhdGAPaB+2rSaf
         46pHAdGnkmS/7j5GoMWmdqp9Csb9tOEqQnDRmLlertXCAwyiAf6Sne7Ntnb9e4dF0xJC
         +VlI2q3DwiOcCB3dADU62z5p3Po4WKoznRmv6NaAJmjhpeAOkY936gdTSCf3TRls+xTk
         Pftg3QxGjGBy8sF53hpve8u/TpDMNSlAr0a2uenigCqmWqjpJPGotxOPwuu/sYq/Y4a4
         TnjA==
X-Forwarded-Encrypted: i=1; AJvYcCV5QhH0ncMKQPgnlRTG7bhqvzhAO7wKZeA0gz4d3hC/+ItwqQufvUHOmYoSCLOYWLaDiPtsz43Q478ccg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyHAHhpqLwN1DSB0osOQYt3RaBNp0ZzVPU5tStEi0Rle7AO08a4
	KBYga1YDBHNyRIuivB8OqBGR7wSzn269WHwY4yUckdkLs6QRcL54z+C3g7DbugLGsVg=
X-Gm-Gg: ASbGnctIVrjFk3md5f7tL0taAdCUTgLTTT0FkT0Jus4FLztjmn7tv2rorr/GoRkDSEZ
	uGaYj8P8VBrL6bbhAUnV1t5B7HJWIkebJQuexFoHzNd1sFvtcu8YLySbMv6YrVzTHgLB+BSc/bT
	RXFcNu5TE3bjNCS0F5OX5JzK2eOKwPk8/If+TYEZpYzKtGN2/NpgSd36bCYYy6kW52BJP7kic5+
	PRqdkhcwPskd1GTPPM1sm9n6rcZw1PIrImUrHVDnwy5kcqiPn5ztOHZgDP6+2zyFHvbx1/nYwc0
	hHQ6a0Z4cUe5MDxrRy3WERcpaFucts0ENq5XSngFq0vQclI7KB/bADHJ6EJ6G9x0ImHuqJxr+G8
	Nx3vp9K9RGhusXqJl2usEiI8eMP16FEJWBDCxWYrUfurK1glJZVDC/hUXwmN4VNOyJOAWr8UyRk
	ZA8ZNlvRQVBC6+6dgcPFg+1w==
X-Google-Smtp-Source: AGHT+IFq0UAOun8d9XJx744M7CwKUVs4/xq+EwynwZ5LpaPcXyVk6iynKKn4ZFAafmUlsME9mB3yew==
X-Received: by 2002:a17:902:ef45:b0:295:738f:73fe with SMTP id d9443c01a7336-2984edec698mr65123165ad.30.1762998441862;
        Wed, 12 Nov 2025 17:47:21 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2ccae8sm4986485ad.98.2025.11.12.17.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 17:47:21 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	linux-riscv@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	linux-mm@kvack.org
Cc: devicetree@vger.kernel.org,
	Suren Baghdasaryan <surenb@google.com>,
	linux-kernel@vger.kernel.org,
	Mike Rapoport <rppt@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Conor Dooley <conor@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v3 15/22] riscv: mm: Expose all page table bits to assembly code
Date: Wed, 12 Nov 2025 17:45:28 -0800
Message-ID: <20251113014656.2605447-16-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251113014656.2605447-1-samuel.holland@sifive.com>
References: <20251113014656.2605447-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_174722_782716_A27C637D 
X-CRM114-Status: GOOD (  13.86  )
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

pgtable-32.h and pgtable-64.h are not usable by assembly code files, so
move all page table field definitions to pgtable-bits.h. This allows
handling more complex PTE transformations in out-of-line assembly code.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

 arch/riscv/include/asm/pgtable-32.h   | 11 -------
 arch/riscv/include/asm/pgtable-64.h   | 30 -------------------
 arch/riscv/include/asm/pgtable-bits.h | 42 +++++++++++++++++++++++++--
 3 files changed, 40 insertions(+), 43 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable-32.h b/arch/riscv/include/asm/pgtable-32.h
index 90ef35a7c1a5..eb556ab95732 100644
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
index aad34c754325..fa2c1dcb6f72 100644
--- a/arch/riscv/include/asm/pgtable-64.h
+++ b/arch/riscv/include/asm/pgtable-64.h
@@ -70,20 +70,6 @@ typedef struct {
 
 #define MAX_POSSIBLE_PHYSMEM_BITS 56
 
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
@@ -113,18 +99,6 @@ enum napot_cont_order {
 
 #if defined(CONFIG_RISCV_ISA_SVPBMT) || defined(CONFIG_ERRATA_THEAD_MAE)
 
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
  * ALT_FIXUP_MT
  *
@@ -176,10 +150,6 @@ enum napot_cont_order {
 
 #else
 
-#define _PAGE_NOCACHE		0
-#define _PAGE_IO		0
-#define _PAGE_MTMASK		0
-
 #define ALT_FIXUP_MT(_val)
 
 #endif /* CONFIG_RISCV_ISA_SVPBMT || CONFIG_ERRATA_THEAD_MAE */
diff --git a/arch/riscv/include/asm/pgtable-bits.h b/arch/riscv/include/asm/pgtable-bits.h
index 179bd4afece4..18c50cbd78bf 100644
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
@@ -21,6 +31,36 @@
 #define _PAGE_SPECIAL   (1 << 8)    /* RSW: 0x1 */
 #define _PAGE_TABLE     _PAGE_PRESENT
 
+#define _PAGE_PFN_SHIFT		10
+#ifdef CONFIG_64BIT
+#define _PAGE_PFN_MASK		GENMASK(53, 10)
+#else
+#define _PAGE_PFN_MASK		GENMASK(31, 10)
+#endif /* CONFIG_64BIT */
+
+#if defined(CONFIG_RISCV_ISA_SVPBMT) || defined(CONFIG_ERRATA_THEAD_MAE)
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
+#endif /* CONFIG_RISCV_ISA_SVPBMT || CONFIG_ERRATA_THEAD_MAE */
+
+#ifdef CONFIG_RISCV_ISA_SVNAPOT
+#define _PAGE_NAPOT_SHIFT	63
+#define _PAGE_NAPOT		BIT(_PAGE_NAPOT_SHIFT)
+#endif /* CONFIG_RISCV_ISA_SVNAPOT */
+
 /*
  * _PAGE_PROT_NONE is set on not-present pages (and ignored by the hardware) to
  * distinguish them from swapped out pages
@@ -30,8 +70,6 @@
 /* Used for swap PTEs only. */
 #define _PAGE_SWP_EXCLUSIVE _PAGE_ACCESSED
 
-#define _PAGE_PFN_SHIFT 10
-
 /*
  * when all of R/W/X are zero, the PTE is a pointer to the next level
  * of the page table; otherwise, it is a leaf PTE.
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
