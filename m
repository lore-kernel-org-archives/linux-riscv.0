Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 487E9EA4E21
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 15:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xSNsuwLsMCb1XzIwLiXu/49rTActztzcDhDq6TeKaLs=; b=tPA555U2GC9WGb
	84viOXkLzCSIHntl3p6Eeg7dKWscYnAoq6foMrldTS0YvPg6epaYxi+D4YDkPBtUjYy/ArFCupf0+
	SAWC6SkartMhoLSrad2kMnA2JzejE69YgRN1WP63XcKTlXhzlI3rDYx9hANNFojCki9py6LJ3mkgB
	bgQnmg4vwy4inruyJHVeh2cdCa6P9Jw694HemY6GFq8wMfZZaEINlLwsKLPRRdwXhji/z62E9hhvz
	HQGUP1NmPxSB7Pc4mGwx8aRSvJAcp0FXmoTyrx3kjHAUR7i98ArlSfMWm1R4URTuLKpYsLrjRnW6N
	MYPXfXAvFcS+3M+R3JMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4y4-0000000DK1S-2SEw;
	Mon, 02 Mar 2026 15:13:56 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4y2-0000000DJzY-0FOG
	for linux-riscv@lists.infradead.org;
	Mon, 02 Mar 2026 15:13:55 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-48372efa020so39364655e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 02 Mar 2026 07:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772464432; x=1773069232; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SjMmH3TKAZLFeVk2hH9QgAPKoSKsH6HVvsl5OwBldO4=;
        b=UdNgYRHo51AUNwmf3rPEHk02sHL13bXit5CpkV5ctpNm/PqsA5UAfsq0n6jEqmX8bR
         0M2Xs1sGz7tFiyg66753GABBFpnHYrfPhOWwfl5lqSD70WC2dO5wHAA1gnQg9e4U7TeD
         ZaayXVmYWpn7J3J4aUry9QOarL9EFT1GajbAmH0cwy3fkz5ClNs5h3Tru5it8JZzddF+
         9IRViYwkIlo4P8Ly++7FDIc2hqb80nHbeuJb5tRH9DS0W6TCEIZIgesXYRIsp42Wb3Dq
         7wdBV0EErzDxXJvY6zDF26tA2yQ1XQWyR/P41DkM22SysPCZvB2qS42NplMp5hXlHyLp
         Rwew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772464432; x=1773069232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SjMmH3TKAZLFeVk2hH9QgAPKoSKsH6HVvsl5OwBldO4=;
        b=YWJGf9uj4lICYiB93Qz2ARg/nKBECmSPEOuCzqYT5gc6MLvlMaGX9cXPXZpEEDrQ3C
         ZvXmDbdupQaQjp8bQPGo7N0siLk6CJ0iR9ZZTJ5AYKfkWFtINOWHNWdOo9G/HvhOlRkV
         Oh8DjF7ArL3O9vYy1ckv+MEDueUfYQlZNgfff/M9xruvKtb93ZxKEuVGHWB+bVUUM7OV
         NePrTOZZo/2dQi4YD+GETazrLT4vKvsRon/6TBCYlfn6w71CUBgcpV351JjRfoeIgSMw
         fCzDp9TPrebSykVsXqBtSqVay8whbCxxxYtnNlRFyxjGVvKTWefRk3+g7VgZs1c6obuq
         2Psw==
X-Forwarded-Encrypted: i=1; AJvYcCVxTUNvjruD+Jg7PC285oVoWgVHXiAPZtY4OlRKwsrVXyGp1ZBOpsvd81Cv9EpMSvQ+PikLQP/BfT0k6g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yya9AkYC7Hg38Sclkmmm4BCXQriLXKCuapoxjUPLToyyZsD1IRT
	0Q5RQx+kXpvKWGXOPewSGIRTT9cQ3fxNIhJN8aD2FK29247Ym+XnWJ13ipM0vw==
X-Gm-Gg: ATEYQzwzh0bEIAnZAIDMtKRtup3anXg03sw8Vfg5vq+tF+5VIziBOvtW3FrWShG6/SQ
	KSJQCdGL7spUvLQYhFq1hZhLwCtahgEj1BsC0Rx48zizCrxHQuaZkIhVW0fzpwsQMQwnYFK010X
	FOvoc/nHovC2zO7IEP0NEJXtI34NdkM297NBOwJfywMCwR8CIJ/DAGzkKVknlFGOQFDBsY3xtpg
	mvekLRFppNdtMMXw6h8kPYHP2rXc/sxdYbRVjt7KYptc3nkjt4AuCY1ddLKiKWvcHi+AjzI7lUI
	4Rio3Ec/9cUGNqVgw5vNzhjxHifmQ9OkqGLy5PFwZomNfHN8mCAridxNbkvoP8E+bqrlMHcAOFn
	dIde5nUCRvYi0AEVbHIkbXmz/3fG23uDZ1o/aBIdJlNa97wyhJOhRi0ne5rKALTphZUvEvIKNKy
	E5MsGvOVmD+W/HP4ygPgi2VjG+8r+YakXk0CQsBHuQqR2ywCZ2pilp66om9XZjJ3baEncfctU0C
	B+H
X-Received: by 2002:a05:600c:3e86:b0:480:6941:d38b with SMTP id 5b1f17b1804b1-483c9c1bc0bmr208716755e9.30.1772464431872;
        Mon, 02 Mar 2026 07:13:51 -0800 (PST)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.235.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd70e692sm437240265e9.7.2026.03.02.07.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 07:13:51 -0800 (PST)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 02 Mar 2026 16:13:23 +0100
Subject: [PATCH 02/10] mmc: sdhci-of-k1: enable essential clock
 infrastructure for SD operation
MIME-Version: 1.0
Message-Id: <20260302-orangepi-sd-card-uhs-v1-2-89c219973c0c@gmail.com>
References: <20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com>
In-Reply-To: <20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_071354_116975_5DAE30D6 
X-CRM114-Status: UNSURE (   9.16  )
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

Ensure SD card pins receive clock signals by enabling pad clock
generation and overriding automatic clock gating. Required for all SD
operation modes.

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 drivers/mmc/host/sdhci-of-k1.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
index 0cc97e23a2f9c7b2f9376318a8a7ebb860571504..b703b78282ed8d89183c816477c149c0a565618a 100644
--- a/drivers/mmc/host/sdhci-of-k1.c
+++ b/drivers/mmc/host/sdhci-of-k1.c
@@ -20,6 +20,13 @@
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
@@ -100,6 +107,10 @@ static void spacemit_sdhci_reset(struct sdhci_host *host, u8 mask)
 
 	if (!(host->mmc->caps2 & MMC_CAP2_NO_MMC))
 		spacemit_sdhci_setbits(host, SDHC_MMC_CARD_MODE, SPACEMIT_SDHC_MMC_CTRL_REG);
+
+	spacemit_sdhci_setbits(host, SDHC_GEN_PAD_CLK_ON, SPACEMIT_SDHC_LEGACY_CTRL_REG);
+	spacemit_sdhci_setbits(host, SDHC_OVRRD_CLK_OEN | SDHC_FORCE_CLK_ON,
+			       SPACEMIT_SDHC_OP_EXT_REG);
 }
 
 static void spacemit_sdhci_set_uhs_signaling(struct sdhci_host *host, unsigned int timing)

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
