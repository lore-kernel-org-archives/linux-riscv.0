Return-Path: <SRS0=Owia=PX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02379C433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 00:41:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4A0861058
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 00:41:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B4A0861058
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OcydA+5V8wAwCOefgxbhOxEVU6+bTNj5bvY3tC7bhhA=; b=bCVvQH6rV/6v1R
	1L00PkprQDweZrxoXUTX9sBpExdkTeWHBzqHRgUY/GbljL/xwgDsjoWXF4d417CusMlfr/f2KowKV
	K5MELua653ofGjknBHx/dQzHJsMY8DNgAjquEfyjbQLTLhG+iyhWtzpBaHa18swFmmHe29oo33/dJ
	ElYHAMpwWsZ6iCWYF+LKK1X3JRFMhKwNKI8T30GrcDS8fEGXWUyvYs7AZpM+YgKNgjDAzllTJubKV
	1iEov1pm5UBQrQdkvjfEAONM4X6JA4ehLnZCwyq48kVhRdTL16lovTk9MYj3uCrd778Djr5cmvUNO
	1sHcdPpTO2icU930xTMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miQou-007JW2-W3; Thu, 04 Nov 2021 00:41:33 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miQaJ-007Cn0-QG
 for linux-riscv@lists.infradead.org; Thu, 04 Nov 2021 00:26:31 +0000
Received: by mail-pl1-x64a.google.com with SMTP id
 n9-20020a170902968900b0013f23b51142so1946735plp.8
 for <linux-riscv@lists.infradead.org>; Wed, 03 Nov 2021 17:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=Rh/p9dCBzSE6gfhoLM6qA42nAbGkMHfvz+ihOHus8Bw=;
 b=a0LysDSixF+SvGFoYJAn+9lReuNdeuojzCYwE/5S80HnosejUJ/GB5lSTi0I0B6etw
 PCesr77PK5UoG4qbBnDDmbOplfKjJvN0RSVwwsJ9A6TMfI9nydou7MxD9T7lOeaglEHG
 XNiJ9e6EtswDVfj8NbPNGs3K4UVClUfWt61l+WfszqPbkc9k/eRztWPGJiIa05+786xW
 gJ3qi2D5CO9qdvRG06/gp2Sn2Z2tyJIgyiWYmMzoSHEsDwT7XcmXrmm49tOMjj1utuxC
 5Wr/o1J29XTmPql9v7HTGvlM7g8HATHgYxp+e4CAJr75tfOZ82uzZSP74HenxJ6CsJu8
 wJFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=Rh/p9dCBzSE6gfhoLM6qA42nAbGkMHfvz+ihOHus8Bw=;
 b=yh/xUTosIQe4sGxNSYfN1xM8WIm5tsEP5CzmE+ZrRmTGDTy0UN08qp4TGakXYbcGpI
 MhBo0M/6Z693HcmJ0Qwj1Fr5KTlbYsJL7xBju0TTiwYpKFeOn6rQSqUo32sCKpVJqi1+
 g7AVhe8IbpaN9Dg3giO1jTJ6tnS9oXpObehj3qraLssd10gCik9TUxhaMWW+qmUKIoyu
 dx6AtdzrK1+ellRLvmtLA2gRzZHlO1CBgUShqdZFp4psnI5875kvB4jertFBzbkabHZy
 FNvDABDZILdXJbjZpUJnMX8nlgejjIKSidhAe8wEVDxr686h//qx6RMQ9JU/W/nmda5t
 PlAQ==
X-Gm-Message-State: AOAM531moxNtIT5tmLxhDL5TcybGKYUwV7QZk6ZjZ3aj277MSj0yEfgS
 mqOiLCjWqIGbNZPP5Jq4aC4j+nMiPgU=
X-Google-Smtp-Source: ABdhPJyOWq98exFdSMvxgt0VGjIuS13MnOJ47QLgbIC6Hkpi6D0S+Boi55mGWksr+QgQdfajOLURjR0xq4c=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a17:902:e8d1:b0:141:de15:f596
 with SMTP id
 v17-20020a170902e8d100b00141de15f596mr25033911plg.67.1635985585858; Wed, 03
 Nov 2021 17:26:25 -0700 (PDT)
Date: Thu,  4 Nov 2021 00:25:17 +0000
In-Reply-To: <20211104002531.1176691-1-seanjc@google.com>
Message-Id: <20211104002531.1176691-17-seanjc@google.com>
Mime-Version: 1.0
References: <20211104002531.1176691-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v5.5 16/30] KVM: x86: Don't assume old/new memslots are
 non-NULL at memslot commit
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
X-CRM114-CacheID: sfid-20211103_172627_899335_B5999CD8 
X-CRM114-Status: GOOD (  11.23  )
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

Play nice with a NULL @old or @new when handling memslot updates so that
common KVM can pass NULL for one or the other in CREATE and DELETE cases
instead of having to synthesize a dummy memslot.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 80e726f73dd7..80183f7eadeb 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -11762,13 +11762,15 @@ static void kvm_mmu_slot_apply_flags(struct kvm *kvm,
 				     const struct kvm_memory_slot *new,
 				     enum kvm_mr_change change)
 {
-	bool log_dirty_pages = new->flags & KVM_MEM_LOG_DIRTY_PAGES;
+	u32 old_flags = old ? old->flags : 0;
+	u32 new_flags = new ? new->flags : 0;
+	bool log_dirty_pages = new_flags & KVM_MEM_LOG_DIRTY_PAGES;
 
 	/*
 	 * Update CPU dirty logging if dirty logging is being toggled.  This
 	 * applies to all operations.
 	 */
-	if ((old->flags ^ new->flags) & KVM_MEM_LOG_DIRTY_PAGES)
+	if ((old_flags ^ new_flags) & KVM_MEM_LOG_DIRTY_PAGES)
 		kvm_mmu_update_cpu_dirty_logging(kvm, log_dirty_pages);
 
 	/*
@@ -11786,7 +11788,7 @@ static void kvm_mmu_slot_apply_flags(struct kvm *kvm,
 	 * MOVE/DELETE: The old mappings will already have been cleaned up by
 	 *		kvm_arch_flush_shadow_memslot().
 	 */
-	if ((change != KVM_MR_FLAGS_ONLY) || (new->flags & KVM_MEM_READONLY))
+	if ((change != KVM_MR_FLAGS_ONLY) || (new_flags & KVM_MEM_READONLY))
 		return;
 
 	/*
@@ -11794,7 +11796,7 @@ static void kvm_mmu_slot_apply_flags(struct kvm *kvm,
 	 * other flag is LOG_DIRTY_PAGES, i.e. something is wrong if dirty
 	 * logging isn't being toggled on or off.
 	 */
-	if (WARN_ON_ONCE(!((old->flags ^ new->flags) & KVM_MEM_LOG_DIRTY_PAGES)))
+	if (WARN_ON_ONCE(!((old_flags ^ new_flags) & KVM_MEM_LOG_DIRTY_PAGES)))
 		return;
 
 	if (!log_dirty_pages) {
-- 
2.33.1.1089.g2158813163f-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
