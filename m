Return-Path: <SRS0=s3kv=O5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14600C433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:55:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCBDD60F6D
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:55:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CCBDD60F6D
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3phgwXlEXUiVrUNIWxN0m3aLPn4vBSHzP4w/JXQgs2Y=; b=2mjGwMtOroi8Io
	RwVh1VgyapmNG4CKdG559YIdDtHUS1ZS7inQemNoBD2S5VQrwV9qqiYgw93dtlc0ji0Xm38a9xp2u
	uSlnMca0BjLkTa8SWTKRQrrMVvpHUufg6Nu6OosDgRuFXIYrIPHqSxJoD1tzOFKeTT/R27gFTRg7Y
	rVcHAaHvF6AiU/0MyGdYaYIuq3SboTWn+Taa7MJYldKEXVbVxjFEqptNG0aTS9S7B+TotZf1H+Yz7
	Y6RqPkeIbXtperBgtDaEZ/50XaZ8nrCT19zwVICrlhF1aP8vAIzyKdybOoGcRxYDhoyC2vaMiNm21
	orrxQjeKTeIbQLlWQLHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZ2VY-004khj-1G; Sat, 09 Oct 2021 02:54:44 +0000
Received: from mail-qt1-x849.google.com ([2607:f8b0:4864:20::849])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZ1sO-004UfS-1n
 for linux-riscv@lists.infradead.org; Sat, 09 Oct 2021 02:14:17 +0000
Received: by mail-qt1-x849.google.com with SMTP id
 t9-20020a05622a180900b002a71f83a1cdso8810708qtc.17
 for <linux-riscv@lists.infradead.org>; Fri, 08 Oct 2021 19:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=vARluonyUKpRy8G9DjKrfNHNdAc1HGSYAf2sHJRtsxE=;
 b=dDNQpdZfL83I4Xoa9PZ3E5EsYnabe1TnFcUqC0GiE/0/lo3YBI4SgbGlytEWdsCvOf
 LL61F+TPG4wVAi+hBDwL0hYJr0Sf/hDhYBcY7jqTws2bL+a5fPjX5OLlspq9+auO8uLB
 LlWM6ttM2AIBOgSzLaGHfzimLEgh21na9pO5BUmiCsH43tkGQwDiPq/uFgoyBvKjufM1
 qqm6SRzQMrUy4KCFfX/YOo+AIQIUXaJKY/DR/AD2RJh1k/DEWqufdKKiBjO5+vKlBr1h
 rts7eeL0kCC8yhrzj1lM+laL06N4oAUmGKJnSLoqoH7hEPeImUfW3S7INsYE4a0g/dn5
 bbFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=vARluonyUKpRy8G9DjKrfNHNdAc1HGSYAf2sHJRtsxE=;
 b=1TJjx6IWRX12TJfCg/ZM36k1SnE+hwsuoxyEn3YhLR5V2UVFZeuH7n8YgzLtowpQVa
 Z1Timc4WtOuK/4QpKJDPJX1EDat7YBPY5lmyCC+WkQPzJSQZ5LbI3JSmjdBKsbjQAKzb
 GAqX4F62U1a2F7X7zS//HzQfCEyGTbnMWUY8L7NeQDR+ahSSDRxsy2YZEsynuEnA48EB
 tFNOc1eKPOeOeMsS+lkWcgW1zPT9VmMQzbApaKLk5jfaFhbkUFn3n9jd33R1u5n+GBuI
 85B4BdAnTaO7jUXz55n/qk7kXaGWKqIlvXVhChoSNXHhheTossT3IhwbbpOw3aNiUPqf
 CZHA==
X-Gm-Message-State: AOAM531SOqwpBslyfrvPdoE9PhfitSAVivgYHSFilTBRoDXTUan4Efid
 tCAhFjtG39sqBeuQ3aEJ+a2QF1Eu2QM=
X-Google-Smtp-Source: ABdhPJz6N4BKMo0pT3bkNnK0CxX1fpn8ACkILDo1YTK4hK+oppBaD3kzEAa1dfJV1AQiV4D0k1Eht0uMACM=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:e39b:6333:b001:cb])
 (user=seanjc job=sendgmr) by 2002:ac8:7010:: with SMTP id
 x16mr1970027qtm.136.1633745647867; 
 Fri, 08 Oct 2021 19:14:07 -0700 (PDT)
Date: Fri,  8 Oct 2021 19:12:28 -0700
In-Reply-To: <20211009021236.4122790-1-seanjc@google.com>
Message-Id: <20211009021236.4122790-36-seanjc@google.com>
Mime-Version: 1.0
References: <20211009021236.4122790-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 35/43] KVM: SVM: Signal AVIC doorbell iff vCPU is in guest
 mode
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
X-CRM114-CacheID: sfid-20211008_191416_161706_C279FC9E 
X-CRM114-Status: GOOD (  13.70  )
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

Signal the AVIC doorbell iff the vCPU is running in the guest.  If the vCPU
is not IN_GUEST_MODE, it's guaranteed to pick up any pending IRQs on the
next VMRUN, which unconditionally processes the vIRR.

Add comments to document the logic.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index 208c5c71e827..cbf02e7e20d0 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -674,7 +674,12 @@ int svm_deliver_avic_intr(struct kvm_vcpu *vcpu, int vec)
 	kvm_lapic_set_irr(vec, vcpu->arch.apic);
 	smp_mb__after_atomic();
 
-	if (avic_vcpu_is_running(vcpu)) {
+	/*
+	 * Signal the doorbell to tell hardware to inject the IRQ if the vCPU
+	 * is in the guest.  If the vCPU is not in the guest, hardware will
+	 * automatically process AVIC interrupts at VMRUN.
+	 */
+	if (vcpu->mode == IN_GUEST_MODE) {
 		int cpu = READ_ONCE(vcpu->cpu);
 
 		/*
@@ -687,8 +692,13 @@ int svm_deliver_avic_intr(struct kvm_vcpu *vcpu, int vec)
 		if (cpu != get_cpu())
 			wrmsrl(SVM_AVIC_DOORBELL, kvm_cpu_get_apicid(cpu));
 		put_cpu();
-	} else
+	} else {
+		/*
+		 * Wake the vCPU if it was blocking.  KVM will then detect the
+		 * pending IRQ when checking if the vCPU has a wake event.
+		 */
 		kvm_vcpu_wake_up(vcpu);
+	}
 
 	return 0;
 }
-- 
2.33.0.882.g93a45727a2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
