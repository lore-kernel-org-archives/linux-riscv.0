Return-Path: <SRS0=TyRV=LT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FE5DC2B9F4
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jun 2021 07:14:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1A9861413
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jun 2021 07:14:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1A9861413
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=beagleboard.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gfHC48uzNa8fNFi86cj8e5ali2OsDe+Yk12pQ582LYE=; b=odSmWAbhTlq9Hm
	GieXqWJrheD7nvzIPHjNdJ83YywYc4/xH86l8UBfljVLpkc8ZrQZg/1F/QhehUG7RHD+tu/rsk0hU
	xMokGGvw/sZOQsMXaBf4dhwjmgl6kKWZ37rcKn+ZN5ES51IeriljpuPDG/2dBpa2vRK0bzHJZFxJU
	ez2excTRiegg6V/ftAFvIbiRhtx9nXjDIlkxzvDmbe94dmYUOeFVLDfxl/orFvx66wga7YrviLwFL
	uqIbFRr4xyC3mUaP8xSq+tKxTBiZ8sMnRWV6cS+gZ4pw4rHc7WKVktgDIUpxJ6W6E6W46X4xxo4xc
	dXNzer75H2Dwwpquw1vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwg2K-00HVfO-Ai; Fri, 25 Jun 2021 07:14:00 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwg2H-00HVe5-M0
 for linux-riscv@lists.infradead.org; Fri, 25 Jun 2021 07:13:59 +0000
Received: by mail-pf1-x433.google.com with SMTP id 21so7339668pfp.3
 for <linux-riscv@lists.infradead.org>; Fri, 25 Jun 2021 00:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r2yTA2YyTTOHjnjnhewFrBRlVB9NzRAU33wz5Tl6BNM=;
 b=OdEef7pIh3zCgbOjoB508alu335Vkb4LaEgxaXjvjJxJbrdJoxPJXkw1qlsYPA+3tT
 8quzHjHhV0+Rt/XRVIZeHEQNv1wPc4XkG6g0/gdsrrs5mX1rdFawUBM/EKEbhS+K6Pc1
 wnQGWit51sPChvhC2fsvUlqRvsGqBoU4GcPwDhRBj9rN9lM812hKb4ORbUPdzL1EgB6r
 dd9Pdt/UTlHaHSWhDPMphnYxS3XmSvINrq03xVqHqeaPaqjJg5qiRkOo8PrkHbMMV2G3
 SuPYLA3lroGNYemybwu6Rwhw9H31TZl6AjjXrME9MxOhDdJrP30smlMGODHEbKXKxl0t
 iojQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r2yTA2YyTTOHjnjnhewFrBRlVB9NzRAU33wz5Tl6BNM=;
 b=j4o2ZmU+oLO9XuPm+rKxcquZcBaourPeRKcPaLFKV2rgx+5teJESQDOws7PYZ3IOOB
 gBysLPnYZcXNSY9aQ3weJm1wRSarhUsPXGx6PA5KNCGpPXNVb7WlbJ6NrjKUM2nVc2DP
 L2N65Fy4Vw6YuwsgB8CdG2DqLb2smm+sNbhQN+QElCLzz8+DFWuCj2PcAZQEO+FweSlY
 1JVwy9hgEjy/OgDpubDPldsq6D60b5w8WPYCl8WC5AWm5lLne8sKS5BjdUMZpebaRZuZ
 VJZVbCuehAXveLI7IiPIHwB9xdCVqxOjpMt9Lq5tiQC8wbpGZNtDyhVCf2eWhSaJnY+o
 7HnA==
X-Gm-Message-State: AOAM531QFD23IpFpFlEhfRzWl8MVHkqhLVpdZ+kyExF18bD1Sr7josww
 nlHD+Axslfgc3NBVvteUM01RVQ==
X-Google-Smtp-Source: ABdhPJwC7NIRnInbJm+Qvh3Vo1RK5WO8HMU6QACBChKeI5zvThCLdYvwW+ePNQoEMJ/rCZiwNmX9Eg==
X-Received: by 2002:aa7:8390:0:b029:305:983b:42ad with SMTP id
 u16-20020aa783900000b0290305983b42admr9198864pfm.0.1624605234041; 
 Fri, 25 Jun 2021 00:13:54 -0700 (PDT)
Received: from localhost.localdomain ([174.127.163.79])
 by smtp.gmail.com with ESMTPSA id i6sm10144961pjg.31.2021.06.25.00.13.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 00:13:53 -0700 (PDT)
From: Drew Fustini <drew@beagleboard.org>
To: Rob Herring <robh+dt@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Michael Zhu <michael.zhu@starfivetech.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Fu Wei <tekkamanninja@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Drew Fustini <drew@beagleboard.org>
Subject: [PATCH v2] dt-bindings: riscv: add starfive jh7100 bindings
Date: Fri, 25 Jun 2021 00:12:42 -0700
Message-Id: <20210625071240.577796-1-drew@beagleboard.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210625_001357_764786_D06D4A9C 
X-CRM114-Status: GOOD (  12.02  )
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
v2 changes:
- removed "items:" entry that only had "const: starfive,jh7100"
- correct typo in Description:

Results of running checks:

  $ make -j8 ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- dt_binding_check \
  DT_SCHEMA_FILES=Documentation/devicetree/bindings/riscv/starfive.yaml
  DTEX    Documentation/devicetree/bindings/riscv/starfive.example.dts
  DTC     Documentation/devicetree/bindings/riscv/starfive.example.dt.yaml
  CHECK   Documentation/devicetree/bindings/riscv/starfive.example.dt.yaml

  $ make -j8 ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- dtbs_check \
  DT_SCHEMA_FILES=Documentation/devicetree/bindings/riscv/starfive.yaml
  DTC     arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dt.yaml
  CHECK   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dt.yaml

The dts file is from vendor repo and is being cleaned up right now in
preperation for submitting to the mailing list:
https://github.com/starfive-tech/linux/tree/beaglev/arch/riscv/boot/dts/starfive

 .../devicetree/bindings/riscv/starfive.yaml   | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/starfive.yaml

diff --git a/Documentation/devicetree/bindings/riscv/starfive.yaml b/Documentation/devicetree/bindings/riscv/starfive.yaml
new file mode 100644
index 000000000000..68954d0a7108
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
+          - const: beagle,beaglev-starlight-jh7100
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
