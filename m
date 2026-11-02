Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05594606A332
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 14:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T/IjWqgB;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=SH1NrueF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/IuopC3bN6gmmiS+EPJmXYkwCUYaWWhJR0eMpl/JPHs=; b=T/IjWqgBalgxgMiIaI8MrFUHEB
	nIz3Qf1ljJZZ0jmo3DntAHy3PsRVhqS9Ua6FbZll96phmdS7rvVb5d/tSGF2ORDRzqTmu/XzYsamx
	3UWbTCRpFUug8QyFrSndjPJOaJT3PAcCIlsa2/sPhfdUq9yGGGuKoG+Xv7GkjS/r+MPRhtfVT1YSr
	kBklNmpYoPusY69Ggj9gJFkkPs4Y1MqEo8Z3PGbTLrHHCOK+ciiBMls8lxIBV+w71nW+AvkLFmttp
	vcr9H9sO52sNV86QaAEJ4f0L4E4wsZ6Rds1TW+v4oaxnyPfhfP+Mnj3hcIL3pjyLm2yxFCA/HSpE3
	6K39IE1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsde-0000000Gi6h-37vc;
	Mon, 02 Nov 2026 14:03:54 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsdc-0000000Gi5R-0THV
	for linux-riscv@lists.infradead.org;
	Mon, 02 Nov 2026 14:03:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U5Wom5cg0WcDeQ8+gtto0oESfVU7gjazCcZ+QtES+akzdh/ajj3lp+w5IBDj0iY37GW+qI2dXSWg8FYj+2MiNBddety/Apac9vVhN0s3kD71bAkiSpoSn0XSCslaxmsZSeVL7ZZdMkMoCu2hL8+WeWokT3Of8DXpkiGsnXTMQRRDVbXqAPUENfecZMQEvy2MeVVEZR+0e5EEMk6yV/S4qbITA8P+X0yf8gIWOHzO+6OIT4oBrr1PMk8apZdyZl1sR1YTSHNsnHGa12dSrQS4e/kaOt6GMJGmwfeIJqIzSycqMW6jdXFu2tGxIwk97dhZuVjY7SXanD6MDBmtHZjDuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lrDmTei/H3yU/35ScAiNT+t+6rB/hDCxf4yutPBBvyI=;
 b=q/NBy+zfK7u2REczvCwR3MPhNE27hxSyHieK+H3lFfyR+KPfId5WyUJDtPd2Ypys57ceJD3wEaggtaeOEL9HIZXTuiuoGhjVfEPjGAThlp8XtUxjXZRruY0G0y3T76O0Rot1ym5f5EXGHD4j+ixgrUoKJRB0VN2z9/sQJtltkBUcWTeu1J8UQII7Er76rm8lMRy3Pd5HzJrSrsNfm6s/GWnQBYnTo7rIo+hFIr6By2nQ0O/jQfVkzY2tKX5giYi3vBHvNHHjj9dbtY1CATAas2+SkJ1vnhVS5/JkX3BjDHw767GbtfaPCByx2VKQYrgF5q0fYVcEBEYiI1iZzOfx8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lrDmTei/H3yU/35ScAiNT+t+6rB/hDCxf4yutPBBvyI=;
 b=SH1NrueFs5TRLZY+EEHVxVI597FjH4jasrBERjKDBka5U507tRdEwqPJszgYh74eF1Fttd3B8h9/bggTX2VYxZFWTbebd6e31iQHBXgJzWVvXp1gLjfOVJ/oBtl/NyUvzETsIj/FUQ6kz/IfbH9+onWhRvwjrLbj+xhtcbfsVPsp4BzoR1ivx9VMoPnhIfsHPwFgJ3CKFeHP5O7k8DBlbo9IU+zXAm8CmkDEfN8quaS1rHWVTi27nizSx3bpJGl3bVw1ld2miFRWFAXjLHB1kcNv/sq1SkQGAGge5wrC0Xv44Q5AgKs+iIvltkRzEq4E58VX3HKng7JhN7P/C2DKeQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13) by AMVPR04MB12628.eurprd04.prod.outlook.com
 (2603:10a6:20b:773::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 14:03:47 +0000
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930]) by PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930%3]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 14:03:47 +0000
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
Subject: [PATCH 2/8] dt-bindings: riscv: cpus: add OpenHW Group CVA6 compatibles
Date: Mon,  2 Nov 2026 15:17:21 +0100
Message-Id: <20261102141727.640769-3-marouene.boubakri@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261102141727.640769-1-marouene.boubakri@oss.nxp.com>
References: <20261102141727.640769-1-marouene.boubakri@oss.nxp.com>
X-ClientProxiedBy: PH7PR13CA0016.namprd13.prod.outlook.com
 (2603:10b6:510:174::9) To PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11203:EE_|AMVPR04MB12628:EE_
X-MS-Office365-Filtering-Correlation-Id: b8f18579-2d78-44b4-2681-08df38ea1d1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|19092799006|6133799003|22082099003|18002099003|56012099006|261009223027099003|261021121427099003|261022075727099003|11063799006|10067099003|261026121527099003;
X-Microsoft-Antispam-Message-Info: CZ8MICeG7h2MXfI1Ydyw9SZdjapfHI7j6w9FOYw0/06nifHn75EJRZpnWQ6zv/fFoHR4VQrLMflaj2p4wfZFfwpHIxzW/OHIZ59C5Xdu7Gvu7M71AlegFkCL/7tzq+n3Hi83JiWQBe5spR8iIwfFL1CJubceO0ELA+D9kR1EvJmY1B8mJx15F1c61aKqDDVBkOdCqQgmjXygoeKm/BCvmkdD7JoYi6FojsO7soEUyRk2KsdZzmk3aU//ZYqt1/cOVDtbqw+R7jFQ3yc4PGBDHybzuPG4WOZbjEupwvzmUmpT6Orbl4IWj0S8nccmiEQIOEkBpjfh1PY1gMupz1uyEuCn/Db9cL6kVeygAoUktyha3w6MeInxXsn/X+ZMk0NGQAfP/x/tyW1Yv/+ozaDkXQ8jSiqWbLZCqs+IMYmGhfalHELZISBtpa50YnKBgjTzjbpcEKXXsty88wX50MUE1KdLGFIl5+4lb6Oy5sgWg+fqZAgkyaEKUMgXWCAn1WicicbWGercyQtqNPv5jckng4UL3Sz1OjIGf7yKFVJ7nmcNu+eERihuHA5mqPV/8dzxgFk/f2BONh8Zd8pbk3bZCqv/R2HliLX0jAnwPqk3FBXAc2+r5oYY/0mg8VtqEhf9DXLy7ekJ3DemuRZCEk5f1e9kKbLokVIatkv3jedarbE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11203.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(19092799006)(6133799003)(22082099003)(18002099003)(56012099006)(261009223027099003)(261021121427099003)(261022075727099003)(11063799006)(10067099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jZOM972kkJ+IniITbxGaE+8bSYYS/lvcVGMJQtsTkj+bGCWnSjTpJZ+SdbdL?=
 =?us-ascii?Q?9Sc8ZRpq7meCOZr9e1sG8EhY1I1uILpiw7aQutFE32ZSX4FbrKqewfvvlbeF?=
 =?us-ascii?Q?Ck5FtLFvqihEQW1U/zYXmri9DrXpM5Hb2VJGCGLEFuVqxB4wSNC67BEeWXBd?=
 =?us-ascii?Q?cFdj0/Xq+0s9ItEb3DJfcAaTTWVj6rBwDDChIo1ZdNGma5yFt6NxHXmOci3g?=
 =?us-ascii?Q?Fwuqeprf7A/zWC8lMd5yy0kizIRN5QhG2OJEiZ3JHqNfq45okix2+RIT9bLq?=
 =?us-ascii?Q?AHTL33HttR6axNj9xR+jo8VEQhZOJDWZROI2nVi74134ZT+SI/8X6AE3zdhB?=
 =?us-ascii?Q?RcZqgRzZuny8yQBDd1ilSjMl3rHRfyqlykFQZsOlpoh9Ai2HWbsn0R8askIJ?=
 =?us-ascii?Q?p1OusvL6/IjGZWCoFSGovLDb00tsDVfcA6nOgyI4AfUSRFdDobmdcI8gWM0g?=
 =?us-ascii?Q?z2gWeDTX/11socDCEKmR9ITRl1tGIgCik/gU8v7uYPbAGEPW0cmNMqhRQdis?=
 =?us-ascii?Q?wjelUHahYkKhla7U+SZnIrCMAkGB5+AVIXyAon5Lek+NRCZwHyczZp1cADS/?=
 =?us-ascii?Q?V1hklf+k7nqILM45U5OltsP7Ita3cwFgYkaaLRkxvUaRgCaBWV3jxYyWHMC7?=
 =?us-ascii?Q?MwXWTxFt4qBmqhijG1mPZzh2IToWtmJQI5X7QK7+xrGvLjgMXrXtRZ3ID0Ku?=
 =?us-ascii?Q?nK/YzBt4Kixx0mLTHZvVVK6mdfpprh6iOWUSum5LSU13FJs2Cw8j0H0h5QS9?=
 =?us-ascii?Q?U2cWJiIoR0VjDmDy2fzhnxqB6n8UNuQvR4sMwdvaOO11cl9swK8FAOCiZiig?=
 =?us-ascii?Q?5O2Se9b9OyxatYvjhB0ha0O3MvvFEHp/iYnsGESuf9QQoVK5WrkDhK2v3uYi?=
 =?us-ascii?Q?qjHBgay7XFfBn6aKHQ1GhZ2q8u1auiN7MyB2N2KkU8gisA1MIU/S7UPeUVWc?=
 =?us-ascii?Q?QJdb4pIV94BAaxhW8CRhtwcAM9+GVhO8ZsJLzHSUIZCkEKKZfa+gu6qMXw65?=
 =?us-ascii?Q?1Yc0GZ8xuvMApo85IdnvMT1oGrU3Rg/dc3ao9Jy110oxnWUHQXIvwTBngm8H?=
 =?us-ascii?Q?tpBNJSASW6QdQZeHx3v7Ye41xCxFS1bRrLD+UtaKhlF4DUwS3xvLp0av/Qyw?=
 =?us-ascii?Q?xhFc0EoQKn6m/UqPH3VloT63daQw+sbJAJfrmOv8m+sv76c4rcyldsvJPU7a?=
 =?us-ascii?Q?DhMyciOlSc1tyRN/YIMkeHDicd7Og8HznwMjI/KHbTbTgGfcZHNRLDeV2YLD?=
 =?us-ascii?Q?N81cxka/zTTogc1KV7HRfwZ6p0f5a6gVrbugi1jScz9Jz5Z15fr3ZYTodq2j?=
 =?us-ascii?Q?hbNemTqFgCsrx7SGYOjXMTATO0UjDrzNzrEDiZ4PLAFzU+GEYOUCEyno/RLC?=
 =?us-ascii?Q?B5P/8oRNPrk0VkZhusaMPpLUjqOpqdanjDIagmuhEthWxvPBGJMurrdEH5x2?=
 =?us-ascii?Q?Dcc7ZBrqHQOU/UahiZ/rqqDLGdveHFgYxua4hepDEvbsVBj4TnOnMeh0oh2w?=
 =?us-ascii?Q?fhjXADW7Nox0PuOsn1ZbwThqL6q06PaWjFK2/RNLT12Psfb//wxwAvAAzlFN?=
 =?us-ascii?Q?IM2kRrLfUKe6syK2sCXAVMAwDTP6ycgBaG82gCm6gqcw41uqJS+U3COhuNWe?=
 =?us-ascii?Q?4VpkY/XxY8/+u2IELRAA1B8EL1gwbmsaiLTRnSlf9Z1HxGPvDYIY0QHlwAIz?=
 =?us-ascii?Q?nJ3LczDW/rWhIqKWmIyIgeeont0gZ7HS7Bstc53ipRSedRLvQfu3x1OONuPi?=
 =?us-ascii?Q?o/hC7QHz2lDHcNcSXFSTo4uXPbhOcMsOWJcz2gtjTrU0qiBfk1qxgQCSorXJ?=
X-MS-Exchange-AntiSpam-MessageData-1: LGqTLWwi5T9GGw==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8f18579-2d78-44b4-2681-08df38ea1d1f
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11203.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 14:03:47.3151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FtORqmHrUDdktTRDct3ClOflL+ZUNBwAUCwXfTTf5SdR5lDI651lBx5+v1szlsmTNP7Dg8n5V6cWWdKUm5aAfunQbytINiggC/M2+dlim1Ge5Qg7/LdWnikupJHCQ3+6pWQaliq5Nr0jFed43OoUng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMVPR04MB12628
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_060352_159353_4872F8FE 
X-CRM114-Status: UNSURE (   8.23  )
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

Add the compatible strings for the two configurations of the OpenHW
Group CVA6 application class core: the 64-bit cv64a6 and the 32-bit
cv32a6.

Signed-off-by: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 0da219ae67..81c3a6cf91 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -49,6 +49,8 @@ properties:
               - andestech,ax45mp
               - canaan,k210
               - nuclei,ux900
+              - openhwgroup,cv32a6
+              - openhwgroup,cv64a6
               - sifive,bullet0
               - sifive,e5
               - sifive,e7
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
