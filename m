Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AAB5C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Mar 2022 11:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=52UDsMfZUDPUg5awE8x9tPM5e3MgVEx0PUR6cWesHKM=; b=k6WNHSyGrVvPND
	xJjwAVXT4eNO0fNdS9EESthhPHbbAXscJHNuNuMhsVQzOSrlGGSPZrLXAsydKGib6d0JLE4lCTzft
	2DbLjTxAynLnvOt7a3XfQV9d90ziVbrSxbhKhGv/cFykgii9EMye4eIKK0eV6l/MKbUGz/L0lcru2
	gnndyokZNq3dv7t6MYGilDMR4bgujkuX0uIZ9H/C8JY1E3JSG1sqYxIvoY43Temp8Oew91n0kPWPS
	oP65YzQxdho+SRuYifpzklMry8Q0ekHJMLrg+MUenN+R9z5osYgs+oUcCtPMoLgG+/3fHxOW6FMEF
	pavBrjEMHhhHkj9qV5iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUole-00FtAH-Og; Thu, 17 Mar 2022 11:58:11 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUokw-00FsaW-Il
 for linux-riscv@lists.infradead.org; Thu, 17 Mar 2022 11:57:29 +0000
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B9C153F61B
 for <linux-riscv@lists.infradead.org>; Thu, 17 Mar 2022 11:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647518244;
 bh=rkZlJ0igM03Y8VkMiNizWzNDbnqGn+aUyjhq4DWqgik=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=K/A417CIzrJGRoY7z/xU3cplT749brDB3UZMjHNn8LaEdqrLBPAm3msLFRIsWFqsu
 PSOnv78j5C61voEbZSx4hrbO+iIt+EU9qsQhM/zgyHhnpCdY5ZqOkvQuVZq4On5KUz
 FefnMqrA2+gijnI5cc9p3fAdg5yC4YKYHIQPc5H4U9joTq1XaKgXVFR1IBxVbc5jeh
 vxRI5ujvM7G8klCQtnF9cehy2WH4WYv/zfRInr7EiUeUyP1U32Z3jNwB0oon0vMkYD
 7tHKAyMuCTfSnA1e3gng+A2digeuoDcqBxxvNGuYguyTJOML7/qIf0VgeAwC7Jls2t
 YRchw6Pc+Q7Hw==
Received: by mail-wr1-f69.google.com with SMTP id
 k20-20020adfc714000000b001e305cd1597so1463840wrg.19
 for <linux-riscv@lists.infradead.org>; Thu, 17 Mar 2022 04:57:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rkZlJ0igM03Y8VkMiNizWzNDbnqGn+aUyjhq4DWqgik=;
 b=2JClJKxVlq/VawH5O+4vaxTEW8MnEA9SQQLeOeGBxGVXTXGzDYN14UD/pMChlStIpf
 JLKWclXyIJkDdEcP85P4wWQpZx166VFA8pVjUmBZ5kYZl6Q55DGCJyWkCOoW8mlG01v+
 thOghmhHJWZiXMI+vVh0YbSi47/CcnJHARN25q0roc4wY86Inz1OS8sMN+/GjCDuX+4G
 Rjv2kyKJe3rvkEFmOTDMZfUgUXGkx9fP2UnrRznyczE5vjI6v9Q5EGCgHiF+k2/yZ209
 bMpCCV+Fclpt1iLnMiEltj/mxT/lHT2lmzSl2tcEn0XaxdrLkMYNLMJzJKkbF6NUr9lT
 5VKw==
X-Gm-Message-State: AOAM533dCgZCl/2NRv+6yU9fPfbe3O4fRhoheup5kwX/DyQY5TUcG/uR
 5Ifb9aeFKkwEZrLFzZS9jRQMIgQkZ9c9hMk+NgVWj+5u9u2niTVvaFmNU4aQsccRCxpqygObVdH
 otM4NcDdnwz+0EhZQ7vbodDfnlV4ObgiiFMvtDH2VLDw9mA==
X-Received: by 2002:a5d:608e:0:b0:203:e8a3:36f3 with SMTP id
 w14-20020a5d608e000000b00203e8a336f3mr2822236wrt.176.1647518244243; 
 Thu, 17 Mar 2022 04:57:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPfOj+UeHfKmqSbS2Hx8bnxirl/NYvL3z9HsIpNergGiYK9EsV7ImtjHZaqXnE8okb/mRUOw==
X-Received: by 2002:a5d:608e:0:b0:203:e8a3:36f3 with SMTP id
 w14-20020a5d608e000000b00203e8a336f3mr2822186wrt.176.1647518244048; 
 Thu, 17 Mar 2022 04:57:24 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 r65-20020a1c4444000000b0038c48dd23b9sm5824900wma.5.2022.03.17.04.57.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 04:57:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>,
 Michael Walle <michael@walle.cc>, Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
 Daniel Palmer <daniel@thingy.jp>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Nishanth Menon <nm@ti.com>,
 Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>, Paul Cercueil <paul@crapouillou.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jason Cooper <jason@lakedaemon.net>, Paul Burton <paulburton@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Birger Koblitz <mail@birger-koblitz.de>, Bert Vermeulen <bert@biot.com>,
 John Crispin <john@phrozen.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Sagar Kadam <sagar.kadam@sifive.com>, Suman Anna <s-anna@ti.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-actions@lists.infradead.org, openbmc@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-oxnas@groups.io
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 06/18] dt-bindings: irqchip: ingenic: include generic schema
Date: Thu, 17 Mar 2022 12:56:53 +0100
Message-Id: <20220317115705.450427-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
References: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_045726_809244_5D19F0C2 
X-CRM114-Status: GOOD (  11.52  )
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

Include generic interrupt-controller.yaml schema, which enforces node
naming and other generic properties.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/interrupt-controller/ingenic,intc.yaml          | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.yaml
index 0358a7739c8e..74597a98f86c 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.yaml
@@ -9,6 +9,9 @@ title: Ingenic SoCs interrupt controller devicetree bindings
 maintainers:
   - Paul Cercueil <paul@crapouillou.net>
 
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
 properties:
   $nodename:
     pattern: "^interrupt-controller@[0-9a-f]+$"
@@ -50,7 +53,7 @@ required:
   - "#interrupt-cells"
   - interrupt-controller
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
