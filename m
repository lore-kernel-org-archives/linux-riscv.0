Return-Path: <SRS0=bcqy=RX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C9ACC10F03
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2019 02:31:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD7312183E
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2019 02:31:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="na7EyEMm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Aqh7Tuor";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="QYjE+6KV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD7312183E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eVXE88azgfj6OlRN8DClrcFcPYrRRoHDVJudvDZAYlA=; b=na7EyEMmuM1oo0
	NneElLrhKAlOuBOr36qkgwlRc4aGdJaQCnUkoyjRbarsnuZX0AC4NbHYuu9SFn5C4VUFu1+hbk8DB
	4hxS1g/XP6Dfi2DXvE2A/qTcAdtYHHGWRRmAwMrFYOSjAv0r4VatmHnDkV7pen9QebhETfeH42heu
	pDdrxqk7042WngN6qzxLuIMOn+Racu9GKMlq3UUVmUk+wZaZ6oRnOM8/HS/QghI1X+rEhTDTAVoos
	qvYA2RIIzn3CY6vHQMPFxPgCkRfUrTb0LQE2XrVIfobOZdFW2ZawK7Ovy4cJ3YkP3D+/xV0//gxqj
	63+Q+sypv8VZCIz1C81w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6R0M-0007QS-Jv; Wed, 20 Mar 2019 02:30:58 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6R0L-0007QI-9u
 for linux-riscv@bombadil.infradead.org; Wed, 20 Mar 2019 02:30:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eLdTE8Ct3EI+hiiuLn/2SFxS0jvmdYopZWCxdbJfZAs=; b=Aqh7TuorSeaQ+V094qHBYUfLph
 Bs0a9u2GAw2uwcAO92JmQ8IQu0v9MCby5N4rovvdYTl7dw8EzKbhGgEqRSFo/fX8FVLa/72ZkWmcj
 8DgLeQ9DU4vwkeMdg110xMp04mG1v/KqULJxKxYiUo1UGu85V70NkptEqaPQlOY3497b9NLkQJOJO
 J5lbUAYWsJppH3y5mmzNAxqIrU2OQXHM+sXsTB/z3Jcei7GS0e6Ldmc6vtEk1fNkSj1MpEwCOVd2l
 odGjjBTMZ6bjxju8G71Z3oqepO4iU66E4W8AiEH+4woDJmWlWbeGrAYFW68GnK8U7ked+nG7cH4o4
 YrPJU5Pg==;
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6Pxd-0007Xx-BL
 for linux-riscv@lists.infradead.org; Wed, 20 Mar 2019 01:24:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1553045045; x=1584581045;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s8sajK0+Y5Qxk3l9f3FRoReqL4ztyr9hMhYSgl8VlYs=;
 b=QYjE+6KVlsEtsHINjDMdG5eBTk98xwnmKmMS4ipwA9VtvHCXZotWHfe7
 aNi8aWHPq0w1ilYYcl6n3eI2PUBtx5l6q9jXVhW+Q+RTvUfId1+Kjrqbp
 9cmUjqScZx0/VvzIrineG4J+8V+hqXkRV0+9uFBQMUDN2XkqGehqH46Si
 bYALSDJYbBzBljDwKCA4abEONr4dtcmsUbFSsbxjk3Y0VCU611EUVmV2P
 QMlsDOuttTuwzvfeXO7//6+sTXpXDO3TAiYNX5ePJr9/JarhAgJuPd7mA
 XOBzGGeGWQoFZfNzl+n8WGFq8DGi8RSKDgB4kWNNCG1zGZHwOrsl7fBU6 A==;
X-IronPort-AV: E=Sophos;i="5.60,246,1549900800"; d="scan'208";a="105533386"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Mar 2019 09:23:00 +0800
IronPort-SDR: bQvxMRW++6tOQ2W3jez9EkAzQKb/DvGBQ/8B6v4RlmcbMf+aB784qVQZZ4K+iJEKNzIarV1+S4
 2QOrLzgOMffl76kUsIDIyncj+Doj+wpTbkcBsRvDaofRN77K3eyBjCin8OHs3aCIikGmAAKUCs
 uTw5TodPBV/uCTvLNNC45Z+gWW+X1qy8HnYVRsRZcVby17Sn3iavHU6lqWcBi3SVnVRB1S1/p5
 8YmzdTQddW/JPVv8P6BcZEpNCEf2aHBdnpTHqEPYMH3P2OMtKVRtWqejQJsxXxjOJJcj+TbimW
 b+8h+nKCGkyCeTgJrJeJBal5
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 19 Mar 2019 18:00:36 -0700
IronPort-SDR: 7ewcJGwtdw1Bf+9Hx8qbkswK2bQ36UhDlgzsirbxYImQVPyGxNNSJ08RkKvFY5C56vHTnOHLK+
 0BFpINbW/yBhvuKyV+dc3ltHSxuu2PupuxExbrh9S1/cfGpJ98NMYQxiJ21g0KPoxZI31SOkun
 itoqAjWahzU2c5kgbwEy71+MG4c971MaZyTBaESpHrzVp+4tYPNat80yjSmkoVyMGiHKBXjKrq
 EQexS25nFe0rWbGhOl/pGyWsOpkW+dj2+rarvgGLoa9Ge8ryMlswwOL4x2kT3i7X1qXk5xl+NK
 iYY=
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 19 Mar 2019 18:23:00 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFT/RFC PATCH v2 4/4] RISC-V: Parse cpu topology during boot.
Date: Tue, 19 Mar 2019 18:22:51 -0700
Message-Id: <20190320012251.2728-5-atish.patra@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190320012251.2728-1-atish.patra@wdc.com>
References: <20190320012251.2728-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_212405_590937_F1977046 
X-CRM114-Status: GOOD (  13.57  )
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
 Dmitriy Cherkasov <dmitriy@oss-tech.org>, Anup Patel <anup@brainfault.org>,
 Ingo Molnar <mingo@kernel.org>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
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
