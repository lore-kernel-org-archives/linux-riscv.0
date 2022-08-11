Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4913C19F2A
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Aug 2022 20:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uxUKEXZ0O75rJsPRZOkPYiWxh/Gx0QORwe2fDq3QnHs=; b=hocdYsD7z+6dag
	AQLhrj6+CS64NC3OQBKNY5ktra/BG21mJwi1zwATsa0lquOp0zK4/QQ/a1h1NGnIn/E7TyQBCxELm
	v0nmpe/BJvd0UkDlXbpvqWDVbEm1od6kOdwasCIdpOWbf1ZsZD5ll9KN7kUMEP1kc82+5kGuLzCsL
	Euo17Rn31VHEnsCh6iCSsHRYq1kxZ2iEck+o9vKrdkva2mq/tWyJJ62BHiOKWyzMWdaNye6JnYqAj
	WTptuG6+sjm87unDpx42EMmhpb2Ixn24g6Cbz+h4oVu+hwZF6GNzBZB0n0TYPr6LEdB1wOU0rLZnZ
	tP/xxy8oPMdiQFlVo6jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMEqd-0055q9-NC; Thu, 11 Aug 2022 20:32:07 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMEqb-0055na-1T
	for linux-riscv@lists.infradead.org; Thu, 11 Aug 2022 20:32:06 +0000
Received: by mail-wr1-x436.google.com with SMTP id h13so22568480wrf.6
        for <linux-riscv@lists.infradead.org>; Thu, 11 Aug 2022 13:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=NRC10trzuqulg2mbWP7/9kZe6SgJG6yhrQ9QCsgz3RY=;
        b=XCutOpnPVVZAhqOaRWoHNzRAgMQx51l0/PCcMxYRlNOseA+OItbKcHJEKWbm+xLZ6Y
         1O3hD1vVHJ81uZVSSVt1e3UDPKJkaZS1SChDX43YOC61XGyLqDTk5IUVkJFcPLiLFdL1
         NvtfvEjj+pgrlyHICggcJiGSX6A7ubcIgUCSEE1VQyG76VLdbUYxgGMB5gpKj2gbwZa/
         nMdM4F3m7kJ7wIP7spW01DrV0sYRbHjF5mLuvv+GT5xwDiM1dyhYbyp9UzGHRdIB9RiB
         VOAVcTmrRjcjEY+F5lib/jjC21Rz+7G5QE2/aTsk/g8DKnF3iQxhtkP5+1kBsu2raXJb
         9bQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=NRC10trzuqulg2mbWP7/9kZe6SgJG6yhrQ9QCsgz3RY=;
        b=csHtGxBr2LfKFIkZSEQfbKIaHn7I2oinTnNJ9s9QGnPk/83Jk8I+EKnvc61PhDPOaq
         8HuQhTUHNanbBo826zB8fEzbzVWrX5dcif9GdZZ0NwGET1FvsmBzu20T58qQdg1nCjUj
         HAf80nkkDZUkR0KL6ZwfyRrqUBV0mg0/1LO2MBAwaA0BLlQIIzS7cGiDVkl1g9qdbcYr
         nsoJIv4Bas3QpWMqmJpI5RuuONxBqreeVspIicX4oYG+tbDpzLbFAWdlBC/UpQPen9xK
         60IXJ2cV+K+JzGgtMgPDI8JsOrzwYLvgtdh9NDO983udgjxjEGpHmusTkeiqWCJNtXqc
         o9wQ==
X-Gm-Message-State: ACgBeo3nifZuxUcU1TLbWWOhK3gDxYaIQ/ZTxjd7hcLV3hTdz0DeKSEG
	he87bpnWK6L0wQ21/mzKUi53EQ==
X-Google-Smtp-Source: AA6agR6GlDpUiPt5PzjH7aZTJbryfnMlgfg7zCpD/CJubC7Re1tH3mrv1P6fO36cNnFdc4wpXfFkbQ==
X-Received: by 2002:adf:e112:0:b0:21d:7195:3a8d with SMTP id t18-20020adfe112000000b0021d71953a8dmr333222wrz.371.1660249920196;
        Thu, 11 Aug 2022 13:32:00 -0700 (PDT)
Received: from henark71.. ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id n18-20020a05600c4f9200b003a1980d55c4sm8480521wmq.47.2022.08.11.13.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 13:31:59 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
	Piotr Sroka <piotrs@cadence.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH] dt-bindings: mmc: cdns: add card-detect-delay property
Date: Thu, 11 Aug 2022 21:31:52 +0100
Message-Id: <20220811203151.179258-1-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_133205_131974_0487E30B 
X-CRM114-Status: UNSURE (   7.81  )
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

Upgrading dt-schema to v2022.08 brings with it better handling of
unevaluatedProperties, exposing a previously undetected missing
property in the cadence sdhci dt-binding:
arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: mmc@20008000: Unevaluated properties are not allowed ('card-detect-delay' was unexpected)
        From schema: Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Should this have a fixes tag? If anything, it'd be
Fixes: 84723eec251d ("dt-bindings: mmc: cdns: document Microchip MPFS MMC/SDHCI controller")
but idk.
---
 Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml b/Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml
index 4207fed62dfe..99f89eb19356 100644
--- a/Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml
@@ -112,6 +112,13 @@ properties:
     minimum: 0
     maximum: 0x7f
 
+  card-detect-delay:
+    description:
+      Delay in milli-seconds before detecting card after card
+      insert event. The default value is 0.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0
+
 required:
   - compatible
   - reg
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
