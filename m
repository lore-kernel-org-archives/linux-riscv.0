Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4973CFCA179
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Mar 2026 19:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3y91WFRjCEzPtW+s0mYl8qIXFGpYj7utuJqariOgUYM=; b=nhceBlNCdKi0cw
	Rq5GFVHKdlyqtCcmGe4C2UlLnrQA4TvsKhjfwkhnoYghKMemNKjD6ClQwkoyrLVjuUClL1klRA/LJ
	UBr6dpqsLiD3GXVt3ckgGXHfdfIvjLkWQX+wGrfhMVyQwvC3momhbneVlW2AhFBj7ZJnMinFVvceO
	6y1YJLbNRP0o3YpdNOvmagLHVldqGkkd+dCalrVTOgjJUmc5wj5gVLQRYv7mBhxX4vWYWy3uQa/Md
	WBJK6+tVdW+tkjfnVhARFwHJ2nhrsa7ss0GuWOmf8T9k9MatAnvNTj9wy6qA5WC1aSkrEC7fAH0ed
	XTXUEooiz85/YzGLE0Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzfyp-00000007xie-0xiU;
	Mon, 09 Mar 2026 19:09:27 +0000
Received: from mail-northeuropeazon11010036.outbound.protection.outlook.com ([52.101.84.36] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzfyg-00000007xZd-0OhI;
	Mon, 09 Mar 2026 19:09:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tKc4+QMwaXsPT/W10pi3KcHqAW4IDuNjWiu1eh7//bVjA0u2fc/sl7NTtB5uQYCwuw8y1KYB7yhizt48oIHMLXD8u9oEGhXwK7rcPLw9bYfsTmRvvVIGbI5Oy6OiSGic16OPZZGKoUF9Dpe03sGX0IJ9cqnu9/2Z0BODbplmxss7c6YfdED1XPTShTjXvB9UWGH9aIwOI6M5OZnQRzwos8DPdti0zz5/7i1Ao11zWdU4tupnCi3t194OGIjjxDNosSF/R0cWBb8oBA01Zx7PSJOqPHIHrSes+c4M7XUdFfRqiCJ5Ej08bB+p1fCiyd01q7+prg666IxmJxSXnHQAKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S8g1cryLcRhbUu+1Vft4PZlDqgDG4cnCWNfGGum/8Ec=;
 b=uBvqCwc5pCeEl9jt9mJUpRhWDT6myl6qo2e61uo4ZsMJU3fZMKs+QyW9Ge+dHdOEHD0DdcG2b115b5R7YnHnuU4xDtHLyflNqUqsz53w8rxHFZ1yPOMoY+IKvFnSY3VsYUf5CT2Mdsp2hsgM093zqjTvcSw736C1/zGX5RhZhd1SEsGbXZpQ0rIzvZl0vzSRvyhj3BruiUSgAuNkdVvzeLXHyJlau01944CSmhjQTmwa6f0oVVcT8zCaVnpmZow3pH5jnqVWG8iKdCBSb5LcnxuEBSy0y6o3vbfDNK0dozMZIba7yED5eQHXjLibogw/nDuAxHnzM9GNlwbAHZWDFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S8g1cryLcRhbUu+1Vft4PZlDqgDG4cnCWNfGGum/8Ec=;
 b=EStCO+/Yem+mF2K87lHeSl127xytQFQbSWTC5cYRFSR2OF3z7vsDDZCfHfF8+9VayaYDyL/3ZOogs3ibRv31BhdBO4NdJd7z1xZBBAV6dcqvaCVL6T3oALR81FQHmddwToUMd27PZTCaYlbvpR7Q6XjF8f9IHvOS9JBGg4qQb5AKccg3qpXGEJ75CGwZzVFimrIkekf+00fnBmU3yT6nDF71eRMFR0dhwegqCkirPAsMtCEBqtMOxWe1NLkq/464N0QQ1GXdUtGG2YcTymLvC0/pyYBHg/FnnQdiQpq150LrMi6OQiQgO5t6i1Q5aXJMnTqopjeWa5Sg4tqAYh6y2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by AM9PR04MB7540.eurprd04.prod.outlook.com (2603:10a6:20b:283::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 19:09:10 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.023; Mon, 9 Mar 2026
 19:09:10 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: linux-phy@lists.infradead.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-can@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	spacemit@lists.linux.dev,
	UNGLinuxDriver@microchip.com,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Guo <shawn.guo@linaro.org>,
	Yixun Lan <dlan@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Kevin Xie <kevin.xie@starfivetech.com>
Subject: [PATCH v3 phy-next 02/24] PCI: Add missing headers transitively included by <linux/phy/phy.h>
Date: Mon,  9 Mar 2026 21:08:20 +0200
Message-ID: <20260309190842.927634-3-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309190842.927634-1-vladimir.oltean@nxp.com>
References: <20260309190842.927634-1-vladimir.oltean@nxp.com>
X-ClientProxiedBy: VI1PR0502CA0029.eurprd05.prod.outlook.com
 (2603:10a6:803:1::42) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|AM9PR04MB7540:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f730e9c-69bf-4915-d125-08de7e0f587c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|366016|10070799003|7416014|376014;
X-Microsoft-Antispam-Message-Info: xp+FOUhSln2uDcdtm/VbdNZKjE8eWPeKVVcFoiOEJ4hFTDi94uciU9On8nQKWt3JXJpC+C3f748eq6sRB9I3sca8/poPcNNpPn/DDM3gRDGBJJfuadTK88IuW4hB9WGcO29zNNwh4nax6RJ0c1505sFx/G6bOIAo4O3qEWibu+AluOcduD1NXcbMYtMQY5rCTnTAjN4vgL9rmrk20uSCxtGCCwAgVajPHHszMaSEkdHTCUqzu1bBYRLjS9XtwNtsZb8D1rygNLaCoTB1SqkJmdD4ATG2w9SzWr3QZcELac8QKTlXPkxgxBdv5Jd2eYT74NBQba9WygOet0SAK8xRozBb0f0jt1wSVy9X2JBIbJfD9AbJzxLyQ/6BI1WjK3YFL65s3hDXIuMESS6LMugW9Z038JSA5E+kKLhouLDa9kqleuAm2sO/rm83tr31N6YcR5l2Hvoz17bdlDUo1aU6qB2yOhm+jqx4agY97DvrpmzN/XWVPBLtdL58D9pL1lSUTdcchQqbCp6ZQxbOVjTYRsP5K6M7c+G/1qt2gqi2udqt3ZIdh7N7b3U/QONDSk9yky5noo0V0ynEgDcThK+T28myAtWhpO0sGxdxRVCepwnnZ02evRDABLS7U/mZ4Hzy4RbUvKJiYBKoDAhdYNFCKmjv12ZVnknfll6fHS6/01DRq4NicSvcc1aExnz4tSLDcw5sgSI26xHGLMqCqSjMEsyLzvEP8BemqFSs9IaDF8c=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8585.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(10070799003)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWlxNVlwZFNxUThZMDc4Z3FjbUxOZzRiM0p4aW02VXZNcTdPZHQzYzdOaEJO?=
 =?utf-8?B?SHRjeFpZUzVvN1dtVkRBclgvMlRCZ2FEVzkycmFWWnB3QXpoWHAwN3Y1OWJZ?=
 =?utf-8?B?SjdxVXJZcXlPS1A4OURkbzZRbGlEOW1HUUZTWGpCcDhwK3R6bUp4R0dXNnpj?=
 =?utf-8?B?SXRFM1Q1NDlHU2JvZ3Jtc2xscDFTbjBBbFBkYnhoUTNzSHhQdGgrWVErRW1i?=
 =?utf-8?B?bEJSNnd1a3BaOHhmcXFJSzlJLzQ1bDRqS05SSTdQVzFCakVVc1ExcUN0Nk5L?=
 =?utf-8?B?OFdQT01tTTR4eTM0dEk5NGRJUENuc3BIVlJ2ckwwUlVTRTkrMEQrYSs2NUw4?=
 =?utf-8?B?d1Q1QTJTVnZEVUpIR3BtRnRQVGhveTdlSG9jTUFpRDIrMEs5NmxxWXhua2s2?=
 =?utf-8?B?aWMxc3ZOWm90SUtlYXhWdDVkekk0Q2NEM3ZZd1pBNUJDTVhRSUh6QlppclZv?=
 =?utf-8?B?MWVzNmhEckdwUkRnSXJjRnE2OWlrblBpNSs0RDczVVZSSmRMQ1JWYWF2L3Za?=
 =?utf-8?B?MitKMDVyZS8rb3NHL0srTk9zdUhmeUF4bzVob2VmWTJqMVlJUURoMHE1a1gy?=
 =?utf-8?B?bUNpeiswRk04TERHcDZNRkd1QkMxZkNJZyszNWc0bS9Nc0lSd2RsM1ErQTZt?=
 =?utf-8?B?QzgzZTBWTnFiSitLaUllZGdWU3JLSzBCZ0Q3REJXcTlTMFdzcDcwU0hWZW54?=
 =?utf-8?B?bUhDZFpFd1ZKNzdadkZwOVBYejVIMlhiejNGY1Q4WXFmRXBpWXFBT0F3QkEx?=
 =?utf-8?B?a2M1WGUvQUk5UlY1UzhBb0pCcWNGWUFCaG1CL3kxVTJmL3NRZ2F0M0xLdjUz?=
 =?utf-8?B?QnhkeUJVZjgyRlRSTzZ0MVM0RDFMNmpPSGE3ZTlac3FIdkZjeTYvTE41WEpD?=
 =?utf-8?B?cTIvQS9QZEJUVFNiWGhuTEU5TDNWV1orVEZ2am9VSllUQ1VUSzRDbXBmcWwx?=
 =?utf-8?B?V1lsRHR4Qm1BdGRJWVNNMkRXeGlKOGRVdHk3WS9nL2l6dTlaYWN5NzlDSW9E?=
 =?utf-8?B?RVJBcFU3SFAySElOa0F4Q014N3dLWkFKSWZOMFJoTnpKTU9PZHZ4QWJLcUhO?=
 =?utf-8?B?Um5EeEgzYlNSTjVEamlqU0FjTS9oVHh0SVN3M0dFazRWVHp0TWJ4eGRzc3g3?=
 =?utf-8?B?UE8xVGtVQjhsZ3QxSjllM2ZPWUJUNU5pcjFjVGdHZ0FBUEo1QldJMGZFZytu?=
 =?utf-8?B?QmFEVDA5ait0djIxS3pvODlMS0dUTXpyTEJuenlWMDljZlZGMklvaGJuREl2?=
 =?utf-8?B?clZQMWR0MmE5TGlTU2xPMHFkZkY2Y2NBM01WZG1nZHdLZXRNVjFZRnlrd2hi?=
 =?utf-8?B?TnZaMGF1aXRFd3ZyWTExdkZzQUs4M3BFdVFsaVRJNUZGMitrOFhlQWNNQXoy?=
 =?utf-8?B?aWN2elVjTnBpZWlaMzVPWkNnVWZubzBvSUgwNFBBVE1CamhaemFSb3JkQ2tF?=
 =?utf-8?B?MUdralJ4YlVEQkVOaEUvU0NYZEJxZVlReGN5YlY3SzFlQWRQeG40NkZwMVdF?=
 =?utf-8?B?YllYZFNiekdTUnpiaXQ5NUpBa29KWlVaOG4yQjhYVFhvQ2p4TmI4NmFsUzJ2?=
 =?utf-8?B?Tk05UTNXY3RsdmVybm83L3NCeGJTNndFQW5YMk14ejJpREhIcEJrTXlrUjkz?=
 =?utf-8?B?ekdyZXR1b21jZXhXQWx3NGxEbWRjeXh0cEZGTjE2RWRGL2RUcUYrdWtaVkVt?=
 =?utf-8?B?THd0YWxYWm5pLzVpRDg1eXVaMUVnWEZMRTVtNTR1Rmc2QWU4L1VPUkU0N1Jn?=
 =?utf-8?B?NFB0N0NicmprUVlGeHZRcjAwNjgxeGhOTWQ0Z0pNQ1A2M2plb25EYlZFN1d3?=
 =?utf-8?B?dldYTnZXUWFQd01VREkwVmIvSDdGZUx4dFNZdllxbW01MzJDMmVhdm4xNnZF?=
 =?utf-8?B?aWpkUmZiMk9oek5obTIraStIUCsrb2JkRi8yblY4RC9hb3prUmpEMUlsY3JK?=
 =?utf-8?B?N0NhWEkxUEZqUmtRUDhtRnVWVUw5OWxjMFV5UlVyd01oN1o4bFg3MDZUdjls?=
 =?utf-8?B?WGxzRkc4MmFtMlI0VlVMZDU4eW5Ma3RRT1A0SzVmd3J3NXNtTkIrNnpEOEg5?=
 =?utf-8?B?VllSS0VLQnVaNFMxVVBadWN3M2VqTG51VjdJc29TaDVnZVFtYlVZRVpFZGlo?=
 =?utf-8?B?dDZISkJJWE9xQlVzSkJRMlFFYXNDR3lRS1lIK1Q1SkVoZnNybGJtS2d6VC9m?=
 =?utf-8?B?Qk90SDZodGpPdU5oRlRPOHpwK2p3RkNpbkhzVWpITDB4TjJkdnpYQ01IbW9n?=
 =?utf-8?B?YVpwWFBabHY1bzRoeVY0RDRtcGx3L0dsUUdGY0ZFN0RVOVRZdHk4MnJTdkla?=
 =?utf-8?B?ZXZldWVPdmVJK082aWoyQm5mQm1ENkwxVmx0Kys2Sk4vQlhwR2M0WDF3cVRP?=
 =?utf-8?Q?Ry/zbwotJjxqm9Lj15IdKgia1bzKNBc9L1hckbBEVcDAh?=
X-MS-Exchange-AntiSpam-MessageData-1: 2qvegL2lNJhmgw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f730e9c-69bf-4915-d125-08de7e0f587c
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 19:09:10.8655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V8U8yIL7UykR02lnWfaR22SFMOLwuWA0fMwT8vcPuKP1dvK9MbVA0YQMTUON7K4bDb/Wl75TFLF2n8swwJLUYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7540
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_120918_142880_6284B6DD 
X-CRM114-Status: GOOD (  11.22  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

VGhlIHRlZ3JhIGFzIHdlbGwgYXMgYSBmZXcgZHdjIFBDSSBjb250cm9sbGVyIGRyaXZlcnMgdXNl
cyBQTSBydW50aW1lCm9wZXJhdGlvbnMgd2l0aG91dCBpbmNsdWRpbmcgdGhlIHJlcXVpcmVkIDxs
aW51eC9wbV9ydW50aW1lLmg+IGhlYWRlci4KClNpbWlsYXJseSwgcGNpZS1yb2NrY2hpcC1ob3N0
LCBwY2llLXN0YXJmaXZlIGFzIHdlbGwgYXMgYSBmZXcgZHdjIFBDSQpjb250cm9sbGVycyB1c2Ug
dGhlIHJlZ3VsYXRvciBjb25zdW1lciBBUEkgd2l0aG91dCBpbmNsdWRpbmcKPGxpbnV4L3JlZ3Vs
YXRvci9jb25zdW1lci5oPi4KCkl0IHNlZW1zIHRoZXNlIGZ1bmN0aW9uIHByb3RvdHlwZXMgd2Vy
ZSBpbmRpcmVjdGx5IHByb3ZpZGVkIGJ5CjxsaW51eC9waHkvcGh5Lmg+LCBtb3N0bHkgYnkgbWlz
dGFrZSAobm9uZSBvZiB0aGUgZnVuY3Rpb25zIGl0IGV4cG9ydHMKbmVlZCBpdCkuCgpCZWZvcmUg
dGhlIFBIWSBoZWFkZXIgY2FuIGRyb3AgdGhlIHVubmVjZXNzYXJ5IGluY2x1ZGVzLCBtYWtlIHN1
cmUgdGhlClBDSSBjb250cm9sbGVyIGRyaXZlcnMgaW5jbHVkZSB3aGF0IHRoZXkgdXNlLgoKU2ln
bmVkLW9mZi1ieTogVmxhZGltaXIgT2x0ZWFuIDx2bGFkaW1pci5vbHRlYW5AbnhwLmNvbT4KQWNr
ZWQtYnk6IEJqb3JuIEhlbGdhYXMgPGJoZWxnYWFzQGdvb2dsZS5jb20+Ci0tLQpDYzogTG9yZW56
byBQaWVyYWxpc2kgPGxwaWVyYWxpc2lAa2VybmVsLm9yZz4KQ2M6ICJLcnp5c3p0b2YgV2lsY3p5
xYRza2kiIDxrd2lsY3p5bnNraUBrZXJuZWwub3JnPgpDYzogTWFuaXZhbm5hbiBTYWRoYXNpdmFt
IDxtYW5pQGtlcm5lbC5vcmc+CkNjOiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgpDYzog
Qmpvcm4gSGVsZ2FhcyA8YmhlbGdhYXNAZ29vZ2xlLmNvbT4KQ2M6IEhlaWtvIFN0dWVibmVyIDxo
ZWlrb0BzbnRlY2guZGU+CkNjOiBTaGF3biBHdW8gPHNoYXduLmd1b0BsaW5hcm8ub3JnPgpDYzog
WWl4dW4gTGFuIDxkbGFuQGtlcm5lbC5vcmc+CkNjOiBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5y
ZWRpbmdAZ21haWwuY29tPgpDYzogSm9uYXRoYW4gSHVudGVyIDxqb25hdGhhbmhAbnZpZGlhLmNv
bT4KQ2M6IFNoYXduIExpbiA8c2hhd24ubGluQHJvY2stY2hpcHMuY29tPgpDYzogS2V2aW4gWGll
IDxrZXZpbi54aWVAc3RhcmZpdmV0ZWNoLmNvbT4KCnYyLT52Mzogbm9uZQp2MS0+djI6IGNvbGxl
Y3QgdGFnLCBhZGp1c3QgY29tbWl0IHRpdGxlCi0tLQogZHJpdmVycy9wY2kvY29udHJvbGxlci9k
d2MvcGNpLWtleXN0b25lLmMgICAgIHwgMSArCiBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9w
Y2llLWR3LXJvY2tjaGlwLmMgfCAxICsKIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUt
aGlzdGIuYyAgICAgICB8IDEgKwogZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1xY29t
LWVwLmMgICAgIHwgMSArCiBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLXNwYWNlbWl0
LWsxLmMgfCAyICsrCiBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLXRlZ3JhMTk0LmMg
ICAgfCAxICsKIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpLXRlZ3JhLmMgICAgICAgICAgICB8
IDEgKwogZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLXJvY2tjaGlwLWhvc3QuYyAgIHwgMSAr
CiBkcml2ZXJzL3BjaS9jb250cm9sbGVyL3BsZGEvcGNpZS1zdGFyZml2ZS5jICAgfCAxICsKIDkg
ZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNp
L2NvbnRyb2xsZXIvZHdjL3BjaS1rZXlzdG9uZS5jIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9k
d2MvcGNpLWtleXN0b25lLmMKaW5kZXggMjBmYTRkYWRiODJhLi42NDJlNGM0NWVlZmMgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaS1rZXlzdG9uZS5jCisrKyBiL2Ry
aXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaS1rZXlzdG9uZS5jCkBAIC0yNCw2ICsyNCw3IEBA
CiAjaW5jbHVkZSA8bGludXgvb2ZfcGNpLmg+CiAjaW5jbHVkZSA8bGludXgvcGh5L3BoeS5oPgog
I2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgorI2luY2x1ZGUgPGxpbnV4L3BtX3J1
bnRpbWUuaD4KICNpbmNsdWRlIDxsaW51eC9yZWdtYXAuaD4KICNpbmNsdWRlIDxsaW51eC9yZXNv
dXJjZS5oPgogI2luY2x1ZGUgPGxpbnV4L3NpZ25hbC5oPgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9w
Y2kvY29udHJvbGxlci9kd2MvcGNpZS1kdy1yb2NrY2hpcC5jIGIvZHJpdmVycy9wY2kvY29udHJv
bGxlci9kd2MvcGNpZS1kdy1yb2NrY2hpcC5jCmluZGV4IDViMTdkYTYzMTUxZC4uZTAwNzllYzEw
OGFiIDEwMDY0NAotLS0gYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWR3LXJvY2tj
aGlwLmMKKysrIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1kdy1yb2NrY2hpcC5j
CkBAIC0yMSw2ICsyMSw3IEBACiAjaW5jbHVkZSA8bGludXgvcGh5L3BoeS5oPgogI2luY2x1ZGUg
PGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgogI2luY2x1ZGUgPGxpbnV4L3JlZ21hcC5oPgorI2lu
Y2x1ZGUgPGxpbnV4L3JlZ3VsYXRvci9jb25zdW1lci5oPgogI2luY2x1ZGUgPGxpbnV4L3Jlc2V0
Lmg+CiAKICNpbmNsdWRlICIuLi8uLi9wY2kuaCIKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2Nv
bnRyb2xsZXIvZHdjL3BjaWUtaGlzdGIuYyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3Bj
aWUtaGlzdGIuYwppbmRleCBhNTIwNzE1ODkzNzcuLjQzMmE1NGM1YmZjZSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1oaXN0Yi5jCisrKyBiL2RyaXZlcnMvcGNp
L2NvbnRyb2xsZXIvZHdjL3BjaWUtaGlzdGIuYwpAQCAtMTgsNiArMTgsNyBAQAogI2luY2x1ZGUg
PGxpbnV4L3BjaS5oPgogI2luY2x1ZGUgPGxpbnV4L3BoeS9waHkuaD4KICNpbmNsdWRlIDxsaW51
eC9wbGF0Zm9ybV9kZXZpY2UuaD4KKyNpbmNsdWRlIDxsaW51eC9yZWd1bGF0b3IvY29uc3VtZXIu
aD4KICNpbmNsdWRlIDxsaW51eC9yZXNvdXJjZS5oPgogI2luY2x1ZGUgPGxpbnV4L3Jlc2V0Lmg+
CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtcWNvbS1lcC5j
IGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1xY29tLWVwLmMKaW5kZXggMTg0NjBm
MDFiMmM2Li5lNDE3MTIyZGE1MWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIv
ZHdjL3BjaWUtcWNvbS1lcC5jCisrKyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUt
cWNvbS1lcC5jCkBAIC0xOSw2ICsxOSw3IEBACiAjaW5jbHVkZSA8bGludXgvcGh5L3BoeS5oPgog
I2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgogI2luY2x1ZGUgPGxpbnV4L3BtX2Rv
bWFpbi5oPgorI2luY2x1ZGUgPGxpbnV4L3BtX3J1bnRpbWUuaD4KICNpbmNsdWRlIDxsaW51eC9y
ZWdtYXAuaD4KICNpbmNsdWRlIDxsaW51eC9yZXNldC5oPgogI2luY2x1ZGUgPGxpbnV4L21vZHVs
ZS5oPgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1zcGFjZW1p
dC1rMS5jIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1zcGFjZW1pdC1rMS5jCmlu
ZGV4IGJlMjBhNTIwMjU1Yi4uZGJlYzE1OWZkNDU4IDEwMDY0NAotLS0gYS9kcml2ZXJzL3BjaS9j
b250cm9sbGVyL2R3Yy9wY2llLXNwYWNlbWl0LWsxLmMKKysrIGIvZHJpdmVycy9wY2kvY29udHJv
bGxlci9kd2MvcGNpZS1zcGFjZW1pdC1rMS5jCkBAIC0xNSw3ICsxNSw5IEBACiAjaW5jbHVkZSA8
bGludXgvbW9kX2RldmljZXRhYmxlLmg+CiAjaW5jbHVkZSA8bGludXgvcGh5L3BoeS5oPgogI2lu
Y2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgorI2luY2x1ZGUgPGxpbnV4L3BtX3J1bnRp
bWUuaD4KICNpbmNsdWRlIDxsaW51eC9yZWdtYXAuaD4KKyNpbmNsdWRlIDxsaW51eC9yZWd1bGF0
b3IvY29uc3VtZXIuaD4KICNpbmNsdWRlIDxsaW51eC9yZXNldC5oPgogI2luY2x1ZGUgPGxpbnV4
L3R5cGVzLmg+CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUt
dGVncmExOTQuYyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtdGVncmExOTQuYwpp
bmRleCAwNjU3MWQ4MDZhYjMuLjMzNzhhODk1ODBhYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9wY2kv
Y29udHJvbGxlci9kd2MvcGNpZS10ZWdyYTE5NC5jCisrKyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xs
ZXIvZHdjL3BjaWUtdGVncmExOTQuYwpAQCAtMjcsNiArMjcsNyBAQAogI2luY2x1ZGUgPGxpbnV4
L3BsYXRmb3JtX2RldmljZS5oPgogI2luY2x1ZGUgPGxpbnV4L3BtX3J1bnRpbWUuaD4KICNpbmNs
dWRlIDxsaW51eC9yYW5kb20uaD4KKyNpbmNsdWRlIDxsaW51eC9yZWd1bGF0b3IvY29uc3VtZXIu
aD4KICNpbmNsdWRlIDxsaW51eC9yZXNldC5oPgogI2luY2x1ZGUgPGxpbnV4L3Jlc291cmNlLmg+
CiAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2NvbnRy
b2xsZXIvcGNpLXRlZ3JhLmMgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaS10ZWdyYS5jCmlu
ZGV4IDUxMjMwOTc2M2QxZi4uYTJjMTY2MmI2ZTgxIDEwMDY0NAotLS0gYS9kcml2ZXJzL3BjaS9j
b250cm9sbGVyL3BjaS10ZWdyYS5jCisrKyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpLXRl
Z3JhLmMKQEAgLTM2LDYgKzM2LDcgQEAKICNpbmNsdWRlIDxsaW51eC9waHkvcGh5Lmg+CiAjaW5j
bHVkZSA8bGludXgvcGluY3RybC9jb25zdW1lci5oPgogI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3Jt
X2RldmljZS5oPgorI2luY2x1ZGUgPGxpbnV4L3BtX3J1bnRpbWUuaD4KICNpbmNsdWRlIDxsaW51
eC9yZXNldC5oPgogI2luY2x1ZGUgPGxpbnV4L3NpemVzLmg+CiAjaW5jbHVkZSA8bGludXgvc2xh
Yi5oPgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLXJvY2tjaGlwLWhv
c3QuYyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1yb2NrY2hpcC1ob3N0LmMKaW5kZXgg
ZWUxODIyY2EwMWRiLi40NmFkYjQ1ODJmY2MgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGNpL2NvbnRy
b2xsZXIvcGNpZS1yb2NrY2hpcC1ob3N0LmMKKysrIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9w
Y2llLXJvY2tjaGlwLWhvc3QuYwpAQCAtMjQsNiArMjQsNyBAQAogI2luY2x1ZGUgPGxpbnV4L29m
X3BjaS5oPgogI2luY2x1ZGUgPGxpbnV4L3BoeS9waHkuaD4KICNpbmNsdWRlIDxsaW51eC9wbGF0
Zm9ybV9kZXZpY2UuaD4KKyNpbmNsdWRlIDxsaW51eC9yZWd1bGF0b3IvY29uc3VtZXIuaD4KIAog
I2luY2x1ZGUgIi4uL3BjaS5oIgogI2luY2x1ZGUgInBjaWUtcm9ja2NoaXAuaCIKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGxkYS9wY2llLXN0YXJmaXZlLmMgYi9kcml2ZXJz
L3BjaS9jb250cm9sbGVyL3BsZGEvcGNpZS1zdGFyZml2ZS5jCmluZGV4IDI5ODAzNmMzZTdmOS4u
MjIzNDRjY2ExNjdiIDEwMDY0NAotLS0gYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3BsZGEvcGNp
ZS1zdGFyZml2ZS5jCisrKyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGxkYS9wY2llLXN0YXJm
aXZlLmMKQEAgLTIxLDYgKzIxLDcgQEAKICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2Uu
aD4KICNpbmNsdWRlIDxsaW51eC9wbV9ydW50aW1lLmg+CiAjaW5jbHVkZSA8bGludXgvcmVnbWFw
Lmg+CisjaW5jbHVkZSA8bGludXgvcmVndWxhdG9yL2NvbnN1bWVyLmg+CiAjaW5jbHVkZSA8bGlu
dXgvcmVzZXQuaD4KICNpbmNsdWRlICIuLi8uLi9wY2kuaCIKIAotLSAKMi40My4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
