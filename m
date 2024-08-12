Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC63C531DC
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Aug 2024 15:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PPcnPyRhHSftDnI1BaCRUxUNuoHb2iDGWNKHPA0bd4s=; b=20IHKzbobAr+ia
	BO91u9CI6PS+iiLRTaymf+NjFkUxqPBYjxyz0bwiXN/aRPJ2kvc6Lz/mYiXbXtn7q2cp6n6T28ht1
	Z5I4Oy+vk3jIZvLv50oGaeS+nnVIoFPKQxUgfD9zpZpfeWIpIy/OeRsllFG0/RZ9LmtiEieZk2WXg
	cfEaeFLyZGZGAETpsWnSY0zb9RA5AK1Z0Gq5FPebYFAwllc+eE/5kSCn9aZFNikz2gLwir45D4q2q
	RplMYLSCP/CrfOdarjorw4ck6uWR8JMOwIebQ+Qhq8wQNfli1C4gdd1isma5G7hGxsaH3rAzONyWc
	dZ1cSkV3rdXvekkk/+OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdWXu-00000000fWi-35LM;
	Mon, 12 Aug 2024 15:01:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdWXs-00000000fVg-1tjN
	for linux-riscv@bombadil.infradead.org;
	Mon, 12 Aug 2024 15:01:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=qcnVQb/yrvDYJxCY7i392OtDZOwd6IXmcourEZmhOEM=; b=nuYDBQMWReWrjyLtLDdSq9ZIFF
	vFuPqGljI1omHLKSrsZQsLCkfTe9bY05c87Q1ZadiMRf5bsR51xPSJdELOppDbewy1mLwzCTHEwuJ
	Di+FI+jYKoC9OGSAWWuZi6vhBxtg02MSFFjftt5a5nhN4H91TTnTIKJJOE3SOSvQhXoHs11OaNHSi
	R2vcXO0QUTjdGW6pf+M5HiR1HO8p5OUR2QydIudI9cvwKFi7PTwlzObjm8dvKlEqdV3P38xJTDBY8
	SIwW6HMEMViTR6yKC3Mt/sKLQxWbAaxHhHBo1Y3U3A5GdQzFMhSY/timho/z14OrPC1WA7Cj930ao
	oxJL/kig==;
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdWXp-00000007anG-0TRf
	for linux-riscv@lists.infradead.org;
	Mon, 12 Aug 2024 15:01:15 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8E5E8FF807;
	Mon, 12 Aug 2024 15:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1723474869;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qcnVQb/yrvDYJxCY7i392OtDZOwd6IXmcourEZmhOEM=;
	b=eImntX/09QmFtD+KwtwW/PiFL8FBHh8x6fardUgTSBSQGvgkcg0mvGZwiWIZ7w/PQcZb1g
	Kvr+ighKlHbB1U2hXlYFC8aTluW8ysYaUIkSprsQvq0/wHQccQh+yxHuTTBj0TnVk6YouR
	DV1HcDXkm5SHm5Bj6+wGIXajsYOODy2NY1tM1/ZaOknCQYciTuP5Xzuz/s8L7RFn0KtTL/
	PknVlgJ6TlyNAySg2HUSu4lfucNRkB6uu7CJCPTeTkeH2McnLmDlfISi1jw09O6xZya0Ua
	vMzEY8bvYHzkR0SA1cFR3snY1zkepdzuKdd+qPiE1Or7MvwwU/GphKMupT/8xA==
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Date: Mon, 12 Aug 2024 17:00:57 +0200
Subject: [PATCH v4 3/3] riscv: dts: sophgo: Add SARADC description for
 Sophgo CV18XX
MIME-Version: 1.0
Message-Id: <20240812-sg2002-adc-v4-3-599bdb67592f@bootlin.com>
References: <20240812-sg2002-adc-v4-0-599bdb67592f@bootlin.com>
In-Reply-To: <20240812-sg2002-adc-v4-0-599bdb67592f@bootlin.com>
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
X-CRM114-CacheID: sfid-20240812_160113_322584_14927805 
X-CRM114-Status: UNSURE (   8.85  )
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
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
index 891932ae470f..71a2618852fa 100644
--- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
@@ -133,6 +133,26 @@ portd: gpio-controller@0 {
 			};
 		};
 
+		saradc: adc@30f0000 {
+			compatible = "sophgo,cv1800b-saradc";
+			reg = <0x030f0000 0x1000>;
+			clocks = <&clk CLK_SARADC>;
+			interrupts = <100 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+
+			channel@0 {
+				reg = <0>;
+			};
+			channel@1 {
+				reg = <1>;
+			};
+			channel@2 {
+				reg = <2>;
+			};
+		};
+
 		i2c0: i2c@4000000 {
 			compatible = "snps,designware-i2c";
 			reg = <0x04000000 0x10000>;

-- 
2.46.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
