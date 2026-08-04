Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 589BCC55184
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Aug 2026 13:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ylw3768nV/K2rbWrCFy9O5tbOKf2n/FgDqw1LZ43jYg=; b=ScCA+6IOUmmwQf
	PyZToW8q6p3pEKnJLn+iMSCOHLAXVQrz+73Qxv+tH25yD7ST3camcbNyUXaKwpaRByUaxPXAy6JsA
	Lt6K6XVajx03CAEfZgMBozi4K95FGseR36ZvlxHV6r5RCUmvPa1+MYXqayhvakZAgLctTD1gvoXSL
	OlpQ24GcMHj6NdvqK1czQMf2kb/uugPU/ppIvoqRwuNpC2u9CJbtErCJcitK1vuSXZqUWe6OEQ3KG
	8TV/C4lZEEmM0KkARZqUJ74gkWhBmOpGgSbO64W+NvYvpCdXi5hTsd1tXEo4pg8re2vHEnud8X3bY
	N4MX4iiR+URpKhKTp4Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFG8-00000001vny-1JwG;
	Tue, 04 Aug 2026 13:32:44 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFG5-00000001vmo-3Hge
	for linux-riscv@lists.infradead.org;
	Tue, 04 Aug 2026 13:32:42 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-495590dde14so32486955e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 04 Aug 2026 06:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785850360; x=1786455160; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kGdbltKWpfHXSCdQSqEjll17z2tSjmzRYfJiMwHBwqQ=;
        b=dS6YLZHwemBeLJdNeJDGDqfmmMOWjipSMKK0c+SMn0kxujc4Zf02kyIjyl+Vmp/hX8
         cDILsLdkmBvPpOyfw0y34dtyUosayLJrQpn1x6SYNlUGJ7b54QJ0r4Cu6EJSETcq+QFC
         /d+hJZNmbG3EJ/ByrRf+cOCGC4U+TsEId0DWhFPVBUk5vW2jOi3AzqeylWwApjEep3+c
         l3Lz8psCAqVGLFz1h4EhUyDa2olEsq6WKi0HG38lsIEPC9bths5zOvP3m2qzsup5IgZp
         rGl7r08u8hTBiH6avrwnuix/PHzCKpRvAcaUt7FrSpST59TtqEWtExTf5PcUXLGURWct
         UUPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785850360; x=1786455160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kGdbltKWpfHXSCdQSqEjll17z2tSjmzRYfJiMwHBwqQ=;
        b=C8OHe7G6dvC0vOMmTx3FRE2ZDX4wwylLVs6Qhuwq5kqfkVRXV7yY7Mxbqq2/KPkFii
         tjnrrJ+N8eZJbXZqzBFgYSgcCHHxgihqY8K0LElDho62V8oDttEjIzY4riCwB7tCf1xO
         MveSTZGO0+9PUILgUDZCG2dGG2WqiNIZDv13gKU9hkIvdMjhzQ+DE3RV0w4Tg4jdGHDk
         bgfyDIkV+JDbdSd01u3tBaO71eKHGXLhNcNf7vMu2zTt4Mokhu/JexyBns5r6+MSGtxN
         t5zpNijWhkVur/Mpjz/rTHU2QdOtBudrD79hsvJaJdjsQofB4pyVtH3pRI0zJ4mPSAX9
         wzSw==
X-Forwarded-Encrypted: i=1; AHgh+Rpfg60BefaHXLP5dlnJ0PGRDGyMQWoaoyb0gqcifEEmzpjypZ4v2i2PGCDvmpCkhLtz8a6sXNScSlqRbg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+CZqHu1C1WCOWZQVMlAGXOEYYdd7KOxoKK0xt2yl5ggSzxlho
	P5uQEjOsOKar03ZoZmGJ2/VJDB/7hu9o9Kw6R5PraGeZ51oNwNd+rD3R
X-Gm-Gg: AR+sD1064Yv3UtAmLazph6vTSmj6dSylm3XdkMhva89flYe1ct9lOainewFmQhk0OzI
	E8dJkDuudbBPFfMenBl8cQv8/tZSpVi6oFTTZtBxU6M61S4uzOlT/2WORmULKO+dHgmpaw74sPe
	XHqyxqcS1tY7BmSFqKFTqY4J/H1aT/zULQCsknh12abjLwX7jnGDt1dyCp1JJN3EQ3QoybnC91Z
	+Sk5Cr4Jl+AIKLtQQnSzJO4BNpHquSh69LyzZwvw8BbOcWeG2++H0ng4ryvNfjzuvxFVcAylZod
	92C/A6qJNdThEpxm3nbG2LsqIMT4utpG097s0uRnwL+C9c7qvtNdu8Fvgs7Q11zKhvQ3qh5O9Qa
	8Q09l9ScuQ0uKdOBiNrLS6X6muY/3j1Uh3DF+1UX5LQMEvJKfssmN9I6XwdJhQ1SDU8QrQcXOf7
	IwM4uuQ0DWzXR+b3RY6KHCZO/2Qn7ER4JstlrAhXZzOh+STYjlFU2+qnUM63+iDj7wVuYMjXNkV
	o28Jh0KrlJXcDkXhYm5wUCYhJMBXpg=
X-Received: by 2002:a05:600c:154c:b0:499:4d4b:be2b with SMTP id 5b1f17b1804b1-4994d4bbe5bmr27679215e9.16.1785850359884;
        Tue, 04 Aug 2026 06:32:39 -0700 (PDT)
Received: from mamamia.internal (a89-182-139-70.net-htp.de. [89.182.139.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994a0f7bf4sm88037735e9.11.2026.08.04.06.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 06:32:39 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] riscv: dts: spacemit: k1-musepi-pro: add cpu scaling
Date: Tue,  4 Aug 2026 15:32:32 +0200
Message-ID: <20260804133236.205668-2-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260804133236.205668-1-a.heider@gmail.com>
References: <20260804133236.205668-1-a.heider@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_063241_833700_13DC973C 
X-CRM114-Status: GOOD (  10.54  )
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

Enable CPU DVFS by including the OPP table and wiring the CPU nodes to the
CPU regulator supply.

Signed-off-by: Andre Heider <a.heider@gmail.com>
---
 .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 35 ++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 246f8f2ab62b..23f32a8a3d45 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -8,6 +8,7 @@
 /dts-v1/;
 
 #include "k1.dtsi"
+#include "k1-opp.dtsi"
 #include "k1-pinctrl.dtsi"
 
 / {
@@ -99,6 +100,38 @@ &combo_phy {
 	status = "okay";
 };
 
+&cpu_0 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_1 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_2 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_3 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_4 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_5 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_6 {
+	cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_7 {
+	cpu-supply = <&buck1_0v9>;
+};
+
 &eth0 {
 	phy-handle = <&rgmii0>;
 	phy-mode = "rgmii-id";
@@ -178,7 +211,7 @@ pmic@41 {
 		dldoin2-supply = <&buck5>;
 
 		regulators {
-			buck1 {
+			buck1_0v9: buck1 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
