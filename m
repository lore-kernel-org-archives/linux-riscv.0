Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0E9C3DA7F
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2024 12:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T49ADELSEkWaz2ilSZSfnmQndXrUBT8+Y7XNRkJDQR0=; b=lb5JlC6PwajvAL
	owvUSgl95xwAGOWzf13e2WgqxKs566B8YdohRo+SOMVZLh65YVMgL3AGRENh4Jbd9VYZwjtZ/PebX
	jvtYgnaFh1rlDq+XBcCkqmJvJxLflxvr6p8EutlB/FFpXHGUEJmivxGliK7e6aJqXgLbad9fX/7k3
	6wfnmGFR8TmCYbvrMpw3HWyVsxAopznqDvB2fHb7+UZtG0DMEPhDRWfaO1CHw/1dnTP8IOaiwOAzB
	0/S8fs7GMy7CqffQbkIEhpySoFmfXuKg9VAgQS5imjUPXJ2WeOfqMXdduKxaVQ0EThbX2uTgMOAKr
	3/Pi5XoqoYcT5y58rn1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ8NX-000000013b7-2wLm;
	Wed, 31 Jul 2024 12:24:27 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ8NU-000000013Yt-0k2k
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jul 2024 12:24:25 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B2EDDFF80F;
	Wed, 31 Jul 2024 12:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1722428662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YzL9srRp7/ysRgKm0/IwbsiR9simdpXOOi8YCDBxwBs=;
	b=L/5jKK+PYcC2lPcfGx66Fs2gz5oO/teH8boiBpbZ/5ABbnbCkwQRBPZ29EAaOkNP132U0G
	jfNGuEFtrsDKuVltaeMFNjuUF/IId1yU0JbWpGcSYCZc/yU+zeARjguRQ/LpBvt055tLML
	aodVmC1kiTOqqwHmBPFCa5Sq16/i84RJ0I4yRvCTnlwP+YgfHYg+iLgHfzQ1OsQmfQzgf9
	WofGYhrhTGnkfgLbwngsIYyvoq0FBulJ/gx+6MaADLMTdrIkxqNz6u4o2vJsNo0xuVZd21
	6zVzdcjAjz6qOOQ/d6QxGtq6AahCS/lYnNg6AoqSRpgLf0zopkBMDy//hq4tVg==
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Date: Wed, 31 Jul 2024 14:24:16 +0200
Subject: [PATCH v3 3/3] riscv: dts: sophgo: Add SARADC description
MIME-Version: 1.0
Message-Id: <20240731-sg2002-adc-v3-3-5ac40a518c0a@bootlin.com>
References: <20240731-sg2002-adc-v3-0-5ac40a518c0a@bootlin.com>
In-Reply-To: <20240731-sg2002-adc-v3-0-5ac40a518c0a@bootlin.com>
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
X-CRM114-CacheID: sfid-20240731_052424_387992_1222F355 
X-CRM114-Status: UNSURE (   8.71  )
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

Adds SARADC nodes for the common Successive Approximation Analog to
Digital Converter used in Sophgo CV18xx series SoC.
This patch adds two nodes for the two controllers the board, one in
the Active domain and the other in the No-Die domain.

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
index 891932ae470f..e6c1a84d3e55 100644
--- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
@@ -133,6 +133,14 @@ portd: gpio-controller@0 {
 			};
 		};
 
+		saradc: adc@30f0000 {
+			compatible = "sophgo,cv1800b-saradc";
+			clocks = <&clk CLK_SARADC>;
+			interrupts = <100 IRQ_TYPE_LEVEL_HIGH>;
+			reg = <0x030F0000 0x1000>;
+			status = "disabled";
+		};
+
 		i2c0: i2c@4000000 {
 			compatible = "snps,designware-i2c";
 			reg = <0x04000000 0x10000>;

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
