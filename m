Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B3AAC52D7D
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Aug 2024 15:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tAMO7zaWSLFJ6MHaNR8qQ3gS94ZHJwSV6HGbDoJJ3U4=; b=GM0GU38yHqzncA
	YiHdqn9vRrpLuvntnffciOfPfl1jtQP2E26BgZQ99T4FN4FNeWq2UNXA5nFVnfbNGH9bzC0PIvVfI
	HIepIgOXdq4azPEb/SKd88hyKXIyHW95MwprlrSlpyEcf06Irai6onR9BoArfu+HaCHgmyPf50u0j
	6vkuR8lkRGcAqpDF48fKHHnyUiXfVAIvmeoo211rh06JaXIa/rDjLEKXPTmt90PZt/uENYSoPlFt+
	aFkNsuSr/GhNhGtejTAkD9kcMrDvW9fhtHRDsRQz9dRoE6e178gU9hxuoykfH6GAUKNTTNwpBVeWo
	+Z1O1naQZpcGXtubn8tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdX07-00000000jpz-2auR;
	Mon, 12 Aug 2024 15:30:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdVq9-00000000YHg-3eH3
	for linux-riscv@bombadil.infradead.org;
	Mon, 12 Aug 2024 14:16:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6t4OCL7r2k0BcCZXsgV29+zy3Q4zYlCFqtAXU2nhKaE=; b=PJZ0s5JGluhCipk6sgPcodhFDr
	bGcoQIeKEyRpIXNq0cYQ9GgqLK4S2dwy6DZtYxRLU6la91eSeCqXwwkkuldV2o7WJTG85nlAnlYlS
	+pyDPiOZqxxe29+enmoAfmHPtNApO4wMavPh5bUDRTBHWlRYjhiW/vanWxGhIWieYcnH//3osg9Tv
	sa0Bljvu11llCxv57N8Ioq8o3x43ZRa91oc1faHXXxTK3HxqEencDeTNsLsUKZCr3lKTfN7DoV8l7
	eKA9XUqNEXFubux75OKtC8y0ahkYU6fskp9Grb0rGA79eGC4DqdcqIf4CJ18DFsBwBXiwEa5xm/+j
	1SI9adZg==;
Received: from mta-65-225.siemens.flowmailer.net ([185.136.65.225])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdVq4-00000007aM4-2qYi
	for linux-riscv@lists.infradead.org;
	Mon, 12 Aug 2024 14:16:04 +0000
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202408121415540e15e08595dc442bc1
        for <linux-riscv@lists.infradead.org>;
        Mon, 12 Aug 2024 16:15:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=jan.kiszka@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=6t4OCL7r2k0BcCZXsgV29+zy3Q4zYlCFqtAXU2nhKaE=;
 b=iKxleSi0LO3bbWjQAZ2jrQNCCbTzL1GxB/6aZDzCNmvFnPZUMZfCp/FNZp6yFtV/isdeoT
 2mOOdNZkqJNJzC1sGa9FjQ2XsBEbQdxGZA17kn7Bv17TIrfIWS11mtzh0037r57+5AMRxP3G
 bYIHFdXQqNlku54q4IUN+kEKPTZCp2Khg/AvcAlN1GKBnr43RH57r8cNHPcrQ3CkSHDp1HQn
 8dJBWUKI29hlc/lYXHqZ8fEyyf1Jc5SPBkfWz4NjnqeaAN4G2efTn3UMA+9kLpiTCg/u1usA
 2gNao8g5mCYvuXKrjPn9MwKaT6KpVx+AuxiiH4C5YUuOfOLejeANWqKw==;
From: Jan Kiszka <jan.kiszka@siemens.com>
To: Minda Chen <minda.chen@starfivetech.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 1/3] dt-bindings: phy: jh7110-usb-phy: Add sys-syscon property
Date: Mon, 12 Aug 2024 16:15:51 +0200
Message-ID: <30f3ca9f6bd788e16767b36aa22c0e9dc4d1c6a4.1723472153.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1723472153.git.jan.kiszka@siemens.com>
References: <cover.1723472153.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-294854:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_151600_967301_C8467A4F 
X-CRM114-Status: UNSURE (   7.06  )
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
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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
