Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD6ACC6FA82
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 00:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zIEmsK7ni7B99Gr+3ANcrTN0jbBV/nfj5Y3QFiRlPoo=; b=eLoBy0pKI9KdWC
	jZewjE5Zgl1Cu7J5wxI9rs6jTrmVGqMlYHxXwQ1mc5tZxZyQo6HDRV33kOKqhk1a62ABK/V3s3N5V
	b3Y7JnRb97Kq9ndLDJQ7GL/qxaOp9cJBYD7cHoi/N8/AACDpoYd2Sm2ucROw05K8VY1JHVkc9d5mM
	fk1o4tf+c7JBWDsZkzXKSoDMgwZUM26bIvXrudSP2YFaAAWf3ILq3Z6/ULVpkSjUsjw/PfReTE0R2
	a0RZJ1gVmfrVK48uO2xcTYMjIcBuDNfzguxfBsOaUy3FGCTilbXzaFDcX3TtlMeyhJi7qkxvRUagk
	EriTAqSi7A1ImL5RJdjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oanjF-007jtI-Q2; Wed, 21 Sep 2022 00:36:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oanfx-007hw3-KX
	for linux-riscv@bombadil.infradead.org; Wed, 21 Sep 2022 00:33:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=in1e99LU0Ccpw/X/GIRYkJpr4V5oHdTaxBm51ABK8Zw=; b=RATpZqmRcFBJyIlBQeP5t7MqqU
	xm4lWe7FQjTfnlDZoP2nMYIBDoOezHrSADNds8e+CXwURDEOotogFzjJMNX1dt7uaXaYvI0AWnfZ2
	iifsO20rO21t3VMSYi2vQ/Cga5dJGMJsX7pJ8QaPMurIfZCLxomgOwmz8o2JNPCqOjO8j4jvGbhUb
	rymKfDAOXcCC9ozBq/zo/+0RbmqNRdYG/wNp+DTvaJxEOZBwO3DuLSsX11pQkEmWe4uVGkJvo5PqN
	SAl2CjOHu1KOM9wKRDU1L7mrVBCP2Ej7NGp0Becv/7jnQ2SI6tUOY6hXkpEgTQiZtc4/QDF6kUntn
	prvnsQ3w==;
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oanfc-00ET5o-Lo
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 00:32:59 +0000
Received: by mail-pl1-x64a.google.com with SMTP id j3-20020a170902da8300b001782a6fbc87so2699438plx.5
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 17:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date;
        bh=in1e99LU0Ccpw/X/GIRYkJpr4V5oHdTaxBm51ABK8Zw=;
        b=fxdaQ36wvXASTDMSCMzYP+4owRlpPpJcqJ4F20fEjNf3NkP/XvFqT6xHl6n3ymucfl
         wAkGHRzbnCmY2sRlXf6ZWxdMJOLwsB9akqzNsLJ63vLPgpDdP/+uiqDwiJPNyKPaW9d7
         W2gxRWjRcioAK5oyxgmQ+mvd8Xlfcqcs1FkpQ/Oqp1HeXyhy4RotzrvhRKtqe8D+3zPD
         +CkxhFgpHhUHVq6NWMedQTZChQMs8Bwl5AD6kmQ5xMId+9oxitQlXRTCf8+K4ilieGZt
         o5dYeYoVYv1Nk//INpmg7k40TTkb2qfPNYErptOcyucxi9O7dxpRl/MDPplYtfBX3bMF
         AtFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date;
        bh=in1e99LU0Ccpw/X/GIRYkJpr4V5oHdTaxBm51ABK8Zw=;
        b=Ufdk69OTTylCNDWIX8aAWA/Mw+f8cxN8dUrW6ESoIVmMGspxmyh3eIVny4ZfDc7GRF
         8YvzXojiKYN5JHETZe0SUDVYjwC9WkJgKKIuEsCJAStzYRlJgmo1FxZQj0NJUw9/Hv8Q
         4WlKt2zwS7JBT6BGRbpv5sD1QPWTJn3gbgm7E9/If0ELm9gmQk3nmCts0wyvGFZjcEJF
         HI516250joKy3JlnMx4zf74MC/StJZZdfpQybpi1TotAoiADMjBGuLl/jdf0pCzf8HIM
         hAMR0HZk/Tr21TbcAQyRjvcRuZaiO6Ky74ma5sYCVg4jP7V3H7E7uK1JiSxDUUsy2ZrC
         VFDw==
X-Gm-Message-State: ACrzQf0GRPCVPoOyBnXC1URZT5BeCfAKeeGStiXj9lRa5wbgqOyytOcb
	kMbk6/2MsKABTgzNuBXd53Yy61wdCds=
X-Google-Smtp-Source: AMsMyM5mvx4Hh7HCt8EQDTkIMloT3kDTM73/Oxb6s3/QbBaMaLHOT1W35eSuZRH5DC184c70ddSZg22LA4I=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:cf11:b0:178:29d7:4fbd with SMTP id
 i17-20020a170902cf1100b0017829d74fbdmr2199821plg.174.1663720374306; Tue, 20
 Sep 2022 17:32:54 -0700 (PDT)
Date: Wed, 21 Sep 2022 00:31:53 +0000
In-Reply-To: <20220921003201.1441511-1-seanjc@google.com>
Mime-Version: 1.0
References: <20220921003201.1441511-1-seanjc@google.com>
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
Message-ID: <20220921003201.1441511-5-seanjc@google.com>
Subject: [PATCH v4 04/12] KVM: x86: Rename kvm_apic_has_events() to make it
 INIT/SIPI specific
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Atish Patra <atishp@atishpatra.org>, David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Maxim Levitsky <mlevitsk@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_013257_062791_83BA3E72 
X-CRM114-Status: GOOD (  11.89  )
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

Rename kvm_apic_has_events() to kvm_apic_has_pending_init_or_sipi() so
that it's more obvious that "events" really just means "INIT or SIPI".

Opportunistically clean up a weirdly worded comment that referenced
kvm_apic_has_events() instead of kvm_apic_accept_events().

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/lapic.h | 2 +-
 arch/x86/kvm/x86.c   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/lapic.h b/arch/x86/kvm/lapic.h
index c3ce6b0b1ea3..a5ac4a5a5179 100644
--- a/arch/x86/kvm/lapic.h
+++ b/arch/x86/kvm/lapic.h
@@ -224,7 +224,7 @@ static inline bool kvm_vcpu_apicv_active(struct kvm_vcpu *vcpu)
 	return lapic_in_kernel(vcpu) && vcpu->arch.apic->apicv_active;
 }
 
-static inline bool kvm_apic_has_events(struct kvm_vcpu *vcpu)
+static inline bool kvm_apic_has_pending_init_or_sipi(struct kvm_vcpu *vcpu)
 {
 	return lapic_in_kernel(vcpu) && vcpu->arch.apic->pending_events;
 }
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 59be7b16b92f..16a24dd28f26 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -11920,8 +11920,8 @@ void kvm_vcpu_reset(struct kvm_vcpu *vcpu, bool init_event)
 		struct fpstate *fpstate = vcpu->arch.guest_fpu.fpstate;
 
 		/*
-		 * To avoid have the INIT path from kvm_apic_has_events() that be
-		 * called with loaded FPU and does not let userspace fix the state.
+		 * All paths that lead to INIT are required to load the guest's
+		 * FPU state (because most paths are buried in KVM_RUN).
 		 */
 		if (init_event)
 			kvm_put_guest_fpu(vcpu);
@@ -12765,7 +12765,7 @@ static inline bool kvm_vcpu_has_events(struct kvm_vcpu *vcpu)
 	if (!list_empty_careful(&vcpu->async_pf.done))
 		return true;
 
-	if (kvm_apic_has_events(vcpu))
+	if (kvm_apic_has_pending_init_or_sipi(vcpu))
 		return true;
 
 	if (vcpu->arch.pv.pv_unhalted)
-- 
2.37.3.968.ga6b4b080e4-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
