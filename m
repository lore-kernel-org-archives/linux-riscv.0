Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB8DC433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jul 2022 21:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bEb7nzkE5498bmdUZ5yb37p3Ukd4+KmVaBV87kkSAPw=; b=cY4Q+T4RCHvam/
	vQ5xHlK+Bc9vEpsPVGfNE2Cl97Q6DWpoCW38b3EYIeLvl4cBzXEFb/cqka2DpYYSkYjCMq8DDhLx+
	Q2U/67pbiqHr0SmE5tA/I7fHi0wrYoU+3SZHwLsKmYlm+2XABHYhwphqXK4UbPJ8i5QFb7JBwj/cX
	9tKo7l1bwHmL/mptkGDBFLX1GPzReGTfmG80Veog1f8xCSyrCJoM8GQ8U7P1tykuvhdUhq/aP1XGa
	of8tNjjb7q7N9AYJj/Juc/zGFHeRfnjLH1RwxVbsAK6gTdx9dcSDnhuyWA6F5L7w2uJZwHJJT09Iu
	F9TVBbak/m7I2AUPEKGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8qTP-0030gc-B3; Tue, 05 Jul 2022 21:52:47 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8qTD-0030P6-Fh
	for linux-riscv@lists.infradead.org; Tue, 05 Jul 2022 21:52:36 +0000
Received: by mail-wr1-x42e.google.com with SMTP id v14so19386197wra.5
        for <linux-riscv@lists.infradead.org>; Tue, 05 Jul 2022 14:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=16q/8fFGCPAcRAarL+3aLoNygoSrExqmYVpC1bRjl2o=;
        b=YYFaUee7gy1W5prTWT0BCaYi4Agi4K/fZPz3HzSu/Bx3zMLRlN6iPr3QbkHb8nmHa1
         OB4MbShSJ6pV3jSxnG3fgJKUgLhGQ98A6yUS6Hr1g5f9oo/CqzYerhyHeDMtY/8/V6h2
         SNh8FrwHsBKxWQIetyAjLLN19P4VrMSyseVBVDmhxS7g75q2gULyOALP1sxruDhkHN2N
         35BCcbcEZn0ZTeLrU+J2Zfur2nhAuZcdZvyFXbL1ZSzObDc51rZ3/tBedaYwAr+Csgr2
         2BkluY0+l9Tx3ndW35NGgpStoxtOrR+02ao1YhadHBLpWQbGp6cMjwnv6DxdGW1rVIR0
         V4Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=16q/8fFGCPAcRAarL+3aLoNygoSrExqmYVpC1bRjl2o=;
        b=QKuBpYyeO+2wJ1rTUtkVwxd9gRv1ob40dPNdk05jHyfBLV8kFLCmLz5/ut5DsXN4z/
         mFe1LVKnWarOr3bk809+6ht+3SQaKlgVA9gYFIOTzFyAvqGuH8kW5rx6zi6S311uPt1W
         I119Z2ncEWAgnEYGOenbTqp+9izS2jW7SD8l9isaNMPpPRWpY2b88Nij9JDDg/LBWRiV
         CIi+ALOzKJ0fRF6RpXk5jtnXFV6su2meNNyFD5csrgW0mvVrVUjVmZZ/1GD8hvVlCv3j
         g9B3XVv9cqLn0aOW7wxE74wONMhPjSQ921E8lHALgfnk8VYloPZyfKkiPVQXoBEez6V4
         SCzw==
X-Gm-Message-State: AJIora9WkICYK5XGDVV4x+Y2C6aS8h8qIT2CwhhhojjFSdE+mokJpFg8
	nuFrJA86mx4tqK5/jA62rP2vQQ==
X-Google-Smtp-Source: AGRyM1t6QNd/sm2WCxNG6Wr6I2YHwVTbjh9TXka92SSnVrAIhc+jsCS3/FhjvWlhLqMVSAqFGD6QKg==
X-Received: by 2002:a05:6000:381:b0:21b:9a20:6543 with SMTP id u1-20020a056000038100b0021b9a206543mr32493151wrf.127.1657057955085;
        Tue, 05 Jul 2022 14:52:35 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id g34-20020a05600c4ca200b0039c7dbafa7asm18353920wmp.19.2022.07.05.14.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 14:52:34 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Niklas Cassel <niklas.cassel@wdc.com>,
	Dillon Min <dillon.minfei@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v5 08/13] riscv: dts: canaan: fix kd233 display spi frequency
Date: Tue,  5 Jul 2022 22:52:09 +0100
Message-Id: <20220705215213.1802496-9-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220705215213.1802496-1-mail@conchuod.ie>
References: <20220705215213.1802496-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_145235_555685_EB690203 
X-CRM114-Status: GOOD (  11.92  )
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
2.37.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
