Return-Path: <SRS0=GtJH=V5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09A51C32751
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2019 00:58:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3106217F5
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2019 00:58:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Meq3Nwzm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="JLgoaIJV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3106217F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T5K7YF4nUtzaBu8WZ7U+/xC3PM5ndIgsA4zWubEvsQs=; b=Meq3NwzmJLyeZX
	Wmw9OCWbCUz1KSc/YA36ZFKS5mtOkxblXhb+/w1fOMZV2DRi58frUnDn27rpdFBdXgqpD7Oonp7bh
	uSFrAqKCQZFpwOfdQIlH4uwWZAE4ze+XFGV5+sN602JkcplYDAO1d+PdH96gWR5lqfdf5gCHa0MIt
	qU9a3I7+pkw/KysCehUwB4fOKp8BzuGAO2NWovjWU9z6X8rLmeCakvc4bqMFoDirtAknKF4vmtb+4
	NvHorx5sGMrNimOJv2w2edkHBqc/AZ6kgc8hKF0O72Uu5mfkJ8yNIWWpjjnCWhYw3BvWC/F0VfnPX
	3rvVd7LQhx/MNc+Ba1iA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hszQc-0000DB-Aq; Thu, 01 Aug 2019 00:58:46 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hszQZ-0000BA-AC
 for linux-riscv@lists.infradead.org; Thu, 01 Aug 2019 00:58:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1564621123; x=1596157123;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FWCvTJxjE4nbG5EzQVW0+OdaZm/kjwh5FJ9fOMQwHxg=;
 b=JLgoaIJVTufmF8Q8zxjkC4LBCybh/20sFVUKd2szR5C2S951gafKDj4b
 oGgMbM4EDGOU1K+4wVp/qe/w3yo9c+vaCpSKTgHHQ9duR2NNYtjcRjxe2
 5903J8UQFth0vDMZ6O0X3bKdMbjiW3kPwwD5M+ZQzKpHuhtYU/V+lL9iD
 2+2KFgljjTSyOXsB/GMsa/obK3OEVS7ldeVcQhCLoF6pnnbKcc6o3uN3B
 V1Z9ZXPFlXOGff4vVZsJDWIMGbe/1hQYo9YEXkw6CUcG2g0W5BzER5aij
 tWXOazPQhPEUvvROw2Y6P5AIbqFpiOzD+evWCU3HJFAvvIbud3t59k5lh Q==;
IronPort-SDR: 4FkseL+abT34BbMFPX5KydH8zMnoCzqz2kzipbczLURXmQ68/bHpJ5N1nRL7S5LBCFRf531vR1
 RjcAUDc0DCEi0MCPf8YNaFlO0sps3Yj42xrhl5YzZVRO0d0f04aWE0/GHL+qFhNvqCEM9QdQkw
 mpl5ffZf4ox1pKBPjbMaLpmtmZj0KwXCAIDzmsKIfLRD9BwsdqzHMQTXEKOi7XkuiuabeziQpz
 on+OrYquEVbcxW+8KNpEWlrvvhabzNT7HtpDXP6yNOKAf5ZB9+j9eD2X9Qnw1RMt28Gn17uST1
 LR8=
X-IronPort-AV: E=Sophos;i="5.64,332,1559491200"; d="scan'208";a="114650413"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 01 Aug 2019 08:58:38 +0800
IronPort-SDR: 7ujsN78iWcw8U+QaNxSUYBx3xUWrOR1T+hWsZIMKnKkpYJlysKKPatk/lCfcvdBA3CFGlWnHfl
 FzbuEYReJy1Vh6NYUzQhT15Mv7KIRgy8rf6fyPZqB6mTqNBwoETR3sFICdAj/k3nMDwpCfqf29
 aBR4SEGk+brPPh3XKtv3uaIUEjBWhdP0ezP4ekAm9OErQ1OPpcjSgVtLLY7PVDM9eqo09CNwf8
 UhqSmSpTRemlci3kaZ+lpUz9C8P7VMY1IRxpBDuRFVQhH62dkNj+9uPbPtn2PJk5Go69fzYPy0
 VjvyqtfxmiY5TrUivibsYGSX
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2019 17:56:38 -0700
IronPort-SDR: Lzx+5+peY9Ag2NCHOMt1rfBbb8n5F8P7ljHyrRWzVWCca9oIo3RTSCeZ9XVt5mIxBs+SAOsDhc
 /b15VyZFG5aC+FHAT72OM6usDZ9klXwxjqFUU2/L1grb99Ftg5YeCOlpSjtWOZQ4eAzjTeHyjH
 At0nDTHQxjppS11q+cVcW09uM4jkQGo435cP1WjMzATjoFZoeMnQ1kkFy3rX+x+33HRr7D6hPU
 s4B8ynnY/ycopm5sWCnXXkvEAKT02vi5vlaYcPwD137zyZ3tUsvZbcRpP8JaGjwzoPFOFa99FQ
 U4c=
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip01.wdc.com with ESMTP; 31 Jul 2019 17:58:37 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/5] Miscellaneous fixes 
Date: Wed, 31 Jul 2019 17:58:38 -0700
Message-Id: <20190801005843.10343-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_175843_399041_6EAFDD49 
X-CRM114-Status: UNSURE (   9.48  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
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
 Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Yangtao Li <tiny.windzz@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Anup Patel <anup.patel@wdc.com>, Johan Hovold <johan@kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@sifive.com>, Gary Guo <gary@garyguo.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Enrico Weigelt <info@metux.net>, Thomas Gleixner <tglx@linutronix.de>,
 Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This patch series have some unrelated fixes related
to clocksource, dt-bindings and isa strings.

I combined them into series as most of them are
prerequisite for kvm patch series.

Changes from v2->v3:
1. Updated commit text of dt binding patch.
2. Removed couple of remaining uppercase usage.

Changes from v1->v2:

1. Dropped the case-insensitive support patch and added a dt-bindings
   update patch.
2. Added a export symbol patch.

Anup Patel (1):
RISC-V: Add riscv_isa reprensenting ISA features common across CPUs

Atish Patra (4):
RISC-V: Remove per cpu clocksource
RISC-V: Fix unsupported isa string info.
RISC-V: Export few kernel symbols
dt-bindings: Update the riscv,isa string description

.../devicetree/bindings/riscv/cpus.yaml       |  4 +-
arch/riscv/include/asm/hwcap.h                | 16 +++++++
arch/riscv/kernel/cpu.c                       | 47 +++++++++++++++----
arch/riscv/kernel/cpufeature.c                | 39 +++++++++++++--
arch/riscv/kernel/smp.c                       |  2 +-
arch/riscv/kernel/time.c                      |  1 +
drivers/clocksource/timer-riscv.c             |  6 +--
7 files changed, 96 insertions(+), 19 deletions(-)

--
2.21.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
