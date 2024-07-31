Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D71C3DA64
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2024 20:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9k7Y7uffhHeXI6uJpk6LVkCDwjiIWa8RQbNc7lKQeCA=; b=MqpclhKIq1ZCQs
	OroD4H164Rf2sTXRBJFNBIHSOvGLcCiEVD2sJWDWOUJiGQ4wNCD1T4XaNmJsm7uLvcjSigy99XUwY
	0tPwj1P9Xayl/T2IHRPrtq/9Neso9wKsC6vEC9KJ7iTMONqRytYTkHNS0zm39w4Wem+r5H6GwZTdq
	O8+izzYt+c2KdaGDAwfu8EL69U9d3ok21BIoi6NaZVB/L4FPalJZPXReTPxpXHhwqGwXsTxaI7/TJ
	BBSQEKPlCJ8OCPPRkuqlFLF3ptlz7HISjAeVLisNwElVfETWMCQHT9wrC/E6dZg8G6r607UHo1tzm
	ohBeorve90kM73FReNFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZFmh-00000002QzK-2PAA;
	Wed, 31 Jul 2024 20:18:55 +0000
Received: from mta-65-225.siemens.flowmailer.net ([185.136.65.225])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZFmb-00000002QvZ-3JRx
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jul 2024 20:18:53 +0000
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20240731201844c23c98f9c18a957b20
        for <linux-riscv@lists.infradead.org>;
        Wed, 31 Jul 2024 22:18:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=jan.kiszka@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=XuWSafTJqaueVcFk2YDwRANMa4TvCIZ5dW42gSq/JL0=;
 b=ReTkS81ClDctxkCCZdavcnAnLidOLfLpzOsuB6CsAwphoN6ZuOp21ev3CsshrA/EACYX/v
 cfiUoDHenQEhL47UhvxNR2LWyTski6jTWUP4rM+5I9u4pL/b8qRfiSgiE8ZNk8wFxf0MVKt/
 wnRqMnYgspm7OaaPBneal4JEDjmJlk/8aUx97Q/2q2IaDHgNxc9rFDDMSmbP+Mys9B9vp/SF
 JObj/OW8MMe05ZXHgjc7XI9oEIp9qQwVDdhSCpvoIh1LsARZEdVZPyAYHHKRSXgZzBHmN0fY
 kxKB+04cgGK9NE0N7O93TgM/2/as9S3jLTJcsAVR4/VPdgB5MN49EtsQ==;
From: Jan Kiszka <jan.kiszka@siemens.com>
To: Minda Chen <minda.chen@starfivetech.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH 1/3] dt-bindings: phy: jh7110-usb-phy: Add sys-syscon property
Date: Wed, 31 Jul 2024 22:18:41 +0200
Message-ID: <ebcfe039b13097e53b3721f56a45d99807f2925b.1722457123.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1722457123.git.jan.kiszka@siemens.com>
References: <cover.1722457123.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-294854:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_131850_574457_A1B4224E 
X-CRM114-Status: UNSURE (   7.13  )
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

From: Jan Kiszka <jan.kiszka@siemens.com>

Analogously to the PCI PHY, access to sys_syscon is needed to connect
the USB PHY to its controller.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
---
 .../bindings/phy/starfive,jh7110-usb-phy.yaml         | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy.yaml b/Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy.yaml
index 269e9f9f12b6..eaf0050c6f17 100644
--- a/Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy.yaml
@@ -19,6 +19,16 @@ properties:
   "#phy-cells":
     const: 0
 
+  starfive,sys-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to System Register Controller sys_syscon node.
+          - description: PHY connect offset of SYS_SYSCONSAIF__SYSCFG register for USB PHY.
+    description:
+      The phandle to System Register Controller syscon node and the PHY connect offset
+      of SYS_SYSCONSAIF__SYSCFG register. Connect PHY to USB controller.
+
   clocks:
     items:
       - description: PHY 125m
@@ -47,4 +57,5 @@ examples:
                  <&stgcrg 6>;
         clock-names = "125m", "app_125m";
         #phy-cells = <0>;
+        starfive,sys-syscon = <&sys_syscon 0x18>;
     };
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
