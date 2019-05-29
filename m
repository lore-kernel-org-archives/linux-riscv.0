Return-Path: <SRS0=MB+m=T5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95341C28CC0
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 29 May 2019 21:16:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A645241EE
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 29 May 2019 21:16:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NzNMi3t+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="KYgxlz9v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A645241EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zw9ZeIG7GiY17BorkB8CCjAK0e4tfA01d8lTGR7ZDMY=; b=NzNMi3t+zBVP5K
	WiQB3iKzyK4An/5VqLDEsCuRtsK5d9GcF3bac0G3e4FHNvjFd185Q3/glaoYphQFlHcZlckjinBra
	kOf1WgM5V7GdDtgoLYporDTguvBq3rfr6iRSQ3ZVKYCFMKwWZXSRC80vP8FcA7znvJ7n9U2Sj0IJS
	3GyyJXuFptQNX85msg1sZiDUaGBIdcn7qihpr4+kdmjGb1EMEqXif7sDOd0EVq3PXvcRY65PBclNA
	gDH6GRL8P+HtTxemVdWBj2/+dLI0hd+ELEKEs6FwIoyPvpFucDqAcd6i4xermd9NQbJ6zIal//avJ
	YSUVGafreuRcpuF4sXUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hW5w9-0000KG-O1; Wed, 29 May 2019 21:16:41 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hW5w7-0000Jn-BQ; Wed, 29 May 2019 21:16:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1559164599; x=1590700599;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=amOjgDh6kVgGSeqvAP+D7/HG3VWV3i7Or4bw+vBidq8=;
 b=KYgxlz9vgq2Eus55rf/jWOyhkFr6S/mfy40w6fi88Gck/p3i5sA81np+
 sC/TjbFOo7H6m5HVMwthbaSYqCk01S450jEeV3bX98nBHEOQZEPENNnS2
 LPPmZi8Scyzt0CC123Tml6Ieur8q+QMPGt7MRS4AT6Ou7ItQYtdZeMpVx
 wxgOxWRK4Pxz+7843cQZnJq2qGb72l56Dh8HTK6sezhSwUkL8ONjqGt4b
 o4M5lny8+iNr3aFjrBOmpO9CJOw4z9KqyUI9MKW5N7crqxK+A+XAm1Bk8
 upvxWxYi2B7zKMy1sATxbbEMtag3rBvWuw7CgIywv01u6FK71Q7hIn1Ed w==;
X-IronPort-AV: E=Sophos;i="5.60,527,1549900800"; d="scan'208";a="111036657"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 30 May 2019 05:16:38 +0800
IronPort-SDR: AuFDalO7W7ZuCm7DPZJOrExeSJy6VyznEmc7vBv6KrumdECkekxlwSFLQZ9fWmDtiiGgiZ348a
 6pYvWaJZWLlpTrJZE8ete8/LVXErhfiaFuoTAhoLTS77mrZ0v7U/sUnd4i3xYSVAbv8+Wte5s1
 UI937e5R+QN7X/gnvKroPFFr+D3sYRVM9TGhJkJdBDJoOznT3WBOAa6MrjCHfd9emwpiRhxcri
 kt/mlcb8h54Uwmjr3n2J3Q3hXib5GQk/EA1aM0YSYvGXlTWNPRNzvwZxfrbiqVE4DuHSuIxjNC
 BZz5d9ZLyIzdQFFLXsey6sEf
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 29 May 2019 13:54:10 -0700
IronPort-SDR: BuJEcp7kpiVfH+44FML9Wz7261edwcWa349N3tzjS8K9ckVv1NEsLMReMStYKUXuAzA7EBBfq+
 RSt2rSO4M91JdhcnpsONOcJa61Cu3xOHj0zVEwSQar1iiieDhUgyl/lL0JVGEOkgpi2TN5Wuhw
 7MpMzkbrbsKz1AJvwNJggovpU+SfTQ3y2nA8zO4IGw/9kDxdYB0InSB0sn2oIbQmto8/AGeocn
 ahk0+S0pT06vDa5j3crtO0igUd4/6Q4DGvPWOtp5/XSrj4wYbHPf53pyDUOWFh6hfMOvi/hjwE
 QBw=
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 29 May 2019 14:16:38 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH v6 5/7] RISC-V: Parse cpu topology during boot.
Date: Wed, 29 May 2019 14:13:38 -0700
Message-Id: <20190529211340.17087-6-atish.patra@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190529211340.17087-1-atish.patra@wdc.com>
References: <20190529211340.17087-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190529_141639_424893_FE97B56F 
X-CRM114-Status: GOOD (  13.56  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, Palmer Dabbelt <palmer@sifive.com>,
 Will Deacon <will.deacon@arm.com>, Atish Patra <atish.patra@wdc.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 linux-riscv@lists.infradead.org, Ingo Molnar <mingo@kernel.org>,
 Anup Patel <anup@brainfault.org>, Morten Rasmussen <morten.rasmussen@arm.com>,
 devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jeremy Linton <jeremy.linton@arm.com>, Otto Sabart <ottosabart@seberm.com>,
 Sudeep Holla <sudeep.holla@arm.com>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Currently, there are no topology defined for RISC-V.
Parse the cpu-map node from device tree and setup the
cpu topology.

CPU topology after applying the patch.
$cat /sys/devices/system/cpu/cpu2/topology/core_siblings_list
0-3
$cat /sys/devices/system/cpu/cpu3/topology/core_siblings_list
0-3
$cat /sys/devices/system/cpu/cpu3/topology/physical_package_id
0
$cat /sys/devices/system/cpu/cpu3/topology/core_id
3

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Acked-by: Sudeep Holla <sudeep.holla@arm.com>
---
 arch/riscv/Kconfig          | 1 +
 arch/riscv/kernel/smpboot.c | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 0c4b12205632..2d8a16299a85 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -47,6 +47,7 @@ config RISCV
 	select PCI_MSI if PCI
 	select RISCV_TIMER
 	select GENERIC_IRQ_MULTI_HANDLER
+	select GENERIC_ARCH_TOPOLOGY if SMP
 	select ARCH_HAS_PTE_SPECIAL
 	select ARCH_HAS_MMIOWB
 	select HAVE_EBPF_JIT if 64BIT
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 7a0b62252524..54f89d5b19ba 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -16,6 +16,7 @@
  * GNU General Public License for more details.
  */
 
+#include <linux/arch_topology.h>
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
@@ -43,6 +44,7 @@ static DECLARE_COMPLETION(cpu_running);
 
 void __init smp_prepare_boot_cpu(void)
 {
+	init_cpu_topology();
 }
 
 void __init smp_prepare_cpus(unsigned int max_cpus)
@@ -146,6 +148,7 @@ asmlinkage void __init smp_callin(void)
 
 	trap_init();
 	notify_cpu_starting(smp_processor_id());
+	update_siblings_masks(smp_processor_id());
 	set_cpu_online(smp_processor_id(), 1);
 	/*
 	 * Remote TLB flushes are ignored while the CPU is offline, so emit
-- 
2.21.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
