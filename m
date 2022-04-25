Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37253C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Apr 2022 22:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ad0KFVahnOW5Cmd5hhDgOigdl+zBuLdO6eOQN+2AOMc=; b=FJ6XohzbetMf3g
	nh0uVJ6WKQCR1h7pBHsCh2gMbnGFdAwZ6LwIXrU2klhDMJxFAmoprELs1fN/tIi4+6FWctStL94K0
	cgrN+CqorymUS76ttwXF/nuwoicEY98J9RGO+GnK0VklUE+LxxHM8zZVxt6g808vpjAwGmUayotzb
	XUGEkhjWKk84f+pYCMPjqY0OLlvCGhNz3xN7dzoPQihHAWCm3gh64zyvVIm3qLcbZ0R3A3+mEEDhu
	XM6ih2EQDZU8tC99xi9TZyvxNAOyG7Byrk47n8pIlqAs3bTZ1LsjIiqgubpqGXuZjEU4iIiwaRyGF
	R0NIv61LBbDondT7lHPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nj6sb-00Bajy-MY; Mon, 25 Apr 2022 22:08:25 +0000
Received: from mail-tycjpn01on2070d.outbound.protection.outlook.com
 ([2a01:111:f403:7010::70d]
 helo=JPN01-TYC-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nj6sY-00Badr-34
 for linux-riscv@lists.infradead.org; Mon, 25 Apr 2022 22:08:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fuDDmrsliRqCokPWHH8/nfoA+r9cgaEeAX4KrL/6U9a2BEBpgtGIKbxHLojQelE5Kx5fbxPMP8w2qtd0FL/HgxutYiVvc6D6tt08oZ6W2gme/PGcxt2KFp/Wwzbr8aweDFC06GHFwbXMaI7pwpSy/AdoSHnL4QckwI4b5bAlnjp56Pk+FoS0FXHgtS90a/ZQBg4tnP6PS1blEf/Z2BQCxicOaN21STzxX9l7oDRuZx9T5cbO8w34YtVVAOJeUg65T3+YT1DZypXf4J1UHJNxTt4K3JHpMqiAb6nhaPjQQ2mOqjgaZJLHyJTFthaRifSOU4TOsZU/Y8AzGFqtfG2hRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hvcgZRKWV4Dxym+Sij7bWePHm5TCOVDlS63YrEoeSl8=;
 b=NypPCg8MdHZ0+MqU4dxBgYJKYCqVDsaMsA1YuuwySXOrnTOctw309FFfBSh3wXoUsRjt9Bp1BOgtHE3jE5oZUzuo51K+r3WlZYGJgWm+HRNdLgbM4m4t8vUKoIdA/otW1SOA+jkU1nsv+Hdq6Ng0T4f23iCEJHSWMaCedl0aikNkluvEv1n196KYdzzeSAGjGf/RhZO18ZHQzm89xApRoijIcims0sn9dnE9Pkzbt/348PZcKESoI/nG4E9/nef29F2IrsG9okGoMK+cuu9ydZJxSDFLCgVDgjdH+s8QxXgaie4jzM/bGUhqMAs3Y7UotpRMAl7lkaxRXcl1IoBtsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zenithal.me; dmarc=pass action=none header.from=zenithal.me;
 dkim=pass header.d=zenithal.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hvcgZRKWV4Dxym+Sij7bWePHm5TCOVDlS63YrEoeSl8=;
 b=a8suYXZhmULc7aB7BC6ButguQsWt+CDGT0PjSxMXK5AlyrJXJiLaUA+8NhuqllNUlB1dvH9LaU2HJI1e3+sB0MURfCJ1a6gR3Gz+XAYlBE/DQEnU248sJq9i9bEzeGX8teMiRnEawTEPCW9jYJ/MpsJXuU2h9rsf+x2si8OT6vY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 OS3P286MB0996.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:10e::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.13; Mon, 25 Apr 2022 22:08:09 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::bd99:5c83:e2dc:a8f7]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::bd99:5c83:e2dc:a8f7%7]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 22:08:08 +0000
Date: Tue, 26 Apr 2022 06:08:01 +0800
From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
To: Atish Patra <atishp@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] RISC-V: cpu.c: remove nonexistent ext from cpuinfo
Message-ID: <YmcbwYcSzwLSepWZ@Sun>
Content-Disposition: inline
X-Operating-System: Linux Sun 5.15.26 
X-Mailer: Mutt 2.2.1 (2022-02-19)
X-ClientProxiedBy: BYAPR02CA0022.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::35) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 866e2b10-7b60-48d4-09db-08da270814b4
X-MS-TrafficTypeDiagnostic: OS3P286MB0996:EE_
X-Microsoft-Antispam-PRVS: <OS3P286MB0996FC9A44664C0A5C00894DBCF89@OS3P286MB0996.JPNP286.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5yMSBp4cKv0CuV0BU4N3CxWIULR0O5LzHKTAQs6J1TzNkAwpySp3BokZ0YZR14CvAG/ehxcytbsnGFnvabWoOrMReQmhS2Id3bj/pxXHcMZDm+3Xbe+HOXC0M+fO+yBeXjsNmuh5nutj+WOQF5kh0KE62qStsh2mZxlWlg+xyOHxkPxVp+CKs4s1x5x0F+Qa2zEQPeNUItsXfNO+o8MOEyEt/XT6I9cnqKhzfBJuuGy7reYQSQ92un9ibRqn4C3E+FFkND+yce1223F2wIK6cV+JrlDwmIk1/X8WRUfuuZv/xrOjpEDeaBYUMWZNzRzcMPx47UJav02TrwmaZ2LNsE3Obu95yFrt1iY838J5F2VgdcoRfgzq273tfVzWTs5lF/IukvxsNHJ7ZhtY+JpLSQKXpMeVpqRqUUQ5wvL+YXbUSTESiqnwP8yRB4O898qnChFxcM+Jmbi6RjNTzSRvWgLHWmWPaXtrVXicHyC7TSM2eMtHcjXKeAlEMXhKbaZccZZoVJf8ARbCLZLFmTLnceblsSnMeRJ0B3Ps1l8w9rI81XJ38HAslwZkaBVKWdTC2Udm2m7/CSPAkmKASQlF4kUg0daVqwnEhQiLVROGXU8U0gXa6/2qMvDk37MFlZnXN0idVLD5nimwTY76CB1cHtD96zmFvQ9z7hwHxei2a2KVDy1eGjcGvyuTRW9kglKzEXknMwBhWesXWQ1C1nPwDA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(396003)(136003)(376002)(39830400003)(346002)(4326008)(508600001)(186003)(66946007)(33716001)(66556008)(6512007)(52116002)(66476007)(316002)(786003)(6506007)(6666004)(110136005)(9686003)(8676002)(6486002)(2906002)(86362001)(8936002)(5660300002)(83380400001)(38100700002)(49092004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NMJ6S6N1NrNF37027fyG/lWUJEK21bPuZIIhSB9EFJMrzUr2MmJSvlMmj8RJ?=
 =?us-ascii?Q?krGU1fvyA9yX7NokDUFJMx0bgOcRX1s+l38oE1w53v5d/lwA4mExSQ8dmzs3?=
 =?us-ascii?Q?4WegCuSzx0oQCw9t/OoEltPbFlC6qu7gWv73gLyyTeI8Mc/39n+GtDrizHl+?=
 =?us-ascii?Q?iqC/3GhCFc4wJEoG/wwinw0vj5gvdiAoj0MiZldfVE0PHqf/34NA3EwAxM8u?=
 =?us-ascii?Q?/Bmv6Zoaf3GG89DoWl2m72Q46NlCXbQIAw57bo6jUicy+lnQVcP7xbCm/iI1?=
 =?us-ascii?Q?gPQes/HhncywaFDAopW4bgM8T3gCJ8xFH37yMQRUUbEPxjnIGmI3UVxdd6hT?=
 =?us-ascii?Q?uwkvvQxz7AQT8pcOzqMF4lu+aD3qnMdEy25ZJI+ANU+lLovcmKgDGp1GqPSs?=
 =?us-ascii?Q?hLIoaT8ejA5OGHL7DZD7e8V40Cc2JT/qGQCIxVGtFwPZ3/XnXhv/MMagAhDw?=
 =?us-ascii?Q?ndX6MLzf/DWdT+CQlI3OI9gPP5K8Gp77urB2wXVwMaoe43s4Lk8I/+4YzdKI?=
 =?us-ascii?Q?+d++yKQUPAmIZWVOsqoBkVz0HsVD8qu1zqxfY46ZQ8WnRORFoYQyCtwb8QES?=
 =?us-ascii?Q?Bc/n6xdVI/2AmCTmq99bjWM9S57m5yKwyHukZ1UpeSPJwutivYllscjHjIku?=
 =?us-ascii?Q?hmhKr8s2dypn3eFDBef3zqgxHh6UtyeJvfJdmEJSeAGWtofz5UJ8Asoq8ZB3?=
 =?us-ascii?Q?bYYv0ZB+dJoQoF6vnbpJ+6Vzfe31L4yLymw/otmlac6/+ymldIXhf9JBYgFH?=
 =?us-ascii?Q?BzwklquM7SWTlaNMqh8pnss30kbaGcA0pwcYpkudD0ZL00JAPl/1PVJGooHX?=
 =?us-ascii?Q?Zf2yHkvLaEvnkfXuTaf7mCsd9aUnzFTOS2lx6XVjdvKin5yKEDFq7HHXOgMO?=
 =?us-ascii?Q?Esn/Jz+5NSJBmJN/otTnCJrf46Ms2l94KbkQwHverIJas/c0Z21/SKZrOf4k?=
 =?us-ascii?Q?F2Ko9RlInV8MVCqNboQPYc+CwgO04xgtsreJrvz4p/EBzbm9ujgB42EPLSJy?=
 =?us-ascii?Q?V4Og68nFDuVlXd74C2FkQ/08QbU4Oh42grujQtKvmyuugGA/9izkmr3Ojbch?=
 =?us-ascii?Q?PYQw8lQeWwksfG1c/Jqce76dUIgl+LZ/E7/uHYkRftsjo+FUk4ryvxUnlFII?=
 =?us-ascii?Q?z373bmuvmhisaoPM8Mg4JWbOIwbWLsJUmxAwBf3FFvSWgVsiXt1PX6t6N5fE?=
 =?us-ascii?Q?lqGQ7Usz3awT7yj6z+c76w+fiXKJTYAI4F1s/c4DMes7Tqo3dJo2wi3mvB8M?=
 =?us-ascii?Q?zyojTOBbeu29oEWFHHI31bjyLj0N0DBrR57ybDhXbX+lvxfLdTSTtPFn34P/?=
 =?us-ascii?Q?09eKwtWj5QxV8FJ/T1vQPI5GqwEdfLvGy3RmqH5do/+DPbbNadWyN3KuJipm?=
 =?us-ascii?Q?GgyOK+EirHpQFeN7rgejx3dkotiPgDvOssr14kIF+Nb+/4afqCkkJz+JcbQG?=
 =?us-ascii?Q?MQ88TNlXBb3kGHP8Fx0aNqvomEytkVaO8bdpYOYBqw/SmkLogz2+CODwhz00?=
 =?us-ascii?Q?TkwmhcSzXvyzSZ3MJTFPWUezEWPwj2pq9OZARWjlNvRmQUsLaHQLwwISPksc?=
 =?us-ascii?Q?JZOBFDbjJQg2WxA9K+gk9gXE2HtFmFSXDVIQOlvNqf0GMGqqYobNtZHr39Cy?=
 =?us-ascii?Q?iOqlQHA6ahdhE8KBD3bR5AmXOUGyb8GUq+X/Vn+BPlWyhlj8RTj35xBuMckH?=
 =?us-ascii?Q?5I0JDwT7S2tL8WYYJYk09zK6B+0g+icIu1e7cp+6E+cQQBPOEcR0C6srOKkq?=
 =?us-ascii?Q?lzGCXq/0eg=3D=3D?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: 866e2b10-7b60-48d4-09db-08da270814b4
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 22:08:08.8942 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HsoxQOQeD046QkejsMWGajcfS8EFLm/QRNVmf59MQBE4Pd8wgeEomxPR2EnZBlOV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3P286MB0996
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_150822_376280_9CAD34DF 
X-CRM114-Status: UNSURE (   9.12  )
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

There are no single-letter B/K/J extentions,
as they are never ratified. For P, it is still in
progress and not ratified.

The ordering constraint of these placerholders is now removed
from the spec. By commit ("Delete more nonexistent
extensions from the naming constraints") of riscv/riscv-isa-manual

Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
---
 arch/riscv/kernel/cpu.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index ccb617791e56..53a061ab0743 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -113,10 +113,8 @@ static void print_isa_ext(struct seq_file *f)
 /*
  * These are the only valid base (single letter) ISA extensions as per the spec.
  * It also specifies the canonical order in which it appears in the spec.
- * Some of the extension may just be a place holder for now (B, K, P, J).
- * This should be updated once corresponding extensions are ratified.
  */
-static const char base_riscv_exts[13] = "imafdqcbkjpvh";
+static const char base_riscv_exts[9] = "imafdqcvh";
 
 static void print_isa(struct seq_file *f, const char *isa)
 {
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
