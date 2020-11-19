Return-Path: <SRS0=5I1x=EZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCEE0C6379D
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2020 17:04:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D32324655
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2020 17:04:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uvi5UiE2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="zYFq6Uug"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D32324655
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0DmOJ20MftRC1eo4LNGGmyelNQEpfS5Jr6fasd722BE=; b=uvi5UiE2hG7DL49Q/bgFEUaGS3
	T1oTE7t+ew/3sEQdOV3rZdsdjyhrnVSn690wK9hoVXMBbgp9fdHMnEKU46k7kdug3X1hHxGXKoNs6
	WhWeLngwSLhi+IqOBcid07+BZD79V964sYnT12EgLTjCTx0BGbdMSeklIFYD3y5xcaA7M9PP9ulaS
	ALEzRyuYlSPAsKD/NHBbdbx0CdNI5FY8d+90YW2UouCCLT+qi2lrkxjVZ7d0y1L0GizM+VUIR8z9L
	xqEVKA3iztZcKS4Q4AJz9CUBFlCB0KMlFj6wlfuY/kGG8LVdjC8/t6lbDQO7gJFuoqp1yBZ6m+z7N
	jhMK6CDg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfnM0-0008Fr-I2; Thu, 19 Nov 2020 17:04:16 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfnLt-0008DN-Mv
 for linux-riscv@lists.infradead.org; Thu, 19 Nov 2020 17:04:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1605805449; x=1637341449;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=2ElBigwIpbfpRKbyi3qg5MholPqNe20l6r2NhuLSHTo=;
 b=zYFq6UugHZ3JqTBg8xv7RpdNpAzqZDuElX3dvr9or9qyH0uptZI09G1b
 Rp0fzk8dF1g1CH3u1coydbXm/uChKC0uqbJQrkMv17w8qQ3dccJFCe2fH
 7DeSrpMNQyIisxh4J6Ok4Fw70GYf/+mfjDAvRUMBGwG7j8Qc1nUeWqkas
 4VHfApJLcPdtH7YMgRZIwsD2SBnJkUTSevL9CPmP3aUxoDQ5DDROKoXJr
 cF30V6hScFe4T1whWQjsEmVvUSesoSIYa/NZ1ELS/rNbbMvUYYM8kQmdp
 xzbLR7jobm4HGN3oZjMXrLrL4nCb6C13r45AGLzRmTcc6PYFuUNroofUk g==;
IronPort-SDR: AgQQG6qC1YCTIFuaaqBWqqFKv/jTcPnh6dq7rQU7Yve1+qK0SemEctrY1tdWfqJLKix7u4AAK6
 AHTQqt2Q1D5rO4ylRCxm6XeMbJUEa7xGvHbPF9FM5INhtWZ7JzTuudvLBf5q85jJ7zJJ5R6auv
 XeZXtdyouUhScoPHWT5sp+UsWyO1/knsJTyDtd0pN60bdLXIci0hKFxuoxVd1pzzb+YfDN2Cvo
 d+VYknqB8UkFHcYglTEPO2/qhLc//Y972mEOR+GnHdmK/MY/boJUum5RNE1SfRyUkSdtGOvrwn
 5ck=
X-IronPort-AV: E=Sophos;i="5.78,353,1599548400"; d="scan'208";a="104273932"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 19 Nov 2020 10:04:07 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 19 Nov 2020 10:04:07 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.1979.3 via Frontend
 Transport; Thu, 19 Nov 2020 10:04:04 -0700
From: <conor.dooley@microchip.com>
To: <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>, <aou@eecs.berkeley.edu>, 
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH 0/6] Add support for the PolarFire Soc system controller
Date: Thu, 19 Nov 2020 17:04:04 +0000
Message-ID: <20201119170404.18151-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_120410_010963_3F4DA0A3 
X-CRM114-Status: GOOD (  11.93  )
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
Cc: cyril.jean@microchip.com, david.abdurachmanov@gmail.com,
 daire.mcnamara@microchip.com, anup.patel@wdc.com, atish.patra@wdc.com,
 Conor Dooley <conor.dooley@microchip.com>, lewis.hanly@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Conor Dooley <conor.dooley@microchip.com>

This patch series adds support for the system controller on
the PolarFire SoC, using the mailbox framework. A Microchip directory
in the SoC subsystem has been created to hold the mailbox client
driver and will be used for future service drivers.

This directory is included by the kconfig option: 
CONFIG_SOC_MICROCHIP_POLARFIRE, so this patch series depends on Atish 
Patra's PolarFire SoC support patches which introduce that option.

Conor Dooley (6):
  mbox: add polarfire soc system controller mailbox
  soc: add polarfire soc header file
  dt-bindings: add bindings for polarfire soc mailbox
  soc: add polarfire soc system controller
  dt-bindings: add bindings for polarfire soc system controller
  MAINTAINERS: add microchip polarfire soc support

 .../mailbox/microchip,mpfs-mailbox.yaml       |  46 +++
 .../microchip,mpfs_sys_controller.yaml        |  50 +++
 MAINTAINERS                                   |   9 +
 drivers/mailbox/Kconfig                       |  12 +
 drivers/mailbox/Makefile                      |   2 +
 drivers/mailbox/mailbox-mpfs.c                | 296 ++++++++++++++++++
 drivers/soc/Kconfig                           |   1 +
 drivers/soc/Makefile                          |   1 +
 drivers/soc/microchip/Kconfig                 |  10 +
 drivers/soc/microchip/Makefile                |   1 +
 drivers/soc/microchip/mpfs_sys_controller.c   | 136 ++++++++
 include/soc/microchip/mpfs.h                  |  50 +++
 12 files changed, 614 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,mpfs_sys_controller.yaml
 create mode 100644 drivers/mailbox/mailbox-mpfs.c
 create mode 100644 drivers/soc/microchip/Kconfig
 create mode 100644 drivers/soc/microchip/Makefile
 create mode 100644 drivers/soc/microchip/mpfs_sys_controller.c
 create mode 100644 include/soc/microchip/mpfs.h


base-commit: f8394f232b1eab649ce2df5c5f15b0e528c92091
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
