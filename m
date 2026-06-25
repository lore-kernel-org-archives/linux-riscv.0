Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B65E6CDE00B
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jun 2026 17:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=52Hd02E+j/03QIR7CshwzMtOC26UlH7X/pm/5tY9n1o=; b=Zr5K+j0H0KxQzA
	0Kr34+Y284niNc6L5ijuD0Byy35SgCA1sVY0kHBWxzDhF13OrCgzu1w6oV44hCLg8w6i6ScNxTMt7
	wcGW3zHinqB9puls59ddjPbGyzRkOG9GEre3rdTfdglA0JDhyr5+mmrdjJ/X0aGqe2BvGQRfPqMb1
	wQQ4UsAcg6UTPKnfuRnrfUO4zNqJFbb5rh6G8YV+rg/JZWK4dhzyfEtIUwWImCGzP50wx4I6ozsK4
	x+AwyI/DT+pHcXk6si+Wc7JNkCpS9UkjdNSenACcTK88qyhF6FFQiULLpNEcBuHoIy0jOMXKBITHG
	i+9MPzqWm2itp5hYZQ3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcny4-00000009XRG-22cz;
	Thu, 25 Jun 2026 17:34:24 +0000
Received: from mail-eastus2azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c110::3] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcnxy-00000009XLW-3dcR
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jun 2026 17:34:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=poVvdcAZtwvniZEipvh2mNStze1A+DTZIsmgp1nkoNQphg6ywcTW963AusjmGCE+MabSxOJzp9vQfLEGMNAOAEGTywbczShunFJ7t07ZT8ZKFdySSlFL3EtSCYrFFKRpYya7LV9s6QEpJcWnpMf9mBHdPcgkt/7INnv6cN9zhmtqag7b+e913GCGjwEDubRl0xXePFR6uIb3CrgZ9qFJw1LHVvdSwHs/8BKLB9RwEQeTcnk9fcQUOblKYy9xALLyy58i5ecvtpVsW+LIDf1XCcFfg0u0abRVyVR7H6DEjkYwqSydpli5PevKC3l44EzLHcL8o26XmogIyC4de8vahA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2dZ2EceBQiOCBx9s+wmI/nw4VVrIQ7MiycsHk1oFfCw=;
 b=dqXZU5Rp/Xu7ES6EMPQgRCxGMrsBTGFcRDcfYI9+ms+UPmz1pqBll3RIcSdBr52O2Sh484z3HapbZmE1uoNGsviHyk5NLK00TQy1Q2hK6VYRWNvbsbRFgTwT2gARXBytUP5TWkAbOANdszveerYpHdeU/Opy5oDWqaAVScTV7vRMgTp0mEWOK4BVidsgkKmmHzmeXgmHOHBNybNEH3R1+9lO3QHRA/rmvtpllS/41RcKN8L0ZMrDc+r3iv7BVDcQdEnXnMfgKijhO6V0Mje3Ek24ASeAZeiWSX0q7OIcz93cAtlbs6KVhBjy5FGePwM7kpVDwjRX50v3fkOyWkTfKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.86.86.210) smtp.rcpttodomain=cryptography.com smtp.mailfrom=rambus.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=rambus.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rambus.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2dZ2EceBQiOCBx9s+wmI/nw4VVrIQ7MiycsHk1oFfCw=;
 b=OVAVTvE88fw32vWw/80jYdf+PB/xmog345J8hLcmouh4Jh/UgjAAHu4PhfevWyC9xBcLqKb3Gcl5jmfkATyZ+OAkTWF0c/5bWSlW9stpt9PXOoMAC1VOLn645+jBecl86gjddMg/gknCuOUj03GkpjWKBj5PTLUwBix+cFGP4AdaTiSGfyZ9pDuLP8vhHoTtboZ/OpIqmsLbyMni7aT7XNRU9lVLDR2y9ua2/PTzdpnfwdTIKaJSYP6+DGwCX9lrXdMnHTpmvLR+TSCiX52JrtQPDyBRLhexxtc0QCLVsgJ8ZpUerwMww8Od3iwklv07yqXqOcRoWixXq1XK0Omwpw==
Received: from SA1PR03CA0010.namprd03.prod.outlook.com (2603:10b6:806:2d3::26)
 by SJ0PR04MB7726.namprd04.prod.outlook.com (2603:10b6:a03:31b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Thu, 25 Jun
 2026 17:34:10 +0000
Received: from SA2PEPF00003AE7.namprd02.prod.outlook.com
 (2603:10b6:806:2d3:cafe::9f) by SA1PR03CA0010.outlook.office365.com
 (2603:10b6:806:2d3::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.16 via Frontend Transport; Thu,
 25 Jun 2026 17:34:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.86.86.210)
 smtp.mailfrom=rambus.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=rambus.com;
Received-SPF: Pass (protection.outlook.com: domain of rambus.com designates
 192.86.86.210 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.86.86.210; helo=hqxsv-psmtppxy02.rambus.com; pr=C
Received: from hqxsv-psmtppxy02.rambus.com (192.86.86.210) by
 SA2PEPF00003AE7.mail.protection.outlook.com (10.167.248.7) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Thu, 25 Jun 2026 17:34:09 +0000
Received: from hqxsv-cmdev3-skrishnamoorthy.rambus.com (hqn-lb-int-float.rambus.com [10.12.20.20])
	by hqxsv-psmtppxy02.rambus.com (Postfix) with ESMTPS id 8F92A1801801;
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
Subject: [PATCH 18/19] selftests: crypto: cmh - add kselftest for management ioctl
Date: Thu, 25 Jun 2026 10:33:26 -0700
Message-ID: <20260625173328.1140487-19-skrishnamoorthy@rambus.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260625173328.1140487-1-skrishnamoorthy@rambus.com>
References: <20260625173328.1140487-1-skrishnamoorthy@rambus.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE7:EE_|SJ0PR04MB7726:EE_
X-MS-Office365-Filtering-Correlation-Id: fa0cfd94-6936-4f49-8d8b-08ded2dff739
X-LD-Processed: bd0ba799-c2b9-413c-9c56-5d1731c4827c,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|82310400026|7416014|376014|1800799024|921020|3023799007|18002099003|22082099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: Qx9jPshn3PJbbuD3dSUeW+NKay0LHWBheSZw53b3fJVuFa0QDa5QEmj2Hn9AWtI9NzBYDkcS07HLXW+/voeKWhYC3QjeEH9Fj8cLzZHXlgec3PtP46q4fxxvJQWSPUGyNsJJeTT3LefC0nAoyBMEtcDHNCbWsxsmmKm9Eywfmc8xXwl6k8FMAzIJsICb5O5TgtwikPxRTzDFEzPPI5EZyW3+toa9cG6o43mWxxH/3zKk7OIMVcA1WZfUo2vdzsTdjNIaZxuqKlIyrxZgGq8X7EJd2Ouu6XOlJv46wu8w2jyYFlBN3I0MssVIrY0poxYaWV6w23v1N6Jk/3OF6mb7S9f6P3qvo39212VRieEovpm3seEONY0IZTKKm5MFxaVOubpEUVfa2gj6TUERal54s1mLlSRexF2s39tsR8kwn0FSdXc/a3cIQsnThQyS9MOfqEdmvGsvcyOKDdb7mfyfJXCdfnxeD6TNBEqMSF8q7WOSwezNSa2CYGKKY7gaKKkK0enDpNIv4ZkadXdeR5+q0sr8nr1oGdaPnUlwkwBUER0EgcUInJnyF5yFF3MbuBmyjVrRNvHmxwldDwj8P9AlHm1XFOHV0A+bHyL87gPg2E03A3bYKQlYPtGtmStippI87o2lfsFG5N7eUt12ZDrqZqP6VEQmyDhOEpdjEmsVFT85wnvY4pWH38OXwp4xOCCAmiBT6+WxNknhwOJ5sPNJghP9F9TXV8TF/5M9EdmpDAG/RnfTWoFJm5iSBd3H7UKw
X-Forefront-Antispam-Report: CIP:192.86.86.210;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hqxsv-psmtppxy02.rambus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(7416014)(376014)(1800799024)(921020)(3023799007)(18002099003)(22082099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Vg/Aga+ZH5NMhUdYa+OLEwlicd9W+3RQXylJqAu7XqK6FALJpk94RVGNTwLG1JbsttHv930FlWcV5kFIlmzeCfGZzA1THuwQacsx7IjweSbH0CvZlx4Q237+Y3J9rDEytOBUX+Ur37ek1c6eafOs8dnQjyEv6AqiJV1ny5eiGMkFw+UYtPpSb113/jk/9PQ60DnrvblD9xEQglwquiZdioH8nwXU0LwBQrri0aLzEDa/F/SOX4lP2LjYxIawiTRcrg3S6aX+TplGgFWGFGrCM1qPjzo2jOyJmJJhQaaiH4FMQrLwXb1MC6dtuI0M6iTt1J5HeHxOAl3nv3hfBXBcJsWjw++Vqntv9xSZPLOlREmlvY2yvbXEraaQ8FrpVBqwh2QxL/mTVZIbG4WEBCB5sWBZYq5Tlhn/F4gZq05Gkygvyin2G5PO7LJVzHQxjuaM
X-OriginatorOrg: rambus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 17:34:09.9234
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa0cfd94-6936-4f49-8d8b-08ded2dff739
X-MS-Exchange-CrossTenant-Id: bd0ba799-c2b9-413c-9c56-5d1731c4827c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bd0ba799-c2b9-413c-9c56-5d1731c4827c;Ip=[192.86.86.210];Helo=[hqxsv-psmtppxy02.rambus.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7726
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_103419_022807_F4B188E0 
X-CRM114-Status: GOOD (  19.97  )
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

Add a minimal kselftest exercising the /dev/cmh_mgmt ioctl interface:

  - open/close the device node
  - invalid ioctl returns -ENOTTY
  - bad version field returns -EINVAL
  - KEY_NEW + KEY_DELETE lifecycle
  - KIC HKDF1 key derivation
  - ML-KEM-768 keygen via hardware RNG

Tests use the kselftest_harness.h fixture framework and output TAP.
Tests that require hardware features not present on the device under
test are gracefully skipped (SKIP).

Co-developed-by: Saravanakrishnan Krishnamoorthy <skrishnamoorthy@rambus.com>
Signed-off-by: Saravanakrishnan Krishnamoorthy <skrishnamoorthy@rambus.com>
Signed-off-by: Alex Ousherovitch <aousherovitch@rambus.com>
Reviewed-by: Joel Wittenauer <Joel.Wittenauer@cryptography.com>
Reviewed-by: Thi Nguyen <thin@rambus.com>
---
 .../selftests/drivers/crypto/cmh/Makefile     |   6 +
 .../drivers/crypto/cmh/cmh_mgmt_test.c        | 183 ++++++++++++++++++
 .../selftests/drivers/crypto/cmh/config       |   1 +
 3 files changed, 190 insertions(+)
 create mode 100644 tools/testing/selftests/drivers/crypto/cmh/Makefile
 create mode 100644 tools/testing/selftests/drivers/crypto/cmh/cmh_mgmt_test.c
 create mode 100644 tools/testing/selftests/drivers/crypto/cmh/config

diff --git a/tools/testing/selftests/drivers/crypto/cmh/Makefile b/tools/testing/selftests/drivers/crypto/cmh/Makefile
new file mode 100644
index 000000000000..86cb63839b27
--- /dev/null
+++ b/tools/testing/selftests/drivers/crypto/cmh/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0
+TEST_GEN_PROGS := cmh_mgmt_test
+
+CFLAGS += -Wall -Wno-misleading-indentation -O2 $(KHDR_INCLUDES)
+
+include ../../../lib.mk
diff --git a/tools/testing/selftests/drivers/crypto/cmh/cmh_mgmt_test.c b/tools/testing/selftests/drivers/crypto/cmh/cmh_mgmt_test.c
new file mode 100644
index 000000000000..4514b5a1349a
--- /dev/null
+++ b/tools/testing/selftests/drivers/crypto/cmh/cmh_mgmt_test.c
@@ -0,0 +1,183 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Kselftest for /dev/cmh_mgmt ioctl interface.
+ *
+ * Tests basic ioctl operations on the CRI CryptoManager Hub management
+ * device.  Requires the cmh module loaded on real or emulated hardware.
+ *
+ * Run:  ./cmh_mgmt_test
+ * Output: TAP format (compatible with kselftest harness)
+ */
+
+#include <errno.h>
+#include <fcntl.h>
+#include <stdint.h>
+#include <string.h>
+#include <unistd.h>
+#include <sys/ioctl.h>
+
+#include "kselftest_harness.h"
+#include <linux/cmh_mgmt_ioctl.h>
+
+#define CMH_DEV "/dev/cmh_mgmt"
+
+FIXTURE(cmh_mgmt)
+{
+       int fd;
+};
+
+FIXTURE_SETUP(cmh_mgmt)
+{
+       self->fd = open(CMH_DEV, O_RDWR);
+       if (self->fd < 0 && errno == ENOENT)
+               SKIP(return, "Device " CMH_DEV " not present (module not loaded?)");
+       if (self->fd < 0 && errno == EACCES)
+               SKIP(return, "Permission denied -- run as root or with CAP_SYS_ADMIN");
+       ASSERT_GE(self->fd, 0);
+}
+
+FIXTURE_TEARDOWN(cmh_mgmt)
+{
+       if (self->fd >= 0)
+               close(self->fd);
+}
+
+/*
+ * Test 1: open and close succeed.
+ * If we get here, FIXTURE_SETUP already validated the open.
+ */
+TEST_F(cmh_mgmt, open_close)
+{
+       ASSERT_GE(self->fd, 0);
+}
+
+/*
+ * Test 2: invalid ioctl number returns -ENOTTY.
+ */
+TEST_F(cmh_mgmt, invalid_ioctl)
+{
+       int ret;
+       unsigned long bogus_cmd = _IOC(_IOC_READ, 'J', 0xFF, 4);
+
+       ret = ioctl(self->fd, bogus_cmd, NULL);
+       ASSERT_EQ(ret, -1);
+       ASSERT_EQ(errno, ENOTTY);
+}
+
+/*
+ * Test 3: KEY_NEW with bad version field returns -EINVAL.
+ */
+TEST_F(cmh_mgmt, bad_version)
+{
+       struct cmh_ioctl_key_new req;
+       int ret;
+
+       memset(&req, 0, sizeof(req));
+       req.version = 0; /* invalid */
+       req.ds_type = CMH_DS_AES_KEY;
+       req.len = 32;
+       req.flags = CMH_FLAG_PT;
+       req.cid = 0xDEAD;
+
+       ret = ioctl(self->fd, CMH_IOCTL_KEY_NEW, &req);
+       ASSERT_EQ(ret, -1);
+       ASSERT_EQ(errno, EINVAL);
+}
+
+/*
+ * Test 4: KEY_NEW creates a key, KEY_DELETE destroys it.
+ */
+TEST_F(cmh_mgmt, key_new_delete)
+{
+       struct cmh_ioctl_key_new new_req;
+       struct cmh_ioctl_key_grant del_req;
+       int ret;
+
+       memset(&new_req, 0, sizeof(new_req));
+       new_req.version = CMH_MGMT_V1;
+       new_req.ds_type = CMH_DS_AES_KEY;
+       new_req.len = 32;
+       new_req.flags = CMH_FLAG_PT;
+       new_req.cid = 0x5E1F7E57ULL; /* "SELFTEST" */
+
+       ret = ioctl(self->fd, CMH_IOCTL_KEY_NEW, &new_req);
+       ASSERT_EQ(ret, 0);
+       ASSERT_NE(new_req.ref, (uint64_t)0);
+
+       /* Delete the key */
+       memset(&del_req, 0, sizeof(del_req));
+       del_req.version = CMH_MGMT_V1;
+       del_req.ref = new_req.ref;
+
+       ret = ioctl(self->fd, CMH_IOCTL_KEY_DELETE, &del_req);
+       ASSERT_EQ(ret, 0);
+}
+
+/*
+ * Test 5: KIC HKDF1 key derivation from hardware base key.
+ * Requires at least one KIC base key provisioned (KIC_KEY1).
+ */
+TEST_F(cmh_mgmt, kic_hkdf1)
+{
+       struct cmh_ioctl_kic_hkdf1 req;
+       static const char label[] = "kselftest-label";
+       int ret;
+
+       memset(&req, 0, sizeof(req));
+       req.version = CMH_MGMT_V1;
+       req.key_len = 32;
+       req.base_key = CMH_KIC_KEY1;
+       req.cid = 0x4B534C46ULL; /* "KSLF" */
+       req.label = (uint64_t)(uintptr_t)label;
+       req.label_len = sizeof(label) - 1;
+       req.flags = CMH_KIC_FLAG_TEMP;
+
+       ret = ioctl(self->fd, CMH_IOCTL_KIC_HKDF1, &req);
+       if (ret < 0 && errno == EIO)
+               SKIP(return, "KIC base key 1 not provisioned on this device");
+       ASSERT_EQ(ret, 0);
+       ASSERT_NE(req.ref, (uint64_t)0);
+}
+
+/*
+ * Test 6: ML-KEM-768 keygen using hardware RNG.
+ * Verifies the PQC keygen path end-to-end.
+ */
+TEST_F(cmh_mgmt, ml_kem_keygen)
+{
+       struct cmh_ioctl_ml_kem_keygen req;
+       /* ML-KEM-768: ek = 384*3+32 = 1184, dk = 768*3+96 = 2400 */
+       uint8_t ek[1184];
+       uint8_t dk[2400];
+       int ret;
+
+       memset(&req, 0, sizeof(req));
+       req.version = CMH_MGMT_V1;
+       req.k = 3; /* ML-KEM-768 */
+       req.flags = CMH_QSE_FLAG_HW_RNG;
+       req.seed = 0; /* HW RNG */
+       req.z = 0;    /* HW RNG */
+       req.ek = (uint64_t)(uintptr_t)ek;
+       req.dk = (uint64_t)(uintptr_t)dk;
+       req.dk_cid = 0;
+       req.dk_ref = 0;
+
+       memset(ek, 0, sizeof(ek));
+       memset(dk, 0, sizeof(dk));
+
+       ret = ioctl(self->fd, CMH_IOCTL_ML_KEM_KEYGEN, &req);
+       if (ret < 0 && errno == ENODEV)
+               SKIP(return, "QSE core not available on this hardware");
+       ASSERT_EQ(ret, 0);
+
+       /* Verify output is non-zero (extremely unlikely for random keys) */
+       {
+               int i, nonzero = 0;
+
+               for (i = 0; i < 64; i++)
+                       nonzero += (ek[i] != 0);
+               ASSERT_GT(nonzero, 0);
+       }
+}
+
+TEST_HARNESS_MAIN
diff --git a/tools/testing/selftests/drivers/crypto/cmh/config b/tools/testing/selftests/drivers/crypto/cmh/config
new file mode 100644
index 000000000000..063c1dd0e23b
--- /dev/null
+++ b/tools/testing/selftests/drivers/crypto/cmh/config
@@ -0,0 +1 @@
+CONFIG_CRYPTO_DEV_CMH=m
--
2.43.7


** This message and any attachments are for the sole use of the intended recipient(s). It may contain information that is confidential and privileged. If you are not the intended recipient of this message, you are prohibited from printing, copying, forwarding or saving it. Please delete the message and attachments and notify the sender immediately. **

Rambus Inc.<http://www.rambus.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
