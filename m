Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28935CA0EDF
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Aug 2024 04:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tgBCoeE0iYv+cosDhC7J0M+U1aJRt+NW1xIyNojT76Q=; b=gc/5Hm91iIc3vj
	jiBnL7fG5C8/4M3lCfs25WY9ZYyC+8jfJd2CjZWmFQlTd3ERjaI0VvOhBx5Kic+D1ZNvXJN6MRLsb
	9oYUwrz1/igVx6F7zwhbJNwLZCbqecGHQb7EMRnPhw9puOfy84v9QceJKc6wzCYOzEJs35O940kPV
	zpt/Oc8jZfmynspP/NUAi5rF8l4IEC0vLdppEg97Kya8vztcllx4bEtm55DCcLaRjXMWbZYxPgTdQ
	gwbe+XUonbVXWactC2qXrQIPrALtqM3O+zQ9WVM8oyQ7SUSljQRCnZRRcAV1DtUK4st2cPcV3//dp
	fuE4vSemlblK7i537x9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjtRL-00000004h4M-0rmK;
	Fri, 30 Aug 2024 04:40:51 +0000
Received: from mail-pl1-f202.google.com ([209.85.214.202])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjtMy-00000004fqx-0eUA
	for linux-riscv@lists.infradead.org;
	Fri, 30 Aug 2024 04:36:21 +0000
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2021ab2b5e6so13042215ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 29 Aug 2024 21:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724992579; x=1725597379; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=M2s+onp5tR3Lhbit2H5d49uth+heyyaX98MlcrFx54Y=;
        b=iC2kvufb9/3aWUAssOwsi80vcITi+G1pUTlgtGJI9wF8zQEzk7f+dhVfLoDrN9bnku
         VBxw9NEQGm0e9gpmMLxr+m2hiHmG1vFac4M91GxtOWiIkY3n9uVzbU/nBb0P35ylCJUZ
         /BOK9k8us4COUw+EBhL6VZqkV8a8yCTLrQH5OmHGPqTS4JXsgzEqHs7ajzq5BkeDTNQb
         JhVSgglbzgovv7tD/JQCROMlVN/3i37L9ggPqh79aayBLhHHGtw1Bp432Ih5sg9qTyvn
         vERpKf/ImEmzXFgXcafthuahoZsqxxZHdfSbO4I8+avfe4+5MFN3LX8dt7nwTmw8gaA4
         i9lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724992579; x=1725597379;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M2s+onp5tR3Lhbit2H5d49uth+heyyaX98MlcrFx54Y=;
        b=uhO95ZNguJBneT2lc0XHJuVlbrPTSc5AB06y9dEqAuDZCwWgpS2BSOxJkQiiCRJPW/
         V3LXz+fvO21Yr2i4oPOBXue55GR+xLjmbnfqUeumaJjgYVHtz2dSAjAbXEWWA4HvKLIB
         pZ29VC4xr0apRHKUfug562XAYu9qwNWNaQ1DdJ3OLfYhqm0Cfxv4GVpFs+GpTsL6p24f
         y+JlklZveZrPvghovXWsGJAeGNIBz9JTG/eTZTXpttwUDG42W36lf/b2dhpd5YdYpCM7
         YHzzURC3e75warKLS+XzTkQMrwVGiMuXyGOj5QIpM1s3VwOtxjOixdcEBEzrMGzDcyxw
         vyFA==
X-Forwarded-Encrypted: i=1; AJvYcCXw1i1thhfJQkfRyzbp5gaBF7COaoMvUMaT+JpvrNs69dTs2RE0mruhldxIByHgg3QTRTtM/sXr+VkRjg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8z3EJvoz+ZchzYLVuKPqME29hkp5Tsgu80SwzBXv+FNjtuQiy
	bZA5NJ19gRiWRs+iwwMZbTnl3lCUwFBlrAJO0vi78/gW0iHcWkryQTV7sFn5WwluHaibP9kGK5s
	r5Q==
X-Google-Smtp-Source: AGHT+IHsUVl4EvyuChNsDlGcFLHLP8TQ15E11S1rfoAfjJIcPKgkB6hh3D01h9rTMbJijEqYHxNp/J3BFZg=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:c411:b0:205:32b5:b541 with SMTP id
 d9443c01a7336-20532b5b641mr369845ad.3.1724992578679; Thu, 29 Aug 2024
 21:36:18 -0700 (PDT)
Date: Thu, 29 Aug 2024 21:35:57 -0700
In-Reply-To: <20240830043600.127750-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240830043600.127750-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
Message-ID: <20240830043600.127750-8-seanjc@google.com>
Subject: [PATCH v4 07/10] KVM: Add a module param to allow enabling
 virtualization when KVM is loaded
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Chao Gao <chao.gao@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Farrah Chen <farrah.chen@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240829_213620_209001_D71BCFB7 
X-CRM114-Status: GOOD (  16.87  )
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

Add an on-by-default module param, enable_virt_at_load, to let userspace
force virtualization to be enabled in hardware when KVM is initialized,
i.e. just before /dev/kvm is exposed to userspace.  Enabling virtualization
during KVM initialization allows userspace to avoid the additional latency
when creating/destroying the first/last VM (or more specifically, on the
0=>1 and 1=>0 edges of creation/destruction).

Now that KVM uses the cpuhp framework to do per-CPU enabling, the latency
could be non-trivial as the cpuhup bringup/teardown is serialized across
CPUs, e.g. the latency could be problematic for use case that need to spin
up VMs quickly.

Prior to commit 10474ae8945c ("KVM: Activate Virtualization On Demand"),
KVM _unconditionally_ enabled virtualization during load, i.e. there's no
fundamental reason KVM needs to dynamically toggle virtualization.  These
days, the only known argument for not enabling virtualization is to allow
KVM to be autoloaded without blocking other out-of-tree hypervisors, and
such use cases can simply change the module param, e.g. via command line.

Note, the aforementioned commit also mentioned that enabling SVM (AMD's
virtualization extensions) can result in "using invalid TLB entries".
It's not clear whether the changelog was referring to a KVM bug, a CPU
bug, or something else entirely.  Regardless, leaving virtualization off
by default is not a robust "fix", as any protection provided is lost the
instant userspace creates the first VM.

Reviewed-by: Chao Gao <chao.gao@intel.com>
Acked-by: Kai Huang <kai.huang@intel.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
Tested-by: Farrah Chen <farrah.chen@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../admin-guide/kernel-parameters.txt         | 17 +++++++++
 virt/kvm/kvm_main.c                           | 35 +++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 09126bb8cc9f..1b52b1b7bbc4 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2648,6 +2648,23 @@
 
 			Default is Y (on).
 
+	kvm.enable_virt_at_load=[KVM,ARM64,LOONGARCH,MIPS,RISCV,X86]
+			If enabled, KVM will enable virtualization in hardware
+			when KVM is loaded, and disable virtualization when KVM
+			is unloaded (if KVM is built as a module).
+
+			If disabled, KVM will dynamically enable and disable
+			virtualization on-demand when creating and destroying
+			VMs, i.e. on the 0=>1 and 1=>0 transitions of the
+			number of VMs.
+
+			Enabling virtualization at module lode avoids potential
+			latency for creation of the 0=>1 VM, as KVM serializes
+			virtualization enabling across all online CPUs.  The
+			"cost" of enabling virtualization when KVM is loaded,
+			is that doing so may interfere with using out-of-tree
+			hypervisors that want to "own" virtualization hardware.
+
 	kvm.enable_vmware_backdoor=[KVM] Support VMware backdoor PV interface.
 				   Default is false (don't support).
 
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index b000f221abfb..55779fbb37ec 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5572,6 +5572,9 @@ static struct miscdevice kvm_dev = {
 };
 
 #ifdef CONFIG_KVM_GENERIC_HARDWARE_ENABLING
+static bool enable_virt_at_load = true;
+module_param(enable_virt_at_load, bool, 0444);
+
 __visible bool kvm_rebooting;
 EXPORT_SYMBOL_GPL(kvm_rebooting);
 
@@ -5722,15 +5725,39 @@ static void kvm_disable_virtualization(void)
 	unregister_syscore_ops(&kvm_syscore_ops);
 	cpuhp_remove_state(CPUHP_AP_KVM_ONLINE);
 }
+
+static int kvm_init_virtualization(void)
+{
+	if (enable_virt_at_load)
+		return kvm_enable_virtualization();
+
+	return 0;
+}
+
+static void kvm_uninit_virtualization(void)
+{
+	if (enable_virt_at_load)
+		kvm_disable_virtualization();
+}
 #else /* CONFIG_KVM_GENERIC_HARDWARE_ENABLING */
 static int kvm_enable_virtualization(void)
 {
 	return 0;
 }
 
+static int kvm_init_virtualization(void)
+{
+	return 0;
+}
+
 static void kvm_disable_virtualization(void)
 {
 
+}
+
+static void kvm_uninit_virtualization(void)
+{
+
 }
 #endif /* CONFIG_KVM_GENERIC_HARDWARE_ENABLING */
 
@@ -6475,6 +6502,10 @@ int kvm_init(unsigned vcpu_size, unsigned vcpu_align, struct module *module)
 
 	kvm_gmem_init(module);
 
+	r = kvm_init_virtualization();
+	if (r)
+		goto err_virt;
+
 	/*
 	 * Registration _must_ be the very last thing done, as this exposes
 	 * /dev/kvm to userspace, i.e. all infrastructure must be setup!
@@ -6488,6 +6519,8 @@ int kvm_init(unsigned vcpu_size, unsigned vcpu_align, struct module *module)
 	return 0;
 
 err_register:
+	kvm_uninit_virtualization();
+err_virt:
 	kvm_vfio_ops_exit();
 err_vfio:
 	kvm_async_pf_deinit();
@@ -6513,6 +6546,8 @@ void kvm_exit(void)
 	 */
 	misc_deregister(&kvm_dev);
 
+	kvm_uninit_virtualization();
+
 	debugfs_remove_recursive(kvm_debugfs_dir);
 	for_each_possible_cpu(cpu)
 		free_cpumask_var(per_cpu(cpu_kick_mask, cpu));
-- 
2.46.0.469.g59c65b2a67-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
