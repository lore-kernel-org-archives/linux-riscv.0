Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3508CCD1BF
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 00:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nkkcMQk23LCa+Vb27U1tiJQz4/MoMOcOU6bo17IpUnU=; b=Skp23ltsI4PX/r
	+Eg3Un3bPU5zODHl11yKo+LOtGJf1vy02/+SRrxTL33Yb6nqSzPcPFOYz/usFvUrgYminGVNE4Upx
	i8isXIVkjXQdXd2UHyEwacKeyTUSYeJXa2ejfYZCLXTsIfJXacNFHellHgO+rxbJxXU3UUgmObcpW
	2dppxirgZYrQUJcAmDk84D/rFU+KdG/7E5N/G8j0HaaQbF735wLf42MQQi/ycxddCRuHRkvOmdeQ0
	fLyf1TB9Pj+iuE+Lfwb1YSwyxxSsflBkAa0lfxarkojne+cjARQ29Uxu4PKAu/9SZCQCP+pLE8ZkL
	wx+TxB8EJV5ueCGW8ixg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDtn7-0000000GqMY-3KZY;
	Wed, 29 Oct 2025 00:11:53 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDtn5-0000000GqLd-3SLs
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 00:11:53 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-87c1f61ba98so94224286d6.0
        for <linux-riscv@lists.infradead.org>; Tue, 28 Oct 2025 17:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761696710; x=1762301510; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jVnVAo31Qk9BfTF6wZceGmP4C2BUIBcQwu7HUQHA8Lo=;
        b=GICoSo4s2cYCYkd6t6AslEMdIaMOHhYXyKNUDTui8+4wvpPrXb0hUICVdTOcj3pDN6
         bSzRUPyjZDtV2GmPzgTf72twEec/s1vtTWV4eblA2Ir+QBLU2oTupPomeTUTaDLj/OYH
         3mINc9MXcEuPtaKS8XuGWr5F/w8Fle9oVvePZGV++eqNJ/Cp8tT0/Pw2B/LX1BUnmmz/
         jd8tjuagTy+GNooRLS23fz2CbRFIZAG+w/AolkaetQzY1IbUkvHool3usRMbHalMFupA
         Wjk8+4OzDcG3AvQqxTqCuT3asMmf7mB0wLZO+/UURT2vli7Jg1VCc/ArkXDoae/O7/6F
         cUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761696710; x=1762301510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jVnVAo31Qk9BfTF6wZceGmP4C2BUIBcQwu7HUQHA8Lo=;
        b=KExQ2yK8E8R/xbUZsKOLv6yJtA0GJ5VE6zVIDPfQzMCq9jw+mi/Q6kv5RbqjGOY7bj
         JhMDX5vffD0Hq0lC6rAvl+yTfi7G66DH3UWDMNvxW5MVDnqCkCCHkBwxfnyjllBQqYO0
         vLsUYnGMz1R3qBEyBjYzhzxnY/WD6kP7EAXhJS1sMaw6+484gYKx//VJ4PeXtaNDmhjo
         r7xGLHmNRCGlgYt668nz0PzsVPj6wD0aB1c7nK1j0pQZB8RFApryLLS/O4/5abUQXXuX
         w0AslFCWKeisUDTEZd5yS9iZzFVuj3iT+eqs7PRZVtQWcnLGCwFQ+17Nd89KZIBSMf1w
         WGjg==
X-Forwarded-Encrypted: i=1; AJvYcCV3TM7Jrf9dUkKv8j68QCfxrlEilBjTQjT4hiDER3/sDuuCxZ8QzlaspsMEHhUgawVbb+NNAowBYDT6YQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwXuSzY2k/gVpExZvc0FG1lfMdzSN7ohFvmPUq5XD9EkY80rTo3
	3JrbXPxYvTpvlb3aqFxcjpAAQdXrXXh9pEzYeGrpaWTpoHfSG+uEPxg6
X-Gm-Gg: ASbGncv57xbjlF7nd8TVF6KpCi9gAu62gS2Au5KDQDRX8AML54qFTSflLe7H/1iTUFY
	YbTOgm52gPHc+sT03HKCz3Bz05mjB35zhb4pMI+HbBnSAZlVQ3KCWw5jSRXeCEO1gBQWc5Tc1Q1
	p8unW4phlDJqav3XW2H6ljXlWEiObWi1h7sXIAwyscbsWNi69y83DmiBnqt8b8ONf8XM4yH2HnM
	3rgABjVD+PhdNAR9P7LJUnZUbtlvRFkJuwBtm956wACJKQXm1qkDUNhoqm2XOUyKAlwmA+3f8A6
	tyJULH5H5cKPT6caYN1Sw7jKgvdtH4kwQduJ8+yy1rLdx0dU3OUP3sauqrvGeWZfGY9zWy3BED/
	IwgyL5rC/6rQ1t3KkhGQfh5I5AB5nK82t7s3Vdt5iJzkILQjRo26etgsJvuCZTxm9H70gfuidwk
	njpYI6JSyOiDQH4vXGri98EsCCzTEJ7dk3KQ==
X-Google-Smtp-Source: AGHT+IGIc6sh+oNl05iSSCfx3miJfIAzo70BjFfgaGOYdbW/vkSvtUIPlil1z/1rfFLSdusZMiyOhw==
X-Received: by 2002:a05:6214:1d01:b0:87c:16e7:892e with SMTP id 6a1803df08f44-88009c2f115mr14442296d6.62.1761696710612;
        Tue, 28 Oct 2025 17:11:50 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87fc48dee2esm87255906d6.23.2025.10.28.17.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 17:11:50 -0700 (PDT)
From: Joshua Milas <josh.milas@gmail.com>
To: tglx@linutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@gmail.com,
	paul.walmsley@sifive.com,
	samuel.holland@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	thomas.bonnefille@bootlin.com,
	chao.wei@sophgo.com,
	liujingqi@lanxincomputing.com
Cc: josh.milas@gmail.com,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 5/5] riscv64: dts: sophgo: add initial Milk-V Duo S board support
Date: Tue, 28 Oct 2025 20:10:52 -0400
Message-ID: <20251029001052.36774-6-josh.milas@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251029001052.36774-1-josh.milas@gmail.com>
References: <20251029001052.36774-1-josh.milas@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_171151_873997_A4765DC7 
X-CRM114-Status: GOOD (  13.13  )
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

This adds initial riscv support for the Milk-V Duo S board
[1] making it possible to boot Linux to the command line.

Link: https://milkv.io/duo-s [1]

Signed-off-by: Joshua Milas <josh.milas@gmail.com>
---
 arch/riscv/boot/dts/sophgo/Makefile           |  1 +
 .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 80 +++++++++++++++++++
 2 files changed, 81 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts

diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
index 6f65526d4193b..58cc6b70d8de4 100644
--- a/arch/riscv/boot/dts/sophgo/Makefile
+++ b/arch/riscv/boot/dts/sophgo/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-s.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v1.dtb
diff --git a/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts b/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
new file mode 100644
index 0000000000000..174c194e1301d
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+/dts-v1/;
+
+#include "sg2000.dtsi"
+
+/ {
+	model = "Milk-V Duo S";
+	compatible = "milkv,duo-s", "sophgo,sg2000";
+
+	aliases {
+		i2c4 = &i2c4;
+		mmc0 = &sdhci0;
+		serial0 = &uart0;
+		spi3 = &spi3;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&osc {
+	clock-frequency = <25000000>;
+};
+
+&dmac {
+	status = "okay";
+};
+
+&emmc {
+	bus-width = <4>;
+	no-1-8-v;
+	cap-mmc-hw-reset;
+	no-sd;
+	no-sdio;
+	non-removable;
+	status = "okay";
+};
+
+&gmac0 {
+	status = "okay";
+};
+
+&i2c4 {
+	status = "okay";
+};
+
+&mdio {
+	status = "okay";
+};
+
+&saradc {
+	status = "okay";
+};
+
+&sdhci0 {
+	bus-width = <4>;
+	no-1-8-v;
+	disable-wp;
+	status = "okay";
+};
+
+&sdhci1 {
+	bus-width = <4>;
+	cap-sdio-irq;
+	no-mmc;
+	no-sd;
+	non-removable;
+	status = "okay";
+};
+
+&spi3 {
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};
+
-- 
2.51.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
