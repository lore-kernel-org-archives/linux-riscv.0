Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 197A0CD37B7
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 08:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xVbdlQR49sHIBB7y9CGdj7HWV6pvB4Cxukuuo6UMyj8=; b=NeEPaluWBEicGQ
	hk7CvrXtTZaFX/q4nHixufiuPB6Xu8T1Y+fsVRfztrRDuQP/eGzNcs5MM96hR7SfiFJsds01trBqZ
	16X2c4Cdlq3HMFb14qWkr+fqE0iIjQJP7NgLQACEFoPYMKIv6Wx4J4dR1ejV2/uaQu/iEw8Z+vYeK
	XfgDGOGPNnn4JTuJleydalEY9m9/fLPzfX8ev1FOkkva0vE98X/Lggp9gg/6PYFIAHl9Cv/MoAwyg
	IitRdEAGgl6z0mx80lICTopTbJ49oql3Oe81MFa/jtdCdZq3KR8NvK0suNgoBmG1UwuebSRgr6bGZ
	cmK9v/bOt4Vt6tVID0ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMPL-0000000Co2W-1ptE;
	Mon, 11 May 2026 08:54:35 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMPI-0000000Co0h-1HEK
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 08:54:34 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-441209fb77eso2377171f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 11 May 2026 01:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778489670; x=1779094470; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rGycZZ0oxVCkeN0xv1IJG1TkG4N0VwOrQ4cI2sdWgss=;
        b=pHKC2GKKa92Mv2lLeh81Xl26vrlJdVm5HBudPr1udzcz8mM3r8TpaZmmBg+ZQ4IVfO
         LPjnXqYOasOZUXJpQggbJB4fzy4e1R5LYld+KRdM+5Prb3QDXQkCATznkicZ4iemONJb
         juiEDQeeCJK7F0ygXrEQ++RsoKJq+9m+Nhe/goqHBjuG9I+C9tLZGE/ajYIJDK/iKNwc
         GXab5M+pyljHImLsEiO3HOGqxkT+BU8d38cueELEGJvI5TD4W7WsyEsdCZUnvvz19Fqi
         7UnqwOCDPLr/DYtYhNQ0GKMybINidJBFaz9rT7K8xZS0muWy7k75pTOV/YdM4Epu5DSR
         dkkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778489670; x=1779094470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rGycZZ0oxVCkeN0xv1IJG1TkG4N0VwOrQ4cI2sdWgss=;
        b=JEJ2T7AxjnQfNH0+RFWSHNEXBoL1DDmEfMr7R6tqHnmFv+Bn0cFimq/k01gKfgP0Hs
         9bpS4NGeM402YyJMPPuAUPWZNAIcC5b3O9mIJNUPlEoHHacH54eJ2pAXqMlO4ckl6ZNk
         mdr6MC0sWN8dbLYRFYnUjBWFGZalZzcHZJj3z+dV3Mt6nATtxYEdB2Yvt2ADqEKXll+G
         6qIlN+pGt4Ufzmu6JxI+0z5KjZO55wyrAwXqn3kW52FBkErwhgyG4WvtUSSuv7b1kR/J
         RSKR+YZU+ATPHV2IfTMTCdJw1GHi5XCdFp0k2bU4SeWTmvgvfkSdXt2NHd6lIwuP6vnR
         XpuA==
X-Forwarded-Encrypted: i=1; AFNElJ+okjFB1DadJ2U7j4DoWIWVDbQQikYPLlv95/KYSxlEtmyQYZ/7Aymem78ibdolvZoUZrM/MPsh7opQPw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxI4c8EUabjcak8L1iyX9mjDJS7FqBJ3v3zYV/X7Uo2gwsUsXp1
	k9Jcp0ykLhzy3IhDFoZW+xC/h7oVEkZ6NuhK30r/8jtskYKCIYOB1FKk
X-Gm-Gg: Acq92OGJBbZM392jNbEo/s0qsZKeL9hQXSUisUk+/PeNusZC/kdiJOirVnOW9yTdASI
	RHVyxRgPAswPQ4JAkqLb1Rvipf8uzE+xfuk/FC/ffKQPqdhiP4VpVTp5z/jZFSU1pQxglZ93fnS
	DVWSTs3FoNuKqhM+xWkSkrsXuRozEbnwCoM/614VWidWYeJ11klI/o5MN3eaeQVTd4B/+FHfTZ/
	ppkG0pfElT7Qk4O9cdDDuO+qJbNLjQWfCdlZaqDWDd4l6XZCrUwifGn65QdQtRPEy3K6VPZs/rT
	1KXeOYndwSXYFhx/yEUcfXeDAd4+bOUgznAk9pLRZhaFX5yZHpllIHUIPyGmJOqj8e85EBCXQ4L
	9V50LAEOCnLq3W0ZUYXyAheyqiKrxKpea5J1qcud3rEduOuZHeQFselcQSwLnWclOjEIwsLLPva
	Ac6fv6UGSR7VQMXqoyRI9/voT7Jy8spHdrN9E8GO0q9/a1MwKAiMs2N+5olEsN7tj4WJIY4PFYQ
	E+8
X-Received: by 2002:adf:fa45:0:b0:441:29cd:a18e with SMTP id ffacd0b85a97d-452ea07e223mr20899118f8f.23.1778489670340;
        Mon, 11 May 2026 01:54:30 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.237.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491ca2fd6sm24944189f8f.30.2026.05.11.01.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 01:54:29 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 11 May 2026 10:53:57 +0200
Subject: [PATCH v9 2/8] mmc: sdhci-of-k1: enable essential clock
 infrastructure for SD operation
MIME-Version: 1.0
Message-Id: <20260511-orangepi-sd-card-uhs-v9-2-ae48c0b2b2cf@gmail.com>
References: <20260511-orangepi-sd-card-uhs-v9-0-ae48c0b2b2cf@gmail.com>
In-Reply-To: <20260511-orangepi-sd-card-uhs-v9-0-ae48c0b2b2cf@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_015432_402806_8E1CA6FD 
X-CRM114-Status: UNSURE (   9.85  )
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
Cc: Trevor Gamblin <tgamblin@baylibre.com>, devicetree@vger.kernel.org, Michael Opdenacker <michael.opdenacker@rootcommit.com>, Troy Mitchell <troy.mitchell@linux.dev>, linux-mmc@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org, Vincent Legoll <legoll@online.fr>, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, Iker Pedrosa <ikerpedrosam@gmail.com>
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
Reviewed-by: Troy Mitchell <troy.mitchell@linux.dev>
Tested-by: Vincent Legoll <legoll@online.fr>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 drivers/mmc/host/sdhci-of-k1.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
index 455656f9842d..0dd06fc19b85 100644
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
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
