Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A524C47088
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 23:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TT05gS+Lkj/9crfQVN075RmRYG9ZUbT355j2/IqCi7o=; b=U1tSaHrw5KeAym
	yjH0xsfT212ZPKCfCMBvwPMIMUbiqCFWG2dzoxypfqnlZfQJTyVHXOzesB1jcKNjPFe3qS+T9mA0E
	j4/T2XG/+ehxtAeiTOTe5ekc1IgffTLoZpTtx2hA2y1D96n4aXHQoBBFvk0hxqFTA5SyOQXexHj2u
	PhiOb71A7URxDNETSE7gnn4Bnjcux69HusOnxmHTox71+sHxYecxk+8NsjRWTHVBDMTTizmz0m/qZ
	7tegjgWB2CVpqZKGCyDUtokDu4ZOUSuMwFrSPmxWZkADozB5P/xXUKKPXCz8tVwulzfYfQzm3iJEL
	I6rOxJPUUCAsKaxafdDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0WnH-003M44-NT; Wed, 30 Nov 2022 23:47:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0WUW-003E7h-OE
	for linux-riscv@bombadil.infradead.org; Wed, 30 Nov 2022 23:27:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QlJvPwjggaoIvKlYM82YemehOzmoztqkkgxFsX+UpR8=; b=J3zqGjYp1ztIn1uihtbsTkxEnL
	+3QouOocFugOrKzzlcjiPiZt+hAbsZW8cf/DLda18hOHQ0CoTkHkcRW26oqzZtDVTbN1JgPuN0Iue
	r8hfqKGV3hrqfw+37cqSp/JesQ95P9VoqpszMax+PGO+Q31i/fbA8tJ+D+4Vsf87fGIAKp28aFSb8
	YbcStTfvOV8aWyCtiWoPjDCEKrY9z06/gGA7shLNSrlRSmeZ7ZGGuXuSh0nNxaVculHw8nEAuRPaH
	VK1/4z2HYAfNf9bP04ZLmVu0d+9RKCfrXwnfVfP045XJmHfdRA+z8KsSur8PMh2CAP0IAxZHmEsgi
	LyOzUxjQ==;
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0WDD-006B6Z-RK
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 23:10:45 +0000
Received: by mail-pl1-x64a.google.com with SMTP id i8-20020a170902c94800b0018712ccd6bbso18955015pla.1
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 15:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=QlJvPwjggaoIvKlYM82YemehOzmoztqkkgxFsX+UpR8=;
        b=T6DVUHgDiyaylj8jeyRc/tJaTPsEr56sFr6JiiJRfSgSRo4JFqx/NfTBtkGCflU1T7
         GmuQ0fJ2MLIx5SmWh7sz9Aupssh3H218XdF/xeVe4kwLx4dVNwO7NE6dtVecycuMR5h8
         hR5EaWsYFF9XRSIsck9agUPNZK/p+WoiJvAdnD8SuIwugfV9C29gWgEeXNNCOEGguRb0
         XjIfVg1fZ984NsiEdqOG53u7zIAyct6pqlzwtwTUD+/QpAUDoczJMloj4YeV6uaJ57LY
         pm1/ZmMCMtVst2hZA3dRvqmU4AoS7D9glw2GuspqwXSz0dSJzOpa3Jh+TkIBwm3FDrfG
         N1xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QlJvPwjggaoIvKlYM82YemehOzmoztqkkgxFsX+UpR8=;
        b=YbHoLl8SBRGwtM7gxFy88mMcpHQ/kFNbzGHRflWgmwvd00EUlfuf8TerWyuMYjtyU2
         Nv5DxwQddP1aIxb695Sx9IZMnWOcW44Bix1tPb1WY2E1ExxcTNH4lMVieF9qfzyXnWwW
         TTiYWVomYVZ+PWQHiCCMQfbEMCCxw63JfKNIkf+WBoIJD5/iLVHsJix9da5UviuBwg5G
         Q6IH1MGOK250jLM1eteBDizJPXjBNttxa63T0MNYDun/e2LTnD8umq6ZX2Q6cbJNfL5i
         absdaB3EAxdhrGZkObB6daoogk1ExsPpmfG65PihppDhKnOqtCUX+blxn7asJKdwNaxP
         q/uA==
X-Gm-Message-State: ANoB5pnAXEbm7QnuGmbWXPSkeR97qDQzoxabJRYIGv/c4wHwrdFkEBmZ
	BmzygxHbaEbEwwCrT/2a1He29O7BZZE=
X-Google-Smtp-Source: AA0mqf44tW9GDP3EkdJH7xw0iZ70GDsfIH9r2lh+gXnuxkKZzS4e7JkPFcOIgykrnjSYDs+Xry7x+GKdL/s=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a62:3084:0:b0:56d:dd2a:c494 with SMTP id
 w126-20020a623084000000b0056ddd2ac494mr44471552pfw.76.1669849787908; Wed, 30
 Nov 2022 15:09:47 -0800 (PST)
Date: Wed, 30 Nov 2022 23:08:50 +0000
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221130230934.1014142-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221130230934.1014142-7-seanjc@google.com>
Subject: [PATCH v2 06/50] KVM: s390: Move hardware setup/unsetup to init/exit
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
X-CRM114-CacheID: sfid-20221130_230957_205351_45CFEA46 
X-CRM114-Status: GOOD (  10.35  )
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

Now that kvm_arch_hardware_setup() is called immediately after
kvm_arch_init(), fold the guts of kvm_arch_hardware_(un)setup() into
kvm_arch_{init,exit}() as a step towards dropping one of the hooks.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
Reviewed-by: Eric Farman <farman@linux.ibm.com>
---
 arch/s390/kvm/kvm-s390.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index 221481a09742..97c7ccd189eb 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -331,21 +331,12 @@ static struct notifier_block kvm_clock_notifier = {
 
 int kvm_arch_hardware_setup(void *opaque)
 {
-	gmap_notifier.notifier_call = kvm_gmap_notifier;
-	gmap_register_pte_notifier(&gmap_notifier);
-	vsie_gmap_notifier.notifier_call = kvm_s390_vsie_gmap_notifier;
-	gmap_register_pte_notifier(&vsie_gmap_notifier);
-	atomic_notifier_chain_register(&s390_epoch_delta_notifier,
-				       &kvm_clock_notifier);
 	return 0;
 }
 
 void kvm_arch_hardware_unsetup(void)
 {
-	gmap_unregister_pte_notifier(&gmap_notifier);
-	gmap_unregister_pte_notifier(&vsie_gmap_notifier);
-	atomic_notifier_chain_unregister(&s390_epoch_delta_notifier,
-					 &kvm_clock_notifier);
+
 }
 
 static void allow_cpu_feat(unsigned long nr)
@@ -525,6 +516,13 @@ int kvm_arch_init(void *opaque)
 	if (rc)
 		goto err_gib;
 
+	gmap_notifier.notifier_call = kvm_gmap_notifier;
+	gmap_register_pte_notifier(&gmap_notifier);
+	vsie_gmap_notifier.notifier_call = kvm_s390_vsie_gmap_notifier;
+	gmap_register_pte_notifier(&vsie_gmap_notifier);
+	atomic_notifier_chain_register(&s390_epoch_delta_notifier,
+				       &kvm_clock_notifier);
+
 	return 0;
 
 err_gib:
@@ -541,6 +539,11 @@ int kvm_arch_init(void *opaque)
 
 void kvm_arch_exit(void)
 {
+	gmap_unregister_pte_notifier(&gmap_notifier);
+	gmap_unregister_pte_notifier(&vsie_gmap_notifier);
+	atomic_notifier_chain_unregister(&s390_epoch_delta_notifier,
+					 &kvm_clock_notifier);
+
 	kvm_s390_gib_destroy();
 	if (IS_ENABLED(CONFIG_VFIO_PCI_ZDEV_KVM))
 		kvm_s390_pci_exit();
-- 
2.38.1.584.g0f3c55d4c2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
