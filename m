Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC38C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 31 May 2022 07:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yi0uPSa+Ccv3qEsDnkGdBPtW7aP2I1pRI5/oJQkQVDM=; b=ehu6/8fJcAarsd
	EAzDySEimmeG0qGr/9g5maomFh4UD+2Urww1L79j2sgrHrHucAVHOhP+1D1Mt+vtwxTVQBgVoPank
	vNZpyOUDehsUgtr5Nk5be/Olqr4HrkN+6G09qU59vbVFVB208p3nnIhAsLVa9Gh8/5V0yqIwkvrNb
	5pDh3W5cP/gk3RU5SoV6OwX6DosMxpifcuBHaaT45D20h00QGcTwMCC5vy7h3rTzI2uW9Z0THX/WA
	kFRb4PLpFNNIysOesYyrhymJUOz+WWn7ecfK96ipNd5UP9WtHfY7hipF76+ZWEU4Qjxk0lP8vcRqY
	REYAi3r/3y+X6w7g3eIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvwkb-009kg3-0k; Tue, 31 May 2022 07:57:13 +0000
Received: from mail-bn8nam12olkn20821.outbound.protection.outlook.com ([2a01:111:f400:fe5b::821] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvwkY-009kdw-Tg
	for linux-riscv@lists.infradead.org; Tue, 31 May 2022 07:57:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YZYdpzgyKqxc+9rpiJdOjiUHTbG9n6iC9HTqNAz6ErLuTBVrLnIl+jrNqkqeUJHbk+7HtdfZ8HlEYEFAdTgnSg3PCYBn6+NCqAPlj8m4baMMFx3aNy35sln60XegUOm9MJvdIoDRih9bVnOWO/nv5X74uJtlDgR5qEpyFS+BzdtV3+hTYqeGfQvr+ZXH26z9x1/h2tnKqjOsa4RNgO86vLxBqf3MujqZfsg4GpjmsfOpgSHuiGGuyPm69rAdq8u4toYj65LpTRkfpUBhSZDW0gUdc45VBiHyXY7MgVCwL6anFsFe/+ymUvgfCcN4/1g+eUpg4I9pMTYUyaKnpjlyRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iKaFEgxIhOAW5j8NHqPAFXWYZbL6Pjek2Ki8JAtpMPY=;
 b=CEUg1H9uUnPY33hPbqPbOXZ474lf6SYJpyLO7Ft9cXlbg8TLPBkMd8bxqZn/VpNJNbmf9JpSwtZHZPTX5N6nn+07XNjfVNdeoBBfuJLsqu5i01c5k9kSFSYJ1+Xk2Gmybb1vqSXG3vsEG5Ck1Y5JoinmeiVLvIRG/OlPur/qnSpfEdZlgrJNzYtDGxSW1jlWLm3qaUmjgS7kqOmApdEhv0WhpPk9RNu/PMUByb7AhpZtlgFDsNeVTGHd+KaY9/bj15H0yHtk1OzGRfQVex0SQ29HkZrJHA4JwXBTdXZkyEqZycwf/2vbZS4hoJ3y0oM55DdKnNJciq5SfjZSsS1NaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iKaFEgxIhOAW5j8NHqPAFXWYZbL6Pjek2Ki8JAtpMPY=;
 b=CjvGCifCKKSNorAzajMyIumX9V1+rq7JVOomDG5pE3gTVnsz7tw+dP+jQjcpEGfbz6K1L9q6+9fHnLqyGQJ4emodvetU7qMvczJo8YaNyguWoWN3cbxUuxc1ZOIfIiXp4jpQXnTgn+6pdC/Qk2no0iOvjOee2/n8dsHOcjcEYT9MVBm6XDC2B51ywQbXyvcPWWZnvgGvvd6O5YAcll511Yag/zhnGBZagHd8w93vRg/SxLnF4/El+Wlb2qBVnjGEEvR4MdIXctbKG113T+ZKyFmLqhPxSn6RHYit+Xz4RExmeaho4MJKpPecbHjL2QiIoN3wFtffZzqZKy5ey0ATqA==
Received: from PH7PR14MB5594.namprd14.prod.outlook.com (2603:10b6:510:1f6::17)
 by DM6PR14MB3371.namprd14.prod.outlook.com (2603:10b6:5:1ec::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Tue, 31 May
 2022 07:57:03 +0000
Received: from PH7PR14MB5594.namprd14.prod.outlook.com
 ([fe80::ad4e:5917:88d1:c56f]) by PH7PR14MB5594.namprd14.prod.outlook.com
 ([fe80::ad4e:5917:88d1:c56f%8]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 07:57:03 +0000
From: Celeste Liu <coelacanthus@outlook.com>
To: linux-riscv@lists.infradead.org
Cc: Celeste Liu <coelacanthus@outlook.com>,
	xctan <xc-tan@outlook.com>,
	dram <dramforever@live.com>,
	Ruizhe Pan <c141028@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH] riscv: mmap with PROT_WRITE but no PROT_READ is invalid
Date: Tue, 31 May 2022 15:56:52 +0800
Message-ID:  <PH7PR14MB559464DBDD310E755F5B21E8CEDC9@PH7PR14MB5594.namprd14.prod.outlook.com>
X-Mailer: git-send-email 2.36.1
X-TMN: [1mmzZWrTBc62k2PDNjYiKkFtdHiLFjOJefUvq4XxbO3dETadF6prTkcja2c++/Ze]
X-ClientProxiedBy: TYCP286CA0024.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::14) To PH7PR14MB5594.namprd14.prod.outlook.com
 (2603:10b6:510:1f6::17)
X-Microsoft-Original-Message-ID:  <20220531075652.105213-1-coelacanthus@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e300321-c24d-40ef-7c3e-08da42db261b
X-MS-Exchange-SLBlob-MailProps: 	6H6McBavlAgslkIVMrANCHevtAMKWYtiHiUBusml0JOZhYr4P1HKHIWPO51JOvs2MFGIk4bkd9E1B+rz7c3+5izj0lY/XXmGeDidpYQ+6VQgVosB9mccktGI9g0H3D89T0aHcOhvAvncFnMF3gGKVYhHcfjGlyjWJVGr022Lut9uaUYZcEoTsdO6yYUMJV6TPHBvEq0Oq/GSYtrztzq2uk1UcCQlInefF05ad1wXsh6AT7urQSqaJNqwK5ODt2BMdc31U0RTHLTnqjwYfbeBUBEl9oa9VIOH4/OPRDoj3wNH+YOfBM/+/k+0bS1HxXqiZHdUI/dzwvyfcbWJ4BaPhVI1A+I0N6us1geU3NmZ3j1iNtoF2AfnS0nUNZq9ff3JPz5qLYZ06Zyye66Nt7IHoupFlgh9vzMjkEYRavy0BjF5Eic/6JCTYNWIJMBaY7zD/qLTicSf48FPMbEgrsPP0zbHbDUPneVQ77xKWwvQlxaVl5qT+ibGWL6HkgjB7UUd8/zbluhqUmgmb4klx83IzUlgWola9+rhB03edXqCeAKLGpExEi/mvzawIogJKy9Mk7y5S2WTfsFkd0jbflLOioYY+UXS85RAh242ZonCN53bODWHwJfzxVS0N59XGPKXyq5i9QMsp4tfu1/XHdslUsRqZ8gi6UeVFW27WEK6Gx+7Avcz4Wo61XzftyJabD23d3WRMytxHz2dZLbLmCHjvl1Gvs0p4P//+dpuvrkK1AXOwiNAzeq78+c3huBtuDn4M06s94BklsA=
X-MS-TrafficTypeDiagnostic: DM6PR14MB3371:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	7n4mwtJCIoPheIkb8tROGsoX5oiGiqAb8YObD4cDxnWtJ1uWT7Lk+lcSCHJV2qSE/YnCQ/Plgya7sXY7FvcFt0yzDZ4/Hq490VwIAMlnkM/5GXLLiKRhYNHGigwkYqgyo8BRz++qIoQ41M6RffY6wj03TKaPNUTti72K2GJ05qJEb+yhCoh4LHa+B43SGmxaD1C8vDxxTQ53jqkQYtG1JXxQOOS9SMqlE1OAHBxFouWPyCcO08elfy8za/HTsGque45heS2LqOpJSn8ZlpTrfBsMmhstP1dApFz4WYUvx1PdJPMibKmGRAZEqoi20ylDSjzLPvXuZXTKnarW072nG2nskah6khvesAA+f7FAq+oPeR1Tn4XBuK2lp0+RcGx2DG1AZpkXcqx3y2XesGWASKrVBmPBcjvyo86qcRutpCZHghx0CQ8YrXa4pw0BzoUa3SSXTWLMDP+IBWX7Hxfl9kyTGtfcZqKL9QOQnOYCsySOnk9rBWmBOL2frNkMa5kIh2xDaPllC/6ogSTrkZVZ1V2Ga0zDpwhWccTY/wixMkVtFp6zmTRSW2hlKDeYnyRPEhig0VNLrxLhGK4CbzOS4Q==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?qosLkmHeUimxzKZhNzgIWnO6UehEQctUjVlglY1FKjPMkvYRS43b0rRKDxOm?=
 =?us-ascii?Q?kVILA9mn1FsyKm6qt4VYpSYovaKBrZwNXc52rOOcOCLou2ySd1Z45GtYYz1Q?=
 =?us-ascii?Q?VZA2RWqRy3G0CaBuzWRWc45uGybhIV1377DFTGwte1Me2nWmo1/OytLu+Uaz?=
 =?us-ascii?Q?MDaGiVlA5LcnUUSVx2l1CYwtBCT+mGqcrlpMrIn1pVayNdblY0hloQGfbFum?=
 =?us-ascii?Q?2vsNzs6AUrU31rI/GrUSeIGCnIOdnavUO3YJId1O/XAoPiysyTlsIvOX2Xgs?=
 =?us-ascii?Q?IkNc3AbAof2+qdYaIoYQWzUvFHnw202+2q8sCQ9uu7Km1J9OrY5stqsaNbGe?=
 =?us-ascii?Q?vYhZ08dTvOsaQoJAFVWTkJaC2ve4Mok/zbB/ShDmrwDNrXcCsgMBM3Sq9h22?=
 =?us-ascii?Q?7Jonh6uxszU8UmGdxL7NCioLMTqIxQ9qoGm5t+cQA2LrhS4Um5IgoPBnnPEH?=
 =?us-ascii?Q?A6ztqLwR+yDwgb4TXSxrGL+3jToOrvo0ZnetkjRRDdoXfuQEWHkE51P6DY/T?=
 =?us-ascii?Q?LCdZHb//svuqn870UBtPQfMSvk7q2LE+VhAaof/+xWPhfxGJzVEv7nPjxrOM?=
 =?us-ascii?Q?OG8bJdeSJG5vbwfDihgKJLGXndz+45yBrl07IuiV6SbOCy0KfL8GufYrI0hD?=
 =?us-ascii?Q?u8ZDd/WAYKe81Tlfg68qLRDbwRMHivJl9RwMHkAkAt/kJ2WHCBQYtWcUXx8K?=
 =?us-ascii?Q?HUbu3Z9gjN4QGW1eGZo5O3YEDmZZPP1nJALfiWYXk7n16ASvB0mdXu/WlviK?=
 =?us-ascii?Q?KmHaXP4MCpR3K4gUG0K0kl28Q6cEY2StEIherAYTJGMp/gErzTt8g63awiOX?=
 =?us-ascii?Q?Qhc1LfkWOH62DBkC+AuyLbHxI4bR1kcubBLrLMAN4bA5RUY+Pgs9L9L9nAna?=
 =?us-ascii?Q?hsTGguw33TdP6aZAISUVZXC8SJuwKGZK7HMnbVBa2oaUmeL63V/gUHZgZmC6?=
 =?us-ascii?Q?vCrdaEyuEHQL188V5auUxYowc0CoUjirMZKSrD/OEOy34pqsCi7dYAvYZ8fl?=
 =?us-ascii?Q?N7EGWH1eENs9o95vEcbs9q0HZAMJWU9NdUqOYwb5Txb/3f9luPg4T8Qr8Doy?=
 =?us-ascii?Q?cz+uKPPFE9eYe1PC+70NZbpMcL0WtTwS+KAkfgfHIvGmQUclEsIGg3CvrLmH?=
 =?us-ascii?Q?XL3LgpV4/62rkWYPBVE4tUl5leYH8wor4o3SldXdK/N5nMKlhF1ubKrfIh6e?=
 =?us-ascii?Q?athMJL/2mHSx/42NRTkvBBk7sg+qMuqtUSU9U6ETyc8GT+41uFkZdffLWYaM?=
 =?us-ascii?Q?8MasN1NZp528fyKJuHtmm8S4mqTQOOkiCdhqhPRJlTCXFLvRl5DlNXN7dno2?=
 =?us-ascii?Q?5r1QQBFVQHivapn56FfRzWLJkzV66IZKARr39UrLUqZCWWgzsDZNgdVjeB9V?=
 =?us-ascii?Q?R7ovtXU69ZZlGUe7+5GbZq52c24n3VAoozLUQ9EYB4zMdh+9n39o+W1bBKvX?=
 =?us-ascii?Q?B+wDKF/Qx2guIjUAI403NbSKFw4A3kNdCfgi8ltjauBNqQx0lBiQX8ktX9QM?=
 =?us-ascii?Q?p0FYIJkxvNkOMvhqp0k85DnLE23y6LW13Qzz?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e300321-c24d-40ef-7c3e-08da42db261b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR14MB5594.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 07:57:03.2671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR14MB3371
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_005711_009331_A47B39A7 
X-CRM114-Status: UNSURE (   9.06  )
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

As mentioned in Table 4.5 in RISC-V spec Volume 2 Section 4.3, write
but not read is "Reserved for future use.". For now, they are not valid.
In the current code, -wx is marked as invalid, but -w- is not marked
as invalid.
This patch refines that judgment.

Reported-by: xctan <xc-tan@outlook.com>
Co-developed-by: dram <dramforever@live.com>
Signed-off-by: dram <dramforever@live.com>
Co-developed-by: Ruizhe Pan <c141028@gmail.com>
Signed-off-by: Ruizhe Pan <c141028@gmail.com>
Signed-off-by: Celeste Liu <coelacanthus@outlook.com>
Cc: linux-riscv@lists.infradead.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>
---
 arch/riscv/kernel/sys_riscv.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index 12f8a7fce78b..8a7880b9c433 100644
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
