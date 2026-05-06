Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D9ECD3439
	for <linux-riscv@archiver.kernel.org>; Wed,  6 May 2026 17:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ie4FoBB9FexacNmrIjvnRKEHoaKZFiReqokGdKq7REg=; b=TCsLQfsyU8hdm9
	VLr0PlFHNO/PewTO1yHoxpftT129hHl02IrMUmJJc6IswXmlX7hzMU+YPi7peV7iOgFWzEU5029X3
	CzlrQdFhwknputpKmUKZwSyaG9kHqIZYJkU67bnV/pcwsz1zcyoMpnSvnmDvyC1XgeK2nTISvNkiZ
	pJHg9OIVKg8k5xjC6X9m00Aka2mJUQ0Pc5+kNkGn6h7S+52lkqmus2dhiPcNf2v+5fBIWEKQWrbtj
	L9OzNV0bwWZzLnhWrIuBA4ipvYPefhHoqFJlwDV3UJvn7buNqYGeWbDCokwn0qYXT8ImqCxaFb/E2
	FHRLtWt/BCNH5n2v2Qtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKgQ6-00000001hTh-1y0e;
	Wed, 06 May 2026 17:52:26 +0000
Received: from mail-westusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c000::1] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKgQ3-00000001hSA-410C
	for linux-riscv@lists.infradead.org;
	Wed, 06 May 2026 17:52:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hbaKmjjxL2Nx2ZyVRh+eFooQcVrjl1YnlejYDQkO8n2lGXAZqBoZMSK2FrwltK1SMhphJu044nkx056V3EGacvP5XttKdrborE4TgaiqLuMaSCUqRfYEHXzZbzzCILBVMcQdGMUgSZW1NlKWkMPX6ocQfy+4W8gX6jibZyoiJomQaecJkjVC28jHfivKzZ+VEx/Sm4BB86u1wJoptd024Q7bIKpia14orp2eJWl7BDdTjQni95f5QD9eHtxqNjs45/uI2dQi6I/vEfmIvmTZffYRw1hS61l6tFExaPHBbbdRORZqLGt2S77p9DBA5taBu8ken6RO1l94qu5nSZACZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tuRQmN/PCDSHowsH7tJWtXQHKYITGQz/qjfhBk8DGVQ=;
 b=mtOr9wn5awNlwjgj0y2EhXN6Wc1Jo1oJaUZXi3QDhlN3nX3DiNsS/rgvOhVeWvaS1ErEQwXGkmWPmhETslox0MU0ZxuR+LwALE/567DGaz5wRP01YTnLLyXX/iO2QJnfff+ejVHpqJJHtFfsczIi/K6nt3F3C6OmyMvHWn+sknwns7nc4mgMPyH07ch6IXyU+R0kuSLEl+WPpypgYOulvKut8mIV+oqRG88OfS0GhnrLpmNfTiiFDPMseQUxIOR/UpyWvOPE+PaF8iJ3/oDzBP8JXbRRQLTO4Y0acGim1HH4JWp4+A9PzjITBx59tX9FXJWa+sCOZJyn7N9I/oHfPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tuRQmN/PCDSHowsH7tJWtXQHKYITGQz/qjfhBk8DGVQ=;
 b=VLVPTcmwM2lvgdGRdjpB75W4yb6VFiHPe693G3HTZvU33UNC/fKZ+BiuY7107swpE/MXDEXBfgJo0TQrxhtH7Rh5AFVhAuH9YVFb0Vqcq8p6RObj1lpRA1+SFZSvZxsXcagLI4fXwqzK/QoA6bXwOnBuMCqML6o4yuby0NBphdxpL6XaPE0IS+b7fnebkusU7TO1T1E6ci6HLYSjykwDLtpCRYQQDmZA4aD0ne4mxdtSy5CHroFz8zngnK8ka7S1OXLHmbvH4NRpEmC+1SW4HCy9+REBW+L3EE2Xi3VZFUl/JGMw8ntJpYsiO9rmo/ywXmYFghyKbe9NqvAxnfq90A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB8300.namprd12.prod.outlook.com (2603:10b6:930:7d::16)
 by CH3PR12MB8188.namprd12.prod.outlook.com (2603:10b6:610:120::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 17:52:10 +0000
Received: from CY8PR12MB8300.namprd12.prod.outlook.com
 ([fe80::ce75:8187:3ac3:c5de]) by CY8PR12MB8300.namprd12.prod.outlook.com
 ([fe80::ce75:8187:3ac3:c5de%3]) with mapi id 15.20.9870.023; Wed, 6 May 2026
 17:52:10 +0000
From: Yury Norov <ynorov@nvidia.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Arnd Bergmann <arnd@arndb.de>,
	Eric Biggers <ebiggers@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org
Cc: Yury Norov <ynorov@nvidia.com>
Subject: 
Date: Wed,  6 May 2026 13:52:01 -0400
Message-ID: <20260506175207.110893-1-ynorov@nvidia.com>
X-Mailer: git-send-email 2.51.0
X-ClientProxiedBy: BY1P220CA0008.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::16) To CY8PR12MB8300.namprd12.prod.outlook.com
 (2603:10b6:930:7d::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB8300:EE_|CH3PR12MB8188:EE_
X-MS-Office365-Filtering-Correlation-Id: 8875d670-0733-45c4-dbe1-08deab98325b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|10070799003|7416014|376014|1800799024|921020|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: QT1t1sh4SlZEQdFqHI7CDJoE8IsG7mYLK35S8u7/GeuA9kuxLS8jRuNgXY71a2u5vJV5E3EH6mTK3Rt2dHnjJnFZFGOdOrkRppGpkGS6V9N1ensePQPU+pTAaG2ZUP9YGDmh5jRLEgpI2yLTEBDakxaKRJmAmXTgwiYpmdAIUhdv1zPzshk7FvkGp+8DXSSSFdNUoaX8He0W3PFp1Ca8Os6R4IzwFmNzdbzcoAxWHeNmfcJoUgxkC8nUlm9JTltIBRfLdPbiRBweqAemC/4Xh6VImeTdI9BVZ3RLXoUVmLcdZvEpwoKVT5GGoaRJ77d9zhJGMBdl2tuL8zSiwvb583E4R/AayRu7z0q1Buelsl3TcuoDVrZ1/VQK1qvXyVr2bbWdUa2qBozMhkU1RMRSB7eBojlFX9a7MLc4d3DlGqaOKyRLARSZpXhy60WORYP5YI8dgx607DNB0XdZ72uvCZqJ1FBYL8YfhJc0xdvxVRAv5FXDZyxEuDGf1mDt2onD4fkI8H7r/CSBmoGog9/LSkCIFj/kmF5+Ept9WG/I/gnk54CkTjSnT8S2/mz/ZoAfWqoTREHZjqY90G9FNnoeVGwXYEtclhcIABwgUGwiM4HfJJiScGaw7vsAVbYk1S+PziLS+wdTlbWocDLnLlRkP404yi8tXcNnsDQgi12W3kwcYWS5Bg+m7gor0IKUpmICAQKgLKJ02BD+B70CgdZxvLs9i24iQdEtjEEFrFVXlcRvJ0Nj0zUwsVYlfu0Jm4GT
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8300.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(7416014)(376014)(1800799024)(921020)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ac62m93fVkGgHouyrIymZYwTFyoJaD9IyuBHDH2hL2XXTji736VSzNQAVzII?=
 =?us-ascii?Q?RSYmDBwH4KiCyT7ni1TuJPnGlkVMX5oszhkIWIwU/fpvSNfigfrjk7RZKuMz?=
 =?us-ascii?Q?/TJmChmq34KFgx053QHd1jebhm8ivsW/fsBlHSfOww5RW0k+1rjOY8jtNIOM?=
 =?us-ascii?Q?EFq5vAIpBhvRIPM2Oe4EtjB5ObBaxeai7Lz/tLzDHY0EkGT4cQGZrobWn7pb?=
 =?us-ascii?Q?vC8b9Rhixr5s6+juNXNVzT+fE2nLLrUg2S1dWjentsfhfxA4M4eot02aVaGM?=
 =?us-ascii?Q?3Xm3lFLOeFht6f8ENx7Ln5V2NfErnT3qwLiGaWHThtC9JcWnjRyk4VTYZOTc?=
 =?us-ascii?Q?ZilRCAv2X2LjwAld4mhPGMPNCAHL5zF/5GoCDbZeFMkgy38V+b1e9yTHgsGA?=
 =?us-ascii?Q?hJcDx0I1aDz17mfeec0SA8TwlEhiHANr8aAtm1DDoMiBZC3Raih6E4MdyUZG?=
 =?us-ascii?Q?hu8yr6R9IpS45G7S2psh7Xtuxrs4VP0kf8u1TqN0VAiP0nWdUUCHFdjkOXl8?=
 =?us-ascii?Q?N0d8SCN2m0syMzb2iF+0Lx2C7KbrU5EAHSjcXsswXIZS/Z/zoDxZYawZ4pPy?=
 =?us-ascii?Q?iz674Nxk/8iFkCO285p/tN6CF2U9zDRDqXHdjyOfyJTOHXllPyG2v6LZDM3O?=
 =?us-ascii?Q?5Bem1LBNuZv/tpEqDitrrNwH/0pWfl3aILDMDriqib5UMjeM9TNiiND4V+Cy?=
 =?us-ascii?Q?nMNovQyv3iyUPtlj4S4knipWiRcVTXDaVj7TK9stJ3vjvNFWSkET6cydDdqP?=
 =?us-ascii?Q?WP7U9aZt1hSQffSIQhywt49Lhp2HVZU4474I/RsNhK+ZSCI/E85Lkz2hf9y5?=
 =?us-ascii?Q?1fehYROsWuNDfwH3IF3y0s3c3DAH0dUEVGt/vGKuhQpdHNu4DYMQI0HCok+S?=
 =?us-ascii?Q?xCHtupT8QPB/byNnRaeO7f1EauEkNLXXn+2FwbaW1vdOeftMma6Fw0tWpU4d?=
 =?us-ascii?Q?k8Y/G4LyZTGifiAJvBh7NAFymcTtdFCv5ykfWQi6nEccRFLNYrYIEGksX/sq?=
 =?us-ascii?Q?UjhyTvAnyGV26vYcHdYIxrFrvXQ7sHueh/KkjaUUpF8Tov1u0/vo2MufYf1+?=
 =?us-ascii?Q?fxYAIaq3HriVsqgLF9bf6vq18WE0NpDPovgVUwFRJ+bt+z6Lil6LxtzlTsMH?=
 =?us-ascii?Q?5sNVXl/9AVVIJtQHz454bAMTrm9QDi/9sJlHfkzjbBg6d8xX4jBWaqUXCq6H?=
 =?us-ascii?Q?U6NZcy65tzysg17XG664M7GRlzeFQVXmeZPK4vWKisaQbItRr5xIElEEU51s?=
 =?us-ascii?Q?3uVkoj28kA+C03G5saeW1P0029oG290vnC1b2XIRcZuS7f+b1q6Xtkr/EZBY?=
 =?us-ascii?Q?MKKrXRdvvrOMxTUgs0OGIBPhGjkvEpQkaxWmUAQmzLycpw9rNQPNbPfgAZ7q?=
 =?us-ascii?Q?sBDoo4khTS1R1yObROE8HlF2eAtUBb5WtpwgkgaaMlWvm3P8TaEytH2Mk8u8?=
 =?us-ascii?Q?Xcy+rHgbchIpFKRXX/J6PqaQU4xl8dk8HBr4DzW2lAUhYe8hYypTW6uOY7NW?=
 =?us-ascii?Q?vq0S5kdCSBcVqT7LxDrhedSUUOy90HEGN94g31Kk6UnLp4pT761vb4vsSJas?=
 =?us-ascii?Q?1UcTxqbNisJn1ZXM/awwaU1CxXWsiM/1lbQOpjZafqDLwfeZdq6tbHSqXtCD?=
 =?us-ascii?Q?cxj98dU5JrqRPKuVI1OBDEhrbLKaXl2/CK2frzBq3SZQpGFzyIFxNeeXsi6k?=
 =?us-ascii?Q?61E+uaLB+TXwsQh4/51yFUMQBVRGNcdgTrd26WzjiF43sEUrhdSesuCNf1cM?=
 =?us-ascii?Q?MyEwSXb+hy5t+XxhPOh32dnCoJHHNzAACPx5cKpO8YTbjOMYbTl1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8875d670-0733-45c4-dbe1-08deab98325b
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB8300.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 17:52:10.2815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2aKwIyHlg69qUGZowFSWp6G94bJc8WkV9Xl+ZDDupzdSywdQjGwt+4lCNl4mGDi8pb/llosLodvGjB6c/du15g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8188
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_105225_531531_CE09AFC2 
X-CRM114-Status: UNSURE (   9.27  )
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

Subject: [PATCH v2 0/5] lib: rework bitreverse

Cleanup bitreverse-related Kconfig dependency mechanism, and add new
GENERIC_BITREVERSE option to allow architectures to pick the generic
implementation as a fallback for the arch one.

Make RISCV to pick the generic implementation with the absence of ZBKB.

v1: https://lore.kernel.org/all/20260430211351.658193-1-ynorov@nvidia.com/
v2:
 - don't protect headers with the corresponding configs (Arnd, Erik);
 - make HAVE_ARCH_BITREVERSE conditional on BITREVERSE;
 - make GENERIC_BITREVERSE tri-state (sashiko);
 - re-implement GENERIC_BITREVERSE and it's relation to BITREVERSE and
   HAVE_ARCH_BITREVERSE, thus taking over the authorship;
 - RISCV: select GENERIC_BITREVERSE and HAVE_ARCH_BITREVERSE depending
   on BITREVERSE;

Jinjie Ruan (2):
  bitops: Define generic___bitrev8/16/32 for reuse
  arch/riscv: Add bitrev.h file to support rev8 and brev8

Yury Norov (3):
  arch: select HAVE_ARCH_BITREVERSE conditionally on BITREVERSE
  lib/bitrev: Introduce GENERIC_BITREVERSE
  MAINTAINERS: BITOPS: include bitrev.[ch]

 MAINTAINERS                           |  2 ++
 arch/arm/Kconfig                      |  2 +-
 arch/arm64/Kconfig                    |  2 +-
 arch/loongarch/Kconfig                |  2 +-
 arch/mips/Kconfig                     |  2 +-
 arch/riscv/Kconfig                    |  2 ++
 arch/riscv/include/asm/bitrev.h       | 51 +++++++++++++++++++++++++++
 include/asm-generic/bitops/__bitrev.h | 23 ++++++++++++
 include/linux/bitrev.h                | 20 +++--------
 lib/Kconfig                           | 13 +++++++
 lib/Makefile                          |  2 +-
 lib/bitrev.c                          |  3 --
 12 files changed, 100 insertions(+), 24 deletions(-)
 create mode 100644 arch/riscv/include/asm/bitrev.h
 create mode 100644 include/asm-generic/bitops/__bitrev.h

-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
