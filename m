Return-Path: <SRS0=hRw5=MF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2FBFC07E95
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jul 2021 06:31:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A140560724
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jul 2021 06:31:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A140560724
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=beagleboard.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nYL5eA3Oydqw4xWGnwhmBw6zn7Md8oyDlVlIUJjI9Ys=; b=osBgdzC05PEYzI
	yBWsqFdhDQUtCZqwiDilg2+4sym3bn0SK+0xhZE3fE5fKOLhtG6BMahaEzL+8yA4c7mAl0ATccsQM
	WJ3gnuhMWvui2EBNueT58ymm1/ItnaClEhNihGI00x1E7QswTvj0kX4AnCy2k41ynE72kY96fd7Ay
	mDBsXDF8z7OT2/3JyYK+NdgVCAOflZRyS1cSc8KBwPsOo2MwDMAITdlDo/Hi6APuqh08u8SDFNrym
	jDj/T+8ODRk8rGNApqJW5z16rsHBaC294QY0CpHO2ny7wbSyoZwoLJovG5CaE12INlvvirn8Cvwgp
	s2wPuIbIhxGBq75CYsEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3Bwz-009HGw-Ci; Tue, 13 Jul 2021 06:31:25 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3Bws-009HEr-Jf
 for linux-riscv@lists.infradead.org; Tue, 13 Jul 2021 06:31:20 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 me13-20020a17090b17cdb0290173bac8b9c9so782273pjb.3
 for <linux-riscv@lists.infradead.org>; Mon, 12 Jul 2021 23:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8q16xM0VATbsQIw9ZAgLMMaiBTBYT226BUgo9tEUHzo=;
 b=NowaPZ61D4lRhQ6XgEQ0JDdMKVSdlWxkprkpq7+bKySeVJQgMqMOsmUYMOLeh1I5Gb
 bdrmP72j2auo1MqavisF/kbi85hK1Y6yfli+BWmFcJ2+LqSvy+4MiVc4NuxzjnR23KcC
 6ngsDBy0qKS0oH2H3D2m+wO+DV7pTFT3paslf3S0Bptb9Trkk5R+GDaUGL9cCXaHg01O
 z6uU1o53B4/xsWuE0/Hlmp3lN5fwbXEXNcM/CdGy1RMWp/oyygL4vluidcsd4TfE5gNO
 TuMyWSMqTH0Jh/m7K6eh4h7vT3w6Lb+2S3v+G5FskgARUbAg9sslGzXnO9pYZhTBuonm
 nXzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8q16xM0VATbsQIw9ZAgLMMaiBTBYT226BUgo9tEUHzo=;
 b=aS6YeoSDG/bjTGY9CDSyqsGf9XMfoISb23KDp3sTGHaYmcpJOfCJv9LGJFcnDvgwGv
 mPhnVnj/QmU8uB8nH2buwIYgajNE8YmhU3P33GZejyloutRQZQF8TJDalkiv/TNh6m9b
 pzu/kLUTFawRKZYUzu6G5kO4z2CIsYQyNM+bngfEjsLhzVUIBrE6qoiXjqE5xFfuY3Zu
 P00eDxXMuFTcmW3HY/9F+eXdndqyYz/VnzhhnEWX8SpsO9F1r0uD1b65XQUfmyyuoq47
 pSoot40vq6Xfw1I5F4fXlAf2QniZzm0eEyZZPynf4pUbd8xegcbTCI6moKgXUcLUdY6M
 aC+Q==
X-Gm-Message-State: AOAM531C5zbXg5oO1DFYFXIylcCWkTgjwzpDMqPujYSb+o7UiYCT6sN0
 dYMBP0Ok1X9NjMGbXgE7w14+7Q==
X-Google-Smtp-Source: ABdhPJwFUa2Qzo0NvquoV7uUpgYuK7y6PRmeZm5GHfrWJV99CHCkT2bfgPL8nMXgFoUfs+D+qZYBfA==
X-Received: by 2002:a17:90a:b63:: with SMTP id 90mr2836687pjq.58.1626157877430; 
 Mon, 12 Jul 2021 23:31:17 -0700 (PDT)
Received: from localhost.localdomain ([174.127.163.79])
 by smtp.gmail.com with ESMTPSA id j13sm19614245pgp.29.2021.07.12.23.31.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 23:31:16 -0700 (PDT)
From: Drew Fustini <drew@beagleboard.org>
To: Rob Herring <robh+dt@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Michael Zhu <michael.zhu@starfivetech.com>,
 Wei Fu <tekkamanninja@gmail.com>, Jack Zhu <jack.zhu@starfivetech.com>,
 Leyfoon Tan <leyfoon.tan@starfivetech.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Emil Renner Berthing <kernel@esmil.dk>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Drew Fustini <drew@beagleboard.org>
Subject: [PATCH v4] dt-bindings: riscv: add starfive jh7100 bindings
Date: Mon, 12 Jul 2021 23:30:18 -0700
Message-Id: <20210713063018.3000459-1-drew@beagleboard.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_233118_696016_4CDC7299 
X-CRM114-Status: GOOD (  13.05  )
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

Add DT binding documentation for the StarFive JH7100 Soc [1] and the
BeagleV Starlight JH7100 board [2].

[1] https://github.com/starfive-tech/beaglev_doc
[2] https://github.com/beagleboard/beaglev-starlight

Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
v4 changes:
- removed JH7100 SoC revision number after discussion with Geert

v3 changes:
- added revision number for the board and soc after question from Palmer

v2 changes:
- removed "items:" entry that only had "const: starfive,jh7100"
- correct typo in Description:

Results of running checks:
  $ make -j8 ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- dt_binding_check \
    DT_SCHEMA_FILES=Documentation/devicetree/bindings/riscv/starfive.yaml
    CHKDT   Documentation/devicetree/bindings/processed-schema-examples.json
    DTEX    Documentation/devicetree/bindings/riscv/starfive.example.dts
    SCHEMA  Documentation/devicetree/bindings/processed-schema-examples.json
    DTC     Documentation/devicetree/bindings/riscv/starfive.example.dt.yaml
    CHECK   Documentation/devicetree/bindings/riscv/starfive.example.dt.yaml
  $ make -j8 ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- dtbs_check \
    DT_SCHEMA_FILES=Documentation/devicetree/bindings/riscv/starfive.yaml
    SYNC    include/config/auto.conf.cmd
    UPD     include/config/kernel.release
    SCHEMA  Documentation/devicetree/bindings/processed-schema.json
    DTC     arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb
    DTC     arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dt.yaml
    DTC     arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dt.yaml
    DTC     arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dt.yaml
    CHECK   arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dt.yaml
    CHECK   arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dt.yaml
    CHECK   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dt.yaml

The dts file is from vendor repo and is being cleaned up right now in
preperation for submitting to the mailing list:
https://github.com/starfive-tech/linux/tree/beaglev/arch/riscv/boot/dts/starfive

 .../devicetree/bindings/riscv/starfive.yaml   | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/starfive.yaml

diff --git a/Documentation/devicetree/bindings/riscv/starfive.yaml b/Documentation/devicetree/bindings/riscv/starfive.yaml
new file mode 100644
index 000000000000..5b36243fd674
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/starfive.yaml
@@ -0,0 +1,27 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/starfive.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive SoC-based boards
+
+maintainers:
+  - Michael Zhu <michael.zhu@starfivetech.com>
+  - Drew Fustini <drew@beagleboard.org>
+
+description:
+  StarFive SoC-based boards
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - items:
+          - const: beagle,beaglev-starlight-jh7100-r0
+          - const: starfive,jh7100
+
+additionalProperties: true
+
+...
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
