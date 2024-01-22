Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB96C47422
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 03:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SbyLfFk5qSIyvRf0DWcolPZtAmdJH0gazKSEnOIeg+0=; b=zCJexLLc+kLRPF
	QAoj5kaSOAgvOExRRggYNo9CiPFKLNsT5EU0/aBCLmaycZpVuasVlIVEtBmlcDyRoDGU5nbANuQ1j
	X1oidgHcnYVmDw2zKOQ4pyvRd367y5ZzprPkHTC5KHh/PaPGo7J6NaJbr/Whus24q8HdJRbP6kPkl
	i5l08GVi8cwzgnoFVvLppR3HV9ftLe8xyORlaswvPx5r20jNC3CqWYZXwIVJ3ps5Zke+d0APCgrLT
	rVYjioggUbsxgRuEP9d9fvjuGfw8V9pgh1Ov1+4oHAyiSs6NWS+6zvl5VJcA8WjQrAeohe2uc1CiI
	p+oNR5LfpZuZdOjqz2gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRkkZ-00ARIi-0C;
	Mon, 22 Jan 2024 03:13:27 +0000
Received: from mail-dm6nam10olkn2025.outbound.protection.outlook.com ([40.92.41.25] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRkkV-00ARHi-2e
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 03:13:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ez5C4JfLMfGcm6L4fOamCSINY8KbPxEk1wb0Dy4pODdyH3K3ijfMOjAfITuVu3/76CWq7I/sLPY6aaTA7OrwH/G7Z//hEC0CSNHIs52VGTCFSklfiMmdjY8NZNdbuKCZkina7QnZDWE9lZi5zchkvfkhAf44bb7V1w9rpxJ0SakUUMXXKvs8XSQsIkFYe/zNIMiFx3kZxGx9gEnbYT/F/1/fo3Zkr5ZQI1nVeDamoNNdOctwzAsQBxqAmhekVAluvvZ+Vpca/7+5dArnyHXMlj4Lid+rQYdg9zbXVlkwDAYLCMZtUdKUZELxc/GlOewZS+agRnhrRiIwPclq72D4Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dppiFX1AZDIsT6FBKPOB1fRDIcdpIl2hgF7rKS6Aj4c=;
 b=daMvdGq5EZcS616uCVEZMXXbw4Y8fj/EGMU/N3CH+agAOt5z22B8IG18SKyrsSaIc+2pX7vLBQOu25wQgN4x+4Cs6zH1m1NtofmnNB1pcqlZ41vGaw8gfqEaSdtvMt689ZIRGetpERKXuHHKmnUNgmhKe7e/sGbw28DlgoHyAEHUOZdR+forpj5Qj7GSomxWTI+MHELQjUv2O6ju1F3xShkbUHIphtzQDHKrLX0EY140j14hPh3U9VCmrPbKHmtxATpKWfYjmj/B8sCQuol2X3JxbihSN6N2Bls7+s8R8uM/+xv5AAs+yVc/Uy+ZxYrkhiK0Ul61pePYgAqK6niitA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dppiFX1AZDIsT6FBKPOB1fRDIcdpIl2hgF7rKS6Aj4c=;
 b=Ig8K54crJXeXS1fEBtEV3aMjHcithXKVsdH+mI7HPiXKnTZURHZDMM6TngO/RBvnyHb44I/0kg+lCdA9x4xNBvEx8pwtwNnIvqDnDNmGRk8EnTSqEuZw8SYf22uzgHmxq2hgRCaFA0EKN/wITg2rh2v2hTYqkJYtj4rRDSH2u0wGIeM5Y6Mp3fH4LmHPwrnLQ0yCp9fLC5lJAMsV1qdlcbxR/arzwDuFnl6IaG8yBrs3Br3ZRkcF2lCFYJqFokkVY+QFPupeRwlzz0iQbAQdP8w667wff2aYzsGcw14BXkpdf7x0Y1SNDHnUcX1xGhE/rJo2CAOyC98+QVauWYvdqw==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by SJ0PR20MB3724.namprd20.prod.outlook.com (2603:10b6:a03:2e2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Mon, 22 Jan
 2024 03:12:56 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::406a:664b:b8bc:1e6b]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::406a:664b:b8bc:1e6b%2]) with mapi id 15.20.7202.028; Mon, 22 Jan 2024
 03:12:55 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Conor Dooley <conor@kernel.org>
Cc: Inochi Amaoto <inochiama@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Xiaoguang Xing <xiaoguang.xing@sophgo.com>,
	Guo Ren <guoren@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] riscv: dts: sophgo: separate sg2042 mtime and mtimecmp to fit aclint format
Date: Mon, 22 Jan 2024 11:04:52 +0800
Message-ID: <IA1PR20MB4953F82E9412E55397FE9C66BB752@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <IA1PR20MB4953669C097D9C9E24B549FFBB86A@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953669C097D9C9E24B549FFBB86A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [fsxdhCosybkTncREyD5jtKvZmqzeYUv9O8IV4h90MnpktPZGF6TzeySx7meyJVvg]
X-ClientProxiedBy: SGXP274CA0003.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::15)
 To IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20240122031250.280842-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|SJ0PR20MB3724:EE_
X-MS-Office365-Filtering-Correlation-Id: d30696b4-f338-4f69-3491-08dc1af80714
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BmcobJBsBj9MDN5u6EETkN6sgkUZVuK20dNuQmc/8lFOj15KuT5GstcTkzJbDpd6pGcC3gy3JNG9uAwGsRpaKq90rEk+yvJm5WqfxIwXxlf1ng61gpmxnlg3MT6EEkW8uqK7tjZidMkEw+MgZFocWwOTqpz9Raq9Jm7kia1+DVCZj9nedIRA/n5kyuubyd3iPnlZv16Tn6H+BwfZ1vqDKwCWSKh91QM49vRPF2a+HG3JJQdmGghk3WDxlJ2nKBDXCeRPHvhUSQsQZHWkyZs/B8Fo5cgWGCMso4gecQTp5LSJlGBq4iVUfsvO8zPQMWTbIJ4v3nWPSaO8HdAbHXuxcgDER6knYH3bwp8sucS1InOp61sjb+9kALKhMLKnZ9R6hdiIFCz/TtFz7p2gWWBOsy5Cl3kpnGMlZE3bnXW9DVtjbphKxxivOE21cGQiL/oNuyPilNA6UapmAajBlGKcSfMqqIyvQevyLfbxFT3b+FvBFp5s59dE5kju9XamAOO+Iq1zDrm3P1BKTk8bxgkBRrCR8DnLFUiYunCH0jm9PHDj9C+y23IrFXeNeRYL6cj2L34lFLb2i+bFEMFxGYNklFKTZ9dDegnJ1RSiaFUDDzJl2qaIyaHS5qIftY2jVK+P
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DrApLShy60hWV+wmRUel0FCRkQs5irGzua8I7t0YAWHoR/KJlmFV5Ver3he5?=
 =?us-ascii?Q?t1QAG28Vx0/+sfvJk/R1yJxXZ5UvCMo2A4w18C1m2c/tMRMoTzuneldfQ1LN?=
 =?us-ascii?Q?mtKd+GBzg72wYYRS+Ir8Mu9cZ/39akQF7QL7bi8byrJGDwJPBUOkej1J2sMk?=
 =?us-ascii?Q?8a+FdptTQTLQ6BS3/eTa8m6LBxCm8tzAK9pFJ/3bPmsv3v6oT7DHOYtQJiV8?=
 =?us-ascii?Q?L1fL1xWRoRXV/0rBADt8fxZHp6eXJRhxd6hqN4nFkOfXjdSImxkDfx8Z5jy9?=
 =?us-ascii?Q?OlrOMzoT66/mUUVk63ruUlW+M3aKJmcVVG9FfSORn1lqEyf2Oo6xQ0SvfH6l?=
 =?us-ascii?Q?8NKo5sFWENXgLWGycKVpvgIX6ObxAdXFjGACY8JkxfjMhXuVtAxx4scUB8SW?=
 =?us-ascii?Q?umMoDKUj46L9P67kFKdtr++tmPnegelpfZyPcUEEXopdecjdUqIylT9GnwK4?=
 =?us-ascii?Q?FQRZqTp4+64XnUTXTaXlhuGlf1Lk68VSBUD0nLcjcqs3nHMyJ4swnciMjB+Y?=
 =?us-ascii?Q?r6aq3bd84feXyP6M5yJHrIYGSGMdoTbS0DZCNPs/lf4c5G/mcfjNG2Ho3mPo?=
 =?us-ascii?Q?ioihSbLRT1x+48UTekpVnT5aRAr9nh48VCPWaQpkBYndMCbyDQ2culTOTd1X?=
 =?us-ascii?Q?kWxdlYlV82cjm9fnwbZxCSnhUdotzdtyAp/csKmxZQ+q2GehBJhkF7FEc/1r?=
 =?us-ascii?Q?1fGmygdAna8GHmQtYb+t00vSlheSDyen+9y5QCRifcDFB3Wc0hduhRL04JUp?=
 =?us-ascii?Q?q42jRSEHyTdqQClpywBmyDNfYyL8YF5IeelGiL0QwBdIeN3ICf+jfwDlaqq3?=
 =?us-ascii?Q?lm9RwmeWuiQ+sQKodRXUDAz0pWOVuZKi7nZymrl1+2+3G8Smzb0RUMr9GY6U?=
 =?us-ascii?Q?c82L7aBvcwD35yrrOTBlxZdgyBLZn9Ntbl8ppUBJlyzmw6PfIxhnDJzxUIDB?=
 =?us-ascii?Q?bTZI5C+bby/LvYfGjcvB80WQ27X6Q+zOm+QWeOM06DiCv1saIM+3PWBr+c4Q?=
 =?us-ascii?Q?bXewHjg4/i+O2N+hn5MeZtJW5iqiie7EubdZ2ZE0qJJVR4Axf+HRSCFlxE1J?=
 =?us-ascii?Q?nF5FvWGQlM7VFgURREBZAgHseGGlo8pEYPpuigg02feK04HcOYabG2vmGWV5?=
 =?us-ascii?Q?KVfJ7ibHljcyjUq9qdO8pfBfhHY8IqWZx4/VShbVoulhZ5JFefCaDAZKnBPe?=
 =?us-ascii?Q?VcVN5LPb5wcjGPKeYW/rSoJqoMiachqjSRzFdT1tYUbbVURv5DPOJ/oMFaWA?=
 =?us-ascii?Q?XMMZVZTrH+MOoIY2nNSSeFTBwXUdfYaRq+97W1Opkw=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d30696b4-f338-4f69-3491-08dc1af80714
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 03:12:55.5323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR20MB3724
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240121_191323_884731_12747362 
X-CRM114-Status: UNSURE (   5.95  )
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

Hi Conor,

I have already noticed the binding is merged. But the dt patch is not,
I wonder if it is the time to merge this dt change?

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
