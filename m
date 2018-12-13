Return-Path: <SRS0=TUPX=OW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1619C67839
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 13 Dec 2018 23:15:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B77C620870
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 13 Dec 2018 23:15:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RiiaM+WA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="EVlfiUPk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B77C620870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=szZccMNGSMXQC0dPvk4SIMdwuMrVMjv0jW92choM2O8=; b=Rii
	aM+WAu/YtsCcbx6ws+LJ1lBAHYg+IGzCy0Onib59zeshUgi1kP7mn+mNLFLnIFtgMBGHdFwaP0uLc
	FxwLUwcSdY/VYoQysVONRspDoVtRljOruDkIOnhHrwXwhH863XptwKTHfLpDGlqb3zfn2+2gwwm/D
	9xEnwtSOZFV7w4/kP2/gb0AlBs1Q0a0MzQrinp4kMDhcNaInG+FvxY+HHHJkUnMqB8pZqw/eTakOV
	DbSiEuAI4KTxO00T47SAMULD1ZU8CP73eD9hAyISUaaqkHzCR92Vesm5y2FaK8ufqK/vdmqk6qyfh
	fCbNvBPNyuGe8kJKjYvm3VVRlmkufxA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gXaCB-0004Gt-3M; Thu, 13 Dec 2018 23:15:07 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXaC8-0003WK-KA
 for linux-riscv@lists.infradead.org; Thu, 13 Dec 2018 23:15:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1544742904; x=1576278904;
 h=from:to:cc:subject:date:message-id;
 bh=RTsWalh1XbKdBNzRQGYMWqHt94ahyZseETm1+e2I45A=;
 b=EVlfiUPksq/kMN5zhey17MsVA7bc36PfsP5UHxJ364GVeuNe87PfK7Di
 oLUxLaYwpYemouhbbVL7+m+NKJJXh0DBrWNNXPUXt6hGPj1yNBpMmZL4Y
 MNS9/HNpxjB8+ahtRTjBFnHKW59QGnpYugWf09S5YsFvspn6N1alcKYIT
 Lqi8WAOrP2v8bLMOhAnFgFH1x1Y9Vu4WHP4tcv4jLaFDK764wATfF+WA7
 ZpcjTTbrZM2v22bOYDS4BKFF22h9DNVtr1SpEA3WkOgzXs3okxulJGhkv
 lUncbB5iOEmGze2HKuuixiMdfQq4ZYLURjbwBcP3m7vd0ZeCG8a5Gmhw/ g==;
X-IronPort-AV: E=Sophos;i="5.56,350,1539619200"; d="scan'208";a="97770420"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 14 Dec 2018 07:14:52 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 13 Dec 2018 14:56:26 -0800
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 13 Dec 2018 15:14:53 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] Timer code cleanup. 
Date: Thu, 13 Dec 2018 15:14:25 -0800
Message-Id: <1544742869-19980-1-git-send-email-atish.patra@wdc.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181213_151504_687913_80DDCF40 
X-CRM114-Status: UNSURE (   8.26  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Damien Le Moal <Damien.LeMoal@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>, Anup Patel <anup@brainfault.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@sifive.com>,
 linux-riscv@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org


This patch series provides an assorted timer cleanups in RISC-V.

Changes from v1->v2:

1. Updated commit text in 1/4.
2. Added a timebase check for each cpu.
3. Added a warning for invalid hartid 4/4.

Atish Patra (3):
RISC-V: Support per-hart timebase-frequency
RISC-V: Remove per cpu clocksource
RISC-V: Fix non-smp kernel boot on SMP systems

Palmer Dabbelt (1):
dt-bindings: Correct RISC-V's timebase-frequency

Documentation/devicetree/bindings/riscv/cpus.txt |  4 +-
arch/riscv/kernel/time.c                         |  9 +----
drivers/clocksource/riscv_timer.c                | 51 +++++++++++++++++++++---
3 files changed, 49 insertions(+), 15 deletions(-)

--
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
