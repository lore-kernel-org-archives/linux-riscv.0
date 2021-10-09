Return-Path: <SRS0=s3kv=O5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8FD0C433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:34:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B213960D07
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:34:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B213960D07
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rBjwk73OU576BDbD6/0vubfuX4RYpnBVUSFc5Z7BRlA=; b=zNVQVG1xYAYhN7
	Qz1y8NB/R3Y3/7O3S/TxP+I1LbbBCXGctADaF65rowU4cXigGMnnq8BoHW7EY5L294+csfpmfy8rh
	UPBsV/MfdAaJyKTveaLsYFpX9rOaaWNDCNKxF15d1Rh8+mlk7LBy+sXtofV49vsNQ/wsgj0I3Za5f
	FUn6a8cXbVEEGURmhmajdr9Tv1IlCLDxDeT9R/hcUIm2Sw31+X3JP8b1Z+onb2HNJlJYUOfvJMqu2
	TSig6YsqQ5xSeXS2oD73/kn5mLTf7oVvo6OyjXZ772O0Eesop+Cn9wYhc6nyy+kYNgbuVMQbXwPDD
	TwKa9Jm3kgXuc48Hq4gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZ2Bi-004d2P-1x; Sat, 09 Oct 2021 02:34:14 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZ1rj-004UGV-8g
 for linux-riscv@lists.infradead.org; Sat, 09 Oct 2021 02:13:37 +0000
Received: by mail-yb1-xb49.google.com with SMTP id
 f8-20020a2585480000b02905937897e3daso15198830ybn.2
 for <linux-riscv@lists.infradead.org>; Fri, 08 Oct 2021 19:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=pLGnZNeCj1eofs1Tna8HvgfHGGH+OqNXhSkcDhwkBIw=;
 b=VRo08TCu54WXCeWvaUHt/sk2e0vGE+t23O2jGFtKJrC8szlW29PyUVg9qa1gFeA7l/
 xEskdCWXRSlglDPxzwJpI+hnS34D4TzLDKLZZJDH+vXneZUjJrJ2p6jMQ4+6yNusBF7P
 6CJ8/rSwneH/NW0dEbzJkjR/ZnaiFW04wA6ydEJsYBVq9hwfsxkAk8UtewwAEpUXkOH2
 gElF5Vx854/uDHSVGxe/9WkMnKTFMH6pK6EPC77dq53/WUYVeZkuMvVYcngIplHzpqzD
 mk15NWKmGwkAbgPYO3UA0b2d7qx8J738ZHLocYz+9s5CV0wLJv0e5T4wx+Q9y63P5xIW
 pwMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=pLGnZNeCj1eofs1Tna8HvgfHGGH+OqNXhSkcDhwkBIw=;
 b=GueUs5+ywvG6tQa5v7bSddeIhYdYrvTBCkt6vIg3svWRxCPwljSBFz6tuSd3pXivAF
 HJJ/baVD3Ot8FLOCv7LARBfhQVha/vAdWeM3TmS19Zuj24/tnYL+UL0aWFLETDyRjhoL
 H+PcljuaOpMTvwbgYCRnAd48x7yJQGQnkLNoEMx17VXKfmftJ1K4oMGiFo2s1AtN1Lzp
 irI4fzKcrZhrKx/DkDeTQW5jPyQyfkJRaauc28gH0zThdRMY4IyeXmWSu3aCzCeulxzP
 cHOCxpgNbe1iUaUp8XSEHRuoyikUaIKCCG6lQXc2Y1dMVA1vV9J6nqOsqdGyQiluHHP/
 YYKw==
X-Gm-Message-State: AOAM533xwnMWVtRWgjITlGt76ZCIDyoWD3ORinVUjPeTfiOR6xCdQIBW
 AZcoQ8ZLaHhKnArsqwz//g0ZVfH9+0M=
X-Google-Smtp-Source: ABdhPJz4iSAfPQRljp1PNlRsP2+bvwjiNJU4qxRXVZchtwSA9sdFFYFZ7ZvHA8l7ONDMJR0uzV+kR3cYKVg=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:e39b:6333:b001:cb])
 (user=seanjc job=sendgmr) by 2002:a25:1b86:: with SMTP id
 b128mr7765690ybb.20.1633745613685; 
 Fri, 08 Oct 2021 19:13:33 -0700 (PDT)
Date: Fri,  8 Oct 2021 19:12:14 -0700
In-Reply-To: <20211009021236.4122790-1-seanjc@google.com>
Message-Id: <20211009021236.4122790-22-seanjc@google.com>
Mime-Version: 1.0
References: <20211009021236.4122790-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 21/43] KVM: VMX: Clean up PI pre/post-block WARNs
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
X-CRM114-CacheID: sfid-20211008_191335_358833_9312BCFF 
X-CRM114-Status: GOOD (  10.71  )
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

Move the WARN sanity checks out of the PI descriptor update loop so as
not to spam the kernel log if the condition is violated and the update
takes multiple attempts due to another writer.  This also eliminates a
few extra uops from the retry path.

Technically not checking every attempt could mean KVM will now fail to
WARN in a scenario that would have failed before, but any such failure
would be inherently racy as some other agent (CPU or device) would have
to concurrent modify the PI descriptor.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/posted_intr.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/vmx/posted_intr.c b/arch/x86/kvm/vmx/posted_intr.c
index 351666c41bbc..67cbe6ab8f66 100644
--- a/arch/x86/kvm/vmx/posted_intr.c
+++ b/arch/x86/kvm/vmx/posted_intr.c
@@ -100,10 +100,11 @@ static void __pi_post_block(struct kvm_vcpu *vcpu)
 	struct pi_desc old, new;
 	unsigned int dest;
 
+	WARN(pi_desc->nv != POSTED_INTR_WAKEUP_VECTOR,
+	     "Wakeup handler not enabled while the vCPU was blocking");
+
 	do {
 		old.control = new.control = pi_desc->control;
-		WARN(old.nv != POSTED_INTR_WAKEUP_VECTOR,
-		     "Wakeup handler not enabled while the VCPU is blocked\n");
 
 		dest = cpu_physical_id(vcpu->cpu);
 
@@ -161,13 +162,12 @@ int pi_pre_block(struct kvm_vcpu *vcpu)
 		spin_unlock(&per_cpu(blocked_vcpu_on_cpu_lock, vcpu->pre_pcpu));
 	}
 
+	WARN(pi_desc->sn == 1,
+	     "Posted Interrupt Suppress Notification set before blocking");
+
 	do {
 		old.control = new.control = pi_desc->control;
 
-		WARN((pi_desc->sn == 1),
-		     "Warning: SN field of posted-interrupts "
-		     "is set before blocking\n");
-
 		/*
 		 * Since vCPU can be preempted during this process,
 		 * vcpu->cpu could be different with pre_pcpu, we
-- 
2.33.0.882.g93a45727a2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
