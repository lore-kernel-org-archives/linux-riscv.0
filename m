Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61124E95A8E
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 11:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NT7mrjGyKxf+Q4Y1HyI+JY5TF9RG4bIi8AnQCQduoSo=; b=dRBb9iPxlp3L0q
	X+wHXewhAY98sxNGU79G235GOx1PNhQsbUKqTuXJsGbCbxN6/AoE7Wg6vUCTD4VNJGJdketCqSZ+c
	Lxl+onHGoqN2IxAUcocnIW+rjOlgJVv3Xlv6zDUWJq4rZ6wD70AkaavPZ4MHq2j5zWbINCZKNN4pj
	4SFh2MqwvpsjrhKqzUO4/M5YXihbDgI8ZqiDHo2FR2C2egL26gubt3prEXUBfk18GbnzOen0Umnzm
	XLAsPqRqVabnNz/vvSTldRWEboTqnxqPlLulZSt5gb/m7ATip1i80uiWXXWrMZSGhwTiDORSWofPa
	SsNM6a9ae9xxlNYALy3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpoO8-00AS05-24;
	Mon, 09 Oct 2023 11:25:28 +0000
Received: from mail-sn1nam02acsn2080b.outbound.protection.outlook.com ([2a01:111:f400:7ea9::80b] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpoO5-00ARz6-0L
	for linux-riscv@lists.infradead.org;
	Mon, 09 Oct 2023 11:25:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WmEqVb8gf+qtU+fjl0oGWBpKTPNpLb5UbsJgNSAfRt5j8WPEwCeHbneyUvrht8VrNGzP0UG2lTk9ddnEasEe0c9rtTKiYjzh9kGw2nAjHXQZR4VcTSGUP1RAD+wr+t8v6GbaZoPKcD7BGPDnsPN4S63SShZzE/rHw7QuTdxkqn8bTkx4lFY33IAQ3rWeplhIOWoU07LxrvFIzlq1LtzP5K+7gI2pDm6kASCTuj/mIGoAuhHUMS+y5+Hxd0Q9Jpy2MJdCSILGXmghpyV+FtkQ4OfB/IeXwubhwaY5v1eFcloTnSH7TM51gwluCqJ/evOCf/OJ6rosjo9eA6EtMSsw9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N2Q39ntiyZqWBW26kNVYngJRfZ7Rs+Igbg+vs760ZMg=;
 b=O3GQF3r+1ntiKYT59+aKo7kfpv08SitZfzxM9zP3AUhjHqce7b8iyEuObk/CyA0aPHAaUQgWMLXkmB2Fxz2+ZIYF36DoX0CkL5h/wC0VhWt6AEmm2klMdcGFAPbQOnGwfWsfS/f3/6YCpOEzNLSmFcfsz7wiK29G2ErfVYbGZcPPwEKM48t30W9p6GQrU7qz2nfRDkdV6nQiLtnB3gEDRHx7+DTUvYur7sAgYac13+/7HQnNyIHo61j8N3acDe+lex7whsoyaVBJlVNE3AWgJnMCYVUGU4bomWJKJSjCLBZPoswzRLcHmFPR9539QNP28DwhEDPSRyFBmWxegAmUgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N2Q39ntiyZqWBW26kNVYngJRfZ7Rs+Igbg+vs760ZMg=;
 b=nniuy8Kf97aLU3RYTkUhR2PTqkTdyyBwP+JEjXOFejTQYOEda+S5RHMubncnHolpoRmjhUU8rpUf6Q/gd6ddEAsxux0wRUfLRiglc8WLuYLrRSeAdemcyNXNGhXodrct8BgZ53FPs1+TzEp/wEJFogWIDIuGmS8v2nJORZwV7NBIj7zTj5ieHhZuVMSfej1v4YKvZxc3HY9npT5nbx51iaOGO05OLt5+01lKTu9kxFUMcd9oGsZ6kof88t51dtr/acTL7PlvDgpztpOU8JrF4eYYmKcKpJA2uqyEFSP1oEa5kmm/GWlpuiElyxteMgQ+tFnZUDzqUxh7huwmk1Da4Q==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by PH0PR20MB6129.namprd20.prod.outlook.com (2603:10b6:510:2a2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.37; Mon, 9 Oct
 2023 11:25:15 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::d050:882f:a8a7:8263]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::d050:882f:a8a7:8263%5]) with mapi id 15.20.6838.040; Mon, 9 Oct 2023
 11:25:15 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Anup Patel <anup@brainfault.org>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 0/7] Add Huashan Pi board support
Date: Mon,  9 Oct 2023 19:25:14 +0800
Message-ID: <IA1PR20MB49531C1C34C3E972DBBA4151BBCEA@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.42.0
X-TMN: [8OJtKQ58U+IXxkwbUg2cUqt4spXaCenyyGuySXKtNhs=]
X-ClientProxiedBy: SJ0PR13CA0153.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::8) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20231009112517.477055-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|PH0PR20MB6129:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c499fb9-9a13-4916-28b4-08dbc8ba6865
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kgeLRZy/27Ddtxc6OMH6cUkJ0AcxOPgT8Ec3nFcZzArHsI7NyLZ/I2Xa2+9U6G328EtNfaxwnLRa5jZ8/8kL35xO9M3NufIEE+t1rlzumGrqjcMB6+YXoZfvyBIjnKZN3x6bkengL98KWk3gG+Xi27pOmuwCGWjiEiX2Su5LQXZh3uP2+sF7tbKIU3TNXRbmL98kUPkK6ANy5sCtPOrSie8Pv/7Af1DBGz9sroXMHWLeTT/S7gm8m5OsUUSXOlHb9iqeQFQCsX+A+ePTi6VvxOcgcGs2RQgWMO1+T7tAPO2v1yqqX2GArelGnFqrwq5mrdKLOF7CrG4p86XXiih6VmDtwh/RS3UvlfSZBk8BLsVgg3GCQYX7T0mv2m/f4ZYaZ5f3ZoVdyo/oY+0V3RlkXu9JfqxxHO3c3kAYksWnfvKORnakd9rtOmofTyBzzL/6cTxhuT8mVlY5iCRIK8Y2z3xSUI+3dRxCZIvIqZ8SOsmmHw7MnwVIUo1+pWIQLOBJqbQUuGu65b4y029ChHYhq45P8P2Bg1C7pEAC6mo1coFLDDFWYhh/UDRjXQv0ipRgN7KGtx8o9h/Z3lmy+24E/P58BBDrk0E6+Vxisc2HvwtKFu8lz0IsPupVCCTZ38wRyd5egjzU/BDAuPLybDOYMFvBMMirqTa13aLN1/+G+Z4=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9yD2yaqIgwGUhmj8evI2nWrVrwrb4VNB7mpGQceLIImFdtENt/8S1/E4Y3mD?=
 =?us-ascii?Q?I1IH75m7OkIA7KkaMxOm4CnkOrPUhKIPoKdqamPgSTsb/ewOGDTMwHVSnVDt?=
 =?us-ascii?Q?o1lB5+/MKrWPT4LE/8d2BkgIhIOwaXZATM8cUpraRddmT/cvPWvgrvRY+HPK?=
 =?us-ascii?Q?1z6sRNfc94UekfXcygXphiYAcTRf7XRoEId8OusUOqJggMKGIgJsHmn1/pX/?=
 =?us-ascii?Q?0977L3yWp63CeviBKZGm6BqP9BZiEfbjNHa+LLhJXJ23hi0YCYehdzLLJJi9?=
 =?us-ascii?Q?brNRx3fw5BQki/pkWhtcuBnLWBPWw+s83PQXJoNj990n3F+U24qji6+LLFJg?=
 =?us-ascii?Q?AqdEI+K+RRRyx2/FeZMP75RgiX3uHJei+jb3lOCQJhxllLK9XXG6GoAloZN+?=
 =?us-ascii?Q?A1JTKUAtmcT88vhsSKqywaDoUvunJ4snPZ5ucbZm5VWeVsGgDCxq0iFGF9QM?=
 =?us-ascii?Q?kiuNDkG9uFt4EsGHtDB65E82NWMxUCOtfhvWkI3LvvfYEJlytujIdHGdZOx+?=
 =?us-ascii?Q?GmZvsfmhXVdOW3BTzuWyEU0rVFreY41G0b964X9cP2G2IMjZ3hl634V2FeEO?=
 =?us-ascii?Q?2OHXep+VDmIPHKTyjG+xfUI5CUGBvgcAmCiVxHxPq77fgvpvEHZBCrBPNVD4?=
 =?us-ascii?Q?dyC0x+tMpmFioebmPsu+HYSr5+g1432Xr/2yVUEbkzVAMqXicHvBpVfgt07V?=
 =?us-ascii?Q?KSsB38J5Xk1vb65cntQ1Mj4k5QPoUHeYSyabWRQMhzitmMJKJOKIVpsYwHdD?=
 =?us-ascii?Q?uTHIkOBT57CGP7a7BRgbZo6olvnh9W49f/g2TYCHqsHLESengyRelXaoqul/?=
 =?us-ascii?Q?DhLiVN43qMjJsTpWsT2PZD/zxmIUxcV7yLFfrmx4iMoBLbsfB9qGSqlwAR8N?=
 =?us-ascii?Q?czi3+ueLyc6rLh4B3nB9Akj43RLCK6+mQhxRylAvDDfRckG9mW+QI6tSOZYt?=
 =?us-ascii?Q?MN1bwX5k/g/ZXOKdt4B9P7VfLJtAdbwbE+Be3JFiCj2l6w/29YiNKx9vshrM?=
 =?us-ascii?Q?W6wBNo3oajaoNi3bfTv2CEJbip6ZiZmOLRktOQyVbNYj70iBgIXQQjCRB+/8?=
 =?us-ascii?Q?wmMX1IbZRqSYL3lj8dG27EOwRViq6HdR8pmqvRQbdl+vJJAYRmvb4siAKNdp?=
 =?us-ascii?Q?7FfpR9PK4J1YmHH3+HhKomAH2tOTIVBdaKH0Mptw8+nxknSMzSTWkJg3FKEV?=
 =?us-ascii?Q?gDAPYUVQB8IrhCLFRzlJdOfOi1AeUEk6hTKI2Do27zadRxYPjt0Iht7BcBY?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c499fb9-9a13-4916-28b4-08dbc8ba6865
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 11:25:15.4866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR20MB6129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_042525_180824_F2F86E2F 
X-CRM114-Status: UNSURE (   8.15  )
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

Huashan Pi board is an embedded development platform based on the
CV1812H chip. Add minimal device tree files for this board.
Currently, it can boot to a basic shell.

NOTE: this series is based on the Jisheng's Milk-V Duo patch.

Link: https://en.sophgo.com/product/introduce/huashan.html
Link: https://en.sophgo.com/product/introduce/cv181xH.html

Changed from v1:
1. split the patch into several patch and refactor them.

Inochi Amaoto (7):
  dt-bindings: interrupt-controller: Add SOPHGO CV1812H plic
  dt-bindings: timer: Add SOPHGO CV1812H clint
  dt-bindings: riscv: Add SOPHGO Huashan Pi board compatibles
  riscv: dts: sophgo: Separate common devices from cv1800b soc
  riscv: dts: sophgo: cv180x: Add gpio devices
  riscv: dts: sophgo: add initial CV1812H SoC device tree
  riscv: dts: sophgo: add Huashan Pi board device tree

 .../sifive,plic-1.0.0.yaml                    |  1 +
 .../devicetree/bindings/riscv/sophgo.yaml     |  4 +
 .../bindings/timer/sifive,clint.yaml          |  1 +
 arch/riscv/boot/dts/sophgo/Makefile           |  1 +
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi       | 95 +------------------
 .../dts/sophgo/{cv1800b.dtsi => cv180x.dtsi}  | 91 ++++++++++++++----
 .../boot/dts/sophgo/cv1812h-huashan-pi.dts    | 48 ++++++++++
 arch/riscv/boot/dts/sophgo/cv1812h.dtsi       | 36 +++++++
 8 files changed, 165 insertions(+), 112 deletions(-)
 copy arch/riscv/boot/dts/sophgo/{cv1800b.dtsi => cv180x.dtsi} (58%)
 create mode 100644 arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
 create mode 100644 arch/riscv/boot/dts/sophgo/cv1812h.dtsi

--
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
