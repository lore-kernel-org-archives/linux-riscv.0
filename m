Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06372C001B5
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Sep 2022 17:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D9TJRaE98cBpqucw0I5Rv04hsn+bTnTQ8vU1qcQIqhg=; b=zPNDbQ2XVDNCnC
	OGepGVeX/90mN175pc0mF+RJ6P43+HxRHquAnP04Mx3kikvgtyf899OWYuw5au54xzok5juCf5p8Z
	AMqZMXizvzWynFDZN/n2WJdbMB9fe1En4/BmR5KroNNs4cIFgON/nF74wJA3+MmDC6od/KV6UIs4w
	HuZcqENTtXh8zLXXi58HWR6mAkcJxmN6ixopNEhi62Rl3Mz1thtXwO7M6uNYupUqkvRBtF66PWpNB
	WmFEilfJ2hdDFRE9f0SoG5EapHJOBZbDY3yaAtsA2rV4k0ygvtplY39edm+20AII/J3TCwKfPsEne
	Yb2YYqiIVXHW/srqKM1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUA3Y-007bdZ-AS; Fri, 02 Sep 2022 17:02:12 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUA3U-007bOu-5G
	for linux-riscv@lists.infradead.org; Fri, 02 Sep 2022 17:02:09 +0000
Received: by mail-pf1-x434.google.com with SMTP id w139so2447628pfc.13
        for <linux-riscv@lists.infradead.org>; Fri, 02 Sep 2022 10:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Su+dsdcpKuRfup/BhsX87oNpiePy7DEXUs63rjehEaY=;
        b=KLnVSWtomAnhLo0pq73SJeNRBQSDLJfIaRsTg8uiS86qckEByuYJw47yP+v7Q9idYT
         WvPcg0sXMfREPwpm1xMsb/lHOB27NnFgCjH2L5EIt7ZPMlmHPBkhHyadMWMQ232o0zwa
         K4xosfpalFGdEE40Vi+FxEzYiBqaVSf8H5rzV8MSq392MnGA8J0FFRcdZDUP96MYUbu1
         8+gt4P/0sMNbDR1tw7EUGBHIwViGboRQpsIBDcsAfMK/Dp4gVRMoH87Mf5DVnBpNdF7q
         FBWGx8KwOiSXe/inpkpCqcqeXLMJrJgeXDzFMvQ1NWoqKYloz9dViFMddNWY6RbLh5ew
         5oAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Su+dsdcpKuRfup/BhsX87oNpiePy7DEXUs63rjehEaY=;
        b=DWfW9+hRUSIEALhKnBOac3mHbI2J1l7Dipoj83TpOZUvHHxXsUdwDL5vjpQ0+Y1Kuy
         mFeg4vA9fvgOJg4bo03wEVGD19zVUsZWKUJTsyfXyh/MAy4ijTaGkZX156dqMJ5wtvAl
         2433F2p+uWHVjF+I/p42eC0PcDCY6hTvaOHhZM0aFR+wEQFd9JUGIjf8+9GCg4zQLwis
         N9z8y4u+hh2BHbfUiceEoVDrrESD1Rt/EwZXiGUk88Idbkzj/M7YNXrklOMdnZC1VLuK
         JP871cSxP/pUCA/5+uonL5/yvdTmq41ofgs7Frz6PA51U6KZUcqU/I4/sUwdVTrWkMcp
         lRgw==
X-Gm-Message-State: ACgBeo0hujwaWITXC9b2xtY+ngtqVTw3VimfNGSkHewJKG5SJ6+FGFmi
	DcjH+7JC8v3G3sn4bIj6EJ99TQ==
X-Google-Smtp-Source: AA6agR6Ave9zbkVSjlZNRhdmS8luMf/rm3AkYoo0a9S+xrfdpphbvbioMvCY+PLiiQasurVI/Ov7tA==
X-Received: by 2002:a05:6a00:88a:b0:53a:b7a0:ea3a with SMTP id q10-20020a056a00088a00b0053ab7a0ea3amr14504597pfj.21.1662138111845;
        Fri, 02 Sep 2022 10:01:51 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.83.155])
        by smtp.gmail.com with ESMTPSA id w10-20020a65534a000000b0043014f9a4c9sm1638800pgr.93.2022.09.02.10.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 10:01:51 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 2/3] RISC-V: KVM: Use Svinval for local TLB maintenance when available
Date: Fri,  2 Sep 2022 22:31:30 +0530
Message-Id: <20220902170131.32334-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220902170131.32334-1-apatel@ventanamicro.com>
References: <20220902170131.32334-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_100208_235039_2DA6A0BB 
X-CRM114-Status: GOOD (  10.09  )
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

We should prefer HINVAL.GVMA and HINVAL.VVMA instruction for local TLB
maintenance when underlying host supports Svinval extension.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/insn-def.h | 20 +++++++++++
 arch/riscv/kvm/tlb.c              | 60 ++++++++++++++++++++++++-------
 2 files changed, 68 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
index 8fe9036efb68..246a627d16ee 100644
--- a/arch/riscv/include/asm/insn-def.h
+++ b/arch/riscv/include/asm/insn-def.h
@@ -110,4 +110,24 @@
 	__ASM_STR(.error "hlv.d requires 64-bit support")
 #endif
 
+#define SINVAL_VMA(vaddr, asid)					\
+	INSN_R(OPCODE_SYSTEM, FUNC3(0), FUNC7(11),		\
+	       __RD(0), RS1(vaddr), RS2(asid))
+
+#define SFENCE_W_INVAL()					\
+	INSN_R(OPCODE_SYSTEM, FUNC3(0), FUNC7(12),		\
+	       __RD(0), __RS1(0), __RS2(0))
+
+#define SFENCE_INVAL_IR()					\
+	INSN_R(OPCODE_SYSTEM, FUNC3(0), FUNC7(12),		\
+	       __RD(0), __RS1(0), __RS2(1))
+
+#define HINVAL_VVMA(vaddr, asid)				\
+	INSN_R(OPCODE_SYSTEM, FUNC3(0), FUNC7(19),		\
+	       __RD(0), RS1(vaddr), RS2(asid))
+
+#define HINVAL_GVMA(gaddr, vmid)				\
+	INSN_R(OPCODE_SYSTEM, FUNC3(0), FUNC7(51),		\
+	       __RD(0), RS1(gaddr), RS2(vmid))
+
 #endif /* __ASM_INSN_DEF_H */
diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
index 1ce3394b3acf..309d79b3e5cd 100644
--- a/arch/riscv/kvm/tlb.c
+++ b/arch/riscv/kvm/tlb.c
@@ -12,8 +12,12 @@
 #include <linux/kvm_host.h>
 #include <asm/cacheflush.h>
 #include <asm/csr.h>
+#include <asm/hwcap.h>
 #include <asm/insn-def.h>
 
+#define has_svinval()	\
+	static_branch_unlikely(&riscv_isa_ext_keys[RISCV_ISA_EXT_KEY_SVINVAL])
+
 void kvm_riscv_local_hfence_gvma_vmid_gpa(unsigned long vmid,
 					  gpa_t gpa, gpa_t gpsz,
 					  unsigned long order)
@@ -25,9 +29,17 @@ void kvm_riscv_local_hfence_gvma_vmid_gpa(unsigned long vmid,
 		return;
 	}
 
-	for (pos = gpa; pos < (gpa + gpsz); pos += BIT(order))
-		asm volatile (HFENCE_GVMA(%0, %1)
-		: : "r" (pos >> 2), "r" (vmid) : "memory");
+	if (has_svinval()) {
+		asm volatile (SFENCE_W_INVAL() ::: "memory");
+		for (pos = gpa; pos < (gpa + gpsz); pos += BIT(order))
+			asm volatile (HINVAL_GVMA(%0, %1)
+			: : "r" (pos >> 2), "r" (vmid) : "memory");
+		asm volatile (SFENCE_INVAL_IR() ::: "memory");
+	} else {
+		for (pos = gpa; pos < (gpa + gpsz); pos += BIT(order))
+			asm volatile (HFENCE_GVMA(%0, %1)
+			: : "r" (pos >> 2), "r" (vmid) : "memory");
+	}
 }
 
 void kvm_riscv_local_hfence_gvma_vmid_all(unsigned long vmid)
@@ -45,9 +57,17 @@ void kvm_riscv_local_hfence_gvma_gpa(gpa_t gpa, gpa_t gpsz,
 		return;
 	}
 
-	for (pos = gpa; pos < (gpa + gpsz); pos += BIT(order))
-		asm volatile(HFENCE_GVMA(%0, zero)
-		: : "r" (pos >> 2) : "memory");
+	if (has_svinval()) {
+		asm volatile (SFENCE_W_INVAL() ::: "memory");
+		for (pos = gpa; pos < (gpa + gpsz); pos += BIT(order))
+			asm volatile(HINVAL_GVMA(%0, zero)
+			: : "r" (pos >> 2) : "memory");
+		asm volatile (SFENCE_INVAL_IR() ::: "memory");
+	} else {
+		for (pos = gpa; pos < (gpa + gpsz); pos += BIT(order))
+			asm volatile(HFENCE_GVMA(%0, zero)
+			: : "r" (pos >> 2) : "memory");
+	}
 }
 
 void kvm_riscv_local_hfence_gvma_all(void)
@@ -70,9 +90,17 @@ void kvm_riscv_local_hfence_vvma_asid_gva(unsigned long vmid,
 
 	hgatp = csr_swap(CSR_HGATP, vmid << HGATP_VMID_SHIFT);
 
-	for (pos = gva; pos < (gva + gvsz); pos += BIT(order))
-		asm volatile(HFENCE_VVMA(%0, %1)
-		: : "r" (pos), "r" (asid) : "memory");
+	if (has_svinval()) {
+		asm volatile (SFENCE_W_INVAL() ::: "memory");
+		for (pos = gva; pos < (gva + gvsz); pos += BIT(order))
+			asm volatile(HINVAL_VVMA(%0, %1)
+			: : "r" (pos), "r" (asid) : "memory");
+		asm volatile (SFENCE_INVAL_IR() ::: "memory");
+	} else {
+		for (pos = gva; pos < (gva + gvsz); pos += BIT(order))
+			asm volatile(HFENCE_VVMA(%0, %1)
+			: : "r" (pos), "r" (asid) : "memory");
+	}
 
 	csr_write(CSR_HGATP, hgatp);
 }
@@ -102,9 +130,17 @@ void kvm_riscv_local_hfence_vvma_gva(unsigned long vmid,
 
 	hgatp = csr_swap(CSR_HGATP, vmid << HGATP_VMID_SHIFT);
 
-	for (pos = gva; pos < (gva + gvsz); pos += BIT(order))
-		asm volatile(HFENCE_VVMA(%0, zero)
-		: : "r" (pos) : "memory");
+	if (has_svinval()) {
+		asm volatile (SFENCE_W_INVAL() ::: "memory");
+		for (pos = gva; pos < (gva + gvsz); pos += BIT(order))
+			asm volatile(HINVAL_VVMA(%0, zero)
+			: : "r" (pos) : "memory");
+		asm volatile (SFENCE_INVAL_IR() ::: "memory");
+	} else {
+		for (pos = gva; pos < (gva + gvsz); pos += BIT(order))
+			asm volatile(HFENCE_VVMA(%0, zero)
+			: : "r" (pos) : "memory");
+	}
 
 	csr_write(CSR_HGATP, hgatp);
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
