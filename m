Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FEAD10FC460
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Apr 2026 00:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FUkf3wgyxd4UIg9VztM/RGf/VHETQSgB4G2iuuN+J4E=; b=d+TE2rInNR8syB
	xW23Zl85xEem9YSqHPjAHKoD2qJDvMyOH4STGNgtV+0+xciZg0wZiltCHVgvHnxXA/vNc6ndX+2N5
	ZGw6AO9944dIEU/5f4T40H6YkOM1MJUwxAfUhSr1FKoGAO+4uNYTVdFGM0JOOepK2K9rHL/aZoKte
	CDmmwIbtv4czv9lCzBgsvQxMETgaSz9BCeQmnGxkhj00V1T9XXVM6pWw3pfVxGyZGhnp2B2NxpbAg
	KizCAjP/ldcl0sOj83R9rSg3o0P8vj04QhbNp4awvQuYQMYdnhWA73B5SAyX8fJjMkErMTIfhG4Ct
	QNt06rNw02jesBmuBTiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAdWW-00000009YR3-2Yg2;
	Thu, 09 Apr 2026 00:45:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAdWT-00000009YQF-2fDX
	for linux-riscv@lists.infradead.org;
	Thu, 09 Apr 2026 00:45:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5C616407F7;
	Thu,  9 Apr 2026 00:45:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C447C19424;
	Thu,  9 Apr 2026 00:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775695528;
	bh=GjjLDPjnFGSnPCHOn1ibnK1BzP77ajzwwixqSGOk2HY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=itXRQpT298TTmoBnNxJ944o2GBew+3i2ufMN7Ajf6mnnqm6wBZDhJwJHuV/S3Hm/P
	 dKiFOnN3POTxxEI5M3f3WkmLP3/4SbcXsDcq9Dtq5Uwy+ZTU+fow87dxBGAHQKadw6
	 gdfbT5G+VDArjnW0ef32CIo/gzrwfrJ6I1EHtZnSZwig6TlfkzqxBWZLaVMIfFUOQ1
	 I6Jje2M4sOBZ3LMqBlt+uy3sdHFF6IkhQMxLwm8Rdirfj/rN0hnddJRpPAlfrY4fDu
	 BiOBzffn0sM1L7FhotRty3Ii92eQIHFH4JvIQd7u+F7GGJS5j3iWaNMwv8y+EAyIy+
	 2YdDE492eeVbA==
From: Yixun Lan <dlan@kernel.org>
Date: Thu, 09 Apr 2026 00:45:11 +0000
Subject: [PATCH 1/2] dt-bindings: pwm: marvell,pxa-pwm: Add SpacemiT K3 PWM
 support
MIME-Version: 1.0
Message-Id: <20260409-03-k3-pwm-drv-v1-1-1307a06fba38@kernel.org>
References: <20260409-03-k3-pwm-drv-v1-0-1307a06fba38@kernel.org>
In-Reply-To: <20260409-03-k3-pwm-drv-v1-0-1307a06fba38@kernel.org>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2472; i=dlan@kernel.org;
 h=from:subject:message-id; bh=GjjLDPjnFGSnPCHOn1ibnK1BzP77ajzwwixqSGOk2HY=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBp1vac2ggiRrXysr7NeyHf0sal5mHzkegemt3Zq
 SAEbP1WPYiJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCadb2nBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0TVg//TdIVeocbpZIR0KwWB6pCxILp6k7d4GN/2HcXvgNIk6xQS9zfXVho9
 AOXaDylRtNIhr5OnHcsleIiLTWSqsxoE7EwsetNlJ8ItbRZCk3AQDlDTmNwatD84n20RI1MfL/w
 6fUulRAWvfXVE4GIz3yOP+0dm5TevZxyrRVDXoehY1Sf7RVYdi9YkiEpAphMI10nshwhpmIdF74
 3RZGiQ0RNc25wEWR74/fDHU3XKUTx1YDku7Ok43kWvHJJMw4SdJrbjOiTisqEHq+4cY+leQHosf
 CbfzFpoT0amZYqa7joTvm0n3x9PHiUFb2Vm3qVnf/43jRzNqawJKS8M/j8ms7+nsjzsQbuQoMU9
 C+8S/23DC6O1gbBnPTAs3HOp111saIR5W7IAbB34lvo718VDAaf5nwBc64S6OoiH1ewCphFg/jz
 6/NL+qWH6/1Pc0J0nz3tv3aX5WfH4ixuphd5TTyyJS80+tfLpXjveFmdBcvgsWElgarsgn6vsCU
 4v0s/34giguywfOOJGlQrKqp2QjGy+0Dz3hRTiVzAtfVf3vtgKI6kY2bsl3KkWu11QHdwsZTkAc
 dpZnxoxcCmM7DVLo5daHIEdLofn08kjDcMf59SqG1Ut+aewmeujlyPwWRWuWhJa4YjeKPNz0Wr/
 xQNk3H9hFNcEgmvAF9+CNaoHJb2GDA=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_174529_735241_A8648AFB 
X-CRM114-Status: UNSURE (   8.97  )
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

The PWM controller in SpacemiT K3 SoC reuse the same IP as previous K1
generation, while the difference is that one additional bus clock is
added.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 .../devicetree/bindings/pwm/marvell,pxa-pwm.yaml   | 53 ++++++++++++++++++++--
 1 file changed, 50 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml b/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
index 8df327e52810..3427c8ef3945 100644
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
@@ -26,6 +28,38 @@ allOf:
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
+      properties:
+        clock-names:
+          items:
+            - const: func
+            - const: bus
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
@@ -36,7 +70,9 @@ properties:
           - marvell,pxa168-pwm
           - marvell,pxa910-pwm
       - items:
-          - const: spacemit,k1-pwm
+          - enum:
+              - spacemit,k1-pwm
+              - spacemit,k3-pwm
           - const: marvell,pxa910-pwm
 
   reg:
@@ -47,7 +83,18 @@ properties:
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
