Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ADCEC48285
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 08:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hb0MpOrsRYcW+FaVv1PoNRrXPs3D5HEN6qLWPHitTlE=; b=ceuFSDvKrCIbpN
	odEyu3Dr9Allg8dnwIrOEgEpV6QewOMl6ndXTIrRUwQhHsinJiUZHoknKcDWNjl3EdqLhEe1gsp6f
	D15vMoXgODRKctkc6o4RR5etFaHUBuwG59cOHU7rwV/lBT/Dasv6ywwjDMR7QsRIEB+/MDqJsKxSw
	1nA+wmsb7mcscAi2FZHr38Gv72I7/RQCKaDbOUzFPffNeUoxc6OdtblSzkYrtDGa4eIZ36xV+SFqB
	s6ndpayP035AzJvp+HIJoRSInxCBhBzvELeyg1e/Q8rzT32k70w6tCxk/aJG7eH468tdeHkflIvBJ
	sLgLQwA5NDLO7enlLv3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUMZ7-0000000Bh9T-1iGH;
	Mon, 29 Jan 2024 08:00:25 +0000
Received: from mail-bjschn02on20606.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::606] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUMZ3-0000000Bh6j-4AJh
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 08:00:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GBpD6b5zXHFdgRDXm+lljp8fY5yS3eIYRrO0ldSMXOkG5yBNQn4ESSnH3lyMA7sZFF9gcqqRkmCtTvtrHyi8FpnPVDb96YlkT+gp4qcUPj7CDrQYiXZodFZcUq2VdmQPHgNHBx/TIUyAirVfkcMKo711Ju9bbIneJ4vwo5OGNdgP0eKDZtMqhkQa6cLs3jGlRyk6RaXdL8WNihhG6iMudguzAmMoppUlsJE8D9KjEPUeFC93e9VEK6bE9q6w5hwdWLkjDZHM3B6KbxtxQ1bLloTlZAGUh3xjOXSTf10xZfDkh1S17JJVbQJg+756OcjflEIViOKE0/eB0BoTveFPnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vclcctiJ5OWYZEDxb0dc61vfmQgN9P7BWRd1qswym/8=;
 b=FLDYCl0dIi2dHBvbFH8j6gvcHW5DsVNKlfjP4865BCeTZvXYveXMPSkfdmfC+DQg6k6O18JOHljT7Mm5nIDk+9ZNGiUiT7y7ohHb54varInOBX1zmwpLGSnxVONUFGcqG/o1q6pdkkIWDN3UrIa35hRmu8Hy3hfd4gq2avLkyPKK0eZzgObXlIw5Ic/abV51PbR7MLBv4D6TdUtghqYn+gXskDZwc7NWNUx8WekxWdsr8XjZ6APKUinNXLojGO5ZqK5nPDESYNAtwiofoq+9JQO7HHmY5K1w5PgYli0u95mOZu8XkFY5Wmgd3z45Fb4Bz/Zt9IPPUvqmcNrJlDNMmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from BJSPR01MB0561.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:f::16) by BJSPR01MB0545.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:f::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.31; Mon, 29 Jan
 2024 08:00:20 +0000
Received: from BJSPR01MB0561.CHNPR01.prod.partner.outlook.cn
 ([fe80::3862:65b4:c857:c4a6]) by
 BJSPR01MB0561.CHNPR01.prod.partner.outlook.cn ([fe80::3862:65b4:c857:c4a6%4])
 with mapi id 15.20.7228.029; Mon, 29 Jan 2024 08:00:20 +0000
From: Sia Jee Heng <jeeheng.sia@starfivetech.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	sudeep.holla@arm.com,
	jeeheng.sia@starfivetech.com,
	robh@kernel.org,
	conor.dooley@microchip.com,
	suagrfillet@gmail.com
Subject: [RFC v1 2/2] riscv: cacheinfo: Refactor populate_cache_leaves()
Date: Sun, 28 Jan 2024 23:59:57 -0800
Message-Id: <20240129075957.116033-3-jeeheng.sia@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129075957.116033-1-jeeheng.sia@starfivetech.com>
References: <20240129075957.116033-1-jeeheng.sia@starfivetech.com>
X-ClientProxiedBy: NT0PR01CA0031.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:c::14) To BJSPR01MB0561.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BJSPR01MB0561:EE_|BJSPR01MB0545:EE_
X-MS-Office365-Filtering-Correlation-Id: 39db1208-901c-4394-73ac-08dc20a056af
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BiZUEShl0HWegj1xKAtLPeofmQdugXSunJDlkdnWTxlUeyrrSJLksGAQiL9CQVv+CzUku2rXrCDI0JJgMY+sxutz/YNY4pqiJp/zk9mkhE4k2g6MhYqmQD3wd/j7AV8YmCyQDihf0JThzr6d09bx4C7VRYpKVBNWrV4kpTcfWBk7mU/xvqckjNwgIWqNWmZq5WIIX7ZI8PmYHFZondGzRBbFDeshu6E6zDRTolNmbMZbzE5+BXIkJmw4rOXMyTG6PNH0rQXXLBlXQK0RYSVGZPJNIOpTIrdKQwwNwdABaZbdRSiS42dryR1sTcwgvhNw7PR4Xrdgu95n8OCbW760aijT5s5/NCpNlhED7zQ123NjMNanXYUbgi8vaIdSg8/my+i6GC6HNqkcC2VD9GfM9APTYOGKPYQQd2jo/3QPvt8QiASnow4MGPfIMlHbnXeuuTz+q9FWRVQtcexC3zbcG6fQkYVey+n1sbp0SCFqChhmfelcbjWBLupiZUwhtADL/3NetI+viQrG7D2T04M2Hf9Yg7/wLwP9m0KierHOILTwN7UULZ1zgH1DBg2+aNUI
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BJSPR01MB0561.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(346002)(396003)(39830400003)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(38350700005)(41320700001)(2616005)(2906002)(52116002)(5660300002)(6666004)(66946007)(66556008)(4326008)(26005)(1076003)(66476007)(8676002)(8936002)(38100700002)(83380400001)(508600001)(41300700001)(40180700001)(86362001)(40160700002)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XULIfIufYVg/Vfq2/Kyiv/LkHLtvSQKR1y2RdYVjoZxPVybkLmd2fqQZjjN9?=
 =?us-ascii?Q?RknHy7AmQtzq9uotTz+hbtfbvPq6+4DLPUaJJ/iCy+9EuYtYgk1t8pFGrwXQ?=
 =?us-ascii?Q?SWdcZX6dKSPxzjvTee9WnGoziX/BDpcAk4akukE3gdFjIjBekD9x7AtlJ9Kj?=
 =?us-ascii?Q?w6D4f9BhObBU+Mxcz2AG3fB9PDkdpYzs0CAW9qg0GR+KdTV1s9Lw15WvSVFA?=
 =?us-ascii?Q?q/k8mVsO0ApRHSXHpskw6eMjHNC/umy+nx1Tk5UKXWWvHHsDLiBc6qMAfsqY?=
 =?us-ascii?Q?RUG6nyzSGPn4H/Nxt+7Gv5n9rvtwzYnIsOw38L5TWKrimNVSTY1lHixpAIt2?=
 =?us-ascii?Q?oyLhFk3Unb2nkQIZWSraFBlxKWbUkNYQZA1JxejK9SAjB8pYaPqD+nyjVsW8?=
 =?us-ascii?Q?JvI/ZMeZQ7fnWPQ6ZD1JUrRekTAtmI7VezM0sQ87PELASxqUR0X9iLSIyKJp?=
 =?us-ascii?Q?mJ8ODIXU2dw+VN11Lg/eXzW2Zi4fO/IN+h1VrKMwKpEWTCCyEXya56wACN4J?=
 =?us-ascii?Q?w42GvgdHofdiWM1793vPFnGNMfITukwiZm/ZsVJ1RRTkFAUH7lq6Jkxgp4Ce?=
 =?us-ascii?Q?Ca6+QLSdL709qH379EQkfbxoDXttUMRSDaSG0Ej7Pe/d/BkmZVC0uufYbi1Y?=
 =?us-ascii?Q?mZw3DdSdiGlRMU2J5C6pxXn72USZGxiLOlITatShI2kPmZDfg7jcHiQ0aeMS?=
 =?us-ascii?Q?NL9YPJQnp7bCBrAzkf49Nh3VlnnUHtMo2LqnbBQYeZzKK4laiZmp/L9VGqO+?=
 =?us-ascii?Q?LWLntIFIQpKVHF8fQEZ3j26OySKFbQAMSGSCr8Tq0Z0Yw+52DQteEUaYMPt9?=
 =?us-ascii?Q?EXpdn4vfL4Ds7OVtiCvZMwLGjsZIUftKX0RhozlgAR9MGqcg9q48vyOOxMNr?=
 =?us-ascii?Q?9570/M/4sreyx5/2KGB2SBKSudtQXOb5qlachXoHOnINmrirBunFDvuN72/i?=
 =?us-ascii?Q?yCHJCtVhnjLjIO5MijEVXwgoHRh9q1jEXtcznElS6V9d4OLaAnLavegjD/KC?=
 =?us-ascii?Q?Zv9R+yjzsxuUfAgX9oPyNMu0Zv1oQljMKTm6XAZctsrywzAW23/Bm6mlKUbB?=
 =?us-ascii?Q?4IKUNAhlVyH7V+Gsclo2v0ChaDb6E7pfmf171Lp58UvPTH8fdKG9b1o3XfJ8?=
 =?us-ascii?Q?pd5nhP3/z4yI4Z7guzXw6klrMBXE3vmaDLvj2H6GkgRHUJgMRNLogxph+ari?=
 =?us-ascii?Q?fAFRANaBJe2y6iIqaEh2QsbnzSWbsHHjNpo9xWSpt7gVDsnhcyzDDQgAvd54?=
 =?us-ascii?Q?64fxweJZqggWgjt9gtE5M3ZJ2UFSbuFKZTE/cgdPNLhKFUNuhsXGYvZAbDUb?=
 =?us-ascii?Q?huBCGeKfkH1XGfJTewLiYnxTSJABEmUFwL8DVAvPTaEYQl5iyjii70/7EqS5?=
 =?us-ascii?Q?rDTMZjOZuEWaqWcg+hMb2XCS1saRvS0wDfy/o/hTQ40M/8ko8agLmQ7FDCZJ?=
 =?us-ascii?Q?Ybq4NMzE5/VEYDQJJHipzsBYUH1u3KV6hSLyjUXxZHKlw6k8S0bB8nIDk7EP?=
 =?us-ascii?Q?qhPiIy7HgogAcocZnXefYfZTNGNIX8UeRiGn1VFojyWPhFQ2EyQSpf07YBgE?=
 =?us-ascii?Q?gFs1aM3Ngg3mEQKEGFBcq34JnlQQNBuvfI89BJLIzez6u5k7mI63b8D3ntym?=
 =?us-ascii?Q?YQ=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39db1208-901c-4394-73ac-08dc20a056af
X-MS-Exchange-CrossTenant-AuthSource: BJSPR01MB0561.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 08:00:20.4008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MBeGMM+s+mkZnU+3A6aVRXydgcO+jJnxc+cIoBOkFBrTUMt+HLb4RRvhce9g3nFycWfyul6IELK63z2SHUdyWJlu2Vz6/u8nSO+TCp3iF+c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJSPR01MB0545
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_000022_068663_7A42C771 
X-CRM114-Status: GOOD (  11.68  )
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

Refactoring the cache population function to support both DT and
ACPI-based platforms.

Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
---
 arch/riscv/kernel/cacheinfo.c | 47 ++++++++++++++---------------------
 1 file changed, 19 insertions(+), 28 deletions(-)

diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
index 30a6878287ad..f10e26fb75b6 100644
--- a/arch/riscv/kernel/cacheinfo.c
+++ b/arch/riscv/kernel/cacheinfo.c
@@ -74,36 +74,27 @@ int populate_cache_leaves(unsigned int cpu)
 {
 	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
 	struct cacheinfo *this_leaf = this_cpu_ci->info_list;
-	struct device_node *np = of_cpu_device_node_get(cpu);
-	struct device_node *prev = NULL;
-	int levels = 1, level = 1;
-
-	if (of_property_read_bool(np, "cache-size"))
-		ci_leaf_init(this_leaf++, CACHE_TYPE_UNIFIED, level);
-	if (of_property_read_bool(np, "i-cache-size"))
-		ci_leaf_init(this_leaf++, CACHE_TYPE_INST, level);
-	if (of_property_read_bool(np, "d-cache-size"))
-		ci_leaf_init(this_leaf++, CACHE_TYPE_DATA, level);
-
-	prev = np;
-	while ((np = of_find_next_cache_node(np))) {
-		of_node_put(prev);
-		prev = np;
-		if (!of_device_is_compatible(np, "cache"))
-			break;
-		if (of_property_read_u32(np, "cache-level", &level))
-			break;
-		if (level <= levels)
-			break;
-		if (of_property_read_bool(np, "cache-size"))
-			ci_leaf_init(this_leaf++, CACHE_TYPE_UNIFIED, level);
-		if (of_property_read_bool(np, "i-cache-size"))
-			ci_leaf_init(this_leaf++, CACHE_TYPE_INST, level);
-		if (of_property_read_bool(np, "d-cache-size"))
+	unsigned int level, idx;
+
+	for (idx = 0, level = 1; level <= this_cpu_ci->num_levels &&
+	     idx < this_cpu_ci->num_leaves; idx++, level++) {
+		/*
+		 * Since the RISC-V architecture doesn't provide any register for detecting the
+		 * Cache Level and Cache type, this assumes that:
+		 * - There cannot be any split caches (data/instruction) above a unified cache.
+		 * - Data/instruction caches come in pairs.
+		 * - Significant work is required elsewhere to fully support data/instruction-only
+		 *   type caches.
+		 * - The above assumptions are based on conventional system design and known
+		 *   examples.
+		 */
+		if (level == 1) {
 			ci_leaf_init(this_leaf++, CACHE_TYPE_DATA, level);
-		levels = level;
+			ci_leaf_init(this_leaf++, CACHE_TYPE_INST, level);
+		} else {
+			ci_leaf_init(this_leaf++, CACHE_TYPE_UNIFIED, level);
+		}
 	}
-	of_node_put(np);
 
 	return 0;
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
