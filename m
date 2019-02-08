Return-Path: <SRS0=OMI1=QP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 527C9C282C2
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Feb 2019 01:51:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AB8320869
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Feb 2019 01:51:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FgvNXD8D";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="pqqNvwJ6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AB8320869
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=ZG7E8II8tE99gCZ2F6xYx8cLLsT1qlQy1ENbr58emAk=; b=Fgv
	NXD8Ddtp1UZon3/VZfH5XDYFLSeTcEaksFGXXtrhYiNjOLA0VGMnMmvNGS6vf15hjBmuMzwXVd4rn
	bYRRw2TZwsjKC+cKa4hUkxYlxPdOvVaRMlQt9tii9HsFf0IfYpjKLOzDYMr6j55vlyQowx2FOiyH/
	1KcoBM5B4PJuU1WawKiE1W/o3fma0Qsep0gBCoWZfkdxDA9fLrNL1+0fbfe0y1i0LvgzZeRh3VmMW
	hwe4WNlh2KqvLn5AxD5NnDvTA8yh+o6soTUAqILEhXEPkqdV/O5TnwkUtQjnDeiHJMuPqZR0V3c16
	uzObWTdl+l/VZyBk2B2Dt0iGWF938Lg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grvKW-0002Zf-Uf; Fri, 08 Feb 2019 01:51:48 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grvKT-0002Xt-Qu
 for linux-riscv@lists.infradead.org; Fri, 08 Feb 2019 01:51:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1549590705; x=1581126705;
 h=from:to:cc:subject:date:message-id;
 bh=ekA27SFnkSXYPCaYcQ+ZFq+nJ4ufZt1MgKQdXNWxxgQ=;
 b=pqqNvwJ6EDAqdog88V9LMg3pi96tA04XcRWCW2eGeAftraKUlPUCZvGm
 8DiCcL+IrBS4afPvtO6entfNh+8v7+rKqUWJJt3kXdBtpDDR3j/rPXRLh
 +EMtdk2biFTjchT2URRuUczu9bQ4T8m7UQpIbAdupjpSTY9wjMsVD8zu3
 3OcPxRBxWDeqJRnHdimrAmgWFoSsqWSFOL0PKHqOUcBkKuPGb6N70CToK
 UlsdvmSvr/TwSeBiCI8LeKSzMXYQ8PjAUsNk4ZZoMgPymyepeMEyGIKRM
 rPW7pZ3VEXP7GQ/7OOTWjXGP2bkhBiLJjDHv23TEL5GCgZXgMNwMH+jj5 g==;
X-IronPort-AV: E=Sophos;i="5.58,346,1544457600"; d="scan'208";a="102533277"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Feb 2019 09:51:34 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 07 Feb 2019 17:30:18 -0800
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Feb 2019 17:51:35 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
Subject: [v3 PATCH 0/8] Various SMP related fixes
Date: Thu,  7 Feb 2019 17:51:13 -0800
Message-Id: <1549590681-24125-1-git-send-email-atish.patra@wdc.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190207_175145_909419_55862870 
X-CRM114-Status: UNSURE (   9.18  )
X-CRM114-Notice: Please train this message.
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
Cc: =?UTF-8?q?Patrick=20St=C3=A4hlin?= <me@packi.ch>,
 Albert Ou <aou@eecs.berkeley.edu>, Damien Le Moal <Damien.LeMoal@wdc.com>,
 Jason Cooper <jason@lakedaemon.net>, Alan Kao <alankao@andestech.com>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>, Anup Patel <anup@brainfault.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org,
 Zong Li <zongbox@gmail.com>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Andreas Schwab <schwab@suse.de>, Marc Zyngier <marc.zyngier@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The existing upstream kernel doesn't boot for non-smp
configuration. This patch series address various issues
with non-smp configurations.

The patch series is based on 5.0-rc5. Tested on QEMU and
HiFive Unleashed board using both OpenSBI & BBL.

Changes from v2->v3

1. Fixed spurious white space.
2. Added lockdep for smpboot completion variable.
2. Added a sanity check for hwcap.

Changes from v1->v2

1. Move the cpuid to hartd id map to smp.c from setup.c
2. Split 3rd patch into several small patches based on
   logical grouping.
3. Added a new patch that fixes an issue in hwcap query.
4. Changed the title of the patch series.

Atish Patra (8):
RISC-V: Do not wait indefinitely in __cpu_up
RISC-V: Move cpuid to hartid mapping to SMP.
RISC-V: Remove NR_CPUs check during hartid search from DT
RISC-V: Allow hartid-to-cpuid function to fail.
RISC-V: Compare cpuid with NR_CPUS before mapping.
clocksource/drivers/riscv: Add required checks during clock source
init
irqchip/irq-sifive-plic:: Check and continue in case of an invalid
cpuid.
RISC-V: Assign hwcap only according to boot cpu.

arch/riscv/include/asm/smp.h      | 14 ++++++++---
arch/riscv/kernel/cpu.c           |  4 ---
arch/riscv/kernel/cpufeature.c    | 52 +++++++++++++++++++++++++++------------
arch/riscv/kernel/setup.c         |  9 -------
arch/riscv/kernel/smp.c           | 10 +++++++-
arch/riscv/kernel/smpboot.c       | 20 ++++++++++++---
drivers/clocksource/timer-riscv.c | 23 ++++++++++++++---
drivers/irqchip/irq-sifive-plic.c |  5 ++++
8 files changed, 98 insertions(+), 39 deletions(-)

--
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
