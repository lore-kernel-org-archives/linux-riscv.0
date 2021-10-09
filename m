Return-Path: <SRS0=s3kv=O5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78A77C433EF
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:17:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B58960F90
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:17:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4B58960F90
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Ldu3zhVQYhuocEQjLvJI91LPnNVAb4HDEVmhjEZ14g=; b=qs58c43I+1673M
	F55VinpwpZOQZOUgi3vzJ/Tl+rL/0RprZU5F7rwVECOVXfrKfNPC5JfcpTMx/m3xCcb1ZTOsqX19k
	/RuaQJ7NxvUcEe/eGxVuyOHRsJPnXnPchTM/bggeYc1JSubjUWA7pfoWCZJ5gpySj2hW0z7sD87dL
	eTooBHTwHDEH/NHcP1e2kc9dqO2P9kFv0yMLQ7U6XaGuCn/1ZXtEN/zEiJoKspe1vPbIDqSss6J+G
	Cy2pAcHX13ZmxUONHDpDwLjsl1KmVEk/4Y812P+CrcosN3j7dOGa/AJtbrysXWpOlZAKDmaAb2L/2
	/i/Ausz+QONsjZzqFJpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZ1vX-004WVM-Di; Sat, 09 Oct 2021 02:17:31 +0000
Received: from mail-qk1-x749.google.com ([2607:f8b0:4864:20::749])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZ1rD-004Tum-0G
 for linux-riscv@lists.infradead.org; Sat, 09 Oct 2021 02:13:04 +0000
Received: by mail-qk1-x749.google.com with SMTP id
 bm12-20020a05620a198c00b00432e14ddb99so9746073qkb.21
 for <linux-riscv@lists.infradead.org>; Fri, 08 Oct 2021 19:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=W7si8hyBuDcp1dRXujL6OsjQExomH1E+fqXnahmPoDg=;
 b=aOVayCn6ej6FxmmrHt2sU4373bV7AgGsudgxlqChxKNBKeRvLn96S5TTWXhl5ULPJk
 I6iByFgjio/SidNywR7tnUGCRvSDXMEtfg0wpwAATih5seZXq+QX1sQoTghgk9QHQB57
 9ciB8V1aON0p6mmmnPOJ6EOL7AvSBtzp/rM+Pa2gx/RTljJgt7PpcpYhy/Qeqj3D6m5L
 wMWuAky/wekhi60e5vPGB9DlvsoJ6WhNX1rDvrD4Mdh5h3FUJIFjNxaS/4ltVuEBwBOD
 3ZYnQpGBK4gqS0MSsSW1ri3MD09TSEw2EHYYwemAOuNZ4Mo8BpFRTOjf8EBWWgJpnE4g
 pPUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=W7si8hyBuDcp1dRXujL6OsjQExomH1E+fqXnahmPoDg=;
 b=M0biensvKM2W+pLuqwNwwMvUGVtFMAhaxZXzkoGLKN6+zWbKYFxZI+LRKdXZGKE1HM
 83+gGc3NnMBtmHuyDJIPQvaduRdGIAlCvnSKo6GMtOyEwMr0zRdJYAZuVqo5Kqd2yGYf
 uxNjetBVyfTJK2MfgtDAS/v5PrP9Ny5t/It8F1iRU25xjOYu2jAD9kViuL7h0bgwoLrR
 9guL+yVWtL52M/2f7oSTpAqlU/oEcacPFHvoNaqFjMcZQijdSGEvhVzsjwgsyzDlZafT
 eytPr+YdM62eNyZ2kOya2qbLnweLobJuR3PvlJF0iw5iJUeNd/oUu6zH8PSwQhIbA6zW
 zuqg==
X-Gm-Message-State: AOAM531EXMCxWyNerPcKa/FxHcuh1o0oXw/ZMVZ2FcF0aNZSBaySX2Oi
 satwrPX/w1qkg6jfE0M/r/tE58hAwg4=
X-Google-Smtp-Source: ABdhPJwDz7eOExNK6QVdxoBv7GDWAS3HydxP9exQUahtOx0TYXHuOmh7cJR1yTxOnJ8gdBtj54I2n5FqkLI=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:e39b:6333:b001:cb])
 (user=seanjc job=sendgmr) by 2002:ac8:5682:: with SMTP id
 h2mr1879396qta.361.1633745581703; 
 Fri, 08 Oct 2021 19:13:01 -0700 (PDT)
Date: Fri,  8 Oct 2021 19:12:01 -0700
In-Reply-To: <20211009021236.4122790-1-seanjc@google.com>
Message-Id: <20211009021236.4122790-9-seanjc@google.com>
Mime-Version: 1.0
References: <20211009021236.4122790-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 08/43] KVM: s390: Clear valid_wakeup in
 kvm_s390_handle_wait(), not in arch hook
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
X-CRM114-CacheID: sfid-20211008_191303_082035_81AD106A 
X-CRM114-Status: GOOD (  11.29  )
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

Move the clearing of valid_wakeup from kvm_arch_vcpu_block_finish() so
that a future patch can drop said arch hook.  Unlike the other blocking-
related arch hooks, vcpu_blocking/unblocking(), vcpu_block_finish() needs
to be called even if the KVM doesn't actually block the vCPU.  This will
allow future patches to differentiate between truly blocking the vCPU and
emulating a halt condition without introducing a contradiction.

Alternatively, the hook could be renamed to kvm_arch_vcpu_halt_finish(),
but there's literally one call site in s390, and future cleanup can also
be done to handle valid_wakeup fully within kvm_s390_handle_wait() and
allow generic KVM to drop vcpu_valid_wakeup().

No functional change intended.

Reviewed-by: Christian Borntraeger <borntraeger@de.ibm.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/s390/kvm/interrupt.c | 1 +
 arch/s390/kvm/kvm-s390.c  | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/s390/kvm/interrupt.c b/arch/s390/kvm/interrupt.c
index 10722455fd02..520450a7956f 100644
--- a/arch/s390/kvm/interrupt.c
+++ b/arch/s390/kvm/interrupt.c
@@ -1336,6 +1336,7 @@ int kvm_s390_handle_wait(struct kvm_vcpu *vcpu)
 no_timer:
 	srcu_read_unlock(&vcpu->kvm->srcu, vcpu->srcu_idx);
 	kvm_vcpu_block(vcpu);
+	vcpu->valid_wakeup = false;
 	__unset_cpu_idle(vcpu);
 	vcpu->srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
 
diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index 7cabe6778b1b..08ed68639a21 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -5082,7 +5082,7 @@ static inline unsigned long nonhyp_mask(int i)
 
 void kvm_arch_vcpu_block_finish(struct kvm_vcpu *vcpu)
 {
-	vcpu->valid_wakeup = false;
+
 }
 
 static int __init kvm_s390_init(void)
-- 
2.33.0.882.g93a45727a2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
