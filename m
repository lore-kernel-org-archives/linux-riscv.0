Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2310C35FE0
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Sep 2024 02:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0DwEc9kk2uas8VHXMfiwk8JQ+6EgwvzRxfNsspXpQHw=; b=Oa3vyXx/3BJzEn
	7Dy4z5t6nIwzYRVykkB40jqGzKnh/TDiHIpcDcXDWx2p8wZBKUtBxYXKzFTbGKnKy46pe9iTHDxkU
	UJq+YkScZHybWAqf2OEG324e/G8Tf8RU7tF2a650cbMVB/uhd4u+MEOeT/oRudBjXFA0fSzavLbUN
	1DeF9nngFi0GSvuVUq+O9JaWy6cA4c50GXTzaBn1oiEzOrrBJ3Vaf35qTBk4AxVtwMfbfCn9/7Bgh
	p6v33aGdl4J7VpnErtIpof4b2S8o1MyZ6A8/o2IXMl8zBjaOXo5UAV+f6vw/I4IeOn7vBB2vvdHSQ
	JnnQiA42G1LC/gQcyEZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spfF5-00000001WLH-08OB;
	Sun, 15 Sep 2024 02:44:03 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spfF2-00000001WKK-22Sb
	for linux-riscv@lists.infradead.org;
	Sun, 15 Sep 2024 02:44:01 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-6dbb24ee34dso30889707b3.2
        for <linux-riscv@lists.infradead.org>; Sat, 14 Sep 2024 19:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1726368239; x=1726973039; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q35mWPAy5chjBGIgQ12zyoacjaj9qPPf+2nGjCp33vM=;
        b=AImMhzqqndkB8qn1b9Jwkg4fx9CCw/b3aUZq8bNeZOiRSF3LmRVq6EzUrNmy+N4g2X
         Kcsc8HLzggrJDOREd9iooaQwIGFcyTmR+SRUEr5nauOUO4X1dzs1FGQveXUu80cZ0EMk
         Cd4zRdXn31d7zxpAk2J5BOzPGyoLsrFnuJFt3e2jX9AePSxEf24ABXjUI111t5bfQP69
         GKlqt4W6QkzaQ+65X2nCmb085vmWmqF4bx5jjHuInSqeRvjnyDUsBn4TAT7S6XGhuJuR
         3ZKiyhG6KPOXPRsGY3M1QhH/B/fNSO9rmkBQl6lSo4Nbkm+FiFNqyn6lvuaojzZuKuwL
         VQYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726368239; x=1726973039;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q35mWPAy5chjBGIgQ12zyoacjaj9qPPf+2nGjCp33vM=;
        b=DPpRaJBm2WK4geBuT/KkhTtCujcR+9SJi6nFHkNdecqlKADOj6lMlukf/VWpGCWXaS
         J0Y9oddaGIUixw2cQsFL+lICTkzA0/w8oPtNt0lejdl5FWKgt/V28Kur6iTCTuYgo3tL
         LjbMXwr0ekpKcIpC3W7z+CPhwVTuzOsL6Qh4hCJ79IQeyrrIWVRgDW5tmvX9YfPubEac
         LVOWb9jErWmdY4i/eju+CmlKgNTuAA0FOG6whXQkkZs2ydAYIO06C5ilMpR/w+ty2jEh
         XpZVuj7IVbmphUPgdicaLa4e1ZMHYqEapYk9ztTxxumytqvFrBq0O8Rqx56p2N695Vp5
         liQg==
X-Gm-Message-State: AOJu0YxaDLcn6D07EsdeL1obAnyF8EWHQNzVJfKvcccYB6PZUlnmodVo
	1gIR7BzaTcGpZzLLHT/dR2QNeYVCBXmtMUvCw29uiOC9tc0Ry1XCijfmeWnkQzY=
X-Google-Smtp-Source: AGHT+IHbfE86FpqgLsLA2mWbe3GEJAIVOslJn/4hA8axLKg+UUrOPeCOEEOUG68yn+6Frv8Na+Js4g==
X-Received: by 2002:a05:690c:113:b0:6bd:8b0a:98e8 with SMTP id 00721157ae682-6dbb6b390f7mr106869937b3.24.1726368239202;
        Sat, 14 Sep 2024 19:43:59 -0700 (PDT)
Received: from [127.0.1.1] ([216.139.163.245])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6dbe2e0d924sm4129097b3.41.2024.09.14.19.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 19:43:58 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Sat, 14 Sep 2024 19:40:55 -0700
Subject: [PATCH v2 7/8] riscv: dts: thead: Add TH1520 pinctrl settings for
 UART0
MIME-Version: 1.0
Message-Id: <20240914-th1520-pinctrl-v2-7-3ba67dde882c@tenstorrent.com>
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
X-CRM114-CacheID: sfid-20240914_194400_568475_E242B43C 
X-CRM114-Status: UNSURE (   9.24  )
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
