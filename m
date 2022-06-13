Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34154C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jun 2022 05:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7bCsXCzCdSro2tThsjqXop0SvMWIqurmBGNyzVUxWnY=; b=CVbI+42AQ+jvHH
	p34NUCny7BPNhRHZIdRgXID9wWaSD+7B9FDT6ZL+qY3vkHx1dZiumyD0hTZOdbDS7dQRloIAnUMBi
	NSCjLDyJw/v9QNS+kRW35h7vv5AOfCRiqvYbHpxqD+DHmS9YNYe2Y9phAaJS2NdUp5O26h12MZspb
	pHQ9jEDcqPG6jfzuGiRs2dzJulre/6lep9a+CxG/f3AFpOXdWQzdJC5hLqULY3BEICOwiHdDmzxAY
	YH/aFoo7KgDC8UNwf0qL7/VkM8uLIwPYYJaNpnV4ne8gqK22ntZxmBVaCk2GDPcZYzuirA0VXmeBl
	0Qn3PlZghpheHlp5ZdIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0cVG-001Siy-D5; Mon, 13 Jun 2022 05:20:42 +0000
Received: from mail-dm6nam11olkn20811.outbound.protection.outlook.com ([2a01:111:f400:7eaa::811] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0cVD-001Shd-1m
	for linux-riscv@lists.infradead.org; Mon, 13 Jun 2022 05:20:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D8O1j+xNvZpYlmkkVpdhiL9JXRP0YvRZLgm3qP83M+sumnGB+sCZjrOKQBRSqJZp5QFW0+3lZCt+tSHRdx9XygTJBDklR4tdJmDrlg8UDukknsvxQ2By03iwjaq1eLir4A4YZxkViWt5swJ+joFjICxppPUSfKmAPxF5QMyoBDCM9m/3Ku9SB/D61rVvJdvhPcJF+dK4uJdbQbLD9DcdOBcONW1JCY9OrW9ePyjjztpjY8jOVLewRUYKFxYsrn7jErGq5TeU1QdmoUnAWArG2LaDzTVxYjHs98hyxc4S07q+QE3kODzt+DU4+2Jabn+i+KzWYAXTwq5M8GlOB7b0FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B9Ax+HbYfwrN0caNKi3EQjnbgZLAXg6QeUpIf/ttvWQ=;
 b=V3GSadrSMDM3Xe7T4uZUucYiw4qRpHIrWeN+fYkzoTKS/F9t3+4FBB9ONga3Ne1vhXP4WiKDcKT/9XnBiLdacGNCzWnoSQz+1UVkkkB5jLeF4GgSzDuKibbEaDaT7nCWeIqvwhk8uIzMDSM5KnNWWScaVwDfaV5dwyY1ViEyoyh96wUVqNC9LSYrUDNQlJI8vJJepbQZFYi2cfg6xv0d67dGXYfPM61LVsD5ZHvK9zlcORamF6EeSLdPultrYZ4WbO7EtePh33/O2kXkytgN+JSJ3t8neK765BkLJsCuVEr/bfnb3bCqO+ke5+qTCR7CGklDrOPH7Xxn0PQu/KTfCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B9Ax+HbYfwrN0caNKi3EQjnbgZLAXg6QeUpIf/ttvWQ=;
 b=Yz23yBJ8JFlwmmbqLpjxXPXollxWfKd4GLKHUZijEjfiFo9AUlBPTcbmhTgEM24odM3Le+G27s8ArbpBWvfSD9jYWjV58y6ZI0xPtcP+PJBYPPQsy08Q6G52cHbz81lDsvpbgk0WkPxY7pNRHnGraMuldbKmdO5oVl4tBo3J+qK8mrxYHHpZy5NQ6vRMqsaYq2LnDE+qlzzHFaCwPG20M4JYuPNndjl03akzl6rfZYqOavElN7zly1nK4FoISBk/JcQTXRQmYQFdFZLu+0THW8OPr7qb9CAf1qcJjLyBIt5zyJdQ2RFCMuWLV7v9WmTGfZnlZQjDTFtx6dpNU2WUYQ==
Received: from PH7PR14MB5594.namprd14.prod.outlook.com (2603:10b6:510:1f6::17)
 by MWHPR14MB1694.namprd14.prod.outlook.com (2603:10b6:300:135::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.19; Mon, 13 Jun
 2022 05:20:30 +0000
Received: from PH7PR14MB5594.namprd14.prod.outlook.com
 ([fe80::ad4e:5917:88d1:c56f]) by PH7PR14MB5594.namprd14.prod.outlook.com
 ([fe80::ad4e:5917:88d1:c56f%7]) with mapi id 15.20.5332.014; Mon, 13 Jun 2022
 05:20:30 +0000
From: Celeste Liu <coelacanthus@outlook.com>
To: Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Celeste Liu <coelacanthus@outlook.com>,
	xctan <xc-tan@outlook.com>,
	dram <dramforever@live.com>,
	Ruizhe Pan <c141028@gmail.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@kernel.org>,
	Yash Shah <yash.shah@sifive.com>
Subject: [PATCH v2] riscv: don't allow write but not read page mapping request in mmap
Date: Mon, 13 Jun 2022 13:20:23 +0800
Message-ID:  <PH7PR14MB5594801243EB482C01963A2FCEAB9@PH7PR14MB5594.namprd14.prod.outlook.com>
X-Mailer: git-send-email 2.36.1
X-TMN: [B1cnbDxTCThT12cLyQ0PryPnM/nOS4g20Pcy8w0lUH9EvLYmGzV8OG0a6K1sAZml]
X-ClientProxiedBy: TY2PR0101CA0032.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::18) To PH7PR14MB5594.namprd14.prod.outlook.com
 (2603:10b6:510:1f6::17)
X-Microsoft-Original-Message-ID:  <20220613052023.63287-1-coelacanthus@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c63a832-258c-4183-d753-08da4cfc6f0d
X-MS-Exchange-SLBlob-MailProps: 	c5DxU4rKaXn3YlxdnLAu8Crp96QAJlZ4N49hJA9vcGl/Hj9fi4Ug0o2jwT3RQ4OL3cPnlmEeUgftYenHwIGE42viLB9yIXnnckY79f8XlE7gtQOJUBhZOoUDnEfJa0tvoM00sXpZqK+cXou6UZu19h8hQQJu7law2wPyOAqyOOxPkrzEaCyDauRm8qMmHliCG8RDRjpQ/4dYUsgJoYj0wqUrksBWFZ5ubectHaNrvp5vYrShNT9Fal68OWDL08qdU2QA1gsmZ+KFaUndJXIucFc/oT2qyh82ZUNPxzENFrDMCJfmmxMYHWMSHR6OIY/VO1WLrmC194IgIu+iOHCc1iOZc6yiB82heCm5IQtsfkbH9aYMtfMEWY+m2Jw088rLSDShTmSoudC6o5iaWnXhU/JBYw/8kxwlXuMrpX7PaypccuaI1r5x5XoZJMd2MRfcBUaRbzze1iE3nDRV3iuRanYuOG4UBnJPfCO/9KY9LPlUtdN95DgTA+FOu1wRqMputlUTkrXRzn0bW+zMNO0/OeDW/Bidclcj53Y2auOSnUTxTOzTnX7awWFR4LVwKN2TDIInKsBfhqIjquYwRoX36uWAHgkS+uudb2FiE4RzHDg/fu/3kLKR0C3M2ndgytOWTFTc4MaIOqAFwzuaHWz/YS44nBPA+mVgSAoEYALCpLIGeP7Ke/AHbnEIkFjDf+H5Olh5076MZ4G0e59739ZeTUJw35yCgCL2DiE0P9eU/sU/xwOJxO7Ny0QneFvgZDudE/URVSgflltQQyNh/zky0vXvcC1QCY3FwWur189SZcw92xWUqESYPG1tq6OyImfeGPdwYZiew3WJumabRKL+YWUgX984o+Ge
X-MS-TrafficTypeDiagnostic: MWHPR14MB1694:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	jihMZc5oxYI33C8iY3qIxBsARwYZp/puScyDkK05qJ5Ob4xT/2fvUe7sPgcMd7j7diwwhW6NAQO9slQZlbyGXfhEOy8q0vwS7wl7ffPXKpFFeQXseuk4h8NvjCRTvuOfNsxqafZS/L1K2Ulx5P4U5ulLNrzkCVVs2tFdkYAeMXP3gU/p2vLfgBNgtXVLTm54xt81nhT+dvB24GSkLHoa1h6vGuZLwYVRf7kbfHc7/DSudW16NrfzuHrv9C6/Sti7mtrBPx9m1xfxORQ71sgoSYHG+5NItTRxfMHc9JemORZ0x5rPcKaNgMrLpmSQEM3hI1w0d/Wkv3KIkoI4aR9Ml2fk8w4tV8ot3WBlVrwzwU+pyONm40WPn7IPaw8eDh4p3CCSV5cG+SmhhoXt8lsYt2n2UhsqOcMFrLeYNOZs9As5i7TskGmvMkELb4fGgnEWzUP71hYgd2oDwRw0VLCyfuXm5EwmyHxRCq0uZMnldLa803Bur1V5tg1eRHhyWRU9NtMR8fvr1TxwbjYkCiKku2LTgMkeAaUDtXdcSNErxZp2E1loCa0oCxUUfZnMoZJWR6moF5ARZobOYgsSEEovtC+fB0W2sFdvluUBi7o/i0VJWTn8x34Xeo0lRsaKcDIMYl6Zw/wdosIfEqlB3IkV+g==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?9aYcLeHknq1jDhexSBAKS+J/mZSCF70y2L+kX90wpCOulYejpMmwVxepcNMg?=
 =?us-ascii?Q?WfdNsMX1eKJrlS5+jGRAzo0FyirSDcWlpgUURh8TQSTe3VVRMUlm4N+U8lP0?=
 =?us-ascii?Q?4V2CcmoOa+JBmhPIqxA70ZqaXbuAWqmWK3lKc3prPhJTpDNKhk8gFYjX7459?=
 =?us-ascii?Q?KSj8nXrp7UV3VcdsnZZjJL4cmqkdPa/22WLp9w0gFrOxWh9dUiGKQb5E6cZ3?=
 =?us-ascii?Q?1saFVJIfHkCRrs8N4FtghF85IZBDw1WdM9oxLm78HPyMEIdShVU/YL6wIwQZ?=
 =?us-ascii?Q?38vHqxIAf4ghpYKi16Pp+FEwyqcpAxtlbjsor89w4jPHaGETzjQIka12z0Or?=
 =?us-ascii?Q?Tvj9PIFJ2lvCjl1owGQHn+rMAEHkkVJC0qdt8sS8sOcJZi57rG4mp+F5vAVP?=
 =?us-ascii?Q?jt/GiSA3IW/qtzC+4slqFQhKITfh1jFAdVfmoCc/h4qMU/ic2GX5FNdQ7rF0?=
 =?us-ascii?Q?iZh6uDRto8Zwc1m67O52r2z5dv+c2Aqq1VXmV/NTZHv0t9DvhY+3fQGJV5GO?=
 =?us-ascii?Q?YUHnuTKrg8aZGqAJPc6YYulriuvwaog+Md5sTYWkIbx8vL1MBr1YP4k7h/2Z?=
 =?us-ascii?Q?+gJLIY6IsS38KZZ2D8psZDncIOmPwvZslkhIVsVGNcwkdPXVxZvE3jXz8Isf?=
 =?us-ascii?Q?dgoYMA3aF1SryXsiiEgqYHSP/V3NLYbO648SEM4kw5wA3engdkKbwROOAk8Z?=
 =?us-ascii?Q?iCJ8vyBFwMK6CEkbBFH810DOMlMZtNiMyA8dNs4wywbkADJ2LVEpL4fj0nuN?=
 =?us-ascii?Q?/fqs9rofJFRT6miLgnVdVZT3tIEnE/5DQS2jBjSsWmcUgUZ5G7cQDCrupwJK?=
 =?us-ascii?Q?HrJZKiR1gquOZsuA7umK0rgiyl0TIo0nB+ZzzGx+7bw8xZMyDIt5H2+hfNgk?=
 =?us-ascii?Q?U8faVRoJA7yIcQlm2C6Xc4w+dEqNgRonaE2sqPbRBVLZ5QiM/SouNQwEvx73?=
 =?us-ascii?Q?V3HQOde9roIOwXZoyxMlguoQrI62DnIVmgXaZZHrGqMXN6lpoEyv/BKV1yHY?=
 =?us-ascii?Q?Hc8p8tHfyVG6oPgX4RYyyD10ACN2etXETKwlpABKhXuDVcw8auo6MFDHk7Lf?=
 =?us-ascii?Q?t186j24Pz7FMJQ3E/4t+iKt1U/Q4FTDfJlhWB9B1Xu3DejnqEQPPo87rdmNy?=
 =?us-ascii?Q?9cF1ROyevXOzcnC0xtXWlRX7lm32N3bJ55IZKyV9xIaELmhfoaPtCAB68Irs?=
 =?us-ascii?Q?eU811Bmmc5sgUONky1LFfR3Xl9/K6OZwqQn1KynozAfBwOtTrSDulPJbCoqW?=
 =?us-ascii?Q?Dhffz5vvhJWFOFYA3OtpberGIq9l9JybFKiyO8Kc/HkfqI6F/JQE0iB393bP?=
 =?us-ascii?Q?lklJdTtCUxIDpY7kwKMubB1+oIcZ6zFTOos9Wt2/PRCpICHTk6rVsB5SoDLh?=
 =?us-ascii?Q?AagoE/UO4HCUNdPkpWq1fMbQPxkqOE5lk9F1GSb0HAuL8vz+U123wyhODkgm?=
 =?us-ascii?Q?QMXHVX94LKsikxNrQ3NFmQ6U7l3uhViv/g9Yl2mYp3vP4U3TTh2qm8ZUYZlF?=
 =?us-ascii?Q?3Nf+mcU1l3VA3gj/NRaO5BFgJoXfoEdJHhiU?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c63a832-258c-4183-d753-08da4cfc6f0d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR14MB5594.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 05:20:30.8117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR14MB1694
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220612_222039_147751_C38A8995 
X-CRM114-Status: GOOD (  10.98  )
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

When xctan tries to run one of libaio's tests
(https://pagure.io/libaio/blob/1b18bfafc6a2f7b9fa2c6be77a95afed8b7be448/f/harness/cases/5.t),
it encounters a strange behavior: for the same PROT_WRITE only mapping,
there was a discrepancy in whether it could be read before and after writing
(readable before writing, unreadable after writing). After some investigation,
I found that mmap allows write only mapping, an undefined behavior, on RISC-V.

As mentioned in Table 4.5 in RISC-V spec Volume 2 Section 4.3 version
"20211203 Privileged Architecture v1.12, Ratified"[1], the PTE permission
bit combination of "write+!read" is "Reserved for future use.". Hence, don't
allow such mapping request in mmap call. In the current code[2], write+exec
only is marked as invalid, but write only is not marked as invalid.

This patch refines that judgment.

[1]: https://github.com/riscv/riscv-isa-manual/releases/download/Priv-v1.12/riscv-privileged-20211203.pdf
[2]: modified in commit e0d17c842c0f824fd4df9f4688709fc6907201e1
     (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e0d17c842c0f824fd4df9f4688709fc6907201e1)

Reported-by: xctan <xc-tan@outlook.com>
Co-developed-by: dram <dramforever@live.com>
Signed-off-by: dram <dramforever@live.com>
Co-developed-by: Ruizhe Pan <c141028@gmail.com>
Signed-off-by: Ruizhe Pan <c141028@gmail.com>
Signed-off-by: Celeste Liu <coelacanthus@outlook.com>
Cc: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: Guo Ren <guoren@kernel.org>
Cc: Yash Shah <yash.shah@sifive.com>
---
v2: This version adds a link to the referenced spec, and reference of the 
previous related modification.

 arch/riscv/kernel/sys_riscv.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index 9c0194f176fc..571556bb9261 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -18,9 +18,8 @@ static long riscv_sys_mmap(unsigned long addr, unsigned long len,
 	if (unlikely(offset & (~PAGE_MASK >> page_shift_offset)))
 		return -EINVAL;
 
-	if ((prot & PROT_WRITE) && (prot & PROT_EXEC))
-		if (unlikely(!(prot & PROT_READ)))
-			return -EINVAL;
+	if (unlikely((prot & PROT_WRITE) && !(prot & PROT_READ)))
+		return -EINVAL;
 
 	return ksys_mmap_pgoff(addr, len, prot, flags, fd,
 			       offset >> (PAGE_SHIFT - page_shift_offset));
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
