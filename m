Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 190E0C61CE7
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jun 2025 00:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q9IkRRAy/0kYH/rOO+5BelgAPWL3l3juSb8gGzIPSfM=; b=QCvH42eaEvNjcG
	g/PB6C7+oAnuiXJ4fuBSsBpZ4x9QGvmo7toqDf3m/A29sG5guCPCbpkUWTmlykIdFxQ8yAtyowNnv
	tahSLKYGVxNMWcN9MVdYwgqAHEWYyO38Eepb29Z5Qxh382Ir87TBkYWPAA9t0kjun3Tz9UZryL3hj
	nzi/HRI0+jqJlh7cQPdM8TCvlGy/upDgUjvnl3nqIwUQZOdLh+UU+SpkqEDxBx6kE5DyFnmn111tK
	nObwKBz6iaNR0nVxsF4Sb3xxBVaPy7jp/5S5yTXghLrOd/JFHIf2RIRiraSpeG7ATW80gL+3jcBB+
	2EAdIBRs89ftN4Y0dW9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOQXD-00000003C66-0KsK;
	Mon, 09 Jun 2025 00:38:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOPT9-000000037fa-3Z6h
	for linux-riscv@bombadil.infradead.org;
	Sun, 08 Jun 2025 23:30:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=iTMiZWOdHSxhmNoMeUDatOOm/HUxNIYFkar2Sv2iSWw=; b=RF6S9vZhEgDcP3iRrVBRLv/zqt
	VD9pL9OQEfEitZPnartVeo6BlzGhh2yGpfAm9ln8XBik2EQAg//Vct8ocGV1UmNZShL7oqNFGmZPD
	yGZmNztP/2fsx+ccNw9ykz/v+r0WJPZPk/0GRKtPRAG9qOwEMPEYNd+Rx3JEQxURUK6/kth2f6shk
	y2s61FHBNnpiUpAhj9LB9X8GSD087G3PrvoF6EINad6nnbSbB9c/YtdAqg6DFSq5t+9fUxWtoyZaN
	eacnJ97XcsflNZuDNOG/LXY00HGuWFAJTc9HHRBEyarfq5AMAPOzvTb/uLgSQ4joxojwx/suxXA1Q
	RzEthwwA==;
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOPT7-00000001XyV-1SCd
	for linux-riscv@lists.infradead.org;
	Sun, 08 Jun 2025 23:30:27 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-6fafc79bca8so45822996d6.1
        for <linux-riscv@lists.infradead.org>; Sun, 08 Jun 2025 16:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749425420; x=1750030220; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iTMiZWOdHSxhmNoMeUDatOOm/HUxNIYFkar2Sv2iSWw=;
        b=GJotfFPXzembJzarW3aJycIIKKmJZalxdV8hgWdSVyyKsEbOVbHrDiyTyZWr/TKsAt
         20T6e4vr1hRJEj8IC5/Wb/Ht1i8k/FnkKoGIf0dCniyMuODGk9yjIBLUqOh9nH9QqI2t
         fmEiI1RH2jfYAFcQKlBqbOFt0f66sOjrGB1n2FUoBd34AAFUHO8YO0L0to3kiezoqfHV
         nHNcgSSclY/Jiaq8AqXVUTQ2FXNQpk4POJMZYhdOMs3iav0Ma9qVSrp9jZuvwKIudT+1
         vURGMkFM1nS6vVzlYiXuW6HSAU14FNhiUMnS3v4QQgLNmrrIHAaU87ESJkeiXzyJiDe7
         JnpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749425420; x=1750030220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iTMiZWOdHSxhmNoMeUDatOOm/HUxNIYFkar2Sv2iSWw=;
        b=YuZuf/Vf+bEvrG8Uxvfb9+63KU9033jBdcVKEXxD2MA24OLjVTWdb0sepQr7qzTl7E
         RjA5MC7tAg3F2vrm7o8GyiiB0tCggn5mMFlnZVVwloYWOQlCUDNS7pOQMnYgjalc/ucg
         fN9BsH3sKQe5evnWM//j1h2Z2zsOrWelMyyBx30minA+vzrthy2O1E8/ZBuT0J9A4UIZ
         q6t7SCkTbZX0UBsSnfkg7/8+PSCZSl039PZTcYUYl5vJP+vLxG6CvtM3UgzoBsLr7iI0
         qPBpE004TXKUkmKb33t9xYYlFTy3toCC69yOHwEInq83YkXIJIrDbQwuzDJ7MRVgGLDJ
         JhOw==
X-Forwarded-Encrypted: i=1; AJvYcCWoDmDeC1R410PvqvkWZdc4Ww4Y7uOiPqhNGcGpE8dBb1vuvQMe+bFRZLoMMbeNmQivgVv0+Rrf9ZlTOQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzF+QPLRlw48Vkvnl6xtPFTfJ9xQ4mgq0A33zUP2xssf6tDDuTu
	48//M1MhpEYrh9r2tmF3s7EgmcTb+kVqQr9J8VUpd7bMESn7qcmSFF6u
X-Gm-Gg: ASbGncsLnJrq0Ablnnf7l1pVAAK5aA2ZJwPPkeed5HQG9xkDmntRjp5w/QXDBEBZ3em
	jU35lUQGJiNPlVHf/qtmaK4wg6/WxSx9DVJ1nmHZRpwk5fhDDksDNfFUJOO36nc9fjaXm0E0kk1
	5yFTjFmjJHgkZfCIUzqiMtw1wfCVkt1ghGrTh8LOaGwTCocBOfR1rnAKRUrsiZHeljo4T8G64Ep
	Da7bWnNZCM/i3nCyBFzTpDVdBCn8rcLdGmUftEwwSXXhRbesTGDzZZu8RR2++HUyOPdiLN6hsEn
	azYwXlT/7ebPuJIkbnRuaIEHciuxc3ILSYSLkA==
X-Google-Smtp-Source: AGHT+IGD9lindtx6ymMs0nT5vWjSjRbMQlERRX74trFsu7rLb4EqGbCLgdn+/nyXchTLQeK+DBIMwQ==
X-Received: by 2002:a05:6214:d02:b0:6fa:cc39:90 with SMTP id 6a1803df08f44-6fb08fcd546mr174099416d6.29.1749425420312;
        Sun, 08 Jun 2025 16:30:20 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb09ab94casm44170066d6.12.2025.06.08.16.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 16:30:20 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Longbin Li <looong.bin@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 11/11] riscv: dts: sophgo: add pwm controller for SG2044
Date: Mon,  9 Jun 2025 07:28:35 +0800
Message-ID: <20250608232836.784737-12-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250608232836.784737-1-inochiama@gmail.com>
References: <20250608232836.784737-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_003025_549804_73AF5821 
X-CRM114-Status: UNSURE (   8.18  )
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

From: Longbin Li <looong.bin@gmail.com>

Add pwm device node for SG2044.

Signed-off-by: Longbin Li <looong.bin@gmail.com>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts |  4 ++++
 arch/riscv/boot/dts/sophgo/sg2044.dtsi               | 10 ++++++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
index 01340f21848f..b50c3a872d8b 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
@@ -63,6 +63,10 @@ mcu: syscon@17 {
 	};
 };
 
+&pwm {
+	status = "okay";
+};
+
 &sd {
 	bus-width = <4>;
 	no-sdio;
diff --git a/arch/riscv/boot/dts/sophgo/sg2044.dtsi b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
index b65e491deb8f..f88cabe75790 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
@@ -347,6 +347,16 @@ portc: gpio-controller@0 {
 			};
 		};
 
+		pwm: pwm@704000c000 {
+			compatible = "sophgo,sg2044-pwm";
+			reg = <0x70 0x4000c000 0x0 0x1000>;
+			#pwm-cells = <3>;
+			clocks = <&clk CLK_GATE_APB_PWM>;
+			clock-names = "apb";
+			resets = <&rst RST_PWM>;
+			status = "disabled";
+		};
+
 		syscon: syscon@7050000000 {
 			compatible = "sophgo,sg2044-top-syscon", "syscon";
 			reg = <0x70 0x50000000 0x0 0x1000>;
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
