Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51401C43334
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Jun 2022 13:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C4VXyKOS6C2fc1G0HuBLaJHJHruqEE06HxbeD90UZ/M=; b=zba26oqGZEegiA
	CmryMBQ/qeTntS35TL1Gm72diO73+uBjw/YYTOq4r9xuwmEpBXGSsbMjxLpwbsLEvfMKkaqKj2exz
	qsN8/7Te+XKFYG68mE6Y7hi95GWnaiuBzhVVhy1A0X7AVYr2+2lUYnmrLjGFQA7PFuOBSPj4uddh5
	jDA4D4hDACNBcTgoe2DQY9zo/3fuw58CeDsD/zPo778Z6RLDIVJUTKISiBgKcTQJnIOObfmVKn4ev
	6UYFiRcJCwlDAN1FhVk1Mxlq9qWeGW+L4j9FzbL0uT20VAKImKjznwyEGGZBluY2Pde1nvgLId5/O
	R5FhC2ft/UPSgS1Kz9Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxqNn-00EYQx-O7; Sun, 05 Jun 2022 13:33:31 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxqNg-00EYKh-Nx
	for linux-riscv@lists.infradead.org; Sun, 05 Jun 2022 13:33:26 +0000
Received: by mail-wr1-x42e.google.com with SMTP id m26so4956446wrb.4
        for <linux-riscv@lists.infradead.org>; Sun, 05 Jun 2022 06:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qvovknsG3pTwsXPXVn/vDXoAWBD8w8aZsXWfzyMtSBs=;
        b=NETA3GgPfVm66DpPaF2S0nTHcRlk3BDIbRN52sR4sT6nmMn3x8IhGjo7skosK2o2Rw
         0yYBfruS2m6oFrSu91XMhZEWRJlnF+hKkihrEeIyIS+lSymdFYTDyeQX3c9lecWfIfx+
         UCkpuQHSKoYkbEXyjYI/3ZF9VjqP0oNBRgQXs3NoqsN7tLB8hVnqXjoP6A1y9QxPlOsw
         ufvA269uijRyeoA2gNbGtQVH+/gYVCrqWuQfZ+CLHOrycRMDP2LwV6HsVu2GZTfUyyH7
         2SvjMSpxa8kKULKjRuh09rMb9w/KMnSRMKihpk0bT6XI7vcMmtgf9agmS8Cx9CnLpEUh
         gU1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qvovknsG3pTwsXPXVn/vDXoAWBD8w8aZsXWfzyMtSBs=;
        b=Qmcf26l8Nhzt7YY5dHvghu35C2Khcnpm0sl4mPK4fqInaC5uRRze8jZ/2kmRVh9x8d
         ZBDGFUR6RpqNBUGJguqdKFTM56PBVuAhtEuGnbQOmlKgqE1vM3dfNT5G86JuPpq1Eejo
         fuTN0HE79RYhEkufMw3w3klYsxHmtmNLVyBo5dmj+trJ9/tOkSCRDWc2aqGT+8q6tk8+
         qFCMZVdAf5ZQR4Hi4/iLdXruNVmEdWrHv/4nJ0I4U33ezYMGiq+yrJZD2JktYsIkQsQO
         QVkYmSgX3Tky6vPwH+eIobVLLX3S/5XTlmWqXOflVEVnByeiTxXon3ni9VsYSUxOzPCB
         33ow==
X-Gm-Message-State: AOAM530wsZxee6MZeWJ1Mv97X7eGw9b6IqiRVsCj+Qolzs+6IJpWRlN2
	KtO4I1frWhYRFg79y71wazojcQ==
X-Google-Smtp-Source: ABdhPJyYqVnx0lY8GU7GcUNjnB/0IheYVlGhFGrMvBppFTA/r5QA2twLfKyEZ/k7oTzicp7A7Zjlkw==
X-Received: by 2002:a05:6000:168b:b0:20f:d4bd:cbc3 with SMTP id y11-20020a056000168b00b0020fd4bdcbc3mr17543214wrd.580.1654436003025;
        Sun, 05 Jun 2022 06:33:23 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id n187-20020a1c27c4000000b0039c151298b7sm18217076wmn.10.2022.06.05.06.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 06:33:22 -0700 (PDT)
From: mail@conchuod.ie
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
	Atul Khare <atulkhare@rivosinc.com>
Subject: [PATCH v1 6/6] riscv: dts: sifive: "fix" pmic watchdog node name
Date: Sun,  5 Jun 2022 14:33:01 +0100
Message-Id: <20220605133300.376161-7-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220605133300.376161-1-mail@conchuod.ie>
References: <20220605133300.376161-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220605_063324_798345_29643CCF 
X-CRM114-Status: GOOD (  10.96  )
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
