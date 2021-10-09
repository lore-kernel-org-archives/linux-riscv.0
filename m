Return-Path: <SRS0=s3kv=O5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ACCDC433EF
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:42:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD9B460EFE
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:42:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BD9B460EFE
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qmwRex2OcODbL7RCq2LAD1nb2eZ/9sUGODIIs0S/tAc=; b=G8ZPRduIrVtycJ
	Qd+ExV82S9aNFB2AxEjCWcPnxsVYYPR5Csw6HT7ivPE6nfdRwQM8ualVTIntCsEkDsB/lq/0qtlWQ
	gxmPjXyZ92Aja7wsHwXLsmIU9iXIEImNI6nL7UFLI4KMJh474OFuRZV4YCmwVYXWcO/tO/9+n4yFd
	NBTjI9YoTOfEAp2R/IIQdkT3/i1OJIyoAgQiF1xUPC5DqG/5aVqjiXRVx7BC3A+p7jRFyeszRqNqu
	HDQjvZ+8N6B6u01MN9ucNJ0/U5BcV+cToaDYz8oOGuhxrJIAvJXSl68zlUlIu+sPLO7TuPwQIiVxb
	bekVGKIiz6abxsihT5lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZ2JX-004g8u-UZ; Sat, 09 Oct 2021 02:42:20 +0000
Received: from mail-qk1-x74a.google.com ([2607:f8b0:4864:20::74a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZ1rx-004UQn-Qx
 for linux-riscv@lists.infradead.org; Sat, 09 Oct 2021 02:13:52 +0000
Received: by mail-qk1-x74a.google.com with SMTP id
 c14-20020a37e10e000000b0045f3f44539eso3145321qkm.14
 for <linux-riscv@lists.infradead.org>; Fri, 08 Oct 2021 19:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=wjQtX4Ec6wZvrLi6PMkrNqIQ2oyMcPdDf1m/MoA8d+0=;
 b=Lnm/cjPXbd272GpMZC0UeDF+UHTqiJU1haGCknMr5AmNFQOxgzVQrkCrFXx8cCosZZ
 vhad/H/bU6EtWHdiaGljqq6NEDe4jYwnagw1hmypkZVWw7KopTXWbIioXhrKeB9WZIoL
 ReDT+1R5eLOhM0x5my19UH6pmlRFdnAMJjCjW90ue2a+3KqjCQ5KVltKsfzvFJct3Or4
 f9Oft1KiecdRxszaICFl0MAY6x3TalLjCr4OG45jGmzTw8bdrlGkucMOEXd/i271jan6
 0hz+LH0reRdSJS/sNXpSqjCOVK3W+uTEL9F4YDHRKI7A05LpPRMlHE+Kaw+W+rV3UGa5
 UrVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=wjQtX4Ec6wZvrLi6PMkrNqIQ2oyMcPdDf1m/MoA8d+0=;
 b=6c8QyF5O/Lc311vD6f2t9X49K/tc25s7edu2BriWxFBkVkqvWLGUm3vto1uPAfhUyp
 PqgsznQ4eCrlqWzvCBrGXqV3M6ooR+zxvY35s2X2Ih6eUkXuyHtRkwA17hpD+LsEj815
 eG/pMhmT+DxTIAuEJcecEYWFn1G8bpklen4bTv+46M1crRy6mWf35tqySntDlmnn9wpl
 CRg0uPsAKA5FcnJF82dowMnsQnkHIVjC3BtR4n9pVFHK1yKYg+0LZy8btkfyZi46jlLO
 wUpR5sKbBquYpqtqwx68umkmA0QUpTA000XMfSPulCCYQ5GZbo1BhPVbvZ9MqjSUCfAI
 EWsw==
X-Gm-Message-State: AOAM531gh1E9B6m2wE09kNOpRm3e6B990Fpv7cmvnT52SNt/WTDDb98P
 3Wo4G2Kp1agtLo5dOLGpWhmtEiyRckQ=
X-Google-Smtp-Source: ABdhPJzf4lH44KnogukwF+1XfgXVpbO4vnuwdh3pwX1cj7Z8+jmbGSLZhM6YPlZ7b6MhcrCUeQd2OdsxOQw=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:e39b:6333:b001:cb])
 (user=seanjc job=sendgmr) by 2002:ac8:6113:: with SMTP id
 a19mr1849269qtm.307.1633745628357; 
 Fri, 08 Oct 2021 19:13:48 -0700 (PDT)
Date: Fri,  8 Oct 2021 19:12:20 -0700
In-Reply-To: <20211009021236.4122790-1-seanjc@google.com>
Message-Id: <20211009021236.4122790-28-seanjc@google.com>
Mime-Version: 1.0
References: <20211009021236.4122790-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 27/43] KVM: VMX: Move Posted Interrupt ndst computation out
 of write loop
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
X-CRM114-CacheID: sfid-20211008_191349_954783_D8D5855B 
X-CRM114-Status: GOOD (  10.74  )
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

Hoist the CPU => APIC ID conversion for the Posted Interrupt descriptor
out of the loop to write the descriptor, preemption is disabled so the
CPU won't change, and if the APIC ID changes KVM has bigger problems.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/posted_intr.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/arch/x86/kvm/vmx/posted_intr.c b/arch/x86/kvm/vmx/posted_intr.c
index fea343dcc011..2b2206339174 100644
--- a/arch/x86/kvm/vmx/posted_intr.c
+++ b/arch/x86/kvm/vmx/posted_intr.c
@@ -51,17 +51,15 @@ void vmx_vcpu_pi_load(struct kvm_vcpu *vcpu, int cpu)
 		goto after_clear_sn;
 	}
 
-	/* The full case.  */
+	/* The full case.  Set the new destination and clear SN. */
+	dest = cpu_physical_id(cpu);
+	if (!x2apic_mode)
+		dest = (dest << 8) & 0xFF00;
+
 	do {
 		old.control = new.control = READ_ONCE(pi_desc->control);
 
-		dest = cpu_physical_id(cpu);
-
-		if (x2apic_mode)
-			new.ndst = dest;
-		else
-			new.ndst = (dest << 8) & 0xFF00;
-
+		new.ndst = dest;
 		new.sn = 0;
 	} while (cmpxchg64(&pi_desc->control, old.control,
 			   new.control) != old.control);
@@ -103,15 +101,14 @@ static void __pi_post_block(struct kvm_vcpu *vcpu)
 	WARN(pi_desc->nv != POSTED_INTR_WAKEUP_VECTOR,
 	     "Wakeup handler not enabled while the vCPU was blocking");
 
+	dest = cpu_physical_id(vcpu->cpu);
+	if (!x2apic_mode)
+		dest = (dest << 8) & 0xFF00;
+
 	do {
 		old.control = new.control = READ_ONCE(pi_desc->control);
 
-		dest = cpu_physical_id(vcpu->cpu);
-
-		if (x2apic_mode)
-			new.ndst = dest;
-		else
-			new.ndst = (dest << 8) & 0xFF00;
+		new.ndst = dest;
 
 		/* set 'NV' to 'notification vector' */
 		new.nv = POSTED_INTR_VECTOR;
-- 
2.33.0.882.g93a45727a2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
