Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B596BEFCD9C
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Mar 2026 11:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q07MvuaXR6jXymQFeLC6EN59oZ4IMc1gtI2VBe27oz4=; b=tYncHupgvAxKKR
	1t8Jaj+jDGLyNfHvgMWOUKrnkK7V78l8C/+mLUN6Gsbf2/BK31rT6aGwJ/DQd0u6H/SpTpqmUFxtd
	exGUL2Mux3lx0hnlsU+8oG3iHKJ2cO1p5lqeQ9y9QJ4wCqlRR2DHgkNGqPNpoWaQtIkc6l0tPowAm
	Kl7zIDxmwYrhwTmwTA3h1EU+IeDkKcwY2HOU6Cb0Yp/nE80cYb7VDQH8/OiYtzgqW3G3cE87ppOig
	fPf+sWH39tHXdfUBTrgyxFHR2008rrmnuVdyi+NkwaUm1tRSOLTBAEvZZIdZPPn3kjtSErbjEnX+q
	LleAZpx0RJ8o63e77B5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYyP-00000007Cra-3ifo;
	Mon, 09 Mar 2026 11:40:33 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYyN-00000007Cqc-0mTi
	for linux-riscv@lists.infradead.org;
	Mon, 09 Mar 2026 11:40:32 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-439d8dc4ae4so1529114f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 09 Mar 2026 04:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773056429; x=1773661229; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ENoXAlYlr/CKB5p2K9cJMvCPGqe7WoN4P4jGKMHaZJw=;
        b=YeHsZOQkLBcbquEL0rsiKMWfoHJsyLy00TN8A4czmahbccHoL/BgkMDi0df2QTjmQE
         AIKFDULDsyinXIF/vmOncwDQ32yFbzANyKRvleWhTs2iESw+8jDlTF0bd2lqcnWGpDR/
         M6IlfAFlw/7UMrWA1MsJT1zSsNx23pBLhoYMagA2NtsVoowfm9bWlmWuPu73dgcATOAK
         +1fblNq83Q38y3x5l2zQFD9N1WMFMCOsFvDeiOfZdU2SLbUMkq/i5Knwsmh/gAyDCg4X
         CUTPr4V6FMTxzw26Dp5krVOecrLULz1PR9IpAhBrcQospIUz+OMHD29y4hoA4QjKKM8T
         YBIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773056429; x=1773661229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ENoXAlYlr/CKB5p2K9cJMvCPGqe7WoN4P4jGKMHaZJw=;
        b=O/mKSTIPz2GGzeoRSInJgrjxZSN7sYuP7UkLkE1ajKXLhB9KC34X3qdCd50eQDLSSs
         pcx6sfrjXegqNqfqhASJUxxSPo8xf8JSFw7mjEODRqPt/d4Uh6uJc8WQ40WrPQYi9SDu
         A/rA5QbWya7Tm51nb8i8NFvVjcUBiBPZEZaxQ7ikNyuEo6xuG59rfKPDGe3xNH1xxSjT
         YbWxUAPysuhGS6q4vPo51ggcuKC0jFthH3G8fwGD2vGBv7HbBHa+IecM1613MmkXGBY8
         ho5WIOBjk2O350B9cs8d2VilxPJEmZR9uVywlAJRN4RikUTZKidzZGrSINjYp85ws4am
         FfWA==
X-Forwarded-Encrypted: i=1; AJvYcCVg6ljos+/qLRc7+/mfwdY/JJ+mLnlqcVw6gKx72xUIkjGEXSTlvSB1zSAq8XkxuMJcuv8mDYFIC/WW8A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwW3bDh2IWCU1Lx/ESP2W+fodoXBLEJmiUnLjWOiAq+2GFJFiJE
	OjtyHSMWdHl2nCNMu10PVKbwcdXyBdArnM0i6NVuWvRJjVsCpzTAvhAS
X-Gm-Gg: ATEYQzxBC0nKkpSe8fuV2P6D1hOM5dLzG9kY3zg9DSIkUGEr2Nsd6/kHvGIgkFktQaf
	bRn07+4MUGxipSwnXFfc8qlkv63NtKCEb6d8LuF40i1ZKwevwwmSoe3s1yh3tsnvd4Mtaim9yq9
	qs6oWZTy7khyCmCxwI74I9rO44/SsAdM47hH/riR2WZV7eGc3KWz0144hr2klqedq7wXVyt40l8
	umAqXfQd3M5lKK3LJFcOrNUZl4Is/UC6dsutUqqpNvNjjNN3WiW+bvOevaVPRVH1BeRnBkui2Ts
	4kP1S1SlKjeTil7gqQCf6nIycKv3Kzstvu2P2eW86g4SmzOU61i5skmBalySwPxJ+Rp9KtNQlnY
	5//JxjjIkx0BkKhvQWj8n4BsyEvH74j5RF73CUuQFAMx6XHscohryEiAZbQ9WMxrROejtOdkF8L
	fnD6xgnNOqRMPZQN/DY/X6E9preT4IuBSyHbmyhRzyLiAHUbhyPmq62+R+cpJ2frKT
X-Received: by 2002:a05:6000:49:b0:439:be67:a02d with SMTP id ffacd0b85a97d-439da67c0c9mr15289084f8f.31.1773056429202;
        Mon, 09 Mar 2026 04:40:29 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.236.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8ec97sm28471699f8f.5.2026.03.09.04.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 04:40:28 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 09 Mar 2026 12:40:11 +0100
Subject: [PATCH v2 1/7] mmc: sdhci-of-k1: enable essential clock
 infrastructure for SD operation
MIME-Version: 1.0
Message-Id: <20260309-orangepi-sd-card-uhs-v2-1-5bb2b574df5d@gmail.com>
References: <20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com>
In-Reply-To: <20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com>
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
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_044031_247187_9BA02C66 
X-CRM114-Status: UNSURE (   9.91  )
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
 drivers/mmc/host/sdhci-of-k1.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
index 0cc97e23a2f9c7b2f9376318a8a7ebb860571504..585c7eca6ebf253aac466dd37cef029deb63f692 100644
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
@@ -100,6 +107,12 @@ static void spacemit_sdhci_reset(struct sdhci_host *host, u8 mask)
 
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
