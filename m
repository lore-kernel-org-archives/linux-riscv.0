Return-Path: <SRS0=Owia=PX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EABA2C433FE
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 00:35:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAB14611C3
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 00:35:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BAB14611C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AjfgQm/FFjLz28Q8ZWRK8Srn46JyRg2kEwdHfKQVKS0=; b=gceXeXCCyDoOKO
	u9LWF8S9JTMDzXTS93T4+Q0jFm+yk5vEBbNFspj7yw/UG8UgP6e93/KM72t9C6TEv2QlDingZLlQm
	AnLRUMnCQDFIof9dLn1f9FXQ+FHp56TFPirgOSDGDW80VFUT2SKeRE50Lki8R+fK6P05Gce6lrcZm
	OwHXWpf/g4SA5SgUYt0uSauRoDv6J2UozVZLyhRL7eg2xhvsua7YdcvoE1xehXTvLyzbKVdo+fD/C
	3Rn8IhnvOKNEkIZ/6gnZOZaBeHBy7DQqsd4ATUvDQgx79Qpina4J+iHIn53NqKt+kdjr7mER0c5xE
	moxXloHdJenRanraSBWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miQia-007H6C-2o; Thu, 04 Nov 2021 00:35:00 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miQaA-007CgP-Qy
 for linux-riscv@lists.infradead.org; Thu, 04 Nov 2021 00:26:20 +0000
Received: by mail-pg1-x549.google.com with SMTP id
 z7-20020a63c047000000b0026b13e40309so2350755pgi.19
 for <linux-riscv@lists.infradead.org>; Wed, 03 Nov 2021 17:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=kLLbpYUiVrBCCmy9Sc82r5ow03dVDTpEgLuIVlNMoOU=;
 b=Ay0YG9JEBW9+oY2nHageNG1AdA4t7yDgBUGJkYSFHo5eFkEi8vzfRBn5r41f1wSxFg
 HSgICUcsH+f+lzWZSrC/1+mz5xqRXkD91mzBnDo3BZYbwFr6hDST1vZCD3wSaINgurlO
 zbuvwIYYwfswIpEP9r8XZUjhOUbrj1e1JEJE4CWqzQQsYzwNhKAy5PlY8BJTrIckkqFw
 /WBxV8tmpZLjaeDHV2KmyUmRuJtIFaWLMoliidYs9v4yCfTtKY1d7jZJDCgZUJEa5xF2
 wIsTmffaYibM2+7wr3G9ycxcN4Z/J+2gaNLg0QQl0/oDgNaLZZgfBR++RADooAplNPs9
 dtjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=kLLbpYUiVrBCCmy9Sc82r5ow03dVDTpEgLuIVlNMoOU=;
 b=V93PDDixfVze4m/m4NGn3fQkIAy91foEPxTpaKoZVVI/ypFiS1To292S7Ws6SOpvG2
 QVT3BrvRtmnTxwZc8NjHGtX7ykUd46289DJ5vwaDMXmUVuZpgnyeXEzcN5DJWltBa7YL
 xghjIxkjJisHdxCwI5uNWXqmV9T1R9wkbOPWbXIbibGDqJj0b44q5nDmFOH5N2XRb4ur
 prjLuO70zPSkEvvySs2duCN6xZrVTRjWauD0NsbGN8wMESxQnoftSnMSK+TojxDEI0IP
 kybZlIR495f1Yv8TowPQO6SOyitHBYWZ7XBUxzJchkYPwzVEju6GIYxTouadMFLrDhNs
 cuGw==
X-Gm-Message-State: AOAM530tupp6+YJtnydA59C3aYBZoXTAF7/TtwdFtjKbeJYGCDevcZZN
 LM4LcOev/b44f9OPirtzU8Np3tRx7z0=
X-Google-Smtp-Source: ABdhPJw5JY2aPJBBFAL7b1zmagPoeo9Jl9Nl1wm8mOZYtI4MVm1cgFWi1nr5hcey34/naZNPnAO1I6HTWwg=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:8cd:b0:47b:b9e8:7c2e
 with SMTP id
 s13-20020a056a0008cd00b0047bb9e87c2emr47505781pfu.61.1635985577071; Wed, 03
 Nov 2021 17:26:17 -0700 (PDT)
Date: Thu,  4 Nov 2021 00:25:12 +0000
In-Reply-To: <20211104002531.1176691-1-seanjc@google.com>
Message-Id: <20211104002531.1176691-12-seanjc@google.com>
Mime-Version: 1.0
References: <20211104002531.1176691-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v5.5 11/30] KVM: s390: Use "new" memslot instead of userspace
 memory region
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
X-CRM114-CacheID: sfid-20211103_172618_941101_CFCEFF1D 
X-CRM114-Status: GOOD (  14.98  )
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

Get the gfn, size, and hva from the new memslot instead of the userspace
memory region when preparing/committing memory region changes.  This will
allow a future commit to drop the @mem param.

Note, this has a subtle functional change as KVM would previously reject
DELETE if userspace provided a garbage userspace_addr or guest_phys_addr,
whereas KVM zeros those fields in the "new" memslot when deleting an
existing memslot.  Arguably the old behavior is more correct, but there's
zero benefit into requiring userspace to provide sane values for hva and
gfn.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---

If we want to keep the checks for DELETE, my vote would be to add an
arch hook that is dedicated to validated the userspace memory region
so that the prepare/commit hooks operate only on KVM-generate objects.

 arch/s390/kvm/kvm-s390.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index d766d764d24c..e69ad13612d9 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -5021,18 +5021,20 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 				   struct kvm_memory_slot *new,
 				   enum kvm_mr_change change)
 {
+	gpa_t size = new->npages * PAGE_SIZE;
+
 	/* A few sanity checks. We can have memory slots which have to be
 	   located/ended at a segment boundary (1MB). The memory in userland is
 	   ok to be fragmented into various different vmas. It is okay to mmap()
 	   and munmap() stuff in this slot after doing this call at any time */
 
-	if (mem->userspace_addr & 0xffffful)
+	if (new->userspace_addr & 0xffffful)
 		return -EINVAL;
 
-	if (mem->memory_size & 0xffffful)
+	if (size & 0xffffful)
 		return -EINVAL;
 
-	if (mem->guest_phys_addr + mem->memory_size > kvm->arch.mem_limit)
+	if ((new->base_gfn * PAGE_SIZE) + size > kvm->arch.mem_limit)
 		return -EINVAL;
 
 	/* When we are protected, we should not change the memory slots */
@@ -5061,8 +5063,9 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
 			break;
 		fallthrough;
 	case KVM_MR_CREATE:
-		rc = gmap_map_segment(kvm->arch.gmap, mem->userspace_addr,
-				      mem->guest_phys_addr, mem->memory_size);
+		rc = gmap_map_segment(kvm->arch.gmap, new->userspace_addr,
+				      new->base_gfn * PAGE_SIZE,
+				      new->npages * PAGE_SIZE);
 		break;
 	case KVM_MR_FLAGS_ONLY:
 		break;
-- 
2.33.1.1089.g2158813163f-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
