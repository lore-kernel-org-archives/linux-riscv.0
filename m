Return-Path: <SRS0=S+R5=LD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CCD6C48BCD
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jun 2021 13:14:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A79F613B9
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jun 2021 13:14:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A79F613B9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=56Gf067rDtXTO2Q8jP6GsEAc+KC2/MK3SxBFvkWkVpU=; b=ShBId2UO39hHa5
	YZDkRbhiOGpgc8U6rpMxv4oLgRSK83hDVdsBGJO+8QbBFlRWxn6ZkebaUIB1yRk6KK9ehMCK4A/lc
	eAtDKAt/d/N6qxQ7QI/uVymAfHkX810uan2NLS954YCURodXY0TDWKEf7S+LyUV0X3X8P5cITYQsR
	khO0B/P4cYjz21eDemxCJOqsd41J4UjSyM58G41aNZWFriYsTuAy8hkcpYxxy/mtSOmDbtOY0FC2q
	mjluukeOcn2D0dDaA9fYa7jLjVDSWoZhT+udjIqTYqAp5wKHLlMCIIgV1pGvjB5sXi4ERDxx27x6x
	3hdQfjDyASCs+rMMiNuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqy1Y-00Dw0h-W4; Wed, 09 Jun 2021 13:13:37 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqxJn-00DgS3-07; Wed, 09 Jun 2021 12:28:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1623241703; x=1654777703;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=1uLrgPfppmFH2vM6/L/JqMHBvAu4tkt7ZHOK+EuhRKU=;
 b=VdHLvUyn/4M6MLMWP6yAfpsbtZTJ4Hf6yUFbB0/6kMwfA+C/TUuk4OxH
 +a3d1vEzAnXc6ls1bNLH8IHFEcC9+/JPClYDBMJ+/hjGC3l7WOPJpHktU
 SDNzjqZ16mK6Z5Mnnl5pImOAmwsxDLMMxi55RtTPQsVUZmb8eJvxzXVYw
 /cukluoptlBcP0mM6q8YtvX304WTZBc9FTQsTi7R03xyo0JgUDXzWbNLs
 Zfotg7J04IFRrGR3jaIiaLTmVbKlsyfYPrqZ0nzrrLS5BJRCwjuKk7W+0
 fUnV02CUWrZkkXeN+4qZDha4tdhlfQMBshtPOaGTmjphTl2ProT35ydeO w==;
IronPort-SDR: mFiVePYHg/MEl6L+MSlzNJH/51zxxW3m0VAKTnwTgSdNgo5U6gVQBeRtk7PpMX00J2CQPdWV4S
 8UyqKgkkLvCkcuV957t0m0fcTt52asjpTaETBlhjG5bQyqb1t6AgwsfaDPi3Lw+QpdI/dCfMYV
 ggzIZW3eHnFKn2lj+Bdpbx1NLqiy8mNl8dw8aPsHX81pINfykz95ZpT6A8gBEwhYIEByaMbd1F
 8g6SNDwu3omcQjMqncfhLsafOK0IL+8Y+5aej4fKasgShZnUzIY0mVE3vPXkb+eZ056O8CJ+e5
 jQM=
X-IronPort-AV: E=Sophos;i="5.83,260,1616428800"; d="scan'208";a="170576660"
Received: from mail-mw2nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.103])
 by ob1.hgst.iphmx.com with ESMTP; 09 Jun 2021 20:28:22 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gUxkyylDtDIYsNS3Y4cGSFmnwzvqC+4Puio/GZz+AIT9jJUtIN1HGXlPH52XD1F/1+a8DRedQ5Yee0FZsub2kjo9EZXAv8BUCwKB4tPhr6sJA6nwZq3a0QBH39KSAnNoVtxbjentlyL74mGBuFzqEGjKrDF1b0wscCMowhXjKGFBIHBTWL8WnRn1pld/2EoVpBRZo8lA8CZr/EO3cI4YQWDnQQ61rQ/IOfcVQBIBNfryhHI2b78I0nNmupYAJWrAIs6Td1rKqgKggYgGVmi97b3EABcB/Lzf02TukJl0yvj+1cYuLm2HanUsKF35cfhDtikjBP2OFYrvS2W+IUPI8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rip7XFR0BFk/jcVrblzy2OjHhUZycRZYHU6/NmyDcb8=;
 b=Ri+mftxB6KnOD1VUT3VaHJvsEZlxOTxlJnHxEk5tXAMVh1Ys3sc5RZBR5obe8y7GlkpaDJzYpiFeabzKdNk53R6azHLjKBbPy8rRNkOrjP1gdiAG4cvVqasa6bvUIL0LvDRMQNny8HM5FCYSamHhl/RPYzRZP2xGR3+kzOVUYCPr0eZUCOWIT/MDn1KtyeqsSuFX4C9bOgBdZIOKmLvBgTiIBw8iDbdln11nUHnFjBTePWA9Ru7LuHyJCArbUtdM+gB0xrGxR59RCnHLdEkdHNInik2QigMmFChQbAQNsQ7t0ERUEKLcGftqyFwJHhBZixy3lrB+xKoudPYvn3MlDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rip7XFR0BFk/jcVrblzy2OjHhUZycRZYHU6/NmyDcb8=;
 b=dLezWy/o38fJTAhNSENeqak3nRJOM3yWB0tkVwJT6CkvRkjovEdTJB/vwuqNZK1fQn6G9PuwbakB++NuAqhhj4jp7xLMwLQxPOlzMAFjKLpa7KFdF52n7Wgc/pw4k+iC0iz963H1J1G4orCv3fBkFhIfC1j62V3r09PJcnbq6FA=
Authentication-Results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB7843.namprd04.prod.outlook.com (2603:10b6:5:35f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Wed, 9 Jun
 2021 12:28:21 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::a153:b7f8:c87f:89f8]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::a153:b7f8:c87f:89f8%9]) with mapi id 15.20.4219.021; Wed, 9 Jun 2021
 12:28:21 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>
Cc: Sandeep Tripathy <milun.tripathy@gmail.com>,
 Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Liush <liush@allwinnertech.com>, Anup Patel <anup@brainfault.org>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v6 8/8] RISC-V: Enable RISC-V SBI CPU Idle driver for QEMU
 virt machine
Date: Wed,  9 Jun 2021 17:57:15 +0530
Message-Id: <20210609122715.3389-9-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210609122715.3389-1-anup.patel@wdc.com>
References: <20210609122715.3389-1-anup.patel@wdc.com>
X-Originating-IP: [122.172.176.125]
X-ClientProxiedBy: MA1PR0101CA0033.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:22::19) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wdc.com (122.172.176.125) by
 MA1PR0101CA0033.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:22::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend
 Transport; Wed, 9 Jun 2021 12:28:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e15b2b1-0a88-40d0-e6bb-08d92b421174
X-MS-TrafficTypeDiagnostic: CO6PR04MB7843:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR04MB7843DAC84F1B1A3B96D195418D369@CO6PR04MB7843.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:849;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dXKEaYwQN7Z2VW+SKHFDvptiiyusoKrRPRxmTAsOjRmqKSYWCDDGGRqhIzfMo+FnY9a76LNLRlc7YgLftjtSnxX7HIsX3RwRbwiuQqXw6ovfTC0E7VF1N9qFxPM13rRzvmjtm1UYP8dUaOPRM2t4gc+Q0CBgNvvVEPGyiKvFlr5ktQD9O0VAuJzqLDVeTbC6+0lJEXlOXPlNYCDxiyhZFa83f1C2PZSAM2aRwL0M8AwajVhez4MKf17AEz7V1MSJ+kEniU8Rjm+3DRByIGdywUPM45/aWa+n0FVWrn/Zk4XK6LhJQVRmO5doxMdDCKqBsLLfdemU+IQTo22KB9gcSdhKgU70eSb6RAKT/ib4jsmz0cXzhpHNhDG0fL8u5H6RAUBC9nfHX1HbjAWzbFWyEiGIwVYp3ieQ3bIlPA9PmHZbuEp5YRMyYGWaqzes9r8WUiHXZ5MtBLWgiSj/kns7dHOuZcjkRRgT9AtcNOMQqJPThsAXbrylkG2jLR4ky+vFtS5Sqj8q1iDz8KDpgz727ngTsCdJu8tMaY5fd6xLUSB4v7ftiLfqsh51JXHe+JDuPKzxY9sbqI9SM6wb/ksKfp9EYu+aIroB9+CrughD87v65H9TwndrjxGWYnzqfIEAsCbbWMqd8gcUaA99bHfaDw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(396003)(366004)(136003)(376002)(7416002)(4326008)(8676002)(8886007)(478600001)(110136005)(956004)(316002)(86362001)(44832011)(2616005)(38350700002)(52116002)(2906002)(55236004)(7696005)(26005)(8936002)(38100700002)(1076003)(55016002)(66476007)(66556008)(66946007)(36756003)(16526019)(186003)(5660300002)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8SfEfsUSpDqWnDH+QBknwXGh456NOjYaJdpC0v9ge1wHEIibwGXSv6uW4wmx?=
 =?us-ascii?Q?1OZ/fGdm2EwQzQ09I/x/VB/wnxVWW+yjftfuWsJDib+oJk9eVdpUtSxNvFnr?=
 =?us-ascii?Q?G2LdN3Os0F6SfXuKPCfWuReMgrbCCj02IdbREfbvBqFZi5E7sxoO0x20i/Fw?=
 =?us-ascii?Q?s3Z2dFIxLAH/ySOEho2SIJl1qdMcJFVhvTEj9aSSedi2Hd9vGipmrUkg2c7T?=
 =?us-ascii?Q?I0pQRln1p37xFmjSA6J6PN2+fI5jy9Yxrg2xUVRHhQK9BXup0A5EnW7d1q22?=
 =?us-ascii?Q?oVfPpf3V+9L+hd2T/PBK7ZNiv2q7B6SxASQZwDGDvuCA+EeFsGbK3crtQLST?=
 =?us-ascii?Q?Nn3p8K+SBFC1a9cnHKhsaAPSN37Jk2+P6sCz5Fp0D2pHfQv0D0LdOMVwJH9l?=
 =?us-ascii?Q?vxnkJRR5QW35WHmj7YC+uUZVLxh8gbtcDqrTQexcW03fvMUBWEGtb00/orKw?=
 =?us-ascii?Q?RZPRvbJzIGrSZ1TqajrsonsGjxJ3Q0TZ20XABAcZppoa1QozUaVMYTokIslw?=
 =?us-ascii?Q?b7Jr9jcOv8zruTVT1ViwgI0XrpMatwlwDfTVd7ah0GxBLB9UvuJY29MxMh7h?=
 =?us-ascii?Q?RsXU7ODaBlzW/wwC7L0NrTTKUkQkB3gaB7B5LbzMo+RvnaJTrpiCkbu46xDk?=
 =?us-ascii?Q?m9OamajX+5EIk8HWSbl8GtMwad1eaWP+RPddET81iBXpwdgeLXrAcL+mVypd?=
 =?us-ascii?Q?TEjywBD1kC5YyRlMhPTuCaK49nxkJQC7qumFddvQVK8Du24KKkY+Gp6VpkTQ?=
 =?us-ascii?Q?PpzBsBu6/ZNayImCkITcgODtyRnwqFcSoJ8emLNZ3UcWZxe+PcbcuSV9GsO/?=
 =?us-ascii?Q?9KlLvAtPz9GWnKWXV4qzylFMcLa0OkCOXCQpCGcWyTlqW8/kJRz33t1VsVI3?=
 =?us-ascii?Q?DtJQitDGWdXbp6aNbU9p3nOSMB+yZ7O4+q2/PxNNHcCOQFAHg+NGhQ8vW0hH?=
 =?us-ascii?Q?6AvLP4xoIqg847dDj/vpKEW7OqVnb+0E6FoEbgITW0Wqb7KXJPbwaN1T/Ru4?=
 =?us-ascii?Q?xzzxTAP+lBmwp81PN2p5scKrN5XvunL8fq+B3PqxeHSaRYF3wmujudP9UJUy?=
 =?us-ascii?Q?Pmv/cbCMMTtIrSqzPY6mpL1wYma6n5z8kpN8FFoEVZjqxYBuD3rW1gj9LQ51?=
 =?us-ascii?Q?6E01Vbl++6qSCC6OvmqIGF506ubkd1Bh6IYXEayGvwlTZoZEZw+ptJrMc+Xy?=
 =?us-ascii?Q?yKZHYDKm5azwuYBLfw8RKhBllciqX9yh6VoL6pnpw7OXkzvSCgDuyixiJ+4n?=
 =?us-ascii?Q?oE9AdJYAJ+j5QAx7LR0Z1JpkTWwacW8uoCYt9NO3nVEi9Dx4grfich7CR0m9?=
 =?us-ascii?Q?JAC5mJBaPFDVADox1YzHS7jf?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e15b2b1-0a88-40d0-e6bb-08d92b421174
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 12:28:21.1799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H0OYOjlVvN2PkAmDygje8/Lz2C/nJEVN9hNLfAIS6HsSrtctDkhWcmIou8jUgCxn0NPQU4sMuguDuyJ6a+OKLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7843
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_052823_213559_EAF97BC4 
X-CRM114-Status: GOOD (  12.66  )
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

We enable RISC-V SBI CPU Idle driver for QEMU virt machine to test
SBI HSM Supend on QEMU.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 arch/riscv/Kconfig.socs           | 3 +++
 arch/riscv/configs/defconfig      | 1 +
 arch/riscv/configs/rv32_defconfig | 1 +
 3 files changed, 5 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index ed963761fbd2..3ae937121a77 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -27,6 +27,9 @@ config SOC_VIRT
 	select GOLDFISH
 	select RTC_DRV_GOLDFISH if RTC_CLASS
 	select SIFIVE_PLIC
+	select PM_GENERIC_DOMAINS if PM
+	select PM_GENERIC_DOMAINS_OF if PM && OF
+	select RISCV_SBI_CPUIDLE if CPU_IDLE
 	help
 	  This enables support for QEMU Virt Machine.
 
diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 57a24d40d43f..ed71f125cbc9 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -20,6 +20,7 @@ CONFIG_SOC_SIFIVE=y
 CONFIG_SOC_VIRT=y
 CONFIG_SMP=y
 CONFIG_HOTPLUG_CPU=y
+CONFIG_PM=y
 CONFIG_CPU_IDLE=y
 CONFIG_JUMP_LABEL=y
 CONFIG_MODULES=y
diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
index 97d899df2445..0088d6989332 100644
--- a/arch/riscv/configs/rv32_defconfig
+++ b/arch/riscv/configs/rv32_defconfig
@@ -20,6 +20,7 @@ CONFIG_SOC_VIRT=y
 CONFIG_ARCH_RV32I=y
 CONFIG_SMP=y
 CONFIG_HOTPLUG_CPU=y
+CONFIG_PM=y
 CONFIG_CPU_IDLE=y
 CONFIG_JUMP_LABEL=y
 CONFIG_MODULES=y
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
