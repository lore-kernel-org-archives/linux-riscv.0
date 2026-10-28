Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35C4606A331
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 19:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SS7rXXP2;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KTaXjGjA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=T4bONViuqO5l1hpRrCgCpUer9jye4EQ2k0hmKDGQ0HI=; b=SS7rXXP2Uj+M+ti3wGsJLQsJwn
	bICesw1mUqFPC8VuKCnrimmX6vt9zLwtH2c9CJ+q9vA5kLeWVTEQ0LLacQ2wNtcVC6v42sB3FaB4A
	49nQdKuVgucFwjzNu6pDOGh3v48uDwW3uE2c5VsVui6ZqaPqUpFCNlQs9WRLxme977vt7i+cyy6la
	upDLJPci0Kl8CjFby2MRsbYvlK9NeEaTFt6ngaYliWe0VA1HjMdBFb+XAKiqNPQQdbEK5ab+VgEfJ
	CyOb0n5F6wbLEd/8aFP7wJbG3j5o0I53vUhRp6PwOPjcLmN2k5Stz0A3LjOEL83EuoZZpfYjG3emX
	NWCD5gEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM8vt-00000007o4N-17GZ;
	Wed, 28 Oct 2026 19:03:33 +0000
Received: from mail-pf1-x446.google.com ([2607:f8b0:4864:20::446])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM8vW-00000007nXq-2BRv
	for linux-riscv@lists.infradead.org;
	Wed, 28 Oct 2026 19:03:11 +0000
Received: by mail-pf1-x446.google.com with SMTP id d2e1a72fcca58-8a0688a43d3so1037394b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 28 Oct 2026 12:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793214189; x=1793818989; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KIzhXXz4HgfGAdkUpoWB/z0OMxuU8qDaDSAd1VOEpew=;
        b=KTaXjGjAZ1Q3AcVJd3PZtKz1imGJTDQ43wkUW/scpQWOwUQszBXEb8zrjvMFhgQIQ6
         n5oK6FtIRSf/3T23Ry1Taht8IqrQF3w8ubSBAc/ZruK/fWK6IdeBPBk6/ikPgkcta1QM
         ty9dFXPrMFVVaSPvLKabGyePU+BhhlYb1m6krJZ0QX1WOv8fF9y6yYUbfW97G1HmacF0
         JcDUvaTPiuNeOXZb893ILOdkT11dakhykpiBsNKHBmAoVdhOqfC5/pmMerfAGAkg3yqH
         WwlwhZgPiBIPgZHmn9tkyOe909DnYda9W84DNjgovKSRQTH6cNERRCESCBGTtPZygMaz
         Sy9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793214189; x=1793818989;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KIzhXXz4HgfGAdkUpoWB/z0OMxuU8qDaDSAd1VOEpew=;
        b=XiQGa0TpNZP8I51ZDeBSZwyJYeDHAtEDJkYeaTDFlER/4JBq/jc9rJ/9KeKnK42med
         18/fMfsi/85IOuiH78UdOhZA+/+yujNqf7zG7CKil7b58dA2+Ovibxx58cas8eYbgszO
         9IvVbWH2AUWKMkH/tg55Hy/etfVm18CUdiOswwVVejCTs98oawqSi104eVlagXY6Q0pb
         7l7tcVlBk94L1ZezUgskpBy/UqewjZ1PG8II1105vTgPnaGg3dHBIIrr3aXYf35xtPmI
         sZzKVkjYQs9Oj1FN5YvV531/OJ3G+Iy3f485d0PaNJsfi7Vaqwru4otW1Uu0R7A8hE7r
         464A==
X-Forwarded-Encrypted: i=1; AKwUvBzo2CbdHc6oStoDm9ZoqUUejT9rWDuWRewnIDIsGZEH7dHUyRT/BW6RzreXOwS8bHxiGZxMCBtbuqRrlg==@lists.infradead.org
X-Gm-Message-State: AFq9FYIJOyfsUTNwMW56+afcRkkqe+jDsyHpWyb1ASz0Hwdm0O5UfMoI
	DaPOqio47tmqgnWE+i3yj7KhM2Bb/L1VR2Rhk52lqjWkvagvFLLfuyX2fXQPhx9F0QFSUEKLNFg
	6mroxQw==
X-Received: from pghw14.prod.google.com ([2002:a63:f50e:0:b0:cda:c74c:ca8])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4b86:b0:3ac:a11a:7c84
 with SMTP id 98e67ed59e1d1-3ae58195de0mr2519930a91.65.1793214189231; Wed, 28
 Oct 2026 12:03:09 -0700 (PDT)
Date: Wed, 28 Oct 2026 12:02:58 -0700
In-Reply-To: <20261028190259.1819571-1-seanjc@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261028190259.1819571-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261028190259.1819571-7-seanjc@google.com>
Subject: [PATCH 6/7] KVM: Plumb the full request into __kvm_vcpu_kick()
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_120310_567887_6B660DD0 
X-CRM114-Status: GOOD (  14.08  )
X-Spam-Score: -9.5 (---------)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Plumb the full request instead of just a "wait" boolean into
__kvm_vcpu_kick() so that it can use kvm_request_needs_ipi() instead of
the flawed kvm_vcpu_should_kick().

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/include/asm/kvm_ppc.h |  2 +-
 include/linux/kvm_host.h           |  6 +++---
 virt/kvm/kvm_main.c                | 17 +++++++++--------
 3 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index bbe7378ad0ef..011dc422af78 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -38,7 +38,7 @@
  */
 static inline void kvmppc_vcpu_kick(struct kvm_vcpu *vcpu)
 {
-	__kvm_vcpu_kick(vcpu, false, true);
+	__kvm_vcpu_kick(vcpu, 0, true);
 }
 
 /*
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 9db42f58c561..035b1bdd8c09 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1570,11 +1570,11 @@ void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu);
 bool kvm_vcpu_wake_up(struct kvm_vcpu *vcpu);
 
 #ifndef CONFIG_S390
-void __kvm_vcpu_kick(struct kvm_vcpu *vcpu, bool wait, bool force);
+void __kvm_vcpu_kick(struct kvm_vcpu *vcpu, int request, bool force);
 
 static inline void kvm_vcpu_kick(struct kvm_vcpu *vcpu)
 {
-	__kvm_vcpu_kick(vcpu, false, false);
+	__kvm_vcpu_kick(vcpu, 0, false);
 }
 #endif
 
@@ -2314,7 +2314,7 @@ static __always_inline void kvm_make_request(int req, struct kvm_vcpu *vcpu)
 static inline void kvm_make_request_and_kick(int req, struct kvm_vcpu *vcpu)
 {
 	kvm_make_request(req, vcpu);
-	__kvm_vcpu_kick(vcpu, req & KVM_REQUEST_WAIT, false);
+	__kvm_vcpu_kick(vcpu, req, false);
 }
 #endif
 
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index e1a9da8b43d7..f1792256576b 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3913,7 +3913,7 @@ EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_vcpu_wake_up);
 /*
  * Kick a sleeping VCPU, or a guest VCPU in guest mode, into host kernel mode.
  */
-void __kvm_vcpu_kick(struct kvm_vcpu *vcpu, bool wait, bool force)
+void __kvm_vcpu_kick(struct kvm_vcpu *vcpu, int req, bool force)
 {
 	int me, cpu;
 
@@ -3948,14 +3948,15 @@ void __kvm_vcpu_kick(struct kvm_vcpu *vcpu, bool wait, bool force)
 		cpu = READ_ONCE(vcpu->cpu);
 		if (cpu != me && (unsigned int)cpu < nr_cpu_ids && cpu_online(cpu)) {
 			/*
-			 * Use a reschedule IPI to kick the vCPU if the caller
-			 * doesn't need to wait for a response, as KVM allows
-			 * kicking vCPUs while IRQs are disabled, but using the
-			 * SMP function call framework with IRQs disabled can
-			 * deadlock due to taking cross-CPU locks.
+			 * Use a reschedule IPI to kick the vCPU if the request
+			 * doesn't need to wait for a response (or there is no
+			 * request), as KVM allows kicking vCPUs while IRQs are
+			 * disabled, but using the SMP function call framework
+			 * with IRQs disabled can deadlock due to taking cross-
+			 * CPU locks.
 			 */
-			if (wait)
-				smp_call_function_single(cpu, ack_kick, NULL, wait);
+			if (req & KVM_REQUEST_WAIT)
+				smp_call_function_single(cpu, ack_kick, NULL, true);
 			else
 				smp_send_reschedule(cpu);
 		}
-- 
2.56.0.313.g2479322e68-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
