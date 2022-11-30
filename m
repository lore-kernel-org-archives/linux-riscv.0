Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA4CC4321E
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 00:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZSCaVJJjnvaWKjCLODRAag+Cwj05Dojd1/7BYMSxEYs=; b=nMqd56Pclh6yOF
	lOobdDRmhA4Shb74y1cZpcGrD7nSfKr++Hw3h84O0y8yTaYDCwl+mJ+qIvAI1R/g0oCNc/sBbIE61
	oYh819yYYOp0jTAHEKGpD7whckNxa6E/VSF07WCN7nzTJaFuxk8Fsq76LxBHemuOu3KkLaVKEEvrQ
	nOAPrworiOxcO8iQ7RtTJVKHCur9Ku2fIXa0RXwxgiylU+620MyBMLTZ2RR5LdmjQo7A+5Y9cFv79
	fBQlLAIAp58h4wCEImIUGJuVxtuNS/Mp4prWuzX+yslv95F6yhlRS4jEFwkly+tQmcaF3a2IrwVJB
	0QmaIYzqGmwqp6UQMl2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0XGF-003aOm-07; Thu, 01 Dec 2022 00:17:07 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0WDJ-0036F3-1P
	for linux-riscv@bombadil.infradead.org; Wed, 30 Nov 2022 23:10:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4d3Yt8bltpBTGQfRvysGuV0Qwes6q1E1oAAkIYt6v1U=; b=PC6gUNsVX1nJ9pkkZArF/LpRU9
	cZXjy0agYAG0wrddNgSlw73WslO68D808MO6PzslMf83i2SShu8QksZVytavGGB4Q9E5vuiGgUYfg
	OVo5/wt2s/W+/ca4/wuOl+AdBK8Jx+I6hBfFm0FGXrlsbHXfs95ys1Kbz7aXQd4AwpmFzxGRhRKeN
	LAgsPiw0iYJ1BTMZd+5oz2vgC4h6vcxckYeieqsbkTUIek/xeW6JdyCcbAEQa+uQC83eCHtbwNL9i
	CubpWXoUnnZIIp+dd44KOi4xZyuMMMOPmwmIJ4rwolQfiw8OM4ys8F4aL1a5JbwEHNMcqi6Gc0V+u
	cCrydX3w==;
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0WDB-006B6X-7m
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 23:09:58 +0000
Received: by mail-pj1-x1049.google.com with SMTP id on5-20020a17090b1d0500b0021821a07953so3790664pjb.4
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 15:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=4d3Yt8bltpBTGQfRvysGuV0Qwes6q1E1oAAkIYt6v1U=;
        b=R2EUvQh/d5tOiXan3raQzQlRv7gR1ONI/pTsvNFLPNlIvb1HQkPh0aZeDhUMSwPjU6
         WmKXxIVdA8mWbdpdJ9mQWSFS0GaxhUMED8VA7z9aivgbFGgRyi5KO45SYxDJSk//Lrmi
         TvHQq/KXHoU6IG02YXxnz+VoMPrjzvItFwl89sStfSe8vLDomvkTbOfZZylixHCAfv3w
         Jgwxv2s/jYVL/cbZz1XyHU/++UQYcJaWUXGIWbWEnIOtbM+sQTznmLBg+6U7bpNOdsk9
         JFaEVxGzY3mhCDrcWoTbsIO4wRxo80HsCG5wPORw/u3RxuNka0IHsD1GSswNFX6QovYX
         0b5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4d3Yt8bltpBTGQfRvysGuV0Qwes6q1E1oAAkIYt6v1U=;
        b=xTPbwHr99BupsGCVUxX7Izkv5t5zqTuYwWzCWoubAplDzHJDxq2bOp4tFOMkc8jHA9
         UmnIbrhT0kSdxbs54ciG9hgoEJYP+3uQeb+jVRRYVgJSfA4g4pgJVNSAtkYuQUG50L89
         8A/jifFXlVURuiluRN3dgtnJ3nB6KwwE8I0a/3sev1UmtbPC43vu68G6frNsq39V1vUO
         FGuyoOBqHoGdV5CEZ90pcOfwSoSBVMO6rGmiGLSrgOHN90BSYFsLhwDdrarH5VbvYSSE
         RQXesNH2NbLGUtc7f9py/WEEcWwN/9TVGXfsbMceMmox38HCC4B4DXmVVx3JROx/tItA
         HCuA==
X-Gm-Message-State: ANoB5pnPghutWpVgmaUpjCNQ593OCKXUQT/dWePQu4IrqFGBmwaHlQD1
	zyFbAQ36o8bsp2BGtxM8mthi1p/F5BE=
X-Google-Smtp-Source: AA0mqf6cW2WJ5WC9E3zUsYjnyVQVpmP5HVamx7IIHapO1XeJ3XE2sYBO0ex7mjdiJNAJDhKt2nf1vvfpKec=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:d58d:b0:188:ff21:e76b with SMTP id
 k13-20020a170902d58d00b00188ff21e76bmr9022156plh.60.1669849786225; Wed, 30
 Nov 2022 15:09:46 -0800 (PST)
Date: Wed, 30 Nov 2022 23:08:49 +0000
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221130230934.1014142-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221130230934.1014142-6-seanjc@google.com>
Subject: [PATCH v2 05/50] KVM: s390: Unwind kvm_arch_init() piece-by-piece()
 if a step fails
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
X-CRM114-CacheID: sfid-20221130_230956_380593_1FE0A7EB 
X-CRM114-Status: GOOD (  11.38  )
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

In preparation for folding kvm_arch_hardware_setup() into kvm_arch_init(),
unwind initialization one step at a time instead of simply calling
kvm_arch_exit().  Using kvm_arch_exit() regardless of which initialization
step failed relies on all affected state playing nice with being undone
even if said state wasn't first setup.  That holds true for state that is
currently configured by kvm_arch_init(), but not for state that's handled
by kvm_arch_hardware_setup(), e.g. calling gmap_unregister_pte_notifier()
without first registering a notifier would result in list corruption due
to attempting to delete an entry that was never added to the list.

Signed-off-by: Sean Christopherson <seanjc@google.com>
Reviewed-by: Eric Farman <farman@linux.ibm.com>
---
 arch/s390/kvm/kvm-s390.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index e4890e04b210..221481a09742 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -498,11 +498,11 @@ int kvm_arch_init(void *opaque)
 
 	kvm_s390_dbf_uv = debug_register("kvm-uv", 32, 1, 7 * sizeof(long));
 	if (!kvm_s390_dbf_uv)
-		goto out;
+		goto err_kvm_uv;
 
 	if (debug_register_view(kvm_s390_dbf, &debug_sprintf_view) ||
 	    debug_register_view(kvm_s390_dbf_uv, &debug_sprintf_view))
-		goto out;
+		goto err_debug_view;
 
 	kvm_s390_cpu_feat_init();
 
@@ -510,25 +510,32 @@ int kvm_arch_init(void *opaque)
 	rc = kvm_register_device_ops(&kvm_flic_ops, KVM_DEV_TYPE_FLIC);
 	if (rc) {
 		pr_err("A FLIC registration call failed with rc=%d\n", rc);
-		goto out;
+		goto err_flic;
 	}
 
 	if (IS_ENABLED(CONFIG_VFIO_PCI_ZDEV_KVM)) {
 		rc = kvm_s390_pci_init();
 		if (rc) {
 			pr_err("Unable to allocate AIFT for PCI\n");
-			goto out;
+			goto err_pci;
 		}
 	}
 
 	rc = kvm_s390_gib_init(GAL_ISC);
 	if (rc)
-		goto out;
+		goto err_gib;
 
 	return 0;
 
-out:
-	kvm_arch_exit();
+err_gib:
+	if (IS_ENABLED(CONFIG_VFIO_PCI_ZDEV_KVM))
+		kvm_s390_pci_exit();
+err_pci:
+err_flic:
+err_debug_view:
+	debug_unregister(kvm_s390_dbf_uv);
+err_kvm_uv:
+	debug_unregister(kvm_s390_dbf);
 	return rc;
 }
 
-- 
2.38.1.584.g0f3c55d4c2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
