Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF522D2D0FD
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jan 2026 13:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hz/pgb3/QU1RGFjZ9dm501ElM/zdvjIqfgn1nyDOBIs=; b=QtFzBMfmEo2Ahh
	+tR06yYvM+MI+f2lMOwRvbrBrBhzmo7bFh182dvC330DZ+fyC16KGKKeBDIFyskm6K5SXR9CUgO5O
	8hRuSqS9QWCP/LaC0pv9gAhNReEo/5GdEuCaHfWwyJUv2m8mJfkShSzj3S/3lcb4jLJFOqs3erwRN
	pfC00kn++XAiUerIE0TFCeCyhkjFnAM1+wEBR3OIKC7EF2JxfN30WnjRSyiAeW0+WsLUrnJNgTBsT
	v1c0irpJUAWlgrrA4vgSRv0BXfWCegyJsVa5e3BbCZ3K80yXQFJdTst/DJDp0+fcWI8th+ilneAOQ
	5qPPx+p25TjINjcapMlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfedQ-00000007AM9-46fw;
	Tue, 13 Jan 2026 13:40:37 +0000
Received: from mail-northeuropeazon11022105.outbound.protection.outlook.com ([52.101.66.105] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfedN-00000007ALm-3noZ
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jan 2026 13:40:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qhUNF9R1uilosy70i1PTh5TMc0J4JRAA9e3TdHK7b5PGzGv+q1tHcKUyYDB6rQnlFOjGCKMYfizv3fkLBfLDHrP4xj/uIkbeHyxQFQGNL/rPr/a2du85PesbFhEWqw816bGKgmdOfax+bM+tmhXCn7rQ2R2O4XLlLtdfEEveaznskAbMPlhxMhrDSEfhF9wqPGDpx3vFgQfT0fX0BWJCf5x+LNu0ZOZ4P1sqzW6q9CwzWkC66LUg/7Z/YNsrXeg6r6mLNgOR0nwSmbv9fMK4qGwcCbTIYCgRn8JsXeX81E+SH6rWryTlU6Pj4cQQbO4vr/9aKZjChV9B1fDggkMt3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pkox5R7z87/ggUBSqHJ0gvOzM0bsukTO27X9O7fGLTw=;
 b=cmxIiFWSkPPRnk8KqJp3/rcaqg09c2DO7IJzIRMdPbwfzDPKs1Hn5YFyX6BuB0coXuLvjnABEUPSeUnJx+lPFG2ASVve0tNa5SkKclpJrAq0IOYSqdISzKeG+ELNEAfpGUVzHOsVOkb1iJgIR0jFj8ScwozGR1DzCrNLSue0o2y0S/KisFrM9jH8eCnWrHMEHisBotbkp9CGt6XenN9D2eua/1P/ByruCfI+AtyMwb9g8w/xomoeT3wIH31HjzMhYp9Syef8IBnziorM6yqwsqCu6+oY5KmuFsb6DLZQOXcv5dldz7KGYpnEC52vQPPnZrZSOqcZpWrVTcDKH+SKRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=codasip.com; dmarc=pass action=none header.from=codasip.com;
 dkim=pass header.d=codasip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codasip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pkox5R7z87/ggUBSqHJ0gvOzM0bsukTO27X9O7fGLTw=;
 b=5BQbsSd5uyX3eNxT7LRhP1BAc5WFBG63uJn+zEZZcnV57M/oPJPxPAv1ablpBMRp7hEga5BmvKgE+GXXl7yeqgCsLzxqBFJcBWAlcU/8tqoPa+d5wnseevG3GXZAGk6TAiF1sf2ogxfec0Uo7i+BuopB9/QGrfBIr/O4d3B0Xw/Q32VVbj8yfbBr/yYDMji2WauaKGBkTzN8nNaS1xxkgnyCCWDhnveSYtEMoK0iqits0gHrc3n3alyPUU5F63WLaNZsmV8laXPLPWqLIXHsHIbC7xupUl85IyVR3rFlRFnowJyVr3sGWRAjylNak/ME+A7ekk637LNAQ+QDUbvKIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=codasip.com;
Received: from AM9P192MB0983.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:1f4::5)
 by GV1P192MB2778.EURP192.PROD.OUTLOOK.COM (2603:10a6:150:263::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Tue, 13 Jan
 2026 13:40:26 +0000
Received: from AM9P192MB0983.EURP192.PROD.OUTLOOK.COM
 ([fe80::f0e5:8465:302:9a9c]) by AM9P192MB0983.EURP192.PROD.OUTLOOK.COM
 ([fe80::f0e5:8465:302:9a9c%6]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 13:40:26 +0000
From: Florian Schmaus <florian.schmaus@codasip.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Florian Schmaus <florian.schmaus@codasip.com>
Subject: [PATCH] riscv: mm: define copy_user_page() as copy_page()
Date: Tue, 13 Jan 2026 14:40:25 +0100
Message-ID: <20260113134025.905627-1-florian.schmaus@codasip.com>
X-Mailer: git-send-email 2.52.0
X-ClientProxiedBy: FR3P281CA0153.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::11) To AM9P192MB0983.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:1f4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P192MB0983:EE_|GV1P192MB2778:EE_
X-MS-Office365-Filtering-Correlation-Id: b4adcbc5-f30c-4ec5-67b7-08de52a94f39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|10070799003|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Xs5C6msQbZiG2Mxoz3ohFYKBxqbUiwx0YRZA9RZneiz6ROv+1cbBkPTNbJyQ?=
 =?us-ascii?Q?jG2oULz3Jvy7Q9nt+iIMMd6AyHcZNTZFJFRUHQouaZje7RiwUIqPdxdqkE/e?=
 =?us-ascii?Q?C1+ZKK23hGlv9ejQ00BmfXwaNKBWQwiRovKWNS7FfyPeBKVk31mDsykW/VRp?=
 =?us-ascii?Q?wH0pW51RHHUD0kfvc/FjPyo3sENoBDATfhRrt8S7FhZ2yWFXJ83juDD9uT6a?=
 =?us-ascii?Q?DHp60xEKOTIaVgw+7GR2qVIqI+L6m1Fw1P+9uuOSeA10AfcD/uQzoOA1yWjo?=
 =?us-ascii?Q?Xyb3xCuFu9lSpJkPIZyo/sKbu/MRIntI2zIOcKBy3DQrzkda1Pkk+GU04pTJ?=
 =?us-ascii?Q?ATCfNqX3AhBjPdJkNk4tyVaF/njk/AZmEIK2cbHBgvQI/0gJJgcfr2rvnrnl?=
 =?us-ascii?Q?5C34CCW6iMJAb8s92E7mNz5IiN8FaTC4G8nti3QcOsrnLFbpsx5fkC3Jsri1?=
 =?us-ascii?Q?Ddq7ZCPlJktCKD7dqGqwwT1sHnNun/WsVGTks9t9+8H6bB3V4lYUNOYYCWVC?=
 =?us-ascii?Q?ANhHR0Y3WN2hUs47wjLo9L4EV6gGtC6HhvXId8fEO2N+0UbJ0Mz8GqNT4XIb?=
 =?us-ascii?Q?BcoSRKhBoOKXBmjn0irP0nC2T0lXIQnJYbvVow0ksiqi+YEAf0soo834ANhJ?=
 =?us-ascii?Q?ldRuAF4MtcQBQbLDABvcG/jMGzkA26R227/1PBfRBqLF1rRiAaFolLeN+24A?=
 =?us-ascii?Q?9VSyxr1J9k1MVzohf8FsbCOcL7uE4+nphgoX+f7UuCZzVDVMCkmPgGq2BWZh?=
 =?us-ascii?Q?PGS0Cyfo8zNGbicVe0wo+0NmUGeJz93EVykjESB0DO1Lr8zTzrBgo6jGlGtG?=
 =?us-ascii?Q?r1HTEWJGARGRSgH/7MglfwVqIW9dSvSGxaI3sc4V3HpIQ0wF0XMllSs6KKlI?=
 =?us-ascii?Q?LbZwsQzsgr4wmhfQ03LkLqFpiKXnTcaskHtpK/sWA8m9ut27sB5z3Cm4hY7G?=
 =?us-ascii?Q?5K9zlcw7FWOnOdPiuYkVWdGzDbiU+q7kFy3RQfJRAN2awYUoLFyZG7AbBjZQ?=
 =?us-ascii?Q?H/eFIZd+nKr7vVXnlQp3MvIvJeeSTciW3xkIrhnhoQebwK82quuE2zjhfBHx?=
 =?us-ascii?Q?Ko7Vmf/DYx+/dycktN7fblZ4kD445tzn+7As+pld6TIFAqV3YhNXogk6CGvU?=
 =?us-ascii?Q?T9GGSR4nCA9UIRctXIRoPfQmBdces2iDwBCOIaErbBS4EbdYIAohaM/MBsFU?=
 =?us-ascii?Q?aoKrRSOhC8jlW+CC5RofjXsyHD2nG2Ri69/CZiw19noGYqUl9tzmq0F24VKB?=
 =?us-ascii?Q?jAlGOUSaZzsZRMdYxpqreh0K9e/J1kx6G7Pi/ELjEaQS6R7lBPAR1dow9bZN?=
 =?us-ascii?Q?tX2E+UU2uhxNQnZk8fJIqJ5PsZSZB6Z46drDRcM7gSun5MZkl3gem43OpsIt?=
 =?us-ascii?Q?WEWCoCVQDgV6abRT7uDvGf5E7QGWQ/vv1y+HjioANT7ZEXBNwi0RuT/1PDxL?=
 =?us-ascii?Q?sICKX7GZ9EDT55Kyzu7gmwlP0urDw2ea?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P192MB0983.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QSsq6tooiL82OH54P8BMCtQy3s7/DXNx1hFr7sJZm2FaQHIP/HFsqrR2xL3G?=
 =?us-ascii?Q?mn82eJPATH37CNOatfaTv6L17KHXT93gtHQ5iNMT+PWYTbfRseNN1II9NR++?=
 =?us-ascii?Q?GvzRV4Z5GNpeU+K+kZhAKx798WBKw3gUX/6qWjRDhZSKIAUgfVsjiU5PoxDX?=
 =?us-ascii?Q?83iYlhATv0jhXI4mMl45FjeNlfnaQ7pbE/XDlLSiQeKQ7ceLeNiJGBsrY8iw?=
 =?us-ascii?Q?YtJFT+rok01BSH7D4DBPIP2jqDITwJHilAgtukwWsJBtRx19vdR64z3BrtR5?=
 =?us-ascii?Q?jzBU3e+oZDjf3O0ryHLQPOXthr5Rt/6rV7M0IbrCl01ZxnYVd2WTPz12pN60?=
 =?us-ascii?Q?VrQwONwjrusaAX4BmcK8QGdOoi9Ce++6yolH/uFQSM/ipnQPBZMz31J/vmPI?=
 =?us-ascii?Q?/AiDFMGh3K8pOZrZQnRpLOt0KplcgTmIgtYmHhi/CceGAB7imzbUKTWuFw0w?=
 =?us-ascii?Q?ZzQ1hzTOfrz4Csi128BfD482b1grqRnMoQiCqp608QIdH6xHKqAxIDWkEofg?=
 =?us-ascii?Q?h5LhJWYPF8edP95iglQYp2xfjPxzDqeFqOe9bHtHUQgw3Z+atYhAQbJgm9EP?=
 =?us-ascii?Q?YAPHPPly8njJsAwmfUm2AfuxdwqsODWkW432Y28MW06RelJYTyi02Gp57HEh?=
 =?us-ascii?Q?AklSRhfr5HQzvskBuOXg3SK/Z+LDQllU812amyZ8wKVXiJ/n5ahqpfINPTdF?=
 =?us-ascii?Q?sbMhBcoMuhZL01tg1tnzD2xFFqI6w8DRIuv1be0sTWMHAItDHNDBE2L+CyEO?=
 =?us-ascii?Q?QJOkQCkLCgQcddEnsjpIiD3IE0O/9oh9sXTc4eX9b0pAMHedLmlL0+B43cWN?=
 =?us-ascii?Q?N3juwzYewSFqKoC8kiH3RO1wjmlyXJZ4KL/0iUlmZ1hbglFYRunDhPpfw9O6?=
 =?us-ascii?Q?q27Nh+TS5TPafsP743Mcmtw8jB9HyxxkV5WH/CC6gfgLXQ06dvHfdfv+JnCR?=
 =?us-ascii?Q?6Lz+Bw0VgYhQUVVQ+3h4zYCpxIvHNuH0H+UFTyA0Xzsij/gNtK56Q3Bw+4J3?=
 =?us-ascii?Q?jw+d9JfJjLJwaeBMBgwHLCGQfejjDCoxWzpK3PnpviAvFahAOWjbHhV1ROhH?=
 =?us-ascii?Q?HafzEi4ladhH/eB/JrPe4jEP/Ce10vbFy92AaukxLojzSMhjmd9dQKDpBOwb?=
 =?us-ascii?Q?HP9/GoPsWqTYBLpFQZj0yFIZ1w+ByTZbKEKVTUBpZ9QhAvWmBVKI1g+rJiJq?=
 =?us-ascii?Q?2ToOOl+/hC8Pr3Ui4NOx4f5ksnWxYd2fjf/eWiZbM2AXwE2L8nXT3r4/nNnG?=
 =?us-ascii?Q?3A0MDyI4alZEfHr7B0Bc0QiGMU4HHEdNYWt/3ff2BBAk+uW/fpWCpbTIcKZl?=
 =?us-ascii?Q?ss9o4QBfTIjmCeaqxuz/CaFwrkwh0QJUR/ekiQCznGXBqlwK+eKqE8VyCFPl?=
 =?us-ascii?Q?ZQf/hdPxCt13ZKCXakx0Jt40vnRMFO8GFBnue7OjgTaBc5Hwbof+gjpNHfcr?=
 =?us-ascii?Q?3oLjaRuZDR/vOST008l3beVdZLuzYMxOC0cQowgqBvSKinHuGE8adGPrvPF7?=
 =?us-ascii?Q?eGXObeRA/ceh3vvyevEnrqZKZL269xB2TGUmjTxBBNjrOI29IREF1SXO5MRf?=
 =?us-ascii?Q?76R8NFrJR54TvF2oViFQOcY6OlSJQYXekY/i1QcPWz0z3yQd7nTNYnXWR9nl?=
 =?us-ascii?Q?jPge1N//v2reN6F1pzzWzwJpHDuexH59gDaOI6XksF+bQ/AI2GPYxqjWLVOk?=
 =?us-ascii?Q?+4VNSw9IXcA3hQHgiyHIH3jRPHJVRHCoMNYwigKfSv64CGyfxMmt5m1WBpwc?=
 =?us-ascii?Q?5E5lhANfu67lbKfzdsoMzWawLZJe/ppp8/pbvwkxfSw1JUG0qmORM2YigWua?=
X-MS-Exchange-AntiSpam-MessageData-1: 3lzi4zhSWGm8iexlFuMPNan4VJ9rFHw0OVU=
X-OriginatorOrg: codasip.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4adcbc5-f30c-4ec5-67b7-08de52a94f39
X-MS-Exchange-CrossTenant-AuthSource: AM9P192MB0983.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 13:40:26.6984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d91ffef-bb81-4cbd-b9b8-552583685f20
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ufKyaa0dRBrH/8r2K8TzhBNh17BNdJahJwrAMbzC46iMHPZQhtGe6sm4oa3NV3t5PNmx6e+lsyRYAITXxwZimEnXRV67jYMcnUL7qYC4t5M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P192MB2778
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_054033_982764_359435FC 
X-CRM114-Status: UNSURE (   9.17  )
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

Currently, the implementation of copy_user_page() is identical to
copy_page().

Align riscv with other architectures (alpha, arc, arm64, hexagon,
longarch, m68k, openrisc, s390, um, xtensa) and map copy_user_page()
to copy_page() given that their implementation is identical.

In addition to following a common pattern, this centralizes the
implementation. Any changes to the underlying page copy logic (e.g.,
for CHERI) will now automatically propagate to copy_user_page().

Signed-off-by: Florian Schmaus <florian.schmaus@codasip.com>
---
 arch/riscv/include/asm/page.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index ffe213ad65a4..3c517bc9eac5 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -51,8 +51,7 @@ void clear_page(void *page);
 #define copy_page(to, from)			memcpy((to), (from), PAGE_SIZE)
 
 #define clear_user_page(pgaddr, vaddr, page)	clear_page(pgaddr)
-#define copy_user_page(vto, vfrom, vaddr, topg) \
-			memcpy((vto), (vfrom), PAGE_SIZE)
+#define copy_user_page(vto, vfrom, vaddr, topg) copy_page(vto, vfrom)
 
 /*
  * Use struct definitions to apply C type checking
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
