Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D53D116F1
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Nov 2025 16:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dxK/Uw1PQp/xlWkdlS0C7FC/D/mTGlbADcsZNcXqTUs=; b=UxGiMUvW41NgHR
	XDyc0MAJK88LKakf62qPkcAiZhbAZ8MMTLJEQ+DdY6C8Bx/DKnEku5FXzpe1KVVGmgZAX7NSpdLIK
	fEodw3E6UH9rbCwNY6X3CC75X0bCiZzWrYh+RubBzkky7Q1F80zoLprX2q5T2S8Jv0pvW32atOXhZ
	3XPJY9x9LGZd7R1J+dj/lE4SmUJNWbUcXLV0Rp2S2vWb1CLWHMOH35j4wFr4nAu4NWzImvqYeUCdV
	uvFcTfRXbqP6SS3uq5YqozEzsZ8Ze1lAdX3MyXmDnv/4Fb/uERRlqFeoH1MEnWgBrvq7IlmvgHiTY
	S0cZMyRXtrX6AYw8z8EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP1Yp-00000000dnd-1EYA;
	Fri, 28 Nov 2025 16:43:07 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP1Yn-00000000dnD-0i6R
	for linux-riscv@lists.infradead.org;
	Fri, 28 Nov 2025 16:43:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jZpVqpXWKt5LwcWMtudyr+U9Cc7bPRDjdgZ032oY/Nmyas+YQ0nDRPk+m10oB0Tc7LkFCnUspXX6pEIXIKGOtgWE55D4Dh8LWBQ85bnkEhdvQ8JfDNutgjm8tFEbDVbqwc+oEM4YGbwMhdT2JEvdDFxfSh5HtZT/3d+RFcvdBtfVn7SMuKyjSYJyIoobWlD4DPfl6kRgaITzmcE2BHNs7/9Fr37JFVvwvIQroFfuN8KqTrS0q+zrO5FIx0u+AvP8LCbWmLadcmSth0ptyzn0cApocafxvQHEAgLtmL7KzNr0UwPbwcSbEpsepzgzF5LW/BjCdehCAtYas95LzIVCAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rzfTifcbYdCdJZBa4ESaPGSU6PbM64pk9YqHmaHutD0=;
 b=YE3tLGH5ZvsE34sk9JKz3yV04MvKWPM95kAgY7a97+Mbp7IGJjk1prjKBkr0jr27PObKItL93ua3ZAA5f28j5US+bcEBD//GpCEugTL6wyxEVQ8QsO4J1udRe0Ts5ENVav6qkzL/42kcvgexJatBF2Tf6o1Co1CV04Sc6JtrqGnkO3f6wmUv/q5eNmdB7KhBCvU+OTSCcd1eVZTamLuARCSl91oHP23R019fYqRgKIfBSvlE4/7K0rAvssSO4IhcUEl5qKQcFZVy1SIPFxOFfaaNP0JggcstQl5Sf0m2nsetFtnOxrZXkkG8W3QckGGR0dGsi3mcr02jXWCzW2akTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rzfTifcbYdCdJZBa4ESaPGSU6PbM64pk9YqHmaHutD0=;
 b=hWG3upRmMvWFA2FAyOhxY0sGHTPRk1ykDJkKg0HEuGLUZAs+AKWBj+TAHPD+riIg4IMH6fRA6tqkPEmb0mRimxl2pRgXTZrbM/LwcwJgqP+eZteQ2y4GBouintpNFLvUe4PFyRoHyGXBO1diFS5YpgZoHhmdiAGoQdR36BNyYgdw/+tRgoSFmkBlflOsRKH7GhfgitNhx3nj+/O+JRbehnnRat1cfK4RKdFmEO+9biMthewyirzUAZA+jGXqFZqO4UrxTZVyczqV7vU+Yv71GtUfgKXgIZNj8OyRDnEje8oEvlqICdNr+74Md8TLjNeGBg2OxJ08obhTNxn1yE5W+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8253.eurprd04.prod.outlook.com (2603:10a6:102:1bf::7)
 by AM9PR04MB8668.eurprd04.prod.outlook.com (2603:10a6:20b:43f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.16; Fri, 28 Nov
 2025 16:42:58 +0000
Received: from PAXPR04MB8253.eurprd04.prod.outlook.com
 ([fe80::b853:e05b:c1e5:41b7]) by PAXPR04MB8253.eurprd04.prod.outlook.com
 ([fe80::b853:e05b:c1e5:41b7%5]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 16:42:58 +0000
Date: Fri, 28 Nov 2025 18:42:53 +0200
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Samuel Holland <samuel@sholland.org>, Marc Zyngier <maz@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] of/irq: Ignore interrupt parent for nodes without
 interrupts
Message-ID: <dyaqe3ssrn65r5xndlwe7tlbiw2lbwvu3q3lzusfgr5mgycp6h@gfzyxk7uyva7>
References: <fbe6fc3657070fe2df7f0529043542b52b827449.1763116833.git.geert+renesas@glider.be>
Content-Disposition: inline
In-Reply-To: <fbe6fc3657070fe2df7f0529043542b52b827449.1763116833.git.geert+renesas@glider.be>
X-ClientProxiedBy: AS4PR10CA0028.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d8::13) To PAXPR04MB8253.eurprd04.prod.outlook.com
 (2603:10a6:102:1bf::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8253:EE_|AM9PR04MB8668:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d4a644d-278d-4705-64d5-08de2e9d2fed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QhfPGgTWakZuCmVMKF7jWB1HaByJjlXkteLItiv9hah/k5ijcMavTHY5dhqV?=
 =?us-ascii?Q?Rl3W+LKyxppq0QSTtLY0V9Iw4vcxnH5zu2QoF5EJ+zPrX+JYPCytCxZQIyxj?=
 =?us-ascii?Q?unPYew8E5av5M9QdhWeSOnxitxzV9CYv2vWTgCSAfDp4BKRwzb8XoBtaRDX7?=
 =?us-ascii?Q?lfSz2F7kpE2O2duYEk5S4MuDKJEkbrwXlnIloPk5uOGSgWj7fgY9rjYgy6BB?=
 =?us-ascii?Q?OKAbvhK0W5H2/dnbzCcOCii+AF7huu/8yhB5DppLS3GmldtloOEX1pIqQxlp?=
 =?us-ascii?Q?t8QzpM9MYU8fCZBQZfRfrg6HAGAZQlSOnMdtoJkDZPCJ2Ejpbtj0UZbqZV7/?=
 =?us-ascii?Q?gnP2f0Rn++EiJaZBg00tNB3/90RjL95f6ruSP7m+bIHj+daYWOn8c05OVfA8?=
 =?us-ascii?Q?t1t3sx+1C2tmNlsBzAPp556VQl8MBk5jQQITsEBt+M+HfeJwyi/d4qY3P/3b?=
 =?us-ascii?Q?8yDoqs6LHFKIjsnRe3o/rL+yPTHjW4tDVHHYYMoKmeNA/ZF069YCThoSApre?=
 =?us-ascii?Q?KemRZsUqwh1lxGQPT5tEMUB6N59EAQAAUn9jRQkK6JatrJRmd7j9UIXI8hmd?=
 =?us-ascii?Q?cH3lJP1qNCHPoJ+hhSI1FwL84ejDGfyqyu6sBBF0Ru+9yHGeicmLyE1boNls?=
 =?us-ascii?Q?5rugo8mS1XpNbqbiiQasQgVtPHytcw09oE2LcR1kHe1G3sZ/L0TI8EqSnauR?=
 =?us-ascii?Q?ziBjhtF1v1PXJWRXRg8SLokBM9q4gAWtIjoC1v4j7po12oGP8hEzA+8ZLEoE?=
 =?us-ascii?Q?LXaN2vCssoHdahm9/SSHr8ABMzGjSwkLUX/SYrvxL5QKaK8zv/EEHFHqkDzH?=
 =?us-ascii?Q?1a5sfAOlrVoSezecGLzg3gZeXAJh0vbzYliKdb9GWqy3SXrBY+YTn7tMyjGo?=
 =?us-ascii?Q?o94ngReskx3V2dOCAzRtpRz89u8rKaS8LthOsTVMcmOw9k068uz0Bk9BSxPY?=
 =?us-ascii?Q?JfT0Jmkpw1rje1i+dKBhNVSjWK8Pe3MwJmIY7LP3W/hoqE1p6bHMsfuAnX+a?=
 =?us-ascii?Q?lUeby6JzCfSTXy7rCz56FHUMte7KU6fYSV7k3iqTjm6/QtBDKWUn/P0ybCKt?=
 =?us-ascii?Q?Vb7nx6KoaKU3fxpFGCal6LsAZXkk+hht3gc7AYGCAwyoU7zuxRXEpVGHxj2F?=
 =?us-ascii?Q?Tug6o7wEoLGO4xQKvGsh6KNrXN4rj7YRDQ2QmoMcggqo7dOf22imnTSkaxil?=
 =?us-ascii?Q?uXo3x5Zdnbc3gEbyWw75MxxXe/44BJeCiCKOijOgQK6oqO2lZlkiy2gOMZsC?=
 =?us-ascii?Q?Eos9IHqm8FpWq4Zvz9XD8tmjrBRV7Awjrt7GYoLPOaNJHlKaHrDQOp7iLIFR?=
 =?us-ascii?Q?hS47p0H82sYXhdfNGktpdn4X9EWjemQAFqpb4mgWwI7OAW2+IKCa47RZ1H4V?=
 =?us-ascii?Q?fdrkTKGEsaIP7AdABVRr+CFBh+yybuUtwRGCeert/xjVoT+SJrkdIxMPnjvV?=
 =?us-ascii?Q?6VGKxbxetBig9oj+ETQ1C5W55j+ykHtOH1+huwmVyDA8xyo1ZtzcaQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8253.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZiE8rX3c1RYZ8mTW2w/CUszSwzwM8YGgt/91rmgeKo9LKHxjACI0tIpGJlzx?=
 =?us-ascii?Q?bNzLHyuXZlQYmmpWaRjL6AC5mCHZ3i8Bu2NsSOgpY49LAMWksj2zLAUkcAdI?=
 =?us-ascii?Q?7wz+eWZgJNc20xqHYt5TLF9QfJ6OQSVr9ia7Ncn2hfw5Z4cvz8FvLP5davaU?=
 =?us-ascii?Q?H6s0aRyzZKxs6p20q8ZzbXHMO+8tVsY0eUTvETDayisFXOlER3oM2j7KB7c3?=
 =?us-ascii?Q?leH5tN9/8Dg2bCNH4dGjzUqOTpI/aweCHANvLAM+TPteQ89g6axtC5h0fhdi?=
 =?us-ascii?Q?GL05aHfzERSCftNCep1OEBIOPo+i5YiQSP8jo5W3Z8EQFyLYXV//Fk99LAd9?=
 =?us-ascii?Q?P2J6geeuvj09Uh1nRH3jfTitgCxfKncVyQdNzG9sCRkJYS8K7/BIqIRV4aI0?=
 =?us-ascii?Q?1evPjsL+DN/3DOqOzORR4oRZ45243yX3dvjCjer/xQd68+zrN6SgRAJ7Fy5w?=
 =?us-ascii?Q?HLk4oVNb7ZrpbMX2ZmLJN7YwTBsiH4fe8TPiL2XWlvtvEKEaAbl0X1FxWfEf?=
 =?us-ascii?Q?X7rDAgiWlfYrq2pGRvLulZJiyB2KPbyZ6WEmGBulZVRMB0+FcyoKkzGMsdd0?=
 =?us-ascii?Q?zzLZpbqeyoRsbBeJHYjPlqpzYLbyZkExt5+8BVxbIvwKUHybQUvG1l16Z0Ez?=
 =?us-ascii?Q?ZjN6BZ9C449anDfusQvcN9XC6ppiOTNFuLFzqN5+i0QJ155wRukHbaY4BSch?=
 =?us-ascii?Q?KW6/805A5INJNGTzHL6uU/BWHl1IMkIKmUdxQ6u3iTiXgdW8keGQPnNXNTkr?=
 =?us-ascii?Q?3+WqnWhXNckKDYvC9bt9QBRmdYTD/GVmIt0BATCjUdpd/XCpzhYXGVTp5HKv?=
 =?us-ascii?Q?10hrljD+EGbV5GXIqVq1Djf0+DajV4n3HFGf/JU6q+O73MD6M0Nc+n0Cwli1?=
 =?us-ascii?Q?tXng+mgxh6/40MdgR82SGzm5WPsW17dD5vxk0Oqswv1S7nq/glRcwViFjg6t?=
 =?us-ascii?Q?d5Gioxq8YV8Q2bcAXiG1RG0FYfYrIZlqosDIvKaPtOe8+6lW9NERRzFncwjb?=
 =?us-ascii?Q?s4/KkZjjU5zJjDXhQ0vXDD0XHG760palmcI7Y0dvhJaCnMra4c6/IHEQbsw/?=
 =?us-ascii?Q?QcxIpef3rfqD9RGczJgMD89eU1bECfg0xA+XWXmY920ZOJKhKh1fmeDNek6N?=
 =?us-ascii?Q?rrJJiAbJtF35uoQoYURjgDb2oV3tVKr1CBBMjnuyLuLi8arHcMxhkfqZOi4F?=
 =?us-ascii?Q?3CT3c8vbCMdScBuWaP/7ld7vTjV35IktkNSwMyhUULai5xLziZQSE6vDfZqv?=
 =?us-ascii?Q?XSeTVHEW40wUx/eHskxXN0DH+D4btCH/gof6nzhd8Jt0WbMyBkGfIwpFCbf1?=
 =?us-ascii?Q?6q0EPcgWfEUFjGjg5B5O0u10KRIVtjxEp3D/np3O+jYHvVRSCDvP3gVtCYgS?=
 =?us-ascii?Q?RGvCawTlZ03299WKD5sL1kpM4oXulD4KbdL9ZtZ3fQdsKIu52cEAyrKL8uN9?=
 =?us-ascii?Q?Z7+vgTzVl/MXTEjbFrpbM3HgqD51VzrHWFb+56pHcslb25eg1LCFxqS4CoJ+?=
 =?us-ascii?Q?C68CYUDGZ+39z5Tcfr9OVSpcnKOyX5w302eiJm3F13VL+AfpPkMhSa7csKmo?=
 =?us-ascii?Q?IIn9FcjBkIe8HceDPeTx7W4qExsq25G7wcNGA3Rh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d4a644d-278d-4705-64d5-08de2e9d2fed
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8253.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 16:42:58.4460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sQNPLRhK+EA9n08OniJkAtIbzIaOOSBUP6qtUUQxcEyu+xEt7mOrK9+oajlP9E0ytNS8Z5ekTW7VjeJTYrB0ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8668
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_084305_234070_6CEBD41D 
X-CRM114-Status: GOOD (  25.32  )
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

On Fri, Nov 14, 2025 at 11:47:54AM +0100, Geert Uytterhoeven wrote:
> The Devicetree Specification states:
> 
>     The root of the interrupt tree is determined when traversal of the
>     interrupt tree reaches an interrupt controller node without an
>     interrupts property and thus no explicit interrupt parent.
> 
> However, of_irq_init() gratuitously assumes that a node without
> interrupts has an actual interrupt parent if it finds an
> interrupt-parent property higher up in the device tree.  Hence when such
> a property is present (e.g. in the root node), the root interrupt
> controller may not be detected as such, causing a panic:
> 
>     OF: of_irq_init: children remain, but no parents
>     Kernel panic - not syncing: No interrupt controller found.
> 
> Commit e91033621d56e055 ("of/irq: Use interrupts-extended to find
> parent") already fixed a first part, by checking for the presence of an
> interrupts-extended property.  Fix the second part by only calling
> of_irq_find_parent() when an interrupts property is present.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> v2:
>   - Split off from series "[PATCH/RFC 0/2] of/irq: Fix root interrupt
>     controller handling"[1] to relax dependencies,
>   - Drop RFC.
> 
> [1] https://lore.kernel.org/all/cover.1759485668.git.geert+renesas@glider.be
> ---
>  drivers/of/irq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> index b174ec29648955c6..5cb1ca89c1d8725d 100644
> --- a/drivers/of/irq.c
> +++ b/drivers/of/irq.c
> @@ -613,7 +613,7 @@ void __init of_irq_init(const struct of_device_id *matches)
>  		 * are the same distance away from the root irq controller.
>  		 */
>  		desc->interrupt_parent = of_parse_phandle(np, "interrupts-extended", 0);
> -		if (!desc->interrupt_parent)
> +		if (!desc->interrupt_parent && of_property_present(np, "interrupts"))
>  			desc->interrupt_parent = of_irq_find_parent(np);
>  		if (desc->interrupt_parent == np) {
>  			of_node_put(desc->interrupt_parent);
> -- 
> 2.43.0
> 
>

This change irq-ls-extirq and commit 6ba51b7b34ca ("of/irq: Handle
explicit interrupt parent") does not help with the issue.

This is how the DT node in lx2160a.dtsi looks like:

	extirq: interrupt-controller@14 {
		compatible = "fsl,lx2160a-extirq", "fsl,ls1088a-extirq";
		#interrupt-cells = <2>;
		#address-cells = <0>;
		interrupt-controller;
		reg = <0x14 4>;
		interrupt-map =
			<0 0 &gic GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
			<1 0 &gic GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
			<2 0 &gic GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
			<3 0 &gic GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
			<4 0 &gic GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
			<5 0 &gic GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
			<6 0 &gic GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
			<7 0 &gic GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
			<8 0 &gic GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
			<9 0 &gic GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
			<10 0 &gic GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
			<11 0 &gic GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
		interrupt-map-mask = <0xf 0x0>;
	};

with the following being in the root node:

	interrupt-parent = <&gic>;

Ioana


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
