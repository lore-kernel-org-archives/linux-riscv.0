Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7503160A3810
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 14:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mGXH5RGi;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=NCllscYf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=l+hJcwEPHdxqlwmipjm3gH/jlrjZomC1WsShbUy/6Vs=; b=mGXH5RGiQAzLhdrnndA4OkfyEE
	TD6LpwqRq6Jm7Bz1aqa9xzitNNpNAvCS7LHlMCdThCm9a52WNmrMqFAouT2xGkJ8XXnTKyCCgB1D/
	LESu3RBqv+gv8oa5h8LIXkuJIJpHb7efr9bKuqu2bmY1CBb9qmP456qVecjlB+hDijIBKSs2CbPqg
	EqEIPYYFgO9YFYYiFIB3fI+AAVXnwVyhS5JJ/df5pnDjvGq/b7niRie3jS0JZJ1XgjFJS0Fcg+W1T
	qDnLWmGOKI00uKhIcMgifkzIRN1HZp9RmlKFZ0zk6IXEvlD6rNe4kL9k4WYfwqyZLLgpjIjmWmIwN
	wq8Va3Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsdq-0000000GiB2-42JD;
	Mon, 02 Nov 2026 14:04:06 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsdo-0000000Gi9m-1mE9
	for linux-riscv@lists.infradead.org;
	Mon, 02 Nov 2026 14:04:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WonxY/7EOR5AV1eSQbB1pHp+9lQJ/TB9KwIGbzJQBRPq/kAr3cM1hWdBNwRgvbxRQIb0xCgaQG/Jlt1KYxY6z6HRa2+v+MBM/t7mpaSmqvCVSjSHe23MQkx4y+NERpuMjPBHk8V9s0x/WHHWGNJPePaZtl+pIkQfjDPodgAGICPJAt5KoxhqgC3wyK2i/Cew6fjYs3yZcMl9va3D50mRD0cqZWAevvRU0SuNHzWlDKyPMhsh6rNbo49PlX0s04sbgFkHIpQKa95tZFOyt+dNWRB1bybgsDlCpbNsZfLE+1Kf44bv2VYD8Z5ovIlAzogNMgo88gKV/1/ZKgpCoeM4cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CFmwAMJogen2+AXHxVrfnniJjeyT6+fo8ZZwEp1ct9I=;
 b=ETTVMq1vse6AxC++kMRd8tmHzLXL/MhCAD+QvIw4+vK3SkAnPpFzhatTYZUodcwQVZ/TFRKZ05UTVyUKZmNbruyt+nNMx+0geUnm8P6hHKlvBQb7nSEX8iqsACG9Nvr/YyMgGze4xqHUOrHbHxRKowdflyTbDS3SRlW4Os7wZRxDQYsnytqcFeJi9e7YPbEHPibl2p2ZmjWjBfOFQOZcuKhqEXMCQjDVh9x+RVKgoAcTvnUeFw05NgK21JS5PnRLkuezjgdSihLQeK7IwY/d/0cQ9iO+m8daycmUhrIufrqnR5hE/hmfiK4pnqRT8M02cvlO/wd1vLEpVLoSgJjpng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CFmwAMJogen2+AXHxVrfnniJjeyT6+fo8ZZwEp1ct9I=;
 b=NCllscYfff/NDnSx2SDNi15Sz2H0HDwutzX07sQN3oAs4MCGqQzN3Focx+/ek8TFev+gEtN0UVcxRQ1nLMEPt04Cw5+YLzjNUd0KOwHTnaaa4uLOZvuywWl0oLzN8FMp7VW1VpvzKp3RC3bXxZ8EVV5BLqKPDXv+CZ4j0jifndefb3AtVLkLzYyO5OcNlhmd71gZ5XShonyAJLlCAAGQW9to0F+NysH2JJ+vIDHZcR3Dt1I/t63guS9AKyTnm83FKhHMKIbwLVQeTKrBrDrUOrr+45sfSwige7w3QoN8AfJqHW4kv/IqmHq8tHhd9vECzX1xKM3ree/j3+5GslYr8A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13) by AMBPR04MB12565.eurprd04.prod.outlook.com
 (2603:10a6:20b:778::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 14:04:01 +0000
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930]) by PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930%3]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 14:04:01 +0000
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
Subject: [PATCH 4/8] dt-bindings: interrupt-controller: sifive,plic: add OpenHW Group CVA6 APU
Date: Mon,  2 Nov 2026 15:17:23 +0100
Message-Id: <20261102141727.640769-5-marouene.boubakri@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261102141727.640769-1-marouene.boubakri@oss.nxp.com>
References: <20261102141727.640769-1-marouene.boubakri@oss.nxp.com>
X-ClientProxiedBy: PH1PEPF0001330D.namprd07.prod.outlook.com
 (2603:10b6:518:1::1c) To PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11203:EE_|AMBPR04MB12565:EE_
X-MS-Office365-Filtering-Correlation-Id: 41cbc98b-0f16-40c1-7232-08df38ea2558
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|19092799006|261021121427099003|11063799006|56012099006|261009223027099003|261026121527099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: 9RYN+VVjWDccJorV3FzDsRwfRlAuAgAMQ30viHObu5iE2YyU8ZL7hC3QjHmrvYcXZl/2mGfgyhARuuhvq/uFiVcxfMHXAZmn8HWrkStWKvs8/OMUOYJG4cQ0iUH4eHZR28TWNkNAUnYenooLfhUtPMYQdDmEGhDjNZi9p/doh6AveHvEVbtc0hKa2T8wcqduG4hcU5lGqwzit7q5WXDkWdOfaIq/G7zOr0/b09YK/s7i3AV3KLDcvdHKQlGnoxIeBxck0uwuWiHuKL7P/i+bf1BQZcooTIK9OYP2WwhpAZe9TTR3g4HLeVNlTOJq+4ti9bYXcqL+FxzBEUeE7PqNWGzy1YT3F/22zCIdcGKi4HYMTc0xh+MbauXR/m82aD606bZXo1qU0VMDkkqz85WamnlH5FifeVr+u9ogRDpNeUl9hX7MpHnglV1MQJ0dexg5tyjGj3p5+r+FZJZptfGzYUuvYrZgPeOxQbo80nG3eiyN99+76MWx+YDreCDEH6Ln0zuegu4bwtNmY7MZKBs/ntZGTDcQhtuksZjlrTOh/BXaWD6bTZ0FPnHmA2S8EswUrXSOP9R8meV1/7HbfDHZTZnr/jOoP9A4lJDuUESgPL7lqNhVElj2YJKEKAH4EV5T23yPo65C1XnHHnfhWMjNDgHTJJS+2J9i6IKo8ASpA+w=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11203.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(19092799006)(261021121427099003)(11063799006)(56012099006)(261009223027099003)(261026121527099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HXRUD5ZR2SC/F9N5icw+6hzOdrtNJuI5gY+6uazFvq/Rg+21CkknHmEl7uFK?=
 =?us-ascii?Q?GZgawTZmmMgZGgz4RmJ8yCOjIg2rO+v+3B1bYBitDvZFyBQbS5INt3XmaVJi?=
 =?us-ascii?Q?jdFeB4UIIzWl7AP0UkCtIxWQxaAIdoMBMnsStFSlNDkfumSU6kk+EwuVd8L6?=
 =?us-ascii?Q?JaU88pXVFgDwCj1hd6rLYCJmHKlLX4NaODijU4FHeyX2pZVHiBNcS0ewu1po?=
 =?us-ascii?Q?hcqHgnKKi9FoGaTeniAqOw/LjE12WYtCSX7aCoZVzhxw/ksdu1CvxJvfCntp?=
 =?us-ascii?Q?rpI5PMEuEV2nzfJ14DOjYIkgyMcrWLwtfrZUcQKiEoesfDXpVp5OruSlVtmO?=
 =?us-ascii?Q?pjaD4pnkjNeqX31Xl0boUUchkkePNqjdlgESLCMgS1u7w2stbyr91BDdjPhA?=
 =?us-ascii?Q?6f5xEz5PUtdtEvvrO09liR2QK9gHkNHWyVp2AVPa9XUNWkBxM4o4UaLjgfeL?=
 =?us-ascii?Q?rvUytGeDlNT0u23uGOIBbwNIcMcP79gzVAGxKDVSqpIalzhzK6pi7uBLBFR3?=
 =?us-ascii?Q?MkMuRv4z9ymv9rjgcsGJPEoRpfwOMTZraD59mwDu2Ic5TNVrcG0YxBaMCRew?=
 =?us-ascii?Q?jqjql0oQDM6oH5sRzICWpoStTHoIjAYQYdpwaptswsawvaKRnu3pCBHfzj7i?=
 =?us-ascii?Q?LnidQPDYZEiLInffeT5v7Azfbp2HIqZToaZjlKXJfueZ/SBQFL2Tuqd5tyIU?=
 =?us-ascii?Q?HA/qGX1/T9/ZAXuTZPlaNmUiERiq81XWCjVMw38RZRk4cKuLjUxcagxkoW7x?=
 =?us-ascii?Q?L+Xj5AWqQtRtkDBcXuXvGHvlLwFIZaZRMxYs+I62tH/bRppb7gbDc1S6+pl9?=
 =?us-ascii?Q?xaKufLVptXqnMLgO69wjsYQ2xp5DXrI91v/BCAqKo4FLXlhYfXKdUinSEXx4?=
 =?us-ascii?Q?7dFHTMh/CeuS5PDn2igiorlHK87e+lx9ZYnl/JiVnkiFwoH/Fr0TDc8EVxxO?=
 =?us-ascii?Q?I5icVHl/CraNmZxjXYCGp3b7JiurpABWZ3CkuII2RQjmIuI9Tv05NVoMs8yC?=
 =?us-ascii?Q?UusKAsvbkC+iizW096ZX7IwT904TCAZz2RxL3s3XrLIu+bzlw35ogci19M0s?=
 =?us-ascii?Q?k+/LkFVU8fjp9aBS3H2Ol0Ceswn2N2SQ3t3TKC1Dl5E5YmX7z8w7T2ExxGf3?=
 =?us-ascii?Q?r/ogSIFdf4tFhwhd3jvh3KpxfL+oz+ko6XXK2j9xTzKr/OaHhebU+rggFj1u?=
 =?us-ascii?Q?rU0b3vGWzfiVngB8jBQTSSARiAIkpnYOenLLvNxPZobsTsc90kmE/BxG/cR6?=
 =?us-ascii?Q?gZT9b7qjBvXZiMBzcSW2lFF1BmgbDxKCOzNsysdmOXn4XTHLS3R9rG7FkUIo?=
 =?us-ascii?Q?78JKCd2BtOg5IhfyOEWY1/OouknEzrHzmh1Y2tpsegeXkulFq3FFT18rU+w+?=
 =?us-ascii?Q?YGTE+CFRpTVJGe67decAUlJ9mFYceX1hSHZB59fU8GZOpIksfJw1ke9/ByZ/?=
 =?us-ascii?Q?o+no7l3s+oCe3VQZ+BjiElYw+65uZaBlNZP5eCA8XiqdGMc6NK0w3joWMB3z?=
 =?us-ascii?Q?B5YL0q/SaQZ6LrwvbHZjX63unPVkrNdEz7eA516iqDeC8qMrrWzTx1UZg7Ip?=
 =?us-ascii?Q?q4LhCL9dv0HrEhqjfwZLxQPBmXyXAiDecK3fLrN6ZZZTPiEArY49DbMr4I6A?=
 =?us-ascii?Q?jfSMsTbJYkkhChWruEHy5p4wGXg3+eLfTC8WM7dgyMjGyr/AbWMNAPJmCjpn?=
 =?us-ascii?Q?TtM3vjJKk907US3RoVT9BIS8xYvjmw6KOLV+MDe7yy5q6qu8uicD2UJO9EUQ?=
 =?us-ascii?Q?HoebSBR4WMj8i29zM+NlLJyMJoFxLqVZAMnSqhTPVMPsRGzyVGH4xNL+wOD1?=
X-MS-Exchange-AntiSpam-MessageData-1: xjY8HQb/ONtY8Q==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41cbc98b-0f16-40c1-7232-08df38ea2558
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11203.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 14:04:01.2869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b15Td+w41WZTXavz5g9SGfcw3w8JgeGKlSM2yODiIF7TlTXNqHNCmlsQZRiLfeEMOKgv4myKkKs8iaaKFy7evhIKPF5d1dythRF/LnHjQhG8drQ7gd/JbZRbZdUx+coBonqnHCZEqIirm5gBMQX1hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB12565
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_060404_466109_3EFDA9B2 
X-CRM114-Status: UNSURE (   8.02  )
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

The CVA6 APU FPGA platform integrates a PLIC compatible with the SiFive
PLIC 1.0.0. Add its compatible string.

Signed-off-by: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index cde4bb6918..00ad63ab0f 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -62,6 +62,7 @@ properties:
               - canaan,k210-plic
               - eswin,eic7700-plic
               - microchip,pic64gx-plic
+              - openhwgroup,cva6-plic
               - sifive,fu540-c000-plic
               - spacemit,k1-plic
               - starfive,jh7100-plic
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
