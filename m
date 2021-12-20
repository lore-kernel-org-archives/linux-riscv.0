Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C049C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Dec 2021 14:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2MBVE1b3f16NLGuWzKOGqDXOdy5fKbr2n2+LvcVmmjs=; b=nNbFOcXYfkrEAn
	BL5+Cwtz9Qg4dQQAooejO/MptCaYE9W1ytgvxSCTgN5vMbNv/9ajFGC6L9xYLNCOEAiLqfXocpb4B
	8ajQWL1+5L5alI8KlK2tnL8eeVbqFMx93eZUr76f/Cc2FvOpqzROOyAbRRNRMtBY37POuk5lIsPJd
	DJUz6QnIMub8qwJNI1CxM9+fX/fuCTld+op1nZAeQlhfm7uDDiT7X48ZPOUsRxgo3uWI1FqzWU9l5
	fZYLed95AHdtEVZ5y08XKXLSquNDwj/8aKaRDhWcV5QSSTZ2sMtK2s7+z+zCh6ljkX0lFrmfdaPG0
	JGiLh8BZ9T66FA5SBjeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzJrx-002rxx-TP; Mon, 20 Dec 2021 14:42:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzJru-002rwM-IW; Mon, 20 Dec 2021 14:42:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1640011347; x=1671547347;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YNa8YHikRJ/OKzAGyD12kWBKv4tGn1WRMnt2QZArwnc=;
 b=tlGF/QfuZowrxpAQO7cbJiRI6hRr3Z4dZdx1YzbxMVrCu5616FAQ8CJE
 GD8/l25pWsYmu74OOAzGfX+f0dnRNVF7hac8+AM2iTWJaln+gIxcSYBJq
 J24Jr6QZUVjKJYTCaGtvH92HVV7mc3QysZ6QhqSqgCL0wGeQibGEm7Ghn
 9xoO5KmyYfYbbFpelqPfWuBiPMFFv3sDg+rcS++3SN+J40MUlf2lg5N02
 P95Su0S80PnbsvYtgIPX2SAplEa1KLMCHN5xUKHtfcCyTjArf2lz3w954
 N7gU5iWjx3LxGuiCpa3NFQVU9TBTesqt80TSEcLJtDbf6WJbNz1NdDpS/ w==;
IronPort-SDR: 5gTeZxK3/JoYsKr5AUjMzhAxFNSCKxbe0kR5vEy+WK5GUC/DQ3loE4mYxdvIayukdfz8sqMuLB
 dWSS2dEt26O/ROOdFHEHPu6YSfzYJIbs0VsjyXY0u/U0K1QjAcUqhyVM0sroXepfUUooeyRHDS
 2Ujl6+GfiIZU8XUtWrAMNeVlHbj+u9ODCOp5oHF0iWlUsURu9Z8gdk7+pr2uqk+apLLEVEubMF
 isLeP4E3Vc7G0UUouZFb1BZLRBT+VOnYabxtTt6kAmO8jGFandBq/NYSxqsHLeUInBk+aMMP86
 ViHr4q4X/EVzSIzLlKta3fhg
X-IronPort-AV: E=Sophos;i="5.88,220,1635231600"; d="scan'208";a="147245455"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Dec 2021 07:42:25 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 20 Dec 2021 07:42:23 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Mon, 20 Dec 2021 07:42:20 -0700
From: <conor.dooley@microchip.com>
To: <aou@eecs.berkeley.edu>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
 <arnd@arndb.de>, <olof@lixom.net>, <linux-riscv@lists.infradead.org>
CC: <cyril.jean@microchip.com>, <daire.mcnamara@microchip.com>,
 <lewis.hanly@microchip.com>, <jassisinghbrar@gmail.com>,
 <j.neuschaefer@gmx.net>, <sfr@canb.auug.org.au>, <damien.lemoal@wdc.com>,
 <atishp@atishpatra.org>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <ludovic.desroches@microchip.com>,
 <claudiu.beznea@microchip.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 0/1] soc: add polarfire soc system controller
Date: Mon, 20 Dec 2021 14:44:12 +0000
Message-ID: <20211220144413.6798-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_064226_677690_1A74BC2D 
X-CRM114-Status: GOOD (  16.47  )
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

Changes since v1:
- system controller is now an mfd
- parentage is now used to get the device node on the system controller
- mpfs_sys_controller_get() now updates the reference count
- "polarfire-soc" in compat string changed to "mpfs"

Depends on [0] to change the compat string in the dt-binding.

@Arnd Bergmann:
I sent the first version of this patch in November & you (along with
requesting referencing counting) wanted me to check if the driver was
bound to the specific device [1]. I have taken another look at this
driver now and I am still none the wiser as to how I should do this.

As I said in the previous thread, I checked other driver but was not
able to find any examples of of_find_device_by_node() where the binding
of the driver was checked. If you could point me towards an example
that would be great.

Thanks,
Conor.

For some extra context, the device tree entry for this driver will look
like:

syscontroller: syscontroller {
	compatible = "microchip,mpfs-sys-controller", "simple-mfd";
	mboxes = <&mbox 0>;

	hwrandom: hwrandom {
		compatible = "microchip,mpfs-rng";
	};

	sysserv: sysserv {
		compatible = "microchip,mpfs-generic-service";
	};
};

and the mpfs_sys_controller_get() function is called in, for example,
the mpfs-rng driver:

node_pointer = of_get_parent(dev->of_node);
if (!node_pointer) {
	dev_err(&pdev->dev,
		"Failed to find mpfs system controller node\n");
	return -ENODEV;
}

rng_priv->sys_controller =  mpfs_sys_controller_get(&pdev->dev, node_pointer);

[0] https://lore.kernel.org/linux-riscv/CAMuHMdWTjrAiHosU0cGyJYkK=9JzNgHb=tjHXPdYxTWmkVzeYQ@mail.gmail.com/T/
[1] https://lore.kernel.org/linux-riscv/CAK8P3a1m_LhOg5JGMqPz6sohJa2hPZ3GN-jQDPxigZ5DaqAGxQ@mail.gmail.com/

Conor Dooley (1):
  soc: add polarfire soc system controller

 drivers/soc/Kconfig                         |   1 +
 drivers/soc/Makefile                        |   1 +
 drivers/soc/microchip/Kconfig               |  10 ++
 drivers/soc/microchip/Makefile              |   1 +
 drivers/soc/microchip/mpfs-sys-controller.c | 169 ++++++++++++++++++++
 include/soc/microchip/mpfs.h                |   3 +-
 6 files changed, 184 insertions(+), 1 deletion(-)
 create mode 100644 drivers/soc/microchip/Kconfig
 create mode 100644 drivers/soc/microchip/Makefile
 create mode 100644 drivers/soc/microchip/mpfs-sys-controller.c

-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
