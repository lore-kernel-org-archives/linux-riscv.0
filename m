Return-Path: <SRS0=fdZL=ES=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC346C388F7
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2020 12:01:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66F0E20872
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2020 12:01:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l9sh/HSs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sifive.com header.i=@sifive.com header.b="gsBsi+Lz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66F0E20872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0xr77AzR5M0CqKZ/sD5Gphvk50Lk01MxjQYUsbUZOwc=; b=l9sh/HSsSxg+0XpXxIVr37wZM
	RVHGeYfNfYGxTqbL+cCyL/paLHxMvge1BnNkrgvbgLYaLy+RYY6K8PiqyUtAsMJXvsu/vOrmxJAKc
	isPfgv6R4IC8IhfN3NpVxECNnHBNPNuhd4RKoo0wZNJiAVtLYpnNPOzTknvJpu5y7V5UtlVXy11Bm
	GThWjdOghdLCxnWVlU5N3Z74gZwwHK+roJzIOT0cRj0Ms0ExJuYPad5i/aMgizYsZz/yprBy69h7o
	vrYiRa06oLKj8H7kwMsYMomQsE8xk1bAOoMyX0YP03NXeA5AEZ5ul6StoICqA6LAkPQgGVcTUEYYb
	L8z0qPPiQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdBIJ-0001IE-5g; Thu, 12 Nov 2020 12:01:39 +0000
Received: from mail-bn8nam11on2040.outbound.protection.outlook.com
 ([40.107.236.40] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdBIF-0001FR-2G
 for linux-riscv@lists.infradead.org; Thu, 12 Nov 2020 12:01:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hazzx9HYIbfxUSFabvSsaTrufBIdxGH4/BIE+haFXu9N/wDbSdmxu3SskdVMqy8Gg2iOGYK+ijBP2aZNFykB8lS82rXArERJHPuDDn8UfyQpWRE1ybAKZiVmJrWujoc52XIRSuDIdooHmmCOFoW6F1IipWE8DUJMXbCibzqZnIBEXWU/pIf21JZvHQ1asa5yFTsKpbY7sDEOG4DdtDQ5XAPixWD/CGn/dsEUVyij2+QWmgnMCcyOXTVo9A2gSNf132uveD/N1YAfTgFClPwLu1nASq1GyThMiEMt2QsNm7cBYL4CKOOlUg06+/cLrf0xxgZfVr/SmsbBbjPCq5IJPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jk35HmHaCh8T/ew9e7fqwsiYaRqeL7aGgmL8crUZzWM=;
 b=Yolqj4hGvRY900W0G4cJJbvyXzycQFxWJrEoT4Jq/mHQ9i19+/WZ0K2q81+w3tgZ1Gl4RI8NJ4I1IRxzXZJdMKb3xOSMtmZT/7LpWP/DYIL4/M4B/aX0MkeBqdsMQtOtJW9sv0CTJI1qr751953lZ4lIgumaGkpAQ6OiRszLTwS8EInIbjAfSxciwysVjE8IfGqRRzXV/XBGx3yYdWJDW7x0Iuhtng8y2bK1qHiYj8/53N7bdb7PCcJNj97R4eOxtNgCIXuSNOjKTqSuHj+Aq3Q/x+HGpImhtVNyEW9nCHhfPy1+ImpsdeAU7TZS19pocLQ6j5YQL9B4RmYj5Ox8hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jk35HmHaCh8T/ew9e7fqwsiYaRqeL7aGgmL8crUZzWM=;
 b=gsBsi+LzaWb1ThqugqO2Y1y5ieYXILND9kLN96UOhavDtbdprmg8e2o73RRGltRkc6j1KEh6NHI23YnAQ4uD024z8272iCBnyxulqO2CMRwSWO7MXPItxUsw0yWlk9lX9XQjoCNPxBKFikB4srkXYteNB3aa19hQtJD+i0O2Fq0=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=sifive.com;
Received: from BY5PR13MB4453.namprd13.prod.outlook.com (2603:10b6:a03:1d1::19)
 by BYAPR13MB2392.namprd13.prod.outlook.com (2603:10b6:a02:c5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.10; Thu, 12 Nov
 2020 12:01:34 +0000
Received: from BY5PR13MB4453.namprd13.prod.outlook.com
 ([fe80::2c46:9095:ba12:6513]) by BY5PR13MB4453.namprd13.prod.outlook.com
 ([fe80::2c46:9095:ba12:6513%8]) with mapi id 15.20.3564.021; Thu, 12 Nov 2020
 12:01:34 +0000
From: Yash Shah <yash.shah@sifive.com>
To: robh+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 bp@alien8.de, mchehab@kernel.org, tony.luck@intel.com, james.morse@arm.com,
 rric@kernel.org
Subject: [PATCH 3/3] EDAC/sifive: Add support for SiFive BEU in SiFive
 platform EDAC
Date: Thu, 12 Nov 2020 17:30:57 +0530
Message-Id: <1605182457-86046-3-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605182457-86046-1-git-send-email-yash.shah@sifive.com>
References: <1605182457-86046-1-git-send-email-yash.shah@sifive.com>
X-Originating-IP: [159.117.144.156]
X-ClientProxiedBy: BMXPR01CA0024.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:d::34) To BY5PR13MB4453.namprd13.prod.outlook.com
 (2603:10b6:a03:1d1::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from osubuntu003.open-silicon.com (159.117.144.156) by
 BMXPR01CA0024.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:d::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.21 via Frontend Transport; Thu, 12 Nov 2020 12:01:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df0bbe6f-793c-4a44-6e5d-08d88702b33b
X-MS-TrafficTypeDiagnostic: BYAPR13MB2392:
X-LD-Processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR13MB2392CFD8BA443A551021D53F82E70@BYAPR13MB2392.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:849;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X0EQxBPUztdy6vmIwKz8JNyZtOmmckF2KJ7zznoosPWk3e1KZH7tR0u6FqjtXfa1k7m3pUw4PGDTbDvfTv9T9hk7UOiztzGh+/jLSOn0cVAvtTeVS8YUi1z9uONBP2t1yyY5bA77TKo/fZoxvsuR9PTqBZbBkAzqi0q6+k+8zPOjGNB7dB65dOyjYfh9N4r7Iuqyl70VHsVdT8g0Jty2ZNwqgBioawVpygKxtcTcUSasb4IdCqiZxTRqs6TzHtRQq2F49XTdQf6qDJXzUc5VoEY32Mk2o9srreeQ1c68uU7BdA0C7Jv9VmqKZx5T2sUJmQyueke/VVuVaJ0jyWEjug==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR13MB4453.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(346002)(376002)(396003)(39850400004)(136003)(366004)(8936002)(42882007)(478600001)(5660300002)(66556008)(66476007)(6666004)(6506007)(316002)(36756003)(66946007)(6512007)(44832011)(26005)(16526019)(52116002)(107886003)(2906002)(6486002)(7416002)(83170400001)(83380400001)(8676002)(4326008)(956004)(186003)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 4AY3H0yKNECUdtIdaU4LfaGPFjtueYoIOL5wogc6UN3WXsHvacFAl1qkXOep6/qHWatLTk0Lcty4v/3EEWL9OTsKY08cP7l8FkgScyjrnN6fsoQozH7ochm0nGQqSypZYqupwU1wZOovW0jkE51R+BMqtm9JQm1+BM2cHp02kfcXPtm72Z5jvCWWHFDOfgQSiwYab/FpXO1B5A5W7IAm0UZD22dplUbEuTEZXfuklAD649xTqTTR2muSfccpnEdtHxNqIy2HFm8l7JaTp/NLM/mh9n+lq7yOD/AGfTrLtw4FAW/E++iHBEDGu8l0EkpT1DdFUQ5JQhw+/of+vFHi6f0hh06ih+MTA1SeVmvdOQ8MGoadpz3OoYp/ixjFGyODjBFKCiPPAJvjLKIEMEBj2U2/Zz3IaizI1RVm9qEyPVND4Zjp0RQqFgZpwTwSxfL3pvazPJ7Lu4piQC6ldSR2WLgpc8O76BVbArWazOGm8DGUHKSe3yaGqSbIjqeQt4HJ9I4HywpeoJ1S6V+MZpZecJpHMKSJCG3QcuarsTa5ifkbwA7akFFXJKjBJoNsSk1+uZkeqcSw6hQLCb8kqVsSp9n9i8wnBi9r+asaSgklVLVvHdwvzt7TlnhdGtvIaPEXwvuaP7W0+JrIA1IJVsMmm93Y5O2s29UbOi1x2vSTuSEIUICIM7/TUwDUaBTjo+EM4d7WDuAEBZkOwYH2fvk8aba765rRVWQ4mPXQmAHnbPIRolHCz7+st8r67sNCTKG7LLpoMAv+x9ClO9900SiZ35TYuu4WahzOVptyFNFlQTpNi3X4dJQT68y2LNtFJy/KaV1h5HQxWKNpDzyTuGywUevaDKHSEVgVw+JaV1Llma6yijmwI+2ETGsJRud7cpIQVPR8XukSqnPMc8bNk+ScAw==
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df0bbe6f-793c-4a44-6e5d-08d88702b33b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR13MB4453.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 12:01:34.1547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9BjAPE/qG72erWR7tarrc7ehZYzcDFpW1ZglEZG52vUqJjP82I6Ko3snciy/6uVDE9cGEXLXzjteL9JSz9Xg3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR13MB2392
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_070135_203496_1E9AC04E 
X-CRM114-Status: GOOD (  13.93  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org, sachin.ghadi@sifive.com,
 Yash Shah <yash.shah@sifive.com>, linux-riscv@lists.infradead.org,
 linux-edac@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Register for ECC error events from SiFive BEU in SiFive platform EDAC
driver.

Signed-off-by: Yash Shah <yash.shah@sifive.com>
---
 drivers/edac/Kconfig       |  2 +-
 drivers/edac/sifive_edac.c | 13 +++++++++++--
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
index 7a47680..8f662ff 100644
--- a/drivers/edac/Kconfig
+++ b/drivers/edac/Kconfig
@@ -469,7 +469,7 @@ config EDAC_ALTERA_SDMMC
 
 config EDAC_SIFIVE
 	bool "Sifive platform EDAC driver"
-	depends on EDAC=y && SIFIVE_L2
+	depends on EDAC=y && (SIFIVE_L2 || SIFIVE_BEU)
 	help
 	  Support for error detection and correction on the SiFive SoCs.
 
diff --git a/drivers/edac/sifive_edac.c b/drivers/edac/sifive_edac.c
index 3a3dcb1..0f6d457 100644
--- a/drivers/edac/sifive_edac.c
+++ b/drivers/edac/sifive_edac.c
@@ -11,6 +11,7 @@
 #include <linux/platform_device.h>
 #include "edac_module.h"
 #include <soc/sifive/sifive_l2_cache.h>
+#include <soc/sifive/sifive_beu.h>
 
 #define DRVNAME "sifive_edac"
 
@@ -67,7 +68,11 @@ static int ecc_register(struct platform_device *pdev)
 		goto err;
 	}
 
-	register_sifive_l2_error_notifier(&p->notifier);
+	if (IS_ENABLED(CONFIG_SIFIVE_L2))
+		register_sifive_l2_error_notifier(&p->notifier);
+
+	if (IS_ENABLED(CONFIG_SIFIVE_BEU))
+		register_sifive_beu_error_notifier(&p->notifier);
 
 	return 0;
 
@@ -81,7 +86,11 @@ static int ecc_unregister(struct platform_device *pdev)
 {
 	struct sifive_edac_priv *p = platform_get_drvdata(pdev);
 
-	unregister_sifive_l2_error_notifier(&p->notifier);
+	if (IS_ENABLED(CONFIG_SIFIVE_L2))
+		unregister_sifive_l2_error_notifier(&p->notifier);
+	if (IS_ENABLED(CONFIG_SIFIVE_BEU))
+		unregister_sifive_beu_error_notifier(&p->notifier);
+
 	edac_device_del_device(&pdev->dev);
 	edac_device_free_ctl_info(p->dci);
 
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
