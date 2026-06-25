Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA3ACDE012
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jun 2026 17:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nsxHSlTBbfES/RmX/MvA9Cr3MYX+z7VvkBU8db0f7MA=; b=DNYlwJ5A3ZmTgc
	OE6mwBZMT5IRHTzamRqOkHsF03XrpeL37GjUWsMpSLpdgEi+a69Z1DqJfZ2xM5Uyz4HFczBPIGzTa
	jZz12dXBfF6KI9BCe38Rua7I387RPGYl2UIDr8UVB4IXS+VKcYrvi/mavFxFqdcW7sQ4aQIv+UWaa
	drHaU2R1VhVYIx7XnsNgWXfaRfrubMZMfL/gSR9sBBCLvBPZqY9sJwb6mYGKGVIIJcuEWq4ObRN60
	vykBdkv28E0f9oHRTzeSWLsjnIZX8Zw0tv/xrM0/aHRKZI9iZFBktZ3RA7XLbcqHWg95xau33wM0b
	gRTrcL6+XE+EAt/QfrLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcny0-00000009XNu-2dIJ;
	Thu, 25 Jun 2026 17:34:20 +0000
Received: from mail-northcentralusazon11023123.outbound.protection.outlook.com ([40.107.201.123] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcnxx-00000009XLG-1Kp5
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jun 2026 17:34:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EmK68oU2oaV4t590qwz+J9p2CyIEl1Fttq1Vu46NuwHxUiEZbzELJZrsR987ydZrFUmSP5h4Q2s4z3AyrjTLri4bhw09F1b62x0j6NkdQxHgUvEpLDLCDzZBLzkzMiMqnSNaYFWKjzOsW0gpKoOXe4jQNGEdj/tRYH/ocQe2iFOqHh4SdGCwX0UTgE0lV+VEqKyI10zINiZ93xDOZifVSpdHwyRLbT7TJZ1jC9wuJrPdU3dEck9HdaIhpvS5y8/1hc51R+JCw5Rb9hF7oqjlwGHsE1Vhd4h4JqENcYJbmk8Rt1DyZbWwjIlWNwwWmOWP6MxNz+NdtV85DcbxII9dVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/3/a4Fm0bgWXNMRw8/5ZwMOyNawyFZztKFFN500z1os=;
 b=NEtPUt5AT8jdeWubDZDiF7Hll0f0mC/RUGGrld+sQkcQYS+ICnYCx2RkC98ZphVTuprNyR5qy7IJnvs8TxAccmS+l1fLThWtyb7NCHggtDvg7duec6bS/HJxFxlTdW+I+wrCW5dVEh18bxpDQq/WRo58lYyvraJutlF7IeyWCMCZFUzkK+p4KOH3KspV+bnrBQSCgBUYHA0dDPXyTTV81aYrq7bggusm4JfDCyXOL6GFaSzrECigrOeMqfDLdGxGdVdL5xAcQyQoCUBMbiZmMxVHGJNhhKK5PqVBnoWJfwR7kYFCuMDCOZM/yTA7ugCq9srr6mf/b8BwAiWmk0qC6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.86.86.210) smtp.rcpttodomain=cryptography.com smtp.mailfrom=rambus.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=rambus.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rambus.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/3/a4Fm0bgWXNMRw8/5ZwMOyNawyFZztKFFN500z1os=;
 b=PNFJpP5ge5WvLK41G5Hhdv1mZfMSU7IYSNfDCrWof32ZzOhiSghHJU1nQScEe6s1IcEFMhG1fkY+NQCMx0DFUB3qmgOd65XinRQ9Y5luLhczhAfNgp3yrn8eKPFWHkYZQBNheGI1PNHcYasUzEqvTUaj7oMKB7Vbk+H1Mr1tCH0/RLPFlbEdFdQgKBvLjGXmM7fvJNN9PJI8JyUdmsZrXhrjhH8ae3GYqu7UA1RXFtzl3I1HgVBdZ4h894yb81OUX/4f/R4PhfzHNcJHMwEZnrzxfyOayOvY8rkUZl0GG4ulBdEYP/L/wNC/5YU3dXFvnOK8HGaRkshEPER6JckxgQ==
Received: from BN9PR03CA0863.namprd03.prod.outlook.com (2603:10b6:408:13d::28)
 by IA3PR04MB9301.namprd04.prod.outlook.com (2603:10b6:208:51b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Thu, 25 Jun
 2026 17:34:10 +0000
Received: from BN2PEPF0000449E.namprd02.prod.outlook.com
 (2603:10b6:408:13d:cafe::47) by BN9PR03CA0863.outlook.office365.com
 (2603:10b6:408:13d::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.15 via Frontend Transport; Thu,
 25 Jun 2026 17:34:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.86.86.210)
 smtp.mailfrom=rambus.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=rambus.com;
Received-SPF: Pass (protection.outlook.com: domain of rambus.com designates
 192.86.86.210 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.86.86.210; helo=hqxsv-psmtppxy02.rambus.com; pr=C
Received: from hqxsv-psmtppxy02.rambus.com (192.86.86.210) by
 BN2PEPF0000449E.mail.protection.outlook.com (10.167.243.149) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Thu, 25 Jun 2026 17:34:10 +0000
Received: from hqxsv-cmdev3-skrishnamoorthy.rambus.com (hqn-lb-int-float.rambus.com [10.12.20.20])
	by hqxsv-psmtppxy02.rambus.com (Postfix) with ESMTPS id 9EEF41801802;
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
Subject: [PATCH 19/19] MAINTAINERS: add Rambus CryptoManager Hub (CMH)
Date: Thu, 25 Jun 2026 10:33:27 -0700
Message-ID: <20260625173328.1140487-20-skrishnamoorthy@rambus.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260625173328.1140487-1-skrishnamoorthy@rambus.com>
References: <20260625173328.1140487-1-skrishnamoorthy@rambus.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449E:EE_|IA3PR04MB9301:EE_
X-MS-Office365-Filtering-Correlation-Id: ce8f2c94-c2f6-4bca-c4c8-08ded2dff768
X-LD-Processed: bd0ba799-c2b9-413c-9c56-5d1731c4827c,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|82310400026|376014|7416014|1800799024|921020|6133799003|18002099003|22082099003|13003099007|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: vUM1AwQ9MLAuVvOlrESPCo0T8t6DP0H1ldCOBnAdTF0Z6c2RM1IlhzGn9WhNBf10IekrOBosW+FgWM7irZKsXiLbA1DrPcH5Q7aRDYlU1+zy7wT7rO2FMPyHRiQyIpGuWdWBE5sCGx2cs+VjxbBPxkvubspk7pz0M6yf4yYnA22xpxQaXnYUnbqfJ9VLBjyXH+Z3n4tmAbYCT0795RXBHksDJOGJrBof5oqshD1JAXw7NeLUxg+1mEOt3Rbg+GERYBragHU4rm8rPjsa1gY2COFiDa/yN0IKOPKXwAqdzGGQuGJVm7wIXElblQkEMCnYWomAh8TsOZWAGAboPjo47J6polggguJIao/BKJ6kKX8q27ocCtrLezraCFVrPyR40Cbs1nU8ZrcxEboP2kQdrs6Ky1jVCuAMYJFNCsBfuSCR3/unh+sdLsBtkbaAZY2LQIb20BdlVpRSlGgjHyfB8EVGprtxzTFq5OW09OisV1IjcPmyC5DqagGFZERvPzHwULPj0uFoKN+liJowbMlwxtF6eZEIBjnvBn3Y6xVMO/jfuQV5qQaIS/wNkTtebHQLkeQLO4G2KDB51sdR++YCAtzpS4WKgXCpJI73HSvC7JnvyEt4ksvqEaroKtMp9zIrWXXk7T10RZ/FhCshe7FuS432N4uFKslu6Pf+CGObkfVGGZPE9onPljQikQqvleI/MUmEVfWl8Kqmmtxweft2ioqtFKQuXDNHXcJoWkbK3YLWeNik0/IX7TsC98Qx0sOw
X-Forefront-Antispam-Report: CIP:192.86.86.210;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hqxsv-psmtppxy02.rambus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(376014)(7416014)(1800799024)(921020)(6133799003)(18002099003)(22082099003)(13003099007)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: HKmx1Mnzgc+rLXB+egtQbNpbbz5JcDbEPx2vUQADlxN/UjPzjxMyg9fe/l8pQXjGPG/xGfKMnU0Xxsotu1eq8JgJCjm8JzNejbwVlJMgkCzaAG0Ji3d4E9k29QvjvKgjNDECFmpEYW4wSC//lWjNVdJ+FAxqnR0gBVXgiTmVO7mfcwEoLXC/Xe0JegHKmric6uTOjyAFvxDrnPIeCPKVa3Y26a3S9Hgwsz7ybZmXUgS0CKz4mijH/9nN6SzLYJbzekQWtF9A/wWwiS9yZ0Kb3uRpXYfIoEWvin+GyxL11ecPgBnsas/yWsThbxuR/eJzFkzEfuoSyO3IysA4zINVWjorkk0utkS2BXWe9Ww6V/qIZOKv7Xl1n1AXDh+4EaBNaCQSWXvus0yy+swco+ayxMDK+Jj2mAQM376ZnbnS1mH+31wNTF0SeFij+BePdhDJ
X-OriginatorOrg: rambus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 17:34:10.1895
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce8f2c94-c2f6-4bca-c4c8-08ded2dff768
X-MS-Exchange-CrossTenant-Id: bd0ba799-c2b9-413c-9c56-5d1731c4827c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bd0ba799-c2b9-413c-9c56-5d1731c4827c;Ip=[192.86.86.210];Helo=[hqxsv-psmtppxy02.rambus.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000449E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR04MB9301
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_103417_358997_31356A3D 
X-CRM114-Status: UNSURE (   7.92  )
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

From: Alex Ousherovitch <aousherovitch@rambus.com>

Add MAINTAINERS entry for the CRI CryptoManager Hub (CMH) hardware
crypto accelerator driver under drivers/crypto/cmh/.

Co-developed-by: Saravanakrishnan Krishnamoorthy <skrishnamoorthy@rambus.com>
Signed-off-by: Saravanakrishnan Krishnamoorthy <skrishnamoorthy@rambus.com>
Signed-off-by: Alex Ousherovitch <aousherovitch@rambus.com>
Reviewed-by: Joel Wittenauer <Joel.Wittenauer@cryptography.com>
Reviewed-by: Thi Nguyen <thin@rambus.com>
---
 MAINTAINERS | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 90034eb7874e..ecb389795e3d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6797,6 +6797,25 @@ F:       kernel/cred.c
 F:     rust/kernel/cred.rs
 F:     Documentation/security/credentials.rst

+CRI CRYPTOMANAGER HUB (CMH) HARDWARE CRYPTO ACCELERATOR
+M:     Alex Ousherovitch <aousherovitch@rambus.com>
+M:     Saravanakrishnan Krishnamoorthy <skrishnamoorthy@rambus.com>
+R:     Joel Wittenauer <Joel.Wittenauer@cryptography.com>
+R:     Thi Nguyen <thin@rambus.com>
+L:     linux-crypto@vger.kernel.org
+L:     sipsupport@rambus.com (moderated for non-subscribers)
+S:     Maintained
+T:     git https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git
+F:     Documentation/ABI/testing/cmh-mgmt
+F:     Documentation/ABI/testing/debugfs-driver-cmh
+F:     Documentation/ABI/testing/sysfs-driver-cmh
+F:     Documentation/crypto/device_drivers/cmh.rst
+F:     Documentation/devicetree/bindings/crypto/cri,cmh.yaml
+F:     Documentation/userspace-api/ioctl/cmh_mgmt.rst
+F:     drivers/crypto/cmh/
+F:     include/uapi/linux/cmh_mgmt_ioctl.h
+F:     tools/testing/selftests/drivers/crypto/cmh/
+
 INTEL CRPS COMMON REDUNDANT PSU DRIVER
 M:     Ninad Palsule <ninad@linux.ibm.com>
 L:     linux-hwmon@vger.kernel.org
--
2.43.7


** This message and any attachments are for the sole use of the intended recipient(s). It may contain information that is confidential and privileged. If you are not the intended recipient of this message, you are prohibited from printing, copying, forwarding or saving it. Please delete the message and attachments and notify the sender immediately. **

Rambus Inc.<http://www.rambus.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
