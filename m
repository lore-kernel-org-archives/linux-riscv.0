Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C67E95396
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Feb 2026 13:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zw/LUhe+Wuf4ziOc8qpx/nMRUz8UPggBwVMiYOzYLAI=; b=yZHFsv47uFiBll
	kUjdfoEcoL+2CI6z/+b27NmGp50P+NL+BthELQO1MT9g+abENQ9suKPHYjY50I1OGrk+/1FZCrIId
	XO9L6GBUqvyR8uQgxa8hqQZLDGVsj6Ke/ZhPZryDonTRp1FCk7G3BUlJr1RSaY2tbDXHamGeGFSpU
	9fJGRanf8VHvVsvkpSDaVbg+joXwvcmiKVFbOFY1qIY8/CwRO61cdsXxD//pplqNUSa7n4I9zMj8e
	3LsvPqpw9+CTp59Ua2A0wU8iFZNE9we59pr/EGlOHjeFoJgYoIahn3ZycN2ZWlmmX1tVw1sjPs1de
	MZ0TTd6UQu7IPIcyW2CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vncql-00000008Uzo-27Sc;
	Wed, 04 Feb 2026 13:23:19 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vncqj-00000008Uyw-32Iw
	for linux-riscv@lists.infradead.org;
	Wed, 04 Feb 2026 13:23:18 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-2b74f839bdfso561993eec.1
        for <linux-riscv@lists.infradead.org>; Wed, 04 Feb 2026 05:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1770211397; x=1770816197; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=od7qXbwDJz6jtm4G2t06KDZlfQtmuOYuFdFOxoNtva0=;
        b=tEAi3TiptEnLJcoVGlVftkrjrZFicc+8ccS7S3yf09rrrwO8dRscshvhpgJhmJcrNZ
         xxSuiDMzwIWyE/S6HXTdOT9gs1XHQ9EaNTBY4JB9a2nI0C/Au9Cmn55sNw8RTS9fax+u
         HSWBpxBy57EvId6vTO7gO6Nkss/GNDwgiqMsj1PeqGmdjiaIr9debAKxYiItuMLbfZ6S
         NS+PLiPgQh5FjPyNdFZ1b24umlSUt+DA5Mhs3rEan5Ifgjp5g41qUcq9mfpY45HXCCvY
         QBNPsLDXXBy8oL4Tk2LKffGM1rtGu9E9Ulr22mSgMmtNrTBp1TrvYMmBOjjORL3ZNxJg
         BzHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770211397; x=1770816197;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=od7qXbwDJz6jtm4G2t06KDZlfQtmuOYuFdFOxoNtva0=;
        b=DZADpGJHK0q8ii4z1k7/ophcnVrWwoOF/542fuHZpULHZeYSyMwn/MPCVqpfWhc41s
         G/yilAd3TrOAPHxj0YQF4U7prDUD9g+Ij73AFc48tOZbxb3OIfouO81tw50My24SCg/q
         KAocZUZsVHqCWd0JIktTKtH2wRDnt2SsPBA7YmoR2Xkz4EFRLRYXnbjKARklAa7zfwxh
         lbglJEcqYM7kNQQn1aPfNNASF6C4uUuvIpXQcX8gqdhpy837LWixscq6qpH4fttscnB6
         b0D9W3QoZYzqxYn0uP7EMNkuaF0xo47oGo4w9tHKh8BlE56wQitbXLHUDUK4lo//stI3
         RMsw==
X-Forwarded-Encrypted: i=1; AJvYcCVCbXi5GkQJ41gEq0FmIscokUe7J9hZ7DKjc+y051elAnAu8M9dPG+6RwaBDJp8kJErAJD41cjcq/axgQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywfy2sgkeSwDQdTV0/4J4XqbziKqX0RfiPSEjDDTAzIkdNbJ4qV
	4sXb9OlxqVvGRpwzZpXUkNeXY97/LC4/u8vPrhMDXteCIvwgLTU/wpT1catfo5cTQwg=
X-Gm-Gg: AZuq6aJBzeNEbkogVTrb9WdCI+Go/t2aMde9rlKOcMqAWnbx6w/m7/p+OLPAfLA/TTV
	Jbo51CXUEgmmQbC4232+fvTkfnWVt00iM6s6vkTaqdvo3plTh1CjiOh6QFYe58rd591XKxqy14b
	1nF7IrDKhTiT4kJEIgdTah3JHnfn6WZErlZefdKUDdNauWFBJbAVECwByFSyV5xcqUBPBchoRqf
	S5vj85CaVBABHiBVgABYIPjc4ZLbmygO9f6Y1qXKPgS8YxAZ01DZsq3cAwqBXznTSWNeTFcJBVv
	gDrwebtsSD1VWLfooZ/rfaj5sMCAZTBS+8we7M3dmPRljHqaNe8DWIbbASr/idcrNRqUGhQEh9B
	7gBbvimv2yITe4Mq+qINv4f3laK8BysDZ3qLvbGchS0ZfNdeeJFlxjeVLod8x1HEgCPUOrwOhWi
	/uHezjRIe64JtNNpLNOUplygWqiXv+yEc=
X-Received: by 2002:a05:7301:1988:b0:2a6:a306:efdb with SMTP id 5a478bee46e88-2b832d7c5c4mr1189345eec.3.1770211396750;
        Wed, 04 Feb 2026 05:23:16 -0800 (PST)
Received: from [127.0.1.1] ([2604:a840:3::303d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b832fc1d50sm1416731eec.27.2026.02.04.05.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 05:23:16 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Wed, 04 Feb 2026 21:23:01 +0800
Subject: [PATCH v3 1/3] dt-bindings: mfd: spacemit,p1: Add individual
 regulator supply properties
MIME-Version: 1.0
Message-Id: <20260204-spacemit-p1-v3-1-a894b3057026@riscstar.com>
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
X-CRM114-CacheID: sfid-20260204_052317_769280_FD9B085A 
X-CRM114-Status: UNSURE (   9.44  )
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

Add supply properties that match the P1 PMIC's actual hardware topology
where each buck converter has its own VIN pin and LDO groups share
common input pins. Supply names are defined according to the pinout
names in the P1 datasheet.

The existing "vin-supply" is marked as deprecated to avoid warnings
as dts and dt-bindings go via different trees.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v3: Mark vin-supply as deprecated.
v2: Remove providers from the dts example.
    Pass the 'make dt_binding_check' test.
---
 .../devicetree/bindings/mfd/spacemit,p1.yaml       | 53 +++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml b/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
index c6593ac6ef6a..41f784408e29 100644
--- a/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
+++ b/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
@@ -28,7 +28,46 @@ properties:
     maxItems: 1
 
   vin-supply:
-    description: Input supply phandle.
+    deprecated: true
+    description:
+      Main power input (deprecated). Use individual vin1-6, aldoin,
+      dldoin1, and dldoin2 supply properties instead.
+
+  vin1-supply:
+    description:
+      Power supply for BUCK1. Required if BUCK1 is defined.
+
+  vin2-supply:
+    description:
+      Power supply for BUCK2. Required if BUCK2 is defined.
+
+  vin3-supply:
+    description:
+      Power supply for BUCK3. Required if BUCK3 is defined.
+
+  vin4-supply:
+    description:
+      Power supply for BUCK4. Required if BUCK4 is defined.
+
+  vin5-supply:
+    description:
+      Power supply for BUCK5. Required if BUCK5 is defined.
+
+  vin6-supply:
+    description:
+      Power supply for BUCK6. Required if BUCK6 is defined.
+
+  aldoin-supply:
+    description:
+      Power supply for ALDO1-4. Required if any are defined.
+
+  dldoin1-supply:
+    description:
+      Power supply for DLDO1-4. Required if any are defined.
+
+  dldoin2-supply:
+    description:
+      Power supply for DLDO5-7. Required if any are defined.
 
   regulators:
     type: object
@@ -58,6 +97,10 @@ examples:
             compatible = "spacemit,p1";
             reg = <0x41>;
             interrupts = <64>;
+            vin1-supply = <&reg_vcc_5v>;
+            vin5-supply = <&reg_vcc_5v>;
+            aldoin-supply = <&reg_vcc_5v>;
+            dldoin1-supply = <&buck5>;
 
             regulators {
                 buck1 {
@@ -68,6 +111,14 @@ examples:
                     regulator-always-on;
                 };
 
+                buck5: buck5 {
+                    regulator-name = "buck5";
+                    regulator-min-microvolt = <500000>;
+                    regulator-max-microvolt = <3450000>;
+                    regulator-ramp-delay = <5000>;
+                    regulator-always-on;
+                };
+
                 aldo1 {
                     regulator-name = "aldo1";
                     regulator-min-microvolt = <500000>;

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
