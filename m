Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2512EECAAD2
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Aug 2022 06:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZdFyrofDQRmo867PsmLNN5rRj0zOifmUdJYvtIL4veA=; b=kYNMM5iPXl8pVf
	2YrSSwmchl669ndGCisIzrSLP1Wy3rFNcND6PP/hbt4kckmoDe9BNTATH/POp4W1gWUsGMAoXWVBA
	69HQ9piuE6pd7vO9rWE0vtO2QB5QVBPECTcalymHgfxE9Pz/zjuFUhp2Gyqm7B7zCylxdylPa6O4B
	6SOFxCilvF/z3mFp+5s8307FQPK9rUkKRPEXHCZuq1BD/qB6gIhNrApOuNrDrgbhn5z/2zcBU/2hk
	hVPOTqU3vi7MxaJwRpQPOL2SMF6U0uCsAwJp/rm3W029jt6wqqeAm9RNwtOeFeVAT2aq85zn20IVY
	+E2I/u7Rpv1Q6D6OrqQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSYAM-005EUD-1Q; Mon, 29 Aug 2022 06:22:34 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSYA8-005EOS-Gk
	for linux-riscv@lists.infradead.org; Mon, 29 Aug 2022 06:22:30 +0000
Received: by mail-pj1-x102a.google.com with SMTP id j9-20020a17090a3e0900b001fd9568b117so3930496pjc.3
        for <linux-riscv@lists.infradead.org>; Sun, 28 Aug 2022 23:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc;
        bh=HegVDwbwdx7NAusLYsMykpD/qEuT4JpSnYO/rlTbGxI=;
        b=WjyPukPophUzCtR+SzOAoslZ/bYXM6E+9r5fsGXNAZHioj/vJQ9OynZCp1T79h5aEe
         4dS68FflIgIfuhCXszrCNKz5Qx6TGm5HmOFZTvG8QlsqvENHhr+MKvSoatxrwaJwOlj8
         8JV3z02QJU9hTnao0w2xaFHV0BKP9Zn57aKiic+o1GvNLunKZPp2MkF96H1UpsEMjz+Q
         LMUPUBEfivz663FKZp/b/T79qWS5xL5D6KkIA2aHZQTn3+qPC2wc6PbPNJryhVkVDfmY
         ohMLcL40mm5LX0X8rKdyWjtNtnRVE3tKHDge4bfB4VuY2MNXfS2h2RVUa43KuMZAR+BM
         KTOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc;
        bh=HegVDwbwdx7NAusLYsMykpD/qEuT4JpSnYO/rlTbGxI=;
        b=L7EVtCid6874aUzP0DQOSZy5bNHBjQgjIPkYwEt0voCj8wEnbwav//nia0y40xw5nr
         bFa4MRTu5jJX8snr9l7Vm53ZoDhKfZ/4a29t6LklJKqgJu3GxhjfXJWMJJ58xNlUlWbc
         Y59OSbCxc1HHKv42Vow70tl6d1YdzsBwBmSF6/Khx39tXMk4eoUZtWI3THKywXEVG2Y5
         B/dpzoHDY3u44T0XtNUvnFLd/uTp4BUrNos2D7yP5Szlr6HrOP/as0Uo5xoobFrkbvvt
         ML1TOtsps1WWODNw6iTFfBjnvm6RV5NVPLBQeCW4iq1kLGHA47DYKeRINVMpJt8omKH1
         6FQQ==
X-Gm-Message-State: ACgBeo3x1bjIY7AOULmkmLiS8lIAMowgHj39XccjwKfTFP+c+rzmvy7b
	5CbyQ+NnGQJYzHwsV725acEsww==
X-Google-Smtp-Source: AA6agR7wY1vr9yMYNUbGEtbcomDYN4hZ6PtMf2FzEeCnczYV47TR3pGVn3Dt37Bs5BFweNFt8JSxaw==
X-Received: by 2002:a17:902:d4c8:b0:174:a871:152d with SMTP id o8-20020a170902d4c800b00174a871152dmr5233087plg.4.1661754137988;
        Sun, 28 Aug 2022 23:22:17 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id mp10-20020a17090b190a00b001f333fab3d6sm5817972pjb.18.2022.08.28.23.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Aug 2022 23:22:17 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	greentime.hu@sifive.com,
	conor.dooley@microchip.com,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH 3/3] EDAC/sifive: use sifive_ccache instead of sifive_l2
Date: Mon, 29 Aug 2022 06:22:02 +0000
Message-Id: <20220829062202.3287-4-zong.li@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220829062202.3287-1-zong.li@sifive.com>
References: <20220829062202.3287-1-zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220828_232227_169592_E2A00590 
X-CRM114-Status: GOOD (  12.42  )
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
