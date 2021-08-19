Return-Path: <SRS0=mZrj=NK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81F52C43214
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Aug 2021 15:45:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 506D7601FE
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Aug 2021 15:45:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 506D7601FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jof66piVNxdSjYLM9B5NMNIftcdMq9nYssTkbjEeYNs=; b=B2ixZiQGz8CrXN
	ZRY7w2+yL/anx57WhO8A8gauuMDOerKKxdiXLUnb5xFUD6qu7PBYH7rhcJo8hMe4eAK2ozReuzCtB
	gd6xqp71ijb2M9AL1v7Ue1rR0uYoO713+FDN3eeyPjQ7z+sHhG4c1sucz81O5rFN+rSLeV5zvQqfY
	8h+h1fbMS6mnm4RgVmBWO8rG4M0V5oMmnL/rbN5OPRZkhKfiYDmhmLqM/iPLDeiRFopGUb72I8DCj
	vq/0ddW5ujBgpahR1NTPj5Jy8+BdAADfujv6C7GAge3wCko/gztZuWxulbreKuBWap+wbBFLeEar4
	9rlzDTqsLYUmSkzShMLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGkEY-008qvm-7t; Thu, 19 Aug 2021 15:45:34 +0000
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGkEP-008qqO-7d
 for linux-riscv@lists.infradead.org; Thu, 19 Aug 2021 15:45:32 +0000
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 8150D411F8
 for <linux-riscv@lists.infradead.org>; Thu, 19 Aug 2021 15:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1629387917;
 bh=9g8lVxW/0vIBsgyWcHYECrU1Y69l0dfoNbAMk8ILUfM=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=SKS4tBzPDpF0JiynZAqsbxOp3Iltx/bv2Q7GVXtjySELskxRmkerEEGFhqUXtCbQl
 bDt7PrCm/sz942+ZfGV6huN/hv1zXmhWhkDFAhTh8pp7/ckfflbGFLY1jNl6vhGQGe
 PLmG3XMj6N8NF7WNNdD5e3FR2M/9Ln0s7y47BMU6iWAD2zAJnjwa4DM5xt/Erni4I+
 aXrJS1Neszfzr8lF+keIgTBebHKNRpbcFpZ1I7Ztttq565aeAeQqkJ0P/Wydg/tumg
 1CnH1tOistWoImKnURofDvTKB+W1mqoyU+vGMIQ3EyBlTrsCmVUVmr0tiEjNFrSvq7
 CMIgL9FSoCWQQ==
Received: by mail-ed1-f70.google.com with SMTP id
 ec47-20020a0564020d6fb02903be5e0a8cd2so3043048edb.0
 for <linux-riscv@lists.infradead.org>; Thu, 19 Aug 2021 08:45:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9g8lVxW/0vIBsgyWcHYECrU1Y69l0dfoNbAMk8ILUfM=;
 b=fVtcl2pq4cb5WpwdwYATl1LfOPhO/Yo7lhKYbTnVj61HEG0GI5sKf43w9lfQSgvsxl
 YC6ee4zXwl7HlbvZLzrsO5zcaatFpUAYiwWWg/VyRByv8Cb/299oQM5CVtCM1f3gIss4
 lZYajnzGK+Z+OrQr5jTUx1AN7igMOXtFPvt/3xzRiAtcTGoc0TyvupWFySHmeQMShYtM
 VgIVdikhjb1oKDJ4IEnwgT7AIvTFfF8fa0oF4bpNXid8TGQB55JiY9KVejwzK+Pi3c+6
 70gAZEuvuPjcUuNXgXRLlQd0l0PpLECM/WBdiBIPBmr0zsb+A7WMlif5lZzlqtiXch3s
 +ndA==
X-Gm-Message-State: AOAM531RDfdEIP8Rzbwzm0n86/1hJzA+rDNGW3wkU8yx0BvrMK/+3MHg
 N+bDUwhgzb1J4JWlu4nYB1C10alRhSat45U5tzLmIuU1zhhNU2qNL4HPBJDQQ/L6EgQ5FssDp0V
 cPKZK+/v2NhUfYKMwKjgX+iW0Zs9+CcUO2ai5uKNO2c9ykQ==
X-Received: by 2002:a05:6402:2936:: with SMTP id
 ee54mr16886874edb.70.1629387917315; 
 Thu, 19 Aug 2021 08:45:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydJxAR9RqcEIloU3dIrjmUihGpRPfzhtv3jlhyIeTCtbI+Pz4nUoF1CAoY/Ww8GACdR8Ks2A==
X-Received: by 2002:a05:6402:2936:: with SMTP id
 ee54mr16886841edb.70.1629387917156; 
 Thu, 19 Aug 2021 08:45:17 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
 by smtp.gmail.com with ESMTPSA id f16sm1925373edw.79.2021.08.19.08.45.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 08:45:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Atish Patra <atish.patra@wdc.com>, Yash Shah <yash.shah@sifive.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Piotr Sroka <piotrs@cadence.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH 2/6] dt-bindings: mmc: cdns: match MPFS MMC/SDHCI controller
Date: Thu, 19 Aug 2021 17:44:32 +0200
Message-Id: <20210819154436.117798-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210819154436.117798-1-krzysztof.kozlowski@canonical.com>
References: <20210819154436.117798-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_084525_447628_D379A0DD 
X-CRM114-Status: GOOD (  11.23  )
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

The Microchip MPFS Icicle Kit uses Cadence SD/SDIO/eMMC Host Controller
without any additional vendor compatible:

  arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dt.yaml: mmc@20008000: compatible:0: 'cdns,sd4hc' is not one of ['socionext,uniphier-sd4hc']
  arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dt.yaml: mmc@20008000: compatible: ['cdns,sd4hc'] is too short

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml b/Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml
index af7442f73881..0489aa92cb54 100644
--- a/Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml
@@ -15,9 +15,11 @@ allOf:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - socionext,uniphier-sd4hc
+    oneOf:
+      - items:
+          - enum:
+              - socionext,uniphier-sd4hc
+          - const: cdns,sd4hc
       - const: cdns,sd4hc
 
   reg:
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
