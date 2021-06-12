Return-Path: <SRS0=I7Ft=LG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7127BC49361
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Jun 2021 16:05:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A44461376
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Jun 2021 16:05:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A44461376
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/YRhCLoFHl4Yd18uIrHAWUBLQVq8B3LclGFP62729zM=; b=kmmHtL0w1aii95
	3fHpAmkdjMfmOUch/TUdqq/uvmlEnp9a9zYOtyjvVND1POz4PXll4wP+rxRRz1ua3bDSWpGhdEe5o
	Q6qcB72gKn8sCUnOk/X0jRTtRVbHggfeeLLu8A8waI0zFfZMjDSRJ0vLx6fGwlnng0sOJS5vBIs2b
	+pWsek/Yzkt5awiyJTGT6g1PaVKci0VCVRAz5SDXzM6pzzQqN87Wg9dx7ARhkvBhxP822uCH8God6
	woiAqkMy/RiKqD0G7zQg3wjcg84W/3BA/ADfbsvSj0VN2BDmRbya+/zg8Klwq5CbQzelp1BBOU+DP
	lVp0C8Soy2HWEKeW6/9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ls68d-008mrj-DD; Sat, 12 Jun 2021 16:05:35 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ls68a-008mpt-DD
 for linux-riscv@lists.infradead.org; Sat, 12 Jun 2021 16:05:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1623513931; x=1655049931;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=VLgynH0PQCBt45In8fimdepBNO09S9dxPFvaA0Sf/m4=;
 b=X+2cirzhBF11dmy7CKP29tJ/7uTp+zI3N/4HVQ3zBl1M1TtQ515dKW/P
 DGFaz3SFcPCqxMf+45RrhaDns6N0RuhdEKSnabZ8/mkSCQuPrvmQ2HeSQ
 Wg2p8lOf7V3miudPbqezzkE0UDytdw6Sbry2OlEr/yYG+uDSD49t5+VLT
 0S2d4db1h9gf76zFt+o64scPRchpgMlFyvw5T99NlZjz+vojKjO7vRRO+
 zpm1jBaZxqoQWC4DntD3XFMM8BBAiKNyL8Cxdt9jdyaNUXjLrpaT2uMyJ
 ih4AxRfTvsF58WBAvF9TBKgN9ULrr3K68qC3pEJRXZzEyfwgw5AtgMXBg w==;
IronPort-SDR: YqNpcTLssBYVcCy3Nx+M3o70qo9XBCiNMSbfJYKX9KqX+Q8gjr/Pli6uH83lo6fmquaWPqUqY+
 S8Co+Befa6FOEqI6FPQt6pWniw0liijRtf0HxZ/PIRdDdv9wsZ771lmMZhUaGuq/vvR+5aXLA3
 RI/DUznGc21ZXoBIDvuOZJByKsgFJrMOmJCH0aw7Po1Gkm/K4hwXmV3ODe/n4ygqgIuR4YjKbL
 6f6hLEp3kx6nAXaEJKD/ywovVBWgG1LIENhThHfDNnTE6Ryiv9jm6FsiQByRzW+1sIKZjo1C8q
 TRk=
X-IronPort-AV: E=Sophos;i="5.83,268,1616428800"; d="scan'208";a="171704691"
Received: from mail-bn8nam08lp2047.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.47])
 by ob1.hgst.iphmx.com with ESMTP; 13 Jun 2021 00:05:30 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eFl/cz9ZuVxZqNg1deTa8soGaxWbcjj29hyQwKeH5OAvZ3qMqjpfb3C/8LTvA4yg/WGP4pGeXWmKwwvTs/uYalTZjxkXunKEkkfh60fZMUsgmcA1H/d0/a4CTvER85nf79i6FRTEC1Jofbpjuifb/H8LU7fxcJ7F7P0nhyjPt8oxdGbsldpwE3BgNORbY1eAPHcWU/PIPn82cC8DlVAScbZWetx+jTAMkyDqNiDxzCu6uH47R1wGu56ZUWHOZsZYe9dO5u+ONdK7Exe9AYF4uBMoc+5qtSbzCS9WWUYkApO6GE/Wr8fk/sECcCHhdMVoSABIP9Ew1kJFbWFXCRDQLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T9cS4p99DAJAZGEWcH66k+b8v1HBZ3jLhtEFEYupB9U=;
 b=AvRTM/T5DPM3PjKlQWgAaQoKxzS23pv5KXZ3GJDt1ulhEFDzMjB4jFwLxbsheBE3Aa/ItYqqQ6hkeJOn0el38AOC7c/BAkDTfs6yPHn/klGBWRaDlxh34V7EqwNhJRVMub22lhz+MgNg2ADX5VaIPl7axsP830N9OnyVt9GAiQS/zXghl29Yqye2jCFjmHOs4j24OqiriqJde/rAos5mqP2/kow8hXMIU6JMhCtPtkZJuMCRcHImarDEpHFjujCM/gvetxNV8KF7sKJjW0W9VzeJZnhwis5i3GjeD7zmJYXXdxJS06S4lzRw6ltp4Vhxf7zp1NbE3hEnhVoDOw5KmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T9cS4p99DAJAZGEWcH66k+b8v1HBZ3jLhtEFEYupB9U=;
 b=C5T939Y1n9SQCP2Tfd5lyyMJUpr9lYGLaHJfpCysnEI+AcGUfE4DoMgZ7vMstBRSqbVKEpMv+U8Obg/KuBhYCIiktaM64aVrTpTNs26Qzl3I/DzF3vb2kIYjg9UQ0j+u0dpNd9JZfjH9Jw8+zDfHZpno+ASdecAvSlyvkvWTKXE=
Authentication-Results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (10.242.165.134) by
 CO6PR04MB7795.namprd04.prod.outlook.com (10.242.164.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.23; Sat, 12 Jun 2021 16:05:29 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::a153:b7f8:c87f:89f8]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::a153:b7f8:c87f:89f8%9]) with mapi id 15.20.4219.025; Sat, 12 Jun 2021
 16:05:29 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Anup Patel <anup.patel@wdc.com>
Subject: [RFC PATCH v1 06/10] RISC-V: Select ACLINT SWI driver for virt machine
Date: Sat, 12 Jun 2021 21:34:18 +0530
Message-Id: <20210612160422.330705-7-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210612160422.330705-1-anup.patel@wdc.com>
References: <20210612160422.330705-1-anup.patel@wdc.com>
X-Originating-IP: [122.171.171.205]
X-ClientProxiedBy: MA1PR0101CA0052.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:20::14) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wdc.com (122.171.171.205) by
 MA1PR0101CA0052.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:20::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend
 Transport; Sat, 12 Jun 2021 16:05:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c60c471-ac25-4cb2-6f66-08d92dbbe5f9
X-MS-TrafficTypeDiagnostic: CO6PR04MB7795:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR04MB77958B972E3D95E41E4B748E8D339@CO6PR04MB7795.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SO8OUDeXyNsEm86ZqOv3Nvrj+TOF9Fh7mMsCiYQ1/VOLFpsaTyCRMwwQxaV0GJ93SJNKejZ9kRRfKHUsH9GYkM8fVruSoP/59HpXcpxFEdoDZ+PAnoORyF1Q6b6LCuFGzx4PYr85DdXKUbaP1rdbwHfsMuj7akqhLhbqAGTOVQDaHB0iAvTwl6hi5cb/amZXm6r1c8UyPjAHo2yOZB2WFA/7zd0vnxpDkYrfVqeLxdeZciFN9hbnn9zoyrt+HpNUHzaHJBZjA/QjqI3LCwWGHAmI4bGx4lbJrC61JhXmUQiuO2ilqckDsfl/cwKnGtp1x30Ao7ELkLxiYTpWAdpH7wYyhEImsE3XOeWVadAVITXcb3pOi0tiADe1zqfF9MwxsicBTE5GbLhA9ER/jUx7RU46KUhG6qb4ftyEZEskR68tn8Wh+Lr8jskJFgQbt05g37hKCCPME4xbanpyaFM0DvHiclSuLCHnUx6p1wCxyHAaxmJApVO3TSosW7HxsWRGLD9KoinaJrf50JE5e6Stg3Q8It0rx4vjIH0VoLGbrUj1Ukpe3+/prdF1Bw/zeSUzu/xAr8ecKifPRxtxPQqz/mHHu1IrXCsrBfalvyGyeJYNwLJsIjDDOX0qWvkY+y/6h12tTwKfywuMVgKgi8HDQg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(396003)(136003)(346002)(39860400002)(36756003)(66946007)(316002)(4326008)(38350700002)(86362001)(8936002)(55016002)(1076003)(66476007)(54906003)(66556008)(38100700002)(5660300002)(4744005)(2906002)(7416002)(8676002)(8886007)(6666004)(44832011)(26005)(956004)(16526019)(478600001)(186003)(2616005)(110136005)(52116002)(7696005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qHkiR6/NYeu8t9XoxCU6npIHyOWwwVdDtgw1ukCPoiFBtL5Ix+IFdMMrI+/i?=
 =?us-ascii?Q?S8lfqDtPmFXVffJ84AQX3/rJgkz+LSLXkz6Q0BLREy245qvrHGmF3KZ7moxv?=
 =?us-ascii?Q?XwPj6TvkyNX2Gu6RPNmkn62n7CQTnME6mzEMAk2Aaxv1aspmyUnS1xFyDKJZ?=
 =?us-ascii?Q?ygVxWsmgCNPaeAU/rx/9zigWdKQTE/uKRLA71Hp51Op029sBfHuVKLslYIR+?=
 =?us-ascii?Q?FnBkNTfOp4MRyiS9D4nqLxNswvDdHwWgXzo8dE5yYPZbhHzrzAYdk5T1Bs3J?=
 =?us-ascii?Q?BfH/T/1Ml/57ABuJS5eEtSsZnisnmEGdngIe5M4+G0E22xDPc+V8/FTkugLp?=
 =?us-ascii?Q?8wtNtlbhksiaHS+5D6MD67V96svvfAFrriXOYpFG+QfRXX0P5Awg27DvrfMQ?=
 =?us-ascii?Q?GZSH1pvG2tp2/ZsCmhF8mQ2MNrcynHWfNFuKMkCHXmZ0UHddi5eTiTf4wu1/?=
 =?us-ascii?Q?gRdgNPq3Q6crrNiRzf7e2Cy+pc4t6tEIwRC666JON1yN291duiz0Y1ekaTb9?=
 =?us-ascii?Q?yxtm2Fb5z3Wg7864W0DJtmXezalJYihQlPBmvyF4YI/5bSnUbD4/jqOafmLH?=
 =?us-ascii?Q?HosKZeFl+qrBvK7aoDDOq7epZ8GSmg9JrGdcllROJfJjSqErC3XJSEbYmkFs?=
 =?us-ascii?Q?3pZR3ZDiKHOiUyT1Y+CnIN7nHZq4w/OWptlacHMuWq8KyCzGwTmPjNdpmsrv?=
 =?us-ascii?Q?bDX56YDflcxBBWZvQHw5tkdzSKhBK7Pj4UiaPeM9GJOYqkLcx/2U4Y1tBe/W?=
 =?us-ascii?Q?F5/CZLkqV1ZV7vQt/mbEIR3TPCF7FnESjpta1bYW0LinQu2IDUPRfCKSAAK4?=
 =?us-ascii?Q?SxMSLLqgTC+kH66IKgLsqTayFz/4LnvKU3JPYFx8nFVgd3dLYQ14twRrQ7vy?=
 =?us-ascii?Q?btyI7jrtBFuYlNl4ZzBZPD9dXMJnDgevgDUW+K4tihI7VKFtSyJ7LdBvrqvd?=
 =?us-ascii?Q?w2ynX/IkYVjPAmwoE+ri/QjrugULDS7FaHYEB4hCaoD0YRfxrBpyuS2Uf99d?=
 =?us-ascii?Q?KScbnXiEjVTW9/3OoUZNnAiB+LU5Z6txWgg9YNXe88SrO2Nh6Nlf+R4lNoo7?=
 =?us-ascii?Q?eDJqEZ6IPejHS12ILqRnako0YkYUCCQPAC9Fyp2j6Oyxqu7jrnkuh/uiNJBc?=
 =?us-ascii?Q?/+81OY9KfKHBMmD9mVrTD319OTyCgpQJhpjHIqmdTxU3D3/QXOZ1ZMPvPg70?=
 =?us-ascii?Q?8rp6fTGHMwGkAYB+Uowi15MdX3+2/+S14iMuJGNck44Y3DNk92ZWpL+EQHBT?=
 =?us-ascii?Q?kCKIuHeEDL+YSqmsEbL2j4XYYL2dmKHtOoVY2CNFOZaHrKLD1p+It4fnzCC3?=
 =?us-ascii?Q?7/i/PHtfDoTXaK82VQ7czfqI?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c60c471-ac25-4cb2-6f66-08d92dbbe5f9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2021 16:05:29.3962 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GXlJC7RBBDKF3+cwJAtuGDiZDj6N/uYN2AQTf18tPAzBum3xI2k8irIxv/W3XqDierYI0yLlpijSvM/KNpZ8fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7795
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210612_090532_484967_D46CC8FA 
X-CRM114-Status: GOOD (  10.48  )
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

The QEMU virt machine has provision to emulate ACLINT SWI device
for supervisor-mode so let's select corresponding driver from
SOC_VIRT kconfig option.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 arch/riscv/Kconfig.socs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index ed963761fbd2..2687a0902ec4 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -27,6 +27,7 @@ config SOC_VIRT
 	select GOLDFISH
 	select RTC_DRV_GOLDFISH if RTC_CLASS
 	select SIFIVE_PLIC
+	select RISCV_ACLINT_SWI
 	help
 	  This enables support for QEMU Virt Machine.
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
