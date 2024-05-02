Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4283CC4345F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 May 2024 07:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4jxmGGO5icDTMh1w+MoMUgOXJZL7/YdE0lR8bulwpFg=; b=dx/M+VEmrmNruN
	kI3SUWcU+mMbQGJSTNDeka+j07b53qazg3n6nI1yra7ZjaxUSk0YekNYv34mbCJNu4dUSNRkKTAeO
	kh63hrvB2CfscbiYO6VQQnmih/g0mpxHW4Y+9FNB/KRMfDmI8bkNToqsAh34NTfgtAW6wrUJ3nMo9
	DTE4SfcDBxWGjjiPUWL0+VlBDG8oqzvLzdn9bNw1Ayxj3Kx2dMSvXhf1y4huqHrmr6OiEdMEHkOIW
	E/1NCWXILSN+wcqqucsWfmhZC+mrZswUIQtX3scgpiTuACZUb8xk/TenSGHldbIYki/UoQJvvzuSt
	5mjkyhHXIssjfWoETflg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2R1D-0000000BpY9-24Mi;
	Thu, 02 May 2024 07:38:15 +0000
Received: from mail-sh0chn02on20720.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::720] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2R1A-0000000BpUz-14uv
	for linux-riscv@lists.infradead.org;
	Thu, 02 May 2024 07:38:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iwnj0oc8QC1sTuH0pFPfl9dIX0WSKoJ9dY7of9otOlXXw/JdONXV44VnK6vUZKAl9kR4I6qNnu9NWzp8l0VYx9qxC5YninwChjQIfJTScenqdcp+mrq+436kjBQcH/eAdmZ8uEKfdXYsxJCGfr2Bggq/fy3YKjV1eKGFO/e6AqpgNIesBJz1tKE7gFpPb8u2r47/ilgeL/ZrarhswLr9XTPvqKS/3ZQuYTUOR3oIm6ZUY8iZ9nThOpFM+Ml2d1VTJPHnGurQV3MZWQBEEY/q/ZVaIy5YXn1+6IoMCJH0UihYgy8UpUw54aMSJ2gxHnKI9es0aJimWyZWfPmexN4Qeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DuTlWwi81pHFeVK3IuwwlQThbgfc4vp2pRGYl9Ui4B4=;
 b=oIU3XviZoiaXwGKkZ8bmdE8wO7rsKWUS0czm248u6ZUQ56MzNvtmQ8pWaM5MPSz0jAiXHjWfTWIZ1ltPDXzmGdpmug10DEwAjj/5Vw3mTJl1oVHQu/nK7wUAz9cHhIKv2ncYCICIDT9JtxiPLJHs3lq+B7XjrNgFGBun7MdA2enSKC5Bjy4yL5K9XeGSD849esjPQoPDY6IOZz1Q6V4M+ACzKktu9ngoQS1248lOKM50RU/s5TQj/asv0yT3L/YRqmzPFIBTqpIW/WbFEw5CamuzUM+C93d1lI+YX6dpGMdm/MvSZGPNtvLFKGH3tRy4JNOernPUDmFZx07kyYBPkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NT0PR01MB1278.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:12::10) by NT0PR01MB1294.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:10::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Thu, 2 May
 2024 07:38:02 +0000
Received: from NT0PR01MB1278.CHNPR01.prod.partner.outlook.cn
 ([fe80::e604:661e:e939:4c87]) by
 NT0PR01MB1278.CHNPR01.prod.partner.outlook.cn ([fe80::e604:661e:e939:4c87%4])
 with mapi id 15.20.7472.044; Thu, 2 May 2024 07:38:02 +0000
From: Sia Jee Heng <jeeheng.sia@starfivetech.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 0/1] Enable SPCR table for console output on RISC-V
Date: Thu,  2 May 2024 00:37:50 -0700
Message-Id: <20240502073751.102093-1-jeeheng.sia@starfivetech.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: ZQ0PR01CA0006.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:5::16) To NT0PR01MB1278.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:12::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: NT0PR01MB1278:EE_|NT0PR01MB1294:EE_
X-MS-Office365-Filtering-Correlation-Id: 199109fa-0abb-43e4-de1e-08dc6a7acc2c
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6efoeUH4gU9kDRqaE5fkjGYAFzngf2bDOKX3iWin5anL5pjOoQVwzZmqvVYPzkO13AtawcAfUtobtJkdxPJ5qMT0Sua2eNlQcZVS8V93OZ0H4m9KM1wAO/nh3AMbDasT1YXzQtnDh80sjYQHuADVAihT+f89+prbpXsR5yA2f2RDpv07iOpzdpAtp3hcMXu6wXrSovjjvSuHYn0H271UdAUUDfrEn9LuLhzk3LTgXtCal6wAkIBImddoKSCopiWzfFTzPAynZZMoITskQSqZfengm4iyD+XV1eY3i8k2kyPoOoc3iDZceU/1NbBiAjFXzOMKao5Jqp4OP5+VjLVDE/y8ViFm5q5jxghakH9jPAFOHVFpa3dfNxBxUNyRTh1V+nXR1AId2sNcftK50ZcSg3P4Nb/fGDIqKIuk5IjUHRZ+i0OtONLUENKpdALS3NiPeOKWJys0X3LSHfRELXQ4N2mTTxqG/yxpsZcSFwkfGKQiIA5YrPucTX2Q/3wO4CpYOtvSlCmDHFRdLELCCmSwOR1xnhxwnxu6qxqGWtYgbWZZdCGcs9ke6NiekhOq7cmGbX8VPH4ms7r/z5fm9syVTWLS/6Kbe2LRTQQBgANUwXq8n4fsBg1AYhqGRIMDNnAw
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NT0PR01MB1278.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(52116005)(41320700004)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gcU6q3NxuSzyCLZNT5Nmykj83qfb8HfLMQ7k+FGJlBfMCdfFW1cDaixZpQS8?=
 =?us-ascii?Q?WbOh4jNSFznWwCObMc8du3LUVOiX7tWwyCB+9caF/a2uB1pdK1Jj+g/16MTX?=
 =?us-ascii?Q?dKG479ZK3b4VkAc+F9BXo/d7gaEuonEP3dmNnc9TUa8ieqTuJBGMwhzfQwwy?=
 =?us-ascii?Q?BOhC6X+O/Jx211VRQ0h3eAewtIVA7UfMiaXXL95zQ87+//DeCo5xZHfnCcUD?=
 =?us-ascii?Q?gbLVb9eAYJuHbzJkM9SIjG7bcLtvwFjeWFuz0KYQtnGnN7fh9d933JKJH2IN?=
 =?us-ascii?Q?DuELiWEaxoPfD9Y6cB1sJxIDbQ7JpStIFW73mf8u0e6QA2MUK6gViLPzmL5b?=
 =?us-ascii?Q?GRuump8ubOUQAuKaFzHJrje4NZ1o+cxX4sKwfaEbc12ZutiWZRDf2zswIIQH?=
 =?us-ascii?Q?55kFcnSKzI6dxxGs1Z24IT3DTqBI6F2OvnmAZo5eZQ7xDL14mg445K0XHXMn?=
 =?us-ascii?Q?P1k4WRHY5pmGyrErHCdjymyA39lQhi62Lm+UG7T8MIWpyykQEPhc2bvpgcpw?=
 =?us-ascii?Q?hThHTtd10BKLRXsi+L05a4AgKfmHnUzhnU9RT7hWLGDxekDcgIZfop2/IX4y?=
 =?us-ascii?Q?v5wIEECW325tdQlVjTCFpo9wcRKYyjaH01CiKYZoWYrK0qcEI1LDRe03mgqz?=
 =?us-ascii?Q?eoaxUZdMNe9XGdQkx90hpmbW0AE1I5UrIGO9P86dYajQkmwJNOv3EWSqE3CJ?=
 =?us-ascii?Q?VS/zpMeQR7BAiVREx8rD/IayrxBmNAPVrFFE13ejm/H9aqgEFT9U4vv/i712?=
 =?us-ascii?Q?ziVrAJKlG5FWlHygoAl/eHWSypbCFhyleNS8wpg64Uqvb/ecZAvTS2ChrJ7f?=
 =?us-ascii?Q?bwtJ2UN6lw6U8EK8La9HgtYqpQEeU+wCPx1QdMe7jZWgvK1uKcEo5uT0FP0e?=
 =?us-ascii?Q?Z+zgdqSNFWoQUPBgM6aX1rgdNWDEROZK3kOBqN9pMAm3EAEoK5sxJ+8dHADA?=
 =?us-ascii?Q?wEhhuVyzJSLA3KfC8QbEkv7tjWU5zdMfaw9TGExKr1Kb1lFegjG9csKoeDB1?=
 =?us-ascii?Q?MxRx5rED49VbT1PRueCKnL8s7Gzv1r0R1eZzxBpC4UOxU9fV1XFcddZHirFk?=
 =?us-ascii?Q?aSkU3iy5jHcGyd3I4epreQSX3/oNHBhqgsj80yTr+kw9zzrm5IqXrPCWS6Ue?=
 =?us-ascii?Q?y9W/ak+n4Sen/bkFG19K8ES6488co2wAg7fdN/ZXqhaHQLUe5TWG4VKjOrG/?=
 =?us-ascii?Q?6t1ST/No36kHXDbiLMksiwwMBDIISTMWLoFoq3SD9h1jzKwjxQVI7GbvYcdO?=
 =?us-ascii?Q?Cp09k0HYmOXwhcja5SS76SyzZKbJZD3xxHWk7fCJpgbscU13GHfrTF+KfMqQ?=
 =?us-ascii?Q?ieZyKZ5au9WWcaMYNrqcTPleUCyzh2Uh3pIeTE9JloBtdHmx6gQLZf7598sJ?=
 =?us-ascii?Q?q1ucGcvFNryudDapzSkjv5B2wh/Hh1dKcfpHFbLz95K2VjJU97igHCjvA8yt?=
 =?us-ascii?Q?X+C9BLJB9ya93Bmk5zXapfHFSUXCQijhb7RBGA30Du5DERADf/J9y6EQBo3T?=
 =?us-ascii?Q?0zlrJVXVRhUboIyjmyA8O1IrMMP9EEq0A06DKzhb5c+3WxsDn6ga/KXlQqHD?=
 =?us-ascii?Q?6Zhc1zghcUHaGl1dg+Oemi+i+cpx3FJAd1O+p4AuzXAmGLR2OkY40ts9DxSy?=
 =?us-ascii?Q?Gg=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 199109fa-0abb-43e4-de1e-08dc6a7acc2c
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1278.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2024 07:38:02.6073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q7PDO+PFR/I1bB2PjWX7/tGM7MMNESjmWjmwZBECf1tb/sfVJ/8R2JXd88n90aCDp72hvNjzPQpLofOSblhjmQ+7kwkrz6HKFBMTeQkPaB4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB1294
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_003812_321640_C3711A10 
X-CRM114-Status: UNSURE (   7.26  )
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
Cc: aou@eecs.berkeley.edu, jeeheng.sia@starfivetech.com, rafael.j.wysocki@intel.com, conor.dooley@microchip.com, palmer@dabbelt.com, paul.walmsley@sifive.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The ACPI SPCR code has been used to enable console output for ARM64 and
X86. The same code can be reused for RISC-V. Furthermore, SPCR table is
mandated for headless system as outlined in the RISC-V BRS
Specification, chapter 6.

Changes in v2:
- Added code to handle early_init_dt_scan_chosen_stdout().

Sia Jee Heng (1):
  RISC-V: ACPI: Enable SPCR table for console output on RISC-V

 arch/riscv/Kconfig       |  1 +
 arch/riscv/kernel/acpi.c | 12 +++++++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)


base-commit: 0106679839f7c69632b3b9833c3268c316c0a9fc
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
