Return-Path: <SRS0=s3kv=O5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D1B3C433EF
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:59:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00A6660F9D
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:58:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 00A6660F9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9gkqs0Gx3GpPT2u6u9qMwQhpJZofHOHkth5qdmczQ68=; b=us3Y0iLqUyV9kP
	OPiZ68R9C6hoXOZvwhr9oY/stHpGWjR92783sp1mT7TOKZN5oI7A7vH7LRSZ8QPexE11PPJdAecqN
	dQDcMJX8otsB1VL7hl/mT25tXZO1qyBisnrGySDzOC2YPAXx1J5FaK74/uGKuMWDEDeSCKRF+ZmV8
	8Qw8IphvAdCocrhWA+sUKw2YbVSQ0xGDeZJ9rMhX7jIbfB/PHXT3zWI7q+fcLarUsNMwDa7EJa5lB
	SnFFCFSB2/jMJEeDWhWm7/3A3Q8li20+cC9lZYTEMvzv7Rw+E2nSnq37GxxOt0+jYpmuiiTUfFC2Y
	8g3OUd3SgmZ4TbYhVnXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZ2ZQ-004mCj-Na; Sat, 09 Oct 2021 02:58:44 +0000
Received: from mail-qt1-x84a.google.com ([2607:f8b0:4864:20::84a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZ1sW-004UqQ-3t
 for linux-riscv@lists.infradead.org; Sat, 09 Oct 2021 02:14:28 +0000
Received: by mail-qt1-x84a.google.com with SMTP id
 13-20020ac8560d000000b0029f69548889so8849746qtr.3
 for <linux-riscv@lists.infradead.org>; Fri, 08 Oct 2021 19:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=7AydOUvkdJYa6Wlt5e9uwNZNJAdbyWC8Cf+8opg/Yr0=;
 b=F5A5ElVe2ZOpGelCD8RXcxlzS2YdsbWMTlTzwP14Z0DgtKolFahczSuhBXhCWiB7eh
 NnELj9ZTA5ErFZ1Ow79fstlN9c4/ZtbMRM8599X4XIGaWCtKgIyOuh7Lbv+UbYZ/PPbM
 g0ulVkl+iFczbzGTKrUUo2glF7/M3yo4REhhrKmsbxkn4vfC9KbCtghZums5FtWbQOo8
 OtycXlioPw/pt6DxmpIj+7wp94P9in0FjxK37sJ1NDuAXa4Qi5RgxPsIzjtUPPY238Sh
 7lWK+16G09Mmx1LZ71fHA4gr7m6egsSTAl0SJJ8FILJHRjlZrGakxe80P1e6/VbXoR38
 UNGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=7AydOUvkdJYa6Wlt5e9uwNZNJAdbyWC8Cf+8opg/Yr0=;
 b=u4eGhdEo+YnFYwEsGLNW5g0jyRTVwr6JZ1nsnnkWQKPw3K9oqLHm9ILcQzfwh/+6GA
 u1zOgXCFAmj/IGVMcM4kRqx3hbc2Dvq5hYzAcfEJw0+sKjmvophEaU9qsHjh0915VZQv
 gUqian0tuerwHEupk+vwLWaUP2w+4PI5cbysd7XiIVGH3/vjM93xuxt8cRXw2ohwieQG
 iQFQChpcbeURXE651VJ2r+QHD9WhAREIFLf/7O6b0zcoA/MBDVebLOdA22GD7VFw7vnQ
 p+HmS8ZaWMcMdVyw/LgAeNUe6crNUVel2aVBRjNyCozLPp5dMs9n04hXBc01WxzrfRPd
 r2YQ==
X-Gm-Message-State: AOAM533k2nWzfhZTZvfKd7CoqXZ1V9hBd/RIgCvTEdP5XEVnjt6OQGmb
 ADKMllsTAl5Rtoy7XHTYTDPM6cuPew8=
X-Google-Smtp-Source: ABdhPJys/1e5AWMBDntWj2WGnMrdS/6sXLvUM0X/SLQ0w9S9Xln2c4Up5CedikQUSxYJYOlRRBW1NpJbvEU=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:e39b:6333:b001:cb])
 (user=seanjc job=sendgmr) by 2002:ac8:594b:: with SMTP id
 11mr1929826qtz.191.1633745662114; 
 Fri, 08 Oct 2021 19:14:22 -0700 (PDT)
Date: Fri,  8 Oct 2021 19:12:34 -0700
In-Reply-To: <20211009021236.4122790-1-seanjc@google.com>
Message-Id: <20211009021236.4122790-42-seanjc@google.com>
Mime-Version: 1.0
References: <20211009021236.4122790-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 41/43] KVM: VMX: Pass desired vector instead of bool for
 triggering posted IRQ
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
X-CRM114-CacheID: sfid-20211008_191424_202857_63612736 
X-CRM114-Status: GOOD (  11.21  )
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

Refactor the posted interrupt helper to take the desired notification
vector instead of a bool so that the callers are self-documenting.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 78c8bc7f1b3b..f505fee3cf5c 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -3928,11 +3928,9 @@ static void vmx_msr_filter_changed(struct kvm_vcpu *vcpu)
 }
 
 static inline bool kvm_vcpu_trigger_posted_interrupt(struct kvm_vcpu *vcpu,
-						     bool nested)
+						     int pi_vec)
 {
 #ifdef CONFIG_SMP
-	int pi_vec = nested ? POSTED_INTR_NESTED_VECTOR : POSTED_INTR_VECTOR;
-
 	if (vcpu->mode == IN_GUEST_MODE) {
 		/*
 		 * The vector of interrupt to be delivered to vcpu had
@@ -3986,7 +3984,7 @@ static int vmx_deliver_nested_posted_interrupt(struct kvm_vcpu *vcpu,
 		 */
 		kvm_make_request(KVM_REQ_EVENT, vcpu);
 		/* the PIR and ON have been set by L1. */
-		if (!kvm_vcpu_trigger_posted_interrupt(vcpu, true))
+		if (!kvm_vcpu_trigger_posted_interrupt(vcpu, POSTED_INTR_NESTED_VECTOR))
 			kvm_vcpu_wake_up(vcpu);
 		return 0;
 	}
@@ -4024,7 +4022,7 @@ static int vmx_deliver_posted_interrupt(struct kvm_vcpu *vcpu, int vector)
 	 * guaranteed to see PID.ON=1 and sync the PIR to IRR if triggering a
 	 * posted interrupt "fails" because vcpu->mode != IN_GUEST_MODE.
 	 */
-	if (!kvm_vcpu_trigger_posted_interrupt(vcpu, false))
+	if (!kvm_vcpu_trigger_posted_interrupt(vcpu, POSTED_INTR_VECTOR))
 		kvm_vcpu_wake_up(vcpu);
 
 	return 0;
-- 
2.33.0.882.g93a45727a2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
