Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D49C47258
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 03:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=S1Rb6rEvusKSVmOAwEQkloFLkx+Wtu+6KiedUtYxe4Y=; b=mxsrrku+xSQqCL
	yHkScU5zOG1Ort90ZAqStHsCgcr4JJU8UJP1EXWp4YlQnKrCjCa10Ae6uWvDZrrfyi669mJbcEF1N
	0MK+tBGXHSInruVUBb5pkaiR8D1VSaoxfnGLSjlm42SK+IrSfNh75lcSL7W/GHri2dTUGoXPv9OJr
	Gmf3MqblF5GsisSgaR3ct9JGTPYucjrujCX6XiyxPj0ojc+NrIv2heFBfN35RzqpQSgI2xBVlFvFP
	bYzmf22KQ/r7nWUNlVmN4JkJ/3flNruZOIWWVB+nrXqxPO120OgovOhB5DVn/QQFLQfUbIlqTgeZX
	Z6gfSaYCJ/tcbHKMVilA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUI51-0000000B621-0tKf;
	Mon, 29 Jan 2024 03:13:03 +0000
Received: from mail-bjschn02on20618.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::618] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUI4x-0000000B61C-3Lcl
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 03:13:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KstA/YKVS8OJ38ljfsu016E1RB/cJBtrYag6GKl4EkWCim0AohraUXyWokMqnZ/yUye8YtGQGw0uvK9MGCbu3CHX6I2lEfc36TyuAl7pgbsfSrjOE1e/wKVPIj+OSsufrYjcrYj0F1q/fBTfmECoZ7OkQkD+S74v8+hXUSFm+ydRaEJGDoBWE/3+03Bf42ulAWtffYppBFMRfd9fNRxOxySYhRpAcTunobFLBAewM0duNbvTTI4RRpMcdRHFtCu3U4SgoN+Rb2t1R+qOhIsWCtlmYtww3d1bcfLRo3uM2yYqZAnVl65fgs8tZHaTNDUOMtJTvbrAmqTMwVYeuzROdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4rDk4Khc8YWQzN5hnYx7eNSRP+jczG9LqiGFQEMi2QA=;
 b=CFIBBB1HxFulvpEX707v4g4jZBE8GrXdgVZlhlwNNaJoG6Zl0MwswQ+z24CJ3zYdShZYN9rq/IPbWQZ0wOHVbjCcsIR5u3JM+CYLjZ0y0BsDnlMR4ea75XZc0s7ZuXgNQe2exVcFCUNU7pI649HgY5Cn/dajv92kzPba9vhjI92dbx8mMzJoXoLelRkC7Ao3NR4PQ7z2bHjF6od2ZivyU8RpWTKZ42fpgLc8tg+jPsGs4EJRp1ta9dLQm8uEbGoF6WH42eZUmQ+4rUpSr8I1BnJo6DFL881V549IgRGfZMDkEZyfceZQk+cOesZj55uR6AfXEqcEtnQSbvIcXcuAzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1253.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::8) by ZQ0PR01MB1253.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Mon, 29 Jan
 2024 03:12:48 +0000
Received: from ZQ0PR01MB1253.CHNPR01.prod.partner.outlook.cn
 ([fe80::a5c6:9ab0:d20f:cb78]) by
 ZQ0PR01MB1253.CHNPR01.prod.partner.outlook.cn ([fe80::a5c6:9ab0:d20f:cb78%6])
 with mapi id 15.20.7228.029; Mon, 29 Jan 2024 03:12:48 +0000
From: William Qiu <william.qiu@starfivetech.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-can@vger.kernel.org
Cc: Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Wolfgang Grandegger <wg@grandegger.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	William Qiu <william.qiu@starfivetech.com>
Subject: [PATCH v1 0/4] CAST Controller Area Network driver support
Date: Mon, 29 Jan 2024 11:12:35 +0800
Message-Id: <20240129031239.17037-1-william.qiu@starfivetech.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SH0PR01CA0011.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:5::23) To ZQ0PR01MB1253.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ0PR01MB1253:EE_
X-MS-Office365-Filtering-Correlation-Id: b3f632c2-42a2-4c0a-91e9-08dc20782bd9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CckDggfJ+OFmWmql7gfzHCaHzlEqotrS5GvKir6khoQFA/1WS4WNxt45joAveNy25kWfsDmNGOCPYoCe+BU14DzoizrydEM7HLpesrhxyW5JOWz0Yetuar2KKm/igve3jm10IFihjcAB7/bCWnCXjwXDO/hBk01UwEXJLRNziYXFKMtAbTtVv3xZU7ELJ5eXmkXEHQg0jtxJ+y3ciulKXyhC6TVRS5TGGGwrqGWQCD3AQFz0J/JHylCN3ThZmOFjBRjG+2SfoEAM/cHrPiPj0UorDRD/aXZZ7gZ121chFmFBdl0X2OlHw6M00Ta6H3NF2BZbnvTYsbnv5vn1F0gVUw/aCHX4Y5ESrz7tGsv9LGk9X5jf6WJKvXDxHUbbABWxy5FjO7R2g7M6q2Vn9ZnePbL3qoX/2w3/UDL8u1sYroqjbN90Bpz8lgzcvWh0ArVrYbKPosrqWGr9qYmfu12/wsGp6s8H9WWkd5q3FArJCunKNwwQKDFqu+1TL4IncGgvnSENrTG+YNbj4kjkVfWx5syMJTD+pfs9nQGJjgg2UXNQ3xF7OUbL8Jc+K3+j2d0h
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1253.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(136003)(39830400003)(346002)(366004)(396003)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(41320700001)(4326008)(8936002)(8676002)(7416002)(5660300002)(44832011)(86362001)(54906003)(66946007)(66556008)(66476007)(38350700005)(4744005)(2906002)(40180700001)(41300700001)(36756003)(38100700002)(52116002)(508600001)(6666004)(2616005)(1076003)(40160700002)(107886003)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o0mJAPtiZN8+Hjsshb4/dqolBkhqvOuIQsqEzgICEgqDUU5qnc2lkmCQAJw/?=
 =?us-ascii?Q?JWBeLq8/kVhH11V1MVZkTHJ3Kd4LM+JcX61yXGZ/D4Y3xSPsvK/FCLBGLjMG?=
 =?us-ascii?Q?ztQlbRdTCje8XhsV9bC+qPORhoZH0+L84OiWR58QJi+II1S0VilHMY1EksnF?=
 =?us-ascii?Q?KMAHNUAN1xpLY1QtwuFCh09wy8TEM3kME8MkHTjIuKOTXSy94q9hPoruS5yO?=
 =?us-ascii?Q?vgvHIwApNjpChN67lxyoY9Qm90yQ3OHXkhto5FpqpsCHJcogfGktYSfjgJN2?=
 =?us-ascii?Q?TYpB1Wvj8S6BmDDaN594ipm0EIgKqdXsSalpEXoC5QE6jQhpUvOQq+HBcucz?=
 =?us-ascii?Q?oeu5A+4suqw9vIF4+/j3yN98IWxwEwtx1fKnfZsC3/cCRjEnpyCSaXvLAAZM?=
 =?us-ascii?Q?9h+AkGpbHYwBMudo4pSlGjUcK4hQr0VJvA/8U4reLhmbZwczZr0AkBh5NvoF?=
 =?us-ascii?Q?3rYkNKmwHsqV3GKjwEHNKwb538CO0o/O37uomUzCes+JJQ/MTV80tktuZPKj?=
 =?us-ascii?Q?RozYVF7b7XENI2nFDxr426wsBPt2s2KEicu88lS3/z6RX64hYxDFGxpycMi9?=
 =?us-ascii?Q?UZwFu0PA20rHBcHm0qezh3wnEHAu1oz5l6+ulxnlt1q984RLCIuT4BP1JHGf?=
 =?us-ascii?Q?yokotmOtm9V7LtGnR7dkxnFF3h0GCjvF0hfNjfkYVLrk5DafLKqiu88xaAr7?=
 =?us-ascii?Q?cz17DYPZ+nenjKaSMPKGdszwScT2RjlKhtA6/EF7LskWY4WK3IUaooERQXqs?=
 =?us-ascii?Q?dIX4je9zQEtSX6l07p3lES+fLnltt+eMXQEWMhTP4zOjUdsB+M12eCzy3ls0?=
 =?us-ascii?Q?JIrNDBEeuazcjID46q3m4qUxwj1WW6I3mZuSOkUYvnWB4Xi4i629EPZOVOwr?=
 =?us-ascii?Q?KIcKAj7XlTng0ffPOlp7Xm6XNdkRak61FTp9X39H6ZUqewwpzFB3acx5SxsM?=
 =?us-ascii?Q?GkhcCNmVj2r7dk/WtARQp0B0BpHuPnz58IuC/P0RLLDEK6B6SSjcAPpPU0uV?=
 =?us-ascii?Q?9Iueo03yuxpObFvZLS+WQK6KWu7uGRRm8NZebNKRwAH2120VyoYNWrqlgnsk?=
 =?us-ascii?Q?dkxvOjSGfDjM73qaKenOITxDz2Szhis/kjt3FjzX63t4IMIBMYYO5I52vEir?=
 =?us-ascii?Q?ZAhmnbf9W9TuI/nVtp9cBancgOetsDOD5PvKjHrF/Bjxy8fdhMsObZ5QF3DQ?=
 =?us-ascii?Q?OeonTn7DFNGVMnFZ7k6nuRjDBot7TBG+uVF9LvuMgFwELij4vSbtNcPb5yEc?=
 =?us-ascii?Q?H7M83Bjv2S0gHgc9W/NHv45q9i36AI1dYw7VJ/kt2aYi6Kfw1PdFV3Ila2BM?=
 =?us-ascii?Q?Thzs/2gewJUD9USjKbBQ/ShHGtfSWN2UcpJHmf/YtTaQ8mQ1xEdjSGGIXpuJ?=
 =?us-ascii?Q?kF8CARDxQWg93vP86Vabw4hklYpwI2Qs6dKcgcdtuxlcyUAhkjdzCf5vJmCZ?=
 =?us-ascii?Q?bYgyKDH/pFUOKf6C1GWNKZQ/RSsHoUfQ1suM4Xk6wdpBDQtjz3NhItfRvoI3?=
 =?us-ascii?Q?fi0cpxXhAPfHYkUgX2M3PqzwNIY/1WSTV7F19DBPtmLw2vEEaaHsF0fgmlPX?=
 =?us-ascii?Q?M1ISMW2H5+pJNNo8eRd7RvSrp7QUKseG+DH5yiJhRUn7WVTGc3FXZ2Zmfy73?=
 =?us-ascii?Q?RA=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3f632c2-42a2-4c0a-91e9-08dc20782bd9
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1253.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 03:12:48.5368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BveT9G7tPu+9E/KjjTE0bRqn0f3jABVwqgYuE/CEFKAK6kK9KC1JzWdaT4cyiquZ45ldkXoxbyeEA7ktMODhFkZlW0bqaTIXGpfDqippDXc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1253
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240128_191259_879103_D7FA9AE8 
X-CRM114-Status: UNSURE (   9.10  )
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

Hi,

This patchset adds initial rudimentary support for the CAST Controller
Area Network driver. And we registered cast in kernel as well. This
driver will be applied in JH7110 SoC first, so add relevant
compatibility support.

William Qiu (4):
  dt-bindings: vendor-prefixes: Add cast vendor prefix
  dt-bindings: can: Add bindings for CAST CAN Controller
  can: cast: add driver for CAST CAN controller
  riscv: dts: starfive: jh7110: Add CAN node

 .../devicetree/bindings/net/can/cast,can.yaml |   95 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 MAINTAINERS                                   |    7 +
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |   32 +
 drivers/net/can/Kconfig                       |    7 +
 drivers/net/can/Makefile                      |    1 +
 drivers/net/can/cast_can.c                    | 1215 +++++++++++++++++
 7 files changed, 1359 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/can/cast,can.yaml
 create mode 100644 drivers/net/can/cast_can.c

--
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
