Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A9FC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Mar 2022 12:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vy0mm6BcoUaXP9eJtyYh5btey+4h3vttG4tnES34xi8=; b=k7RdWHTQmtdAhZ
	Gm+L7xMLdxrzb/thORnGI+PIbSE0DsG8IB3dzTmRvQBEa4xIySD1nimtS50je4CAQzbR8IU5XMgp9
	lE++YmnQNlAJVVxwBrloOk0chFzRbrW+8aQpBRtiGwf0grh6Nd254SeK+JkROq+MNykjjk6weBDvR
	ZpKmhjqgNLTWSwyn2q30DEmmRYU3MgwCme+KqMHaSnzFZC45XIeiaYlsQ8vbVm8c4Dn1GN7crKuEz
	AS6F5eAIQuRH1MvEOQfgJ6AS0n5/fSDukJ7Ew27Ei/29lgOAn6ByaCqHAP8KX1XzJ4WU+IWAGgKLT
	6zdnJLTs8wuMtOsMGgmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUoyz-00Fynj-UJ; Thu, 17 Mar 2022 12:11:58 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUolW-00Ft3f-Tx
 for linux-riscv@lists.infradead.org; Thu, 17 Mar 2022 11:58:04 +0000
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 93B453F4BC
 for <linux-riscv@lists.infradead.org>; Thu, 17 Mar 2022 11:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647518281;
 bh=nw83rNQU0DG2T5abexM+HrA3AT5FpHyglSBWAvBerB4=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=kQ2mLTAXFpuho4SExyqLuVNWBR6HKM2OQyzLi8AN3pXhVYdQAMb97fXIvg9FmR+zT
 26bpUNONzM+rI016Xal/E519i0ZboEJQik7j8LgoXcLuWNS5f6KnM7vFv6uPmgMGlI
 mg+5XGBrTtC453y1tbJ9OddeqzIW7rJBW6wgIo8QBp1XjnRDWLYaDnbGcmcRpSCO3t
 VYhp+rHUjWzRgtz59X1i4cBHuDOIanPOzKXFxZyMqc5BxbHD18LVoqC+1JduxWv2hr
 8s7NcoDjzh90JG/ZJLd57y151KQowWdzoAQg7msclm3OkJ2y4WgMwewzul6rYI0Tpa
 b1lDv0B/41dQg==
Received: by mail-lf1-f72.google.com with SMTP id
 f27-20020ac251bb000000b004486c507f80so1743192lfk.10
 for <linux-riscv@lists.infradead.org>; Thu, 17 Mar 2022 04:58:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nw83rNQU0DG2T5abexM+HrA3AT5FpHyglSBWAvBerB4=;
 b=f9JIC3Oqwk+6s+xK6W6T2Zc8Ar5c2W5noMzzb2g9oqP4ESkfuRN/rbAHme7NuJq2ub
 Pi0ORUC8ih+WqXV71nYb9FTXJOpykRJj/coqs0I5+5rj7wAA2Hi5EZik/ACY6fmWpcUS
 EUGFG0Pu1/WFl0xwBDSpzWB5w0W2qqRa2beehb1Z22TKboFjgui81nQIxUVbsHKBi7KN
 QnuAu3W9pJdw2SYsR6uOHU7r4LNmAMKWKne7X50zMvbqDVRPatXBGWAR/z9RApysoHys
 yVO1Qnjmf/z9cxw8obPMJZyq7O2RiBV400sht0AKb6ChkgcpvI20Ttu/Jbn7A9UHqDwA
 GC6w==
X-Gm-Message-State: AOAM532YGrexogtBhmXRYcK1BWty/U30bSViH+iA4DCZlc63RV35QWZe
 KZf4a0FBW2rXBlzGy757t0n7ZYqqvY4MoNARRnlqe4NhEu/+hbShNhUzNZ4BfmmKP5enHjdQmI1
 AM0cQtstkl2/Yr0Ajip/PkC/mGXEdNQSJ4sG5i9shJg78Xg==
X-Received: by 2002:adf:d1e5:0:b0:203:d609:38da with SMTP id
 g5-20020adfd1e5000000b00203d60938damr3610503wrd.675.1647518269082; 
 Thu, 17 Mar 2022 04:57:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjFXvDvHdQ01w0zg1EFDDh642eLMUzgHUDqkxXLdtcKH+7Ko3TzWiEFBj3msxkYp0Y5lUMFA==
X-Received: by 2002:adf:d1e5:0:b0:203:d609:38da with SMTP id
 g5-20020adfd1e5000000b00203d60938damr3610457wrd.675.1647518268881; 
 Thu, 17 Mar 2022 04:57:48 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 r65-20020a1c4444000000b0038c48dd23b9sm5824900wma.5.2022.03.17.04.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 04:57:47 -0700 (PDT)
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
Subject: [PATCH 15/18] dt-bindings: irqchip: realtek,
 rtl-intc: include generic schema
Date: Thu, 17 Mar 2022 12:57:02 +0100
Message-Id: <20220317115705.450427-14-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
References: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_045803_141612_985969D5 
X-CRM114-Status: GOOD (  11.53  )
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
 .../bindings/interrupt-controller/realtek,rtl-intc.yaml      | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/realtek,rtl-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/realtek,rtl-intc.yaml
index 9e76fff20323..4c00d44923b9 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/realtek,rtl-intc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/realtek,rtl-intc.yaml
@@ -11,6 +11,9 @@ maintainers:
   - Bert Vermeulen <bert@biot.com>
   - John Crispin <john@phrozen.org>
 
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
 properties:
   compatible:
     const: realtek,rtl-intc
@@ -40,7 +43,7 @@ required:
   - "#address-cells"
   - interrupt-map
 
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
