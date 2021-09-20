Return-Path: <SRS0=ZJD+=OK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEF4EC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Sep 2021 13:26:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD93360F23
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Sep 2021 13:26:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AD93360F23
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m0X9cAXoPEMFAYTlnwe7edRSt2gJ5jSIW4YV+C1Nyfc=; b=ZA+sRJB099NKko
	mjlzEze4fbn8FK80t+OWwlBGHK1HuFGO4LgsABXIWUJyGORAkRqpipwJkuG34leT5qebupyHqlhwS
	kkP0+0dHBT/Ed0QCmxnSFqWw3AUFQ6OM2rPf0iveppa8kAp5xVfZ/YPvnpTiBmoQW22kGhG2yjXeL
	SFv/xnIfrDvrxS7U9wpCQAjauG+6+le6fjpLQXqbioHpApW1FgleHwn5zr4DSm8W+oeuJxVquWL7p
	utjF5UckAysvg/JaASCbzXqsxuYmX8aS9/NUzt5xsiCqHdC6+wcGiTWVa4vNLyMDD7bHFMwnkXMOu
	0AIlWHuJoIZtkQ+6LAKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSJJA-001lVp-Oo; Mon, 20 Sep 2021 13:26:08 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSJJ6-001lUx-1V
 for linux-riscv@lists.infradead.org; Mon, 20 Sep 2021 13:26:07 +0000
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B08D63F4B9
 for <linux-riscv@lists.infradead.org>; Mon, 20 Sep 2021 13:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632144362;
 bh=vJToJAd3e7XitzB+9QvxgrvOdQZu/cSSC1UlIYS41NQ=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=UG4VMLXiQwYBokcSCxAmyIBJgEdC2bsVwIIsX5qzfg22GLR8K5kxjtyrre8wmpqgc
 1L8v4/1126STgfVd4Ehqg2yp8HaPE2p9RbTUVYVqQS6nssCBAASpl2wlLikXfJmFoV
 MUhGRuxUO2XYH/Z8sgHM/pZApd6OlnyTAoik5Yz/lLosp8TDp+xVHFxeO4eCbDMlkf
 6SRmn1ODduxN0mtDwp6k4z/3JpUodDjxCW5I+v14Tz7tTZrB682FOwbwgxxNgbgOgo
 oLK/deo5iL/dNVid86ahz1QPOAvj3Xau/c+jF4pAuxfrgJ7oMYheru00elFTIkxVDJ
 TNj7Smbu7c/DA==
Received: by mail-wr1-f69.google.com with SMTP id
 x7-20020a5d6507000000b0015dada209b1so6051961wru.15
 for <linux-riscv@lists.infradead.org>; Mon, 20 Sep 2021 06:26:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vJToJAd3e7XitzB+9QvxgrvOdQZu/cSSC1UlIYS41NQ=;
 b=k+yafRbxaM0vaZOT0xJ3P73AS8m9HLNKIKxGbQRWXHtlBrm2w997Pkkf+X66Ba3tLM
 ONjHidw+DOBhNbaYUvbrBIi13jlKDg6G7UBtbJWfGPi5pUXltpniHnvgkX9B+L8CrJ7q
 yGy1FAhBvb06hRNgSF/yiNlhctsiRY/i4wMWQ7BfbgAqvIBR+MU8/73mfS4oK3ID3XUn
 0rlbF9X4GMAgrcdPgpG1YbNkm21GQ9UIRxJ09KeyvAV1lVNVRlgcttIuHwNBp9ZYGQLW
 hv+gKcbKANYOaPmMRLQ+XDFr00WuAa+dSOymh5cghDEt+AYFzSg2DWeJ9A+n1xqxtqxr
 n1wA==
X-Gm-Message-State: AOAM531wUMpM5ym+7PkCbmfxzBQ/ivhqvzbc3maiVcltf7TKn+F5QuvW
 XA5AsSPg8jqHM52b6au2Fv3u1+1lrT52N2NSKwomvicT5cmjRlY/Ylhd+7wnNA1igyfdisyf2Xc
 1tWKm4NeSMePSr+9mmCFOtddxja1WN6ZZxBfe95ZZVbqTXg==
X-Received: by 2002:a05:6000:1287:: with SMTP id
 f7mr29033670wrx.221.1632144362274; 
 Mon, 20 Sep 2021 06:26:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymf7l0CKsN1xSthBcoxGq3X4DmkxIw9o+QPMTz1O6EvUcCymMCo5tuwGlI5/sIFl5hOJNaIQ==
X-Received: by 2002:a05:6000:1287:: with SMTP id
 f7mr29033647wrx.221.1632144362053; 
 Mon, 20 Sep 2021 06:26:02 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net.
 [84.20.244.219])
 by smtp.gmail.com with ESMTPSA id y9sm23062787wmj.36.2021.09.20.06.26.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 06:26:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] dt-bindings: riscv: correct e51 and u54-mc CPU bindings
Date: Mon, 20 Sep 2021 15:25:59 +0200
Message-Id: <20210920132559.151678-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_062604_334974_4014F347 
X-CRM114-Status: GOOD (  12.15  )
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

All existing boards with sifive,e51 and sifive,u54-mc use it on top of
sifive,rocket0 compatible:

  arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dt.yaml: cpu@0: compatible: 'oneOf' conditional failed, one must be fixed:
    ['sifive,e51', 'sifive,rocket0', 'riscv'] is too long
    Additional items are not allowed ('riscv' was unexpected)
    Additional items are not allowed ('sifive,rocket0', 'riscv' were unexpected)
    'riscv' was expected

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

---

Hi Rob,

You previously acked this patch but I think it will be easier if you
take it directly.

Best regards,
Krzysztof
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index e534f6a7cfa1..aa5fb64d57eb 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -31,9 +31,7 @@ properties:
               - sifive,bullet0
               - sifive,e5
               - sifive,e7
-              - sifive,e51
               - sifive,e71
-              - sifive,u54-mc
               - sifive,u74-mc
               - sifive,u54
               - sifive,u74
@@ -41,6 +39,12 @@ properties:
               - sifive,u7
               - canaan,k210
           - const: riscv
+      - items:
+          - enum:
+              - sifive,e51
+              - sifive,u54-mc
+          - const: sifive,rocket0
+          - const: riscv
       - const: riscv    # Simulator only
     description:
       Identifies that the hart uses the RISC-V instruction set
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
