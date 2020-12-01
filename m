Return-Path: <SRS0=guVx=FF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90760C64E7A
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Dec 2020 11:02:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE4E620809
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Dec 2020 11:02:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i+BtnTOL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Z7Wa82w4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE4E620809
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3Zo9Rtj08KUr7+1spj4Ts3bIvWMesZzQyGW9d5ANg8k=; b=i+BtnTOLLpEA5zy5iqMIF8KVyq
	KMWz3pgentUlRxiX0iAx3wFy9jwfzYKMKcvoKLZuCExDax0mxOvuVtwoOCWVmu9Uq/pOC4hXoSSmd
	Sgddm/0Q0o3SFqxW7tbKbDGC+sVfHPg5SmcV3XQh8pqGNiIWeyF4pKGF5Owcdm6U1WZhnohmWFH8C
	MRxACtcU0nAWL3TucnT2gis4GcYD7iJVCF/H1QHlhc4O7UbpN8DK877gnKMsLPRcZXDFngJLqusat
	36T8wn0///tsddZoZUdG8O/yNk3it3Ihjv6GeghpJWOczx1jYcArNnMKODKTA6Fsjf4pJXIyp3DDJ
	MRXIKfvA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kk3Qh-0004F4-Jn; Tue, 01 Dec 2020 11:02:43 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk3Qd-0004Dz-8u
 for linux-riscv@lists.infradead.org; Tue, 01 Dec 2020 11:02:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1606820559; x=1638356559;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=FGtPhqRgilZG6lzFXwF1W6lCCJFnX3QJX7Kd0Z86TGw=;
 b=Z7Wa82w4A0zJ3fKYaZLB6oBv/ReIiIhl9HXNUtlArfVJ+QtdUFUK7wXW
 MlrYQrRFaRtdkeouGOjQJI6jqmTLXa8Y0tszj7xwnTHHHwz8k7yuik3HB
 DtvSNTXTsgheHC9hFXzr4e6ga6fmfyhd67z6y3UhDs6Oge/5CO9oFxl4A
 1umKPbQ4o7t0p5Bzx1G7DT1iQCTgIRX6c4Z5YDdw2S3Iqo0c7wO0i6t4P
 BFwwJZvNmwfjC9Bwz602xhsGmRjqDaWrBnQfOVagmE941nq3OaxDs5dkt
 /7Mu75wiJHRmmgd+xFTOCm92uUOk8o15p6QWF/QHvKVhXKIGx0ForJZ9i A==;
IronPort-SDR: Cs03h4YGEaHjkbLY08KhFq3entQDhODQoH5WPueKyU4feyT+ERtJRhDtYzTMYTmt1jGm44KpeH
 NPwXp7RZW7axleaEdSseEpGJlfNpI+bEGok7YXz0jGv6vOMJa0J4SaK18AD0Vir1Jky9B5Lkot
 oAIaxGQxqxeujzlj8KasUKxwN/gaLXDD9wn0Yww7SW94AZNQI+taZpi5NUOqTUI/aWFd9gwVNF
 ACRVAA8z9rITrH/YCdB2ly6TaIoXabDKt12tq9eqyEFYb/xbjTAISVIsDKm5KCh/YNHfialhZH
 l1U=
X-IronPort-AV: E=Sophos;i="5.78,384,1599548400"; d="scan'208";a="95390174"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Dec 2020 04:02:37 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 1 Dec 2020 04:02:36 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.1979.3 via Frontend
 Transport; Tue, 1 Dec 2020 04:02:34 -0700
From: <conor.dooley@microchip.com>
To: <robh+dt@kernel.org>, <damien.lemoal@wdc.com>, <jassisinghbrar@gmail.com>, 
 <aou@eecs.berkeley.edu>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v2 0/5] Add support for the PolarFire SoC system controller
Date: Tue, 1 Dec 2020 11:02:33 +0000
Message-ID: <20201201110233.28296-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_060239_550013_775A9BA8 
X-CRM114-Status: GOOD (  13.03  )
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

Changes from v1:
* Squashed header into first patch
* Fixed DT binding warnings & small fixes
* Cleaned up drivers from feedback

Conor Dooley (5):
  mbox: add polarfire soc system controller mailbox
  dt-bindings: add bindings for polarfire soc mailbox
  soc: add polarfire soc system controller
  dt-bindings: add bindings for polarfire soc system controller
  MAINTAINERS: add microchip polarfire soc support

 .../mailbox/microchip,mpfs-mailbox.yaml       |  47 +++
 .../microchip,mpfs_sys_controller.yaml        |  49 +++
 MAINTAINERS                                   |   9 +
 drivers/mailbox/Kconfig                       |  12 +
 drivers/mailbox/Makefile                      |   2 +
 drivers/mailbox/mailbox-mpfs.c                | 285 ++++++++++++++++++
 drivers/soc/Kconfig                           |   1 +
 drivers/soc/Makefile                          |   1 +
 drivers/soc/microchip/Kconfig                 |  10 +
 drivers/soc/microchip/Makefile                |   1 +
 drivers/soc/microchip/mpfs_sys_controller.c   | 135 +++++++++
 include/soc/microchip/mpfs.h                  |  51 ++++
 12 files changed, 603 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,mpfs_sys_controller.yaml
 create mode 100644 drivers/mailbox/mailbox-mpfs.c
 create mode 100644 drivers/soc/microchip/Kconfig
 create mode 100644 drivers/soc/microchip/Makefile
 create mode 100644 drivers/soc/microchip/mpfs_sys_controller.c
 create mode 100644 include/soc/microchip/mpfs.h

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
