Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCCD7FF885D
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Apr 2026 10:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=COcQiZjvGJaztQPgryCiY+2QnNuEwELkrQfYjYrDTOE=; b=b3MRKTFTuTzpxc
	dRZgkHdCQ6YIu2JODll7zfEdZwuV6rtOaRZxy8197OLzv+47dMgK/dda1kri90E6TNM6NPv/5YU8O
	brUnd44Kt/WCENj22NAm9AGyWD+FXJYVA4DkdFZrvQRRon1XY1KYiworHS3DTHLLFG2OU7Etu+xJq
	3Kl+UObSkeMl1vNiyWU5ZOVcqKkoRSRL+vsC70Jy1HRlzDs/xvVc1jvZAPGanIfNjzl/N1PmnAqYH
	sQ3Y4Vr2eD83okuY2jwikNObnIvyA4K24GR61nuTHsu1thEdOlXCpHHhq1QURNCoCS/l1TOMAcO60
	z6olcar2gyr16NL1SAaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHfyX-00000001D0O-3iN3;
	Tue, 28 Apr 2026 10:47:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHfyW-00000001D0H-3qxW
	for linux-riscv@lists.infradead.org;
	Tue, 28 Apr 2026 10:47:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5F17860142;
	Tue, 28 Apr 2026 10:47:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 249E1C4AF0B;
	Tue, 28 Apr 2026 10:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777373252;
	bh=biVNnj44nyROszDjAQG/JHS7rf+VdCxkoSyME9XB4h4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=X39aa3BpFBo44aZLazv1bsS23sFrNYYYYTQSft0BSJAxKWdtGI71gfQpigMoU6QB1
	 zvfuzk2MkVWMiTmCIc9CrGm8v+/tWKkFlgCG9kkb43/yb1lla1xT6d4iLfPgdNAjLr
	 gAc25FINjZwaeYtEErB0QC5R5HoBJ1SUiyo3EoDHkqBsTHT+g0W5i54xzdonoCMSS8
	 iC/qQOgR9laIINUdZz17JO6FHd+GckW6Nnf5dnIkFQhSXxtn6INtdJA2vUGPkPiDYA
	 eRhfiu2v8rNOnPaWua2xG5XzDKWlIad87ot0cmF17AeVkaHyZhjaXTWIGG7QBBVB7/
	 c/lFvylGFWkKA==
From: Yixun Lan <dlan@kernel.org>
Date: Tue, 28 Apr 2026 10:46:50 +0000
Subject: [PATCH v2 1/2] dt-bindings: pwm: marvell,pxa-pwm: Add SpacemiT K3
 PWM support
MIME-Version: 1.0
Message-Id: <20260428-03-k3-pwm-drv-v2-1-a532bbe45556@kernel.org>
References: <20260428-03-k3-pwm-drv-v2-0-a532bbe45556@kernel.org>
In-Reply-To: <20260428-03-k3-pwm-drv-v2-0-a532bbe45556@kernel.org>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2215; i=dlan@kernel.org;
 h=from:subject:message-id; bh=biVNnj44nyROszDjAQG/JHS7rf+VdCxkoSyME9XB4h4=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBp8JAzbxoxvfNt5e31UbcJ3YuMnHh9PBtr4V95h
 HF4T2gTpF+JAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCafCQMxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0SCA//VjCRt3c1R06Q3Ls9SLP+8VAZ39oa1vThtZULnb59dH6hwkXOqMK5l
 /l+gQLMe5hnc0cNVEGzccbtyc0ez+yaV8bJKPnhSiReNo0fHZWp6C4O2KYrOr3qVo3hP+xKurjH
 /Sgc5KVknQCuL23CpZYrI84Hiu7X9nBhtz/Lb+WY/NKN/IWFQv7PEh1e5ucTbWi54Yw5WduLfsS
 iO3YGjIyy235czRMWE8T588LUz3Fcnwzjr8JBlTjUSd0MjC/jpgVGN20M4OrQcmC7yVj5RPYZCV
 pGpQgK1m90gi/BuF6TRKacWIZ5Zvev5IN4xoX6FO52Zi6ACEpz5Id6GFpB+bdcK9nOSBAes1Yxn
 0MBv1xUFY/lT413wWEkrUWkQJj3M5CYyWu/V8YnMiOExjCYajJaiOir3xNVIm7b958hmyFpTGZf
 0h5xSWSxDXiic+4dmOaHBEHbNVkFMhidfnsrpYgeKx+ykXptDspFNLPmLjw6SQw9drzZo2w2goG
 8jO3N1rEPiFIWBd4LZbgf0+/6PKFeTLmJ2pVZXV4pbkmMfdAYUDjz6qyMwNqSOYvONkrJHyNbLY
 6dAa8Y0zv8YJXqDWnsVEMSfPjgU8TCDe9i/VHb3mCbKEGVmZJMOrolwlMTZl9PHqn3fkjFqMmPV
 mlXbBjKEKrv4tOI9/l+WxWETNki900=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
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

The PWM controller in SpacemiT K3 SoC reuse the same IP as previous K1
generation, while the difference is that one additional bus clock is
added.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 .../devicetree/bindings/pwm/marvell,pxa-pwm.yaml   | 41 ++++++++++++++++++++--
 1 file changed, 38 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml b/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
index 8df327e52810..f1422a401b6b 100644
--- a/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
@@ -15,7 +15,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: spacemit,k1-pwm
+            enum:
+              - spacemit,k1-pwm
+              - spacemit,k3-pwm
     then:
       properties:
         "#pwm-cells":
@@ -26,6 +28,26 @@ allOf:
           const: 1
           description: |
             Used for specifying the period length in nanoseconds.
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - spacemit,k3-pwm
+    then:
+      required:
+        - clock-names
+      properties:
+        clocks:
+          minItems: 2
+        clock-names:
+          minItems: 2
+    else:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          maxItems: 1
 
 properties:
   compatible:
@@ -36,7 +58,9 @@ properties:
           - marvell,pxa168-pwm
           - marvell,pxa910-pwm
       - items:
-          - const: spacemit,k1-pwm
+          - enum:
+              - spacemit,k1-pwm
+              - spacemit,k3-pwm
           - const: marvell,pxa910-pwm
 
   reg:
@@ -47,7 +71,18 @@ properties:
     description: Number of cells in a pwm specifier.
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: The function clock
+      - description: An optional bus clock
+
+  clock-names:
+    minItems: 1
+    maxItems: 2
+    oneOf:
+      - items:
+          - const: func
+          - const: bus
 
   resets:
     maxItems: 1

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
