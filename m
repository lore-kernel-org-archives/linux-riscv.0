Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B08B9E7E379
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 11:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iJ70+r3uW1pCf3cizeHjHjgKK20o5E+zVFL9hHIWF1c=; b=cjD+iJeAtJ2iUs
	02Iuw3NPT7FieQVPCDeV+WDfr8ab7P/rw6rob/xQuRyWAHyCxlheSKul70/1ixT6H95pdcs39+IW1
	Fu3rhUlPTezbcfGuIYODE18IhEAbk74TRsB2n8PoS88ce6R3H7Hv+CUbqrWSah5v61QcDasGVmu8a
	voNE2JnAd0exy2+AVcRTuBdhhdAYPGa6foxktnAv+LnKCwevTCuDeE87uCn9hhf61eqGV5PkR3f1Q
	M3MWzUoJnAmQV+Pikvi8HsDMwbuhc0mu3+dGhCrg0nfWjhXDfhqja952M0rIE61NbWJKa5GBETPYF
	TtOsEmt3R2XuAzGtwG+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8cpd-00000001xw0-308V;
	Fri, 03 Apr 2026 11:36:57 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8cpb-00000001xvJ-1cev
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 11:36:56 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3591cc98871so812433a91.3
        for <linux-riscv@lists.infradead.org>; Fri, 03 Apr 2026 04:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775216214; x=1775821014; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LSgprDobMmJNRlvBzxseyBmhNbTM0nryCqDbJlCu82A=;
        b=mxdINkxRuwoPPAq1DJ/h/2I5m8LJn4KUa+mDUwbt9zsp297zW3kMA3/WzVXrJtLSHn
         Bcq+7jQOLEPQOp/H8dOBiHuAVrf8aa2EZvdaQPX9x1m//DdEvzduf3ITUo3ELsoFRT9T
         xbDzLk+TvcssDweQBvugPtCuj9PC7dT7PvJIShkX0rQdun1lFuri2z/C6gT1sCIX30OF
         aLmZL2MjMay4VPPs+0NsN+12wcVe0Z4OxxLmjKcJqX8ktBV18/KxCTtncsWFaZRBMRXN
         VgyBp7v5LjBm6AQUVaqIwVfXq5P6add8O6pQN0Uica/Ktt4ZVaS5cq70vw/sIrBlS8Z3
         8/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775216214; x=1775821014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LSgprDobMmJNRlvBzxseyBmhNbTM0nryCqDbJlCu82A=;
        b=AQtaVRBPonn4WTfO5K4ds1YNtLLp0JN6wN6TOng0NdlZquSl9VXSfSQ+d9KbiGM2+3
         gHN4nTG/00La12PEFkcaqw68DgsYOuHBcYvnhnpJP26/WbUywfcvsVkV0zNopp+QZmnq
         j6U9ptG5Rqno688uS8a6IkudDcGYiJ8vIY+mxcReka8018bpjJn3+FrAQSEK4LbnAl0a
         dN5Mnqru8A21tdaOoR7IYicd7GZ2XrvdFbY6/1aXKvrXpEDgXBBF6ZW93H7ncSGW1Oj/
         zcatK0gcg3Qd2bkFca2d3KQ4qJOy6dkp4B2n8WVIigZgZjNMcjegWIsqYW5G2mYZgV1b
         4xBg==
X-Forwarded-Encrypted: i=1; AJvYcCWoLLFB+9kyJktra9xKuXDCmW4O8O+zWKHdcc2LW2Qaq/FVD7qJX7o+VNzKbTzI1uC2XK+c2BR+4gsQow==@lists.infradead.org
X-Gm-Message-State: AOJu0YzC8GzLUaEXC5Vo/0HoCfzqtngWZvw7eq7+RSN+eqyRA6EVvyhj
	KPXcXuA7khypteduxuSFHGt39W2c99vT1lSpWwmT07g8scdYS8MypYbB
X-Gm-Gg: AeBDietgVL6yy/Vr/y58MPFABq691wM/Vbpnx3Oka9PHhahFeTm/MuyinQGkXhIjstd
	IojxA/tdvZhXSBi5JPLDofRQgURjwgB4Q+elf5xchUGGspkPEzRbEEo1K3Y//hSiXRV2SBOiS8N
	8ic+UUrT9TyQILsF8tHjytDqO4zF5RrKP7WSW6oa7+ckHnUXKWrQbyNFmD5MHGy9RzILEH95QAO
	RxceR/TTobDZ/IzvcJnxvVgLBY5hxKe8wsf7HL4LIz/nbSDP7RDXEzCky4onpSX45oAnq7tmOh8
	ytgbc1++BHCEEN4/TSK89pVtzHBp1WhcL6YAHF6U5EheH3yqtUnpzUJ5e7BuipFZpYJLQuAMgOr
	4P6dAbk77U6bxVUq4KHJAKbuNFRTd5r2PKfUyABtjad/qaLkN0XSgOQJqskb0uh5KSNKV2ceXYy
	iE61A/3aPYk9zm2muEz0o=
X-Received: by 2002:a17:90b:3b8a:b0:35d:8e4d:23a8 with SMTP id 98e67ed59e1d1-35de68f8b42mr2363418a91.15.1775216214567;
        Fri, 03 Apr 2026 04:36:54 -0700 (PDT)
Received: from archriscv ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35de6860cfbsm957599a91.6.2026.04.03.04.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 04:36:53 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Han Gao <gaohan@iscas.ac.cn>,
	Ze Huang <huang.ze@linux.dev>,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH linux-next v1 1/3] riscv: dts: spacemit: k1-bananapi-f3: Add vcc5v0_sys regulator for Banana Pi F3
Date: Wed, 25 Mar 2026 13:46:08 +0530
Message-ID: <20260325081700.1502-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325081700.1502-1-linux.amoon@gmail.com>
References: <20260325081700.1502-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_043655_734721_0C5AE44D 
X-CRM114-Status: GOOD (  10.46  )
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

Define the system 5V fixed regulator (vcc5v0_sys) supplied by the
DC input. As per the schematics, vcc5v0_sys is the input power source
for the VCC5V0_HUB and 5V_VBUS reglators. Update these regulators
to correctly reference vcc5v0_sys as their parent (vin-supply).

Cc: Han Gao <gaohan@iscas.ac.cn>
Cc: Ze Huang <huang.ze@linux.dev>
Cc: Chukun Pan <amadeus@jmu.edu.cn>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 5790d927b93d..9727ecdd9f6b 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -50,6 +50,16 @@ reg_dc_in: regulator-dc-in-12v {
 		regulator-always-on;
 	};
 
+	reg_vcc5v0_sys: regulator-vcc5v0-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_sys";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		regulator-always-on;
+		vin-supply = <&reg_dc_in>;
+	};
+
 	reg_vcc_4v: regulator-vcc-4v {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc_4v";
@@ -66,6 +76,7 @@ regulator-usb3-vbus-5v {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		regulator-always-on;
+		vin-supply = <&reg_vcc5v0_sys>;
 		gpio = <&gpio K1_GPIO(97) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
@@ -75,6 +86,7 @@ usb3_hub_5v: regulator-usb3-hub-5v {
 		regulator-name = "USB30_HUB";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
+		vin-supply = <&reg_vcc5v0_sys>;
 		gpio = <&gpio K1_GPIO(123) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
