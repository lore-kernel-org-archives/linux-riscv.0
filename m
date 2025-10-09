Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 550E0CCD18A
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 01:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i7THdD9/zhz153tfniKUnA+Pa8kzA13kDP5CW1Wmg/c=; b=HUeZUJpuPjK5Tg
	0BHvoHyJPmi4ep5GlCmJKHEWf2G96G5lgDKquLYmx7fSgyDpCg8JvnweiVv2JNy11RcqGGCfWAwjW
	sobp13R2I7WD5j19sA7+jjq2J9H4AViiuXEyQjY+XtAYnZdl3bLSHBD1JwVdNsREbzJi4ZyUCPkx8
	AXwZqMMa6P/kZSDSMb3D/QtsGmWR1fpm34RlWckC4MNVfNZYYjti7Cmi7wjJh5+8EGTFMxnEjKFyp
	qTubV6rpvgcylzb/rNEeg87fu/7fug0+i8Fve4MOIWRtTwzcteKN42e4XEiBVf8nIVhIsRvpba/mn
	ZVXHfm5E08dKAP1yRZ7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6fvn-00000004zJP-0EsN;
	Thu, 09 Oct 2025 01:58:59 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6fvk-00000004zG2-3EqL
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 01:58:57 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b57bffc0248so406661a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 08 Oct 2025 18:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1759975136; x=1760579936; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qox8adEL3NVTIaNLXzvlCmJaaMYPBhbok62G/+ufmI4=;
        b=KfzPjjvKJk9be4Ed6vBudhmWqtkPgdhvGxdeeTdjiGNCf84N69IJmIQtWLfUCIhRkh
         hcOZUk+gQA7ZKiy3K72RFXLRKUA5Ogj+Rv5ze7Lm7du82SVFd3fVvCFChf3f5sOo4+FT
         q0R9RnN1eAa+0sGKBwoK8w5uUIANwFzlagevalI44x0nmpwX8DgmWsASerYCYXXNOE8+
         d3lH1FgZD/+O6mQpmgbc8fb8w7ulAb5B7Hy2FxdlL15G54CldpKiEzIWRzasPamdR4ie
         /7pPBjrkpP1GfdhVWeDsklZfwxwdixvTeV1rnSXL0LQAwPyeNUAmMChWKDqdjwD3PVBJ
         zx+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759975136; x=1760579936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qox8adEL3NVTIaNLXzvlCmJaaMYPBhbok62G/+ufmI4=;
        b=b5giRL6m6/Q9b2QM9DNYqNMpjaMXvHIPipJFvNQq95tIiEXRXsgCBiAvh48Sub9e9s
         bpV7ysZYvET6TDl/4gBgCVYtUDSjAIXGPgTM6pJfjkQgVURVh8973G8/fkktjQhcS2oL
         8NtcRw92afzja5HFUqwtNhUuKwMF1Z3cm+4C2PHz0BU779qB6wU0/Nvh1LbZWp8XZCe6
         Qbe/YIGfsLL26pB1gE7yZaOyA2Fh7LJuyIgvwmnk9BZkZPTj+A7skNLwbQmGL73UcqQF
         EiaTlcaftM6dLb6AnMESfG4z91RD2RfsjYIU6u1wCyIO2R1/83EO0qNiSh/HhVQ8Zd5g
         7AHA==
X-Forwarded-Encrypted: i=1; AJvYcCWs3Opx/g0QBOQr1mJVTfIYedyii9Gl1LMhzdo4mLKaHghHcTLbh73NJxr/tIYUVv/R6203dXI3GZ97/g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwR2r53YHzZb/r8t4r6nnEhYvuLtVUVTs2h5IYAUK6+smdlmf7r
	iMDy1Bbk3Uym1Aspw5we7Vt8Y94UQMVWLyDezvCN4K9LJ3bcJur7QGvr2XV+cFY0JKU=
X-Gm-Gg: ASbGnct9il9lym7tgMIcmTmKs256ahFyEmWAGrdRuhO/jeVQMJxE7J/0vcoySn4v5x7
	/e8dbCLJ6MlViFCShM8lZS01mtn2jPm9Mf++UiVJAtLuYTXuAK+aU3e9M3YfpbsNgpwjq3kBaTt
	NExRyqafdlQVJE6XiTRORaXamG53678TfoyNjM5a0RhKdRjx3q62xw720/ETeTdbnjYaXKiqNXK
	jdbK5QjnQ6uoxJHQrukn6UP+vJj+3HJC7ZpodTb1SOSiT0h1NHbpGhVvei7/JKU2hEHkMJ/1VVU
	1VjZdaYLlMi0691OZTIEmfKwqTPzhQ4KPiRABcxT4gqb9jwPOprDwhzGjtrwEKO7z2eDI3pqGTf
	TSPwh5rZ2jBmPaOhuXk57vBWlFOsw55s4Rz1xxTPjnmaFEAk/7jXn+02px1p+1OcUfjbM
X-Google-Smtp-Source: AGHT+IHbkVL7EPb5KjicSw4KSoOokG99J04JG0lwtTo3UaOYe/evftUmF2hr4J/jh5vQhBOg6irmTg==
X-Received: by 2002:a17:903:1a03:b0:267:44e6:11d6 with SMTP id d9443c01a7336-29027e5d1efmr77364885ad.6.1759975135842;
        Wed, 08 Oct 2025 18:58:55 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de53f9sm11033585ad.14.2025.10.08.18.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 18:58:55 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Conor Dooley <conor@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 12/18] riscv: mm: Expose all page table bits to assembly code
Date: Wed,  8 Oct 2025 18:57:48 -0700
Message-ID: <20251009015839.3460231-13-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251009015839.3460231-1-samuel.holland@sifive.com>
References: <20251009015839.3460231-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_185856_838961_175F3FE9 
X-CRM114-Status: GOOD (  14.32  )
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
index 90ef35a7c1a52..eb556ab95732d 100644
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
index 5531752b608e4..60c2615e46724 100644
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
@@ -174,10 +148,6 @@ enum napot_cont_order {
 
 #else
 
-#define _PAGE_NOCACHE		0
-#define _PAGE_IO		0
-#define _PAGE_MTMASK		0
-
 #define ALT_FIXUP_MT(_val)
 
 #endif /* CONFIG_RISCV_ISA_SVPBMT || CONFIG_ERRATA_THEAD_MAE */
diff --git a/arch/riscv/include/asm/pgtable-bits.h b/arch/riscv/include/asm/pgtable-bits.h
index 179bd4afece46..18c50cbd78bf5 100644
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
