Return-Path: <SRS0=s3kv=O5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FC5AC433EF
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 03:02:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0AA66052B
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 03:02:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D0AA66052B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HwJEfs1AJ87LK4IOJB9SvUqG4xMTB+NBxwAHy3I3N9k=; b=rL0rdo5pGgE58U
	Gi+Sd3u76Zy9GMB4WtEXc6LtJqQ06tTsQI+wpi6bz48iN4quu+rDu0kXPyyqr62ylkgq6MsZq6JfM
	BYZraa4M9J+TYL671hBlX3AEnwnmflF3x47Piak8p96T1xdWlfly2y2rfNX9lw39qAHcwN4zsy+oA
	05MLHEvDDmJFT2IADjR+yXaOQNLvOA0A6jp2LDp6QTS+mddWoeqMdF4gXaAL1zJBoReN+34U8NGjj
	qhVaUHEQJYcvNOV8JI0pnsOmWi0NWGKxjah/Bpk3smKDtsumE/Q8bhVu0VRFuWgtozjKa8kdpRYMo
	lfzPwcZAk9wI75oTg3rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZ2cu-004nWa-Nf; Sat, 09 Oct 2021 03:02:20 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZ1sY-004UsJ-Jt
 for linux-riscv@lists.infradead.org; Sat, 09 Oct 2021 02:14:30 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id
 z2-20020a254c02000000b005b68ef4fe24so15044436yba.11
 for <linux-riscv@lists.infradead.org>; Fri, 08 Oct 2021 19:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=AlVgPkgkFYp3mdA0c8FeIFPE9R3iQYYLs6SQdF7DS7Y=;
 b=iyDWCxyALAJzTmrUWpKD0hm+MQGe0JbvQFQ+gPVY/mUdPcOBuJRTdijBOEaFZ+LAAb
 SDTgJ4oxCKVVc0nNYZIMuAMtCs0uQECNKotNLEWLcodTtHGOERifCGz75XQaYTAh1vxX
 neHo9EJwZRaNOXzY5g4EMe8hM39Md1Iy0bRnoPVZCfJilexl2bbxOCi5VnE5sdolV6eU
 NSIZQhgHuO3ZxoxUovFoBRAFe5hP7ZvZYuCsNm5sISOiG6xvPYGa1WB0B6RyfZX8HQo6
 K97euHgjPX8JD6ljBA2834wXcBVVic3DkNPl89wT3euIRZ1CjF3KG79BaaaEoSx95D/a
 coZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=AlVgPkgkFYp3mdA0c8FeIFPE9R3iQYYLs6SQdF7DS7Y=;
 b=sxa3z5QfFNF9YeqSnzawrHtOhsCVcoWtJ4JpXLToOKbfBNPCI98zqmW7/TvCPrRizL
 BTAWzpImy3+ycg0pHbNsGDCcR2dXOo4/DqB8hE2RfHcv3oJfu8PM6DYn7Q5Kd+ofjs+x
 nlUDgyVI+TZ1u2ndE7CjIOZExxf2Q8j5/wQr5WX5/xMedB+cwIfTpTszzcUwqJDqZlxQ
 FBhOHmTEdbbUFqQNi9KnTvfhJJcJXoAjQ8HAtJ9YtRfQzlA9EMVqg6MoGQTFJ4/Qr+cy
 V83dWQQxFbENO4hJ42hz4LJQAvzyzqHYR4WbMo4g+JeWMuuOSt+EMXz+84D8jKgrjKRQ
 Bxow==
X-Gm-Message-State: AOAM531MxFf67pPccoor7V8Q3TZPou2NItSnIwzZ++KN0/vZbevSTlSb
 RpuJIJWwuzlpY2LiuAUR9KzhopoFGvs=
X-Google-Smtp-Source: ABdhPJwCGOH/vSNpBFtQULwIni84FKIaJWE8Z3rFyAmS2+NcdTac9rCKWh3u0VdnxrDvnUeBFYVQOv64tnI=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:e39b:6333:b001:cb])
 (user=seanjc job=sendgmr) by 2002:a25:6908:: with SMTP id
 e8mr6568722ybc.337.1633745664741; 
 Fri, 08 Oct 2021 19:14:24 -0700 (PDT)
Date: Fri,  8 Oct 2021 19:12:35 -0700
In-Reply-To: <20211009021236.4122790-1-seanjc@google.com>
Message-Id: <20211009021236.4122790-43-seanjc@google.com>
Mime-Version: 1.0
References: <20211009021236.4122790-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 42/43] KVM: VMX: Fold fallback path into triggering posted
 IRQ helper
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
X-CRM114-CacheID: sfid-20211008_191426_764295_684C0998 
X-CRM114-Status: GOOD (  11.03  )
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

Move the fallback "wake_up" path into the helper to trigger posted
interrupt helper now that the nested and non-nested paths are identical.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index f505fee3cf5c..b0d97cf18c34 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -3927,7 +3927,7 @@ static void vmx_msr_filter_changed(struct kvm_vcpu *vcpu)
 	pt_update_intercept_for_msr(vcpu);
 }
 
-static inline bool kvm_vcpu_trigger_posted_interrupt(struct kvm_vcpu *vcpu,
+static inline void kvm_vcpu_trigger_posted_interrupt(struct kvm_vcpu *vcpu,
 						     int pi_vec)
 {
 #ifdef CONFIG_SMP
@@ -3958,10 +3958,15 @@ static inline bool kvm_vcpu_trigger_posted_interrupt(struct kvm_vcpu *vcpu,
 		 */
 
 		apic->send_IPI_mask(get_cpu_mask(vcpu->cpu), pi_vec);
-		return true;
+		return;
 	}
 #endif
-	return false;
+	/*
+	 * The vCPU isn't in the guest; wake the vCPU in case it is blocking,
+	 * otherwise do nothing as KVM will grab the highest priority pending
+	 * IRQ via ->sync_pir_to_irr() in vcpu_enter_guest().
+	 */
+	kvm_vcpu_wake_up(vcpu);
 }
 
 static int vmx_deliver_nested_posted_interrupt(struct kvm_vcpu *vcpu,
@@ -3984,8 +3989,7 @@ static int vmx_deliver_nested_posted_interrupt(struct kvm_vcpu *vcpu,
 		 */
 		kvm_make_request(KVM_REQ_EVENT, vcpu);
 		/* the PIR and ON have been set by L1. */
-		if (!kvm_vcpu_trigger_posted_interrupt(vcpu, POSTED_INTR_NESTED_VECTOR))
-			kvm_vcpu_wake_up(vcpu);
+		kvm_vcpu_trigger_posted_interrupt(vcpu, POSTED_INTR_NESTED_VECTOR);
 		return 0;
 	}
 	return -1;
@@ -4022,9 +4026,7 @@ static int vmx_deliver_posted_interrupt(struct kvm_vcpu *vcpu, int vector)
 	 * guaranteed to see PID.ON=1 and sync the PIR to IRR if triggering a
 	 * posted interrupt "fails" because vcpu->mode != IN_GUEST_MODE.
 	 */
-	if (!kvm_vcpu_trigger_posted_interrupt(vcpu, POSTED_INTR_VECTOR))
-		kvm_vcpu_wake_up(vcpu);
-
+	kvm_vcpu_trigger_posted_interrupt(vcpu, POSTED_INTR_VECTOR);
 	return 0;
 }
 
-- 
2.33.0.882.g93a45727a2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
