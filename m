Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC841C43334
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Jun 2022 16:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6vM9LnZf+aloc5JxASHaloXVOnHanYGHzqMpPTeOYX4=; b=tyEpl19Fo1u/x0
	1Sq9+swUp/xugJStVGoAE0AvzmB/8j+NO0aBLayEXvtQj1SzYoqJY10R8Knfdb403Ehz+dBBjY2ED
	GJ9OCWkQ7/kcUtYDgKIC3MwgA+nAWVCyR4jnecPMTrHSpnIlfA/CSYj2cNEphePCl2oVL8EMGaX+c
	1tmaXG1x/EH1xbYs/nfwmRlNQzHKlBLtwjNBzG2FY+wzgqKCW6Ri5PmPpLo/Y1VImYoF6KrFc0Rht
	3A1z7vF2LqdoLNJy9lTTzkzV4juCroXyOWKnF+FofbMsSjPAIXYskvZuAediHTbsAlorOpWHc4R7f
	M/CtFWzQKsPdGerthLog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2y83-00EjPf-Ax; Sun, 19 Jun 2022 16:50:27 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2y7x-00EjMo-Eb
	for linux-riscv@lists.infradead.org; Sun, 19 Jun 2022 16:50:23 +0000
Received: by mail-wm1-x336.google.com with SMTP id m39-20020a05600c3b2700b0039c511ebbacso6672886wms.3
        for <linux-riscv@lists.infradead.org>; Sun, 19 Jun 2022 09:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S1wp9fg7GLV3pi+6N9b23chCh97u+d99m5VcERi7ehs=;
        b=bPnyXKWN64AHnZToeVUO26HMas9/tkxyQqtdLVRhdC+buVatlHnFMXdVVxgkESp/A0
         /1fXdPu57m3R1lk+dB2zygAbwZRjSH4KVqkRLvwHDPruj9h14mCjz2zVNu3s5f1awmS0
         ewXdPp8hughiHf3N7oWAaA4pNA75h6XO7zS/+w73bY7EoxpqSF1ormze50BhwXH2jj3L
         lQ5rnsJPdJa6O/VqkNvxSArJLsPmkZh9EP+It4o5yFg+rUYq0lsu6Hm0KD3QL1a+1ofC
         SMMoEZEFRu5ys/E9neTRnaJM+st+vUuX/9TzcjuY54aS9fckKvnumpv3lIJCcqy4HozJ
         EAaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S1wp9fg7GLV3pi+6N9b23chCh97u+d99m5VcERi7ehs=;
        b=TylWiZ+49EamSfY4DhC3+OVu1BYDXuKhUsEF2WfasU70jjybXXX0FSOWoOQP9j/Iyu
         t2kbQeEWl2vDj8aaUc/+P1+8mZYVaIQ25sdo9KW6dRsFDfciaXcsFYA8BSZIj6bmSzOd
         5p7apUyyeP4E1eoQV4z4IIlIGRIYQTeghP8H4tpcvE/diKqTgUqIt9g9Yo4GliCC4nJL
         G3TMg1HZyU81cdRUb8A4N+1xA/HCEsELajoNTyPJlcnjRq4LqmRx5RiWXEm1MjPHdvcG
         dw9NrzefkcYCofTEVDjxw2CnHOhFwkZn0U13hqJMlhwZMrdElPvbgXFUEmou99dn2RuL
         g4Eg==
X-Gm-Message-State: AJIora9fojmpeP9EuhGDF/zyxMAmdS1XPTwjZeabxYArogg9zVIkpFy0
	CElJfwQNVX0jJxPHeTHLZ2AL5G6jsKqbgPLcWKo=
X-Google-Smtp-Source: AGRyM1uF0ceBCoDGb8f7820OuMYLUviRQuhZsDcnfdtER4rIoj2V0+8xcQxMV4x24fp4JC4HNI8OQw==
X-Received: by 2002:a05:600c:3d18:b0:39c:474c:eb with SMTP id bh24-20020a05600c3d1800b0039c474c00ebmr20396587wmb.87.1655657419809;
        Sun, 19 Jun 2022 09:50:19 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id m14-20020adfdc4e000000b0021a3c960214sm9189510wrj.6.2022.06.19.09.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 09:50:19 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Daire McNamara <daire.mcnamara@microchip.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [RFC 2/6] dt-bindings: net: cdns,macb: document polarfire soc's macb
Date: Sun, 19 Jun 2022 17:49:32 +0100
Message-Id: <20220619164935.1492823-3-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220619164935.1492823-1-mail@conchuod.ie>
References: <20220619164935.1492823-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220619_095021_528447_CBAEF02B 
X-CRM114-Status: UNSURE (   7.56  )
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

Until now the PolarFire SoC (MPFS) has been using the generic
"cdns,macb" compatible but has optional reset support. Add a specific
compatible which falls back to the currently used generic binding.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/net/cdns,macb.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/cdns,macb.yaml b/Documentation/devicetree/bindings/net/cdns,macb.yaml
index 86fc31c2d91b..9c92156869b2 100644
--- a/Documentation/devicetree/bindings/net/cdns,macb.yaml
+++ b/Documentation/devicetree/bindings/net/cdns,macb.yaml
@@ -28,6 +28,7 @@ properties:
           - enum:
               - cdns,at91sam9260-macb # Atmel at91sam9 SoCs
               - cdns,sam9x60-macb     # Microchip sam9x60 SoC
+              - microchip,mpfs-macb   # Microchip PolarFire SoC
           - const: cdns,macb          # Generic
 
       - items:
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
