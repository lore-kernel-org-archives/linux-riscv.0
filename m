Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0916C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Apr 2022 11:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=byxdABKK++0sBuQ4/Bte8irbVvPdxLBBxOa6LDip16g=; b=JXSd/nMbqu/24r
	Ejm6JBGge+sCTIK1bExIe99wKoJCh6/cUyvchbzgbto9kqOsQPwMkV05U37MUnZ0VP7WKwADBcDZz
	U8rmsYqwvtU9RXtJNxMPWWDeN2BaPziC4U8dpDPHmqWXYFX18PgzqzATqRf5DhIbPFbIjhuFNa7/I
	DGPAn8YdP5K9w/YQhxjwHlKYHF3/oixDcomz2Gs57LT1N+rEsrrk4NpXv7tFw1tKlzAuiX/YqJ3X+
	+JcQPWMWC2cDH3bHj/CkAkd7eJj2DsSrzXSPv0+68gAuIlJ2MenKjiub/wQ/4mW4RLoF+drdiYg7v
	tWtxF4h4JpyfYO/SkHNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh8Sn-008kyd-Di; Wed, 20 Apr 2022 11:25:37 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh8Sj-008kus-WF
 for linux-riscv@lists.infradead.org; Wed, 20 Apr 2022 11:25:35 +0000
Received: by mail-pf1-x42b.google.com with SMTP id x1so1668354pfj.2
 for <linux-riscv@lists.infradead.org>; Wed, 20 Apr 2022 04:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2EYfKgcqlxuOnooxrLdWILH0tv0pWGBlD29VNkEAOIM=;
 b=TO+LW48QFXS3QD0O7Jjzyvt6UTzY0D0TmGGl5G4tEPIBixG7jvudXnWCmoz7KEq9rv
 Z7rmmBafNeUvqZ7FATVc/zgdJZ9L96pQRVNXGtn1vG928g2Q+A7vn0Gc7yLXBmrq9O0Q
 kevKlCITSWkdtSxzlM7SWBK9jLEyJA5PTCBoePJ18IVqLYPgUHS0cfxkU1pjHINpCXUi
 +Tisu8DP6PEi05Wo07i493iWZj4LgJvqFnHvzk2lQk6LBkmHbBs+jve6QShFwJooByWT
 rY+Qr0CVXKf5zJW4H0Me5+pal4Yp1gG2EO7VFWsVpCbttmOHbkBug/Km8RPn9S+8HL2M
 h38Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2EYfKgcqlxuOnooxrLdWILH0tv0pWGBlD29VNkEAOIM=;
 b=ZBcVk5xeBZOWLKOyoXNc0drpDUacWzWTCpLehjna/O0XcK+knWLSBZrxmPJXZn6GLN
 KexTW5lyYOMT7J7w9kp+QDNHONanjmSNN9/Mhw9uwRCrOx7xJCym0PYNuOjDZqLnPQOi
 zUKrhystdWP0sfymXkD8ujS7FXVKhxfiu2g1yjVtfYuIXKe1uKdp3Jz9wzrCxpv1rCw/
 RXMtkfhX+6jVYWTKZvPuLD2h6tR2SycorHqy7uB+87bZ00OX5Y7dFHbBMTmf1gDLpmy+
 z4KpMRvMLpVBq5H9YfwGUKHzXSJtJZKR3nMMK5IqfeFo0/eeHMuivs75Oa0wAzz7A3S6
 +vpw==
X-Gm-Message-State: AOAM530h5Dvy3O8AJ48NISgrGKMqkKuU9QNn84BZSE80l4Sb5I8rc6mP
 AjQ1VR2oMShB3cj6Pk3wtsfT2A==
X-Google-Smtp-Source: ABdhPJz9fpRR8XgvDFGPI0R0U1yvNeSnPezLq8uPbEoEewCOLKg0ONM5TWPK4tpx2F3blDf1floEMg==
X-Received: by 2002:aa7:9255:0:b0:505:a44b:275c with SMTP id
 21-20020aa79255000000b00505a44b275cmr22903451pfp.40.1650453933365; 
 Wed, 20 Apr 2022 04:25:33 -0700 (PDT)
Received: from localhost.localdomain ([122.167.88.101])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a17090a890c00b001b8efcf8e48sm22529274pjn.14.2022.04.20.04.25.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 04:25:32 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 7/7] RISC-V: KVM: Cleanup stale TLB entries when host CPU
 changes
Date: Wed, 20 Apr 2022 16:54:50 +0530
Message-Id: <20220420112450.155624-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220420112450.155624-1-apatel@ventanamicro.com>
References: <20220420112450.155624-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_042534_081313_1A77CAF4 
X-CRM114-Status: GOOD (  12.97  )
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

On RISC-V platforms with hardware VMID support, we share same
VMID for all VCPUs of a particular Guest/VM. This means we might
have stale G-stage TLB entries on the current Host CPU due to
some other VCPU of the same Guest which ran previously on the
current Host CPU.

To cleanup stale TLB entries, we simply flush all G-stage TLB
entries by VMID whenever underlying Host CPU changes for a VCPU.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_host.h |  5 +++++
 arch/riscv/kvm/tlb.c              | 23 +++++++++++++++++++++++
 arch/riscv/kvm/vcpu.c             | 11 +++++++++++
 3 files changed, 39 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index a40e88a9481c..94349a5ffd34 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -166,6 +166,9 @@ struct kvm_vcpu_arch {
 	/* VCPU ran at least once */
 	bool ran_atleast_once;
 
+	/* Last Host CPU on which Guest VCPU exited */
+	int last_exit_cpu;
+
 	/* ISA feature bits (similar to MISA) */
 	unsigned long isa;
 
@@ -256,6 +259,8 @@ void kvm_riscv_local_hfence_vvma_gva(unsigned long vmid,
 				     unsigned long order);
 void kvm_riscv_local_hfence_vvma_all(unsigned long vmid);
 
+void kvm_riscv_local_tlb_sanitize(struct kvm_vcpu *vcpu);
+
 void kvm_riscv_fence_i_process(struct kvm_vcpu *vcpu);
 void kvm_riscv_hfence_gvma_vmid_all_process(struct kvm_vcpu *vcpu);
 void kvm_riscv_hfence_vvma_all_process(struct kvm_vcpu *vcpu);
diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
index c0f86d09c41d..1a76d0b1907d 100644
--- a/arch/riscv/kvm/tlb.c
+++ b/arch/riscv/kvm/tlb.c
@@ -215,6 +215,29 @@ void kvm_riscv_local_hfence_vvma_all(unsigned long vmid)
 	csr_write(CSR_HGATP, hgatp);
 }
 
+void kvm_riscv_local_tlb_sanitize(struct kvm_vcpu *vcpu)
+{
+	unsigned long vmid;
+
+	if (!kvm_riscv_gstage_vmid_bits() ||
+	    vcpu->arch.last_exit_cpu == vcpu->cpu)
+		return;
+
+	/*
+	 * On RISC-V platforms with hardware VMID support, we share same
+	 * VMID for all VCPUs of a particular Guest/VM. This means we might
+	 * have stale G-stage TLB entries on the current Host CPU due to
+	 * some other VCPU of the same Guest which ran previously on the
+	 * current Host CPU.
+	 *
+	 * To cleanup stale TLB entries, we simply flush all G-stage TLB
+	 * entries by VMID whenever underlying Host CPU changes for a VCPU.
+	 */
+
+	vmid = READ_ONCE(vcpu->kvm->arch.vmid.vmid);
+	kvm_riscv_local_hfence_gvma_vmid_all(vmid);
+}
+
 void kvm_riscv_fence_i_process(struct kvm_vcpu *vcpu)
 {
 	local_flush_icache_all();
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 9cd8f6e91c98..a86710fcd2e0 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -67,6 +67,8 @@ static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu)
 	if (loaded)
 		kvm_arch_vcpu_put(vcpu);
 
+	vcpu->arch.last_exit_cpu = -1;
+
 	memcpy(csr, reset_csr, sizeof(*csr));
 
 	memcpy(cntx, reset_cntx, sizeof(*cntx));
@@ -735,6 +737,7 @@ static void noinstr kvm_riscv_vcpu_enter_exit(struct kvm_vcpu *vcpu)
 {
 	guest_state_enter_irqoff();
 	__kvm_riscv_switch_to(&vcpu->arch);
+	vcpu->arch.last_exit_cpu = vcpu->cpu;
 	guest_state_exit_irqoff();
 }
 
@@ -829,6 +832,14 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 			continue;
 		}
 
+		/*
+		 * Cleanup stale TLB enteries
+		 *
+		 * Note: This should be done after G-stage VMID has been
+		 * updated using kvm_riscv_gstage_vmid_ver_changed()
+		 */
+		kvm_riscv_local_tlb_sanitize(vcpu);
+
 		guest_timing_enter_irqoff();
 
 		kvm_riscv_vcpu_enter_exit(vcpu);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
