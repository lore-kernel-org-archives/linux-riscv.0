Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9749C3600D
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 14:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ihr3mGAx4AT/fUZPvKayfagpBmgFKvR7hDUJVv4inP0=; b=ArHYVxjh9zeTyC
	ao7apCm/g7MEYscouXgvP5fRJCi/FmCOQB9vbFd39gbWQrHKSY+45WaJGoZ1dkGklWQYhA34NC1V2
	QrAgy2tE3z8q4rgZBygFJ+AQRxCZZ2JqyVtCaipKhnKjWzKcdCakG/TjaIkhrHt2VXbHxb7frG8CX
	wEuk/vSeHPw8DldnDYNnBiNIsbmyBWtY/itYQGsYYWw22pjzmkM6NmP4iHYp7ypglyfcYm2Rx3/4x
	UBqY/pvBtx6L/EhlvDycrdMCK26ZVgAegX9dtN5s11k/N6ll3yNyyI+Tlh5b0L2ERnZEBwyebvek8
	E4RR5ZTzEellzSrHVEJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx532-00000006AJa-3aYB;
	Tue, 25 Mar 2025 14:14:32 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx51u-00000006ABJ-1VgS
	for linux-riscv@lists.infradead.org;
	Tue, 25 Mar 2025 14:13:23 +0000
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id F017A3F5B0
	for <linux-riscv@lists.infradead.org>; Tue, 25 Mar 2025 14:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1742912000;
	bh=z1YltY4DUAOKhOrYaqFTN+9X4KCj1NX0eIOCMrmZPFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=VRQ/WX07mBY23E0fx93TOf8vZSBjL8vhTMAU+CNApROUEmn9842UKPTMIEnFzh9PP
	 fVz5Vq/6NYPe2/w6DvGONwBAqFK1BraUzCgfevO2FkgXNddFiP0Mwg38xdwDJAmE7M
	 Q4XAB92yL2b8sFPbAvBkqzrxKbscQL1ToRzGUxYL4wLhhFMy3TovNpOoNX2A4uq02D
	 Ra4DPvP6kc+uyNL/aVbRWsLv9jNbeY7OBP1qCTL9HFRnuuGLnt3JatpIUWu9UQrMCv
	 R1KqSguYPalSI+9MDqpRwxZk0DFTrTzg5zRsIpruIc37efWzE2Dn8UlHt5HIivjKsJ
	 Y8yTW+YSTla0Q==
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39141ffa913so2915339f8f.2
        for <linux-riscv@lists.infradead.org>; Tue, 25 Mar 2025 07:13:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742911999; x=1743516799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z1YltY4DUAOKhOrYaqFTN+9X4KCj1NX0eIOCMrmZPFU=;
        b=T0wYSJh1ej6K+VVgx2Ol2sgs7zcJDDCdcWVAzUAxWyhX9Ql5zzSatpRwhUWQFUIHAb
         0oDM/ORIONZo6xBc258fK3HApB9pFDQYlrbRK/VrREZA7B8owcaI17HQIaY3eYNLhrdc
         LfM7Au0z5KQpfYEqUjUH52MOvenVXDy9ntH555h6ypFDPy5nN3JB26PFe2xbx+XdRAfL
         jsFndFBdpyuFGgDxS9VFAFZt2+A6lctzXU7b0oatvWagcXaGXiOL32SNFIrblOuw/GGv
         xkIhXYIXp5TlX/BRFRl/QSzqW7z/UgDfILberlUKWZoBIf/9zIpc5Nyv2n823ip19JQM
         AgXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEQh9YinLgbAvGJkkpcfq5NoUuRV8KY1uYYuS8eiZQDwSwvDhJDgGNgdvZY2rLp3HmYltHGAY7bhZrdQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwAquwQenmHiMQVACrGLrZq6qocEZ9A0HMe8/V/RvIG8uxxIdzM
	XzmrC42eEwIFnmlNrdJBjQwtzDDG1fU+rM/ot82CLiWHKKhdFUGqK9TY0igtWmqtPbdNuvNYSMR
	UBESQf8hdLy92l6AqSm6MFrzb3XT+RD7bemziNNQijxkS6aHsSLva7p8FzL5r/7kABLbWD7OYyl
	8yGHacrQ==
X-Gm-Gg: ASbGncuQFUalVpD/TSeiOSg/grCqDl1qXJ2vZqeky/PxozU2UGOJ189J954kQY8HVc/
	D8EveaGw2TdkJfcrI4EOLxXiwO3oUlJJYslVDZE9L2UjVs5yUlfCas3DPRupMRpKMOuECnHDHZ8
	/Dt5B7Q2fP5M2tvnygYNOKnWcG55ZJwbxvuhb5XfE+aLz50wYd13PDkznjOcLwbYr7Ofvg/8LZo
	atP1bxnK3NB5h+LxjsNSYbPhbjeJrAgBCpXFFnnxvrbrL4YH4Yrl435jdnlhjYARsHzrK6NTP+3
	Vg0hUwr0X2b1XQKi6OGNSBx3grHoKg==
X-Received: by 2002:a5d:64c3:0:b0:391:4bcb:828f with SMTP id ffacd0b85a97d-3997f903714mr13947098f8f.14.1742911999492;
        Tue, 25 Mar 2025 07:13:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHI6KEgZoCtSliU6E0BwKfVc69vn7sSR/m3U6awSJRdbl6af8gLXmNSZGr1/IgpSiG8Z6CDew==
X-Received: by 2002:a5d:64c3:0:b0:391:4bcb:828f with SMTP id ffacd0b85a97d-3997f903714mr13947058f8f.14.1742911999075;
        Tue, 25 Mar 2025 07:13:19 -0700 (PDT)
Received: from stitch.. ([80.71.142.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9a6326sm13532091f8f.29.2025.03.25.07.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 07:13:18 -0700 (PDT)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Min Lin <linmin@eswincomputing.com>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [RFC PATCH 4/4] riscv: dts: eswin: Add HiFive Premier UART pin control
Date: Tue, 25 Mar 2025 15:13:06 +0100
Message-ID: <20250325141311.758787-5-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250325141311.758787-1-emil.renner.berthing@canonical.com>
References: <20250325141311.758787-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_071322_525364_BBF6E77B 
X-CRM114-Status: GOOD (  10.12  )
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

Add pin control for UART0 and UART2 in the HiFive Premier P550 device
tree.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 .../dts/eswin/eic7700-hifive-premier-p550.dts | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
index 131ed1fc6b2e..c278695dcb2d 100644
--- a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
+++ b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
@@ -20,10 +20,56 @@ chosen {
 	};
 };
 
+&pinctrl {
+	uart0_pins: uart0-0 {
+		tx-pins {
+			pins = "UART0_TX";
+			function = "uart";
+			bias-disable;
+			drive-strength-microamp = <6700>;
+			input-disable;
+			input-schmitt-disable;
+		};
+
+		rx-pins {
+			pins = "UART0_RX";
+			function = "uart";
+			bias-disable;
+			drive-strength-microamp = <6700>;
+			input-enable;
+			input-schmitt-disable;
+		};
+	};
+
+	uart2_pins: uart2-0 {
+		tx-pins {
+			pins = "UART2_TX";
+			function = "uart";
+			bias-disable;
+			drive-strength-microamp = <6700>;
+			input-disable;
+			input-schmitt-disable;
+		};
+
+		rx-pins {
+			pins = "UART2_RX";
+			function = "uart";
+			bias-disable;
+			drive-strength-microamp = <6700>;
+			input-enable;
+			input-schmitt-disable;
+		};
+	};
+};
+
 &uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pins>;
 	status = "okay";
 };
 
 &uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart2_pins>;
 	status = "okay";
 };
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
