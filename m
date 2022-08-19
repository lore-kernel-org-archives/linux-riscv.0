Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 248FCC32771
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 14:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wn4KryFCRUDUVem9Ph+FxfTM9lS52+xbeZRFcL1kTjw=; b=qnrE+CHV+aj3Qa
	4desbvlpfYoREIBz4Tyo/PMiDhKIbVK3RpY9VvszyoeGIr442xUa57NXeGvsGIx8j051AYW35Oavp
	NHIMONpXB9GEb8gJtDIyMqfopWhcbPJ4lrYfXRif3FwqVIZT5s9nnlUoYTRBRPo/T+sthZGEhkOKo
	WTRjwQqezsduyt5hKERuCcHmaqFHzx1aFXnjbRylJgl0B2Tsm1kvIkifH6YjZK7eV9wplvjDUgmzc
	zq0RcAv8n9ewQrOBPt88Y42wVs9tp8lndT2UMBp5buPfulw94/+iWnHErBleRy5oFElWTAOuHDtGJ
	WeMTYBftvqKC87/Ymj2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP2aa-009Kim-Cr; Fri, 19 Aug 2022 14:03:08 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP2aS-009KYe-E8
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 14:03:02 +0000
Received: by mail-ed1-x535.google.com with SMTP id e21so943360edc.7
        for <linux-riscv@lists.infradead.org>; Fri, 19 Aug 2022 07:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=eHs+z8DwNs709gkux1J21T7x+ZKZRefKINTUPP0jqqE=;
        b=MiVkDd4ypsClXPfrJblJPX1o05V2XlMgkABPNa+ANz5bpPHj3bz+KUWKPLbj4eMh2e
         Rf+Yfig8Yqutna/Gl1ZlvDAYMbONm2a1faNbFHIgth+0jnO5iCoOoiGUO2cdhbMbPcoX
         NMC2DiHTYwuBlGQ0fm+hNXHeNI+FOZwopJW5bb9kQ/vLNIsHRnM3VsLkUoUfyPkguFPn
         DdTu45vwCCHA2KHOEW12+Ilk7iklf/ig1tuAmHI2WDQHVgWZwZRBHOq+P9Rx6AdrUeSA
         /uUw748nFBk8M/HHgh89LcniBs/ZOywQ1MUrAVWqnhGA8R57j5Uu3Etgfl+IUxWQLBCC
         crfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=eHs+z8DwNs709gkux1J21T7x+ZKZRefKINTUPP0jqqE=;
        b=fzqkQW5u7kizLv1pXSvvY6ftgrPu1e2ltXW1wUBonEOa0bTtwc0SMCrF34qZwU/MjV
         O1OJi/0XizBJnLEqqSsaej796kWrbPJlGIWJyPJVgKJmhPS6kocT6I1xKd83PkhmKU30
         Q74IchgHvDRVuCPpXK7rizEQx+4bhSv9sG/UxgZyyRn83auWjEIq/Bq5A+K1vCA+VkJH
         rNGV+HL4wD0eUXryoUhkFvnipYF4WS34lzWVlIg6HKrPodo0VUzMHw8JQoXc5jvYMBlL
         24q1E6izFr4FlW+OWM9pjXuWGx59T+NTyaLBPw9BTC/AfXnUCsAsQFnOYD2polRZtJB3
         0uVw==
X-Gm-Message-State: ACgBeo2PW0i8SE1+nqFiN4cmH+ykVquAhWIrLRwuTCKvbn2cjyQKdag+
	MxiEcjtJfLBE0iytXUt8TGTTiwmhTwrz4g==
X-Google-Smtp-Source: AA6agR63VI1qC3a/Avg6iK+EkZbCELYZLImNqOEsToeYNls3s6oXmzXpKEmehFYJbdsLBfBuKZi0RQ==
X-Received: by 2002:a05:6402:1044:b0:446:27c1:49a4 with SMTP id e4-20020a056402104400b0044627c149a4mr4331991edu.53.1660917776492;
        Fri, 19 Aug 2022 07:02:56 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
        by smtp.gmail.com with ESMTPSA id b9-20020a17090630c900b0073c9d68ca0dsm1434287ejb.133.2022.08.19.07.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 07:02:56 -0700 (PDT)
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
Subject: [PATCH 3/4] riscv: KVM: Apply insn-def to hfence encodings
Date: Fri, 19 Aug 2022 16:02:49 +0200
Message-Id: <20220819140250.3892995-4-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220819140250.3892995-1-ajones@ventanamicro.com>
References: <20220819140250.3892995-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_070300_492218_AEC2BB4A 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
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
---
 arch/riscv/include/asm/insn-def.h |   8 ++
 arch/riscv/kvm/tlb.c              | 117 ++++--------------------------
 2 files changed, 21 insertions(+), 104 deletions(-)

diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
index 4cd0208068dd..cd1c0d365f47 100644
--- a/arch/riscv/include/asm/insn-def.h
+++ b/arch/riscv/include/asm/insn-def.h
@@ -79,4 +79,12 @@
 #define RS1(v)		__REG(v)
 #define RS2(v)		__REG(v)
 
+#define OPCODE_SYSTEM	OPCODE(115)
+
+#define HFENCE_VVMA(vaddr, asid)	\
+	INSN_R(OPCODE_SYSTEM, FUNC3(0), FUNC7(17), RD(0), vaddr, asid)
+
+#define HFENCE_GVMA(gaddr, vmid)	\
+	INSN_R(OPCODE_SYSTEM, FUNC3(0), FUNC7(49), RD(0), gaddr, vmid)
+
 #endif /* __ASM_INSN_DEF_H */
diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
index 1a76d0b1907d..f742a0d888e1 100644
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
@@ -41,31 +26,14 @@ void kvm_riscv_local_hfence_gvma_vmid_gpa(unsigned long vmid,
 	}
 
 	for (pos = gpa; pos < (gpa + gpsz); pos += BIT(order)) {
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
+		asm volatile (HFENCE_GVMA("%0", "%1")
+		: : "r" (pos >> 2), "r" (vmid) : "memory");
 	}
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
+	asm volatile(HFENCE_GVMA("zero", "%0") : : "r" (vmid) : "memory");
 }
 
 void kvm_riscv_local_hfence_gvma_gpa(gpa_t gpa, gpa_t gpsz,
@@ -79,45 +47,16 @@ void kvm_riscv_local_hfence_gvma_gpa(gpa_t gpa, gpa_t gpsz,
 	}
 
 	for (pos = gpa; pos < (gpa + gpsz); pos += BIT(order)) {
-		/*
-		 * rs1 = a0 (GPA >> 2)
-		 * rs2 = zero
-		 * HFENCE.GVMA a0
-		 * 0110001 00000 01010 000 00000 1110011
-		 */
-		asm volatile ("srli a0, %0, 2\n"
-			      ".word 0x62050073\n"
-			      :: "r" (pos) : "a0", "memory");
+		asm volatile(HFENCE_GVMA("%0", "zero")
+		: : "r" (pos >> 2) : "memory");
 	}
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
+	asm volatile(HFENCE_GVMA("zero", "zero") : : : "memory");
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
@@ -134,17 +73,8 @@ void kvm_riscv_local_hfence_vvma_asid_gva(unsigned long vmid,
 	hgatp = csr_swap(CSR_HGATP, vmid << HGATP_VMID_SHIFT);
 
 	for (pos = gva; pos < (gva + gvsz); pos += BIT(order)) {
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
+		asm volatile(HFENCE_VVMA("%0", "%1")
+		: : "r" (pos), "r" (asid) : "memory");
 	}
 
 	csr_write(CSR_HGATP, hgatp);
@@ -157,15 +87,7 @@ void kvm_riscv_local_hfence_vvma_asid_all(unsigned long vmid,
 
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
+	asm volatile(HFENCE_VVMA("zero", "%0") : : "r" (asid) : "memory");
 
 	csr_write(CSR_HGATP, hgatp);
 }
@@ -184,15 +106,8 @@ void kvm_riscv_local_hfence_vvma_gva(unsigned long vmid,
 	hgatp = csr_swap(CSR_HGATP, vmid << HGATP_VMID_SHIFT);
 
 	for (pos = gva; pos < (gva + gvsz); pos += BIT(order)) {
-		/*
-		 * rs1 = a0 (GVA)
-		 * rs2 = zero
-		 * HFENCE.VVMA a0
-		 * 0010001 00000 01010 000 00000 1110011
-		 */
-		asm volatile ("add a0, %0, zero\n"
-			      ".word 0x22050073\n"
-			      :: "r" (pos) : "a0", "memory");
+		asm volatile(HFENCE_VVMA("%0", "zero")
+		: : "r" (pos) : "memory");
 	}
 
 	csr_write(CSR_HGATP, hgatp);
@@ -204,13 +119,7 @@ void kvm_riscv_local_hfence_vvma_all(unsigned long vmid)
 
 	hgatp = csr_swap(CSR_HGATP, vmid << HGATP_VMID_SHIFT);
 
-	/*
-	 * rs1 = zero
-	 * rs2 = zero
-	 * HFENCE.VVMA
-	 * 0010001 00000 00000 000 00000 1110011
-	 */
-	asm volatile (".word 0x22000073" ::: "memory");
+	asm volatile(HFENCE_VVMA("zero", "zero") : : : "memory");
 
 	csr_write(CSR_HGATP, hgatp);
 }
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
