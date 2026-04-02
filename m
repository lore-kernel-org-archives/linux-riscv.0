Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B7ECC6B32
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Apr 2026 08:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EITV89Fi0zdL2v6WmVs1GjH1H3MzMYe75PKuJzTAO+Y=; b=MjppDNH4pqkxLE
	nkhhHKu/N6xn3+sZXSFAY3MbvtGNf53O1Ef0BAcq08bnY+8LVZq7f2xrnipJIbrhKZ82c7KDQqrs6
	ovP0BITXuJRiQGVa/yBwsklccv4jJc8mBFHRYDuR8hE2iRpF80YN4Tb6o2LubI/iC68UG7qeT8r9y
	bEw5p9M6Yw7KDdVVrPXj6Ea48LcV1LO6mMAngWClvzqBrTX17zWspuQUgwz287OZxYEKv7v07SbzN
	Zbk5IP3p4PYJ7spVi/n2BaA4xFg+q/lEoZHYP50CGnriwRz/ZWFiXTIt9VvsVRo8KI+9WrYjCYqS5
	33+NBJ/k9FTsTD/wfphg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Dbn-0000000HBkG-09nR;
	Thu, 02 Apr 2026 08:40:59 +0000
Received: from mail-bjschn02on2122.outbound.protection.partner.outlook.cn ([139.219.17.122] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Dbk-0000000HBjI-1xfx
	for linux-riscv@lists.infradead.org;
	Thu, 02 Apr 2026 08:40:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MvAD2f5eQyaxY+ywJIfiHaaRcZ72g5+wqK118W7GNl+IftyKTVmf8ysfa2AWoDmsg2OrqwwjNBlxifz2Ul8Ds9vF9Z9HTRqNdzNFRs1nMiGueY4LJWl/VTh244Ac/uST7F/MttcFX71qyrMhQdp7/GSFgBs3z2aaN4XjUV//OJA+DWnmrQEHwJmni9M82mkwSPIbXkxOoMW7z4XTTCSFQmHLyhRtf5S3qcRBY7WR4O2+6zmxyqu4cSpTAvhuSJZnnaxip8mXbNUmv751YpTWjeN/v9JnGkW0qa0glH79FCycSqreFsmu0Ow0WdCTzaZPFKkSNdx7J0D1kpdeuLgkuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YNb5vsl5zlAF2//LjDcmlSqYquZ2nIfQnAEZDK0IHDs=;
 b=T3IWbpp9CPv+Y2RVAuK7om9pTJLBms5rPi0pB5qWlYMkssbttkg9jQh7dhsUc0aZ2kj+8wZ9ktxF0Gll3wQtKXAvbOcdNMzcQTCtubFhWcV0HOoCeoLfM4U2O237P2GEgU0L0dMd6NiubLs2uYptynJ6bsVokWhWrDze8gO050k173ioNHQJ1bezPNfd2SYbM9QoxBSjvBr43AwFFflA0JKxHGVyU4tffJEGf5UiSN3fZdoIVYlqKMBma8V/14oiDTuRkGB5JgGZijjMSbhaxvHQjnCjmeZaaMtrK5K6ktMaxnjzm5MqqHhsxwLeLCud+oZsb8pWq/SU7jaFzBo7EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1235.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 2 Apr
 2026 08:40:32 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9769.018; Thu, 2 Apr 2026 08:40:32 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>
Subject: [PATCH v1 2/5] dt-bindings: timer: Add StarFive JHB100 clint
Date: Thu,  2 Apr 2026 01:40:16 -0700
Message-Id: <20260402084019.440708-3-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260402084019.440708-1-changhuang.liang@starfivetech.com>
References: <20260402084019.440708-1-changhuang.liang@starfivetech.com>
X-ClientProxiedBy: SHXPR01CA0023.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::32) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1235:EE_
X-MS-Office365-Filtering-Correlation-Id: ad1a1492-a5d3-4e19-a436-08de9093808c
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|7416014|366016|1800799024|22082099003|56012099003|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info: Woyqrdd2k/WbLGYpgdTIV65PX9VPXD7ky/DqDKviYmNvQ9GXYo3Go4godt1O26kh5RIBvbDAfXicbEwZeQLvQzpyd/7oRrhvEF1UG8tROOv7NT4uAvqqpKrqlXvSKwmH8R/PkhVOoG9unldZiU8iC3XE47BXV26Z/dZmKHwNStMnS7hbTsCfV8qI94nLgMM9KDuYAS1VoLC4X+8KVLutOPhvTss7okOHIMEKDYwH0/mlgMe+G8t5DpGEqcwgfFtkC0AiGRngAC2cen8XVU2STISuS/CiAK2SkSq6I86GWFp7kzeA5n0ALtw8HE4Wolt0rPoz5JP4Vq+PCakq0+WlZG/v5ZskdzyAtpd7o+DrD0RPbxxUg4j8EAtsMcP943ug9lYHUyuU4jutM7SyHQ+a4cuSMsAOKJpipG/gz128z6hGxz4KqUVSZvSqjCMAcQ1TVXVMA5+nzWKqXkkrAcE5JBd5KYGrSf+iOMYV54RBDsbRVP04a3Egnc5GEjELHcLz7+eYqm0zDoU6o4JdAA9oaCsFgDBVs9kO3t4ZfJGp8VsjtY4Hb/C6rBoNj/x0myMMwTugx1WrrMUO2Ryj5l/ULOnFZRArQ4ZI0lxsXvPlK88=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(22082099003)(56012099003)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gDkSdYZHUW6o+QlEWaByfuJiPR4z2G+oKpmXAUQfUkLHsDXNaKxIPTa9iytB?=
 =?us-ascii?Q?mKERl7zZecuiFaLjql+y9OmHPK+/I0YwZ0vrVCj05ydSe6d/vSgYKhBveo0Z?=
 =?us-ascii?Q?vnjw3naslS6t9kMIhvjjwK4aveD6f3EqwBzE5kq7lz76j0U4OnN5F0Ngyglr?=
 =?us-ascii?Q?01ekGnSs6omZ4zyg39jnbYpu9IEvqs9uV8T69d0W/H0+9WH06uoNzX56ZYkP?=
 =?us-ascii?Q?vR/7I7Q/avpF/pUBs6fJlsZb395rN8sZmDuMsbkSLi2sfjRReWEMhCiUGAmN?=
 =?us-ascii?Q?H/CukKMwsXboeJxmmu5TjAiVEuhZrt6ViaiFGAMpJUSS3bIPHAlgZvRIR9AE?=
 =?us-ascii?Q?Nb/t9gyAxtxpjjI3SqR4pPNdo+hkIIdfQCJE22hbnuaWmdwSiyZofQKwHjCl?=
 =?us-ascii?Q?px5uOpiSiCBZisJWxjeGSbH/VvGv1MyxtmdaeLjgmebGPWz/Qb7tphnhIT/f?=
 =?us-ascii?Q?1r7dKClnP+vYH8yHocgPRFD7cEyB61846JeqOIVl5QJWAC7fCZF1121hSzpJ?=
 =?us-ascii?Q?cqz5eejiig61fjZUChNJUa8XUY7k6POS6o2pHB40RpdaD2UCM+7R9atYdr0o?=
 =?us-ascii?Q?h7zFI45BYsQwVq/QZ6pkNzX99Fpb35zNAXDh1bHCLlXHToFNylZ6l8AaY53G?=
 =?us-ascii?Q?5G4wI55ZSuR/wNxTyW+1wBGtOIFOkjbdGX6ihVZbAFgyxbK5pYkK+MmCbvYL?=
 =?us-ascii?Q?esfDCTj+htPpyBQgah0i2CXKDoZO0CQc+ckwqkZBsVdKaBzSVgRnVQljk26H?=
 =?us-ascii?Q?aeyis3i+mNt5XNNw1B+RpjZbg9xfzkX1s6kF56V3CB8hjcC/6GXQx5AazD68?=
 =?us-ascii?Q?lzpegk+GfWEw5vbx87d1JTwJtGTdfTY/w8BxLEvpSHSC4cjqgKRoinMwUYZn?=
 =?us-ascii?Q?bbX9c+PbhsK1R0X6MhSEUojxHKmQV1MrZW0eJMS767ocuis3638R84Z0oJ+b?=
 =?us-ascii?Q?GuIkquFnrr28hpXUPAs3AJktrjhyZCxSTERe4JEPUZv34MPtLrr3JVniBAfX?=
 =?us-ascii?Q?XnkpmhAjU5wJn/mskwDBvHswbUaA5PFyuLk13Y6jJgxTg+qpknnkYssu8YY+?=
 =?us-ascii?Q?NsLJ6AQkm02NE+XNwbOVtgIyH1L8/QQv42l62K/S/3qyrnjNvncmPZ9ZbJUn?=
 =?us-ascii?Q?tPssEr07nsT+/swi2IhrXAIFVMt7r/iR0uLBOB6h1GEQExwK81Xc0AaWlX8f?=
 =?us-ascii?Q?ajDljg5/N1Mt+ZKudOppceC/eucru438i3H5Cgv9bAs1dv8ObLW2FjLc7eb4?=
 =?us-ascii?Q?YCCLztl0Erxza9OtIrNGbD9ej6X6byzyRo8WrtxFUty9NdT9gJgGrPba1alC?=
 =?us-ascii?Q?vNmdCRCh/BzWFof1mmPRHaTYw4ALXZvZrjvMFJm5YVYL/gVUWg6UsrWekNpl?=
 =?us-ascii?Q?5jQdVoeM5nn00bQyIJTbhDWrat6j5E1ZrDfoGHz8gbgVCN/6BG8/YgfaXQKS?=
 =?us-ascii?Q?k5TKz81njBTEOT0B2BclCmZVXVz/jutLP5y8A7ucSemgbklxIGPkohJH7Fy/?=
 =?us-ascii?Q?B13eeVnxLpG8t3ZSAE1anfOXWDZPVHxtd+jP0xFYYk+J/nunAmeEAeqsCoxp?=
 =?us-ascii?Q?a2zV8ZYNdZ9nUmFFfO15UNPzpxpEIuCEud25bzzfMnRymOkxrPWNEjYtCA+l?=
 =?us-ascii?Q?I+qZsNbkP9jhV80L6DyEjLnDYXNMagjDjjeq1QFG9Z2nR7szeAAolcFdrY6H?=
 =?us-ascii?Q?ASnMnuNQxME3nBoKdGx2dHD/kCXuQen6jWUBeFgJs3W+GyXu71HSPBUABLbf?=
 =?us-ascii?Q?jR2Dih61voy3d1MI2kbOdJyXNMpWztoFN7g12q8ESmbhOwpTwj7u?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad1a1492-a5d3-4e19-a436-08de9093808c
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 08:40:32.5517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1x+hwmF8hxZ8z85DhIIXBfhTLWZJwYKxAhi6OjekUd6ID6KjRglzdeoIDyOd1Zy9L2PY5EEHdcHHLxhRm9rzBX+gslXCKQ9XBceJ/fOJ7rl/YCHJ/bk0jfkp182Te6Db
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1235
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_014056_506740_7CC7E535 
X-CRM114-Status: UNSURE (   7.11  )
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
Cc: devicetree@vger.kernel.org, Michael Zhu <michael.zhu@starfivetech.com>, Junhui Liu <junhui.liu@pigmoral.tech>, E Shattow <e@freeshell.de>, Ley Foon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, Joel Stanley <jms@oss.tenstorrent.com>, linux-kernel@vger.kernel.org, Drew Fustini <dfustini@oss.tenstorrent.com>, Guodong Xu <guodong@riscstar.com>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Darshan Prajapati <darshan.prajapati@einfochips.com>, Yixun Lan <dlan@kernel.org>, Ji Sheng Teoh <jisheng.teoh@starfivetech.com>, linux-riscv@lists.infradead.org, Hal Feng <hal.feng@starfivetech.com>, Michal Simek <michal.simek@amd.com>, Changhuang Liang <changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Ley Foon Tan <leyfoon.tan@starfivetech.com>

Add compatible string for the StarFive JHB100 clint.

Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index 3bab40500df9..387086bc6b5e 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -37,6 +37,7 @@ properties:
               - starfive,jh7100-clint   # StarFive JH7100
               - starfive,jh7110-clint   # StarFive JH7110
               - starfive,jh8100-clint   # StarFive JH8100
+              - starfive,jhb100-clint   # StarFive JHB100
               - tenstorrent,blackhole-clint # Tenstorrent Blackhole
           - const: sifive,clint0        # SiFive CLINT v0 IP block
       - items:
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
