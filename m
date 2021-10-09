Return-Path: <SRS0=s3kv=O5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6E4AC433EF
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:22:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84EC960F90
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:22:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 84EC960F90
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d2rM++WKDwnXBOHvldE+CZHE7RBD3pjU7pvbqA8Iv/s=; b=EWuM5/h+7hutJe
	2HpUYxjvpikMp1u/1K4Y++ePOjsMThqGNfJ+TWhRj8q0Q+GIOvk41+wouI9wUu5sSD8soDEwyS7bH
	iQAx75xXgbVnK1n230H273SdHComu/es3t/VfTX2grvikBKyS7XKnkrhYIF0Umm+8PbvDHkZhwXLk
	JzU9XTPSHmJiLqTOiYbkw1qd48ZnFSH7+vBXZ2dxW5ue6G2CDg47Rs9J5c9TqF9YUZa8QyWJhyGOY
	bCOXrfUUWHMj7BIkV3bc9Xl4R728XzxV76zbXe6lLSZYLAMrHJq/lpmyx2PqcJXP4fyB3PqhqpWKH
	205+JM6lpW73f/FfRSYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZ1zd-004YOo-Sq; Sat, 09 Oct 2021 02:21:46 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZ1rN-004U1E-0d
 for linux-riscv@lists.infradead.org; Sat, 09 Oct 2021 02:13:14 +0000
Received: by mail-yb1-xb49.google.com with SMTP id
 b197-20020a2534ce000000b005b71a4e189eso15170209yba.5
 for <linux-riscv@lists.infradead.org>; Fri, 08 Oct 2021 19:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=mx/LClvEah9U/ujSRD+kU2QZC8VI4YcZ2y85zUuGTJg=;
 b=NMczBrFGG+ZqD7XEJJZ0zVbsooqsKx7UCDFGdMakqEpsjihKxjQp1x7rBosSZj6oy3
 ZJbqFgmvbwEN8b/asiLsOJ45um4feisiVzJqUdRa700dyb3I3gjiNRJYHmFXs8fELHpz
 KZaubfYaFQk/NJUpMGGU5LErf+qMcFSnPhlW+wd6SSzyqBJvHECi4FXpwxESoAqsPGvw
 wfWtQWmiPSvw7zrFTRzKuuITt8jRt1JtmEbQqNMhufsJW14OMSbwxnzqQ/pLUX5m6wke
 +DtTEbAYwmAztWnXM1bPsj7c9e5t3FnTb6fZ0MBiecuAVVKjMgiuobo4/lrvrTPsEZLf
 R+sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=mx/LClvEah9U/ujSRD+kU2QZC8VI4YcZ2y85zUuGTJg=;
 b=tTgzOFW7l2WMHNuF2MAezwhiB0Y/omOZL6t8DhTFTm8sgcB2XQ0lXPdFCrAY7ekyRo
 mQtw3r5Kio1aTIp+QPqU2BCK+vYx1HK8DRR6tEEkdhe4E4IfIkJx2RawGTvMqVWbqtGU
 lA8Hbh7k9dvi94vgwKU3ZWjHoofnXNz5PC7+1My7ZAE0MMaZeQSkYxwjJWXZEeHOQPlH
 M2AQ6fzb/t0yztciDjNVCTqmS2Fcspg8yZqbBbuvZJeAHmi/iEnrZfHUvjUSUpECwuVf
 f0eMtnz6SD6a1EUGXEu8A2PHGBTnTLZjWl1mumgTsfT3WHhHAMh1O5/OLSIYilwWpbn2
 PRLA==
X-Gm-Message-State: AOAM531VmUWa8YZp1BLOsesWF1S0zJIRmqL9rCC7HMI+xfpW0o+sbCbU
 Oew2cbI5JHvljLrJGR+/BnEYlBcGCaU=
X-Google-Smtp-Source: ABdhPJxejCbihGBgy3LVPfOgjAc3dy8xh0iCSgNtnKJhEvr9JNPLSKIyX+Ts6QvnlifutcHJPzG1e+Du0lg=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:e39b:6333:b001:cb])
 (user=seanjc job=sendgmr) by 2002:a25:bb08:: with SMTP id
 z8mr7478243ybg.306.1633745591524; 
 Fri, 08 Oct 2021 19:13:11 -0700 (PDT)
Date: Fri,  8 Oct 2021 19:12:05 -0700
In-Reply-To: <20211009021236.4122790-1-seanjc@google.com>
Message-Id: <20211009021236.4122790-13-seanjc@google.com>
Mime-Version: 1.0
References: <20211009021236.4122790-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 12/43] KVM: x86: Tweak halt emulation helper names to free
 up kvm_vcpu_halt()
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, 
 Anup Patel <anup.patel@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Atish Patra <atish.patra@wdc.com>, 
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Sean Christopherson <seanjc@google.com>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, 
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 
 linux-mips@vger.kernel.org, kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, 
 Oliver Upton <oupton@google.com>, Jing Zhang <jingzhangos@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_191313_095013_59F4152E 
X-CRM114-Status: GOOD (  12.38  )
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

Rename a variety of HLT-related helpers to free up the function name
"kvm_vcpu_halt" for future use in generic KVM code, e.g. to differentiate
between "block" and "halt".

No functional change intended.

Reviewed-by: David Matlack <dmatlack@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h |  2 +-
 arch/x86/kvm/vmx/nested.c       |  2 +-
 arch/x86/kvm/vmx/vmx.c          |  4 ++--
 arch/x86/kvm/x86.c              | 13 +++++++------
 4 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 7aafc27ce7a9..328103a520d3 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1689,7 +1689,7 @@ int kvm_emulate_monitor(struct kvm_vcpu *vcpu);
 int kvm_fast_pio(struct kvm_vcpu *vcpu, int size, unsigned short port, int in);
 int kvm_emulate_cpuid(struct kvm_vcpu *vcpu);
 int kvm_emulate_halt(struct kvm_vcpu *vcpu);
-int kvm_vcpu_halt(struct kvm_vcpu *vcpu);
+int kvm_emulate_halt_noskip(struct kvm_vcpu *vcpu);
 int kvm_emulate_ap_reset_hold(struct kvm_vcpu *vcpu);
 int kvm_emulate_wbinvd(struct kvm_vcpu *vcpu);
 
diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index af1bbb73430a..d0237a441feb 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -3619,7 +3619,7 @@ static int nested_vmx_run(struct kvm_vcpu *vcpu, bool launch)
 		    !(nested_cpu_has(vmcs12, CPU_BASED_INTR_WINDOW_EXITING) &&
 		      (vmcs12->guest_rflags & X86_EFLAGS_IF))) {
 			vmx->nested.nested_run_pending = 0;
-			return kvm_vcpu_halt(vcpu);
+			return kvm_emulate_halt_noskip(vcpu);
 		}
 		break;
 	case GUEST_ACTIVITY_WAIT_SIPI:
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 1c8b2b6e7ed9..5517893f12fc 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -4741,7 +4741,7 @@ static int handle_rmode_exception(struct kvm_vcpu *vcpu,
 		if (kvm_emulate_instruction(vcpu, 0)) {
 			if (vcpu->arch.halt_request) {
 				vcpu->arch.halt_request = 0;
-				return kvm_vcpu_halt(vcpu);
+				return kvm_emulate_halt_noskip(vcpu);
 			}
 			return 1;
 		}
@@ -5415,7 +5415,7 @@ static int handle_invalid_guest_state(struct kvm_vcpu *vcpu)
 
 		if (vcpu->arch.halt_request) {
 			vcpu->arch.halt_request = 0;
-			return kvm_vcpu_halt(vcpu);
+			return kvm_emulate_halt_noskip(vcpu);
 		}
 
 		/*
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 4a52a08707de..9c23ae1d483d 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -8649,7 +8649,7 @@ void kvm_arch_exit(void)
 #endif
 }
 
-static int __kvm_vcpu_halt(struct kvm_vcpu *vcpu, int state, int reason)
+static int __kvm_emulate_halt(struct kvm_vcpu *vcpu, int state, int reason)
 {
 	++vcpu->stat.halt_exits;
 	if (lapic_in_kernel(vcpu)) {
@@ -8661,11 +8661,11 @@ static int __kvm_vcpu_halt(struct kvm_vcpu *vcpu, int state, int reason)
 	}
 }
 
-int kvm_vcpu_halt(struct kvm_vcpu *vcpu)
+int kvm_emulate_halt_noskip(struct kvm_vcpu *vcpu)
 {
-	return __kvm_vcpu_halt(vcpu, KVM_MP_STATE_HALTED, KVM_EXIT_HLT);
+	return __kvm_emulate_halt(vcpu, KVM_MP_STATE_HALTED, KVM_EXIT_HLT);
 }
-EXPORT_SYMBOL_GPL(kvm_vcpu_halt);
+EXPORT_SYMBOL_GPL(kvm_emulate_halt_noskip);
 
 int kvm_emulate_halt(struct kvm_vcpu *vcpu)
 {
@@ -8674,7 +8674,7 @@ int kvm_emulate_halt(struct kvm_vcpu *vcpu)
 	 * TODO: we might be squashing a GUESTDBG_SINGLESTEP-triggered
 	 * KVM_EXIT_DEBUG here.
 	 */
-	return kvm_vcpu_halt(vcpu) && ret;
+	return kvm_emulate_halt_noskip(vcpu) && ret;
 }
 EXPORT_SYMBOL_GPL(kvm_emulate_halt);
 
@@ -8682,7 +8682,8 @@ int kvm_emulate_ap_reset_hold(struct kvm_vcpu *vcpu)
 {
 	int ret = kvm_skip_emulated_instruction(vcpu);
 
-	return __kvm_vcpu_halt(vcpu, KVM_MP_STATE_AP_RESET_HOLD, KVM_EXIT_AP_RESET_HOLD) && ret;
+	return __kvm_emulate_halt(vcpu, KVM_MP_STATE_AP_RESET_HOLD,
+					KVM_EXIT_AP_RESET_HOLD) && ret;
 }
 EXPORT_SYMBOL_GPL(kvm_emulate_ap_reset_hold);
 
-- 
2.33.0.882.g93a45727a2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
