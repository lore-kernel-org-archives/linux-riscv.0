Return-Path: <SRS0=rXXN=NS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9D36C432BE
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Aug 2021 01:05:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85C7460FD9
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Aug 2021 01:05:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 85C7460FD9
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RMolu1TVtDUhRl/KXXV3OGJ8hKkI0CISChfzSpqwxc8=; b=vAaoEUd4kqRx+z
	vu2dog9445Dxbe5FW+nvYXjvuarJ0GUxY78BcP4VTACQKqSzKUa6u3IPuNLMD+gMF5JqzwJNi7ofq
	MHtKsqH9iWBi1abP3opaAx1lcBtXa3JAwJkUU3RzAu28nxDwgT6760GR5sicYb/D4jLCvqNKeX5Lp
	MXsZQlseps/rVL7ee3+M7qXdR2c2/HtU1SMZnpP7aaEYS4zL2EFU0eK9/ykF97AhmdfhDQrzeFrx1
	dOZiujv2gNrOhR1w/Sl+6ehIvjwv7QXHkLucjOjGeVBr1HApVHvf3yO9yHqQLAmuA7jutqAkC6AOY
	PaIl1aBpAlfb9q/QaSiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJQIk-00BEUy-8g; Fri, 27 Aug 2021 01:04:58 +0000
Received: from mail-qt1-x849.google.com ([2607:f8b0:4864:20::849])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJQBv-00BB2U-LL
 for linux-riscv@lists.infradead.org; Fri, 27 Aug 2021 00:57:58 +0000
Received: by mail-qt1-x849.google.com with SMTP id
 q19-20020ac87353000000b0029a09eca2afso1821948qtp.21
 for <linux-riscv@lists.infradead.org>; Thu, 26 Aug 2021 17:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=OS7MVkT771frXb6OZKHkckOWNoVo4LUEGjOz8sBcugE=;
 b=OVx3FLznsGaUkZj9+ODRTi7whGbzE/8kn7Gal8CUtZIaL/dYJc2rmQ1qkPOZL3Jkfh
 8LrJ1TSXuykV5OnsMsKzeh/lnCTo7ULEJtk/Ma+pEhnmcr7eVxSmsrJbyuf0LZfHK3mC
 5cTNBxdLyQmksw12D/CFGAYGi8YZhA+2t1yMTfPnInjGwKU/m4C6BX/DXEkZZQHXEg9c
 FER1Z6XZJ/+zGzGlv/1Hbj3FXGvMNEUSscvb2WcAhhf/HSakavpwMxtthLnpWQGFfmMn
 TA2CoC7TInFFLn+Y2y/FwxaHi5RRS6sJJCd4Q8o94I87M30cSUgn5q03sEpbFayyiZ4I
 iPxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=OS7MVkT771frXb6OZKHkckOWNoVo4LUEGjOz8sBcugE=;
 b=VWC1nni8BhY3UgAyGJ6WixpLB9Qmm7dbCjLom5ikLnKtETUb/STZMgwEgp62Af+Lg9
 K3S6UiYPKFTUWlg4nce5hWKdhDIOwNAlDj4TX7XTIIfuc0CpO+g+k9jIhDTu28XED5SG
 jC4FDEHebLbPqiVMzbEfvSrZ+fM8TLkzR9x5NNxfNBnX0a2l8ET/VFkxuLGrthON6hxz
 7lgR6wOA57X1g9F6LG1pdgRO15JSQi+hwx7E3ms6Hff6orhD9Yp1rUSNOo3gcypOqDQK
 AsOq8c+9tpd6SDQKOKh/TWOITBvYlaTFfJ4CrgpMN2Q3FkKTvr6D16/d3t8Co2vDB8c+
 xmZw==
X-Gm-Message-State: AOAM531QN1w/C9YChvhPZrW5U7yTyqu6ig8akZEWPSJz+BV11z+l80y1
 396l97xl2Q++Yq6J1omPmuUHrjpDMm8=
X-Google-Smtp-Source: ABdhPJyQjCRgdbSS93/ZAW+G0XqSUQSjYqI1rf3Efd9pEAO4+ceiCBacRxi/URQ0QYmIDPRPY3Rt4DKN9BU=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:c16c:db05:96b2:1475])
 (user=seanjc job=sendgmr) by 2002:a05:6214:c3:: with SMTP id
 f3mr7297288qvs.1.1630025873996; Thu, 26 Aug 2021 17:57:53 -0700 (PDT)
Date: Thu, 26 Aug 2021 17:57:14 -0700
In-Reply-To: <20210827005718.585190-1-seanjc@google.com>
Message-Id: <20210827005718.585190-12-seanjc@google.com>
Mime-Version: 1.0
References: <20210827005718.585190-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.259.gc128427fd7-goog
Subject: [PATCH 11/15] KVM: x86: Move Intel Processor Trace interrupt handler
 to vmx.c
From: Sean Christopherson <seanjc@google.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Nick Hu <nickhu@andestech.com>, 
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, 
 Namhyung Kim <namhyung@kernel.org>, James Morse <james.morse@arm.com>, 
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 "H. Peter Anvin" <hpa@zytor.com>, Sean Christopherson <seanjc@google.com>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, 
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.cs.columbia.edu, linux-csky@vger.kernel.org, 
 linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
 xen-devel@lists.xenproject.org, Artem Kashkanov <artem.kashkanov@intel.com>, 
 Like Xu <like.xu.linux@gmail.com>, Zhu Lingshan <lingshan.zhu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_175755_776099_5C602F18 
X-CRM114-Status: GOOD (  16.67  )
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

Now that all state needed for VMX's PT interrupt handler is exposed to
vmx.c (specifically the currently running vCPU), move the handler into
vmx.c where it belongs.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h |  1 -
 arch/x86/kvm/vmx/vmx.c          | 24 +++++++++++++++++++++---
 arch/x86/kvm/x86.c              | 17 -----------------
 virt/kvm/kvm_main.c             |  1 +
 4 files changed, 22 insertions(+), 21 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 63553a1f43ee..daa33147650a 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1496,7 +1496,6 @@ struct kvm_x86_init_ops {
 	int (*disabled_by_bios)(void);
 	int (*check_processor_compatibility)(void);
 	int (*hardware_setup)(void);
-	bool (*intel_pt_intr_in_guest)(void);
 
 	struct kvm_x86_ops *runtime_ops;
 };
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index f08980ef7c44..4665a272249a 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -7535,6 +7535,8 @@ static void vmx_migrate_timers(struct kvm_vcpu *vcpu)
 
 static void hardware_unsetup(void)
 {
+	kvm_set_intel_pt_intr_handler(NULL);
+
 	if (nested)
 		nested_vmx_hardware_unsetup();
 
@@ -7685,6 +7687,18 @@ static struct kvm_x86_ops vmx_x86_ops __initdata = {
 	.vcpu_deliver_sipi_vector = kvm_vcpu_deliver_sipi_vector,
 };
 
+static void vmx_handle_intel_pt_intr(void)
+{
+	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
+
+	if (WARN_ON_ONCE(!vcpu))
+		return;
+
+	kvm_make_request(KVM_REQ_PMI, vcpu);
+	__set_bit(MSR_CORE_PERF_GLOBAL_OVF_CTRL_TRACE_TOPA_PMI_BIT,
+			(unsigned long *)&vcpu->arch.pmu.global_status);
+}
+
 static __init void vmx_setup_user_return_msrs(void)
 {
 
@@ -7886,9 +7900,14 @@ static __init int hardware_setup(void)
 	vmx_set_cpu_caps();
 
 	r = alloc_kvm_area();
-	if (r)
+	if (r) {
 		nested_vmx_hardware_unsetup();
-	return r;
+		return r;
+	}
+
+	if (pt_mode == PT_MODE_HOST_GUEST)
+		kvm_set_intel_pt_intr_handler(vmx_handle_intel_pt_intr);
+	return 0;
 }
 
 static struct kvm_x86_init_ops vmx_init_ops __initdata = {
@@ -7896,7 +7915,6 @@ static struct kvm_x86_init_ops vmx_init_ops __initdata = {
 	.disabled_by_bios = vmx_disabled_by_bios,
 	.check_processor_compatibility = vmx_check_processor_compat,
 	.hardware_setup = hardware_setup,
-	.intel_pt_intr_in_guest = vmx_pt_mode_is_host_guest,
 
 	.runtime_ops = &vmx_x86_ops,
 };
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 7cb0f04e24ee..11c7a02f839c 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -8264,18 +8264,6 @@ static void kvm_timer_init(void)
 			  kvmclock_cpu_online, kvmclock_cpu_down_prep);
 }
 
-static void kvm_handle_intel_pt_intr(void)
-{
-	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
-
-	if (WARN_ON_ONCE(!vcpu))
-		return;
-
-	kvm_make_request(KVM_REQ_PMI, vcpu);
-	__set_bit(MSR_CORE_PERF_GLOBAL_OVF_CTRL_TRACE_TOPA_PMI_BIT,
-			(unsigned long *)&vcpu->arch.pmu.global_status);
-}
-
 #ifdef CONFIG_X86_64
 static void pvclock_gtod_update_fn(struct work_struct *work)
 {
@@ -11029,9 +11017,6 @@ int kvm_arch_hardware_setup(void *opaque)
 	memcpy(&kvm_x86_ops, ops->runtime_ops, sizeof(kvm_x86_ops));
 	kvm_ops_static_call_update();
 
-	if (ops->intel_pt_intr_in_guest && ops->intel_pt_intr_in_guest())
-		kvm_set_intel_pt_intr_handler(kvm_handle_intel_pt_intr);
-
 	if (!kvm_cpu_cap_has(X86_FEATURE_XSAVES))
 		supported_xss = 0;
 
@@ -11059,8 +11044,6 @@ int kvm_arch_hardware_setup(void *opaque)
 
 void kvm_arch_hardware_unsetup(void)
 {
-	kvm_set_intel_pt_intr_handler(NULL);
-
 	static_call(kvm_x86_hardware_unsetup)();
 }
 
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 13c4f58a75e5..e0b1c9386926 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5498,6 +5498,7 @@ void kvm_set_intel_pt_intr_handler(void (*handler)(void))
 {
 	kvm_guest_cbs.handle_intel_pt_intr = handler;
 }
+EXPORT_SYMBOL_GPL(kvm_set_intel_pt_intr_handler);
 
 void kvm_register_perf_callbacks(void)
 {
-- 
2.33.0.259.gc128427fd7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
