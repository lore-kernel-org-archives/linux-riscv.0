Return-Path: <SRS0=ZJD+=OK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FEE0C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Sep 2021 15:09:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5399D60F9D
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Sep 2021 15:09:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5399D60F9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DGgvcM8fyp9DXn1wFl3iDGYhI0jQ6ZjQCqlj24BCWTU=; b=l6myBUl5DSqFO+
	ijEwwWj29Mwr5jQhOgMVqTVr1POuOsdmQJmTEWSVXxRsCG2xiGn1bHPr9LZnjkp++wrrQYn0RCkOv
	0LKtFKh2cTwPAPXJGPltzPB5MOyOw0oI7HY4S8CaNYpMKsDdb/WdY3uqeDQnVlEmkL6JwZxc823kY
	VcGYZUXczJKpVNLuuZS+3jJg9DPvvi+MvdYkc3zs7iF41cK63IO3vJA1nv7JmWwNgGtxABCHHoXur
	JJa6IExWfQupwSC82xFeAbma8k0OjHtSUaK3iLS7mjqjDbF0ShGNYPJFYliWdjS0MDl8qS7nKoiJX
	+8K5+eSPHwm3HRIQBJzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSKvD-0029V1-FW; Mon, 20 Sep 2021 15:09:31 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSKut-0029OW-49
 for linux-riscv@lists.infradead.org; Mon, 20 Sep 2021 15:09:12 +0000
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C5098402CE
 for <linux-riscv@lists.infradead.org>; Mon, 20 Sep 2021 15:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632150549;
 bh=405kNu3dtB0zJ30yHuYcgVnAp+AYJ1QTK0vyYlLZaqY=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=B860XeaeCJ2mRKiHEU/o8TbGj0puEcPzB6IPDIVcv1aTGM7/YcHe0ua5E3eyT/AMq
 MFQbPPWM9ouxJJd0R1bkvI2oExYJmLiir9VT/EGqsZkJ+C2yXR/ZkUjFshB2xqFKux
 0Hed+HK1QYtY36fqh3OVgyFGJknZfeCzB0A1iCteX54ZZn0FQU1yUHTvdZSZASblFe
 m049y4b87QNSTB3eaFiSF1166bHKUNUmTDp8Sl8E5QEczSq5Po0QAAZ+SDIJix2+GJ
 20Nq8zJ8doCLm8cmCrXK6lp9G03v5DDMjHHknEVgPRJgbXimiDkV6TckBggmuiTTd8
 +h3qfiMNosZ5Q==
Received: by mail-wr1-f72.google.com with SMTP id
 m18-20020adfe952000000b0015b0aa32fd6so6351421wrn.12
 for <linux-riscv@lists.infradead.org>; Mon, 20 Sep 2021 08:09:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=405kNu3dtB0zJ30yHuYcgVnAp+AYJ1QTK0vyYlLZaqY=;
 b=MKWQIuLZw7c2pwi6Or/UgAfC1piXLtqAsySBWaIkHWdA5HwCsFs9+h3tiQ52ExWIFx
 E/y/W3yssv4VqGWBCUpLkNfg2sY0kJ0ZN4SHSc44Z74oB9jZP3URZshrhNGIT5/SQnsL
 eripUnYJKPHoo+TBJuI/rPz5nTnU9QhehrwufJ3Da/fknfCm0qn9tSIAopJyZfvyX9FX
 iGFPPG1XgS/Rz7h4Ydeg/rFi2F7d6JVVdiaBW41KZ6LL9UuTQ+5C38ctOem260Ev+yrC
 25aNLnzRJgGlRpZp33TfrutvfjBqoIaxVMcmcwiFAoZdJO4FcLsLEXuYz6LbQ1QFTLpe
 v18A==
X-Gm-Message-State: AOAM533B78nN8XUKYNYfKURPOKL1AOcnxAJuqDira2oY8PlkYBj0wAPP
 s7KxGYaEIcVrqvehsXSxgeUHGf6m8IjIDK9FHWN71/cm89vyhxyO+LKa1gzMBC+SCas04iCS3X0
 CnCa79zjy8JPWvqhkXmGZBzfmN9RLGki6aSHVl5edx/6N7Q==
X-Received: by 2002:a5d:470b:: with SMTP id y11mr29637064wrq.213.1632150549273; 
 Mon, 20 Sep 2021 08:09:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxaf7A+XQqcH4LxJ/S2BYB7M3Xi66LL55Zn0Sh/VmFgsRmUSD1/dSX6l4Dsp8K0+aE14mlaWA==
X-Received: by 2002:a5d:470b:: with SMTP id y11mr29637030wrq.213.1632150549106; 
 Mon, 20 Sep 2021 08:09:09 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net.
 [84.20.244.219])
 by smtp.gmail.com with ESMTPSA id i2sm15803136wrq.78.2021.09.20.08.09.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 08:09:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Piotr Sroka <piotrs@cadence.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v3 2/6] riscv: dts: microchip: drop duplicated nodes
Date: Mon, 20 Sep 2021 17:08:03 +0200
Message-Id: <20210920150807.164673-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210920150807.164673-1-krzysztof.kozlowski@canonical.com>
References: <20210920150807.164673-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_080911_339966_5B48D5C1 
X-CRM114-Status: GOOD (  10.88  )
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

The DTSI file defines soc node and address/size cells, so there is no
point in duplicating it in DTS file.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
index b254c60589a1..3b04ef17e8da 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
@@ -9,8 +9,6 @@
 #define RTCCLK_FREQ		1000000
 
 / {
-	#address-cells = <2>;
-	#size-cells = <2>;
 	model = "Microchip PolarFire-SoC Icicle Kit";
 	compatible = "microchip,mpfs-icicle-kit";
 
@@ -35,9 +33,6 @@ memory@80000000 {
 		reg = <0x0 0x80000000 0x0 0x40000000>;
 		clocks = <&clkcfg 26>;
 	};
-
-	soc {
-	};
 };
 
 &serial0 {
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
