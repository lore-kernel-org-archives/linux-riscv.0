Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8414C4167D
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 10:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wlCWb3O6ddiU+j+XSR9rtw1wiPa0+AgmlnfWAx4CN+8=; b=EaldadEYx5vM81
	L/qf6CyFuB9NP3NN3SEkhD1un9F2ClRGmSRGPy0uip112aQKy2owqRbNBVwHuZVIZnY4TKhi1jEMy
	0WRmfxrHrnzB3gg1smrOZh0eo9CUmgVi1bFi4Vk6mdCywJztYSRVI3fsLRrymAcgwiN7WTg/1jUSb
	+jOP+1+PKETvoufks8s+dyS60YPa0hlQfGEDtAOY6+/Q7ms4hNKJQyfmra0e3ugAd/YgLoDGtYUOU
	TlwtzWSOdJhyOeJDhyrezJgEAgZh17ElAFcsyGPLFmMZi98KJyjCCCzTfmfs6u6n3t8xnJMcByjHF
	1BErA5SErMQoqu4e5zyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0JMy-0014eg-1g;
	Tue, 07 Nov 2023 10:31:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0JMo-0014St-10;
	Tue, 07 Nov 2023 10:31:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=XcV81gO4vyyPQCIMe3Ft4CNlHwh1SyltLFAazwDCZ/M=; b=g2NDdJuMoM57TILM0hgICpoxud
	BjQQ3xm7WwBEzB7rv49msMZ7IgPfj7DIYQabMQWjHEUFdOmxBIr/Mb5pLMAr6m+atyRlzFrweZbbv
	U4wffzViZD4bWU+EKjqd2ARNrJXNrJYZeQA6CIEaLPw5uSKrpFDFcY9/3ghwevII3/MhxBtSlht5L
	nUNBqeDjGDZtMnAvVqSt4k4S5cZfOyueRV8c77giith81417o1/0/xBKH1RBnPJdPwUeKEBVKypFK
	96M2eEtX7VfzdepVb0zfJCykXPG0BEfD8pXzA00i7rBVaEtjebm6fpxI6BO5rVHb2odJxXlFCh5ug
	yXVusgZA==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0JMW-00Bvec-2z;
	Tue, 07 Nov 2023 10:31:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XcV81gO4vyyPQCIMe3Ft4CNlHwh1SyltLFAazwDCZ/M=; b=Lu183UwzMN2ITajm/nxPmANtVv
	ftR8t0repmhabvmthphgGYTZpqZMLAFiOPc/opr6tfLYbKHeTfBQWi7bPIwctm4UVc/hL3TsON+45
	CriFKObigKELR5jNb9fRFmKFaFuetwm2sezBqf2IOqu4LEh9OUIGJXp+dFBamb3a2aiSSVVQqPNoc
	Eq1Rf5hoF30NW2udoVr6jzwFe+evVoej14y4zqlAIGRtxqrJf5Yvm4OVociY8kDcB1IFIcS9b+hze
	4LEpNrFpyAamwU7n/HjXHAeEwnAodvs0oXCqcWGbkUM/5LiRCZwfDyKpwnnNMwJaTyA+mMmP2WTbn
	A55wnRYw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51260 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1r0JMO-0000KP-2A;
	Tue, 07 Nov 2023 10:31:04 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1r0JMQ-00CTyb-Ee; Tue, 07 Nov 2023 10:31:06 +0000
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
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH RFC 21/22] riscv: Switch over to GENERIC_CPU_DEVICES
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1r0JMQ-00CTyb-Ee@rmk-PC.armlinux.org.uk>
Date: Tue, 07 Nov 2023 10:31:06 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_103117_671209_395C83B1 
X-CRM114-Status: GOOD (  12.37  )
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

Now that GENERIC_CPU_DEVICES calls arch_register_cpu(), which can be
overridden by the arch code, switch over to this to allow common code
to choose when the register_cpu() call is made.

This allows topology_init() to be removed.

This is an intermediate step to the logic being moved to drivers/acpi,
where GENERIC_CPU_DEVICES will do the work when booting with acpi=off.

This patch also has the effect of moving the registration of CPUs from
subsys to driver core initialisation, prior to any initcalls running.

Signed-off-by: James Morse <james.morse@arm.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
Changes since RFC v2:
 * Add note about initialisation order change.
---
 arch/riscv/Kconfig        |  1 +
 arch/riscv/kernel/setup.c | 19 ++++---------------
 2 files changed, 5 insertions(+), 15 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index eaa15a20e6ae..264aa466aec3 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -69,6 +69,7 @@ config RISCV
 	select GENERIC_ARCH_TOPOLOGY
 	select GENERIC_ATOMIC64 if !64BIT
 	select GENERIC_CLOCKEVENTS_BROADCAST if SMP
+	select GENERIC_CPU_DEVICES
 	select GENERIC_EARLY_IOREMAP
 	select GENERIC_ENTRY
 	select GENERIC_GETTIMEOFDAY if HAVE_GENERIC_VDSO
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 0624f44d43ec..f8875ae1b0aa 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -50,7 +50,6 @@ atomic_t hart_lottery __section(".sdata")
 #endif
 ;
 unsigned long boot_cpu_hartid;
-static DEFINE_PER_CPU(struct cpu, cpu_devices);
 
 /*
  * Place kernel memory regions on the resource tree so that
@@ -295,23 +294,13 @@ void __init setup_arch(char **cmdline_p)
 	riscv_set_dma_cache_alignment();
 }
 
-static int __init topology_init(void)
+int arch_register_cpu(int cpu)
 {
-	int i, ret;
+	struct cpu *c = &per_cpu(cpu_devices, cpu);
 
-	for_each_possible_cpu(i) {
-		struct cpu *cpu = &per_cpu(cpu_devices, i);
-
-		cpu->hotpluggable = cpu_has_hotplug(i);
-		ret = register_cpu(cpu, i);
-		if (unlikely(ret))
-			pr_warn("Warning: %s: register_cpu %d failed (%d)\n",
-			       __func__, i, ret);
-	}
-
-	return 0;
+	c->hotpluggable = cpu_has_hotplug(cpu);
+	return register_cpu(c, cpu);
 }
-subsys_initcall(topology_init);
 
 void free_initmem(void)
 {
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
