Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5561EBFD0A
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Apr 2026 07:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4cU4CW6LtCfJq7pWIi4fcXw6xKIMNb4wy32bDrsJXqA=; b=ZgJqj8cLAzIzk3
	wLsE/+k5Sr/5PBBlHWNB0COxFmmFjBJcNo66ZpXqhYwmN84PJ7GV1fWd/fX3AuM388XmC7KLp0b0U
	lqzK8k7P1KSZ9cQtbBFW5MsoRzrsye4AO+iTXGGxuAkjHU5HPJybvZhuAfKrred1sKAw2LZwIF4kR
	iSNtov9ZZm1SwjxHF7WdcIPMcpOy1GLnBtb1wz/nkACiX8/PLoc/W/ShaT3foQZjmkzaYBdudkcxE
	ryHZhtDgSormIMTaPu1fozBN019W0jVIZBgLIMauJe113aJkb3rZMbp08m5z4K1+3P+8OvRaVlfUc
	/Zh4ar5hbB4ejCUuZYRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBg0-0000000F8Nm-1uQO;
	Mon, 13 Apr 2026 07:25:44 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBfx-0000000F8My-2Fen
	for linux-riscv@lists.infradead.org;
	Mon, 13 Apr 2026 07:25:42 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so65203585e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 13 Apr 2026 00:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776065140; x=1776669940; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ej5PuXGxv2ijMAzQ8gpPPur0ekJN7jy1Kje2MEZFQ7M=;
        b=oCkfhgHv830n2mHiUn+UknpA45D7dUXBYW25zkJIkD8vHgWUAZ0OwcEaUzPGUESKrF
         X+vrObQvIUx1tN8AlhiEIvB+6UR68Kxsf0BgVbCEGqPd40N4Ik+9NvgWsNhhr69Cnxxi
         WYXS9NfXP0st6kbzcnvMwhi9llnZHNIkG5w50rZtI8qH6HBqA2hy+JRSqpwm34nG0KFf
         sAye5o5oPaSf9AUxCtrEY1Tsxognzo91ZkjJGZEAQoAPg8xfgdeI8T+Bdu0Uwm1b2CVD
         1gps6aDXumMsWPiWKKdiAhYzRbzhqhseut95VZkxVesGM3wTl5r5vMI6jRhjtxS8maWi
         ewYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776065140; x=1776669940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ej5PuXGxv2ijMAzQ8gpPPur0ekJN7jy1Kje2MEZFQ7M=;
        b=X2b0zmWNVbbukTC4DTr8LX8lJKRA2bR4qvUxmDaLkssLpqwBwrgcNTpENegV/aYVkY
         03t9V18HLonigdyWvKb37K6rj747hJQAAM2MLR19/MU4VzFa8Jc0oOm1mAnHMU/P4OWb
         VFpP03LqlZVXEG+ngYP6ZXHchnsN7cczU6CAlI6XEBB5c68/YZH2De4gDWifASpkMeUF
         vbCC0vvIfMt3Zo+EneXAOzcvAy9nRRxPpALpID3COjall6va08DCutvkyYQbFXegx3F0
         3JO2xkck8oci7rcKXTJalKSZgEtDPAnSClVKpa91t8Jt9WbsyiBXOJsqFlPjw7q7shYn
         Zz3Q==
X-Forwarded-Encrypted: i=1; AFNElJ8RqgGx2GAOj5YUqiUYSS2ctLk7kGexhtTnSgSv5Hv0XI15957nKZkCyOQ6JrrIoAzvT+58RaNU/Aw54Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YybhImkcyb25p/UqsY98hLXqnYleOSUYwgtpaKydQpEwmGptgYN
	mMqJWt7h6u1QFrQPtG3C8ahZuEKuomK7P8MJi2IZJY0mnrzE433kbEaE
X-Gm-Gg: AeBDiesRqReW3m8mb6z8e0X2tGqJ36Kh9Feok+GRkm6ZUQFmPcn/kyhyr8LIxJTPuth
	33CBoPALdye1Ue5KaF+2Yd2RuRYkvN+Cqql6JqfL0WfKMPil/TwbbMgnqU3DKVVZ0SO+UKDEM2k
	HmLENLdr0xuHLq7k/ixkVntXQnSiAKLGc8GdUDFf1Wsx540hXjwt7yTe3HMeIZUFeRLwZakfls1
	sAZXhpKCvbhhnppy6o2bbSlyW0yZIA5iZkYw+irqXPnrwbzICSKW5KlJR8wnQKpRRNeS2TDQWmY
	eF1z1xJKelTU8LcPXMx+vsh1b5pwrDABwyuBNZjj8d5ScHV+g15S9P080ePjbnX1OHoFWt0PQ0U
	AYBp1vQiNIr5mcA6BxC3MwHUgjbrQcK+5MEl8+Wu2SG4lrOzGo3HeriCtvVNfcg9XMhQEGuvGmO
	8an1Z2AfuqPVS/oaQmq5EuoiTgIeTGCqHmvEN/mm1srZuCdRpFufEtU5JDY4fF9Q/e
X-Received: by 2002:a05:600c:8b30:b0:488:b14f:b8ed with SMTP id 5b1f17b1804b1-488d6657928mr167657735e9.0.1776065139301;
        Mon, 13 Apr 2026 00:25:39 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488cd10b1dbsm220827305e9.2.2026.04.13.00.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:25:38 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.dev>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Anand Moon <linux.amoon@gmail.com>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Vincent Legoll <legoll@online.fr>
Subject: [PATCH v7 2/9] mmc: sdhci-of-k1: enable essential clock infrastructure for SD operation
Date: Mon, 13 Apr 2026 09:24:44 +0200
Message-ID: <20260413-orangepi-sd-card-uhs-v7-2-16650f49c022@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260413-orangepi-sd-card-uhs-v7-0-16650f49c022@gmail.com>
References: <20260413-orangepi-sd-card-uhs-v7-0-16650f49c022@gmail.com>
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_002541_595176_6CDC3F53 
X-CRM114-Status: GOOD (  10.76  )
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
