Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F40C4332F
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 10:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UTR5aqLDPZGPQ5J1CsitDvkhzrx5WWWJwHYCqKzhZwA=; b=cUpIv9ofV0STCx
	Lo12rMRKi6OCDSD6s5gfZHA4g47i686e16p7Uwz4w2Y1to7QhiyPgH384Mi4xIeV9vYjibVnV2vj3
	YgtZ1W+6XTkOWr4mMF34pT1gFiARkOTnJ827lrxL1ns0z0+xBImwfA5biMLZQtNBzSj3ERnVzoiau
	CrCQaP+DX+esUCWcaCdB27pIQJ2a13b1dg5TsMnfvw7V/HdG+ylmeCnJ05kvPgAGAPIUE/epczSxy
	TJA413cuPj31/IOaFuIbDt6wmZKUBKHa96i4+dj1JRlFmRU4WsJuuRIsuU1Wjge3rJy2o+8vy80ye
	LdpMd6ohuRhmRhHRR+Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0JO9-0015ad-2b;
	Tue, 07 Nov 2023 10:32:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0JO7-0015Yp-2V;
	Tue, 07 Nov 2023 10:32:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=p6rNywfcWH+rY5/5yuS2goEj7UjffB2rbRgVPynUNSU=; b=f27WagsxwkX+GvuZh0rqtCJegc
	UHZYrcgFMioBHsnb/irIgRqBnn5bmkGhzCdxqtA8cdfhwku8+WCMJiqpP7vCz9IxfCn/w8ZtWESxa
	JpHl+dvqkB3MJQTj8CtWRVEjNFMoK3wNfkL6Nw/O5Z9nW8Y3bCYe4NARPBe02O9G0DmD8j21gPrMl
	Gwt1QNxE77p9qcW8Ga/TRuBNJvZZQjr/+S4ToVTJ0GbUb1a0mDWrZcAruPUfxQt0oARofuhA2QpY1
	/kpjrXg+ZV9cmBzs7KS13EJ1SUULHXysHUFC5TevvcYRUkYG/kaDG8S2zVa5IRRgAKJ4JE4qX77gA
	g1mSGCoA==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0JNy-00BvXp-0s;
	Tue, 07 Nov 2023 10:32:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=p6rNywfcWH+rY5/5yuS2goEj7UjffB2rbRgVPynUNSU=; b=Abmqv0KdOT16ptxU6xdSI4r3wJ
	ASOjVcyQVToT1DJ3hdRLTjAzCCD9+Pokw6JBW8tDsNsYXxU6qk+IeyfnXnM9oMvyCGXRD50KDCEsF
	n2sjLfVqgJc9+8fEXs8cGa0HrEu6y2oI2gM1FysGuZG/Zjx6DAJCxlwV5pR7/erH/HugKmPQIBBRc
	GlwSMJ69Woo8p7GiPfSi8i2vq0t34ou5gergbQFJfPvyqOpLGvP7lOIwnEKZOxkO5FpVXbU6BP+bA
	mWL5l1kkogvjKgsBnHhqvzbGy5VKwMJeEsBziKS8mckd9WnZ5paJf3Vho4GFqIVS6fTfZaSaw12iH
	eYGqDdMA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:54774 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1r0JLj-0000Hj-1a;
	Tue, 07 Nov 2023 10:30:23 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1r0JLl-00CTxk-7O; Tue, 07 Nov 2023 10:30:25 +0000
In-Reply-To: <ZUoRY33AAHMc5ThW@shell.armlinux.org.uk>
References: <ZUoRY33AAHMc5ThW@shell.armlinux.org.uk>
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
Subject: [PATCH RFC 13/22] arm64: setup: Switch over to GENERIC_CPU_DEVICES
 using arch_register_cpu()
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1r0JLl-00CTxk-7O@rmk-PC.armlinux.org.uk>
Date: Tue, 07 Nov 2023 10:30:25 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_103242_451638_0803576E 
X-CRM114-Status: GOOD (  13.53  )
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
