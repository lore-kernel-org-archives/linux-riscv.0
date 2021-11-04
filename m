Return-Path: <SRS0=Owia=PX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C45ABC433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 00:45:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7777C611C5
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 00:45:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7777C611C5
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ChOCjbGH9Gl4QQocTsvplE0ugaisoCm9oAXFjAVcQuo=; b=dz9xnT/+vnhc+r
	uZrsqYJHYPsLTMhPCJzVoLr5rN34Ry82kfVPFpGdYyhLqtYnt0IduB8u7y/L5Bz8NtAyawbpr1ORw
	2YYY7weAGucF2CEaSnNzUnUNVtLQuCRMSz7hDu8r4bAOVjcNNjSv4OOS0w8GCRyP02ExKlbhjR4GN
	1JYe/o6NYqdYYPqYFjVOcbclnAS/QsFMrLaggUh+AMeUvMwQ5sWAhAMmxxjZaR1dNxXDHPXzzPFSF
	Tpy9jRZcS1MMywOHmI/U3stDM3p/c4kT2zGt99m9A3oy1hgo3hiR8QH1c3qIkQx7GU1eb3tsyJJAA
	Yrj80MsXUN6ftWYA5IWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miQsM-007Kn8-CQ; Thu, 04 Nov 2021 00:45:06 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miQaO-007Cqp-Iz
 for linux-riscv@lists.infradead.org; Thu, 04 Nov 2021 00:26:35 +0000
Received: by mail-pl1-x64a.google.com with SMTP id
 n13-20020a170902d2cd00b0014228ffc40dso848550plc.4
 for <linux-riscv@lists.infradead.org>; Wed, 03 Nov 2021 17:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=uYjj4f3K7aLt9wIaWKUjF6y1lKdICOYwfejCWHB3aF8=;
 b=Uhm3v8WNND1uUP79qkh3iF9ngMS/QpmsXEC/6vevUuzviyfyF3+tSzE2rdmLrNYnov
 ivEPHlTaSTgUBPTTi0LsyRVmw9xXp2mzAafjmpRwoFL1KovVk8wtgK3U+1IWl+jiRT2o
 7QOXBMeLcoMyFIuk8nfYq8Z4cK4ySxLX4VQvCwivT4uBC8D1531XJeoZcVX+WcQdgv/2
 15XpbR3gJyAolfjM0WcGNgJS3ceK1iyuvg9S+WhHGJq+B2HdNn7lGmW8IZ2NF2RpaP0n
 2NlCasOBpN6Ngo/ODMi6fT9lbV6fzIJZALi7PZVoZsnpUFpAWoSzDGNfxoR0u+D8gkJP
 KhsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=uYjj4f3K7aLt9wIaWKUjF6y1lKdICOYwfejCWHB3aF8=;
 b=eFiIRICjv2iKYIs02zEaQQD4CQBEnbV9T/9N4g5cK4s+C/UcYzAt/uIfel4Zjmme+V
 WbPPO1pC6a4nu68J82rRL8BJofLDlvdCu8c0fdLBD5WkmXuZbUhmC5UwNfsluP0PWokX
 B91FihzRNuncCjcnnI0QMHw/toTPk8UhvIvPG8VvbPg6L0s/jYZnJUpVErVs/NjlWIcy
 bYtzgessvE1bx2WBelaY1AuPI4Ho6SG8ULeQKEqvLOR2+fwcQYkeiB/vz/kxA0Orecn3
 d2ZLxzH12TzpI0GSz1PJOsocaNhdpFkuHJ1qQFPSVN/zp7CD5RvJaGOeqGBxE0disj0Q
 0WOA==
X-Gm-Message-State: AOAM533/c0n4amxV5obP+QaEEjjPRby34L8O1Q7KE+lKgFT7LjbUGN74
 NJOkKd6D5grlX47hcQbe0wZwGobWDPs=
X-Google-Smtp-Source: ABdhPJyzJUVQ4+X7UL4YhSp9RCZBPi0XLOQZSFtg0LZxrgaDfXLCgqmWWI3ojjh232hTQrMrLyr2UsSbIBM=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:1511:b0:492:61fe:9fa6
 with SMTP id
 q17-20020a056a00151100b0049261fe9fa6mr9114017pfu.57.1635985590891; Wed, 03
 Nov 2021 17:26:30 -0700 (PDT)
Date: Thu,  4 Nov 2021 00:25:20 +0000
In-Reply-To: <20211104002531.1176691-1-seanjc@google.com>
Message-Id: <20211104002531.1176691-20-seanjc@google.com>
Mime-Version: 1.0
References: <20211104002531.1176691-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v5.5 19/30] KVM: x86: Don't call kvm_mmu_change_mmu_pages() if
 the count hasn't changed
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
X-CRM114-CacheID: sfid-20211103_172632_670035_AF077B9D 
X-CRM114-Status: UNSURE (   9.79  )
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

There is no point in calling kvm_mmu_change_mmu_pages() for memslot
operations that don't change the total page count, so do it just for
KVM_MR_CREATE and KVM_MR_DELETE.

Reviewed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 80183f7eadeb..4b0cb7390902 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -11836,7 +11836,8 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
 				const struct kvm_memory_slot *new,
 				enum kvm_mr_change change)
 {
-	if (!kvm->arch.n_requested_mmu_pages)
+	if (!kvm->arch.n_requested_mmu_pages &&
+	    (change == KVM_MR_CREATE || change == KVM_MR_DELETE))
 		kvm_mmu_change_mmu_pages(kvm,
 				kvm_mmu_calculate_default_mmu_pages(kvm));
 
-- 
2.33.1.1089.g2158813163f-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
