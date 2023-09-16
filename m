Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9058FCD37B0
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Sep 2023 00:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WQ/5Mx9TirlHrtBBTX/SMQXiqn8u+tVdXiv6YlsF9V0=; b=NbGgHEr7gDXajY
	rBfe2Ikpxw6BazrFgQbvywVbepc4YYaS9dsXIZ7PnQ//wfNxkJ2PeoMxE4zIwQ853b+WlCMCu2HZJ
	MhfBuks/5nXGzkfCom2DSfevii9uiyRpTjehGYoKfHBEINrgqZSMdrjxzvgdoJN5DmT7Da6xgnw9/
	YbWkoY0rTga9lFwcz2v9OcBQp9u72g1PHkTmWxLtu28PKk0OdkCBpBzaqsMX6ZPshqDBGd3c33lMo
	9G2mMqVDhEQlIXQlMZp/S95SxI/Bfp0ld+zaVMckv4fQs4iMEZJ9S+7BPrKB57R6YxcJqybml07PH
	fXoNxKcV9GdxizgrFULQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhJGo-00BfVn-0H;
	Sat, 16 Sep 2023 00:34:46 +0000
Received: from mail-yb1-f202.google.com ([209.85.219.202])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhJEI-00Bd7u-0x
	for linux-riscv@lists.infradead.org;
	Sat, 16 Sep 2023 00:32:16 +0000
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-d7b957fd276so3276376276.0
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 17:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694824327; x=1695429127; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=g87cF9aMFFIIQhALNgZyjDSNT/0Iy7aXKR5wCizfY2Q=;
        b=bu6bG/xQph3dS3elJuDNyCsbzE6caFlxcfxcIM7kc2JdNNaSZTTQs+tkGmg+X5EQfp
         pUCaqUXuBdBs8fahr4y083gpCosmKHHwPvNr6qKYNg71jeBoAaQN9s4QmYL1xN7QhxTd
         6K6wCJIwwo+bAWZue8LJ0edmElc25OlDtsP6/eU9YiMhV1+sanfyMe1hyZ0CgCb5Vpj7
         qosvRFElG5X/8ynEC9vFiSbicYVsyvDyUOsVv/+StWQwz7O6R+5jxR6qEgbVhivEcn8v
         azU83ioFydLOUW0jPAcfjf14yiEzyD31ev71Fw5zSODvo58C6ESiqJo+3HFBbms44Cae
         m+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694824327; x=1695429127;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g87cF9aMFFIIQhALNgZyjDSNT/0Iy7aXKR5wCizfY2Q=;
        b=EE/JkQeCIwzyArfNEkcyc8l1/OKD55/xd0eilS+l4U2zdFWprIJ+wuM6o1f3XrEQ69
         3eQOxIzZ4f2Qq1mxBzD5ONNfx2hO++2FsZqXDpwEd1O1RSuMmMqMGzOCwAehtYMTzOyI
         Kwbi0/CZIO3sq8K3o9b98K7pBu/H2jZJQ7iws5iyyqntN2hwpDfWzv+LtulDkXKSwPym
         ngO12J7joNV6AAzggWezJuZm05tpCszqQ2R53lvwvYsZVpTDB9guWoYbaVkeg6ntNQtS
         fNJ4IpSHx1Zk2j36rOTL3ETPm7KQLbijPSu2GzOxNl+6Fnk6ejBPIElVxAuyMZNYUVez
         Qzkg==
X-Gm-Message-State: AOJu0YxBTgNZFYUGx59UAOISHsPA06M4FuyuJflqfR0owzYmN8GFYP6t
	XCR5eBuL2jPuAe0FA+lnnfkR+RaaQIc=
X-Google-Smtp-Source: AGHT+IFjtTFMkJb5nyS/TbDu5WGvlim/mDgHE3y34bDt9PwwLEa+gj6fWVowFGkCoq7czWyFJVVkIfy0aAQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:d28b:0:b0:d0c:c83b:94ed with SMTP id
 j133-20020a25d28b000000b00d0cc83b94edmr70330ybg.10.1694824326852; Fri, 15 Sep
 2023 17:32:06 -0700 (PDT)
Date: Fri, 15 Sep 2023 17:31:15 -0700
In-Reply-To: <20230916003118.2540661-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230916003118.2540661-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Message-ID: <20230916003118.2540661-24-seanjc@google.com>
Subject: [PATCH 23/26] KVM: arm64: Move and consolidate "public" functions in asm/kvm_host.h
From: Sean Christopherson <seanjc@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Tony Krowiak <akrowiak@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, 
	Jason Herne <jjherne@linux.ibm.com>, Harald Freudenberger <freude@linux.ibm.com>, 
	Alex Williamson <alex.williamson@redhat.com>, Andy Lutomirski <luto@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Anish Ghulati <aghulati@google.com>, Venkatesh Srinivas <venkateshs@chromium.org>, 
	Andrew Thornton <andrewth@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_173210_378361_8821657B 
X-CRM114-Status: GOOD (  11.51  )
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

Move a variety of "public" symbols in arm64's kvm_host.h, i.e. symbols and
functions that are used by non-KVM code, towards the top of the header.
This will allow hiding the "private" code in kvm_host.h, i.e. the stuff
that is intended to be KVM-internal, with a minimal amount of #ifdeffery.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/include/asm/kvm_host.h | 48 ++++++++++++++-----------------
 1 file changed, 22 insertions(+), 26 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 90cfbf420545..89b40c34f0af 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -67,10 +67,32 @@ enum kvm_mode {
 };
 #ifdef CONFIG_KVM
 enum kvm_mode kvm_get_mode(void);
+
+extern phys_addr_t hyp_mem_base;
+extern phys_addr_t hyp_mem_size;
+void __init kvm_hyp_reserve(void);
+
+void kvm_set_pmu_events(u32 set, struct perf_event_attr *attr);
+void kvm_clr_pmu_events(u32 clr);
+bool kvm_set_pmuserenr(u64 val);
 #else
 static inline enum kvm_mode kvm_get_mode(void) { return KVM_MODE_NONE; };
+
+static inline void kvm_hyp_reserve(void) { }
+
+static inline void kvm_set_pmu_events(u32 set, struct perf_event_attr *attr) {}
+static inline void kvm_clr_pmu_events(u32 clr) {}
+static inline bool kvm_set_pmuserenr(u64 val)
+{
+	return false;
+}
 #endif
 
+static inline bool kvm_pmu_counter_deferred(struct perf_event_attr *attr)
+{
+	return (!has_vhe() && attr->exclude_host);
+}
+
 DECLARE_STATIC_KEY_FALSE(userspace_irqchip_in_use);
 
 extern unsigned int __ro_after_init kvm_sve_max_vl;
@@ -1086,28 +1108,10 @@ void kvm_arch_vcpu_ctxsync_fp(struct kvm_vcpu *vcpu);
 void kvm_arch_vcpu_put_fp(struct kvm_vcpu *vcpu);
 void kvm_vcpu_unshare_task_fp(struct kvm_vcpu *vcpu);
 
-static inline bool kvm_pmu_counter_deferred(struct perf_event_attr *attr)
-{
-	return (!has_vhe() && attr->exclude_host);
-}
-
 /* Flags for host debug state */
 void kvm_arch_vcpu_load_debug_state_flags(struct kvm_vcpu *vcpu);
 void kvm_arch_vcpu_put_debug_state_flags(struct kvm_vcpu *vcpu);
 
-#ifdef CONFIG_KVM
-void kvm_set_pmu_events(u32 set, struct perf_event_attr *attr);
-void kvm_clr_pmu_events(u32 clr);
-bool kvm_set_pmuserenr(u64 val);
-#else
-static inline void kvm_set_pmu_events(u32 set, struct perf_event_attr *attr) {}
-static inline void kvm_clr_pmu_events(u32 clr) {}
-static inline bool kvm_set_pmuserenr(u64 val)
-{
-	return false;
-}
-#endif
-
 void kvm_vcpu_load_sysregs_vhe(struct kvm_vcpu *vcpu);
 void kvm_vcpu_put_sysregs_vhe(struct kvm_vcpu *vcpu);
 
@@ -1142,14 +1146,6 @@ bool kvm_arm_vcpu_is_finalized(struct kvm_vcpu *vcpu);
 	(test_bit(KVM_ARCH_FLAG_HAS_RAN_ONCE, &(kvm)->arch.flags))
 
 int kvm_trng_call(struct kvm_vcpu *vcpu);
-#ifdef CONFIG_KVM
-extern phys_addr_t hyp_mem_base;
-extern phys_addr_t hyp_mem_size;
-void __init kvm_hyp_reserve(void);
-#else
-static inline void kvm_hyp_reserve(void) { }
-#endif
-
 void kvm_arm_vcpu_power_off(struct kvm_vcpu *vcpu);
 bool kvm_arm_vcpu_stopped(struct kvm_vcpu *vcpu);
 
-- 
2.42.0.459.ge4e396fd5e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
