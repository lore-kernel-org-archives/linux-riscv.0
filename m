Return-Path: <SRS0=qdQm=OM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB33CC04EBF
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  3 Dec 2018 20:57:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A55E520850
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  3 Dec 2018 20:57:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mym5egMV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="ZuSz1oYy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A55E520850
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=o26S6oIIreFA3uXqdQBU0UyG9Axh10UeIKoY011PUyY=; b=mym
	5egMV0hxcWdoKAmJfQamvM+i214s8+t6cK/tyD8eD2xjhUv0jBjevdHhbFu9NnMakDTK2e3rspdN1
	oj59Yz/mXUjZTfaqoMiyAE1IWQinrQpGjC1q3z9f1zBNYzu12EL+dI1MsxDvx+VzpKqHCaQO8cO7I
	2usPXDa1+FwtxxptFCSFX9e+KxWuM77YldJeYlZOYkbEclQ0qvZRg9CBYzy+7pf/enNa4OvsHevKj
	LfZl8BB7cqGg8pnc8yUMU3upPEYbjW9O3LKfYekJonkHayyLqS3JZ2ZzoAh9sR7xxZb5y5TaJh4aS
	kkBji0hZ/C+WMNboEdO1Dw1wibfecww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gTvHs-0002kg-4J; Mon, 03 Dec 2018 20:57:52 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTvHp-0002jX-Uz
 for linux-riscv@lists.infradead.org; Mon, 03 Dec 2018 20:57:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1543870670; x=1575406670;
 h=from:to:cc:subject:date:message-id;
 bh=XsUIGNmzENIAYjpU3aKCVQO+zkCeeIwT6CKwkdo1OmM=;
 b=ZuSz1oYyzY7BbUjTh97IaZ2jsFs5XBNhJ1VV9nG/mzY3BxT84Mdb8dtL
 wgE8S53YqFuMPoerhfAoykrSHGKZke4mpRl/Ox7OoJSkuc6QqaaOPYfTc
 cWCanwA4pqYGXvxZZmgsHZcrQllqtyiK9HD+Pwb9vexONZEFBW2aFn3/r
 xTbuqPd+MlenFCXKsGd2lyB1ua/F+uXgbPyKRLzj6eiRjN5nfeyHxnnjA
 pdAgybORRvaDwQB+q5FhxgA3Ta28gAABDNLvDHW9jyq5CXoYMS9GTT410
 L+MMs+S1RqmxEWx5i6ZGOO0M5+crGVOAWI1pHSxNNjJchT6ISpjeO2G5k w==;
X-IronPort-AV: E=Sophos;i="5.56,311,1539619200"; d="scan'208";a="95690455"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 04 Dec 2018 04:57:39 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 03 Dec 2018 12:39:54 -0800
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 03 Dec 2018 12:57:39 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] Timer code cleanup. 
Date: Mon,  3 Dec 2018 12:57:27 -0800
Message-Id: <1543870651-16669-1-git-send-email-atish.patra@wdc.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181203_125750_073612_2752B2F9 
X-CRM114-Status: UNSURE (   6.84  )
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
 Daniel Lezcano <daniel.lezcano@linaro.org>, Atish Patra <atish.patra@wdc.com>,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@sifive.com>,
 linux-riscv@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org


This patch series provides an assorted timer cleanups in RISC-V.

Atish Patra (3):
RISC-V: Support per-hart timebase-frequency
RISC-V: Remove per cpu clocksource
RISC-V: Fix non-smp kernel boot on SMP systems

Palmer Dabbelt (1):
dt-bindings: Correct RISC-V's timebase-frequency

Documentation/devicetree/bindings/riscv/cpus.txt |  4 ++-
arch/riscv/kernel/time.c                         |  9 +-----
drivers/clocksource/riscv_timer.c                | 39 ++++++++++++++++++++----
3 files changed, 37 insertions(+), 15 deletions(-)

--
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
