Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68191ECAAD3
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Sep 2022 10:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZdFyrofDQRmo867PsmLNN5rRj0zOifmUdJYvtIL4veA=; b=3HjIbNqIEkwtdD
	Apruc5GktqEWIn7f/pnE0gNEjkEBKqjPjMhxfhMVx8rT6+SqntJiMdZZEjgafQZ3vPx59Lq5x1dFn
	pCCLeH/viMchaV7/uwMb3R9qakgB1fWrR8grYCNW7hJGFTdoR9Bb5PGkwBlbqtEFpy2qKz//H/D4w
	D2KCw+phz901uk5jG4zEoxMshc1vt3VPtHFKvIuXUYn/1Y8xK+i3/SPnItqdYZtmZFfWp3RCjFBFA
	4lCNehghNH8QXEHksvuS2Bi53bHEGciJcblaOIV0GNV/PCjpt2X8SPDg4AfINRwT9Z8TRK2KMyeps
	X4o7q5POnGoomaluPjQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV92n-00HPMW-9F; Mon, 05 Sep 2022 10:09:29 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV7WJ-00EhQK-CT
	for linux-riscv@lists.infradead.org; Mon, 05 Sep 2022 08:31:55 +0000
Received: by mail-pj1-x1032.google.com with SMTP id q3so7762841pjg.3
        for <linux-riscv@lists.infradead.org>; Mon, 05 Sep 2022 01:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date;
        bh=HegVDwbwdx7NAusLYsMykpD/qEuT4JpSnYO/rlTbGxI=;
        b=aD8U5Io3OoxXQycA2E/XrSpXhrDZWnOitDIAExLsNLwS71FDEoPQQAl6KhpjPqcLp1
         hrGHpZgt89aYD5cf8yebwHeLzegfd3Pev6ZFmtuleGtNs27UntabRVGWVEm6mS6rM6Zj
         eYc58IE43GT2FlhHAZteW/hj/bK1AZmlsNNjPUkli5IsAM/VdhnQH48MhSseV6Hqj9Gy
         A0ssJHtWErt8dNVzGQswEtmPgokxkkNrCHaLBwTTLMCQMnzHncxPCOfUA5PXCzHetMNO
         H5SBpTUSeyQ4Z66XqmYAmAUSfNyJ8mpJJwE+tpo/rcnx7ZZ6Kiv2mvmbPZfO0lueCdvu
         zsgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=HegVDwbwdx7NAusLYsMykpD/qEuT4JpSnYO/rlTbGxI=;
        b=pftIkeYhLcE7QaS8QHSSREyUkM6GW/OG2T0QzTD+cuhm5L8U/BaCsyZOkUjGry8X0/
         9S/Z1goqc8T1Zc1FTqtaRb5nFQYN7ktVVcom8h6MV8PTPNkq6IFP2/vqcOM5uNRIrZ5F
         RXmt3BP2elvhaiW/iXFhT8FtkL55p8qcheqDEknt1NTK8MNd8MxHvpJwl0kgAkT4t/lg
         WMhLJJ7WDh9Rf8fOQuBiGcOGW58BeiEi4ww8B6mdOhBL2C7PzGm9hqqp1GWn0RAJIadd
         iuwMYC4f+n/LrMmZB01dw0jH0Kx2S+/9cg7oL3WcEpryaxcKj8Yehc3Zpcoq5UgsbVT6
         VJwg==
X-Gm-Message-State: ACgBeo1vvb2rpea6Dtq6KvGclyqenuDb2rTNwlNXwbRF2ncAjFXMCFVp
	9TJCTknf8M7CQUAn4PkKzTHWfg==
X-Google-Smtp-Source: AA6agR4pHdfSbuKPjwJoHOYX5Z1xOFxftCcI/m+BGzP79RMUUHwyVC1NXoKympMNV/uj8PE+r/2RBg==
X-Received: by 2002:a17:902:d486:b0:16f:15a1:6da3 with SMTP id c6-20020a170902d48600b0016f15a16da3mr48626724plg.134.1662366710366;
        Mon, 05 Sep 2022 01:31:50 -0700 (PDT)
Received: from localhost.localdomain (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id y3-20020aa79423000000b00537dfd6e67esm7089721pfo.48.2022.09.05.01.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 01:31:49 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	greentime.hu@sifive.com,
	conor.dooley@microchip.com,
	ben.dooks@sifive.com,
	bp@alien8.de,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v2 6/6] EDAC/sifive: use sifive_ccache instead of sifive_l2
Date: Mon,  5 Sep 2022 08:31:25 +0000
Message-Id: <20220905083125.29426-7-zong.li@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220905083125.29426-1-zong.li@sifive.com>
References: <20220905083125.29426-1-zong.li@sifive.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The sifive L2 has been renamed to sifive CCACHE, EDAC driver needs to
apply the change as well

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 drivers/edac/Kconfig       |  2 +-
 drivers/edac/sifive_edac.c | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
index 17562cf1fe97..456602d373b7 100644
--- a/drivers/edac/Kconfig
+++ b/drivers/edac/Kconfig
@@ -473,7 +473,7 @@ config EDAC_ALTERA_SDMMC
 
 config EDAC_SIFIVE
 	bool "Sifive platform EDAC driver"
-	depends on EDAC=y && SIFIVE_L2
+	depends on EDAC=y && SIFIVE_CCACHE
 	help
 	  Support for error detection and correction on the SiFive SoCs.
 
diff --git a/drivers/edac/sifive_edac.c b/drivers/edac/sifive_edac.c
index ee800aec7d47..b844e2626fd5 100644
--- a/drivers/edac/sifive_edac.c
+++ b/drivers/edac/sifive_edac.c
@@ -2,7 +2,7 @@
 /*
  * SiFive Platform EDAC Driver
  *
- * Copyright (C) 2018-2019 SiFive, Inc.
+ * Copyright (C) 2018-2022 SiFive, Inc.
  *
  * This driver is partially based on octeon_edac-pc.c
  *
@@ -10,7 +10,7 @@
 #include <linux/edac.h>
 #include <linux/platform_device.h>
 #include "edac_module.h"
-#include <soc/sifive/sifive_l2_cache.h>
+#include <soc/sifive/sifive_ccache.h>
 
 #define DRVNAME "sifive_edac"
 
@@ -32,9 +32,9 @@ int ecc_err_event(struct notifier_block *this, unsigned long event, void *ptr)
 
 	p = container_of(this, struct sifive_edac_priv, notifier);
 
-	if (event == SIFIVE_L2_ERR_TYPE_UE)
+	if (event == SIFIVE_CCACHE_ERR_TYPE_UE)
 		edac_device_handle_ue(p->dci, 0, 0, msg);
-	else if (event == SIFIVE_L2_ERR_TYPE_CE)
+	else if (event == SIFIVE_CCACHE_ERR_TYPE_CE)
 		edac_device_handle_ce(p->dci, 0, 0, msg);
 
 	return NOTIFY_OK;
@@ -67,7 +67,7 @@ static int ecc_register(struct platform_device *pdev)
 		goto err;
 	}
 
-	register_sifive_l2_error_notifier(&p->notifier);
+	register_sifive_ccache_error_notifier(&p->notifier);
 
 	return 0;
 
@@ -81,7 +81,7 @@ static int ecc_unregister(struct platform_device *pdev)
 {
 	struct sifive_edac_priv *p = platform_get_drvdata(pdev);
 
-	unregister_sifive_l2_error_notifier(&p->notifier);
+	unregister_sifive_ccache_error_notifier(&p->notifier);
 	edac_device_del_device(&pdev->dev);
 	edac_device_free_ctl_info(p->dci);
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
