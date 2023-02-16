Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1670DC61DA4
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Feb 2023 13:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aQfUNUGBUoH0KX5YXkSswOWuCAfVowXgDCPKv84PqqY=; b=xxpOz3bCqfpG6W
	w4Wn6sWFFDqDBYpH6/rBAFZr9vZDPm6CCIPGAOITOj5eaCOSD6cVJY0CDGOBXI8+09dDcogNzCDr8
	kyTPUW/5Z3y/YfjkwnwjaIKWqn17XZJR0qqMQTfeJgYNUcMUKPgX5pY+hqg9WZQpHvRbJSleydCni
	sgZZnbeO+r4lpEq62h77uNfQrd0iRJwF7xwv6U4wd5bwUzzDAm1jUkRUO54q/2LhW8B0mK0Xrb/Ms
	b2sCPiw844lyQC/OfJL0r6/2acWnTZbGhtcziCUhz6/oKq8fZrlVMf+uGzR2cPAPXAtBMMpty5yxW
	5HNtWJcWGdTBuBFW3+eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSe7V-00AJGc-Gd; Thu, 16 Feb 2023 13:16:17 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSe7S-00AJFf-HM
	for linux-riscv@lists.infradead.org; Thu, 16 Feb 2023 13:16:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1676553374; x=1708089374;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DL5Q1SD6gefZMi2w6bHvNhOIfkmdJdtrS+ULofmUJaM=;
  b=fck5Wi4/ojNeEzov67SZxYL1COiH4TKzPy0YRtOBa9MESkIxyH5gGTsE
   3/iyoehQt1nLKwpSPQY7NnFg58ZK3Y3aWPpPpQaRWErBr0znNlK9b4nf2
   G56jlFyVYA4lVaxGNgJZh0r5bIyKP10o2fNw/B5obwFa94lOWJsnaUxKE
   iXq2rQ3iqiCSrn0RmpFzzshRFFbK3vxalbF+bq3SE6pWYiyiF8gAiFcIL
   zbOwTRsiTonGXVbiTnosWfPaarFd/PtXt/t/OPhCA/Xk08f4JaKgS+6GC
   xwBq5N/vFYHvkOsrKzLpS6hoh/ETUvsJGtG55cQq8LWw48Mcu4HczZE1X
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,302,1669100400"; 
   d="scan'208";a="212326806"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Feb 2023 06:16:12 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 16 Feb 2023 06:16:12 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Thu, 16 Feb 2023 06:16:11 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Conor Dooley <conor@kernel.org>, <soc@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Hal Feng <hal.feng@starfivetech.com>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: [PATCH v1] dt-bindings: riscv: correct starfive visionfive 2 compatibles
Date: Thu, 16 Feb 2023 13:15:12 +0000
Message-ID: <20230216131511.3327943-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_051614_624164_8025D79B 
X-CRM114-Status: UNSURE (   9.51  )
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

Using "va" and "vb" doesn't match what's written on the board, or the
communications from StarFive.
Switching to using the silkscreened version number will ease confusion &
the risk of another spin of the board containing a "conflicting" version
identifier.
As the binding has not made it into mainline yet, take the opportunity
to "correct" things.

Suggested-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Link: https://lore.kernel.org/linux-riscv/Y+4AxDSDLyL1WAqh@wendy/
Fixes: 97b7ed072784 ("dt-bindings: riscv: Add StarFive JH7110 SoC and VisionFive 2 board")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Arnd,

If this is okay with the dt folk, could you please send this to Linus
in the merge window?
The dts for this binding hasn't landed yet so this is a standalone
"fix" on top of my earlier dt for v6.3 PR.

Thanks,
Conor.
---
 Documentation/devicetree/bindings/riscv/starfive.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/starfive.yaml b/Documentation/devicetree/bindings/riscv/starfive.yaml
index 60c7c03fcdce..cc4d92f0a1bf 100644
--- a/Documentation/devicetree/bindings/riscv/starfive.yaml
+++ b/Documentation/devicetree/bindings/riscv/starfive.yaml
@@ -26,8 +26,8 @@ properties:
 
       - items:
           - enum:
-              - starfive,visionfive-2-va
-              - starfive,visionfive-2-vb
+              - starfive,visionfive-2-v1.2a
+              - starfive,visionfive-2-v1.3b
           - const: starfive,jh7110
 
 additionalProperties: true
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
