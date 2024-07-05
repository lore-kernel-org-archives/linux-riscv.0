Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5733C3271E
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jul 2024 13:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jNSKcMElaRctGwF35ypxf+nj2jyj29LNu0UVqkEceAo=; b=VT+Ty4WnSAjZmf
	TfUx1viRQZujiHRbflwRN3/d9f15Bc2awezeT6Ffyx9aOnrinIJ590L+CGA06VaiXv/cmm7NJTtmt
	PyVLbgtfQFqsalE/QNfhsy2xL4RBrACgO+JguZxPelY1mKMRMFS5eyWXeNHzHdFfYxBiGYcI9VZg7
	0RUdOPvkpymZfG7AUahnshwJIrv6qLyk+hNmMEVKdUBsyd47K/0II0F7IQoSesDy/2FhZ2rUjD3dQ
	mvV4l4effmdJl9WOzIBh7W5X2wZiiMXy5On3AVnGrZBcB4kXrPNifmJj10WhEBmvI65qT91+mXtsw
	Q9uT0h2NpaVR+p9TvEVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPjCy-0000000G5md-3PP7;
	Fri, 05 Jul 2024 13:42:40 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPjCu-0000000G5jU-11kH
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jul 2024 13:42:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 17F8F24000A;
	Fri,  5 Jul 2024 13:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720186951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JtwzpnUYYLiQKZg/jJnBbMWEqzibWxNiVuSjlyYpAZY=;
	b=Cw5RLp4FJg6Rqepr1HHf4VkotJhfK6s52fJlBwvwkYsT6kWUWUOOH7DAgB14RKFh+P5kEz
	wEDMSCgVi5FMXvdpmv7E0/mBGMPHNSR+5KYUzpxBAPo9fVtwvy4PmYCTF9kI/8dJh1A6KV
	F9i1Guu0CquF7hJZTdokkfvlDVXNup0vTZTIT34IIgnbKClmOKH/dgxv9IcTeWD9ncWGdh
	9Za/zNq4s4pIuWDCQ3r60nQc94TD3mF9OksZVuzDFpWhB5UAc6UDM0oYoAjlPPzJs6uFQO
	YCPCFyAfABMkYJiZxEdPtiyZp53Q2KKdI7dSx+J3YtgCJvmMm8LNBzGzXGalFw==
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Subject: [PATCH v2 0/3] Add SARADC support on Sophgo SoC
Date: Fri, 05 Jul 2024 15:42:22 +0200
Message-Id: <20240705-sg2002-adc-v2-0-83428c20a9b2@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAD74h2YC/03MQQ6CMBCF4auQWVtTRmjVlfcwLEoZYBJtSUsaD
 endrbhx+b/kfRtECkwRrtUGgRJH9q4EHiqws3ETCR5KA0psZItaxAmlRGEGKy7Y9GeFdjiNCOW
 wBBr5tWP3rvTMcfXhvdup/q4/Rpf/H5NqIYWxSpHUyuhW3Xrv1we7o/VP6HLOH7N9gOymAAAA
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
X-Mailer: b4 0.14.0
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_064236_541383_A84E196A 
X-CRM114-Status: UNSURE (   9.59  )
X-CRM114-Notice: Please train this message.
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
      riscv: dts: sophgo: Add SARADC configuration

 .../bindings/iio/adc/sophgo,cv18xx-saradc.yaml     |  63 +++++++
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi            |   8 +
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi             |  14 ++
 drivers/iio/adc/Kconfig                            |  10 ++
 drivers/iio/adc/Makefile                           |   1 +
 drivers/iio/adc/sophgo-cv18xx-adc.c                | 195 +++++++++++++++++++++
 6 files changed, 291 insertions(+)
---
base-commit: d20f6b3d747c36889b7ce75ee369182af3decb6b
change-id: 20240527-sg2002-adc-924b862cd3f2

Best regards,
-- 
Thomas Bonnefille <thomas.bonnefille@bootlin.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
