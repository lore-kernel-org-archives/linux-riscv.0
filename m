Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 554C7C55838
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Aug 2026 13:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5XoqTdw0rtYEFqjh0cn3ifHTprkgV/mBhQ3VtlGXVwY=; b=OHM7SatRU+hDTk
	mLbx30J98aoLyEZkOhqxBNgyiAXocIr4VwCc3qX1v+J/MKyJCfDl/vHH12nzmaLJX94XNqRbTHmz6
	qUOnbAFr5tLdieC8VSOzr72GjRyMHdNJLuvyGwQlLDICuNmMF9VK5+J1WiGzzdu7bPr6ax7A1OTlV
	b6xO/iqw9Wh+U5qYu9w/sFx1nYpfuab3ieYH4S/lQAJpEFjxjbeeT1Jh5SARpmAOSt2uCUU/yfYDf
	VeIlHer3UryvVmEmsQPsdHqb/JyuQkb02pBqrtAlvb8OWvseLx7zsEazkGlYmnWe09a8U2rfAnDNW
	JCQi5t1shHghFBq5rPAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFGB-00000001vp1-26jF;
	Tue, 04 Aug 2026 13:32:47 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFG8-00000001vnp-3zwq
	for linux-riscv@lists.infradead.org;
	Tue, 04 Aug 2026 13:32:46 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-495437bb891so8700435e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 04 Aug 2026 06:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785850363; x=1786455163; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wq3ZNEzsGi/HzQvZ33ozF9Jd/aqNpP8g9VbFrSJ0TQo=;
        b=Rh/wKW4jRojpGn5boWeE+uDFNoeW4FB3YubJhYHnhjeT/t5A4ZczQJ4fUspHP36tgD
         sXT8NN2HQ5a84kQFf1pPgqV6/8yoxzbT2bLojKQC4a67YQZRunj8LQIaJOXRBIV2ZfFv
         mob6PO/uz44Y/8DMJ4/RAan1SOu36lcgr8tMqKI3DaL/U8y/93yTFp3pyVafqtrpxs+d
         JcScozMVu3sVes10npzzwaUAAFVMCIdBDVL5whqhBZjNsWX7UMB9KSwUG+mMfzAJbu2r
         sBU1R2ypRgI2eiUjFsv+lTJtyG1RmhRYZavQalMI5mRQPUMnZRcLzSZ88nHqhZQlTJNi
         +SZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785850363; x=1786455163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wq3ZNEzsGi/HzQvZ33ozF9Jd/aqNpP8g9VbFrSJ0TQo=;
        b=XEX3Qla1JiRyyNZlr9CaiAwtu1bm3xl3rNnmhzX51UTU+SP8gakufoOmsbpGI5zacC
         RPfUw4KTff8h5gJOybCa6OhbjJHoiprjNQrl/fk9QjllAkiU5M1WqZhNqEeoC5Vv3Er3
         ojICE52ag4FhYXfBP7Sn1vabEbogR93CYc8/rqLmsWhYUh7ZPTx+XDBIMHHgRAlQukO8
         dTcBSN3fiJRyf/yD2sCS4voHxYjtlQ7AASQXQkgwmRL+0fJwsKgxR1YiWZaTzYFWChQC
         /tYjAkVS/87dYSTr6dIqz31FrBwVOKPL3UMT0NU0gay7JdLnq+S6OGkRiA2WpQZePnMh
         XC3A==
X-Forwarded-Encrypted: i=1; AHgh+RoRzOkSB4rC8OBiOd2Gl+OyqTqO/3s1K5094akgg3r77PmbMz3O2kWWQK3041Y00ADgOzjA/4/CUM4i8A==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywe5Nv1T5pcje9yTbFIRcdMsmwKD7I+LY1Ww8/wJB0HYC8ri1TV
	qUdUpryUqhKoeBHiFtyRtCa59viNPiKtpAeCfa6utKxqzfKR6bQPOCZ9
X-Gm-Gg: AR+sD13oCrQCdKP1Uzuis5zTXz+QiIRK9x3KIPTIFza5peRdv+rPjqm62zX7r5+MS4z
	d3jGO6+UVq/kqXhUzLBk3g26PTvvXazaPwlsvAKs9NwjQsHxG1xiUmuo73YOfZ57qm7u8cEvRZS
	zp53MqQ+WaFZdGDcSnnWopT6LMx8rpCsS80bZYS3GmZoSd7Ba9Ujc1LTgkS1hzEn3yYaoxkmATl
	wKeJgri4EUcx5s61S2c3CsuX7OUizDksaKyCoVibZ1x/MuyzRm46cX/jNG5cFB8R16opS6jOdo6
	w60oyZ4bPXuXO83O0fAuAR7ybhDF4Gh5wvbmGbk4A8WfTfX6/Hw0q0MvEXB4JcRjWXElwLHPMum
	iY6c/iwoTuSp+PB284PkTVDSE38KOZz184781tjXVAyJA83VOBXc8tUH84QLHYVzDC+f+svlwaC
	a677mYGiznATfCftck9G7/+PKLbLq9a6LPx342pOY0xifFYLO5CHJlywZEcPl+N9A2NsuuVGAV7
	c7aK3SRiV1gG2c/TkS3PX/CiUXtHTo=
X-Received: by 2002:a05:600c:4f86:b0:493:f783:c46a with SMTP id 5b1f17b1804b1-4994a0fc5f1mr77242865e9.6.1785850362982;
        Tue, 04 Aug 2026 06:32:42 -0700 (PDT)
Received: from mamamia.internal (a89-182-139-70.net-htp.de. [89.182.139.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994a0f7bf4sm88037735e9.11.2026.08.04.06.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 06:32:42 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Jonatan Hazell <jonatanh@hotmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] riscv: dts: spacemit: orangepi-r2s: Add cpu scaling for K1 SoC
Date: Tue,  4 Aug 2026 15:32:34 +0200
Message-ID: <20260804133236.205668-4-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260804133236.205668-1-a.heider@gmail.com>
References: <20260804133236.205668-1-a.heider@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_063245_004896_BABA1BF3 
X-CRM114-Status: GOOD (  11.07  )
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

From: Jonatan Hazell <jonatanh@hotmail.com>

Enable CPU DVFS on OrangePi R2S by including the shared K1 OPP tables
and wiring the CPU cores to the P1 PMIC's buck1 rail.

This mirrors the existing cpu-scaling support for the Banana Pi BPI-F3
and OrangePi RV2. Tested on the R2S hardware.

Signed-off-by: Jonatan Hazell <jonatanh@hotmail.com>
---
 .../boot/dts/spacemit/k1-orangepi-r2s.dts     | 35 ++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
index 2d1ba34cb00e..6ebd4334410e 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include "k1.dtsi"
+#include "k1-opp.dtsi"
 #include "k1-pinctrl.dtsi"
 
 / {
@@ -50,6 +51,38 @@ vcc5v0_usb: regulator-vcc5v0-usb {
 	};
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
 &combo_phy {
 	status = "okay";
 };
@@ -132,7 +165,7 @@ pmic@41 {
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
