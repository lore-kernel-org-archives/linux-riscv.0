Return-Path: <SRS0=I7Ft=LG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,MSGID_FROM_MTA_HEADER,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 298C2C48BCF
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Jun 2021 16:06:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD737611CD
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Jun 2021 16:06:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD737611CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RhnQ23F15Y/dN8yxo+FLZu9ZP3ygNEJkA2xIsKIWM7k=; b=tSl17MpC3CizVl
	+93s/QXsRexTTh4XWtRCrrEPay/oh3u6YN4h3cfdPdgbJzgt2xCaSioi0Tu/RRb+qpLsPPIpoCJVN
	zThLK+wdAg3MfCSp2u00gZbG4m+ccp442/aOTOqw8gEqnIXQIShr5UjIBh3s1+cSat+tikUh12W2R
	xKIUrYxE4A0fV17GjzrcRQYtxG6sQe7mx86jV3XfGVQaCicKhyVgEUT99KWUQcz57d7dEsUxgbE8/
	XD5OC2n2dA/miSiM/PPv06atfBBiidorSGvjdcch85MhvVvVr1g++9IqnE4RoEADXzaT+eWeIzew5
	a1r7HpsPV/VIjL1MxqDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ls68z-008n3q-7u; Sat, 12 Jun 2021 16:05:57 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ls68r-008mzV-H2
 for linux-riscv@lists.infradead.org; Sat, 12 Jun 2021 16:05:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1623513949; x=1655049949;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=WiKGTOT9nU7qiYJukPIw5BwLduirJk0Xuc57qaH1DAo=;
 b=dbv8yatyi6QYeEoEVnXdvvkNs2mRVsYn2SANoPAdvlKD4Oj81mm0Mc2c
 EcQ0FArt1ToTkYnGF6NL4hWxjNmwReg7FCBJeEq2ZYtam2cfo5kxj7I3r
 H4KRIFIimNlp1I24n1R9s2934bjl3hCCbZbqlGf82+TL27ltBV8JjsrKw
 YfW8DerLdQGjmPj5+a06SzbpLtnWZxJorYMjdnyQOk+DgZ7ycT/b17LJE
 xb5Q/tKMhEgyA4d5XUDn7N7sVaFl0ukOIdfxWK5xBTd52ffknHriHNH0e
 2KFI2jHKzS/4dT1r0/nxVD2o3oPypX4TXpje94XrpeiIgT5vNHgVx0LP7 g==;
IronPort-SDR: be1y0gwo8EOkSHrSCCeJHgcVkdDPigQLW3bSDpfMVIpusx+nnu8J8HlaJDxK+KoQbccdN0tviz
 0dAItrCkHNTAhYBv9P4cZQ/6l7QBZ6ZpcflQibvdHqi/Ch8qc6KNAZePmM8heG+6nQ9yTUWlvq
 7fANZWvnrOUshNTgfTIpjzHbMf9rlNoG5YSEDC5muGSYd8NMuB+Raziq4FCnfxJebWrV32/fq2
 v27HAOwrPxkI4Dym+M3J8qfflIB0APzb1K5SnF+zmwQrEsl/ZYgOrf5CMbFIMTIhhnA/TDghgE
 7io=
X-IronPort-AV: E=Sophos;i="5.83,268,1616428800"; d="scan'208";a="283161042"
Received: from mail-bn7nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.101])
 by ob1.hgst.iphmx.com with ESMTP; 13 Jun 2021 00:05:47 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SJhmQw647EjRsgRVPJVw69Xd82vFmQmVCE+c8QmrkCLWaiqGnVdjVw6pseQzFyOz6QNH1gHW7XNqWXhtaAKDDjkYjo3yywZryNWBOHDwFQyFtubFe2UDj6MzhOaj91KDxqnpAO2V3ADES1SIu0Bu6RvQDQeB94YswkGpqu0GK2f5zmWiTnq/kAeFhoQemnLxafW0sAfn6uiMvrIJ5p7UUAzCnklSp+byLXpOfPeiGOvdixt7mjXEt2pLNZABMkuNU2heRYcGi9E025uU3u2uuuyE9gwEOiGHErVQvl7w8rRIRZJZeCpG1MHTRiKAGTKtewTu74f8qBNHCk+nFdYAnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xa0MUS5v8HPjdsk79qDbWbZcnzNdKQu4Vo2XQA0cdXg=;
 b=ZyWyZ0Y5cJFpCuwe3QwpTXtDzx8+xO9ODGDon7Sav/uOFRM2Sd9iqO818Kw4wjgIa28FKd2slpbtj39XfHQqKWwaA7hLoSGjoXkC4uuUpR4/L4saEVDQCt4fXwfe7dmoOs+iv1YJG/Ob8uOKwvtNb7rTH/yLkJwl0p51BQ/ziDlRypYAp6Jn8ssU/7T/DnwaNwZ3YOLK1B04gDijWcef3Nwdn6t8FeI751/aPrdSbeRh0dV0fnJGgVhZXEQw/l/spJ6yFExLYtWxfU+vssVoJ6PR8MfHPuF3wkpddVZcQruemw5/H6A1XESZBjsH/R2XzMz2E3fddRwAgdwuR0FOPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xa0MUS5v8HPjdsk79qDbWbZcnzNdKQu4Vo2XQA0cdXg=;
 b=qb0LE3o5sPDr3DntIotOouKMQBviHGMk9qzBKmGLvuhCSbuZD7cyoSLeG0vWZswAXq5gXrPzety0xjzBL0I/vBuz/CSCxlTDWbjIICf9WT7RVJ36DlMgskA+GZ2jO7XKpDGdq4EmurvvOoteX3isqg55l8j5EQatC+lZfC4BJMg=
Authentication-Results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB7747.namprd04.prod.outlook.com (2603:10b6:5:35b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Sat, 12 Jun
 2021 16:05:46 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::a153:b7f8:c87f:89f8]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::a153:b7f8:c87f:89f8%9]) with mapi id 15.20.4219.025; Sat, 12 Jun 2021
 16:05:46 +0000
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
Subject: [RFC PATCH v1 09/10] dt-bindings: timer: Add ACLINT MSWI and SSWI
 bindings
Date: Sat, 12 Jun 2021 21:34:21 +0530
Message-Id: <20210612160422.330705-10-anup.patel@wdc.com>
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
 Transport; Sat, 12 Jun 2021 16:05:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d94f077-002d-4c75-9cd2-08d92dbbefeb
X-MS-TrafficTypeDiagnostic: CO6PR04MB7747:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR04MB774704BB104B1C1F28192A2D8D339@CO6PR04MB7747.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uAKjDOCbMM2ogMOsBmQZ18JYYD4zjJv2S/JPAMSpF+SMleCDsq0WsXv1H/LS6LfFJNA7ACps/fz6RvXNit+a40fIR4ImqslAZ2N+d19FPfx5/A4UfGb/H/imnd7z1p06e/mBASlXwYdYzxLvBh1wrRKI/zG7OCEBcTbnwDA9SbaOcumP2boprmBlM3urE0hD+RcIM7Mlb97aihfpAvceNReqriyOz/hxmXmglvi/U1B/0M1IQWGEL60qEYMDiMzB+lembK7k2PN9cWLPRBwf+iDgq5p0sgzBtVTy66Lq0VB48sReAv85C3kO+bydYvLkhp/CDk1B8hOEZGJFRLZtkYDQpYw6wrFkafdFmyE7j/8q8D7tvWM9dKgWrWxcgDHBw81cr2AYEE3c5CFHnu0mfvCT7a2NQBjWmRpy8B4lZ2ZvkJQ5WxgtXXW7FEbr5CYJAvaNFvFo//JcQbprKCad/v6lB9PRbx+Z4JMGOivRaDrQDNRwf1Kt480wQ1SnK+oPqZStXoxjOAvqC/Vokx00yTAoLNlnyhfE/zVXLyRD+x8m3M2D7sgbFEzE5FFZStuaaimoPVs/XsabIj3s05vX2Xj91aCIz0bv/8Jxp86KNLfENWs2MJAAWvCtv5NGNxME831C+8t+w7gBhVjotvWjPL/3dKU2gMcdwWo/HHoMbV5uBKdIR8MOkrOqg5sYEbbY+AXm5R/zvc1M5sbkNzbtOuhTF/gWjyPJJXfu18+xIPJzhUMhmV599FkoMXLO39rkT9FHdhYSLDm6CGy1t+Fz9UsESNlK0V7ttcQ8rxr8qI8zYbJt5pmvShjF6D43ZhAHlk1BVpfEyPN03DHPbteOcg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(366004)(346002)(39860400002)(54906003)(8936002)(8676002)(110136005)(4326008)(2616005)(44832011)(16526019)(186003)(66476007)(66556008)(66946007)(2906002)(956004)(316002)(38350700002)(86362001)(38100700002)(55016002)(26005)(7696005)(966005)(7416002)(8886007)(36756003)(52116002)(6666004)(1076003)(478600001)(5660300002)(473944003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RKEpe8mI8DypuLDNRbSynHKEbWBAOiOJ5F3yu3bfeLELxO5G/rve+ZYDR9yh?=
 =?us-ascii?Q?d+bZmKFGBk/2krcQpnLdRP5HTuYiwUwOCmFjdZw4C6FYd5kPAkDtCCRYMi94?=
 =?us-ascii?Q?eXRhE3vIXYvAikdMcLf4eeKfd8ydYWcfneBLB97K2+d/cN1dFV1/UjQ9YBK3?=
 =?us-ascii?Q?HggS0NwvNUSWCr/Qe0zyvbaoONFC8ASQZe8wGSNBV7BQCths4xIrMN20AqJX?=
 =?us-ascii?Q?NPMSXySttFajV2TwAQE1MwNFkncA1bttZmS/YZ4R4y0vOQaT7ThWzj+TNMkk?=
 =?us-ascii?Q?EbD+7iJPxYNxWfb+F/AHo9bmAYWrc5MKvVxLNgfbbdOyMKdgENVEDEu/MHZT?=
 =?us-ascii?Q?Ews1XJBHeG0jApca68CrjqkZvN3vK1m7xcyJkTMEYKfyfLunNGokqAPM8lQY?=
 =?us-ascii?Q?8UujblhMsc1bl0Qi00S431jT+LzVmF36sHvC6RilFp3VHNfzptjn6+ZnPran?=
 =?us-ascii?Q?zOvrHAWn7GuadCwT1gkr7770oKzQ/59tCRyeaJD9glX410LeGbYWkwoxNCTr?=
 =?us-ascii?Q?YXElgO/GWnuZf6vjjA2Ez4RR4TFOoMyvFTnyJ7jt39/Ha3veComV+L4QusgN?=
 =?us-ascii?Q?pPwZOb53UMZMeDiWOlIRXF/Q6wb9LBWuuyMLOgGKNK9Ja9CQULHHDCnp4Xb2?=
 =?us-ascii?Q?6EY2tAUzXQIyGwGiAevyTGrFMQ3fVdOdbctVL8RR4CnJKjRblckdyjYtDqwG?=
 =?us-ascii?Q?jVB4G14uliqQAOC8fjjLUWIVJkg77i5jpFkMJG8j9Vi3GGg9tFay4aiwbmk8?=
 =?us-ascii?Q?DLMkFiLU8Bh9shhoDrhceIYZmt9v2SU4U8HND2b+9VEeBfNCFoTHhNx6bwXs?=
 =?us-ascii?Q?ArWoctOYX0hRcduxM957G5Pu4XXUP0eRcRgT4oKrmuArTg2GinCCS7zbxodV?=
 =?us-ascii?Q?noPP4xoyY/CAFtnOo8jEXm7vmlehS+UqMBMtrwQLCBc9Q3PVTCdTFLrK9+4Z?=
 =?us-ascii?Q?DsclTtN+C8pxbSUG7cngj4KMINoimvuwvohiwhhaVDSF2GcVVVbjdlXnbz3q?=
 =?us-ascii?Q?9u4YBLE2dFF2fodtX0a4C+KofzkxE81y+ZhsIK5YL0HM/o+FR6epziONL9DF?=
 =?us-ascii?Q?TX4zKUF7wRNFxPVxnljr/5rUtOfs1XifU9kHserNKyv3pxamt+LCa0TTTlZE?=
 =?us-ascii?Q?jBvbjOJEO8Qee8840GRONeUCuz9YR1wjWa5H7vUFqe4oh4R5NWsBa+SBiuwn?=
 =?us-ascii?Q?+VJAjOA+HIMRogJnS2aAyqq2kxavi+nO/C0d3b0mqb8tDwxyzvOQROClXfUB?=
 =?us-ascii?Q?kAnMNdO1BRRLD463ZjcB4BdKzq4LsJzWdwuxm+Jzzqmf3xaAOtLoywUatXSO?=
 =?us-ascii?Q?jiFGkPLI8ZREzz9sfqAKOZft?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d94f077-002d-4c75-9cd2-08d92dbbefeb
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2021 16:05:46.0400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NHpvqdKoAOJ5Mg428/oDIYabB5ky039Ru7XIia+hCCiQuGl6qbYJGW3K1qqeshqXjTiv/q+my2A88Q5tS5h4tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7747
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210612_090549_638767_C563A9A9 
X-CRM114-Status: GOOD (  16.77  )
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

We add DT bindings documentation for the ACLINT MSWI and SSWI
devices found on RISC-V SOCs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 .../riscv,aclint-swi.yaml                     | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-swi.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-swi.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-swi.yaml
new file mode 100644
index 000000000000..bed15411c18f
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-swi.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/riscv,aclint-swi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V ACLINT Software Interrupt Devices
+
+maintainers:
+  - Anup Patel <anup.patel@wdc.com>
+
+description:
+  RISC-V SOCs include an implementation of the M-level software interrupt
+  (MSWI) device and the S-level software interrupt (SSWI) device defined
+  in the RISC-V Advanced Core Local Interruptor (ACLINT) specification.
+
+  The ACLINT MSWI (and SSWI) devices are documented in the RISC-V ACLINT
+  specification located at
+  https://github.com/riscv/riscv-aclint/blob/main/riscv-aclint.adoc.
+
+  The ACLINT MSWI and SSWI devices directly connect to the M-level and
+  S-level software interrupt lines of various HARTs (or CPUs) respectively
+  so the RISC-V per-HART (or per-CPU) local interrupt controller is the
+  parent interrupt controller for the ACLINT MSWI and SSWI devices.
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - riscv,aclint-mswi
+          - riscv,aclint-sswi
+
+    description:
+      Should be "<vendor>,<chip>-aclint-mswi" and "riscv,aclint-mswi" OR
+      "<vendor>,<chip>-aclint-sswi" and "riscv,aclint-sswi".
+
+  reg:
+    maxItems: 1
+
+  "#interrupt-cells":
+    const: 0
+
+  interrupts-extended:
+    minItems: 1
+
+  interrupt-controller: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts-extended
+  - interrupt-controller
+  - "#interrupt-cells"
+
+examples:
+  - |
+    // Example 1 (RISC-V MSWI device used by Linux RISC-V NoMMU kernel):
+
+    interrupt-controller@2000000 {
+      compatible = "riscv,aclint-mswi";
+      interrupts-extended = <&cpu1intc 3 &cpu2intc 3 &cpu3intc 3 &cpu4intc 3>;
+      reg = <0x2000000 0x4000>;
+      interrupt-controller;
+      #interrupt-cells = <0>;
+    };
+
+  - |
+    // Example 2 (RISC-V SSWI device used by Linux RISC-V MMU kernel):
+
+    interrupt-controller@2100000 {
+      compatible = "riscv,aclint-sswi";
+      interrupts-extended = <&cpu1intc 1 &cpu2intc 1 &cpu3intc 1 &cpu4intc 1>;
+      reg = <0x2100000 0x4000>;
+      interrupt-controller;
+      #interrupt-cells = <0>;
+    };
+...
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
