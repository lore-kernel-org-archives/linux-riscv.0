Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF20ACA101E
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Sep 2024 00:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H0Cceji/tO8EYBJl7Gp4l2UNCMM1GKWUIZr2z/mA+5o=; b=ZEW5nZVbm+vpdU
	8/62aqbjQlEK/TfgqB2C8jHsvfY1wCPFN+Xu250GPVGNY7xFs1TgV2Ret1khIatRbamRHwT6ja8Z9
	PH2KtTfH0HtwEbswLAwtzCwFTNNF3v5kbmo8Af+7wwJmS2T1W1qXyCC3KXQYppdTRo0hy1RDMRHob
	2zQXF3XmHwprN3LaO2+TdgIWc/UNGLzt00is08ZUBZoVNuN1CU6YFFLOw3RlImZcykbNm7GJUvRn4
	UydKPB2is2pEppgiB1eqQH2at1t+3ZIGMFCXioCmA+4pIv/15DcvUvwHdRrHYQFFv9ur2cEQR0YmY
	ePzIKOshqVD1sqBSaoGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skv5Y-0000000Cab0-1xdk;
	Mon, 02 Sep 2024 00:38:36 +0000
Received: from mail-dm3nam02olkn20806.outbound.protection.outlook.com ([2a01:111:f403:2c05::806] helo=NAM02-DM3-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skv5U-0000000CaaK-3htN
	for linux-riscv@lists.infradead.org;
	Mon, 02 Sep 2024 00:38:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zAorqrG8KCH9SI1dBVEuV9yQkcWYLfs7Nsbb2y+rwGQlGTAXT3vk2aU/GpwdHQFBV8CZtx7Hw6PuCzsxRiCZ5CwNxdTQJAiZYwp/21WMg21gGB0mskpr1uUwrXbD+YU3BMR5JUS63WjI2LbO1O8clcQWRrCAPE8VscmXD0JoG44HVTnIVG/abRlEJRmUuu3OZgD+irYfV61YU6/DhKHAas+Cqj5xvii4v30lXfVQ0+YvwhPX6/GPYlIjLbuMlWRf+fYgsqNOjcNsRZTD5MC63yuE2IHeGXTZhZlXdutRFaQgqLjKDMT43ByjdTJE82XUYxOjqbf/J7Tl8gATOUYdsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p5Yj6msRkw/n3u+EGPk0oXqB3ANVEICoedKwFwUOMt4=;
 b=bDELqBh1/vIYHsxnt53lv74Za5ZokOB9xuIleS4N5emtSx4al3hTwDBBsvcGpjUEYpRfWDjyuctibRAl3LhJT+CPvA5C7+SBnh2/MTgEl5tnrMWe/aCzg/oyFXY/gPCrglGF3oP0SvNV3kbqK1fxVvYeO8QTrALtbSQT9alpAWkibUgZPzJuzUzrQQKkwyg5HOunbJ8aI065IIVBbL8aH05qm5wuQyPoJjVvlS3mo2SNN3YqlUE6ldWbComJQz6Id+Az7SzTEAL/HrBW1tyNepTRHk9xUnmswzNDIKPKsnXqNjmDZl082XnNMmmbUzInl91cUE9Tt073BsfMkShbkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p5Yj6msRkw/n3u+EGPk0oXqB3ANVEICoedKwFwUOMt4=;
 b=VdJ1DY8iKSFCsKblxKcdEctpuPsxRtsmDNFgsUblN5eE9b4SbzfPcp79Ep+7w5Wgy6hhiTOqJQU1XH849C+kT5osc3CPR2L86Mr8PlJla+rjB8XgeZJ0ljbwMYO3bAZsA+N+JMfmxgHZ0Ze+G8naciFSE94VmD7tQSQ3UbMzt6t+0LlEtau/CE5Je/v9NkWwGtmNWDpYfVQUO/iYpuEiUuBAehYYDmwCODnXlpML5mi2hMpY/ArE1LcWDrH1hIdXVjJz3/8OWs7VYKbL+lAzQEJ6xqTcwj/YmR8aGddbSdn7C53jB+5YItiY+WVckRPwy/qNDls4dLEt8BKHCtNfMQ==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by DM4PR20MB6766.namprd20.prod.outlook.com (2603:10b6:8:be::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.23; Mon, 2 Sep 2024 00:38:27 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%5]) with mapi id 15.20.7918.020; Mon, 2 Sep 2024
 00:38:27 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v13 0/2] riscv: sophgo: add dmamux support for Sophgo CV1800/SG2000 SoCs
Date: Mon,  2 Sep 2024 08:37:20 +0800
Message-ID: <IA1PR20MB49539E5AB43E44E9DE5473F1BB922@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.46.0
X-TMN: [TNLHYEb/2DmPzWlVujwPQEPgnLj9xI2tK8ezBxTTOcg=]
X-ClientProxiedBy: TY2PR0101CA0022.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::34) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20240902003720.217465-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|DM4PR20MB6766:EE_
X-MS-Office365-Filtering-Correlation-Id: 9698a426-eff8-4577-e631-08dccae78f2e
X-Microsoft-Antispam: BCL:0;ARA:14566002|19110799003|5072599009|8060799006|15080799006|461199028|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info: lJNXI7irIhNN/PPOkL3XZHiGrELX1jpyvCwV1jd7aHxNvhqZbVvp1dOSZtYg9KauEpExhZAjSrSBpwxMtH0PckpEHf/Jkas4McZvcavftUnLIJWEptyDqu/R+MPulFbwrdT2U9jaqRDu6z4QA0Tm560QDWmRMV5nU0lXeTKcCULy4Dl2Dlrw3iZaeoJFjvfCK76jKPf0MH885dfqJTulzwqwMqGgE0X8C8dqfiKHVoujQ7kMtay5RKhJGcSb7OFMzWlUSwbtxO5u2u3alXQvSz7GTDSMFAfTnT/H9NlzXmk+nZw4PldZRqd0tF2f/5inRx01x9ckvj3gsb4jp4P5N74Wmb/neps3efzsTxw3Wlm+UcwHp3g1bmxwZCE0NMd4cjQflLfdmBRnK3JNRX/yOPWSwi933Alv6HdCJCiMXZwInSfa9jrvPy5ixppNqoDFomR3bUFH6/rH09x97wo4DZY8kG6vu7k7EEbqsEm3nftnObOKg647390FAtZPb9MVKQ9RjZj/dMdwRgjoacyv0qDzhHxie/gtnHtpxmD+pvuksYnRnK9HnEviZCJiTWN/BPIyoiPOob40OTj67TabjR4Wdvnc3TBZyLkCbhfc6T6ftRcNE1Mpk6CfHadn+uwhktnDOWo6yn/eaC2jd+yPRWS8pw8WvX5Fgn0VoKswirYPfd2aaM2ARB+d4SeANbJdDyP5PSYmv2XIm2z10ZiXIKMlWadad+9HB7b1alHvJuQ=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Y9R4daZ5OsPuYFskx1n2EO6rbZfChrKCq4WOctaOg+2OBNqZLMcjTsymbUES?=
 =?us-ascii?Q?izlsbaB3GD13M+kaeCjTJLj2UYL99kh9iJGnchkqiUGL9ykGDDQ3Nx14qTSo?=
 =?us-ascii?Q?zvDonzFXPDI57jdtPzwKKwoXQ0pa/tLXQ0VU6Dr7mN18/0Qtccr6RYS8Py0v?=
 =?us-ascii?Q?6UfNMt4Rku7m6UCSakFSZvMUA+GOo9BTLf8N3nJyvGzKrolsSkN5GZFslN3/?=
 =?us-ascii?Q?UVS8xAv6hp3lavfZ25dRgTksB9JzewEFxYBe0zkdq8i2V2Z/fIJvEG7iO6R7?=
 =?us-ascii?Q?99GuN4seWWrHRVhOxXaTWAXUW4CPn4jZNBn4GdO+5NZj3SdhE3slzvZU2QK9?=
 =?us-ascii?Q?WHryB7uU4B3ODk2w2KTAh4pOTP1Z0AEQ/hLefwZihN/w0cRbeF9XIslNza63?=
 =?us-ascii?Q?IBxMVWhtYdtcCKcFPbl23igSy4c95ckwbsIk22+kobvj0z8F+kkcNjSDEEkq?=
 =?us-ascii?Q?WVE9Tls0zNZGmG2gyhEbglwZp2wB5wP1GYFwXHJMSdKGGfSBGbKzfMlVcxiV?=
 =?us-ascii?Q?T1CAq1Bb1NT3oAPM5ELulPnWcDMHOt5TLGsuVnhuJoVHYsRPrv6nswcs7IsC?=
 =?us-ascii?Q?HbnBK//sYMnQSJl501pf56XwIJr34qDx3ZuEDUqjqlGCR8Z84aCifeSooT72?=
 =?us-ascii?Q?E9lyzAX5uvkik4j+Z4656ZchKLG1+roALJNM0rwTSAiFc1zYueu4wO2qka3F?=
 =?us-ascii?Q?13MxggUWWkT2FUbmf27xB5WoXQyayOL07REcH4Ft1wXXrPKqw9Tb1hLGEVaG?=
 =?us-ascii?Q?vJI2/wO0ia5RS6AWe5DmQZAEFW7zxNPFh/VbjfbGVEtS9z0QUjscsWjXzEcz?=
 =?us-ascii?Q?a86JeXUJmfGc31EcWZWnLXdhAYmaSRRtwa4XYHcV7Lbf59fJGs43qEJohyqe?=
 =?us-ascii?Q?K3mgOwrJUeviolkTqfjtYMREnetrVmpOeBCogvchknuG3Sxi8EuBjt5XGwYt?=
 =?us-ascii?Q?sYLou8gaWwmmkgsOA07WQ+19aNg6GR9nqeoVX0kS05o2uzGiCOpuOCxBTR7j?=
 =?us-ascii?Q?koul+51BJFn8xYIodXmJIPqtKtWVGGN13vRG8tdNZp+QzqYTT0O1zI7BGL/O?=
 =?us-ascii?Q?ncXmEONbgb4+qZ5LkQPuHSLC+/YrH8o4EhbBlFOQyNrXFhM+ePKYZ/LeMwxM?=
 =?us-ascii?Q?j2nEwiLfuXOql/86K8HOdhqo3u0lxGOxAM2taq3hgODHdhoHYa9v4rM+1DyR?=
 =?us-ascii?Q?mpalgyDPTMxIfxGzR7GzUMEnV/OHL6GKLQjMxcLH2n98LNnVr0sFt9qi9mxK?=
 =?us-ascii?Q?Rc+7iT0P3HvZ7eOk0Cnn?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9698a426-eff8-4577-e631-08dccae78f2e
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2024 00:38:27.0104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR20MB6766
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240901_173832_958072_FCE377B7 
X-CRM114-Status: GOOD (  12.00  )
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

Add dma multiplexer support for the Sophgo CV1800/SG2000 SoCs.

As the syscon device of CV1800 have a usb phy subdevices. The
binding of the syscon can not be complete without the usb phy
is finished. As a result, the binding of syscon is removed
and will be evolved in its original series after the usb phy
binding is fully explored.

Changed from v12:
1. remove syscon header and use local offset instead.
2. add COMPILE_TEST for coverage.

Changed from v11:
1. init all the field of the driver data.

Changed from v10:
1. binding: fixed binding id.

Changed from v9:
1. binding: rename to cv1800b-dmamux.
2. binding: remove the unused formatting.

Changed from v8:
1. change compatible name from cv1800-dmamux to cv1800b-dmamux
2. use guard to simpify spinlock process.

Changed from v7:
1. remove unused variable

Changed from v6:
1. fix copyright time.
2. driver only output mapping info in when debugging.
3. remove dma-master check in the driver init since the binding
always require it.

Changed from v5:
1. remove dead binding header.
2. make "reg" required so the syscon binding can have the same
example node of the dmamux binding.

Changed from v4:
1. remove the syscon binding since it can not be complete (still
lack some subdevices)
2. add reg description for the binding,
3. remove the fixed channel assign for dmamux binding
3. driver adopt to the binding change. Now the driver allocates all the
channel when initing and maps the request chan to the channel dynamicly.

Changed from v3:
1. fix dt-binding address issue.

Changed from v2:
1. add reg property of dmamux node in the binding of patch 2

Changed from v1:
1. fix wrong title of patch 2.

Inochi Amaoto (2):
  dt-bindings: dmaengine: Add dma multiplexer for CV18XX/SG200X series
    SoC
  dmaengine: add driver for Sophgo CV18XX/SG200X dmamux

 .../bindings/dma/sophgo,cv1800b-dmamux.yaml   |  51 ++++
 drivers/dma/Kconfig                           |  11 +-
 drivers/dma/Makefile                          |   1 +
 drivers/dma/cv1800b-dmamux.c                  | 260 ++++++++++++++++++
 4 files changed, 322 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/dma/sophgo,cv1800b-dmamux.yaml
 create mode 100644 drivers/dma/cv1800b-dmamux.c

--
2.46.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
