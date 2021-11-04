Return-Path: <SRS0=Owia=PX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 603A2C433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 00:53:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1918060EB9
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 00:53:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1918060EB9
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mSpXQfOVlCuivspaKhPv3PmoIjsKOGFOdmcZl31Pt9A=; b=Rpq/W7iprHaK9A
	HV668/kcEVOT2wJZmfixOZ0wJ+qq8/o4tf0Tj6GJVLY3AWxK72F1uFpN2nWSVLipqtM4jbyzGNibS
	lTFKq09OUrC/0KR8r4xi/pOcTzR+LVbDAhGddmJXbv1uqTASR819tlv8HW5sREwxjCiWpoF2DbmBT
	ZzkOMn0nssSyZr1ND/i+DizxPAg/uE4w+owx3QAMIhUK14E2VLJphaZptATzAemM/Vk7+QYR72SLp
	SX+B42gNNdfTpAZlhTyacFYpXsHvqNUEul80zpUMmT3WuADm2Y/yCJOWODpzAF8GuaEUTJOPKT+oP
	iLQht3JdWxbx61BJPTAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miR0e-007Nr7-DQ; Thu, 04 Nov 2021 00:53:40 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miQaZ-007Cz0-89
 for linux-riscv@lists.infradead.org; Thu, 04 Nov 2021 00:26:47 +0000
Received: by mail-pf1-x449.google.com with SMTP id
 r2-20020a627602000000b00480f8ce37abso2349553pfc.8
 for <linux-riscv@lists.infradead.org>; Wed, 03 Nov 2021 17:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=g2JE1NchR5OuOuOibWq+8/K2CyWjv7Vlzl0jcmmyHKg=;
 b=UK0IuaxMRM8VI2p4RKcIncQCt3/rVVcLXbP5evDmYD/5MRFF0cnYdOJohdcwHEX0UL
 s1jIdejQk2RCs3P65ng7Qi/Nch6xWlLb3AJpNe9St0b08O8bclGAcjcwNlhuwKwlVdU1
 UAsDfdzka5c/8R6jSfqZAOtxqrF3sWb5+CRYIfY9EL/+phX4RhDTxJKT1BO5pHPTYR1k
 fxXTYBb9kgrmzPKpgw9GKqSRQ5hvlxWlweftTu0Q9G5eaVLj6I+ooPTk+H0MMEpbFXMo
 f+ER1N4nuFT1F4WSwfp35dekPy4XgcZqB/FM/tQgwuYCGxh5wKA5FoaSXrqIYkgUbgeI
 PAHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=g2JE1NchR5OuOuOibWq+8/K2CyWjv7Vlzl0jcmmyHKg=;
 b=5mLRaJR++cDG3wG1De4Gvikrboj773T9aFCHsyrQbTKbQSPhygvA9vsl5zCOka8ncI
 +GmGnJoIxm7oRAB0d05NBngqGx91yZE58Pnic4RY8PtTxx/l1ZgXK0ZlxlrMO4QhDaQW
 q5k1okkU7Vz6iatGtraOhCoQ62Xq4yvJ/c4lCZ0KgSVC3hEIOFDKoyR6jhlWSueOQacV
 pwzdVCFCWCtPxBTj8zFyJe6VXzPreE6axHQqsSEzRWQluaOGFDucRaEVj9KHxdXv4Ivb
 Z4b0DV65vXFvaWta+ZrHPuJNXyLz5Li6iQY2THhAXwlpCk96KP2npR8MoCISNe1ppRqh
 fVjw==
X-Gm-Message-State: AOAM532IEBXFk6oM+WLoIVYz8uVvVY24dTpbY34//dDQ2JuShOZYB/Mz
 8ph1ctkonCIDrzu4Wr2TpQGr+6E54U4=
X-Google-Smtp-Source: ABdhPJxEVZZh8c79kJBVhyomHBKtGxgWv7d32Tr+YGvJXzn/bVGhXaf6aJM8D0LQz8M/cEOUCA1R/OXLlBc=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a17:902:d2c7:b0:142:f06:e5fa
 with SMTP id
 n7-20020a170902d2c700b001420f06e5famr12493355plc.87.1635985601544; Wed, 03
 Nov 2021 17:26:41 -0700 (PDT)
Date: Thu,  4 Nov 2021 00:25:26 +0000
In-Reply-To: <20211104002531.1176691-1-seanjc@google.com>
Message-Id: <20211104002531.1176691-26-seanjc@google.com>
Mime-Version: 1.0
References: <20211104002531.1176691-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v5.5 25/30] KVM: s390: Introduce kvm_s390_get_gfn_end()
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
 linux-kernel@vger.kernel.org, Ben Gardon <bgardon@google.com>, 
 "Maciej S . Szmigiero" <maciej.szmigiero@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_172643_316094_F3438760 
X-CRM114-Status: GOOD (  12.28  )
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

From: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>

And use it where s390 code would just access the memslot with the highest
gfn directly.

No functional change intended.

Signed-off-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
Reviewed-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/s390/kvm/kvm-s390.c |  2 +-
 arch/s390/kvm/kvm-s390.h | 12 ++++++++++++
 arch/s390/kvm/pv.c       |  4 +---
 3 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index 4e032e176216..f7cc0853866b 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -2012,7 +2012,7 @@ static int kvm_s390_get_cmma(struct kvm *kvm, struct kvm_s390_cmma_log *args,
 	if (!ms)
 		return 0;
 	next_gfn = kvm_s390_next_dirty_cmma(slots, cur_gfn + 1);
-	mem_end = slots->memslots[0].base_gfn + slots->memslots[0].npages;
+	mem_end = kvm_s390_get_gfn_end(slots);
 
 	while (args->count < bufsize) {
 		hva = gfn_to_hva(kvm, cur_gfn);
diff --git a/arch/s390/kvm/kvm-s390.h b/arch/s390/kvm/kvm-s390.h
index 52bc8fbaa60a..207d299d7fea 100644
--- a/arch/s390/kvm/kvm-s390.h
+++ b/arch/s390/kvm/kvm-s390.h
@@ -208,6 +208,18 @@ static inline int kvm_s390_user_cpu_state_ctrl(struct kvm *kvm)
 	return kvm->arch.user_cpu_state_ctrl != 0;
 }
 
+/* get the end gfn of the last (highest gfn) memslot */
+static inline unsigned long kvm_s390_get_gfn_end(struct kvm_memslots *slots)
+{
+	struct kvm_memory_slot *ms;
+
+	if (WARN_ON(!slots->used_slots))
+		return 0;
+
+	ms = slots->memslots;
+	return ms->base_gfn + ms->npages;
+}
+
 /* implemented in pv.c */
 int kvm_s390_pv_destroy_cpu(struct kvm_vcpu *vcpu, u16 *rc, u16 *rrc);
 int kvm_s390_pv_create_cpu(struct kvm_vcpu *vcpu, u16 *rc, u16 *rrc);
diff --git a/arch/s390/kvm/pv.c b/arch/s390/kvm/pv.c
index c8841f476e91..e51cccfded25 100644
--- a/arch/s390/kvm/pv.c
+++ b/arch/s390/kvm/pv.c
@@ -117,7 +117,6 @@ static int kvm_s390_pv_alloc_vm(struct kvm *kvm)
 	unsigned long base = uv_info.guest_base_stor_len;
 	unsigned long virt = uv_info.guest_virt_var_stor_len;
 	unsigned long npages = 0, vlen = 0;
-	struct kvm_memory_slot *memslot;
 
 	kvm->arch.pv.stor_var = NULL;
 	kvm->arch.pv.stor_base = __get_free_pages(GFP_KERNEL_ACCOUNT, get_order(base));
@@ -131,8 +130,7 @@ static int kvm_s390_pv_alloc_vm(struct kvm *kvm)
 	 * Slots are sorted by GFN
 	 */
 	mutex_lock(&kvm->slots_lock);
-	memslot = kvm_memslots(kvm)->memslots;
-	npages = memslot->base_gfn + memslot->npages;
+	npages = kvm_s390_get_gfn_end(kvm_memslots(kvm));
 	mutex_unlock(&kvm->slots_lock);
 
 	kvm->arch.pv.guest_len = npages * PAGE_SIZE;
-- 
2.33.1.1089.g2158813163f-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
