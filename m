Return-Path: <SRS0=s3kv=O5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6193DC433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:36:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DA1860F5A
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:36:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1DA1860F5A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BFxDESRwfhOO+4BFj98728yi/URGOunt45TzN9q+zBU=; b=3ZvYF/VIXMAtIX
	WxL+iWpre9TMC6WXoiGVIc+mLG64sgVfLYf93N5w9Hb3EaQDJAsYuiLWml1uox7zIMTd+nlZXOrju
	RqfHnD6sMEbrgdcdTHzUC1U+UtUbv864BRlja71AsocpCaXH+yQDGpvTuq6E/qGcMNSXGkVd6RHhk
	7kLuORXD1uAQ7om3uwMYulnszN9emKNS10qgAHAV6ULKPMSopHYkkQb4oJnjMVWXrfdHBRxUfhggc
	VuarNxJLoPci/Nt/N/NLYm2CgujQtGFdYXaN1N6KTCWAgHVmz/uHdiJFkt6xUIPqvzjmMPQ4yeJZJ
	QPOUNK8MFj1b7D5xLiig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZ2E2-004dwz-OA; Sat, 09 Oct 2021 02:36:38 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZ1ro-004UJq-5M
 for linux-riscv@lists.infradead.org; Sat, 09 Oct 2021 02:13:41 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id
 i21-20020a253b15000000b005b9c0fbba45so15082598yba.20
 for <linux-riscv@lists.infradead.org>; Fri, 08 Oct 2021 19:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=U1tiLVYe+uI6GynZ+KQaLRA7FrCZBu6OMUfWvRALpKY=;
 b=a0dUiDnuPYQQeQR8jjKdumWe754GISZ9QQg3r88Y9DPMivvvQMFzh5ozOn9lgZsXNq
 EANJ0517a1qk3IJoQbDKT/HbLrXOUwIqcNyu7+dfgeXxAYoz4kpH6adSQnkUxJfAgZaH
 UPUzp5K5Wp61nwf9+BQC7R2+G4acKBHUtHtY2hEJqpIlphtwlmsMneENvaDHUPfYIfWA
 ce641KOEb7G5/eE8IiwGpPr2d3hjmLvvlL+U/IoLXhsAHo2ay+SC7X4AbXIrGRjqgSKf
 IvYRZoNRXUDoSssc3WxQQYPxSY6c1N4ujAzz18+PUihtVJsRky6YFUvr+8O4bpS4z7of
 nYOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=U1tiLVYe+uI6GynZ+KQaLRA7FrCZBu6OMUfWvRALpKY=;
 b=pBQcuSWOBPw+ENJWiiBGNIKtozIMjy3ho8wqhG4hzG1SCwLUsYQ34dRK65d569Yzk/
 2ko5wyo5Ql+ZAV2kY9jZ4/V0bpcmJt9jW7lF1JA7Q01LjcVLMPk9erfEQQfGOjwuzHLW
 Z2u4A3uwajZDoURLpXBYMSShrY7s7YUTuGUUa1VMXTV5QurEYU/GLKetqQyVcC51jttw
 ANFqIHrGV9uQj0a8bMHR1gWN069BnNAKBTG4rC6/UexhK1RTNk/bnCH/zPWk8pvqX2Xp
 qNXJceCXdPhqRNgVcthDMLc9VFIUExW9+Ew5ePyo2xINUBmBXzpJ6RGDltJ1KpBAASQw
 sxJA==
X-Gm-Message-State: AOAM5310MaeM/JV66L9lA17tPsQexWa9VOqq1yqQHVT86g/sqicNV6d3
 ebE1fxVp10ZILJgPHPIOZo+Q5bv/FRc=
X-Google-Smtp-Source: ABdhPJxgCS3VlMfHSnl5qi0AADkiPF1Y5hzLatGiCcOeklrDazrBVCyGloG341BJ/seTJPIOJhGhWWtHs4E=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:e39b:6333:b001:cb])
 (user=seanjc job=sendgmr) by 2002:a5b:145:: with SMTP id
 c5mr7344586ybp.60.1633745618610; 
 Fri, 08 Oct 2021 19:13:38 -0700 (PDT)
Date: Fri,  8 Oct 2021 19:12:16 -0700
In-Reply-To: <20211009021236.4122790-1-seanjc@google.com>
Message-Id: <20211009021236.4122790-24-seanjc@google.com>
Mime-Version: 1.0
References: <20211009021236.4122790-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 23/43] KVM: VMX: Use boolean returns for Posted Interrupt
 "test" helpers
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
X-CRM114-CacheID: sfid-20211008_191340_252963_2005CA95 
X-CRM114-Status: GOOD (  12.42  )
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

Return bools instead of ints for the posted interrupt "test" helpers.
The bit position of the flag being test does not matter to the callers,
and is in fact lost by virtue of test_bit() itself returning a bool.

Returning ints is potentially dangerous, e.g. "pi_test_on(pi_desc) == 1"
is safe-ish because ON is bit 0 and thus any sane implementation of
pi_test_on() will work, but for SN (bit 1), checking "== 1" would rely on
pi_test_on() to return 0 or 1, a.k.a. bools, as opposed to 0 or 2 (the
positive bit position).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/posted_intr.c | 4 ++--
 arch/x86/kvm/vmx/posted_intr.h | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/vmx/posted_intr.c b/arch/x86/kvm/vmx/posted_intr.c
index 6c2110d91b06..1688f8dc535a 100644
--- a/arch/x86/kvm/vmx/posted_intr.c
+++ b/arch/x86/kvm/vmx/posted_intr.c
@@ -185,7 +185,7 @@ int pi_pre_block(struct kvm_vcpu *vcpu)
 			   new.control) != old.control);
 
 	/* We should not block the vCPU if an interrupt is posted for it.  */
-	if (pi_test_on(pi_desc) == 1)
+	if (pi_test_on(pi_desc))
 		__pi_post_block(vcpu);
 
 	local_irq_enable();
@@ -216,7 +216,7 @@ void pi_wakeup_handler(void)
 			blocked_vcpu_list) {
 		struct pi_desc *pi_desc = vcpu_to_pi_desc(vcpu);
 
-		if (pi_test_on(pi_desc) == 1)
+		if (pi_test_on(pi_desc))
 			kvm_vcpu_kick(vcpu);
 	}
 	spin_unlock(&per_cpu(blocked_vcpu_on_cpu_lock, cpu));
diff --git a/arch/x86/kvm/vmx/posted_intr.h b/arch/x86/kvm/vmx/posted_intr.h
index 7f7b2326caf5..36ae035f14aa 100644
--- a/arch/x86/kvm/vmx/posted_intr.h
+++ b/arch/x86/kvm/vmx/posted_intr.h
@@ -40,7 +40,7 @@ static inline bool pi_test_and_clear_on(struct pi_desc *pi_desc)
 			(unsigned long *)&pi_desc->control);
 }
 
-static inline int pi_test_and_set_pir(int vector, struct pi_desc *pi_desc)
+static inline bool pi_test_and_set_pir(int vector, struct pi_desc *pi_desc)
 {
 	return test_and_set_bit(vector, (unsigned long *)pi_desc->pir);
 }
@@ -74,13 +74,13 @@ static inline void pi_clear_sn(struct pi_desc *pi_desc)
 		(unsigned long *)&pi_desc->control);
 }
 
-static inline int pi_test_on(struct pi_desc *pi_desc)
+static inline bool pi_test_on(struct pi_desc *pi_desc)
 {
 	return test_bit(POSTED_INTR_ON,
 			(unsigned long *)&pi_desc->control);
 }
 
-static inline int pi_test_sn(struct pi_desc *pi_desc)
+static inline bool pi_test_sn(struct pi_desc *pi_desc)
 {
 	return test_bit(POSTED_INTR_SN,
 			(unsigned long *)&pi_desc->control);
-- 
2.33.0.882.g93a45727a2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
