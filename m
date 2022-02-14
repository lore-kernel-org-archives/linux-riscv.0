Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C4B1C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 21:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KFe49daEO3TacyzpGGgGiFeQ46+tnYWF+2empMnxBKU=; b=vsPLkA/X52Zh6U
	CXNLDsKfLJM0JzovuH00GcwcFatJDuWP62qsfSGwt87QLjuEGLYEfZ7QbSTQT41S2D2CnD50qi/wZ
	EtCV/bsK0mow/wdc54xlrnHEkwqXBuUlHQnCI1HlkGH3jN0t1gEw3PCaV6Htdlhke2gJeDqyKz4Q2
	BJG6T4dRk3B1gq8n4s1LZraCDQZHplN15bMfTgp8irUbtKFJ0oYGfRwh1erYttDI39cADH3Tck3L0
	4cuZhhTSi8eZWxl/i3z0D/NCgbXfxy1IsyY3Eei30QvPahmLJLp1Xf+yxDx4/Plweyb32WmbVfh7f
	oITSeMaj0d/jOqvsuexw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJis5-00H0Q1-FH; Mon, 14 Feb 2022 21:26:57 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJinU-00GyEV-8K
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 21:22:14 +0000
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D4A9F4033B
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 21:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644873730;
 bh=pHflPK+1dIKzIsgbbrg2ywYytRq8pFheQaXjxJrMqyY=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=PMVAiEa9tAVg/Y+d55sfXoniZdgKDqGFnHMxTU4yEBIv/2S5cyxgqJ4Zo/kVQJSGM
 lUayYGNrLcKEfrHac9o0jv+/2lwvVROehMAK2XxqhZpQdL8kLiDDyp56j8s6FjfcbF
 9BwDS3hECD49InL3/DmH8glCQ6icvqHjmZJ4MF4FKhCJnaRraC74nAQ+JKhwXUqYfh
 1CgXHxsI/dohxNbDDFlT1VqKsqXGhFVXYYXodfKcedw/j94yHtRAFQcFNxjZP/+fn/
 Ay0BCmKgs/DM68FIAJioOmmVDJ1O1AVowkW9Zy2Sl6y8JjDdm8sae9WmosH3CJ5MBh
 V5xwonbN0f9OA==
Received: by mail-wm1-f70.google.com with SMTP id
 b17-20020a05600c4e1100b0037cc0d56524so235882wmq.2
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 13:22:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pHflPK+1dIKzIsgbbrg2ywYytRq8pFheQaXjxJrMqyY=;
 b=E3U3rT/EkgIMpoHlQ55Gg+ppgBoSMcQ2U2F7kl9k2F2irGCQRTQArCV1zKbH+EmlI8
 sNVKwyv2hRJSGa0wC/4CdCQ2kiGVxP9PdvNAD95uGxmUDyLiMQ2ZEpQTQP0rSrdHbH58
 aIRws/TcJUtsqdNuAICuYSrgsWLIJ1rE/dHZpO2VfnEF/1Uhze4BZ2/PRFpxWlTi/bX4
 /ZHbB2YpXgOFykEZIt+3KnGJOKLzBqNzRQpQ1RdNMbqtyDVjOd4pmYYc1xbHTkb6kbzk
 9561uCNLFTT/Z4f5gnX9iV33oFbFuH5/VFa3Lj8nBA/X+TYrTu3gPlg/ELbc5Ggc0fzS
 2vNw==
X-Gm-Message-State: AOAM53124UUyXhvf3RrfnqC0Vz+J1TvVXsRFO2CkfrCeAjcjuHveTgN6
 PYbH0v17ZhNu0tegyyGiZiCweYkwsWIx1KOH1ltbwbWwKsxeiCbabKndz14A46DZKa8bS9v+ZID
 8H0kcnnlf8bGW12Sg1k4e3F0reDZnUDdPr9SpYpT4pe4D3Q==
X-Received: by 2002:a17:906:d555:: with SMTP id
 cr21mr592302ejc.428.1644873719509; 
 Mon, 14 Feb 2022 13:21:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyXvrgHPtrdYKNQY7C7Wd9/NsvQdSUG3/eoACXgHTI31beBEFWPYpjvuWpVSYib/oyyZwbB2w==
X-Received: by 2002:a17:906:d555:: with SMTP id
 cr21mr592282ejc.428.1644873719273; 
 Mon, 14 Feb 2022 13:21:59 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id v24sm2327203ejf.7.2022.02.14.13.21.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 13:21:58 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Heiko Stuebner <heiko@sntech.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Philipp Zabel <p.zabel@pengutronix.de>, Anson Huang <anson.huang@nxp.com>,
 Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>,
 Rahul Tanwar <rtanwar@maxlinear.com>, Jeff LaBundy <jeff@labundy.com>,
 Yash Shah <yash.shah@sifive.com>, Sagar Kadam <sagar.kadam@sifive.com>,
 Vignesh R <vigneshr@ti.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v2 01/15] dt-bindings: pwm: allwinner,
 sun4i-a10: Include generic pwm schema
Date: Mon, 14 Feb 2022 22:21:40 +0100
Message-Id: <20220214212154.8853-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220214212154.8853-1-krzysztof.kozlowski@canonical.com>
References: <20220214212154.8853-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_132212_480327_E0152C62 
X-CRM114-Status: GOOD (  11.62  )
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

Include generic pwm.yaml schema, which enforces PWM node naming and
brings pwm-cells requirement.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../bindings/pwm/allwinner,sun4i-a10-pwm.yaml | 53 ++++++++++---------
 1 file changed, 28 insertions(+), 25 deletions(-)

diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
index 800d511502c4..e93e935564fb 100644
--- a/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
@@ -52,33 +52,36 @@ properties:
   resets:
     maxItems: 1
 
-if:
-  properties:
-    compatible:
-      contains:
-        const: allwinner,sun50i-h6-pwm
-
-then:
-  properties:
-    clocks:
-      maxItems: 2
-
-    clock-names:
-      items:
-        - const: mod
-        - const: bus
-
-  required:
-    - clock-names
-    - resets
-
-else:
-  properties:
-    clocks:
-      maxItems: 1
+
+allOf:
+  - $ref: pwm.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun50i-h6-pwm
+
+    then:
+      properties:
+        clocks:
+          maxItems: 2
+
+        clock-names:
+          items:
+            - const: mod
+            - const: bus
+
+      required:
+        - clock-names
+        - resets
+
+    else:
+      properties:
+        clocks:
+          maxItems: 1
 
 required:
-  - "#pwm-cells"
   - compatible
   - reg
   - clocks
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
