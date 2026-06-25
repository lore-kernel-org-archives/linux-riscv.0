Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7DBBCDE00B
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jun 2026 17:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kg8s99zTx55RC6wWB1ArooB7Kyz46gEYZ3inV80spbg=; b=uP0quf1LBvf9aU
	T8OJ2pzSgQaQhC7+zA9PhmpGFc21qKqNccHuFRou8U47VFOMY3t51Ezn5OeDhvLJECchfK51wC7q7
	5YMVoBmHWVq4eSLiHrDrmEm4si+QHJuNhRCpzS2YazIvW15NdcbGl+/ytEYD7G8j3OeG4q3jsUKgC
	7d3IBhmHNhzleXtBKjs054YrE5xi3ijKNGo7XxLh8bvYJY/94Aq7O/QMn5l+U6qGcVyfaWxoyEksA
	ugWXeWv07kZod4Rtgp7UA4XIa5C5u+7l9cgenvYq2pDmwcR3+NO962AFyFKbBApCztHhUkYxM+fFj
	bpzDpQ61/2SGkelVxAcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcnyJ-00000009Xlt-2keZ;
	Thu, 25 Jun 2026 17:34:39 +0000
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcny7-00000009XTj-0ODZ
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jun 2026 17:34:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ehHneXKf0FpVMLhxKggzu6I6EPOgOpWKXKQbfVpiHk+dVda7FMt2amwSzgToChFYrYhH5e3aBhqopG8XW/UJcwNOylQ07R4THEddJsrEUXCR+mFntnNy+B4xkIj/0aDoRBXuw5PSCsLYtJnv7qJM9s55Pp0TrS89yibokXZXmzr0hWW5Z1GaDaIFOA44qRzqhkTgKM6wkQfXYlFJdenjl0c9Tqxj8LsGqXam1ok7eol39a3YJho1v+eeJM2rIQ/MI7YyP+TXkrSJQcsD6PEB2MtWkXFF7jozuadMK6GtMfOfuiphJUWgDsD5wqybXu8NCwnhSqAbcdgPGNsGqYGATQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SADuWipk6JAKvb3PqHYga6iRyN2vKV4ujkg/dHntfJ0=;
 b=hWuUmE9keZ0vMjYl8MQRzHRWIRw/bDdg4EpSJ+76qLzxQstJpa0mZLyexiGWjByH0atq2jzfivoKUvu4RLycUw8+jm9iItIKbq1psn2LWpKs79r3dfO0DKIIvyR/xe73eY3Rs9daBTPpZMqZ0u3mrCKiADj/zjgS8Axml9Al7S59fNa1DuKDTi4IMuFHfkeJn4hTLxMiKPY8mdEJW1B1AltPlYwVfdMAJxEO9mEBRnJr5iQXzPmjI+l/+wyyOcfQnVAS1YyI1DpPWQiJ/WMdPsF/9CA8fvDXo0HYgnKLZkN29TT2djJWngzwZcAWKSahRlag5TT4R1sksUpxJC3UDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.86.86.210) smtp.rcpttodomain=cryptography.com smtp.mailfrom=rambus.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=rambus.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rambus.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SADuWipk6JAKvb3PqHYga6iRyN2vKV4ujkg/dHntfJ0=;
 b=V3xaWIeGZ4l2COxLn9tI3nMGz3jKe1BXZZqcum0sEV4pAYHqRvIbqkFNlXm7xrRUVHtlEMJYd7oODIVQFbkemUZ7S3tBR493cBw6RZsgjHc9gZ4UBxLx8b2b8ArMUJyMGXik5tBW6LzJkJPO0Y3QOyysGuBWtvMybb2DQRPzJGUFB+ZbEHnJ+Annlce4M58fOwku3N8fjXFDqbMFGwpZaj4ieNYV1N6juHvF7Q+JEOtuP7qCk6nPcUEHplTDmWAYr+Z7lja9OU3sJaCX7RVrelLFwdLRtxOFh7m8KwBASVtbUXLy9J0vdT17GDQjhqO5B+lkBLc9NfO+GwGuN8R+iQ==
Received: from DM6PR08CA0065.namprd08.prod.outlook.com (2603:10b6:5:1e0::39)
 by CH4PR04MB9281.namprd04.prod.outlook.com (2603:10b6:610:223::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Thu, 25 Jun
 2026 17:34:10 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:5:1e0:cafe::11) by DM6PR08CA0065.outlook.office365.com
 (2603:10b6:5:1e0::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.16 via Frontend Transport; Thu,
 25 Jun 2026 17:34:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.86.86.210)
 smtp.mailfrom=rambus.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=rambus.com;
Received-SPF: Pass (protection.outlook.com: domain of rambus.com designates
 192.86.86.210 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.86.86.210; helo=hqxsv-psmtppxy02.rambus.com; pr=C
Received: from hqxsv-psmtppxy02.rambus.com (192.86.86.210) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Thu, 25 Jun 2026 17:34:10 +0000
Received: from hqxsv-cmdev3-skrishnamoorthy.rambus.com (hqn-lb-int-float.rambus.com [10.12.20.20])
	by hqxsv-psmtppxy02.rambus.com (Postfix) with ESMTPS id 74BEA180177F;
	Thu, 25 Jun 2026 17:34:07 +0000 (UTC)
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
Subject: [PATCH 16/19] crypto: cmh - add SLH-DSA/LMS/XMSS (HCQ)
Date: Thu, 25 Jun 2026 10:33:24 -0700
Message-ID: <20260625173328.1140487-17-skrishnamoorthy@rambus.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260625173328.1140487-1-skrishnamoorthy@rambus.com>
References: <20260625173328.1140487-1-skrishnamoorthy@rambus.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|CH4PR04MB9281:EE_
X-MS-Office365-Filtering-Correlation-Id: 16b40fa7-2034-4071-caf0-08ded2dff755
X-LD-Processed: bd0ba799-c2b9-413c-9c56-5d1731c4827c,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|82310400026|36860700016|1800799024|23010399003|921020|11063799006|6133799003|3023799007|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: jYQ0sVg7xboebLiVfmPr2iMS3jGH3eJfnG15gFpCYBiZezqY9iVTLDo0ScTsV8ietc/j7sNev2psAvxgx1zQbCstP8XM50QKyUVowwqIV873cVriSq3ea6CfnrOKWtA4TrDnSDhipeCbqngCvW4tC89o5l1xee4OR2JDIw+hq+MIh8Aknxv6gPfA17GIVappEKURD9ewGMLm7I49IRwZFfgfr9TUwj9b6N0rXTfmhuDjp/Xij8ndpLPgk6M/Pp7+KJWjQxMhIXzMNWcfhWl82IMzT6oWWg9c/HpY+RYqMZBoO/pvWXYG625CLf09BEOBbR4XoYzLYqU8mP8BTgEDFkx5Hf/9kXrvYungwWbrgrbmYQeTYhBDVtdx8q3xVMyBC5dRUced4Do8D4cd89N1wVcopmynyRzrQU5DAXtKI7tU5lsOFhmkTz2CdCXk+dRwPSSbNnlCxeNJSjyFLa57mgOimNXLsQ1XXda5qpUoNH7u+DkqzBRI0VP1Dp2Q75hCmw1WIU2AdnFuqbxPpjkyRHl8Zn66Sg4O7x6oIYXx3NStGZGo4xODI+yAiw2tEwKg+rDkLG/yw/7acNqmeUemmV7qyMGmfTO/XJYs4nR+7KGhIxQqwI17VXHjoKR5ENNDBDSvkwqF+aHGPaOE03OKuUJk8n3ETJE4EW616QHTRgcM+j4qxxNoegxaxfwTKMl68vMDu64AVcD4pOXuAXvAH1QqJw0zhS8AsuH/e4sPkfQ7HOCMs7fYdnGimpYR7FXR
X-Forefront-Antispam-Report: CIP:192.86.86.210;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hqxsv-psmtppxy02.rambus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(921020)(11063799006)(6133799003)(3023799007)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Pxxx6MY32/YNNkv2wY9pmOoExbuQD/M8srEQjlg8BshZR3hjpb5Ejszq6qdarCNLUnUXbwKgq/5Ol7puZyxCwVxHwJAOYclYJDTF3v+/DIrb0OepIIVO9P8taVN7j7bGCTzg+xcYx6hS23Rubh60gkKRExalMxok3/lyMokU0/Cl4GNZ8NFW4A7EcdcnCJu8tlnFlke5MU+6s4eH0GZtZ/J8SdI5YwBZaRcp598wQtyYJ+qmBCQDzAZJeUmldnrE0xyvqvTcyFQirJRZqCUljGQeM3n6N/VhkHPGnkCwJhfv9t7J8umV8wL5euo87nVxm8fzUCh0epuuh8FXHAx1HFkz1Oq7FB2WrYr/ciGjb9QoTDgNm0zwm28C9lXvcjOEx4QoJ2xrJlgd/ZN/tjvG8ffVCoyjcMN2zreizCy4l4LNKVyixCEu0M1oJcAWQFVR
X-OriginatorOrg: rambus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 17:34:10.0664
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16b40fa7-2034-4071-caf0-08ded2dff755
X-MS-Exchange-CrossTenant-Id: bd0ba799-c2b9-413c-9c56-5d1731c4827c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bd0ba799-c2b9-413c-9c56-5d1731c4827c;Ip=[192.86.86.210];Helo=[hqxsv-psmtppxy02.rambus.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR04MB9281
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_103427_304713_E87F8324 
X-CRM114-Status: GOOD (  15.37  )
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

Register SLH-DSA, LMS, LMS-HSS, XMSS, and XMSS-MT algorithms
using the CMH HCQ core (core ID 0x08).  SLH-DSA is registered as a
sig algorithm with sign and verify support.  LMS, LMS-HSS, XMSS,
and XMSS-MT are registered as verify-only sig algorithms: their
stateful signing semantics (one-time-key private state the signer
must track) are not modeled by the kernel crypto API, so only
verification is exposed.

Co-developed-by: Saravanakrishnan Krishnamoorthy <skrishnamoorthy@rambus.com>
Signed-off-by: Saravanakrishnan Krishnamoorthy <skrishnamoorthy@rambus.com>
Signed-off-by: Alex Ousherovitch <aousherovitch@rambus.com>
Reviewed-by: Joel Wittenauer <Joel.Wittenauer@cryptography.com>
Reviewed-by: Thi Nguyen <thin@rambus.com>
---
 drivers/crypto/cmh/Makefile         |   6 +-
 drivers/crypto/cmh/cmh_hcq.c        | 313 +++++++++++++++++++++++
 drivers/crypto/cmh/cmh_main.c       |  24 ++
 drivers/crypto/cmh/cmh_pqc_lms.c    | 230 +++++++++++++++++
 drivers/crypto/cmh/cmh_pqc_slhdsa.c | 377 ++++++++++++++++++++++++++++
 drivers/crypto/cmh/cmh_pqc_xmss.c   | 230 +++++++++++++++++
 6 files changed, 1179 insertions(+), 1 deletion(-)
 create mode 100644 drivers/crypto/cmh/cmh_hcq.c
 create mode 100644 drivers/crypto/cmh/cmh_pqc_lms.c
 create mode 100644 drivers/crypto/cmh/cmh_pqc_slhdsa.c
 create mode 100644 drivers/crypto/cmh/cmh_pqc_xmss.c

diff --git a/drivers/crypto/cmh/Makefile b/drivers/crypto/cmh/Makefile
index 3425eb65d653..c3332804a9d7 100644
--- a/drivers/crypto/cmh/Makefile
+++ b/drivers/crypto/cmh/Makefile
@@ -36,7 +36,11 @@ cmh-y := \
        cmh_pke_ecdh.o \
        cmh_qse.o \
        cmh_pqc_mldsa.o \
-       cmh_pqc_sizes.o
+       cmh_pqc_sizes.o \
+       cmh_hcq.o \
+       cmh_pqc_slhdsa.o \
+       cmh_pqc_lms.o \
+       cmh_pqc_xmss.o

 # Management ioctl device (/dev/cmh_mgmt): key lifecycle, PKE, PQC ioctls.
 cmh-$(CONFIG_CRYPTO_DEV_CMH_MGMT) += \
diff --git a/drivers/crypto/cmh/cmh_hcq.c b/drivers/crypto/cmh/cmh_hcq.c
new file mode 100644
index 000000000000..8fc3a5cb0f9f
--- /dev/null
+++ b/drivers/crypto/cmh/cmh_hcq.c
@@ -0,0 +1,313 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 Cryptography Research, Inc. (CRI).
+ * CMH LKM -- HCQ Core VCQ Builders
+ *
+ * VCQ builder functions for SLH-DSA, LMS, and XMSS commands.
+ * Each function populates a single vcq_cmd slot.  Callers assemble
+ * complete VCQs with header + command(s) + flush, then submit via
+ * cmh_tm_submit_sync().
+ */
+
+#include <linux/string.h>
+
+#include "cmh_sys.h"
+
+/* -- HCQ flush -- */
+
+/**
+ * vcq_add_hcq_flush() - Build an HCQ flush VCQ command
+ * @slot: VCQ command slot to populate
+ * @core_id: Hardware core ID for dispatch
+ */
+void vcq_add_hcq_flush(struct vcq_cmd *slot, u32 core_id)
+{
+       vcq_add_flush(slot, core_id);
+}
+
+/* -- SLH-DSA -- */
+
+/**
+ * vcq_add_hcq_slhdsa_keygen() - Build an SLH-DSA key generation VCQ command
+ * @slot: VCQ command slot to populate
+ * @core_id: Hardware core ID for dispatch
+ * @param_set: SLH-DSA parameter set identifier
+ * @seed_len: Length of seed buffer in bytes
+ * @pk_len: Length of public key buffer in bytes
+ * @sk_len: Length of secret key buffer in bytes
+ * @seed: DMA address of seed input buffer
+ * @pk: DMA address of public key output buffer
+ * @sk: DMA address of secret key output buffer
+ */
+void vcq_add_hcq_slhdsa_keygen(struct vcq_cmd *slot, u32 core_id, u32 param_set,
+                              u32 seed_len, u32 pk_len, u32 sk_len,
+                              u64 seed, u64 pk, u64 sk)
+{
+       memset(slot, 0, sizeof(*slot));
+       slot->magic = VCQ_CMD_MAGIC;
+       slot->id = VCQ_CMD_ID(core_id, 0, 1, HCQ_CMD_SLHDSA_KEYGEN);
+       slot->hwc.hcq.cmd_slhdsa_keygen.parameter_set = param_set;
+       slot->hwc.hcq.cmd_slhdsa_keygen.seed_len = seed_len;
+       slot->hwc.hcq.cmd_slhdsa_keygen.pk_len = pk_len;
+       slot->hwc.hcq.cmd_slhdsa_keygen.sk_len = sk_len;
+       slot->hwc.hcq.cmd_slhdsa_keygen.seed = seed;
+       slot->hwc.hcq.cmd_slhdsa_keygen.pk = pk;
+       slot->hwc.hcq.cmd_slhdsa_keygen.sk = sk;
+}
+
+/**
+ * vcq_add_hcq_slhdsa_sign() - Build an SLH-DSA signing VCQ command
+ * @slot: VCQ command slot to populate
+ * @core_id: Hardware core ID for dispatch
+ * @param_set: SLH-DSA parameter set identifier
+ * @msg_len: Length of message buffer in bytes
+ * @ctx_len: Length of context string in bytes
+ * @add_random: DMA address of additional randomness buffer
+ * @msg: DMA address of message buffer
+ * @ctx: DMA address of context string buffer
+ * @sk: DMA address of secret key buffer
+ * @sig: DMA address of signature output buffer
+ */
+void vcq_add_hcq_slhdsa_sign(struct vcq_cmd *slot, u32 core_id, u32 param_set,
+                            u32 msg_len, u32 ctx_len,
+                            u64 add_random, u64 msg, u64 ctx,
+                            u64 sk, u64 sig)
+{
+       memset(slot, 0, sizeof(*slot));
+       slot->magic = VCQ_CMD_MAGIC;
+       slot->id = VCQ_CMD_ID(core_id, 0, 1, HCQ_CMD_SLHDSA_SIGN);
+       slot->hwc.hcq.cmd_slhdsa_sign.parameter_set = param_set;
+       slot->hwc.hcq.cmd_slhdsa_sign.message_len = msg_len;
+       slot->hwc.hcq.cmd_slhdsa_sign.add_random = add_random;
+       slot->hwc.hcq.cmd_slhdsa_sign.message = msg;
+       slot->hwc.hcq.cmd_slhdsa_sign.context = ctx;
+       slot->hwc.hcq.cmd_slhdsa_sign.sk = sk;
+       slot->hwc.hcq.cmd_slhdsa_sign.sig = sig;
+       slot->hwc.hcq.cmd_slhdsa_sign.context_len = ctx_len;
+}
+
+/**
+ * vcq_add_hcq_slhdsa_sign_internal() - Build an SLH-DSA internal signing VCQ command
+ * @slot: VCQ command slot to populate
+ * @core_id: Hardware core ID for dispatch
+ * @param_set: SLH-DSA parameter set identifier
+ * @msg_len: Length of message buffer in bytes
+ * @add_random: DMA address of additional randomness buffer
+ * @msg: DMA address of message buffer
+ * @sk: DMA address of secret key buffer
+ * @sig: DMA address of signature output buffer
+ */
+void vcq_add_hcq_slhdsa_sign_internal(struct vcq_cmd *slot, u32 core_id, u32 param_set,
+                                     u32 msg_len, u64 add_random,
+                                     u64 msg, u64 sk, u64 sig)
+{
+       memset(slot, 0, sizeof(*slot));
+       slot->magic = VCQ_CMD_MAGIC;
+       slot->id = VCQ_CMD_ID(core_id, 0, 1, HCQ_CMD_SLHDSA_SIGN_INTERNAL);
+       slot->hwc.hcq.cmd_slhdsa_sign_internal.parameter_set = param_set;
+       slot->hwc.hcq.cmd_slhdsa_sign_internal.message_len = msg_len;
+       slot->hwc.hcq.cmd_slhdsa_sign_internal.add_random = add_random;
+       slot->hwc.hcq.cmd_slhdsa_sign_internal.message = msg;
+       slot->hwc.hcq.cmd_slhdsa_sign_internal.sk = sk;
+       slot->hwc.hcq.cmd_slhdsa_sign_internal.sig = sig;
+}
+
+/**
+ * vcq_add_hcq_slhdsa_verify() - Build an SLH-DSA verification VCQ command
+ * @slot: VCQ command slot to populate
+ * @core_id: Hardware core ID for dispatch
+ * @param_set: SLH-DSA parameter set identifier
+ * @msg_len: Length of message buffer in bytes
+ * @ctx_len: Length of context string in bytes
+ * @msg: DMA address of message buffer
+ * @ctx: DMA address of context string buffer
+ * @pk: DMA address of public key buffer
+ * @sig: DMA address of signature buffer to verify
+ */
+void vcq_add_hcq_slhdsa_verify(struct vcq_cmd *slot, u32 core_id, u32 param_set,
+                              u32 msg_len, u32 ctx_len,
+                              u64 msg, u64 ctx, u64 pk, u64 sig)
+{
+       memset(slot, 0, sizeof(*slot));
+       slot->magic = VCQ_CMD_MAGIC;
+       slot->id = VCQ_CMD_ID(core_id, 0, 1, HCQ_CMD_SLHDSA_VERIFY);
+       slot->hwc.hcq.cmd_slhdsa_verify.parameter_set = param_set;
+       slot->hwc.hcq.cmd_slhdsa_verify.message_len = msg_len;
+       slot->hwc.hcq.cmd_slhdsa_verify.message = msg;
+       slot->hwc.hcq.cmd_slhdsa_verify.context = ctx;
+       slot->hwc.hcq.cmd_slhdsa_verify.pk = pk;
+       slot->hwc.hcq.cmd_slhdsa_verify.sig = sig;
+       slot->hwc.hcq.cmd_slhdsa_verify.context_len = ctx_len;
+}
+
+/**
+ * vcq_add_hcq_slhdsa_sign_prehash() - Build an SLH-DSA prehash signing VCQ command
+ * @slot: VCQ command slot to populate
+ * @core_id: Hardware core ID for dispatch
+ * @cmd: VCQ command ID (sign-prehash variant)
+ * @param_set: SLH-DSA parameter set identifier
+ * @prehash_algo: Prehash algorithm identifier
+ * @msg_len: Length of message buffer in bytes
+ * @ctx_len: Length of context string in bytes
+ * @add_random: DMA address of additional randomness buffer
+ * @msg: DMA address of message buffer
+ * @ctx: DMA address of context string buffer
+ * @sk: DMA address of secret key buffer
+ * @sig: DMA address of signature output buffer
+ */
+void vcq_add_hcq_slhdsa_sign_prehash(struct vcq_cmd *slot, u32 core_id,
+                                    u32 cmd, u32 param_set, u32 prehash_algo,
+                                    u32 msg_len, u32 ctx_len,
+                                    u64 add_random, u64 msg, u64 ctx,
+                                    u64 sk, u64 sig)
+{
+       memset(slot, 0, sizeof(*slot));
+       slot->magic = VCQ_CMD_MAGIC;
+       slot->id = VCQ_CMD_ID(core_id, 0, 1, cmd);
+       slot->hwc.hcq.cmd_slhdsa_sign_prehash.parameter_set = param_set;
+       slot->hwc.hcq.cmd_slhdsa_sign_prehash.prehash_algo = prehash_algo;
+       slot->hwc.hcq.cmd_slhdsa_sign_prehash.message_len = msg_len;
+       slot->hwc.hcq.cmd_slhdsa_sign_prehash.context_len = ctx_len;
+       slot->hwc.hcq.cmd_slhdsa_sign_prehash.add_random = add_random;
+       slot->hwc.hcq.cmd_slhdsa_sign_prehash.message = msg;
+       slot->hwc.hcq.cmd_slhdsa_sign_prehash.context = ctx;
+       slot->hwc.hcq.cmd_slhdsa_sign_prehash.sk = sk;
+       slot->hwc.hcq.cmd_slhdsa_sign_prehash.sig = sig;
+}
+
+/**
+ * vcq_add_hcq_slhdsa_verify_prehash() - Build an SLH-DSA prehash verify VCQ command
+ * @slot: VCQ command slot to populate
+ * @core_id: Hardware core ID for dispatch
+ * @cmd: VCQ command ID (verify-prehash variant)
+ * @param_set: SLH-DSA parameter set identifier
+ * @prehash_algo: Prehash algorithm identifier
+ * @msg_len: Length of message buffer in bytes
+ * @ctx_len: Length of context string in bytes
+ * @msg: DMA address of message buffer
+ * @ctx: DMA address of context string buffer
+ * @pk: DMA address of public key buffer
+ * @sig: DMA address of signature buffer to verify
+ */
+void vcq_add_hcq_slhdsa_verify_prehash(struct vcq_cmd *slot, u32 core_id,
+                                      u32 cmd, u32 param_set, u32 prehash_algo,
+                                      u32 msg_len, u32 ctx_len,
+                                      u64 msg, u64 ctx, u64 pk, u64 sig)
+{
+       memset(slot, 0, sizeof(*slot));
+       slot->magic = VCQ_CMD_MAGIC;
+       slot->id = VCQ_CMD_ID(core_id, 0, 1, cmd);
+       slot->hwc.hcq.cmd_slhdsa_verify_prehash.parameter_set = param_set;
+       slot->hwc.hcq.cmd_slhdsa_verify_prehash.prehash_algo = prehash_algo;
+       slot->hwc.hcq.cmd_slhdsa_verify_prehash.message_len = msg_len;
+       slot->hwc.hcq.cmd_slhdsa_verify_prehash.context_len = ctx_len;
+       slot->hwc.hcq.cmd_slhdsa_verify_prehash.message = msg;
+       slot->hwc.hcq.cmd_slhdsa_verify_prehash.context = ctx;
+       slot->hwc.hcq.cmd_slhdsa_verify_prehash.pk = pk;
+       slot->hwc.hcq.cmd_slhdsa_verify_prehash.sig = sig;
+}
+
+/**
+ * vcq_add_hcq_slhdsa_verify_internal() - Build an SLH-DSA internal verify VCQ command
+ * @slot: VCQ command slot to populate
+ * @core_id: Hardware core ID for dispatch
+ * @param_set: SLH-DSA parameter set identifier
+ * @msg_len: Length of message buffer in bytes
+ * @msg: DMA address of message buffer
+ * @pk: DMA address of public key buffer
+ * @sig: DMA address of signature buffer to verify
+ */
+void vcq_add_hcq_slhdsa_verify_internal(struct vcq_cmd *slot, u32 core_id, u32 param_set,
+                                       u32 msg_len, u64 msg, u64 pk, u64 sig)
+{
+       memset(slot, 0, sizeof(*slot));
+       slot->magic = VCQ_CMD_MAGIC;
+       slot->id = VCQ_CMD_ID(core_id, 0, 1,
+                             HCQ_CMD_SLHDSA_VERIFY_INTERNAL);
+       slot->hwc.hcq.cmd_slhdsa_verify_internal.parameter_set = param_set;
+       slot->hwc.hcq.cmd_slhdsa_verify_internal.message_len = msg_len;
+       slot->hwc.hcq.cmd_slhdsa_verify_internal.message = msg;
+       slot->hwc.hcq.cmd_slhdsa_verify_internal.pk = pk;
+       slot->hwc.hcq.cmd_slhdsa_verify_internal.sig = sig;
+}
+
+/**
+ * vcq_add_hcq_slhdsa_pubgen() - Build an SLH-DSA public key generation VCQ command
+ * @slot: VCQ command slot to populate
+ * @core_id: Hardware core ID for dispatch
+ * @param_set: SLH-DSA parameter set identifier
+ * @sk_len: Length of secret key buffer in bytes
+ * @sk: DMA address of secret key input buffer
+ * @pk: DMA address of public key output buffer
+ */
+void vcq_add_hcq_slhdsa_pubgen(struct vcq_cmd *slot, u32 core_id, u32 param_set,
+                              u32 sk_len, u64 sk, u64 pk)
+{
+       memset(slot, 0, sizeof(*slot));
+       slot->magic = VCQ_CMD_MAGIC;
+       slot->id = VCQ_CMD_ID(core_id, 0, 1, HCQ_CMD_SLHDSA_PUBGEN);
+       slot->hwc.hcq.cmd_slhdsa_pubgen.parameter_set = param_set;
+       slot->hwc.hcq.cmd_slhdsa_pubgen.sk_len = sk_len;
+       slot->hwc.hcq.cmd_slhdsa_pubgen.sk = sk;
+       slot->hwc.hcq.cmd_slhdsa_pubgen.pk = pk;
+}
+
+/* -- LMS -- */
+
+/**
+ * vcq_add_hcq_lms_verify() - Build an LMS/HSS signature verify VCQ command
+ * @slot: VCQ command slot to populate
+ * @core_id: Hardware core ID for dispatch
+ * @lms_hss: LMS/HSS mode flag (0 = LMS, 1 = HSS)
+ * @pk_len: Length of public key buffer in bytes
+ * @sig_len: Length of signature buffer in bytes
+ * @dig_len: Length of digest buffer in bytes
+ * @pk: DMA address of public key buffer
+ * @sig: DMA address of signature buffer
+ * @dig: DMA address of digest buffer
+ */
+void vcq_add_hcq_lms_verify(struct vcq_cmd *slot, u32 core_id, u32 lms_hss,
+                           u32 pk_len, u32 sig_len, u32 dig_len,
+                           u64 pk, u64 sig, u64 dig)
+{
+       memset(slot, 0, sizeof(*slot));
+       slot->magic = VCQ_CMD_MAGIC;
+       slot->id = VCQ_CMD_ID(core_id, 0, 1, HCQ_CMD_LMS_VERIFY);
+       slot->hwc.hcq.cmd_lms_verify.lms_hss = lms_hss;
+       slot->hwc.hcq.cmd_lms_verify.pk_len = pk_len;
+       slot->hwc.hcq.cmd_lms_verify.sig_len = sig_len;
+       slot->hwc.hcq.cmd_lms_verify.dig_len = dig_len;
+       slot->hwc.hcq.cmd_lms_verify.pk = pk;
+       slot->hwc.hcq.cmd_lms_verify.sig = sig;
+       slot->hwc.hcq.cmd_lms_verify.dig = dig;
+}
+
+/* -- XMSS -- */
+
+/**
+ * vcq_add_hcq_xmss_verify() - Build an XMSS/XMSS^MT signature verify VCQ command
+ * @slot: VCQ command slot to populate
+ * @core_id: Hardware core ID for dispatch
+ * @xmss_mt: XMSS/XMSS^MT mode flag (0 = XMSS, 1 = XMSS^MT)
+ * @pk_len: Length of public key buffer in bytes
+ * @sig_len: Length of signature buffer in bytes
+ * @dig_len: Length of digest buffer in bytes
+ * @pk: DMA address of public key buffer
+ * @sig: DMA address of signature buffer
+ * @dig: DMA address of digest buffer
+ */
+void vcq_add_hcq_xmss_verify(struct vcq_cmd *slot, u32 core_id, u32 xmss_mt,
+                            u32 pk_len, u32 sig_len, u32 dig_len,
+                            u64 pk, u64 sig, u64 dig)
+{
+       memset(slot, 0, sizeof(*slot));
+       slot->magic = VCQ_CMD_MAGIC;
+       slot->id = VCQ_CMD_ID(core_id, 0, 1, HCQ_CMD_XMSS_VERIFY);
+       slot->hwc.hcq.cmd_xmss_verify.xmss_mt = xmss_mt;
+       slot->hwc.hcq.cmd_xmss_verify.pk_len = pk_len;
+       slot->hwc.hcq.cmd_xmss_verify.sig_len = sig_len;
+       slot->hwc.hcq.cmd_xmss_verify.dig_len = dig_len;
+       slot->hwc.hcq.cmd_xmss_verify.pk = pk;
+       slot->hwc.hcq.cmd_xmss_verify.sig = sig;
+       slot->hwc.hcq.cmd_xmss_verify.dig = dig;
+}
diff --git a/drivers/crypto/cmh/cmh_main.c b/drivers/crypto/cmh/cmh_main.c
index df38f43dc179..03c127083507 100644
--- a/drivers/crypto/cmh/cmh_main.c
+++ b/drivers/crypto/cmh/cmh_main.c
@@ -297,6 +297,21 @@ static int cmh_probe(struct platform_device *pdev)
        if (ret)
                goto err_pqc_mldsa_register;

+       /* Register PQC SLH-DSA */
+       ret = cmh_pqc_slhdsa_register();
+       if (ret)
+               goto err_pqc_slhdsa_register;
+
+       /* Register PQC LMS */
+       ret = cmh_pqc_lms_register();
+       if (ret)
+               goto err_pqc_lms_register;
+
+       /* Register PQC XMSS */
+       ret = cmh_pqc_xmss_register();
+       if (ret)
+               goto err_pqc_xmss_register;
+
        /* Register key management device (/dev/cmh_mgmt) */
        ret = cmh_mgmt_register();
        if (ret)
@@ -309,6 +324,12 @@ static int cmh_probe(struct platform_device *pdev)
        return 0;

 err_mgmt_register:
+       cmh_pqc_xmss_unregister();
+err_pqc_xmss_register:
+       cmh_pqc_lms_unregister();
+err_pqc_lms_register:
+       cmh_pqc_slhdsa_unregister();
+err_pqc_slhdsa_register:
        cmh_pqc_mldsa_unregister();
 err_pqc_mldsa_register:
        cmh_pke_ecdh_unregister();
@@ -373,6 +394,9 @@ static void cmh_remove(struct platform_device *pdev)
        cfg = &dev->config;

        cmh_mgmt_unregister();
+       cmh_pqc_xmss_unregister();
+       cmh_pqc_lms_unregister();
+       cmh_pqc_slhdsa_unregister();
        cmh_pqc_mldsa_unregister();
        cmh_pke_ecdh_unregister();
        cmh_pke_ecdsa_unregister();
diff --git a/drivers/crypto/cmh/cmh_pqc_lms.c b/drivers/crypto/cmh/cmh_pqc_lms.c
new file mode 100644
index 000000000000..13b2e26aa7bd
--- /dev/null
+++ b/drivers/crypto/cmh/cmh_pqc_lms.c
@@ -0,0 +1,230 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 Cryptography Research, Inc. (CRI).
+ * CMH LKM -- LMS/HSS Signature Driver (verify-only, sig_alg, synchronous)
+ *
+ * Registers "lms" and "lms-hss" sig algorithms with verify-only
+ * callbacks.  Sign is not supported (stateful signature -- key
+ * management must happen externally).
+ *
+ * Verify: src = raw signature, digest = message bytes
+ * Public key: raw pk bytes (variable length, set via set_pub_key)
+ */
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <crypto/sig.h>
+#include <crypto/internal/sig.h>
+
+#include "cmh_sys.h"
+#include "cmh_hcq_abi.h"
+#include "cmh_txn.h"
+#include "cmh_dma.h"
+#include "cmh_pqc.h"
+
+#define LMS_VCQ_CMDS   3       /* header + cmd + flush */
+
+struct cmh_lms_tfm_ctx {
+       u8 *pub_key;
+       u32 pub_key_len;
+       u32 lms_hss;            /* 0 = LMS, 1 = LMS-HSS */
+};
+
+static inline struct cmh_lms_tfm_ctx *cmh_lms_ctx(struct crypto_sig *tfm)
+{
+       return crypto_sig_ctx(tfm);
+}
+
+/*
+ * LMS/HSS verify (synchronous sig_alg)
+ *
+ * @src:    raw signature
+ * @slen:   signature length
+ * @digest: message bytes
+ * @dlen:   message length
+ *
+ * Returns 0 on successful verification, negative errno on failure.
+ */
+static int cmh_lms_verify(struct crypto_sig *tfm,
+                         const void *src, unsigned int slen,
+                         const void *digest, unsigned int dlen)
+{
+       struct cmh_lms_tfm_ctx *ctx = cmh_lms_ctx(tfm);
+       struct core_dispatch d = cmh_core_select_instance(CMH_CORE_HCQ);
+       struct vcq_cmd vcq[LMS_VCQ_CMDS];
+       u8 *sig_buf = NULL, *m_buf = NULL, *pk_buf = NULL;
+       dma_addr_t sig_dma = DMA_MAPPING_ERROR;
+       dma_addr_t m_dma = DMA_MAPPING_ERROR;
+       dma_addr_t pk_dma = DMA_MAPPING_ERROR;
+       int ret;
+
+       if (!ctx->pub_key)
+               return -EINVAL;
+       if (!slen || slen > LMS_MAX_SIG_LEN)
+               return -EINVAL;
+       if (!dlen || dlen > LMS_MAX_MSG_LEN)
+               return -EINVAL;
+
+       sig_buf = kmemdup(src, slen, GFP_KERNEL);
+       m_buf = kmemdup(digest, dlen, GFP_KERNEL);
+       pk_buf = kmemdup(ctx->pub_key, ctx->pub_key_len, GFP_KERNEL);
+       if (!sig_buf || !m_buf || !pk_buf) {
+               ret = -ENOMEM;
+               goto out_free;
+       }
+
+       sig_dma = cmh_dma_map_single(sig_buf, slen, DMA_TO_DEVICE);
+       m_dma = cmh_dma_map_single(m_buf, dlen, DMA_TO_DEVICE);
+       pk_dma = cmh_dma_map_single(pk_buf, ctx->pub_key_len, DMA_TO_DEVICE);
+
+       if (cmh_dma_map_error(sig_dma) || cmh_dma_map_error(m_dma) ||
+           cmh_dma_map_error(pk_dma)) {
+               ret = -ENOMEM;
+               goto out_unmap;
+       }
+
+       vcq_set_header(&vcq[0], LMS_VCQ_CMDS);
+       vcq_add_hcq_lms_verify(&vcq[1], d.core_id, ctx->lms_hss,
+                              ctx->pub_key_len, slen, dlen,
+                              pk_dma, sig_dma, m_dma);
+       vcq_add_hcq_flush(&vcq[2], d.core_id);
+
+       /* LMS verify traverses Merkle hash chains -- inherently slow */
+       ret = cmh_tm_submit_sync_tmo(vcq, LMS_VCQ_CMDS, 1, d.mbx_idx,
+                                    cmh_tm_slow_op_timeout_jiffies());
+
+out_unmap:
+       if (!cmh_dma_map_error(pk_dma))
+               cmh_dma_unmap_single(pk_dma, ctx->pub_key_len, DMA_TO_DEVICE);
+       if (!cmh_dma_map_error(m_dma))
+               cmh_dma_unmap_single(m_dma, dlen, DMA_TO_DEVICE);
+       if (!cmh_dma_map_error(sig_dma))
+               cmh_dma_unmap_single(sig_dma, slen, DMA_TO_DEVICE);
+
+out_free:
+       kfree(pk_buf);
+       kfree(m_buf);
+       kfree(sig_buf);
+       return ret;
+}
+
+static int cmh_lms_set_pub_key(struct crypto_sig *tfm,
+                              const void *key, unsigned int keylen)
+{
+       struct cmh_lms_tfm_ctx *ctx = cmh_lms_ctx(tfm);
+
+       if (!keylen || keylen > LMS_MAX_PK_LEN)
+               return -EINVAL;
+
+       kfree(ctx->pub_key);
+       ctx->pub_key = NULL;
+       ctx->pub_key_len = 0;
+
+       ctx->pub_key = kmemdup(key, keylen, GFP_KERNEL);
+       if (!ctx->pub_key)
+               return -ENOMEM;
+
+       ctx->pub_key_len = keylen;
+       return 0;
+}
+
+static unsigned int cmh_lms_key_size(struct crypto_sig *tfm)
+{
+       struct cmh_lms_tfm_ctx *ctx = cmh_lms_ctx(tfm);
+
+       return ctx->pub_key_len * 8;
+}
+
+static int cmh_lms_init(struct crypto_sig *tfm)
+{
+       struct cmh_lms_tfm_ctx *ctx = cmh_lms_ctx(tfm);
+
+       memset(ctx, 0, sizeof(*ctx));
+       return 0;
+}
+
+static int cmh_lms_hss_init(struct crypto_sig *tfm)
+{
+       struct cmh_lms_tfm_ctx *ctx = cmh_lms_ctx(tfm);
+
+       memset(ctx, 0, sizeof(*ctx));
+       ctx->lms_hss = 1;
+       return 0;
+}
+
+static void cmh_lms_exit(struct crypto_sig *tfm)
+{
+       struct cmh_lms_tfm_ctx *ctx = cmh_lms_ctx(tfm);
+
+       kfree(ctx->pub_key);
+       ctx->pub_key = NULL;
+}
+
+static struct sig_alg cmh_lms_algs[] = {
+       {
+               .verify         = cmh_lms_verify,
+               .set_pub_key    = cmh_lms_set_pub_key,
+               .key_size       = cmh_lms_key_size,
+               .init           = cmh_lms_init,
+               .exit           = cmh_lms_exit,
+               .base = {
+                       .cra_name         = "lms",
+                       .cra_driver_name  = "cri-cmh-lms",
+                       .cra_priority     = 300,
+                       .cra_module       = THIS_MODULE,
+                       .cra_ctxsize      = sizeof(struct cmh_lms_tfm_ctx),
+               },
+       },
+       {
+               .verify         = cmh_lms_verify,
+               .set_pub_key    = cmh_lms_set_pub_key,
+               .key_size       = cmh_lms_key_size,
+               .init           = cmh_lms_hss_init,
+               .exit           = cmh_lms_exit,
+               .base = {
+                       .cra_name         = "lms-hss",
+                       .cra_driver_name  = "cri-cmh-lms-hss",
+                       .cra_priority     = 300,
+                       .cra_module       = THIS_MODULE,
+                       .cra_ctxsize      = sizeof(struct cmh_lms_tfm_ctx),
+               },
+       },
+};
+
+/**
+ * cmh_pqc_lms_register() - Register LMS/LMS-HSS sig algorithms with the crypto framework
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+int cmh_pqc_lms_register(void)
+{
+       int ret, i;
+
+       for (i = 0; i < ARRAY_SIZE(cmh_lms_algs); i++) {
+               ret = crypto_register_sig(&cmh_lms_algs[i]);
+               if (ret) {
+                       dev_err(cmh_dev(), "cmh: failed to register %s (%d)\n",
+                               cmh_lms_algs[i].base.cra_name, ret);
+                       goto err_unregister;
+               }
+       }
+
+       return 0;
+
+err_unregister:
+       while (i--)
+               crypto_unregister_sig(&cmh_lms_algs[i]);
+       return ret;
+}
+
+/**
+ * cmh_pqc_lms_unregister() - Unregister LMS/LMS-HSS sig algorithms from the crypto framework
+ */
+void cmh_pqc_lms_unregister(void)
+{
+       int i = ARRAY_SIZE(cmh_lms_algs);
+
+       while (i--)
+               crypto_unregister_sig(&cmh_lms_algs[i]);
+}
diff --git a/drivers/crypto/cmh/cmh_pqc_slhdsa.c b/drivers/crypto/cmh/cmh_pqc_slhdsa.c
new file mode 100644
index 000000000000..9cc8cdb442b2
--- /dev/null
+++ b/drivers/crypto/cmh/cmh_pqc_slhdsa.c
@@ -0,0 +1,377 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 Cryptography Research, Inc. (CRI).
+ * CMH LKM -- SLH-DSA Signature Driver (sig_alg, synchronous)
+ *
+ * Registers SLH-DSA sig algorithms for all 12 parameter sets
+ * (SHAKE/SHA2 x 128/192/256 x s/f) with sign and verify callbacks.
+ *
+ * Key format:
+ *   Public key  = raw pk bytes (2*n bytes)
+ *   Private key = raw sk bytes (4*n)
+ *
+ * Sign: src = message, dst = raw signature
+ * Verify: src = raw signature, digest = message bytes
+ *
+ * Private keys are raw (written to SYS_REF_TEMP per-operation).
+ */
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/unaligned.h>
+#include <crypto/sig.h>
+#include <crypto/internal/sig.h>
+
+#include "cmh_sys.h"
+#include "cmh_qse_abi.h"
+#include "cmh_hcq_abi.h"
+#include "cmh_txn.h"
+#include "cmh_dma.h"
+#include "cmh_key.h"
+#include "cmh_pqc.h"
+
+struct cmh_slhdsa_tfm_ctx {
+       struct cmh_key_ctx key;         /* private key (raw sk bytes) */
+       u8 *pub_key;
+       u32 pub_key_len;
+       u32 param_set;                  /* HCQ_SLHDSA_SHAKE_128S .. SHA2_256F */
+};
+
+static inline struct cmh_slhdsa_tfm_ctx *cmh_slhdsa_ctx(struct crypto_sig *tfm)
+{
+       return crypto_sig_ctx(tfm);
+}
+
+/*
+ * SLH-DSA sign (synchronous sig_alg)
+ *
+ * @src:  message bytes
+ * @slen: message length
+ * @dst:  signature output buffer
+ * @dlen: output buffer length
+ *
+ * Returns signature length on success, negative errno on failure.
+ * Uses raw private keys written to SYS_REF_TEMP per-operation.
+ */
+static int cmh_slhdsa_sign(struct crypto_sig *tfm,
+                          const void *src, unsigned int slen,
+                          void *dst, unsigned int dlen)
+{
+       struct cmh_slhdsa_tfm_ctx *ctx = cmh_slhdsa_ctx(tfm);
+       u32 sig_sz = slhdsa_get_sig_size(ctx->param_set);
+       u32 sk_sz = slhdsa_sk_size(ctx->param_set);
+       struct vcq_cmd vcq[HCQ_VCQ_CMDS_MAX]; /* raw: hdr+write+sign+flush */
+       u32 vcq_count;
+       u8 *m_buf = NULL, *sig_buf = NULL, *sk_buf = NULL;
+       dma_addr_t m_dma = DMA_MAPPING_ERROR;
+       dma_addr_t sig_dma = DMA_MAPPING_ERROR;
+       dma_addr_t sk_dma = DMA_MAPPING_ERROR;
+       int ret, idx;
+
+       if (ctx->key.mode == CMH_KEY_NONE)
+               return -EINVAL;
+       if (dlen < sig_sz)
+               return -EINVAL;
+       if (!slen || slen > SLHDSA_MAX_MSG_LEN)
+               return -EINVAL;
+
+       m_buf = kmemdup(src, slen, GFP_KERNEL);
+       sig_buf = kzalloc(sig_sz, GFP_KERNEL);
+       if (!m_buf || !sig_buf) {
+               ret = -ENOMEM;
+               goto out_free;
+       }
+
+       m_dma = cmh_dma_map_single(m_buf, slen, DMA_TO_DEVICE);
+       sig_dma = cmh_dma_map_single(sig_buf, sig_sz, DMA_FROM_DEVICE);
+       if (cmh_dma_map_error(m_dma) || cmh_dma_map_error(sig_dma)) {
+               ret = -ENOMEM;
+               goto out_unmap;
+       }
+
+       sk_dma = DMA_MAPPING_ERROR;
+       idx = 0;
+
+       struct core_dispatch d;
+
+       d = cmh_core_select_instance(CMH_CORE_HCQ);
+
+       if (ctx->key.raw.len != sk_sz) {
+               ret = -EINVAL;
+               goto out_unmap;
+       }
+       sk_buf = kmemdup(ctx->key.raw.data, ctx->key.raw.len,
+                        GFP_KERNEL);
+       if (!sk_buf) {
+               ret = -ENOMEM;
+               goto out_unmap;
+       }
+       sk_dma = cmh_dma_map_single(sk_buf, sk_sz, DMA_TO_DEVICE);
+       if (cmh_dma_map_error(sk_dma)) {
+               ret = -ENOMEM;
+               goto out_unmap;
+       }
+
+       vcq_count = HCQ_VCQ_CMDS_MIN + 1;
+       vcq_set_header(&vcq[idx++], vcq_count);
+       vcq_add_sys_write(&vcq[idx++], SYS_REF_TEMP, sk_dma,
+                         SYS_REF_NONE, sk_sz,
+                         ctx->key.raw.sys_type);
+       vcq_add_hcq_slhdsa_sign_internal(&vcq[idx++], d.core_id,
+                                        ctx->param_set,
+                                        slen, 0,
+                                        m_dma, SYS_REF_TEMP,
+                                        sig_dma);
+       vcq_add_hcq_flush(&vcq[idx++], d.core_id);
+
+       ret = cmh_tm_submit_sync_tmo(vcq, vcq_count, 1, d.mbx_idx,
+                                    cmh_tm_slow_op_timeout_jiffies());
+
+       if (!ret) {
+               /* Sync bounce buffer so CPU sees the DMA-written signature */
+               cmh_dma_sync_for_cpu(sig_dma, sig_sz, DMA_FROM_DEVICE);
+               memcpy(dst, sig_buf, sig_sz);
+               ret = sig_sz;
+       }
+
+out_unmap:
+       if (sk_buf) {
+               if (!cmh_dma_map_error(sk_dma))
+                       cmh_dma_unmap_single(sk_dma, sk_sz, DMA_TO_DEVICE);
+               kfree_sensitive(sk_buf);
+       }
+       if (!cmh_dma_map_error(sig_dma))
+               cmh_dma_unmap_single(sig_dma, sig_sz, DMA_FROM_DEVICE);
+       if (!cmh_dma_map_error(m_dma))
+               cmh_dma_unmap_single(m_dma, slen, DMA_TO_DEVICE);
+
+out_free:
+       kfree(sig_buf);
+       kfree(m_buf);
+       return ret;
+}
+
+/*
+ * SLH-DSA verify (synchronous sig_alg)
+ *
+ * @src:    raw signature
+ * @slen:   signature length
+ * @digest: message bytes
+ * @dlen:   message length
+ *
+ * Returns 0 on successful verification, negative errno on failure.
+ */
+static int cmh_slhdsa_verify(struct crypto_sig *tfm,
+                            const void *src, unsigned int slen,
+                            const void *digest, unsigned int dlen)
+{
+       struct cmh_slhdsa_tfm_ctx *ctx = cmh_slhdsa_ctx(tfm);
+       u32 sig_sz = slhdsa_get_sig_size(ctx->param_set);
+       u32 pk_sz = slhdsa_pk_size(ctx->param_set);
+       struct core_dispatch d = cmh_core_select_instance(CMH_CORE_HCQ);
+       struct vcq_cmd vcq[HCQ_VCQ_CMDS_MIN];
+       u8 *sig_buf = NULL, *m_buf = NULL, *pk_buf = NULL;
+       dma_addr_t sig_dma = DMA_MAPPING_ERROR;
+       dma_addr_t m_dma = DMA_MAPPING_ERROR;
+       dma_addr_t pk_dma = DMA_MAPPING_ERROR;
+       int ret;
+
+       if (!ctx->pub_key)
+               return -EINVAL;
+       if (slen != sig_sz)
+               return -EINVAL;
+       if (!dlen || dlen > SLHDSA_MAX_MSG_LEN)
+               return -EINVAL;
+
+       sig_buf = kmemdup(src, slen, GFP_KERNEL);
+       m_buf = kmemdup(digest, dlen, GFP_KERNEL);
+       pk_buf = kmemdup(ctx->pub_key, pk_sz, GFP_KERNEL);
+       if (!sig_buf || !m_buf || !pk_buf) {
+               ret = -ENOMEM;
+               goto out_free;
+       }
+
+       sig_dma = cmh_dma_map_single(sig_buf, sig_sz, DMA_TO_DEVICE);
+       m_dma = cmh_dma_map_single(m_buf, dlen, DMA_TO_DEVICE);
+       pk_dma = cmh_dma_map_single(pk_buf, pk_sz, DMA_TO_DEVICE);
+
+       if (cmh_dma_map_error(sig_dma) || cmh_dma_map_error(m_dma) ||
+           cmh_dma_map_error(pk_dma)) {
+               ret = -ENOMEM;
+               goto out_unmap;
+       }
+
+       vcq_set_header(&vcq[0], HCQ_VCQ_CMDS_MIN);
+       vcq_add_hcq_slhdsa_verify_internal(&vcq[1], d.core_id, ctx->param_set,
+                                          dlen, m_dma, pk_dma, sig_dma);
+       vcq_add_hcq_flush(&vcq[2], d.core_id);
+
+       /* SLH-DSA verify recomputes hyper-tree hashes -- inherently slow */
+       ret = cmh_tm_submit_sync_tmo(vcq, HCQ_VCQ_CMDS_MIN, 1, d.mbx_idx,
+                                    cmh_tm_slow_op_timeout_jiffies());
+
+out_unmap:
+       if (!cmh_dma_map_error(pk_dma))
+               cmh_dma_unmap_single(pk_dma, pk_sz, DMA_TO_DEVICE);
+       if (!cmh_dma_map_error(m_dma))
+               cmh_dma_unmap_single(m_dma, dlen, DMA_TO_DEVICE);
+       if (!cmh_dma_map_error(sig_dma))
+               cmh_dma_unmap_single(sig_dma, sig_sz, DMA_TO_DEVICE);
+
+out_free:
+       kfree(pk_buf);
+       kfree(m_buf);
+       kfree(sig_buf);
+       return ret;
+}
+
+static int cmh_slhdsa_set_pub_key(struct crypto_sig *tfm,
+                                 const void *key, unsigned int keylen)
+{
+       struct cmh_slhdsa_tfm_ctx *ctx = cmh_slhdsa_ctx(tfm);
+       u32 expected = slhdsa_pk_size(ctx->param_set);
+
+       if (keylen != expected)
+               return -EINVAL;
+
+       kfree(ctx->pub_key);
+       ctx->pub_key = NULL;
+       ctx->pub_key_len = 0;
+
+       ctx->pub_key = kmemdup(key, keylen, GFP_KERNEL);
+       if (!ctx->pub_key)
+               return -ENOMEM;
+
+       ctx->pub_key_len = keylen;
+       return 0;
+}
+
+static int cmh_slhdsa_set_priv_key(struct crypto_sig *tfm,
+                                  const void *key, unsigned int keylen)
+{
+       struct cmh_slhdsa_tfm_ctx *ctx = cmh_slhdsa_ctx(tfm);
+
+       /* Raw sk (4*n bytes) */
+       if (keylen != slhdsa_sk_size(ctx->param_set))
+               return -EINVAL;
+
+       return cmh_key_setkey_raw(&ctx->key, key, keylen, CORE_ID_HCQ);
+}
+
+static unsigned int cmh_slhdsa_key_size(struct crypto_sig *tfm)
+{
+       struct cmh_slhdsa_tfm_ctx *ctx = cmh_slhdsa_ctx(tfm);
+
+       /* crypto_sig_keysize() returns bits, not bytes */
+       return slhdsa_pk_size(ctx->param_set) * 8;
+}
+
+static unsigned int cmh_slhdsa_max_size(struct crypto_sig *tfm)
+{
+       struct cmh_slhdsa_tfm_ctx *ctx = cmh_slhdsa_ctx(tfm);
+
+       return slhdsa_get_sig_size(ctx->param_set);
+}
+
+static void cmh_slhdsa_exit(struct crypto_sig *tfm)
+{
+       struct cmh_slhdsa_tfm_ctx *ctx = cmh_slhdsa_ctx(tfm);
+
+       cmh_key_destroy(&ctx->key);
+       kfree(ctx->pub_key);
+       ctx->pub_key = NULL;
+}
+
+/* Generate init functions for all 12 parameter sets */
+#define SLHDSA_INIT(ps_val)                                            \
+       static int cmh_slhdsa_init_##ps_val(struct crypto_sig *tfm)     \
+       {                                                               \
+               struct cmh_slhdsa_tfm_ctx *ctx = cmh_slhdsa_ctx(tfm);   \
+               memset(ctx, 0, sizeof(*ctx));                           \
+               ctx->param_set = ps_val;                                \
+               return 0;                                               \
+       }
+
+SLHDSA_INIT(HCQ_SLHDSA_SHAKE_128S)
+SLHDSA_INIT(HCQ_SLHDSA_SHAKE_128F)
+SLHDSA_INIT(HCQ_SLHDSA_SHAKE_192S)
+SLHDSA_INIT(HCQ_SLHDSA_SHAKE_192F)
+SLHDSA_INIT(HCQ_SLHDSA_SHAKE_256S)
+SLHDSA_INIT(HCQ_SLHDSA_SHAKE_256F)
+SLHDSA_INIT(HCQ_SLHDSA_SHA2_128S)
+SLHDSA_INIT(HCQ_SLHDSA_SHA2_128F)
+SLHDSA_INIT(HCQ_SLHDSA_SHA2_192S)
+SLHDSA_INIT(HCQ_SLHDSA_SHA2_192F)
+SLHDSA_INIT(HCQ_SLHDSA_SHA2_256S)
+SLHDSA_INIT(HCQ_SLHDSA_SHA2_256F)
+
+#define SLHDSA_ALG(name, drv, ps_val) {                                        \
+               .sign           = cmh_slhdsa_sign,                      \
+               .verify         = cmh_slhdsa_verify,                    \
+               .set_pub_key    = cmh_slhdsa_set_pub_key,               \
+               .set_priv_key   = cmh_slhdsa_set_priv_key,              \
+               .key_size       = cmh_slhdsa_key_size,                  \
+               .max_size       = cmh_slhdsa_max_size,                  \
+               .init           = cmh_slhdsa_init_##ps_val,             \
+               .exit           = cmh_slhdsa_exit,                      \
+               .base = {                                               \
+                       .cra_name         = name,                       \
+                       .cra_driver_name  = drv,                        \
+                       .cra_priority     = 300,                        \
+                       .cra_module       = THIS_MODULE,                \
+                       .cra_ctxsize      = sizeof(struct cmh_slhdsa_tfm_ctx), \
+               },                                                      \
+       }
+
+static struct sig_alg cmh_slhdsa_algs[] = {
+       SLHDSA_ALG("slh-dsa-shake-128s", "cri-cmh-slh-dsa-shake-128s", HCQ_SLHDSA_SHAKE_128S),
+       SLHDSA_ALG("slh-dsa-shake-128f", "cri-cmh-slh-dsa-shake-128f", HCQ_SLHDSA_SHAKE_128F),
+       SLHDSA_ALG("slh-dsa-shake-192s", "cri-cmh-slh-dsa-shake-192s", HCQ_SLHDSA_SHAKE_192S),
+       SLHDSA_ALG("slh-dsa-shake-192f", "cri-cmh-slh-dsa-shake-192f", HCQ_SLHDSA_SHAKE_192F),
+       SLHDSA_ALG("slh-dsa-shake-256s", "cri-cmh-slh-dsa-shake-256s", HCQ_SLHDSA_SHAKE_256S),
+       SLHDSA_ALG("slh-dsa-shake-256f", "cri-cmh-slh-dsa-shake-256f", HCQ_SLHDSA_SHAKE_256F),
+       SLHDSA_ALG("slh-dsa-sha2-128s",  "cri-cmh-slh-dsa-sha2-128s",  HCQ_SLHDSA_SHA2_128S),
+       SLHDSA_ALG("slh-dsa-sha2-128f",  "cri-cmh-slh-dsa-sha2-128f",  HCQ_SLHDSA_SHA2_128F),
+       SLHDSA_ALG("slh-dsa-sha2-192s",  "cri-cmh-slh-dsa-sha2-192s",  HCQ_SLHDSA_SHA2_192S),
+       SLHDSA_ALG("slh-dsa-sha2-192f",  "cri-cmh-slh-dsa-sha2-192f",  HCQ_SLHDSA_SHA2_192F),
+       SLHDSA_ALG("slh-dsa-sha2-256s",  "cri-cmh-slh-dsa-sha2-256s",  HCQ_SLHDSA_SHA2_256S),
+       SLHDSA_ALG("slh-dsa-sha2-256f",  "cri-cmh-slh-dsa-sha2-256f",  HCQ_SLHDSA_SHA2_256F),
+};
+
+/**
+ * cmh_pqc_slhdsa_register() - Register SLH-DSA akcipher algorithms with the crypto framework
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+int cmh_pqc_slhdsa_register(void)
+{
+       int ret, i;
+
+       for (i = 0; i < ARRAY_SIZE(cmh_slhdsa_algs); i++) {
+               ret = crypto_register_sig(&cmh_slhdsa_algs[i]);
+               if (ret) {
+                       dev_err(cmh_dev(), "cmh: failed to register %s (%d)\n",
+                               cmh_slhdsa_algs[i].base.cra_name, ret);
+                       goto err_unregister;
+               }
+       }
+
+       return 0;
+
+err_unregister:
+       while (i--)
+               crypto_unregister_sig(&cmh_slhdsa_algs[i]);
+       return ret;
+}
+
+/**
+ * cmh_pqc_slhdsa_unregister() - Unregister SLH-DSA akcipher algorithms from the crypto framework
+ */
+void cmh_pqc_slhdsa_unregister(void)
+{
+       int i = ARRAY_SIZE(cmh_slhdsa_algs);
+
+       while (i--)
+               crypto_unregister_sig(&cmh_slhdsa_algs[i]);
+}
diff --git a/drivers/crypto/cmh/cmh_pqc_xmss.c b/drivers/crypto/cmh/cmh_pqc_xmss.c
new file mode 100644
index 000000000000..433ffcd6463d
--- /dev/null
+++ b/drivers/crypto/cmh/cmh_pqc_xmss.c
@@ -0,0 +1,230 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 Cryptography Research, Inc. (CRI).
+ * CMH LKM -- XMSS/XMSS-MT Signature Driver (verify-only, sig_alg, synchronous)
+ *
+ * Registers "xmss" and "xmss-mt" sig algorithms with verify-only
+ * callbacks.  Sign is not supported (stateful signature -- key
+ * management must happen externally).
+ *
+ * Verify: src = raw signature, digest = message bytes
+ * Public key: raw pk bytes (variable length, set via set_pub_key)
+ */
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <crypto/sig.h>
+#include <crypto/internal/sig.h>
+
+#include "cmh_sys.h"
+#include "cmh_hcq_abi.h"
+#include "cmh_txn.h"
+#include "cmh_dma.h"
+#include "cmh_pqc.h"
+
+#define XMSS_VCQ_CMDS  3       /* header + cmd + flush */
+
+struct cmh_xmss_tfm_ctx {
+       u8 *pub_key;
+       u32 pub_key_len;
+       u32 xmss_mt;            /* 0 = XMSS, 1 = XMSS-MT */
+};
+
+static inline struct cmh_xmss_tfm_ctx *cmh_xmss_ctx(struct crypto_sig *tfm)
+{
+       return crypto_sig_ctx(tfm);
+}
+
+/*
+ * XMSS/XMSS-MT verify (synchronous sig_alg)
+ *
+ * @src:    raw signature
+ * @slen:   signature length
+ * @digest: message bytes
+ * @dlen:   message length
+ *
+ * Returns 0 on successful verification, negative errno on failure.
+ */
+static int cmh_xmss_verify(struct crypto_sig *tfm,
+                          const void *src, unsigned int slen,
+                          const void *digest, unsigned int dlen)
+{
+       struct cmh_xmss_tfm_ctx *ctx = cmh_xmss_ctx(tfm);
+       struct core_dispatch d = cmh_core_select_instance(CMH_CORE_HCQ);
+       struct vcq_cmd vcq[XMSS_VCQ_CMDS];
+       u8 *sig_buf = NULL, *m_buf = NULL, *pk_buf = NULL;
+       dma_addr_t sig_dma = DMA_MAPPING_ERROR;
+       dma_addr_t m_dma = DMA_MAPPING_ERROR;
+       dma_addr_t pk_dma = DMA_MAPPING_ERROR;
+       int ret;
+
+       if (!ctx->pub_key)
+               return -EINVAL;
+       if (!slen || slen > XMSS_MAX_SIG_LEN)
+               return -EINVAL;
+       if (!dlen || dlen > XMSS_MAX_MSG_LEN)
+               return -EINVAL;
+
+       sig_buf = kmemdup(src, slen, GFP_KERNEL);
+       m_buf = kmemdup(digest, dlen, GFP_KERNEL);
+       pk_buf = kmemdup(ctx->pub_key, ctx->pub_key_len, GFP_KERNEL);
+       if (!sig_buf || !m_buf || !pk_buf) {
+               ret = -ENOMEM;
+               goto out_free;
+       }
+
+       sig_dma = cmh_dma_map_single(sig_buf, slen, DMA_TO_DEVICE);
+       m_dma = cmh_dma_map_single(m_buf, dlen, DMA_TO_DEVICE);
+       pk_dma = cmh_dma_map_single(pk_buf, ctx->pub_key_len, DMA_TO_DEVICE);
+
+       if (cmh_dma_map_error(sig_dma) || cmh_dma_map_error(m_dma) ||
+           cmh_dma_map_error(pk_dma)) {
+               ret = -ENOMEM;
+               goto out_unmap;
+       }
+
+       vcq_set_header(&vcq[0], XMSS_VCQ_CMDS);
+       vcq_add_hcq_xmss_verify(&vcq[1], d.core_id, ctx->xmss_mt,
+                               ctx->pub_key_len, slen, dlen,
+                               pk_dma, sig_dma, m_dma);
+       vcq_add_hcq_flush(&vcq[2], d.core_id);
+
+       /* XMSS verify traverses Merkle hash chains -- inherently slow */
+       ret = cmh_tm_submit_sync_tmo(vcq, XMSS_VCQ_CMDS, 1, d.mbx_idx,
+                                    cmh_tm_slow_op_timeout_jiffies());
+
+out_unmap:
+       if (!cmh_dma_map_error(pk_dma))
+               cmh_dma_unmap_single(pk_dma, ctx->pub_key_len, DMA_TO_DEVICE);
+       if (!cmh_dma_map_error(m_dma))
+               cmh_dma_unmap_single(m_dma, dlen, DMA_TO_DEVICE);
+       if (!cmh_dma_map_error(sig_dma))
+               cmh_dma_unmap_single(sig_dma, slen, DMA_TO_DEVICE);
+
+out_free:
+       kfree(pk_buf);
+       kfree(m_buf);
+       kfree(sig_buf);
+       return ret;
+}
+
+static int cmh_xmss_set_pub_key(struct crypto_sig *tfm,
+                               const void *key, unsigned int keylen)
+{
+       struct cmh_xmss_tfm_ctx *ctx = cmh_xmss_ctx(tfm);
+
+       if (!keylen || keylen > XMSS_MAX_PK_LEN)
+               return -EINVAL;
+
+       kfree(ctx->pub_key);
+       ctx->pub_key = NULL;
+       ctx->pub_key_len = 0;
+
+       ctx->pub_key = kmemdup(key, keylen, GFP_KERNEL);
+       if (!ctx->pub_key)
+               return -ENOMEM;
+
+       ctx->pub_key_len = keylen;
+       return 0;
+}
+
+static unsigned int cmh_xmss_key_size(struct crypto_sig *tfm)
+{
+       struct cmh_xmss_tfm_ctx *ctx = cmh_xmss_ctx(tfm);
+
+       return ctx->pub_key_len * 8;
+}
+
+static int cmh_xmss_init(struct crypto_sig *tfm)
+{
+       struct cmh_xmss_tfm_ctx *ctx = cmh_xmss_ctx(tfm);
+
+       memset(ctx, 0, sizeof(*ctx));
+       return 0;
+}
+
+static int cmh_xmss_mt_init(struct crypto_sig *tfm)
+{
+       struct cmh_xmss_tfm_ctx *ctx = cmh_xmss_ctx(tfm);
+
+       memset(ctx, 0, sizeof(*ctx));
+       ctx->xmss_mt = 1;
+       return 0;
+}
+
+static void cmh_xmss_exit(struct crypto_sig *tfm)
+{
+       struct cmh_xmss_tfm_ctx *ctx = cmh_xmss_ctx(tfm);
+
+       kfree(ctx->pub_key);
+       ctx->pub_key = NULL;
+}
+
+static struct sig_alg cmh_xmss_algs[] = {
+       {
+               .verify         = cmh_xmss_verify,
+               .set_pub_key    = cmh_xmss_set_pub_key,
+               .key_size       = cmh_xmss_key_size,
+               .init           = cmh_xmss_init,
+               .exit           = cmh_xmss_exit,
+               .base = {
+                       .cra_name         = "xmss",
+                       .cra_driver_name  = "cri-cmh-xmss",
+                       .cra_priority     = 300,
+                       .cra_module       = THIS_MODULE,
+                       .cra_ctxsize      = sizeof(struct cmh_xmss_tfm_ctx),
+               },
+       },
+       {
+               .verify         = cmh_xmss_verify,
+               .set_pub_key    = cmh_xmss_set_pub_key,
+               .key_size       = cmh_xmss_key_size,
+               .init           = cmh_xmss_mt_init,
+               .exit           = cmh_xmss_exit,
+               .base = {
+                       .cra_name         = "xmss-mt",
+                       .cra_driver_name  = "cri-cmh-xmss-mt",
+                       .cra_priority     = 300,
+                       .cra_module       = THIS_MODULE,
+                       .cra_ctxsize      = sizeof(struct cmh_xmss_tfm_ctx),
+               },
+       },
+};
+
+/**
+ * cmh_pqc_xmss_register() - Register XMSS/XMSS-MT sig algorithms with the crypto framework
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+int cmh_pqc_xmss_register(void)
+{
+       int ret, i;
+
+       for (i = 0; i < ARRAY_SIZE(cmh_xmss_algs); i++) {
+               ret = crypto_register_sig(&cmh_xmss_algs[i]);
+               if (ret) {
+                       dev_err(cmh_dev(), "cmh: failed to register %s (%d)\n",
+                               cmh_xmss_algs[i].base.cra_name, ret);
+                       goto err_unregister;
+               }
+       }
+
+       return 0;
+
+err_unregister:
+       while (i--)
+               crypto_unregister_sig(&cmh_xmss_algs[i]);
+       return ret;
+}
+
+/**
+ * cmh_pqc_xmss_unregister() - Unregister XMSS/XMSS-MT sig algorithms from the crypto framework
+ */
+void cmh_pqc_xmss_unregister(void)
+{
+       int i = ARRAY_SIZE(cmh_xmss_algs);
+
+       while (i--)
+               crypto_unregister_sig(&cmh_xmss_algs[i]);
+}
--
2.43.7


** This message and any attachments are for the sole use of the intended recipient(s). It may contain information that is confidential and privileged. If you are not the intended recipient of this message, you are prohibited from printing, copying, forwarding or saving it. Please delete the message and attachments and notify the sender immediately. **

Rambus Inc.<http://www.rambus.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
