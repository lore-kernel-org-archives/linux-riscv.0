Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56533C3DA64
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2024 12:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GOc+uS5avaqjaBUVA5CfJleaFzB14oxdBWg61lnqwUM=; b=IKVjk5w+zj0xxi
	myK9s0HfUEM3BJ8xQmrS/tPC2tuVyc2dSeagHaAiSHHzGk/0coLRWCZ0Yn1gHQN66O3RxSHlkg363
	pL47GrI35RUkswVV8ry5HJY81QZwrPoSok66UOFV/pJMnEp0RYsXiXu10Ml+clM5XipBqPkxxJHx3
	mU/eB/CJBRW/cqC8uruMRXxbR34beoyxL7ULjh37PhfQpvjJ/Nnye1NOkdccAWNhwRuetnXohG1B8
	hVwCO91+L+CW8Tm22wlI/ReL7OW4oakKTUZdjEnsMaWhlAng5M3Wvz0CYVCLWUKpE6S6yZI0XbQKg
	u/lvLLnDSWOFj+KFDIHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ8NY-000000013bR-1ixu;
	Wed, 31 Jul 2024 12:24:28 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ8NS-000000013YR-479u
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jul 2024 12:24:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E8606FF80C;
	Wed, 31 Jul 2024 12:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1722428659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CQFWrGva3clQlCQc7BZ8s/egQF3wtTwTvc9/iqLjWy4=;
	b=K+Iw48idA4k/otIFWKoKPOvX074b6yGoI6xQ0KgQflh44gXLbdjQHBlvvIoBQUys3zL92Y
	uzSGNhWvpXNX1/jSaV3+w1o+u54WwMb5jEo2uGWsbY65Zijur8s09Am+CV1T9jh+uhy/Zd
	NmUSshKHxqVqQJr3lq3akP3RQjUIBaoGths2rluQiAWyGpyI0TPp2OWCqKmi84R0uld/Si
	TAB0xGt2ptWmz5Ic8SPhqHvQPvjsVGje8qjQiY1IYnX7YRvRAeo4lJYb3s5aUd399lkqOu
	DBF+7LTyPYQBJxnIaPinK1Q0vIVmo/iVVgnPcsGutiQdbyjUFbv3fAhUuAwqxA==
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Subject: [PATCH v3 0/3] Add SARADC support on Sophgo SoC
Date: Wed, 31 Jul 2024 14:24:13 +0200
Message-Id: <20240731-sg2002-adc-v3-0-5ac40a518c0a@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAO0sqmYC/1XMQQ6CMBCF4auQWVszDtCCK+9hXJRSYBKlpiWNh
 nB3C25g+V7y/TME69kGuGYzeBs5sBvTyE8ZmEGPvRXcpg2EVGBJSoSeEEno1oiaiqaSZNq8I0j
 g7W3Hny12f6Q9cJic/27teFnff0Ylv8vEi0ChjZQWldSqlLfGuenJ49m4F6yhSHtcHjAlXOUFV
 YZQ1w0d8bIsP0f/pqLjAAAA
To: Jonathan Cameron <jic23@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@outlook.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
X-Mailer: b4 0.14.1
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_052423_667274_7FD785E1 
X-CRM114-Status: GOOD (  11.29  )
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

This patchset adds initial ADC support for Sophgo SoC. This driver can
work with or without interrupt and in "Active" and "No-Die" domains
depending on if a clock is provided.

Link: https://github.com/sophgo/sophgo-doc/releases/download/sg2002-trm-v1.0/sg2002_trm_en.pdf

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
Changes in v3:
- Subdivide default cycle configuration into multiple elementary
  configurations
- Fix formatting in the driver
- Use devm_mutex_init
- Use devm_clk_get_enabled now because the clock is no more optional
- Remove handling of Saradc in No-Die Domain as RTC isn't implemented yet
- Use cv1800-saradc as default compatible instead of a wildcard
- Link to v2: https://lore.kernel.org/r/20240705-sg2002-adc-v2-0-83428c20a9b2@bootlin.com

Changes in v2:
- Drop modifications in MAINTAINERS file
- Rename the ADC from "sophgo-adc" to "sophgo-cv18xx-adc" to avoid
  conflict with ADCs available in future Sophgo SoCs.
- Reorder nodes in DT to match DTS coding style
- Switch from including <linux/of.h> to <linux/mod_devicetable.h>
- Use scoped_guard instead of mutex_lock/unlock
- Check IRQ Status in the handler
- Change IIO device name
- Use devm_clk_get_optional_enabled instead of a clock variable
- Init completion before the IRQ request
- Removed unnecessary iio_info structure in the private data of the
  driver
- Use SoC specific compatible in the bindings and device trees
- Link to v1: https://lore.kernel.org/r/20240702-sg2002-adc-v1-0-ac66e076a756@bootlin.com

---
Thomas Bonnefille (3):
      dt-bindings: iio: adc: sophgo,cv18xx-saradc.yaml: Add Sophgo SARADC binding documentation
      iio: adc: sophgo-saradc: Add driver for Sophgo SARADC
      riscv: dts: sophgo: Add SARADC description

 .../bindings/iio/adc/sophgo,cv18xx-saradc.yaml     |  48 +++++
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi             |   8 +
 drivers/iio/adc/Kconfig                            |  10 +
 drivers/iio/adc/Makefile                           |   1 +
 drivers/iio/adc/sophgo-cv18xx-adc.c                | 206 +++++++++++++++++++++
 5 files changed, 273 insertions(+)
---
base-commit: 8400291e289ee6b2bf9779ff1c83a291501f017b
change-id: 20240527-sg2002-adc-924b862cd3f2

Best regards,
-- 
Thomas Bonnefille <thomas.bonnefille@bootlin.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
