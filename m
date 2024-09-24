Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB325CF9C6F
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Sep 2024 14:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EtikQte3Iz8LV2dr8xkkwykMdk7AAip5Y3olhWihfy8=; b=1/9vRTbyxtX2gm
	fIHsTpoKLzVs7hS5CpHbwX3DKKh0lYT8a9LAShCAg0FNQeqP+QOIKga8CLFq6Hjq+nJLiiFmfnW+i
	FdXdLs/3AybxMD80fpxGUtATu/6IJGvlNttko4gUcykffNlkeS1/oESJ0Vex0Hpts1Ia9aisQIasa
	JHCRQiIJscdFEYUwEuoffUxCSKsDTvDd5aoWDxP9l5TjghSiTGiYHR+mouAn0wtulz4bDyoDPGl03
	T6/Ca7GMDdzXzlQbCCKXtWCqdDLZS+M9soFbILuILJvvxa/2fQ7yq4FGTLRJRyqWb6QWOnOKDY0CP
	ED+FLAX4NDSWR5U9Iu/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st6fn-00000002Z7k-0XNy;
	Tue, 24 Sep 2024 14:37:51 +0000
Received: from mail-bn8nam12on20607.outbound.protection.outlook.com ([2a01:111:f403:2418::607] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st6f6-00000002Z3z-0Q7M
	for linux-riscv@lists.infradead.org;
	Tue, 24 Sep 2024 14:37:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R3lNEEQ05HldsGkeTgGr4NfzeGiSeRoWENlSna1ypTpWKQCKtqs0a/nmNUq+d/vCskNTuPm9k0UpfMLkpcNfFNbYI31Jru8FPRZwKlJNLn6y3XYPt/cSn0jPVFfuczbn7Dy27l+FEge7/9WZR2TlSKPMb7eb7zJguwZcsyoRev8liOqBC7wSwV6N7STrHp28Tf9f5hNdlKDSiOxU9ibhgNTf9YEcpECJ010BopGekMj8yJGP8FHkP2W4CPk6Jdi+xXwlekmf6hDQawmGhWJ5rkxgtEZGXbWz9+YJqi6hAIqOZjaqoV/kQ2lBa91RzIHaBxhm6YgonVHJFyRc8IHSHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d8RhvMHQwYh69HrpgJGRlCzaNweS5lpXP9ybs4fipCE=;
 b=be1oAuAxqEgItrUoVSmVqETdZYcBtahWqcODoDP/PQDKGQ7tRHOgtp4FIYoXxSyOZ3g46VQ0Pe6jfsEL0FO4IgIJyIN1RwGQyw39P5uai3IW6b/OiZaiNxW2fndotEFAGbp9fVExFQ0lRdaHNd3TfYjH2OaK1sCmEeshMJX3EDVZM+qbjAGl1J2ksAlvg47u9otvLxS9iolrz6VeGA5sjl8LjKNCZ2afMrElvGQQAOHyNhAWeh4Y3oZdlB8iq+wcO7q+OfUX8vsHR+3iVZaNQ3RpToJHuliDaeSZrzxvMRZURG54EcpGLTEl3hQ2nh+nJJZNIJTGpz8T+ahXebNAww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d8RhvMHQwYh69HrpgJGRlCzaNweS5lpXP9ybs4fipCE=;
 b=uzSmxZiD8aTj0gTs1pwNIml0LSDJ+ccSve42GVIw1FMPu73ZPMoXIwb7M6lU4dUNT6/dqyy/ubs5I3duRMSkXPyQtefD4K2Gtw03knSOzzH3n/vcPqJIp0tCHgfEim2Gq1r0GDRG5cg2c5p1Fh50RgTkDC+EqsrnrMb5xpj9SJA=
Received: from SJ0PR03CA0003.namprd03.prod.outlook.com (2603:10b6:a03:33a::8)
 by IA1PR12MB6044.namprd12.prod.outlook.com (2603:10b6:208:3d4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Tue, 24 Sep
 2024 14:21:27 +0000
Received: from SJ1PEPF00002324.namprd03.prod.outlook.com
 (2603:10b6:a03:33a:cafe::c1) by SJ0PR03CA0003.outlook.office365.com
 (2603:10b6:a03:33a::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.23 via Frontend
 Transport; Tue, 24 Sep 2024 14:21:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002324.mail.protection.outlook.com (10.167.242.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8005.15 via Frontend Transport; Tue, 24 Sep 2024 14:21:26 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 24 Sep
 2024 09:21:24 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 24 Sep 2024 09:21:20 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <gregkh@linuxfoundation.org>, <mka@chromium.org>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<wentong.wu@intel.com>, <oneukum@suse.com>, <javier.carrasco@wolfvision.net>,
	<matthias@kaehlcke.net>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <git@amd.com>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>
Subject: [PATCH] usb: misc: onboard_usb_dev: introduce new config symbol for usb5744 SMBus support
Date: Tue, 24 Sep 2024 19:49:11 +0530
Message-ID: <1727187551-3772897-1-git-send-email-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.1.1
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: radhey.shyam.pandey@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002324:EE_|IA1PR12MB6044:EE_
X-MS-Office365-Filtering-Correlation-Id: bc225830-c9de-4367-8a78-08dcdca42d07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nqBH9JPlAXHUHjQEwnWSwVwZAQ4XwUMlOo2Qeheld0Lw6IW6mcTBsHjRgxKv?=
 =?us-ascii?Q?n4GkiOLpMr5xkcXgw67foCtJG9KesR7u9XOrQoeiwn3o2BflXUdA/O5UCMI1?=
 =?us-ascii?Q?ImXfoyGh1iqsdWqlI8SoeKlAWBdcGxNstDREGLO3Bx9JZ1pb8hfk3ctmOfdv?=
 =?us-ascii?Q?Y4pbLzNOcXmQTPNFRCo7R1aCY0Ov1xXrXgYoSPWozxF8k9jjNV0l9H1ky4FE?=
 =?us-ascii?Q?oi0TaU364E08gELJqGeb1qxZkoaQEncCnwkvR9SpF8+wxyUFYbpcZ5dlCf+2?=
 =?us-ascii?Q?xBwuTZ+UiojdWqlq0ncNe5LZf4jQJq64SACO5XCefgFlzw1RU1Tx4KtRC+i6?=
 =?us-ascii?Q?c+F8DfBYuSd4PZ0UmBNggdjGxC6ZCBtp3wf+46sC8JCYEAZI6S/t/uf9ZUZa?=
 =?us-ascii?Q?a4LJj3achYDGznu/cJPMo3Pplxg7/CFLN9g1IzRsLhWLKxOlgzQKC48K/gyc?=
 =?us-ascii?Q?GZ7cPWB9PLx/SOo51rzRLwXb51znr8UM5D5Y4Z/E+KIlwNhLm4taZHCSv+xe?=
 =?us-ascii?Q?f+wyKLEuRC0ZBjyNODYGfxaDg6UN1TBmBQncDQvu+JLK892Qxf4qNTNCFrlK?=
 =?us-ascii?Q?8Kgbn9bSnnB7I3HVFWETQnXZ5UoEl3zCm8Qm+hoACdMqw0WxaWawQIuitkD4?=
 =?us-ascii?Q?8zOa63FxnhYtwd4P0/FPlt0u4PHBWIoVDxcNI3lcB/HUxp4XUK/qWgwNvjPv?=
 =?us-ascii?Q?3nyjD6RwdsMeFpGLF57qJhHRBmU0ge5cOOX1Qb6e9AMib+ilKDoG3WatdKfb?=
 =?us-ascii?Q?NgKgZFUF+xmp+6ff+j1Aye/vUw2RS1s5nRfLqY7wKluWZf8cV6KwNYz3IRzK?=
 =?us-ascii?Q?zkkV928n0xeEKtJ4wgyggYYLhaoUDPhKVL6RWDj4sGGFGHtTqh171kXnkwBP?=
 =?us-ascii?Q?pUgDEanUzqI62KAG9gkHX2+JkXqKlevtJFkmfyLsFY0ZGPC0R2CD6ZU+qMw5?=
 =?us-ascii?Q?XlXhKiYLyBfuux00MjlF9jRuI/rzDZi5DgCR0R37eexkDrVzTVK+NaTVPcQr?=
 =?us-ascii?Q?NbyLOHESUHodZkPJokG6g/BMa9TguRUxru/mB6av9JUVsRgNUv52iLdL8b8Q?=
 =?us-ascii?Q?ZK67KayRSHXPysSelcZ0VyCeFWJSolwGmIFT4uIoWzNXVFYE9zKGBtS7qAby?=
 =?us-ascii?Q?iW1Yy1qxfuEdqSD6iWMvOeEv+MeocA83NFY1jQ2G6XqUz/nyHqZphLAeHvhl?=
 =?us-ascii?Q?h9JWpnIdS2MsF+J01l4I4LKdvNFcNJYIZloyKZiJNGcn+fGAFxeSDvZoifJM?=
 =?us-ascii?Q?GcS9NkjmZNuCm05Hvsd6rAJ6rwhYSQZk1yRXFcVAwTY/0FtsEfqsj6e0kXAG?=
 =?us-ascii?Q?P7MAL7OI/06YHdOFe547UNGgr8MNGHpu1MB5invb8NXbbTBGqloHvQ6YING7?=
 =?us-ascii?Q?chKyuVm7Ipcy6EThDN6DBjGzaJVip3kUBaElyvC7mcVt1NqFTuIdbIXVJsO9?=
 =?us-ascii?Q?OMUxUh5l3mdxHrM3JeyrGKW+iYWpla/P?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 14:21:26.6577
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc225830-c9de-4367-8a78-08dcdca42d07
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002324.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_073708_153394_1C0578D5 
X-CRM114-Status: GOOD (  16.26  )
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

Introduce new kernel config symbol for Microchip usb5744 SMBus programming
support. Since usb5744 i2c initialization routine uses i2c SMBus APIs these
APIs should only be invoked when kernel has I2C support. This new kernel
config describes the dependency on I2C kernel support and fix the below
build issues when USB_ONBOARD_DEV=y and CONFIG_I2C=m.

riscv64-linux-ld: drivers/usb/misc/onboard_usb_dev.o:
undefined reference to `i2c_find_device_by_fwnode'
drivers/usb/misc/onboard_usb_dev.c:408:(.text+0xb24): undefined
reference to `i2c_smbus_write_block_data'
<snip>

Parsing of the i2c-bus bus handle is not put under usb5744 kernel config
check as the intention is to report an error when DT is configured for
usb5744 SMBus support and kernel has USB_ONBOARD_DEV_USB5744 disabled.

Fixes: 6782311d04df ("usb: misc: onboard_usb_dev: add Microchip usb5744 SMBus programming support")
Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Suggested-by: Matthias Kaehlcke <matthias@kaehlcke.net>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202409140539.3Axwv38m-lkp@intel.com/
---
 drivers/usb/misc/Kconfig           | 11 +++++++++++
 drivers/usb/misc/onboard_usb_dev.c |  6 ++++--
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/misc/Kconfig b/drivers/usb/misc/Kconfig
index 50b86d531701..29976a93f122 100644
--- a/drivers/usb/misc/Kconfig
+++ b/drivers/usb/misc/Kconfig
@@ -331,3 +331,14 @@ config USB_ONBOARD_DEV
 	  this config will enable the driver and it will automatically
 	  match the state of the USB subsystem. If this driver is a
 	  module it will be called onboard_usb_dev.
+
+config USB_ONBOARD_DEV_USB5744
+	bool "Onboard USB Microchip usb5744 hub with SMBus support"
+	depends on (USB_ONBOARD_DEV && I2C=y) || (USB_ONBOARD_DEV=m && I2C=m)
+	default y
+	help
+	  Say Y here if you want to support onboard USB Microchip usb5744
+	  hub that requires SMBus initialization.
+
+	  This options enables usb5744 i2c default initialization sequence
+	  during hub start-up configuration stage.
diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
index 560591e02d6a..75dfdca04ff1 100644
--- a/drivers/usb/misc/onboard_usb_dev.c
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -311,7 +311,7 @@ static void onboard_dev_attach_usb_driver(struct work_struct *work)
 
 static int onboard_dev_5744_i2c_init(struct i2c_client *client)
 {
-#if IS_ENABLED(CONFIG_I2C)
+#if IS_ENABLED(CONFIG_USB_ONBOARD_DEV_USB5744)
 	struct device *dev = &client->dev;
 	int ret;
 
@@ -394,9 +394,11 @@ static int onboard_dev_probe(struct platform_device *pdev)
 
 	i2c_node = of_parse_phandle(pdev->dev.of_node, "i2c-bus", 0);
 	if (i2c_node) {
-		struct i2c_client *client;
+		struct i2c_client *client = NULL;
 
+#if IS_ENABLED(CONFIG_USB_ONBOARD_DEV_USB5744)
 		client = of_find_i2c_device_by_node(i2c_node);
+#endif
 		of_node_put(i2c_node);
 
 		if (!client) {

base-commit: ef545bc03a65438cabe87beb1b9a15b0ffcb6ace
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
