Return-Path: <SRS0=nj+O=ET=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B6DBC63697
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 20:26:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B460A20B80
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 20:26:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rWvmBanc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="dU5NAxos"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B460A20B80
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NZqL9xCciFDBLHItLuBuOKsRPDDb1udDB2OkDVTP6fo=; b=rWvmBancUhIiZoYABgAU20ZRZ+
	U/Ft+fEi+ktUsZkbBllFK0LHWQPxzqpD/CkB9s8JcY7JHx4RXoC54phPckPydbYUzhunWxI7QLClr
	CSQTN++ZmueAi2KU4Bfe2LykHcuoy+B0MsySf/0O8VeWh04iUZF3Uk2dD33NYXdLQ/VkvWFSmeiNh
	tO/JYAve/8tc0oucSEzKunGcz5ktl2yuAjvf3yZ3RRf3vt1iTSppSTshUK/st60Fls8xiIgPy2SuS
	5nNUhUWgKrpMUgXs83pyy7Xk96VnWjuNk3sMozAjNnbj+rhHiZr+js95A0V4PHzLSWQ1idpNfXpiZ
	2G6T5f5g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdfeI-0004sd-5M; Fri, 13 Nov 2020 20:26:22 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdfeB-0004qS-O4
 for linux-riscv@lists.infradead.org; Fri, 13 Nov 2020 20:26:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1605299175; x=1636835175;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aMGUJyhItmKZRJpcyfb3GcMubGvsstL4VJvXXylXx24=;
 b=dU5NAxosKUd8jb4ya9SF/3jArBN15prVU3AjkK0W5oloM6JkTYLWX712
 BdsRVaLXfwEKLnd1SEp/8dbpHtXaV9AQ7ukiP2EjIX8eOHlFqg3mT2Yxl
 upkko/sb/8zwD2/ueZV9l/LRQ8IuLhXF6Ja6K8rL/41cnwoBuCeq8dVqz
 iLTVf6MO8uQXzv1UY778odSro+uGMcHFiXnFQrwTu14Qeb+8YQ/AVnCPd
 cwKdKQrompwmDSeLhk90SAeWSloVD1MRvM/BNU9e+kWXEN5x1HAoga7RH
 WSlbKTkIov66x5TBHB9xso8goQ9lY7lQIG8BESC1dB1IKlf3QLsAFDgTR Q==;
IronPort-SDR: 8IVWCd9eEAo9hNePArk/gT3vQNhl2hVefg3adsSc6xXh0jrgIDm716bpUoV4TSWZ2+SSGJ8aKH
 iULsmXNrpIWRE/q3qdDKm++HBS8cGzVgBvICr813SkswW4C/l1UlPrziP/9g+CbibhXGzQx6EB
 +FB6UCuS0LImuWB6iaUCO5qBtWPMii4O5uS8OAv14Hnt9zNkRXr1qtJvfj2l3nXQkjdeUzS8uI
 mOOY7BjJUDAvHg6sqUr+8LYXsO0y3vSIvEVU4zkGGQL2DQ0pOHsCe8kFOrP7TvXNkweuQEb2Ey
 Q1w=
X-IronPort-AV: E=Sophos;i="5.77,476,1596470400"; d="scan'208";a="152497370"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 14 Nov 2020 04:26:11 +0800
IronPort-SDR: bdOPLua+CxUZ/b9cn46QZdMDp5+L4bAw1peDH1IIG7KFWNxWA101wHrMvOsj7qvGCxQbl2yOzz
 bOUnIhkoHExEnzFkH4aAprX/V09whKv8ECFGqmskfT/1mmJNs/r+bh5/AOLdwuUYOGKBXUZP2p
 dbPmKAlk1LmOmljXWJSK052mVzo+i8qZlKIDrFJbppBLEz+1+6Yk4ZmliAcaoHgQ84FeRu0A7p
 2MxBOJwqf/o/Va/Wq1xxz/nluDLbGCTIazeNf2dIyD23we8W+cAVrSMoCI5ZfWBY9ogGaXTzaz
 viL6Zbkl0U5ED1Y5ygLlmyMP
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2020 12:12:08 -0800
IronPort-SDR: rFi0Qt+Ab2PLPGASxi8YGY51ueh2j8HSBInPX4L6oSpxE3yB1nxkkVjJFgFzIyP65RA6tjRJRf
 lDdvuy5JFqS0iZtICpeXAlpHnDGUS/xxGuMcmjZFpiuNOHXYzy7TYLG3t8N74yLCZi4nn/RNAO
 pDvshD5qtKC4VLfSvNCuZZfD7SfpbiBGUAPAsLfPM8K40ByqpqxyZK4WXpNu3kmZFEDiv29ByD
 vNRZnfSiJ7+ouT1WWcVLzrSCl5+bR9wCYCOWe+cXCH7GHP0IeQu8R58sj21nP0leA3oO86yCZc
 9+c=
WDCIronportException: Internal
Received: from usa003372.ad.shared (HELO jedi-01.hgst.com) ([10.86.61.22])
 by uls-op-cesaip01.wdc.com with ESMTP; 13 Nov 2020 12:26:12 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 0/4] Add Microchip PolarFire Soc Support 
Date: Fri, 13 Nov 2020 12:25:46 -0800
Message-Id: <20201113202550.3693323-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_152616_783788_CD6B335C 
X-CRM114-Status: GOOD (  19.64  )
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
 Anup Patel <anup.patel@wdc.com>, Conor.Dooley@microchip.com,
 Atish Patra <atish.patra@wdc.com>, Ivan.Griffin@microchip.com,
 Rob Herring <robh+dt@kernel.org>, Alistair Francis <alistair.francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series adds minimal support for Microchip Polar Fire Soc Icicle kit.
It is rebased on v5.10-rc3 and depends on clock support. 
Only MMC and ethernet drivers are enabled via this series.
The idea here is to add the foundational patches so that other drivers
can be added to on top of this. The device tree may change based on
feedback on bindings of individual driver support patches.

This series has been tested on Qemu and Polar Fire Soc Icicle kit.
The following qemu series is necessary to test it on Qemu.

The series can also be found at.
https://github.com/atishp04/linux/tree/polarfire_support_upstream_v2

I noticed the latest version of mmc driver[2] hangs on the board with
the latest clock driver. That's why, I have tested with the old clock
driver available in the above github repo.

[1] https://lists.nongnu.org/archive/html/qemu-devel/2020-10/msg08582.html
[2] https://www.spinics.net/lists/devicetree/msg383626.html

@Cyril: I have added you as the maintainer for this board as I am not sure
who else from Microchip should be the added to the maintainer list. Please
let me know and I can add the entry to the MAINTAINERS file in next version.

Changes from v1->v2:
1. Modified the DT to match the device tree in U-Boot.
2. Added both eMMC & SDcard entries in DT. However, SD card is only enabled
   as it allows larger storage option for linux distros.

Atish Patra (4):
RISC-V: Add Microchip PolarFire SoC kconfig option
dt-bindings: riscv: microchip: Add YAML documentation for the
PolarFire SoC
RISC-V: Initial DTS for Microchip ICICLE board
RISC-V: Enable Microchip PolarFire ICICLE SoC

.../devicetree/bindings/riscv/microchip.yaml  |  27 ++
arch/riscv/Kconfig.socs                       |   7 +
arch/riscv/boot/dts/Makefile                  |   1 +
arch/riscv/boot/dts/microchip/Makefile        |   2 +
.../microchip/microchip-mpfs-icicle-kit.dts   |  54 +++
.../boot/dts/microchip/microchip-mpfs.dtsi    | 342 ++++++++++++++++++
arch/riscv/configs/defconfig                  |   4 +
7 files changed, 437 insertions(+)
create mode 100644 Documentation/devicetree/bindings/riscv/microchip.yaml
create mode 100644 arch/riscv/boot/dts/microchip/Makefile
create mode 100644 arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
create mode 100644 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi

--
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
