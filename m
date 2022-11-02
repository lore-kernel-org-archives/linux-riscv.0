Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF322C433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Nov 2022 23:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6TWhatq5yl1u09SGkX8DUBmewdMYNMp7A5anq03OquM=; b=V635ft+CUjtFbF
	Ni6ZEOfihfDlmfyvEoLRNMDU4oZXsn3otUAcX3PmZTzvDojEZTyzOEa0CIuPeVf4JEUZ577LkMD/X
	qKohDScwhRyw+PwrDW9x8NWo/aWwNM8s5WPzPE9moazuH/DopoX5BEuqr5zQwDJYEX7ndO8kybIBh
	873wJnurZOB2g415YnLlJPUWIreGOV4ClHnYKcNwRLqSrHFzmYpuw5ToNsrcTft3xjwTDCRFHv+jA
	fkce0qYN7P0kVKDJ8es9eltua+rYbM/vpgbVoEdYG2R3A7Dq+Uqi5B1G92TVNY+TVin4+DgJAGHn6
	JgHRwzVHjYyayJpyD44A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqNRQ-00F9PN-PP; Wed, 02 Nov 2022 23:46:40 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqNGY-00F1m3-Gb
	for linux-riscv@bombadil.infradead.org; Wed, 02 Nov 2022 23:35:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0o+EzHHK0qEKuJS4nAvuf1qFUtMYU5Pn7Tw+MdMbo24=; b=GscQxu2BjYwCGdzrmQTjKnOECA
	M5yNYB1V/NM88ECZZozncS+ry6VBGc6E0OJO188eZLbMQ6/vlAQl0ZWKrT+OZXV6FwesXCMJoxf+l
	6crrSLxgwNzr7aZJpcrQRVo5TjWZnGvL4vNtUnHYTpW0jXxCaZzvleTLwRRq/mCQk9i/TBjzHSAYT
	fA4nmyVUU5Pdy7Mx0sATIF7Il3dI6lOUxUnZaGaW314/P8wyJ0LugzJXXzI3fUglTLFXwQ9tEK++m
	8g/NwbFn9s7pK6K5T+xgZ7YNDoWToubZOXz34WegwoYu03MrzOMyHy3+hU61j/3Cd+6jK9xrVk/5P
	ZEaSi9YA==;
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqN1V-005vql-B4
	for linux-riscv@lists.infradead.org; Wed, 02 Nov 2022 23:19:55 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-37342ba89dbso1128847b3.1
        for <linux-riscv@lists.infradead.org>; Wed, 02 Nov 2022 16:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=0o+EzHHK0qEKuJS4nAvuf1qFUtMYU5Pn7Tw+MdMbo24=;
        b=EIb+S3KjwEE+ZmqC6GbVJJy8amB++eLjJ+/jiG87MMc/wFbRU0kx0J4wCKJ8j6nNjs
         za+Fdn/Zmx7Nwq0npY2wSE6K/65mKpituGYshWgszbXujsa2C4LOGKYmBrXWAMqsHhZk
         dzAug91CI+xQams4Ntwr0hTe4dRBZOSfAhxxeRSz8D7gTCIm4bWh+wmhFWuITQJ5GWZI
         p8Ppdaut1HKYwQiz88BhbW052nrk95os7SRI+oqJvvM8DT8p9187Bsm3Ibwh0slRJL7C
         GuHqGcSZ+hhn6XS4bRu2tYDaytkFylv9nYI38h0KA40gF/Dhf137+j/nMwytxcCY0bIV
         yxuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0o+EzHHK0qEKuJS4nAvuf1qFUtMYU5Pn7Tw+MdMbo24=;
        b=ekpKdsSHKddPWo/ge3v5nOJDdO72sD0Gt7Cj7/OTxiUL1rQ4YyaASJmnJXI1zzFyuz
         MpKKv0jMZBPxjF/Pff/y3T+55IIymHPdMSa2g1ua69FDRP/nYsBGx4wxN1m8iBoiutSy
         oO+1zskksFxCW0LeR9OshlPGKf7kbY9kJdYIvM7ORS6RckKn4CzVFhmRFY95PPo3x+vg
         5WPYuxKufjSi9rIx7oEFQudY6QZG6vTUh87NCB15RAgJ2pjI+55ixIURgMX9rEbDnUNj
         iN78JVY5FEOQu4HPo892T9VRwIdrnuxaY45I2fKphDmMKviJqr5tI5+erXhcTPe7UWUU
         YxPA==
X-Gm-Message-State: ACrzQf2IMGc3HoqyeAaN7Kq2f5Mtju5ifKjQOYneyFcKpgohQxbmBbem
	lMgTSqEI+vs5Hq5nydbmsa/hvg7KR9k=
X-Google-Smtp-Source: AMsMyM4BtppDJKgcriXyYQiJchXeoNkFVVMupwaiPk8mRMPwi+bT/3boEB5+2TF1+6y9viZ/we/mwFmDxqY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:3984:0:b0:370:7d9b:7a6d with SMTP id
 g126-20020a813984000000b003707d9b7a6dmr13100947ywa.274.1667431186021; Wed, 02
 Nov 2022 16:19:46 -0700 (PDT)
Date: Wed,  2 Nov 2022 23:18:46 +0000
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221102231911.3107438-20-seanjc@google.com>
Subject: [PATCH 19/44] KVM: MIPS: Hardcode callbacks to hardware
 virtualization extensions
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Atish Patra <atishp@atishpatra.org>, David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Fabiano Rosas <farosas@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Chao Gao <chao.gao@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Yuan Yao <yuan.yao@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_231953_412962_AB3A9F0E 
X-CRM114-Status: GOOD (  16.77  )
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

Now that KVM no longer supports trap-and-emulate (see commit 45c7e8af4a5e
"MIPS: Remove KVM_TE support"), hardcode the MIPS callbacks to the
virtualization callbacks.

Harcoding the callbacks eliminates the technically-unnecessary check on
non-NULL kvm_mips_callbacks in kvm_arch_init().  MIPS has never supported
multiple in-tree modules, i.e. barring an out-of-tree module, where
copying and renaming kvm.ko counts as "out-of-tree", KVM could never
encounter a non-NULL set of callbacks during module init.

The callback check is also subtly broken, as it is not thread safe,
i.e. if there were multiple modules, loading both concurrently would
create a race between checking and setting kvm_mips_callbacks.

Given that out-of-tree shenanigans are not the kernel's responsibility,
hardcode the callbacks to simplify the code.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/mips/include/asm/kvm_host.h |  2 +-
 arch/mips/kvm/Makefile           |  2 +-
 arch/mips/kvm/callback.c         | 14 --------------
 arch/mips/kvm/mips.c             |  9 ++-------
 arch/mips/kvm/vz.c               |  7 ++++---
 5 files changed, 8 insertions(+), 26 deletions(-)
 delete mode 100644 arch/mips/kvm/callback.c

diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
index 28f0ba97db71..2803c9c21ef9 100644
--- a/arch/mips/include/asm/kvm_host.h
+++ b/arch/mips/include/asm/kvm_host.h
@@ -758,7 +758,7 @@ struct kvm_mips_callbacks {
 	void (*vcpu_reenter)(struct kvm_vcpu *vcpu);
 };
 extern struct kvm_mips_callbacks *kvm_mips_callbacks;
-int kvm_mips_emulation_init(struct kvm_mips_callbacks **install_callbacks);
+int kvm_mips_emulation_init(void);
 
 /* Debug: dump vcpu state */
 int kvm_arch_vcpu_dump_regs(struct kvm_vcpu *vcpu);
diff --git a/arch/mips/kvm/Makefile b/arch/mips/kvm/Makefile
index 21ff75bcdbc4..805aeea2166e 100644
--- a/arch/mips/kvm/Makefile
+++ b/arch/mips/kvm/Makefile
@@ -17,4 +17,4 @@ kvm-$(CONFIG_CPU_LOONGSON64) += loongson_ipi.o
 
 kvm-y		+= vz.o
 obj-$(CONFIG_KVM)	+= kvm.o
-obj-y			+= callback.o tlb.o
+obj-y			+= tlb.o
diff --git a/arch/mips/kvm/callback.c b/arch/mips/kvm/callback.c
deleted file mode 100644
index d88aa2173fb0..000000000000
--- a/arch/mips/kvm/callback.c
+++ /dev/null
@@ -1,14 +0,0 @@
-/*
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- *
- * Copyright (C) 2012  MIPS Technologies, Inc.  All rights reserved.
- * Authors: Yann Le Du <ledu@kymasys.com>
- */
-
-#include <linux/export.h>
-#include <linux/kvm_host.h>
-
-struct kvm_mips_callbacks *kvm_mips_callbacks;
-EXPORT_SYMBOL_GPL(kvm_mips_callbacks);
diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index af29490d9740..f0a6c245d1ff 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -1012,17 +1012,12 @@ long kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
 
 int kvm_arch_init(void *opaque)
 {
-	if (kvm_mips_callbacks) {
-		kvm_err("kvm: module already exists\n");
-		return -EEXIST;
-	}
-
-	return kvm_mips_emulation_init(&kvm_mips_callbacks);
+	return kvm_mips_emulation_init();
 }
 
 void kvm_arch_exit(void)
 {
-	kvm_mips_callbacks = NULL;
+
 }
 
 int kvm_arch_vcpu_ioctl_get_sregs(struct kvm_vcpu *vcpu,
diff --git a/arch/mips/kvm/vz.c b/arch/mips/kvm/vz.c
index c706f5890a05..dafab003ea0d 100644
--- a/arch/mips/kvm/vz.c
+++ b/arch/mips/kvm/vz.c
@@ -3304,7 +3304,10 @@ static struct kvm_mips_callbacks kvm_vz_callbacks = {
 	.vcpu_reenter = kvm_vz_vcpu_reenter,
 };
 
-int kvm_mips_emulation_init(struct kvm_mips_callbacks **install_callbacks)
+/* FIXME: Get rid of the callbacks now that trap-and-emulate is gone. */
+struct kvm_mips_callbacks *kvm_mips_callbacks = &kvm_vz_callbacks;
+
+int kvm_mips_emulation_init(void)
 {
 	if (!cpu_has_vz)
 		return -ENODEV;
@@ -3318,7 +3321,5 @@ int kvm_mips_emulation_init(struct kvm_mips_callbacks **install_callbacks)
 		return -ENODEV;
 
 	pr_info("Starting KVM with MIPS VZ extensions\n");
-
-	*install_callbacks = &kvm_vz_callbacks;
 	return 0;
 }
-- 
2.38.1.431.g37b22c650d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
