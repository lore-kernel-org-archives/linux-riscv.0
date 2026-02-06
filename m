Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D630BECD9BB
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Feb 2026 02:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BVp5FUuipwm6S9pVWWRW9fNguPeh/p83HXYh7QOpNqs=; b=CSV2CTsbIxHQUu
	HK8w4c3LLukUJ0sI1gaICOpH1gtR87XPXJSuVb/tAYT5P9/euI7Nn05fWlF2v7tBnZQkpzG0rifxa
	9h6XZztVCfHQhjdE4zBZtag2PRYHsUJm93AUw+VMbj0FTiKg/bh82OvD5y1bkkA9mVritLMHUyyO0
	WNJw0i2415PaJGWBwUFkNIl1q5uycCQZ22I0PI0Y3YoqKNfpp7h+86+O8Iz0RdvIa7h1M8LQxPl+p
	EOtIGdukCt+Id/RIPHsXgxeTfyLoOZNMdHvLTO2qPJz0rdVMczifIAhu10G0npyA80r+x+lN1aXjP
	iVdGcgsG5BzM30EPUmug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voBe4-0000000AlaA-07CA;
	Fri, 06 Feb 2026 02:32:32 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voBe0-0000000AlZk-46mR
	for linux-riscv@lists.infradead.org;
	Fri, 06 Feb 2026 02:32:30 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-8243ecfbef4so293989b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 05 Feb 2026 18:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1770345148; x=1770949948; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LGIwbpL1NqbuM+Upk52hsWmEQVIHxvtG9sbbv3Y97oI=;
        b=U6WDnDz2pv11SQDoFu94aJcig9jcL5aJpVSda7GBJ+4VWrQ3wL6vstowngbQ3hCe97
         fcjpyNYxSeJIRMBUO4wLfA9eF3RzndVHwWZ+dr0j1lgtQXBQndlveOlrYfRs6Tu2aQIi
         V1j9NfX2jvGQnzcLVyL8fQi10wMKVBiI6jm6c80l11jbgSD3i3nK2yA5u6jj2DRS04k8
         YD04w4zwG+m28xx9Bux8NV/OybDtUMiIXYmQgg8i6j6esoYvOK6jWruKQ8s/J1Pw+76X
         RHhX/4FgMmM0shnmkOFb2FfCn+V9+XBeXAm7aTyBP+NtCaEiWMGOUhxGqmcAbmosXvHf
         LDCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770345148; x=1770949948;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LGIwbpL1NqbuM+Upk52hsWmEQVIHxvtG9sbbv3Y97oI=;
        b=i9lMiuX2ep8T2kUS7o1zXUMq0PPQLabDIvonyuy2GHfxTCX/JD3Ux3xWCwuICtSbDd
         BhCuua4BN8oV7AR1EmOhkHyLEa47NFhvIPy3pIITDWIuFVV7WJcd0u/vPyx+xH7X6F8g
         +C7y80/xR+wHP4PrGP+7J8d1SxVtC+TTHnWV4mwyn7L7uCgwofSUBlmeUv71ixF3Iiq3
         g1Ka6P/Ik9qrQo0ABytTgF+2HxqLg1up4c4z856jAvizcxa3+5I0Wfo7n7smf2qe0L9I
         /OJML1rDbPQzXDS2g4DUkJxKlumZnvwyBne1QfiSveC0W+oJkAwUtngVmUh41iuFkb8i
         +jFA==
X-Forwarded-Encrypted: i=1; AJvYcCWokhmj63y1ZtGK6U9SwUKsHOYTE1s8RqSj99y/jff9ISa2kheXeX/ehUbJ3xXYSop4XobHx8XB28K/qg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyp8z48N8aagmyLwxPJ/47Hy2wIlOQslgnIizEg8JE9kPCrqxkm
	6rW+BIaww6dQM6MQ/EnHkgBblYFYFEJ1J+x9fmphWi1xAGhElAq0VRBBxJAqittchSqg1o9KyRs
	3SxQk8vH13A==
X-Gm-Gg: AZuq6aJVt9DWf3ZKJAfNJLnheLQKhh/LfCsoOHnEgShf8pgBl49nq3HzP8/p+26TAUD
	kZenKhjGPNrOPAos2Qp6q1Iz2kNtO2BM5ehlTTutCMdtztqRPzZlW1QgNEceN95kEMEWMjkdyHQ
	/4UAi48ckzZwelXRXrUUwFbH6JghJFc+8C7PhtjPbGUjRYAZNldxHRdyUtUDH+NWkx2icLuvCXF
	Plbl0Qa7Eb6nK9Cg2DOE6hq1scE4qC8Isq1HvDmw0nro0o+RFj8dq8WA4NiY94Fi90Ac8hGwlc/
	QI8rkiRIqy6YMJ11tqnzpOgeIsC4GizpiK1b1WX/Dymd4AnRdfA0vOYAzv8dW7Y7dVc5ZfeGJgz
	E1v3pEAig90X9TtEkLQg5YW9dOSfpYjKH4q8X+ggJOGSDiIf/+7Jo+MF9kxR2Pi+fkp18Jt8eXX
	G0U0sulW5fyMeALLdAiyNnwJyR52sEVDgapPcuwP9SSJ9nvVuWRLE4Kqhu8E83WMizBl4RoQu0P
	Y4YaDWtHiBge9NOUwI=
X-Received: by 2002:a05:6a20:4c7:b0:38e:54b8:6085 with SMTP id adf61e73a8af0-393ada2dbf9mr1053712637.30.1770345147770;
        Thu, 05 Feb 2026 18:32:27 -0800 (PST)
Received: from [127.0.1.1] (61-221-120-110.hinet-ip.hinet.net. [61.221.120.110])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-354b64a8a9esm158419a91.1.2026.02.05.18.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 18:32:27 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 06 Feb 2026 10:32:02 +0800
Subject: [PATCH v4 1/3] dt-bindings: mfd: spacemit,p1: Add individual
 regulator supply properties
MIME-Version: 1.0
Message-Id: <20260206-spacemit-p1-v4-1-8f695d93811e@riscstar.com>
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
X-CRM114-CacheID: sfid-20260205_183229_053792_5A99A3B5 
X-CRM114-Status: UNSURE (   9.79  )
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

The existing "vin-supply" is dropped from the binding document as the
updated spacemit P1 driver no longer parses it. Only the per-rail names
("vin1-supply", "vin2-supply", ...) are supported.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v4: Drop vin-supply and update the commit message.
     Intermittent dtbs_check warnings are expected while the binding and
     DTS changes land through different trees, but will resolve once both
     are merged.
v3: Mark vin-supply as deprecated.
v2: Remove providers from the dts example.
    Pass the 'make dt_binding_check' test.
---
 .../devicetree/bindings/mfd/spacemit,p1.yaml       | 49 +++++++++++++++++++++-
 1 file changed, 47 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml b/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
index c6593ac6ef6adb72fc48af570dc13fc9edf77ccb..c67b1c6e4e4f9235bd3965be6b68f397734530a5 100644
--- a/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
+++ b/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
@@ -27,8 +27,41 @@ properties:
   interrupts:
     maxItems: 1
 
-  vin-supply:
-    description: Input supply phandle.
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
@@ -58,6 +91,10 @@ examples:
             compatible = "spacemit,p1";
             reg = <0x41>;
             interrupts = <64>;
+            vin1-supply = <&reg_vcc_5v>;
+            vin5-supply = <&reg_vcc_5v>;
+            aldoin-supply = <&reg_vcc_5v>;
+            dldoin1-supply = <&buck5>;
 
             regulators {
                 buck1 {
@@ -68,6 +105,14 @@ examples:
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
