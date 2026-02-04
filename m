Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB447E95396
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Feb 2026 13:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r66jw1Dpt3BJrUoMvGBeT3QZYqTpy/7MNi/TIC0oHyQ=; b=twMsVCoGKbhXVg
	Fi0X8ecpHbQWgU4LR1gTZlFtGCwSTZBbDLH3ovU0u2gS0iv/OPvlvfU/VZeq/Ci4/jvwzVKZAdW3U
	PPd5OHv/0+VjmfQd0IahxSwOUHKYZU6KUJBHm0W813simoRp6nK7zzr223nvcKJFSyPnjwbqELDxJ
	pGb2k0tka7L4U/LgnJwENiCoPMKIpk9j2COk8cdfUO7GVN5i/Iq8BT83SuMimBmlcCVaXw+fW3uQ0
	Q1pUxexaD/HKjBwZB18LKn3HAlJHysmzJnY3Oqdq3IT/eAp3GzfqWRSCStvuN77UNdSfMI0HGOULs
	2MAWNP6VGTwE3g5hx0XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vncqw-00000008V3w-0cMJ;
	Wed, 04 Feb 2026 13:23:30 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vncqu-00000008V3G-167c
	for linux-riscv@lists.infradead.org;
	Wed, 04 Feb 2026 13:23:29 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-2b71320f501so4064718eec.1
        for <linux-riscv@lists.infradead.org>; Wed, 04 Feb 2026 05:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1770211407; x=1770816207; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T5psyRp1huVkUGw/d5LRBcHs9VkHziv5lBIU7n3+Lhk=;
        b=OMnYG0qa5SBYPjcbnyjJCeYDhTBKxmpo2fltrSNlK3AS60stMpBE5XfyNMtTox2Q2S
         46TiyGB+F6dAP20UXbjnMluh9x1xOE6gkyJJsPiy/ofA3wdaKxdbMcjtizQqU6ohOxBj
         ub8tSxiMuq1jaLSRkGAhpz4B/EPbKOVG1o66MsycFFHQ9LUxTMT4yRvMMh5pLTpddbEe
         tWyuIuqrXDK/62mptTkEi5zRrfK0R2ZOqf4oUsPu/x5U5HE4b+0u2f+bEhNoV9jGfbrA
         dJnRImi15ch+V+m6J5MV4rOWiRqgEuFs6EMGFA46vJf+dc2Y/iThPBEDC87UF2SiheL/
         vNVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770211407; x=1770816207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T5psyRp1huVkUGw/d5LRBcHs9VkHziv5lBIU7n3+Lhk=;
        b=TDiOmJ0ARr5Z7Dl7txn/526VzOfpr7VFkv6q1RmETjdmpws5rJ/NqFY1wsR+wGJRmd
         Sn92C8ywwCBPqmfh0fYOPCOU9DbiEPJSqY44bRn+GJBAmmO4Rp5SaHS/FxUCkSLwY8eU
         8ivNDpEsfNDpXEOIpmRP/jgIKF9PLeRxIzKxORYnKnS0UMlMZJLSnKvS6uggHpBFzlKR
         XyU3vXyCT9phuhv7VKr3D0dOMAP7PVrOfMUp3QwLQL5ODO1QOOsZrsb4KL17b8q5TKoc
         hAdi+SH925QVHcnmiuqnRpsve7huFw+hEr7eGf9AU/QhsEeBuesYf9YbD6M29ioqAelo
         Jejg==
X-Forwarded-Encrypted: i=1; AJvYcCXrRAhuGApgCglHTyehCaJTZ5U0XKmn52oWrj8GJQsFG3f+uIswC7CG4/rqITGIeS2W3XE2fRhdVPcokA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywo5A8jUZolPzYuM+8QI0Ra8FRF4dRrH0L0/idgZizmxLEbY/Ds
	wHI2N45FbrN7XQhrJe13/Quweb1manlgPGJb0xt4zft6Xws97Fx7Be813BMysbyGAvs=
X-Gm-Gg: AZuq6aKVXFUiZ1y1pUD48FPV0rf/q4XdMHOQelJVcHLywRFV/kze6RNIGYh6zCq5zza
	s13s97GSMvdVd17dIckXJtRcBF5YCCgOekxWGN57/aO3dC0WVwYkGtPOy7ZrLwWPCJ9C6dPU4q3
	3xEJLghndCRgJiSw2IWJCVb7p9q6rWekmUe5sO8/1MxBG2gOPm9eto1TPrEaDURk9D/tTvfvPz2
	CQ6fnQ/dBhO9lDaMd22YBDhCjta4lqY21zGymnsWszKnKqc23lOs9Vw4+PBRTc0T5tF1EeQ2WE/
	FsRtl5nEd2rDWOLRAkKDF8HUbsj8LG6+x//4X3Ywk8vcJY4s2ahiGocX+tr63d4j6oaQjnHqpqS
	1eZcEESKyuUvCU/eWr1/CUPwNeQwWUGnahmZ4hvjYqig33VzHeEEiExCmkH9PGi6gVbnOmN9p73
	sYqgokKy0MifJoVgn+hK7/CQrOmaHUpLY=
X-Received: by 2002:a05:7300:dc86:b0:2b7:1d54:87e5 with SMTP id 5a478bee46e88-2b83299949fmr1330156eec.13.1770211407258;
        Wed, 04 Feb 2026 05:23:27 -0800 (PST)
Received: from [127.0.1.1] ([2604:a840:3::303d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b832fc1d50sm1416731eec.27.2026.02.04.05.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 05:23:26 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Wed, 04 Feb 2026 21:23:03 +0800
Subject: [PATCH v3 3/3] riscv: dts: spacemit: Update PMIC supply properties
 for BPI-F3 and Jupiter
MIME-Version: 1.0
Message-Id: <20260204-spacemit-p1-v3-3-a894b3057026@riscstar.com>
References: <20260204-spacemit-p1-v3-0-a894b3057026@riscstar.com>
In-Reply-To: <20260204-spacemit-p1-v3-0-a894b3057026@riscstar.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, devicetree@vger.kernel.org, 
 Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_052328_309444_EA87276F 
X-CRM114-Status: UNSURE (   9.95  )
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

Use per-regulator supply names in pmic "spacemit,p1" node to specify
each board's power tree topology and match the updated dt-binding.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v3: No code change. Updated commit message to be more precise.
v2: Added the pmic supply properties for K1 Milkv Jupiter.
    Updated the commit message accordingly.
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   | 12 ++++++++++--
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 12 ++++++++++--
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 5971605754b3..444c3b1e6f44 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -190,7 +190,15 @@ pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
 		interrupts = <64>;
-		vin-supply = <&reg_vcc_4v>;
+		vin1-supply = <&reg_vcc_4v>;
+		vin2-supply = <&reg_vcc_4v>;
+		vin3-supply = <&reg_vcc_4v>;
+		vin4-supply = <&reg_vcc_4v>;
+		vin5-supply = <&reg_vcc_4v>;
+		vin6-supply = <&reg_vcc_4v>;
+		aldoin-supply = <&reg_vcc_4v>;
+		dldoin1-supply = <&buck5>;
+		dldoin2-supply = <&buck5>;
 
 		regulators {
 			buck1 {
@@ -221,7 +229,7 @@ buck4 {
 				regulator-always-on;
 			};
 
-			buck5 {
+			buck5: buck5 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3450000>;
 				regulator-ramp-delay = <5000>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index 800a112d5d70..e2702a781734 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -100,7 +100,15 @@ pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
 		interrupts = <64>;
-		vin-supply = <&reg_vcc_4v>;
+		vin1-supply = <&reg_vcc_4v>;
+		vin2-supply = <&reg_vcc_4v>;
+		vin3-supply = <&reg_vcc_4v>;
+		vin4-supply = <&reg_vcc_4v>;
+		vin5-supply = <&reg_vcc_4v>;
+		vin6-supply = <&reg_vcc_4v>;
+		aldoin-supply = <&reg_vcc_4v>;
+		dldoin1-supply = <&buck5>;
+		dldoin2-supply = <&buck5>;
 
 		regulators {
 			buck1 {
@@ -131,7 +139,7 @@ buck4 {
 				regulator-always-on;
 			};
 
-			buck5 {
+			buck5: buck5 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3450000>;
 				regulator-ramp-delay = <5000>;

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
