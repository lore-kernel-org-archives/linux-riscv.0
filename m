Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5577EC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Oct 2022 12:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cBbX68l831PfzVR/mSTrDH7uF5gdJcC5IjN+gbFQiBA=; b=HqTp90raB7k1HE
	wF5MXvtcp1Ou5vFKc0yOGwp4wOgEZxmhNpnyor5H67Flwe8pKITAtfc9FkKZATEjKpvXe1yNPSoYA
	h4AGg0po71M6wvBw/nsOmNmueDezxMYebgVm8eD+wirDbfW53bH7So/lodr7ipFgI2di+7roujU7l
	UmGhuv8Obo8OwpVag+7sfMcnyZ1hUhY3t4awbxJYEI8/jII5i9UzHcsU0ZB+UcBIMeERyic55sY3H
	fllnzKAySCv3BHkvhZCCMuVM00X9X1fUhQ9w2nFepwCoRc1bu0TskgzsW9uVL+HYfWWJiA1rhOtvO
	gcm2yie4U7Zb+YLvyqwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol8Zn-001lYP-6S; Wed, 19 Oct 2022 12:53:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol8ZO-001lCj-Ot; Wed, 19 Oct 2022 12:53:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1666183995; x=1697719995;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6FLn9g71meNjs0yGLrKpiiiXP87EXkFC9cg0BIrfPWM=;
  b=YCVbMNowi4fTlSaCux4AqyCFaQNLaSngUejImb9AsBmqW93gGj8dC2fK
   4wTAy/LJIL42FABM7ERAS+vUf1Iza7Fd+zpnBZdxDC64HfZuPsKDz7Ekn
   vMNDJ+yC2YGUL7xJ5ItpzMXAFpsOOc8DryM6F+x2Tkx7Vy3ElLfiI4FLF
   2RaRthcKyg7jRpU+Bp9fJ7ykLIqtxDROao2MECNRfqcKyQ83QEC8NDwKj
   eShpdq7E46o1/I4bY/K5BDzcrUey9dBCmedhHGuQhISvjFhfW57TLP8cU
   n1gW7SCuqxt5q60JS6XyueSdJfVnxxc6Z9W1PilkvJLXKAItUg82l1aGY
   g==;
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; 
   d="scan'208";a="185397545"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Oct 2022 05:53:06 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 19 Oct 2022 05:53:04 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Wed, 19 Oct 2022 05:53:02 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <stable@vger.kernel.org>
CC: <conor.dooley@microchip.com>, <Brice.Goglin@inria.fr>,
	<atishp@atishpatra.org>, <catalin.marinas@arm.com>,
	<gregkh@linuxfoundation.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<palmer@dabbelt.com>, <sudeep.holla@arm.com>, <will@kernel.org>, Atish Patra
	<atishp@rivosinc.com>
Subject: [PATCH 5.4 2/2] riscv: topology: fix default topology reporting
Date: Wed, 19 Oct 2022 13:52:10 +0100
Message-ID: <20221019125209.2844943-2-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221019125209.2844943-1-conor.dooley@microchip.com>
References: <20221019125209.2844943-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_055314_881568_23B005AD 
X-CRM114-Status: GOOD (  14.64  )
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

commit fbd92809997a391f28075f1c8b5ee314c225557c upstream.

RISC-V has no sane defaults to fall back on where there is no cpu-map
in the devicetree.
Without sane defaults, the package, core and thread IDs are all set to
-1. This causes user-visible inaccuracies for tools like hwloc/lstopo
which rely on the sysfs cpu topology files to detect a system's
topology.

On a PolarFire SoC, which should have 4 harts with a thread each,
lstopo currently reports:

Machine (793MB total)
  Package L#0
    NUMANode L#0 (P#0 793MB)
    Core L#0
      L1d L#0 (32KB) + L1i L#0 (32KB) + PU L#0 (P#0)
      L1d L#1 (32KB) + L1i L#1 (32KB) + PU L#1 (P#1)
      L1d L#2 (32KB) + L1i L#2 (32KB) + PU L#2 (P#2)
      L1d L#3 (32KB) + L1i L#3 (32KB) + PU L#3 (P#3)

Adding calls to store_cpu_topology() in {boot,smp} hart bringup code
results in the correct topolgy being reported:

Machine (793MB total)
  Package L#0
    NUMANode L#0 (P#0 793MB)
    L1d L#0 (32KB) + L1i L#0 (32KB) + Core L#0 + PU L#0 (P#0)
    L1d L#1 (32KB) + L1i L#1 (32KB) + Core L#1 + PU L#1 (P#1)
    L1d L#2 (32KB) + L1i L#2 (32KB) + Core L#2 + PU L#2 (P#2)
    L1d L#3 (32KB) + L1i L#3 (32KB) + Core L#3 + PU L#3 (P#3)

CC: stable@vger.kernel.org # 456797da792f: arm64: topology: move store_cpu_topology() to shared code
Fixes: 03f11f03dbfe ("RISC-V: Parse cpu topology during boot.")
Reported-by: Brice Goglin <Brice.Goglin@inria.fr>
Link: https://github.com/open-mpi/hwloc/issues/536
Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
I just resolved the conflicts. Tested in QEMU only. SMP doesn't seem to work in
5.4, using the same command that works for 5.10.
---
 arch/riscv/Kconfig          | 2 +-
 arch/riscv/kernel/smpboot.c | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index b21549a34447..e0a77af5c130 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -51,7 +51,7 @@ config RISCV
 	select PCI_MSI if PCI
 	select RISCV_TIMER
 	select GENERIC_IRQ_MULTI_HANDLER
-	select GENERIC_ARCH_TOPOLOGY if SMP
+	select GENERIC_ARCH_TOPOLOGY
 	select ARCH_HAS_PTE_SPECIAL
 	select ARCH_HAS_MMIOWB
 	select HAVE_EBPF_JIT if 64BIT
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 261f4087cc39..0576a6b2bcc5 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -46,6 +46,8 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 {
 	int cpuid;
 
+	store_cpu_topology(smp_processor_id());
+
 	/* This covers non-smp usecase mandated by "nosmp" option */
 	if (max_cpus == 0)
 		return;
@@ -142,8 +144,8 @@ asmlinkage __visible void __init smp_callin(void)
 	current->active_mm = mm;
 
 	trap_init();
+	store_cpu_topology(smp_processor_id());
 	notify_cpu_starting(smp_processor_id());
-	update_siblings_masks(smp_processor_id());
 	set_cpu_online(smp_processor_id(), 1);
 	/*
 	 * Remote TLB flushes are ignored while the CPU is offline, so emit
-- 
2.38.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
