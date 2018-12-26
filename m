Return-Path: <SRS0=5aT3=PD=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEF69C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Dec 2018 23:09:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8078B21902
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Dec 2018 23:09:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XR/t6lh5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="axEgWcTr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8078B21902
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=ZyYKn22OvshSl0gQqmHEspX2dPBspPhSJ/aKbOxXSXc=; b=XR/
	t6lh598csrmN6aZ4TxUp+bW0g+5ik7OxftvHvozSs459+zdpktD+XpiPHLLESRdfE9UbRoa915wxI
	YOQtrvbs7M53gHIhVeixdJhqa65QUEtNiFCaGyOjL4tlnJour7JOI1tYrZTF6FG0RVmerdrEFhDc5
	I/ECewGZuMIYdC8PNaDWp+cNbs4u0sizGN1Sib0d/P8aJMehhRyASerJcvnAUoviL+/USl08lqF7a
	L0tWF3ppnkray2isN0DwbNZa1NzpQIjyeKqcXXEYwa78ReM9OAn5XmMzvHbJc6Hp4JogwghT49i+i
	cvGF+PwTFK4jnAq5hKIiJJcvSDz76zg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gcIIm-0002Cy-Ug; Wed, 26 Dec 2018 23:09:24 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gcIIj-00027y-CX
 for linux-riscv@lists.infradead.org; Wed, 26 Dec 2018 23:09:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1545865761; x=1577401761;
 h=from:to:cc:subject:date:message-id;
 bh=D2ricm/sbPYel2rJ3/2ozWijyVugQCb4BhRoHhAiq5Y=;
 b=axEgWcTr790X0m/RZAU/BGP7m5Orsnvn9mOGANLM2SWRNjNodXgfr26u
 /gm6ewJPKLCu6FWY3TgFJxGOk01tTb3pOORiXUBz3cTnR3xIzeUDKnIPc
 9WbvB5VzUkTgkMQIurOiWka9JEQOCg1h4CIohCiKU2Cr9RiVZxYwvybmF
 7aQGBGG4OpBWqXEshfurV4vMf2dNsj4vc/FfPuVIduO2IZZsu0DN64JTC
 81CRBWpMAFxMw6aR98D75PzCJrbJfoV/A9B+P0rrFD5YhhdJ2M/9zqh/N
 O8dSDM7uw5VThszm72YmtXiS8FS/LfpKL6lsDbF79ZM+skSUfSnVxefFx g==;
X-IronPort-AV: E=Sophos;i="5.56,401,1539619200"; d="scan'208";a="99246003"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 27 Dec 2018 07:09:06 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 26 Dec 2018 14:49:51 -0800
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 26 Dec 2018 15:09:07 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
Subject: [PATCH 0/3] Non-smp configuration fix
Date: Wed, 26 Dec 2018 15:08:58 -0800
Message-Id: <1545865741-22795-1-git-send-email-atish.patra@wdc.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181226_150921_466559_F4CA81DA 
X-CRM114-Status: UNSURE (   8.70  )
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
Cc: Rob Herring <robh@kernel.org>,
 =?UTF-8?q?Patrick=20St=C3=A4hlin?= <me@packi.ch>,
 Albert Ou <aou@eecs.berkeley.edu>, Damien Le Moal <Damien.LeMoal@wdc.com>,
 Jason Cooper <jason@lakedaemon.net>, Dmitriy Cherkasov <dmitriy@oss-tech.org>,
 Anup Patel <anup@brainfault.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-kernel@vger.kernel.org, Michael Clark <michaeljclark@mac.com>,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The existing upstream kernel doesn't boot for non-smp
configuration. This patch series address various issues
with non-smp configurations.

Tested on QEMU and HiFive Unleashed board.

Atish Patra (3):
RISC-V: Do not wait indefinitely in __cpu_up
RISC-V: Move cpuid to hartid mapping to SMP.
RISC-V: Fix non-smp kernel boot on SMP systems

arch/riscv/include/asm/smp.h      | 13 +++++++++++--
arch/riscv/kernel/cpu.c           |  4 ----
arch/riscv/kernel/setup.c         |  2 ++
arch/riscv/kernel/smp.c           |  1 -
arch/riscv/kernel/smpboot.c       | 19 ++++++++++++++++---
drivers/clocksource/riscv_timer.c | 21 ++++++++++++++++++---
drivers/irqchip/irq-sifive-plic.c |  5 +++++
7 files changed, 52 insertions(+), 13 deletions(-)

--
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
