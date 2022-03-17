Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C125C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Mar 2022 11:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YDIwagaukd7qumPH53QyoZ5ffghQlgZs5AjTuJjXyw0=; b=TI+TX+ycKxE/o0
	sJ3ZGVj/xK+VQtgJdSnPyfwUUw5A0KEa/9hoSQEJb+lgRg5OjZ+hVpAmq0YEzxoGZICun+m7ICGuW
	FzeeSxVtnCvDze/Fd62YHfPRa+OwXg1qXFyc9iLXUd8Yg4sA99rVs0NRJeASwjr4l/O6DU9JwdD6q
	u+fkusT7ejP1DIVIkRtBUZYvioCfIKsZOIA715/4aKKaDJ2e30oKczOuDNWygICgnMndETFediyBU
	ma0Rltxjcs63h23vO3hA7yKnoHbUf3+8z2eHXMlAjM2HmfBRH1tTRT3DI+Vd6TX9yweNBkf75496q
	WHKsD6fx3Zzd01pidg8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUomv-00Ftnz-Mn; Thu, 17 Mar 2022 11:59:29 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUol0-00FsdF-Ce
 for linux-riscv@lists.infradead.org; Thu, 17 Mar 2022 11:57:31 +0000
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 255263F603
 for <linux-riscv@lists.infradead.org>; Thu, 17 Mar 2022 11:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647518249;
 bh=aSGezm1yIxV4XCs71xtI5EKoFHjXL820ywE13DRNOT4=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=ja8WnAtjPT1Qn3n5bZb047GDsrr6RdwTGMbra24336EdopSuiqIZ9dVQpuX8ZpuSy
 4tUtpfONe7vJ9BzY18hh093bZ1bysXb26hiuvUC3GExzqTiPy7GIHXvlbDHX4rDMyt
 55cfr0e4uBZ/a4n2+eVH4/6kGi1C+DpFZyzWWMbD8saia4ub2sZUxQ12fgMkr6or+i
 dyj0AkZF/5m3pC5IbfYcbTIgxwCHeYzBTlXLlwlU/y65VauxOt/3baNvRCV8n+hM6L
 zPRDWF7bKWGSRKUFTDZJnEUG90GC7R7uqsp0Uc4bsmTEaeAaOS7wvfv2hw71tYAsUc
 CU0T/ZUQDahuA==
Received: by mail-wm1-f72.google.com with SMTP id
 r64-20020a1c2b43000000b0038b59eb1940so3005846wmr.0
 for <linux-riscv@lists.infradead.org>; Thu, 17 Mar 2022 04:57:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aSGezm1yIxV4XCs71xtI5EKoFHjXL820ywE13DRNOT4=;
 b=bn/O4sk4MwBvLOxqkC6mx8pcLzo9dm+8/zMxnne16I7x64LIgvacy2t2dklTLq0pGf
 ePxu6Av3rA2xseo9i69NxgWkhSF1C+6PM1TS3Pd2wnyPogP7ih5QbMcIScuDII5NCBpq
 Wbq0S+dHxmjcy8Gs2mO1aueR8mCe+KRRIZH9GJgMoMPunuA59bPZ4GbRtA+Y8c5RyTYE
 Kj2MZ1c5jPyNHYUIvqy+6jDhjnN3hAEo8lgJ2RJZWG+JO4wcLfPgVkKjwPqtUs0Q/B9y
 +bTWMbBN42KpbwpjjQtumHjpembK7RdiNDQWHVvMX4+M5nXxgKRjA2+wZidUuXQZUaKz
 fFmQ==
X-Gm-Message-State: AOAM533cHTNogJi32JILE5W/0fJ293ysJ7nUClB41UA0Rc+syU6DefGI
 b9apEx8Ng2/gSVIis0iRPCcekGMPrSEovW9yrrpkDpFnsAOk6RVNtZwROHBZ9bkSCqHTDxPAfQN
 9eQvcPgrEzh9avYCojSnd3SDvI/cK7uKrYJt/pUxKcH1zpQ==
X-Received: by 2002:adf:a302:0:b0:1ed:bf30:40e3 with SMTP id
 c2-20020adfa302000000b001edbf3040e3mr3777957wrb.270.1647518238538; 
 Thu, 17 Mar 2022 04:57:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2T8BZ9r1cayLerGnUvxU9+ZIYyhi9vmiexAY/nI3LK3OqgvQvruoxbLO/RKMhjARnY2yv2A==
X-Received: by 2002:adf:a302:0:b0:1ed:bf30:40e3 with SMTP id
 c2-20020adfa302000000b001edbf3040e3mr3777906wrb.270.1647518238317; 
 Thu, 17 Mar 2022 04:57:18 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 r65-20020a1c4444000000b0038c48dd23b9sm5824900wma.5.2022.03.17.04.57.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 04:57:17 -0700 (PDT)
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
Subject: [PATCH 04/18] dt-bindings: irqchip: actions,
 owl-sirq: include generic schema
Date: Thu, 17 Mar 2022 12:56:51 +0100
Message-Id: <20220317115705.450427-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
References: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_045730_594119_AAEF97A0 
X-CRM114-Status: GOOD (  12.63  )
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
 .../bindings/interrupt-controller/actions,owl-sirq.yaml      | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/actions,owl-sirq.yaml b/Documentation/devicetree/bindings/interrupt-controller/actions,owl-sirq.yaml
index 5da333c644c9..c058810cf475 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/actions,owl-sirq.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/actions,owl-sirq.yaml
@@ -14,6 +14,9 @@ description: |
   This interrupt controller is found in the Actions Semi Owl SoCs (S500, S700
   and S900) and provides support for handling up to 3 external interrupt lines.
 
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
 properties:
   compatible:
     enum:
@@ -46,7 +49,7 @@ required:
   - '#interrupt-cells'
   - 'interrupts'
 
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
