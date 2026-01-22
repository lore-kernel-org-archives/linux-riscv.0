Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7545FC44500
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 07:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b5htI91//KDlU4+EalXfZx9WPGRYX9sk7DEzuDHiG1g=; b=F7l1A7BP+RAzj9
	UjecDDnFE5P2GRCZvC+6QG1XBUvK06C7VFKSFndImCapgvjf42HlKcsggTVfEERKtgBxEeRvrMFSb
	VsJh831nmpfbqkGYQHJHBeZZ/sAmwiqFI8WaRZdaXHXJB4dzvijA/Umyt8zm8R4tKwhyC4r11Y6qg
	ybmXnvZ1Kk+CMKCwffaN5MyZgAsKGKxKNwM47UNHxQeEQJHtq5tBa70mUwQGD+oJeNaBhXXfhIq3a
	2HUJv/XLag9+BzAV8eJfJZUaGdGJ3kMnGV6znuMEohHbzcB/sE5yP+zu9p5tDSbMPHBM9u8ca8HCM
	8lkHl94TF3XhvKW7ztXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vip9E-00000006Xfr-32GA;
	Thu, 22 Jan 2026 07:30:32 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vip9B-00000006XfQ-0UW8
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 07:30:30 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-29efd139227so5005035ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 21 Jan 2026 23:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1769067028; x=1769671828; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X/UtC0xgbxRNfydioTj9MKeI23LF8ZBahNkg1gMzORk=;
        b=GAyiE9LpYOLWGOf2jtjDpuRkezsyrGKMv4UPOVMnNdI7PL/pNRIyCD5bMy7OumkU26
         pVvncTbMUow9b37Hk1bRNTo7U1N2Az2VxxvfbTwT7VkkqK3M/A41sMVWvX8JIfgn6c4V
         wwLsQQU3YCmbJDt606bi0JvgH+QcLvylDhV0dkj4uex2Ee/IjvSA74NkubBoP4ct1kF2
         Ax9OfK6tQMTgT/c6AxBdzNR0l06VSA/nZif4xj5ztreS7JUj0GkFkTvs7ICwnAOVqIHq
         800FgxEN4U3sDYOxiT20oE9F4kEE7yYh9TL8flE/BQxsEVd57dO0KFHys+zWs/x4938C
         D0oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769067028; x=1769671828;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X/UtC0xgbxRNfydioTj9MKeI23LF8ZBahNkg1gMzORk=;
        b=WFEe924SlBPNNnADhqqR7vDAELIQiBTyvO+BgEFefM7Vo1iU0gbltZoUXH9px7DRRj
         2XOMjr2I3S/qItrYwq09ve65SGa0t6DvuUwMiFRoWgAFuxKt14TkAks6m2OfnmTpyr6q
         t7bLOsypvXfgbOxKqky+zTj7gUzHJKPEcxO9tO5JAVT7cTywmxlm5tKlk4ObfU3/3Z0p
         3gLVxu2OQQKPSE7BlYDfHiOeXnzDw6rf43onsd3AOigr1tP20T9V6lrTcP0QSv36+1D2
         iTL/T4CVoUu8rC89nHQtXRkRlYvzeZdh4aQ01JtXadQKEfnbQjGLcHHDNZ7FVKksKbSQ
         J97w==
X-Forwarded-Encrypted: i=1; AJvYcCUytPGK29OCcgSKbKUqCQPRx2emkOV94fW2pDBzrVye98827whMO0HG5n/JqcGeSVxl2k5M2HG5gf8E0A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4QDmzzNwunm8JcJq9XQQ2m8fBvD3mAcR2nCgzB1KFsUMJxmGw
	kJVZUK5ZbyMi86JBxsJ45UKerdvrbfUXU7a4chxwO12pxbXt+XLhmeZ2mzo43DZLELM=
X-Gm-Gg: AZuq6aJm/+yshkTxc7iAxX3SHqC23LKNvMRY0dS0i1EEcmWl7OFPdP/usjx6yVWDh1+
	yXJvmOy4mFoAFhBkaContdwlyZfEKmQa/X3MtbB1KgiVS1TDCM7T1pmUqeUqGP9stofUM0b+hUj
	PvdI81Bh4Zx+TLFBhZh2wktS096ygfBArpStg4zAUzMTDFGUb4q/f9Szzinmzt4cSr+Cb9emSc7
	M9zFHUcRr4YEzkuDpz8KWtwvzeIF7IEcDYVJycbdCeFOM9JoJfPdiwRMMnZY/yx6gybPnj1xmdW
	1jghDZwg30ohkVbI8LjNRS4u7TgMuXmipLCEia9HnuViwis5dybuaxhS+OkEMPrdTG4HnienUgF
	kFXP4g9M2SgXr1GmuPQa3JwN5li6YiCJHHncGnOAkqjHkeCtKGuLqXd36np551+SKpjIX04hJm+
	n82x48Jud8E7OWRmrVJygTSXnXPJ29+cQ=
X-Received: by 2002:a17:903:2343:b0:2a0:c1ca:20f7 with SMTP id d9443c01a7336-2a7188a97ffmr177066245ad.15.1769067027753;
        Wed, 21 Jan 2026 23:30:27 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::30fc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190c9edesm171691845ad.23.2026.01.21.23.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 23:30:27 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 22 Jan 2026 17:43:43 +0800
Subject: [PATCH 2/4] dt-bindings: mfd: spacemit,p1: Add individual
 regulator supply properties
MIME-Version: 1.0
Message-Id: <20260122-spacemit-p1-v1-2-309be27fbff9@riscstar.com>
References: <20260122-spacemit-p1-v1-0-309be27fbff9@riscstar.com>
In-Reply-To: <20260122-spacemit-p1-v1-0-309be27fbff9@riscstar.com>
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
X-CRM114-CacheID: sfid-20260121_233029_471317_30280FF4 
X-CRM114-Status: GOOD (  10.29  )
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

This allows different boards to describe their actual
power tree connections in devicetree rather than hardcoding supply
relationships in the driver.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 .../devicetree/bindings/mfd/spacemit,p1.yaml       | 58 +++++++++++++++++++++-
 1 file changed, 56 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml b/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
index c6593ac6ef6adb72fc48af570dc13fc9edf77ccb..abdc93b9a67b1872c8fe6955abd950622a0b69e8 100644
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
@@ -50,6 +83,15 @@ unevaluatedProperties: false
 
 examples:
   - |
+    / {
+        reg_vcc_5v: regulator-vcc-5v {
+            compatible = "regulator-fixed";
+            regulator-name = "vcc_5v";
+            regulator-min-microvolt = <5000000>;
+            regulator-max-microvolt = <5000000>;
+        };
+    };
+
     i2c {
         #address-cells = <1>;
         #size-cells = <0>;
@@ -58,6 +100,10 @@ examples:
             compatible = "spacemit,p1";
             reg = <0x41>;
             interrupts = <64>;
+            vin1-supply = <&reg_vcc_5v>;
+            vin5-supply = <&reg_vcc_5v>;
+            aldoin-supply = <&reg_vcc_5v>;
+            dldoin1-supply = <&buck5>;
 
             regulators {
                 buck1 {
@@ -68,6 +114,14 @@ examples:
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
