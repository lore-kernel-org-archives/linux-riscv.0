Return-Path: <SRS0=Owia=PX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2D4DC433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 00:43:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 648D760231
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 00:43:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 648D760231
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i122cHey9WtC4wrTnoLOlg03SP84lAzyJnjCB+TzwGY=; b=RxgG4j/yE/bvr8
	xVknesDa1p/3F5qfzRP5YoZ+SZNYmJIVB7G+rlgCjidKcLll9SOOm0xg6F+4tgwEwHmQDq0aJ+sfH
	3VN8zBwxU2Y/KuXxQeGKpAT3mep8LMFP+AuQCYMqM2b7Dm/kM1E4B1w6ffhY09WGm9ZiDKMa2n1kN
	tUdJW+IoIH80T2xrdMNKTKq+jeMC6eOOh24NeGtm2LbLnIi6tnpcDRK8nIkgOsGa1XN24jpp7tcQP
	eUCIHagcD4tyjRJoYXKoZc3Qknz36LqYPWcPwoHI4tdFeVAJP+LNiuCOqZqTiiKcJJtN7T510nwYm
	i17qEKR9FkOun/DOCrSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miQqZ-007K9k-9W; Thu, 04 Nov 2021 00:43:15 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miQaM-007CpS-SE
 for linux-riscv@lists.infradead.org; Thu, 04 Nov 2021 00:26:33 +0000
Received: by mail-pg1-x54a.google.com with SMTP id
 g18-20020a631112000000b00299f5f53824so2417184pgl.2
 for <linux-riscv@lists.infradead.org>; Wed, 03 Nov 2021 17:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=gefeXeMu+9xCn+OiiZbsmvywIWNyuYY1aczHxfS7F84=;
 b=q1wAaFzQivbUaLWNpD28vIW6ok97J24IWOZtjc0+hsnIoFnhMyUWsnSfQKoqN3maJ3
 KBdBMOyYnFaTKZvkOTgijuDb8a1y6dTYyIvATTjrk50gQdXgdq0sK8P9D8VXqeBwIchM
 S4752LKzCwKCElggFGcp/0gCfncZSwTidehk3QlNJHjH4YdWFX4NP2+qFH0XmXIojpE7
 shl+78ytzLoTN1+DNy2u1aXGBjCw+SMXFRKxDeT2bHggWBTmy7o/SubcktQSj4/PZQou
 hwUcODvMGvNUFZIWK9EWYU9o0oSTlOaqrHSlqsc6GHFHSECGSUQyaSoW+8/pBlFiy+YJ
 LVDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=gefeXeMu+9xCn+OiiZbsmvywIWNyuYY1aczHxfS7F84=;
 b=NSgA8Cd4Wy4LNDc1m4dZD0aEgsxzg3PFyzxjTBj1LWmaa4iBx1yqgRbdIXcUYYCf3i
 RNs3meqfkhrA2ed2LAmrae+xWjDPiOzHxDj0k32qinmHCuZe119or04bQwFEfsRpTqkd
 bBOTydd8ebPwdbJCBVfn9/ROdyRtACQu2i75zU4NMHAChWtk6UBZ6eiw3UG97AnVGLFe
 Lc5PGRx6UmiDA6Jfc+UV4dRzhyOErUhSOHJ1VeenKoy46qHZ/FdT3hUJfsHAx8Czo7WJ
 H2gugNcKZR2q+pXnKWj0WVbwhLC/2KT1i/iRPtxyP3FdaQiUKZP54xEUPE/QhT+e9vuY
 BNdg==
X-Gm-Message-State: AOAM5321mZ3a0FSRVJ7J/qMUaVkemaDo2CDHzbaC17YksXsuaI6yPJpe
 6cxPUym5FtIDmTfn661YCCzwEce/xjs=
X-Google-Smtp-Source: ABdhPJwuRHtV9T3+KFXWyLxF72TgsEexvxCX5VCcTZ2sr7WXwUborCujSIBbaHyiH9gR1LJWc7GYuxnx26s=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a63:740e:: with SMTP id
 p14mr35995604pgc.329.1635985589285; 
 Wed, 03 Nov 2021 17:26:29 -0700 (PDT)
Date: Thu,  4 Nov 2021 00:25:19 +0000
In-Reply-To: <20211104002531.1176691-1-seanjc@google.com>
Message-Id: <20211104002531.1176691-19-seanjc@google.com>
Mime-Version: 1.0
References: <20211104002531.1176691-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v5.5 18/30] KVM: Don't make a full copy of the old memslot in
 __kvm_set_memory_region()
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
X-CRM114-CacheID: sfid-20211103_172630_993333_5F3193E3 
X-CRM114-Status: GOOD (  14.86  )
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

Stop making a full copy of the old memslot in __kvm_set_memory_region()
now that metadata updates are handled by kvm_set_memslot(), i.e. now that
the old memslot's dirty bitmap doesn't need to be referenced after the
memslot and its pointer is modified/invalidated by kvm_set_memslot().

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 35 +++++++++++++----------------------
 1 file changed, 13 insertions(+), 22 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 6c7bbc452dae..bbaa01afac43 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1715,8 +1715,8 @@ static int kvm_set_memslot(struct kvm *kvm,
 int __kvm_set_memory_region(struct kvm *kvm,
 			    const struct kvm_userspace_memory_region *mem)
 {
-	struct kvm_memory_slot old, new;
-	struct kvm_memory_slot *tmp;
+	struct kvm_memory_slot *old, *tmp;
+	struct kvm_memory_slot new;
 	enum kvm_mr_change change;
 	int as_id, id;
 	int r;
@@ -1746,25 +1746,16 @@ int __kvm_set_memory_region(struct kvm *kvm,
 		return -EINVAL;
 
 	/*
-	 * Make a full copy of the old memslot, the pointer will become stale
-	 * when the memslots are re-sorted by update_memslots(), and the old
-	 * memslot needs to be referenced after calling update_memslots(), e.g.
-	 * to free its resources and for arch specific behavior.
+	 * Note, the old memslot (and the pointer itself!) may be invalidated
+	 * and/or destroyed by kvm_set_memslot().
 	 */
-	tmp = id_to_memslot(__kvm_memslots(kvm, as_id), id);
-	if (tmp) {
-		old = *tmp;
-		tmp = NULL;
-	} else {
-		memset(&old, 0, sizeof(old));
-		old.id = id;
-	}
+	old = id_to_memslot(__kvm_memslots(kvm, as_id), id);
 
 	if (!mem->memory_size) {
-		if (!old.npages)
+		if (!old || !old->npages)
 			return -EINVAL;
 
-		if (WARN_ON_ONCE(kvm->nr_memslot_pages < old.npages))
+		if (WARN_ON_ONCE(kvm->nr_memslot_pages < old->npages))
 			return -EIO;
 
 		memset(&new, 0, sizeof(new));
@@ -1784,7 +1775,7 @@ int __kvm_set_memory_region(struct kvm *kvm,
 	if (new.npages > KVM_MEM_MAX_NR_PAGES)
 		return -EINVAL;
 
-	if (!old.npages) {
+	if (!old || !old->npages) {
 		change = KVM_MR_CREATE;
 
 		/*
@@ -1794,14 +1785,14 @@ int __kvm_set_memory_region(struct kvm *kvm,
 		if ((kvm->nr_memslot_pages + new.npages) < kvm->nr_memslot_pages)
 			return -EINVAL;
 	} else { /* Modify an existing slot. */
-		if ((new.userspace_addr != old.userspace_addr) ||
-		    (new.npages != old.npages) ||
-		    ((new.flags ^ old.flags) & KVM_MEM_READONLY))
+		if ((new.userspace_addr != old->userspace_addr) ||
+		    (new.npages != old->npages) ||
+		    ((new.flags ^ old->flags) & KVM_MEM_READONLY))
 			return -EINVAL;
 
-		if (new.base_gfn != old.base_gfn)
+		if (new.base_gfn != old->base_gfn)
 			change = KVM_MR_MOVE;
-		else if (new.flags != old.flags)
+		else if (new.flags != old->flags)
 			change = KVM_MR_FLAGS_ONLY;
 		else /* Nothing to change. */
 			return 0;
-- 
2.33.1.1089.g2158813163f-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
