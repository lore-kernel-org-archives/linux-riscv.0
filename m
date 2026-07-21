Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF6FCC44532
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 14:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Mime-Version:Subject:From:Cc:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=Z7hLckSuSsfcprl+FhWGCCA/yp1RR1+b/J+H2tJcteo=; b=kWT
	EPU4hIvI4A4L4K3B0UN3NMVdp1U8YbSawWGVHsA92/Pyb2Kdr9uDKmzzjwk1G5LLT4aHUhLoSpWqN
	i2CYrBYcUdu41eLnuLKnu+p7Y8ppE7MRnpFW8XH/r0vtEb35DRpveyxE0Cbpoyv7kuwsEnL717A+c
	TG/dlZCx64Yk+sMCuUK93My+x58E44xNMwcorLT0tr1lzwEpCzRi/Kzqq0Eh6ortn+tawC8GArn0A
	oFIaaf2ZlSOTCAIcG55oNY/E791RolrgSIkPH1KviItZjY0J+T4h7Wm7GU3W5YLOiLi5gjGyiyI0K
	gI9UHqzsget9lzX+I5Nbbr/7uOd003Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmBJG-00000009dRG-2VlT;
	Tue, 21 Jul 2026 14:19:02 +0000
Received: from va-2-39.ptr.blmpb.com ([209.127.231.39])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmBIn-00000009dMv-1bov
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jul 2026 14:19:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1784643501; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=/cfi2/DwilvnTli9c/xc55NV9rwALUN+tdQXzBwJvGc=;
 b=comSdEM/o/Kff7jFsMxLkz1oUdUHpyjl9jkPAJX92qGlJkHzXe+yHCyaCvFAghn4gMwxDR
 WHRwQIoGE6o0u4dXhicnqGfmz+mYTs5Y0/3/RlAUbDQ0P7x2XhWezbXk5xGBHMWMzPXodU
 Y4hjnkOMWTaOso5jLhojEswDGuZKYDA1Z+8DfkFtLxH9BQJCQ7KGGKA1P4YTCCIcY/gx/p
 kMuvl2k77yPLaugrs+ldt4Y3QcVZCuL89vj/vunCU2w3QKJXcJzbyPKk2s5Itg03oDIVec
 b4nSKJ0mxiKA+0l9LMd87jIdbKDWzt2tGQKChJmr5aB3+ZVNIprR422ZpX2Lgw==
Date: Tue, 21 Jul 2026 22:18:15 +0800
Message-Id: <20260721141815.80677-1-yang.yicong@picoheart.com>
X-Lms-Return-Path: <lba+26a5f7fab+c7e067+lists.infradead.org+yang.yicong@picoheart.com>
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
Cc: <alex@ghiti.fr>, <atish.patra@linux.dev>, <geshijian@picoheart.com>, 
	<shenyang.young@picoheart.com>, <yang.yicong@picoheart.com>
From: "Yicong Yang" <yang.yicong@picoheart.com>
Subject: [PATCH] RISC-V: KVM: Fix the conversion between vsip and hvip
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.1
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, 
	<anup@brainfault.org>, <linux-riscv@lists.infradead.org>
Received: from G9WYR9K0VW.bytedance.net ([120.234.91.236]) by smtp.feishu.cn with ESMTPS; Tue, 21 Jul 2026 22:18:18 +0800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_071833_620632_FA419836 
X-CRM114-Status: GOOD (  10.27  )
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

Per AIA spec 1.0 Section 6.3.2, the interrupt numbers 13-63
shares same bit position between related VS shadow CSRs and
hypervisor CSRs. So there's a shift only for SSI, STI and
SEI interrupt.

Currently the KVM always does a shift for all the interrupts
(include LCOFI with number 13) when doing the conversion
between vsip and hvip. Fix this by only doing shift the SSI,
STI and SEI. Add wrappers for doing the conversion between
vsip and hvip.

Signed-off-by: Yicong Yang <yang.yicong@picoheart.com>
---
 arch/riscv/include/asm/csr.h       | 20 ++++++++++++++++----
 arch/riscv/kvm/vcpu.c              |  3 +--
 arch/riscv/kvm/vcpu_onereg.c       |  8 +++-----
 tools/arch/riscv/include/asm/csr.h | 20 ++++++++++++++++----
 4 files changed, 36 insertions(+), 15 deletions(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index cd22b5168689..d5d309b3b570 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -183,12 +183,24 @@
 #define HGATP_MODE_SHIFT	HGATP32_MODE_SHIFT
 #endif
 
-/* VSIP & HVIP relation */
+/*
+ * VSIP & HVIP relation
+ *
+ * The bit positions are same between VSIP and HVIP for interrupt
+ * numbers 13-63, where there's a shift for the SSI, STI and SEI.
+ */
 #define VSIP_TO_HVIP_SHIFT	(IRQ_VS_SOFT - IRQ_S_SOFT)
-#define VSIP_VALID_MASK		((_AC(1, UL) << IRQ_S_SOFT) | \
+#define VSIP_BIAS_MASK		((_AC(1, UL) << IRQ_S_SOFT) | \
 				 (_AC(1, UL) << IRQ_S_TIMER) | \
-				 (_AC(1, UL) << IRQ_S_EXT) | \
-				 (_AC(1, UL) << IRQ_PMU_OVF))
+				 (_AC(1, UL) << IRQ_S_EXT))
+#define VSIP_NO_BIAS_MASK	(_AC(1, UL) << IRQ_PMU_OVF)
+#define VSIP_VALID_MASK		(VSIP_BIAS_MASK | VSIP_NO_BIAS_MASK)
+#define vsip_to_hvip(_vsip)	((((_vsip) & VSIP_BIAS_MASK) << \
+				  VSIP_TO_HVIP_SHIFT) | \
+				 ((_vsip) & VSIP_NO_BIAS_MASK))
+#define hvip_to_vsip(_hvip)	((((_hvip) >> VSIP_TO_HVIP_SHIFT) & \
+				  VSIP_BIAS_MASK) | \
+				 ((_hvip) & VSIP_NO_BIAS_MASK))
 
 /* AIA CSR bits */
 #define TOPI_IID_SHIFT		16
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index cf6e231e76e2..817d3d5654d9 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -450,8 +450,7 @@ bool kvm_riscv_vcpu_has_interrupts(struct kvm_vcpu *vcpu, u64 mask)
 {
 	unsigned long ie;
 
-	ie = ((vcpu->arch.guest_csr.vsie & VSIP_VALID_MASK)
-		<< VSIP_TO_HVIP_SHIFT) & (unsigned long)mask;
+	ie = vsip_to_hvip(vcpu->arch.guest_csr.vsie) & (unsigned long)mask;
 	ie |= vcpu->arch.guest_csr.vsie & ~IRQ_LOCAL_MASK &
 		(unsigned long)mask;
 	if (READ_ONCE(vcpu->arch.irqs_pending[0]) & ie)
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index bb920e8923c9..6589f0e004ca 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -284,7 +284,7 @@ static int kvm_riscv_vcpu_general_get_csr(struct kvm_vcpu *vcpu,
 
 	if (reg_num == KVM_REG_RISCV_CSR_REG(sip)) {
 		kvm_riscv_vcpu_flush_interrupts(vcpu);
-		*out_val = (csr->hvip >> VSIP_TO_HVIP_SHIFT) & VSIP_VALID_MASK;
+		*out_val = hvip_to_vsip(csr->hvip);
 		*out_val |= csr->hvip & ~IRQ_LOCAL_MASK;
 	} else
 		*out_val = ((unsigned long *)csr)[reg_num];
@@ -304,10 +304,8 @@ static int kvm_riscv_vcpu_general_set_csr(struct kvm_vcpu *vcpu,
 
 	reg_num = array_index_nospec(reg_num, regs_max);
 
-	if (reg_num == KVM_REG_RISCV_CSR_REG(sip)) {
-		reg_val &= VSIP_VALID_MASK;
-		reg_val <<= VSIP_TO_HVIP_SHIFT;
-	}
+	if (reg_num == KVM_REG_RISCV_CSR_REG(sip))
+		reg_val = vsip_to_hvip(reg_val);
 
 	((unsigned long *)csr)[reg_num] = reg_val;
 
diff --git a/tools/arch/riscv/include/asm/csr.h b/tools/arch/riscv/include/asm/csr.h
index 21d8cee04638..8df64314d613 100644
--- a/tools/arch/riscv/include/asm/csr.h
+++ b/tools/arch/riscv/include/asm/csr.h
@@ -163,12 +163,24 @@
 #define HGATP_MODE_SHIFT	HGATP32_MODE_SHIFT
 #endif
 
-/* VSIP & HVIP relation */
+/*
+ * VSIP & HVIP relation
+ *
+ * The bit positions are same between VSIP and HVIP for interrupt
+ * numbers 13-63, where there's a shift for the SSI, STI and SEI.
+ */
 #define VSIP_TO_HVIP_SHIFT	(IRQ_VS_SOFT - IRQ_S_SOFT)
-#define VSIP_VALID_MASK		((_AC(1, UL) << IRQ_S_SOFT) | \
+#define VSIP_BIAS_MASK		((_AC(1, UL) << IRQ_S_SOFT) | \
 				 (_AC(1, UL) << IRQ_S_TIMER) | \
-				 (_AC(1, UL) << IRQ_S_EXT) | \
-				 (_AC(1, UL) << IRQ_PMU_OVF))
+				 (_AC(1, UL) << IRQ_S_EXT))
+#define VSIP_NO_BIAS_MASK	(_AC(1, UL) << IRQ_PMU_OVF)
+#define VSIP_VALID_MASK		(VSIP_BIAS_MASK | VSIP_NO_BIAS_MASK)
+#define vsip_to_hvip(_vsip)	((((_vsip) & VSIP_BIAS_MASK) << \
+				  VSIP_TO_HVIP_SHIFT) | \
+				 ((_vsip) & VSIP_NO_BIAS_MASK))
+#define hvip_to_vsip(_hvip)	((((_hvip) >> VSIP_TO_HVIP_SHIFT) & \
+				  VSIP_BIAS_MASK) | \
+				 ((_hvip) & VSIP_NO_BIAS_MASK))
 
 /* AIA CSR bits */
 #define TOPI_IID_SHIFT		16
-- 
2.50.1 (Apple Git-155)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
