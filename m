Return-Path: <SRS0=+vY3=ED=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 909E4C4363A
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Oct 2020 23:28:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C3C6207BC
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Oct 2020 23:28:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iKAjww1Z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="p6mPxpwb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C3C6207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ETYx7GwHMunU8zvVpI0tQW2NHzUVUxU3/yNioECSu+c=; b=iKAjww1ZcylqTcrkrE+I1q440t
	LC8HHWBtPb5GDp/izwsxDrnXanpqygZnyZRIZqBZMGqQRgJmNsMCXsSBTAnTNzNh0+QbZzR186K4E
	zyj1fco/QkD2Lq7DSWc4DJDnayQMjFmE5sLqh8QrXQ1JRHz5+Y19PY1ueS4lkv11Nc/oiIYBFNqls
	s/oQELvAlmV7n5YFrGpfTJ3Q6vt5rFoSH9cPsEeNGLgXaYVBkbXQtbe8RhM9eApvETupjtP0aO2mo
	hiMCncZDVPdc77qO3S2rjr3TlMKN7uvIVniTKODGV6APj/i1L0fPLMtFduGD7dJDs3IE8bHB3C9ZG
	NyrobuCw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXurU-0002rX-JR; Wed, 28 Oct 2020 23:28:12 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXurQ-0002q3-AP
 for linux-riscv@lists.infradead.org; Wed, 28 Oct 2020 23:28:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1603927688; x=1635463688;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cbfVGaWnMu+8pgVF8g9CD+iaCR7rsYJqW/fz2SXidbQ=;
 b=p6mPxpwb5kBZXqZXNvKe3LRCPiAn1LXxPY5owCdY06DHP3aj73LH2YUQ
 zzXC7AVZiyPNRWnGPsvS0ZCPrpinAeW+9nQrKrIKrkdqTVZsM+T3Mt0Bt
 9ZuGxnvoggB2xVbiTx1QwyhNnkpTc4ZeTuuez1fzuQoISXJQf2jZXd0Tf
 QZFCPj7XMxEBkbYew+EcMFLccDnKyB+bQ+Gpp4bfuKPgc1k6hqr1ETu7a
 TMnK0dMvltP3VoLem1+dltro+jAl1MrWl//mMexYc9fQCUNCz+/fz7Z4G
 97Az48o4Sa/F1urr0qZxYDJ1jYlYTlE4wyLYTUz9sw8ivRcskdfyPxRKX Q==;
IronPort-SDR: JhuylBpJQOArRqPbYVd2qTnyB4jmzaaGfNxuULa7fwJ/CBg8YQwciKJ/sKZ+4XCr7582AOb8ck
 roN52OArQCFUTA+YPtrA184M17HnJCHDoRckBGdUKHHVro0PyMhwpjFgXmL0NIxYMOYeQ6eXCq
 JlVDLrM+2SFtpu7QJeBk2KpUF3GswkyKMOLJqNy5xFlXDViZVxJ/9Ry4tyYTv26IgY3GM/rh+7
 +w5poUp61koYW0JT7cLRyZ3Ah78oCgpXRYDZ/u1u9JeVPAIn8DaJPCj9zrwuTJSdxjxxt3MJbq
 gvM=
X-IronPort-AV: E=Sophos;i="5.77,428,1596470400"; d="scan'208";a="152388615"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 29 Oct 2020 07:28:06 +0800
IronPort-SDR: PBG0AjF9v18OoGjXCD5hi8Nqkb7FHzoGVto9VZRFJCgbYdcxh7TXe7M/KOwDX802nhClVrs3LN
 EFmJ62fcfO9CpBPmqZ92RMLtNgng7Tt1QUvpENjZ+Z+g3to/7CLqXNci1O4w0exupCAujQhPu6
 PRTeTsQal4XRG08ekcmzUYWTrM2AJjQgrL/HQw6zP+F6ttMa+8Fdh9FSpZ5kLAmFzhT2TgFdLp
 K4mlGghCkJrmfFWQTfA7D2CYnHR7iM2wboIz6zA8Rits//+SrauqH7ikUwWJLXbLx/8QixYekk
 bCymgZ7Qt6ZzseS1t2LUPLHE
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2020 16:13:15 -0700
IronPort-SDR: buavO+3n128wXApNGIFfrqEjjKBm1I1PnymmXX6X25/PUwDn5yG4TfLzSC3aE2blO728jSGeng
 ZYeuijWei4Rk96OnUtunZLZLpZ8I8ZF8kBAwFll7TWFGOFYd+USFDHf28rNgHOg1kK6CBbOvEg
 2ne1I12LnBypDbBQB2RIMi+VZJRwgjVqnm/MHzx9HfJMpfW9eN7HbjCtMB8+TA8F7C6Ab31MPf
 ygcujc57MY7V/gNCT4VLsSKPv0htxzY3Vi3usUONWUKMZJTk01Q2pOZ1r1bYLYPudWSqa4oxUc
 U2k=
WDCIronportException: Internal
Received: from myd002180.ad.shared (HELO jedi-01.hgst.com) ([10.86.60.107])
 by uls-op-cesaip01.wdc.com with ESMTP; 28 Oct 2020 16:28:07 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/3] Add Microchip PolarFire Soc Support 
Date: Wed, 28 Oct 2020 16:27:56 -0700
Message-Id: <20201028232759.1928479-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_192808_562477_8B271A38 
X-CRM114-Status: GOOD (  16.98  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Cyril.Jean@microchip.com, Daire McNamara <daire.mcnamara@microchip.com>,
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>,
 Rob Herring <robh+dt@kernel.org>, Alistair Francis <alistair.francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, padmarao.begari@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series adds minimal support for Microchip Polar Fire Soc Icicle kit.
It is rebased on v5.10-rc1 and depends on clock support. 
Only MMC and ethernet drivers are enabled via this series.
The idea here is to add the foundational patches so that other drivers
can be added to on top of this.

This series has been tested on Qemu and Polar Fire Soc Icicle kit.
The following qemu series is necessary to test it on Qemu.

The series can also be found at the following github repo.

I noticed the latest version of mmc driver[2] hangs on the board with
the latest clock driver. That's why, I have tested with the old clock
driver available in the above github repo.

[1] https://lists.nongnu.org/archive/html/qemu-devel/2020-10/msg08582.html
[2] https://www.spinics.net/lists/devicetree/msg383626.html

Atish Patra (3):
RISC-V: Add Microchip PolarFire SoC kconfig option
RISC-V: Initial DTS for Microchip ICICLE board
RISC-V: Enable Microchip PolarFire ICICLE SoC

arch/riscv/Kconfig.socs                       |   7 +
arch/riscv/boot/dts/Makefile                  |   1 +
arch/riscv/boot/dts/microchip/Makefile        |   2 +
.../microchip/microchip-icicle-kit-a000.dts   | 313 ++++++++++++++++++
arch/riscv/configs/defconfig                  |   4 +
5 files changed, 327 insertions(+)
create mode 100644 arch/riscv/boot/dts/microchip/Makefile
create mode 100644 arch/riscv/boot/dts/microchip/microchip-icicle-kit-a000.dts

--
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
