Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B17C4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Nov 2022 13:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S5McCohgxUBh1cZydBBYRnb+hTHwAFct9o2cz+ccFHc=; b=PmdZcUQ3DhL60f
	zk9JQOJUn+CQ9YFKbMkcxiYP9MGGRy8cGFd0AcWuAxRAgjDXmMrhpJ6t7LeXI4Xb/GxEmjnIWsQli
	4kF8HImRKIl+eZoTnLfEYz1FIPSBPEggxVquZ2rHnW+Bbj0hJGQkOb1quefQMayuIZg3slXoOENJt
	brMSUKjvt/3rgLhc8n+vv77e4xY+CksiUO1RAyqJ0CUBYUpEyi7JJeqL3nYUpO5Tkg0z/EqepwInc
	BfQrNP/56XdnyUdBdtSrqYgvN1AAPMMyZtq/Ez2nDJBTflUn/2935sfVqAJ8zUWrF5ZQsrMcSquNm
	1wCcXGDnrEvv4Mnek3Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozHoH-00BPvb-WF; Sun, 27 Nov 2022 13:35:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozHoF-00BPsn-08
	for linux-riscv@lists.infradead.org; Sun, 27 Nov 2022 13:35:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 98E8260DDA;
	Sun, 27 Nov 2022 13:35:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CE40C4347C;
	Sun, 27 Nov 2022 13:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669556101;
	bh=MNbW+YutU+sVrmmOrPINpNykL05x+gdBC0t0g2Icviw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iu8kEZVOT1yqzn1YbRDJIxQVy17rJLRAgVSIvst11f18PAQi9ez4knFI/tgn8qRXi
	 GO4k1HGJ1ggQgj6fCJ6/wIpyYeGwq/buxrdfsQYi9msT+p9DC6vjIvjg42Vec6hLrM
	 0eB8lREFkL8/w+gtGgX8MOS6P+eqwHCgEiJgQtlVNme2xgy80CH4p/hpsESV6swg4O
	 6tbocxXBzhHMneZ3e+VxKUC6WwlA2tr5/GtBDfcTZ7egpQfpO4tYTIgsrmNoYf+ZA6
	 qY9UKJ7wRHqWmPbpA4YUhW1G42Yh2/tNrxF8MR0s0xbPffAxRD7JctbLkJ0a5KLCYE
	 6VqpFlM53Wrgw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH v2 7/9] riscv: dts: bouffalolab: add Sipeed M1s SoM and Dock devicetree
Date: Sun, 27 Nov 2022 21:24:46 +0800
Message-Id: <20221127132448.4034-8-jszhang@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221127132448.4034-1-jszhang@kernel.org>
References: <20221127132448.4034-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_053503_169158_8840E7F6 
X-CRM114-Status: GOOD (  15.59  )
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

Sipeed manufactures a M1s system-on-module and dock board, add basic
support for them.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/boot/dts/Makefile                  |  1 +
 arch/riscv/boot/dts/bouffalolab/Makefile      |  2 ++
 .../dts/bouffalolab/bl808-sipeed-m1s-dock.dts | 25 +++++++++++++++++++
 .../dts/bouffalolab/bl808-sipeed-m1s.dtsi     | 21 ++++++++++++++++
 4 files changed, 49 insertions(+)
 create mode 100644 arch/riscv/boot/dts/bouffalolab/Makefile
 create mode 100644 arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s-dock.dts
 create mode 100644 arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dtsi

diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
index ff174996cdfd..b525467152b2 100644
--- a/arch/riscv/boot/dts/Makefile
+++ b/arch/riscv/boot/dts/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
+subdir-y += bouffalolab
 subdir-y += sifive
 subdir-y += starfive
 subdir-$(CONFIG_SOC_CANAAN_K210_DTB_BUILTIN) += canaan
diff --git a/arch/riscv/boot/dts/bouffalolab/Makefile b/arch/riscv/boot/dts/bouffalolab/Makefile
new file mode 100644
index 000000000000..5419964e892d
--- /dev/null
+++ b/arch/riscv/boot/dts/bouffalolab/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_SOC_BOUFFALOLAB) += bl808-sipeed-m1s-dock.dtb
diff --git a/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s-dock.dts b/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s-dock.dts
new file mode 100644
index 000000000000..c6b4894a7b88
--- /dev/null
+++ b/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s-dock.dts
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: (GPL-2.0+ or MIT)
+/*
+ * Copyright (C) 2022 Jisheng Zhang <jszhang@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "bl808-sipeed-m1s.dtsi"
+
+/ {
+	model = "Sipeed M1s Dock";
+	compatible = "sipeed,m1s-dock", "sipeed,m1s", "bouffalolab,bl808";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:2000000n8";
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dtsi b/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dtsi
new file mode 100644
index 000000000000..5026de768534
--- /dev/null
+++ b/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dtsi
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: (GPL-2.0+ or MIT)
+/*
+ * Copyright (C) 2022 Jisheng Zhang <jszhang@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "bl808.dtsi"
+
+/ {
+	compatible = "sipeed,m1s", "bouffalolab,bl808";
+
+	memory@50000000 {
+		device_type = "memory";
+		reg = <0x50000000 0x04000000>;
+	};
+};
+
+&xtal {
+	clock-frequency = <40000000>;
+};
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
