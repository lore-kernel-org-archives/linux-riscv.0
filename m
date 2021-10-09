Return-Path: <SRS0=s3kv=O5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48F70C433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:39:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED18060F5C
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:39:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ED18060F5C
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gulm4YfdSaR4NhEMX95DPEkLKGq5DLtlNfw+TGozMIM=; b=xdZO+XL3tk59eK
	5+H59+tio5VxxQ5BqUcwjtp5KLSr3lYVKMF9Jv0OTvtb2Dk3Sgm8Sqn/W7Oj6maRvtDUT4J+9swqL
	cAd2cya1A5jTYeQ8xjST8ub6+Z5HXMdcBJvPlWscHk/MTiabVdrr3LGCEdZu+7EDwJUG76wFqY6+F
	AZvCogjaPAFtoP56oC+kIbrAanPoUe+UTkeiEaVkXNdY1zrrK0e7PE0wcLA0B5BnMqoXda6jYlXt0
	Jq07mmFoPzPf9/rdUxoDXBVb2Mi5lt1pNDGKOtoWU94LImVtKc+m3sPawkQ/lYB0xNTykhs/U8OvX
	u7zt6gWpM+zWhYrpwVDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZ2GJ-004evu-2u; Sat, 09 Oct 2021 02:38:59 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZ1rt-004UNP-6f
 for linux-riscv@lists.infradead.org; Sat, 09 Oct 2021 02:13:46 +0000
Received: by mail-yb1-xb49.google.com with SMTP id
 i83-20020a256d56000000b005b706d1417bso15032372ybc.6
 for <linux-riscv@lists.infradead.org>; Fri, 08 Oct 2021 19:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=sIQRe0bn32KEKwbOVvtx42Ei92aBPRnG0u1z9yXF7CE=;
 b=L08kypVluCyFKbpY0oUWWIYegtRsmlesq0wNJKsfeI8a+xUhccbxmouLf27lMOIMO9
 m9aDG4U98QItV5Ohy31bYubmFprE/QZuQESLgVJSjhpfU/yNgKP/78Q9UuOg6rzwLHC0
 I4lwz0lK7D60KgROmr99XXMz1SfThZEdbn4DKl+Bq52u94Dtdh0Eotn9sUFXLmNXNTbw
 6AcWYEC/LOtNjiY9B+NbBHy51wS3Qc+ABq6bMsBOBRird64iFAtM2ABnk7IiuRD0HQUk
 sjoVTJNAcXG0HP9OnEd8LwZlRBWZpFzxibDplRt3XRCh0O4+qvRQnekLDqaQSXwlvM/O
 WhoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=sIQRe0bn32KEKwbOVvtx42Ei92aBPRnG0u1z9yXF7CE=;
 b=DZ+dsY1D3NnxVHi0z/w0lbYapwfUUB8zMnAyZfVr/scGNMs+6480bhLvEOyMLquuLA
 0LL0pHLt6AsiMrMP8sA/9Dm7Nv2QfnJuWGdbQVFGZ52cyQoa/wqYmZYQenDhIJclUJVm
 EoRVXkcGai3Df9RCYon5kNCBrWwyJNTCDBJQ898duQ+DVjpB/Lws8B3iqSfnm/CmWvGS
 WiQ6sl9kNygrGpQI5klz+GaxbjcvbFGxVFK8u967imKpYZIGR6NSYlPUbhGSkysrWW7I
 9BlLJwhSVTkEeCb+aK5j81Bl+HiYT5mGtcTi8NXnvBB5vz2XwqQa7sV789FS4e2ZA+Zk
 A2dw==
X-Gm-Message-State: AOAM530lloK9Q3dKY5q+9DLZW93o4De4V38E2dKFgzj8UJAaqHrOMMX1
 Baj5FSy3UPs2i7BawRAgtbflKw8HBA4=
X-Google-Smtp-Source: ABdhPJwLBmcqJzHPV5bzQgN7SUGs2wP/5HXQxp4+zEmbtDKAgC6fngbLUg0PIYqYm/p4aFsJ/BNsgFl1S/s=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:e39b:6333:b001:cb])
 (user=seanjc job=sendgmr) by 2002:a25:393:: with SMTP id
 141mr7017004ybd.534.1633745623429; 
 Fri, 08 Oct 2021 19:13:43 -0700 (PDT)
Date: Fri,  8 Oct 2021 19:12:18 -0700
In-Reply-To: <20211009021236.4122790-1-seanjc@google.com>
Message-Id: <20211009021236.4122790-26-seanjc@google.com>
Mime-Version: 1.0
References: <20211009021236.4122790-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 25/43] KVM: VMX: Save/restore IRQs (instead of CLI/STI)
 during PI pre/post block
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
X-CRM114-CacheID: sfid-20211008_191345_338950_5EF0EB73 
X-CRM114-Status: UNSURE (   9.39  )
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

Save/restore IRQs when disabling IRQs in posted interrupt pre/post block
in preparation for moving the code into vcpu_put/load(), and thus may be
called with IRQs already disabled.

No functional changed intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/posted_intr.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/vmx/posted_intr.c b/arch/x86/kvm/vmx/posted_intr.c
index 239e0e72a0dd..414ea6972b5c 100644
--- a/arch/x86/kvm/vmx/posted_intr.c
+++ b/arch/x86/kvm/vmx/posted_intr.c
@@ -140,6 +140,7 @@ int pi_pre_block(struct kvm_vcpu *vcpu)
 {
 	struct pi_desc old, new;
 	struct pi_desc *pi_desc = vcpu_to_pi_desc(vcpu);
+	unsigned long flags;
 
 	if (!kvm_arch_has_assigned_device(vcpu->kvm) ||
 	    !irq_remapping_cap(IRQ_POSTING_CAP) ||
@@ -147,8 +148,7 @@ int pi_pre_block(struct kvm_vcpu *vcpu)
 	    vmx_interrupt_blocked(vcpu))
 		return 0;
 
-	WARN_ON(irqs_disabled());
-	local_irq_disable();
+	local_irq_save(flags);
 
 	vcpu->pre_pcpu = vcpu->cpu;
 	spin_lock(&per_cpu(blocked_vcpu_on_cpu_lock, vcpu->cpu));
@@ -171,19 +171,20 @@ int pi_pre_block(struct kvm_vcpu *vcpu)
 	if (pi_test_on(pi_desc))
 		__pi_post_block(vcpu);
 
-	local_irq_enable();
+	local_irq_restore(flags);
 	return (vcpu->pre_pcpu == -1);
 }
 
 void pi_post_block(struct kvm_vcpu *vcpu)
 {
+	unsigned long flags;
+
 	if (vcpu->pre_pcpu == -1)
 		return;
 
-	WARN_ON(irqs_disabled());
-	local_irq_disable();
+	local_irq_save(flags);
 	__pi_post_block(vcpu);
-	local_irq_enable();
+	local_irq_restore(flags);
 }
 
 /*
-- 
2.33.0.882.g93a45727a2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
