Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD30C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Jul 2022 17:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J9SiM67/ARzXTMF4CqRDJcaENM3DOqhgdH2QqT+5zNs=; b=lOBg+MuDoVEu/X
	divvFWq1SpUmyojGCehLls4fsqyfDBXx5rBekGQX3quJ4dkW1OAeF8eNbF8um0Np1XPIm7e0ol0Tm
	MAyrBygr5Ai+deMRKuzLpgoDBFyOvZmt2LPao+fO1a78YCzrpKVNmGFh3SmlHlxSUaKeU6jB23yDK
	sRPDpYxA/tNUvRutYYHMmTjvozvKsqSAPOuG2dO2mKuSGNp304Oqs7FXTSpaLs7hBcKckCFaUUaR3
	t6PmCK8Q23iTelubB4ol1b0BO5qpFWTw5EHppCbdyj/bhSFHoWe0I7U5CyFGJ3Vs2ct2UclqQZPGu
	7vUIIC/WjLIy/wtWDV2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEZrc-00Afx0-MK; Thu, 21 Jul 2022 17:21:28 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEZrY-00Afsb-Km
	for linux-riscv@lists.infradead.org; Thu, 21 Jul 2022 17:21:27 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 8-20020a05600c024800b003a2fe343db1so1189757wmj.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 Jul 2022 10:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XkkKPN3JJIki5/fJ0m2iMmrfk4IJDQ0Iyb2jgEwcMfA=;
        b=MPZoE7gQwOxPubrMsSNTRL2lSMXyd7GdLpsv87PPzdomrz6yEU381zHGLjU0kmnqeQ
         WtGx7JqzCm8T0cLSIzMZ5v5SrIr3ldYAkBNphbsgO6sAXriMu5lefm+3TPJzBs1yp2o4
         UNIRU3SS8Z0voBJ6/nUisMbU0iz1vkak5zWJDLUK7ntavyNgeaAkrGT8Nxxa/1sXLAen
         vY4eDgkECXnqYcPEX2Ckqn/xr5bFqLiUZFlYFin4gcB3e8pCsy49RWJEjvTMubhJT/3k
         UdnH6aq/fqdfp+5TUF5OB38JDpy3yExgYHEVNT1hfYXYmPktMJbQGROk7dqSLV+CTlDl
         xa5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XkkKPN3JJIki5/fJ0m2iMmrfk4IJDQ0Iyb2jgEwcMfA=;
        b=AhTzfRwpW0CrEEVfcaMGV3cVyjEp+V7QPzNsnOhS+O703hQInT+Cp4LlR8iMVQ5qa9
         6WA/I964u9OhB6FvGRJSd2ux4Xjp6QYDzh+JrBNkKsHqi3/tusmt+vvIkS/vGwE2Z4A0
         A/dQem3cLZTwkA/+KbNdeUDTRajjZxnF6oOI1oR4QgfKEC7F3LhVvTYEPUyKOeBywFHr
         HgkvtseJyx7n4981a2O9lMhAA/3GlvZgAZPuCacfTDJGgSQ4+tLGxM6cnw5/xO3GHsPS
         en+PcA/lUe6IIsD2IyokWDcepdC3+8IATh/QFUkfv/OH6KqmDzNqOOe7RAqDe57B6I7b
         6L7g==
X-Gm-Message-State: AJIora8xEZ5PJ3yvRklBCC5w3nTLwWYFBLTpweZ8tDnl9aR61Mlv35vh
	2+/UpXtKJtMS/qJlxwOM+txYTQ==
X-Google-Smtp-Source: AGRyM1uhhSObQMZkAZrCHl/IohFymT6ZizEWGdATrGEa0Aj1iPY95PQHYw/2A70KC/Ux7C4ZW05kEg==
X-Received: by 2002:a1c:f314:0:b0:3a2:fee4:91d4 with SMTP id q20-20020a1cf314000000b003a2fee491d4mr8835647wmq.108.1658424083196;
        Thu, 21 Jul 2022 10:21:23 -0700 (PDT)
Received: from henark71.. ([109.76.125.251])
        by smtp.gmail.com with ESMTPSA id e24-20020a05600c219800b003a2cf1535aasm2455697wme.17.2022.07.21.10.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 10:21:22 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: u.kleine-koenig@pengutronix.de
Cc: conor.dooley@microchip.com,
	daire.mcnamara@microchip.com,
	devicetree@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	lee.jones@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	robh+dt@kernel.org,
	thierry.reding@gmail.com,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v7 1/4] dt-bindings: pwm: fix microchip corePWM's pwm-cells
Date: Thu, 21 Jul 2022 18:21:07 +0100
Message-Id: <20220721172109.941900-2-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220721172109.941900-1-mail@conchuod.ie>
References: <20220721172109.941900-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_102124_730908_A09A927F 
X-CRM114-Status: UNSURE (   9.06  )
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

corePWM is capable of inverted operation but the binding requires
\#pwm-cells of 2. Expand the binding to support setting the polarity.

Fixes: df77f7735786 ("dt-bindings: pwm: add microchip corepwm binding")
Acked-by: Rob Herring <robh@kernel.org>
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
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
