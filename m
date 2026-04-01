Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD317D3515A
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Apr 2026 08:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Coc9rodCjgfwbUW37UUUfPgSpFez0D7g7eWmKjyP2LE=; b=08AnTE8m/JrF9U
	UFz0dNxrgqbn4kl3awd66U9373+Q1J4XT60cdTjVyY+U7oi8sfQw/RXOeZVcEiaP4FKT/XvnZyMn9
	VFWEO2RNWnUB5X2nrp5hfPfTSsomt2jg4qrr+wuNxSZ5DRqi5c8izAQufwxVwqy4munhdsZu/xS9Y
	VFJSVHShdJOqn36CFHx2TlPDAMP6i/aujdR/Is3bEq7hAWblCGEd7k6CRboaAWpuzsGO0I/zF1sTK
	5EQGFqSTPnolnvcz8vUfO5sv4ygFRANGX5oAiuMd514feGhAXQKW82JhayWK0a/PhmZGMCxRL6Lsh
	EETP36I930rjPvjN84jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ql7-0000000EHP1-3cHD;
	Wed, 01 Apr 2026 08:17:05 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ql2-0000000EHKc-2t4n;
	Wed, 01 Apr 2026 08:17:02 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=/bDHT0vostLWviBcH0LGnrUXN/7+wtQhJKC8xvlaZ1w=;
	b=I76d5QkgB06G/X/wos41vVtgRQepXQMzc5bCmZUjG61rsMvqBqMxjyiWV13dSj/N0vARfMR+I
	TIpo+e0ZZ/G2PYTKyAK+od5BAX4GJxZnIIHvWHRL80Tl9ySzHsM4ReaK/m6QcwIZU7CfdK4/sr4
	hK45B5FTc4PW95z2AIDDxVc=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4flyPG5v0Lz12LJb;
	Wed,  1 Apr 2026 16:11:30 +0800 (CST)
Received: from kwepemk500009.china.huawei.com (unknown [7.202.194.94])
	by mail.maildlp.com (Postfix) with ESMTPS id 225C340538;
	Wed,  1 Apr 2026 16:16:54 +0800 (CST)
Received: from localhost.localdomain (10.50.163.32) by
 kwepemk500009.china.huawei.com (7.202.194.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 1 Apr 2026 16:16:52 +0800
From: Chengwen Feng <fengchengwen@huawei.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Rafael J .
 Wysocki" <rafael@kernel.org>
Subject: [PATCH RESEND v10 4/8] x86/acpi: Add acpi_get_cpu_uid() for unified ACPI CPU UID retrieval
Date: Wed, 1 Apr 2026 16:16:36 +0800
Message-ID: <20260401081640.26875-5-fengchengwen@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260401081640.26875-1-fengchengwen@huawei.com>
References: <20260401081640.26875-1-fengchengwen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk500009.china.huawei.com (7.202.194.94)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_011701_499943_2A3B620A 
X-CRM114-Status: GOOD (  16.38  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, liuyonglong@huawei.com, anshuman.khandual@arm.com, linux-doc@vger.kernel.org, Kees Cook <kees@kernel.org>, linux-pci@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, Eric.VanTassell@amd.com, fengchengwen@huawei.com, Somnath Kotur <somnath.kotur@broadcom.com>, Kai Huang <kai.huang@intel.com>, Kevin Loughlin <kevinloughlin@google.com>, punit.agrawal@oss.qualcomm.com, "H .
 Peter Anvin" <hpa@zytor.com>, Ilkka Koskinen <ilkka@os.amperecomputing.com>, WANG Xuerui <kernel@xen0n.name>, Thorsten Blum <thorsten.blum@linux.dev>, linux-acpi@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, masahiroy@kernel.org, Yanteng Si <si.yanteng@linux.dev>, linux-riscv@lists.infradead.org, Peter Zijlstra <peterz@infradead.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, linux-arm-kernel@lists.infradead.org, xen-devel@lists.xenproject.org, Zheyun Shen <szy0127@sjtu.edu.cn>, Len Brown <lenb@kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>, Thomas Huth <thuth@redhat.com>, ryan.roberts@arm.com, "Ahmed S . Darwish" <darwi@linutronix.de>, Ma Ke <make24@iscas.ac.cn>, suzuki.poulose@arm.com, James Clark <james.clark@linaro.org>, Wei Huang <wei.huang2@amd.com>, Besar Wicaksono <bwicaksono@nvidia.com>, loongarch@lists.linux.dev, Jonathan Cameron <jonathan.cameron@huawei.com>, Sohil Mehta <sohil.mehta@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xin Li <xin@zytor.com>, Andy Gospodarek <andrew.gospodarek@broadcom.com>, wanghuiqiang@huawei.com, Juergen Gross <jgross@suse.com>, wangyuquan1236@phytium.com.cn, Sean Christopherson <seanjc@google.com>, guohanjun@huawei.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-perf-users@vger.kernel.org, wangzhou1@hisilicon.com, Thomas Gleixner <tglx@kernel.org>, heinrich.schuchardt@canonical.com, chenl311@chinatelecom.cn, Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

As a step towards unifying the interface for retrieving ACPI CPU UID
across architectures, introduce a new function acpi_get_cpu_uid() for
x86. While at it, add input validation to make the code more robust.

Update Xen-related code to use acpi_get_cpu_uid() instead of the legacy
cpu_acpi_id() function, and remove the now-unused cpu_acpi_id() to clean
up redundant code.

Cc: stable@vger.kernel.org
Signed-off-by: Chengwen Feng <fengchengwen@huawei.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/include/asm/acpi.h  |  2 ++
 arch/x86/include/asm/cpu.h   |  1 -
 arch/x86/include/asm/smp.h   |  1 -
 arch/x86/kernel/acpi/boot.c  | 20 ++++++++++++++++++++
 arch/x86/xen/enlighten_hvm.c |  5 +++--
 5 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/acpi.h b/arch/x86/include/asm/acpi.h
index a03aa6f999d1..92b5c27c4fea 100644
--- a/arch/x86/include/asm/acpi.h
+++ b/arch/x86/include/asm/acpi.h
@@ -157,6 +157,8 @@ static inline bool acpi_has_cpu_in_madt(void)
 	return !!acpi_lapic;
 }
 
+int acpi_get_cpu_uid(unsigned int cpu, u32 *uid);
+
 #define ACPI_HAVE_ARCH_SET_ROOT_POINTER
 static __always_inline void acpi_arch_set_root_pointer(u64 addr)
 {
diff --git a/arch/x86/include/asm/cpu.h b/arch/x86/include/asm/cpu.h
index ad235dda1ded..57a0786dfd75 100644
--- a/arch/x86/include/asm/cpu.h
+++ b/arch/x86/include/asm/cpu.h
@@ -11,7 +11,6 @@
 
 #ifndef CONFIG_SMP
 #define cpu_physical_id(cpu)			boot_cpu_physical_apicid
-#define cpu_acpi_id(cpu)			0
 #endif /* CONFIG_SMP */
 
 #ifdef CONFIG_HOTPLUG_CPU
diff --git a/arch/x86/include/asm/smp.h b/arch/x86/include/asm/smp.h
index 84951572ab81..05d1d479b4cf 100644
--- a/arch/x86/include/asm/smp.h
+++ b/arch/x86/include/asm/smp.h
@@ -130,7 +130,6 @@ __visible void smp_call_function_interrupt(struct pt_regs *regs);
 __visible void smp_call_function_single_interrupt(struct pt_regs *r);
 
 #define cpu_physical_id(cpu)	per_cpu(x86_cpu_to_apicid, cpu)
-#define cpu_acpi_id(cpu)	per_cpu(x86_cpu_to_acpiid, cpu)
 
 /*
  * This function is needed by all SMP systems. It must _always_ be valid
diff --git a/arch/x86/kernel/acpi/boot.c b/arch/x86/kernel/acpi/boot.c
index a3f2fb1fea1b..ceba24f65ae3 100644
--- a/arch/x86/kernel/acpi/boot.c
+++ b/arch/x86/kernel/acpi/boot.c
@@ -1848,3 +1848,23 @@ void __iomem * (*acpi_os_ioremap)(acpi_physical_address phys, acpi_size size) =
 	x86_acpi_os_ioremap;
 EXPORT_SYMBOL_GPL(acpi_os_ioremap);
 #endif
+
+int acpi_get_cpu_uid(unsigned int cpu, u32 *uid)
+{
+	u32 acpi_id;
+
+	if (cpu >= nr_cpu_ids)
+		return -EINVAL;
+
+#ifdef CONFIG_SMP
+	acpi_id = per_cpu(x86_cpu_to_acpiid, cpu);
+	if (acpi_id == CPU_ACPIID_INVALID)
+		return -ENODEV;
+#else
+	acpi_id = 0;
+#endif
+
+	*uid = acpi_id;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(acpi_get_cpu_uid);
diff --git a/arch/x86/xen/enlighten_hvm.c b/arch/x86/xen/enlighten_hvm.c
index fe57ff85d004..2f9fa27e5a3c 100644
--- a/arch/x86/xen/enlighten_hvm.c
+++ b/arch/x86/xen/enlighten_hvm.c
@@ -151,6 +151,7 @@ static void xen_hvm_crash_shutdown(struct pt_regs *regs)
 
 static int xen_cpu_up_prepare_hvm(unsigned int cpu)
 {
+	u32 cpu_uid;
 	int rc = 0;
 
 	/*
@@ -161,8 +162,8 @@ static int xen_cpu_up_prepare_hvm(unsigned int cpu)
 	 */
 	xen_uninit_lock_cpu(cpu);
 
-	if (cpu_acpi_id(cpu) != CPU_ACPIID_INVALID)
-		per_cpu(xen_vcpu_id, cpu) = cpu_acpi_id(cpu);
+	if (acpi_get_cpu_uid(cpu, &cpu_uid) == 0)
+		per_cpu(xen_vcpu_id, cpu) = cpu_uid;
 	else
 		per_cpu(xen_vcpu_id, cpu) = cpu;
 	xen_vcpu_setup(cpu);
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
