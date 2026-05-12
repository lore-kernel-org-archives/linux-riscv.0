Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B826CD484E
	for <linux-riscv@archiver.kernel.org>; Tue, 12 May 2026 06:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tjYyehBNRkMuyV/B78ObcmON3o2ToU++P15D4Nbi1xk=; b=ywk3tepcurCOmD
	nco1NWn8R8Grcs5Vbzp19Nk28xbQLY5uBWq7Gc4UhXenXqFYUNx+fBIXI//dRJ4EVCKRVVuMObIfR
	EQlFaezoS+SoIG3WFjE+XQMjE6C2+RFxhnMJtoIwfz6s1RTCaoAiY9wKCaDQsjGxITzTa4Dmh1HSb
	VqL36bBhnnsca+iWq6pAEUA0xjTxm61MI1MM4zv3R/cO15bFdYb3Kf309741PUvtUFZX3xxz0SYDj
	MBezHEKpn9B5AHUOiiBPIu9pyhMXvjFphF7vAiafI6lJY+VRzNHW83SyBkbQov5XcAdT5/P9Ragkz
	mZ/f9OaG8mbpmiLY8pWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMgfk-0000000FmXL-0LGC;
	Tue, 12 May 2026 06:32:52 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMgfh-0000000FmWd-1QrL
	for linux-riscv@lists.infradead.org;
	Tue, 12 May 2026 06:32:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YFOUT1572mVGRspsr/dt1rYc0PQbtxA86ZYYNnSFpnlkQFJnFDT9Vy0fcuw8wcs0wRqSNwQAegpt8fr3BLDrhonretbpbGHHReWNezhRv+a821/GzfcON5M1VEy5HCsqU5qxGs/k8BSH5XssmM3CddPL6CIxSKT687mfuy1DAEwcAQ8skYM9dtFJqK8pCUhQRwA6aYyrqXizpmNhNRfV1IxzdrnUFo6lXDpNtoc8nNxWXqC5hMKjhaQeFO45BifVIWyhNxLwnlqefvbdCpTxbU2EoFX0BS7dmqSCmhYikoSQaFoVQnJOVdX37fnHsgjJLZxNRnBTpb7RAbjPFjPJXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dUNgaqX4Dws7++NjgSMvW21FupVBaP9TgDOLcd0bEJ0=;
 b=jqWlvwph5qK9gxieMqGcwUx6WEM98TAw7M3647ovUA/PVKtW13MR76v5JRFGd+7lbXLwcJEekx+A2YZq01jgd+9La/0c3blqyvgLzDbS0fdoHsc2ZShMQ1kWbhoQY4FQgue0vBWiQugB09zEkajRq5AmXhSCValUfyW7SAdsYQKf814kbrKK5a34f5dAl3lg24S6P/hVWh8CkdD9TdZJ43gJ1p2mEdEQYfNQMR8ZAayeJ4XszucNH7vTlp8rsiXgno/GcKoSQjNN/Y8VK5M0/UCrMJYhSF/ndCttxS2wWieCPDllZ0pl/eGCxkMxPCvCFiLy+E6NiQ1oGNwHfxeu2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=codasip.com; dmarc=pass action=none header.from=codasip.com;
 dkim=pass header.d=codasip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codasip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dUNgaqX4Dws7++NjgSMvW21FupVBaP9TgDOLcd0bEJ0=;
 b=yE5rZ0UShdTiHJQxDyQTr6GQXjHK6buZfZXus3DqyJwux+bqgM71e5zik7Vp10ZU4vckrzxIMXocGahsVvAidnMYPIn62zHt6TkpeDEOx/2lSFLFSDnomkOE0PPNpJM885FUPkaVO2y4alb6q5wVPSSjQM6qHm/YMDbTMlsDCXuZQs/8vwkyVzdL3q2OS9IcmPSVO8ZOP0wkml2UZ2ROFAzZLloE+AVLbsBgFUILstjtn7+HMPAZ5FRg0bQdjtzEiBbYIfiK2mQxLeCj+pHijmTCrpTW8rlpKLyfX4F92pT44vVEp+vDsHxF8BOwwA6bqJgx4KT2Pe+3qZjtvA95NA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=codasip.com;
Received: from AM9P192MB0983.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:1f4::5)
 by PR3P192MB0745.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:45::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 06:32:43 +0000
Received: from AM9P192MB0983.EURP192.PROD.OUTLOOK.COM
 ([fe80::f0e5:8465:302:9a9c]) by AM9P192MB0983.EURP192.PROD.OUTLOOK.COM
 ([fe80::f0e5:8465:302:9a9c%4]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 06:32:43 +0000
From: Florian Schmaus <florian.schmaus@codasip.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Sean Chang <seanwascoding@gmail.com>,
	Miaoqian Lin <linmq006@gmail.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Florian Schmaus <florian.schmaus@codasip.com>
Subject: [PATCH] riscv: module: Use generic cmp_int() instead of custom cmp_3way()
Date: Tue, 12 May 2026 08:32:31 +0200
Message-ID: <20260512063231.708256-1-florian.schmaus@codasip.com>
X-Mailer: git-send-email 2.53.0
X-ClientProxiedBy: FRYP281CA0014.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::24)
 To AM9P192MB0983.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:1f4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P192MB0983:EE_|PR3P192MB0745:EE_
X-MS-Office365-Filtering-Correlation-Id: 496bbdcd-b761-49f6-c54b-08deaff045d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|7416014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: aN5hwRH1FpY5jSgOdXBafu6ZssV470Qd61dDX1V1vMFKiXzblkt4/4rlThDmE8/yQKsYbNF+nPlaoQ+AMEh8CJNymSsXUFahspl3wQkRm7sb5GMwD4pevra1flmqm3pj7QXKmlQfo422fQ8gaU56fR80yAGPMbqLjx7odWW9xMXoFIus86nFmcr4Axzp4aebymqVV0ZmRKklhnviDrdhCMYxiWl8q0zn7PkA8WbWgVrqpRMQv2R/5d1OrL0+p3bpdg+sFHNDbgHhBvpYmelePE8w/0rXTEZbJGy50g5QuEwHFve1++GiKgYtQANJHpNyFLifspS9ag/iqnEPexPkNsYeKk4PqfBxhXMYS42vTqg+CczkGkicLvj2Lz82FBnjpVff7JxmFZmk+iRzVh5y/0bZO4wYmNO2og1TvNTjhWs2E66OZ6pydGUZbS4SCi5SpruPn+NtVoXa7hf9jyjKT0zllxsDlnV/mcG5DQBhSuqUrMQdtrMUbxe8QwDgzs9DVaanxFBX/Hg0ShEYCiO8rWz43SBnaO92G2u9rPqUwCW3ov1XAB4gFj6Dv6Y0hVU5KMT7xP02SVfrGHjXr8XVxV3N+hCojsEolY47zs5KhrUTYxR5a627ft7N+OjVxl0pR05/lHFVN6CXUWHb9mAn3Mn09kjKYQpfhKLh+Es60777T2WWhCu9eTPNSIj55xOD
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P192MB0983.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cR9DclYadj/vGt5NNymII+nx+BCrQae6MsHTB4Z4anCE7r3rgkyVfH3bc5nJ?=
 =?us-ascii?Q?NCIz7OYebJR7dohQAW+ZnHnXTFbkB63pTpcX2gFu0t9PY8aSKZDC3dsOuNlk?=
 =?us-ascii?Q?XC+Bz2QrAcjkp7MoKNw1fMRV+Y9iqJ7xDZLutfzc+UOxE1IrE6mWdlgljHki?=
 =?us-ascii?Q?8ufNxqFVoJCaReDMPOZVwJ9DAGZ/RCTFkpfta+pl4gLYhG6kSfOeSht3Ctit?=
 =?us-ascii?Q?YLmrs4Bplb2bR86/J4C7GQRIdHE6LcAyxp2dwEYYBgOAzIlD5SN9/Omir8U6?=
 =?us-ascii?Q?xlWC22FZjsjx+dhGcSG8VLLyN4MCLlY9e6of329zfZ/mnla04xrFiPrnUayv?=
 =?us-ascii?Q?3bhzdwdHvoSRmMy+w/6QYQZilmZP7HRn9PCklGoKG0OlyKbQ06TPoEIHJyUB?=
 =?us-ascii?Q?2s8H/7jKfAl5ua0CCt6tvBPUiPdxmszuS2nubwD0zMfrP4HcAweHZMVlxMAC?=
 =?us-ascii?Q?XlapKCwFUPeF/Xn1IO0oQ/oCowXTQyOfeX8KBVGDZET89qvCzd3mr+isEUdV?=
 =?us-ascii?Q?Bnd2uIqApPXaTB0nsIhm6pIN3w6rbUq+ybf0vCVIxnX7nFRqfH3ncok+9th1?=
 =?us-ascii?Q?H9peqX0QgK2JOQvoI4Gu+XsXSLIC4VZR/YHNJfMxtV45HR6lM/OsY2ti82qW?=
 =?us-ascii?Q?HU1AJjphmeDfPVNy9Wu1ZNg1/fWIZr9gghJFQKBAyAYBUB/ZMqE0XP+FsJV9?=
 =?us-ascii?Q?DqBhHzLQ1da3mVsZz01HbWgUZ6rJixNFW4PfADWDjtuLWQhLB8vRMtcMKeHO?=
 =?us-ascii?Q?bVJv2+Hdc3DjCE11lvF42qsLvZre/S2XcFaj59svnMhWxD4GOhGNdyaat52d?=
 =?us-ascii?Q?OnmJSv62tDTU1Llxmgex93q8VjvFZhqNXT4Byb6hA3sSsdmHru36F3z9iI3o?=
 =?us-ascii?Q?6WurOnnKzFIIyWGhZKBlnrN4lKWL+VxIV4gRoqXXEM80uojdoN//L8jOdmJL?=
 =?us-ascii?Q?3p5xHEX5r29R3o+fkx0m9mG6EaWSPcibfsfYGZP8AiwNtFgMmnkNS/9cmATO?=
 =?us-ascii?Q?TgxgUrKxMiLXGTV81vgYKT6X5zS8jV93+j4xDZTb90p5DB6kFbsxJ0iwqHk6?=
 =?us-ascii?Q?2FZxBFXbq45L8LGq7ROuRkuvXtxx/w9sJMkomyltxZ7GUeWDTtrXCMQpVwGb?=
 =?us-ascii?Q?vDbCtDBG0FrKLb8nOVfS2lyUd9thzO9oOrJqlg+9JYNQSMA+7nPPMnJzLF+X?=
 =?us-ascii?Q?ONO/TNBWT6lBrT0qu6hNO6l6iV2WYVY1CecI41FmeocHnSijxjfIDYDn4SUM?=
 =?us-ascii?Q?+F3bV6eiV8D7yBBQwoKgjHLauukyUV0d1Gq8jyLqKcVhyKQFg5HN5+3hVRzM?=
 =?us-ascii?Q?cqXDideBrw9JGfOqT/YIp5LwxVIUKZ+ow15A9hyPGoiNRcWVpYXObhftapOP?=
 =?us-ascii?Q?/KFOap5v6UUmL185AyUWG5xD2yzxJreWkU+zvQy/iIET+umDmOJISvwJNm7e?=
 =?us-ascii?Q?260u+SflOV8/9YSAbVZEYTP6L+GVIiBma9nF5K8JEgv3sh40DMSFcI3g1ant?=
 =?us-ascii?Q?cQQFUBm+Qf9dBRfAHaqlqCi1fLTLuXZ9RVrM/OtvW9X6rXhcHpATAOoD2d3H?=
 =?us-ascii?Q?Aqm38O5rqBshRVDFPJ+rsReSl1kU/mUvVa7Z4KSzztsn936pY7cLVMXSFFyJ?=
 =?us-ascii?Q?IFTAV60sD8+QPs0dV2LG39qMe7UcIFGrV0TUZC5rg6g6y+Tpbgx8OsfU+2Dg?=
 =?us-ascii?Q?KZ4oggKAp3GRzRUa4wtbIGLyy8doUUE4F9L0GOTJ/JwRPPCIAs6Bh6yAiR9j?=
 =?us-ascii?Q?rMkVEU7nfOOu9y1G8RX8H+bNai1f+JrQfg3kS9WKYSnaYF+Y7+6Rfxrj5c0C?=
X-MS-Exchange-AntiSpam-MessageData-1: wsma2pEdLRaiyFIwS/afTFpsuKKEFKEeWl4=
X-OriginatorOrg: codasip.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 496bbdcd-b761-49f6-c54b-08deaff045d9
X-MS-Exchange-CrossTenant-AuthSource: AM9P192MB0983.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 06:32:43.3396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d91ffef-bb81-4cbd-b9b8-552583685f20
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rF/Q/aDC5DbE/apSkvEGRZEAnev82MW4EQQK3n4OaYGAtZIpnEfuqIN+qgLm8IpxFthN8wKNXI6usH8KNjni27WqeHuiZYHGik/2sBnTFAw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P192MB0745
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_233249_394700_A976A26E 
X-CRM114-Status: UNSURE (   9.18  )
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

The module-sections.c file defines a custom cmp_3way() macro to perform
3-way comparisons during relocation sorting.

Instead of maintaining our own implementation, use the generic
cmp_int() macro provided by the already included <linux/sort.h>. This
removes redundant code and relies on standard kernel interfaces.

Signed-off-by: Florian Schmaus <florian.schmaus@codasip.com>
---
 arch/riscv/kernel/module-sections.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/module-sections.c b/arch/riscv/kernel/module-sections.c
index 98eaac6f6606..b3b11b7f7ed9 100644
--- a/arch/riscv/kernel/module-sections.c
+++ b/arch/riscv/kernel/module-sections.c
@@ -56,17 +56,15 @@ unsigned long module_emit_plt_entry(struct module *mod, unsigned long val)
 	return (unsigned long)&plt[i];
 }
 
-#define cmp_3way(a, b)	((a) < (b) ? -1 : (a) > (b))
-
 static int cmp_rela(const void *a, const void *b)
 {
 	const Elf_Rela *x = a, *y = b;
 	int i;
 
 	/* sort by type, symbol index and addend */
-	i = cmp_3way(x->r_info, y->r_info);
+	i = cmp_int(x->r_info, y->r_info);
 	if (i == 0)
-		i = cmp_3way(x->r_addend, y->r_addend);
+		i = cmp_int(x->r_addend, y->r_addend);
 	return i;
 }
 
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
