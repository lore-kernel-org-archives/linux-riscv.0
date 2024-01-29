Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D26C47258
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 02:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hMcv7PTIeNAp53ADO89j9c4bp3yYtqk1agk1sSciS8I=; b=X/48kX+ps93oN9
	fmp7urf09LXVutdJpxJfulna1yvMUfJpUGx/EOIVl4TxUwA1qK/UmqB4nxHPyZI/WiRyajBfVWUfm
	koDXwqhUUUgDdimxh4cndBJjHSqBnndXBAxmAfOEzboeNeHpNbT1PoSW0+spiedtB46WVGkAwkiZ4
	11cNAeC5Hq7WDZdbYfFlhlWM8VSSwSrYgbpxy/xoBZWcVxfXUpr/j+Ks3c8COiFw2UMAoIgjYGx+n
	P4vIpKeTiZaAUnkcw+pvaII3T/UKZIOuqzRE9E3NSmNXOsgeZ1Wc69a/btbemAyp6eziiQMDJRXcG
	I/Ltg2AUJge5nhO8jUiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUHJD-0000000B0xH-0xSh;
	Mon, 29 Jan 2024 02:23:39 +0000
Received: from mail-bn8nam12olkn20800.outbound.protection.outlook.com ([2a01:111:f403:2c18::800] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUHJB-0000000B0w9-0WKL
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 02:23:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T5Ry52HgK6nx3W1pA9C7/ov0ESkFwgG4W0YQbqe6MpelQCQAVCK6RxkoFHJyPUvqNBe1IP4flJWEC7Lw+TFGFvjOCeHJ0Ej5swR7nz7RJXgLWvSPkAQ9gMAr03s3idXdt/c71gXnG9OYQlpVZq7XXgeA1eftkHEv041FQ5F47jwqv2RV69sOF1Fo0vfE2/sL+BqDzsR7PqsD6wvL7j2DVXZxfro8LJG6TfNdTaGkJ8ZzGOFzc/DWOmtHDwFY+bWHPUrqBZHXs1JYDiktqNL0oPjcHfSxltkO8s9PakeBwalimjfle+PGwzY9CMf1fMrXhL7TluLj0M/WmaKU7gzgog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NKRas2/EW8RKJYDebV28noQPRv3BTDPsR25tT7z09/A=;
 b=RXSEbC6jjlJzt6BIQBBI2HY9jINlAZxazIx6t2CLy7npqAKbcughTOwjR9nJdSNLjM8iViSkfgEL5zw0YBcr9jnKXqqiiAMFt6UjE1K4F8fM6MBuwjlqEOsO4mjOo/c1Wwp18T8+BmVOeyQ/XDyNxi8TD6NWJP3/73WlEMX2MoDQ9EtHWRhN4Cjc/hkiJCOLiS19eCVQUzxN/3wqYEh9S0SvoHqRDqsRx00p8797MzfOEH7yb3dwnat4IZhb5dzW++Q7Pqy27to8qJIEX7ZAtSYkEfNjI0+cIkhLZ01H6Yg23H8GmXA82enMNKuBEJNiuju6uXUKvsXeVTs2kINosw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NKRas2/EW8RKJYDebV28noQPRv3BTDPsR25tT7z09/A=;
 b=ifT38LQ9mhjemPEiqRMbOQ+EjrqLMQ4srcwkLvxRTp+mea5pzVreoKd+H5LeS+M69ULwz0qKCCWYq8bC9uHxKgWZEhXsoNHfPvdSdD3LG2n+YbIE2QrHDrR05kdfMabxC8fQstqjklNNQSduEHmgYewt890UiMz2FMJMBvK225bHuBKPvuM7gNoCnlKQB3Ge1t68dBylLnTA/pi92mYOy7HdAwM01bE4jgqxD5jNc9fBO8k3VKuHl+QO6n3QPQmicWn6akiBKfr2CrluPUcWE2RqIdSkW0rotG/CmKCwchqPgR1N35okNZ4skiT3LRzFfB/poa5K8RwVGRWtN9kxPQ==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by PH7PR20MB5925.namprd20.prod.outlook.com (2603:10b6:510:27f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.29; Mon, 29 Jan
 2024 02:23:22 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::406a:664b:b8bc:1e6b]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::406a:664b:b8bc:1e6b%2]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 02:23:22 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Liu Gui <kenneth.liu@sophgo.com>,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	dlan@gentoo.org,
	Inochi Amaoto <inochiama@outlook.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/2] riscv: sophgo: add i2c and spi device to CV180x/SG2000x SoCs
Date: Mon, 29 Jan 2024 10:23:13 +0800
Message-ID: <IA1PR20MB49533BACE8D47590C1C341D2BB7E2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.43.0
X-TMN: [ZpYXKy0Dxynh6xlKDNQ11Gdt596qOG/Q2MzlYEZBoP80AQdETlmbx7Auxartwm6B]
X-ClientProxiedBy: SI2PR02CA0025.apcprd02.prod.outlook.com
 (2603:1096:4:195::21) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20240129022315.8289-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|PH7PR20MB5925:EE_
X-MS-Office365-Filtering-Correlation-Id: ad083a7b-0d9e-4bdd-dd3f-08dc207143a6
X-MS-Exchange-SLBlob-MailProps: Om8TgR6f4EB4iibUAG7PKBjSNX+xQmv/br3XrkAR7DjdvFiQ4KndYpD0m7BA4nLiyxqVlXgwaRhGadyMKKbVqW5D0coKiL8pKvwPbLXHmQ2kmzz9VlWXCiwej51ObX+8rPAAS47JyiOk4Zvq/1tQDNvfgSmkQYfuQ8aKuTMPGUrpkH5+fDCUqHqZEMi41Uhix5U0Vidtrz1MeDrV9hM52865tM8wbLl3JSl/4+9pGiA0bbpLWw+6222hkgAOeBygrLvE2dTrxDmZh1Ff7lbd6v52E81AKnRGToLl2ZAz88mRoFm5Mk5RwA2LxZnRShAFHYaJb3Kafauqew+0wLJK2Z9hxd+U4b/sv7NOyoGobi+XLSXhYYxPTjqwW8ByRjtIGeJxEF+jppxNJf8UAJgLQIge/WFN7kEtAx7if8UCLtLHmFs+xZ7Id3hL5cm4NFM1kRr2X4hA/XMJQ/z+FTmgoPyxqHbajbYOFqkvT108Dlq/fHMRuaCijpbZqyp9tv7riVWPo5Y8tehhFhqpLSLm/CeJjRvRw7vemoEp8oSqmcIgm9BJKZMDv7Fqc4E5A39ioo9X6IwgD4Rtpv/0KAyzHCEFlWkF3+8+Wa4xketV0+xDpifJo+BLABPlQlaUcnpWjRqE8vXbNsK7bRKpE0dRVUDkIuy5fydIEnziHoNNa5yBGzJLCjgsV0ia6yS3vhIE55Bqrlv7xB6dyqpWd3KtKHiAvexddaXxZWZkXWFsHxx6goZ0ByJclW3GgAumM57Uwa4KXQi910e7pYzepHXxfojO6BBvmmUa//mdabbG9bXvTyGJlvjM5Xzrl1byova1Y4YodUFMeokBzjfdoe1pnEXMsABi0yV1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tos4lwZu8xk0xgykBur0XtgqrngPy3dOdfjvL/Qf+HKD3vEupIqg2TGaz3W6vrcXalSnAI0f4pqPklrTLVeVUnj7ST5O9Jn8dNtqM0ItA9JwEtdhWJqYn1nltCm1e6+yF1PuUYCWK7Bhz/Cgi/QxwaX+3Nqxf3FcurjU+iMI/2nibQM6fVnsegewZ+aE2ixJmwt51M4BECSXxmImQDYN+jDODtryP7Yqvfk5GEJeQYZRaENrWSQfTapF7OBDVRpiQ2Kqnv77iLhdwTKvBpnLH/d9S1ss4QMeTABZy+/ojq8915kQXDJngtUwSja36mVZnE7v99OnR8X65wPotDvkeR7Jt7v++94xzkGP/bWcAUN8pCBS/j2CL+eQ2c90SrPGl3nz5w1fGig5dOn5WCAffzat2UM/Fx9sIh9IxZG/NyIkU9ZJniHbgyvbQ5CL9Ke8S/VWpxml7pbEHjUOYYcOtIMoASPtf0eD/9tVamyS9nm4Cjmo/jSCrCZKiZ51OEfvIEMF7/Phg4+qIfwAPxcNwNbkGMoU88G1XLnzkMaGIbKdTd8WHGnjOB8T4uxf3WdBLhrP/C1/P7XaWoEWtvtHZ5tVZSkdf6EEHU/6KRIPyACQUx+YjhfwFBRpf1HxzNyt
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q5AJocqvHfMye3i3/J2Px6XI7ei19QE+Jl9T7VXBZR7Qh31pqK/Hl5EEznDP?=
 =?us-ascii?Q?BMka7x6Qk2D2GNzoEoO41bmykyzlTxZJa3S9j5WJhT6CQuKlyBy8mKEGXvwG?=
 =?us-ascii?Q?U1lxAM+/+bHv9T+ynE+5zz8mm9AlH+RDfFCSTExxpdu7a/NkdEQqv/RAtyTx?=
 =?us-ascii?Q?yRQ8BrMJ+0M0kunt4Ip5Xyj2J/6BQo/iZDPv2PJ8MX3KbTbGpsaSQ40/xKTr?=
 =?us-ascii?Q?Y5MEAx9uP8oKKbfUWB5NtIOUxjIdSfiMa6eEGL6XZgpczQModeI5yXVYDhg+?=
 =?us-ascii?Q?SroMFxlXbbblBzCSjDeQ6K2n96IEgzvTa5QiV4dUPN9Pp9s2JkyyVz0y3TxT?=
 =?us-ascii?Q?uE8Ht1wpNVgXXb7CXcUl20y7dvVrfzblZ85sFibMfrb1fHf1Vbz4B0yQz1RN?=
 =?us-ascii?Q?j3pbAUZ0Hs0vSLeFPA6d9ZyUrMGwoYxU4jmhtqNWfGjQRWEEvarBJB59MBSs?=
 =?us-ascii?Q?4/7Hg/qvQzlmHGzefcToAmiv58P834+QK91nZzCZljAyFU7c/yupoOnkcyj5?=
 =?us-ascii?Q?2vIkH1QHO/VE/Sh03cWZHz9fYi343Alat1GzlhBVhfSOtbnRr8XhM4neIbBj?=
 =?us-ascii?Q?ex40Nr1WEAr5sPEjZlDhjVIkSBqbAwhSBbb0RrRBLi+aeecnatgqONmJ/cfe?=
 =?us-ascii?Q?35+v4qQ2tIS8dhyerB8PiK8XKqp0l7aFr3MuoQAps6yrGDKneBGwJnvUkhdA?=
 =?us-ascii?Q?bb2+jP51J699Vb8SrRLc6If2J+swC9JNo95leCuWEs9bwAW/UYe501cC2ruL?=
 =?us-ascii?Q?Jl40YRXzQ8XpO0ch0X0gymd7D4p68HHR1uF/1ihWSFmNo7HtTtxFWJH4Zlt8?=
 =?us-ascii?Q?eLpLAJJyxCeBh8PCbc1HiDkuhsS2vs5Wd4fctPS0SWR+jWAQsHmAU9AzXZZa?=
 =?us-ascii?Q?sq1VPu1GafWhAvpnObyN5y03hZYu0G8pkprWLuz6D3qlMGlqLNjM06VrKXQs?=
 =?us-ascii?Q?/XdB72Uuny1/IKJiEziLejHDTuDOdh8eFjZW5hr9wwDlx9ltaFrZEHz9KYsw?=
 =?us-ascii?Q?qu0EE9thZ8S/dtZeO924muT7MhE+uC0KpNc7EOvA9d9esZ+iUSqGQaIUrh7g?=
 =?us-ascii?Q?cpBb9HUcWtSUX5s9H34ELlFuL5XNNvQQUoPVq2kgchfJHjpwTmxwJ8CjI4JA?=
 =?us-ascii?Q?TKOz1AE8hMXbffUxPjw/6EVzsNhGdPgeJAgK74G0zgJPsOJ1zpv2almB3AJF?=
 =?us-ascii?Q?zvYkjMwx2rJpvUMwANrLCRqzoW3y2nWOnPXQAnymgsUpNK5y9hsSsn3Sgj43?=
 =?us-ascii?Q?EuI6MHQOGK0T7x25tEbAdV4XYlsJHzGCnBGjUodYww=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad083a7b-0d9e-4bdd-dd3f-08dc207143a6
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 02:23:22.0201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR20MB5925
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240128_182337_211006_CD234293 
X-CRM114-Status: UNSURE (   4.33  )
X-CRM114-Notice: Please train this message.
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

Add i2c and spi devices

The patch depends on the clk patch:
https://lore.kernel.org/all/IA1PR20MB4953C774D41EDF1EADB6EC18BB6D2@IA1PR20MB4953.namprd20.prod.outlook.com/

Inochi Amaoto (2):
  riscv: dts: sophgo: cv18xx: Add spi devices
  riscv: dts: sophgo: cv18xx: Add i2c devices

 arch/riscv/boot/dts/sophgo/cv18xx.dtsi | 99 ++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

--
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
