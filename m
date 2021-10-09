Return-Path: <SRS0=s3kv=O5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D29AEC433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:57:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DFC860F92
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:57:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9DFC860F92
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dDefw0wn0rXh0UGANdpA5dZ4egdj5jp+nwSrn8/g5og=; b=OLw6JTd1QKuylF
	e84znmsrIbZob/fIccGVdt8NSgwM0ILffj2UAFE//pfcDQY7kch9WTKWY4xmkCOozU54b24ZJBWs+
	L224C3QQv8KWl1czI6dMxz6UfXgE+l/FV7i7HjJaqFYf/x8vmh0evFcrfDI1WqNwyKSKS16IaD+ko
	F1fadVdVwd7xMq2XIdmqny7eTlsTrcq5u1xAkGytPU9aqgc/DlnAZWUhufMspa2crybv3nVj4oDNW
	9BuNaGgWxn6zjOgvtvNtCnZ9vI0bBqjEjZ0N0oGhiy+bJ/AOGn0jmuxMcEQWehdke/MH7rWBxWGrL
	ZCaoilUVRkekb3dAt2EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZ2Xw-004lcZ-9o; Sat, 09 Oct 2021 02:57:12 +0000
Received: from mail-qv1-xf4a.google.com ([2607:f8b0:4864:20::f4a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZ1sR-004Umo-GA
 for linux-riscv@lists.infradead.org; Sat, 09 Oct 2021 02:14:23 +0000
Received: by mail-qv1-xf4a.google.com with SMTP id
 kj19-20020a056214529300b00382b3cb8ec5so10292149qvb.20
 for <linux-riscv@lists.infradead.org>; Fri, 08 Oct 2021 19:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=60FaGe3jHfzi2vANN4FyfF/i5oEKd4JaFx8/SVEFBNk=;
 b=Z1P8991nqO/keHHcPNDLRVMsJotsLW7zCMS8prAeIixKQ9mUd7DFllwUbuaHgVSrWZ
 FkvVrJgBJx0hc4CnzRBKZSR1hitB3Pk7jqHRDt0WmtqyCKKVVvm7gD0Q9FoIUaVCRIyp
 YiCXIJxWnPrhfp4kvu9z8/hF1gQOGdE7O7cz6QeTcYuVmieoH7ELJCd7UMv/HDJr1lHI
 JdSdjZZTm0cDCLqT8cUYvWrMLcAK8JU652nI2ulS+DYSnd22rQAqVDPjiZw3qVcCjDi0
 GqTi9TAncXe+Iuc9CVjDDeSGYGD369tFbR8wEt1kGo66QnpkLVtv3NIEb5UQVw6604Ie
 3W8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=60FaGe3jHfzi2vANN4FyfF/i5oEKd4JaFx8/SVEFBNk=;
 b=uYn0RijeA99CzBimaRMsatQ8WidEQ9O3YPRW7OU7fzkxqDsLwE3sqVHghEqXWPFbOH
 UGI2bD78kWLRX9PLB7Uqc/cz+OJLYGdgbNJxucDprg170SkdGGkn1JOM7+KWU3e31Ne/
 TXf+btq8Vyn5tOrpMrfZgVKbmHrTXtP16+Aqi8DDZ8FaXUMLroecO2aF6FrDlFB7R3st
 xNg2wWMdxGCalGUbidJP+MEL5F2VzBOEJodHQGThLuKigYpGG3J2s3yZ03PY0xniB70I
 A8KnCcfmfQNmajkn1c8UK49Mzybx8vSCTr94omJB/o9pwxQyQ9byc6H85PBquF2NYDEP
 3KyA==
X-Gm-Message-State: AOAM5316+FSSTlUj0lmqOTCMDMTl2mqxQ9q+FWpChnRUbwOz/xgsxBBS
 ULJJbwqRVL7UgWc9NUatH9YL/wROhrk=
X-Google-Smtp-Source: ABdhPJzz4hkmJ133tsw9efdKVMZh6wi7X37BBmBb9YEFsyE1x8BdZiU7lUBQl0qiUIYV4wWlbCGAte9NXc4=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:e39b:6333:b001:cb])
 (user=seanjc job=sendgmr) by 2002:ac8:42da:: with SMTP id
 g26mr1839130qtm.368.1633745657436; 
 Fri, 08 Oct 2021 19:14:17 -0700 (PDT)
Date: Fri,  8 Oct 2021 19:12:32 -0700
In-Reply-To: <20211009021236.4122790-1-seanjc@google.com>
Message-Id: <20211009021236.4122790-40-seanjc@google.com>
Mime-Version: 1.0
References: <20211009021236.4122790-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 39/43] KVM: VMX: Don't do full kick when triggering posted
 interrupt "fails"
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
X-CRM114-CacheID: sfid-20211008_191419_592412_2B1AE02D 
X-CRM114-Status: GOOD (  16.14  )
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

Replace the full "kick" with just the "wake" in the fallback path when
triggering a virtual interrupt via a posted interrupt fails because the
guest is not IN_GUEST_MODE.  If the guest transitions into guest mode
between the check and the kick, then it's guaranteed to see the pending
interrupt as KVM syncs the PIR to IRR (and onto GUEST_RVI) after setting
IN_GUEST_MODE.  Kicking the guest in this case is nothing more than an
unnecessary VM-Exit (and host IRQ).

Opportunistically update comments to explain the various ordering rules
and barriers at play.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 16 ++++++++++++++--
 arch/x86/kvm/x86.c     |  5 +++--
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 13e732a818f3..44d760dde0f9 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -3978,10 +3978,16 @@ static int vmx_deliver_nested_posted_interrupt(struct kvm_vcpu *vcpu,
 		 * we will accomplish it in the next vmentry.
 		 */
 		vmx->nested.pi_pending = true;
+		/*
+		 * The smp_wmb() in kvm_make_request() pairs with the smp_mb_*()
+		 * after setting vcpu->mode in vcpu_enter_guest(), thus the vCPU
+		 * is guaranteed to see the event request if triggering a posted
+		 * interrupt "fails" because vcpu->mode != IN_GUEST_MODE.
+		 */
 		kvm_make_request(KVM_REQ_EVENT, vcpu);
 		/* the PIR and ON have been set by L1. */
 		if (!kvm_vcpu_trigger_posted_interrupt(vcpu, true))
-			kvm_vcpu_kick(vcpu);
+			kvm_vcpu_wake_up(vcpu);
 		return 0;
 	}
 	return -1;
@@ -4012,9 +4018,15 @@ static int vmx_deliver_posted_interrupt(struct kvm_vcpu *vcpu, int vector)
 	if (pi_test_and_set_on(&vmx->pi_desc))
 		return 0;
 
+	/*
+	 * The implied barrier in pi_test_and_set_on() pairs with the smp_mb_*()
+	 * after setting vcpu->mode in vcpu_enter_guest(), thus the vCPU is
+	 * guaranteed to see PID.ON=1 and sync the PIR to IRR if triggering a
+	 * posted interrupt "fails" because vcpu->mode != IN_GUEST_MODE.
+	 */
 	if (vcpu != kvm_get_running_vcpu() &&
 	    !kvm_vcpu_trigger_posted_interrupt(vcpu, false))
-		kvm_vcpu_kick(vcpu);
+		kvm_vcpu_wake_up(vcpu);
 
 	return 0;
 }
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 9643f23c28c7..274d295cabfb 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -9752,8 +9752,9 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
 	smp_mb__after_srcu_read_unlock();
 
 	/*
-	 * This handles the case where a posted interrupt was
-	 * notified with kvm_vcpu_kick.
+	 * Process pending posted interrupts to handle the case where the
+	 * notification IRQ arrived in the host, or was never sent (because the
+	 * target vCPU wasn't running).
 	 */
 	if (kvm_lapic_enabled(vcpu) && vcpu->arch.apicv_active)
 		static_call(kvm_x86_sync_pir_to_irr)(vcpu);
-- 
2.33.0.882.g93a45727a2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
