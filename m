Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A293F3D61F
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 08:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GWaFX8zzSQTbySdZ4NVCK1VJs65JwzCJPTdGu5JAK5M=; b=NVE9Dab/5eboL0
	3uipoAbgym+SEe9iVPOnCcgNrVYkHccshTxmTkAZ3k+qIBHv9S3kXW21PDswOGESibx3PTUURe7wX
	nKmPVlq5A3id1njaSf/nS64YA5R7DSrp3KQSGLD/+AmmdooHOfaHrMzYWteDynu8KCJhqvNsdIuWH
	Ii8q0GgFckeMrfFIGwpv2odRQVUMAp6z4jrWg68Rq9oGFMLx6p8pX0hbqsOI3kyOR8BwfckpvKjFM
	EGbFKEiiRUGR6tm7+d4vlqNM15qVaHWGLb+hDdDUtQ6VSfCyZMzaEMR6XO5CGDOcmD27YrJbYJ21d
	TaKqtUcagW5tSpNQH4+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w788l-0000000Astr-2noy;
	Mon, 30 Mar 2026 08:38:31 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w788i-0000000AssH-1m0O
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 08:38:30 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-486b96760easo45976455e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 30 Mar 2026 01:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774859906; x=1775464706; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AvVWaFSwZuIIuqOAIjURBh3MX19UZqagVH7905iJLbY=;
        b=DvQED7HSCqa3ipXLZD1Ez0GHayZ0muwPV0GS0rHuL0OO994c33R3P4/LIQ2saLYbrW
         m9p87Gqej7ndgc0Af1yMPc2FgZLazuPhhDBllSyvoCCQN6x/h92KE7fh2VbNE3q5AkdM
         RFR2kCJQbNZ54zkwhwb/UeDO1XzO1bSqI6ZXyRCuF5yzCZE43Yf8EwuISAwtsXvI3Mvg
         0wKwciCoWotFgrSwQ+3wyqgFSu3GcklJk4EFlK3/Gd+gJNMuhNFFS+IJnoyOCVMiGyxu
         7KzdQVi4AKiDZm4viFqAwHMFhua5zRErGfxk5eC5ufyqbNYeek6dCZkou/CqgkB8cVoB
         KyQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774859906; x=1775464706;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AvVWaFSwZuIIuqOAIjURBh3MX19UZqagVH7905iJLbY=;
        b=bWPM8u062mMmTy5btjYLvnPJ3D/rCFoya1AbhzxJ5JoENtlSWB9Y2FJsvI303NoLU+
         yqcOpyZmfp4vRUaunKzKsxkN8WbX47UcpxEKqvaLjbQPYCKsEr3zo/aj5R6/TIP8vpLv
         qZPB1LTduAGcuKSc7g1LtW9HXauMzxxDpy/lmFdRX9DGBCUyPJsH7O0jBLidahRffLKK
         03m66TYf6TWbe1BPSdVdPwatnCRkxFmJSBJpQggfTS14YGnmhuZy75kcVlgm5mcztEny
         i82/wxcg/bvwhpWP4AzIYObCeqDFFs8/jrCl46Vs7HErJuMtk5nonSW9fkSY76QAk6US
         1pTw==
X-Forwarded-Encrypted: i=1; AJvYcCUk2ETQSBbdwlsPEKfHXVd3Zmusarq54CWnWqI0bmSoVOQ9QM948h1mwT6162Ua3/bAGirbNAHIvQDgZQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxDufCMKlNqNGc29+pdkubq/iKzkHWWod1jYfyDe1K9W8TtItZD
	TQgH/z4wOFbhaxnPuJVdU2YsQvQFTUyJ5rxA2NGSmYfQ8ZuB82Qa7Elf
X-Gm-Gg: ATEYQzySWQA4KCqaNQoweUUefTZl3UHSMfjKa34eQ3w33GJuq5t6Ke6lY7llwwRPzBQ
	oGJ4R9no7sl9QCD2xCfdZG9rjp2JiDBgizO5vu1V2KpNXds+3+VFWWxcTSJOHHaKBoJugL4w/1X
	/2ndUj6QIRpLtsQS/9nvxJYwEeIGdQwIKLxokR/5M07wwQOyiVd5gIx3X0bXJsuIrhMNXeDDxeH
	1LX9fcmv795n62sz5M2qIeFi481Uzmr0pLmu2C9aIu2RYhCworr6eeYalkU70ozcvtVPwf6vr5R
	CYGYUAZWfJaWkmXK0bCHFB6V1zIEcYs8Hsx8/Y/WXl47VOSDA6vsuYlzgIqYXRCS8fnCDknrg3c
	A8vw81t8CZzD4d5Y0lIDReO55hG7IYSEzBsoavw4Am9MhysFiNy4GF6MYv32SkT9iDZiGl1zUeO
	vZxCXCt0aDwTSyXtrYUCPkgMhVbNqQR1eJ9y/t3jmDz5ZtHkbj1M7VK9l4G/Ht58lJd/Bm8Q41K
	yA=
X-Received: by 2002:a05:600c:1d0e:b0:485:a4de:f4f9 with SMTP id 5b1f17b1804b1-48727ee54bcmr204093705e9.27.1774859906374;
        Mon, 30 Mar 2026 01:38:26 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.232.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4872712c236sm74063315e9.14.2026.03.30.01.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:38:25 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 30 Mar 2026 10:38:03 +0200
Subject: [PATCH v5 2/9] mmc: sdhci-of-k1: enable essential clock
 infrastructure for SD operation
MIME-Version: 1.0
Message-Id: <20260330-orangepi-sd-card-uhs-v5-2-bd853604322d@gmail.com>
References: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
In-Reply-To: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_013828_490581_85FE692B 
X-CRM114-Status: GOOD (  10.43  )
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

Ensure SD card pins receive clock signals by enabling pad clock
generation and overriding automatic clock gating. Required for all SD
operation modes.

The SDHC_GEN_PAD_CLK_ON setting in LEGACY_CTRL_REG is safe for both SD
and eMMC operation as both protocols use the same physical MMC interface
pins and require proper clock signal generation at the hardware level
for signal integrity and timing.

Additional SD-specific clock overrides (SDHC_OVRRD_CLK_OEN and
SDHC_FORCE_CLK_ON) are conditionally applied only for SD-only
controllers to handle removable card scenarios.

Tested-by: Anand Moon <linux.amoon@gmail.com>
Acked-by: Adrian Hunter <adrian.hunter@intel.com>
Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 drivers/mmc/host/sdhci-of-k1.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
index 455656f9842df90c7a94a290aeec22157b378fc1..0dd06fc19b8574ae1b00f7e5d09b7d4c87d06770 100644
--- a/drivers/mmc/host/sdhci-of-k1.c
+++ b/drivers/mmc/host/sdhci-of-k1.c
@@ -21,6 +21,13 @@
 #include "sdhci.h"
 #include "sdhci-pltfm.h"
 
+#define SPACEMIT_SDHC_OP_EXT_REG	0x108
+#define  SDHC_OVRRD_CLK_OEN		BIT(11)
+#define  SDHC_FORCE_CLK_ON		BIT(12)
+
+#define SPACEMIT_SDHC_LEGACY_CTRL_REG	0x10C
+#define  SDHC_GEN_PAD_CLK_ON		BIT(6)
+
 #define SPACEMIT_SDHC_MMC_CTRL_REG	0x114
 #define  SDHC_MISC_INT_EN		BIT(1)
 #define  SDHC_MISC_INT			BIT(2)
@@ -101,6 +108,12 @@ static void spacemit_sdhci_reset(struct sdhci_host *host, u8 mask)
 
 	if (!(host->mmc->caps2 & MMC_CAP2_NO_MMC))
 		spacemit_sdhci_setbits(host, SDHC_MMC_CARD_MODE, SPACEMIT_SDHC_MMC_CTRL_REG);
+
+	spacemit_sdhci_setbits(host, SDHC_GEN_PAD_CLK_ON, SPACEMIT_SDHC_LEGACY_CTRL_REG);
+
+	if (host->mmc->caps2 & MMC_CAP2_NO_MMC)
+		spacemit_sdhci_setbits(host, SDHC_OVRRD_CLK_OEN | SDHC_FORCE_CLK_ON,
+				       SPACEMIT_SDHC_OP_EXT_REG);
 }
 
 static void spacemit_sdhci_set_uhs_signaling(struct sdhci_host *host, unsigned int timing)

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
