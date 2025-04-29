Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC997C3ABAB
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Apr 2025 08:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qqa2Fhj2EUUnqJ3sa4QgYt1DZkyIBf5qOSr7t0Ljy0Q=; b=tXMjq6M08+eY5S
	RYNNxdIrpecjiLwarb5AcLSORcLZYI4026uyN9T4v56LTn3e9i6I3CE5HX3GSx1FIs8zmh4xh12Yz
	WnCxUKkuwf5dRSevsvC1wyrg9x0uA9sa5X5xi+lJGXzONRM3yPBNZwQDEO6lnIavc2u6puu0yqUoF
	U+0khIJcTupMmmeiHj9LMfLGRkO0/mEY5V2biSMkFAPpHJj7duw5bKaPc1LASsAkcki0Qhky7gaEs
	Z1HoPabUaCsJb8Q2qTG2buNxSjM/nuFGPDfHYYE4NiPxPmdTWslV0d7uWF/R4uqOO7vEHvbbkB3E8
	9K6jUjPRqIQKJZ0K0apQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9gmX-000000091rW-43Bf;
	Tue, 29 Apr 2025 08:57:37 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9ggt-000000090SV-0Hpw
	for linux-riscv@lists.infradead.org;
	Tue, 29 Apr 2025 08:51:48 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-72d3b48d2ffso5209026b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 29 Apr 2025 01:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745916706; x=1746521506; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kQiOfIT4Y6cd0OqbpS97ZsP9HrOyG2drOaiW2vvWtVw=;
        b=Iq6v5uITTBu37N2X9JHXOMzHjsYkGmYkCj5ddjsioPAuItZyj+TthyCyTUIMrodbKw
         HseTIMqZaYAkUdFjqdgvAnl3g0//KRx+bn0oHQkHXKlBVwrDVVXdNH2bRwqQ/oUY3aoK
         Ymfqc7OdgwPZ6fj5A+8elplyUxO0cBfZ4cLcslSPxpsU6iBZm87AIuSClyw19wzpmprv
         R9xroaf6sXDbzWyviYDefcoDVm0A4FYQSuHyre/QndtKPPkC8gcikwy9D+HXcPtumETV
         L+pz+bt0bTWXa65iDdUnVw6MvJASQIWqwZN4ByFWCrmc44lfT+zRGUfcQ9Hg6CrmtIx9
         t6ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745916706; x=1746521506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kQiOfIT4Y6cd0OqbpS97ZsP9HrOyG2drOaiW2vvWtVw=;
        b=bed0jo7e2ZBIB8Z7PB2Vi1w5ofxpDRoZahlSr8CZuVD0eXe1dN40aSAXYhbuhF9Thj
         eLdg3bVW2oi3P2BRIJ6JaUUc6XlNQeaHQxxOcex0wnz4oefaN4gzAmFcJHC/XhYbyHcr
         /BNf0uDn5ma72scdY171U+PJ5ypDLINZUXnkj5yY/ET0no6Ueelx9CfBw2NvRs+4I2zr
         537y1h32HJr2Bp331ECWuDxo4mH9gkuCC3uen9pG86R803s4WEgaa/nS6zyiQx1+IP4V
         Bfnw5lGEMbF6FkRDQb3oFC53Dn31MV1d5oRQLFQ6BOzBPcCWCswNCJjncfHmZVcSXrsW
         qWHA==
X-Forwarded-Encrypted: i=1; AJvYcCUnZ4hLktabnJL/ruzd3rUwwKzHUD7yB5juUe4oILZGMrOvd9GOqjX/dV4IRbY6xoUvjT0puSUnMoKStA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyPKE/44+bbpOBgHmBKuwiW7+OTGWmF1B3Tboz7O3WGbCseo+QE
	RBOak9riYm/KQYKkCpyj6qtStJHhxxldJ/+P9rHqkOxBEN9cLQVFajlj5jWGIME=
X-Gm-Gg: ASbGnctHzzzz5DrUnWzIx+O1DAWaao5040QdklogWUA9U47iuhRXMV1DB5PsyjGhUqf
	CuhVQ+/F2u/Dm4vf2i79w7xru+J6vLLYcIr1paJGTaDAikqi37fedsyzHmMt+sdfS4UkGc8+NBE
	tPRW0Kw/q2xqBhbokUyL6gMveBmpT5SQjRk+LVP72WWYBTSY7qSIDkoCfYEkArdOioOg9LYsAK7
	ftPQCljIU0gJzUwdqACnpAkJNB8EusBeNBNLRGRakBttIv70m2w36VjUgjPzwqdbZApNjDKdZ0s
	/g6kHMehN8Q/5VaYfT4T/Z7UjrjMOFFHkd12DLFjUFU6XOOzTP8jZvwurkSL5RJj7suTsQ+FLzb
	NvSmNjD0yT/jrG5E=
X-Google-Smtp-Source: AGHT+IGMNd2BwqPorstDPO+7WDARX7h5Gi5J8S+MkMkte/NeVmwAhf3z+Fk/S8vbtM/Sb8c+7Ms4+g==
X-Received: by 2002:a05:6a20:c6c9:b0:1f3:397d:86f1 with SMTP id adf61e73a8af0-2046a56a58cmr15449500637.16.1745916706277;
        Tue, 29 Apr 2025 01:51:46 -0700 (PDT)
Received: from localhost.localdomain (210-61-187-174.hinet-ip.hinet.net. [210.61.187.174])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f8597e0bsm8550119a12.44.2025.04.29.01.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 01:51:45 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org,
	p.zabel@pengutronix.de,
	drew@pdp7.com,
	inochiama@gmail.com,
	geert+renesas@glider.be,
	heylenay@4d2.org,
	tglx@linutronix.de,
	hal.feng@starfivetech.com,
	unicorn_wang@outlook.com,
	duje.mihanovic@skole.hr,
	heikki.krogerus@linux.intel.com
Cc: elder@riscstar.com,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	guodong@riscstar.com
Subject: [PATCH v3 3/6] riscv: dts: spacemit: add PWM support for K1 SoC
Date: Tue, 29 Apr 2025 16:50:45 +0800
Message-ID: <20250429085048.1310409-4-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250429085048.1310409-1-guodong@riscstar.com>
References: <20250429085048.1310409-1-guodong@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_015147_117641_77A1C689 
X-CRM114-Status: UNSURE (   9.38  )
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

The SpacemiT K1 SoC features a PWM controller with 20 independent
channels. Add the corresponding 20 PWM nodes to the device tree.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v3: Changed #pwm-cells from <1> to <3>
v2: Changed compatible string with the fallback marvell,pxa910-pwm

 arch/riscv/boot/dts/spacemit/k1.dtsi | 180 +++++++++++++++++++++++++++
 1 file changed, 180 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index f4afb35dc6bc..99bf7a3f5458 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -580,5 +580,185 @@ sec_uart1: serial@f0612000 {
 			reg-io-width = <4>;
 			status = "reserved"; /* for TEE usage */
 		};
+
+		pwm0: pwm@d401a000 {
+			compatible = "spacemit,k1-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd401a000 0x0 0x10>;
+			#pwm-cells = <3>;
+			clocks = <&syscon_apbc CLK_PWM0>;
+			resets = <&syscon_apbc RESET_PWM0>;
+			status = "disabled";
+		};
+
+		pwm1: pwm@d401a400 {
+			compatible = "spacemit,k1-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd401a400 0x0 0x10>;
+			#pwm-cells = <3>;
+			clocks = <&syscon_apbc CLK_PWM1>;
+			resets = <&syscon_apbc RESET_PWM1>;
+			status = "disabled";
+		};
+
+		pwm2: pwm@d401a800 {
+			compatible = "spacemit,k1-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd401a800 0x0 0x10>;
+			#pwm-cells = <3>;
+			clocks = <&syscon_apbc CLK_PWM2>;
+			resets = <&syscon_apbc RESET_PWM2>;
+			status = "disabled";
+		};
+
+		pwm3: pwm@d401ac00 {
+			compatible = "spacemit,k1-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd401ac00 0x0 0x10>;
+			#pwm-cells = <3>;
+			clocks = <&syscon_apbc CLK_PWM3>;
+			resets = <&syscon_apbc RESET_PWM3>;
+			status = "disabled";
+		};
+
+		pwm4: pwm@d401b000 {
+			compatible = "spacemit,k1-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd401b000 0x0 0x10>;
+			#pwm-cells = <3>;
+			clocks = <&syscon_apbc CLK_PWM4>;
+			resets = <&syscon_apbc RESET_PWM4>;
+			status = "disabled";
+		};
+
+		pwm5: pwm@d401b400 {
+			compatible = "spacemit,k1-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd401b400 0x0 0x10>;
+			#pwm-cells = <3>;
+			clocks = <&syscon_apbc CLK_PWM5>;
+			resets = <&syscon_apbc RESET_PWM5>;
+			status = "disabled";
+		};
+
+		pwm6: pwm@d401b800 {
+			compatible = "spacemit,k1-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd401b800 0x0 0x10>;
+			#pwm-cells = <3>;
+			clocks = <&syscon_apbc CLK_PWM6>;
+			resets = <&syscon_apbc RESET_PWM6>;
+			status = "disabled";
+		};
+
+		pwm7: pwm@d401bc00 {
+			compatible = "spacemit,k1-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd401bc00 0x0 0x10>;
+			#pwm-cells = <3>;
+			clocks = <&syscon_apbc CLK_PWM7>;
+			resets = <&syscon_apbc RESET_PWM7>;
+			status = "disabled";
+		};
+
+		pwm8: pwm@d4020000 {
+			compatible = "spacemit,k1-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd4020000 0x0 0x10>;
+			#pwm-cells = <3>;
+			clocks = <&syscon_apbc CLK_PWM8>;
+			resets = <&syscon_apbc RESET_PWM8>;
+			status = "disabled";
+		};
+
+		pwm9: pwm@d4020400 {
+			compatible = "spacemit,k1-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd4020400 0x0 0x10>;
+			#pwm-cells = <3>;
+			clocks = <&syscon_apbc CLK_PWM9>;
+			resets = <&syscon_apbc RESET_PWM9>;
+			status = "disabled";
+		};
+
+		pwm10: pwm@d4020800 {
+			compatible = "spacemit,k1-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd4020800 0x0 0x10>;
+			#pwm-cells = <3>;
+			clocks = <&syscon_apbc CLK_PWM10>;
+			resets = <&syscon_apbc RESET_PWM10>;
+			status = "disabled";
+		};
+
+		pwm11: pwm@d4020c00 {
+			compatible = "spacemit,k1-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd4020c00 0x0 0x10>;
+			#pwm-cells = <3>;
+			clocks = <&syscon_apbc CLK_PWM11>;
+			resets = <&syscon_apbc RESET_PWM11>;
+			status = "disabled";
+		};
+
+		pwm12: pwm@d4021000 {
+			compatible = "spacemit,k1-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd4021000 0x0 0x10>;
+			#pwm-cells = <3>;
+			clocks = <&syscon_apbc CLK_PWM12>;
+			resets = <&syscon_apbc RESET_PWM12>;
+			status = "disabled";
+		};
+
+		pwm13: pwm@d4021400 {
+			compatible = "spacemit,k1-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd4021400 0x0 0x10>;
+			#pwm-cells = <3>;
+			clocks = <&syscon_apbc CLK_PWM13>;
+			resets = <&syscon_apbc RESET_PWM13>;
+			status = "disabled";
+		};
+
+		pwm14: pwm@d4021800 {
+			compatible = "spacemit,k1-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd4021800 0x0 0x10>;
+			#pwm-cells = <3>;
+			clocks = <&syscon_apbc CLK_PWM14>;
+			resets = <&syscon_apbc RESET_PWM14>;
+			status = "disabled";
+		};
+
+		pwm15: pwm@d4021c00 {
+			compatible = "spacemit,k1-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd4021c00 0x0 0x10>;
+			#pwm-cells = <3>;
+			clocks = <&syscon_apbc CLK_PWM15>;
+			resets = <&syscon_apbc RESET_PWM15>;
+			status = "disabled";
+		};
+
+		pwm16: pwm@d4022000 {
+			compatible = "spacemit,k1-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd4022000 0x0 0x10>;
+			#pwm-cells = <3>;
+			clocks = <&syscon_apbc CLK_PWM16>;
+			resets = <&syscon_apbc RESET_PWM16>;
+			status = "disabled";
+		};
+
+		pwm17: pwm@d4022400 {
+			compatible = "spacemit,k1-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd4022400 0x0 0x10>;
+			#pwm-cells = <3>;
+			clocks = <&syscon_apbc CLK_PWM17>;
+			resets = <&syscon_apbc RESET_PWM17>;
+			status = "disabled";
+		};
+
+		pwm18: pwm@d4022800 {
+			compatible = "spacemit,k1-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd4022800 0x0 0x10>;
+			#pwm-cells = <3>;
+			clocks = <&syscon_apbc CLK_PWM18>;
+			resets = <&syscon_apbc RESET_PWM18>;
+			status = "disabled";
+		};
+
+		pwm19: pwm@d4022c00 {
+			compatible = "spacemit,k1-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd4022c00 0x0 0x10>;
+			#pwm-cells = <3>;
+			clocks = <&syscon_apbc CLK_PWM19>;
+			resets = <&syscon_apbc RESET_PWM19>;
+			status = "disabled";
+		};
 	};
 };
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
