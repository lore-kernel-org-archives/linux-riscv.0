Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB16C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Jun 2022 12:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=udYjNjeSGhW4MfpL+1gymPjb+0mvNM02e4a00fLZJZY=; b=uJrjyjiVkc6nQ+
	oc/wsb/qr4qkTaCyqSKc9S7qnyaZ7n2iOt+T1FrjHHCmp7ToBktSQ90f9VFlx504rTVNrdwy+G2WH
	PeW+7pE5BNko7GFwkxD2Rs6cr1uEf5zz6Q0BJ6vdbLVg458nfcC2NxLEpwe79tbKXbp7W+9hExa5D
	TMF7sulCNsIPQNv3WlRhYL8V5q4lfoa+TH7UZZBQkCbLXQPNw5ho0MqPOWGulzro9mwhoMftJ9vsg
	t3zSCttHI8VXWQqqsVt8CqpnEB5q2gCCkF+7G2vtpQhA03Q3SgFuDl4dQp8vPU1D77UQaZwChwYLE
	SQrJkfLrgDMfhxNgmGhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2Xcz-00BHxQ-79; Sat, 18 Jun 2022 12:32:37 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2Xch-00BHXl-Vl
	for linux-riscv@lists.infradead.org; Sat, 18 Jun 2022 12:32:21 +0000
Received: by mail-wr1-x432.google.com with SMTP id w17so8782573wrg.7
        for <linux-riscv@lists.infradead.org>; Sat, 18 Jun 2022 05:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1RrlYN7xRo44UoZQ9vXu2CHD6ouZYfkPgpPQl3XW2/Q=;
        b=BPAP4EOMpcTLtigvaPPAmrkhyUhM2es3mn99xXabOD36beL2UV5x4oZfV2njhaHRDu
         6CJGk2QVhn6oPqlOR2djhrL2247MI0pKKag+FDbmQ4H1hZD3+mmDz6hqN32wihfedwv8
         0JY3Dc3Cdrb0deOAs1Y2GOWa/xJwK81U2UBuCQMBHxKmg45ip5zSneSbL7BpIz3+F9U/
         HD9dL2+AWfZ418nW0lUl3ciiJOF84+lcioBfjjBShBTDpTsuwqj7tIBkBiNbmNeX1w9i
         bBklT1NVM2cTV5b3a0VEOCSBXAlFbb9ESoUAC/KWlmIDjjTCsZX275Q9n2aNWJYhq+7O
         e64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1RrlYN7xRo44UoZQ9vXu2CHD6ouZYfkPgpPQl3XW2/Q=;
        b=VYsFsDnCFVIfIl/AO3yOfNU2yzuq3fE1r7IHKlJBzkISaB7RX5NIzAxMjDBPHCee2m
         BZcy0AOz9/XH09JpsyjzL9iAKiNvlbVgAuQklb1fOVm37rCBRhadsI3EzjBqR11RTQPV
         Nn07FsUxPTpKVNO5gu3ka/pIp8kUGEyY5wUUKx8xRoPKP89wb1hq/SJQxBCj3jXpzA7F
         EghD8+Rjq+5v4hYrffdC5Tv+lSiOs9uIBE95ueO9nRuo/GCc5NEpBwCD7i0hAA5SToEs
         UdE+YPOD4oW/64akzSWATpQZWNb629cPmgdgBMo1eAehC0xumNFpLHapCtWgfYeinaNz
         Um8g==
X-Gm-Message-State: AJIora/+NWYe5ewGpPtNsy5eCBV/jKB8XZ7DXFUNSTqD+XpjemTljsYH
	eq0CXQYfJBBhYmYnxCd1CpG+RA==
X-Google-Smtp-Source: AGRyM1uZgNeRAWVSfV/hT8p8ffzeOsYwkUHkdfjgJGx3PbBuSC2KESMglEYy9aDYjH9MqXxklw0uUQ==
X-Received: by 2002:a05:6000:695:b0:21a:3a1a:7b60 with SMTP id bo21-20020a056000069500b0021a3a1a7b60mr10579808wrb.441.1655555539583;
        Sat, 18 Jun 2022 05:32:19 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id az10-20020adfe18a000000b00210396b2eaesm9292305wrb.45.2022.06.18.05.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jun 2022 05:32:18 -0700 (PDT)
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
	Heng Sia <jee.heng.sia@intel.com>,
	Jose Abreu <joabreu@synopsys.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-spi@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 11/14] riscv: dts: canaan: fix kd233 display spi frequency
Date: Sat, 18 Jun 2022 13:30:33 +0100
Message-Id: <20220618123035.563070-12-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220618123035.563070-1-mail@conchuod.ie>
References: <20220618123035.563070-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220618_053220_043718_DA4A6798 
X-CRM114-Status: GOOD (  12.82  )
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
