Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 872F8CA0EE4
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Aug 2024 05:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yqKvy61G5QHdK1OJ2E1RaaLaqfnQduifQ9CScCplUfg=; b=GmGcxvvMFSMxpn
	5uIZQgYlPbjv3KLSke2VXVQygUawRf1MrxiB5j+1Y9XOpPjzhrTaJ9GlMovKXTCPqL0W2bHkSKW5a
	pJhYQR8jZoxIU/rON/FhwOaIjzTqoTMJdgFFFyfijbUuACx+PFuCMsr/NYF7XphgqxAIoE4NkjFs7
	xC6u2nms7cmtChUf3xy2HP0C1vsK4JgOqQxFJ7WuprW3aBo/x5cb5uWM82fJ3cIIJcUdJlU5xmxqq
	Bz24F9wyb4kOgp17TdSp/bqeVUm6JPNgWoagSIQa/GzCLa7TkovnGgabeQO6Oruk9twkZJeFjJjvc
	xAmAKX1KHAyV0rIu+wGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjuSX-00000004qdr-0UaO;
	Fri, 30 Aug 2024 05:46:09 +0000
Received: from mail-yw1-f202.google.com ([209.85.128.202])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjtMu-00000004foV-2eez
	for linux-riscv@lists.infradead.org;
	Fri, 30 Aug 2024 04:36:17 +0000
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6b0f068833bso37014497b3.0
        for <linux-riscv@lists.infradead.org>; Thu, 29 Aug 2024 21:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724992574; x=1725597374; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=udiDa1YXNVQe9YQdq8pNqA0v4AMGb+sHHwac6qQVu4U=;
        b=LG0k+UnkpaWm0HiPRveyQirdctz9QyRerwH3QNgroVinFBw56oviB5Rjk5H2HRuBk5
         rhhWtBaL+hErpinjf268P7GB/3TNQaLC66SkBJasWQ9z5mKKrbM5r9dG1UuZ+Pzy1jC2
         QwqST5KwKons9nxLLn87jzVgUmpadNko6Q8TuVV/Fy/qJP+PNAXNE1/4JZY8f/WXx936
         X264Bxp1rfOKOcDqLJcJ9YSsnX0ROESoZjkU/QGe6PUIv2v8j5MabwMY5BudWvc3A7H0
         bAlWp9zvrTYYoZpAHLT7dlht9nlir1Hw4AL+pmR/0lOjv4gqoLg7AqSo7qPRkmFhKUD2
         kr+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724992574; x=1725597374;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=udiDa1YXNVQe9YQdq8pNqA0v4AMGb+sHHwac6qQVu4U=;
        b=OoCCV6E58K1FumfAyR8ak1cp6IB4iLMEFLg+3d9atyjRRpz/HczqXCkfdInR1uXHoc
         2YTapAgIZEKyMox9FaYUfID4sUetku0IU49nqR7Qxqiewc900RJ+aOs+73d8uyQTRPPX
         2Wy9rvUkLPOUHCbzzVAg2IcBFO//Dsd0mcz51q+daQ1SrKy1dsXSXaZcBKbh+ArG/h3e
         ZwddvieAYAglo8M7D7sUdgv6/5G5Fhoowjg56slRPs2cfdCHFhQ/gHBOLJG4TFv+s1Zg
         SqXq9GKLMAFahFl28AAh6VtMSWI/bbfzcxPk/UwSnocAb8BIuDNEZOi26IPzXe6qXicV
         XOaQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2O7JRRNrzg8YoHvVmdyE02NGHOq0zROvFQYci6QJ++dntiqFQodQgxIk0DUVQh4fnkmOIHeGj0YZBiQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyD6tHSf7rB/WtJ1eZhFSgM2PfhVs2g8i82msGSgJspJQqGOfM0
	Muz4JCnwpGDn+bfAtsEZGv+5e9wbm17b+DooIo9Rj0fXCBI2rA2qOdcRE+hEFqMujzjUytCq2SX
	T5A==
X-Google-Smtp-Source: AGHT+IF7AfgBrJe8PwdncYuFwENH9bcWVSUBeh2Gmsa0ZJKxp7DrJ4HVnhtseSn5Ja9qHK89gyQHI56lkSI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:6681:b0:665:24b0:e936 with SMTP id
 00721157ae682-6d286f64db5mr2502337b3.4.1724992574565; Thu, 29 Aug 2024
 21:36:14 -0700 (PDT)
Date: Thu, 29 Aug 2024 21:35:55 -0700
In-Reply-To: <20240830043600.127750-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240830043600.127750-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
Message-ID: <20240830043600.127750-6-seanjc@google.com>
Subject: [PATCH v4 05/10] KVM: MIPS: Rename virtualization {en,dis}abling APIs
 to match common KVM
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
X-CRM114-CacheID: sfid-20240829_213616_698200_7B877BE7 
X-CRM114-Status: GOOD (  12.26  )
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

Rename MIPS's trampoline hooks for virtualization enabling to match the
recently renamed arch hooks.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/mips/include/asm/kvm_host.h | 4 ++--
 arch/mips/kvm/mips.c             | 4 ++--
 arch/mips/kvm/vz.c               | 8 ++++----
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
index 6743a57c1ab4..f7222eb594ea 100644
--- a/arch/mips/include/asm/kvm_host.h
+++ b/arch/mips/include/asm/kvm_host.h
@@ -728,8 +728,8 @@ struct kvm_mips_callbacks {
 	int (*handle_fpe)(struct kvm_vcpu *vcpu);
 	int (*handle_msa_disabled)(struct kvm_vcpu *vcpu);
 	int (*handle_guest_exit)(struct kvm_vcpu *vcpu);
-	int (*hardware_enable)(void);
-	void (*hardware_disable)(void);
+	int (*enable_virtualization_cpu)(void);
+	void (*disable_virtualization_cpu)(void);
 	int (*check_extension)(struct kvm *kvm, long ext);
 	int (*vcpu_init)(struct kvm_vcpu *vcpu);
 	void (*vcpu_uninit)(struct kvm_vcpu *vcpu);
diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index 52e1f275351e..60b43ea85c12 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -127,12 +127,12 @@ int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
 
 int kvm_arch_enable_virtualization_cpu(void)
 {
-	return kvm_mips_callbacks->hardware_enable();
+	return kvm_mips_callbacks->enable_virtualization_cpu();
 }
 
 void kvm_arch_disable_virtualization_cpu(void)
 {
-	kvm_mips_callbacks->hardware_disable();
+	kvm_mips_callbacks->disable_virtualization_cpu();
 }
 
 int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
diff --git a/arch/mips/kvm/vz.c b/arch/mips/kvm/vz.c
index 99d5a71e4300..ccab4d76b126 100644
--- a/arch/mips/kvm/vz.c
+++ b/arch/mips/kvm/vz.c
@@ -2869,7 +2869,7 @@ static unsigned int kvm_vz_resize_guest_vtlb(unsigned int size)
 	return ret + 1;
 }
 
-static int kvm_vz_hardware_enable(void)
+static int kvm_vz_enable_virtualization_cpu(void)
 {
 	unsigned int mmu_size, guest_mmu_size, ftlb_size;
 	u64 guest_cvmctl, cvmvmconfig;
@@ -2983,7 +2983,7 @@ static int kvm_vz_hardware_enable(void)
 	return 0;
 }
 
-static void kvm_vz_hardware_disable(void)
+static void kvm_vz_disable_virtualization_cpu(void)
 {
 	u64 cvmvmconfig;
 	unsigned int mmu_size;
@@ -3280,8 +3280,8 @@ static struct kvm_mips_callbacks kvm_vz_callbacks = {
 	.handle_msa_disabled = kvm_trap_vz_handle_msa_disabled,
 	.handle_guest_exit = kvm_trap_vz_handle_guest_exit,
 
-	.hardware_enable = kvm_vz_hardware_enable,
-	.hardware_disable = kvm_vz_hardware_disable,
+	.enable_virtualization_cpu = kvm_vz_enable_virtualization_cpu,
+	.disable_virtualization_cpu = kvm_vz_disable_virtualization_cpu,
 	.check_extension = kvm_vz_check_extension,
 	.vcpu_init = kvm_vz_vcpu_init,
 	.vcpu_uninit = kvm_vz_vcpu_uninit,
-- 
2.46.0.469.g59c65b2a67-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
