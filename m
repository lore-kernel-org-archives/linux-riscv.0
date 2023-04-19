Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF621C77B73
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 22:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P4vkuhqVHZTzAFo2ZCaO7oNFf19H5RHqwCXpvzAz9FU=; b=ghqaCSeMLf6g+p
	ADH3iJ79TyN76hb6vMZoUDpmf8w/dNPKgmc3+GNTvURmsSj2xnQg3qcM99Hh90cyU2lrJ1BkXbZsj
	dWwGsqtF3Q1fVrP/RxekJdEZlhsdeOfu/PRcO07qSHpNqJ6IUe+qoVANKuBaGDxCSUa3CshUb0sQe
	sjFBtFMIwMAKJqjSlP9iVd/hJ93aysXMAOwblVlOTvz0Kt3sAy4pmTCSM97ogq83s2pfSli3QN21L
	T2K5ZdLvykW0FTGZ8twvneaR9GQfRSOjvtrY2tq4ip/uydMBQadWbY9ZQXTeDyU+o0sITCR413Ku4
	okqnxbw4UvlY1mc6waWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGQy-006X2C-0h;
	Wed, 19 Apr 2023 22:37:52 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGQp-006WXV-14
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Apr 2023 22:37:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=aZA9SkX62fIMzNEcuGtwzVe8Up8R4eolVQO1cYHyNXI=; b=JXF5pukAj9BQ7nR+nmNYFjWrxk
	1fnHPDpvrgI7pFR8zfliqsZxD9a7aB0PcS0PEOVv+dzpf9M9v6HP6x8q71bFkd32IGjMJ6unYdVU2
	JtLWVk3o8QINUU8SSV6xwDCoCpP5a49cOH0GBa8qfSCGdJdZjufuj3r3ZcQ9VT5LI78zp/Mz6yRd9
	gMNcyIVegKUOiLAMmxT26AJgFAOw1XIT7ON6kmXNsqiZOjzA8VMMnAHwLMbE5QjKy9lWR4f9ot59K
	7Wg3ZIQsgrh0DM2Z6I5nCdBc1IbCuUuGmat/tzJkxGpzen7/UvA9vbOsrGTLQR4TdnWcHroieW/pJ
	rX41lr8w==;
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ppG7k-00De9N-J7
	for linux-riscv@lists.infradead.org; Wed, 19 Apr 2023 22:18:03 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1a80d827179so4502365ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 15:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942676; x=1684534676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aZA9SkX62fIMzNEcuGtwzVe8Up8R4eolVQO1cYHyNXI=;
        b=pr/kZUHrkhLnktVNRdfz4ij02MTZd+B9h2TaIJSMbt3NVujPvaiFp7Ik4rbkspQ4Mw
         yuGTwtHLYNepi572aUMJZXGKBGxqqLOoQQAVLkJQE8EutQeaNnEXjp7ozMrwLpK3F/bd
         Ea/tWnKPdLgS76oaBzGp+E0BB9Obb3YUpFKxXwNOfadBL+8Y1NryGBq3tL1grWdeANk4
         WZM2Z6J10fv3mT8jXclG/Jc0tJeziAmqwuD529CbKYuuh+zFcMDe14NqalRMWLaTiCrI
         zVE7Fohp3aDpbBaOaQnfhoMTTf4olrAvxRsbHG36Vnwm4rXJhTcr8zeKFydq/GZ4e/40
         +9lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942676; x=1684534676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aZA9SkX62fIMzNEcuGtwzVe8Up8R4eolVQO1cYHyNXI=;
        b=lW998tAkTDPMSQtKYPuqN3XLzcHQnf2W0E2FtATzYFFtrX+z62fr/wojcnNCxC5Yw4
         QvisULnO8MTG4Ma98pu4cCCBoqzWcbfo8rHEAVNMkLiv1N3Ir+Wb3W+8yKAS1CGWMSAt
         4cBZJAbR3ZMrES2ifW7QGcnxaGBxtzcpWp0LcdGvwXgYft38qOI2WWIXnPqd//dyN0PR
         KEDhzsjJ25qD47N4gVVCxIdTB710y/zn7es6o49BnH6KyqM+W40mXuAiQdzwb6gaZB4K
         aBQG74Pn65zYurSluXD/oef6pDlRU3jnSOh8rd2drGPuoA5OFkvHgvFtql6yrKzYRfuq
         H+1g==
X-Gm-Message-State: AAQBX9d0mlV+pJt7ozTcIhUypQlGRhO02f9vbVpf9fKbZAwKRtldqQ0/
	8wC98580uS6vSyH/LOtmf4XCxg==
X-Google-Smtp-Source: AKy350aluUR1rPQXEDjya7qc0cousjv7HzRiR+wEHDbTSJe3tj7Btum5nXicmgptUoZ7hSCP4qqeQg==
X-Received: by 2002:a17:902:c40d:b0:1a8:1cbb:4f76 with SMTP id k13-20020a170902c40d00b001a81cbb4f76mr4908149plk.28.1681942676188;
        Wed, 19 Apr 2023 15:17:56 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:17:55 -0700 (PDT)
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
Subject: [RFC 12/48] RISC-V: KVM: Exit to the user space for trap redirection
Date: Wed, 19 Apr 2023 15:16:40 -0700
Message-Id: <20230419221716.3603068-13-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_231800_732043_A8F1B741 
X-CRM114-Status: GOOD (  17.36  )
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

Currently, the trap redirection to the guest happens in the
following cases.

1. Illegal instruction trap
2. Virtual instruction trap
3. Unsuccesfull unpriv read

Allowing host to cause traps in the TVM directly is problematic.
TSM doesn't support trap redirection yet. Ideally, the host should not end
up in one of these situations where it has to redirect the trap. If it
happens, exit to the userspace with error as it can't forward the trap to
the TVM.

If there is any usecasse arises in the future, it has to be co-ordinated
through TSM.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_exit.c |  9 ++++++++-
 arch/riscv/kvm/vcpu_insn.c | 17 +++++++++++++++++
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 4ea101a..0d0c895 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -9,6 +9,7 @@
 #include <linux/kvm_host.h>
 #include <asm/csr.h>
 #include <asm/insn-def.h>
+#include <asm/kvm_cove.h>
 
 static int gstage_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
 			     struct kvm_cpu_trap *trap)
@@ -135,8 +136,14 @@ unsigned long kvm_riscv_vcpu_unpriv_read(struct kvm_vcpu *vcpu,
 void kvm_riscv_vcpu_trap_redirect(struct kvm_vcpu *vcpu,
 				  struct kvm_cpu_trap *trap)
 {
-	unsigned long vsstatus = csr_read(CSR_VSSTATUS);
+	unsigned long vsstatus;
 
+	if (is_cove_vcpu(vcpu)) {
+		kvm_err("RISC-V KVM do not support redirect to CoVE guest yet\n");
+		return;
+	}
+
+	vsstatus = csr_read(CSR_VSSTATUS);
 	/* Change Guest SSTATUS.SPP bit */
 	vsstatus &= ~SR_SPP;
 	if (vcpu->arch.guest_context.sstatus & SR_SPP)
diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
index 7a6abed..331489f 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -6,6 +6,7 @@
 
 #include <linux/bitops.h>
 #include <linux/kvm_host.h>
+#include <asm/kvm_cove.h>
 
 #define INSN_OPCODE_MASK	0x007c
 #define INSN_OPCODE_SHIFT	2
@@ -153,6 +154,10 @@ static int truly_illegal_insn(struct kvm_vcpu *vcpu, struct kvm_run *run,
 {
 	struct kvm_cpu_trap utrap = { 0 };
 
+	/* The host can not redirect any illegal instruction trap to TVM */
+	if (unlikely(is_cove_vcpu(vcpu)))
+		return -EPERM;
+
 	/* Redirect trap to Guest VCPU */
 	utrap.sepc = vcpu->arch.guest_context.sepc;
 	utrap.scause = EXC_INST_ILLEGAL;
@@ -169,6 +174,10 @@ static int truly_virtual_insn(struct kvm_vcpu *vcpu, struct kvm_run *run,
 {
 	struct kvm_cpu_trap utrap = { 0 };
 
+	/* The host can not redirect any virtual instruction trap to TVM */
+	if (unlikely(is_cove_vcpu(vcpu)))
+		return -EPERM;
+
 	/* Redirect trap to Guest VCPU */
 	utrap.sepc = vcpu->arch.guest_context.sepc;
 	utrap.scause = EXC_VIRTUAL_INST_FAULT;
@@ -417,6 +426,10 @@ int kvm_riscv_vcpu_virtual_insn(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	if (unlikely(INSN_IS_16BIT(insn))) {
 		if (insn == 0) {
 			ct = &vcpu->arch.guest_context;
+
+			if (unlikely(is_cove_vcpu(vcpu)))
+				return -EPERM;
+
 			insn = kvm_riscv_vcpu_unpriv_read(vcpu, true,
 							  ct->sepc,
 							  &utrap);
@@ -469,6 +482,8 @@ int kvm_riscv_vcpu_mmio_load(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		insn = htinst | INSN_16BIT_MASK;
 		insn_len = (htinst & BIT(1)) ? INSN_LEN(insn) : 2;
 	} else {
+		if (unlikely(is_cove_vcpu(vcpu)))
+			return -EFAULT;
 		/*
 		 * Bit[0] == 0 implies trapped instruction value is
 		 * zero or special value.
@@ -595,6 +610,8 @@ int kvm_riscv_vcpu_mmio_store(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		insn = htinst | INSN_16BIT_MASK;
 		insn_len = (htinst & BIT(1)) ? INSN_LEN(insn) : 2;
 	} else {
+		if (unlikely(is_cove_vcpu(vcpu)))
+			return -EFAULT;
 		/*
 		 * Bit[0] == 0 implies trapped instruction value is
 		 * zero or special value.
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
