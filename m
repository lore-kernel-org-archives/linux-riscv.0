Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58728CD6E49
	for <linux-riscv@archiver.kernel.org>; Sat, 30 May 2026 17:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fLMDHJjP8vwFKT7IwcViaXmxXOElybv2xfxGt0FiKp4=; b=JRmnh4DVUh/+f3
	BcTBy0dxKzo0CKPVVOCZAcQDB/RMoa1Qxko6gUVUeewDhkDZfEj8QibSl9830CbU2IwUTgjlspZxc
	qpnAUInYqLAdGWQuKrmtNsKJS9fuseFGLMtQ/RgcxSVwDqch6XtyNEdXhZRQ7hZY5UZCnsHfFrjT5
	pHzF6dOh7+sUXC0lSBaT5sQBItzJS8+VPf9g6ki7gjG0ig0asrlqLATkEQ9PH9kiT+VnBzxRdjNoW
	5jr7msFs7ZpXnn2xfiCWc4e2wXdmAYRKiGACKP4ovdOEfTOIQLAYAgFJjxHMQT6a3IBtAFS/t4Rrx
	UuAEjkXmLUwqd99r/PCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTNax-00000008yDB-1PaV;
	Sat, 30 May 2026 17:35:35 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTNau-00000008yCE-0BgH
	for linux-riscv@lists.infradead.org;
	Sat, 30 May 2026 17:35:34 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-8ccf181a52bso9204326d6.3
        for <linux-riscv@lists.infradead.org>; Sat, 30 May 2026 10:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780162531; x=1780767331; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e1iXfEJhkoJc89mTL/JJu7oRdlYA/T+hX/oQJz+ARaI=;
        b=Ep3BQmasAH4fr0t2cnUHG/T0cNrdFB0CWXJmKAcfGe6lpjHKpLqOrVsWwX/jp4SQH8
         ZTfvep4B9cmQOm6+sUaODnffDi9hWkSGhrYm82EAHyzENRJXB4fryEplweELG+TWWbJv
         Z3bpgj3qwWKYEPCvoNqU9yYozA2VjywX5vDkWGhsZrQz0Pz5AAxzcVCLeOAv00BKZJtr
         uGadCdUQd5hBG49ECICadVHmBWjsOkZ8jYnJ1XEwGgwuhQMAMaaomyTo2iBJepsUVUjl
         RwSKgdhP6P1f01TxVzcWfRAEsiHy4a33axYiNoaloaYe3L6MqNaFERMQJKSF4nS9TvA9
         bz/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780162531; x=1780767331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e1iXfEJhkoJc89mTL/JJu7oRdlYA/T+hX/oQJz+ARaI=;
        b=p6Z0k4J5WP9PncGE0Bunkfk57xGL4oUch5L+verrPejh5s41pgAGTndopEterjaDot
         xIbe38wQD56aDSQg8Bj8PI+mBR0+yE+x81KEvUyaQktlYFeCc3lX3gCK8E5v/zOeh7N6
         WgVzoeY18/4C2sUvvkxT1Tiv3IuMBwOM9pHOec8BWuKJmgcMVJtWU/XgtEL9EcJqEKE4
         TPRFaNQeZgMY50dxEQDSsXAPqU/i3tTCh/41VsMayl4STlhLTYMkrYbxZqCcSgDj51BI
         8uhQjMPA0EHyy+7e2P5Wy67rhR8DPg4cqnT9SzAvvNb2k/z9460aEF47oI/akJIsWNFM
         VU8w==
X-Forwarded-Encrypted: i=1; AFNElJ/OoisorMbh6kryXdboJBNVFB+p4//O0PQzFSdASYfNc0a3qiMiBtz3CBOmWiXQkXMaw+85ZPFW7/w1Yw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyjpv7heJCqKxHdXdcWbYERZRtdqxpvRM8MqEPDbbrf6MFzEXca
	Zoj6or6psfSXLMDOU61IOLWSmEtQyJui2+qDAP7PhkUf3jaKLv5mgqzV
X-Gm-Gg: Acq92OETMfaPGJcpddU6SCzqZFVeV3T5dcslEtuNig56wirpVsQkqv095NikCKcYyHe
	+8XzUtNcrrlwmHZ4LGBSXCo51v6Q+30qnZUrsJt9S4aFznYRUs3UC221ORLmCezfwt4nFO7ZjQu
	4gQXrXXxMsA0om9/jwLso3SnKZgdjcqLHRd0uyEouBGVTO8Vbu4OyaV01jmiOyjsM6ETWqybVDx
	JaLjHelw152pUkxJVJOjO0dKXIpNREtHfX9HxdllZwTfpvtju8XNPORSKC3auoB74e0oNs0ny5P
	Ja1OSO3Aev0ITgo2Po4o7EfGjQCCU+pqwk+LvkU4OLCSO94ceryDVlvemYrvawOJKnn5PIzIuEL
	2AR1cFTdIq9E3RrZuGgaa25pOeH/Y4aDVmhqbW7RdgEnBxBpzCRHpNSRlbmkhosXa24NH4DuSvX
	KKhDYk20i4Jy9tbClLj9JHzdAHwvabTz3ZLVg+lQ7qfDtQndla6dHZuDJHo/A7geJe/Uc=
X-Received: by 2002:a05:620a:800f:b0:915:40ff:4e10 with SMTP id af79cd13be357-91540ff552dmr582669085a.4.1780162530542;
        Sat, 30 May 2026 10:35:30 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9153244e114sm565606885a.5.2026.05.30.10.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 10:35:30 -0700 (PDT)
From: Joshua Milas <josh.milas@gmail.com>
To: tglx@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	samuel.holland@sifive.com,
	unicorn_wang@outlook.com,
	inochiama@gmail.com,
	daniel.lezcano@linaro.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	liujingqi@lanxincomputing.com,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	dlan@kernel.org,
	chao.wei@sophgo.com,
	anup@brainfault.org
Cc: josh.milas@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	hanguidong02@gmail.com,
	michael.opdenacker@rootcommit.com
Subject: [PATCH v5 RESEND 2/5] arm64: dts: sophgo: add initial Milk-V Duo S board support
Date: Sat, 30 May 2026 13:33:44 -0400
Message-ID: <20260530173347.33533-3-josh.milas@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530173347.33533-1-josh.milas@gmail.com>
References: <20260530173347.33533-1-josh.milas@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_103532_088826_EF7DEB86 
X-CRM114-Status: GOOD (  12.88  )
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

Adds initial arm64 support for the Milk-V Duo S board
[1] making it possible to boot Linux to the command line.

Link: https://milkv.io/duo-s [1]

Signed-off-by: Joshua Milas <josh.milas@gmail.com>
---
 arch/arm64/boot/dts/sophgo/Makefile           |  1 +
 .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 85 +++++++++++++++++++
 2 files changed, 86 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts

diff --git a/arch/arm64/boot/dts/sophgo/Makefile b/arch/arm64/boot/dts/sophgo/Makefile
index 94f52cd7d994b..68aace728223a 100644
--- a/arch/arm64/boot/dts/sophgo/Makefile
+++ b/arch/arm64/boot/dts/sophgo/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-module-01-evb.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-s.dtb
diff --git a/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
new file mode 100644
index 0000000000000..8632470f43ab0
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
@@ -0,0 +1,85 @@
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
+&usb {
+	dr_mode = "host";
+	status = "okay";
+};
+
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
