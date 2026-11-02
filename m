Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25BF8606A324
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 14:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=siw2z5LC;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Td/mEe1h
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uWUndMAy993SKz+2bkslt4gtJebRrC3pWbZ2YgGM0IQ=; b=siw2z5LC4mR/IiV3dincFkwJVE
	OAR8nl100T2oqngBZZjEpyaycreuu9l57Ij4/IwyP9iVdyaaWJuTxRoQRoQml608dVKc1R6eqFrbU
	pLw7oqL1qJdV5cb5BUC9/rY/Ra4T1UlnwT0bKID4KqTOrqib151jajrV4C9lFHwJ1XuXO5N7rhLKg
	JNeoRJYBEbjq4JZ57Ku5Wz+HTQxOWtbqFQfqD9+YgcG4ifW4r1r75MBUmwsAZQNvG6UC9kdPzL4IQ
	Jh/Ir7IBE1HVCewZQIq4zt4c2QVy0LgyIetc+PJenun+liR0c7sY21Gu3Ex/d98aKW0EFq0621SCa
	aBIAQnrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsdX-0000000Gi4b-1jqF;
	Mon, 02 Nov 2026 14:03:47 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsdT-0000000Gi2U-3ICZ
	for linux-riscv@lists.infradead.org;
	Mon, 02 Nov 2026 14:03:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bw0/VnVLuAPGvNsVtiOqOnvm33QcLLDev1+Q6y+zwY8cgGCrvhCX/mxeKADJg+ITZ0bg90+/sqlonDyy5nswbkorb8aiGn1OWSuvBb72HBubqWLdcvUnaCRkO76IL0pIlBXJzm6YCGwuTv/E7c3ZTozmu7xzqaOBCUcDsIWAjBFYv3IeEkFOhwJSyCKMJiRpuiSUHtcokjPiku+hwIjOycI263dEncSriqdGD3NtAJm4RnmPIQFNcPP5OGhbPUUpg0LdW9yroj8L7aR5XRohrXOHNrOsy0LFWWa+EXRyOsOEFmbjyM1/ZG2oHJq4B/hKr0Wco4K7zwJ+eNdSsnThBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=11etErCdYlYeb0zZZxXO7jsUaGHeDfDwRx2OU7c7OBk=;
 b=XfCj6sgAd0TljgXa1Xt78Vd6TY0CUbwbkQkpS1gdWSpji/Kt28KQ6F8YwwCNbiHdP4QBKdw6/QaHrAx0U3EQyRQzCTmN471Yzk28vIVTf891j6D8us1HtDzvEmtWFFEw/02nEaF6fzEFunAHxcoespjQ/c+KYHbvk0N7qZlO9BhVbP8IAKFeApSt8eYsAP+M2cGJQnARGY79j3M2JRp/DL2L9FFtVJonJqWCgRuG8Nisqv+FgpYHJn3zI5dV5rBbc0Lz98XL3/JwE4E8SD7HO+Soy08ICvS85yX2Z+8QFu0lh4ecTWQhe8IYu+G8z5EODZc+O2ZBptIEo8rWSU9Izg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=11etErCdYlYeb0zZZxXO7jsUaGHeDfDwRx2OU7c7OBk=;
 b=Td/mEe1hKZnsh24Ijzhz/NV78e4XIz0kIny+d/9dDa4SGEsZVRCsPWa9te+HOANT9O8LwZMXGWbUhZl+UcuewPIw+oV1d4VwavxpgLpB2V+pJ95/lDXCtkrB9WC5Mp76jVcj4ZTvWjxiDwg1jTx7rtwCTmpXJQjgBMOuZ5aaPwdqf+ck+16msQV/aWYKV5PpSkkVnmFxZhAUXXhjSyc5NW1+jc9WGtyy3LlhEdDn5OXFMJYLCzv1BXxYxdnFys7DGIcHGmTZg8SCXMVcEBkd5LF8bd1kjXXxw3MXn1/ME70OLzpDnV6y6Z7iyRfkygMFN/ugjDy3vgxWKW6MuBByUA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13) by AMVPR04MB12628.eurprd04.prod.outlook.com
 (2603:10a6:20b:773::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 14:03:41 +0000
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930]) by PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930%3]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 14:03:40 +0000
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
Subject: [PATCH 1/8] dt-bindings: vendor-prefixes: add OpenHW Group
Date: Mon,  2 Nov 2026 15:17:20 +0100
Message-Id: <20261102141727.640769-2-marouene.boubakri@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261102141727.640769-1-marouene.boubakri@oss.nxp.com>
References: <20261102141727.640769-1-marouene.boubakri@oss.nxp.com>
X-ClientProxiedBy: PH8PR20CA0006.namprd20.prod.outlook.com
 (2603:10b6:510:23c::11) To PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11203:EE_|AMVPR04MB12628:EE_
X-MS-Office365-Filtering-Correlation-Id: 91a3efd0-6954-4417-702e-08df38ea1935
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|19092799006|22082099003|18002099003|56012099006|261009223027099003|261022105027099003|261021121427099003|11063799006|10067099003|261028144727099003|261026121527099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: V2+1kg/TPYah5o4lNi4c4YHDU1FAETbPHVQqJbBWMKL95+iT8RzCi9joYYYHy8YiZhJoAMCgJDhLDbbOtNpbDrgOf4hrghibbnIGhOPtP/9g1cssQQ4aXA0HT9stL0BkpI+kWIyE2bYV0cmEyMq/tK69RZFT2qrhI0MDNvQmiOzGxvotNKprluM+eb4FDf1LN7tumgfa2C+uw7AfRrPLJb312PhKUN2cHiazBAgNW0ZLHbiT+cfKMMvmkz6XzHn4uaJIKBCK2SBe8ML8c2xbv3lIsbjVwUq9XImJcR2KZoOt6vggaG+EBnwm9Nw7J1CboiLXTU8NhTDoCGKhJp/htMyLpvVE9ogmG0liBzhM0DbqA42bBTxiibvkWx0lujtXO8Ujh6oOOhI2C3iyvsTPKtO2idRh7tVIESxIG3jkzK9Rc6dFwza39YYP5AcaPWWU1AxdsltcRGTB8XzQ0TZYRXurikxMNMNY/+9yGJcg4FP+F3Od0uSkIkBfXNYZdMqnSekJxWQCx31CtYEMRx168hiJNFvwFMdpBl2ZNseWrbqKXqZqdv3BMDU75UKYR1WvMjqoEbz/P0DBh4uCBY6cIpu86oaubEJfAS3kIherfTg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11203.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(19092799006)(22082099003)(18002099003)(56012099006)(261009223027099003)(261022105027099003)(261021121427099003)(11063799006)(10067099003)(261028144727099003)(261026121527099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I8XdYfSdlkFrkVtuDovzGyJL1zuH5sx9UasbCVgYAu9QDnOQJaUTht8ED/Mv?=
 =?us-ascii?Q?BSkgaBvyeVvVe/cYpt1t4mNmrpnn7Tr+sFRJbwExcw//Ux2I7uZykWiBIFF1?=
 =?us-ascii?Q?7Wh7Zkdj8q0g2SFpZssuTKLOIUIQ+6WmQb6ayThMzsvmOWPdEpf4Uj/96cch?=
 =?us-ascii?Q?H3sOxxQEPZBgCsWH9ZZ8WmC+6qbkpdQk/L4+p5zGLqGtN8FZG6vARsuzTLz0?=
 =?us-ascii?Q?pVu91KhCIkoynZuoXaPsg6pzXFuxT+T83Sxk5Kq2GCGE6HkkemwHGqEAeFV3?=
 =?us-ascii?Q?CUh5YZzpCAaM5IXDnoIQAuBSI5NR4BPvjk+l9NbbmeF0R0NMrpi8bLzkgPGL?=
 =?us-ascii?Q?EcPI0qY6fgn4wbB/4VbmzTazInoxWyPXYw8BVxidX+r5zJi/FyZ5yCZbsPZE?=
 =?us-ascii?Q?sMznvGTXsbhvVEhdLOsYjyYvSfojoGw/UXJjLgR4CSWfXNRi2YWy0JOVwwfQ?=
 =?us-ascii?Q?HHlCck5iccjJaL2ItmDwaDHLjx/GElGiLGmDErM8ceMcLWI/bIU5rZFqIUi8?=
 =?us-ascii?Q?sBjWIS+LaKCKCsNhjx1VhMtKrNm+ILarZS/tG2fuONu0e0SS0ZX7cqaYuYuG?=
 =?us-ascii?Q?cGOZO0Jg2XkjmdIYTRGA7KchN8NJs8JOvnWCvHPoNsoIFsMZzxfPjBVHq6hY?=
 =?us-ascii?Q?ScWILVVFKmKKn7//+wAfTKLCzzZxd6sYC9ZJVl+oJnDAtvXekcJibO0Hs/AH?=
 =?us-ascii?Q?ApZErUdFXuDjQYBveJ1cNjis/cYiU8xKFfEUYpECB6MlpvJC5fSH+nAprwqL?=
 =?us-ascii?Q?ybexP/tWBSXf/DDXWYfmI5WLPQ5p6ux23wqPGGQxrm39qtgQatVvRyT5kGJi?=
 =?us-ascii?Q?eD/9ueGV7LICRQxqN1z1Y9eIpoVEmdpUhPNLHj42iuk4OivSCrs2VrLSB7fw?=
 =?us-ascii?Q?ZvWnbSDP7piIthynDdzu6BUszhkMikwtFqBfUpD2hNQw/Vils9qew+evdJcS?=
 =?us-ascii?Q?apILnHlzBuiaOBiLeja7gc+goKPlCSM39gTLr8Wx5T6h6MszZbNSr7KRmDen?=
 =?us-ascii?Q?bw/+w7AYsLwrpC45JJEoRitQrHMniwn9CnTlbegcjjSswo8xFifTwep23pzf?=
 =?us-ascii?Q?sUM7B8xrSAgR1OWsFHLaFy8cpyy9z0OJplA5N9LXrl9NcHuGRrBm2dTCA3jE?=
 =?us-ascii?Q?/ii3DxraRJvisXSQ9nHudZ/U6eCYvhD+fvqOduYUuBIjWXkPOMhMeA4BxVbW?=
 =?us-ascii?Q?QBK65mlRlEJwYQmUxYxYd1Kl3BBal8Zdad7+04hoB+Hc5MjyOW8ferFOYHrq?=
 =?us-ascii?Q?snmwyTVstzQB3KgmgGaIuuT+5BN4sToJCY5z01YSyTwTb+vPcFhp+ye0TNau?=
 =?us-ascii?Q?VfJymHwOfA8h3oD9Rw7WvicphM2nN/s9rvau731G8OIIuUCl5QJTW8N2kaG2?=
 =?us-ascii?Q?pKEfJcjTxfZghtEWVwKStmCtAYdChKVG7iJPIHTwqNTQ4Q90m74bdy10pU4Y?=
 =?us-ascii?Q?xRXOYFeBjhKAQruUrCrv7s0Zjtw6v3VjTtaot5+BoFE4xMOB0RZaeblT93yF?=
 =?us-ascii?Q?lb7oLYd+cFJxJGJFBcjuveaozVew9svg76lmD4fbmhp1fGyt7c+AZH96dU+B?=
 =?us-ascii?Q?AnQf/9iUOPFlxdwdnarTEWXUzfzFbNiGcWBsObuoe2LBr9/pVcBlncYRYXSS?=
 =?us-ascii?Q?Al1E/qxcqIZd1hIdo66dc+feTtp9AIPwXaorD0ERdHG+CdIIRHm0ur1Ug3vo?=
 =?us-ascii?Q?ENQ9mYrjOOlIaz2cDya0k9mGdG4QXp8o4Pjg7cfBUMPUvY7s3JzLHHLFTxit?=
 =?us-ascii?Q?rjoDh2jCXKIaDsu1gGQckYE69FXsnCqIjBY9QLnIC6h+GtOHrYzG96G6WaeJ?=
X-MS-Exchange-AntiSpam-MessageData-1: HbvDrtft/M1mUw==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91a3efd0-6954-4417-702e-08df38ea1935
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11203.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 14:03:40.8029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RR1OZaFma/lIWXz3SYSIDnmGTVvA2L4LZ/mAqhLwfevwjjv4t2efvAJtol/qejNZloBbyjgTmEgef5Rzgnbl1dyEddiKE4pOCnsI3G+r387nB/gV145E2CK0NHjV1KSC6RswE16x2XbnZ6wTq5o9ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMVPR04MB12628
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_060343_825627_5112AA23 
X-CRM114-Status: UNSURE (   8.25  )
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

The OpenHW Group (https://www.openhwgroup.org) maintains the CORE-V
family of open source RISC-V cores, including the CVA6 application
class core and the CVA6 APU FPGA platform built around it.

Signed-off-by: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba20029693..82440d498d 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1263,6 +1263,8 @@ patternProperties:
     description: OpenCores.org
   "^openembed,.*":
     description: OpenEmbed
+  "^openhwgroup,.*":
+    description: OpenHW Group
   "^openpandora,.*":
     description: OpenPandora GmbH
   "^openrisc,.*":
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
