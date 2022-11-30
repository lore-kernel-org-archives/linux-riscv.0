Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F73C4321E
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 00:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g3n6gfVS3hJ89Ro0MQ4ACln4R7FulcsgmOvD2Ozbh5U=; b=1h6n7urQPhc0ey
	rcWBcy85wIqel5vI+7GoPJmYb0yaNWBVrGB88SSpcvnkguysj3Nhy8jK/vM8uSeApFH0EU2MAOuvk
	yHLLimUDdh7EPOVwr0VFfNDLydX7DKUIRDeLjVNXa0419ON/5JxJSAUs5X74Yx7mRKN5XhsMVMSb4
	P/S3pls79/chlB244gPk5JCA506fCTz4k3OD14QULS65WJjy6uVb/OmGdGwcTZQZqfeIQU65u12od
	FkKpwZLT8gM6p4feD+QIvN5oqzPf7pMth31DaURUz1LH7OduxrFYBI9uAdcINzXosVeQj2oTHU4L+
	ktcIZ4TI4KQOTvOlJGyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0X6x-003Uvr-2R; Thu, 01 Dec 2022 00:07:31 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Wbk-003Gqn-8E
	for linux-riscv@bombadil.infradead.org; Wed, 30 Nov 2022 23:35:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GJ+yfhkspt7ZNo22OgQpawec1Ei4RCTiEbe5vknIrT0=; b=beMqsTk0nhwVs4DtrPTK0SfbDW
	u33UxJbS5t1N6zYFFKBvBLRTqudP/sZyo02tcHXq9CLQqWNRfQCFbgSXa3aiq897prpx7rmy5fXPm
	S4zsEqWEmsYX5CIwZJhk3v4rwLqM3/ZzIYY+4+4MRmSh1QFQZOkopVoV8+bKizeCL3dZZ8osPT0U4
	BDzQw2ZtjWydkpB3OHWfdKrGhtGbLYiEWK+wLVWwdW9eNCHWahnhZ3fIe3YqxvyQFsMi8nAJ0R18M
	OEPMIt1lXDYOAlDhm7Vi/f0Ubq/g6WqNSvpiRgJ/9yDBJSc+XNAYNB1lNJcflSCa6VtpKhv7S7q4S
	z/ScvuEA==;
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0WDN-00FPmV-NP
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 23:10:08 +0000
Received: by mail-pf1-x449.google.com with SMTP id x11-20020a056a000bcb00b0056c6ec11eefso169267pfu.14
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 15:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=GJ+yfhkspt7ZNo22OgQpawec1Ei4RCTiEbe5vknIrT0=;
        b=B3425sD5ssEx57pTtG98b8HpTdxzwssCBDuFcB0njTKI/XsYVhIlUT7t8VxfTZyCaj
         rNNcjy7ZkLO7sRu1croI6V17oM3JUWZ66KJz3dPOFnS6ZNXt9vF/ufrGiEJRrVh1rawx
         jBIyIycJ1nYQ/Tln+uKRdhBxUMbn2zrY+g01yeSgTRVjheiz5bWBhhhmJyUaJsAkE6GE
         dL6EhA0QNU/VHGk45s0/jNhjn17XdiiiF1JWKkMNdSlcYBJTXiZUBYEqCsiTUua4xdbH
         Vsh2/Hg502nb0uGz/tvW1rhibXANnp+7b1r3Lx8wxi+xiH/bRTNX1OQgA8zn4Jd+xIMD
         ResQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GJ+yfhkspt7ZNo22OgQpawec1Ei4RCTiEbe5vknIrT0=;
        b=lhND7JTUlc7s+St2ZimjmQfTMwocA9/IL5xZd21AjrPWcnN8w03qZbtys4BLppEF6Y
         NC+Jw1pM4WtNzTnGV+6USvNpxgZ8e+5Y0HiXNUkpNZsxH2twTxeSoCe89Az/b+CxHACf
         uxzLjPYvK8Vil6y6cw0nZKe0/XUKUoorxaWWvS1GGHVwf8JXwQMurzS85O/EEnOjs0KB
         JIc2nipfogZVmUNc80gpxj5xFtnRrwp6s+Kwprby9UtCcoSNQXD3fgSNqJDdzQZ4mjQC
         gFttvlxAU+mbp1Dgjz1tcg4QQrFTXWfGJ2gG7F7QB42BcDYziHStfsaGYTiqBiV/PhKu
         mBaA==
X-Gm-Message-State: ANoB5plsKY7baDIW6sS1YhjC4FitO5KjgPBZ+mP/TlXcH8JH2cEqqIus
	DWZjhUGcTrjm27ginESvsEVJgo18h8k=
X-Google-Smtp-Source: AA0mqf7QiNOgWP00XAD7anVxRZ3dDrQeLQqiZYyRJhfOxzgfK7hENIJxdqXXKq1jBfur3SWcS0zGNy7/Bfo=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:27ab:b0:56c:71a4:efe with SMTP id
 bd43-20020a056a0027ab00b0056c71a40efemr48704277pfb.84.1669849794774; Wed, 30
 Nov 2022 15:09:54 -0800 (PST)
Date: Wed, 30 Nov 2022 23:08:54 +0000
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221130230934.1014142-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221130230934.1014142-11-seanjc@google.com>
Subject: [PATCH v2 10/50] KVM: VMX: Reset eVMCS controls in VP assist page
 during hardware disabling
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
X-CRM114-CacheID: sfid-20221130_231006_169862_0B522517 
X-CRM114-Status: GOOD (  15.35  )
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

Reset the eVMCS controls in the per-CPU VP assist page during hardware
disabling instead of waiting until kvm-intel's module exit.  The controls
are activated if and only if KVM creates a VM, i.e. don't need to be
reset if hardware is never enabled.

Doing the reset during hardware disabling will naturally fix a potential
NULL pointer deref bug once KVM disables CPU hotplug while enabling and
disabling hardware (which is necessary to fix a variety of bugs).  If the
kernel is running as the root partition, the VP assist page is unmapped
during CPU hot unplug, and so KVM's clearing of the eVMCS controls needs
to occur with CPU hot(un)plug disabled, otherwise KVM could attempt to
write to a CPU's VP assist page after it's unmapped.

Reported-by: Vitaly Kuznetsov <vkuznets@redhat.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 50 +++++++++++++++++++++++++-----------------
 1 file changed, 30 insertions(+), 20 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index cea8c07f5229..d85d175dca70 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -551,6 +551,33 @@ static int hv_enable_l2_tlb_flush(struct kvm_vcpu *vcpu)
 	return 0;
 }
 
+static void hv_reset_evmcs(void)
+{
+	struct hv_vp_assist_page *vp_ap;
+
+	if (!static_branch_unlikely(&enable_evmcs))
+		return;
+
+	/*
+	 * KVM should enable eVMCS if and only if all CPUs have a VP assist
+	 * page, and should reject CPU onlining if eVMCS is enabled the CPU
+	 * doesn't have a VP assist page allocated.
+	 */
+	vp_ap = hv_get_vp_assist_page(smp_processor_id());
+	if (WARN_ON_ONCE(!vp_ap))
+		return;
+
+	/*
+	 * Reset everything to support using non-enlightened VMCS access later
+	 * (e.g. when we reload the module with enlightened_vmcs=0)
+	 */
+	vp_ap->nested_control.features.directhypercall = 0;
+	vp_ap->current_nested_vmcs = 0;
+	vp_ap->enlighten_vmentry = 0;
+}
+
+#else /* IS_ENABLED(CONFIG_HYPERV) */
+static void hv_reset_evmcs(void) {}
 #endif /* IS_ENABLED(CONFIG_HYPERV) */
 
 /*
@@ -2496,6 +2523,8 @@ static void vmx_hardware_disable(void)
 	if (cpu_vmxoff())
 		kvm_spurious_fault();
 
+	hv_reset_evmcs();
+
 	intel_pt_handle_vmx(0);
 }
 
@@ -8462,27 +8491,8 @@ static void vmx_exit(void)
 	kvm_exit();
 
 #if IS_ENABLED(CONFIG_HYPERV)
-	if (static_branch_unlikely(&enable_evmcs)) {
-		int cpu;
-		struct hv_vp_assist_page *vp_ap;
-		/*
-		 * Reset everything to support using non-enlightened VMCS
-		 * access later (e.g. when we reload the module with
-		 * enlightened_vmcs=0)
-		 */
-		for_each_online_cpu(cpu) {
-			vp_ap =	hv_get_vp_assist_page(cpu);
-
-			if (!vp_ap)
-				continue;
-
-			vp_ap->nested_control.features.directhypercall = 0;
-			vp_ap->current_nested_vmcs = 0;
-			vp_ap->enlighten_vmentry = 0;
-		}
-
+	if (static_branch_unlikely(&enable_evmcs))
 		static_branch_disable(&enable_evmcs);
-	}
 #endif
 	vmx_cleanup_l1d_flush();
 
-- 
2.38.1.584.g0f3c55d4c2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
