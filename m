Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E67A7C25B4F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 18:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=tG2OC8Aqaz9hdpYuLHuoI5pXTYXNiznHQNI7DF4uXfY=; b=vh/EWCXYkwvW9fkwizG5akNkID
	FPsml6BdzB2S6U9qj1tjZH/dWREOgQU/DALFfzIrvORMFXztdIM2WpFmKZqQFlE7FrYhfgVezNCg+
	rCMeopG4I92WvYDyP/GG5NeGifdQykK9RSoNDGwK5AiAp8QPB0lgFRHJLSS6zQRT/Rn0bbKDdbeZC
	hwujNUw3tMYrEOf7KcTJS5B8Or6ue99R7AU7mJQKa/G9mT8wpu0JTGyesTGGwffYxqBjGkqrAsap2
	SWmssrvbttmU3rEHWAu0jMK9/mfEL8jXT2V/y2tDH+BAtVX+rLf67Z/KRsUo5Ioqn3fLAievSlhU6
	0PeuI46g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2xTh-0000000HWAL-1hi1;
	Fri, 03 May 2024 18:17:49 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2xTa-0000000HW3z-14Gz
	for linux-riscv@lists.infradead.org;
	Fri, 03 May 2024 18:17:44 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-61be23bb01aso110294107b3.2
        for <linux-riscv@lists.infradead.org>; Fri, 03 May 2024 11:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714760260; x=1715365060; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gxJS1crzpielwDie8rL3hx1PCStQKnU+yTalK3ZSiI0=;
        b=NpehHdxbOkIV/dMCcoUrul1Ygq63zwwTKXO1+d4M/m4o9PI6eXKGFL/nUOwuMxh75p
         WtpU0LMLIrog4fny4SOG2KMKKB1qGHvvGchS2T8U8iLHo1jAjIfKgfwN/CjuWY534WKC
         zIiD5dFs4fSyBHuKwwOawSXFP74rbi99KNWb5E1RGIvjYXAkaYeuEr8FfkGld/A2AReB
         AxjM9L3Zphj1BazwzbSn8hZtURnPjqXwV6eaCelC0OQGZ9Qiax1SQEOwSBbA7AE4Cy32
         zYMDIlfg/83AGxkJgXDKeX4p/aiesyt59Vq/BEswN9iTgkGsDsPtl74ahrTsP9NDPkCF
         xEEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714760260; x=1715365060;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gxJS1crzpielwDie8rL3hx1PCStQKnU+yTalK3ZSiI0=;
        b=BNnYTNqQbSgwVPIJvL/9d6Did1lFH6i3ArNgEnnEzAlzljStheo+0Cci3N8qKx1cdH
         89JJ5UI8zc8b9Y4lABJTGfa4jK1xt1IEJFYqCO5irSnUZyUVjtuZ4zesomHgTfwjmTW9
         GM9mMVBppOnw/0x8bmsHxt7XpeOEnzmvQrjEG0Zar/AKU72Q7kzu3s//i4vilzuwZjAd
         6xDIQmPc47VMU5jhBo105VRFGZjsofn2guM8v06C7A4+t4rUX8mjd2ZTJTJoXMD78B4y
         W7IfLpH9MBS4SdvhEnQ7uOaDtbkqqqYuWLi9B8BGKuUxhUB3XlCII+foGN8JmLgGGvos
         xL3w==
X-Forwarded-Encrypted: i=1; AJvYcCV4E8n98vj0a0tF6NYTJP7g9v0cRe+IRHLyCfPJ5CLxsor8WHhbZ70p1e1eIMFT2qSgJRKogE0OUPHZtsBvo4MR1Vr/6bOSmDaK0VUzyy7e
X-Gm-Message-State: AOJu0YybSNX5D4dXNArJwdo1bMsKcLPHbHX0jCT34L7QZBzQ1wzOW2EE
	Maqe3RAmD6Ui2zMNmCUdfQ+FGiVPDXe+AM3XWlb38Rvr0ONExFZKvfeo2nZb85Dm50tRkMx9Dug
	5VWWYNOzxkQ==
X-Google-Smtp-Source: AGHT+IFV8XW0q6Vc+/y+/ULmmUgE0pK+amRiYPmJG0lNXqT19q15J8nIrLHDkebqo9zBkflGqNFe7OG5YJeiaQ==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a05:6902:1023:b0:dd9:1db5:8348 with SMTP
 id x3-20020a056902102300b00dd91db58348mr1087385ybt.8.1714760260354; Fri, 03
 May 2024 11:17:40 -0700 (PDT)
Date: Fri,  3 May 2024 11:17:32 -0700
In-Reply-To: <20240503181734.1467938-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20240503181734.1467938-1-dmatlack@google.com>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
Message-ID: <20240503181734.1467938-2-dmatlack@google.com>
Subject: [PATCH v3 1/3] KVM: Introduce vcpu->wants_to_run
From: David Matlack <dmatlack@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, David Hildenbrand <david@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	David Matlack <dmatlack@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_111742_345860_3F8F6151 
X-CRM114-Status: GOOD (  17.52  )
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

Introduce vcpu->wants_to_run to indicate when a vCPU is in its core run
loop, i.e. when the vCPU is running the KVM_RUN ioctl and immediate_exit
was not set.

Replace all references to vcpu->run->immediate_exit with
!vcpu->wants_to_run to avoid TOCTOU races with userspace. For example, a
malicious userspace could invoked KVM_RUN with immediate_exit=true and
then after KVM reads it to set wants_to_run=false, flip it to false.
This would result in the vCPU running in KVM_RUN with
wants_to_run=false. This wouldn't cause any real bugs today but is a
dangerous landmine.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/arm64/kvm/arm.c       | 2 +-
 arch/loongarch/kvm/vcpu.c  | 2 +-
 arch/mips/kvm/mips.c       | 2 +-
 arch/powerpc/kvm/powerpc.c | 2 +-
 arch/riscv/kvm/vcpu.c      | 2 +-
 arch/s390/kvm/kvm-s390.c   | 2 +-
 arch/x86/kvm/x86.c         | 4 ++--
 include/linux/kvm_host.h   | 1 +
 virt/kvm/kvm_main.c        | 3 +++
 9 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index c4a0a35e02c7..c587e5d9396e 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -986,7 +986,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 
 	vcpu_load(vcpu);
 
-	if (run->immediate_exit) {
+	if (!vcpu->wants_to_run) {
 		ret = -EINTR;
 		goto out;
 	}
diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
index 3a8779065f73..847ef54f3a84 100644
--- a/arch/loongarch/kvm/vcpu.c
+++ b/arch/loongarch/kvm/vcpu.c
@@ -1163,7 +1163,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 			kvm_complete_iocsr_read(vcpu, run);
 	}
 
-	if (run->immediate_exit)
+	if (!vcpu->wants_to_run)
 		return r;
 
 	/* Clear exit_reason */
diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index 231ac052b506..f1a99962027a 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -436,7 +436,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 		vcpu->mmio_needed = 0;
 	}
 
-	if (vcpu->run->immediate_exit)
+	if (!vcpu->wants_to_run)
 		goto out;
 
 	lose_fpu(1);
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index d32abe7fe6ab..961aadc71de2 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -1852,7 +1852,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 
 	kvm_sigset_activate(vcpu);
 
-	if (run->immediate_exit)
+	if (!vcpu->wants_to_run)
 		r = -EINTR;
 	else
 		r = kvmppc_vcpu_run(vcpu);
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index b5ca9f2e98ac..3d8349470ee6 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -711,7 +711,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 		return ret;
 	}
 
-	if (run->immediate_exit) {
+	if (!vcpu->wants_to_run) {
 		kvm_vcpu_srcu_read_unlock(vcpu);
 		return -EINTR;
 	}
diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index 5147b943a864..b1ea25aacbf9 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -5033,7 +5033,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 	if (vcpu->kvm->arch.pv.dumping)
 		return -EINVAL;
 
-	if (kvm_run->immediate_exit)
+	if (!vcpu->wants_to_run)
 		return -EINTR;
 
 	if (kvm_run->kvm_valid_regs & ~KVM_SYNC_S390_VALID_FIELDS ||
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 2d2619d3eee4..f70ae1558684 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -11396,7 +11396,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 
 	kvm_vcpu_srcu_read_lock(vcpu);
 	if (unlikely(vcpu->arch.mp_state == KVM_MP_STATE_UNINITIALIZED)) {
-		if (kvm_run->immediate_exit) {
+		if (!vcpu->wants_to_run) {
 			r = -EINTR;
 			goto out;
 		}
@@ -11474,7 +11474,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 		WARN_ON_ONCE(vcpu->mmio_needed);
 	}
 
-	if (kvm_run->immediate_exit) {
+	if (!vcpu->wants_to_run) {
 		r = -EINTR;
 		goto out;
 	}
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index afbc99264ffa..f9b9ce0c3cd9 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -380,6 +380,7 @@ struct kvm_vcpu {
 		bool dy_eligible;
 	} spin_loop;
 #endif
+	bool wants_to_run;
 	bool preempted;
 	bool ready;
 	struct kvm_vcpu_arch arch;
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 38b498669ef9..bdea5b978f80 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4425,7 +4425,10 @@ static long kvm_vcpu_ioctl(struct file *filp,
 				synchronize_rcu();
 			put_pid(oldpid);
 		}
+		vcpu->wants_to_run = !READ_ONCE(vcpu->run->immediate_exit);
 		r = kvm_arch_vcpu_ioctl_run(vcpu);
+		vcpu->wants_to_run = false;
+
 		trace_kvm_userspace_exit(vcpu->run->exit_reason, r);
 		break;
 	}
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
