Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA3E6C561F8
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Aug 2026 13:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fXjBq7n0PnQdSgEYp3NE5ueXyh/+fuUw9lU6fm1++qE=; b=xZTSKrQ35baPTB
	NblY7REW5cqnR+YJ8GK5TrhTjcbsrQLN4ZGwmg+UJb13DWbaY7MpWj8CJXpUb7It9zXVXWzINCJxl
	A3qmU6c/0b4q84A2GGQyqsN99k3xNaJATbgpM3GaAW9vMDO106z14qcKGAvmNNGhbhK0IMYUVtF20
	dJe8JX/LZlUWcWLbmcY922q3riwjPR/FslSkzbOcJxYuYf//e8JCEEI+2g6mOm+Kd0RbCWojTKNCj
	+G1Z35DB3m3EVn0tnrm9ER6IjgOcnphkYqrWaKSgBaR9MGx9zwOSyKlXHl79pUNKy9sgEVSsb2Lt8
	e289QZXe9DdHqYJDj7yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFG9-00000001voM-1iEP;
	Tue, 04 Aug 2026 13:32:45 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFG7-00000001vnQ-2b5m
	for linux-riscv@lists.infradead.org;
	Tue, 04 Aug 2026 13:32:44 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-49548e01d02so18478055e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 04 Aug 2026 06:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785850362; x=1786455162; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yJTTynjrZI3L0c+LsouF5x5Hoy6mUynsSGeU0YuLyBs=;
        b=HVyqfZosSWn3LqTNi+cyV7jz1JtifpUyoba722G1u2Eavqf1ufLGrGeSjHqYwa6iRw
         vixZ5h/66l1gymPPCvhyDWXzLGXIKBl+nOuD0nSpIdebx5EGN3JLTS1sgSHxV7N0B8V3
         LaNRMOIsxV0F0W1+jpWN+deamR9vvH50u6b3vtSHDwpcOKuQxCugje/fxLdkcuPHA0eq
         6jzSYu8ATY67X5blPr+CFyaTBI46v/EvtibmCDKSTNYQLq11HJh34O8VA1Rg18/Kgvul
         vLAeBbaG9CJB07xvhoJY0Uig9vAQ8R4qq6fP0dVY2zacHTjqnVGeYA899kNp3bOx5YL6
         GW3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785850362; x=1786455162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yJTTynjrZI3L0c+LsouF5x5Hoy6mUynsSGeU0YuLyBs=;
        b=WCqRC0z+HfB9RQxpXNfKi2RaxCnfAEfphGZfKLWSSG1k6ryrKg5r5G5S3ljLx3MwJ6
         ZZQcUrX1zHRv20oi+Qwa6fK3MxPqNVQ/FwuySnc3XL6ixOTFZ3PQdi5SvNE1U/8h+jvT
         xQB6Z9lPwwjwTPEwdofCBbDemk0VxxhTj1fRpDS0I13wKgg3V0kNv5WMn0oMziw1Lbon
         dy34opznwWbVZWiiH9Tn/2RXAs1x97i6jXy3HGtzb85GNkD73jIir6NO4Ua/o3nSt6cp
         cS1e18Qh7lT8Z1EySKipkoF7UOKett2Le8NQP4QrKFQEkvDVOpYZ2URBO/BzhX4ARrQC
         ptcQ==
X-Forwarded-Encrypted: i=1; AHgh+RoFOsoyJV9p0I/2bzgCgOIs0XF7AHLWsIgBy17W6aoMKWMbepQUIEs5Zpyy3+dumTPYuiLGG/9y01NpSQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwxH1k3K0prLmzrvFbFHNhP2FItIShcArIxzMgbTvWS0mF9KJ/y
	YzxA8Xxohh3Dy8u36k3nmRtWyIR99uM5vPWuDxV83sQmvoO0PCnMGu59+QxQeSDG
X-Gm-Gg: AR+sD10w1fKqj5FElJdqTv5yiAzAsHTm+6EuN/OO6AYnjyKclpE7iExCJaQ/unvFYvE
	FS/3h5lzcj301IrBR0hGDq/U4b62kSCjwLOFEL5Eltb61kAKHwCBohjlA2ZamKEEAKbcT8WwWi5
	EMCwk1QgctrUGXUxAYA4NtfrvwRJskJ64W0gZHdwMKEIhmuuMCXaYMbg1piKZLYxLSw+Yb7rgV6
	FC7xoLNdFasmLjD2RvE24XbYSeCKEUAl0PS20n4nPJIvWGgLJl+hVSeEOhdFTpFO8yrjS47dCa7
	DC/3jq3GMMll9555usjLMAJ2mUY61+5E/D6nZUD4HeyH37TedXQ5x6f5gy+xPXpdUa05bsTOJO6
	Brh5snfXt8lPPZYZ7WNVkOM9pvLLYXhbvbZtXPaayQHu971N42wCG9fesMRfqHc86AFr4AkoyoV
	OPySjJg+U2/PA1jBQZI6QMtOGO3BJ7QeNljI/5nvZyEq6T63UvIdWW9/4KsuFHKnqQaUvw23V/J
	CDNer4RX00ygrdBw6PY6/+L5MvwNPs=
X-Received: by 2002:a05:600c:3550:b0:495:607e:5ee7 with SMTP id 5b1f17b1804b1-4980c679513mr335803925e9.17.1785850361445;
        Tue, 04 Aug 2026 06:32:41 -0700 (PDT)
Received: from mamamia.internal (a89-182-139-70.net-htp.de. [89.182.139.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994a0f7bf4sm88037735e9.11.2026.08.04.06.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 06:32:41 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Vincent Legoll <vincent.legoll@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] riscv: dts: spacemit: orangepi-rv2: Add cpu scaling for K1 SoC
Date: Tue,  4 Aug 2026 15:32:33 +0200
Message-ID: <20260804133236.205668-3-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260804133236.205668-1-a.heider@gmail.com>
References: <20260804133236.205668-1-a.heider@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_063243_676033_8A4742AC 
X-CRM114-Status: GOOD (  10.32  )
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

From: Vincent Legoll <vincent.legoll@gmail.com>

Enable CPU DVFS on OrangePi RV2

Signed-off-by: Vincent Legoll <vincent.legoll@gmail.com>
---
 .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 35 ++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index b907a1396b21..dc6836ff7f1c 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include "k1.dtsi"
+#include "k1-opp.dtsi"
 #include "k1-pinctrl.dtsi"
 
 / {
@@ -80,6 +81,38 @@ &combo_phy {
 	status = "okay";
 };
 
+&cpu_0 {
+       cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_1 {
+       cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_2 {
+       cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_3 {
+       cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_4 {
+       cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_5 {
+       cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_6 {
+       cpu-supply = <&buck1_0v9>;
+};
+
+&cpu_7 {
+       cpu-supply = <&buck1_0v9>;
+};
+
 &emmc {
 	bus-width = <8>;
 	mmc-hs400-1_8v;
@@ -162,7 +195,7 @@ pmic@41 {
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
