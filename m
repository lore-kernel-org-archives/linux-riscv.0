Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C5CDCDE000
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jun 2026 17:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=stDveBtOjeeecI1/ahaqs+uDbWu+1otMUs8Wzf47zO4=; b=5CDY0hF2w+NwV3
	bCJ28vWgGyFi7/RZCiSrCVqGzadeB93qS8RXy+hfNK+ADxwhXjyLJOuahjWzkauSdxWje6zzhX821
	Gbx7xgCxJPRQ7OLyULhits3TE9Yp3R4iG02dlZMrBAQiUgFA2/DrwamGaTghMYNtltl2qGeS6xDRU
	Hx+cucOxXrntpOQ3M89hNaiQ1ZpOuAp5zejmUeQapv7/3xjs8c6Z29oUJ1JViTj5XPx/uvsjR7K5l
	0jPMxsXM4HrJ16AQS4czMWwKbbkB+Bcy/IaB1VaKFXsEOKPt9Yc2AtmrVfbJoBuWZpVBp/JlsvIfL
	d+/e6KT0PH1EbcSOe03Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcny4-00000009XRb-3bWA;
	Thu, 25 Jun 2026 17:34:24 +0000
Received: from mail-eastus2azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c110::3] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcnxx-00000009XLY-3hVg
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jun 2026 17:34:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wyjJ5k2LK0tVw4155ZPTz7uEa2L+EkhrLRPN2wS5Ejow7QB7hW7va5q6XFtgxZMIOwXQWDbKKeNiO1iz3ERZUmW+twtWw/kyUTDGNiRWq2tNYm/oQWF/WvS1b+avlSXBmNx/keW9r528CA6IZd+IqZMgj6fkX5yxGuf2on6THFVKi07PheL57tc9zTGGT3BcrxJv1is3vfd3f0ayh6NpQ3VDuyX5jnOpNJ34C2/F77AnHp7oZFFgz++RexOlvs1MkAtdgdE5bT3N3ZeN9FRn7Dyd0IeXs8sQZhouDz9Mo0ZOFEH42Ih9ny/xFIEHWjFvzfe4IcTkL5RhyhsrJciYGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OpRysDKYsu+meCnIUgK7fyxcW5k1rZeVIYgKTUfDxcI=;
 b=YyBF/yW+3pTcw9FUAt8vS3H93QnnUQNxxigoMs0IomnqXtpvUR5zTiCkGfTOasYO5Kp3VkT1ubzskcSdZuT8p86HOuK7565JElheKtf039jvWFt65JI9cwrXLdnejnffJg0Sh+6SFDa4aQJ7Mzk0/1wipf0ocaOkXSaWt+4Y/pFGZhzcdDa9VL71uN4mNouwQ00hwXm4CQIDw/h96mg/OuMbLtSkKVtCaajt9Xh6bwlSpEmyBEHPBCDVmdc5ocByDCVya9WQHB4mE750gIsAjrIzsA9n+hV6y2v8xcGHRwSZKWMsaixq++55r4MpSzzRQnTsAaI8auS62hA3q0ZdJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.86.86.210) smtp.rcpttodomain=cryptography.com smtp.mailfrom=rambus.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=rambus.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rambus.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OpRysDKYsu+meCnIUgK7fyxcW5k1rZeVIYgKTUfDxcI=;
 b=FWIhd40ngq/Q/neCl/biw3xvwJlYsnODPsxVeJSQQQ1712c7mcTQePcOBRqqEb5U5glZ5PpnxeES0U5zI6t13+0OYOYSLllCMNxmO5Q4Jm5FBKQkpYLYdhZcSNkX6yzLzOeG6qZeLUUk51KcAPdKZ9x7M1/VEnVQW6uFh8erHQWFrNMGFf5utB2BwXltBW61aXA2OI/6vD7rggvoM2d//Gc6o1OsMtmorCkO/KW5G2jL9fxZog+FaaOnElHHN1ED0yCWu5iwOX8CiL/CEAGH4anPa5H2B4sXjylEW+xSX9lewAq9lk+4JFy9fvFzCmxH2qN1Zomwjt6/ltBo3Xs3bw==
Received: from SA1PR02CA0018.namprd02.prod.outlook.com (2603:10b6:806:2cf::26)
 by CH2PR04MB7015.namprd04.prod.outlook.com (2603:10b6:610:95::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Thu, 25 Jun
 2026 17:34:07 +0000
Received: from SA2PEPF00003AE8.namprd02.prod.outlook.com
 (2603:10b6:806:2cf:cafe::7b) by SA1PR02CA0018.outlook.office365.com
 (2603:10b6:806:2cf::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.17 via Frontend Transport; Thu,
 25 Jun 2026 17:34:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.86.86.210)
 smtp.mailfrom=rambus.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=rambus.com;
Received-SPF: Pass (protection.outlook.com: domain of rambus.com designates
 192.86.86.210 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.86.86.210; helo=hqxsv-psmtppxy02.rambus.com; pr=C
Received: from hqxsv-psmtppxy02.rambus.com (192.86.86.210) by
 SA2PEPF00003AE8.mail.protection.outlook.com (10.167.248.8) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Thu, 25 Jun 2026 17:34:06 +0000
Received: from hqxsv-cmdev3-skrishnamoorthy.rambus.com (hqn-lb-int-float.rambus.com [10.12.20.20])
	by hqxsv-psmtppxy02.rambus.com (Postfix) with ESMTPS id 7A6D01801756;
	Thu, 25 Jun 2026 17:34:06 +0000 (UTC)
From: Saravanakrishnan Krishnamoorthy <skrishnamoorthy@rambus.com>
To: Albert Ou <aou@eecs.berkeley.edu>,
	Alex Ousherovitch <aousherovitch@rambus.com>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Jonathan Corbet <corbet@lwn.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravanakrishnan Krishnamoorthy <skrishnamoorthy@rambus.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org,
	Joel Wittenauer <Joel.Wittenauer@cryptography.com>,
	linux-api@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	sipsupport@rambus.com,
	Thi Nguyen <thin@rambus.com>
Subject: [PATCH 04/19] crypto: cmh - add SHA-2/SHA-3/SHAKE ahash
Date: Thu, 25 Jun 2026 10:33:12 -0700
Message-ID: <20260625173328.1140487-5-skrishnamoorthy@rambus.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260625173328.1140487-1-skrishnamoorthy@rambus.com>
References: <20260625173328.1140487-1-skrishnamoorthy@rambus.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE8:EE_|CH2PR04MB7015:EE_
X-MS-Office365-Filtering-Correlation-Id: bb8dee06-8953-4a03-6179-08ded2dff57f
X-LD-Processed: bd0ba799-c2b9-413c-9c56-5d1731c4827c,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|7416014|23010399003|1800799024|36860700016|921020|56012099006|11063799006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: 3HMmpm/QXxdUF8wseNbuAaYn2j8f9G1xF3rKMFm4Ug4EDpEwv7miXPh9CZTj26TUFIDjADmqjppzDY84358bamCmnZckUttykW5yYDhYtF4tnTH8TonU0UEpk0XJwddNojDhihoAW+bsmKzN2c1i8ESD5lrM+5dCD8Se/GoDRAm8s41dRqgfgXCSuVj2wzXNcNzu+RRqUcweLmQIsh+372paFpu2gq3DITCtpXtV42a3YV2dxWpVB9oKtjgwSN//fhUbuJiNc20pZxA3oUIj4qevkPEMwp0TvOPsA4f1PzFlb0+GSQMY3bphkrHRVakKo1SurN6RH3phsIFMMCplxJUWK6y4aZycvbBQCrGtuCM33LbFCWLTGqGvi7CpykJ8HKZ7YmCObKJpzkwNqOnz6yZtZuxDmVrhpc8XxiirrkxMlkCG2lFa3qXhmEAURZIS/fg5D2gbDfSspx7XB1nLTVfKh6s2Ry4Krao5LNHHQuNJqBmpTAPyAudJXjGNnk/hwQbuoFe7jO+ocs+9e/u5da89jDyQF48Kb826+dxHdeItT+9FXPeDeB8zz8mWKE08ULeS32Kptx6/GD/DSuSwsS2gPa6tzBP19aZ5hKOqlZb2WHqzgYbSmB4T1GDEOdWB1jZ7lkgrQDL9IUlzbRIsUwSWAHOMUwcSqzfz2W/v+3rpHuv5r1xRfwh7Qa/xSrrrShCkovCVerRzEUp9mhfqd/a2/x9tg1QyESDYn3gFeI//1UZyL1vGzWLbUft2L5yY
X-Forefront-Antispam-Report: CIP:192.86.86.210;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hqxsv-psmtppxy02.rambus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(23010399003)(1800799024)(36860700016)(921020)(56012099006)(11063799006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +9a7gdEBefYsdvVMbRkV1fgmaOcokA/c6dVEut5LrISgAAY+SVLDii07sdox3FezymzC68zSirSZXhNMNTlVreaY43tQfK7EYok5CoGCSAaXSCwQJYiKXIyB9lOXPCoGVHmGe1DuNq0i1B7XvnL4J9oTodqaist7deLqsfD3A8hQHZZZCXUvzTwrg880yDdqMxqxr8NxEZ0WfqF5W6L7LJHRmtAPrDcpS2kZdS8yMwhoLrWQhxDITflWhy6gJvyI14Le8DXCBgEQJqkY57IWP49HY1Q9bqeNkNd72ZqymgsDbiI4sTbhH3vzRIzqtnk42xKiHiz1dhXGJ78FPWaorg000Pb0prbRvlaMEdRSPWEqSipHV5JFtysj1/5uptgmmoE/fkvjEppv9dSoviAcJrunnJpEO2ld7BvsBHX4OwWKfwTzaX/7DAPkunop80W8
X-OriginatorOrg: rambus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 17:34:06.9798
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb8dee06-8953-4a03-6179-08ded2dff57f
X-MS-Exchange-CrossTenant-Id: bd0ba799-c2b9-413c-9c56-5d1731c4827c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bd0ba799-c2b9-413c-9c56-5d1731c4827c;Ip=[192.86.86.210];Helo=[hqxsv-psmtppxy02.rambus.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB7015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_103418_081007_940529A0 
X-CRM114-Status: GOOD (  19.87  )
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

From: Alex Ousherovitch <aousherovitch@rambus.com>

Register ahash algorithms for SHA-224, SHA-256, SHA-384, SHA-512,
SHA3-224, SHA3-256, SHA3-384, SHA3-512, SHAKE128, and SHAKE256
using the CMH hash core (core ID 0x02).

Supports incremental update/finup/final, init/export/import for
request cloning, and the CRYPTO_AHASH_REQ_VIRT flag for zero-copy
from virtual buffers.

Co-developed-by: Saravanakrishnan Krishnamoorthy <skrishnamoorthy@rambus.com>
Signed-off-by: Saravanakrishnan Krishnamoorthy <skrishnamoorthy@rambus.com>
Signed-off-by: Alex Ousherovitch <aousherovitch@rambus.com>
Reviewed-by: Joel Wittenauer <Joel.Wittenauer@cryptography.com>
Reviewed-by: Thi Nguyen <thin@rambus.com>
---
 drivers/crypto/cmh/Makefile           |   3 +-
 drivers/crypto/cmh/cmh_hash.c         | 860 ++++++++++++++++++++++++++
 drivers/crypto/cmh/cmh_main.c         |   9 +
 drivers/crypto/cmh/include/cmh_hash.h |  26 +
 4 files changed, 897 insertions(+), 1 deletion(-)
 create mode 100644 drivers/crypto/cmh/cmh_hash.c
 create mode 100644 drivers/crypto/cmh/include/cmh_hash.h

diff --git a/drivers/crypto/cmh/Makefile b/drivers/crypto/cmh/Makefile
index 1492e575598c..c0531f416229 100644
--- a/drivers/crypto/cmh/Makefile
+++ b/drivers/crypto/cmh/Makefile
@@ -14,7 +14,8 @@ cmh-y := \
        cmh_dma.o \
        cmh_sysfs.o \
        cmh_key.o \
-       cmh_sys.o
+       cmh_sys.o \
+       cmh_hash.o

 # Management ioctl device (/dev/cmh_mgmt): key lifecycle, PKE, PQC ioctls.
 cmh-$(CONFIG_CRYPTO_DEV_CMH_MGMT) += \
diff --git a/drivers/crypto/cmh/cmh_hash.c b/drivers/crypto/cmh/cmh_hash.c
new file mode 100644
index 000000000000..2256bf4314c3
--- /dev/null
+++ b/drivers/crypto/cmh/cmh_hash.c
@@ -0,0 +1,860 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 Cryptography Research, Inc. (CRI).
+ * CMH LKM -- Kernel Crypto API Hash Driver
+ *
+ * Registers asynchronous hash (ahash) algorithms with the Linux crypto
+ * subsystem.  Implements SHA-2 (224/256/384/512), SHA-3
+ * (224/256/384/512), and SHAKE (128/256) families using the CMH Hash
+ * Core (HC).
+ *
+ * Incremental HW update model -- each .update() with enough data for
+ * at least one full block submits a self-contained VCQ transaction:
+ *
+ *   .init()   -> software-only: zero per-request context
+ *   .update() -> buffer data in holdback; when >= block_size bytes:
+ *                INIT [+ RESTORE] + UPDATE(full blocks) + SAVE + FLUSH
+ *                -> return -EINPROGRESS  (else return 0, data in holdback)
+ *   .final()  -> INIT [+ RESTORE] [+ UPDATE(residual)] + FINAL + FLUSH
+ *   .finup()  -> linearise holdback + new data, then final path
+ *   .digest() -> INIT + UPDATE + FINAL + FLUSH (single-shot, zero-copy)
+ *   .export() -> software-only: copy checkpoint + holdback to out
+ *   .import() -> software-only: restore checkpoint + holdback from in
+ *
+ * The FLUSH after each .update() releases the HC core, so no lockout.
+ * Two hash sessions interleave fine on the same MBX -- each saves its
+ * own state via SAVE and restores via RESTORE on the next call.
+ *
+ * Export/import is purely software (no HW interaction), enabling
+ * crypto API transform clone for all plain-hash algorithms.
+ */
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/crypto.h>
+#include <crypto/internal/hash.h>
+#include <crypto/scatterwalk.h>
+#include <linux/scatterlist.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+
+#include "cmh_hash.h"
+#include "cmh_vcq.h"
+#include "cmh_txn.h"
+#include "cmh_dma.h"
+
+/* Algorithm Table */
+
+struct cmh_hash_alg_info {
+       u32         hc_algo;        /* HC_ALGO_* (SHA2, SHA3, SHAKE) */
+       u32         digest_size;    /* bytes */
+       u32         block_size;     /* cra_blocksize for Linux crypto API */
+       const char *alg_name;       /* Linux crypto name: "sha256" */
+       const char *drv_name;       /* driver name: "cri-cmh-sha256" */
+};
+
+static const struct cmh_hash_alg_info cmh_hash_algs_info[] = {
+       /* SHA-2 family */
+       {
+               .hc_algo     = HC_ALGO_SHA2_224,
+               .digest_size = CMH_SHA224_DIGEST_SIZE,
+               .block_size  = 64,
+               .alg_name    = "sha224",
+               .drv_name    = "cri-cmh-sha224",
+       },
+       {
+               .hc_algo     = HC_ALGO_SHA2_256,
+               .digest_size = CMH_SHA256_DIGEST_SIZE,
+               .block_size  = 64,
+               .alg_name    = "sha256",
+               .drv_name    = "cri-cmh-sha256",
+       },
+       {
+               .hc_algo     = HC_ALGO_SHA2_384,
+               .digest_size = CMH_SHA384_DIGEST_SIZE,
+               .block_size  = 128,
+               .alg_name    = "sha384",
+               .drv_name    = "cri-cmh-sha384",
+       },
+       {
+               .hc_algo     = HC_ALGO_SHA2_512,
+               .digest_size = CMH_SHA512_DIGEST_SIZE,
+               .block_size  = 128,
+               .alg_name    = "sha512",
+               .drv_name    = "cri-cmh-sha512",
+       },
+       /* SHA-3 family */
+       {
+               .hc_algo     = HC_ALGO_SHA3_224,
+               .digest_size = CMH_SHA3_224_DIGEST_SIZE,
+               .block_size  = 144,  /* rate = 1600/8 - 2*224/8 = 144 */
+               .alg_name    = "sha3-224",
+               .drv_name    = "cri-cmh-sha3-224",
+       },
+       {
+               .hc_algo     = HC_ALGO_SHA3_256,
+               .digest_size = CMH_SHA3_256_DIGEST_SIZE,
+               .block_size  = 136,  /* rate = 1600/8 - 2*256/8 = 136 */
+               .alg_name    = "sha3-256",
+               .drv_name    = "cri-cmh-sha3-256",
+       },
+       {
+               .hc_algo     = HC_ALGO_SHA3_384,
+               .digest_size = CMH_SHA3_384_DIGEST_SIZE,
+               .block_size  = 104,  /* rate = 1600/8 - 2*384/8 = 104 */
+               .alg_name    = "sha3-384",
+               .drv_name    = "cri-cmh-sha3-384",
+       },
+       {
+               .hc_algo     = HC_ALGO_SHA3_512,
+               .digest_size = CMH_SHA3_512_DIGEST_SIZE,
+               .block_size  = 72,   /* rate = 1600/8 - 2*512/8 = 72 */
+               .alg_name    = "sha3-512",
+               .drv_name    = "cri-cmh-sha3-512",
+       },
+       /*
+        * SHAKE (XOF) family -- fixed-output ahash registration.
+        *
+        * cra_blocksize = 1: SHAKE is a sponge/XOF, not Merkle-Damgaard.
+        * The Keccak rate (168 for SHAKE-128, 136 for SHAKE-256) exceeds
+        * MAX_ALGAPI_BLOCKSIZE (160) on Linux <=6.7.  Using 1 signals
+        * "byte-oriented" which is correct for XOF consumers.  The kernel
+        * raised the limit to 208 in 6.8 (commit 2f3a22704889).
+        */
+       {
+               .hc_algo     = HC_ALGO_SHAKE128,
+               .digest_size = CMH_SHAKE128_DIGEST_SIZE,
+               .block_size  = 1,    /* XOF: no meaningful block for crypto API */
+               .alg_name    = "shake128",
+               .drv_name    = "cri-cmh-shake128",
+       },
+       {
+               .hc_algo     = HC_ALGO_SHAKE256,
+               .digest_size = CMH_SHAKE256_DIGEST_SIZE,
+               .block_size  = 1,    /* XOF: no meaningful block for crypto API */
+               .alg_name    = "shake256",
+               .drv_name    = "cri-cmh-shake256",
+       },
+};
+
+#define CMH_HASH_ALG_COUNT  ARRAY_SIZE(cmh_hash_algs_info)
+
+/* Per-Request State */
+
+/* Maximum cra_blocksize across all registered algorithms (SHA3-224) */
+#define CMH_HASH_MAX_BLOCK     144
+
+/*
+ * Exported hash state -- serialised by .export(), deserialised by
+ * .import().  This is what statesize advertises to the crypto subsystem.
+ */
+struct cmh_hash_export_state {
+       u8  checkpoint[HC_CONTEXT_SIZE]; /* HC context from last SAVE */
+       u8  buf[CMH_HASH_MAX_BLOCK];    /* holdback buffer */
+       u32 buf_len;                     /* valid bytes in buf[] */
+       u32 hw_started;                  /* non-zero if checkpoint valid */
+};
+
+/*
+ * Maximum payload commands any hash transaction can produce:
+ *   INIT + RESTORE + UPDATE + SAVE/FINAL + FLUSH = 5
+ * Worst-case packed output (stride=7, 1 payload per VCQ):
+ *   5 VCQs x 2 entries = 10
+ */
+#define CMH_HASH_MAX_PAYLOAD    5
+#define CMH_HASH_MAX_PACKED     (CMH_HASH_MAX_PAYLOAD * 2)
+
+/*
+ * Stored in ahash_request_ctx().  Tracks the algorithm, a holdback
+ * buffer for partial blocks, an HC context checkpoint from the last
+ * SAVE, and DMA state for the current in-flight async operation.
+ *
+ * The checkpoint is embedded inline rather than heap-allocated because
+ * the kernel ahash API has no per-request destructor.  If a request is
+ * abandoned without .final() (e.g. transform freed early), a heap
+ * checkpoint would leak unconditionally.
+ */
+struct cmh_hash_reqctx {
+       const struct cmh_hash_alg_info *info;
+       int    error;
+       u32    hw_started;      /* non-zero after first HW submission */
+       u32    buf_len;         /* bytes in holdback buf[] */
+       u32    has_checkpoint;  /* non-zero if checkpoint[] valid */
+       /* DMA state for current async operation */
+       dma_addr_t ckpt_dma;   /* RESTORE input */
+       dma_addr_t save_dma;   /* SAVE output (update only) */
+       dma_addr_t data_dma;   /* UPDATE input */
+       dma_addr_t digest_dma; /* FINAL output (final/digest only) */
+       u8    *save_buf;       /* SAVE output buffer */
+       u8    *data_buf;       /* linearised data for DMA */
+       u32    data_len;       /* bytes in data_buf */
+       u8    *digest_buf;     /* digest output buffer */
+       u8     buf[CMH_HASH_MAX_BLOCK]; /* holdback for partial block */
+       u8     checkpoint[HC_CONTEXT_SIZE]; /* HC context from last SAVE */
+       struct vcq_cmd packed[CMH_HASH_MAX_PACKED];
+};
+
+/* VCQ Builders (HC-specific; shared builders in cmh_hc_abi.h / cmh_vcq.h) */
+
+/* Add an HC_CMD_UPDATE entry */
+static void vcq_add_hc_update(struct vcq_cmd *slot, u32 core_id, u64 input_phys, u32 len)
+{
+       memset(slot, 0, sizeof(*slot));
+       slot->magic = VCQ_CMD_MAGIC;
+       slot->id = VCQ_CMD_ID(core_id, 0, 1, HC_CMD_UPDATE);
+       slot->hwc.hc.cmd_update.input = input_phys;
+       slot->hwc.hc.cmd_update.inlen = len;
+}
+
+/* Add an HC_CMD_SAVE entry */
+static void vcq_add_hc_save(struct vcq_cmd *slot, u32 core_id, u64 output_phys, u32 outlen)
+{
+       memset(slot, 0, sizeof(*slot));
+       slot->magic = VCQ_CMD_MAGIC;
+       slot->id = VCQ_CMD_ID(core_id, 0, 1, HC_CMD_SAVE);
+       slot->hwc.hc.cmd_save.output = output_phys;
+       slot->hwc.hc.cmd_save.outlen = outlen;
+}
+
+/* Add an HC_CMD_RESTORE entry */
+static void vcq_add_hc_restore(struct vcq_cmd *slot, u32 core_id, u64 input_phys, u32 inlen)
+{
+       memset(slot, 0, sizeof(*slot));
+       slot->magic = VCQ_CMD_MAGIC;
+       slot->id = VCQ_CMD_ID(core_id, 0, 1, HC_CMD_RESTORE);
+       slot->hwc.hc.cmd_restore.input = input_phys;
+       slot->hwc.hc.cmd_restore.inlen = inlen;
+}
+
+/* Request Context Cleanup */
+
+static void cmh_hash_free_reqctx(struct cmh_hash_reqctx *rctx)
+{
+       rctx->has_checkpoint = 0;
+}
+
+/* VCQ Packing + Submit */
+
+/* ahash Operations */
+
+/*
+ * Wrapper struct: embeds ahash_alg + a pointer to our alg_info table
+ * entry so we can recover it in the tfm callbacks.
+ */
+struct cmh_hash_alg_drv {
+       struct ahash_alg                 alg;
+       const struct cmh_hash_alg_info  *info;
+};
+
+/*
+ * Find the cmh_hash_alg_info from the crypto_ahash (embedded in our
+ * registered template).  We stash the info pointer in the algorithm's
+ * driver-private area at registration time (see cmh_hash_register).
+ */
+static const struct cmh_hash_alg_info *
+cmh_hash_get_info(struct crypto_ahash *tfm)
+{
+       struct ahash_alg *alg = crypto_ahash_alg(tfm);
+
+       return container_of(alg, struct cmh_hash_alg_drv, alg)->info;
+}
+
+static int cmh_hash_init(struct ahash_request *req)
+{
+       struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
+       struct cmh_hash_reqctx *rctx = ahash_request_ctx(req);
+
+       memset(rctx, 0, sizeof(*rctx));
+       rctx->info = cmh_hash_get_info(tfm);
+       return 0;
+}
+
+/*
+ * Update completion -- called from threaded IRQ after SAVE completes.
+ * Takes ownership of save_buf as the new checkpoint.
+ */
+static void cmh_hash_update_complete(void *data, int error)
+{
+       struct ahash_request *req = data;
+       struct cmh_hash_reqctx *rctx = ahash_request_ctx(req);
+
+       if (error == -EINPROGRESS) {
+               cmh_complete(&req->base, error);
+               return;
+       }
+
+       /* Unmap DMA buffers */
+       if (rctx->has_checkpoint)
+               cmh_dma_unmap_single(rctx->ckpt_dma, HC_CONTEXT_SIZE,
+                                    DMA_TO_DEVICE);
+       cmh_dma_unmap_single(rctx->save_dma, HC_CONTEXT_SIZE,
+                            DMA_FROM_DEVICE);
+       cmh_dma_unmap_single(rctx->data_dma, rctx->data_len,
+                            DMA_TO_DEVICE);
+
+       if (!error) {
+               memcpy(rctx->checkpoint, rctx->save_buf, HC_CONTEXT_SIZE);
+               rctx->has_checkpoint = 1;
+               kfree(rctx->save_buf);
+               rctx->save_buf = NULL;
+               rctx->hw_started = 1;
+       } else {
+               kfree(rctx->save_buf);
+               rctx->save_buf = NULL;
+               rctx->error = error;
+       }
+
+       kfree(rctx->data_buf);
+       rctx->data_buf = NULL;
+       rctx->data_len = 0;
+
+       cmh_complete(&req->base, error);
+}
+
+/*
+ * .update -- buffer incoming data, submit full blocks to HW.
+ *
+ * Maintains a partial-block holdback buffer in rctx->buf[].  When
+ * enough data is available for at least one full block, the full
+ * blocks are linearised and submitted as:
+ *   INIT [+ RESTORE] + UPDATE(full_blocks) + SAVE + FLUSH
+ *
+ * The tail (< block_size) stays in the holdback for the next call.
+ * Returns -EINPROGRESS on HW submission, 0 if only buffering.
+ */
+static int cmh_hash_update(struct ahash_request *req)
+{
+       struct cmh_hash_reqctx *rctx = ahash_request_ctx(req);
+       const struct cmh_hash_alg_info *info = rctx->info;
+       struct vcq_cmd cmds[CMH_HASH_MAX_PAYLOAD];
+       struct core_dispatch d;
+       u32 block_size = info->block_size;
+       u32 total_avail, full_len, tail_len, from_src;
+       u32 idx;
+       int ret;
+       gfp_t gfp;
+
+       if (rctx->error)
+               return rctx->error;
+
+       if (!req->nbytes)
+               return 0;
+
+       gfp = req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP ?
+             GFP_KERNEL : GFP_ATOMIC;
+
+       total_avail = rctx->buf_len + req->nbytes;
+
+       /* Not enough for a full block -- just buffer */
+       if (total_avail < block_size) {
+               if (req->base.flags & CRYPTO_AHASH_REQ_VIRT)
+                       memcpy(rctx->buf + rctx->buf_len,
+                              req->svirt, req->nbytes);
+               else
+                       scatterwalk_map_and_copy(rctx->buf + rctx->buf_len,
+                                                req->src, 0,
+                                                req->nbytes, 0);
+               rctx->buf_len = total_avail;
+               return 0;
+       }
+
+       /* Have at least one full block -- submit to HW */
+       full_len = total_avail - total_avail % block_size;
+       tail_len = total_avail - full_len;
+       from_src = full_len - rctx->buf_len;
+
+       /* Linearise: holdback prefix + full blocks from scatterlist */
+       rctx->data_buf = kmalloc(full_len, gfp);
+       if (!rctx->data_buf)
+               return -ENOMEM;
+
+       if (rctx->buf_len > 0)
+               memcpy(rctx->data_buf, rctx->buf, rctx->buf_len);
+
+       if (from_src > 0) {
+               if (req->base.flags & CRYPTO_AHASH_REQ_VIRT)
+                       memcpy(rctx->data_buf + rctx->buf_len,
+                              req->svirt, from_src);
+               else
+                       scatterwalk_map_and_copy(rctx->data_buf + rctx->buf_len,
+                                                req->src, 0,
+                                                from_src, 0);
+       }
+
+       /* Move tail to holdback */
+       if (tail_len > 0) {
+               if (req->base.flags & CRYPTO_AHASH_REQ_VIRT)
+                       memcpy(rctx->buf, req->svirt + from_src,
+                              tail_len);
+               else
+                       scatterwalk_map_and_copy(rctx->buf, req->src,
+                                                from_src, tail_len,
+                                                0);
+       }
+       rctx->buf_len = tail_len;
+       rctx->data_len = full_len;
+
+       /* Allocate SAVE output buffer */
+       rctx->save_buf = kzalloc(HC_CONTEXT_SIZE, gfp);
+       if (!rctx->save_buf) {
+               ret = -ENOMEM;
+               goto err_free;
+       }
+
+       /* DMA map data, save output, and checkpoint */
+       rctx->data_dma = cmh_dma_map_single(rctx->data_buf, full_len,
+                                           DMA_TO_DEVICE);
+       if (cmh_dma_map_error(rctx->data_dma)) {
+               ret = -ENOMEM;
+               goto err_free;
+       }
+
+       rctx->save_dma = cmh_dma_map_single(rctx->save_buf, HC_CONTEXT_SIZE,
+                                           DMA_FROM_DEVICE);
+       if (cmh_dma_map_error(rctx->save_dma)) {
+               ret = -ENOMEM;
+               goto err_unmap_data;
+       }
+
+       rctx->ckpt_dma = DMA_MAPPING_ERROR;
+       if (rctx->has_checkpoint) {
+               rctx->ckpt_dma = cmh_dma_map_single(rctx->checkpoint,
+                                                   HC_CONTEXT_SIZE,
+                                                    DMA_TO_DEVICE);
+               if (cmh_dma_map_error(rctx->ckpt_dma)) {
+                       ret = -ENOMEM;
+                       goto err_unmap_save;
+               }
+       }
+
+       /* Build VCQ: INIT [+ RESTORE] + UPDATE + SAVE + FLUSH */
+       d = cmh_core_select_instance(CMH_CORE_HC);
+       idx = 0;
+
+       vcq_add_hc_init(&cmds[idx++], d.core_id, info->hc_algo);
+
+       if (rctx->has_checkpoint)
+               vcq_add_hc_restore(&cmds[idx++], d.core_id,
+                                  (u64)rctx->ckpt_dma, HC_CONTEXT_SIZE);
+
+       vcq_add_hc_update(&cmds[idx++], d.core_id,
+                         (u64)rctx->data_dma, full_len);
+
+       vcq_add_hc_save(&cmds[idx++], d.core_id,
+                       (u64)rctx->save_dma, HC_CONTEXT_SIZE);
+
+       vcq_add_flush(&cmds[idx++], d.core_id);
+
+       ret = cmh_vcq_pack_and_submit_async(cmds, idx, rctx->packed,
+                                           CMH_HASH_MAX_PACKED,
+                                           d.mbx_idx,
+                                           cmh_hash_update_complete, req,
+                                           !!(req->base.flags &
+                                              CRYPTO_TFM_REQ_MAY_BACKLOG),
+                                           cmh_tm_async_timeout_jiffies());
+       if (ret == -EBUSY)
+               return -EBUSY;
+       if (ret)
+               goto err_unmap_ckpt;
+
+       return -EINPROGRESS;
+
+err_unmap_ckpt:
+       if (rctx->has_checkpoint)
+               cmh_dma_unmap_single(rctx->ckpt_dma, HC_CONTEXT_SIZE,
+                                    DMA_TO_DEVICE);
+err_unmap_save:
+       cmh_dma_unmap_single(rctx->save_dma, HC_CONTEXT_SIZE,
+                            DMA_FROM_DEVICE);
+err_unmap_data:
+       cmh_dma_unmap_single(rctx->data_dma, full_len, DMA_TO_DEVICE);
+err_free:
+       kfree(rctx->save_buf);
+       rctx->save_buf = NULL;
+       kfree(rctx->data_buf);
+       rctx->data_buf = NULL;
+       rctx->data_len = 0;
+       return ret;
+}
+
+/*
+ * Final completion -- unmap all DMA, copy digest, signal done.
+ */
+static void cmh_hash_final_complete(void *data, int error)
+{
+       struct ahash_request *req = data;
+       struct cmh_hash_reqctx *rctx = ahash_request_ctx(req);
+
+       if (error == -EINPROGRESS) {
+               cmh_complete(&req->base, error);
+               return;
+       }
+
+       if (rctx->has_checkpoint)
+               cmh_dma_unmap_single(rctx->ckpt_dma, HC_CONTEXT_SIZE,
+                                    DMA_TO_DEVICE);
+       if (rctx->data_buf)
+               cmh_dma_unmap_single(rctx->data_dma, rctx->data_len,
+                                    DMA_TO_DEVICE);
+       cmh_dma_unmap_single(rctx->digest_dma, rctx->info->digest_size,
+                            DMA_FROM_DEVICE);
+
+       if (!error)
+               memcpy(req->result, rctx->digest_buf,
+                      rctx->info->digest_size);
+
+       kfree(rctx->digest_buf);
+       rctx->digest_buf = NULL;
+       kfree(rctx->data_buf);
+       rctx->data_buf = NULL;
+       cmh_hash_free_reqctx(rctx);
+       cmh_complete(&req->base, error);
+}
+
+/*
+ * Submit the final VCQ transaction:
+ *   INIT [+ RESTORE] [+ UPDATE(residual)] + FINAL + FLUSH
+ *
+ * @data_buf: linearised residual data, or NULL for empty-hash.
+ *            Ownership transferred -- callback frees it.
+ * @data_len: bytes in data_buf.
+ */
+static int cmh_hash_submit_final(struct ahash_request *req,
+                                u8 *data_buf, u32 data_len)
+{
+       struct cmh_hash_reqctx *rctx = ahash_request_ctx(req);
+       const struct cmh_hash_alg_info *info = rctx->info;
+       struct vcq_cmd cmds[CMH_HASH_MAX_PAYLOAD];
+       struct core_dispatch d;
+       u32 idx;
+       int ret;
+       gfp_t gfp = req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP ?
+                  GFP_KERNEL : GFP_ATOMIC;
+
+       rctx->data_buf = data_buf;
+       rctx->data_len = data_len;
+
+       /* Allocate digest output buffer */
+       rctx->digest_buf = kzalloc(info->digest_size, gfp);
+       if (!rctx->digest_buf) {
+               ret = -ENOMEM;
+               goto err_free_data;
+       }
+
+       rctx->digest_dma = cmh_dma_map_single(rctx->digest_buf,
+                                             info->digest_size,
+                                              DMA_FROM_DEVICE);
+       if (cmh_dma_map_error(rctx->digest_dma)) {
+               ret = -ENOMEM;
+               goto err_free_digest;
+       }
+
+       /* Map residual data for UPDATE */
+       rctx->data_dma = DMA_MAPPING_ERROR;
+       if (data_buf && data_len > 0) {
+               rctx->data_dma = cmh_dma_map_single(data_buf, data_len,
+                                                   DMA_TO_DEVICE);
+               if (cmh_dma_map_error(rctx->data_dma)) {
+                       ret = -ENOMEM;
+                       goto err_unmap_digest;
+               }
+       }
+
+       /* Map checkpoint for RESTORE */
+       rctx->ckpt_dma = DMA_MAPPING_ERROR;
+       if (rctx->has_checkpoint) {
+               rctx->ckpt_dma = cmh_dma_map_single(rctx->checkpoint,
+                                                   HC_CONTEXT_SIZE,
+                                                    DMA_TO_DEVICE);
+               if (cmh_dma_map_error(rctx->ckpt_dma)) {
+                       ret = -ENOMEM;
+                       goto err_unmap_data;
+               }
+       }
+
+       /* Build VCQ: INIT [+ RESTORE] [+ UPDATE] + FINAL + FLUSH */
+       d = cmh_core_select_instance(CMH_CORE_HC);
+       idx = 0;
+
+       vcq_add_hc_init(&cmds[idx++], d.core_id, info->hc_algo);
+
+       if (rctx->has_checkpoint)
+               vcq_add_hc_restore(&cmds[idx++], d.core_id,
+                                  (u64)rctx->ckpt_dma, HC_CONTEXT_SIZE);
+
+       if (data_buf && data_len > 0)
+               vcq_add_hc_update(&cmds[idx++], d.core_id,
+                                 (u64)rctx->data_dma, data_len);
+
+       vcq_add_hc_final(&cmds[idx++], d.core_id,
+                        (u64)rctx->digest_dma, info->digest_size);
+
+       vcq_add_flush(&cmds[idx++], d.core_id);
+
+       ret = cmh_vcq_pack_and_submit_async(cmds, idx, rctx->packed,
+                                           CMH_HASH_MAX_PACKED,
+                                           d.mbx_idx,
+                                           cmh_hash_final_complete, req,
+                                           !!(req->base.flags &
+                                              CRYPTO_TFM_REQ_MAY_BACKLOG),
+                                           cmh_tm_async_timeout_jiffies());
+       if (ret == -EBUSY)
+               return -EBUSY;
+       if (ret)
+               goto err_unmap_ckpt;
+
+       return -EINPROGRESS;
+
+err_unmap_ckpt:
+       if (rctx->has_checkpoint)
+               cmh_dma_unmap_single(rctx->ckpt_dma, HC_CONTEXT_SIZE,
+                                    DMA_TO_DEVICE);
+err_unmap_data:
+       if (data_buf && data_len > 0)
+               cmh_dma_unmap_single(rctx->data_dma, data_len,
+                                    DMA_TO_DEVICE);
+err_unmap_digest:
+       cmh_dma_unmap_single(rctx->digest_dma, info->digest_size,
+                            DMA_FROM_DEVICE);
+err_free_digest:
+       kfree(rctx->digest_buf);
+       rctx->digest_buf = NULL;
+err_free_data:
+       kfree(data_buf);
+       rctx->data_buf = NULL;
+       cmh_hash_free_reqctx(rctx);
+       return ret;
+}
+
+static int cmh_hash_final(struct ahash_request *req)
+{
+       struct cmh_hash_reqctx *rctx = ahash_request_ctx(req);
+       u8 *data_buf = NULL;
+       u32 data_len = 0;
+       gfp_t gfp;
+
+       if (rctx->error)
+               return rctx->error;
+
+       if (rctx->buf_len > 0) {
+               gfp = req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP ?
+                     GFP_KERNEL : GFP_ATOMIC;
+               data_buf = kmalloc(rctx->buf_len, gfp);
+               if (!data_buf)
+                       return -ENOMEM;
+               memcpy(data_buf, rctx->buf, rctx->buf_len);
+               data_len = rctx->buf_len;
+               rctx->buf_len = 0;
+       }
+
+       return cmh_hash_submit_final(req, data_buf, data_len);
+}
+
+static int cmh_hash_finup(struct ahash_request *req);
+
+/*
+ * One-shot digest -- delegates to init + finup so that all data is
+ * linearised and mapped through cmh_dma_map_single(), which is the
+ * only DMA mapping path aware of all supported DMA backends.
+ */
+static int cmh_hash_digest(struct ahash_request *req)
+{
+       int ret;
+
+       ret = cmh_hash_init(req);
+       if (ret)
+               return ret;
+       return cmh_hash_finup(req);
+}
+
+/*
+ * .finup -- update + final combined into a single transaction.
+ *
+ * Linearises the holdback buffer + new data and submits everything
+ * through the final path.  Avoids the kernel's ahash_def_finup()
+ * which would allocate a subrequest and clone via export/import.
+ */
+static int cmh_hash_finup(struct ahash_request *req)
+{
+       struct cmh_hash_reqctx *rctx = ahash_request_ctx(req);
+       u32 data_len;
+       u8 *data_buf;
+       gfp_t gfp;
+
+       if (rctx->error)
+               return rctx->error;
+
+       data_len = rctx->buf_len + req->nbytes;
+
+       if (data_len == 0)
+               return cmh_hash_submit_final(req, NULL, 0);
+
+       gfp = req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP ?
+             GFP_KERNEL : GFP_ATOMIC;
+
+       data_buf = kmalloc(data_len, gfp);
+       if (!data_buf)
+               return -ENOMEM;
+
+       if (rctx->buf_len > 0)
+               memcpy(data_buf, rctx->buf, rctx->buf_len);
+
+       if (req->nbytes > 0) {
+               if (req->base.flags & CRYPTO_AHASH_REQ_VIRT)
+                       memcpy(data_buf + rctx->buf_len,
+                              req->svirt, req->nbytes);
+               else
+                       scatterwalk_map_and_copy(data_buf + rctx->buf_len,
+                                                req->src, 0,
+                                                req->nbytes, 0);
+       }
+
+       rctx->buf_len = 0;
+       return cmh_hash_submit_final(req, data_buf, data_len);
+}
+
+/*
+ * Export -- purely software.
+ *
+ * Serialise the HC checkpoint (if any) and holdback buffer into the
+ * export state structure.  No HW interaction needed because the
+ * incremental model keeps checkpoint up-to-date after each .update().
+ */
+static int cmh_hash_export(struct ahash_request *req, void *out)
+{
+       struct cmh_hash_reqctx *rctx = ahash_request_ctx(req);
+       struct cmh_hash_export_state *state = out;
+
+       if (rctx->hw_started && rctx->has_checkpoint)
+               memcpy(state->checkpoint, rctx->checkpoint, HC_CONTEXT_SIZE);
+       else
+               memset(state->checkpoint, 0, HC_CONTEXT_SIZE);
+
+       if (rctx->buf_len > 0)
+               memcpy(state->buf, rctx->buf, rctx->buf_len);
+
+       state->buf_len = rctx->buf_len;
+       state->hw_started = rctx->hw_started;
+
+       return 0;
+}
+
+/*
+ * Import -- purely software.
+ *
+ * Restore checkpoint and holdback from a previously exported state.
+ * The next .update() or .final() will RESTORE the checkpoint into HW.
+ */
+static int cmh_hash_import(struct ahash_request *req, const void *in)
+{
+       struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
+       struct cmh_hash_reqctx *rctx = ahash_request_ctx(req);
+       const struct cmh_hash_export_state *state = in;
+
+       memset(rctx, 0, sizeof(*rctx));
+       rctx->info = cmh_hash_get_info(tfm);
+
+       if (state->buf_len > CMH_HASH_MAX_BLOCK)
+               return -EINVAL;
+
+       rctx->hw_started = state->hw_started;
+       rctx->buf_len = state->buf_len;
+       memcpy(rctx->buf, state->buf, state->buf_len);
+
+       if (state->hw_started) {
+               memcpy(rctx->checkpoint, state->checkpoint, HC_CONTEXT_SIZE);
+               rctx->has_checkpoint = 1;
+       }
+
+       return 0;
+}
+
+/* Transform init (cra_init) -- set per-request context size */
+
+static int cmh_hash_cra_init(struct crypto_tfm *tfm)
+{
+       crypto_ahash_set_reqsize(__crypto_ahash_cast(tfm),
+                                sizeof(struct cmh_hash_reqctx));
+       return 0;
+}
+
+/* Registration */
+
+static struct cmh_hash_alg_drv cmh_hash_drvs[CMH_HASH_ALG_COUNT];
+
+/**
+ * cmh_hash_register() - Register SHA-256/384/512/3-256/3-384/3-512 hash algorithms
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+int cmh_hash_register(void)
+{
+       unsigned int i;
+       int ret;
+
+       for (i = 0; i < CMH_HASH_ALG_COUNT; i++) {
+               const struct cmh_hash_alg_info *info = &cmh_hash_algs_info[i];
+               struct cmh_hash_alg_drv *drv = &cmh_hash_drvs[i];
+               struct ahash_alg *alg = &drv->alg;
+
+               drv->info = info;
+
+               alg->init   = cmh_hash_init;
+               alg->update = cmh_hash_update;
+               alg->final  = cmh_hash_final;
+               alg->finup  = cmh_hash_finup;
+               alg->digest = cmh_hash_digest;
+               alg->export = cmh_hash_export;
+               alg->import = cmh_hash_import;
+
+               alg->halg.digestsize = info->digest_size;
+               alg->halg.statesize  = sizeof(struct cmh_hash_export_state);
+
+               strscpy(alg->halg.base.cra_name, info->alg_name,
+                       CRYPTO_MAX_ALG_NAME);
+               strscpy(alg->halg.base.cra_driver_name, info->drv_name,
+                       CRYPTO_MAX_ALG_NAME);
+               alg->halg.base.cra_priority    = 300;
+               alg->halg.base.cra_flags       = CRYPTO_ALG_KERN_DRIVER_ONLY |
+                                                CRYPTO_ALG_NO_FALLBACK |
+                                                CRYPTO_ALG_ASYNC |
+                                                CRYPTO_ALG_REQ_VIRT;
+               alg->halg.base.cra_blocksize   = info->block_size;
+               alg->halg.base.cra_ctxsize     = 0;
+               alg->halg.base.cra_init        = cmh_hash_cra_init;
+               alg->halg.base.cra_module      = THIS_MODULE;
+
+               ret = crypto_register_ahash(alg);
+               if (ret) {
+                       dev_err(cmh_dev(), "hash: failed to register %s (rc=%d)\n",
+                               info->drv_name, ret);
+                       /* Unregister any already-registered algorithms */
+                       while (i--)
+                               crypto_unregister_ahash(&cmh_hash_drvs[i].alg);
+                       return ret;
+               }
+
+               dev_dbg(cmh_dev(), "hash: registered %s (priority 300)\n",
+                       info->drv_name);
+       }
+
+       dev_info(cmh_dev(), "hash: %zu algorithm(s) registered\n",
+                CMH_HASH_ALG_COUNT);
+       return 0;
+}
+
+/**
+ * cmh_hash_unregister() - Unregister SHA hash algorithms from the crypto framework
+ */
+void cmh_hash_unregister(void)
+{
+       unsigned int i;
+
+       for (i = 0; i < CMH_HASH_ALG_COUNT; i++) {
+               crypto_unregister_ahash(&cmh_hash_drvs[i].alg);
+               dev_dbg(cmh_dev(), "hash: unregistered %s\n",
+                       cmh_hash_algs_info[i].drv_name);
+       }
+
+       dev_info(cmh_dev(), "hash: cleaned up\n");
+}
diff --git a/drivers/crypto/cmh/cmh_main.c b/drivers/crypto/cmh/cmh_main.c
index 307bd7dd304b..e8e30b893932 100644
--- a/drivers/crypto/cmh/cmh_main.c
+++ b/drivers/crypto/cmh/cmh_main.c
@@ -29,6 +29,7 @@
 #include "cmh_mqi.h"
 #include "cmh_txn.h"
 #include "cmh_rh.h"
+#include "cmh_hash.h"
 #include "cmh_mgmt.h"
 #include "cmh_registers.h"
 #include "cmh_debugfs.h"
@@ -191,6 +192,11 @@ static int cmh_probe(struct platform_device *pdev)
        if (ret)
                goto err_rh_init;

+       /* Register hash algorithms with the kernel crypto API */
+       ret = cmh_hash_register();
+       if (ret)
+               goto err_hash_register;
+
        /* Register key management device (/dev/cmh_mgmt) */
        ret = cmh_mgmt_register();
        if (ret)
@@ -203,6 +209,8 @@ static int cmh_probe(struct platform_device *pdev)
        return 0;

 err_mgmt_register:
+       cmh_hash_unregister();
+err_hash_register:
        cmh_rh_cleanup(cfg);
 err_rh_init:
        cmh_tm_cleanup();
@@ -229,6 +237,7 @@ static void cmh_remove(struct platform_device *pdev)
        cfg = &dev->config;

        cmh_mgmt_unregister();
+       cmh_hash_unregister();
        cmh_rh_cleanup(cfg);
        cmh_tm_cleanup();
        cmh_mqi_cleanup(cfg);
diff --git a/drivers/crypto/cmh/include/cmh_hash.h b/drivers/crypto/cmh/include/cmh_hash.h
new file mode 100644
index 000000000000..bf17d3af7787
--- /dev/null
+++ b/drivers/crypto/cmh/include/cmh_hash.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026 Cryptography Research, Inc. (CRI).
+ * CMH LKM -- Kernel Crypto API Hash Driver
+ *
+ * Registers ahash algorithms (SHA-2, SHA-3, and SHAKE families) with the
+ * Linux crypto subsystem.  Uses an incremental HW update model:
+ *
+ *   .init()   -> software-only: zero per-request context
+ *   .update() -> holdback partial blocks; submit full blocks via
+ *                INIT [+ RESTORE] + UPDATE + SAVE + FLUSH
+ *   .final()  -> INIT [+ RESTORE] [+ UPDATE(residual)] + FINAL + FLUSH
+ *   .digest() -> INIT + UPDATE + FINAL + FLUSH (single-shot)
+ *   .export() -> software-only: copy checkpoint + holdback
+ *   .import() -> software-only: restore checkpoint + holdback
+ */
+
+#ifndef CMH_HASH_H
+#define CMH_HASH_H
+
+#include "cmh_config.h"
+
+int  cmh_hash_register(void);
+void cmh_hash_unregister(void);
+
+#endif /* CMH_HASH_H */
--
2.43.7


** This message and any attachments are for the sole use of the intended recipient(s). It may contain information that is confidential and privileged. If you are not the intended recipient of this message, you are prohibited from printing, copying, forwarding or saving it. Please delete the message and attachments and notify the sender immediately. **

Rambus Inc.<http://www.rambus.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
