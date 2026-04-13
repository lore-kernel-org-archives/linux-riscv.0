Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8300EEBFD0F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Apr 2026 08:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4cU4CW6LtCfJq7pWIi4fcXw6xKIMNb4wy32bDrsJXqA=; b=Fml2DgcaL4gV4w
	S9Z3U7FFFIfFP2yXuN3L0NbedajjtdevIIqHDzPxgDcXT+srA4G+wLaPFHiFW8NoNOYef306T86ms
	z8CE9WgsGGGlXLtE2zMPTuEvIqClzfqMKWdFmFwpeAMaPCDGO6ltb8iCN74CgzFZcYG3X+XdXYx2U
	wPsM4722O4guF8wAI23NJnOzhpaqlQZIB10izuJxIDCtc5RcL07HeeRnB+AkCh6xH9pG8r2JEEs09
	iY/idPxeCl3jtkmETvK5nJyKsRCqbV060XRJeJmURyaugXNxliy5lSXxgp1a4K2ajImCzlokjovAS
	mYGr9JqI1OprZ8kcechA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCFn-0000000FD93-2rhb;
	Mon, 13 Apr 2026 08:02:43 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCFl-0000000FD7s-0oT5
	for linux-riscv@lists.infradead.org;
	Mon, 13 Apr 2026 08:02:42 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-43cfde3c3f3so4100665f8f.3
        for <linux-riscv@lists.infradead.org>; Mon, 13 Apr 2026 01:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776067359; x=1776672159; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ej5PuXGxv2ijMAzQ8gpPPur0ekJN7jy1Kje2MEZFQ7M=;
        b=LNtqlWMayIuAO3E001BO+JhdDntSQ5xDeiudZPbJ+xGE7ryibUpcf43XR5YAputzAx
         AA5MrvNDRkJRnOumRQmRkElXLtVrCYlItk0VC/Fqe2oOP8NsxhLq9sDTBkX04kPt9X7j
         Qm5qzH3bOAXReyXHFg/MPqVjYQSmBFrzOLUaMZIfQ7zA9WTQCcUzqR1vW/kSBCUw9Vl1
         VW9J0VKI9h4XFczqgr31MSICPN6A69hdS2vnydabzTh/kVDJnBe9sErsZiopMXNeh/du
         hy7hDKqStwYKSIzh6eW7WhJUOMXMkkFfAytJ9OWjXkFjn+pA604YDXYIZxitPcZjNLpy
         r39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776067359; x=1776672159;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ej5PuXGxv2ijMAzQ8gpPPur0ekJN7jy1Kje2MEZFQ7M=;
        b=o7G3LZ4hwfvmglMumqrRuKHwQrf8C9yu2byk8jsxvQilGx5DmO4R0jhi45OvJtjfHM
         H69r8sepAUhU/1GNtnnxnDvaBwdJYuOrBiWi4BDIBJPvceKznTr0IRU44f6tf0WCi+TK
         0BOk1CLLHTnkrTrJPDRzWWRgSZrPTOITuKL+92C5CN8vIMPwt7uHORm4dhJoFyf9mY9O
         MQrJI0/w/ZeoCrkpRU9EUTiJLB8NnHPdk6m2dhSatjntkFRaZxkxeCOku35z7oRebtGS
         ruWgRLRDaXKqMUDS5wwsZRH7Sr5aTfm8eHKQqdWcp0Qs4PeMgmU39fhj9ZDinbXJR/Po
         OewQ==
X-Forwarded-Encrypted: i=1; AFNElJ/YtJm1kcjarw+Vyt8pemAHGg4krOdNTwTr3jss8mApYGMaNolyYgnScLZf+vifGwDj/TzoRaOfmeRHWg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwWsN7sO8nJxlNV96Jeyy5vI0J8C1Jke1tCyj9+VqJFbGaMppb1
	yeUViv+/1ZX2OVX0SNnFp9UJNKkccydq4AL5rCavmzX7TqQHnmMm2i9P
X-Gm-Gg: AeBDieva8ZWv9ILMOPv13vwODnVXsWJXzAWYRF/j4VKDEgPHtPx2MIDYmJM4JFb1GKI
	hxXBI5aqkyHutWVsZinvBSGifZhAKSa6deWwm8M08ud9CoSIlCR6RlvfBr9zLlc8zX1zQ2Dbinu
	8oUk5m5VvF0ofi65yqzJJDoKMrCqSl0ZeQVtLDg+ZQ1kDlCKV+MUtT3kB6KOyzDRcGH1yIGNJtG
	N/AI0Dp06GIT0+woTgeFDuvFSTjjjg1hQL+WdWMqwY+7mf9aXH9wT7WUPKjcvfdgH+UnSUh07Gn
	OhoMiJJCsC8yu1lL8Nt1c+ezkt2ofjLZxOqjJxuTYiFJfbBb0/9VJwZf9L+njZ1PIG8YnVKi+i1
	u+KwtjfIX6ekxdEk9yP7Mtf4DjlCVkL/DMAGN5fDX0dZ2cyolR6LW4vWfProQBgfFNMgg6pD/Uo
	hJcfSyh9QIP5CpCHe4NnaxmMVOrU065e0IU1Lhkv3X3eGc2shdAGhcdPVfukLARh+xUfKn9uBbb
	NI=
X-Received: by 2002:a5d:584b:0:b0:43d:7783:c677 with SMTP id ffacd0b85a97d-43d7783c827mr5141524f8f.42.1776067357834;
        Mon, 13 Apr 2026 01:02:37 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c981sm32155932f8f.33.2026.04.13.01.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 01:02:36 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 13 Apr 2026 10:02:11 +0200
Subject: [PATCH v8 2/9] mmc: sdhci-of-k1: enable essential clock
 infrastructure for SD operation
MIME-Version: 1.0
Message-Id: <20260413-orangepi-sd-card-uhs-v8-2-c21c40ec16d0@gmail.com>
References: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
In-Reply-To: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>, Vincent Legoll <legoll@online.fr>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_010241_309155_00BAC0A8 
X-CRM114-Status: GOOD (  10.24  )
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
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
