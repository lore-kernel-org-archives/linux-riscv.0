Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7989FC43334
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jun 2022 15:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VJ/mB1InioPGumS0Ycmv1XKjxuR3pnxGhBedv4xUVa8=; b=fo6RtHSz1CkEHx
	zMne1kX4aZZgPSG7Zb3YgscMzsu4ZP2vBg9s3SLA+RXTWlik3lgrjJXpZSmRQLSNetoeke2tXyGST
	ZrdHq/68ZFdtNFiM2T7mNUHgBds8fJ4KH+1QccHOZGAFf9Vvvb/GfOg/x9UVCLyCsT0qyGdZ7/ccD
	+GDvHj2Y8N647NotRX62Q4n7e9F/dElQMxmKbrmyAOHto9XqPJfy9ilu9oPxWnXJF4TFdXTK95ier
	IcFOooVP8+Cwe/+OG5GIzRhVUfj1PBMEbAIs5qs6SoexfnxHakwBWKPeL7r7Fdo7OToJYZl9xCXbg
	qomeRWYSqCow9GaJ1Njg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyEg6-001p81-WE; Mon, 06 Jun 2022 15:30:03 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyEcU-001nER-Ig
	for linux-riscv@lists.infradead.org; Mon, 06 Jun 2022 15:26:21 +0000
Received: by mail-wr1-x434.google.com with SMTP id p10so20326401wrg.12
        for <linux-riscv@lists.infradead.org>; Mon, 06 Jun 2022 08:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gKndGtfRMJoB9VZHAXJ3155b6Ocgr/Z/0m5W/nSp3fk=;
        b=aJEoKakPceXnbp1/ZlShcjfkeytqJDUAJr7R96RlUzYUysC5vsKDlaQOFn4CuEJOqt
         6lhIxLXlNtmdxeKHk4mesWxv20OXnO5LbD8vF2oZLoegnB2ohozQL4HS3QodkbprZN68
         eZcOZoVKCoZSg2pDCktQ/G5fQsz3dGyKfF1I4rfJgO3VIn0v3Koz48s/4rtU2+lGkcU0
         WMCWFmkoNYTPPCClc4bd6usX25oVt+CHu+IA7WfdTxpBR3jb8GhFQ9pkmZFKu133Y/Oc
         CCPs1nMC/CN2VyBK7h9NZBeAIn3I9T082Zz3ShRxaViE3KN9EEM053orGKLOrGpV8TXL
         DWeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gKndGtfRMJoB9VZHAXJ3155b6Ocgr/Z/0m5W/nSp3fk=;
        b=hAA6GE63k4WLHe/WuwHZdS/4HSqE/M+4RPhlQx58E27p22/2enIyVBxi9+DANgqjg7
         VJIpWQf6fgTGpVcLy1GZdC+/0Ekioy1UpGIr6iFuY2q1/G0HNWsmNcuPRill8AbOnhQn
         JrU++mBS9L4MZ3Zx8XSiGTXV6lGXFWYLZcBCsI0KDKEV9eesfFPmF//LcubBQX4UpXFy
         UIkxDTzM1ggR8/5j94OH2mi/udm1on+dVZEJm069yQvXScMET9jWMSPJeNl/s5RfkYXQ
         J1Hs0v3S61joS/TsHPur7k6ow8oQ5IfZMoTMc2HhNAnV7WypIFD7+mPhXzdwUEHYlzeh
         vNpQ==
X-Gm-Message-State: AOAM533FoZ1aTNo54v08FAp4iRnmpBbRxY3/2/dAycksa3kNvwE/yImS
	7XeUDyZ8h21V1PPtArbaF93D/w==
X-Google-Smtp-Source: ABdhPJxv5R9KdhXC8FcRfcFRcCDgFBV2z1vjprwaGxWfFLbq88Rm1mz3L9kBxgErlQ4yXKLde/16gA==
X-Received: by 2002:a5d:5142:0:b0:212:af29:530 with SMTP id u2-20020a5d5142000000b00212af290530mr22119805wrt.444.1654529174889;
        Mon, 06 Jun 2022 08:26:14 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id h1-20020adffd41000000b002103aebe8absm15623944wrs.93.2022.06.06.08.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 08:26:14 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Support Opensource <support.opensource@diasemi.com>,
	Lee Jones <lee.jones@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Steve Twiss <stwiss.opensource@diasemi.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Atul Khare <atulkhare@rivosinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 4/4] riscv: dts: sifive: "fix" pmic watchdog node name
Date: Mon,  6 Jun 2022 16:25:58 +0100
Message-Id: <20220606152557.438771-5-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220606152557.438771-1-mail@conchuod.ie>
References: <20220606152557.438771-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_082618_666655_CCF37B52 
X-CRM114-Status: GOOD (  11.16  )
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

After converting the pmic watchdog binding to yaml, dtbs_check complains
that the node name doesn't match the binding. "Fix" it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
index c4ed9efdff03..1f386b07a832 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
@@ -90,7 +90,7 @@ rtc {
 			compatible = "dlg,da9063-rtc";
 		};
 
-		wdt {
+		watchdog {
 			compatible = "dlg,da9063-watchdog";
 		};
 
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
