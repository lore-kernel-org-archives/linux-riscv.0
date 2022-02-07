Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD66AC433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Feb 2022 16:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oDAi+761ytcqb7pVtGAx1xqrUaJ4bIJV2fOHeUPVfP8=; b=4xvuXX1CE9Ynnf
	0U0mwyCGaQbgw7y/WVqlPr8BoH2zmH4F37OU4zcqpkcwJ4GOJSqX5FthWbt5hPS6SJL/hOJrzEhzG
	QPrCXwUTwt+NH2e7zbBf0RiWWdmAam7FbUE5kbNyH6uUVCwf3PSqjShgRaiEPG2MoE/HQu4XKgzni
	y3SH8hATprWClVthHsykUswKO97qyfe0Ztl8HE52BHQtQwKwNvOnM1PXgqp9MGdt/42paU9mehj42
	fOQgjEpn6zeIaFnGOvro3cUprjJKWvelfuayQKMfc30er+iHU3U+gVIoErtE6scXU+Fs/1kMTkD+M
	O7O1a+KzFLaFkQXZdJPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nH6wU-00B6ez-MA; Mon, 07 Feb 2022 16:32:42 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nH6o8-00B3s8-KP
 for linux-riscv@lists.infradead.org; Mon, 07 Feb 2022 16:24:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1644251044; x=1675787044;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a6FIsAxlS8CipozOrCRtXjkQdiL4ZSwawArQFXpf6H0=;
 b=HEJV+FvBOvo2Xf0bSJarq8vVKOT//zeB9v+BsDmfhiQCtysl3frm1k3y
 fDwEyIEQWFjMYe0Yy7e3hCFkeUmIV1iYROaUZfpRmpSuDIvhvay2TS+Db
 5FslB3DyxqGPR8VVWwmvYINel4kU7lK5Mz/MGxfiQHNkVXN928LKtQFLC
 y+ZATajkozuQpg10T/DJWAhYf+VewPOMU462kGoY9IBKOWM23HwG2dvyk
 PxLhWy85SRcM5itXzFMXbhhKyr7dil59+Zk/hl3Nx/phQ6WC8AzcAR9tz
 zNY/liKrwAHlWnTJqOZTmOzMf6QVtwNeQ1xrJcjHs/Z/wU8uSTyv0ZvC1 Q==;
IronPort-SDR: olD1nXIeV6qYui820sqHCq6LXGhzzDFLcA3zFhI0a2QMW+hz3g32tD6oF1MCz3bb06LdU7/KX6
 R6/kmpyiF8Dv9HrR9UFo9Gfrm6so3M1KG3lphrAP+J5+KrO98GBQh/P9JOMj+hGDAtR0Q5Cybh
 O9Inum9/3imfhb9KIOvaGJjhEj/eODimVqMoyiEYlr+vrZ5t+FWmqAXeoNsaHRGCRe1uEQCoBQ
 uDkM0MkfdrDqEfgD0SqRO9rpUl4niYDaQyx38XpGESDSK79jIKPSSMNJuh3DFuN/COxTgXpco/
 Eea5hWLFPkMtjV5GFEgKTGX7
X-IronPort-AV: E=Sophos;i="5.88,350,1635231600"; d="scan'208";a="145139958"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Feb 2022 09:24:01 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 7 Feb 2022 09:24:01 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Mon, 7 Feb 2022 09:23:56 -0700
From: <conor.dooley@microchip.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh+dt@kernel.org>,
 <jassisinghbrar@gmail.com>, <thierry.reding@gmail.com>,
 <u.kleine-koenig@pengutronix.de>, <lee.jones@linaro.org>,
 <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 <geert@linux-m68k.org>, <krzysztof.kozlowski@canonical.com>,
 <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-pwm@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>
CC: <bin.meng@windriver.com>, <heiko@sntech.de>, <lewis.hanly@microchip.com>, 
 <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
 <ivan.griffin@microchip.com>, <atishp@rivosinc.com>, Palmer Dabbelt
 <palmer@rivosinc.com>
Subject: [PATCH v6 02/12] dt-bindings: soc/microchip: add services as sub devs
 of sys ctrlr
Date: Mon, 7 Feb 2022 16:26:28 +0000
Message-ID: <20220207162637.1658677-3-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220207162637.1658677-1-conor.dooley@microchip.com>
References: <20220207162637.1658677-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_082404_788273_E36CBC8E 
X-CRM114-Status: UNSURE (   9.75  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Document mpfs-rng and mpfs-generic-service as subdevices of the system
controller.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 .../microchip,mpfs-sys-controller.yaml        | 35 +++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
index f699772fedf3..b02c8bd72605 100644
--- a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
+++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
@@ -13,7 +13,6 @@ description: |
   The PolarFire SoC system controller is communicated with via a mailbox.
   This document describes the bindings for the client portion of that mailbox.
 
-
 properties:
   mboxes:
     maxItems: 1
@@ -21,6 +20,38 @@ properties:
   compatible:
     const: microchip,mpfs-sys-controller
 
+  rng:
+    type: object
+
+    description: |
+      The hardware random number generator on the Polarfire SoC is
+      accessed via the mailbox interface provided by the system controller
+
+    properties:
+      compatible:
+        const: microchip,mpfs-rng
+
+    required:
+      - compatible
+
+  sysserv:
+    type: object
+
+    description: |
+      The PolarFire SoC system controller is communicated with via a mailbox.
+      This binding represents several of the functions provided by the system
+      controller which do not belong in a specific subsystem, such as reading
+      the fpga device certificate, all of which follow the same format:
+        - a command + optional payload sent to the sys controller
+        - a status + a payload returned to Linux
+
+    properties:
+      compatible:
+        const: microchip,mpfs-generic-service
+
+    required:
+      - compatible
+
 required:
   - compatible
   - mboxes
@@ -29,7 +60,7 @@ additionalProperties: false
 
 examples:
   - |
-    syscontroller: syscontroller {
+    syscontroller {
       compatible = "microchip,mpfs-sys-controller";
       mboxes = <&mbox 0>;
     };
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
