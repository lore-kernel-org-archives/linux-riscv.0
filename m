Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C87CD37AF
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Sep 2023 00:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p6ki8UaZHm29h0TaMzmKXyCUc2V2YII7laAvNOb75Fw=; b=tcprGYpgVljtim
	UNjY+5L6sY1zUidreohrs3uqXCRzo6zYfOh+TFhBgfxJoXEI6IfkQ50KZOIHOA8EQYN81TILtJRz+
	nY3RFLB2t0ZUq7EbjtvsRfS7tSjSrTwBm1dD4JzDq584V1SUJ1QkK9DFoCJqbsGo1FsMmKsSfUUGm
	zSXiqTo9UtcO8LHuOur+JygTd/8a0NX/61Oqq5eh+Mz5KzZfI/KD0ICNnA/EPtHQ4QvVazFPu/Kgx
	hEOwfDZczocI12flsw05FWvCo/d2U5cH9rYsYVIAHz6yMd8JEZff/vtfVihau+Zt60KeXRPheTzki
	xiloh6naUmABlcU7TjmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhJEC-00Bd3S-0Q;
	Sat, 16 Sep 2023 00:32:04 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhJDi-00BcTK-1H
	for linux-riscv@lists.infradead.org;
	Sat, 16 Sep 2023 00:31:39 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1c4375c1406so10016615ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 17:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694824291; x=1695429091; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=C0sn2AnVcRbsYEvqFgh4BzWbc2uKAyyxP92cnWXv5Gc=;
        b=jqeMsobTypv41nhF1VsBMleCINHBpUELSqnt8vUayY4xXFsyJabfts/ZjIBqqig4xw
         CIgin4DlGvmDXNudjhlqfqMny+OyUbDLrINrcs4D2iUkndm8smYPtcxDawJ5+WExDrZV
         vZSYR0hK+1fGMz04imxewRFn9z4sV/QMgZMlEJ1BTX4Q/XYmYlxNyZ+MUAgGNlSILOIQ
         s8tbEK8rRbC6XVXi12CwnrwUbbFzAF6GsTPEAa7Yb3J2Gp6LrARIiAgaGqTlUZqsD0an
         LKW62bTiTq/6G95xX03fZXd2C5nLFSGSi80hSx/sgaElfOzsIJNpOmrzjWe+X4A5wAHU
         FO6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694824291; x=1695429091;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C0sn2AnVcRbsYEvqFgh4BzWbc2uKAyyxP92cnWXv5Gc=;
        b=EaFE26uh5/D/Ru1ijs9bMtoyrab1Y2YDpe2py5YVuBC+VlQvJwD6db9yM1P0aOiZLe
         z7A4NRJ/+EdLPLtxiS3CS0ntLlyl292Ud1UBJ4yWYpieY3bZ/11b7HKn2Yp6N5neazPE
         Gfb3mgRtMWGxd8Ca/Btq5ytXs48/zxEnXOMLLyYjeYjmcwUM4LZte1szGeWTWYKMvLZF
         uiTCq7quCkzgcB9XNU9IQSsKbdibDdcxar0+bNeykfyN/3WR+FibFrI1sI+/E5ckPiC8
         HyY6F53U0pLf6HCMkAd5m1s2qJ8UTbngexEAd3SrLCR08LEBBLf1SHH2quePzq5ivyWA
         QGkQ==
X-Gm-Message-State: AOJu0YzF1VzzFII1781ROgiNXCI3aHRMUozC2Z8AW9ek43G1rUVPi1tW
	oqAHIKfiodqt6XcvkP0t0NZSHEwOGB0=
X-Google-Smtp-Source: AGHT+IHtRyj8S1iXRa1AyuzUMEtuqAzbJZbP2iFNCt3KVQZXM+xbuQMnV6uSJ406DSy/keoiXYz83X05kPo=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:41c2:b0:1c1:fbec:bc39 with SMTP id
 u2-20020a17090341c200b001c1fbecbc39mr73146ple.4.1694824290982; Fri, 15 Sep
 2023 17:31:30 -0700 (PDT)
Date: Fri, 15 Sep 2023 17:30:57 -0700
In-Reply-To: <20230916003118.2540661-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230916003118.2540661-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Message-ID: <20230916003118.2540661-6-seanjc@google.com>
Subject: [PATCH 05/26] vfio: KVM: Pass get/put helpers from KVM to VFIO, don't
 do circular lookup
From: Sean Christopherson <seanjc@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Tony Krowiak <akrowiak@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, 
	Jason Herne <jjherne@linux.ibm.com>, Harald Freudenberger <freude@linux.ibm.com>, 
	Alex Williamson <alex.williamson@redhat.com>, Andy Lutomirski <luto@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Anish Ghulati <aghulati@google.com>, Venkatesh Srinivas <venkateshs@chromium.org>, 
	Andrew Thornton <andrewth@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_173134_492676_E2653AA8 
X-CRM114-Status: GOOD (  19.01  )
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

Explicitly pass KVM's get/put helpers to VFIO when attaching a VM to
VFIO instead of having VFIO do a symbol lookup back into KVM.  Having both
KVM and VFIO do symbol lookups increases the overall complexity and places
an unnecessary dependency on KVM (from VFIO) without adding any value.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/vfio/vfio.h      |  2 ++
 drivers/vfio/vfio_main.c | 74 +++++++++++++++++++---------------------
 include/linux/vfio.h     |  4 ++-
 virt/kvm/vfio.c          |  9 +++--
 4 files changed, 47 insertions(+), 42 deletions(-)

diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index a1f741365075..eec51c7ee822 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -19,6 +19,8 @@ struct vfio_container;
 
 struct vfio_kvm_reference {
 	struct kvm			*kvm;
+	bool				(*get_kvm)(struct kvm *kvm);
+	void				(*put_kvm)(struct kvm *kvm);
 	spinlock_t			lock;
 };
 
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index e77e8c6aae2f..1f58ab6dbcd2 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -16,7 +16,6 @@
 #include <linux/fs.h>
 #include <linux/idr.h>
 #include <linux/iommu.h>
-#include <linux/kvm_host.h>
 #include <linux/list.h>
 #include <linux/miscdevice.h>
 #include <linux/module.h>
@@ -1306,38 +1305,22 @@ EXPORT_SYMBOL_GPL(vfio_file_enforced_coherent);
 void vfio_device_get_kvm_safe(struct vfio_device *device,
 			      struct vfio_kvm_reference *ref)
 {
-	void (*pfn)(struct kvm *kvm);
-	bool (*fn)(struct kvm *kvm);
-	bool ret;
-
 	lockdep_assert_held(&device->dev_set->lock);
 
+	/*
+	 * Note!  The "kvm" and "put_kvm" pointers *must* be transferred to the
+	 * device so that the device can put its reference to KVM.  KVM can
+	 * invoke vfio_device_set_kvm() to detach from VFIO, i.e. nullify all
+	 * pointers in @ref, even if a device holds a reference to KVM!  That
+	 * also means that detaching KVM from VFIO only prevents "new" devices
+	 * from using KVM, it doesn't invalidate KVM references in existing
+	 * devices.
+	 */
 	spin_lock(&ref->lock);
-
-	if (!ref->kvm)
-		goto out;
-
-	pfn = symbol_get(kvm_put_kvm);
-	if (WARN_ON(!pfn))
-		goto out;
-
-	fn = symbol_get(kvm_get_kvm_safe);
-	if (WARN_ON(!fn)) {
-		symbol_put(kvm_put_kvm);
-		goto out;
+	if (ref->kvm && ref->get_kvm(ref->kvm)) {
+		device->kvm = ref->kvm;
+		device->put_kvm = ref->put_kvm;
 	}
-
-	ret = fn(ref->kvm);
-	symbol_put(kvm_get_kvm_safe);
-	if (!ret) {
-		symbol_put(kvm_put_kvm);
-		goto out;
-	}
-
-	device->put_kvm = pfn;
-	device->kvm = ref->kvm;
-
-out:
 	spin_unlock(&ref->lock);
 }
 
@@ -1353,28 +1336,37 @@ void vfio_device_put_kvm(struct vfio_device *device)
 
 	device->put_kvm(device->kvm);
 	device->put_kvm = NULL;
-	symbol_put(kvm_put_kvm);
-
 clear:
 	device->kvm = NULL;
 }
 
 static void vfio_device_set_kvm(struct vfio_kvm_reference *ref,
-				struct kvm *kvm)
+				struct kvm *kvm,
+				bool (*get_kvm)(struct kvm *kvm),
+				void (*put_kvm)(struct kvm *kvm))
 {
+	if (WARN_ON_ONCE(kvm && (!get_kvm || !put_kvm)))
+		return;
+
 	spin_lock(&ref->lock);
 	ref->kvm = kvm;
+	ref->get_kvm = get_kvm;
+	ref->put_kvm = put_kvm;
 	spin_unlock(&ref->lock);
 }
 
-static void vfio_group_set_kvm(struct vfio_group *group, struct kvm *kvm)
+static void vfio_group_set_kvm(struct vfio_group *group, struct kvm *kvm,
+			       bool (*get_kvm)(struct kvm *kvm),
+			       void (*put_kvm)(struct kvm *kvm))
 {
 #if IS_ENABLED(CONFIG_VFIO_GROUP)
-	vfio_device_set_kvm(&group->kvm_ref, kvm);
+	vfio_device_set_kvm(&group->kvm_ref, kvm, get_kvm, put_kvm);
 #endif
 }
 
-static void vfio_device_file_set_kvm(struct file *file, struct kvm *kvm)
+static void vfio_device_file_set_kvm(struct file *file, struct kvm *kvm,
+				     bool (*get_kvm)(struct kvm *kvm),
+				     void (*put_kvm)(struct kvm *kvm))
 {
 	struct vfio_device_file *df = file->private_data;
 
@@ -1383,27 +1375,31 @@ static void vfio_device_file_set_kvm(struct file *file, struct kvm *kvm)
 	 * be propagated to vfio_device::kvm when the file is bound to
 	 * iommufd successfully in the vfio device cdev path.
 	 */
-	vfio_device_set_kvm(&df->kvm_ref, kvm);
+	vfio_device_set_kvm(&df->kvm_ref, kvm, get_kvm, put_kvm);
 }
 
 /**
  * vfio_file_set_kvm - Link a kvm with VFIO drivers
  * @file: VFIO group file or VFIO device file
  * @kvm: KVM to link
+ * @get_kvm: Callback to get a reference to @kvm
+ * @put_kvm: Callback to put a reference to @kvm
  *
  * When a VFIO device is first opened the KVM will be available in
  * device->kvm if one was associated with the file.
  */
-void vfio_file_set_kvm(struct file *file, struct kvm *kvm)
+void vfio_file_set_kvm(struct file *file, struct kvm *kvm,
+		       bool (*get_kvm)(struct kvm *kvm),
+		       void (*put_kvm)(struct kvm *kvm))
 {
 	struct vfio_group *group;
 
 	group = vfio_group_from_file(file);
 	if (group)
-		vfio_group_set_kvm(group, kvm);
+		vfio_group_set_kvm(group, kvm, get_kvm, put_kvm);
 
 	if (vfio_device_from_file(file))
-		vfio_device_file_set_kvm(file, kvm);
+		vfio_device_file_set_kvm(file, kvm, get_kvm, put_kvm);
 }
 EXPORT_SYMBOL_GPL(vfio_file_set_kvm);
 #endif
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index e80955de266c..35e970e3d3fb 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -312,7 +312,9 @@ static inline bool vfio_file_has_dev(struct file *file, struct vfio_device *devi
 bool vfio_file_is_valid(struct file *file);
 bool vfio_file_enforced_coherent(struct file *file);
 #if IS_ENABLED(CONFIG_KVM)
-void vfio_file_set_kvm(struct file *file, struct kvm *kvm);
+void vfio_file_set_kvm(struct file *file, struct kvm *kvm,
+		       bool (*get_kvm)(struct kvm *kvm),
+		       void (*put_kvm)(struct kvm *kvm));
 #endif
 
 #define VFIO_PIN_PAGES_MAX_ENTRIES	(PAGE_SIZE/sizeof(unsigned long))
diff --git a/virt/kvm/vfio.c b/virt/kvm/vfio.c
index ca24ce120906..f14fcbb34bc6 100644
--- a/virt/kvm/vfio.c
+++ b/virt/kvm/vfio.c
@@ -37,13 +37,18 @@ struct kvm_vfio {
 
 static void kvm_vfio_file_set_kvm(struct file *file, struct kvm *kvm)
 {
-	void (*fn)(struct file *file, struct kvm *kvm);
+	void (*fn)(struct file *file, struct kvm *kvm,
+		   bool (*get_kvm)(struct kvm *kvm),
+		   void (*put_kvm)(struct kvm *kvm));
 
 	fn = symbol_get(vfio_file_set_kvm);
 	if (!fn)
 		return;
 
-	fn(file, kvm);
+	if (kvm)
+		fn(file, kvm, kvm_get_kvm_safe, kvm_put_kvm);
+	else
+		fn(file, kvm, NULL, NULL);
 
 	symbol_put(vfio_file_set_kvm);
 }
-- 
2.42.0.459.ge4e396fd5e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
