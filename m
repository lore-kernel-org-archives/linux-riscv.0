Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 771FFCCA47B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Jul 2022 14:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dUR2LX/3BL7tlOVQ2ltbOTbt/F8khJhQZ9y0c+uecA4=; b=ikUTZwEjlUOkxv
	Yh4JSkWHibw0QZ14EDSEZ9+fMcWkcQaMgsMdQdz3oARX78Njn4jDMRdhuEuor1hu1ztzp8AhMeD9r
	F0hh8WX7GLnv61kKm/9EvoQjv2XutTEsMZoKhdqpFl6R9vfIcKln1ct+p6ZCQQExdbgITacNuW1Wu
	eaAQjXkpHjBFGrLYA1NxAkRu0UifepH6ndas7m6BbowvypFDU1H7EJkPB+M3gBo2inwswBQJvRPnP
	ik0tS9T0rMlMpIgVXB3QIiePQjdyeOHYIoebVK1XZlNPIO2TEs1J69C2Hwv2xYEAygsrgGT6/0ZFC
	SDJSdKIXmMVFZCAL7tJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9ozq-0049Jl-Al; Fri, 08 Jul 2022 14:30:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9ozl-0049FZ-RF
	for linux-riscv@lists.infradead.org; Fri, 08 Jul 2022 14:30:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657290613; x=1688826613;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zf+7kH8bgglyGlJ9EsT7S7ho3SnvVd1w2aOxWrS9FR4=;
  b=Q9UD+o8AY1NOw0GtF+zDv0QUTQR2PswwXLrOMpOI3lhY3w5WUcbBqQV6
   Bt2lidW791LjPybJK23TspVMAQsNqRRHb3uMEWJxrpVmihlpYqSvDnweX
   gSF19Zfk+h8dCkNi2X6myI8dqaJKml4qazTh+vcZkFts5Y7XOugSf84vM
   ysesd5+m/vnnySU0XdAB6L9vspIsnI1y10tZ97b6Kumut8BfOZz22tT1N
   F7uEt2UtO8M8MI1Kxv5eOvBNuYN3KHmWz2SzYAOqxSvxmj2onQZ7x1yTK
   yCngqyGRfR8kjkLVAJsxYTNKF8dkbtHw/ihon+SQj1Z4algBWhNZR/WOw
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; 
   d="scan'208";a="103658933"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Jul 2022 07:30:06 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 8 Jul 2022 07:30:05 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 8 Jul 2022 07:30:03 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, "Lee
 Jones" <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-pwm@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: [PATCH v4 1/4] dt-bindings: pwm: fix microchip corePWM's pwm-cells
Date: Fri, 8 Jul 2022 15:29:35 +0100
Message-ID: <20220708142937.1120121-2-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708142937.1120121-1-conor.dooley@microchip.com>
References: <20220708142937.1120121-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_073014_002153_A00111BC 
X-CRM114-Status: UNSURE (   8.23  )
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

corePWM is capable of inverted operation but the binding requires
\#pwm-cells of 2. Expand the binding to support setting the polarity.

Fixes: df77f7735786 ("dt-bindings: pwm: add microchip corepwm binding")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml b/Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml
index a7fae1772a81..cd8e9a8907f8 100644
--- a/Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml
@@ -30,7 +30,9 @@ properties:
     maxItems: 1
 
   "#pwm-cells":
-    const: 2
+    enum: [2, 3]
+    description:
+      The only flag supported by the controller is PWM_POLARITY_INVERTED.
 
   microchip,sync-update-mask:
     description: |
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
