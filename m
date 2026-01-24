Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D0B9D6CFD7
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jan 2026 04:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7050fn/X5qrKnZwN1YJ8YEY0H5/wpRna9iMvuNGTV6A=; b=UDF/g8hXcqS252
	UhDOIwDVPXhly5Lq0/TcdduhJ7H1YSJD6QE0J80yQMu/jo38lPRzn+i/4ZumFCu7u5fWAHDQBuFFF
	GHbccF+9HI1xco4p6MyVpjlyWWXZFJF8nWiZoQopQGbCJ9Un+QQL62kxkpD0G/qdSuIXXlMOA3uWB
	ujkwPVV/VXgZxdvckZGwDO0X6M2MGRkMGO++nufjxtPsu0VZ/wTxAJ+58QO1B6p+fQmcT2uktg/p0
	q0HTzILgnP9XVLfQFLlyXUMeT7yEQVOwzhXCvg22M+9GeLrVmMYyq7snegtV1q1CBquaHkIasqmhq
	ReUiH+VzK1fWVEat+9cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjVHP-00000009z8W-26ir;
	Sat, 24 Jan 2026 04:29:47 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjVHN-00000009z84-0spf
	for linux-riscv@lists.infradead.org;
	Sat, 24 Jan 2026 04:29:46 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-8230c2d3128so1114905b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 23 Jan 2026 20:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1769228984; x=1769833784; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dTPYDNMkVOo0iJht/gmiXkCD/RZGstsRjMC0icZDXcM=;
        b=XppABMsFWTIk6Mv40zLH4k18vblDSwEyHJJ1ZQmBB/Y7joxCGS9Q5vIbtdWvbDFWK6
         hO2rCqE9M8zRaQDKg1ucxUJJG/Scllb/TBD5MU0KgOoNWTichpI8NW32VZUfO+bD8Z8C
         /PXFqc8ZHMiKk6DdUR5CpHQn2zPrivvliEFM8CxdKZCTGNYRUqAzZbfUtoIVspwSAMv7
         /A4Gf8DzULo2r+Tw20Icsn1raLEMRgeFpv5P/w83YFP++oCdy30jBMJjkKldjwub1Xgf
         TCd06ntara0xer6vEO+ZI1z/QUIpYSoE1UxaQpLoQOPrtURuBv2nE+cD6K4lViTT67qK
         T8Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769228984; x=1769833784;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dTPYDNMkVOo0iJht/gmiXkCD/RZGstsRjMC0icZDXcM=;
        b=nxVbXGbelJcdGbobweCIaQq0p0JXkiPZLrJM/J/Dtol29gxAZVSXJmidRF5wjhkbUL
         5iOo/YfHJzMR5Vxszo1lbkJAZnwTuBEe/LMFBFcn++RTvpdd3nzpmkwRpx8uzCe+AA0W
         81fJ6FaFjyI4wftPCu9XNCfoQFBFttCJXKttpNptXj6ZJFJY7dDNsvAMAyDOLtdDoSik
         zArb/txDVdC8/WHTbaeVicASlMwTHZJhya/VsokzNF8ofeYeM0AoVvakQ1+67Bj0puHG
         zL3SvHc82cCqTdLfiRBjFWthLUwkl2TqdLlzb60Spt8mlty1j5ZEYR3vWKGe/e8+1b8q
         uh2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVLtoZjDLIQGw0rDyiaDHajihka1JdS0JZW64gV1Tq1oyydMZNo6UVQNSdh5et1KE0H+a2d7cGSOwDUqQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyI++NdJXRqZ6oRbQGfhkysa5nGTIQAaJENhiJyVoSCiiGtkydP
	Jc7RvVsgkjq4t9PMZMjvShc01aSV9UFKM6i5E+gWNTf+4wNugryqkF/YF72HI0bIqLixjH7VDWL
	9DBIc0Qw=
X-Gm-Gg: AZuq6aLrfCs5Vf2tw42sRfvdxy5ds+KFcbL1Y2cwkYNj5x1VfNQjScKqsDSFKBS/Kc1
	PPpExRv77PqM+VyFRySvGPpAvgsBq0G4e+47jsS79tsg4508XUHs6ft4B79Wf6bYWTtNceEIW9l
	yKF0pTvxNulI788vstCUg1rGcTm5PVWJqmVFrcsei+hX9kYay/GiHgozZ7eZwWr8L0QHZ56ehPt
	tBvS5zM7/RO4zKg1+cqlkNcLH5KIZgk+VhjZXH5675KyXfvGRt+kD/yp62FS7YhAnIYj7wjbfVq
	qtESc3CdSrJVxHdrLuUg8ywQlCrty4F3+D1P7Dg4SXngYJRcjGH51VbTxuLA9ZL81kMXiZLLyko
	l3Qjq/OWKpwMRPG/M+tMJsqmORWw4W/KCvh9dPreWTnmJNkXrUe8mdWHZIQ7SKCEPpiwwTc9U0n
	KCT1jV8EmYWDTxjw0QzrI5MTLa/Q5sgDk=
X-Received: by 2002:a05:6a00:244c:b0:7f6:4922:89cc with SMTP id d2e1a72fcca58-82317ee9cf5mr4325829b3a.57.1769228984246;
        Fri, 23 Jan 2026 20:29:44 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::30fc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8231871d51esm3469423b3a.38.2026.01.23.20.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 20:29:43 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 24 Jan 2026 08:20:17 +0800
Subject: [PATCH v2 2/4] dt-bindings: mfd: spacemit,p1: Add individual
 regulator supply properties
MIME-Version: 1.0
Message-Id: <20260124-spacemit-p1-v2-2-2c86b06694ba@riscstar.com>
References: <20260124-spacemit-p1-v2-0-2c86b06694ba@riscstar.com>
In-Reply-To: <20260124-spacemit-p1-v2-0-2c86b06694ba@riscstar.com>
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
X-CRM114-CacheID: sfid-20260123_202945_262330_052BA164 
X-CRM114-Status: UNSURE (   9.70  )
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

This allows different boards to describe their actual power tree
connections in devicetree rather than hardcoding supply relationships
in the driver.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: Remove providers from the dts example.
    Pass the 'make dt_binding_check' test.
---
 .../devicetree/bindings/mfd/spacemit,p1.yaml       | 49 +++++++++++++++++++++-
 1 file changed, 47 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml b/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
index c6593ac6ef6a..c67b1c6e4e4f 100644
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
