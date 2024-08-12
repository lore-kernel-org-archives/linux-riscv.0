Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B62A1C52D7D
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Aug 2024 15:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OuFz4h8LPEwnUUg5AJVgPvKKqkZlWzukmTfVRojy8og=; b=eOxMDKOha6vs7n
	vGI6T5BSwWMrO/7/iKuA/jVbYMG5QnfoeyCOGHEi0S/tKh9ynPD6x16gCqFnjobuQmxa4nDKut2So
	Q9zF6JOMWKXNwj8c7uZSeeAQXfw2WdOzXHllQtXrlnsXYXeCkUNeSIotWPhiw5DsJc5lFnirx869n
	m0h/aBDYBitZQg5JOPixlLopO19QhkiqdIYhDIl0FNMcXTuuIxpOaF66iPaCnHopf37UeOkN8C+lb
	MfOyDxy43XVu/XRnY5X9BydONyW2aVoESKh5+0seH0wt3NChIl7GGZVwpouyey1alkEbLMi2h5z+h
	+tQ01gZy8EuBHKQ/mfhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdWXu-00000000fWQ-0PLY;
	Mon, 12 Aug 2024 15:01:18 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdWXn-00000000fQo-3Vcg
	for linux-riscv@lists.infradead.org;
	Mon, 12 Aug 2024 15:01:15 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 23BD8FF804;
	Mon, 12 Aug 2024 15:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1723474866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zrkbsHf98jdzwc61NfnGUE1oZTZ8EfUZY7Ktf9hQoNU=;
	b=l8ekYPfhWJdnIxZH+oQ1nPhqOT0NRFtgyw1sKdDEXKY7wRNnsxnaBwfJ1t9ZOO1oOQU6Pr
	/Jdu5VRbE5RLEWR1kjfQwUupWiRC1VnWo3gDfPHREarJQHXR50+/dXISHo/Y37gor8e+BG
	SGmaG2jUwnQCHzLaDCTnhsvs5wYx2NwvDEG6NqRlrPFX2oGp7l8GgUlkPx01pAjjH4tGuo
	Skd+oL/o71KVdeiyh4QEqkviSTRyqkb436Sqhiicix+RgMl/XdzTazv5HrnySPzSDlGJoZ
	Igjk5xyKi+hPWsu3UzycKUeFEnRlplbiIFSeRJ8EueEnI9/kNiUrpch0+Llfyw==
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Subject: [PATCH v4 0/3] Add SARADC support on Sophgo CV18XX series
Date: Mon, 12 Aug 2024 17:00:54 +0200
Message-Id: <20240812-sg2002-adc-v4-0-599bdb67592f@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKYjumYC/2XMSw6CMBSF4a2Qjq25vX1QHLkP46CUAk2UmpYQD
 WHvFpxAHJ6TfP9MkoveJXIpZhLd5JMPQx7iVBDbm6Fz1Dd5EwQUILGkqUMApKaxtEJRa4W24S2
 SDF7Rtf69xW73vHufxhA/W3ti6/vLlNnvMhOjQI1VykGpTCnVtQ5hfPjhbMOTrKEJ91geMGasu
 UBtEUxV4z/mO8zZAfOMpbECjGTagjniZVm+NPaMMSABAAA=
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
X-CRM114-CacheID: sfid-20240812_080112_742853_0595F162 
X-CRM114-Status: GOOD (  12.80  )
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
Changes in v4:
- Lowercase register hexadecimal value in dts
- Reorder properties in dts
- Use only a const in the compatible property of the device tree bindings
- Specify the series of SoC in the driver to avoid confusing with other
  Sophgo SoCs
- Add channel description in the bindings
- Use FIELD_PREP in the default configuration
- Index channels from 0
- Return PTR_ERR instead of IS_ERR
- Link to v3: https://lore.kernel.org/r/20240731-sg2002-adc-v3-0-5ac40a518c0a@bootlin.com

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
      dt-bindings: iio: adc: sophgo,cv18xx-saradc.yaml: Add Sophgo CV18XX SARADC binding
      iio: adc: sophgo-saradc: Add driver for Sophgo CV18XX series SARADC
      riscv: dts: sophgo: Add SARADC description for Sophgo CV18XX

 .../bindings/iio/adc/sophgo,cv18xx-saradc.yaml     |  85 +++++++++
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi             |  20 ++
 drivers/iio/adc/Kconfig                            |  10 +
 drivers/iio/adc/Makefile                           |   1 +
 drivers/iio/adc/sophgo-cv18xx-adc.c                | 208 +++++++++++++++++++++
 5 files changed, 324 insertions(+)
---
base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
change-id: 20240527-sg2002-adc-924b862cd3f2

Best regards,
-- 
Thomas Bonnefille <thomas.bonnefille@bootlin.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
