Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25005C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Feb 2022 15:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m6vHMrQOzrjxdpX/p/zJJKy2QBhKqFVCis1b8zaWDbc=; b=b31zduqaE4GxHr
	+EjPOfAH7Y60N7x7qYMYkhrBvi9zJlz0PeEYIUM2VMiDtg2YcFLgGEhzAz9i10y/DwJSbGuJiBD4A
	PxXnkIWKKul5CcMWIfe/Edcr45sa9Ou1VOStqctch9S4CbuAn+ODOy6Sl74lEN8iOpnpKPYbXoEjn
	xYCeb4XtyxVDPP3DfX5pB6wKnOOdHa4tV9MXUajc0E6cDaNwdR2zNtdP+q3zB5J72DVCN+GXvewmA
	vmRDO5V74NJgzzJahhD5dsw4BAOnACW76wKvs1ByFln938MR5XDUs5ai4AqAac7KOhIk1r8H3bCOT
	MBdU5KTcM1WT/ySuJl1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJzuk-003LsE-Ab; Tue, 15 Feb 2022 15:38:50 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJzlA-003Gr5-7M; Tue, 15 Feb 2022 15:29:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1644938935; x=1676474935;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CNkkyV8OXoISEdxMr9xw0emMq/NP2qfPJ4QtHLz9mWU=;
 b=yoWKp/vplb0MlbJ1GMd5iqn/wrvtzfOiwvtprgGrHBfvFKgxNWwH7L07
 f1SviC3+I02PP8uGR2wvGiaJtOebKlE0Pkimm8g6a6n6pnZZ3cfdnUIUn
 Np539nLw+1E9CRMvws3+9Ou2/el8R3XdojuWPMFeRwfSXewpWz1IHVgxh
 vYSBERf1ZHl0CktD3XCqoc7DJQkWJRDlUSp3aVMSZPkFyoSn8V7iO/BnD
 krSyoLS5PMq41McxwUg2/ZESKdfw/5zz6O+d9GMd4WGp9TeBCtKXVIxP/
 dxy8wMs/oD2oUNu1Krc5Mh3LpcQbjO8zAJDPEG+uoDLGjpBQGBkbF6hC8 g==;
IronPort-SDR: nXKiRn6I5wtM0Aid4B0KMR91QqOHjFsXR5wHKJ0YW3JLBCKqHmGKgqH39/TbMShUQvwLnOTh2u
 Ap5iXJe+XReFF5Od34mGEfcq4R5PEKu9MqnDBt3Z3M5vMT0scg5UYIQvOjwMWKKtRIF2TP8B8I
 6q6t7KOESiGqUzVba+6gjRtJ5e8iQO4vrNSNgQQ3qYdueaYaJyG8d2wSBo2urlLBq4uVb9Uahw
 soC4HQgIz7dGmYsfwUQqbcxJpADJQLYLTtbcb9h23jyo5SmJ7g7N7EHBtMF4wiUPo3tQSBc8UL
 LJBp5zvvz1X1f19aESq++xqS
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; d="scan'208";a="146046829"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 15 Feb 2022 08:28:53 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 15 Feb 2022 08:28:53 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Tue, 15 Feb 2022 08:28:48 -0700
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
Subject: [PATCH v3 0/1] soc: add microchip polarfire soc system controller
Date: Tue, 15 Feb 2022 15:31:53 +0000
Message-ID: <20220215153153.4136503-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_072856_377340_AC4B03D0 
X-CRM114-Status: GOOD (  15.73  )
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
