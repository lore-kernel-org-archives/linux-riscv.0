Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B3B1C67871
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Oct 2022 10:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:From:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=VML5OkZFW+wBOlxbCc7wkHXKtPhcuOonkOyCnb0VHTI=; b=toKT487rS7M+fV
	/QgWgzTp98tJua7MQM6bRmJUwPXdRqXIA9Fz+IetcZw9zWxTfw7d7dOtlqKA2vHhkmQQDRc7QXvTE
	jUizWNz4NkN3uvLzjvrB6GbpBGOLLlqsrpHdyUL2Ld8s5W90ovfpGA0s14gewDvxlzfB5Dt2UCi+I
	bDSfUPDakVgNdLbBv8re5Wm3qnOTzfvStmdbY++mHdK9RxsRdfTpCmQa3JQ0PwrwFMT+FquOoQFz/
	ltSynm3e7mUW9WvTo52MaSUK+mB/KZFvwgjcksR1F7+mW0KEHfSBl8TC58VBVmLMeskp4+lHRsJAC
	YowhUdXpi7cwCvodLXlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo0DE-00CsCa-2c; Thu, 27 Oct 2022 10:34:12 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo0Ct-00Cs6U-K4; Thu, 27 Oct 2022 10:33:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 426FAB824D2;
	Thu, 27 Oct 2022 10:33:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C286C433C1;
	Thu, 27 Oct 2022 10:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666866828;
	bh=DpKam0n+8pNpFBF8F6jlmcDPZS6jKvDyIefTECek8mI=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=m4Z++8n3HjTFuk/TsjF0ffoX4gD+3CBG8SAmdGWsk3tqQhC17aIJD1HiRCBGKQhgH
	 kac83t+fhe5ophjL5URL2CFLyTAux44oPwxrHPBwaaudpU3CVHE+t5igW3lMOc4BIR
	 tw6UkL5O792dHCcwuEjid7+oWPncmGK862cgSY1M=
Subject: Patch "riscv: topology: fix default topology reporting" has been added to the 5.4-stable tree
To: Brice.Goglin@inria.fr,atishp@atishpatra.org,atishp@rivosinc.com,catalin.marinas@arm.com,conor.dooley@microchip.com,gregkh@linuxfoundation.org,linux-arm-kernel@lists.infradead.org,linux-riscv@lists.infradead.org,palmer@dabbelt.com,sudeep.holla@arm.com,will@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 27 Oct 2022 12:33:21 +0200
In-Reply-To: <20221019125209.2844943-2-conor.dooley@microchip.com>
Message-ID: <16668668016253@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_033352_001876_E5B51B4A 
X-CRM114-Status: GOOD (  18.23  )
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

    riscv: topology: fix default topology reporting

to the 5.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     riscv-topology-fix-default-topology-reporting.patch
and it can be found in the queue-5.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Thu Oct 27 12:19:05 PM CEST 2022
From: Conor Dooley <conor.dooley@microchip.com>
Date: Wed, 19 Oct 2022 13:52:10 +0100
Subject: riscv: topology: fix default topology reporting
To: <stable@vger.kernel.org>
Cc: <conor.dooley@microchip.com>, <Brice.Goglin@inria.fr>, <atishp@atishpatra.org>, <catalin.marinas@arm.com>, <gregkh@linuxfoundation.org>, <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>, <palmer@dabbelt.com>, <sudeep.holla@arm.com>, <will@kernel.org>, Atish Patra <atishp@rivosinc.com>
Message-ID: <20221019125209.2844943-2-conor.dooley@microchip.com>

From: Conor Dooley <conor.dooley@microchip.com>

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
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/riscv/Kconfig          |    2 +-
 arch/riscv/kernel/smpboot.c |    4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

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
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -46,6 +46,8 @@ void __init smp_prepare_cpus(unsigned in
 {
 	int cpuid;
 
+	store_cpu_topology(smp_processor_id());
+
 	/* This covers non-smp usecase mandated by "nosmp" option */
 	if (max_cpus == 0)
 		return;
@@ -142,8 +144,8 @@ asmlinkage __visible void __init smp_cal
 	current->active_mm = mm;
 
 	trap_init();
+	store_cpu_topology(smp_processor_id());
 	notify_cpu_starting(smp_processor_id());
-	update_siblings_masks(smp_processor_id());
 	set_cpu_online(smp_processor_id(), 1);
 	/*
 	 * Remote TLB flushes are ignored while the CPU is offline, so emit


Patches currently in stable-queue which might be from conor.dooley@microchip.com are

queue-5.4/arm64-topology-move-store_cpu_topology-to-shared-code.patch
queue-5.4/riscv-topology-fix-default-topology-reporting.patch

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
