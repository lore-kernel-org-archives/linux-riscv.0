Return-Path: <SRS0=s3kv=O5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E7A8C433EF
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:38:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9A9A60F5A
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:38:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E9A9A60F5A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nv/W+8ytPuDC/n9kbD1ifuHk9t1TfEYJ397yKGwXTCk=; b=x0460bLsr4kj0Q
	TPdKMrmXB7Y4Q6xyli8CtcqpWiLy1wD+M01V41JKljIPf7Tm7H6pLF2kdHhSEoXyjbqT1ztlUYKt3
	+KFcJqaSrQkthyVw4eKU+mQxw/oHh56C3jGLR3C2tHWjRFLzF+oEk2L2v+eIpJ5lIlBCs6VQykXG/
	syhUqV137ECnecLDboS6XB5aZ662PuJ7VJM2dmdt3to+lhoMGSnOVeahOUdpjOQX4lUIl10aitEyz
	wqDXnXSZ2MK8jhJMtspy02By5TSpm5L/UwWilf9vodoAwCqmMNp/8mGhgrkZpk6GVq8Ov2Tloz5aA
	AWHy7QJeb3iSV0p6WA1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZ2F7-004ePN-33; Sat, 09 Oct 2021 02:37:45 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZ1rq-004ULh-LP
 for linux-riscv@lists.infradead.org; Sat, 09 Oct 2021 02:13:44 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id
 i83-20020a252256000000b005b67a878f56so15033015ybi.17
 for <linux-riscv@lists.infradead.org>; Fri, 08 Oct 2021 19:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=p2AXaXCXfG3zJ1FL308pQbveOpDqWTdi8iqec5R3ilA=;
 b=ghMBthmudSXs+6+p6LKZCK4H0OHszDcUTjjC8eI9oFe5NKEBgV82EMdibCOuqO9Vxj
 RdWrTXr3jIuis42ImlAoRzWDoHFdmCVkvhr7Ak9ohTH6uYw/wAChiBME+5gVCVNAgppx
 Bau/vxHhIQUy9RpDE2jA3YK9PywakgEEGvf08OG/9sd3zh0sXBu7t3verDPFwVmZOBV6
 6EvsyuVx5W4cXQ42SL97ee8aY4sDaFqLd/c+4qYy3T18FOiClCY3egvkUGNfWDUIncUQ
 g+5hQtAw8uYrvtob8ZWh/HS1msNf2yq2NMlMufCxgAu3+fQ5cHcaqEQ/AFlCCc3jp+BF
 /aSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=p2AXaXCXfG3zJ1FL308pQbveOpDqWTdi8iqec5R3ilA=;
 b=l49o6Mr4U6/mqsgbfoalNKNmR0xPK3UNCkDFwxts+jOzpX+0COtUokLMHA3iZw1tji
 KnUMmqCeEwDFPUz7NM+wrDFYD/DLSrNYqrWy0dwSWmweq1zkKLccLl28XcNuHdxEnTVa
 MVsGvCDd205crQJ3CPiZ5TzzwGBTs6UnEl7wj2AVF65Z/3cMnNu9B9kzRhyZAViNBXwL
 QOhscYCJBTsnNH0VVlS9G4moyivdvEv7lQENPMIr8Xj4F9DFSTpYDtKBPxVFe3/dK5Jj
 IYrsWcobhl0mGQB62aC2gJUpN2ltBkb7S8eA0R+m4e86eSQTv+VWZv/DIWjWG99AQF37
 Q29Q==
X-Gm-Message-State: AOAM530eRpdSRgKx+MeP6x9Xau0r4KtKsjraeDFV8LnrAGKRhm0YmJez
 Xl4N8nqk7hyOpbDZz5FxnYcBYBTJg7k=
X-Google-Smtp-Source: ABdhPJx6Bv/qxNdoBxYiPnsjWrMq4fbR1wONeQsZ0IiCsamqBbWFWlGuin3sFq5D1af73AaAZ7aulEVU00Y=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:e39b:6333:b001:cb])
 (user=seanjc job=sendgmr) by 2002:a25:8b06:: with SMTP id
 i6mr7491785ybl.427.1633745621082; 
 Fri, 08 Oct 2021 19:13:41 -0700 (PDT)
Date: Fri,  8 Oct 2021 19:12:17 -0700
In-Reply-To: <20211009021236.4122790-1-seanjc@google.com>
Message-Id: <20211009021236.4122790-25-seanjc@google.com>
Mime-Version: 1.0
References: <20211009021236.4122790-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 24/43] KVM: VMX: Drop pointless PI.NDST update when blocking
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
X-CRM114-CacheID: sfid-20211008_191342_744439_B94C44B7 
X-CRM114-Status: GOOD (  15.46  )
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

Don't update Posted Interrupt's NDST, a.k.a. the target pCPU, in the
pre-block path, as NDST is guaranteed to be up-to-date.  The comment
about the vCPU being preempted during the update is simply wrong, as the
update path runs with IRQs disabled (from before snapshotting vcpu->cpu,
until after the update completes).

The vCPU can get preempted _before_ the update starts, but not during.
And if the vCPU is preempted before, vmx_vcpu_pi_load() is responsible
for updating NDST when the vCPU is scheduled back in.  In that case, the
check against the wakeup vector in vmx_vcpu_pi_load() cannot be true as
that would require the notification vector to have been set to the wakeup
vector _before_ blocking.

Opportunistically switch to using vcpu->cpu for the list/lock lookups,
which presumably used pre_pcpu only for some phantom preemption logic.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/posted_intr.c | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/arch/x86/kvm/vmx/posted_intr.c b/arch/x86/kvm/vmx/posted_intr.c
index 1688f8dc535a..239e0e72a0dd 100644
--- a/arch/x86/kvm/vmx/posted_intr.c
+++ b/arch/x86/kvm/vmx/posted_intr.c
@@ -130,7 +130,6 @@ static void __pi_post_block(struct kvm_vcpu *vcpu)
  * - Store the vCPU to the wakeup list, so when interrupts happen
  *   we can find the right vCPU to wake up.
  * - Change the Posted-interrupt descriptor as below:
- *      'NDST' <-- vcpu->pre_pcpu
  *      'NV' <-- POSTED_INTR_WAKEUP_VECTOR
  * - If 'ON' is set during this process, which means at least one
  *   interrupt is posted for this vCPU, we cannot block it, in
@@ -139,7 +138,6 @@ static void __pi_post_block(struct kvm_vcpu *vcpu)
  */
 int pi_pre_block(struct kvm_vcpu *vcpu)
 {
-	unsigned int dest;
 	struct pi_desc old, new;
 	struct pi_desc *pi_desc = vcpu_to_pi_desc(vcpu);
 
@@ -153,10 +151,10 @@ int pi_pre_block(struct kvm_vcpu *vcpu)
 	local_irq_disable();
 
 	vcpu->pre_pcpu = vcpu->cpu;
-	spin_lock(&per_cpu(blocked_vcpu_on_cpu_lock, vcpu->pre_pcpu));
+	spin_lock(&per_cpu(blocked_vcpu_on_cpu_lock, vcpu->cpu));
 	list_add_tail(&vcpu->blocked_vcpu_list,
-		      &per_cpu(blocked_vcpu_on_cpu, vcpu->pre_pcpu));
-	spin_unlock(&per_cpu(blocked_vcpu_on_cpu_lock, vcpu->pre_pcpu));
+		      &per_cpu(blocked_vcpu_on_cpu, vcpu->cpu));
+	spin_unlock(&per_cpu(blocked_vcpu_on_cpu_lock, vcpu->cpu));
 
 	WARN(pi_desc->sn == 1,
 	     "Posted Interrupt Suppress Notification set before blocking");
@@ -164,21 +162,6 @@ int pi_pre_block(struct kvm_vcpu *vcpu)
 	do {
 		old.control = new.control = pi_desc->control;
 
-		/*
-		 * Since vCPU can be preempted during this process,
-		 * vcpu->cpu could be different with pre_pcpu, we
-		 * need to set pre_pcpu as the destination of wakeup
-		 * notification event, then we can find the right vCPU
-		 * to wakeup in wakeup handler if interrupts happen
-		 * when the vCPU is in blocked state.
-		 */
-		dest = cpu_physical_id(vcpu->pre_pcpu);
-
-		if (x2apic_mode)
-			new.ndst = dest;
-		else
-			new.ndst = (dest << 8) & 0xFF00;
-
 		/* set 'NV' to 'wakeup vector' */
 		new.nv = POSTED_INTR_WAKEUP_VECTOR;
 	} while (cmpxchg64(&pi_desc->control, old.control,
-- 
2.33.0.882.g93a45727a2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
