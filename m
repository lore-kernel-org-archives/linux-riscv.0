Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B5EC77B73
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 22:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nEG32vACDefGrj1YBl7j3hUeYlYROZ/B4c7lqElsy3I=; b=PMrplUy04qppUD
	OHtZqfmvuRl8ISkGH8ih9YUKFmBloD/CwA04hkre0BbyDr5rvLBKmFX4nXz83M/GTZRGkLqWu/Sun
	4c7QpLY9W45K/nhgsMmYSnhU4GMxyaMH5AYb9W3Yw+fbkq/5K1r7xnGID9yUWWFXyeFAYvrQszCQf
	PiL6Qd2/gOtxLaibq+hikbfrZPcONisVnFToCTCOX5DaIj08x6Cj6U8e+J9sqO/xMG7z/HvpKL/U+
	gPinbjbgk/NTBLDhvquuSLspYR3bsaU2pb/6RzT3m/+HYz2YSWRz59CQWvblf+r8yiqzT4dlZWhcN
	In9J96FKDtUXU/0NEFzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGFq-006VGx-1w;
	Wed, 19 Apr 2023 22:26:22 +0000
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGFn-006VGJ-2x
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 22:26:21 +0000
Received: by mail-ua1-x92e.google.com with SMTP id a1e0cc1a2514c-771d9ec5aa5so156683241.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 15:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681943179; x=1684535179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MzHgRd9E4939KzL4yVjhGODBFacgyWrf3hGucLzcUO8=;
        b=KQwPki3+o8RoSAlX8lJMO4IjKMjct4qtKGGSedm1Y5NrjE1yY6FE23juxnWdGAF5tF
         Ff6QhY6Een6c7MTHWr0Xv+sqox3ZFbM8CsoaTjqv+xTv4V1Gsf7MwcsCfEYqnbxAomgt
         oLCHtdhD2NnWg/5AnkAX5r+ZV4Dkc1YjkJKxW7lMlcwGqAEjIdXE7si5CPtyD/9nZ8NZ
         hsF48oR7lVZvLvhPQ9qXnMo/UH/MoMqpcBfkzH/2jWAw8M4WaCGgDKuRe2y0g24zujoz
         tyVcLJGnwIQ6aI2nvzPvOvTO13onlK5b5SHjhfISiWK5GCiZTvN4vw/LB5p6AbUS6sq9
         fE4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681943179; x=1684535179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MzHgRd9E4939KzL4yVjhGODBFacgyWrf3hGucLzcUO8=;
        b=EYDFpGT7/xZkmrXeO12pQs6p/3spnLeWe76EfJKuKyF5MGt712R6abR8BCqpu3iWcb
         Y2Y3wgVB3yMHP+CUkakFYuEqUA3SuJS2QzExiojt7dQTnI0nsSVvWDFW40T7mc/7ew5R
         bBLh1To9bgsCQYVSAarhk5HpgPMKdW6qNetF+mbUDBbX7yT9Y7D16cTh4cd+R8JTHOEP
         sFdamDF1hGQEiiFXerAWbJHGJJYrOuIw7Y9EwwI+WP0xAQjqzTU33NivCMqoGAwrcBn9
         ArYoFrxVNkgQMTNOkgBvIYqb1rHxln0tS8rE5Rtwg5i6jVxRz+BcO5MSqRLUhgzSf9wo
         hG4w==
X-Gm-Message-State: AAQBX9d588EthNbIeAAyQugxVEAUmQZWF+db+idQUyKRWv0CORJ3vZQa
	vTxYw6ItySGzAmbyH2cwrUdVDJseNUv4X8FUnl8=
X-Google-Smtp-Source: AKy350Zeg7WcBlbIeS4PGWBrU+nA6D3ZQw2RQUdtMzrRIbcOBcnB4FvzAieagBSVaRSEerSYF/00HQ==
X-Received: by 2002:a17:903:25d1:b0:1a6:3e45:8df with SMTP id jc17-20020a17090325d100b001a63e4508dfmr3379688plb.33.1681942713552;
        Wed, 19 Apr 2023 15:18:33 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:18:33 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
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
	Rajnesh Kanwal <rkanwal@rivosinc.com>,
	Uladzislau Rezki <urezki@gmail.com>
Subject: [RFC 29/48] RISC-V: KVM: Skip AIA CSR updates for TVMs
Date: Wed, 19 Apr 2023 15:16:57 -0700
Message-Id: <20230419221716.3603068-30-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_152619_951037_80870E5E 
X-CRM114-Status: GOOD (  15.51  )
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

For TVMs, the host must not support AIA CSR emulation. In addition to
that, during vcpu load/put the CSR updates are not necessary as the CSR
state must not be visible to the host.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/aia.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
index 71216e1..e3da661 100644
--- a/arch/riscv/kvm/aia.c
+++ b/arch/riscv/kvm/aia.c
@@ -15,6 +15,7 @@
 #include <linux/percpu.h>
 #include <linux/spinlock.h>
 #include <asm/hwcap.h>
+#include <asm/kvm_cove.h>
 
 struct aia_hgei_control {
 	raw_spinlock_t lock;
@@ -134,7 +135,7 @@ void kvm_riscv_vcpu_aia_load(struct kvm_vcpu *vcpu, int cpu)
 {
 	struct kvm_vcpu_aia_csr *csr = &vcpu->arch.aia_context.guest_csr;
 
-	if (!kvm_riscv_aia_available())
+	if (!kvm_riscv_aia_available() || is_cove_vcpu(vcpu))
 		return;
 
 	csr_write(CSR_VSISELECT, csr->vsiselect);
@@ -152,7 +153,7 @@ void kvm_riscv_vcpu_aia_put(struct kvm_vcpu *vcpu)
 {
 	struct kvm_vcpu_aia_csr *csr = &vcpu->arch.aia_context.guest_csr;
 
-	if (!kvm_riscv_aia_available())
+	if (!kvm_riscv_aia_available() || is_cove_vcpu(vcpu))
 		return;
 
 	csr->vsiselect = csr_read(CSR_VSISELECT);
@@ -370,6 +371,10 @@ int kvm_riscv_vcpu_aia_rmw_ireg(struct kvm_vcpu *vcpu, unsigned int csr_num,
 	if (!kvm_riscv_aia_available())
 		return KVM_INSN_ILLEGAL_TRAP;
 
+	/* TVMs do not support AIA emulation */
+	if (is_cove_vcpu(vcpu))
+		return KVM_INSN_EXIT_TO_USER_SPACE;
+
 	/* First try to emulate in kernel space */
 	isel = csr_read(CSR_VSISELECT) & ISELECT_MASK;
 	if (isel >= ISELECT_IPRIO0 && isel <= ISELECT_IPRIO15)
@@ -529,6 +534,9 @@ void kvm_riscv_aia_enable(void)
 	if (!kvm_riscv_aia_available())
 		return;
 
+	if (unlikely(kvm_riscv_cove_enabled()))
+		goto enable_gext;
+
 	aia_set_hvictl(false);
 	csr_write(CSR_HVIPRIO1, 0x0);
 	csr_write(CSR_HVIPRIO2, 0x0);
@@ -539,6 +547,7 @@ void kvm_riscv_aia_enable(void)
 	csr_write(CSR_HVIPRIO2H, 0x0);
 #endif
 
+enable_gext:
 	/* Enable per-CPU SGEI interrupt */
 	enable_percpu_irq(hgei_parent_irq,
 			  irq_get_trigger_type(hgei_parent_irq));
@@ -559,7 +568,9 @@ void kvm_riscv_aia_disable(void)
 	csr_clear(CSR_HIE, BIT(IRQ_S_GEXT));
 	disable_percpu_irq(hgei_parent_irq);
 
-	aia_set_hvictl(false);
+	/* The host is not allowed modify hvictl for TVMs */
+	if (!unlikely(kvm_riscv_cove_enabled()))
+		aia_set_hvictl(false);
 
 	raw_spin_lock_irqsave(&hgctrl->lock, flags);
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
