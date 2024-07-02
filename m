Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE81C3064D
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jul 2024 11:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=l8Kwlfw9hoVPLZMPgNWplNbY8YR12I6IRFE3a0NqYBU=; b=fuxEpz8Sm2sjMk
	qus8wq5hCMbd/MRvlY9bDWwUOvcgbjb+e4AgxUmRqa0Qn7GIDsx9PM7bugNPB8bJCgofpZrXAuvSj
	pfgTPMQg91KjQZQTBbyKWdT88fRkI2mrIl9Jlwww5ct7Bi2lCs30gqM+COCrBR/vIpzLmukgqc8O1
	hJyUeUXOzX+PBlMOgolQew1jcxuvJsFogX0ZN7GKcxl5DCoBcsMcDbilu9Ozqmu8gV7fRbDh6YrEE
	xxXNPPuOjpZSWVf1YST7KjaueBfLpxAV9vEOvBJvn6AdNJh5OtC2WnL2Z6c0ONA2e/ALzGbeRXr4o
	F91mtE5zeR8uXef/aBWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOc4X-00000006ZVx-22BD;
	Tue, 02 Jul 2024 11:53:21 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOc4U-00000006ZTs-0hBr
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jul 2024 11:53:19 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 13B4E1BF207;
	Tue,  2 Jul 2024 11:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719921193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=g0xw6PXJD/+VJObPpeeMreW5bakIQ/1Rdvob+72LtCc=;
	b=nhr3SnwuX1kCJUXH05YboKYnDNmWl8wwWmlaiSorc2ntHVq6NoXsja3zz9wgCB64zhDbxE
	2K3NBgoVv65iCITj6rj4RZYEfU+xrYhpOi9rQ4Ae0gslIjTn4YkYApFyQnfrinXstou1Ba
	vYlDpI6soPRD0B8TUtgxmRxVp2vm8T5nJet3l7C7DrCcpLxjkRXQDFbjuHgD2PlfU0GqiE
	vwhPKRJkmZTSCY7mrkkXFT4ZOs/GUhJjSCSkwPdsBMJKel32+TfZLGq/5CzL+lVxcOu6g/
	RQcIJrcG8CUYNd01FGPEp/bMkDDYpzQC78t0hKXqwRxb9aOwFkq4o+lWPu+hZQ==
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Subject: [PATCH 0/3] Add SARADC support on Sophgo SoC
Date: Tue, 02 Jul 2024 13:52:20 +0200
Message-Id: <20240702-sg2002-adc-v1-0-ac66e076a756@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPTpg2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDUyNz3eJ0IwMDI93ElGRdSyOTJAszo+QU4zQjJaCGgqLUtMwKsGHRsbW
 1ANr/7VNcAAAA
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
X-CRM114-CacheID: sfid-20240702_045318_380918_7CE242E9 
X-CRM114-Status: UNSURE (   6.31  )
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
Thomas Bonnefille (3):
      dt-bindings: iio: adc: sophgo,cv18xx-saradc.yaml: Add Sophgo SARADC binding documentation
      iio: adc: sophgo-saradc: Add driver for Sophgo SARADC
      riscv: dts: sophgo: Add SARADC configuration

 .../bindings/iio/adc/sophgo,cv18xx-saradc.yaml     |  51 +++++
 MAINTAINERS                                        |   6 +
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi             |  14 ++
 drivers/iio/adc/Kconfig                            |   9 +
 drivers/iio/adc/Makefile                           |   1 +
 drivers/iio/adc/sophgo-adc.c                       | 223 +++++++++++++++++++++
 6 files changed, 304 insertions(+)
---
base-commit: be18997d95c888e7a432d46045644f396286775b
change-id: 20240527-sg2002-adc-924b862cd3f2

Best regards,
-- 
Thomas Bonnefille <thomas.bonnefille@bootlin.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
