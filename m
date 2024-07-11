Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 746C0C41513
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jul 2024 10:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aN+rhhmjYHDYp6vx8NcCM2CQM7jfEicuTTKuIZqcP94=; b=HecRpIgKj9Mygv
	EEtGSx8tslZe9N/SN1ixjitsZ6V2osGSBroMWpyKic+Po699Ls5YM+F51BscHsGuOwWnJZaiJ3mXW
	4aE8xRSYS2O01Wwy1oEBW9gPX4fq2tMT70QqG1m4hx9nSZY04nqwBUgy5nzjqpbxACcqaOOxqxkh0
	GzcfI0SEWgMoYO5XfbFF0wZZvrBAfYkQ9foqPru7BgOdiWtiv33szbDx/Kl7KBdj1ACRKQRvPbKHI
	OYFV+oHQpBCPeQRJMxvP+o7ZgQfuBf3yZ8F0TJHDOQImx8TQ1ddM5R1kpZYUPY/ERc1doIQeOjtEv
	s4yQlmD4yCPDJofIFwHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRqcT-0000000DRCv-0yLB;
	Thu, 11 Jul 2024 10:01:45 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRqcN-0000000DR9s-0QhO
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jul 2024 10:01:41 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 574C7240007;
	Thu, 11 Jul 2024 10:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720692096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BPkEiyyZXaXaWAKf4yoZh+8s32yqaBI0vrIZ56akVFE=;
	b=HnfizYzzYdSlmjzV8cvPB598TUaOqyEyaPnDoVpZ/W9wwSXPE9IoBNuELZtaBgF3fUhJ8K
	54cANzKBnZZUh/Eb74GZfRDNH1S+VyNM3Vu25YJJILZMWrjdTsO8b5pth58NrZwga0YMD4
	2W2nVt05Wpng6eORsmbwkZGqBDcbq0G9PQ/catMcaDFKXVxrM9/mArCymKTxl247Zc4GVb
	mXnJh4QQvhjFawGjE/pzjndIlJiyJkE8P5HIKzZ2LzgBeMfy17AqlMwRzftwdU/vM1E0DV
	IWzgtnJtSY/7ZEzSZZ2/KMoxRld9l7Srl0zgTqA+/cCLqrSVBC8svkU/ZJasiw==
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Date: Thu, 11 Jul 2024 12:01:30 +0200
Subject: [PATCH v4 3/4] riscv: dts: sophgo: Add initial SG2002 SoC device
 tree
MIME-Version: 1.0
Message-Id: <20240711-sg2002-v4-3-d97ec2367095@bootlin.com>
References: <20240711-sg2002-v4-0-d97ec2367095@bootlin.com>
In-Reply-To: <20240711-sg2002-v4-0-d97ec2367095@bootlin.com>
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
X-Mailer: b4 0.14.0
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_030139_306782_DDD757F1 
X-CRM114-Status: GOOD (  10.36  )
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
 arch/riscv/boot/dts/sophgo/sg2002.dtsi | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2002.dtsi b/arch/riscv/boot/dts/sophgo/sg2002.dtsi
new file mode 100644
index 000000000000..22eb99d1abf7
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/sg2002.dtsi
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2024 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include "cv18xx.dtsi"
+
+/ {
+	compatible = "sophgo,sg2002";
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x10000000>;
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
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
