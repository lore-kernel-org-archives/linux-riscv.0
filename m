Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D44C433FE
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Nov 2022 08:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vysh/LloSBXFBbNP+xSO4eH14xlZoMZZZ3SI4PlJOj8=; b=ioXef/0yjYs6aE
	d9oIROsrr33gFLTV+t+xlLpQaXl/EG/CwXI7bfuPTWglRShKEiQmdsehNP+U5kIXXy5CgtF0kJUwf
	/LIYn7djVqy+8h58mMqgZug1M112QIS4ZwBpckdcnMpGx0JU1z4Q+iv/80hJc1CXWwjNJvmI18JOn
	tqV2EwguCpUJ8BUXJKtSi6BD6Sve5/u/ltngS4epPRAlExfD9hNCi9ZzH4QfUWAZ7v9lEtqpqHzrA
	4q8OsXoMFK8MN22sn/ykgvnFAXq4aw2rEXhcBtlYLydDj4EF8YQxtAsDldOKz+NFxWLdRWLQv7Sjj
	HF6zBu1TM+Pr9x3Zw86A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owfje-0031L1-2T; Sun, 20 Nov 2022 08:31:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owfjZ-0031HM-AO
	for linux-riscv@lists.infradead.org; Sun, 20 Nov 2022 08:31:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7E92D60BFF;
	Sun, 20 Nov 2022 08:31:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C3CEC433D6;
	Sun, 20 Nov 2022 08:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668933081;
	bh=8DpC7ZxC9cDZMqNergJhZnIX0tJfCKV0KgENFedKUeA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I0zk+nsC+Zy7lfbg0GXChm3Xj6CYUt4yFkYRJCM2lON8diDHbY4LIlBKluaL1vHkX
	 lx52ki+EuGnT991U8pA2q0E7o3XfI38HK3eF0qsCeM2HzU6SwHv/9cJAczin9rZ1QS
	 pKZVjtrRS2B7fOEUELo8ozvPCueL05Fq7aFXvSOwFpkeJ32q7zIsdxca25ORzq9Mqo
	 L1smLokTrmPbRHsg+5DGhAgXNf9Hae5e9yz3WiDWXIfUSoKivWS5YEy0WpRUyUAiXq
	 GAgB1H3Co7IG4sBcnbvCMpFFqRGvufg3nWu5dAQRQTskeyd9Byu8tzTSd0Vvay4wHV
	 PqD2VVOilG0bQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 6/7] riscv: dts: bouffalolab: add Sipeed M1S dock devicetree
Date: Sun, 20 Nov 2022 16:21:13 +0800
Message-Id: <20221120082114.3030-7-jszhang@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221120082114.3030-1-jszhang@kernel.org>
References: <20221120082114.3030-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221120_003125_471229_3EA5ACC7 
X-CRM114-Status: GOOD (  13.23  )
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

Sipeed manufactures a M1S system-on-module and dock board, add basic
support for them.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/boot/dts/bouffalolab/Makefile      |  2 ++
 .../boot/dts/bouffalolab/bl808-sipeed-m1s.dts | 30 +++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 arch/riscv/boot/dts/bouffalolab/Makefile
 create mode 100644 arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dts

diff --git a/arch/riscv/boot/dts/bouffalolab/Makefile b/arch/riscv/boot/dts/bouffalolab/Makefile
new file mode 100644
index 000000000000..42e17e1a97bd
--- /dev/null
+++ b/arch/riscv/boot/dts/bouffalolab/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_SOC_BOUFFALOLAB) += bl808-sipeed-m1s.dtb
diff --git a/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dts b/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dts
new file mode 100644
index 000000000000..64421fb2ad67
--- /dev/null
+++ b/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dts
@@ -0,0 +1,30 @@
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
+	model = "Sipeed M1S";
+	compatible = "sipeed,m1s", "bouffalolab,bl808";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:2000000n8";
+	};
+
+	memory@50000000 {
+		device_type = "memory";
+		reg = <0x50000000 0x04000000>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
