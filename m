Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C60E6C7EE23
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 15:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NiiJBXWz2Q8ZNZWQxpXbCmDG+r1JzXsDyHgyvfhmDDE=; b=prez2Y4UFvlD7p
	xrPx9khX4C6SypWSH9MauldlozigpFjHCBzZptS7gnuACZW0pFo3LybnISGtn34mtFqqHCwlJyqfm
	vQ/3sWpIbw+IK9UESjqsVBZpUsY+Kd2iecVIbnFOG9sNlSvd9xs7IKYxE0ScUo95h/iOP+C/Yp8bj
	VrSs7BXoVMwofH8tV5tzy0+cUNtYmplj+J0SHPw49qOLL8x3Y+3my6cl1vNbwQiK1cti8KiNulhmz
	7DM+acw0mMENtQuxdh7uH5lmlDrLhQ6sSJxsn6J/8D+FYCXFJW4W3PkA8yxu9KYVNZFdLiPGLxDo8
	BhiZDGnPO/ihzqkVBlrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzfeC-00DK5k-2U;
	Thu, 18 May 2023 15:34:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzfe9-00DK3Z-20
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 15:34:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3C8816503C;
	Thu, 18 May 2023 15:34:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01436C433EF;
	Thu, 18 May 2023 15:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684424068;
	bh=gEHB+BIFuaGSJHd+ja+x4RxCS37TdEdu060uta3gMMQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FG5KSkJVORV1NRSO3ygKuqQNl8sXCDza7x0MkNP0DlPMo7lWgfRgPs7QVYfcMklOw
	 cqzEUkUi+PsCYfcoQyTaJD6iA6RZg1jjvOrqdHssGWhIjvaqMDo/4lahNZIKw/5yiG
	 Ohnqb6ATbN4ExIyf30baJHXF4a4Mwj78lrPLd883aFnrkCcdZt/5OotQYCVLGKPCMY
	 prue/GlO5qAKxHJt0Ar/EwF7cRRGGcGGhNLVadXx581s2kvspHxyzNK2+lK8adcy+s
	 ItcUwS2UX+lMP6ihKx0HLUKIpQe9WBe5aC96xAiHBHxmhisOw5MecZ7+oEEcmUO1V/
	 TbZukq0Nh5srg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v4 08/10] riscv: dts: bouffalolab: add Sipeed M1s SoM and Dock devicetree
Date: Thu, 18 May 2023 23:22:42 +0800
Message-Id: <20230518152244.2178-9-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230518152244.2178-1-jszhang@kernel.org>
References: <20230518152244.2178-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_083429_741385_BAFAB865 
X-CRM114-Status: GOOD (  15.80  )
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
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
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
index f0d9f89054f8..133e6c38c9b0 100644
--- a/arch/riscv/boot/dts/Makefile
+++ b/arch/riscv/boot/dts/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 subdir-y += allwinner
+subdir-y += bouffalolab
 subdir-y += sifive
 subdir-y += starfive
 subdir-y += canaan
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
index 000000000000..aa6cf909cd4d
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
+		serial3 = &uart3;
+	};
+
+	chosen {
+		stdout-path = "serial3:2000000n8";
+	};
+};
+
+&uart3 {
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
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
