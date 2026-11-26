Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B83606A32E
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 16:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z7vKnciH;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=GRklMCfP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=C7T7YblcXT8prhO1j4nWez7XCeoi/y7TPAdsvihSKcA=; b=z7vKnciHIXBxiDKBH0H+pYCGsm
	GM56sIOVvut9yHHduEEkhro69HLO/gkz5kScSLdCcsUWXmKSJmSBW5qOyDkVvhndY+JXDKkibBzQ0
	x7W8hXCJu6QUGGDbrHPd+XRzT3XJQ08cDCvmaM1/wv7j7JYtC0mwDIIhCEWEnmk34AvtN5GruKGei
	GusfhlWLg4XF8NHWKqDB6wiXMK5kASL/k/XBrDqu7IjIW8fPuDUcSbDSVU7YD1N9r3LXK+U24vMaa
	autHRJpKJIFj9ulxMKD9VVA1udyb0ePSNDvdQe0KoIWYfJ9FB4ksiovLJtIBJYPwZz8b4+DEzIbWO
	pRr6C7bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWcPN-0000000Dv56-1zFN;
	Thu, 26 Nov 2026 16:33:17 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWcPJ-0000000Dv2C-0UXs
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 16:33:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dfE4bDQLfE2YppNB1lTGLG/pQprjeo6m4dvNMnkDoA3T092QnE7BgTrFEnC84bGBDxByJX1IjCq3D6/mCW5l9qCJFmI1ivqSMvWL1YYwns/XSPZR69+4xHuHhcXcP5Hwl+N+1gWRTVjAG1zFR6xhtwH+coSbPzj/1xUdrnBRjZLy36uFQ/gHpFWTGCkSVI877UL/zXIWiFZO2OeTInCTLCHxdO+7gpz3emnCL1USjeOWi4nqSHBbKhBz/LovaaRoUlI0Y6Qn1obO0T61r3OlFbcmAr8JIzPoMh1ql+8XY8bvIUakUeyFdir+SH0uBkcyuL4pSWEJ7U/BMbLvncC2Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NN40zuvdIzZL5gRD7CWvCn8b36fSwO3XlH+v+NWej+Q=;
 b=emGrqIuu8JOg3rzLL8ySHtztFe7MnbeEHThCa5SJ76u6gShGzOJG4KLNJYj6BGNPM5QRYNXG1Tk1oHFLHgOyYT0WiW5pK4OMBc2ey8BKrulsYDnV8DkMJ/ksveGzU6s109z/o5M/PJitgfqZhrRLCD0eGGju5r0HAjraf58FTseWWCtTSHEnec3UbO5HQmmjpNjivkIO5XxeAseWjb+ETeT8AMY/pdHGHorl1vGHca818KYZhJVKbsFXjNmcGbWu5g6st0Rrri+sdMAtMt7tm2YaQfe2ycdqJClrgMzccIVFUFuWq51vWtKlY+KtQRM6VtsuJC4bzb2YsowcyCXYQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NN40zuvdIzZL5gRD7CWvCn8b36fSwO3XlH+v+NWej+Q=;
 b=GRklMCfPOLIKQkzzMlZTvVH5l3WxWC0a5ZmJAsXrVM4KdrJYEKVBDBA9rbxzKL+rEvInBVg3Uv1RsyqQ8C2/IMoSnbgxYIirY6OYEyLvVCiDTEMpnl1VHd9no4XuiL9PpR9t9nY7PYYEkn3rOWlBo7PzMvxIgJEqTH8tQgFF0XhL0wamBWG/D97E2MOhBIcc5lHbNY6xHyIU2NHPnhlVCsGLazlbPIZ/rlkWzkx6zVC1GOSVHk8BuBQx6PQpKqsOELBe6K9U12S/JzUwg2LnmH1Wz+LCOX26soFbfVKP8Mk1dDCCBqKxmQXKfuc0r9NqyqTK9z3QsH0nvES33jNp5Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13) by DBBPR04MB8009.eurprd04.prod.outlook.com
 (2603:10a6:10:1ef::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 16:33:09 +0000
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930]) by PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930%3]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 16:33:08 +0000
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
	Marouene Boubakri <marouene.boubakri@oss.nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 4/8] dt-bindings: interrupt-controller: sifive,plic: add OpenHW Group CVA6 APU
Date: Thu, 26 Nov 2026 17:46:28 +0100
Message-Id: <20261126164632.978624-5-marouene.boubakri@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126164632.978624-1-marouene.boubakri@oss.nxp.com>
References: <20261126164632.978624-1-marouene.boubakri@oss.nxp.com>
X-ClientProxiedBy: PH7P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::30) To PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11203:EE_|DBBPR04MB8009:EE_
X-MS-Office365-Filtering-Correlation-Id: adc122b7-2de8-4a86-c3ba-08df4bdaf3ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|7416014|1800799024|19092799006|10067099003|56012099006|11063799006|261026121527099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: /X9suUoAMAGy0dbv2Tn4SU7pkfLf7Gsu0VGrOScxLwsKvwPhpsFk1zkFNjDuRwR3gu85S93izzdK/CW61JFsqnf6XwpvbK4+CDc3Qy55HDGiV+5gsQp5SbilnSbBSGukTGw0ZePNKUloxFfVjGqYj0AR4LaqghtytxL6jkGp5PpKjtgj3pWHr5XuBYCJBlZ9+9IUcKISPJ3d2Os9pNoJ3Uv2r29XW+pRa8QF5vdvUA80DkJE4v/Y6w6sP8I4CxAWNpQNEsx1J1dpn0KYC0PfuRJ41MdcRSnnSPKavsw+ly5+UxjSNAKIOEKeRtl9aWqfSTCgYke9DBFyDVi6iyE5P8mKBTqebHXK7pnkYKJ8XxFl0uDZjejDnjBnupPGo/s4sRFw4q/qWTFubICclMCHzJfLchtorRFEdOcviSiYYKnIijLyOLi5uSGjUoECgzuHPiBTCWZOKlGKZCdlxDlrfiNdB5XAtPGHCIZVkuBxWkUtWBVzy/L7VjoCIQUSOEolBqCJ0XvqNSVOv5elIYuVJ3eoGpV09P0FfBNxD5gdffbbRIsMdmIXBbGM4DrmaM191jPP39h2NfBZwF7KMIUkj/BYMneukH9dRBT44pb47GMtdEO+BWoxlaSgmstOJFWwyobwNw1v1D7dQmwSr+r2BG6wDINO7GD/LgfQYZ7gB6w=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11203.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(1800799024)(19092799006)(10067099003)(56012099006)(11063799006)(261026121527099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AX9SqO2C4rx/NowjFTWO7WmP0nZuy4EsYsaweR9RniLyNXqESCaNpnE+L/9O?=
 =?us-ascii?Q?kViWIOaz2CfJP8ITlF0L3XyQVELw0yc4aA73pMi3O8OKQBw7lv1QisXVUA5Q?=
 =?us-ascii?Q?7XMFBMD3B8ZgmcPvQySyO3VYd2Zk3fvAmQTz7jRhjfPYBYv8qB1zNFt/OQ7l?=
 =?us-ascii?Q?zprSnS2IVeDkhLBT9Ziky3VkRF7t8H2n/vLU1MwPSA5YTk9fwFt9TGQcIJ7q?=
 =?us-ascii?Q?OYvvLYRbDNJZBJ208wjfgSmNwSrrdW3WHEpSKY/cdNueGiEgRU1dn/O0TJQw?=
 =?us-ascii?Q?1BCO5F0vSGtzvAqZJUQWEC+kZgkp8dQGssXC/Iq0DJZqFofAO4oAMQboz5sW?=
 =?us-ascii?Q?nn2OkEv9O2O4cN2LYlUeMeSIPJSsSiRbnjxodB46zYniellyqwqygKBYOydq?=
 =?us-ascii?Q?UZOjF0KMR1zg+lKyqzj60WLhDUxy5dJc1QGedJGyiKhtvbb3odi8ej2s4HB5?=
 =?us-ascii?Q?DRUiOg7V0zNHmgQm1gRxtBquIH5Mq8fj+Grl2kunQuiG6jh4bKV/3xoB9r1b?=
 =?us-ascii?Q?FmL1u7mk2TNH8w2UxKkAC5MnoMP2aCTGLX7+8VdTSKHnvAV7WBojTalPaMTP?=
 =?us-ascii?Q?39DBR6/x4kJS7rdIkMM8+ilI+AS5grDsrWs4+UYVI8DBL8eoyi/Kc5NicTzA?=
 =?us-ascii?Q?CeFfkb0H3bq5GNMQQ2eJZSnlRWUHcxr+h3BBCimRVM2ZPmbwafufXDZJAXzH?=
 =?us-ascii?Q?hltqmSbH2slXbZbUdDwm4TF6x1N3Cj/Y7DEASMWdHeGKXOWAcJIhE1GSN8Io?=
 =?us-ascii?Q?oegg38kMWhXKdNPzd2hCj30bRBXGmW+AcAd2ny2/Ql4sMXKHy/mJ9s+teX8P?=
 =?us-ascii?Q?kOsF5OoDbMMK6Us8cYtNJYueL/pLsyNT3IVGIiaC3oCI1cdp5cLGFzw9MOQ0?=
 =?us-ascii?Q?71i78E/3lWG/NtYiiNCU9ubC4iFc/0UyBPSodi2qUR1io282PMIrEb6uG1z4?=
 =?us-ascii?Q?NYzHT2pPscchQFd39x0iy4EXr7ImGygTTItmvlTCDrJtVfk5r07elK3BWcXz?=
 =?us-ascii?Q?2Kmf/WI/qf5C29ERrUUC9mUZ8cb0iYnj37S9/GZhf625jSQpvkAzpeGMwqCl?=
 =?us-ascii?Q?3PGM6kUmcBV2+i1EpCsa96uvWTJh3h2RmuDpBm8QHoSnueF2m4+vTkHyZMtA?=
 =?us-ascii?Q?iEV/A/KTtXsJcYN0U6P8EJKLXg0nPnPEbSHKAv3AltxdPM8XLFoocnybkpQ1?=
 =?us-ascii?Q?hC3phQmKs3S1Cz9LZW1rTH6iNqX5yt75nS0RIXJnQk/njsBd4tHY3n39yuzV?=
 =?us-ascii?Q?5ixMdduRB1TmRnjtiFIER8oARpWDb9qpQ2YHV00Zjgx0HupWwuMhiQYUhzJi?=
 =?us-ascii?Q?YsnAah9uXxVhosJPt0g5hQfeG+xRb4h/dud7P9kDkRyLrv3BBkvY0RgiQCAg?=
 =?us-ascii?Q?SnCl6geevuuUTEa5mKBcstqXJigf1P5/ZTFS6S47WML6eEu4mfd+sIsCvSc9?=
 =?us-ascii?Q?lm8PrcvXSzDosuK8TMPs+mq2ElpedPvX+3hEVakNInf/lrZfNAvJuwtbQsyU?=
 =?us-ascii?Q?dhAfuEFl6bne47vrx0EQmnj7q9p0dSRbpL2v4eVsv9is0eqGVDhKPQ9sHuoA?=
 =?us-ascii?Q?sFIT2LirVxmTo6uIJmPDnp84wv5u9+N9XgCgCA/+GO2aQd56v1r1SpM7QZsk?=
 =?us-ascii?Q?aqf2/40VWUYj2v5Nc3B4E7VDHleHNcGB0n1bEaqB7lfg/W51H7e9nDGMq0fv?=
 =?us-ascii?Q?qYCoT1fhdUbwXb8qjOKL/8k8Nc5SRqaYqW0XQmyOki/a7LouF2MqY4z1SjJb?=
 =?us-ascii?Q?PS4n/mTSpOcACcNZ6a2KB6bxKgj0XS6HDY7sagoXJu0SyPbYTxoAmjoUhvnQ?=
X-MS-Exchange-AntiSpam-MessageData-1: Yd66XYkYCTVG1A==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adc122b7-2de8-4a86-c3ba-08df4bdaf3ad
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11203.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 16:33:07.9828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gtYHKalll/EF8pcFIcNQu5E9VKnYaKnBGH78K1s/uO3HqjeD5H7GSxI8TPpFlz3SKOBj/W1Tav/VjjFbNsRuPi4MCrmYE0G/6oSAIQgW31LExGCGmvMwJ3xwoyt/cr0A0U9TcWmzVNZcKXpsAKrMSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_083313_452964_73C22C62 
X-CRM114-Status: UNSURE (   7.82  )
X-CRM114-Notice: Please train this message.
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

The CVA6 APU FPGA platform integrates a PLIC compatible with the SiFive
PLIC 1.0.0. Add its compatible string.

Signed-off-by: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---

Notes:
    Changes in v2:
    - Collected Acked-by from Conor Dooley

 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index cde4bb6918..00ad63ab0f 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -62,6 +62,7 @@ properties:
               - canaan,k210-plic
               - eswin,eic7700-plic
               - microchip,pic64gx-plic
+              - openhwgroup,cva6-plic
               - sifive,fu540-c000-plic
               - spacemit,k1-plic
               - starfive,jh7100-plic
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
