Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A915CF11FC
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 15:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uynOotYrtH98FXhFwvoVzyb0a+eVQuRA6pbPPSZWNOE=; b=RVFHChS5mj8sIN
	OakTPgNNbS4VuiFp7y2JLY4fPL7PnhbSk77qwkKYIdarOpdF36JSle/7Mw0QOCfeSw+XpeVI69HQw
	p1yEibQ/7Y6xfPck/7vPKD/jRisnMPqtUasURQj9nFJytm9C5Qi9uFjaghMFf4rRxSA0zhwfLvJC2
	e7G9Di3rvLDK2tG1DJ6+Oi72OIc4hDvBz6qE63KsVl+QHqmoI3nNUZd50Zj1o1cdU1knyx86vy4WT
	bTet8ml5WnSf09+xG6i9mK6+IR2dSC2hJ/uclcqbcOsIsd1RJZX57Rari4SYxBk/eJYM2123g3fsG
	oWGpKqgcXn/7MGeBHEKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syv4k-0000000DKQ6-1SdM;
	Thu, 10 Oct 2024 15:27:38 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syulv-0000000DGD8-2grN
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 15:08:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E519E1C0002;
	Thu, 10 Oct 2024 15:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728572887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fqdCRYpUpWtmxoATzqfKvQ7Vf09Tqe7FVeasQf33ud4=;
	b=k+cy53q35OLyFbTyFYBQ//jALk6PBH18DJpyH2sY3ts1iHjqaQpo12zEsbCxXiUG/YrsTu
	e4iFSkNCYc3b+NtEhgo0C4+71izV7bw2LqHhpvW9LJHDczV5nwSd0VYobDkIXfOHIZKr66
	/sskHOK9GXisLmywEEaCY86/oTE9j7mmp5h9fHsovbKW0hKWAxni5JWJsB0KHhPBkFsHuy
	BEr5Zy9aciD8Y8P8rO3+lb+bbEaM90ahS6hdgSSbOnaFFJzZTde/uPRXSyuW8Q2bq6Nh/g
	7kq5/3OUkQu4WKZtI78oJVe5asnlrkEo+c5T/DH+qGQqDr8B3gbt2K9AdtoxiA==
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Date: Thu, 10 Oct 2024 17:07:06 +0200
Subject: [PATCH v5 1/2] riscv: dts: sophgo: Add initial SG2002 SoC device
 tree
MIME-Version: 1.0
Message-Id: <20241010-sg2002-v5-1-a0f2e582b932@bootlin.com>
References: <20241010-sg2002-v5-0-a0f2e582b932@bootlin.com>
In-Reply-To: <20241010-sg2002-v5-0-a0f2e582b932@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
 Chao Wei <chao.wei@sophgo.com>, Conor Dooley <conor@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_080811_857505_4142333D 
X-CRM114-Status: GOOD (  10.00  )
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

Add initial device tree for the SG2002 RISC-V SoC by SOPHGO.

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
The commit adding the bindings for the compatible "sophgo,sg2002-clint"
has been applied to Daniel Lezcano git tree. This commit may trigger the
bots because of this missing binding.
---
 arch/riscv/boot/dts/sophgo/sg2002.dtsi | 42 ++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2002.dtsi b/arch/riscv/boot/dts/sophgo/sg2002.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..242fde84443f0d6a2c8476666dfa3d72727071b1
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/sg2002.dtsi
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2024 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/pinctrl/pinctrl-sg2002.h>
+#include "cv18xx.dtsi"
+
+/ {
+	compatible = "sophgo,sg2002";
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x10000000>;
+	};
+
+	soc {
+		pinctrl: pinctrl@3008000 {
+			compatible = "sophgo,sg2002-pinctrl";
+			reg = <0x03001000 0x1000>,
+			      <0x05027000 0x1000>;
+			reg-names = "sys", "rtc";
+		};
+	};
+};
+
+&plic {
+	compatible = "sophgo,sg2002-plic", "thead,c900-plic";
+};
+
+&clint {
+	compatible = "sophgo,sg2002-clint", "thead,c900-clint";
+};
+
+&clk {
+	compatible = "sophgo,sg2000-clk";
+};
+
+&sdhci0 {
+	compatible = "sophgo,sg2002-dwcmshc";
+};

-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
