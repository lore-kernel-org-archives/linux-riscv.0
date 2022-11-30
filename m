Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E869DC4321E
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 23:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k5hLlHlpjTtF7ES9awxjgq0eiE1nqXpCnvZI0H9b9iY=; b=qJIZIVLlWtamkm
	EjtdeAu9lGTnj2IruFbLfF4bepVcZTBkOS/MUZGPvWeGy1Y/ZGnYqI8/I2Gssh7ZWZyEWq8LeVr3d
	QTnrNe2g27Y3Sd7Q9NBUvJ1WEfoLALe7Ygu3uIw72mJayGCFt3PA3SPOJ5pezEko2TU7rYxvKXbVc
	4duaojqrm96SQI1wE3YmpkRrG3e4Usp1zAwXWrABWggsYvRNnYaU170cRzHN7FO0QbADebKs8bB0p
	uK9KTHta8W4o9cuCcx38Bx+PrK66zDt0qlDiy1ntz2KJORoKB4kJRbdecujAF3TQsY7k7tVlSql9u
	Kk9/VGPlixe+CAtdos5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Wwj-003QJ3-25; Wed, 30 Nov 2022 23:56:57 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0WbU-003Gqn-PP
	for linux-riscv@bombadil.infradead.org; Wed, 30 Nov 2022 23:35:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=f2C8vDRaA/O8SbCTM+wfwlQ+MVAOdj+YvpH8iocCum8=; b=K72+F4jHv8/JFWCViSmMfys+sE
	8N9fhALPzEm59zhhHlrBer1CXb78YdZU/NVWnPGTd/tLfhano6hr8xegnwvK7l3dl/FZykRqZC4FU
	lXcHiXGNquounB22aArbo9yQoyCCSLj4+cqIDQdZG30Ai7dQmUDkmTYRmUTUAR5I2LfdJHh5JVQUV
	3uZpKG5kqkytec505I25YmAxtzjMkUypO3wvRmjbF7WwPmYW95Gobr0EeBlKHTnhNk5pxlYV554dp
	DrswgC/xBIUp+XM4VV0YQXlJLJC91t3eL1frRQc2AMVYfoF29LRb6qZzbiD9FhkpjOQewBHe7Krc2
	/orVYMDQ==;
Received: from mail-pl1-f201.google.com ([209.85.214.201])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0WED-00FQ0X-DF
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 23:10:59 +0000
Received: by mail-pl1-f201.google.com with SMTP id m1-20020a170902db0100b00188eec2726cso19125831plx.18
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 15:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=f2C8vDRaA/O8SbCTM+wfwlQ+MVAOdj+YvpH8iocCum8=;
        b=E8ory0J1I2HGG0veF4yVwhyY9m0RRKrUrQNbtHkcBPn3mu4coPo+BcZ2CCSzBYmt1U
         gLqizNJDmxOs7ohAfQhuw1mtRxvIWCRJ1ZjGtcj9O77B+F2VF9B0cWhIdzQ02sw591vX
         fdSkALucc7nvyd/ucUkC9khImEPpK6ZxVf/6qAMCnOioiN6e65FTcxBoi9EhyhsHRvLB
         6DuDXJdb6qUgt4jDvBcmP8KYPUbvEzvzpi828Cuwms5+CFGS0VNQK/Ys8J/r7urUqDtN
         pCLG6YtdBn+DHe0STOYvxL6cUh5uQ8qX1SMqSbW+jxDAMmvD7Bx5d27IfSui/C5++PVG
         HYOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f2C8vDRaA/O8SbCTM+wfwlQ+MVAOdj+YvpH8iocCum8=;
        b=irvvYrC1MMWvABUVdns1Kh344LstDHnBexJgRHKehxyblmr1RUeQrLuYNO4mCd0mMZ
         HuTgXn10OIBIk/1WUyuurR/mFnOUD9k8bMT0EzRud3T/Z4wwnrkIGJRAJDPpWXTHI5Zy
         53otBVe1oXRr2/FLq9lzP9C3Mft42Ysq1op4DdWr1FrwK9OaaGviC/n+X6DJq+/IRjgM
         D7EEOM8VLsYhUNKc3Y7zTc3j+r2wArJF20gYF5AEFPVOqNFsXyKseVDN+EmkRZor6mBR
         luu6UpO+cdj2PTMPB53yBoyLI85+Y/5sRAZlX3YtLt/q01aMbb9bTUiddeGOo5dWKPP8
         3K5Q==
X-Gm-Message-State: ANoB5pl3JMaFMEWmJhXaqdqciQVq5G9TDFIv/pDxtEuwvRLqym8dAvwr
	wF/sm+EBWnrAknzCE54IF1k3wK6W1uo=
X-Google-Smtp-Source: AA0mqf7KhS1zzjBRRWmgNzYeinI7lFKtVig8aF30FAKfC8K3egPzRcjNw0j/jgHxn/ZrtapQhwi3bSxxU3g=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:1941:b0:572:6e9b:9fa2 with SMTP id
 s1-20020a056a00194100b005726e9b9fa2mr44563414pfk.8.1669849846939; Wed, 30 Nov
 2022 15:10:46 -0800 (PST)
Date: Wed, 30 Nov 2022 23:09:24 +0000
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221130230934.1014142-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221130230934.1014142-41-seanjc@google.com>
Subject: [PATCH v2 40/50] KVM: x86: Do compatibility checks when onlining CPU
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
X-CRM114-CacheID: sfid-20221130_231057_514831_4A99D39B 
X-CRM114-Status: GOOD (  14.39  )
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

From: Chao Gao <chao.gao@intel.com>

Do compatibility checks when enabling hardware to effectively add
compatibility checks when onlining a CPU.  Abort enabling, i.e. the
online process, if the (hotplugged) CPU is incompatible with the known
good setup.

At init time, KVM does compatibility checks to ensure that all online
CPUs support hardware virtualization and a common set of features. But
KVM uses hotplugged CPUs without such compatibility checks. On Intel
CPUs, this leads to #GP if the hotplugged CPU doesn't support VMX, or
VM-Entry failure if the hotplugged CPU doesn't support all features
enabled by KVM.

Note, this is little more than a NOP on SVM, as SVM already checks for
full SVM support during hardware enabling.

Opportunistically add a pr_err() if setup_vmcs_config() fails, and
tweak all error messages to output which CPU failed.

Signed-off-by: Chao Gao <chao.gao@intel.com>
Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/svm.c |  8 +++-----
 arch/x86/kvm/vmx/vmx.c | 15 ++++++++++-----
 arch/x86/kvm/x86.c     |  5 +++++
 3 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index c2e95c0d9fd8..46b658d0f46e 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -521,11 +521,12 @@ static void svm_init_osvw(struct kvm_vcpu *vcpu)
 
 static bool kvm_is_svm_supported(void)
 {
+	int cpu = raw_smp_processor_id();
 	const char *msg;
 	u64 vm_cr;
 
 	if (!cpu_has_svm(&msg)) {
-		pr_err("SVM not supported, %s\n", msg);
+		pr_err("SVM not supported by CPU %d, %s\n", cpu, msg);
 		return false;
 	}
 
@@ -536,7 +537,7 @@ static bool kvm_is_svm_supported(void)
 
 	rdmsrl(MSR_VM_CR, vm_cr);
 	if (vm_cr & (1 << SVM_VM_CR_SVM_DISABLE)) {
-		pr_err("SVM disabled (by BIOS) in MSR_VM_CR\n");
+		pr_err("SVM disabled (by BIOS) in MSR_VM_CR on CPU %d\n", cpu);
 		return false;
 	}
 
@@ -587,9 +588,6 @@ static int svm_hardware_enable(void)
 	if (efer & EFER_SVME)
 		return -EBUSY;
 
-	if (!kvm_is_svm_supported())
-		return -EINVAL;
-
 	sd = per_cpu_ptr(&svm_data, me);
 	sd->asid_generation = 1;
 	sd->max_asid = cpuid_ebx(SVM_CPUID_FUNC) - 1;
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 6416ed5b7f89..39dd3082fcd8 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -2711,14 +2711,16 @@ static int setup_vmcs_config(struct vmcs_config *vmcs_conf,
 
 static bool kvm_is_vmx_supported(void)
 {
+	int cpu = raw_smp_processor_id();
+
 	if (!cpu_has_vmx()) {
-		pr_err("CPU doesn't support VMX\n");
+		pr_err("VMX not supported by CPU %d\n", cpu);
 		return false;
 	}
 
 	if (!this_cpu_has(X86_FEATURE_MSR_IA32_FEAT_CTL) ||
 	    !this_cpu_has(X86_FEATURE_VMX)) {
-		pr_err("VMX not enabled (by BIOS) in MSR_IA32_FEAT_CTL\n");
+		pr_err("VMX not enabled (by BIOS) in MSR_IA32_FEAT_CTL on CPU %d\n", cpu);
 		return false;
 	}
 
@@ -2727,18 +2729,21 @@ static bool kvm_is_vmx_supported(void)
 
 static int vmx_check_processor_compat(void)
 {
+	int cpu = raw_smp_processor_id();
 	struct vmcs_config vmcs_conf;
 	struct vmx_capability vmx_cap;
 
 	if (!kvm_is_vmx_supported())
 		return -EIO;
 
-	if (setup_vmcs_config(&vmcs_conf, &vmx_cap) < 0)
+	if (setup_vmcs_config(&vmcs_conf, &vmx_cap) < 0) {
+		pr_err("Failed to setup VMCS config on CPU %d\n", cpu);
 		return -EIO;
+	}
 	if (nested)
 		nested_vmx_setup_ctls_msrs(&vmcs_conf, vmx_cap.ept);
-	if (memcmp(&vmcs_config, &vmcs_conf, sizeof(struct vmcs_config)) != 0) {
-		pr_err("CPU %d feature inconsistency!\n", smp_processor_id());
+	if (memcmp(&vmcs_config, &vmcs_conf, sizeof(struct vmcs_config))) {
+		pr_err("Inconsistent VMCS config on CPU %d\n", cpu);
 		return -EIO;
 	}
 	return 0;
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index ee9af412ffd4..5a9e74cedbc6 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -11967,6 +11967,11 @@ int kvm_arch_hardware_enable(void)
 	bool stable, backwards_tsc = false;
 
 	kvm_user_return_msr_cpu_online();
+
+	ret = kvm_x86_check_processor_compatibility();
+	if (ret)
+		return ret;
+
 	ret = static_call(kvm_x86_hardware_enable)();
 	if (ret != 0)
 		return ret;
-- 
2.38.1.584.g0f3c55d4c2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
