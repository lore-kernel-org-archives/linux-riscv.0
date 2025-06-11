Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E725FC61CE7
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 06:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LZQsdBKmO1zRG0RfkiYmxFBCYkNEpE97JvWRUj9OnQI=; b=T1nMP9if8H6vDb
	3vPcQdRdNCwi4JPMwWz5bhrWuWwHLAY2K9Jy9tIO/6DltDbn4PYh5KjsC6sS/4ff0CTYKGBn3IQZN
	gFPJR8s94Up/iGZ4YDRKlu9nGlIg2ZIHj6rnVjukq7bUNMRxWSgT6t9rIzV3Xo2AbPsEjPFoD3lS2
	KlL9JDnGXlY8XzaXksQAakFuM+I0to6jKaq3M+oayBXyyrBbENEKGCj35QXESjK5pI6keWSSnAFzz
	z7mq0zpJTSN2bXtA1bHRXL1YzmJM/MN7Um4TxEkc8pLZnPh8Cxy2TQ4DKeiVDzH6HzjZycC+rWMQc
	aEfdpz/1gJhjM/xJTVEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEj2-00000008wM1-2WHY;
	Wed, 11 Jun 2025 06:14:16 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEj0-00000008wKB-2ulI
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 06:14:15 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3a524caf77eso25173f8f.3
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 23:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749622453; x=1750227253; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cSwZ1HkGC0NCuxdiJr7YusfytJ75yXllA65meVJdMKM=;
        b=uJd/ghS+nfeMZqs6A3bogZiFPQ40+2BJB8XO0sDAkjam7tltLO+5pDMMI2BBOH7Ncx
         DVhxgDQ3CVfB3ITv5XcR5bbXbUhG9+V7McFOQXKVReOXfJQ0n6qLHX4+UuA80DQl6iV2
         dTNIRV5jVs4NGkxaBO0wH7JAkdfXNfxWlw5//zpd+w9q2XW6aCOBDZ2yTqx81aPUUfuv
         NcKEvPNXBo3dwuLdsc9aRP+tj0++R8J5Uy3kP/yZUltt5hb1KIFoWznx32SHDaNWmyNv
         CFHHEhWCW+6XDyNZXAUBmetbp4VST7Uo7ZKAkVxbg+ZZgiMZHTeVRp2vqevfgu3PYdUw
         nkgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622453; x=1750227253;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cSwZ1HkGC0NCuxdiJr7YusfytJ75yXllA65meVJdMKM=;
        b=bTwPR+u7pRWkcHU+YVuh54jXHrAuv9nnWUKLEDF0v9ZDORoIUYiFUKGcRuTGCtb3aX
         R/H0iJpdpfZyVPnsgOIRv9SHCDtSCKsLgGVL6kjpvS7EQIe4tAlIVl8u39mfR2AAU91h
         3ZHHbDaqS6zwFIRa1LUL42owDrp/k9ko/7PZ6eT30IXtwdM/D/kXvvdbFp8c+GwQhsyx
         eGaV+oMmUDXg8BvmIDNMOoAUi8IOvgPurcHc/oDdWb4+41D6GX1NLj3kjza8vse1IMv7
         bXWwNjfeIhzQIhyWRgpW4bIjK8oDTiCQlfhKl8wkSYt/2o+4ox35Ir2GNVxC+5AyN1am
         IEgg==
X-Forwarded-Encrypted: i=1; AJvYcCUZDtTGYKvKokqoiNfvvUPscpGo0nCQ7hkvv/E1FH2wRCY9TI8X8UXDEQz5CPXgoG0aCD3TeZw0KpRVsw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzIEJ8ptCiVrB1KRiVm0/WfqfX7C4sYl0tujnOoESrpDVf5dHkt
	tJP8v/FOO3iZ5c2X7iNVP9KTw8Wfvg0Qv7fH+eiN8Z4Vf6w/Qtrf3Wh6Ge4f4gSwPYQ=
X-Gm-Gg: ASbGncuBjXfxUQTyeIu/57cb6m2FTChiteA8AfPq2R1PWuzz40SGyLFKrlwvaBHZnbR
	rEe1Tz8tCrRaAHYh131MlYzFD0r/NzYuum6tzJGO76IWsAD7P/E4AmG2iCIigD2NnarAGb2pomQ
	C8BtD2hG64J389V7HQ1MJ0Zg5OcnBPFGeqOt0basXhyzDRLq5l2HyuuDMd8ZLzpXNZMxY1TVFiB
	Ap+3ytD1jmecXzeAgKppxJIzzCY6lYa6UgWbgjW3TsiF/tVHeaycgB2UqJxvf7Zu+424vJ4Z3DJ
	5zNCaoe6X+TwCD66iCCieYuFbdXDdDXOLy/Avc84j5eOkLLLIhYmjIRX3gGMGlEHWdC5ogJuN7H
	Qvljwf52sFARIFUpY0g==
X-Google-Smtp-Source: AGHT+IExi18Qcb4RFgAfHXzCB8Qf4+Yd31Q1eTA2g/Az2TI0+71W9MDaYsWsvrxBOzhlE7bYKU2y7Q==
X-Received: by 2002:a05:6000:2288:b0:3a4:dc42:a09e with SMTP id ffacd0b85a97d-3a5586c5d22mr478235f8f.5.1749622453083;
        Tue, 10 Jun 2025 23:14:13 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm14142791f8f.74.2025.06.10.23.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:14:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 11 Jun 2025 08:13:33 +0200
Subject: [PATCH v2 01/17] pinctrl: starfive: Allow compile testing on other
 platforms
MIME-Version: 1.0
Message-Id: <20250611-pinctrl-const-desc-v2-1-b11c1d650384@linaro.org>
References: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
In-Reply-To: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Jesper Nilsson <jesper.nilsson@axis.com>, 
 Lars Persson <lars.persson@axis.com>, Damien Le Moal <dlemoal@kernel.org>, 
 Vladimir Zapolskiy <vz@mleia.com>, Michal Simek <michal.simek@amd.com>, 
 Emil Renner Berthing <kernel@esmil.dk>, 
 Jianlong Huang <jianlong.huang@starfivetech.com>, 
 Hal Feng <hal.feng@starfivetech.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com, 
 linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1030;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=mDmWzbKLnh1AZNQ67jxvi1k0hTLwQwfvsMjzAxX0Nyg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSR6fEB9xL/xFDTrWnWiu/Ruag7QKGjRyQb35k
 gOcnuOKB3OJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEkenwAKCRDBN2bmhouD
 15lkD/9Q4nMlgfW+gPfCACmH3SZySXOQg89b9kURhO8G5ijTWTIu7al/6DRaw7erQNXoNQBsyJC
 20tXphKrIKBg1BOFLkQpFJao++nW1TV9e6bfDgRKv6ZQhyy1v63uBc3P9AT/zNIhPWqRonlDGYD
 EwbTm0diXMR50Hwurgx2vAmMuTZbx2IlIgw8IJ2IaAzlhv2PsgLVapM2G9zgRKTicxGxfFRuLQr
 P6k8YVt7cEdYJxGH0Cxb556NE85eXpDfgJ2zdLU2JgzKOJmQjxftTgDmTZGM0jW6ZAskVG+syK9
 KMh7ipL4lMH9/jo2rRa4r1ftUUblu9FWLsSs5i+xNKBn8z7oxv3PsWV6SOStiSl856ZKSQPXGgK
 KOzmxl2/Tw8oM71vKQfInXGzcxN5DoFaJGVy/WJ43K85ys8epHls7Y3tTpBCOZUGciGaWkLzrVr
 zmghKNkyO5kNtwLrD17MNUGAbv/LJiD9EDIoVuQPPrG5ldyRzfZwWxd/urXqJuTU75evEvNGBy+
 r3SiO/e7iKbZ/Ox8FfkubNnLYl+H6VMsLJoGVZVNI20ZJLVR7Wt/Z1lmZJtOhnIbTFslWzCML93
 AskWsFtWWjVZzX5uKBXDeo98Q5fue2afsKkRAbfKOSphNl6HIPaNmbsLDXRqvTmuBPR6M5wN4Ad
 P6tSr4VsygCRo/Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_231414_739981_5608B9B8 
X-CRM114-Status: GOOD (  10.82  )
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

Always descent to drivers/pinctrl/starfive/ because limiting it with
SOC_STARFIVE is redundant since its Makefile doesn't build anything if
no Starfive-specific pin control Kconfig options are enabled.  This
allows compile testing on other architectures with allyesconfig.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index 65dac8e387985ac7f865d13325eb903f64645a2a..de80f3ee52c40f3a817f229a751909c590161594 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -83,7 +83,7 @@ obj-y				+= sophgo/
 obj-y				+= spacemit/
 obj-$(CONFIG_PINCTRL_SPEAR)	+= spear/
 obj-y				+= sprd/
-obj-$(CONFIG_SOC_STARFIVE)	+= starfive/
+obj-y				+= starfive/
 obj-$(CONFIG_PINCTRL_STM32)	+= stm32/
 obj-y				+= sunplus/
 obj-$(CONFIG_PINCTRL_SUNXI)	+= sunxi/

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
