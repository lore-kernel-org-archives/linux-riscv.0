Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB12C27C77
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jun 2024 08:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HY3rjrsJzM7GID19MNmRWCq4Ti4Aj9g4Gky5XTserxI=; b=yH/XUnr21EO1fl
	oFgtb5HWvhEPolJVMoSUSYkVElllFF7NrJynB18r5z/3boXqlB4nxb4HTtZeQkX2KHtES+phdVxQC
	gnCb7cCp99djrbzH2Nc9qjMrCY3ksXveGDUuOBWIt5PCJkiP9DXqnU5KQwbCVJwe6hae5QevSXYKj
	IWWRWwpWOhqFpPFlNxFbDxqtZOoktZt3K8PMkyYM2nlpsg7+MI6glvh6YChQvvpuZUHUFU7Hn+sfR
	v+He+/NXNxDBZBM+QRx/yWY6fjufX5iS/HtU8afiSFcea5fB3zEn8U6ICc8hHtIVwor7eY3r/c2Mx
	8vkxx5Xmv9K3yNzszvpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHIzc-0000000Bb1c-1ufL;
	Wed, 12 Jun 2024 08:06:04 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHIzV-0000000Bauy-2xrF
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jun 2024 08:06:01 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D48471C0003;
	Wed, 12 Jun 2024 08:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718179552;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i1K8B2o5VvOLQkzF58aU6k+CVJVSICxBTxdSF8PhKqU=;
	b=TsSjxCoLHStaX8mNGaMC7L1mRtC5V5APx+wWoSTsGJ+zithm6AdRY/MoGi0QB1eFPRNWio
	ai4YJEfnAiv7JMw7oDYbXWWpYu4ph8oD2DPzaF8Cfo5k2QfrZ+nFYRtykEH8t97N5Bk2g+
	E9E3mCQpOR8UqNvfO0LcRg/8y1doJTeEI3vXu46icE0sywj59TDy+TMu8zBfTdKPW97ay+
	KVJh9NR1BpiTowh8qsz88yjjgq06z0vLTeAYQ2BRJffG1m4MBx2bwZGVl7G+CVjuNwJXNs
	tylrk35vnIwlknmqGM43is03m4iecRR5AOaSG/eNocrm7ufbmf3/YyfuB0V0Sw==
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Date: Wed, 12 Jun 2024 10:02:31 +0200
Subject: [PATCH v2 1/6] riscv: dts: sophgo: Put sdhci compatible in dt of
 specific SoC
MIME-Version: 1.0
Message-Id: <20240612-sg2002-v2-1-19a585af6846@bootlin.com>
References: <20240612-sg2002-v2-0-19a585af6846@bootlin.com>
In-Reply-To: <20240612-sg2002-v2-0-19a585af6846@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
 Chao Wei <chao.wei@sophgo.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
X-Mailer: b4 0.13.0
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_010558_111636_0C562904 
X-CRM114-Status: GOOD (  10.92  )
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

Remove SDHCI compatible for CV1800b from common dtsi file to put it in
the specific dtsi file of the CV1800b.
This commits aims at following the same guidelines as in the other nodes
of the CV18XX family.

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 4 ++++
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi  | 1 -
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
index ec9530972ae2..b9cd51457b4c 100644
--- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
@@ -25,3 +25,7 @@ &clint {
 &clk {
 	compatible = "sophgo,cv1800-clk";
 };
+
+&sdhci0 {
+	compatible = "sophgo,cv1800b-dwcmshc";
+};
diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
index 891932ae470f..7247c7c3013c 100644
--- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
@@ -288,7 +288,6 @@ uart4: serial@41c0000 {
 		};
 
 		sdhci0: mmc@4310000 {
-			compatible = "sophgo,cv1800b-dwcmshc";
 			reg = <0x4310000 0x1000>;
 			interrupts = <36 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk CLK_AXI4_SD0>,

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
