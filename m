Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C700606A330
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 16:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1r5F6U9a;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Pj0OP7Gi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6nuc9Fr2ED7mQwTvrw2dWdRwHcHTqWfK+S8L166zxkQ=; b=1r5F6U9aPcHAkadiWA+nG5qrmN
	j6XanmXFP8WkXyAHxskMZRo05pAJQtKfdRw1Rubpg27XE8gCWdCXwFpX8rVXatTvOlgq8QG8vDH/m
	MHVqYSPnY6vpn54C9D1z6LXvGHh5mUcTzHPgtnL5z09nCnUD2g+vu2c9W/0ppVpu1VLQiFm7BZfeR
	fuJtEdf6/F+Yche+1s8397rWfJc3m+1BmRl1olaofkSET2kC06NctssOI3WgKHiGsy7nce7sYTcFJ
	McTRIcslQNYei3+4wqTwmMtFgc9T2cw7PGhn1nCmhlZzo1rIsBwvJMDrUb1lQN5RWrXPb++XeM4pL
	DQ1ZXvIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWcPX-0000000DvCj-33yO;
	Thu, 26 Nov 2026 16:33:27 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWcPV-0000000Dv9t-1v1w
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 16:33:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jWkGv4DlRDO/NOdNGPhz2xgkg/p2nCDrRGoAYSPjLgCvk03vY3bIBuPPLHEtxpYyMg/AUOUkedBkKx9Ut1TqgYchpVcl4g6Mq5YJqYL5xDaIHyeJtiysTpOI0V+xe8cY4iV6GL/jZ4RJiBEPxsq+5O9dqCfZpJ6+N120fMG7m6pL/GV9v4SiF5OzR86LhcKsaRdj2CGuOSk5oRcJKxtUl62b1a9dyMIXCHW7nj5+ZL1KFJTIm3U87BThXrnuqe+Cyi6nuog6AcvuxFs88zMJ+v/snE/PThLqFxLj133DTtjhCmliwe8RBixdKPkPzoi6GLntTdxbSyIEQiw3LqXZbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YJI5rbQFS5U7Fb7iKTbUfHqXlkY1wv4PmUWLbBJipx4=;
 b=t64cahqkzwr5tYORn2unoa+ra/DBeKcXBSdgZDNGKE51SUv6hrn9ZgoVoyHXhqmogJGBbf2Cwb18VP0z61zGcgW1J4K/eU1++aS+6I0OUr4+yafxP/J8XCWr+wQh1r1DD6pAmiwIXHbVa7H3aor0hm47A9kQoWahtSXS53gwzgrl+n+IuB/sUQUOccxt/BuiO+wLZFnakViekNkQzuc02LXIhq9x30IinqxZdI/Giig8dLuOxj/Ny8VZmgO7OkPFUocXC71YF6ev+sCsR+JtM46nKAENY5GPZDgkIMhWMNZ5xDQCH8NQSJFLkJxzIiijycRi94lVgilQFySKqKSJGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJI5rbQFS5U7Fb7iKTbUfHqXlkY1wv4PmUWLbBJipx4=;
 b=Pj0OP7GiRxgLYJCianShRi/Cy747OxmR03FGHECtjBh4MzssR5VOneZHTDXA9leZC6qS4bnM11SDRMjhB8cSxxEEf1HzSVcLmNm9nyzV6k3GceVyZiOHEdcZzfPAaiWshOHvK64YGfuFjppONhI1lHnhUac6yLISTXIk+nX1sO8FGUNmeSIP01xWbA0D1UZWjWyanAeLf51wU22e2uYUVl6eaPCDarkxXJQUMEsiArKxnrS39p7IYRx9Zp4H+9TtCHCXNMxVm7F0HTMahgy3FcK4cKDK49fRkwnOvAmC++EL0HxnhS+aQNp9AdYcd/faDEpa2fjiGoiiJSYUBv8GvA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13) by DBBPR04MB8009.eurprd04.prod.outlook.com
 (2603:10a6:10:1ef::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 16:33:22 +0000
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930]) by PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930%3]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 16:33:22 +0000
From: marouene.boubakri@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Radu Rendec <radu@rendec.net>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Marouene Boubakri <marouene.boubakri@oss.nxp.com>
Subject: [PATCH v2 6/8] riscv: add ARCH_OPENHWGROUP Kconfig option
Date: Thu, 26 Nov 2026 17:46:30 +0100
Message-Id: <20261126164632.978624-7-marouene.boubakri@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126164632.978624-1-marouene.boubakri@oss.nxp.com>
References: <20261126164632.978624-1-marouene.boubakri@oss.nxp.com>
X-ClientProxiedBy: PH5P222CA0008.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:34b::10) To PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11203:EE_|DBBPR04MB8009:EE_
X-MS-Office365-Filtering-Correlation-Id: d4a27bfc-2e6e-4749-a0f3-08df4bdafc06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|7416014|1800799024|19092799006|10067099003|56012099006|11063799006|261026121527099003|261021121427099003|261102123227099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: kaAWNgyqZv8yKQNSGrJTy0X8dZ6b2AdtbtvuIDlJs1HntajgMg+vNvrKdfdSljRhW6Ckvv2Og+XGCHhMZmxjXtd30lHjWtUeUACxTW1x2EB9G+xnnU3lvHrj1UibpEocZDHYxkG+WXrmW8RTRXPdriSnC62SZfBpgJb5ckqDIs/fbl+5s/Ttt0/eW7qOZ6J/ReYwVG9bGUY2MeQax8ZwcpbTYEcYOpREzVx1CeHdJ8h95vREk7w/KyQnNMS/mJES7fgzkhHL/v4l2/yUktzD5zLQ1WBgKLaIXkS2UzkiShW40D43qyU8uLPka46GrOzu5ketGWPyJPQoYAkQrF59rJeN4kYhBKGuu3VQcM7L8i0ibW1D5Ub3AuFOkPoSHUrldcEo5GyhDMJC2AmBgy6iBqDYp48yw5oX2FBzynblCz7CQEqwP7uB0qWingnKRXTjSW5FkSottG69XUv5AswLqxwHU9XOHpDed2ojabz+wbsoNy1Qw7F5ZkhkeUYPU2BiI0PX/sMEPkt1a3ICqwHJqT1JT+6/FfbTd3wE7SmOd45UuS5bEsMSzaN1bs97lKw3oAijBeB1MMc+ZXUjpBYM/nAf3tNaxt/ZcWK5PDGDccia/zqeXbWA8wMxIlers3SM/zYdTLhJNpCTsehg4uR8Qtg+QAwH5/gPwsZd7LcX7TU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11203.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(1800799024)(19092799006)(10067099003)(56012099006)(11063799006)(261026121527099003)(261021121427099003)(261102123227099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R0yOCa0QZlzKkPmMi7CsUP7/bXNZEOzukvMi6Ba+y9FJs9eS/fXxqWROOOIk?=
 =?us-ascii?Q?GynAjZTKVHskRMWB++/J+60ixaEqzejM1HHK7oAwDQEdEYilmPSiO2l6Tr3a?=
 =?us-ascii?Q?yzdCNytlrQzOLUI5NuqD3rzJzW3kJwBnlWi123pVhxxXzwIe1ittTug/XTH1?=
 =?us-ascii?Q?ES6QDOCjtCjXfdXRq6U3lTNOX92iLuwmo8TlU17xzE/ZIwCXnAKJe/lEE7ek?=
 =?us-ascii?Q?HFSsWGxs+2RpFI4lpvxHt+EpjT0WOX09q4VWhB0HCMAXnT8QSsxcJhn3L38k?=
 =?us-ascii?Q?xDLRGfizn0iWX3yYM1ade1Yt9RG/sx6zARjL8MBnMv6aODYCBkttQRrl78Ip?=
 =?us-ascii?Q?xyMEvzxHMms50PB0n9izjv6au+ZP5wvIgA62vZZhuzDGGuF6iCCdDxV8SZne?=
 =?us-ascii?Q?O9sh2njmGNsCyNDDrFZDpHTzcGE9TewPs4eu/P7oGqc27pSBbKE8dOuhgOCe?=
 =?us-ascii?Q?vyMKh+3bPQYUG4l1nq93ofFPpLVtTIlserlX5/vKED0XV1isnQVdXtt5/LY7?=
 =?us-ascii?Q?uu1ySN45+AFOPa+M0FTqPuh5NwYL0tPuOFY0lgXdo2iTMMp/v2S8wHNFmSzi?=
 =?us-ascii?Q?msfaEwnGL9xbaq0JS7RUUD2wgGCfp7zp6waeSrN+hm0Vk2DlgadtDT/nNf3Y?=
 =?us-ascii?Q?6dAgEEV1G4yUphYUkyETTbfRIvc1AruDMcSb6T3+ZqFSkv2wcXIsg99Bm98Q?=
 =?us-ascii?Q?qJuxKcGAoba5rerwxoPcV9gN9orMCwIQMstCdzerNT2FzUxLu0R+8SYTa7jg?=
 =?us-ascii?Q?DaMrQY6KYU0vfJsGkjrj3vrCJ9e1kSUWP34pXJNYP3P6HaVwJQss0d5V9xuq?=
 =?us-ascii?Q?lMqd9zcBvWwaekEBPwE0q4jXw+yn2CBQP3liL/9VNOjc/2BP5sw5zaS9vjPc?=
 =?us-ascii?Q?0uKakEYwpb4SQ+5PQCnR9jwQWooMXMpDkB360UHNzWaxld1Y83HebyccfpsK?=
 =?us-ascii?Q?p09KTmgCxIaj+hgceWm2UJRWMabTVR4t9AO1ITQsCh47Y14Hw+lkvw4OIl03?=
 =?us-ascii?Q?V2yre+W0kc83LuYLNHeHO0BkwY37+S0UCz2uyCivvAEUv36H9AI9yJ5ImhiT?=
 =?us-ascii?Q?je6E8AWzH0tW4JBI4xLdokZzrmOXlQfMPb0pYRFOg+/+hZJwWX1UcRG2VWbA?=
 =?us-ascii?Q?4tunLuRS5Axd4tc46B/PRlwfFCGwzFvcQAICosRqZ6Ms+WKtRxIrDOblcaiv?=
 =?us-ascii?Q?7xL2Cz6nStbu2CbV+4902ixyHko8+Z27+959D8KQThWSFPRmJ4Mip61xchB0?=
 =?us-ascii?Q?x9/NlpeCLOLDACh0SvhvUHMgoePQVX8SnJiMSRX6ygA8Eb8EA2CMj39uxlZD?=
 =?us-ascii?Q?THjbmGfS88+FY8nGcPtkwgF1kmN95vm0OSt9WhuJeXfkHyLuSJvR8PtDHqiF?=
 =?us-ascii?Q?Nuzhaufjf9k3yWEU56oENwKiKn8oIlrm/cWtRN/KJk24ehT6a4TiEKtOuAn8?=
 =?us-ascii?Q?BLIfA6HeTxWAGWejwqDYkXTMyD2qKyOPsU9QREkFB5wxSqXCwb2csAoE5w2X?=
 =?us-ascii?Q?/Y3wa6NBuP9LFQVbr4u0z50sUt/OW/cJGQIMQOx1JLOE95ARquYVyTGyRNOY?=
 =?us-ascii?Q?ot/MrLdD/GtbNtVVSPBUrHtVFBa9ejTC2Wi20fSzPhwi0UPi4fy1ZbFHo5iE?=
 =?us-ascii?Q?FTZbwwc4pUs/MqsU4mOx3Nm8Gb6xbSLftUXDnuHyHvR/ASsCn0qoUgqLPLlC?=
 =?us-ascii?Q?WeeQ2LdwgQMaoNvLVOP56ap412R5qznBS5wkc5NdlwVQKYLOK0RUoxar1P7s?=
 =?us-ascii?Q?HfZ8lmZ5MxSuJbDBKNNrY0/NdRnovJJhCADArVGy/5og0YwNZ6UjWREyz50n?=
X-MS-Exchange-AntiSpam-MessageData-1: OvIAPAQRcEoboQ==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4a27bfc-2e6e-4749-a0f3-08df4bdafc06
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11203.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 16:33:21.8261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +m5wauSyKedulIv8VR1EsYfaIAKM+bBmD+toc4+0LCEsoNLoUssVRkVXoC/o0OONlpdSWRaU3ow+fwS2rlDH17b79yF5ugHCXH0ij1/k5w/DWqENxKqaZIFdmBHFxjB3pbG3e+HNQOzke0haPc+nhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_083325_513760_CE50F012 
X-CRM114-Status: GOOD (  10.07  )
X-Spam-Score: 0.0 (/)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Marouene Boubakri <marouene.boubakri@oss.nxp.com>

Add the SoC selection entry for OpenHW Group platforms, which is used
to build the device trees of the CVA6 APU FPGA platform.

Signed-off-by: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
---

Notes:
    Changes in v2:
    - Drop the list of supported platforms from the help text (Conor Dooley)

 arch/riscv/Kconfig.socs | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index cecbce0c49..0ea961b7cf 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -26,6 +26,11 @@ config ARCH_MICROCHIP
 	help
 	  This enables support for Microchip SoC platforms.
 
+config ARCH_OPENHWGROUP
+	bool "OpenHW Group SoCs"
+	help
+	  This enables support for OpenHW Group SoC platform hardware.
+
 config ARCH_RENESAS
 	bool "Renesas RISC-V SoCs"
 	help
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
