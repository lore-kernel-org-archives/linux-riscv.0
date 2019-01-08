Return-Path: <SRS0=dvb3=PQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 222F7C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Jan 2019 09:38:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6E5E206B7
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Jan 2019 09:38:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OUiX61eA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="PvfycfMA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6E5E206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=0IMdh+LqhNOm8s6FmKDhUwRcDEFXzNxgq059fIdDQl8=; b=OUi
	X61eAlLtKxTGlSdMSSWu3KT0RK22PvEVYG4MalFcwaY/i5bOCuEnwa+neJ/8SfKihUZ7wz5FqSQJo
	3xHDKh0X/m0FKbFL2b9XvAPQ9rUEuLlTrKOSBqNCgEGOD1e2o71wrA3WrH2u1LgHxr1AO3k8DIJD7
	ClNzQzSjV63v1y7ZlQlLKCXdid2FnxUCeysyHacUX1RenHVyqNHHVDsb9NPYw5kwJ3fl1U7JzBYhV
	nRdt4DcYg5uEQxM60zULhgGKdD0Izvk0DX95DK6XTcw2ICBksNEGakREwjiVoZjxWYsam2TPNg7su
	GUVZ6T+3jO5QHqTyHbO+8CF+2QIY1pg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ggnqV-0003o9-Dk; Tue, 08 Jan 2019 09:38:51 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggnqR-0003lt-NG
 for linux-riscv@lists.infradead.org; Tue, 08 Jan 2019 09:38:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1546940328; x=1578476328;
 h=from:to:cc:subject:date:message-id;
 bh=uS25H3RUV70CmFga3KxRSuzV/HDyoT7Yqt9qv2SDLGo=;
 b=PvfycfMAmqENI4Fq3xGQHyp0EeKYCIqdtycfQr38Vuwuc7KX1eKcw14f
 itEu/iMBMwXvtaBoALOu3M5T5LifGa2/Ix8LcBlsoZrMJ0/jHiygiyrAA
 bSblyr4iKI0qdxfaCgZqhDk7JOXzJAS49vkmy3oLfwAcneuspsbw/Y7LP
 8z/N4uyYYXBpEmU1eCfFYSatp1hUctnuGNAr7nSYQccNuJLPPUBo5LB0u
 2iHPFFxBPq36FsxM6lXL8jCznJ23BjWlsC1xffOHjb3QEzK3JCfP10RXG
 zsHG3zhY26CicW7bOq7Z5Ji9SeoCkW+XpDeWoliZJSgwWWOJQI3eeFnce Q==;
X-IronPort-AV: E=Sophos;i="5.56,453,1539619200"; d="scan'208";a="100000244"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jan 2019 17:38:46 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 08 Jan 2019 01:18:50 -0800
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 08 Jan 2019 01:38:45 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
Subject: [PATCH v2 0/8] Various SMP related fixes
Date: Tue,  8 Jan 2019 01:38:30 -0800
Message-Id: <1546940318-9752-1-git-send-email-atish.patra@wdc.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190108_013847_820858_7E7C1D5E 
X-CRM114-Status: UNSURE (   7.99  )
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
 Albert Ou <aou@eecs.berkeley.edu>, Jason Cooper <jason@lakedaemon.net>,
 Alan Kao <alankao@andestech.com>, Dmitriy Cherkasov <dmitriy@oss-tech.org>,
 Anup Patel <anup@brainfault.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-kernel@vger.kernel.org, Michael Clark <michaeljclark@mac.com>,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Andreas Schwab <schwab@suse.de>, Marc Zyngier <marc.zyngier@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Zong Li <zongbox@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The existing upstream kernel doesn't boot for non-smp
configuration. This patch series address various issues
with non-smp configurations.

Tested on QEMU and HiFive Unleashed board.

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
RISC-V: Add required checks during clock source init
RISC-V: Check and continue in case of an invalid cpuid.
RISC-V: Assign hwcap only according to current cpu.

arch/riscv/include/asm/smp.h      | 15 ++++++++++++---
arch/riscv/kernel/cpu.c           |  4 ----
arch/riscv/kernel/cpufeature.c    | 11 +++++++----
arch/riscv/kernel/setup.c         |  9 ---------
arch/riscv/kernel/smp.c           | 10 +++++++++-
arch/riscv/kernel/smpboot.c       | 19 ++++++++++++++++---
drivers/clocksource/timer-riscv.c | 23 ++++++++++++++++++++---
drivers/irqchip/irq-sifive-plic.c |  5 +++++
8 files changed, 69 insertions(+), 27 deletions(-)

--
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
