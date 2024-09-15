Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40998C35FE0
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Sep 2024 02:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FW0cY7WrOzO2vW4AGXb9ysRyw9wC9ye3H+7TfA1keK0=; b=Wqads8PNcVRHbZ
	KGvbNPedXx3FS8FSUEa9z+N4MCfdNw+4L+9rk98uTuY97wg96zcakeIMYrFI1H/pv7GUtJL+SdHnK
	yWua3ZEaBnyRE1YLnYWldYz0ZdO4MuFG61hkNNWvGcJGkLaaRz00sOsFNU+07kwv0ooCeRDDuqSAI
	aaN2f5JWEq0GmxL2DCE+92uvMqHrlW+XVnHYB7NnkjkoYQIXguNmq/CuBgTPCmWeWNph2oaZ2fEsN
	ZdzrrsHJ87ZBuzJrHOMesXXBOwg1OrhrG7dcGbSpkYMSb0y83EFxR2TC9Id2D+s6wK87cyqgYq64a
	rBoHTBLAYL+OdCxPW2Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spfEl-00000001WDG-3nBN;
	Sun, 15 Sep 2024 02:43:43 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spfEi-00000001WBc-46lk
	for linux-riscv@lists.infradead.org;
	Sun, 15 Sep 2024 02:43:42 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-6b747f2e2b7so26859107b3.3
        for <linux-riscv@lists.infradead.org>; Sat, 14 Sep 2024 19:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1726368220; x=1726973020; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J/oLJOaGdN8OJwPD6NoJC1cI8myFT/cKMaiS1JkV6LQ=;
        b=Mgj+THigRZbZizuGlXNnTWM8uLO9J9JiqJOaRgrU/Q8/lgA3csLF97ihBl6Co1Ferw
         nKb1X61gLFqWRmwJwA1i7H9YO+AlNnI7zGC21TM0eHc1iCmiOqgkOU5roHRL+WIBGkmH
         lFC3H7t/UwceMJ2leREpE11ET1QgSHi15RM7SM7wfOwUDvfd5R6XxH5dV9YwLJxa8zco
         0q4ZbBm1BKHRRCDN9mj9ETXbcvsWRFDoT+UqYpwRXsYfwpt3npjgD/Sy8ESQZa0VWpK9
         Jp52PW0ARFz3E5mWmFDuxVDoGd2hcNPtITh6C8WA0eUKcaMav1SM0nJA/BOJcqTVgOD2
         eohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726368220; x=1726973020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J/oLJOaGdN8OJwPD6NoJC1cI8myFT/cKMaiS1JkV6LQ=;
        b=uO/jWwE4UVo8ggrum9i8TUnXCCOmFSHHrIgX766OQSRbYpygx9K0vf9/CyBVT5XIAb
         rfFCP+SJhHRmjluJEwGCu0JnzL5cTRTn2+8mxyIAM2Yi0iGlCW/pz41DflBDBi08yeNb
         2Q5RTtHxCfSX/6nx3ihD2f3u3lwjzZ0nHFUlzs9/vJxg2eCwW2BBorFXtFPV0leu8lod
         /VB4/GJDpi9Pm0j+CnNpFkVthbebAbIchSiHXiVxQJ02WDxBbf3qrzkJNM5XGjN7V+iH
         pqWh+XIEQBJJr6kIPJwMYcq1kA5Gber+yrQ9NID16GwRML8vl/ogyxzH09LL2RtlS3G0
         xuqQ==
X-Gm-Message-State: AOJu0YyT5dG1P/10p7veZfPS65fo4yOK79CT+pK7y1mOgLofFl1hOkiv
	tFDo2vw+NutHQ7H3oe/g9f08L/MFbzLuOu7/cgPUDh/FFuoA9hAHjSWrpMEZz0g=
X-Google-Smtp-Source: AGHT+IHgtKYdkQzGTUjtDGDlZx8yYEHu7Pmg82NTgYIWtYxYiQsQ05Cr457i4bcoTnKB0UNQZg8r4Q==
X-Received: by 2002:a05:690c:385:b0:6db:7a8c:6640 with SMTP id 00721157ae682-6dbb6add9f4mr106171627b3.5.1726368219617;
        Sat, 14 Sep 2024 19:43:39 -0700 (PDT)
Received: from [127.0.1.1] ([216.139.163.245])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6dbe2e0d924sm4129097b3.41.2024.09.14.19.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 19:43:39 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Sat, 14 Sep 2024 19:40:54 -0700
Subject: [PATCH v2 6/8] riscv: dts: thead: Add Lichee Pi 4M GPIO line names
MIME-Version: 1.0
Message-Id: <20240914-th1520-pinctrl-v2-6-3ba67dde882c@tenstorrent.com>
References: <20240914-th1520-pinctrl-v2-0-3ba67dde882c@tenstorrent.com>
In-Reply-To: <20240914-th1520-pinctrl-v2-0-3ba67dde882c@tenstorrent.com>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240914_194341_088647_6830B078 
X-CRM114-Status: UNSURE (   7.90  )
X-CRM114-Notice: Please train this message.
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

From: Emil Renner Berthing <emil.renner.berthing@canonical.com>

Add names for the GPIO00-GPIO14 lines of the SO-DIMM module.

Tested-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi    | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
index 530648ad64f6..276f7e8a2c9b 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
@@ -41,6 +41,12 @@ &uart_sclk {
 	clock-frequency = <100000000>;
 };
 
+&aogpio {
+	gpio-line-names = "", "", "",
+			  "GPIO00",
+			  "GPIO04";
+};
+
 &dmac0 {
 	status = "okay";
 };
@@ -60,3 +66,36 @@ &sdio0 {
 	max-frequency = <198000000>;
 	status = "okay";
 };
+
+&gpio0 {
+	gpio-line-names = "", "", "", "", "", "", "", "", "", "",
+			  "", "", "", "", "", "", "", "", "", "",
+			  "", "", "", "",
+			  "GPIO07",
+			  "GPIO08",
+			  "",
+			  "GPIO01",
+			  "GPIO02";
+};
+
+&gpio1 {
+	gpio-line-names = "", "", "",
+			  "GPIO11",
+			  "GPIO12",
+			  "GPIO13",
+			  "GPIO14",
+			  "", "", "", "", "", "", "", "", "", "",
+			  "", "", "", "", "",
+			  "GPIO06";
+};
+
+&gpio2 {
+	gpio-line-names = "GPIO03",
+			  "GPIO05";
+};
+
+&gpio3 {
+	gpio-line-names = "", "",
+			  "GPIO09",
+			  "GPIO10";
+};

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
