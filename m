Return-Path: <SRS0=DbKB=MB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEFFDC07E99
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jul 2021 20:17:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D9AC613BD
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jul 2021 20:17:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D9AC613BD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=beagleboard.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f9msU9aP4S+c8KRKGaLrrXzAuYEdJqDMQK/HnnxDhM0=; b=ag70cm/q17vvdA
	hy9I/OWHTFH3Pyuzi4sya9bP6+wVaUQYT8WA35PDjWhg7jJ7XVF96YUjnHppHuTynnF0a37DbdlTl
	nS/2oAoOXQ0fMacPmLsHxlF4o2Id91WgXZ58Y07+Fek1WYYYLRx0A4nJ1ELOAQYzWgxEs0jjEdSlP
	qOKuhlpuT7yrFE5q1NrKfenywyqy4OaXBXCN38nQ+htD944OtPar1EdWOrLaSoE/euSOAKxvWEPSv
	1sD+tjmWQF965rDkQ83hBDOU9bsk84YXu42nTme4DfqD4jdEm6cL6Ovbdd/59LRkzSJLKkzjGR8KO
	sbAv49DtgWXAoNGlR9xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1wvn-002Rbs-JU; Fri, 09 Jul 2021 20:17:03 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1wvk-002Ral-Pi
 for linux-riscv@lists.infradead.org; Fri, 09 Jul 2021 20:17:02 +0000
Received: by mail-pl1-x62d.google.com with SMTP id p17so5079391plf.12
 for <linux-riscv@lists.infradead.org>; Fri, 09 Jul 2021 13:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VE8NLNhGFPN7qXnwo6GnJohAmUIG/mEAcTOghcJ/tYw=;
 b=unp+hSNyALKLsqd7u1qNuLrdnRW4F28Fa86NuyBD9U5wkGyTPvUDri/GTCE4t7mDZC
 Q/7OjCgD5/FgWFcMlvH5go44vCiJ2Jnk/HbKADyCD+gbbO76ARGcN3pKmiCsQy0mYzE+
 eqCVMtcQiruCbiWt3jWz3fTFC7aSlu9DWdF4qD6uoVaheFiCTFF5O1tfrk7DdEzl1d8U
 v4e+KsHAGme5xnsG/V9yGJpUZY4UOBCVs7N89TBUyro83zGKhSqUqzTx3O3XgxK9Mkh7
 bOJHukR5Iw+A4twwHfa58M5xA/sfcq1kUG2qEqmWvf8XkzQab5LpFG0f8QKipp59xgey
 18Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VE8NLNhGFPN7qXnwo6GnJohAmUIG/mEAcTOghcJ/tYw=;
 b=IzzhCXpP+odyr9epclCgnDlM1GA47P2KqtpG6NZqNoy+GnHrznV07H7OEurHh/snLP
 N8vDeJ50zDtUWXgsrfqW8TIQso6BAbbA1NG/x5WDpA8H6fCCN5+vQW1orkwAoXELaO2U
 guJnZaRGetEuUmTnmnVwqBaFGE15VUl5fksQWQs5xPTlpz8o4fEzbPe1tZVqRTwFQhgw
 bD3wNkX/gt898vEW4t2L0o25+AOMrzCtVL/SmSHRneGj9nGq2PGfkp42y3SaDwU6ChwP
 YtJrtVmuBDkAk1hzmNpdKyR+b3FLi5lQ8ZYN5aPTnVD2da9QSSV9/dZIWhmZhotmhFlF
 eCtw==
X-Gm-Message-State: AOAM530DvFTmbsHzJfjzkeslF+dc50zThDAt5cdUanCF8M9clBy1LAVR
 4G9pokT4a/iB+sZjicgu/Xtcjg==
X-Google-Smtp-Source: ABdhPJwsTex9cKmL6LslKd5Av4q4bNdTD9L8npwNfJ6/LlhBUloj6t2hiLzE1+epl2SAUQY0ZNJgEg==
X-Received: by 2002:a17:90a:510b:: with SMTP id
 t11mr658578pjh.178.1625861819359; 
 Fri, 09 Jul 2021 13:16:59 -0700 (PDT)
Received: from localhost.localdomain ([174.127.163.79])
 by smtp.gmail.com with ESMTPSA id w22sm7220791pfn.188.2021.07.09.13.16.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 13:16:58 -0700 (PDT)
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
Subject: [PATCH v3] dt-bindings: riscv: add starfive jh7100 bindings
Date: Fri,  9 Jul 2021 13:16:04 -0700
Message-Id: <20210709201603.2625664-1-drew@beagleboard.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210709_131700_958844_81160EF1 
X-CRM114-Status: GOOD (  12.55  )
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
index 000000000000..18d510904441
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
+          - const: starfive,jh7100-r0
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
