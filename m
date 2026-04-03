Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E1DAE7E371
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 11:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fLMDHJjP8vwFKT7IwcViaXmxXOElybv2xfxGt0FiKp4=; b=d7wbkIM15XnY/o
	UcrnVL1Ctb7tG0gBRDGG4fLJmxZDP+Nj5RR34LOaybYVHNlWXHzcSOWyzTdPapvOsn/6bnTeCx94Y
	5D3AusVd4iDPYTTDrLbhGb2b04DPW29VgMwKKytWKuyur+PP4jdP7YFhM259m+n7njKr/GoM373Sg
	qxu/0hxOkGjdFIyJub6yleVTIrdaSXrVFgELPlnLbztr4qrBxn42ixV30zIZi1gWQDta6icS4olJN
	B7fP1R2Fm6+ZxvaidqRPDJaErabzq3tjNXCIWasdRpMiw8/cmaBNKOkIRsh/wn2gS4xRQxotezQiK
	dmW8cEKzvwmNKedSzM9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8cVS-00000001vnY-2KFZ;
	Fri, 03 Apr 2026 11:16:06 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8cVP-00000001vlp-0YdI
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 11:16:04 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-50babbce85fso21307791cf.2
        for <linux-riscv@lists.infradead.org>; Fri, 03 Apr 2026 04:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775214962; x=1775819762; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e1iXfEJhkoJc89mTL/JJu7oRdlYA/T+hX/oQJz+ARaI=;
        b=q6hDTjdWxiCC0sIfPZHxrcj36srOABJWcbSpOyeadgFom5grrCmiKZ4tIJFC1B+omJ
         OKBL55UKSQwWDltURqM9zeYiUIPmF6tWiy4CAfXzspoDiBCiLF+d1trccuD1Pslm8eE9
         MK7wEfTvVIkkBnK5/8NVEMgAU0hxuv2Xz5QKhB4vXz7CsCPXooSiUToMKDA2wHCPP4zN
         RVyk/1mOpuDhIHa9SjHes5lB0lW0HhQtcqYA+To7fbo70TTY2qlnRABnI52gcF5+BQvS
         GEznD2YyxmozlPEBtcRrjmbcLZjJSs8oqqrBFN7tKgKNnsMjNhh50bgZxOoF3QjiMzpS
         +Eug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775214962; x=1775819762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e1iXfEJhkoJc89mTL/JJu7oRdlYA/T+hX/oQJz+ARaI=;
        b=ZCgaDc0Kj3WjDeeI9dFZWY9IdcJ6Pb+qkS8pqUjA6RnS/ebpeLGPkt/LpUiQYg4pOt
         xg7SLThloroj9ho5tc0pe8FxRx27Cq/BAUM95rhmuWc/luLDkzDCIeNESyAXow1gkP53
         m/pgE18UWde9OncuC53ntwQghUPYAzFvQhuej0kg6/IGjpBNsbappwqHZc6HBpc5c9YW
         KCK4xX1iszfNUjoO1ZZsire1Bz5QMKyxDvvvWEQebMwtHvFfC0iSmuU6li17TeI/2lzS
         XTG5oOCqtMVDY0UfdHLVnR/HcvztwD85M5lVejoUT7cLSlKWOfKg9rh+ans3a7USrb13
         VNWQ==
X-Forwarded-Encrypted: i=1; AJvYcCU70BpAnVTVcxMRXUO/MqNq2I+Cn/A7wlIrSD1nLFPO53UlwaGIf6ga0xkKerNoFpEmXSmZeusEDna41g==@lists.infradead.org
X-Gm-Message-State: AOJu0YypVRQ2G7RUiE1+e4vYCtlkGSUWiX8NrTaQ5c+nqmif0ewDdM9W
	B+lygtwFW6gtA3jSkdM4CzvKDzZmDzoiCa1oEdN8LfL74Eh2eMSqvg1i
X-Gm-Gg: ATEYQzyBoVCyMUV5jxqLGgsqhCnb1U0/785FgI3Lva9sZK/2nHO6Ftg+eyGIEN5e1mI
	FrpoxkDUe1jZzk3oNIcbDFtup1iADdvcEFDQRLtOkaexZ2udIDCHdW0z2k5auwwwkfdmJQppSIg
	Keee0hA53BnKf+BjAh+pZgFUj+DxyoCorBQz1C6vPXvIkHipSw5JqT5eq8LF8y+Aiw7McY8tdeA
	3cPPyV2Bli512VCmqVjqUo6kEM8zheGsgTGau2mD54yTe50uwI5bHzf/rXFwzPZsKRyHqXBpY3Q
	s7zEfSfg+dUv9SBK3z91xNrxrT2K1W3pfFAOHNJFy3yRQngW5FbK+JV2lfBU1YIhtpYzpFq/5Jd
	OmzoudymY/xeT2VHleRyI1eCoR2gNqU25a76BVPsd6fl/bKeCSS97hbGznLECDIDw6prXNtIXuk
	qoebfd8Uow1dSpIIsWS29M1YWgB/cy
X-Received: by 2002:a05:622a:244a:b0:509:4342:9980 with SMTP id d75a77b69052e-50d62a3e46amr38156841cf.33.1775214961635;
        Fri, 03 Apr 2026 04:16:01 -0700 (PDT)
Received: from sleek.hsd1.nh.comcast.net ([2603:3005:1473:4000::71a3])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a5974e8e8esm45319836d6.43.2026.04.03.04.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 04:16:01 -0700 (PDT)
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
Subject: [PATCH v5 2/5] arm64: dts: sophgo: add initial Milk-V Duo S board support
Date: Fri,  3 Apr 2026 07:15:13 -0400
Message-ID: <20260403111516.379795-3-josh.milas@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260403111516.379795-1-josh.milas@gmail.com>
References: <20260403111516.379795-1-josh.milas@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_041603_178284_4E3D6C0E 
X-CRM114-Status: GOOD (  12.50  )
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
