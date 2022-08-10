Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA1CC25B07
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Aug 2022 14:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=REuwnFKD34tNTR2C/jY1DUPZiu0bZ3JW9tJ1OJhnhd0=; b=whbPLkuEX3DONw
	59UpVTz11rCmHP0KPbA6XW3bRNorjCpTc2JZbUIa81c0HNTW5FfL5ItA0z0lHHZBVXR4YjgxpBFUO
	Znxx5hWm7FQYfQ9eVIBoYT6Zbp/+x1Ih9wO3o8ka1R45Yw3rkBn0W/Wm9kdt44f9ds5j/kIJTvZT0
	cMQ/athuridoPOxrl0iIhuCYYCDBXKeXpCytLG4z9BEIW+6ECjHfMTBtktDSGsfDHE+kX/Lvfws5F
	3TcjEB5F7x7sVA+6h2UHY13/jcGR9TY6fd+7ukJjCfVwDrxxsYhSPmG3i3drJKxBWIwC2at9z/tVc
	9xwy4driLBRkKnsfwaBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLmJc-00CDBW-Tf; Wed, 10 Aug 2022 14:04:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLmJO-00CD4z-7l
	for linux-riscv@lists.infradead.org; Wed, 10 Aug 2022 14:04:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660140235; x=1691676235;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=j+ubEaa4d6letw3k0c6vUxa4al5aj0IPLS7HTum/LzY=;
  b=KLO5c3B5TFj+JYJGUvBaJc9K4tOG/9Ub7VT/IYm/syhYsHLm+RlqpOEH
   tvd9pvc7YuvmabnW1CKxwUkNxj5bJ5VnGJS0w8IsEf/ScBKe24AKXZUij
   SCeUi4peuNPjK72Zqfg78auxHsX6c+e4lneHkBbSGXNaQHzhT+eUFDfK6
   n11CUNl/GU/LeAoBt96QQJTDm6oIjPHoTGD9sc/iijVFzrvX9gqFnRSY8
   AxNHK0olsN4oqZW3ScxuWFZirdnTmSb0fOjyEaHZTujdD7SuhyD5WCktb
   2zg+cFcDWOb9ZOD+zqB34YMEl6xFsGnYocTO/6uap0CsMV2EWGXjwwDDM
   A==;
X-IronPort-AV: E=Sophos;i="5.93,227,1654585200"; 
   d="scan'208";a="175691467"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Aug 2022 07:03:46 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 10 Aug 2022 07:03:45 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Wed, 10 Aug 2022 07:03:42 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <soc@kernel.org>, Daire McNamara <daire.mcnamara@microchip.com>
CC: Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>, "Thierry
 Reding" <thierry.reding@gmail.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>, Jassi Brar <jassisinghbrar@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
	<brgl@bgdev.pl>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Arnd
 Bergmann" <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: [RESEND/PULL PATCH 0/2] MAINTAINERS updates for PolarFire SoC
Date: Wed, 10 Aug 2022 15:02:42 +0100
Message-ID: <20220810140243.2685416-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_070401_611566_17D3673C 
X-CRM114-Status: GOOD (  10.01  )
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

Hey Arnd,

Could you please take the following two patches via the soc tree when
you get a chance?

The first is adding coverage for "my" dt-bindings as suggested by Mark.
I CCed all the subsystem maintainers on a V1 a week ago & I've added
them explicity to the patch text this time as CCs. Correct me if I am
wrong, but I am operating on the assumption that their Acks are not
required here. Hopefully increasing the binding coverage is non
controversial!

The second patch is a resend of a patch that was deferred to later in
the merge window avoid messing about with a 4th conflict in the entry.

Thanks,
Conor.

Conor Dooley (2):
  MAINTAINERS: add PolarFire SoC dt bindings
  MAINTAINERS: add the Polarfire SoC's i2c driver

 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)


base-commit: 4e23eeebb2e57f5a28b36221aa776b5a1122dde5
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
