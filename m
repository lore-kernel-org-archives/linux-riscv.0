Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B115C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Mar 2022 12:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gw/CNUD1C3AGycReUfVWPH2BdcQnSiPBqogI3jczq7w=; b=vUIVKN0JiL15jy
	m7lW9E+rA81eo3VJBeB3mE0jEbpbb1bhz+TjuUZVxKl5V/jWzhx12jGCOWCfkMPoQJis6JL1LWrxJ
	yYJzlUOX0hBgbZGOu7dd5lQcDOlKio309AH+gtmeFWB2iuiX6+GvLf5kMawti640vsxh8cap5iazZ
	DXwnFBA4JE7iF6VNfFi6pnNVh4z0z3ySXEB/J26Sg/ZIzSMVDPgOr5cPzMsP56HkaxLX/x/7Xdsd2
	3k4YaIL5IpZkAgCS8/T+yFu4W2A15k5/4QN6YCL1QlnCNiyQomhLNz20x+IuZuLo3PcVSvH80uXvs
	juy1hwqbyDJPOemAYu7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUoyk-00FyiR-Kx; Thu, 17 Mar 2022 12:11:42 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUolW-00Ft27-Sl
 for linux-riscv@lists.infradead.org; Thu, 17 Mar 2022 11:58:04 +0000
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id EC61B3FFD3
 for <linux-riscv@lists.infradead.org>; Thu, 17 Mar 2022 11:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647518276;
 bh=KFmifwXJp5W4UT7dzRYgwV6FTL9sctX1thCEx5C+nkM=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=uAZySwa+94JUOmbeRBa83DQ1M8Uv4aSCzoloaoS5A+WbsuddyeIi+uQ0/BSxVBegi
 0sXeiDZBmv5dd+rh4FQn2ERuZ11TcE6eiX86V2ytjv9NhgjfOoUyVtb7m+r+h4VJ9J
 vReHmRFs/adn2At51s/L1iVYvy3TfHbUVxwJ10CwEFcLx8whasThu8T12WNVfjcR8n
 SG49/LT0E5swjqg0h1ILtGMN/tifJtLoH5Zmz8tLpWatfBXnmH3QMXW/xKtT2y0Drh
 bUMyTWAvCc3tSKMAb0lQq5k+Y+MRHl8lxLQlj/eb4mwVvhrS/LqqxzNteBYzCoOGoQ
 /g/vNQTfHJGaQ==
Received: by mail-wr1-f70.google.com with SMTP id
 f18-20020adf9f52000000b00203d86759beso1476526wrg.11
 for <linux-riscv@lists.infradead.org>; Thu, 17 Mar 2022 04:57:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KFmifwXJp5W4UT7dzRYgwV6FTL9sctX1thCEx5C+nkM=;
 b=URA6R+qDk4D0RAMyx234Q7l/QFBWv4eJtyOXz8g+j+/Q1r1MyMveYIAeZ2dHzkYjw8
 qu6+Ej6oDFoeY8/wybYrVs03JVPjpnj4J0ITfFRTCXJa+NfzN6G0LN7G2YXmkG3+jHFT
 UANS+KFaOZwlb5HBbn5NuKgGJINGSt/xnyBddS4ZuCZdzdeNSNxeCFiBrO9bcFISv4su
 cBFgGRKnWe9E6mbq09kHlroWhftY8oVS4h+OzJ/Q0nugQQA7Wxiq5G2SrY5tcCXDRBs0
 m0INQnX76SKFqM7SJbDXmU98iTPUVxCkdOLdlYFE1xYo2FXMgVb1YUdU8EzHblAPRL14
 uRLw==
X-Gm-Message-State: AOAM533r2J72fDGREEPnhY8iVXpsXet/z/XvgPBZg5jHjWBsmDkjBMaw
 bR7R/ftJxKnGgts72igpzpeBp5oHCAL9cobJsa/D+kBjHvaMBb2Z0GlC4nMbJmLbRKNcI2v7/S+
 HSli8hZkXHk/UxN59zaoqI6Dgc/4ktgFzvdi5OAdz+m835A==
X-Received: by 2002:a05:6000:15c1:b0:1f0:73d6:b716 with SMTP id
 y1-20020a05600015c100b001f073d6b716mr3663295wry.293.1647518274485; 
 Thu, 17 Mar 2022 04:57:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQvKKHcnhZqthCpzLO2USNLVXIsLYfJdNKGccVKarN3fEhfI5+MqhVsRHbxfF78ndbEuW0XA==
X-Received: by 2002:a05:6000:15c1:b0:1f0:73d6:b716 with SMTP id
 y1-20020a05600015c100b001f073d6b716mr3663274wry.293.1647518274258; 
 Thu, 17 Mar 2022 04:57:54 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 r65-20020a1c4444000000b0038c48dd23b9sm5824900wma.5.2022.03.17.04.57.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 04:57:53 -0700 (PDT)
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
Subject: [PATCH 17/18] dt-bindings: irqchip: sifive: include generic schema
Date: Thu, 17 Mar 2022 12:57:04 +0100
Message-Id: <20220317115705.450427-16-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
References: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_045803_086399_91945F74 
X-CRM114-Status: GOOD (  11.74  )
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
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml     | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 27092c6a86c4..e3c08cff89d2 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -44,6 +44,9 @@ maintainers:
   - Paul Walmsley  <paul.walmsley@sifive.com>
   - Palmer Dabbelt <palmer@dabbelt.com>
 
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
 properties:
   compatible:
     oneOf:
@@ -91,7 +94,7 @@ required:
   - interrupts-extended
   - riscv,ndev
 
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
