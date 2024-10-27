Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3271D13569
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Oct 2024 14:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rfgRC+G2GopjhaT0PkBy7V0J9c75wnmCdjWXy/RsWYE=; b=v0yQgloSXaC2ov
	eBoxOZlIwkh+wCnD0A9teqrf0pA7JeJm4mdfX+y6gOhuJ0IxTvT4H7vie6V1Y4UwMlGi09BK/hcaM
	sxy1NNC/j7jiSImKxAMNj2rJLzq6S6Rws7Pejmin9gbn5GqBtNHm/U720Rm07mdpjeq0eP5LEb1qK
	ra5dNcsroeSyhb4yY5l7DLTuSEMI/hVHVcWJc9hfps3l/9sFEs8QRw4IKUU8Z58aZeHXd22DnDLTw
	IymGKl0vftpccf5h7YSqDJlQmE+uMHw3JMqZfZo7ijKwq5uDyFvv0L2FEBau27INpm+PA5FZYNfXQ
	iDtm/7AVklHAuuGYKBKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t54XD-00000008Qub-2QDB;
	Sun, 27 Oct 2024 14:46:27 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t54XA-00000008Qtc-0q2u
	for linux-riscv@lists.infradead.org;
	Sun, 27 Oct 2024 14:46:26 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-71e5a1c9071so2622195b3a.0
        for <linux-riscv@lists.infradead.org>; Sun, 27 Oct 2024 07:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1730040383; x=1730645183; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=paImQxICJubDh0CB6JnawmhEoOa3+oPQD0jlOQSWPcA=;
        b=1apXtN/iuLNkWqpna6uqGntKnzabvysawxZWexlztV1QfzXEqbtHg/WmgDaBL9+Ok6
         oAjlvngPVH9rY74F2v8kHuyUFJu1xVA5IXGeZ59+7ZPQKnsYqVIaEXo9TnX0BIZZDw9+
         PrB0ExwPoOqcLuqmpdJlnztNZeQkFbmZfO9osAvVylQPO+0dQ0hX+aZqITRj0WUDE6Px
         1T91kIUsShUqbq6eu2dOTxiNV20eo98DxQ1qh/kJvLmqxP3Sz9S9WCnVRVSC5GGpXbCO
         VyBGNbYqtM/dxK/KIKTvuQjQVJxdSGpKTJ+lLTJt8DiNBQiCQwfOxpH9aUP2yYDl352i
         F+FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730040383; x=1730645183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=paImQxICJubDh0CB6JnawmhEoOa3+oPQD0jlOQSWPcA=;
        b=HAfVN4kVraFi6kHF9PZIMczQaKpzn/tHAkaQhgAVLoaN5Za0bDjqCOcFo9O8+IDAre
         3k+ZJb5zpA8MQU2DXUFogbU4fbtenRl2GABYvHiJ8Shm24vWyKr25lixfeEjqkDotrMT
         qaaXuEWzzjwcvIZuYNX8kaEhKbZ7IBtMESyIxMJFPJU3+0BRHx2xiMQLMncY8IMJazcw
         AJMjM0cRFBf3qJO1g5U/m/dCSe22+468FZ1W6AWhpzQZyC8vAp0utxqRD2w8z5st/Wc6
         b1w62tk7e39Uc2yN7lHw1pFCdWOxr0+vPyA18vH59+UPQgkWjMAv73VW94UFbbAVMk6A
         EO7A==
X-Forwarded-Encrypted: i=1; AJvYcCU2SV59+PZMOgBKGRa3yvwTpNUatm1RJv4i95evbejMvqKBDY1Awa2y3nnDUBF2lAs/gTEZ4tJGlYGPZw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzY2idLlSf877AJFWuEIeFjfDcZTtM3EwEBAwry+l5kuKcAjnYb
	htRFAoZ1E3LLO5bXui8S+a0YNlBV97weZdkn9qvTvcC88nXoYiNLYei1lTq8umo=
X-Google-Smtp-Source: AGHT+IGrHBHy42UGfdOw8ol8FwKHGgUjeMbRosfEWH1RC9fjIGT2l+bD0MYKbWWAyathH6jUocCy/A==
X-Received: by 2002:a05:6a00:a1d:b0:71e:587d:f268 with SMTP id d2e1a72fcca58-72062f4be8fmr8205821b3a.4.1730040382835;
        Sun, 27 Oct 2024 07:46:22 -0700 (PDT)
Received: from localhost.localdomain ([2a11:3:200::401b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057a0cb06sm4065110b3a.115.2024.10.27.07.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 07:46:22 -0700 (PDT)
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
	Guodong Xu <guodong@riscstar.com>
Subject: [PATCH v6 2/5] riscv: dts: starfive: jh7110-common: move usb0 config to board dts
Date: Sun, 27 Oct 2024 22:44:45 +0800
Message-Id: <20241027144448.1813611-3-guodong@riscstar.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241027144448.1813611-1-guodong@riscstar.com>
References: <20241027144448.1813611-1-guodong@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_074624_259422_ADD2DCF3 
X-CRM114-Status: GOOD (  11.57  )
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
---
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
