Return-Path: <SRS0=s3kv=O5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49843C433EF
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:36:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BEA760F5A
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:36:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1BEA760F5A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eGkbSkDYoPNx5qy3m0ZJwWl2izhhrs4VdFiQRpMOVgs=; b=Uo+ofDPSgm2rga
	8dNMwRVdzasz1qegXXe7QTxgEPMZLCbszp9Zdbh/wCtkvuAYVk55XThVNbtkw6uh5R/y2TfRwkQPK
	ZQjoAy1FSrBFgpwszy3aP+9UXfwG9HJNXkEm2Q9drCa6oKQCVDYiIdWO6jQZwzRyqvH5E5cOs3eBb
	Bih0qJCzGi7wpPLnne8z/z33cBOhTyU1bv94utprYp8oW1UJ20ALeKcEqmUuNwVY9D3cMxmOV04Og
	qnm2pPA5b8BOPHHOnQAfF4Iy55UQPi4RW3AzfyEucBDv2rGbyhPMWMTVM3EIWyGt/6LIt1x+hzBRa
	UVbGkBYncXKdlMEtaWtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZ2Dh-004dnt-Qt; Sat, 09 Oct 2021 02:36:17 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZ1rl-004UIP-LH
 for linux-riscv@lists.infradead.org; Sat, 09 Oct 2021 02:13:39 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id
 s66-20020a252c45000000b005ba35261459so14458919ybs.7
 for <linux-riscv@lists.infradead.org>; Fri, 08 Oct 2021 19:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=SdOYPzkyfZrBWx1GJeur2Vwb7zEvl7JYNbVbQ0SB2Gg=;
 b=aUvGN/4AFgJcKIBF9LBWgDwhCHQZYEJ03JrconxIXHeAq0mSobvx5eFsN2IhEk7hMF
 07jWDFM9e+ezgnVy0PqTHsU8wjkF0Sq/uHjyc0w84aIFVqAcJRuuc8LQH3WxNpDQiA8J
 1gOwXo6k1Mjhlm2dzNYz4rr2omGOTIv9FMsD0TA3lqfU/1iEz7W8Tub84Aqukc87X1xM
 piXJImDfP3oyBzKVi6TuZiCoM21cARPSFti7XJOcRw2PuPbisGedjpLV+YL9vQi2purC
 N3om2H5mKJxeus7ZcbgIF+EPMNOHqwS7dYW8kbDAw9PWlIpsbYSk0g7cYENwS5oOjCiw
 mX3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=SdOYPzkyfZrBWx1GJeur2Vwb7zEvl7JYNbVbQ0SB2Gg=;
 b=ufPCZFePswg4nsUl26gKMhVmodxqEB4XyU8DU0DkvvF/WYGqiX+D7Udo9e1lWvjEco
 ASBlfGt6ty1fPCTtf4X5BvWJUv9PE1+gkmNBY4Alv6i45my5gFLltD4qFcx0LrlpsiaW
 6Xx0YWlHEjywVWM26mNtGae7wb1GKM8sqd2pCo0RL3+mIZ/lr0557yXOIa3STcQn5/Cu
 c2kVNlR7VaIiuD/omzw89j3zcFpH3GxvncjrpuHqRyxwrnrPBhufq4fjGQx+cQgfz9JD
 BhlFUodSrSzJEIWq4TCyrxX2ZHQu5bFPdUJFTr/3VGCI63Afd+3dzxQZ+bGaT969lEpQ
 MWOw==
X-Gm-Message-State: AOAM531Z1BfovLFqAik6uYhJQKZwkW343fqGvIi7TQKxwL2y8LwY3yCb
 8idfmxoVvbAHD4SzPf/b1p3K9z2nXyc=
X-Google-Smtp-Source: ABdhPJxYoBKdyJNsrFu59iAPxlEnyIVO9cffUZpeFin68SfrlNt2dK+2hwMzncpFoR3FTBopTnOtfheDhwY=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:e39b:6333:b001:cb])
 (user=seanjc job=sendgmr) by 2002:a25:6e06:: with SMTP id
 j6mr7636609ybc.311.1633745615988; 
 Fri, 08 Oct 2021 19:13:35 -0700 (PDT)
Date: Fri,  8 Oct 2021 19:12:15 -0700
In-Reply-To: <20211009021236.4122790-1-seanjc@google.com>
Message-Id: <20211009021236.4122790-23-seanjc@google.com>
Mime-Version: 1.0
References: <20211009021236.4122790-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 22/43] KVM: VMX: Drop unnecessary PI logic to handle
 impossible conditions
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
X-CRM114-CacheID: sfid-20211008_191337_790564_4F2A7735 
X-CRM114-Status: UNSURE (   9.49  )
X-CRM114-Notice: Please train this message.
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

Drop sanity checks on the validity of the previous pCPU when handling
vCPU block/unlock for posted interrupts.  Barring a code bug or memory
corruption, the sanity checks will never fire, and any code bug that does
trip the WARN is all but guaranteed to completely break posted interrupts,
i.e. should never get anywhere near production.

This is the first of several steps toward eliminating kvm_vcpu.pre_cpu.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/posted_intr.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/arch/x86/kvm/vmx/posted_intr.c b/arch/x86/kvm/vmx/posted_intr.c
index 67cbe6ab8f66..6c2110d91b06 100644
--- a/arch/x86/kvm/vmx/posted_intr.c
+++ b/arch/x86/kvm/vmx/posted_intr.c
@@ -118,12 +118,10 @@ static void __pi_post_block(struct kvm_vcpu *vcpu)
 	} while (cmpxchg64(&pi_desc->control, old.control,
 			   new.control) != old.control);
 
-	if (!WARN_ON_ONCE(vcpu->pre_pcpu == -1)) {
-		spin_lock(&per_cpu(blocked_vcpu_on_cpu_lock, vcpu->pre_pcpu));
-		list_del(&vcpu->blocked_vcpu_list);
-		spin_unlock(&per_cpu(blocked_vcpu_on_cpu_lock, vcpu->pre_pcpu));
-		vcpu->pre_pcpu = -1;
-	}
+	spin_lock(&per_cpu(blocked_vcpu_on_cpu_lock, vcpu->pre_pcpu));
+	list_del(&vcpu->blocked_vcpu_list);
+	spin_unlock(&per_cpu(blocked_vcpu_on_cpu_lock, vcpu->pre_pcpu));
+	vcpu->pre_pcpu = -1;
 }
 
 /*
@@ -153,14 +151,12 @@ int pi_pre_block(struct kvm_vcpu *vcpu)
 
 	WARN_ON(irqs_disabled());
 	local_irq_disable();
-	if (!WARN_ON_ONCE(vcpu->pre_pcpu != -1)) {
-		vcpu->pre_pcpu = vcpu->cpu;
-		spin_lock(&per_cpu(blocked_vcpu_on_cpu_lock, vcpu->pre_pcpu));
-		list_add_tail(&vcpu->blocked_vcpu_list,
-			      &per_cpu(blocked_vcpu_on_cpu,
-				       vcpu->pre_pcpu));
-		spin_unlock(&per_cpu(blocked_vcpu_on_cpu_lock, vcpu->pre_pcpu));
-	}
+
+	vcpu->pre_pcpu = vcpu->cpu;
+	spin_lock(&per_cpu(blocked_vcpu_on_cpu_lock, vcpu->pre_pcpu));
+	list_add_tail(&vcpu->blocked_vcpu_list,
+		      &per_cpu(blocked_vcpu_on_cpu, vcpu->pre_pcpu));
+	spin_unlock(&per_cpu(blocked_vcpu_on_cpu_lock, vcpu->pre_pcpu));
 
 	WARN(pi_desc->sn == 1,
 	     "Posted Interrupt Suppress Notification set before blocking");
-- 
2.33.0.882.g93a45727a2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
