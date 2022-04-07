Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3ECEC433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Apr 2022 19:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=90rmHjtBVIQk6HjN0u19ZQy6I0c9lF1NH4H/JS0H7rE=; b=jISvJAlyzByfe7
	EDQZHamYp922fhz7aKBuStv5NM2qD7Pfq0Oqbx5U0WpA1r9jAhu2FKQuJU3MjZ1kvdh5g9ipgAF0o
	bqc8r2VJnCNkUNcGAmJ0glFJb6CeDtmY//d1iKCZc2GncHlSjOmjsGGvWRvYYrpnV+hocTCqq1eJR
	S91EjtPj/Eg8YgC5YlUdiy7Bz5Vatzqr1Zi3PRRJFYo4tGtcUuffAAXXw86dizC/5rOBQdtHPl45T
	aHt4wkUPZa1WizCF/PccaZ+GA1Ic96cHov+qswBncmnvrWNmdWlQLH8CQfXZNNcvPJCke32dc1squ
	tdY/45HCo2drNsNWUvfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncXyE-00Dkbf-9d; Thu, 07 Apr 2022 19:39:06 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncXyB-00Dkae-U7
 for linux-riscv@lists.infradead.org; Thu, 07 Apr 2022 19:39:05 +0000
Received: by mail-ej1-x629.google.com with SMTP id l7so7586610ejn.2
 for <linux-riscv@lists.infradead.org>; Thu, 07 Apr 2022 12:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JJSbUDifbnKiCK7OxjEYTIFgKb9+e/PTX5OKVRIiP8Q=;
 b=hd2cjk9p73fGKxH7od8GPCflsA3w0/7xSp6Em8srH/JA7WqbKWz8ozYtWwgffmatqc
 ZjK/TwTCTeRsMZQUD57l64pyQQjAQDmxwfGS/tL9dE+hNgo6GdYQboropLVCAKova7wu
 kHlE9rzK+pCMzVdJ7tbShhVGEF9tU4sJZ4owYDqwsTWLZdJDad5fOBEyNS58zA0ECYGo
 qAvev3LSHwJFlnQ+R8SHN7cJYIkxu+4/cchEG6C8zqrjRFlVnsEeKbe97Opo0ZQ5Udrg
 Paj3abv4rxah4hJKQs+tSxPqxexYFJnPUP87ikqT27udwl+BuHd3BgAqnIaOd3z0SZhw
 MDIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JJSbUDifbnKiCK7OxjEYTIFgKb9+e/PTX5OKVRIiP8Q=;
 b=I9TUuPfYpBCaRY1qMQ9RlD+11t833289QYovexl7peqan7MIFfPlvsnb1w5Q7OUeG0
 GGe/2l01voDNFWBAl8G0A2diVGl5lowREKe2gq0iG/fGTcXserZeAgEk/YXxyYFMmKC/
 FgmrbNq2ycei7ggZxEjwNYyeD5lBqQ77Ge1AV79C/lpeLdUSPwRSBD23Ah5FcXdZ0qyW
 J/+klBRibO2h7ck5YvHOtzvaYov63HaZFwfT5i2D73URqjvFn2why4ZCdnlfe/lSdnO7
 KdbsWDoP8O5vmSR1VSWADYIep4RXVOgpWzzg9Wg7zOej1D4OyjW78OfdhHWPubXSzwHG
 VPVQ==
X-Gm-Message-State: AOAM532hVl1hKpM72m42MmnFFYKfB4GsRcBdrWfn8sOYmSNzRT3MaXul
 f2M26JIjOSAi37jo9evnKJi8Iw==
X-Google-Smtp-Source: ABdhPJwNLPy67bEWqYLzGAxwSpQ8ki3vGFaI7YdSZF0inJLa3UZuK4crjNLHxrGjUrAEcPnCUKDHNw==
X-Received: by 2002:a17:906:c0c8:b0:6d0:562c:2894 with SMTP id
 bn8-20020a170906c0c800b006d0562c2894mr15225490ejb.625.1649360340546; 
 Thu, 07 Apr 2022 12:39:00 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 w14-20020a170906d20e00b006cee22553f7sm7923846ejz.213.2022.04.07.12.38.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 12:39:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [RESEND PATCH] riscv: dts: sifive: fu540-c000: align dma node name
 with dtschema
Date: Thu,  7 Apr 2022 21:38:56 +0200
Message-Id: <20220407193856.18223-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_123904_016154_1ABABE7F 
X-CRM114-Status: UNSURE (   9.75  )
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

From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Fixes dtbs_check warnings like:

  dma@3000000: $nodename:0: 'dma@3000000' does not match '^dma-controller(@.*)?$'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
index aad45d7f498f..5c638fd5b35c 100644
--- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
@@ -167,7 +167,7 @@ uart0: serial@10010000 {
 			clocks = <&prci FU540_PRCI_CLK_TLCLK>;
 			status = "disabled";
 		};
-		dma: dma@3000000 {
+		dma: dma-controller@3000000 {
 			compatible = "sifive,fu540-c000-pdma";
 			reg = <0x0 0x3000000 0x0 0x8000>;
 			interrupt-parent = <&plic0>;
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
