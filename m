Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A043BC38A2D
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Oct 2022 10:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:From:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=jERSQvczo9sSVoN2WZfhxfLdbrBM+Al55dFHKkj8t7Q=; b=2MbhodnbjhhMYJ
	DxIJU4bs7QKECtbNHbuV4sg4+lqpNSvceA+DdlWAprESOix/d2b7HrSTNbL7OOkQv9C4HpygRnSwY
	Ms4s/65O2z9uglkbyJoqz0JWz/sCKesFuFRIjKdP/wziNOIdkzi3o+pOAgKchgPLCJELt5fJyjy5B
	o+HW6iQQZ8pHoYYkP/PDbkI39ywOyDwdzRdEFWWR6XCAEoOrnYhQk0uW4Mb2yMGMobFuyv0UiUzKd
	Ga/yRg/i4VxgznD10+N6oiK6tq0pMkKCWNMEk35j6oY1fX9soJmjpLEPdOa2xTz3vO1LXUrLr555x
	fs5G3eMaFFzeWZCzr2wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo0D0-00Cs8L-HO; Thu, 27 Oct 2022 10:33:58 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo0Co-00Cs4m-76; Thu, 27 Oct 2022 10:33:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E6271B82564;
	Thu, 27 Oct 2022 10:33:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1865CC433C1;
	Thu, 27 Oct 2022 10:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666866823;
	bh=z75+ZNe+6e+fqoBiNVIt/Mmdyy3NCYltxKMCuD931Fs=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=TiJENqKRzVd5zxmumzSPn7IdfFcj/E+A1ZHQnn3gm69b9nCSzuhv2Ze+xPKG4op7u
	 QhEvfykkB/seIU+HCz5nu6+gdCWF6hPuLPIClf2cYc4/pNf2fg7xDNEEl+44889aQP
	 Rbxh5IBdVLoDGFDuIv1Py5NXEKhBp7mXXkSVZZYA=
Subject: Patch "arm64: topology: move store_cpu_topology() to shared code" has been added to the 5.4-stable tree
To: Brice.Goglin@inria.fr,atishp@atishpatra.org,atishp@rivosinc.com,catalin.marinas@arm.com,conor.dooley@microchip.com,gregkh@linuxfoundation.org,linux-arm-kernel@lists.infradead.org,linux-riscv@lists.infradead.org,palmer@dabbelt.com,sudeep.holla@arm.com,will@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 27 Oct 2022 12:33:21 +0200
In-Reply-To: <20221019125209.2844943-1-conor.dooley@microchip.com>
Message-ID: <1666866801121145@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_033346_573223_70EDCFB4 
X-CRM114-Status: GOOD (  21.13  )
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


This is a note to let you know that I've just added the patch titled

    arm64: topology: move store_cpu_topology() to shared code

to the 5.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     arm64-topology-move-store_cpu_topology-to-shared-code.patch
and it can be found in the queue-5.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Thu Oct 27 12:19:05 PM CEST 2022
From: Conor Dooley <conor.dooley@microchip.com>
Date: Wed, 19 Oct 2022 13:52:09 +0100
Subject: arm64: topology: move store_cpu_topology() to shared code
To: <stable@vger.kernel.org>
Cc: <conor.dooley@microchip.com>, <Brice.Goglin@inria.fr>, <atishp@atishpatra.org>, <catalin.marinas@arm.com>, <gregkh@linuxfoundation.org>, <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>, <palmer@dabbelt.com>, <sudeep.holla@arm.com>, <will@kernel.org>, Atish Patra <atishp@rivosinc.com>
Message-ID: <20221019125209.2844943-1-conor.dooley@microchip.com>

From: Conor Dooley <conor.dooley@microchip.com>

commit 456797da792fa7cbf6698febf275fe9b36691f78 upstream.

arm64's method of defining a default cpu topology requires only minimal
changes to apply to RISC-V also. The current arm64 implementation exits
early in a uniprocessor configuration by reading MPIDR & claiming that
uniprocessor can rely on the default values.

This is appears to be a hangover from prior to '3102bc0e6ac7 ("arm64:
topology: Stop using MPIDR for topology information")', because the
current code just assigns default values for multiprocessor systems.

With the MPIDR references removed, store_cpu_topolgy() can be moved to
the common arch_topology code.

Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/arm64/kernel/topology.c |   40 ----------------------------------------
 drivers/base/arch_topology.c |   19 +++++++++++++++++++
 2 files changed, 19 insertions(+), 40 deletions(-)

--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -21,46 +21,6 @@
 #include <asm/cputype.h>
 #include <asm/topology.h>
 
-void store_cpu_topology(unsigned int cpuid)
-{
-	struct cpu_topology *cpuid_topo = &cpu_topology[cpuid];
-	u64 mpidr;
-
-	if (cpuid_topo->package_id != -1)
-		goto topology_populated;
-
-	mpidr = read_cpuid_mpidr();
-
-	/* Uniprocessor systems can rely on default topology values */
-	if (mpidr & MPIDR_UP_BITMASK)
-		return;
-
-	/*
-	 * This would be the place to create cpu topology based on MPIDR.
-	 *
-	 * However, it cannot be trusted to depict the actual topology; some
-	 * pieces of the architecture enforce an artificial cap on Aff0 values
-	 * (e.g. GICv3's ICC_SGI1R_EL1 limits it to 15), leading to an
-	 * artificial cycling of Aff1, Aff2 and Aff3 values. IOW, these end up
-	 * having absolutely no relationship to the actual underlying system
-	 * topology, and cannot be reasonably used as core / package ID.
-	 *
-	 * If the MT bit is set, Aff0 *could* be used to define a thread ID, but
-	 * we still wouldn't be able to obtain a sane core ID. This means we
-	 * need to entirely ignore MPIDR for any topology deduction.
-	 */
-	cpuid_topo->thread_id  = -1;
-	cpuid_topo->core_id    = cpuid;
-	cpuid_topo->package_id = cpu_to_node(cpuid);
-
-	pr_debug("CPU%u: cluster %d core %d thread %d mpidr %#016llx\n",
-		 cpuid, cpuid_topo->package_id, cpuid_topo->core_id,
-		 cpuid_topo->thread_id, mpidr);
-
-topology_populated:
-	update_siblings_masks(cpuid);
-}
-
 #ifdef CONFIG_ACPI
 static bool __init acpi_cpu_is_threaded(int cpu)
 {
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -538,4 +538,23 @@ void __init init_cpu_topology(void)
 	else if (of_have_populated_dt() && parse_dt_topology())
 		reset_cpu_topology();
 }
+
+void store_cpu_topology(unsigned int cpuid)
+{
+	struct cpu_topology *cpuid_topo = &cpu_topology[cpuid];
+
+	if (cpuid_topo->package_id != -1)
+		goto topology_populated;
+
+	cpuid_topo->thread_id = -1;
+	cpuid_topo->core_id = cpuid;
+	cpuid_topo->package_id = cpu_to_node(cpuid);
+
+	pr_debug("CPU%u: package %d core %d thread %d\n",
+		 cpuid, cpuid_topo->package_id, cpuid_topo->core_id,
+		 cpuid_topo->thread_id);
+
+topology_populated:
+	update_siblings_masks(cpuid);
+}
 #endif


Patches currently in stable-queue which might be from conor.dooley@microchip.com are

queue-5.4/arm64-topology-move-store_cpu_topology-to-shared-code.patch
queue-5.4/riscv-topology-fix-default-topology-reporting.patch

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
