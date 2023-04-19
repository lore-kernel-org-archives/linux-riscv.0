Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C1E6C77B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 23:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b1eephXtMiVQPa1r6Fo6bSc/CAJhpP8sJG2/T3zZVVs=; b=ULoN4zvdNQRq+w
	bBIkspl/cxCgwkpV11xmSf+WjE6y4VcYTLivGOehChW0jegaFLlDDN72JgSz7iY95sjkC818yAixq
	mZg04hn73EKE2rMqcXn+HXEdJLxTzPRst+GQiBItjto567Qsf/tJ5yeimMuzQLQlzDAJlQm4xNFcH
	mlt1Hynf4UXfv70txAhiiCB87gkjSx4yrd1loU57XUncWS+uA2uiew7F8FpZ+7Fm98dxeEJvbCble
	Svz/V1AnzbDcYQHKVDcO93M7zLUBjoKi5MTdIayuJz3OqBVNQmxrWVahcjAXKz0k8QqJq3/V+Z5yd
	0AHyNgjcrUU5QNAjRCVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppHGB-006ebV-1S;
	Wed, 19 Apr 2023 23:30:47 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppG8X-006TQC-2i
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 22:18:51 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1a645fd0c6dso4319835ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 15:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942729; x=1684534729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XK5xUw/rzaPgA4jO4a/YwH8Byrp1ajuQRNW8VnU2lnI=;
        b=QfXuULt6GKdZ0yIYOBu58cROq1xtd+AwU5tA9tWSYcP8puXwvEN9RX3lXVuV60tyoW
         4Q0CSfUoxv6NDjypNOuOT4ywNhU7IYB+qeWNkXwN91wiD9TQD3HOmit1hlHNqFbWVtNJ
         ziwh+QBq1N6MeIyCvSv5s6RR13cXyHzSqXBQKCnCZR2rrQanp3QhB3VbRYZ2jQSTPE6d
         Vpg87adIN6SFou4dfOJ3ZLRcLAQq2ZlEUcDyGi0vckdKvSSc1nPlKdGfKGwb9h5rUo3e
         rLKhVd1kgYj7FOEo7g+ojtFs7lAxzBaXut+YFsbxt/trii3p8w9AEE1pM3je3JF/e5ut
         1yXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942729; x=1684534729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XK5xUw/rzaPgA4jO4a/YwH8Byrp1ajuQRNW8VnU2lnI=;
        b=ka7r5aAOjm0MmXaxH5BTTfJr9/Sj6TzYoy+rc7tKsgRVkDk9QnAGZEPQGTmT/J0H5I
         UwSFS6ZVVORZdLNtD28jkNYLEIZzXWuoGzSNVjD8+KwxW88bLfWtRhTm0Qa4q2DxslJD
         +t0jmHkvILhZkqAJNxsGlKwNLjA6/6XcJGyHGMrB8PYnaIV7DSuBWt2UaV+Gs7ixUpQA
         z15RlIXIQPNf5g1yNzjdyGCL5SFDBVwZ+zhbtXrM8vpnm2lTjcXMGuWML6NFzOS1z9nr
         Ev7q5/SeKXoS3R1snl+3LOadryPWp4LvZGL7UyMfeEy/BDpDRI6VR26hOCU4IoJFTN4q
         Hc7Q==
X-Gm-Message-State: AAQBX9eUCwuM6j+bu6aAdZhGTSbkACMeM0wB8CYc2jfXomPZoMNf8z8p
	HJ/v3pQzcWFlkjKhQGXGVIQTBA==
X-Google-Smtp-Source: AKy350baQTNt4Vs4HHjBbXvyObvJ3IXFGZptf7h2H+OASSZVy5+7QV7+crZBWOtRSKw2ldJwBUdMWw==
X-Received: by 2002:a17:903:784:b0:1a2:9183:a499 with SMTP id kn4-20020a170903078400b001a29183a499mr5853196plb.34.1681942729515;
        Wed, 19 Apr 2023 15:18:49 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:18:49 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Rajnesh Kanwal <rkanwal@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	linux-coco@lists.linux.dev,
	Dylan Reid <dylan@rivosinc.com>,
	abrestic@rivosinc.com,
	Samuel Ortiz <sameo@rivosinc.com>,
	Christoph Hellwig <hch@infradead.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jiri Slaby <jirislaby@kernel.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Uladzislau Rezki <urezki@gmail.com>
Subject: [RFC 36/48] RISC-V: KVM: Read/write gprs from/to shmem in case of TVM VCPU.
Date: Wed, 19 Apr 2023 15:17:04 -0700
Message-Id: <20230419221716.3603068-37-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_151849_892766_AACE03B9 
X-CRM114-Status: GOOD (  16.37  )
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

From: Rajnesh Kanwal <rkanwal@rivosinc.com>

For TVM vcpus, TSM uses shared memory to exposes gprs for the trusted
VCPU. This change makes sure we use shmem when doing mmio emulation
for trusted VMs.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_insn.c | 98 +++++++++++++++++++++++++++++++++-----
 1 file changed, 85 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
index 331489f..56eeb86 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -7,6 +7,9 @@
 #include <linux/bitops.h>
 #include <linux/kvm_host.h>
 #include <asm/kvm_cove.h>
+#include <asm/kvm_nacl.h>
+#include <asm/kvm_cove_sbi.h>
+#include <asm/asm-offsets.h>
 
 #define INSN_OPCODE_MASK	0x007c
 #define INSN_OPCODE_SHIFT	2
@@ -116,6 +119,10 @@
 #define REG_OFFSET(insn, pos)		\
 	(SHIFT_RIGHT((insn), (pos) - LOG_REGBYTES) & REG_MASK)
 
+#define REG_INDEX(insn, pos)                                    \
+	((SHIFT_RIGHT((insn), (pos)-LOG_REGBYTES) & REG_MASK) / \
+	 (__riscv_xlen / 8))
+
 #define REG_PTR(insn, pos, regs)	\
 	((ulong *)((ulong)(regs) + REG_OFFSET(insn, pos)))
 
@@ -600,6 +607,7 @@ int kvm_riscv_vcpu_mmio_store(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	int len = 0, insn_len = 0;
 	struct kvm_cpu_trap utrap = { 0 };
 	struct kvm_cpu_context *ct = &vcpu->arch.guest_context;
+	void *nshmem;
 
 	/* Determine trapped instruction */
 	if (htinst & 0x1) {
@@ -627,7 +635,15 @@ int kvm_riscv_vcpu_mmio_store(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		insn_len = INSN_LEN(insn);
 	}
 
-	data = GET_RS2(insn, &vcpu->arch.guest_context);
+	if (is_cove_vcpu(vcpu)) {
+		nshmem = nacl_shmem();
+		data = nacl_shmem_gpr_read_cove(nshmem,
+					       REG_INDEX(insn, SH_RS2) * 8 +
+						       KVM_ARCH_GUEST_ZERO);
+	} else {
+		data = GET_RS2(insn, &vcpu->arch.guest_context);
+	}
+
 	data8 = data16 = data32 = data64 = data;
 
 	if ((insn & INSN_MASK_SW) == INSN_MATCH_SW) {
@@ -643,19 +659,43 @@ int kvm_riscv_vcpu_mmio_store(struct kvm_vcpu *vcpu, struct kvm_run *run,
 #ifdef CONFIG_64BIT
 	} else if ((insn & INSN_MASK_C_SD) == INSN_MATCH_C_SD) {
 		len = 8;
-		data64 = GET_RS2S(insn, &vcpu->arch.guest_context);
+		if (is_cove_vcpu(vcpu)) {
+			data64 = nacl_shmem_gpr_read_cove(
+				nshmem,
+				RVC_RS2S(insn) * 8 + KVM_ARCH_GUEST_ZERO);
+		} else {
+			data64 = GET_RS2S(insn, &vcpu->arch.guest_context);
+		}
 	} else if ((insn & INSN_MASK_C_SDSP) == INSN_MATCH_C_SDSP &&
 		   ((insn >> SH_RD) & 0x1f)) {
 		len = 8;
-		data64 = GET_RS2C(insn, &vcpu->arch.guest_context);
+		if (is_cove_vcpu(vcpu)) {
+			data64 = nacl_shmem_gpr_read_cove(
+				nshmem, REG_INDEX(insn, SH_RS2C) * 8 +
+						KVM_ARCH_GUEST_ZERO);
+		} else {
+			data64 = GET_RS2C(insn, &vcpu->arch.guest_context);
+		}
 #endif
 	} else if ((insn & INSN_MASK_C_SW) == INSN_MATCH_C_SW) {
 		len = 4;
-		data32 = GET_RS2S(insn, &vcpu->arch.guest_context);
+		if (is_cove_vcpu(vcpu)) {
+			data32 = nacl_shmem_gpr_read_cove(
+				nshmem,
+				RVC_RS2S(insn) * 8 + KVM_ARCH_GUEST_ZERO);
+		} else {
+			data32 = GET_RS2S(insn, &vcpu->arch.guest_context);
+		}
 	} else if ((insn & INSN_MASK_C_SWSP) == INSN_MATCH_C_SWSP &&
 		   ((insn >> SH_RD) & 0x1f)) {
 		len = 4;
-		data32 = GET_RS2C(insn, &vcpu->arch.guest_context);
+		if (is_cove_vcpu(vcpu)) {
+			data32 = nacl_shmem_gpr_read_cove(
+				nshmem, REG_INDEX(insn, SH_RS2C) * 8 +
+						KVM_ARCH_GUEST_ZERO);
+		} else {
+			data32 = GET_RS2C(insn, &vcpu->arch.guest_context);
+		}
 	} else {
 		return -EOPNOTSUPP;
 	}
@@ -725,6 +765,7 @@ int kvm_riscv_vcpu_mmio_return(struct kvm_vcpu *vcpu, struct kvm_run *run)
 	u64 data64;
 	ulong insn;
 	int len, shift;
+	void *nshmem;
 
 	if (vcpu->arch.mmio_decode.return_handled)
 		return 0;
@@ -738,26 +779,57 @@ int kvm_riscv_vcpu_mmio_return(struct kvm_vcpu *vcpu, struct kvm_run *run)
 	len = vcpu->arch.mmio_decode.len;
 	shift = vcpu->arch.mmio_decode.shift;
 
+	if (is_cove_vcpu(vcpu))
+		nshmem = nacl_shmem();
+
 	switch (len) {
 	case 1:
 		data8 = *((u8 *)run->mmio.data);
-		SET_RD(insn, &vcpu->arch.guest_context,
-			(ulong)data8 << shift >> shift);
+		if (is_cove_vcpu(vcpu)) {
+			nacl_shmem_gpr_write_cove(nshmem,
+						 REG_INDEX(insn, SH_RD) * 8 +
+							 KVM_ARCH_GUEST_ZERO,
+						 (unsigned long)data8);
+		} else {
+			SET_RD(insn, &vcpu->arch.guest_context,
+			       (ulong)data8 << shift >> shift);
+		}
 		break;
 	case 2:
 		data16 = *((u16 *)run->mmio.data);
-		SET_RD(insn, &vcpu->arch.guest_context,
-			(ulong)data16 << shift >> shift);
+		if (is_cove_vcpu(vcpu)) {
+			nacl_shmem_gpr_write_cove(nshmem,
+						 REG_INDEX(insn, SH_RD) * 8 +
+							 KVM_ARCH_GUEST_ZERO,
+						 (unsigned long)data16);
+		} else {
+			SET_RD(insn, &vcpu->arch.guest_context,
+			       (ulong)data16 << shift >> shift);
+		}
 		break;
 	case 4:
 		data32 = *((u32 *)run->mmio.data);
-		SET_RD(insn, &vcpu->arch.guest_context,
-			(ulong)data32 << shift >> shift);
+		if (is_cove_vcpu(vcpu)) {
+			nacl_shmem_gpr_write_cove(nshmem,
+						 REG_INDEX(insn, SH_RD) * 8 +
+							 KVM_ARCH_GUEST_ZERO,
+						 (unsigned long)data32);
+		} else {
+			SET_RD(insn, &vcpu->arch.guest_context,
+			       (ulong)data32 << shift >> shift);
+		}
 		break;
 	case 8:
 		data64 = *((u64 *)run->mmio.data);
-		SET_RD(insn, &vcpu->arch.guest_context,
-			(ulong)data64 << shift >> shift);
+		if (is_cove_vcpu(vcpu)) {
+			nacl_shmem_gpr_write_cove(nshmem,
+						 REG_INDEX(insn, SH_RD) * 8 +
+							 KVM_ARCH_GUEST_ZERO,
+						 (unsigned long)data64);
+		} else {
+			SET_RD(insn, &vcpu->arch.guest_context,
+			       (ulong)data64 << shift >> shift);
+		}
 		break;
 	default:
 		return -EOPNOTSUPP;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
