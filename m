Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5FD6C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Mar 2022 12:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XJbQUJBnjrHV5/S/9UytrNbJfNED8cB5MofUXkixxTs=; b=p42z7QrQkaC76M
	9l4f5ziB2yOYXoj/vQSL9D8j9w4ZC+WVoLBFlLIhOg0kpNt2MiiyqMRliyMMInjUB6tNZZ5yzjxt3
	oSnDyvQQj5PFI/gqgFVeb3gAxIOELyaMITWtb/MVdy8uv9eo/nA/0ZznkhHp53dwI5uVg9LEzig/Z
	9e3ZGgO4ScV+DNeJbRIPDv5bbHNK4tvuL8SyVCmZyspkXsKlUfxAb423HrXoi/l5HM2RuYVVb9iVg
	2nxwqR8y/bbNny27MNBrRACHk0blM+5JlEnqPcAUJ5bUvWSOxlAWmmGPUKRw5FYrZmasFLIa8Y3C+
	o5PtotS6g23+lCNrf6vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUot8-00FwfO-KG; Thu, 17 Mar 2022 12:05:54 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUolO-00Fswf-Eg
 for linux-riscv@lists.infradead.org; Thu, 17 Mar 2022 11:57:56 +0000
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D289D3F627
 for <linux-riscv@lists.infradead.org>; Thu, 17 Mar 2022 11:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647518272;
 bh=upn41SGXInxzeh9yeucVbbgZI6J+Vh9tnHYXNDkdf7c=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=TwZZXYEe9Z4PRrzSZPkLtyo8bvCVAJf6e06zzQ9N4z1ev/U2JsmChlvjqZnC/e115
 9wUzJliGKudJturBVpyXtAPvAbCGZwCJdJz5Ce9Ib6CkfxJ1yQZRlYJ6IfI8imc5z0
 eVvMq7RtrmA8UJ6JcOGKx+bvpZ9IL9XI9nFPUB9FMJQF+thWAjawZyI/n4cMEPnxDb
 t8xtYsltClqQ/V3she0uXpbcflEWQFQ4EdCuXfQDOz4Eei4JRqM9CBbSvTTpw7NHIy
 PEOUnNMREKL3Gi31PGwWJ5IkXrJyn/mRCHHNslHNMOCawbimFAJcUzqWEZ67sEgcqu
 yULW5DkA2aiFw==
Received: by mail-wm1-f71.google.com with SMTP id
 12-20020a05600c24cc00b0038c6caa95f7so2000376wmu.4
 for <linux-riscv@lists.infradead.org>; Thu, 17 Mar 2022 04:57:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=upn41SGXInxzeh9yeucVbbgZI6J+Vh9tnHYXNDkdf7c=;
 b=cJQOY/IDfwM+06eB4JSQfSWQrm9hpQZjILJFNccWM7IRnHXko3awfhfpdE0PkF9/ev
 5w6xLKBwwAKqcxuMUc6lUWtrkRy532yZdotIIfAffuKfDg6cQWdSd0DPO0xfvDtCO1+e
 Ne78hnkL70GG+T5ifeEtudOSpN8OR9sHdPUVHv7GszGEp10ndB7WCjtzsYGnzooBI36t
 P6qajIg4yIA7kCwwMjf0sOOgbyVcz2zYis//Y8tgDsHL+OgD3uLy0nW9YoxksMs+y5Uu
 mSvZsesg5OJaB8jJoONn6TXZ7QBn/sXP6pR+X0y57v4/f9D0fuXQwMhgJvqKyKAUOJJn
 Ahhg==
X-Gm-Message-State: AOAM532H4/crrxR3HAy7ezDaE2RjGn7LuSDLHKXDtbL4ztQnIprWV+C7
 iW4AgtKsR6UGDqkZTHNdmrB0brnBz+dTKQUmsMrkDh2GmepDOWxyBcYsC/bbs8TrHW4x71RghET
 +Tx7pe+UkKTD4zu++HeAbbLowEJljXdwKNMoalA3JOGDnLA==
X-Received: by 2002:a05:600c:4e12:b0:38b:b715:18a6 with SMTP id
 b18-20020a05600c4e1200b0038bb71518a6mr3598862wmq.17.1647518261204; 
 Thu, 17 Mar 2022 04:57:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwaJnwGCDWCgNxVBPz8602WsRzPCQWkTc7stpH5PT+AGMHTpue3CNd76a9vbasK9iibDzPBWw==
X-Received: by 2002:a05:600c:4e12:b0:38b:b715:18a6 with SMTP id
 b18-20020a05600c4e1200b0038bb71518a6mr3598815wmq.17.1647518260943; 
 Thu, 17 Mar 2022 04:57:40 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 r65-20020a1c4444000000b0038c48dd23b9sm5824900wma.5.2022.03.17.04.57.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 04:57:40 -0700 (PDT)
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
Subject: [PATCH 12/18] dt-bindings: irqchip: mstar,
 mst-intc: include generic schema
Date: Thu, 17 Mar 2022 12:56:59 +0100
Message-Id: <20220317115705.450427-11-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
References: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_045754_736471_CFC8F8A8 
X-CRM114-Status: GOOD (  12.09  )
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
 .../bindings/interrupt-controller/mstar,mst-intc.yaml        | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/mstar,mst-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/mstar,mst-intc.yaml
index bbf0f26cd008..7cae52490ff5 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/mstar,mst-intc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/mstar,mst-intc.yaml
@@ -16,6 +16,9 @@ description: |+
   The HW block exposes a number of interrupt controllers, each
   can support up to 64 interrupts.
 
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
 properties:
   compatible:
     const: mstar,mst-intc
@@ -49,7 +52,7 @@ required:
   - reg
   - mstar,irqs-map-range
 
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
