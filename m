Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C089C606A326
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 14:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ut+6zG08;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=eNFs+iHV;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=A9xe25my
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EQHSsyin4jarGIVz7SrbXQCqSMSj2NhZtizdb620b4A=; b=Ut+6zG08mK09VkERZMhBIleCVj
	ndtHWuIuJNsLawRtn186LikECwRPJeoejtw94t8yuLOzOIz5ahUR4lxngajtiu2hnVuzjH4BDU25v
	YiizyslNKnKYzE/KGbibg0Jcx/GBIOmGsvRehA4H40rkhBcnp7WYVuWXIz2IJM6u/gbCE+ihuKgJm
	JcChzggfss32QzEpH3OSOrTuJ0VXa3AovdcDRN7NBNixc6ZSOsiKewqaD+rHMWIO3Fw2jnXYj5LiM
	7AbtrROLJ9hpI6AhN/a5NAcRAL7TcXAbuheXTbCeWsD6+lZ4FXOU0oa7ONwZxpYAmwGqfl1HHGINH
	mYwfiV9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsem-0000000Gial-2K4c;
	Mon, 02 Nov 2026 14:05:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsel-0000000Gia6-2O4P
	for linux-riscv@bombadil.infradead.org;
	Mon, 02 Nov 2026 14:05:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=7soUBChG2eorH8MaKZzLxtkNhLd/s6s3Ma6CXM0wbKc=; b=eNFs+iHVQiICzgwEgWyplFpN8w
	IsjwD6EjSkXJTuLNPiARJNTFxS/TQ0DATuekljeKXatrU6f15DG5khvtRMyx4AXqpbuN4YLyhWS0N
	6+0Vpuln/zFAGQ3nqtxbEXWsyflSmdDTMKKyyh++r8BNLBSaW1+SWXrwcpsOG16vwOLw0bntk63J0
	8uXfdX9rehdYHm3IAWo3z+ti+hYDe/1PDvGrSmKCue1lFF7xQKDVFisApqH+LpyqekUVenuI2crGH
	i819qxiu0DeWq8opDGI3Rs3igu2OAIkcmj/zg9EkfnncQ/VJTPMQ2DN44WW5tgyqj7stI1xfWWWKq
	6xCH38JQ==;
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNseY-00000002bNZ-3Urn
	for linux-riscv@lists.infradead.org;
	Mon, 02 Nov 2026 14:04:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xs/GqdikatOdL5bNjixkQDvgaek06qwv18Uzd0wxL+DO2/myv7BGIrcZH6By/Sh1b67URHzz8+CqJQ93fI7/HLN9beuEh+HubNAwdDl1rpbdBI0stGJnulAr+hs6PHuv4j957TWz68Ae7jHEDOCu9vNarM3tVOo0rAksTLrLzukw9mWJHKQk18M/8mpzSSRCJJ8LBcEHjmMUAJN0tazzRbf5bqKUR3a3dPPpLQduaG6h9WzdnBPXumeVHiAPxYZICoAe9XyTWV6tbOXzt9im7u0l5QtBTCvJ0g02fyRBJr1s6ipjcpu+38Uef7RpW/K45PSn9HdgiWTrKQHftNnllQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7soUBChG2eorH8MaKZzLxtkNhLd/s6s3Ma6CXM0wbKc=;
 b=KusS+2nnm013yFGQ7e1AJ/tSFT5686TCZWm8tzd0sxXaSzAaavV0OrqKzz9tkveraEzhO0zaqnSAP8x2RVNPPnSwSwD/KliEQpRYjIyvo4kU/n/+K2XIww7JkmPxkSCihXX0VnDX+CRftEnwm9CLQ3WBi28vzVC/8onWJoaCrJ/BOCxNFlhlCpfcMdNDOE/wZzVPi/55l/t+g+uRA+YolYw9zDRtU28AB6tQ/ERmUP6p+yWfplC8QkAqm2QVub8Nv0hLQ/2rsqjifmOJHOsBE1vfkMixWHzjyyir+jehxcAHNzjZ02t8iR6MDUfhw4CH8Sg3V1tuErK3a3cENI3AEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7soUBChG2eorH8MaKZzLxtkNhLd/s6s3Ma6CXM0wbKc=;
 b=A9xe25myD/SQn/ucOujRuALMWpAk/CccLK0ZF9BRA9Kl/St6FYF8W6CdT/GRbXw5ccfjoPEU1Fneymk6pKKqMCcEIpyyOteq/9MG6/MAkW7SBjEHYxhVYWeJ0/3ZFD2+SM2JlADizs7oXMBFcTU2/5SxQ0OKjbOY33NEZM+Mi4axucsXESmvYAtyZvkIxgPDNpuex7vHGpQty3rGXx6lkP0h4M8RFeOPq/uo0WP5H62HHtE7PFcnyqeZvMbnUSc3UPzNnMrc8BU/FMOFafV9267xzgQ1ZUUDxN2zWwKhyyKG+MIOYvdZ1n3naUKRnp0XorlCQd84IbWjmO1x6PVYOQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13) by AMBPR04MB12565.eurprd04.prod.outlook.com
 (2603:10a6:20b:778::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 14:04:28 +0000
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930]) by PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930%3]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 14:04:28 +0000
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
Subject: [PATCH 8/8] riscv: defconfig: enable OpenHW Group CVA6 APU support
Date: Mon,  2 Nov 2026 15:17:27 +0100
Message-Id: <20261102141727.640769-9-marouene.boubakri@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261102141727.640769-1-marouene.boubakri@oss.nxp.com>
References: <20261102141727.640769-1-marouene.boubakri@oss.nxp.com>
X-ClientProxiedBy: PH7P220CA0066.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32c::21) To PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11203:EE_|AMBPR04MB12565:EE_
X-MS-Office365-Filtering-Correlation-Id: d4973c10-76e3-4178-a816-08df38ea35d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|19092799006|261021121427099003|11063799006|56012099006|261009223027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: Nzd1CCi25HM4mwItIQ93Cq1bs5DPIPNKahJhGq3MFGcQsII51BiFoScpqfSf7xFLJgvQ0A1yufk9xfb7kBALqAOhzl/N0MpICEP9z7s2dH5qZK9SePlTPJVqqSHR3JTDqM4L/h3JhUinRPt0pP1SRNjXbGhjf7qxkz0+18BKH02QdKaBD1rNsiJM/kdQN2jGvFUhpLIOIuWcyWS0npKhg2TRTgMDNTeUlPEnLSnKk39IGz7f7ump57ioLLpwdJ+y3Ni3myhKDMk0RKoyyPX06/QHXXzUcLAxtVi7JcIa7rivqS9mElQis29gPfKmx7ygLiZEyuV/z2Sjo/54ounPrkKmEkn7y5//hm1MU+Dku5W9dVSCsnItVhR7rA8pZCaF7dtVygLbb1lrF1o4ydWvVmwUTP7ernghSKkYL5tZOs0lOve2jClP+Y3Wx1jjcm6KrHXsnsE55H12RXfWGKll22BcfhHHbVMqEqJtdzwetV8gdneri/hpjnDUrimz6QjgfyxgspD7tKUpRExgsQRMkqryfqhzhQ98oABNaqOuAgzMAoV/NPktbkS0J59K265/EC6DPGCwD3thTNoqD8qENtP15HzFil8SIHjHHDRGu0Tybch4trmg+82PhJ8vsYf12+spdLGULfq64iO0GRU2tqyhdHB6iQaGFVmpFqq+KC8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11203.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(19092799006)(261021121427099003)(11063799006)(56012099006)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VbdsoiF6reaDA9ujxqgoL6Wqg3QhBbWUEcJTz5NkxKY4RSpkJ08z+aM6AWDW?=
 =?us-ascii?Q?f1tbQIHqIFBK3tsdU461/NhJUF96WXRsWAIqhi7i4If3Llnlij4kbO4F5Gg4?=
 =?us-ascii?Q?KbeaOWNR0SH0MVpAjpsqo+tMMM4KNwcrL5K4WatiioIg2fcweqF0jHfxn9UQ?=
 =?us-ascii?Q?vSE1eAw+c2hcMuN2xWDVwvr7SHbtf4F3oKlpIZM0Fg4faGTbw8OqDRSZpgNG?=
 =?us-ascii?Q?t2HLdSms1At1PB1E5SQFzCMc+Vrnf0xw0WidHzRVsEcQ7jdQsRRViKguy8dW?=
 =?us-ascii?Q?mgeeDBB1/s/KxqnbLdKHPLYrw5L3N1XDuYweVCCGDlH0XKnbPkptm5sOm8XV?=
 =?us-ascii?Q?9urxl3HDPVmUosW6GjOOMRrac41x8hxLX1KFDTQXGxU4rbc4gwz41JFIb+d6?=
 =?us-ascii?Q?FZWiIobnLDIJEeb7ITx9AKNnLLs/+IO1Od0Tg3aRXax7qsQrJirRjvofrQfy?=
 =?us-ascii?Q?Hc2C11Mwjwq9p1tlY1C50s+g219VkMBUX7snbHvRDplYy9LwKX+j0xUb8Pvk?=
 =?us-ascii?Q?M+1gDXcK1H9zmIAK1Te7ja4IQ4y71BUayENp/BRWvNrb6DOp+ouo+4J+HAzI?=
 =?us-ascii?Q?CrDt1fIzruEWGEBf0D8JtzAVo7AsLtduryHuyhB1wOFWDbzkXnaan1yivhz4?=
 =?us-ascii?Q?t9EUcaCnWQhyFZGmjj+M0d0z9I+iKFRoa68+sK5lCSMnRfEplAYcDJFH9L8w?=
 =?us-ascii?Q?P+TktDQlM/DwIq4RN7bDzdIN1GlZBwgz0IeWkc62PT42/L0MvgmpPoVYK4IG?=
 =?us-ascii?Q?AMEkHeM/Bq4jc1tShOquSiV1hNtwLLF8QnLZbdd4lP64sZiHll5D4mx93Mce?=
 =?us-ascii?Q?8RBchp4BL7re8RJklo20iDPmSJU2qZyp0A07zR3/Qvo9Z2Wlj6TOYUaJ2lXR?=
 =?us-ascii?Q?ugLTSOfXzOh8pNrEFrfVE+hdeDhdRT5ywfwSeQkingnEMIZq6QvHMWWuMDoS?=
 =?us-ascii?Q?/XMe4DdL84cpH9WxSBHgrO9osOE3o2x8/J5duSDpCuTphdZLY4WvouH6lIal?=
 =?us-ascii?Q?dhJRjIfWkgbpGOt0Fa2WmEfvn060aqdUpbvS5PitNdg09RTstbD2c3rtYjti?=
 =?us-ascii?Q?cztGzsqP+J65PJuF09IVzzNiGGQzYaR5oU+vBWvSroFd2Kp12Flfx2l4Ael2?=
 =?us-ascii?Q?vjt7Q+/hyKhLgzm+gtgdDVm7Q2go0NftPV92031Rv/sWOPPUo5gQdIPWYsVZ?=
 =?us-ascii?Q?Kw+WgHsBUEZJs4Oh/WYJS0Ba/pdE9lh3RA8T2levNvMGnbEI4MmcPur6y+Bu?=
 =?us-ascii?Q?CVK5Qj0W+PYfhWvaGf+0ek+l3kMoCUfsxLOSBzpjZK1C7iJ/mDJ+K9cNWfn8?=
 =?us-ascii?Q?DklciGFxB2uPArO4XTXv8lvCxVQQBMDmmwBhSonaafxBKTOesRINi3pB0SZI?=
 =?us-ascii?Q?iDjMI/BG3o8AGoWee5KvvPNEPZ39kdCpxONF3KiGtwEF+ZX1vyHoau5di1T1?=
 =?us-ascii?Q?KR6JU+18TxlMMg3fkRhNx5hIdgkVLz3tJ30Hln7pViAnzz3FialaePudeafg?=
 =?us-ascii?Q?0f+6L7NE1GjrNOb4MbXZFvz1ISR8WZ0GqYJmvOvNmfn+AjzyeJf/PRkhCUM3?=
 =?us-ascii?Q?jzbjNHKahizeV8bkvzdJZwGSv48CqWl9akyE/cpaO0HPtqnhILy0wHZordU5?=
 =?us-ascii?Q?1rD4/DjWIHCFJ7yLohVT8n5yfejTBOyW8VbGviChUg5LlEx7gqueD7u0EIfU?=
 =?us-ascii?Q?xG5yXS6XWq1hr7DxWRcLKW2J5QJspte2KbEZzHMvhZVZsmrWZlIthoO72/P9?=
 =?us-ascii?Q?puzf4+Ef3qS77+fOHivFHnpIDrJNQevbjbnc02mPXN49vGdfjlG+YHwHeELA?=
X-MS-Exchange-AntiSpam-MessageData-1: R2H58F2naXNNJQ==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4973c10-76e3-4178-a816-08df38ea35d9
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11203.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 14:04:28.8182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M4wDDom1xSFmsfRfEufOjSeNwalvioqj7qWDcN/C+M1n0uN7di1ue5Dk55zuOuweiRQKuY+ECwCXdXUs3pUVEuDf3+lxxlTRo1HSy4neFCfT/RTVpx71T1M8LZ8CoIALdr2yEoPf239/kEtiriUFoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB12565
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_140455_388382_8D0C0193 
X-CRM114-Status: GOOD (  10.42  )
X-Spam-Score: 0.9 (/)
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

Enable ARCH_OPENHWGROUP so the CVA6 APU device trees are built, and the
Xilinx SPI and GPIO drivers used by the SD card slot and the LEDs on the
Digilent Genesys 2.

Signed-off-by: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
---
 arch/riscv/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 04ae305d55..ed495eb8ad 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -26,6 +26,7 @@ CONFIG_ARCH_ANDES=y
 CONFIG_ARCH_ANLOGIC=y
 CONFIG_ARCH_ESWIN=y
 CONFIG_ARCH_MICROCHIP=y
+CONFIG_ARCH_OPENHWGROUP=y
 CONFIG_ARCH_SIFIVE=y
 CONFIG_ARCH_SOPHGO=y
 CONFIG_ARCH_SPACEMIT=y
@@ -166,6 +167,7 @@ CONFIG_SPI_FSL_QUADSPI=m
 CONFIG_SPI_PL022=m
 CONFIG_SPI_SIFIVE=y
 CONFIG_SPI_SUN6I=y
+CONFIG_SPI_XILINX=y
 # CONFIG_PTP_1588_CLOCK is not set
 CONFIG_PINCTRL_TH1520=y
 CONFIG_PINCTRL_SOPHGO_CV1800B=y
@@ -175,6 +177,7 @@ CONFIG_PINCTRL_SOPHGO_SG2002=y
 CONFIG_GPIO_DWAPB=y
 CONFIG_GPIO_SIFIVE=y
 CONFIG_GPIO_SPACEMIT_K1=y
+CONFIG_GPIO_XILINX=y
 CONFIG_GPIO_PCA953X=m
 CONFIG_GPIO_PCA953X_IRQ=y
 CONFIG_POWER_RESET_GPIO_RESTART=y
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
