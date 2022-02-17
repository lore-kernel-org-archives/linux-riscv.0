Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C13BBC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Feb 2022 10:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iK/Hi3JAYC8yJe3fcjJxkoZMliZT+X7/Go7pg9dNjXo=; b=2DdEvOZsUqRrVg
	27WWtFfnsYelirXXhBftAs/NPPFbKf0WYydr58IXLJlTluzwx+3xRW9MSPNE5tWCwuVitODyoPpay
	F4xeC/XMbzuw2yNufHSxk4PujRneP2rM/ogyx2Oi0aBO8+cIZE39XbNP5nSdGr66j4x1ydk50fSdl
	LgFOmOZUzfaLr28dy/8XNvpxob3+CC4hV2DkN24knfI7eeP7ilwaeh+DBaTM7HSGs2iln+l8bz5dL
	+IVe0N0aJ+TjXHmhFWyc4nJNwgzQw6+oug1kur15/pvnJQIsSH2Qthd0RikaSMgc7U4zNGgup7uNj
	PMVU7RpHSCE3KZIVHCeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKdka-009qOx-PY; Thu, 17 Feb 2022 10:11:00 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKdkX-009qNb-Bw; Thu, 17 Feb 2022 10:10:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1645092657; x=1676628657;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NQqZJsnPwqJ522IRxbLNyRT+v0Qc32ocxAdMD2J077g=;
 b=eNBss/siGUtQBAvvUKvlDwwL0OJDIcXmwHbY1Eq9YiD4AotRpGTNJnhI
 TpcGUiW+L7KTmtqMFVN1GNQde/H65Fcrx4Ir5NybqqUiMsTKJsjOLcNbJ
 ueD36bKh6VL7t88yWaTZoj2GD1LDYG2slMbL4Bg3xxUffTPsORbBRMo2c
 ayYJ1vqSpqG9Nhk50Zx07SOjt6fs9XS6J+5fbuCAUYIoTaaWL7E3IZ8PZ
 xfDvljDta/fFnD0wT0wmAPXI+MSPzYyQB8kmQ0HlG/iK3kazF4OxVc9/F
 JODqfNq6fPiyO4oPqkMysg2QPenAwP7YdA0iVDLJPknVadaG3oGtJ6E5l g==;
IronPort-SDR: TBFQyPHCCyv4ULomJcGXTfJNKO3CdjfQdAkLdWuHeS4sD3oJOP1MzsCY7JSUuu4jgxKAzn4Ty6
 LUHXi7DVaqhCq+ZNSnZw+gA+BOTPoZ+oEcDS4ufAaCTA2wIa9fwSR2c8XO/AytUxGf45o2pU93
 rxCFc5TF9WclH25AHtGixinTD1UqNsKlnR+R3KiI+igzRP7LSxTiwlIQJudpcbwtFn4deTOlwY
 8TRTVVk+GksDgyVYKMcLKklyEo8JvBQoUtEP0HtiVVDHS6wCQibGi3G2PfYNwASKN3hWZFA1kE
 hRhhEGtq86EDXg88nK03Bz8l
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="153919206"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Feb 2022 03:10:55 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 17 Feb 2022 03:10:55 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Thu, 17 Feb 2022 03:10:50 -0700
From: <conor.dooley@microchip.com>
To: <aou@eecs.berkeley.edu>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
 <arnd@arndb.de>, <olof@lixom.net>, <linux-riscv@lists.infradead.org>
CC: <robh+dt@kernel.org>, <cyril.jean@microchip.com>,
 <daire.mcnamara@microchip.com>, <lewis.hanly@microchip.com>,
 <jassisinghbrar@gmail.com>, <j.neuschaefer@gmx.net>, <sfr@canb.auug.org.au>,
 <damien.lemoal@wdc.com>, <atishp@atishpatra.org>,
 <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <ludovic.desroches@microchip.com>, <claudiu.beznea@microchip.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Conor Dooley" <conor.dooley@microchip.com>
Subject: [PATCH v4 0/1] soc: add microchip polarfire soc system controller
Date: Thu, 17 Feb 2022 10:13:49 +0000
Message-ID: <20220217101349.2374873-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_021057_439446_81989363 
X-CRM114-Status: GOOD (  16.00  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Conor Dooley <conor.dooley@microchip.com>

Since I submitted version 1 of this driver, I attempted to upstream
bindings for devices dependant on the system controller [0]. In that
process, Rob said that since they were devices with no resources,
other than a reference to the system controller, the devices should
not be in the device tree & instead they should be created by the
system controller (which it now does).

Since the sub devices using mpfs_sys_controller_get will now have the
system controller as their parent, this function now just checks if the
parent device is compatible. If the parent is compatible, the sub-
device then attempts to register as a consumer of the system controller

@Arnd Hopefully this clears up the issues you had with reference
counting & the lack of checks as to whether the device found by
mpfs_sys_controller_get was in fact a system controller.

Depends on [0] to change the compatible string in the dt-binding.
Thanks,
Conor.

Changes since v3:
- switch to devm_kzalloc in probe
- unify exports to use the non GPL version

Changes since v2:
- system controller is no longer an mfd, system controller now creates
  sub devices for itself.
- specify that a mpfs_mss_msg is used in mpfs_blocking_transaction
  rather than using a void pointer.
- as the subdevices are now all created by the system controller, the
  get() function now checks that the requesting device's parent is
  compatible.
- mpfs_sys_controller_get now passes a pointer to the device that is
  trying to register as a consumer rather than a device node.

Changes since v1:
- system controller is now an mfd
- parentage is now used to get the device node on the system controller
- mpfs_sys_controller_get() now updates the reference count
- "polarfire-soc" in compat string changed to "mpfs"

[0] https://lore.kernel.org/linux-riscv/20220214135840.168236-1-conor.dooley@microchip.com/

Conor Dooley (1):
  soc: add microchip polarfire soc system controller

 drivers/soc/Kconfig                         |   1 +
 drivers/soc/Makefile                        |   1 +
 drivers/soc/microchip/Kconfig               |  10 +
 drivers/soc/microchip/Makefile              |   1 +
 drivers/soc/microchip/mpfs-sys-controller.c | 194 ++++++++++++++++++++
 include/soc/microchip/mpfs.h                |   4 +-
 6 files changed, 209 insertions(+), 2 deletions(-)
 create mode 100644 drivers/soc/microchip/Kconfig
 create mode 100644 drivers/soc/microchip/Makefile
 create mode 100644 drivers/soc/microchip/mpfs-sys-controller.c

-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
