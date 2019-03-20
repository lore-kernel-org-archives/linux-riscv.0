Return-Path: <SRS0=bcqy=RX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F641C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2019 23:48:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57E36218CD
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2019 23:48:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QVbbUM8a";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="HgOrsZeF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57E36218CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eVXE88azgfj6OlRN8DClrcFcPYrRRoHDVJudvDZAYlA=; b=QVbbUM8a+9erLL
	NzUib5Tm3t4NFKeBRb0hiVp/SUmhLm2hfUbNnFByVhPnB8AuSdPoVEAFDZcJw9UHGPzLqWIxsZefX
	2qfAyoDDDYadhecoRpT+QniX7WPaCV/uk3AuLf6kpGIr9D3ZH0qycyZZJmfbXOE9Olct2UFuvz2bn
	hpACOSA+9N8Czd4HmKxLwMSWuEHzcupwr+ylfEGoQ/oheEWoH7YFXbPByY6TeHGa1LBZyDil0gAyE
	GQdTS7oSUXTOig0B9dHJL2v15ZhT50OobC4sK9RjxrGDIMNadmXAQS2M2NV09Ms+9HXS1KgxFiceM
	Bb13dXKmTJnZy1q4o1vg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6kwc-0001Yj-1h; Wed, 20 Mar 2019 23:48:26 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6kwW-0001OM-BV
 for linux-riscv@lists.infradead.org; Wed, 20 Mar 2019 23:48:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1553125700; x=1584661700;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s8sajK0+Y5Qxk3l9f3FRoReqL4ztyr9hMhYSgl8VlYs=;
 b=HgOrsZeFDIHo5DqrM/1I1Yl7p753G2eoNurOk0GvtLJKthDxKygPop/B
 yLaW/FKf3EU84BW1/XAoFgIVyxQhllHAgwiBn8Sv1TIiyJLF0E57nrhJG
 xLU+OzpQJHxbH1zobKC6JF8HmiKdGeI6YV7/HZaXqq27E/PVhS8x0StbM
 TJL/asnjq/fMZ8mE45Y1aPbPjVfL6hidOb0sfldzVyAqMBt8jBtb07Ocl
 FLcwIvk63L1+I50oyKxJCXnzGlwOiv4w3YqaDkaIUZ0thkheZR1KP6BcV
 qyrR2bQcc693nDVfrpGD4Xnqzw+umkNWXenHncpEd35htuBVISuBQVIbU g==;
X-IronPort-AV: E=Sophos;i="5.58,498,1544457600"; d="scan'208";a="209432747"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 21 Mar 2019 07:48:16 +0800
IronPort-SDR: 4fMxm+0f7kjpdl7GagncgJ8qpnZg2h7ZEksRYOFZ+GOTN0LBRGPgq4Zcwh0QwgvA+nC6Yx7SFS
 fo7x4yBzGgpIlE0ChcGDuarhYpurISAF8hVQbuRBLx83To3BI4zWCuauARtnD/1UVs6lFTeJQg
 1eI8XrcpeG1MAmwLVijAr/WdbHDvAN5rLvjeQ3TMVx/HZ/2jgH/plP798Yo4nr1O1Qq9laGx8j
 O3a2klZ6A4YtA6xDGBthI/b2lMgNgVifSqlPI50U7r7gLItMRCsyDlPcKw7+xQ5vaJR1AIVt9T
 6Pi7/VyZyxWyqN4rvYHzcPos
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP; 20 Mar 2019 16:27:53 -0700
IronPort-SDR: TW5Zbmthhyvkzhd46KZtqxhnd3w3JqrSsH2O3cUfBjyhO4AXA57gWdo9glBSf+uwzzoLK2yzLl
 z12Xk/ez4h0xYkTJ32lZw3aSYGB0uTonvch+xr+YQdqMqX7b9C8WluoF+iUT8HtbNhI9MEMmg4
 rh7dRLVHbn2lFfALzYLMVD5mxh6iGKTjcPzWGhiifGOn6eUu6FwvJtBZdtqrlTPgouytBFkx1B
 xsKVxXh0sQQ6+3vWQ0QcVkantcZSgBw+yGqBrmAMtJKJdlhvH5mPb5R6G0Es7BdUhOQ1RHP7iQ
 uco=
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip01.wdc.com with ESMTP; 20 Mar 2019 16:48:16 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFT/RFC PATCH v3 5/5] RISC-V: Parse cpu topology during boot.
Date: Wed, 20 Mar 2019 16:48:06 -0700
Message-Id: <20190320234806.19748-6-atish.patra@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190320234806.19748-1-atish.patra@wdc.com>
References: <20190320234806.19748-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190320_164820_745790_68F391E4 
X-CRM114-Status: GOOD (  10.59  )
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
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Will Deacon <will.deacon@arm.com>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org, Ingo Molnar <mingo@kernel.org>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>, Anup Patel <anup@brainfault.org>,
 Morten Rasmussen <morten.rasmussen@arm.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Johan Hovold <johan@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jeremy Linton <jeremy.linton@arm.com>, Otto Sabart <ottosabart@seberm.com>,
 Sudeep Holla <sudeep.holla@arm.com>
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
---
 arch/riscv/Kconfig          | 1 +
 arch/riscv/kernel/smpboot.c | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index eb56c82d..ac87a0ec 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -47,6 +47,7 @@ config RISCV
 	select PCI_MSI if PCI
 	select RISCV_TIMER
 	select GENERIC_IRQ_MULTI_HANDLER
+	select GENERIC_ARCH_TOPOLOGY if SMP
 	select ARCH_HAS_PTE_SPECIAL
 	select HAVE_EBPF_JIT if 64BIT
 
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index f41eb193..a8fe590c 100644
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
