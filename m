Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C084CD343B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 May 2026 17:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dXbqqmwm0BdcB3gICQJqm0fGKbHyU3g74wBnV6w6C4Y=; b=Dwwrz6q9etAmLQ
	eWHWfeASi+8RPTClH7yZQozwqQIhyU1qn2US69eIleDHZYvxi8L5fU9J652YyqF8nNKcJrLKoovnO
	Y5VH3dSbOQTz8yIIWyfcYTWZf3uUXt9nn74Mwl6SkRPE1t5E9eCQoRc55CH2+JTyjizbMqW9koMeH
	ittHKrMxv+NC5cB8/K9aX3vKo3GA2uyrA8rufkRGltE0cDekI0x57Or4kWLYa6drqw8bYNdpiKmOK
	p1DE48hotLF9G4YEvuRgXGuMXQX3DQBB3MAT9+B2jKBKTcDYbqC9is2pP/CQkFH/eVdpcR1/OoxjQ
	CL65N81QZpyMOyGN8gJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKgQH-00000001hbn-0pef;
	Wed, 06 May 2026 17:52:37 +0000
Received: from mail-northcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c105::7] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKgQG-00000001ha2-2Jlb
	for linux-riscv@lists.infradead.org;
	Wed, 06 May 2026 17:52:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FgFs5K+a4FG8nvwPUR3js5iT3cPax2RbvCPKpBzaoyN0WVs6jEsKQBofvaZkIabveCU2aE4yD4TkwQR8GuetfhbQybZkRo8shp/TG350V9NKdluBEdSrILdjVwQwYIASNf1xpxL3CBKHbBohidKBVv8Mt3It76+ZgrK5RMzLvIOjckv7QrYeiGZmLAvqdHc901a1RNOkSLG+73ymGGc8seaDGVFHMRdqbTJG5ywIy74pM8PWgYRatsT3lfYu2+KgkRiNV+uKuVwA9ef1skQUoOzPeHlL2U2fWkymYucUPH07AhPd6UsfJy0mm4k0zhoLYcFIxSWm41v7sTtuZYXjXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rjLdmuVFsTJpCd9vUHhgrSn0STluKHeAeW5Jh+X5OE4=;
 b=dZIoYHljkE7mE4MLxLoFVL9fifU1bEFDprREGqYjY+AlR1WhjOY+Sm1LkiRuqlJ97thE9NFTuJBcFLuLHJ2B/wp4uCEKEtFaejctzb2iaipPjAUrgHIsW9tPbSK/h3fV2eNu9jmsI8IYfHxElUQLXHhps5dosned1Ct6o9PMeYaZ9OYO3z9/ltzQpafdpnGwLaTj3ytmcO9Ga5z2dOF/OGd7UKPYdhXJiizYiN4mF8yB0VmCCPclg1ZdZUZzPic4pU8EprQzFtIEvy4IKGmUGrHrUljyY7u+C2WzSj2i0xgNwcDC7Pl7Sd29ywFxHtzhigG04ep3ObQbotACz9+8kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rjLdmuVFsTJpCd9vUHhgrSn0STluKHeAeW5Jh+X5OE4=;
 b=R1T3KgVVaTN47CxeVpwahVtQJQSS40ReIKgBz5cqsMC4M89aKqt90NTpSeiM9o2WQcYW1eOWWaoYQcD4mFtt4L7F6Jtft5xR3a6V24crZpWNiuj20+pehhrDhGsDde+2h659jlhO0Bekog8mhNYCQ8iZMfwrqM10gd5PWLcJwg1ieBHB89Xe8ohHK3xUHxAXvJV7cBKut5Sw97OUhlX7caHLGlgC/Z9DbcPAB/er46o2gezMXjUQXmexbjexzV8X6kCCt5PqO72DsZwZY9VO4iW6V8t65isMZWmjCYKCEtT4/nVQTCwKWKIK1OXq+mo5APf+nBUmFPcQch4TAnKgwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB8300.namprd12.prod.outlook.com (2603:10b6:930:7d::16)
 by CH3PR12MB8188.namprd12.prod.outlook.com (2603:10b6:610:120::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 17:52:26 +0000
Received: from CY8PR12MB8300.namprd12.prod.outlook.com
 ([fe80::ce75:8187:3ac3:c5de]) by CY8PR12MB8300.namprd12.prod.outlook.com
 ([fe80::ce75:8187:3ac3:c5de%3]) with mapi id 15.20.9870.023; Wed, 6 May 2026
 17:52:26 +0000
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
Subject: [PATCH v2 5/5] MAINTAINERS: BITOPS: include bitrev.[ch]
Date: Wed,  6 May 2026 13:52:06 -0400
Message-ID: <20260506175207.110893-6-ynorov@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260506175207.110893-1-ynorov@nvidia.com>
References: <20260506175207.110893-1-ynorov@nvidia.com>
X-ClientProxiedBy: SJ0PR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::30) To CY8PR12MB8300.namprd12.prod.outlook.com
 (2603:10b6:930:7d::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB8300:EE_|CH3PR12MB8188:EE_
X-MS-Office365-Filtering-Correlation-Id: aaa5a79e-97d3-4849-bb6d-08deab983baf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|10070799003|7416014|376014|1800799024|921020|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: uRJxiF1NAIvbCVNQ51gY9jVxpCCap+MmoDB0VOmWCmTVkZE0MLg00Ngz4QuSeWZrKqrbCBkRmWEghxqDLJl0I8GII2imHVm/1C2irMqriy1RoBra8bvD4csFkKFSySK+6DBSwoNux8U5qZ7jSWN+s124+C0WHzVb5ewD6qnpry4x2LcGQdouQ9fmVtaDNLx4WIcTVMU5mL+RodsQEwej4U8uCHFaiBPN0vfXlC0sm+F9oz1RPnvn/78jgxkHz4t6QcqvIduzOZgRktouSpGEtQfusJmkiA1xKfJszJFb8xCWRoQ50Nz6UxM4QNLb5MJH08Qn+JYPZf4SV6Bx8wwlUX8kOV50bfq6PPHT9zQe7TSdxDmGeiIizvQbrzRBLg97mHredXjExi7qBpIRaZ6PX5DtH5n09mJPgFMZuvqqFoDu14vit8AIvsPezdHMhPhCpcbUrpmrG6dMGi9xazitBhsOnLZuACRgEou+x6lLtT8KPHfLihv7nCQvqEY+GYqJOuptsFEJPWb4LBGoLegeYJbuQnJUia3po3NsEV5askcAAmqH6ngq9JjFvaQKLFJHzuzYcXZdI9QFJrc6tnAgb2S+3Oz9K/jMuIbVliMn/fYAInHc56VScBKx1LkYP018BebqHE8JQISK28PVSytNt0F3YZW0RhjnJ2Rj5y79Ib1lFFnm+XGNKxpmCAoc7G8/wUq5XCBnJdBU4C7TmZB3ULR75UR4oRg321PdtCPJXP8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8300.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(7416014)(376014)(1800799024)(921020)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JJjP6wzLl2E7JjNOkYctRay/44ByKMv9v8+/2CgjDLlAcy44B0hRdbAN5wFv?=
 =?us-ascii?Q?7EckJv0s8P8FK76LejpPkMHZsHQ+MSFYk9at2+jxY4sE5cf6ejEJUT5hN2WW?=
 =?us-ascii?Q?TVTWA5xgy1tZRRBOruhRY3IlGCELQLE9fG4sk24E61M29lNPYrfYx1XxXGiX?=
 =?us-ascii?Q?hyXnpR2ma1TLtnzQegg4h6JhvdWUjNxIpkkk3Xd5PSDtItjn/0GEcNbd+VMQ?=
 =?us-ascii?Q?6bzOxWmRGK3KqeRFmglCWJuvdCVJyvLsLAVrtDUP18cntyOyIMr4CtR01fvq?=
 =?us-ascii?Q?AoEIeMyxZwjdN3nzYivc26doU9dP2ENszkd830mNc7F5VYIWQW4tt/mkArf+?=
 =?us-ascii?Q?55zHp1iyzT5hAGRwZ5R0GwNWk1lChBpv5kiO3ihdEqGIwTEF8upia/qj3DIF?=
 =?us-ascii?Q?QlxnODDiKbvetUWQVq7ok7TGBLgPMfnW65Ulo++YSb475t4psB6cIs2y6ga1?=
 =?us-ascii?Q?isuWcsLqO3fk547NxS0Zj/VwKu2iCOkD/05gP1A6uW8x3nou0TJrAlJbJsaz?=
 =?us-ascii?Q?pNO+iYauql0MOIDcjrq7m0WvyO9edl/86RgPTdxEPPg+e169yfR42vh4OyiH?=
 =?us-ascii?Q?+CGlh0XfPDO6GAF1e3uEhBz43o6tIYfuxTmQ8XhGMB1tW86QvG9wKAEwVZvW?=
 =?us-ascii?Q?K2eS0/kJ0JVA63sCMLL1PZUNCIOCXaFxh5Asfa0Dfu8JUTtpS5AxAGvO6XwD?=
 =?us-ascii?Q?IaT8yRPFkayiXEssITAbUKqpva2uNgei/r06YVtEHYXBfrl2g7wAkoVfh7bq?=
 =?us-ascii?Q?78bQO8/emIfU4BqmezdI+yDTDNbcLw5hEdpVG9ijU+6v7mKPKqF6TmbFwAq6?=
 =?us-ascii?Q?/B+iLy08Xz+5g60r4hZm9e7ezlzDSGDhkbVFdLW2+Q7pipKxFVSmgew2BPT6?=
 =?us-ascii?Q?6CnEQZiukRoqgbv2yLzCTKK3kuqWLeEFVLCQgSRoUUldG0i7KmqmymZ1Dv5Z?=
 =?us-ascii?Q?WJZUoaKxHeeRdmerr+LtHKD8TQexegLiEpIXtrv2uIJ1ilYnWPTrtLQ+Lg5h?=
 =?us-ascii?Q?lk713hIBrb0mk2zf/wSEpEtywzwoSLoYSTL9GIO7O1/9q/BS6TiYctOIU8Ck?=
 =?us-ascii?Q?vibTKB10FZiRhyPg35o54sqjAcLf8LvjPWgd4NhjWvKt5HHMv5LBZrC/o3xi?=
 =?us-ascii?Q?6HDcGmFBEswJrSFmdxJyEXOTp8LcFCoI80kLE8n9yeD1fNxplUb/NMEeaN+R?=
 =?us-ascii?Q?lAmmh+7nC+OWOcb/LqqNjeYcwDnmznm1rArbxKbqLw9/yy+BGN7sc3E9Ktyt?=
 =?us-ascii?Q?MG74HLxjFY40/d5DSS6yn6HrNh67f5EhaIUmBDLhYeFoBqIC/XPKC7cFnZ2n?=
 =?us-ascii?Q?owdiwuwxcBnX1XqN21W4YafPYclTf73+KikA233QDs2wgLmftP6OGxUO+lqK?=
 =?us-ascii?Q?Q7T5QDy8Y8TYfZ8EptYZEW9xtMv1JJ3FYvDJ4/p9BnAch6j24ypj1QelbaoW?=
 =?us-ascii?Q?N3+Rv9tf2CD9GxfDBlg/xSXtMOafpFTuwA8jq/L5M4hp56ecaQnG9TzkiUPn?=
 =?us-ascii?Q?+rMBUvGu2wLMiUfJbNdLbbreJ75yZ6v1x4LsIF/oZ3nMqbnm1ajQXytJULnU?=
 =?us-ascii?Q?POyehpXWk4Ganpn/gehT/68hxgy+UHBgfqOYuqZnZmCkUF9ozU5a56++CoVC?=
 =?us-ascii?Q?P/n9sClRl8AX/3mZ/7oN92iUGv2MMlHXu7FNhovTQ7aw9+ufChyI95KWW/RX?=
 =?us-ascii?Q?jWjVvW9EU4vAEErJ8a6dnRbNbHhuXeVV7mVQwAONGZWYmvT2ay9MiofrAJT1?=
 =?us-ascii?Q?ZM3va6Y5Wx3zwlx+Pxnp/VAm+3JBoCOV0M4lNFyBIgVreZJsdLS6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aaa5a79e-97d3-4849-bb6d-08deab983baf
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB8300.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 17:52:26.0093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cI9bYlRHWHKi4lAuHwQn5DIA4N1MH36w3+ZfQ+J5kda1BQo+qJJ+SG1VskJcw4l2AOv9M+Izaa2oTTjRKgNUDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8188
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_105236_595909_C7E3F52A 
X-CRM114-Status: UNSURE (   8.62  )
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

Arch bitrev API is covered in MAINTAINERS under the BITOPS entry,
while generic bitrev is unmaintained. Move it under BITOPS too.

Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 882214b0e7db..30214ac2f06d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4549,7 +4549,9 @@ F:	arch/*/lib/bitops.c
 F:	include/asm-generic/bitops
 F:	include/asm-generic/bitops.h
 F:	include/linux/bitops.h
+F:	include/linux/bitrev.h
 F:	include/linux/count_zeros.h
+F:	lib/bitrev.c
 F:	lib/hweight.c
 F:	lib/test_bitops.c
 F:	lib/tests/bitops_kunit.c
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
