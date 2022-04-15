Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8939AC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Apr 2022 00:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OuzPHP9e3jgkcrgBWTlM6MXC5yPViF4O57TJrgEnSyE=; b=XYu8lbvXR4ryR+
	pDNlAqwMyfpcBqVq73Amxos6l7Zc7luWSi0hROYQb0xXxxFOwWuyhO1GywfMBMrsWyvbD7h9qU2sy
	OYnIkiKC2b1ZwO5zLo5slCpckU6LEH7FSf4w53esLkK8OBBYK1B7pWYW8j9yR2R8BzzZcCGYYvWUp
	75wH/5yI2/7If2PqPF/x22C3KbLp6kZQxWrpSrzFLvgiThWqZa2N23j5JiNSgpEg8GIBTMy8E2Y5g
	vZJtzhAlBBKDyZNS5f7NtE0wxS33YDEobqvuK4rZYLz/juSp/FAn8LklNAh20tSUM3BahJPoDHIcs
	dpqmVaW08HTr2fUAfYNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfA44-007txz-Rl; Fri, 15 Apr 2022 00:43:56 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfA3z-007ttp-Lj
 for linux-riscv@lists.infradead.org; Fri, 15 Apr 2022 00:43:53 +0000
Received: by mail-pl1-x649.google.com with SMTP id
 e14-20020a17090301ce00b00158bfba2295so1446252plh.3
 for <linux-riscv@lists.infradead.org>; Thu, 14 Apr 2022 17:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=VDBBxbRymwn99ifXkPvrfvP8JeLntCySB5qG2FLdHGc=;
 b=FuTYBhDITxI66Qxt5+87xMlO2q0C9iJXI9s7fddQAntJKNcZhy4i5CX3Vpr1K7b1gG
 lpGYjjhgm/CKQjYxIZBLOAlu6Wf9zZOr5BTnS1Mm46MrfyyFviEAqnWwqxLbNvwWcsyf
 JvdoNGNXJ/6sDa03DP7PftstcK+dADaHLntSvUANgU/0B4isfM6BZs4hWPzvL2xkAlhB
 CUMjlksohwVrJztO8x/MgujxI4iPE/ysUfovmABWThXxb2g+rlV8zXfjr6a4wKFGQQ8A
 2BioePglRBUYrzqDp/34X5DBOonLRTI2L6fETCpuSbqRp5Wtv6N/vgi4/Y0xhSy1jDZu
 aMxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=VDBBxbRymwn99ifXkPvrfvP8JeLntCySB5qG2FLdHGc=;
 b=HmXiv2ZX21B3mmUTPV1hGBRzAsnivkH39+ui92HTzUaFgSy00TpHfZyva1qpSbPCwH
 k0Weh+kjJv/jypTlRHIVoNXQ6HwxzQ0S8eSjcKKuPuBI9BXfKTetTjUBVu5kh4MSBDjP
 L+XURW3+axwR2pi74JFNxgH1TVM2uJAjNND0jhAdqeCWWAhX1n+v8SqjEX3H19v97Fh7
 wTefH/J47x/G/UVrwLf/fTc+B/6y5qHEVHaYYT6328RP+OF071ou1C7MwJVGLLfhFq5q
 Fa6qRFmK+yZeraIJTJjb4oLWOE0M7O28TD9I1nCQlMoa1St/sk+RkRc5F806ED2s6fHl
 pXlg==
X-Gm-Message-State: AOAM533HGT0z82dKW8y11Sdz5UFBNK6M97ZSbc1Vdh5wD/HDcoj47djD
 cL73/gah6dkhOkYiguNzjctrNpdqoT4=
X-Google-Smtp-Source: ABdhPJxWvnh9vGPdu8WwNvP/XothzcdXxz8DVteSxV4BWZ39Cw9eF09ZeKITExpxjd/oejtHjB373C4/RJY=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:1a90:b0:506:1e27:a579
 with SMTP id
 e16-20020a056a001a9000b005061e27a579mr6426109pfv.46.1649983430118; Thu, 14
 Apr 2022 17:43:50 -0700 (PDT)
Date: Fri, 15 Apr 2022 00:43:42 +0000
In-Reply-To: <20220415004343.2203171-1-seanjc@google.com>
Message-Id: <20220415004343.2203171-3-seanjc@google.com>
Mime-Version: 1.0
References: <20220415004343.2203171-1-seanjc@google.com>
X-Mailer: git-send-email 2.36.0.rc0.470.gd361397f0d-goog
Subject: [PATCH 2/3] KVM: RISC-V: Use kvm_vcpu.srcu_idx, drop RISC-V's
 unnecessary copy
From: Sean Christopherson <seanjc@google.com>
To: Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, 
 Claudio Imbrenda <imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Atish Patra <atishp@atishpatra.org>, David Hildenbrand <david@redhat.com>, 
 Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, 
 Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, 
 Joerg Roedel <joro@8bytes.org>, linuxppc-dev@lists.ozlabs.org,
 kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_174351_739137_9932D8EA 
X-CRM114-Status: GOOD (  10.85  )
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

Use the generic kvm_vcpu's srcu_idx instead of using an indentical field
in RISC-V's version of kvm_vcpu_arch.  Generic KVM very intentionally
does not touch vcpu->srcu_idx, i.e. there's zero chance of running afoul
of common code.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/riscv/include/asm/kvm_host.h |  3 ---
 arch/riscv/kvm/vcpu.c             | 16 ++++++++--------
 arch/riscv/kvm/vcpu_exit.c        |  4 ++--
 3 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 78da839657e5..cd4bbcecb0fb 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -193,9 +193,6 @@ struct kvm_vcpu_arch {
 
 	/* Don't run the VCPU (blocked) */
 	bool pause;
-
-	/* SRCU lock index for in-kernel run loop */
-	int srcu_idx;
 };
 
 static inline void kvm_arch_hardware_unsetup(void) {}
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 6785aef4cbd4..2f1caf23eed4 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -724,13 +724,13 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 	/* Mark this VCPU ran at least once */
 	vcpu->arch.ran_atleast_once = true;
 
-	vcpu->arch.srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
+	vcpu->srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
 
 	/* Process MMIO value returned from user-space */
 	if (run->exit_reason == KVM_EXIT_MMIO) {
 		ret = kvm_riscv_vcpu_mmio_return(vcpu, vcpu->run);
 		if (ret) {
-			srcu_read_unlock(&vcpu->kvm->srcu, vcpu->arch.srcu_idx);
+			srcu_read_unlock(&vcpu->kvm->srcu, vcpu->srcu_idx);
 			return ret;
 		}
 	}
@@ -739,13 +739,13 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 	if (run->exit_reason == KVM_EXIT_RISCV_SBI) {
 		ret = kvm_riscv_vcpu_sbi_return(vcpu, vcpu->run);
 		if (ret) {
-			srcu_read_unlock(&vcpu->kvm->srcu, vcpu->arch.srcu_idx);
+			srcu_read_unlock(&vcpu->kvm->srcu, vcpu->srcu_idx);
 			return ret;
 		}
 	}
 
 	if (run->immediate_exit) {
-		srcu_read_unlock(&vcpu->kvm->srcu, vcpu->arch.srcu_idx);
+		srcu_read_unlock(&vcpu->kvm->srcu, vcpu->srcu_idx);
 		return -EINTR;
 	}
 
@@ -784,7 +784,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 		 */
 		vcpu->mode = IN_GUEST_MODE;
 
-		srcu_read_unlock(&vcpu->kvm->srcu, vcpu->arch.srcu_idx);
+		srcu_read_unlock(&vcpu->kvm->srcu, vcpu->srcu_idx);
 		smp_mb__after_srcu_read_unlock();
 
 		/*
@@ -802,7 +802,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 			vcpu->mode = OUTSIDE_GUEST_MODE;
 			local_irq_enable();
 			preempt_enable();
-			vcpu->arch.srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
+			vcpu->srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
 			continue;
 		}
 
@@ -846,7 +846,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 
 		preempt_enable();
 
-		vcpu->arch.srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
+		vcpu->srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
 
 		ret = kvm_riscv_vcpu_exit(vcpu, run, &trap);
 	}
@@ -855,7 +855,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 
 	vcpu_put(vcpu);
 
-	srcu_read_unlock(&vcpu->kvm->srcu, vcpu->arch.srcu_idx);
+	srcu_read_unlock(&vcpu->kvm->srcu, vcpu->srcu_idx);
 
 	return ret;
 }
diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index aa8af129e4bb..2d56faddb9d1 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -456,9 +456,9 @@ static int stage2_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
 void kvm_riscv_vcpu_wfi(struct kvm_vcpu *vcpu)
 {
 	if (!kvm_arch_vcpu_runnable(vcpu)) {
-		srcu_read_unlock(&vcpu->kvm->srcu, vcpu->arch.srcu_idx);
+		srcu_read_unlock(&vcpu->kvm->srcu, vcpu->srcu_idx);
 		kvm_vcpu_halt(vcpu);
-		vcpu->arch.srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
+		vcpu->srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
 		kvm_clear_request(KVM_REQ_UNHALT, vcpu);
 	}
 }
-- 
2.36.0.rc0.470.gd361397f0d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
