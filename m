Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F906EF5866
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Mar 2026 11:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MO/2aBuBb4qW3OLT3YtOlA5OHQuQceRFFn7uP5wCwd8=; b=rpCFPKLGtvTitE
	Ia3xeb3kmBLrgIVd7DLL7GYQXaBsHCQLIgfM+NE6TqGsWvMDxtk8T7Jv/MmTqO7btLgUTI99fggdS
	UjV+NsKbTdBHDoxmUAES0r6VaTvLu5LvAPBdDyFA7gpOqEdsq5oHbHfVUAbUee1irWcQdRi+BD+kD
	GQv/HjbTAgVmMPq32+ioqVsyeK3TV9+6+a3Qn4uKO9zZmW3+Q8D8NXsaKuzjxYWeZ2CGv+Ps95vkT
	LWiJIeKv2UzduaADHXxZFQGJ+Y1EhNeFOnp4rRsXJtQJWVI2VPBfp8Bjg6s4MEERrz/0D4FhfZanV
	trQOBoQhdmZoLQAE6kpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzCYj-00000005vn3-2iNf;
	Sun, 08 Mar 2026 11:44:33 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzCXd-00000005uAU-3Dyl;
	Sun, 08 Mar 2026 11:43:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ipt6HcEcKc79kxSV8v+AlH0XfGEODeZP6bNNtuR00PgUQvODPE/6Eb3bp4u97LBJRXOsuqlqPCgSgfAJGqJKRY/O5GVAbMA9RmLOE7UrKM7kbnoqGvv3/HZI/DTQlS/k6gFIzemleezgOpX6sCh4wQRV9BM3/I6yFPQ3jaqbd89/FwYZWFcdqhp54eWHoA1+KxqaeljdDIdekEWhsZMz6G/v8IsfJJY8x6g1tpoAEFjbVamB0nxK2yjg38oLMHc5mkfN4AjwMFMYX3kQgJ7i3kS6+66q3FfbLwh5Xen8iTzLPN38ufZ2oeSANO63PzJ8S5HIV5D2h3aR6eaJd3fsOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yTP9dkav8JweRW1U3kqjtUz7WSqgJOl3e+FPpj3lzjA=;
 b=dptsulbdeeDRrGzG2ZzSC4RxigfNMXZ2Pkyj6gaVdmBK80bEpzLyDmM8CnToX+sVBlePKsXkG1z4MU+kWCXR+uqxmX8gU0PXTQAeCn0NdVbwXr07++BIUVMVNFCBdFh1sEhAQIjOr8tEv3urVwxH55Zl1JNWEdZ/kiexLzH3cRbvmLlmE6RM4vPNboqIVa1X4/hCqbiWVt5u1+EEyzeM1AHhgjmwGWD0SLasnm8r96gfNpmS3cfj53WkT+FxVPegqT+AI+aeng6vnC/wa72wr1kNzrT1PuM+coMQaamfLTa4v3/PoCGI9QmFectRC6/RqCBAclBwUb6MSDRG9gXpgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yTP9dkav8JweRW1U3kqjtUz7WSqgJOl3e+FPpj3lzjA=;
 b=AReJZvP7qzaDiRMfPhFDgNcrtcxP+JPOVwsRY19P55cea4JPH/OASpDaRS9ykv/AqO1ZExihbhjDqky+QgGcGVhC50ReJulf+pcdm72y2jQ9RYmc4GSJHnJdEZ/NecKp/0M/psKAk1tSEjv7JR9ArrYD/NnTDI+zXpOcAPFyyboIez2pcCyvYVdQ61y0LtnW+94l/ZghrXEm5qzpoyE9FkJgCD6TrAhNYVIrd2AW7Y5Wvkf7MQ0Syh9TO3XXa/hzzpay/Kuotay0UFryx3+ichouSHbvZwHBefKgRRW1dci2zjlbWLZPddC2B++1BIr77+jcJQ6ye02mfioXVbChTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by DB9PR04MB12426.eurprd04.prod.outlook.com (2603:10a6:10:614::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.23; Sun, 8 Mar
 2026 11:43:15 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.023; Sun, 8 Mar 2026
 11:43:16 +0000
From: vladimir.oltean@nxp.com
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
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	spacemit@lists.linux.dev,
	UNGLinuxDriver@microchip.com,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v2 phy-next 10/24] drm/rockchip: dw_hdmi: avoid direct dereference of phy->dev.of_node
Date: Sun,  8 Mar 2026 13:39:55 +0200
Message-ID: <20260308114009.2546587-11-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260308114009.2546587-1-vladimir.oltean@nxp.com>
References: <20260308114009.2546587-1-vladimir.oltean@nxp.com>
X-ClientProxiedBy: VI1PR0102CA0036.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::49) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|DB9PR04MB12426:EE_
X-MS-Office365-Filtering-Correlation-Id: d21bdca4-b0aa-4b80-669c-08de7d07e2e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|19092799006|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: h9aXll0nJKxzP0Q8Qv4nw6Tm6gca1xHHlYnyGTt0aYhuVXumaTHALHJ2Yu9jJKjWU+a7TG6+PQzOvTR40lnWF2xtoDqOZvZbAzYkhR8+1VSOcksUUYipxza4ZKsvF1/kVkTiQWYUKNJarrX0GZKw+q7uXwI4ydsbIycDYwMCl7s3oP2MHOD+cURHtdX7LodPVkwt/O70iEVaJeJQQZ2I2n14c7VqpmW3Z7ZBgP07C7KkKfprECUcdvSMcho/G7BC231SiIG6VPMRH5T5eSxGMdWq3LYzDqlKuiyihcDYxjAlc2vbRyJatbGBFqv6L6IMf5VAjHz7u/Y45wPs7L68+ch5jvC96UBbR5fkKMYQuYXKCrXYvjCkc/AmW2GTqXGP+KpFbuRaCDXMtUoHstCFSTeLMOlsQJsIh7HkqYjd7vJl2lzPNtsWi8sxl7JG7arc4OELLrQVMRD0Ljohwr2VIMcsDABc2liOHHiNVT682FLMcHleaBv47LR5Wc1v12wd+yExN8baOtC/ylsTJegqlth+g3xNyFaT8Xp+Yw1CAsTrhD1brLcRcdN04VSOb6wymfkL7/h3n82qK7TrVJYXKRk1iwrqB27/LiLE075jqlO8pRc8BtDIRiQ3dEBr75grbC/hydP38EMXFtuFHOkQ5ZyiGj1LZyJ4/F6vEVomEpXtV05ltmCghCeCGQZmA6CnPlN1qNohE47nvyQGJlA0WHibhJx1fPqoQVVr0rmUiIk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8585.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(19092799006)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXNMQ3BsSE10TkEwNTJScm1ZOWt1a1VIdWppeVJydE9sODhWUTU3SlBMQXAy?=
 =?utf-8?B?VUJpa0VOVnpqY1ZqVjlTL2t1MFEzWXMzR2d1M2ZuMGllUU5CaHNFYjRjNiti?=
 =?utf-8?B?aHZLTTJyM3kyY0VhOG9MQWc4cjk5eWxSTk1rcG96cVN3VE0yK1g5ZVlrdFNE?=
 =?utf-8?B?M2ZKYmtnZDJXSXgrbS8zVzh4YTd1ZFMxelpyMVJEd0pHcW1mVGM5TmJHMXVp?=
 =?utf-8?B?VXJ4N2FvSjFTMEdzRE5DbmlCc0dJZXIrR3ppL3FyNGN1bVBrdzNMODhnZnNx?=
 =?utf-8?B?eEdvSUdvYjF1TzVjL3o1amdwcFozV1pQbnJLUytpcWRwSHZ3SXR6UG5KMVpI?=
 =?utf-8?B?WEMza3ViWXFicGZCcWdQMlVWUURkaHg5b0d3b2d4MW1JZ1FlL3FWdmJmZDZ3?=
 =?utf-8?B?WkFaQmVuVjN0U3QveEVjczF2Z29ZcHZ2Ykx3ZXp2Mk82UnF3MUNUK1FZcHBz?=
 =?utf-8?B?ZEdxQkxCY1lOUVhHU2VtcEVwc203cjJWWldabzMydmc4QzlJbWJNbE5BdFZy?=
 =?utf-8?B?VzNUeUQveE9JYjBxelRvQmFocWxsR2Z3bFBMc24zdVVyL2F5ZzdnRktvK3ZP?=
 =?utf-8?B?OTJ5WVJwN2dhaUNrVDRTdmprVjc3R1U1dkkrY2JCWDVmaUZ4UHFaRXZmRUpn?=
 =?utf-8?B?VXBMUStsT1kwMXIxWExkR0h3QlJkY2NHa2w4bjJ0ZEtGajAyU1F6dHBsaGdj?=
 =?utf-8?B?MllVWXhNRmZ0dWFSTHJZWitqK1hIM2tkTFN6Y0VzT1ZTZXprbXRuN2l6MXBt?=
 =?utf-8?B?NFp1Z0MzRXpaR3NzeVZjdEJueDlGeDd0eFNsSFpRbU9pcmtMak9JZmI1dUht?=
 =?utf-8?B?UkhLSmpVR2I0KzRuamp6LzdoREVhVUZ4cFVWNXBDOWtjZTROeFN3Uis0OUhp?=
 =?utf-8?B?TGpjZDNLbUxHelpFc3R5Qm1OQ1BKWWphM09mM1JEaDlGQjJFMElhTlJpaFJx?=
 =?utf-8?B?NG9SQzd0WEROdm9jajdqeVVnS0pucFF6Q1J1S09pM0lpdHlLWHBaSXc4MWNH?=
 =?utf-8?B?SWhBOCtpMHVBS3dsMytyZEgwVTVKNUhzbjUvOEJCeXlUM25MZmhxczdHZ1Iy?=
 =?utf-8?B?Y0pDcUNLUFNES3ZpTk4vY2ZjZVlHa0JOQlZSZ0dUbm0vcXEzNExKekZJQ0ZQ?=
 =?utf-8?B?ZTAvQmZnK2Z2S0Jsd3Q2NWl0YjMzck8wTXBJR3pSZksyOU04ejViV3JVREZr?=
 =?utf-8?B?c3QrUjBzQVdrVWhNS2VXUmRDQUt3ZnRBL3daQ2VYdjNwa3EzVjRiQUFGOGhT?=
 =?utf-8?B?dVVScVNSVC9RREpKMWhHVXBwWXdSQ2VMdmFON2M4MEJYSTV6bWIzbXA3N3J6?=
 =?utf-8?B?bDBRVUlpQytqQVdDd0hCYzhNeWw1Y3gxMmI4SzJkcFpNdlNHSU9oYWZ1UHN5?=
 =?utf-8?B?VVRVWFdiZmpLd3MrZndjVXFkL0I3NTVsM3F3dTR5dmRnR1E0TVBtODFmVUtk?=
 =?utf-8?B?ckhBNTJwZ3ZXRjZ5QVV6bkt2bnorNEVjaEtlL2s3eWZzUVlka2MrVGNWOGVJ?=
 =?utf-8?B?NDB2SkVDN2JlbmlvOWhiSGtlL3k0VldPZC9PeWhWeE1Ob1dteTRqbXgzeExs?=
 =?utf-8?B?NHR0NU5FQVFsc0FMOVBZQW9zWDZxT1J2NFVQbVZtajRWc1pxQmxCQ2NUSEto?=
 =?utf-8?B?cWVNbW5XVXJvY1QyT2lsd3ROcFhuazR2WEtoUm1taUtENlBiSm5sd1V3cjJB?=
 =?utf-8?B?SFNnaVJqVDZNT25mMlg4MHV6ZjYydVhFemJsR052MlV2RzV4NTNVZ1BXekpR?=
 =?utf-8?B?SThuWDJXbzhYc09CRzZqNmNUK0tRZFJMUC9NbHF2WjRNcWtHVG83WEoweGhl?=
 =?utf-8?B?b1hsOFprWUNSWVI1eEdIdWVtdTNjRVJISUNhV0w3S0JrSDFUbkQ0V1c3QVZX?=
 =?utf-8?B?bmpudUlSUVY2MTdkOHRkenFoS1hsdVJXdUVud1MvZXp2Y0FMY3RHSVJBdUor?=
 =?utf-8?B?RXdUTTNBbXRnTUwzelBLL2FWOE1RU2FEOS9jV0dpQXVWUzlEdXVqWExzK0Fm?=
 =?utf-8?B?OTJjUkZuR0hwUnlZMmt1Q0x5WjJ6aE9MZUVPb2RaNTJxaW9ia1lUM0lCK0lH?=
 =?utf-8?B?UDl5MWRNdmFuekZPeVl3anRVaEhoYzVTVE14akdUMGFRQWlWa0NCVktBMHgy?=
 =?utf-8?B?eHYyNlRIYVNJajc1ODRBbkNIQS9NeDhPWXZQV3NsbVBVYnRXeEpySmtQWjVm?=
 =?utf-8?B?dGV0c1pqbWxhblZPZ2xQSGdLUlFNZjJOcDF0Q2JETXA0ZERCOXh3MUh5SDd2?=
 =?utf-8?B?R1VMQXRtQlY3RkFvZ25CR2JqdGRXQzg2UlNiRzRLN3BYSjJJTlRIQlR4bzFQ?=
 =?utf-8?B?R3NlbzBGUk9ZWkpTYWp6elJJNndKc1duUFFtNW1TMlA0UGhraWNvSlZhM0dV?=
 =?utf-8?Q?m4Uo5ZUwPodXd/0oQ9F0qw+MGq3VvpYaFv+9sQkT7gGtF?=
X-MS-Exchange-AntiSpam-MessageData-1: +J8fEwIZ4PP2jkCx10gk9DzMYkP9pW3FvwQ=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d21bdca4-b0aa-4b80-669c-08de7d07e2e4
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2026 11:43:15.9924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LiCnO+kOA5S3loEfF6X4OJ+jqh8BPpa1sxZg0TSZiMY6hfQhOXdYAzDBjAhBhALLS1nmjHAU8M4FUbgCkA3qag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB12426
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_044325_898680_0E51794E 
X-CRM114-Status: GOOD (  15.96  )
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

VGhlIGR3X2hkbWktcm9ja2NoaXAgZHJpdmVyIHZhbGlkYXRlcyBwaXhlbCBjbG9jayByYXRlcyBh
Z2FpbnN0IHRoZQpIRE1JIFBIWSdzIGludGVybmFsIGNsb2NrIHByb3ZpZGVyIG9uIGNlcnRhaW4g
U29DcyBsaWtlIFJLMzMyOC4KVGhpcyBpcyBjdXJyZW50bHkgYWNoaWV2ZWQgYnkgZGVyZWZlcmVu
Y2luZyBoZG1pLT5waHktPmRldi5vZl9ub2RlCnRvIG9idGFpbiB0aGUgcHJvdmlkZXIgbm9kZSwg
d2hpY2ggdmlvbGF0ZXMgdGhlIEdlbmVyaWMgUEhZIEFQSSdzCmVuY2Fwc3VsYXRpb24gKHRoZSBn
b2FsIGlzIGZvciBzdHJ1Y3QgcGh5IHRvIGJlIGFuIG9wYXF1ZSBwb2ludGVyKS4KClJlZmFjdG9y
IGR3X2hkbWlfcm9ja2NoaXBfYmluZCgpIHRvIHBlcmZvcm0gYSBtYW51YWwgcGhhbmRsZSBsb29r
dXAKb24gdGhlICJoZG1pIiBQSFkgaW5kZXggd2l0aGluIHRoZSBjb250cm9sbGVyJ3MgRFQgbm9k
ZS4gVGhpcyBwcm92aWRlcwphIHBhcmFsbGVsIHBhdGggdG8gdGhlIGNsb2NrIHByb3ZpZGVyJ3Mg
T0Ygbm9kZSB3aXRob3V0IHJlbHlpbmcgb24gdGhlCmludGVybmFsIHN0cnVjdHVyZSBvZiB0aGUg
c3RydWN0IHBoeSBoYW5kbGUuCgpTaWduZWQtb2ZmLWJ5OiBWbGFkaW1pciBPbHRlYW4gPHZsYWRp
bWlyLm9sdGVhbkBueHAuY29tPgotLS0KQ2M6IFNhbmR5IEh1YW5nIDxoamNAcm9jay1jaGlwcy5j
b20+CkNjOiAiSGVpa28gU3TDvGJuZXIiIDxoZWlrb0BzbnRlY2guZGU+CkNjOiBBbmR5IFlhbiA8
YW5keS55YW5Acm9jay1jaGlwcy5jb20+CkNjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5s
YW5raG9yc3RAbGludXguaW50ZWwuY29tPgpDYzogTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJu
ZWwub3JnPgpDYzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+CkNjOiBE
YXZpZCBBaXJsaWUgPGFpcmxpZWRAZ21haWwuY29tPgpDYzogU2ltb25hIFZldHRlciA8c2ltb25h
QGZmd2xsLmNoPgoKdjEtPnYyOiBub25lCi0tLQogZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2R3
X2hkbWktcm9ja2NoaXAuYyB8IDI1ICsrKysrKysrKysrKy0tLS0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDE1IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9yb2NrY2hpcC9kd19oZG1pLXJvY2tjaGlwLmMgYi9kcml2ZXJzL2dwdS9kcm0v
cm9ja2NoaXAvZHdfaGRtaS1yb2NrY2hpcC5jCmluZGV4IDBkYzFlYjVkMmFlMy4uN2FiYjQyZTQ4
NmMwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvZHdfaGRtaS1yb2NrY2hp
cC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9kd19oZG1pLXJvY2tjaGlwLmMKQEAg
LTUzNywyMSArNTM3LDIyIEBAIHN0YXRpYyBpbnQgZHdfaGRtaV9yb2NrY2hpcF9iaW5kKHN0cnVj
dCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLAogCQkJCSB2b2lkICpkYXRhKQog
ewogCXN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYgPSB0b19wbGF0Zm9ybV9kZXZpY2UoZGV2
KTsKKwlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wID0gZGV2X29mX25vZGUoZGV2KTsKIAlzdHJ1Y3Qg
ZHdfaGRtaV9wbGF0X2RhdGEgKnBsYXRfZGF0YTsKIAljb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lk
ICptYXRjaDsKIAlzdHJ1Y3QgZHJtX2RldmljZSAqZHJtID0gZGF0YTsKIAlzdHJ1Y3QgZHJtX2Vu
Y29kZXIgKmVuY29kZXI7CiAJc3RydWN0IHJvY2tjaGlwX2hkbWkgKmhkbWk7Ci0JaW50IHJldDsK
KwlpbnQgcmV0LCBpbmRleDsKIAotCWlmICghcGRldi0+ZGV2Lm9mX25vZGUpCisJaWYgKCFucCkK
IAkJcmV0dXJuIC1FTk9ERVY7CiAKIAloZG1pID0gZGV2bV9remFsbG9jKCZwZGV2LT5kZXYsIHNp
emVvZigqaGRtaSksIEdGUF9LRVJORUwpOwogCWlmICghaGRtaSkKIAkJcmV0dXJuIC1FTk9NRU07
CiAKLQltYXRjaCA9IG9mX21hdGNoX25vZGUoZHdfaGRtaV9yb2NrY2hpcF9kdF9pZHMsIHBkZXYt
PmRldi5vZl9ub2RlKTsKKwltYXRjaCA9IG9mX21hdGNoX25vZGUoZHdfaGRtaV9yb2NrY2hpcF9k
dF9pZHMsIG5wKTsKIAlwbGF0X2RhdGEgPSBkZXZtX2ttZW1kdXAoJnBkZXYtPmRldiwgbWF0Y2gt
PmRhdGEsCiAJCQkJCSAgICAgc2l6ZW9mKCpwbGF0X2RhdGEpLCBHRlBfS0VSTkVMKTsKIAlpZiAo
IXBsYXRfZGF0YSkKQEAgLTU2NCw5ICs1NjUsOSBAQCBzdGF0aWMgaW50IGR3X2hkbWlfcm9ja2No
aXBfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3RlciwKIAlwbGF0
X2RhdGEtPnByaXZfZGF0YSA9IGhkbWk7CiAJZW5jb2RlciA9ICZoZG1pLT5lbmNvZGVyLmVuY29k
ZXI7CiAKLQllbmNvZGVyLT5wb3NzaWJsZV9jcnRjcyA9IGRybV9vZl9maW5kX3Bvc3NpYmxlX2Ny
dGNzKGRybSwgZGV2LT5vZl9ub2RlKTsKKwllbmNvZGVyLT5wb3NzaWJsZV9jcnRjcyA9IGRybV9v
Zl9maW5kX3Bvc3NpYmxlX2NydGNzKGRybSwgbnApOwogCXJvY2tjaGlwX2RybV9lbmNvZGVyX3Nl
dF9jcnRjX2VuZHBvaW50X2lkKCZoZG1pLT5lbmNvZGVyLAotCQkJCQkJICBkZXYtPm9mX25vZGUs
IDAsIDApOworCQkJCQkJICBucCwgMCwgMCk7CiAKIAkvKgogCSAqIElmIHdlIGZhaWxlZCB0byBm
aW5kIHRoZSBDUlRDKHMpIHdoaWNoIHRoaXMgZW5jb2RlciBpcwpAQCAtNTg4LDEzICs1ODksMTcg
QEAgc3RhdGljIGludCBkd19oZG1pX3JvY2tjaGlwX2JpbmQoc3RydWN0IGRldmljZSAqZGV2LCBz
dHJ1Y3QgZGV2aWNlICptYXN0ZXIsCiAJCXJldHVybiBkZXZfZXJyX3Byb2JlKGhkbWktPmRldiwg
cmV0LCAiZmFpbGVkIHRvIGdldCBwaHlcbiIpOwogCX0KIAotCWlmIChoZG1pLT5waHkpIHsKKwlp
bmRleCA9IG9mX3Byb3BlcnR5X21hdGNoX3N0cmluZyhucCwgInBoeS1uYW1lcyIsICJoZG1pIik7
CisJaWYgKGluZGV4ID49IDApIHsKIAkJc3RydWN0IG9mX3BoYW5kbGVfYXJncyBjbGtzcGVjOwog
Ci0JCWNsa3NwZWMubnAgPSBoZG1pLT5waHktPmRldi5vZl9ub2RlOwotCQloZG1pLT5oZG1pcGh5
X2NsayA9IG9mX2Nsa19nZXRfZnJvbV9wcm92aWRlcigmY2xrc3BlYyk7Ci0JCWlmIChJU19FUlIo
aGRtaS0+aGRtaXBoeV9jbGspKQotCQkJaGRtaS0+aGRtaXBoeV9jbGsgPSBOVUxMOworCQlpZiAo
IW9mX3BhcnNlX3BoYW5kbGVfd2l0aF9hcmdzKG5wLCAicGh5cyIsICIjcGh5LWNlbGxzIiwgaW5k
ZXgsCisJCQkJCQkmY2xrc3BlYykpIHsKKwkJCWhkbWktPmhkbWlwaHlfY2xrID0gb2ZfY2xrX2dl
dF9mcm9tX3Byb3ZpZGVyKCZjbGtzcGVjKTsKKwkJCW9mX25vZGVfcHV0KGNsa3NwZWMubnApOwor
CQkJaWYgKElTX0VSUihoZG1pLT5oZG1pcGh5X2NsaykpCisJCQkJaGRtaS0+aGRtaXBoeV9jbGsg
PSBOVUxMOworCQl9CiAJfQogCiAJaWYgKGhkbWktPmNoaXBfZGF0YSA9PSAmcmszNTY4X2NoaXBf
ZGF0YSkgewotLSAKMi40My4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
