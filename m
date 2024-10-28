Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD06ED13599
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Oct 2024 08:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pCwXTk/omVDe1M6PdB/HaWp7lMHv95FvmhZoDmMmJv8=; b=eWfLdUA64ooVqM
	Q3oyTg0Z0p4w9WKngYh2RLI41ZyKNR2tBxGayF+QZQLVnoQIxv404exy2HpODJtkOB03aPMz6yQsc
	CKYIfnL/YOxA7+Gp1dd5v2+DQrBpEz3PgaO3xpYY6Md4nQozMnFepr9zMu62NpSv8NjjNELw9jUYV
	hJqZIoyiST6tDz3cjAKS56EcFpsHq402MkQGgLaH2slUcA4OKwflwF3oHRN95dvBPP9MSzI1yGKBT
	2lrbtlrgbX0o7b6FdxP82JIx5MTuQGTOhjYmZxgkn22CGHHa2Ecr2n0srjaCsLGID1eUg7NCfiGM3
	UrFV3YVYpTbk4sTGINlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5L7I-0000000A5fU-3AxN;
	Mon, 28 Oct 2024 08:28:48 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5L6T-0000000A5Qy-1NbZ
	for linux-riscv@lists.infradead.org;
	Mon, 28 Oct 2024 08:27:58 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-7eda47b7343so2492552a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 28 Oct 2024 01:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1730104076; x=1730708876; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=48dfn7mu6W2OgtVA3beq5tOxjI4KGJ1Pme7qMOmIz6I=;
        b=jpcQXuCwUtN4tPhQrd3tmiOJsqALd9fPNerD16lN2Qatpt9qD93bDRW292fwRS8g+X
         6bhGEZSVWzdHHcsM1ancId7ZOgnwWhQ39XQgD7LwxAsecCvZRHygkyVvhJ2mM5cUPTbf
         3GQwUSPllssAjQyOuctb3G6BpujxWZhiqtlHs8/FuDJZfk8WpSTLl6kzvA5xBcGJyc65
         /x9VVtpuTRyxh0mWjoEZcq9tjWXvCgo+RO8hWkhSuqjv7eJTHTj9Sz9QyMoxcad6yoAT
         sXPy7yVOGpMfvhg/ZkQeEWOxBhOVPZ3re9maAGX3Zb8UErqFh6ESSUTA4FCChOdl8ypX
         ZDEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730104076; x=1730708876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=48dfn7mu6W2OgtVA3beq5tOxjI4KGJ1Pme7qMOmIz6I=;
        b=VCQw5zfmWjHcfTkxW6y3X5anCpbf0jrKmMb7BwdXzbnqu0hBSydD2amXBg2NVjLeho
         Fxq6GRUE8kCua6VLiwBS7VWzrkvTIJcwXCxC46z3mpEjKOIurcRcyOjM+M7JIchoRRcL
         7tPlS4chpYl56DBi8CVxTjC2WlxFR/FP4ZgwZmfAgnwqAYZxRt5PqRMWYeJsTnFdrpQG
         8EgsJr4KGHdtM5qVIQkw4ONFqVJbCk80MqDldVjjvSK3+aNno1BGbV/cHP4LrVG19XTW
         4ACadaxLiu2Madt/sFHIonozN6GnSOFdiTxsVcvOidnJQ/5oIXt7/4CwEWAjMzS4hcqn
         pFxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZ7swjMRpNRQDysAPPOgMfVKMIHHO57o4kJyW+cD1S+fADXmQkEZmvtOnYE7D9/wPiK2P+koll9NDsPQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwspLzu6m46Yc9wFuP2QRQSB532+OPb/7qHFHVSQAtm2OXE3d05
	Br/iNVpfpyDma2PCsMLeaU3nOvtvsffWxBiLO8oI6JZXEBRbahNsLwKr/hJ78K1VimjGRgaRObj
	jLOtAOTvL
X-Google-Smtp-Source: AGHT+IE8wn9dwa54k3OBS56nEWQqTVNnYe9nbyioaN5RXlYbjJE50o6vpy5ntxzVz9U0L90dN0x4Gg==
X-Received: by 2002:a05:6a20:d809:b0:1d9:2659:5db1 with SMTP id adf61e73a8af0-1d9a83da862mr10079042637.19.1730104076321;
        Mon, 28 Oct 2024 01:27:56 -0700 (PDT)
Received: from localhost.localdomain ([2a11:3:200::401b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7205791e451sm5195419b3a.24.2024.10.28.01.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 01:27:56 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	rafal@milecki.pl,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Michael Zhu <michael.zhu@starfivetech.com>,
	Drew Fustini <drew@beagleboard.org>,
	Alexandru Stan <ams@frame.work>,
	Daniel Schaefer <dhs@frame.work>,
	Sandie Cao <sandie.cao@deepcomputing.io>,
	Yuning Liang <yuning.liang@deepcomputing.io>,
	Huiming Qiu <huiming.qiu@deepcomputing.io>,
	Alex Elder <elder@riscstar.com>,
	linux@frame.work,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guodong Xu <guodong@riscstar.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: [PATCH v7 2/5] riscv: dts: starfive: jh7110-common: move usb0 config to board dts
Date: Mon, 28 Oct 2024 16:25:50 +0800
Message-Id: <20241028082553.1989797-3-guodong@riscstar.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241028082553.1989797-1-guodong@riscstar.com>
References: <20241028082553.1989797-1-guodong@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_012757_391685_F73AF099 
X-CRM114-Status: GOOD (  11.21  )
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

The JH7110 USB0 can operate as a dual-role USB device.  Different
boards can have different configuration.

For all current boards this device operates in peripheral mode, but
on a new board this operates in host mode.  This property will no
longer be common, so define the "dr_mode" property in the board files
rather than in the common DTSI file.

Signed-off-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
v7: Add Emil's Reviewed-by
v6: New patch

 arch/riscv/boot/dts/starfive/jh7110-common.dtsi              | 5 -----
 arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts           | 5 +++++
 arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts        | 5 +++++
 .../boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi      | 5 +++++
 4 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
index 9e77f79ec162..87ea81e9fed4 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
@@ -637,11 +637,6 @@ &uart0 {
 	status = "okay";
 };
 
-&usb0 {
-	dr_mode = "peripheral";
-	status = "okay";
-};
-
 &U74_1 {
 	cpu-supply = <&vdd_cpu>;
 };
diff --git a/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts b/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
index 66ad3eb2fd66..0d248b671d4b 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
+++ b/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
@@ -52,3 +52,8 @@ &pwmdac {
 &spi0 {
 	status = "okay";
 };
+
+&usb0 {
+	dr_mode = "peripheral";
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts b/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
index dbc8612b8464..d5180c67ac55 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
+++ b/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
@@ -80,3 +80,8 @@ &pwmdac {
 &spi0 {
 	status = "okay";
 };
+
+&usb0 {
+	dr_mode = "peripheral";
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
index ef93a394bb2f..5f14afb2c24d 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
@@ -60,3 +60,8 @@ &pwmdac {
 &spi0 {
 	status = "okay";
 };
+
+&usb0 {
+	dr_mode = "peripheral";
+	status = "okay";
+};
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
