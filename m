Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F0BCD98D2
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Jun 2026 12:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+VORK3P/FPEnJEK8/8PcXIgDlgi3hp9FMbVGD+YifKg=; b=IFY6BguY4sI6XC
	6XYhu2G9B/GJCpWGXIzboqnU8eE48WYXK6B1uucsABnm6ESyoyJvrj2CitH0Br6pv8gZ9bU59KY2L
	OKe5ycYuOqgaNai6UIZK5b+vjPfK4NLiDUWKd4Bm7g0oBw4Vwj1gi1OcV4erjgNy0RP1keEDVEpIk
	pFUIdqfP1a6H1yEWWPn+YF2BCQeykx+gLxzMIQK3kOeXvcsDhggXb68PbeGhNbhP8W72bwvVGVcWW
	sDG80Wd7rfw+yyVt3nKW5KX7jRLqwrCC9TpOajMCZWIe/Slz6kxrUPjev4dVgKyJgh5zO2XzMKSUU
	tp85oQs/PJ8alLZ+2Y3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYjwq-0000000Cydb-0o35;
	Sun, 14 Jun 2026 12:28:20 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYjwn-0000000CydB-2kMo
	for linux-riscv@lists.infradead.org;
	Sun, 14 Jun 2026 12:28:18 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-4619990ca5fso43206f8f.1
        for <linux-riscv@lists.infradead.org>; Sun, 14 Jun 2026 05:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781440095; x=1782044895; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UXbCcd0NTps7SDVoolImrKKnLGgAu77CT/EkLadupyI=;
        b=mfqK/fRJdvqvRXFyJcR+/aB0dbAtjy4tBkHPl8QSFLNmln41YhiqeOpSZ23CGwhhiE
         s1NW1IFs+ZSsm24scWataJOgVtfolAdnUB6rrikEDLCHdPwz8NHiXFZFzBSMj5lgFViY
         cunhL/NZywXE2K1IKoJsxS2p7F3Q69nbssrZPLn4XJMy/7q9s2X6gzXgYnLhbQb04LXg
         TPYoFpE6YE/VNjz4lnrtOU/nMgPWQP5MuxCIXsPYNMRvYd2ZkUdH32ULs10c1rG8YOMo
         WjFUE41IvMff3FGEobcScCnhBLK+0a7kzzzMHcEk5eY3Z626HXxRdWR4lWWlDY8HOZ5x
         6ZoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781440095; x=1782044895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UXbCcd0NTps7SDVoolImrKKnLGgAu77CT/EkLadupyI=;
        b=Nn0Fstp4RAmAingwCI3eynubJBOCm2drDzjVU1XxzoensUDxyqI1woeyKTyAKo+PaK
         tcOeEcNjzOHTZo57tnzjVhmr2HBZmz/0A1LGldLEzcimzu8efgt/X7OkpM38UR7Po3TW
         +5wHHJAMN8vVqQxg4TB3EbG2TwEND9XpOrahcXcA3bVxPWgL8W27sdZG977QJDEvscxN
         4b+dbLsDf7xFjtMx6gx0xPx3ePTF2oxphiCU7P46nAMYfEAMuydzIJCFDhaYe2Ps/4xM
         lJ0zOE0FRhaPjFNwtbYxrOj/kX6JBR9lcGLP79FuuSG+VLh+wnnl2WcnS4vVRPM5Cv9j
         JtcQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Ko3cSZgPEYkMn6eKvykwIs7rj4YuFczGKIbUCrtSQjb44DmDZDI3Rjw1UBpPifKPKw1xmjWobxKPOjA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyDWG8BJKf7dh6wtdnTB4poVsCxSc0pAZMx3ca8lNtMWd0iwEpb
	MqpiwwSQNfU3tMXzGgAqAPUoYVx++vRWGTtwtBXqqtnl1ML3fC+JJi/at48xIo3S
X-Gm-Gg: Acq92OGy4OsTJg9kCxfMRXS4zcw+Jrkp8cC8gtDF1F4lftY17ZQ4zxd0sKZiLCSy1S2
	nup5pN4+GWuaW06WXElwVAd0UpsY8sNtefZ0UOkdBMxtw0GRiI6doYR2nZIYY6TPVZFrtAcZgCT
	7Ojyu8bAfDv6y17Af7yz1g3zPgEbhbkD77+inL4Dyj/drs/eK/OcGQDVuPnafQ9BV1if4Tcj6OV
	ltyYspAwuvZKfwW4js/QvwXJkqrZ7RxTEPxzsiNELcQPMSJh408Y8KqDBJP8HsmGo68EgkbhYYm
	iFmHsDTEhUP4lDmXGMdniHrNRvTvB7Wp+IXg5plLqeTea9/Iw5//tTN1i5Iki506pxLSp/SKPVj
	ijguX3uAo22EltUHtdhpr1oyX2wNHjJoYlc7GNzf6Dfm4xsxktQ/lvWTN7/XsOpNxVr5GVyxEy+
	UW6/yuVyDJRplUihleQMNfdflItbqgSlKPhPyc9jAfzPcp6ffKvuSLFkkEyp2KZ5CS0pjY
X-Received: by 2002:a05:6000:4b04:b0:460:138d:c9b3 with SMTP id ffacd0b85a97d-46074a528b0mr7750359f8f.2.1781440095104;
        Sun, 14 Jun 2026 05:28:15 -0700 (PDT)
Received: from mamamia.internal (a89-182-129-114.net-htp.de. [89.182.129.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f263923sm24756097f8f.2.2026.06.14.05.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 05:28:14 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: dts: spacemit: k1-musepi-pro: add cpu scaling
Date: Sun, 14 Jun 2026 14:28:11 +0200
Message-ID: <20260614122812.2287506-1-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260612-shadow-deps-v3-0-2f3ba88611ff@mailbox.org>
References: <20260612-shadow-deps-v3-0-2f3ba88611ff@mailbox.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_052817_708967_AC6C64DD 
X-CRM114-Status: UNSURE (   9.60  )
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

Enable CPU DVFS by including the OPP table and wiring the CPU nodes to the
CPU regulator supply.

Signed-off-by: Andre Heider <a.heider@gmail.com>
---
 .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 35 ++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 0d809e4ad3b1..1b425011f123 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -9,6 +9,7 @@
 
 #include "k1.dtsi"
 #include "k1-pinctrl.dtsi"
+#include "k1-opp.dtsi"
 
 / {
 	model = "SpacemiT MusePi Pro";
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
 				regulator-max-microvolt = <3450000>;
 				regulator-ramp-delay = <5000>;
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
