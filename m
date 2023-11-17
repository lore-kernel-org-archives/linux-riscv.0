Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99B6C072A2
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Nov 2023 05:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=E7D3JkuPkhvo/+MH82aZrdsiSUY5N0Oi8VThixJSAtE=; b=jpjCPEI4TfbKpI
	4nZjhEiK2zKjAlv8C8DPoYB0xO+o896tVQ/nUGfzRjebvRb1BS1UcgND5dI76IS1A3o2+m4v+HYtN
	D4sX+nch3gaRMaccDWjskYYiRGIeIecZRMug3fi/LYl0hWlUOYlH0Ukh1fR1roDF2l7vjCH9YmB0N
	E/vSZMZdjiFzJu/7OIPDIN0VY0Qwwg1SHk6ynxehZ2ThuIM5/fk97resKl6h3aUscMxUBRkSdEQ2A
	WP1CrHsgyRAiuojUjbr1scppdmTEiL3n2dUtoHhtbCUwdz6KTP7Xv7U+fFPm78SGIeL4dN+EWJ+T0
	cAUPUFNP403dUUrQZnPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3r3Z-005e7l-1n;
	Fri, 17 Nov 2023 05:06:17 +0000
Received: from mail-co1nam11olkn20819.outbound.protection.outlook.com ([2a01:111:f400:7eab::819] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3r3W-005e7O-38
	for linux-riscv@lists.infradead.org;
	Fri, 17 Nov 2023 05:06:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h4U8TyqBpgFcgQk6UuX077eUgvhUJQj8UDRccApgF2cO/vWYqWp5CyVG8ZYiyDhO7PJJ6Pp+UFbPf2kgXJLWoLU409jgu/rkR4XTlRbNlmOxf9Gzb6qPOF1iSr2r2saRlili3DW6FbZ+6fy0b0npZew1RGDSqAnJqU4m6f989JiVttviCLFv0UdXgfDqJPkvs50SzQt/ERhBvueJcRLERm5fOoEZ7kYZiaxBUMHlDxB+WR8QhVAcW77/G9cbwQ8q484cjVK33nPX+VyStlH56PYGrfuonil8URG9nbEj3t+HEuiFAv5J1evq4BA1eoipPQLfb4KBmLT90DvKPeDaDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aZDvxod+fhJDS1Wb5bFQaLyIiD2jnNhJyD53lHp+x9c=;
 b=DU8FSqpCNvsCjrLvyCb2gUoCW53qeR84UhNdXOWtcchsVA0bOYJEPENVbeKPyXNryp6rAuCArZQHU7dQPqTyOG5m/KhKm4e4jZc+r8vLsQHB0QbklT7WXHCrkEEsRJPQvJDrY3Uj6Pw6vjFputbxlX/8l/GeETuIH4qSJAPL30RefgwaRxCnK8GsXwDIrtn5o5XzaS8lGMy3q48sgfl686nb6dakIUTzn/k7TCs0WWOb0mAsbXcMX9NfK3iVuflK1TtwkHP4aB44L7cvn4hIrCxzSDH/WuMaH8zWlF7mVbWwUyqYft/LAyN8YKTDppqXyYl40u9aZxLz9h1qDBaJuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZDvxod+fhJDS1Wb5bFQaLyIiD2jnNhJyD53lHp+x9c=;
 b=S3/KUG3q8frNH1U4BH0379ahY9t67kGeAOT3a1usYdf0EJoV9DYz80JRv6k6DQC+zkwuhz7pZOKOKQbi+bmMAQ/UhiiX+hC2VW9MfOman/QJ849QvQzteI7OXqw9QDMRGRxB8NTJ+wbYZcTxiJCm6kXtWfJ6SpePczmTRJWVfIoliDnrkEz6BZxLF2M9tNunBeadBKatFf/8Tcs6s65+d3ZjEH4UKmMEIQBayxahaVDopD5h3BZnPopgOWrQcnTp/B9jR7/jj/Vzku8gGSrFckMj/xh4Vd2Ql5akDUKp1R8oOLcC8SQpFfd4RqcBXqlJ1oO9M0d4YxygQk87alRSzQ==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by PH8PR20MB6394.namprd20.prod.outlook.com (2603:10b6:510:25e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Fri, 17 Nov
 2023 05:06:07 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::55b:c350:980:ad8]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::55b:c350:980:ad8%6]) with mapi id 15.20.6977.029; Fri, 17 Nov 2023
 05:06:07 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Inochi Amaoto <inochiama@outlook.com>,
	Xiaoguang Xing <xiaoguang.xing@sophgo.com>
Cc: Guo Ren <guoren@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 0/2] Change the sg2042 timer layout to fit aclint format
Date: Fri, 17 Nov 2023 13:06:50 +0800
Message-ID: <IA1PR20MB49533488308F7317C28AA6BDBBB7A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.42.1
X-TMN: [ivQZMpmxKAZTPS3xZ8to1qPI14fyfCm3XL3SPVlHbvo=]
X-ClientProxiedBy: TYCP286CA0338.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::17) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20231117050651.870372-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|PH8PR20MB6394:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b67e0d8-964e-4275-7287-08dbe72ae7f3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k3gLWTZRq2yw2WVWOxutNmKzJ8ffH69ATmj+p580+4RZFsyER4gUIZLJV9ZURzXcL5OIECp6yb1/oyqBM5zdfZng8Pre/lWi7nfCfQlsF4AKwtfZ6oU5eitR2/apSiocFmVOW5yvAnwkrNxJvScOi/7gWTLBVvgJW4cGCjxpGdLv3TwGu0aoZSk/lsJXNCaFvWExwIuIj9/RjP3Z605zTNLniPgbewTO7Wn02uG27ar/PJXmPpmzfV30BkSsrAIOEeeHQW4agTLuJmNXLphWmVK/gHxvb/GYSZ7c8tnzyGTMjwcNWYK3kI6s7fVI3AHRU+176vT71uU5isEO9pSKspcrT/wGSyr/EbXMqCN/gwXDBUUQZ68vVl33tNiZTONJcNJ2mSPFrDPxLig1q/SUHsvZg1xlvdGSWG9YoV36i43/gsA+YcSEc5ZIIQ4wqcFjVEQAWPKMWpDkb5+Qkcllb/3boiyBPIOQTuMohkQdhYDbj9Y2KirThxGiSp/djBsLde64buwGWqHuydYEmOBwHzgpRQ3xQ1YSeJTD8kbaYZLRFh5Ycl8+LdnK0kRWzH3BR77DYKH4MD3ZQMvObPZc4rNeOvUxvF3fcNTej2VIlNpZoWKR2vslEhSSTwSyT49Xwg+5lkuBTYHxXNW66msHiJJM5gnyLrK2Tln7Mvyl49s=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VtmauQ9LcMkgzT9ZxCG/mHJMxk1mFVY/v7Tq4HU+ZnbGRVsqT7UPDypgqMJt?=
 =?us-ascii?Q?SMd2cnehwS82HA+QZ8OuRFhwNy9NKdeLKM8SuArYN13eShEB3ozwaNNKZlGd?=
 =?us-ascii?Q?CBt4zNWYXu2pEN3XJZ7K2GiYHuLQPyavz1eRhncYsNeYrG5lXnPOLFPKmkFx?=
 =?us-ascii?Q?PTJdni1CAvBiyAvCG/damu0MrXLDxz1WEFtPDfzlqQjGeZzZDUDFtXA0DaMm?=
 =?us-ascii?Q?87iwfqxRhex1W4m0ybjIruhzSgSTUZ4kgYYtW2AhxSos5qb0dTTEzTcfceYP?=
 =?us-ascii?Q?g6iiGZMbMzEDcd1cRiYBmovu+6+ITVdJjUn9KKIZ25kcnSQMJw02X5y0dyvQ?=
 =?us-ascii?Q?uNf9CEVzDuxKEZ+jtfi6Y7reoFQuv1/D09N666YLWVi49SXrc5D2EReO5+5j?=
 =?us-ascii?Q?bKW5GGgAZ5LG8YUVMIHVOWCPlLNlQrBllTwtDuT4Y2LQb6hMLn6MSUCx9bdw?=
 =?us-ascii?Q?odNNK797IU3q/I2esqiKxjZHhq+VTYqi2dPPCbJyNd+tuEKIcRd0hbINMHDd?=
 =?us-ascii?Q?NDxAG0opiVvTd3JozWzGwVa18eIRc46n/hW9yacbsT6U8lxZagg/WgwRQk6c?=
 =?us-ascii?Q?WJ6ukSobkL/4OTT4e1TCEhry9OQs0+ckuJcH2AP/BC5IQtffFHtSgUdCslAo?=
 =?us-ascii?Q?wJ6HKcxzVjLcWhHzxwNWOLaROobj32l8xcL5BH4z0+QK+AolNg1GKMhclG7A?=
 =?us-ascii?Q?aFiLey2u6ROPaGc7duqr5XYFlgbT39NWgjwIYfjgeqKokCbxYXk+tCowQQlx?=
 =?us-ascii?Q?LqTdgBHFaOXVyRhS0MdYXfvHAbSTMT74UOeZzz8qiP67s5aDvOSmCI62OvMi?=
 =?us-ascii?Q?Mr42vscjtERTE9+PU9FTMVs7hpUasC26RDiXUupHGs2L7EtA/tnJyAk6/9K5?=
 =?us-ascii?Q?XI/0A62GhiRJJLA2wYc3Zif1BDSXMaC4qUu8Sxc9eHmZmfh/3FsdNQRKlYnr?=
 =?us-ascii?Q?Je5cIQjTMf8RnYP3WIh9qQFSrKTXBMXiTnTo0BjatQqZZLoCT71S7+Z0x1cj?=
 =?us-ascii?Q?IWeb5JdAz4HvROpPjoq5Z7UgxmSvD0yWooZiDrj1dg24cvmqw23qK4109OLq?=
 =?us-ascii?Q?YpAWp+zaZS8kJUMG3x4N0jIfhVwTq7Gp1i33kjUUWqqB0W6B8mjZPoowtn3t?=
 =?us-ascii?Q?fJZSeXB50rJnQywLPakL5fBgrN6KzcxrIWg1RWmhXwWO277GwGs55aRyBs8J?=
 =?us-ascii?Q?GQUjJnrYp9RV5cyVpJSjnXcLxWiLpHyUfxm6QkyyH3Z5dAwwk3CcXKzxIxg?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b67e0d8-964e-4275-7287-08dbe72ae7f3
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 05:06:07.1465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR20MB6394
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_210615_031859_DF9B19A3 
X-CRM114-Status: UNSURE (   7.82  )
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

As the sg2042 uses different address for timer and mswi of its clint
device, it should follow the aclint format. For the previous patchs,
it only use only one address for both mtime and mtimer, this is can
not be parsed by OpenSBI. To resolve this, separate these two registers
in the dtb.

Link: https://lists.infradead.org/pipermail/opensbi/2023-October/005693.html
Link: https://github.com/riscv/riscv-aclint/blob/main/riscv-aclint.adoc

This patch can be tested with upstream SBI with the following patch:
1. https://lists.infradead.org/pipermail/opensbi/2023-November/005914.html

Changed from v2:
1. Use reg-names to map the registers.

Changed from v1:
1. change the commit to address the reason for ABI change.
2. remove unnecessary link in the commit.

Inochi Amaoto (2):
  dt-bindings: timer: thead,c900-aclint-mtimer: separate mtime and
    mtimecmp regs
  riscv: dts: sophgo: separate sg2042 mtime and mtimecmp to fit aclint
    format

 .../timer/thead,c900-aclint-mtimer.yaml       |  9 ++-
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        | 80 +++++++++++--------
 2 files changed, 56 insertions(+), 33 deletions(-)

--
2.42.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
