Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDB3EC7EE32
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 20:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=leVC3lNKq9GrI8x3a+o37IhB5PAqCXAD/IqVN6J4ZnI=; b=qm/BoxAmTLkxYW
	z28xhCiOLMJluEovX3lIbvEJO+2jp9PydKisfipfhn1zkQ5i4uiBBybG5soJiTDuCE5VpvGyCwXk6
	CT9l838aqAme7znBf4mMASNf3Jqdi7ZWTjRFh5SipCmPikZo2PvJ9Lt9ZhcvQpUcSvrO21oKxbElj
	AxX6TUIbhFP/yVYOyxGrCwUQQtZDiylPy3qABwU4hZ0cP80hvx6phRkT6qj0VjXDtGayTVWSmgXhl
	YRoaVrdB/W5opNiK6gjzI1nt/2sgh4auN7+7/a7bLAhdytosh5uLJqRyhm7ybv6iLHvuincS/j/BJ
	GFUcaMTNhEK+UJKgf6cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUWpe-00000009r35-1n9Z;
	Wed, 25 Jun 2025 20:34:58 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUTBm-00000009Kwq-2fu4
	for linux-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 16:41:35 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-7d098f7bd77so19200185a.0
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jun 2025 09:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750869694; x=1751474494; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihUO+G2zPvFD7djd8+4VxSPuuLI+GNqieXaQtnBxio4=;
        b=h04MjWQYL18X0IlAeuWe1H3TgnJ9sxSGYHpmpOXFVFViN5snRX/9IW17vId13CJwS9
         pSMsBb93t1hx8L049h9K0zbx3Fmkq88TW8HmlfQot0o7Nfg4VlyczR/RgRaxHhgTWZpW
         9xYfv+W8j5JtpgM8Vbw4vtmgye8sIOnoYvx0wJzUezrG0Ll1mhdzTFeopH5CTYphdHyC
         18Npbqs0rHShCeDZzf2wDUQOUSa6FAUDNzxIBhwXYJ8V+Nm7Jsq+UsPy9otvv1Djl/5X
         3z70jfwK5J9ihpmSUACldrXIxejym09xWic+uLvrZTbaF8hoqhdNL4t+fmw46501E4Zn
         +fnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750869694; x=1751474494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihUO+G2zPvFD7djd8+4VxSPuuLI+GNqieXaQtnBxio4=;
        b=Jwdhl3NduRRCsjXrfEEYnfsJNLw7/DKO2zJri5zl7mHMRQiT0LmJaIMCW9yawO+1Tk
         P1noIBmf7906F0ufRPDd69eEgTmX0t5Ok3hmr1sIoSUDYjs7Z3ouOO3w3GS/hkuyWet4
         ToGEJEdWZpykFw2on8lXyinA3t8luitQP/NsH57y1CDwsfxCbStFjxXircsPhog5/so8
         t30aVceRzNSPxak/sgOZbtxNPMv/9Nt/YKVA1p3DvPChLfjn1ul+WPKaRWtT1dD8xR5E
         CDHluOxjVL0WrWeJiFgmphJ1GfJjoO+UmyAeolxI1lwoBJ7ByCfCGFMyItMOlJs7F5/2
         saPQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+nEmGCcg+z5lLktu1gQm/ZRnjuyPQv9aIrprkOQGTvkfe6BtcM1LxNTmrcmmF2VFjVG4aUWrkwI0FNA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyfB+3VrG4e58smBwZqlqerJBsnKMp9+2FurbrCRLZQP8M+AfgR
	ZbqQWfdofK0XXck4nEyuRezbVYgDPqRzTVIongJKpPkCmAsxm7rjiEGQPgUKSzI6bkY=
X-Gm-Gg: ASbGncsfepdn6NzLR7a5S2RNyUvqRQagII8JxUsn9dhIiq6ipWMImayD/s2EuDQsokQ
	bCmocmfODXSYpvgq+BayllLotA47P1uAyJzC7XJkqcmS9TrLQDEk33PTJ/PNvanmYSYuvkpF5BG
	I+LDR8MBR83pmctXH3jNkizF0Db18ENtXoh+4Q7byPkXdgDBo42zO9aOKm8yuega0yJrxzUW58O
	pUn4ImEpRxGPrPJnW/N5xVDk58BKxbxGXYthvGVQVwB5nagxhrPLeEIa/TjAtNqxT78ymOg7J7o
	2gMnNHnbchiMxOl5TnvVZVlZ3vhe35LZWldHAAxOekay00/1ktdQtBqMKs41EZGVO9iFf0C4eHu
	t1sKlA7+GtoduaM4lJk+9rjd8Zt4Xv6axPIQ=
X-Google-Smtp-Source: AGHT+IEBC2FuiYFCeaShYjBDomZFTypEHYThHwPRfGEGQQlsuc51Pdbq0Cxqjxbh0A1N+hYJdQQ/fw==
X-Received: by 2002:a05:620a:1996:b0:7d3:904a:30c5 with SMTP id af79cd13be357-7d43bb7e163mr36774985a.4.1750869693713;
        Wed, 25 Jun 2025 09:41:33 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3ffdb190esm576783085a.86.2025.06.25.09.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 09:41:33 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mat.jonczyk@o2.pl,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 7/7] riscv: dts: spacemit: define regulator constraints
Date: Wed, 25 Jun 2025 11:41:18 -0500
Message-ID: <20250625164119.1068842-8-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250625164119.1068842-1-elder@riscstar.com>
References: <20250625164119.1068842-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_094134_673301_75F94C88 
X-CRM114-Status: UNSURE (   8.81  )
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

Define basic constraints for the regulators in the SpacemiT P1 PMIC,
as implemented in the Banana Pi BPI-F3.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 104 ++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index a1c184b814262..83907cc1d5ccf 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -70,7 +70,111 @@ pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
 		interrupts = <64>;
+		vin-supply = <&reg_vcc_4v>;
 		status = "okay";
+
+		regulators {
+			buck1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck2 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck5 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck6 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			aldo1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+			};
+
+			aldo2 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			aldo3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			aldo4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+			};
+
+			dldo2 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-always-on;
+			};
+
+			dldo5 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo6 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-always-on;
+			};
+
+			dldo7 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+		};
 	};
 };
 
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
