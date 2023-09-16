Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEEA9CD37AF
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Sep 2023 00:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9XaYO7TDqMW0ev6kFNmAlgFj7VDNZLLIs2WYIKP2a3g=; b=i5+MGNmwzVm2Xr
	wc9v+JTFWxPqOCxeW1IqBL9gkp/2iFb/mG5sCKduxj2/jNcngbap00N/8alXCyU8x1a52F6EQL2rU
	eBUDEoYbZ5oSwrvGnr6D+hNq5T649aio3+h1xyBpVoFnRQcYy4Kf07pIa6BnzUkD9+4JeONYLEGId
	0L9AWrY9EiLphc5vNRQO777lfLcLYPo6t4LP7HYUMnOrVvbs7s67VWuVAsLq1fnLKSJxH0sN5/U/A
	w+1jOkaiI9uY6cBTesU3KdIAHrZzG4QYRvrV3cESNKqBsRE1YYYNYwSM2qk2beZYpUPbBPGuTq2PK
	eY4XaSHsvuHcYSm4IQVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhJDq-00Bcem-12;
	Sat, 16 Sep 2023 00:31:42 +0000
Received: from mail-oa1-x4a.google.com ([2001:4860:4864:20::4a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhJDb-00BcNA-0c
	for linux-riscv@lists.infradead.org;
	Sat, 16 Sep 2023 00:31:31 +0000
Received: by mail-oa1-x4a.google.com with SMTP id 586e51a60fabf-1b728bfb372so4416338fac.2
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 17:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694824284; x=1695429084; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=NdOAPx70WjWtTXOKtIxgwEtN+XJRELer/ruyZoFwPzQ=;
        b=LSquUboBDoQ7KX4y/WPTLIPUsaCl72dhIc0X/rKkpVaRLs7PKmbtHjA4s7bh+zaMCV
         eqYI2syT9HFV5iKs76v6cXfEDFW01sNZWGOuhis1vIXp+5Bg6AtKNDBEgAwLvKxeU1Pp
         xIo6aBZ7VwKqOPO2qeTk1EW9e5InPNGysEmmS67t5Woque/ViGY1loxGQ+zFXEm9suzK
         DuVgEzB9puF7k819xSf4xlm5TVVl4xwAd6iyyVaCvz3K6CHxmXCnDV6XSuRUskS2Eoli
         8elzgoJLg1LZilp32721lIEm9G1gU8Ygmd+UYm5tvp0GyMzoooBvdOSBmyAoQ4gzToss
         1lHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694824284; x=1695429084;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NdOAPx70WjWtTXOKtIxgwEtN+XJRELer/ruyZoFwPzQ=;
        b=fSrJqsv5jKIenFvDmoFUJFSV+cXhf9V2A67tL8A6IRRepA323x7ZWHjJ+77/77fd6i
         dz4tqv1k4T1sp9qkUrlbpckNpDZXHwhDSVfF8evWa6UvA5KltQCeiIwdcw0gDo24J8E3
         ZodIvyLCGBGiLbwAc3PBQ/nLXK9yeUVaYnO0eUSibTid2eeRTqjtLI3XfVP6sG67Hhjj
         PN/mGoUOE0IE+143WUXResUiKHfCHua64wKAkOdC5vsmxUF8SME6urPGcxeDGq6te7v0
         Iqs6t8pB8RO7R0fiimdwsz9SUrRXainNYKfG7yLwvjh1WSaNOEqKFL5Ap9z+g8/DjajL
         KIhg==
X-Gm-Message-State: AOJu0Yw7ltq6SkvV6xD7jHaAzxcNhXE48xiVGNavJ/1QpWXQbSyFweyO
	euNHZXEumvd4sL8L0HdWpkQumhiazXo=
X-Google-Smtp-Source: AGHT+IFjfayrLbVmI/uUcITF7riix4t2p7LQSznFwYgaB2xPw0hEc6MrZUjOPPPKeYuL02E3L+TxPOZWHW4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6870:b7ad:b0:1d6:4da3:ae2d with SMTP id
 ed45-20020a056870b7ad00b001d64da3ae2dmr1068876oab.7.1694824284654; Fri, 15
 Sep 2023 17:31:24 -0700 (PDT)
Date: Fri, 15 Sep 2023 17:30:54 -0700
In-Reply-To: <20230916003118.2540661-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230916003118.2540661-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Message-ID: <20230916003118.2540661-3-seanjc@google.com>
Subject: [PATCH 02/26] vfio: Move KVM get/put helpers to colocate it with
 other KVM related code
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
X-CRM114-CacheID: sfid-20230915_173127_270835_DFE37DB3 
X-CRM114-Status: GOOD (  12.75  )
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

Move the definitions of vfio_device_get_kvm_safe() and vfio_device_put_kvm()
down in vfio_main.c to colocate them with other KVM-specific functions,
e.g. to allow wrapping them all with a single CONFIG_KVM check.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/vfio/vfio_main.c | 104 +++++++++++++++++++--------------------
 1 file changed, 52 insertions(+), 52 deletions(-)

diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 80e39f7a6d8f..6368eed7b7b2 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -381,58 +381,6 @@ void vfio_unregister_group_dev(struct vfio_device *device)
 }
 EXPORT_SYMBOL_GPL(vfio_unregister_group_dev);
 
-#if IS_ENABLED(CONFIG_KVM)
-void vfio_device_get_kvm_safe(struct vfio_device *device, struct kvm *kvm)
-{
-	void (*pfn)(struct kvm *kvm);
-	bool (*fn)(struct kvm *kvm);
-	bool ret;
-
-	lockdep_assert_held(&device->dev_set->lock);
-
-	if (!kvm)
-		return;
-
-	pfn = symbol_get(kvm_put_kvm);
-	if (WARN_ON(!pfn))
-		return;
-
-	fn = symbol_get(kvm_get_kvm_safe);
-	if (WARN_ON(!fn)) {
-		symbol_put(kvm_put_kvm);
-		return;
-	}
-
-	ret = fn(kvm);
-	symbol_put(kvm_get_kvm_safe);
-	if (!ret) {
-		symbol_put(kvm_put_kvm);
-		return;
-	}
-
-	device->put_kvm = pfn;
-	device->kvm = kvm;
-}
-
-void vfio_device_put_kvm(struct vfio_device *device)
-{
-	lockdep_assert_held(&device->dev_set->lock);
-
-	if (!device->kvm)
-		return;
-
-	if (WARN_ON(!device->put_kvm))
-		goto clear;
-
-	device->put_kvm(device->kvm);
-	device->put_kvm = NULL;
-	symbol_put(kvm_put_kvm);
-
-clear:
-	device->kvm = NULL;
-}
-#endif
-
 /* true if the vfio_device has open_device() called but not close_device() */
 static bool vfio_assert_device_open(struct vfio_device *device)
 {
@@ -1354,6 +1302,58 @@ bool vfio_file_enforced_coherent(struct file *file)
 }
 EXPORT_SYMBOL_GPL(vfio_file_enforced_coherent);
 
+#if IS_ENABLED(CONFIG_KVM)
+void vfio_device_get_kvm_safe(struct vfio_device *device, struct kvm *kvm)
+{
+	void (*pfn)(struct kvm *kvm);
+	bool (*fn)(struct kvm *kvm);
+	bool ret;
+
+	lockdep_assert_held(&device->dev_set->lock);
+
+	if (!kvm)
+		return;
+
+	pfn = symbol_get(kvm_put_kvm);
+	if (WARN_ON(!pfn))
+		return;
+
+	fn = symbol_get(kvm_get_kvm_safe);
+	if (WARN_ON(!fn)) {
+		symbol_put(kvm_put_kvm);
+		return;
+	}
+
+	ret = fn(kvm);
+	symbol_put(kvm_get_kvm_safe);
+	if (!ret) {
+		symbol_put(kvm_put_kvm);
+		return;
+	}
+
+	device->put_kvm = pfn;
+	device->kvm = kvm;
+}
+
+void vfio_device_put_kvm(struct vfio_device *device)
+{
+	lockdep_assert_held(&device->dev_set->lock);
+
+	if (!device->kvm)
+		return;
+
+	if (WARN_ON(!device->put_kvm))
+		goto clear;
+
+	device->put_kvm(device->kvm);
+	device->put_kvm = NULL;
+	symbol_put(kvm_put_kvm);
+
+clear:
+	device->kvm = NULL;
+}
+#endif
+
 static void vfio_device_file_set_kvm(struct file *file, struct kvm *kvm)
 {
 	struct vfio_device_file *df = file->private_data;
-- 
2.42.0.459.ge4e396fd5e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
