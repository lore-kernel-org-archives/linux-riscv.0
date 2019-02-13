Return-Path: <SRS0=7ZJm=QU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7CECC0044B
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 20:18:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C0DA222AC
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 20:18:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YXfV4F1t";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="JcLXvxOn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C0DA222AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=GYINeWzDB6PBBtjcbXQmCi8qyuzItJsQA4avB4AsDus=; b=YXf
	V4F1tRrnaF/TYze4AkSa4qdBho7QWubCvJNbszW3dJ1S50/lzJv33nAG6xhtCLtpBgd+Wb820tYjX
	z20iVtFnDaw8/fbGil8pGKBVpJvdD+TujRgvWOCb4/G6Rm2uyfqBJHpK4XYCmUidVXsfZlavI8PmR
	WL+sa9K9DSsR7HxC1kKiBl82yCJ17jVlPigteVlWlBhYsZQZDtBJCX34dQQmt9Ksj1aL3NE407oD7
	8b4OQ+hRNLctG8RHq1pHO9bgPh1dqp79OOCE1AEWHeAWieceU7eZqsX69cRMg/+f0+IRD2eSHU81Z
	F2RDoW1P53z+isMTAHVWUVG8/DpSOSg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gu0zA-0003DS-PU; Wed, 13 Feb 2019 20:18:24 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gu0z7-0003C4-NL
 for linux-riscv@lists.infradead.org; Wed, 13 Feb 2019 20:18:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1550089102; x=1581625102;
 h=from:to:cc:subject:date:message-id;
 bh=snRz3dxhJ3mJ1sCcBiRAupRtv4dSEiuNGvoXjteiknM=;
 b=JcLXvxOnb5pzLiHIY6Yty9SEOBWp0IQtfq49UC0fpV0m76x2Ep54Flfq
 rmsr2JEI/AvmI8PG4t7dOi7wKmlCYZU6e1PYUhRKF/eFdwA5E9HhNzVqb
 FAGOYvsMCcU9Bn0olp+C76ChRRAL26YL5rVGbtP/+4ivwbnY4v6wkZ9OU
 QXPJNQvKQ961LXPQFbGH8om4hIB15Siqx0NAkowcu46LNybGODqEA3Y0/
 NM64AjKj3qFYyjXgDvze1gcvgd85SANOzkgHBA+HXBw5X7SzmI941DAKL
 zAEeiMbTtseD/FRA55aocEUVZ/AbOv16SkqCLPX772OaHeLEW+2ZXnznT w==;
X-IronPort-AV: E=Sophos;i="5.58,366,1544457600"; d="scan'208";a="102463808"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 14 Feb 2019 04:18:20 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 13 Feb 2019 11:56:53 -0800
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 13 Feb 2019 12:18:20 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
Subject: [v5 PATCH 0/8] Various SMP related fixes
Date: Wed, 13 Feb 2019 12:18:04 -0800
Message-Id: <1550089092-28783-1-git-send-email-atish.patra@wdc.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_121821_881568_CF1DBF15 
X-CRM114-Status: UNSURE (   8.62  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Jason Cooper <jason@lakedaemon.net>,
 Alan Kao <alankao@andestech.com>, Dmitriy Cherkasov <dmitriy@oss-tech.org>,
 Anup Patel <anup@brainfault.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Andreas Schwab <schwab@suse.de>,
 Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Guenter Roeck <linux@roeck-us.net>
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

Changes from v4->v5
1. Continue processing other harts even if isa string is incorrect for
   a single hart during HWCAP processing.

Changes from v3->v4
1. Fixed commit text length issues.
2. Updated hwcap patch to use common capabilities of all harts.
3. Rebased on Johan's patch series.

Changes from v2->v3

1. Fixed spurious white space.
2. Added lockdep for smpboot completion variable.
2. Added a sanity check for hwcap.

Changes from v1->v2

1. Move the cpuid to hartid map to smp.c from setup.c
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
