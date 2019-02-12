Return-Path: <SRS0=gFXo=QT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C60AC282C4
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 11:10:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A4272184A
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 11:10:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g/h06vBD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="EVFTAHkw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A4272184A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=po1TnkQywJ27lV7m6liO1NFa8DC7T9sUWrwU4eWV4iI=; b=g/h
	06vBDp9avU6ti00svaQDDYhYm8APbHVRoUUS/9WoIkXY32bmOMX9rCLEI+ytXzteO2TrAkmO7jKiP
	1h40aWo5PVqlG3m2KVh0TcEHfLApusi+ORBLFcJzFMssAD6iuqkWSBEGFBN6vnFZO32wRObe670Oc
	KcFroG6rMzkLQFr2lpo6NAh5jlI22RS9WKmx/4qviXaR+ndC8Ob7nASC6vBVL9fnFj2M6aoeTAgA4
	8jnP9oMv/nlgzXOf2DCm6c2W6uZGYvnNUCtbmPj9nr0RY0xycPK5AyctpgUMEWU6mJXYg6l1P5Q3D
	iDXCmQNoteIk8adViHlceYYhQ1kZhWw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtVxO-0002uh-Tg; Tue, 12 Feb 2019 11:10:30 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtVxH-0002rL-RG
 for linux-riscv@lists.infradead.org; Tue, 12 Feb 2019 11:10:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1549969824; x=1581505824;
 h=from:to:cc:subject:date:message-id;
 bh=Ygj8maI0lqiZee0HQRoDREeYciIeU77A8sNRqIHAMqI=;
 b=EVFTAHkw/6MuvJGlywxAxyE37rA5SWNvANvkcHucB4gdbyYzdhUBDPfC
 SeQnFqoRA/EiBtq4obKvYCQoFIgUDOYPVeTBz7vZ7bJNfaB6tDT2uXvHn
 2tquJs8J2uf3/iEnBS3DDBTm68cC0fp5HXyrTCLB/Ly1WQJlQX6AqK4w3
 Oojo8HvvgA3ZdBoRBiYQsMrqswP4RUqXOv3P/lYmug7FXmpNAO3hZJiOy
 iuqgY+ZytT5CtQDXXFGktXnfPs7Yc4WPtoxYap8dwJuizCA4J8OArLQ8C
 ZC7Z670+h6dkrjSdOCy7Wfnvjp/9sbZzRe+EiLFg2DyvIc5nuXNBGnuWQ w==;
X-IronPort-AV: E=Sophos;i="5.58,361,1544457600"; d="scan'208";a="102308181"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 12 Feb 2019 19:10:20 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 12 Feb 2019 02:48:56 -0800
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 12 Feb 2019 03:10:20 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
Subject: [v4 PATCH 0/8] Various SMP related fixes
Date: Tue, 12 Feb 2019 03:10:04 -0800
Message-Id: <1549969812-22502-1-git-send-email-atish.patra@wdc.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190212_031024_078624_A403A7F3 
X-CRM114-Status: UNSURE (   8.49  )
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
Cc: Rob Herring <robh@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Jason Cooper <jason@lakedaemon.net>, Alan Kao <alankao@andestech.com>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>, Anup Patel <anup@brainfault.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Andreas Schwab <schwab@suse.de>, Marc Zyngier <marc.zyngier@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The existing upstream kernel doesn't boot for non-smp configuration.
This patch series address various issues with non-smp configurations.

The patch series is based on 5.0-rc5 + Johan's below mentioned patch
series. Tested on both QEMU and HiFive Unleashed board using both
OpenSBI & BBL.

https://lore.kernel.org/lkml/20190118140308.9599-1-johan@kernel.org/   

Changes from v3->v4
1. Fixed commit text length issues.
2. Updated hwcap patch to use common capabilities of all harts.
3. Rebased on Johan's patch series.

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
irqchip/irq-sifive-plic: Check and continue in case of an invalid
cpuid.
RISC-V: Assign hwcap as per comman capabilities.

arch/riscv/include/asm/smp.h      | 18 ++++++++++++-----
arch/riscv/kernel/cpu.c           |  4 ----
arch/riscv/kernel/cpufeature.c    | 41 +++++++++++++++++++++------------------
arch/riscv/kernel/setup.c         |  9 ---------
arch/riscv/kernel/smp.c           | 10 +++++++++-
arch/riscv/kernel/smpboot.c       | 20 ++++++++++++++++---
drivers/clocksource/timer-riscv.c | 23 +++++++++++++++++++---
drivers/irqchip/irq-sifive-plic.c |  5 +++++
8 files changed, 86 insertions(+), 44 deletions(-)

--
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
