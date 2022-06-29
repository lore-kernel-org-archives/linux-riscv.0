Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8CF3C43334
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jun 2022 18:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=udYjNjeSGhW4MfpL+1gymPjb+0mvNM02e4a00fLZJZY=; b=e14S7GkcKSF4N6
	IiBW3jo5bioeKu9d6FAZqcKH3rDX/FhpEfJoUhiZcVea8JKHC9YrplV04ewdP2kKfGNrG0qTL7L17
	t2B1DcJ2OXzy85CGHmEmCkls8Qb93GlVi3pITr56ySKhd7Dd1aPSqF2Z+F+JaV/l3/mQ2KYKgK9e9
	dJ1YY6bR6C73du1Dvp8N+VtSMVPLVsKYFPSrxdHMdu+U0xBrPgSaf6cY1R3QLwhsFGsQ+nWswH2XF
	E/R9SbtkLI7ULXHnkZRAeHrUw9ZNkg5lADf/o4hyIe86skRUSjWNfGYgRH3k4YAKBUo47AZa2awHA
	TRVm/HNTtvjF+c4vRJZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6ch9-00Db2z-Pd; Wed, 29 Jun 2022 18:45:47 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6cgI-00DaJt-AM
	for linux-riscv@lists.infradead.org; Wed, 29 Jun 2022 18:44:56 +0000
Received: by mail-wm1-x32c.google.com with SMTP id g39-20020a05600c4ca700b003a03ac7d540so170141wmp.3
        for <linux-riscv@lists.infradead.org>; Wed, 29 Jun 2022 11:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1RrlYN7xRo44UoZQ9vXu2CHD6ouZYfkPgpPQl3XW2/Q=;
        b=UAll3MyHfXcJWjHvJItFiKt+q0UDpdoZitVUmDKi17Z3tEqFaYeAa5I62dF9Ntp9ll
         izJeCsDmziR+qqGG6d1KJvui6VvkxYr1DY3A0DkU5WcyCeCJ4cFVVbKi7eEA/X3QMXIB
         UVs2gxxjHW0kQZtZLt5O6Wii36mOWwxTj9V35BJEEDO+hl7N3eUDwy36Of2SyBsE6UIj
         H6j75OklTOzvxdWOtJNtMBOCzCMI2H5xrFLsH2RNlvYtcVfpNE2mYlA6uIbBS1CmLl2f
         vmt9cLRnDkXhmABiQE/7jTone6UNsxp186B1ayF3xci6EtiTdGhbee1QsMAcImYigN9g
         Ti+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1RrlYN7xRo44UoZQ9vXu2CHD6ouZYfkPgpPQl3XW2/Q=;
        b=ecRQgfH+knmjo7uIvDIDAJztg7UsPtfc3gQ8qh2uKLXNIA4QdAYLkLQ4QCBw86jz83
         gkh9b+Lpq6LduqUU6ehuvuUcQ0X2r/Nyk5O1nIBthPr+DwDPjliQeASPRRYgjktm9HHp
         C2umBQsTaIZwthvJNMPb+YzPeDgY9Aob287hHoO/jeAPbozMF1JPOBzir0SSmZQ8KYO6
         oVHW2PPKtRlGIeVIMAcCjlPwNheDH4NY0E1C34HhcTdQiMDPeLnilft/ZJpJovcSPolg
         MSxWa9knnOLtMfLUtHV1QdIZCQREeG+iVRFvA2dMxurNCP2bgbDFj0Wsy3IDuYBzC2z0
         WVag==
X-Gm-Message-State: AJIora+9YQ4uF7aHf2HS648/A8Nl+wX3J3r6qCczokhyPYb4tOiGeLa5
	VzNi/59Ev+ups4cMbY7SYclUiw==
X-Google-Smtp-Source: AGRyM1siRoebXeOTAi1aRlb3B7Y2ytiMC6ZasSqJOtJlLU+5gBlJlHVkI1lfg9OpYTZWjusZH35PlA==
X-Received: by 2002:a05:600c:19c8:b0:3a1:7399:861d with SMTP id u8-20020a05600c19c800b003a17399861dmr3088575wmq.170.1656528292500;
        Wed, 29 Jun 2022 11:44:52 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id u23-20020a7bcb17000000b0039aef592ca0sm3834371wmj.35.2022.06.29.11.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 11:44:52 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Niklas Cassel <niklas.cassel@wdc.com>,
	Dillon Min <dillon.minfei@gmail.com>,
	Jose Abreu <joabreu@synopsys.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-spi@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 10/15] riscv: dts: canaan: fix kd233 display spi frequency
Date: Wed, 29 Jun 2022 19:43:39 +0100
Message-Id: <20220629184343.3438856-11-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629184343.3438856-1-mail@conchuod.ie>
References: <20220629184343.3438856-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_114454_475008_7546CD5D 
X-CRM114-Status: GOOD (  13.39  )
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

The binding for the ili9341 specifies a const spi-max-frequency of 10
MHz but the kd233 devicetree entry has it listed at 15 Mhz.
Align the devicetree with the value in the binding.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/canaan/canaan_kd233.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/canaan/canaan_kd233.dts b/arch/riscv/boot/dts/canaan/canaan_kd233.dts
index 40992d495aa8..4a540158f287 100644
--- a/arch/riscv/boot/dts/canaan/canaan_kd233.dts
+++ b/arch/riscv/boot/dts/canaan/canaan_kd233.dts
@@ -130,7 +130,7 @@ panel@0 {
 		compatible = "ilitek,ili9341";
 		reg = <0>;
 		dc-gpios = <&gpio0 21 GPIO_ACTIVE_HIGH>;
-		spi-max-frequency = <15000000>;
+		spi-max-frequency = <10000000>;
 		status = "disabled";
 	};
 };
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
