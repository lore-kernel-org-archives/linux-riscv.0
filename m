Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A34C61D92
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 13:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qinxKP63TmUG+8Eb321OqBmrLdiPnsOLRDWxb6AJmLk=; b=aM6YHalpEHiEGk
	lbwfksMohUk2ntLNSKd8NQIX6tbsZfjWZ0jHxx50ugawiwswcAhfiXmbWo1ZQo9knkJpnqfAP9ifK
	vgkSUcKpFaYZC3M/3Z6UkZ1AOJqPHPRfPy8cvK2CWtQ46Ta1rWKE9yic+GnQxsVWUV0oRdNHALZ2c
	N2nb6pweb9RczK4KAZq4x+vlBQmdm1zfjS1jqXMxAh8Vzxstdc4sftmwJHW0G+ZSi4Fr5gsOaGs84
	yp6MJIUnPutAi5LO5IKLlKH4Nz8uWRZwXoPa6G4ZLPtfQdr8sIdOhrPZZAUll23ip1WLFSVhLyu10
	hSav/ATdTTwezBVn8oug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5R3v-00GrFx-2m;
	Tue, 21 Nov 2023 13:45:11 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5R3g-00Gqye-38;
	Tue, 21 Nov 2023 13:44:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UQ05SB3yWDhX97AT8bSyWTwxLjmfSd4IctwvAhJmykI=; b=Fo5mO2GYy/nyDoE1Pv+YpT0JVl
	RmeGcXLuGeUp6TiBUu8iystNjPXQdn1rDAWALVB27V2kAwYLt21Q11Bygxc2wRtnxfQ/iGLONu2GT
	oHCarNxbOthpImWIG2QG9pTZLfcP+Bl5Y/5yEYzSOmizhBtf2ymOhh1aw3Oa13glBgHgk5tuqNre1
	wGAvLR9qFV+LuE4bxCnzN7aPJLjEcEycmYergkCrxIlC9tG5Ak6IoD2OVNGYDuRV5vFxMoOP1KHz1
	JkhYxWz8KBwgUOTrMS6oX/n/5UjmLRkxQoDucHhGPdYd0VPtSQXuD4o+ikRKo6nsLccyikB4q5Wmg
	Aftc5mlg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50552 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1r5R3Z-00079G-2B;
	Tue, 21 Nov 2023 13:44:49 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1r5R3b-00Csza-Ku; Tue, 21 Nov 2023 13:44:51 +0000
In-Reply-To: <ZVyz/Ve5pPu8AWoA@shell.armlinux.org.uk>
References: <ZVyz/Ve5pPu8AWoA@shell.armlinux.org.uk>
From: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
To: linux-pm@vger.kernel.org,
	 loongarch@lists.linux.dev,
	 linux-acpi@vger.kernel.org,
	 linux-arch@vger.kernel.org,
	 linux-kernel@vger.kernel.org,
	 linux-arm-kernel@lists.infradead.org,
	 linux-riscv@lists.infradead.org,
	 kvmarm@lists.linux.dev,
	 x86@kernel.org,
	 linux-csky@vger.kernel.org,
	 linux-doc@vger.kernel.org,
	 linux-ia64@vger.kernel.org,
	 linux-parisc@vger.kernel.org
Cc: Salil Mehta <salil.mehta@huawei.com>,
	 Jean-Philippe Brucker <jean-philippe@linaro.org>,
	 jianyong.wu@arm.com,
	 justin.he@arm.com,
	 James Morse <james.morse@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH 12/21] arm64: setup: Switch over to GENERIC_CPU_DEVICES using
 arch_register_cpu()
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1r5R3b-00Csza-Ku@rmk-PC.armlinux.org.uk>
Date: Tue, 21 Nov 2023 13:44:51 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_054457_036062_5EB40760 
X-CRM114-Status: GOOD (  13.95  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: James Morse <james.morse@arm.com>

To allow ACPI's _STA value to hide CPUs that are present, but not
available to online right now due to VMM or firmware policy, the
register_cpu() call needs to be made by the ACPI machinery when ACPI
is in use. This allows it to hide CPUs that are unavailable from sysfs.

Switching to GENERIC_CPU_DEVICES is an intermediate step to allow all
five ACPI architectures to be modified at once.

Switch over to GENERIC_CPU_DEVICES, and provide an arch_register_cpu()
that populates the hotpluggable flag. arch_register_cpu() is also the
interface the ACPI machinery expects.

The struct cpu in struct cpuinfo_arm64 is never used directly, remove
it to use the one GENERIC_CPU_DEVICES provides.

This changes the CPUs visible in sysfs from possible to present, but
on arm64 smp_prepare_cpus() ensures these are the same.

This patch also has the effect of moving the registration of CPUs from
subsys to driver core initialisation, prior to any initcalls running.

Signed-off-by: James Morse <james.morse@arm.com>
Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
Changes since RFC v2:
 * Add note about initialisation order change.
---
 arch/arm64/Kconfig           |  1 +
 arch/arm64/include/asm/cpu.h |  1 -
 arch/arm64/kernel/setup.c    | 13 ++++---------
 3 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 7b071a00425d..84bce830e365 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -132,6 +132,7 @@ config ARM64
 	select GENERIC_ARCH_TOPOLOGY
 	select GENERIC_CLOCKEVENTS_BROADCAST
 	select GENERIC_CPU_AUTOPROBE
+	select GENERIC_CPU_DEVICES
 	select GENERIC_CPU_VULNERABILITIES
 	select GENERIC_EARLY_IOREMAP
 	select GENERIC_IDLE_POLL_SETUP
diff --git a/arch/arm64/include/asm/cpu.h b/arch/arm64/include/asm/cpu.h
index f3034099fd95..b1e43f56ee46 100644
--- a/arch/arm64/include/asm/cpu.h
+++ b/arch/arm64/include/asm/cpu.h
@@ -38,7 +38,6 @@ struct cpuinfo_32bit {
 };
 
 struct cpuinfo_arm64 {
-	struct cpu	cpu;
 	struct kobject	kobj;
 	u64		reg_ctr;
 	u64		reg_cntfrq;
diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
index 417a8a86b2db..165bd2c0dd5a 100644
--- a/arch/arm64/kernel/setup.c
+++ b/arch/arm64/kernel/setup.c
@@ -402,19 +402,14 @@ static inline bool cpu_can_disable(unsigned int cpu)
 	return false;
 }
 
-static int __init topology_init(void)
+int arch_register_cpu(int num)
 {
-	int i;
+	struct cpu *cpu = &per_cpu(cpu_devices, num);
 
-	for_each_possible_cpu(i) {
-		struct cpu *cpu = &per_cpu(cpu_data.cpu, i);
-		cpu->hotpluggable = cpu_can_disable(i);
-		register_cpu(cpu, i);
-	}
+	cpu->hotpluggable = cpu_can_disable(num);
 
-	return 0;
+	return register_cpu(cpu, num);
 }
-subsys_initcall(topology_init);
 
 static void dump_kernel_offset(void)
 {
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
