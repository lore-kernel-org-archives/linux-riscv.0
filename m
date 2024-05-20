Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BCEBC25B77
	for <linux-riscv@archiver.kernel.org>; Mon, 20 May 2024 18:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3OWRrtoJWBT7cBLHkEgj4COxIqRhmWCGobHB7MZf+4A=; b=uEnF+p/iM0l7zQ
	FZ0dc2F2XgwOu5v5gAkMFDQ2rrI6aHREvA/ukqniQptvp3gHHTaGsnMJ7ar1LSyV3bpFDi2jDkmJG
	nv5KKBpmRAf2LJl5CUHrmGkGaltgvJoHcTqY1UzNcjaKfQ722W6lNlagWNmZdeXEwPtL5IPOFEQ77
	m5aVJBPUgaKZhxhZTVJSGoCdy269XvGx+LeY96JHxKu3+MTBHbQG6QcBpNqJlFHJlqlOHBoK+uPAp
	G3AZL61SHNgnW9+ZLDm4UWGE8sTY3rvmVm1VLZ0XMRIiMLdkBRAZ83MoSXbceUjXYWRpJX6ZcwE76
	9nvTzJrda/9+RDElmWCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s97ys-0000000FHu6-15Gb;
	Mon, 20 May 2024 18:43:30 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s97yf-0000000FHij-0UL7;
	Mon, 20 May 2024 18:43:21 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-52449b7aa2bso1444413e87.3;
        Mon, 20 May 2024 11:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716230594; x=1716835394; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p0OurAq4gNaktjTguChGRH09zP44yFK+BI9ZEKeRFnI=;
        b=brxcG+qviKdZ5ySKBhmRTN5YK0yYeRPQKikJDuR6S55+IaK6Sx7WzFUvv9bXFibFzq
         bEiobkJBPNh/fjgJ7ZbPlh80snYAXBt+Sbr2HgTE/D8Sr6NrY04VKAbnsdwY6/vbzgbK
         1mCFU9QCppfX5x4XkTlC1Y8XjqJhjlZij9dm0AYL33g4OsYfiHfUMW3YbpLJsldQgQNG
         OXDD9e5zUTitOoZ/sC4eP46Lonx3MXWein1PTVXm1dhfJwm3Remlf6deTMZ91TpILPXc
         KNvz3nIPXvVLtUmCztfPr1LTox/dbR67cPE5CM3UufvWlRw8tEoxtDZPSrD+9IImUuP8
         kPbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716230594; x=1716835394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p0OurAq4gNaktjTguChGRH09zP44yFK+BI9ZEKeRFnI=;
        b=ubZyeMHrsAYnHpJ0OaNAlCxvvwcuLLzf/k2LKyKkf8k7qoAKiPupYsU8sFCqvVGHeJ
         nR5z8aJeIsGYbcqQfmtABTw6B7X5cQm5sfSokxXAMwWYBvRxUuYB+bZKONsmxwMv80CI
         oJ1ClaxzPEVGJbYC1I7bW46Ymhr71IuZEb87YIb0Zku1Mh0Pu/v+v2y8UovrgnGj5y1b
         UYCs5nPmKVrAgGlMZecF6OEItlYBd7gLGn1nYS81ob7yjy0cNPP6l4h3kH2vI7TSZ937
         SU7Mtmm6Xc2Bc6msBKFBCllq+jzfWdLUt8M/qmbw/imGz+N5TpKJ54vje6G5slERwPmZ
         h6IA==
X-Forwarded-Encrypted: i=1; AJvYcCWCJWG/5x4Wb/tafHuYUP5DPldf4Q32PeqxcJP/eNEUWoHPw0inIUOvrcRyzZh3stLyhJ85CT4/WrHC/aQdSKjnwBdrY1i/BB8mFs4ui1fkPMDKTVijO+z2UMLbqKG2eBEq6oueXIBRdVADO5DMDW9yxiXGRac=
X-Gm-Message-State: AOJu0YwrbwP63i9W7TB17Y6cX6F6N+1hN0pFtiQQiDhKU/HUU0fgbC3b
	Q5Emg+9tU2COHwPQKb/1nYaVy4fLwuHxatJitxkRvCxV9XVy3Tk=
X-Google-Smtp-Source: AGHT+IES9MWPihMjZ9PvkU27cNvcpSz1C7H99avkgVPdGIM5+InFmh0mxe8lkpqCAW7BOcWJa45LqQ==
X-Received: by 2002:a05:6512:3a83:b0:51e:7fa6:d59f with SMTP id 2adb3069b0e04-52210074380mr22923108e87.53.1716230593937;
        Mon, 20 May 2024 11:43:13 -0700 (PDT)
Received: from localhost.localdomain ([188.162.49.81])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f38d335csm4368967e87.125.2024.05.20.11.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 11:43:13 -0700 (PDT)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Aleksandr Shubin <privatesub2@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	John Watts <contact@jookia.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Maksim Kiselev <bigunclemax@gmail.com>,
	Cheo Fusi <fusibrandon13@gmail.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v9 3/3] riscv: dts: allwinner: d1: Add pwm node
Date: Mon, 20 May 2024 21:42:21 +0300
Message-Id: <20240520184227.120956-4-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240520184227.120956-1-privatesub2@gmail.com>
References: <20240520184227.120956-1-privatesub2@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_114317_326714_E49E89F4 
X-CRM114-Status: GOOD (  11.23  )
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

D1 and T113s contain a pwm controller with 8 channels.
This controller is supported by the sun20i-pwm driver.

Add a device tree node for it.

Signed-off-by: Aleksandr Shubin <privatesub2@gmail.com>
---
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 5a9d7f5a75b4..22821b21b9a2 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -145,6 +145,18 @@ uart3_pb_pins: uart3-pb-pins {
 			};
 		};
 
+		pwm: pwm@2000c00 {
+			compatible = "allwinner,sun20i-d1-pwm";
+			reg = <0x02000c00 0x400>;
+			clocks = <&ccu CLK_BUS_PWM>,
+				 <&dcxo>,
+				 <&ccu CLK_APB0>;
+			clock-names = "bus", "hosc", "apb";
+			resets = <&ccu RST_BUS_PWM>;
+			status = "disabled";
+			#pwm-cells = <0x3>;
+		};
+
 		ccu: clock-controller@2001000 {
 			compatible = "allwinner,sun20i-d1-ccu";
 			reg = <0x2001000 0x1000>;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
