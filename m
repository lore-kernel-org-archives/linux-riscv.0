Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E171BCA0EDF
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Aug 2024 04:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ekiJC1h5IeEQDtS20Y9ZOWI1QDmzQfNQdaKFyf8cPs=; b=NnS6uqy/271Pd1
	KaUibRevY5WmN29TL+DHDrfIsbVWNs2rhHN30mxHD8+SutX0oPQo7+l3QZ8n9hF06dALtfiE8qIn2
	Y+miT8ew2w64q+d2SIOgu/SbpxlYRxfFBpffC5LvC7IYycm9r/IFw3cbPGQz2akLYPOjbXMCbaxvC
	qFuE6ecXCl39FunOyo9tOBCPwCgudy947luNw/SV/oI7nQ/xWRa47hXADO43rLR0baI45nibe+q0e
	cwGcocgvqk1nZGlCjgEoS85M4sxUrb3qli3JGz4RrzSJhXpSf0cOHe2rPqh3pnMKx3wQCqiE109ZO
	1IGKg4h6QbF66rvU52bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjtPf-00000004gfs-3PcU;
	Fri, 30 Aug 2024 04:39:07 +0000
Received: from mail-yb1-f202.google.com ([209.85.219.202])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjtMu-00000004fmr-0riX
	for linux-riscv@lists.infradead.org;
	Fri, 30 Aug 2024 04:36:17 +0000
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e11796af1d0so1983773276.3
        for <linux-riscv@lists.infradead.org>; Thu, 29 Aug 2024 21:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724992572; x=1725597372; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=4AvpSvtVzfUJU2EyYm3Go6nn4YoocTvqWptP53nqH8c=;
        b=xjTaZ81V+9CWTbtk4Q8gVOMKHw4VlxJH8TLI0QPNqsmiuGPWM0cwdZLSNZkhWZaOMs
         VrhPlsvgdkAsHSs7TgCVX2ue2FVZ7piHCLoMcfNr1pd2G0Ab3NDp8z10Wkka9ayCZQKG
         uLz3flLZojcDtBRaVp0ResMjtOG96M493TuMIjpU49k0d5wg4UhDiNrUk+W/eSGajkaQ
         Fd1G/3Pbu167mmfdLKL8SB1aiqqvWk3H/t6pnyDCKIKLtFaiXXVCk1ctbUi5EKs1Ve3F
         cBnNvYHKUOYHitd/HR9w6wb8Enj7OTf6akwyEMz5AuclUbsY0JQMg3P4zCSad30j2PdI
         aE5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724992572; x=1725597372;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4AvpSvtVzfUJU2EyYm3Go6nn4YoocTvqWptP53nqH8c=;
        b=M07sTW+6wSBeFIYzO1AVtAyb6zYuE73/J0CHxCsQTi/Nf+fyeWrwZp2qGOS1AjqbTS
         XRCq0iPX7XiGMNITebeXAVQbz8kxZk0KX3KtTpnuL6djSbVPJmBb8Goegoeelw+BOu35
         WxqKhP8Hk8ThOvyPEyezX7QBz82f6nURbgtrSoxn+jee1t4tglJGbQUa7U91UYO1081o
         p4U3pV4ZclKfl6CDHDwZGsj2wjT/uv742LLch2NgJUU07/OK8Pq0l4WNTJYsW3l6VETM
         0ykkzRXmnkN8IPuYxW/l3M7fy1K8jEETPalxj99f/9bsYQ6SfJAAlSW7n7ETpS8QzLdm
         Ce3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXZhwvgMTRQrYSuJtoNnT32zSt8o4zONVsoHoRBJC5e5CkjBvJA+OSM6mec7CFEamzpwCMxLp4j6RxflA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9P2Q/nEmou7bdQdETb1i4ekal9nTUAoGPvXBh7gGO0rXwrEhf
	s15GKabRHOTZAfPK2M1HLtqnKY/re9PvFK6FimJ00EDvMokKQd2qxhktWYEDlFP6cF42Rj+IzyG
	mPQ==
X-Google-Smtp-Source: AGHT+IEqi40cTWXbweDgNMrKLwg/O/OjOvSbekL8sfwlxBmHg+Y/0Rt/XOEiqVKMWjM4o4ZWNOIk2YltGh0=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a5b:18d:0:b0:e11:6fcc:b656 with SMTP id
 3f1490d57ef6-e1a7a197ademr2073276.6.1724992572547; Thu, 29 Aug 2024 21:36:12
 -0700 (PDT)
Date: Thu, 29 Aug 2024 21:35:54 -0700
In-Reply-To: <20240830043600.127750-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240830043600.127750-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
Message-ID: <20240830043600.127750-5-seanjc@google.com>
Subject: [PATCH v4 04/10] KVM: Rename arch hooks related to per-CPU
 virtualization enabling
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Chao Gao <chao.gao@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Farrah Chen <farrah.chen@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240829_213616_267798_4F912ADB 
X-CRM114-Status: GOOD (  14.51  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Rename the per-CPU hooks used to enable virtualization in hardware to
align with the KVM-wide helpers in kvm_main.c, and to better capture that
the callbacks are invoked on every online CPU.

No functional change intended.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/arm.c      | 6 +++---
 arch/loongarch/kvm/main.c | 4 ++--
 arch/mips/kvm/mips.c      | 4 ++--
 arch/riscv/kvm/main.c     | 4 ++--
 arch/x86/kvm/x86.c        | 6 +++---
 include/linux/kvm_host.h  | 4 ++--
 virt/kvm/kvm_main.c       | 4 ++--
 7 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 9bef7638342e..9c8f5390ec63 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2163,7 +2163,7 @@ static void cpu_hyp_uninit(void *discard)
 	}
 }
 
-int kvm_arch_hardware_enable(void)
+int kvm_arch_enable_virtualization_cpu(void)
 {
 	/*
 	 * Most calls to this function are made with migration
@@ -2183,7 +2183,7 @@ int kvm_arch_hardware_enable(void)
 	return 0;
 }
 
-void kvm_arch_hardware_disable(void)
+void kvm_arch_disable_virtualization_cpu(void)
 {
 	kvm_timer_cpu_down();
 	kvm_vgic_cpu_down();
@@ -2379,7 +2379,7 @@ static int __init do_pkvm_init(u32 hyp_va_bits)
 
 	/*
 	 * The stub hypercalls are now disabled, so set our local flag to
-	 * prevent a later re-init attempt in kvm_arch_hardware_enable().
+	 * prevent a later re-init attempt in kvm_arch_enable_virtualization_cpu().
 	 */
 	__this_cpu_write(kvm_hyp_initialized, 1);
 	preempt_enable();
diff --git a/arch/loongarch/kvm/main.c b/arch/loongarch/kvm/main.c
index 844736b99d38..27e9b94c0a0b 100644
--- a/arch/loongarch/kvm/main.c
+++ b/arch/loongarch/kvm/main.c
@@ -261,7 +261,7 @@ long kvm_arch_dev_ioctl(struct file *filp,
 	return -ENOIOCTLCMD;
 }
 
-int kvm_arch_hardware_enable(void)
+int kvm_arch_enable_virtualization_cpu(void)
 {
 	unsigned long env, gcfg = 0;
 
@@ -300,7 +300,7 @@ int kvm_arch_hardware_enable(void)
 	return 0;
 }
 
-void kvm_arch_hardware_disable(void)
+void kvm_arch_disable_virtualization_cpu(void)
 {
 	write_csr_gcfg(0);
 	write_csr_gstat(0);
diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index b5de770b092e..52e1f275351e 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -125,12 +125,12 @@ int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
 	return 1;
 }
 
-int kvm_arch_hardware_enable(void)
+int kvm_arch_enable_virtualization_cpu(void)
 {
 	return kvm_mips_callbacks->hardware_enable();
 }
 
-void kvm_arch_hardware_disable(void)
+void kvm_arch_disable_virtualization_cpu(void)
 {
 	kvm_mips_callbacks->hardware_disable();
 }
diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index bab2ec34cd87..f3427f6de608 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -20,7 +20,7 @@ long kvm_arch_dev_ioctl(struct file *filp,
 	return -EINVAL;
 }
 
-int kvm_arch_hardware_enable(void)
+int kvm_arch_enable_virtualization_cpu(void)
 {
 	csr_write(CSR_HEDELEG, KVM_HEDELEG_DEFAULT);
 	csr_write(CSR_HIDELEG, KVM_HIDELEG_DEFAULT);
@@ -35,7 +35,7 @@ int kvm_arch_hardware_enable(void)
 	return 0;
 }
 
-void kvm_arch_hardware_disable(void)
+void kvm_arch_disable_virtualization_cpu(void)
 {
 	kvm_riscv_aia_disable();
 
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 70219e406987..1182baf0d487 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -355,7 +355,7 @@ static void kvm_on_user_return(struct user_return_notifier *urn)
 
 	/*
 	 * Disabling irqs at this point since the following code could be
-	 * interrupted and executed through kvm_arch_hardware_disable()
+	 * interrupted and executed through kvm_arch_disable_virtualization_cpu()
 	 */
 	local_irq_save(flags);
 	if (msrs->registered) {
@@ -12512,7 +12512,7 @@ void kvm_vcpu_deliver_sipi_vector(struct kvm_vcpu *vcpu, u8 vector)
 }
 EXPORT_SYMBOL_GPL(kvm_vcpu_deliver_sipi_vector);
 
-int kvm_arch_hardware_enable(void)
+int kvm_arch_enable_virtualization_cpu(void)
 {
 	struct kvm *kvm;
 	struct kvm_vcpu *vcpu;
@@ -12608,7 +12608,7 @@ int kvm_arch_hardware_enable(void)
 	return 0;
 }
 
-void kvm_arch_hardware_disable(void)
+void kvm_arch_disable_virtualization_cpu(void)
 {
 	kvm_x86_call(hardware_disable)();
 	drop_user_return_notifiers();
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 79a6b1a63027..63e46a5f3812 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1514,8 +1514,8 @@ static inline void kvm_create_vcpu_debugfs(struct kvm_vcpu *vcpu) {}
 #endif
 
 #ifdef CONFIG_KVM_GENERIC_HARDWARE_ENABLING
-int kvm_arch_hardware_enable(void);
-void kvm_arch_hardware_disable(void);
+int kvm_arch_enable_virtualization_cpu(void);
+void kvm_arch_disable_virtualization_cpu(void);
 #endif
 int kvm_arch_vcpu_runnable(struct kvm_vcpu *vcpu);
 bool kvm_arch_vcpu_in_kernel(struct kvm_vcpu *vcpu);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index fbdd2e46e65b..b000f221abfb 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5584,7 +5584,7 @@ static int kvm_enable_virtualization_cpu(void)
 	if (__this_cpu_read(virtualization_enabled))
 		return 0;
 
-	if (kvm_arch_hardware_enable()) {
+	if (kvm_arch_enable_virtualization_cpu()) {
 		pr_info("kvm: enabling virtualization on CPU%d failed\n",
 			raw_smp_processor_id());
 		return -EIO;
@@ -5609,7 +5609,7 @@ static void kvm_disable_virtualization_cpu(void *ign)
 	if (!__this_cpu_read(virtualization_enabled))
 		return;
 
-	kvm_arch_hardware_disable();
+	kvm_arch_disable_virtualization_cpu();
 
 	__this_cpu_write(virtualization_enabled, false);
 }
-- 
2.46.0.469.g59c65b2a67-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
