Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4085C25B7E
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jun 2024 08:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gARR8eGk/NeYtbNFXzC1rsbK8/bFUUzKd6s+LWpqm0I=; b=deLvwkgILhsEZa
	+odVgjBxBZN85H9XJNa1pjGmP+5uyVkaVNqCXm8Xa/2bMOLKL2cpg7maVkTWBA3LBqU/qlEGFvK/L
	5f5DEyRR7MRM4dhMTl4VIdZli19OfrzLe2HtSoUeZgZNOaXasD/5Se/LlrUJdvhZHgAm91Ia+79Wi
	mlylmmsoqqIwnRvUi+ohGHyJbTuk6hCVtq7JeMYqBCQPKg6u4MtYhG7ppy6WCO7sZPg/9UfMbPtml
	xq6cMqjUKYry8Kr+5Bn/1NMbbyJsgrD/JoiJfs8ColWqI2qEViQP4qI+KN7Id7HPDdvUgE8JNw2V/
	sSEBP4yi2a3cpM24/r4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEPpd-00000001ipI-3MpW;
	Tue, 04 Jun 2024 08:47:49 +0000
Received: from mail-bjschn02on2072b.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::72b] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEPpZ-00000001ilc-0zDQ
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jun 2024 08:47:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OpkglBCpCKXxHehG93BjEpQ42mMJtD6MVb1/2YRG/GZuvf6TyCzXwz88bhzuOexH1cd5q1LgclJ+ea8wB2aU2KdNDRryhEluN0iO+mVOtgwSVba/vLoRPHTEt5qwwm8aYbicTEs/jeNF+GOR9i4HggLq3NtheVQ7sSYMnqZU1fN/FU4gHIhXDVzmDMyt1KUJu7H1h7xrKwCSLwOYiagX62Dkz1U7RVOjDeJwCE3vq5BHr5TqSWkwy1vNorwmFYhdbDnkmDQFCHkIvnnTKmqWZXvrsEMW4w5NeOShV5D39OAHAX5hqL/Rbj5F0iS+JleARPTdS09mLsn7ZGmZL5EHSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yDlaLfDYlpsBXxz5UFaLXzLNxKlLNZklMfzj7Ht/HL8=;
 b=DORhBOcodbopFNQW5npIQb/X0SSNipBjm5cJWfs/UIuODUYjPRqm0pyAx1OqYTnSBsxdbns5tkGOdieEvO50WNGE4yT81as/AXsUywmvDx5Jwmf7nYuYePa7egVUP0jV1jvZT0iR/raIhxNjItjAlZml14trTkxGEv7mtzg4xWzx9CYAny+cper/ZtS70PUnPh6DXiJ+7Qf8AsH5rsyNKeLIoSsWsjyE6+eKDI5T+eSxVOtEWHTQwynaQGx90Wl6GOa2uRghNKBHWiglMucL9ZnvAavu2RMnqSTiTZ3v+EWp04yBtcg+m6MEK+svwXkZG7q55ECUBnXY1/Wu4foOFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1324.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:12::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.42; Tue, 4 Jun
 2024 08:47:37 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::61c0:a8fc:1462:bc54]) by
 ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn ([fe80::61c0:a8fc:1462:bc54%6])
 with mapi id 15.20.7587.043; Tue, 4 Jun 2024 08:47:37 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] Add the core reset for UARTs of StarFive JH7110
Date: Tue,  4 Jun 2024 16:47:26 +0800
Message-ID: <20240604084729.57239-1-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.43.2
X-ClientProxiedBy: BJXPR01CA0055.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:12::22) To ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1324:EE_
X-MS-Office365-Filtering-Correlation-Id: 7143d69a-3776-4f6e-5856-08dc8472fc09
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230031|7416005|41320700004|366007|1800799015|52116005|38350700005|921011;
X-Microsoft-Antispam-Message-Info: jZsIBKL7F5UExSJMPVN2DWCtOjTLhkqfh5BoL8kp0PbPCjfStr+F47b7Tqf5pt8wZS8W4lRxDeWLqnP/OjxDnE5gaf0etdDXNmVbpGP0Al5R0MdE0RBM4BrAWMkMLyrSBjjNgLwAj05Z32yW6A8NpLXlYbQguFOpVP+9AFrJmT2hRuGKTNWHp8SA2p2/xscaJtV5u53+QM+ifRgGEwPESd6cZfrXiYuKc/E6CdeqICpIHNf/1W7SX8SvZ/i/1NcdzR04xhtsks3RzGjcoYYVujbi8BuFFm4SFRnRSBPEY/BDweRsyXkt4v18JFvjeAu91+CtQEe4auLzCbw841Q6vjshw68npyy6e9i/LHWC3mAvgBANed9jhQzT/6jiwcvNlOyyoVSiCA+Sfs+/QvaaHl8JRLGpyC6QvcrMOnq1nzsfinvP3YToE2gMBvGaNJdiCRmMuQDKfnVREdTXT+vb/8Fh2WRiIswLFnI0QWQt8LX0uK6Nwq74fgCwUmZl+pQZC7jOii6iRrDRd836e7oV2gPt8cZE9V+rbv+gc4R2lAXwE5jSISqx8S/IfvJLpdGY0dG7YUGVw1x0EF9+el9kBC6+SordtUgH102PeWfqqq7pmHcByD+yHzBZRFBhGtCGkvvilU/ybZKCB/9H/kLLPA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(7416005)(41320700004)(366007)(1800799015)(52116005)(38350700005)(921011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WVqrYtQJbq53EBXuDd1YVrYN/4cwR/O583LbfB54ryhxqLCu740UhYkQYOXu?=
 =?us-ascii?Q?CaV8OUx/pJ04TU0wbPSXXDJM+1AY9g230+FRtLXEUivj26ewwPsACZkpqXet?=
 =?us-ascii?Q?UDtCW1HtaPrXYHwHQrNWJYsMue9wgRk42TMJ9cBbfle+lu1ttQ4Nx+a4leN2?=
 =?us-ascii?Q?TxKxBT+u6uwFIWXHF1ygJwVkZrrE8ZUFCRwicMXoUXNCC8QZ1NydCImCxbfX?=
 =?us-ascii?Q?eE/HrxvA9NbOdr/Gto5ZDx866+cpn4W3GH+osN+g/VuCWTqrtQ+cKGjLv1hk?=
 =?us-ascii?Q?XqQwXOQxxdpiHWB6FPEVfd3IqIs9305/lvYkFxLIRkcRjUr67An5pZrWR5mi?=
 =?us-ascii?Q?UVWKs7UciAWHohWEgH7TvPNioYvOTOFart/qS4oDzJyK+4JboTIsJQkg7NSd?=
 =?us-ascii?Q?1/Al7FGJVnsEtMMpLt2nE4O91oWqI3Qw82H13OCDir42iRZwagY7lsbGtsKA?=
 =?us-ascii?Q?dxhAtBWKdAlVJoGhI6GcsGCck6kyjA2oOtlxRbP0hk7xZJGiZ6YwTOSDEanf?=
 =?us-ascii?Q?5ClByXSo29IMAlp7opXI2K9NSwtI8F7KuM9uwog370rn/m0z2+6DH7fSKCDV?=
 =?us-ascii?Q?64n7EyhzK+qtbwgR9H3J/bid+lr1bK2RYd1e4cp49w5RB5gxsuSM8ixO68fX?=
 =?us-ascii?Q?Y4X2hFhIaMR19K7x1FeTq8ybYDrSSNbjyFTfRgnCLF7LBQJKlnYJ3EvPJkov?=
 =?us-ascii?Q?Um9AMfjbuY326BqOuwDZeIEBTBSz/SOP/tizWk0bAmqptTPHsKTCBhI4rwai?=
 =?us-ascii?Q?qijI/xZDfaz9DPOF87YxX3vQJPF843fnzA6uBoa9brjOJu0PMsgaZZhZRWBd?=
 =?us-ascii?Q?xdeS2PkQCYKoxsKc2XgK9rJmtvhrbMuvxO8WJFq5VQSaPULMCpi0a7f7rz88?=
 =?us-ascii?Q?XE8nrjQf8lfo89nwno+R2lH/jw/5+EZba1OOvbv9HBoJX+4nE5kSV5OZzOxP?=
 =?us-ascii?Q?nUfyKfQuOvH1xM7MJXqzhC+KGk0JsixjeD6GmOYeyU7BZuswNIRB4EuxNc6/?=
 =?us-ascii?Q?O1A6V5WaBRF5Gr3tCc8t43eVDqneTIQC1v7zCRNw+AxpCmwIeudXHPX6tZ5W?=
 =?us-ascii?Q?7TNgrZ4avXQYrZfcCO2xDcwvqQcGqyJEjPc1oh78Swkrqlp2JwWs1GQ3RZDL?=
 =?us-ascii?Q?0UplGzl9JDCuu77qUU6aF6VNjlC7BqVAB/zhHxsZWwpf0R/EIrylOdXJp8OJ?=
 =?us-ascii?Q?wSM6YYctRm+fJ0ZryPRSx2YT9s4jgK37eQq4Q8I3DxmJxOqpAU4d1zfVaLS2?=
 =?us-ascii?Q?+M65nxi+sQsaFWd6qbj72HI+EpvG/xobWKzJATKzQnuv7XkWLcLj0omNQUY4?=
 =?us-ascii?Q?ww1kwnFjiFHmdXVKZYIG/HR9jetlggCZFJ390hD+bTlevBCL437MqRfCoZR5?=
 =?us-ascii?Q?+qx4VEitoiPz3SxB+fdV065Q9Js4E9IM0HDqu55MLR7lT8mBbhXgajxArVSz?=
 =?us-ascii?Q?w0aYZn0d7/Y6Jm9sLncXShk471/ZX1rw23X9wk4VBBf6umYGs/TYOEp2RYdG?=
 =?us-ascii?Q?XK5eiICT/VGHXgCbgCH7b2uG2ws+EFXUKumZ2jDIe2LmbwMGUx2edrHvh9bn?=
 =?us-ascii?Q?QnPaFpiyUiDmSfbBMarJvTZw6CSPY7CJG4AehZuaAg1yizNNnCtWDBGDDXVd?=
 =?us-ascii?Q?hg=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7143d69a-3776-4f6e-5856-08dc8472fc09
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 08:47:37.0937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wlECXyOO4wUHD6VFsEP+ZbrPGZr6vS2FK3jjLkvRVIHJymJhe/sjHqkRZtlO2PStDY4LHTXx+BfnlWmnEaqWMKfqBRHP0QAOHoga9QEZ2Aw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1324
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_014745_311933_F9C77C7D 
X-CRM114-Status: UNSURE (   8.19  )
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

The UART of StarFive JH7110 needs two reset signals (apb, core) to
initialize. This patch series adds the missing core reset.

Changes since v1:
- Set maxItems to 1 for resets from other platforms.

History:
v1: https://lore.kernel.org/all/20240517061713.95803-1-hal.feng@starfivetech.com/

Hal Feng (3):
  dt-bindings: serial: snps-dw-apb-uart: Add one more reset signal for
    StarFive JH7110 SoC
  serial: 8250_dw: Use reset array API to get resets
  riscv: dts: starfive: jh7110: Add the core reset and jh7110 compatible
    for uarts

 .../bindings/serial/snps-dw-apb-uart.yaml     | 18 ++++++++++-
 arch/riscv/boot/dts/starfive/jh7110.dtsi      | 30 +++++++++++--------
 drivers/tty/serial/8250/8250_dw.c             |  2 +-
 3 files changed, 36 insertions(+), 14 deletions(-)


base-commit: c3f38fa61af77b49866b006939479069cd451173
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
