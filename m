Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B2EEE57CF
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Sep 2024 20:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VYCJTuMmEzXfvpsVYvLfw5JfN1lo9UOZJMjx82k5J5c=; b=n3LMe/jXdSmBGC
	rtM2pi60gW+Ur3mSzsVPTnbZa9eBaQ71XS3fFKeE/WUvf/DwRoN1MstjO4NnsR+phBCFyOlroALGB
	DPl6eoF/c7Bgmts16xYhVAU21+sEclFbaHbjvntpcd5Rglhsh9RIzyuCFz77LCIjyRN7zDGxYhIMg
	hO5D1NTxHf36bhfvMdXxbG1HVs1sJ3Nbu/vvgCbzrP03NL9iYz0Dz5i56pf3nauTGwoa9pzateaWS
	WyDCkrLW+tUwiWYOJ2undYKj9U9YLFdjmDx6wzOIhau889ODqLLyOjBY+MSSSm4bqqSLDZcVu3Vma
	VsibeNb7EC7t5XqW6GCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soUBc-0000000AxQa-42tn;
	Wed, 11 Sep 2024 20:43:36 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soUAR-0000000AwuG-2LoQ
	for linux-riscv@lists.infradead.org;
	Wed, 11 Sep 2024 20:42:25 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-207302f244aso4395665ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 11 Sep 2024 13:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726087342; x=1726692142; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=+KcQL/bdCq18fS3rSOcZm5DU7Hi8Axoom7HVevkC6r4=;
        b=4A90e3VXm5OyXqgqySu2o+SCx3o33im9iEftzf4ceFp4QiHCJUg7BOzLFqxXv3yU2T
         xGQCIA4wUuRDj3RpAr6hpTwANuVXm91jOC9UPm/CAA2XuZYvur+i6aIY60Xi2uVbA+vg
         OoO5BMJNMf2ZrQmjKsGOpn2NvoV8xnft40+0rHtx2B0jVQU6AfONa4UWShHyDZQ6QEF7
         4e9f3kMegqBXqzgZ07+H7tgi/zOeuPLn1YytGwFLs83ktZE+WxT4VKhgPw+caIFWxkdT
         VJYeDQWNgtH7POQ+4pB3vaP0CiU/IN3HUH+Sla9R2irUYR5OEWej/u8wZiLXTy9rx97L
         Q0dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726087342; x=1726692142;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+KcQL/bdCq18fS3rSOcZm5DU7Hi8Axoom7HVevkC6r4=;
        b=Y5gEZ9fnbPv1Rxhk5O30MLz69/aj8qeYrdPkPSGRGAHQ1WkwHbPWB2dpnH+oigsnnC
         E/tAqS8YV3AfOo3TX77fIm3TXC3sSOCswnxYK0KGYUcNtR9ckVZgt6stzuAsAMrB5ZMX
         +18VpLNwgW6SK2hPyqUkrG4An0grSJrvv9EIMZE6dx0kg3e5r7R3GCyUSR9/qrPtdZdQ
         XpJ46CGOojDD5YRValHJboiAHDlfxd6Cpe4O4ksuIsu8+awk4+zyfxZaoCsbEbaEsXNi
         mH203/F7RpH4OF1JO3jZ0sCt9WDkDNMfHlzzz3c0lxPyEuOt9zZHN/DrcbAUEsJg2dkv
         qpPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFI6yGGlS1eogdJKmzqaSwR9oq7wOIYZ6re1bRKBPEM1h+uWkZTHcxm8/EZ5Gv3933y8OIwbZ6r+GDZA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxVoDjDzzBpb70bTBUKNY+UG7igKaJGPxHM/MwJzZTzR+RHJrZE
	eP+ayWRARPvCI9pseA5jTDsdWJU6eORHBK0m9RNQzBIVHcMKZCZ84DvbFpGJj6u0EZDkEagzISc
	RkA==
X-Google-Smtp-Source: AGHT+IEO5NwWx0FrDp8QKSLHZru3Ive0KlYcZGHHsB7iPFbn3vSIzuOoVV6CHwgKSaGOFRDtrL7V2ub0u3g=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:f682:b0:202:4712:e84c with SMTP id
 d9443c01a7336-2076e3f784bmr227705ad.6.1726087342373; Wed, 11 Sep 2024
 13:42:22 -0700 (PDT)
Date: Wed, 11 Sep 2024 13:41:46 -0700
In-Reply-To: <20240911204158.2034295-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240911204158.2034295-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
Message-ID: <20240911204158.2034295-2-seanjc@google.com>
Subject: [PATCH v2 01/13] KVM: Move KVM_REG_SIZE() definition to common uAPI header
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Sean Christopherson <seanjc@google.com>, James Houghton <jthoughton@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_134223_605313_C154BFDD 
X-CRM114-Status: GOOD (  11.12  )
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

Define KVM_REG_SIZE() in the common kvm.h header, and delete the arm64 and
RISC-V versions.  As evidenced by the surrounding definitions, all aspects
of the register size encoding are generic, i.e. RISC-V should have moved
arm64's definition to common code instead of copy+pasting.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/include/uapi/asm/kvm.h | 3 ---
 arch/riscv/include/uapi/asm/kvm.h | 3 ---
 include/uapi/linux/kvm.h          | 4 ++++
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
index 964df31da975..80b26134e59e 100644
--- a/arch/arm64/include/uapi/asm/kvm.h
+++ b/arch/arm64/include/uapi/asm/kvm.h
@@ -43,9 +43,6 @@
 #define KVM_COALESCED_MMIO_PAGE_OFFSET 1
 #define KVM_DIRTY_LOG_PAGE_OFFSET 64
 
-#define KVM_REG_SIZE(id)						\
-	(1U << (((id) & KVM_REG_SIZE_MASK) >> KVM_REG_SIZE_SHIFT))
-
 struct kvm_regs {
 	struct user_pt_regs regs;	/* sp = sp_el0 */
 
diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index e97db3296456..4f8d0c04a47b 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -207,9 +207,6 @@ struct kvm_riscv_sbi_sta {
 #define KVM_RISCV_TIMER_STATE_OFF	0
 #define KVM_RISCV_TIMER_STATE_ON	1
 
-#define KVM_REG_SIZE(id)		\
-	(1U << (((id) & KVM_REG_SIZE_MASK) >> KVM_REG_SIZE_SHIFT))
-
 /* If you need to interpret the index values, here is the key: */
 #define KVM_REG_RISCV_TYPE_MASK		0x00000000FF000000
 #define KVM_REG_RISCV_TYPE_SHIFT	24
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 637efc055145..9deeb13e3e01 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -1070,6 +1070,10 @@ struct kvm_dirty_tlb {
 
 #define KVM_REG_SIZE_SHIFT	52
 #define KVM_REG_SIZE_MASK	0x00f0000000000000ULL
+
+#define KVM_REG_SIZE(id)		\
+	(1U << (((id) & KVM_REG_SIZE_MASK) >> KVM_REG_SIZE_SHIFT))
+
 #define KVM_REG_SIZE_U8		0x0000000000000000ULL
 #define KVM_REG_SIZE_U16	0x0010000000000000ULL
 #define KVM_REG_SIZE_U32	0x0020000000000000ULL
-- 
2.46.0.598.g6f2099f65c-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
