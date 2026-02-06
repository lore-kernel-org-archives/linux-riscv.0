Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA02ECD9BB
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Feb 2026 02:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/nRtjjG24QJH4WANbOCmJJ1K6NDQogRrUaE4c4J1Cb0=; b=sAOJIuFypi+zk7
	VqEG0+Eiw5OBEa2KcRuRrJs2mRE7fCqQ45iMxyO2tJ+yBN2lpaUR0EOT7WNFkUN+Ob1MJmpOKdp2S
	ORveNMWLg3i4JhHKe0g+Qa1JSKIFrylgbwzYTD3q3+8O/Zs1YZ1jArZvjVjM3jCari855lYPHQ7Ae
	w4Cnh+K3mCZlrZwSg+6HMGXkgBs1gINjMxgSPSw1QmM4MWEyeEaH8x5FrYGUaWHnV79l8BPz9do2R
	4FPlxmwXCGS4tluioz/e3bSxxbqdGvrOHC4Mgz6i+Z4REGuI4zNFD/M0kvHBhVFNobAwYhdA3wx+X
	kEA3RU4v+7HMT2TmIJYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voBeE-0000000AleC-4APW;
	Fri, 06 Feb 2026 02:32:42 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voBeC-0000000AlcS-2Rg1
	for linux-riscv@lists.infradead.org;
	Fri, 06 Feb 2026 02:32:41 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3540266d356so1067777a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 05 Feb 2026 18:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1770345159; x=1770949959; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/g6xXR3sCpk98fDtquSf1waAlnXZpFapLSMWL6yV+qI=;
        b=q9+AOSdF7/vhkJ2lTTK3YbXhYGLjZX/DI0x25KchnuzQo9G6TyfkXkiKFwYT7V6X41
         6vAhn3OkRt2xn1fc4mT9toobDY3YxwrF9QuAFq3MHmW5DAP772ilVRa1j/juGwroL7Ks
         zcDmIJAlEhBnNH4LB6ObeHarRj4f0bWMtWl/lvyRZkNO8fNkR4vrReLXi4wjMr336t7E
         az0NPTfhrdQDn4VQpZo1uLV3M1aZDplXbXpo+plBdU0Kxg0ndGro0/GeosoBsApNddHa
         chnpCArzBPaUkJPhqB7jz6/5pWzuT/AuhYFF7EP1BWPV7zeuj/9LUX8RhtRe21kIyrIz
         MD0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770345159; x=1770949959;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/g6xXR3sCpk98fDtquSf1waAlnXZpFapLSMWL6yV+qI=;
        b=hxgcnq3EWNFVRyWHCNyoB9ntcKw1c8zXB1GsOfAkz520RdtB48ocM6gDo8om/TNZn1
         8BZ5znj8jES37m+RW5i0glsBouXm8G2EH99K2rlOX3McaCf8iN5kt17WiaARknWieQFM
         e/tA+8sQ8mqlMeFyhcTCsOAPUGQxw2h4ZcQHEtv2/Y0chf5W+2pPRT+kK5fcobGqg1J9
         O7CnOu7c6kkRtPNytnbzXlPCe1919hXbAxVG1FEOCBvA8fsTaINZyOZbvgd3/dx04csT
         GBpiAkb4HvP3A3G7Quo8ViIdvfvyHjnV6am9HnkDcE9MarQmvaY8fce46mQn9Iri0yoG
         P3lg==
X-Forwarded-Encrypted: i=1; AJvYcCXTKRDDpzwCh1H+CRXE6CTpOkYTppIIZa4Bqq/zwN6gqbLomhoZgNI5qyG+PPFS9QlAfS2SjAT60BYPwA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzIWQaWeQl8eSW5yf9WgHEH2H1ZnUtMf/fDD4/MT1nvzAfwVoVm
	eeQEaf/yxjxDbDcs2nlHgU7y5j5jFUg226Y91limBc3gwfnIu0SOc8MdDj3ZIXPNhDuuetQfsak
	ICw1XrEqrFw==
X-Gm-Gg: AZuq6aLy/6vXIcuety2QPPcyrm1s/qguR6SwBPP01URIbexaezE1ABj3QMLUeP+T477
	PRrcyx3mXrQbQY24/hUAAleRnfG4ZHRyjEu1l08hUtZ7lGM0QloDMVzICnFq+Fzs6xuTlR0SDBC
	v6AqlSSZp1tqch655/fmIXnXBfumlP60ljfOlpnSsVBzSzILnnFihKp8cMwkj+3ViCNLyjoLC9b
	/EVh2hs8L/OhjagIx5fvdC95ROCIn/P0z8SYaxuKIi2XuOiX9K3uq478q2lWPiC/Ua0W2rJ2Imj
	0M/j5JjqNaYFM58rgDKbPuCwu5DR68/crLaGO4aEJmIWYPxq2ns1yjncD4OZ7IGc79i51c/ox0P
	9zXeeiPaEdFVLhh0YBrqlSbfiQlxNlvwlfwdeTU/a/SpD9j8xIoRj1+Y4mZRxa0ZuABxz2bTSPj
	puss98FjY+5eCKklzf9MQaHpSpaxg8a5jwoQgHp8e/Hhpfms7Q4hwH2WiCwN35nE7jtf1n+2iHi
	BX8v/Ic4N/FH/mf8RrHl5HSt5+4Zg==
X-Received: by 2002:a17:90b:4d85:b0:343:5f43:933e with SMTP id 98e67ed59e1d1-354b3e267bfmr956262a91.19.1770345159460;
        Thu, 05 Feb 2026 18:32:39 -0800 (PST)
Received: from [127.0.1.1] (61-221-120-110.hinet-ip.hinet.net. [61.221.120.110])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-354b64a8a9esm158419a91.1.2026.02.05.18.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 18:32:39 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 06 Feb 2026 10:32:04 +0800
Subject: [PATCH v4 3/3] riscv: dts: spacemit: Update PMIC supply properties
 for BPI-F3 and Jupiter
MIME-Version: 1.0
Message-Id: <20260206-spacemit-p1-v4-3-8f695d93811e@riscstar.com>
References: <20260206-spacemit-p1-v4-0-8f695d93811e@riscstar.com>
In-Reply-To: <20260206-spacemit-p1-v4-0-8f695d93811e@riscstar.com>
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
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_183240_628204_12D77C1A 
X-CRM114-Status: UNSURE (   9.63  )
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
v4: No change.
v3: No code change. Updated commit message to be more precise.
v2: Added the pmic supply properties for K1 Milkv Jupiter.
    Updated the commit message accordingly.
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   | 12 ++++++++++--
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 12 ++++++++++--
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 5971605754b3533e1cf3713a27c48448aeb4d96f..444c3b1e6f44e98b8b2fd5e29820c5c75282abe1 100644
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
index 800a112d5d7054508f03089f0e2adb9965879ebe..e2702a781734beffb331982907a12b20009e37db 100644
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
