Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 655AAC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Mar 2022 12:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5o9igm3EcbdfZ1/vdl5cUf9sbP4weM+Tkp0RqGmgXNI=; b=DpOkh7ubap4nQx
	5D1JW6cxwKaLIVW8B2uOW7r3DWjlgpjHrzxS52DCY+GNIVH7q32KLpFN2LXk2r6yMRL2+n0yqTqNk
	IgJqZO/Ds5V/+gGGdYUINDEbxMJwsFhyd0gAdInFtbSsf3lAfRplUjO7Kq3GWvah3o3koSc2NcTFL
	egRw/JRp8pCnPQX/Ix5HAXaB1Fa1Fcc39V0CgONKaKWFADvrQLifzgJeWRErM44K33r//ElvKznDV
	NTbV+ahGLWaDfb0QfSTBcn0V+pMOEdK1C1fIuZhyVFQljhjVFsWsNXWxtm75kA5ddiWd0ZsvnJasD
	QCoHYLk90g+uBrpS5cZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUorS-00FvxT-55; Thu, 17 Mar 2022 12:04:10 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUolB-00Fsls-FL
 for linux-riscv@lists.infradead.org; Thu, 17 Mar 2022 11:57:45 +0000
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 0A5433F312
 for <linux-riscv@lists.infradead.org>; Thu, 17 Mar 2022 11:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647518260;
 bh=q6L0pTvWqCbYxp4ud2xHQC7gNboKzwtZb8Qa+W91MLY=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=HV1q8bCdtubr6CRRllojHHBQI+5/WG+up146VgLklw8c6uGjnI2JNOyOIs+EMU4at
 HHWfC/zqxDDHZrCapKsTeFkC4C/S5OSEvgfAqwqqE899FMT1XNm8rrlD06gNXzKf+i
 q046TjCpG/rq4YZvKobHpdiO9GYOu7fuG9J4abfn3YgOB9HAF3YmBDx2k6ek2mVI5a
 p4PNkoBvJn4gluB13FWF/insR+HVmOqlxi3tEZOeyEDkNMC6U+Y5JgyCg/Z0FOw+6i
 JaYTYXf6tf3Lvhh8s5Mm9T8jyhQT+DcdsZhnVvWYxMkv4n71vrvgKagvzHkq/E+pzg
 pez+u+njWCSvQ==
Received: by mail-wr1-f72.google.com with SMTP id
 o9-20020adfca09000000b001ea79f7edf8so1465531wrh.16
 for <linux-riscv@lists.infradead.org>; Thu, 17 Mar 2022 04:57:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q6L0pTvWqCbYxp4ud2xHQC7gNboKzwtZb8Qa+W91MLY=;
 b=gmiR1DeMyyz2Ms4siiR6DkuvarI/lEZuzDhySwbez2VUVo0Yo2/CbpIot61R9tlkYs
 t9BMfyPSJvjZvtWnDLb/gR3v07rNQ5fL+haDhX62XBP5talo1hV3G+jRSc0VUEDqRPJT
 XOSaQa69k8JnnY415IzRZRp/zaZmhsHG7YK3++1SpHD/qXn0dMBYnKpzmuGwxYczLyWz
 PvtbfhdYJR94RXlPm/K7OwO+aj2/509Ma40hmFPvWOWIldekoojhJq/awMlAFUbYlUSo
 E/16Peoci6W54hg7sUXpFqpX9lGjSveyTEs4JUnT+erg/8JRsi32+zRiwXWW00CHvUAt
 uuig==
X-Gm-Message-State: AOAM530mcyGZPJkyH/4J0Mjs2+5bwSxQikUyVXxXJMJH6SUsfmmc84O7
 j+B5pmJRq7+EqunZCLaT5W63OeP5yaJLw+8AWvr7lLBTF2GkRnF+JqiAXQ90U7KWSXfZoZr6FgW
 huzf9yxrnlbktd/qj8F0tSr9Mw9F4GVMrOjlGQMNiTK91lw==
X-Received: by 2002:a1c:f219:0:b0:38c:782c:3bb with SMTP id
 s25-20020a1cf219000000b0038c782c03bbmr2376124wmc.94.1647518249488; 
 Thu, 17 Mar 2022 04:57:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxX1jxnKZiD0NuCgy5RBXKK6my/n/GYxN3iuUU96hXmDCoERczZgFOzB2MQI7Nkvxk6j0Zexw==
X-Received: by 2002:a1c:f219:0:b0:38c:782c:3bb with SMTP id
 s25-20020a1cf219000000b0038c782c03bbmr2376082wmc.94.1647518249282; 
 Thu, 17 Mar 2022 04:57:29 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 r65-20020a1c4444000000b0038c48dd23b9sm5824900wma.5.2022.03.17.04.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 04:57:28 -0700 (PDT)
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
Subject: [PATCH 08/18] dt-bindings: irqchip: kontron,
 sl28cpld: include generic schema
Date: Thu, 17 Mar 2022 12:56:55 +0100
Message-Id: <20220317115705.450427-7-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
References: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_045741_688351_CBAD89B4 
X-CRM114-Status: GOOD (  11.69  )
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
 .../bindings/interrupt-controller/kontron,sl28cpld-intc.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/kontron,sl28cpld-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/kontron,sl28cpld-intc.yaml
index e8dfa6507f64..1d0939390631 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/kontron,sl28cpld-intc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/kontron,sl28cpld-intc.yaml
@@ -29,6 +29,9 @@ description: |
     7  n/a           not used
   ==== ============= ==================================
 
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
 properties:
   compatible:
     enum:
@@ -51,4 +54,4 @@ required:
   - "#interrupt-cells"
   - interrupt-controller
 
-additionalProperties: false
+unevaluatedProperties: false
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
