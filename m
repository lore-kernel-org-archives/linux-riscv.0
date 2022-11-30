Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61332C4321E
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 23:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u7GsnVyhI89apG3gugD4cssdfZIEsEaeAXz4tfzZqa4=; b=dI+cFeRtm9KMA6
	ejiKOlCo1ziDpzJWcM48oYuqpve4cKkUmMG+1fiM/ebaDhkmzxa+Nh+ZjLx2pVPCVk42p1ndTaXKv
	wy5U3sJudng4l7/zB7Iw5INTjW81R86jyAF8QVuQMoOGqEMn1D0k37WnxRPof/2rwggJS3mUL3pu7
	Z1WU0aakWjVjl7nNFBpF4rwk3m3ktpnjgzCWpoFr7qRI2cP1J1pEueiRGhxfAHrxUId5YO+wyZF0p
	m6PpDHpk8r/Rz7VNlaY4sOFxdl9PYCGI7lXJYKSaNsBIulxBksn+uEJrqBOpinBCpUdwUSrj0XrSx
	yV6UQtMHPKJazkPrM3VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Woz-003Mmq-Bz; Wed, 30 Nov 2022 23:48:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0WUa-003E7h-Hd
	for linux-riscv@bombadil.infradead.org; Wed, 30 Nov 2022 23:27:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=grdSlJzFo0VwdV8xgzvuVpRwKnA9GO3Mob4PH+ot8/0=; b=Bs4TTG1LH2xW2aSwoNJTHA4SdS
	J6jJBWVjy3LpshCwY5MYwnHOkv0OOymrui5bWIYlbvVQRDhNOA3KmUpxLdZBW//dy3NG3ZQwLMd6H
	rEBy9iXl1Lyc4aVhVbJf5Gnp1kEiOAF7Skj7eu0J0vbjX4hQJp561fpq6YkvYJ108OfrsRY3PopwM
	6bKi9aNiMncAjMtBVDYOVyV9VnM8VwKKmKBffYFOKKF8Okkx5PoDtGwHOB0RI6/86BouzXd1xT8py
	UPafpdYoUZPV+r13Bkd0aoW+CYl7qlqUnMFXpeS3w6eCtCiaLg/XtEH9ticyjqYVVdp2Dq2LuGzHA
	OTRtNbdw==;
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0WDW-006B6S-W9
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 23:10:17 +0000
Received: by mail-pf1-x44a.google.com with SMTP id 145-20020a621497000000b00574fab7294dso174463pfu.13
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 15:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=grdSlJzFo0VwdV8xgzvuVpRwKnA9GO3Mob4PH+ot8/0=;
        b=CQKSwij2dM5sxTN5vEM9Pg0UGQR7vXxLholFOCIYMDxZ1/3rA7vH+RqFmN1n0beWlD
         7+BAU4/MoU1Z2zohEeDLQA2mrNFcLMI1vaNT8JUT+3n3Smxr3wpQu7rVUMeYIUjzYrKM
         QQRXU+fmSvdsXsp/lH1ncccopWZ+njKFlSsnkmBo5RgV0L2uInmLnHD4wZGB2dqPvFNW
         AFZHsbz5az7ZAwj41de9s/UvOppce1LN8jHb5JWdYWBnJ4FReLvafLy5jclWK6UngF05
         cPIBeGpzAB3DL/mtUhAd3V5apiG8/mbBEcTlCsb8iWOJpXlQdaq+hFXcxIhaHoaH5jmv
         rjIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=grdSlJzFo0VwdV8xgzvuVpRwKnA9GO3Mob4PH+ot8/0=;
        b=1CeqT64yW3bOiH2L0tp7RXKe13KM/T1dsYhqHIB2odjQYKbYUdiVfK1YUyA9bMCiHZ
         d0NJy8qs640M2z+/K5v8Kks0M/SEl4U4x/gZx/BWNyMH7fV3TQ0yj9rtlUIzbWKjMAEc
         QkIl2AxpTFxwKy1Yf7t5XWyv2IZhocsun1xCuHjc4WsT6fjkszaw+H6alXtFfKzO6F98
         NsyKrzt07zxL4DBnGMI63wFPIvSdv9Ag4cOVEFh2hsK7atRvqvQhcJabZDGOa5kZ1jHC
         1JGHuvpH3MmfoL8xCn/AlWv+d91i+488ZezSodx9tsDIYsL+saJCYrwF9vzfHGPvmMXB
         oSTQ==
X-Gm-Message-State: ANoB5pnkXuO/H9zPawM0TniZetWqxmSYf7wFpGxg5ZW7hLFLkAzNhkdd
	LRCed1JFFPbb7xAPeeUeBAbPA+VNwCo=
X-Google-Smtp-Source: AA0mqf5utOkOs36wj8G4rTpG0ELlL4JMVDy82zEmZIH7sIXiucVOps+Q5AZsFyLWVU+C/qKz+GIkdE+8/9Y=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a62:648a:0:b0:572:76dd:3756 with SMTP id
 y132-20020a62648a000000b0057276dd3756mr45058073pfb.9.1669849813287; Wed, 30
 Nov 2022 15:10:13 -0800 (PST)
Date: Wed, 30 Nov 2022 23:09:05 +0000
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221130230934.1014142-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221130230934.1014142-22-seanjc@google.com>
Subject: [PATCH v2 21/50] KVM: MIPS: Hardcode callbacks to hardware
 virtualization extensions
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>
Cc: James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Atish Patra <atishp@atishpatra.org>, David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Yuan Yao <yuan.yao@intel.com>, 
	Cornelia Huck <cohuck@redhat.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	"=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=" <philmd@linaro.org>, Fabiano Rosas <farosas@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Kai Huang <kai.huang@intel.com>, Chao Gao <chao.gao@intel.com>, 
	Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_231015_482042_05977FA0 
X-CRM114-Status: GOOD (  17.91  )
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
2.38.1.584.g0f3c55d4c2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
