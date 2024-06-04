Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D43BC27C53
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jun 2024 08:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EPQHRnSsRXvTr/zZR091aiOSwYB94mFNmKWYGEWZVYw=; b=UVYM4vem59V8Dr
	Fbhz4ta/Q7IfAFj1QgTgnAaqDMOO1mrhQfY39uU3JipNm3Z3XZnsrexMMGCHd/WDDLls5aF2C7GYD
	qD8zzERaKHdQ5nVeQOmG1SwvNiabR3NcHFPZgCFrfp7xmetITvI9p/mA5U3075V4AO9mjxVR4KDS9
	dogBCPqyoGbzk0zi3wkms7edrrtbqDJzKg2KKelhLNdd/7bNAi4aeoy9RylVTmAvMtpp465lWEH92
	WkDWOoAIfdEHiZ7hjofCaED8wjoBdz7EcKmeHsyNgoOWjzpdHeRpLrtld09mMYtM7pOM6PgqLKH7f
	PIhVO7xjXkBOzTdcC+tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEPph-00000001iqk-2aJY;
	Tue, 04 Jun 2024 08:47:53 +0000
Received: from mail-bjschn02on2072b.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::72b] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEPpe-00000001ilc-0ua2
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jun 2024 08:47:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QsNuV6YPKr7c863xQz8mvPMhhoqmLDPC1h0K0x26RYkzXSexACLIY4Gb6drKBvWgPjl6wqbwLpWaEZKXd0K5f4VRiEUbKMCjUtvKUu4YweFo78LcCltcCKXLf33H6nBHQAvsD3CQdri6YCWmp+01ABSf/Ru61cqbXVwx0vthFkoGeNMz/M4fBXsug1LT3WSDJ5uPNTIosCHZFfjgQ4R305B8rrjOhahFjBCVe9dngu75a3ESirCZPWOQKmn5zGHzFDCGkv7QqrCs0FfdhdA13wgLU8hTNcdtZQte2eTzjU6FXyFe+BIumdZll6H/RRPsuJnUdrkCtWOmkCtzqnaiaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TQF2m83Ffd7qNLe6s919DvfNOvVVrFq7PZAn11pmlVA=;
 b=HjA5qOWASm9TBVK7+BFD8ByPOCliayAYPn4sx839LCK+4z5Ytw5GLc8g344imh+j7765FlZkCKdvAZCEc5kRSTjw1BUu4QKh6hKHxcRY3nnEVzSNS+Ngw7VWcBT31Kd88lBBnxEJock3Id3K6qqBbVMRDZE2qZfnaRrIN+72DnoPMN2q+BoR3HqlZyyamMTNOZc12MDVUrtZV6cYpBSaiDQGUv/NfJ4MGpxYXLldbXc1F5H3PGigVZOaj77h3U/KIxWWmD92y5WvetZKbC0JuinsUldMsjJIfPYzAV+9fjTUvMCo5w+0/DrmIzzXK+FZWR2K/nQ9lPUVAGp4HsA3iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1324.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:12::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.42; Tue, 4 Jun
 2024 08:47:39 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::61c0:a8fc:1462:bc54]) by
 ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn ([fe80::61c0:a8fc:1462:bc54%6])
 with mapi id 15.20.7587.043; Tue, 4 Jun 2024 08:47:39 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] serial: 8250_dw: Use reset array API to get resets
Date: Tue,  4 Jun 2024 16:47:28 +0800
Message-ID: <20240604084729.57239-3-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240604084729.57239-1-hal.feng@starfivetech.com>
References: <20240604084729.57239-1-hal.feng@starfivetech.com>
X-ClientProxiedBy: BJXPR01CA0055.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:12::22) To ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1324:EE_
X-MS-Office365-Filtering-Correlation-Id: 136bc39e-9cea-4899-7c99-08dc8472fd75
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230031|7416005|41320700004|366007|1800799015|52116005|38350700005|921011;
X-Microsoft-Antispam-Message-Info: nB2jKQ+e+snRLU5KXDZFO0nBvwoj1RHHT5gSWWvHHAr7Ni0rYFFkNIX6U/8Cp+IhPCX5wTNOgt5tJlR0+TL5cZGlC9dFlx7oVOuaivXl3H/24pt4FXPQIyXnOZ7Uro4EGGNxak2o+Vx/1YTx0WZSDqpn+ZckmgIR3Hz4FgZmEBxSy8Kydx5nC4P1qr+Pm+3Ls9Y+FCVbCS5SS+/2aUCb8/G1iBkqi8Wmu73l+kJmY2XiXG4ALx3FntfhCkb7671ri0GCXywSaqiqHhUJxKBngY9YkAlpVwqkuQ3zpkMsxL92trIBm7JneDJeZY5mUqCnmxzvZbmRLPV2+MUbB+9pnDlkOYw1bn3zjyB1Nv13NEdw+sxqkNTZVQ36T4Cw52FOvxeqUqS/9glt+qzPBO4GP4hRCa2NmeAsZ1b0GaoL7klZ8UbJn7HhpM5x35zhSV4eVmvrJBDutwmsroVnyGi2MatPn7zVumxi/iRuHUMBSFxwgf7/QgefK/iefGAJsS/ZsFOJy3lulOEqaJaUYcNw5EmdQRbqsBTXs5Dj50WmnB/Iulg7lBYiczcLp1gTm5NZYomwzo2grpj85B1hNEoi+rlWc9++PAtAEzryw53ulrEQQcvu3qhVR92qqb5I8Hv3/prE1i3Rxz/VcSj9d/vwJA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(7416005)(41320700004)(366007)(1800799015)(52116005)(38350700005)(921011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cxrFdzxuz2iHKJStZhLyMep7Bh3Ax8Hwesw3RN6X5oQvCAL2UMZmoHqYvcdf?=
 =?us-ascii?Q?YMJz9aMjynldR/JkvgJMR95a6uyqjCE7vDJa6X9VEbbkrvtFW/k2tyXvRC6G?=
 =?us-ascii?Q?buiZF/0CWDMC0kCLeFqOdgEiFufU2W+kRX+dWx43IDsLEqnE65hK0+PzbCtR?=
 =?us-ascii?Q?WgOkMfu4v8bhjrkF9y6zW642/5nCt7UzNmXLufGzdgeGvOS8fqnpTCFe03l+?=
 =?us-ascii?Q?9O3vDu19SR9fzspQ7gBGegtsEsvUmRZLex/Kdm0YvliL/zMD9nJ2ULdwfnez?=
 =?us-ascii?Q?kBG0n68a+ajFC5wSL8+LBu3r4dCgOahgT9nKwKwjRnHKJUdOSG16Ek2ofg8i?=
 =?us-ascii?Q?LYskz8WLh5sNUiE3dlTNxUqwEjIoN+Tjd5CtfEptrPVuhQQ4pvosvyPk89qV?=
 =?us-ascii?Q?wSAOX33h1OkGcvnaNltYIMltGcjDJtcU/YMNbSFo/Ojah7k9lbm0SPXN6DZe?=
 =?us-ascii?Q?v19QS2LcrJVI8DXvRHTTX1DU8fndrDyRaZSEgx/5nGQWaIXzSTTfIKy9uV+N?=
 =?us-ascii?Q?XMlmkK10BeJaT61rhzwWqqeium8TQJHLNTe18IedQis9h3afSCN7MrqRW9t1?=
 =?us-ascii?Q?IlPtw6eIbhGSNJDsZ6g5zbnTJAAOX+Kbdt8VY2YlZp00lmG79KhNgmThXyWE?=
 =?us-ascii?Q?CcEVH3d5SKeSg8JhPtcZXhXXkBv7FOd4PVRw/c+rcJglRmISNdvGRv4T5FWb?=
 =?us-ascii?Q?UwgE38w9/viZuw+aEmyj9Qbubi/LHOpRLHUY4kKcHNBlmwt5pXI3tDB28tk1?=
 =?us-ascii?Q?5X2gnuFfvKLMsKhwX0P7zfMBCA0HuxIkb5FwsmFvhQHYtBf/O2N6r1dJTJ/f?=
 =?us-ascii?Q?+MTHZXyTjqgBeV13baZNFPzB4hwY7s9BtIoZwpUdwxw/s0dd8VGtal4g74SO?=
 =?us-ascii?Q?hguh0bQ1AFw2hhUwn7rSTbF7gFOc8hCdRgU8fjhz2inERNqFGuX7rzVr/b/k?=
 =?us-ascii?Q?mvMCP4aat652hJYp51ZDgvbe1S3JwOi651BUkcSwFxWCa55RVWdpVGV526/q?=
 =?us-ascii?Q?c4g4E8tdtAiLo5cbBIGVaTr9AtJhUMGm8+LcLo7Qs7lMeQiznR/a6NHYAu5+?=
 =?us-ascii?Q?bik0oVqY1n7lyRGcZ07Qm38yu8bAC/MT5GWg4uzmJCFvysjTDNM+PD+I+D8r?=
 =?us-ascii?Q?6CGawmVt9Dn/pWi+KFr7ASiI+Tok6vkUxxLHXufmSRTGK/pLaYzMEwMqep8h?=
 =?us-ascii?Q?69Tn/pRy0zUzBgnmxtUAsFvkN/vOkk0msRjrGDT+f+jd/lC1DbDmf42SrxfS?=
 =?us-ascii?Q?SRTLrmONhvadErLrSAzBWVmXO0CKdPP+FBQ+aGAc4h8+9ey43HpXw7M4C4jf?=
 =?us-ascii?Q?YuFwZVu2c2ls/DcO8BIV3R9qRVmkEebS29Bu/34imN1sUn6qXJHyMoY/Xvff?=
 =?us-ascii?Q?3KHf2L6S7/cx5WqZwFyYSKqwZUmVZ4tvFFj8dZhgsROMAhBhUdfBWt7Y9HiL?=
 =?us-ascii?Q?truH3oT9lOAxypfMqdVefj1aOCX3qjV4V1dSsToCVN8FpFURU5kxj7rJULb7?=
 =?us-ascii?Q?GC9f03YgjH+5PLPuDSO6dozxpuOgGEyepwudOOUbtXuAAiByfmwCIt4NbsNw?=
 =?us-ascii?Q?d3XUHeGuLe6HT/sOiE1S5WDPRYIOd2fXXGp7Ok61jl/XySU0i3ntmfr7NEpX?=
 =?us-ascii?Q?3w=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 136bc39e-9cea-4899-7c99-08dc8472fd75
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 08:47:39.4331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tnBuw4w/T8xMsyRY6YMCwzo2aIaHWlYXG6jrD3Q/OH+YM2HclRM7w6isZg+TUciqho0SSAfahgWYnVeItjHvimU4W5lKypqy5C2nfjTokyg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1324
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_014750_293842_D1DC5404 
X-CRM114-Status: GOOD (  11.07  )
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

Some SoCs like StarFive JH7110 require two or more resets.
So change to use the reset array API to get resets.

Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---
 drivers/tty/serial/8250/8250_dw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index ba9f4dc4e71d..3b92d496e5b4 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -584,7 +584,7 @@ static int dw8250_probe(struct platform_device *pdev)
 	if (IS_ERR(data->pclk))
 		return PTR_ERR(data->pclk);
 
-	data->rst = devm_reset_control_get_optional_exclusive(dev, NULL);
+	data->rst = devm_reset_control_array_get_optional_exclusive(dev);
 	if (IS_ERR(data->rst))
 		return PTR_ERR(data->rst);
 
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
