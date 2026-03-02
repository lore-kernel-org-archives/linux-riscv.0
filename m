Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A25CEA4E1E
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 15:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L/DqHCMhMkgzH4H/IrRmqMzKYKuSwT1kPZo64wcCyu0=; b=HH13S+grlRfRDQ
	ratjhnb9hT9TIu/DQeJdEyiFBaiy98X0irl9XPv3s5Rq1faFwjSynBO4kDeVy5HkBdL0LZL0KRVPu
	BXIy5kpoS6Et9URpTXIpxQqQPSbbtaF1cuLo1azeemsEgPFyVAE9JFhs0adqv9QqrUe6z8bf41ROY
	sXPHPX/1yMKOVHW9SpcLcIDWr/TCg5/m5yjFLNopAgiAa6fW03RzQhP9x/1s/MEgwUQJmBgRJzlLJ
	bENmVq9HzNWW0S08Hpd5ETqUunR7k6tmSsJoML/c6SSctvu31FqKkHGcJo/dvMGq0QbZ+6y2eHcbk
	mc/kgahAEaWtZGkIhe2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4y2-0000000DK0C-17gS;
	Mon, 02 Mar 2026 15:13:54 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4y0-0000000DJzA-1E8b
	for linux-riscv@lists.infradead.org;
	Mon, 02 Mar 2026 15:13:53 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4837584120eso33053515e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 02 Mar 2026 07:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772464430; x=1773069230; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qgPMIovbEThLlPPQFVARziyNrmjJuegOTMLHImP/d90=;
        b=R7WUEAlmuL0i1YGz3VKnvpsI//XjRTNyyKAnQa5v2+J/n5NMMXtoGZK/DqOQy4IfNw
         Ep4YMdOAvoNvvWrjnA/lDf2dI0oG3FsJ4RBACwA/TLWV1ggdxh7P+IffGz4xdbUg/4X4
         8X9qxkFJPoSTu9JyqGGi/XP6PVdFRdCEzRe+JXqq2W8P6SDszVRuxxZ1bXPb14oN4+Lu
         OHm23aLTfbERxX2kJjrDflkzs2tcyTp//NlGgqFlNeVm9witkUF+tTbFdyO0PgT06MGO
         qSBNiSMcjZ3CYl0tNhLgdgs7hLehiOlRgnxHn7eCPY52jhYi9INi6P/qSKorcy0027e/
         U+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772464430; x=1773069230;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qgPMIovbEThLlPPQFVARziyNrmjJuegOTMLHImP/d90=;
        b=iYjJfmnGDtxThulQJ7rhHDxX46ju2xD7Cp1lfEaKPN1JQf75u2tG7Zsa1UzQwbl6uZ
         ANSj6yWiXWjgjyEX5v336XZJqqX4ltZ7zHFKTEWDMUVLnmn6m5C3q5ObXQpypdhWf1Ks
         880eNgzZg2aXKeGsgmINFQAncKCcptObruH8nWaRV3oSS3kE1Du9ks4m70bRMy/qhVu1
         pN3G0Uq3lYf9Ky/slaWa7lftypgDZ8pMFt6LWVLD6U7OHtg4v5v3Qz+WYMAUMunokiVd
         ZqUC25TNcZ8CWCXyyplmNUk+x9oKQXMWwSUcY7uhpv+rlY8A9aakIXVbvaYXnmfJ1Qw+
         svbw==
X-Forwarded-Encrypted: i=1; AJvYcCVgolD2wN2eySOMhKiVk1icFxxlcxRdyajgv7T0x0hfs/TB4ZBTEnbgAUkMtT02QJlA7H2WcSIYOH4MPA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwNUK+m/m2b/G3zicss/u5pm8LmZJnPZ4FnDEmTR4aU3QSZ0Xpj
	Xm4M5VH9fz61sJkh859un59ngY3qBoUl1uoVk5HkoDqZXP4Qb7gWyAub
X-Gm-Gg: ATEYQzyyTafsFBFmyLdUVQQvWdQCbPbT+SPRwOFs5NOBMpDgeoCcl7cdSSXV+cVgNxv
	Qw+a55lgPifKFKDLeDN3WsZ41Q9aDDNRxp1/NrMq3dMC7s9BSXrI3vfWuU4m9Ryeidk49a7HDlG
	z3TF3OViQExo/zls9aQvA1bf5MMjsFxeHpSc2TV9/PBqZyR4TXgpdPihcaz/W2fGo3zQ7r/UyM2
	NMp0wKV/owMbfC5kkvN2mKd8Y9SN7C3SmGADRNJc+HIcLO+kC2IAXkaooH0ZSAYTJSmGiUncPQy
	Aj/Y4mrFqlPtkcPuuWWKW9woz8O095WV+nGOX/1ftDRW9XU3S8ZGNt9FbOi6e4CexY65NYLD9eb
	CAfqDWdL5cFrqpfYkM9RWdXNDOy41NOUX0OD8ElH97ahO9OG7K3+m5VMCRDHSIEIBjVXlzcgRKW
	zfn3sJZJ2HX5H1rJOgj5ar9rtrMM1NS9XnKY7xSwuURmPl/RijoU6EpWKv/eCYMlv36g==
X-Received: by 2002:a05:600c:37c6:b0:483:96d8:9f75 with SMTP id 5b1f17b1804b1-483c9bc5b89mr218710175e9.28.1772464429956;
        Mon, 02 Mar 2026 07:13:49 -0800 (PST)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.235.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd70e692sm437240265e9.7.2026.03.02.07.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 07:13:49 -0800 (PST)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 02 Mar 2026 16:13:22 +0100
Subject: [PATCH 01/10] dt-bindings: mmc: spacemit,sdhci: add AIB voltage
 switching registers
MIME-Version: 1.0
Message-Id: <20260302-orangepi-sd-card-uhs-v1-1-89c219973c0c@gmail.com>
References: <20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com>
In-Reply-To: <20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_071352_350959_539A9CA0 
X-CRM114-Status: UNSURE (   8.31  )
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

Add SpacemiT K1 AIB register properties for UHS voltage switching
support:

- spacemit,aib-mmc1-io-reg: AIB MMC1 IO register address for voltage
  switching
- spacemit,apbc-asfar-reg: APBC ASFAR register address for AIB access
- spacemit,apbc-assar-reg: APBC ASSAR register address for AIB access

These properties enable the driver to perform voltage switching between
3.3V and 1.8V required for UHS SD card modes.

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
index 13d9382058fbc1c12be1024d1c550f04a825673c..4d6590aa8262009b6e5697a04b45cf3736c0fa42 100644
--- a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
@@ -32,6 +32,18 @@ properties:
       - const: core
       - const: io
 
+  spacemit,aib-mmc1-io-reg:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: AIB MMC1 IO register address for voltage switching
+
+  spacemit,apbc-asfar-reg:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: APBC ASFAR register address for AIB access
+
+  spacemit,apbc-assar-reg:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: APBC ASSAR register address for AIB access
+
 required:
   - compatible
   - reg
@@ -50,4 +62,7 @@ examples:
       interrupt-parent = <&plic>;
       clocks = <&clk_apmu 10>, <&clk_apmu 13>;
       clock-names = "core", "io";
+      spacemit,aib-mmc1-io-reg = <0xd401e81c>;
+      spacemit,apbc-asfar-reg = <0xd4015050>;
+      spacemit,apbc-assar-reg = <0xd4015054>;
     };

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
