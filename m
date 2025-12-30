Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC91EEE020B
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 15:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tOrxabX3Yu1NeeXO6WxnDZ5GXK/pedRUIOUIU54fj/0=; b=E7RG7ESqtY72Xq
	uwQgay0MpPhbho2PuVnmQ/H6JTYSyii/R0zhlKw7cjPDYNbjq06Zl4wMJpeNkzsTlhcXlJ43tvCHi
	+774R0rpkYNzMYux+kHKLrtn925m257ReHGX9qkvwWn1cQM41bA2GnfYY8EUUeqJc6JYvniG3dTYn
	CB0NQ48z354p3RQ7kXd1+b41ygP2gM65ktd3gqBIxwF/Lw+Y3VRowSUcUhoLE109unX6WFXix44SS
	nxYGfIgCXbSr8s48QqsGsI+vTZRqJPEklfJh3BVKGHq+7U+2XeE0R1q5BgXlY8MO/mrtzMxZb2TlB
	hClKkoIXgz9kFSBgxCYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vabLU-00000004z30-2Sa0;
	Tue, 30 Dec 2025 15:09:12 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vabLQ-00000004z2D-07RC
	for linux-riscv@lists.infradead.org;
	Tue, 30 Dec 2025 15:09:10 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7f651586be1so4803146b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 30 Dec 2025 07:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767107347; x=1767712147; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iQyulCdMEn71nJJi5suWbUyY4Ki6WEPbytXA1NTokyU=;
        b=Botaiuzmp5UJmTKW3WANM2IfiL/4+rzHJk8M7XK+sEJBv0CCSb1cHq/aQe40bbnEqO
         5Td6zM05i7JjpqBjH7dQfPflt9y0Kd2FRnSC2y2bBFwhiScQgeWPBOA6qjr1lJidCa5B
         J1R9t/bstWOZpo8razylDmEQR2Jd60TctoQENpnFADQICZInm4Az2EG8kTkQX1eF6gva
         UMHttBcJsrs9b9/i52ltsrTDKNZrAd19fQ7hUVAr0dsH7Zcs3njkL/q36y4SvXhTMCXk
         q2epxVQjndm8XNO81vf+C+AcUXNXgUzG+wtnaUlj1tPNd87hQdKKwgpwNMngtJKZlzi1
         FGwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767107347; x=1767712147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iQyulCdMEn71nJJi5suWbUyY4Ki6WEPbytXA1NTokyU=;
        b=lyi43VJN/chGd2V7bfkMuS1Up9zJWkRHj7ssZ6HdexVKpGfbqdl4ntdNbf3Pf64enZ
         cDZ8ELxmWw/t9W9K0tu792PHSf5zJWJmt4L4BoTgwTRkKbVIPD/ictypDfsBqmiJF5Es
         3sq4yM27+fUTNOwpvcTK7jGFWNPZ+SAbQ/eaychV1FAu7fRsW0yHjVnf0xIYhwgt6rBD
         goEdncFyznHDfIR69olPJL6HdUBMBsk1r+DdhFmpuFfIRjxdbJQz1lPclyvsFTAhIhaz
         3VfJnKMR4m5Kyw2ooLOFx5zxyvtBzhNY/LZaRvqDtwd3UNTvtN7tkgFP0CdHbF+6fc+d
         YxYw==
X-Forwarded-Encrypted: i=1; AJvYcCWUsdR83WUM/yMJAqxC1+ISNkGXb/HR4Ot4NdIeBj2hCOSVkS9wDXYJYMmJZZRBFQwjtzN6YWovXnvB/A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwXnapYqdpe5OX+0IdR9bx5pA76x50Kgs7F/60fjcA2kFHjm3DV
	zka1sO947IyPoxxVULjnQt/Q6BaQZ4PodiOVGEDTjCcB+mULyBRrarEZ
X-Gm-Gg: AY/fxX5qzM485kEeH0hhDNYDImlTGS4hjg4gIYSpN92nlDToRsZa7XZQYiqJe3IZjv3
	cVLm7xPJsKn2wV5e2Kk1yv1WdaPzd6EpNSGdBD64DgDlBs614feV3TxjiAXh1z4WtNK/NshnFhI
	bVWwAlKvjZnKyl6FsmEYpRaIPjTnYY4M5j4Amq1rySyiaiV8u/D3USplw8sFGu5XNGo1Ao4yC0i
	A+YcEbjJR9qFWwOA6eDmX/n99qcp4+eVRi8XSLfj09+uDpjjCS8JbKVwWdD0nZcgUA5ZT2dDoSR
	xlKHq5WYG4dhI9IyhXjoSEiluDh5VaAZtKpEd2hMz8LJhaeB2zO/qkfWECKZMr5naFHomfJpueU
	2N3dU+99v8dFCGMpjtSJ2QPJX8R8dOO0tFtZEg7ESBtHJ14QsbBMiKXCCm38ZI9X4fcvKGuyPX+
	nw5r/s
X-Google-Smtp-Source: AGHT+IF60EB1pg13UduiDmMbSYai3+Ff4fdDR7O5w/Nphtaxj7bPzVcEc8NOzQFNo0ngkbP5FlHkEw==
X-Received: by 2002:a05:6a00:3404:b0:7f6:faf4:d7e5 with SMTP id d2e1a72fcca58-7ff54beaa48mr30331057b3a.23.1767107346590;
        Tue, 30 Dec 2025 07:09:06 -0800 (PST)
Received: from localhost ([211.94.234.112])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e48f3d7sm32981085b3a.51.2025.12.30.07.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 07:09:06 -0800 (PST)
From: Encrow Thorne <jyc0019@gmail.com>
To: jyc0019@gmail.com
Cc: alex@ghiti.fr,
	andi.shyti@kernel.org,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dlan@gentoo.org,
	guodong@riscstar.com,
	krzk+dt@kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	p.zabel@pengutronix.de,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robh@kernel.org,
	spacemit@lists.linux.dev,
	troy.mitchell@linux.spacemit.com,
	troymitchell988@gmail.com
Subject: [PATCH 3/3] riscv: dts: spacemit: add reset property
Date: Tue, 30 Dec 2025 23:06:53 +0800
Message-Id: <20251230150653.42097-3-jyc0019@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251230150653.42097-1-jyc0019@gmail.com>
References: <20251230-i2c-reset-v3-0-7500eb93b06e@gmail.com>
 <20251230150653.42097-1-jyc0019@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_070908_088125_62909B3D 
X-CRM114-Status: UNSURE (   6.90  )
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

Add resets property to K1 I2C node.
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 7818ca4979b6..085987643638 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -367,6 +367,7 @@ i2c0: i2c@d4010800 {
 				 <&syscon_apbc CLK_TWSI0_BUS>;
 			clock-names = "func", "bus";
 			clock-frequency = <400000>;
+			resets = <&syscon_apbc RESET_TWSI0>;
 			interrupts = <36>;
 			status = "disabled";
 		};
@@ -380,6 +381,7 @@ i2c1: i2c@d4011000 {
 				 <&syscon_apbc CLK_TWSI1_BUS>;
 			clock-names = "func", "bus";
 			clock-frequency = <400000>;
+			resets = <&syscon_apbc RESET_TWSI1>;
 			interrupts = <37>;
 			status = "disabled";
 		};
@@ -393,6 +395,7 @@ i2c2: i2c@d4012000 {
 				 <&syscon_apbc CLK_TWSI2_BUS>;
 			clock-names = "func", "bus";
 			clock-frequency = <400000>;
+			resets = <&syscon_apbc RESET_TWSI2>;
 			interrupts = <38>;
 			status = "disabled";
 		};
@@ -406,6 +409,7 @@ i2c4: i2c@d4012800 {
 				 <&syscon_apbc CLK_TWSI4_BUS>;
 			clock-names = "func", "bus";
 			clock-frequency = <400000>;
+			resets = <&syscon_apbc RESET_TWSI4>;
 			interrupts = <40>;
 			status = "disabled";
 		};
@@ -419,6 +423,7 @@ i2c5: i2c@d4013800 {
 				 <&syscon_apbc CLK_TWSI5_BUS>;
 			clock-names = "func", "bus";
 			clock-frequency = <400000>;
+			resets = <&syscon_apbc RESET_TWSI5>;
 			interrupts = <41>;
 			status = "disabled";
 		};
@@ -443,6 +448,7 @@ i2c6: i2c@d4018800 {
 				 <&syscon_apbc CLK_TWSI6_BUS>;
 			clock-names = "func", "bus";
 			clock-frequency = <400000>;
+			resets = <&syscon_apbc RESET_TWSI6>;
 			interrupts = <70>;
 			status = "disabled";
 		};
@@ -546,6 +552,7 @@ i2c7: i2c@d401d000 {
 				 <&syscon_apbc CLK_TWSI7_BUS>;
 			clock-names = "func", "bus";
 			clock-frequency = <400000>;
+			resets = <&syscon_apbc RESET_TWSI7>;
 			interrupts = <18>;
 			status = "disabled";
 		};
@@ -559,6 +566,7 @@ i2c8: i2c@d401d800 {
 				 <&syscon_apbc CLK_TWSI8_BUS>;
 			clock-names = "func", "bus";
 			clock-frequency = <400000>;
+			resets = <&syscon_apbc RESET_TWSI8>;
 			interrupts = <19>;
 			status = "disabled";
 		};
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
