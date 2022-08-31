Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85749C0502A
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Aug 2022 17:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YsU14v/Dv4Z0UrFGlVv6PI2oCBGe1uvNsff5aNlUUDk=; b=XsICbwqJYTFUOh
	2xnhAZh+mG34iOuZ18HuE1WyxGrLLPcrYdgG1hzt3S3WySLXOD7fvgJia2zZepA6S8/7vdtyQ45yW
	whdNzfgblh9TwwhePZXiREGG5EAfzssSwCXZFrx3J0jgZA8yK6CiZBKV9vrWTG1MZnhGgR2/QZfjk
	tWn8OVoG2C2083VvGv+zoPbK/d9ZauTa4LDm276RZzfIpW3zAzR+Ig8TXP/yFp6DJOLKumL9ry9Bx
	x0k81K6bB9ZwkI3x2PrSOnEzQlHlJBx0tce7ufcVRoTQVghmUkn2NDX0qMk7zAqXjyk6gPkWH9Qe7
	YjLvE4yhtzNyAuGMrWpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTRSm-007Opj-Rn; Wed, 31 Aug 2022 17:25:16 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTRSg-007OiV-3c
	for linux-riscv@lists.infradead.org; Wed, 31 Aug 2022 17:25:11 +0000
Received: by mail-wm1-x32b.google.com with SMTP id n17-20020a05600c501100b003a84bf9b68bso3450469wmr.3
        for <linux-riscv@lists.infradead.org>; Wed, 31 Aug 2022 10:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=fizBC8NpPcL0RO1q/LLq/Re49C8DURQi6bNhDvOLByc=;
        b=Thjp/7LoSdR+BA8d4yQIMpuR3obWObcLBIt6v4+66n8/RxuUlNGmfr8JsCtgZr3Qkf
         6SwmSnpvcy5sXxN29DLz7+SYjrCRgF8X7up11Jis86GrFvuAe/fMDfgBCrxha2l3dsj1
         U5auAhYkh7aZK6d6iRezooRAPPqNdUH6xaYsfCskyMW4OV4kkhiTwucnFEc/Aa2eFrlq
         mFjo1g4k5Dgk27rwbVrIGryJd7B3RNrvTw4LI05x7s6O37XTLXwlSo5C+NR1rOV5O406
         WajxWdao5ciVkP/uSbxsp+5D/6TcoXgYBUJMx4CLVyJMh8eMQr9sIv5EItpjBTdZmddB
         8VGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=fizBC8NpPcL0RO1q/LLq/Re49C8DURQi6bNhDvOLByc=;
        b=ce/1dcJ7ntjXz9ij3LnhO/peDtmzsiCazoaL+RRnhM29hRjXqhheATPO+f6ObVnG1F
         moxGlkFgAKHTfodhj5DIpVTrgQO1at5dMjuZdXybkxFbBSnixyNP1WqStJitFyGVSCPu
         CWjCJCIKnWzld/6LRsCOpb0CSYjGqGm8mtXxTYMBXVL6jFxar5H2alXWLaYlWMIU1kdo
         mIDTtSuuKZkX0FId7uL/N0wYe4bs2Qshwp2I3Olpq/u0zdE0ePsXXMI+Z4PMXK9cL0G5
         nRDeak3RromSNeOmuT09me8bBZwCy8gm1zUEUINnq1huFq869QAZPLzUeAyPGQxr/mIf
         pdcw==
X-Gm-Message-State: ACgBeo0yZFj41oy1GdGloq+o6Bnzb/hBJMVS3snQSt7Zx0gPbsc9U7zQ
	ENjFm1s2nkkpB4vJsyXhG7nZ6bqVdvih0Q==
X-Google-Smtp-Source: AA6agR5wAvxqhLqol7jiXr6Zv4bFSqdk46xUnBeQG+Zqq51F5hJLLyZGiw6lcSeEZ7PZ2SDRjRt8hw==
X-Received: by 2002:a05:600c:28cd:b0:3a5:4f45:b927 with SMTP id h13-20020a05600c28cd00b003a54f45b927mr2728838wmd.90.1661966707060;
        Wed, 31 Aug 2022 10:25:07 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
        by smtp.gmail.com with ESMTPSA id a11-20020a5d456b000000b0021f15514e7fsm14899052wrc.0.2022.08.31.10.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 10:25:06 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	anup@brainfault.org,
	mchitale@ventanamicro.com,
	heiko@sntech.de
Subject: [PATCH v2 3/4] riscv: KVM: Apply insn-def to hfence encodings
Date: Wed, 31 Aug 2022 19:24:59 +0200
Message-Id: <20220831172500.752195-4-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831172500.752195-1-ajones@ventanamicro.com>
References: <20220831172500.752195-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_102510_182745_636474C9 
X-CRM114-Status: GOOD (  10.02  )
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

Introduce hfence instruction encodings and apply them to KVM's use.
With the self-documenting nature of the instruction encoding macros,
and a spec always within arm's reach, it's safe to remove the
comments, so we do that too.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/include/asm/insn-def.h |  10 +++
 arch/riscv/kvm/tlb.c              | 129 ++++--------------------------
 2 files changed, 27 insertions(+), 112 deletions(-)

diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
index 2dcd1d4781bf..86c1f602413b 100644
--- a/arch/riscv/include/asm/insn-def.h
+++ b/arch/riscv/include/asm/insn-def.h
@@ -83,4 +83,14 @@
 #define __RS1(v)	__REG(v)
 #define __RS2(v)	__REG(v)
 
+#define OPCODE_SYSTEM	OPCODE(115)
+
+#define HFENCE_VVMA(vaddr, asid)				\
+	INSN_R(OPCODE_SYSTEM, FUNC3(0), FUNC7(17),		\
+	       __RD(0), RS1(vaddr), RS2(asid))
+
+#define HFENCE_GVMA(gaddr, vmid)				\
+	INSN_R(OPCODE_SYSTEM, FUNC3(0), FUNC7(49),		\
+	       __RD(0), RS1(gaddr), RS2(vmid))
+
 #endif /* __ASM_INSN_DEF_H */
diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
index 1a76d0b1907d..1ce3394b3acf 100644
--- a/arch/riscv/kvm/tlb.c
+++ b/arch/riscv/kvm/tlb.c
@@ -12,22 +12,7 @@
 #include <linux/kvm_host.h>
 #include <asm/cacheflush.h>
 #include <asm/csr.h>
-
-/*
- * Instruction encoding of hfence.gvma is:
- * HFENCE.GVMA rs1, rs2
- * HFENCE.GVMA zero, rs2
- * HFENCE.GVMA rs1
- * HFENCE.GVMA
- *
- * rs1!=zero and rs2!=zero ==> HFENCE.GVMA rs1, rs2
- * rs1==zero and rs2!=zero ==> HFENCE.GVMA zero, rs2
- * rs1!=zero and rs2==zero ==> HFENCE.GVMA rs1
- * rs1==zero and rs2==zero ==> HFENCE.GVMA
- *
- * Instruction encoding of HFENCE.GVMA is:
- * 0110001 rs2(5) rs1(5) 000 00000 1110011
- */
+#include <asm/insn-def.h>
 
 void kvm_riscv_local_hfence_gvma_vmid_gpa(unsigned long vmid,
 					  gpa_t gpa, gpa_t gpsz,
@@ -40,32 +25,14 @@ void kvm_riscv_local_hfence_gvma_vmid_gpa(unsigned long vmid,
 		return;
 	}
 
-	for (pos = gpa; pos < (gpa + gpsz); pos += BIT(order)) {
-		/*
-		 * rs1 = a0 (GPA >> 2)
-		 * rs2 = a1 (VMID)
-		 * HFENCE.GVMA a0, a1
-		 * 0110001 01011 01010 000 00000 1110011
-		 */
-		asm volatile ("srli a0, %0, 2\n"
-			      "add a1, %1, zero\n"
-			      ".word 0x62b50073\n"
-			      :: "r" (pos), "r" (vmid)
-			      : "a0", "a1", "memory");
-	}
+	for (pos = gpa; pos < (gpa + gpsz); pos += BIT(order))
+		asm volatile (HFENCE_GVMA(%0, %1)
+		: : "r" (pos >> 2), "r" (vmid) : "memory");
 }
 
 void kvm_riscv_local_hfence_gvma_vmid_all(unsigned long vmid)
 {
-	/*
-	 * rs1 = zero
-	 * rs2 = a0 (VMID)
-	 * HFENCE.GVMA zero, a0
-	 * 0110001 01010 00000 000 00000 1110011
-	 */
-	asm volatile ("add a0, %0, zero\n"
-		      ".word 0x62a00073\n"
-		      :: "r" (vmid) : "a0", "memory");
+	asm volatile(HFENCE_GVMA(zero, %0) : : "r" (vmid) : "memory");
 }
 
 void kvm_riscv_local_hfence_gvma_gpa(gpa_t gpa, gpa_t gpsz,
@@ -78,46 +45,16 @@ void kvm_riscv_local_hfence_gvma_gpa(gpa_t gpa, gpa_t gpsz,
 		return;
 	}
 
-	for (pos = gpa; pos < (gpa + gpsz); pos += BIT(order)) {
-		/*
-		 * rs1 = a0 (GPA >> 2)
-		 * rs2 = zero
-		 * HFENCE.GVMA a0
-		 * 0110001 00000 01010 000 00000 1110011
-		 */
-		asm volatile ("srli a0, %0, 2\n"
-			      ".word 0x62050073\n"
-			      :: "r" (pos) : "a0", "memory");
-	}
+	for (pos = gpa; pos < (gpa + gpsz); pos += BIT(order))
+		asm volatile(HFENCE_GVMA(%0, zero)
+		: : "r" (pos >> 2) : "memory");
 }
 
 void kvm_riscv_local_hfence_gvma_all(void)
 {
-	/*
-	 * rs1 = zero
-	 * rs2 = zero
-	 * HFENCE.GVMA
-	 * 0110001 00000 00000 000 00000 1110011
-	 */
-	asm volatile (".word 0x62000073" ::: "memory");
+	asm volatile(HFENCE_GVMA(zero, zero) : : : "memory");
 }
 
-/*
- * Instruction encoding of hfence.gvma is:
- * HFENCE.VVMA rs1, rs2
- * HFENCE.VVMA zero, rs2
- * HFENCE.VVMA rs1
- * HFENCE.VVMA
- *
- * rs1!=zero and rs2!=zero ==> HFENCE.VVMA rs1, rs2
- * rs1==zero and rs2!=zero ==> HFENCE.VVMA zero, rs2
- * rs1!=zero and rs2==zero ==> HFENCE.VVMA rs1
- * rs1==zero and rs2==zero ==> HFENCE.VVMA
- *
- * Instruction encoding of HFENCE.VVMA is:
- * 0010001 rs2(5) rs1(5) 000 00000 1110011
- */
-
 void kvm_riscv_local_hfence_vvma_asid_gva(unsigned long vmid,
 					  unsigned long asid,
 					  unsigned long gva,
@@ -133,19 +70,9 @@ void kvm_riscv_local_hfence_vvma_asid_gva(unsigned long vmid,
 
 	hgatp = csr_swap(CSR_HGATP, vmid << HGATP_VMID_SHIFT);
 
-	for (pos = gva; pos < (gva + gvsz); pos += BIT(order)) {
-		/*
-		 * rs1 = a0 (GVA)
-		 * rs2 = a1 (ASID)
-		 * HFENCE.VVMA a0, a1
-		 * 0010001 01011 01010 000 00000 1110011
-		 */
-		asm volatile ("add a0, %0, zero\n"
-			      "add a1, %1, zero\n"
-			      ".word 0x22b50073\n"
-			      :: "r" (pos), "r" (asid)
-			      : "a0", "a1", "memory");
-	}
+	for (pos = gva; pos < (gva + gvsz); pos += BIT(order))
+		asm volatile(HFENCE_VVMA(%0, %1)
+		: : "r" (pos), "r" (asid) : "memory");
 
 	csr_write(CSR_HGATP, hgatp);
 }
@@ -157,15 +84,7 @@ void kvm_riscv_local_hfence_vvma_asid_all(unsigned long vmid,
 
 	hgatp = csr_swap(CSR_HGATP, vmid << HGATP_VMID_SHIFT);
 
-	/*
-	 * rs1 = zero
-	 * rs2 = a0 (ASID)
-	 * HFENCE.VVMA zero, a0
-	 * 0010001 01010 00000 000 00000 1110011
-	 */
-	asm volatile ("add a0, %0, zero\n"
-		      ".word 0x22a00073\n"
-		      :: "r" (asid) : "a0", "memory");
+	asm volatile(HFENCE_VVMA(zero, %0) : : "r" (asid) : "memory");
 
 	csr_write(CSR_HGATP, hgatp);
 }
@@ -183,17 +102,9 @@ void kvm_riscv_local_hfence_vvma_gva(unsigned long vmid,
 
 	hgatp = csr_swap(CSR_HGATP, vmid << HGATP_VMID_SHIFT);
 
-	for (pos = gva; pos < (gva + gvsz); pos += BIT(order)) {
-		/*
-		 * rs1 = a0 (GVA)
-		 * rs2 = zero
-		 * HFENCE.VVMA a0
-		 * 0010001 00000 01010 000 00000 1110011
-		 */
-		asm volatile ("add a0, %0, zero\n"
-			      ".word 0x22050073\n"
-			      :: "r" (pos) : "a0", "memory");
-	}
+	for (pos = gva; pos < (gva + gvsz); pos += BIT(order))
+		asm volatile(HFENCE_VVMA(%0, zero)
+		: : "r" (pos) : "memory");
 
 	csr_write(CSR_HGATP, hgatp);
 }
@@ -204,13 +115,7 @@ void kvm_riscv_local_hfence_vvma_all(unsigned long vmid)
 
 	hgatp = csr_swap(CSR_HGATP, vmid << HGATP_VMID_SHIFT);
 
-	/*
-	 * rs1 = zero
-	 * rs2 = zero
-	 * HFENCE.VVMA
-	 * 0010001 00000 00000 000 00000 1110011
-	 */
-	asm volatile (".word 0x22000073" ::: "memory");
+	asm volatile(HFENCE_VVMA(zero, zero) : : : "memory");
 
 	csr_write(CSR_HGATP, hgatp);
 }
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
