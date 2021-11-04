Return-Path: <SRS0=Owia=PX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6E3CC433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 00:28:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EC25611C7
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 00:28:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9EC25611C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fP685/KJiOg/MXs5uPHG6oHxRARLAOCR/FjQXMONnVs=; b=Qpy+fYBOwGwtUY
	zoW0jVfqvqQJD506ydzAGlVW+S1ShjO0FSo7uwfe5sjTgrOUo2mMVCTxP9NqAZ6AgiBoqhwSDMcUT
	8CVfUq+SD43zg0x5+Z9KJL6c/UBAZ5ygopWVoHRHn9SFhw9KrIQpfA6763VgWxa/Tttk0lTBVMpMY
	iWHshHJ6CBEor6GP5+qdI4l43KHQm6ww/20GQi/YsHbVfAveTTUiznnBcarG9guVqJiDB1+svN76t
	lrty9EThecv1N65aMv0tAQGZ5umizEnSxM7W84EvXkUYEUBBFvpVOZYERNCQ5QPF0+E76gj+Y4Tp6
	AIYGWWB9/o3rNCGbbBhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miQbg-007Ded-UO; Thu, 04 Nov 2021 00:27:53 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miQZy-007CZ3-Dx
 for linux-riscv@lists.infradead.org; Thu, 04 Nov 2021 00:26:07 +0000
Received: by mail-pg1-x549.google.com with SMTP id
 e4-20020a630f04000000b002cc40fe16afso2342400pgl.23
 for <linux-riscv@lists.infradead.org>; Wed, 03 Nov 2021 17:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=E63+zcqes7aObPmDEJrvowSyb7WASC2+JFrjiGuoOMk=;
 b=G1EofX3RvsgDocbJ2WdlZIxLPrRqCOY3yk9dCpHXn3BrotBTcINoCOIdoZtnGuqNkz
 XjduJywdhEpzM76x4KoUTmOMqDWGTwqBcR9WlCLJ/Ixo7OZNiFzolIn6uGeuv97Lynv7
 ddl94QsCyWYRP1cDpWTxGlOfLjkpa9JMyPhL71/QGQqzOCEiWBc8/ntYod6VDaOBqRIS
 X353qmmShX/kJORUwjw2weuKuQNgd6XS84Jwff3SPGUNlABXgf8tKjegkYwWGGN3YZ/S
 LGQAetSmsnJyG5LH2Wdt7/WsV81v8KEKNpq61Fts5PSRMZc9eqQNsC0W+vLYcBCTaqSh
 tOqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=E63+zcqes7aObPmDEJrvowSyb7WASC2+JFrjiGuoOMk=;
 b=UH8RckOw7mP0VK8DAz1NR4IY4cNsl2DyDD8gN5m3jecOfBY2+lIGJjvihnVeLE0iHH
 Qxl43PegL29jzOjmUpP3GLOEXutFgEteqEFp5VghUYUXwJXW2Vdew07xyf+VWs7HMqm0
 TDgVyA1pCSG2zLLXXzJTFUdFVMeHsmeSM4zrIW/qJcqvpSySF0g4QiC0KZpcC95RohdM
 rrYz5lpnNPtyXKdcPM3EHpu74T4DKohfLhYjleq+22PbMZ4Ep8qIpJtQJHeJu0xodhvY
 7KWBBaHiXNJszn9QParwFDd60BnEZJgecOiflUKJWLg7lhu62bScaU35iw2wUx9wVCMg
 xiZg==
X-Gm-Message-State: AOAM533toSW5b58cfMwN5yxQaaxEQmLFxC80yN6GTsJsHrZBU0PGJlDQ
 IY8onkgBuTDg0b20PLaFqO2fKGCxNFo=
X-Google-Smtp-Source: ABdhPJyxb/nQ01mzKYX4m8bfp03Ule2nAlwfJSHz9a05yqoefRBI+SnT6XPXcdLf6g/xUstLGwYZnueYC+Q=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a62:1b8e:0:b0:44c:9318:f6e1 with
 SMTP id
 b136-20020a621b8e000000b0044c9318f6e1mr48578653pfb.84.1635985564791; Wed, 03
 Nov 2021 17:26:04 -0700 (PDT)
Date: Thu,  4 Nov 2021 00:25:05 +0000
In-Reply-To: <20211104002531.1176691-1-seanjc@google.com>
Message-Id: <20211104002531.1176691-5-seanjc@google.com>
Mime-Version: 1.0
References: <20211104002531.1176691-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v5.5 04/30] KVM: Open code kvm_delete_memslot() into its only
 caller
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
X-CRM114-CacheID: sfid-20211103_172606_480348_E2D2B8B1 
X-CRM114-Status: GOOD (  13.36  )
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

Fold kvm_delete_memslot() into __kvm_set_memory_region() to free up the
"kvm_delete_memslot()" name for use in a future helper.  The delete logic
isn't so complex/long that it truly needs a helper, and it will be
simplified a wee bit further in upcoming commits.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 42 +++++++++++++++++-------------------------
 1 file changed, 17 insertions(+), 25 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 264c4b16520b..6171ddb3e31c 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1653,29 +1653,6 @@ static int kvm_set_memslot(struct kvm *kvm,
 	return r;
 }
 
-static int kvm_delete_memslot(struct kvm *kvm,
-			      const struct kvm_userspace_memory_region *mem,
-			      struct kvm_memory_slot *old, int as_id)
-{
-	struct kvm_memory_slot new;
-
-	if (!old->npages)
-		return -EINVAL;
-
-	if (WARN_ON_ONCE(kvm->nr_memslot_pages < old->npages))
-		return -EIO;
-
-	memset(&new, 0, sizeof(new));
-	new.id = old->id;
-	/*
-	 * This is only for debugging purpose; it should never be referenced
-	 * for a removed memslot.
-	 */
-	new.as_id = as_id;
-
-	return kvm_set_memslot(kvm, mem, &new, as_id, KVM_MR_DELETE);
-}
-
 /*
  * Allocate some memory and give it an address in the guest physical address
  * space.
@@ -1732,8 +1709,23 @@ int __kvm_set_memory_region(struct kvm *kvm,
 		old.id = id;
 	}
 
-	if (!mem->memory_size)
-		return kvm_delete_memslot(kvm, mem, &old, as_id);
+	if (!mem->memory_size) {
+		if (!old.npages)
+			return -EINVAL;
+
+		if (WARN_ON_ONCE(kvm->nr_memslot_pages < old.npages))
+			return -EIO;
+
+		memset(&new, 0, sizeof(new));
+		new.id = id;
+		/*
+		 * This is only for debugging purpose; it should never be
+		 * referenced for a removed memslot.
+		 */
+		new.as_id = as_id;
+
+		return kvm_set_memslot(kvm, mem, &new, as_id, KVM_MR_DELETE);
+	}
 
 	new.as_id = as_id;
 	new.id = id;
-- 
2.33.1.1089.g2158813163f-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
