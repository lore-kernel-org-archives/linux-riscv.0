Return-Path: <SRS0=s3kv=O5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 334F2C433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:53:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB60160F9D
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:53:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EB60160F9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cfsHq9GF0qCfsmYn45EJYUqdivU9/xiD5HraGedoQiA=; b=44RgzRUGrpkuu2
	gjOCaLd3cxd7XSmg30c9eQf7VLHTNNbQfRtajB6lLesrFK3ROFHe5ESEyRF3/rZfNJYMiAu7/t1/P
	NE/EpXxT8Cb/5PtDUkXk4yFAVD6jhdKNKX2kPsxopHvFupkt3942+ckS+n2Zuxu0tmkkTCvdICCLJ
	a0K8rbOxd4hllfxKA5FQYm8DSWqXvXl9uIJbvp5ztmRRmht3SZmEBCNjhOGOlW2xfkgPWpKPsTNBh
	PnHfehQKcmEwEnkIeXRWKJRL0FSMZ4M12hlsnl/bH+SX0R+FQW6SYtvowlickGSS+lplr9cXZAQas
	D9CK1UfAK8Y4I0xb+UXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZ2UL-004kFG-Cf; Sat, 09 Oct 2021 02:53:29 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZ1sM-004Uj7-6E
 for linux-riscv@lists.infradead.org; Sat, 09 Oct 2021 02:14:16 +0000
Received: by mail-yb1-xb49.google.com with SMTP id
 z2-20020a254c02000000b005b68ef4fe24so15044045yba.11
 for <linux-riscv@lists.infradead.org>; Fri, 08 Oct 2021 19:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=EO1DdjrhtpmWzjh1EvgBT+lYKJFtXbnNZvFnyTdrLr4=;
 b=SgQ6bc6sO/D2BDTT6qtx0WAi/ReMNLqD/ixklFc6XJsme6RvEAyibaoCcZ+6xQ5OkI
 ktC+f/9gaqy4GxqOHggOKkREje58nPcOr+Pu+vPxOlkYQMNw78hFOqCmgpg1tqeYBceP
 M02XL4PQM1TiYW71SKXsn2Ur2YlXd0iyCAEhOd4fAvr/JazoIpUsKNmjyf0Ni6JCCcKO
 7pxB0Pn+7ZUH5KunCEUOb6F/O+SJ9Gms308Iz4L/bVBrKppOYhyW2loCqRXdzIS5KBo7
 R+hLo/RYtlg4VS+ZdP6EH23BDWdpgqinGPjzLjDVYfoK7og0eyFX+gDYPLeJnrZbmP2N
 MJcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=EO1DdjrhtpmWzjh1EvgBT+lYKJFtXbnNZvFnyTdrLr4=;
 b=wy8QdGnq441ooZhMhT+/c+3K0z1hjUc59MgTCZ6yxnMxmDvE/f1c0RRuaP9+z07vpa
 zLpyYX+LEs04EqF9MlMp9S/me7zqvvypxhkkgku5LL9ZL4FDjUxzVWOCRZso6mRKVxKe
 +tl2CkRDt2i90xJSX9H7pyM4jCOruQTwSsQn+UudvCx3Fsu0g/v9m/bX6RefcO/yZY9x
 J3xI4ZJLdRyEsstGKvqq4UhVnAmHqJ/lIOLrfjDX//wewhzkGxtfrnuL/5c1sj45s9Yk
 ndFVZlk2UC7pNzuAaTgem9AlVB6ugSbJeaBQXkjkHLld1rv+HqohF2BJZNs+i3NgXrxd
 d0xw==
X-Gm-Message-State: AOAM5338wwraBnJiIrf4dJDvxtsfu+CXA1vEhF9flj1reIoNXZST1JvF
 VKk3qP/kRGHWpNKJj9k/bBhaPepacVI=
X-Google-Smtp-Source: ABdhPJxzzIeOZb6NcqAHHKw15hpgOp6kx7Tgw+3WfUCiAT/0ER9Qq3B+94h2kbS9kEsVCOMb8KmVqa9KyAg=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:e39b:6333:b001:cb])
 (user=seanjc job=sendgmr) by 2002:a25:22d7:: with SMTP id
 i206mr7801852ybi.355.1633745652715; 
 Fri, 08 Oct 2021 19:14:12 -0700 (PDT)
Date: Fri,  8 Oct 2021 19:12:30 -0700
In-Reply-To: <20211009021236.4122790-1-seanjc@google.com>
Message-Id: <20211009021236.4122790-38-seanjc@google.com>
Mime-Version: 1.0
References: <20211009021236.4122790-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 37/43] KVM: SVM: Unconditionally mark AVIC as running on
 vCPU load (with APICv)
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
X-CRM114-CacheID: sfid-20211008_191414_311403_67A7E1C7 
X-CRM114-Status: GOOD (  21.33  )
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

Always mark the AVIC as "running" on vCPU load when the AVIC is enabled and
drop the vcpu_blocking/unblocking hooks that toggle "running".  There is no
harm in keeping the flag set for a wee bit longer when a vCPU is blocking,
i.e. between the start of blocking and being scheduled out.  At worst, an
agent in the host will unnecessarily signal the doorbell, but that's
already the status quo in KVM as the "running" flag is set the entire time
a vCPU is loaded, not just when it's actively running the guest.

In addition to simplifying the code, keeping the "running" flag set longer
can reduce the number of VM-Exits due to incomplete IPI delivery.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c | 53 +++++++++++++----------------------------
 arch/x86/kvm/svm/svm.c  |  8 -------
 arch/x86/kvm/svm/svm.h  |  3 ---
 3 files changed, 17 insertions(+), 47 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index b43b05610ade..213f5223f63e 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -967,6 +967,15 @@ void avic_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	int h_physical_id = kvm_cpu_get_apicid(cpu);
 	struct vcpu_svm *svm = to_svm(vcpu);
 
+	/* TODO: Document why the unblocking path checks for updates. */
+	if (kvm_vcpu_is_blocking(vcpu) &&
+	    kvm_check_request(KVM_REQ_APICV_UPDATE, vcpu)) {
+		kvm_vcpu_update_apicv(vcpu);
+
+		if (!kvm_vcpu_apicv_active(vcpu))
+			return;
+	}
+
 	/*
 	 * Since the host physical APIC id is 8 bits,
 	 * we can support host APIC ID upto 255.
@@ -974,19 +983,21 @@ void avic_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	if (WARN_ON(h_physical_id > AVIC_PHYSICAL_ID_ENTRY_HOST_PHYSICAL_ID_MASK))
 		return;
 
+	/*
+	 * Unconditionally mark the AVIC as "running", even if the vCPU is in
+	 * kvm_vcpu_block().  kvm_vcpu_check_block() will detect pending IRQs
+	 * and bail out of the block loop, and if not, avic_vcpu_put() will
+	 * set the AVIC back to "not running" when the vCPU is scheduled out.
+	 */
 	entry = READ_ONCE(*(svm->avic_physical_id_cache));
 	WARN_ON(entry & AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK);
 
 	entry &= ~AVIC_PHYSICAL_ID_ENTRY_HOST_PHYSICAL_ID_MASK;
 	entry |= (h_physical_id & AVIC_PHYSICAL_ID_ENTRY_HOST_PHYSICAL_ID_MASK);
-
-	entry &= ~AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK;
-	if (svm->avic_is_running)
-		entry |= AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK;
+	entry |= AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK;
 
 	WRITE_ONCE(*(svm->avic_physical_id_cache), entry);
-	avic_update_iommu_vcpu_affinity(vcpu, h_physical_id,
-					svm->avic_is_running);
+	avic_update_iommu_vcpu_affinity(vcpu, h_physical_id, true);
 }
 
 void avic_vcpu_put(struct kvm_vcpu *vcpu)
@@ -1001,33 +1012,3 @@ void avic_vcpu_put(struct kvm_vcpu *vcpu)
 	entry &= ~AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK;
 	WRITE_ONCE(*(svm->avic_physical_id_cache), entry);
 }
-
-/*
- * This function is called during VCPU halt/unhalt.
- */
-static void avic_set_running(struct kvm_vcpu *vcpu, bool is_run)
-{
-	struct vcpu_svm *svm = to_svm(vcpu);
-
-	svm->avic_is_running = is_run;
-
-	if (!kvm_vcpu_apicv_active(vcpu))
-		return;
-
-	if (is_run)
-		avic_vcpu_load(vcpu, vcpu->cpu);
-	else
-		avic_vcpu_put(vcpu);
-}
-
-void svm_vcpu_blocking(struct kvm_vcpu *vcpu)
-{
-	avic_set_running(vcpu, false);
-}
-
-void svm_vcpu_unblocking(struct kvm_vcpu *vcpu)
-{
-	if (kvm_check_request(KVM_REQ_APICV_UPDATE, vcpu))
-		kvm_vcpu_update_apicv(vcpu);
-	avic_set_running(vcpu, true);
-}
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 89077160d463..a1ca5707f2c8 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -1433,12 +1433,6 @@ static int svm_create_vcpu(struct kvm_vcpu *vcpu)
 	if (err)
 		goto error_free_vmsa_page;
 
-	/* We initialize this flag to true to make sure that the is_running
-	 * bit would be set the first time the vcpu is loaded.
-	 */
-	if (irqchip_in_kernel(vcpu->kvm) && kvm_apicv_activated(vcpu->kvm))
-		svm->avic_is_running = true;
-
 	svm->msrpm = svm_vcpu_alloc_msrpm();
 	if (!svm->msrpm) {
 		err = -ENOMEM;
@@ -4597,8 +4591,6 @@ static struct kvm_x86_ops svm_x86_ops __initdata = {
 	.prepare_guest_switch = svm_prepare_guest_switch,
 	.vcpu_load = svm_vcpu_load,
 	.vcpu_put = svm_vcpu_put,
-	.vcpu_blocking = svm_vcpu_blocking,
-	.vcpu_unblocking = svm_vcpu_unblocking,
 
 	.update_exception_bitmap = svm_update_exception_bitmap,
 	.get_msr_feature = svm_get_msr_feature,
diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
index 7f5b01bbee29..652d71acfb6c 100644
--- a/arch/x86/kvm/svm/svm.h
+++ b/arch/x86/kvm/svm/svm.h
@@ -169,7 +169,6 @@ struct vcpu_svm {
 	u32 dfr_reg;
 	struct page *avic_backing_page;
 	u64 *avic_physical_id_cache;
-	bool avic_is_running;
 
 	/*
 	 * Per-vcpu list of struct amd_svm_iommu_ir:
@@ -529,8 +528,6 @@ int svm_deliver_avic_intr(struct kvm_vcpu *vcpu, int vec);
 bool svm_dy_apicv_has_pending_interrupt(struct kvm_vcpu *vcpu);
 int svm_update_pi_irte(struct kvm *kvm, unsigned int host_irq,
 		       uint32_t guest_irq, bool set);
-void svm_vcpu_blocking(struct kvm_vcpu *vcpu);
-void svm_vcpu_unblocking(struct kvm_vcpu *vcpu);
 
 /* sev.c */
 
-- 
2.33.0.882.g93a45727a2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
