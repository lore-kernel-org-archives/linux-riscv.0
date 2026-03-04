Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A304EEFCE3A
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 18:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OlSF++QDUQqSV0PSyWfF8DgfXMkkWX9lRH2s1F4Zjak=; b=csTXC2UT+Dgewf
	7boH6uXeAL90170vuwpzk0YqYy9RtNJzTQKjjDHENYkxAqcEZZM0YR2C+V6Gn8PoOIYMpFYRPvqwZ
	SQRHvvuNIL6VsTetNoCCf+D5Id6kPOPyIE7cBwXW+Gac6MB2kgVraKzTAOzlPKHTwR8vK/MDkG5g1
	qZkXVaitaqgoXVRHvvQ6LSlj4RkAHrTD0TNaLe78mjPC92Igb00RJ1PeZ571Ke53wwOcy9rAMKA34
	hTBH33M1tCG0D9S5+tA70fT/K5jAG/Wn+NqirEYgkEXwXCoFLo4oZg/FsBS4HRdTxw+2mN7YQc69X
	fyK9gAX2V26yniCmXBVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqWa-00000000Edd-34wJ;
	Wed, 04 Mar 2026 18:00:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqWJ-00000000EA8-2voy;
	Wed, 04 Mar 2026 18:00:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Si4PwJsdNvR/xDnH8AppSR4Su+J7AJ9Tap4qjYd4Rdc=; b=Z0uMEc6Pfon4BKOVsDcKSx6Xkv
	M0+USWig62qU4WOkGioIR9p5m1v0eaiTdrz7g+wVO+GbUsWs1dq4ci7IVr8R8nn24gh/vYjczm1Rm
	w1v1qQ8hH9H6LxbkcUOFN/d1twtr8UtP65OBcMqM8EHKmvBTNN/G/KBVXHzkhL86UzRHLGqx7v/qb
	hxiV2s8Op8dkuZ+0GDzSppoxXNF/wKFqMmkjH/Urt/kj/So8uIQPFLwSpcd0L5MsO2tD2mLTgmKrC
	XlwgRYxVJQq7HKiU9/jpB20WmG1DHO3JdodNZxJkeQMMDlSOYU3P3K1Z8pdlIkv4G5mArUJrRr0eA
	TJEynNRw==;
Received: from mail-northeuropeazon11011005.outbound.protection.outlook.com ([52.101.65.5] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqWG-00000005H8M-36Km;
	Wed, 04 Mar 2026 18:00:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yy2jTesp6PSv95Y6JsIDVtgN9uYw/peQMlyDyeOKNyHt7hDeaiX9tsS4MDN0ISXfdNeu8uLbUeMqiszbouKoUDDQXFsPf0gVXtnoeliNgafn0mYD8xnZZrtQG/MG2de1TYsQ1VkVpm+5IxYPAsCqBUbmziJO5MV2YbWR58fHdsfE9IOS1LEcE5cNnwMvVs3qV3aFmfWrOAkHRfsjEJp7BUAXOcs7/69bDywQxK4xVvzKlnKUrx60ifYFoqqDzRNAipzLQ49KGPJnmMWkEDVRdO1Vd8IpEEV+1NAit8gqWAqVfZ5pCuHS6ltkVq6uxTGnmrTOK01b6M9xF0KuQMxFyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Si4PwJsdNvR/xDnH8AppSR4Su+J7AJ9Tap4qjYd4Rdc=;
 b=Xwel8RC2bLqHXSurrW5obQ3qgio60TVTLbDpDq4LZ8J65u/3G/DnzLip26pEvw+lHJ9Da6Z0lkX2xc4Q9EQeJNtLP3/HLEuWOwGOpuPhuo5iDyMjk3xjpySPH/ou1fmArxhFyZW6NUrH3yLDtejiLzKwDgwYiivIHesukcHKhxQTuyfa0UkTFi4fYnRTDgxCYQexMiQi09SPXG4O3j1vl1GogAOR8SkxmY1jfEqCCGgD0Bjx14UI3SdMB4r/i+Zq5vsDXOwC7RufEKKXdFSuXCfbya9gOdA5E2upaMWwfU9kgJZHpNOYMo9nT6W3mNfv76DNmbUslf99lrQwhc0wiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Si4PwJsdNvR/xDnH8AppSR4Su+J7AJ9Tap4qjYd4Rdc=;
 b=WE6XrZlZ8aErgvQVZL3QEfU+LoXxdM3bxpMhs/MGl5wZOMHq3ZXf8eIRhfd7zI11HBdwOFMECk2wfAP/0P9/MLiVnCKY19P7UZR69fycd5soIVqOmGxEOGUd7oNuJukDKmFp/IkDuMc2fscSZqOPZqTnfhfr/ga5I+NcwYvf1kwfAU0K7kAuTDxjMOyUxNV4uyBFhSSco3C/hPEzjXi1zfxEKxxdUPTbVFTWF5BspXEFjX2hcaR0jga91JGMMWucm6bHCQDhWHUnISwsyfTggWKpkgDYGhnoliT/gg+qjBgZxzvBTpR6JP8M556boj1NUsl3TsSrTKkBeWpQWqQrew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by GV1PR04MB10275.eurprd04.prod.outlook.com (2603:10a6:150:1ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Wed, 4 Mar
 2026 18:00:15 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 18:00:15 +0000
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
Subject: [PATCH phy-next 10/22] drm/rockchip: dw_hdmi: avoid direct dereference of phy->dev.of_node
Date: Wed,  4 Mar 2026 19:57:23 +0200
Message-ID: <20260304175735.2660419-11-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
X-ClientProxiedBy: VI1P195CA0030.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::19) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|GV1PR04MB10275:EE_
X-MS-Office365-Filtering-Correlation-Id: 82b62702-7eec-4399-3b93-08de7a17e323
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|376014|10070799003|19092799006|1800799024|366016;
X-Microsoft-Antispam-Message-Info: w52iYoCk83n6bjzz3cpe+P+RxiNXu8shHys9wIT6SG5LRErb+gq5fUuE01sGaqLk0MItRE+dDogoJz8ulu1HpQ5RlEKM7FemNVvTHXXGEwtl9vbx6CFTNhGsxKVOqYwYrgrJ4WOecnikgclluwiaAkwE8avOyiGE0cB0cWQT6+sQ1aB1E2wfciBUkzWvZhSuWNwV9J61WO+RV2x+Lbttk29GkPR9mntUQwuH39vbqUQiHrZLDOwheNKP8qQwQxrA1XlLPSFIyrO3/Go5bPiWCQU6AB5nSrRculm2yA67936mHofbJjezyYvqrNh62G0dUHWXuHuyExEWdH1VbJrGhkM+tMMh0e/uGlmu2Tva5/FzTO3yJHl0JQo//vswDgy3zpJy0LKJhcXr8pCzZ3KZl5I3t8lWm3upie0bdiEZFg6MDgZ2+8nYstkE13nsCH9RJUdRIkp01lzi1aAmb+LfSZH5AfUrxGBZiT/HBSrR/DM0cpVM+u5foZetPT9FKslKFcD674MxH1qVu05yXjgfmw6e9TEiIhn1PYuOXYhVjvXVf48TGm4BPqATkm4nQSuveNJN4/+d/JR5NKzIu3yUWEaiE6Apm2EoK97iMszWZnBo+LbZH7xmIFOuN7wVJUzjyd7+T5o3FFCgzty4vuA28lqKXF5O0TMha9E/ekknwS7RyBG0kolSmerJUBbvFRWwR+pxSP7IcdfxSrI17KLMGefYCZTrC4G9nARbttxTCRc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8585.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(10070799003)(19092799006)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVIrdmQzeTFwUVVJalNjcXhDTW9Pd1FnZmxncWFkVWI4d2x0N2lWZ2V3RDJP?=
 =?utf-8?B?YmtiUkU2NzJlYTRnYkxGSVlOWE1sTENlQWtxbU5PRGdtU29RaFFBbjc0UnpK?=
 =?utf-8?B?L3JRa0lnUHJITFF5VTdJdFJzeWZFYWs1UnB4R28yOXU0TWpKblNISFRkSTdY?=
 =?utf-8?B?a1dhWUpEZ0FET01TNHYwcjd4bUFjd20xOEUwNWg5RUN0Z24rOGVNNFM0SzhN?=
 =?utf-8?B?VnRvTitiUHU2WFJqSitnemxTK2xWSkt6VElFcllLcWpGbnBqamVnQnQ3Tjdr?=
 =?utf-8?B?Q1djWXZVdmpCYURmUmQrY2gyVllBdEM0L0JCcW9JSGdXMjBSaFdPM3Jad0c2?=
 =?utf-8?B?NHB2ZVc3dkttN3VoaHpEZlhwWEw4QTRncmJUajRGakhKZ1hCa2xxVWwwL2xD?=
 =?utf-8?B?MnppOXZRZnhCM3dYbEJ5UmlrS1owZ0x6UDdSM0xPYnM5ZE1KWTZ1QmlEVXhj?=
 =?utf-8?B?M3VOalN1RzkwZTg0cE8rWXVFS3pXVHY4SVdIZW0wV2JQMXl3NStFQjZtYWIx?=
 =?utf-8?B?ZVBwS0lPcG9ycjM4Y2ZuQTkxaHVmZ0N0RGowT0ZOTzQ0SG1nY0FONk1aTk1O?=
 =?utf-8?B?azl4MHVQWkJPVXhSM0pVV2sraExpSDVkTWNQSHB1Q3pFeWNvaFRLeWswZUZN?=
 =?utf-8?B?VUFnZnNhN0ZtNlQxM2dsUFFkODJmenl1TjBBNjl0OVJ2RVZYWGc5VE5MVGVi?=
 =?utf-8?B?UWFRTVdkZkJzUVdXajhmZmszSmtXSkJIMjUwRjZYOFRaeFc3QW1FQlNUZjRK?=
 =?utf-8?B?Z1FPajFtd2pmbklDdDMxcnBFREFleEVHVloyTUE1UVRHQm44U1VkMENqbTNl?=
 =?utf-8?B?a01BeW4wRENoMTBDU3VoSDRoVXVvTUFYQ2hVRHUwaXdENzhFL2dwQ0NuajZX?=
 =?utf-8?B?U05RWlE1YzFDMzJOblo4dlNXbVhYUkEweUh0cWF3NUg2M29jZUwyaDlRa3Vt?=
 =?utf-8?B?TWlIVDB1UDZWdDFSbUFod1lWVXVRcFI5NXBDRzVPSUUyeDgwdXlQUXpoR1Bp?=
 =?utf-8?B?VDdCTndEZUE0ZW43dU4zR0hDUVBCTjhYcUp2YmNNRFY5a0dlUW5JYXNiWjB0?=
 =?utf-8?B?MU91UmxkNGMvM3V1QkhjNkxqNk1raW1wRDVlZVJkSEhKZklUdm93Q1NuOVo4?=
 =?utf-8?B?cFBlVllmdGVRWkZkZU5vOWVjWEhLRE8yMWhvL3VoaVhyTUErUmJ4MjRwT3lU?=
 =?utf-8?B?RnV6VEg4VnEzckRvWHFCUG4zTGw3Z29saURRRDBUUEpKUndvU0ZmTlR3d2dp?=
 =?utf-8?B?M0F1MTUrelM3QVBkQkhrbXVrMG03SXpucUUyTzFWQ21HbFc1KzN4aHFWS05s?=
 =?utf-8?B?ZEx1NEZ0ZTR1RGdqV0t1VXo3WjIzK0RkVnBEV0FML2prZnoySGtmNk5hTmx3?=
 =?utf-8?B?YW5TMHpCVVpYQ0ZVL1k0YmI5TDlMb3I5Zk14LzQvME1ib0ZWK1FUdEhhMjZT?=
 =?utf-8?B?ZDRvQllkOHdLaTNBQWg5MnVkbWdoa3Z6MzY2a2doR1Foc1Rjajg0SmFuNEFq?=
 =?utf-8?B?WGh2VGh6SjV5TTN1d0dpT1AzN2l4TVN3Vmw3QlQxNGowWENuSHNsamsva1ZI?=
 =?utf-8?B?UXBoeFpGbzFGY2xNcExiNkQ1cGJ1M3ZTSlpSVTI4K0tubCtidXR5V3E3UGc3?=
 =?utf-8?B?bElsc0xLb2JEWVhhMXZ1aEl3VTcvNnpzUWRzdW5LK0JrZXczNjBXQzU1YVRU?=
 =?utf-8?B?c09KNnYxakIwWHNUcjg5dnRMMkhpdy9zTTZoYnE3dVB5S2pFSzFHNi81REl3?=
 =?utf-8?B?MHBFZzZzbG9USGcybVhkTXVLWm9UQlB2dFVJMlJGT2RhVXR1cjc4ZSs1cmFG?=
 =?utf-8?B?SDVob2lBVEJhbWh0aTBieEhYaU5aWExaTFg0VW1CQmZRTEc1NnRwR2cvVnpK?=
 =?utf-8?B?eVQyeUN5R3JEVjg4OHdGdVZTQVVrOTM1Mm5zclNoWUZlL0Y3aUg1bHkwQ1Fk?=
 =?utf-8?B?NmNzT3lQS0lPVFJZN2g4emdER3A0S2JGcGVZWjA3VWZGa2RZcjZMUUhOenNr?=
 =?utf-8?B?OTQrZitVbUY2MjV5ZWhpVCtBaG1OaFpiT2h4bHpOMTVqQkEvSmFhNHpxbTBG?=
 =?utf-8?B?UEFvZHNmRVlUUWVLTy9LcjQyeTRkd0VHdXoxMFh0MGtRUTBQUmNiSFV6MUlq?=
 =?utf-8?B?aE00S0RXcVV3MDNhYjVIL0NtSWdkbnBwc1NUZWJQaHZCK1dUeGZqbUJFQ0Jq?=
 =?utf-8?B?Z3VjQ1ViWGVWbFdnKzhrdG5Kd1ozSW9zelZ4Y1VKa1ZrdFBYUmlVZ1BxR2ox?=
 =?utf-8?B?M3lUUU5UOWdGVkVnQnBwUTdDc0xtRFUvcTAxM0VoUnNTMzhWYXppcWRQQjBa?=
 =?utf-8?B?ZlpYWU9DQ3lJTllPbkFadE9vZDRYQW9ocW9sSEF6OEtZN0hwSzZieXd0WG1M?=
 =?utf-8?Q?vtFMejc2pXr0q+lv3wFY7+N4O2SuE054vK9sxBehAd8cV?=
X-MS-Exchange-AntiSpam-MessageData-1: pIiQWIJaZ7O3K8bHXQqYrdVbaDoq6vLAo7o=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82b62702-7eec-4399-3b93-08de7a17e323
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 18:00:15.4871
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Fz01k1OvEd5QS/3cAm1420N8xO+MI054H4/E5TgZsJOX3yv/5aGCqNBJGMsADgzOXK4gzmcCIC/LdD+7VPZ4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10275
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_180024_857353_29883C64 
X-CRM114-Status: GOOD (  16.55  )
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
QGZmd2xsLmNoPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9kd19oZG1pLXJvY2tjaGlw
LmMgfCAyNSArKysrKysrKysrKystLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRp
b25zKCspLCAxMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcm9j
a2NoaXAvZHdfaGRtaS1yb2NrY2hpcC5jIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2R3X2hk
bWktcm9ja2NoaXAuYwppbmRleCAwZGMxZWI1ZDJhZTMuLjdhYmI0MmU0ODZjMCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2R3X2hkbWktcm9ja2NoaXAuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vcm9ja2NoaXAvZHdfaGRtaS1yb2NrY2hpcC5jCkBAIC01MzcsMjEgKzUzNywy
MiBAQCBzdGF0aWMgaW50IGR3X2hkbWlfcm9ja2NoaXBfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYs
IHN0cnVjdCBkZXZpY2UgKm1hc3RlciwKIAkJCQkgdm9pZCAqZGF0YSkKIHsKIAlzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2ID0gdG9fcGxhdGZvcm1fZGV2aWNlKGRldik7CisJc3RydWN0IGRl
dmljZV9ub2RlICpucCA9IGRldl9vZl9ub2RlKGRldik7CiAJc3RydWN0IGR3X2hkbWlfcGxhdF9k
YXRhICpwbGF0X2RhdGE7CiAJY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCAqbWF0Y2g7CiAJc3Ry
dWN0IGRybV9kZXZpY2UgKmRybSA9IGRhdGE7CiAJc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVy
OwogCXN0cnVjdCByb2NrY2hpcF9oZG1pICpoZG1pOwotCWludCByZXQ7CisJaW50IHJldCwgaW5k
ZXg7CiAKLQlpZiAoIXBkZXYtPmRldi5vZl9ub2RlKQorCWlmICghbnApCiAJCXJldHVybiAtRU5P
REVWOwogCiAJaGRtaSA9IGRldm1fa3phbGxvYygmcGRldi0+ZGV2LCBzaXplb2YoKmhkbWkpLCBH
RlBfS0VSTkVMKTsKIAlpZiAoIWhkbWkpCiAJCXJldHVybiAtRU5PTUVNOwogCi0JbWF0Y2ggPSBv
Zl9tYXRjaF9ub2RlKGR3X2hkbWlfcm9ja2NoaXBfZHRfaWRzLCBwZGV2LT5kZXYub2Zfbm9kZSk7
CisJbWF0Y2ggPSBvZl9tYXRjaF9ub2RlKGR3X2hkbWlfcm9ja2NoaXBfZHRfaWRzLCBucCk7CiAJ
cGxhdF9kYXRhID0gZGV2bV9rbWVtZHVwKCZwZGV2LT5kZXYsIG1hdGNoLT5kYXRhLAogCQkJCQkg
ICAgIHNpemVvZigqcGxhdF9kYXRhKSwgR0ZQX0tFUk5FTCk7CiAJaWYgKCFwbGF0X2RhdGEpCkBA
IC01NjQsOSArNTY1LDkgQEAgc3RhdGljIGludCBkd19oZG1pX3JvY2tjaGlwX2JpbmQoc3RydWN0
IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlICptYXN0ZXIsCiAJcGxhdF9kYXRhLT5wcml2X2Rh
dGEgPSBoZG1pOwogCWVuY29kZXIgPSAmaGRtaS0+ZW5jb2Rlci5lbmNvZGVyOwogCi0JZW5jb2Rl
ci0+cG9zc2libGVfY3J0Y3MgPSBkcm1fb2ZfZmluZF9wb3NzaWJsZV9jcnRjcyhkcm0sIGRldi0+
b2Zfbm9kZSk7CisJZW5jb2Rlci0+cG9zc2libGVfY3J0Y3MgPSBkcm1fb2ZfZmluZF9wb3NzaWJs
ZV9jcnRjcyhkcm0sIG5wKTsKIAlyb2NrY2hpcF9kcm1fZW5jb2Rlcl9zZXRfY3J0Y19lbmRwb2lu
dF9pZCgmaGRtaS0+ZW5jb2RlciwKLQkJCQkJCSAgZGV2LT5vZl9ub2RlLCAwLCAwKTsKKwkJCQkJ
CSAgbnAsIDAsIDApOwogCiAJLyoKIAkgKiBJZiB3ZSBmYWlsZWQgdG8gZmluZCB0aGUgQ1JUQyhz
KSB3aGljaCB0aGlzIGVuY29kZXIgaXMKQEAgLTU4OCwxMyArNTg5LDE3IEBAIHN0YXRpYyBpbnQg
ZHdfaGRtaV9yb2NrY2hpcF9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAq
bWFzdGVyLAogCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShoZG1pLT5kZXYsIHJldCwgImZhaWxlZCB0
byBnZXQgcGh5XG4iKTsKIAl9CiAKLQlpZiAoaGRtaS0+cGh5KSB7CisJaW5kZXggPSBvZl9wcm9w
ZXJ0eV9tYXRjaF9zdHJpbmcobnAsICJwaHktbmFtZXMiLCAiaGRtaSIpOworCWlmIChpbmRleCA+
PSAwKSB7CiAJCXN0cnVjdCBvZl9waGFuZGxlX2FyZ3MgY2xrc3BlYzsKIAotCQljbGtzcGVjLm5w
ID0gaGRtaS0+cGh5LT5kZXYub2Zfbm9kZTsKLQkJaGRtaS0+aGRtaXBoeV9jbGsgPSBvZl9jbGtf
Z2V0X2Zyb21fcHJvdmlkZXIoJmNsa3NwZWMpOwotCQlpZiAoSVNfRVJSKGhkbWktPmhkbWlwaHlf
Y2xrKSkKLQkJCWhkbWktPmhkbWlwaHlfY2xrID0gTlVMTDsKKwkJaWYgKCFvZl9wYXJzZV9waGFu
ZGxlX3dpdGhfYXJncyhucCwgInBoeXMiLCAiI3BoeS1jZWxscyIsIGluZGV4LAorCQkJCQkJJmNs
a3NwZWMpKSB7CisJCQloZG1pLT5oZG1pcGh5X2NsayA9IG9mX2Nsa19nZXRfZnJvbV9wcm92aWRl
cigmY2xrc3BlYyk7CisJCQlvZl9ub2RlX3B1dChjbGtzcGVjLm5wKTsKKwkJCWlmIChJU19FUlIo
aGRtaS0+aGRtaXBoeV9jbGspKQorCQkJCWhkbWktPmhkbWlwaHlfY2xrID0gTlVMTDsKKwkJfQog
CX0KIAogCWlmIChoZG1pLT5jaGlwX2RhdGEgPT0gJnJrMzU2OF9jaGlwX2RhdGEpIHsKLS0gCjIu
NDMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
