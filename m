Return-Path: <SRS0=JLSQ=TY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FE8BC282DE
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 24 May 2019 00:08:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 529A420863
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 24 May 2019 00:08:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m5njUxJR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="CQ/AYOoW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 529A420863
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tcq7qcFN/AUaGXJIOWcCR/QcjVQtB+8PFY3PZuisnaw=; b=m5njUxJR3jdHkp
	rPmyyR++M6odhBZOrD+TxTrBcvLniDAmoAjSaNituotpldLSSKKJH4c2yny/8dM6njH1+x7uSRUYj
	iJkQ4n+elJfcaro2DuUoXsIed7Q7lFLTBeMEIccK8UFLD2dFJkEYmGMqGIIVxfx3k5lF22xx29R4o
	dh+gSU0BoOj3A7eqsvdFk3agRr53/Q3dTKmufu+pRsYncS7EcRXKW4bwLFa4iO7wxl+8zwAJV2vZz
	XV2Xhz1pRyp96GJx70v4RHyHjthFShXODt8l9uNEvdb8QouUxorXyPhtwWTY8chsiYJPbseavWswi
	m8V8Ct505XnQ+Vmx03Vw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTxks-00013R-Ro; Fri, 24 May 2019 00:08:14 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTxkA-00008d-Dz; Fri, 24 May 2019 00:07:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1558656486; x=1590192486;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1SdLFPXetAg3nrR1IO1V0QDUQiFziWocOM5xU46X9ZA=;
 b=CQ/AYOoWIRnraJKvFdQzaoMZvxTKAdjRxguQSuZtNxNFUY7lxGHSykSk
 ywxIbb0DKQpYG9qka8q4mnSECKJOjTYUfkFS4beWl+p5vQg1/dq1QV4hh
 K/g6TAGKG9FFwdFc28MRpTgVeEpKiQBQj06VwQpy+x0HtgZwinWgleTcH
 0lSWCFuWZ3xzsM3qgX6KLFWtGlzLwGMyFYRcyz5EiECPjpXxGkOmMTEzm
 mm5VFysoasEQ5d6wVcxt/tiDEH+4vlrL7eiaa+/QYKeI63UfO0QDLkgSr
 8cnNgwKWLX87F4zYYvLhKWKwwHOh0LNGRblc6DIoRQT4ru1gOT439R3yq Q==;
X-IronPort-AV: E=Sophos;i="5.60,505,1549900800"; d="scan'208";a="208480813"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 24 May 2019 08:08:04 +0800
IronPort-SDR: bufjgzAsmbGGmzkNfGnqo+XitCbRFExo8tEhqkpCxRuCdPmn3LuvDAe5TQTGjZkLlbRFLCzJmE
 ZfHzlDrk7z92pyR82g4RyEDB/5V9cY3Dtgu8GB54wv8Ktu1ZPByJc1zh7Lhgu9Eja3sJK4dJfU
 gQ1K70dN/Ewqh1COQ157Eve62h3W6Op6ex7K5SzZiOXitqd9Qqmdbs2hl4iUBJue1dVGN+CC0r
 MqUxVRuPQoKiM/MEn07hE8fZ31qOgzp52K233qPtTaiW5OJn0+/j1OdmV8sOnpfR/DXuaNXECc
 95rrXiPv+BM4r3pgqQlmSp9+
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 23 May 2019 16:42:49 -0700
IronPort-SDR: vXZ4XSK9LUBf5ZWszJwtTb4rMMV3fmbYhZ9isZM07tLp+6dAKXjytTd62sv0dWJ8c/dczi8vdf
 mzOOjmZgY3QlclHixf+HXkdq/yoR0AAbYKM2dyB0enq32mtvDtDj/iv39I9tTxD0TwXPKbzLnY
 nejq/gMxiXVGbT+s3f6f5QVmYuhcmRDsmCJaaflh2xH9uibLsniWOkerekb7gLCcDpL0yO7uEH
 lE4RMqeetQG8MqlLY9aZUB6cyQ18OzEzucsr75+tYmSsQi2IYQFYVLxJLHzZ5M667YzZbAS4Ae
 p/Q=
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 23 May 2019 17:07:28 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFT PATCH v5 5/5] RISC-V: Parse cpu topology during boot.
Date: Thu, 23 May 2019 17:06:52 -0700
Message-Id: <20190524000653.13005-6-atish.patra@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190524000653.13005-1-atish.patra@wdc.com>
References: <20190524000653.13005-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190523_170730_727073_D565DF90 
X-CRM114-Status: GOOD (  11.04  )
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
 linux-riscv@lists.infradead.org, Morten Rasmussen <morten.rasmussen@arm.com>,
 Anup Patel <anup@brainfault.org>, Ingo Molnar <mingo@kernel.org>,
 devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jeremy Linton <jeremy.linton@arm.com>, Otto Sabart <ottosabart@seberm.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Andreas Schwab <schwab@suse.de>
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
index ee32c66e1af3..be319d902275 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -46,6 +46,7 @@ config RISCV
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
