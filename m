Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E026ECD342E
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Sep 2024 04:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0DwEc9kk2uas8VHXMfiwk8JQ+6EgwvzRxfNsspXpQHw=; b=mQqsu1zbvLtiZE
	T8JlDQ+MOcYTMLovb+uVOWM29R2S92q+hlxqJi/T/swzN9X/gJhefj4mzelQeW3Ssh1nvFS5a2zQr
	OFyXoCfiPkhiqw76ONQQ35qi7Qdz05MwYg0Nmn7GuXXwBtnaM9gloolWG3Oaz/UyCobMiKluqD4TU
	fsoX72D52cCo67JMi59pQ4DvrfUddIhl1QfaDJUSi+8VPnBvexqwwCjrUIITObhrtifK8dSaLLVo1
	qwvREEv5OhkFec4p4tF09r3BTL3Ca2xpqksOpjHR1JUAU07AbBy69EH8xS4FG1kHnr85gQyiaAQsB
	4+cHPES9Zr3nB3uKWqug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slKqn-0000000GFmn-0BDE;
	Tue, 03 Sep 2024 04:09:05 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slKqi-0000000GFiP-0L0L
	for linux-riscv@lists.infradead.org;
	Tue, 03 Sep 2024 04:09:01 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-70f657cc420so2135591a34.0
        for <linux-riscv@lists.infradead.org>; Mon, 02 Sep 2024 21:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1725336539; x=1725941339; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q35mWPAy5chjBGIgQ12zyoacjaj9qPPf+2nGjCp33vM=;
        b=CAG10+2IOqaVg1HbRdsZjFvDtEojc2fE1aGSGiNrbtcPwNJjPNVQYbd0KX2Xyve0bP
         jAnFbvQKoZ1EW7tHIC2G3WCnzyQ7KAB9JibG4OHDzEsuzBkDtiCO0GlDx6Rv8rh1JOZg
         l56xpAXmRslvwAV0usMtNYLvHwkgk1zQ1THCVyZEB2hMpLdD64oww/UxBGotm9xdC8pn
         Ua7AMeos+BUVNA3zvioAMR31B2qySkD5MHywYYLDVPODhU6Q3xokkoYw/q9b3AI+1jCN
         mk/efN/Qwq6f7fXwMTFnt1HkpE9BMeehhi2SRFuvmy0Whu1ExxQ1IEg9xQN4GwRc9CKB
         HYpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725336539; x=1725941339;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q35mWPAy5chjBGIgQ12zyoacjaj9qPPf+2nGjCp33vM=;
        b=OTgiHb/YhlgcgqV90e7XTt2iiIIKt6xpna/WxPeqoZfnd923rGhZQ/KYW1afJ2s+QM
         mu+EHIMFc9ODa0DP32zJeRo2fG9/5fweDqiXCuUvpZCSQblx4+pd8dsBwZ+5O1YfjiO1
         PpUvXs3/Jai0PajFN85lY6AyQ7C4vukyCiVGMxa3xhJrhfMiCsAFqVRpCr4pPaf5yi7B
         RpQtbd5RWA3wLVfJHKBysJIIA8CBKq7VbFBg/qUxira4oVTWlJDUzgnltoFMFElvwPzN
         jN+L/L9mXPGH+FhYohC9KnRwh6YsN5bAFCGbgEX6iJYxTkJP8dLnfeoETtMTcNtY2c6l
         XaUA==
X-Gm-Message-State: AOJu0YzmHZW57GnGn2rmo93CI7LiW/GXmMRuTn59Xg9TnC0vgyyWlQiw
	VasX9VmcUd6StaJOTl+stzUwrZTh4otAc1TFkAuYcoKhdTC/Vd6x8RvfY5dFWk0=
X-Google-Smtp-Source: AGHT+IG1bv+0Hcu89hJ/iW0ppyWLhDz7hQS9eXP//hut2vcYYD8TEwbZJJXon33WkI7TKADhhCw9MA==
X-Received: by 2002:a05:6358:b00f:b0:1aa:c49e:587d with SMTP id e5c5f4694b2df-1b603c48be2mr1966327055d.18.1725336539064;
        Mon, 02 Sep 2024 21:08:59 -0700 (PDT)
Received: from [127.0.1.1] (75-164-215-68.ptld.qwest.net. [75.164.215.68])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e569ef39sm7532701b3a.122.2024.09.02.21.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 21:08:58 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Mon, 02 Sep 2024 21:07:00 -0700
Subject: [PATCH 7/8] riscv: dts: thead: Add TH1520 pinctrl settings for
 UART0
MIME-Version: 1.0
Message-Id: <20240902-th1520-pinctrl-v1-7-639bf83ef50a@tenstorrent.com>
References: <20240902-th1520-pinctrl-v1-0-639bf83ef50a@tenstorrent.com>
In-Reply-To: <20240902-th1520-pinctrl-v1-0-639bf83ef50a@tenstorrent.com>
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
X-CRM114-CacheID: sfid-20240902_210900_178589_E9ECE46F 
X-CRM114-Status: UNSURE (   9.70  )
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

Add pinctrl settings for UART0 used as the default debug console on
both the Lichee Pi 4A and BeagleV Ahead boards.

Tested-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 26 ++++++++++++++++++++++
 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts  | 26 ++++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index c48f6fd6387b..c5356f674f85 100644
--- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
+++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
@@ -82,6 +82,32 @@ &sdio0 {
 	status = "okay";
 };
 
+&padctrl0_apsys {
+	uart0_pins: uart0-0 {
+		tx-pins {
+			pins = "UART0_TXD";
+			function = "uart";
+			bias-disable;
+			drive-strength = <3>;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+
+		rx-pins {
+			pins = "UART0_RXD";
+			function = "uart";
+			bias-disable;
+			drive-strength = <1>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+	};
+};
+
 &uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pins>;
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
index 0ae2c20d5641..932838c55f90 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
@@ -29,6 +29,32 @@ chosen {
 	};
 };
 
+&padctrl0_apsys {
+	uart0_pins: uart0-0 {
+		tx-pins {
+			pins = "UART0_TXD";
+			function = "uart";
+			bias-disable;
+			drive-strength = <3>;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+
+		rx-pins {
+			pins = "UART0_RXD";
+			function = "uart";
+			bias-disable;
+			drive-strength = <1>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+	};
+};
+
 &uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pins>;
 	status = "okay";
 };

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
