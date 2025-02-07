Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18DADC02196
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 09:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:To:Message-Id:Date:From:
	Mime-Version:Cc:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=AJ6JtE2O7bshKVk12PUzfyOJc8vXuf5cLlAmBGx2QtE=; b=wb1
	ftpapEDFFuzAE5okMMp90d80972F0aqGfgBEBUNsBiyPAk9Hy8f+VuLxlvJgTZHaAdPoFquztJWii
	tM8+pJx4cbVdiCkycp9ev/gvqGMd0wl5l6OAM7QQfe6ypxt2j6aSosRG4edF5R0FPFQNHdl4G9dfb
	OjyxyQd+Law7DeDnhY03h82NCQV/P/AyL136YC7kJWs/O82GyvBilcdWKyKPBRE93C5YlZ3Kyndc4
	C0f+p6a8RxPdFYu8f9XQSp2XjaKOcv+8BZ00aXoNQXULxEUO5v3ChBCQG03gUcwvRuEZPKXpFLx4C
	nqqBrH2YFHmqERek9VUnxCMJ30k3LZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgKqe-000000094Vb-0Asu;
	Fri, 07 Feb 2025 09:40:32 +0000
Received: from va-1-17.ptr.blmpb.com ([209.127.230.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgKpW-00000009442-1yNu
	for linux-riscv@lists.infradead.org;
	Fri, 07 Feb 2025 09:39:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1738921152;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=nmICg0JeV9q0TueMgSa31FvUhRcU9+mUNKRb/fAv+c4=;
 b=Ext4D7g2kPHU3YeMoyg7w2U5doYWuKL65p5hQ+TumzUUIjwY/gsZn5W1oos5unnOzjQJ+2
 jUlCuQPgHV5b/WholkhRwGAbHdJn6TVTXM/sA+aPMy+OV/CRpMgc1IOfbaG78XaLlq6PK7
 BxIzAxf89c1UX2pGJ+v4YLyZTyibfV2WkUKsSLbDEJ79URlLIi6EKZtYWceaD0995Kwf2W
 YczpLFsyG4MqWHDNQvtjjwkiWYCL3oXvjwdj081Wh0fBCp4b6D0y+i540kbte3zMd3rTV5
 booSEJXZZbpDdMQnbcsl8Hljzahk6xeSQKc3k865TQ2xudjDCCsF95KsxEX4fA==
Cc: "Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, <linux-riscv@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+267a5d4be+7dd010+lists.infradead.org+sandie.cao@deepcomputing.io>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
X-Mailer: git-send-email 2.34.1
Date: Fri,  7 Feb 2025 17:36:18 +0800
Message-Id: <20250207093618.126636-1-sandie.cao@deepcomputing.io>
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
To: "Conor Dooley" <conor@kernel.org>, 
	"Emil Renner Berthing" <kernel@esmil.dk>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>
Subject: [PATCH] riscv: dts: starfive: fml13v01: enable pcie1
Received: from roma-MacBookPro.. ([113.110.140.128]) by smtp.feishu.cn with ESMTPS; Fri, 07 Feb 2025 17:39:09 +0800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_013922_588153_66B03BD5 
X-CRM114-Status: UNSURE (   4.16  )
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

Starfive Soc common defines GPIO28 as pcie1 reset, GPIO21 as pcie1 wakeup;
But the FML13V01 board uses GPIO21 as pcie1 reset, GPIO28 as pcie1 wakeup;
redefine pcie1 gpio and enable pcie1 for pcie based Wi-Fi.

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 .../jh7110-deepcomputing-fml13v01.dts         | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts b/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
index 30b0715196b6..8d9ce8b69a71 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
+++ b/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
@@ -11,6 +11,40 @@ / {
 	compatible = "deepcomputing,fml13v01", "starfive,jh7110";
 };
 
+&pcie1 {
+	perst-gpios = <&sysgpio 21 GPIO_ACTIVE_LOW>;
+	phys = <&pciephy1>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie1_pins>;
+	status = "okay";
+};
+
+&sysgpio {
+	pcie1_pins: pcie1-0 {
+		clkreq-pins {
+			pinmux = <GPIOMUX(29, GPOUT_LOW,
+					      GPOEN_DISABLE,
+					      GPI_NONE)>;
+			bias-pull-down;
+			drive-strength = <2>;
+			input-enable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+
+		wake-pins {
+			pinmux = <GPIOMUX(28, GPOUT_HIGH,
+					      GPOEN_DISABLE,
+					      GPI_NONE)>;
+			bias-pull-up;
+			drive-strength = <2>;
+			input-enable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+	};
+};
+
 &usb0 {
 	dr_mode = "host";
 	status = "okay";

base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
-- 
2.34.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
