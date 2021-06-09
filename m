Return-Path: <SRS0=S+R5=LD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8CB9C48BCD
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jun 2021 12:50:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D8D0611C9
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jun 2021 12:50:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D8D0611C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=i10TtEMG4xZNXjPHiZPuynRcpfnq03c57NqE1Wlo8RI=; b=G4dLRzesfNhKLf
	zErt9CpBuGur7oNPHvbEGXcJ2lzeh4azCYbwqj/HBspW8D9yivleppCI4D2dMfyeNjB1BjYfgAvfP
	YicmDVEuA5XLnma206ZgCCxVhva6VHYvEfpV6Qy/A1g1CvdndsV1KEhakZApdcwOu/zJv5jnYjC58
	ckeZuXO7VVPih5Z7NKe4cI+7HgSlyeQXs8aNqtpHspR5RXCKMuEAB6+65pt6RJ2HbjPIu93SAqvya
	ygnRYOnvGVvGr6YEQ//ZimE3S7mj3S+e9teIdWpAwREJJWVn0cI+FfAqVDJ9krbFFHjIx2zWzMwrk
	F4mzDXbk2zPeSbl7vxeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqxee-00DoER-KP; Wed, 09 Jun 2021 12:49:56 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqx5g-00DbBZ-Eu
 for linux-riscv@lists.infradead.org; Wed, 09 Jun 2021 12:13:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1623240828; x=1654776828;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=O+sQ9QR+Dwcw5f1E53g1MB1EKtsxCJ3TNQ9ukvl1M98=;
 b=QGAW6adx6W3cVK9A0TeX/tAYmVrGHXFyiB6+0pRxgixpcC/AcbMQ4InI
 uhKMOuJi3uSrFu4D5yfGK+kUPJ68Qit2g7Kj2DVSx8kQ099H9UuPm4fim
 7EvIHHH/7wJKuPO+6ybaEO63nTbzMiO4RbWVGh5eGqOdK+y2kzOSn3dwZ
 Jxixw2Zp7aBJXOBDjxbTf/THm3DzZ6uJj6FFl/WF+JIZ/NzuRUu1FbCd7
 y1DHVzdrxgUA+MDvU4eGrgJlC3Dt4Km51+RUPVaxIZYOTF4zw5EcVqk5c
 2aRRwfM64HzelC1t1/06xyGeE0OZP964OFWhNJs5Wtic/2tgJGJ9CAqCC g==;
IronPort-SDR: qDvpY8r4QTYqknFQUsm5LVde0gcGQadDI8QQ13T3u1s4RP3dRUNPxDeqs64hFqc0qA8TU7BJxt
 ltcHPfP8W94rcshYKTEykPEarfba/3iofDfxIjXiL7vXsnnmpntg+mnDimqMRokTQnKtG7OdUA
 D2yil8Xk/UVgqbAoJj5QmCpJEGucIi5Nkgisd2zHSJSzDuKC+lUdck0Q5DyUbQJCojWtW77SeM
 Kn8oySv4ppRlHi3UmWjDW27qYTCqUAev8jlQE9F31j4XUloD+rQuRrJ2Q+jf9e9wm7Mb1nCjYO
 wP8=
X-IronPort-AV: E=Sophos;i="5.83,260,1616428800"; d="scan'208";a="170575125"
Received: from mail-dm6nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.175])
 by ob1.hgst.iphmx.com with ESMTP; 09 Jun 2021 20:13:45 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OTWmV4vC1zV0YqWn6fUCN1VvSVLt88FN2pY95Yxfrc92mpQeR8pGWNfYY73uXqp1bBXY1NwsC/39ND8ExJ4rU3TouZhF7y1iveP2k7x/NY6BgVx04BuGbFffLtkB1mCcyBPsUMDYQIovQCP98vKo5vyHqNqA8ve8/E3mWKB7CQ1sl0lD7T8IFx2mXLPOoePnpUuZj96CXnMz53lGm73aZ5MfyGq53g93HKpNLidAvhk7VCT8oqsqG7jIC0esny1ieEW9j4r8zNASOVD3ZhYBZoy8uPlnH54uEwrBlHOTQOUpX9MriPeMNXmLo0SepZOCE+7hz3luF51bixNpwPhKkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CtY3Tja3XPrKeKpN4/f54RHFt1//9h6CecA97NrsGQw=;
 b=MObTs5WtM5MhZTZ7qtCdVB+awkG8y2Lx3CRJ8vRV+J8GfTix2v19AAWFT6Xs/Iyr5QRI1UnmKU6Sq70OxEpNGZs6DTHfnd4yQbAXUJ62bvuK3Z3K9mGP/dw897CMNvJIDvjJKbDAwQjTiAx0+du6YKrn8dB21PMALV3fdtLhODlQLrl39Qyt/4kcN73mn2Ocn2OuYbi29WC8x5r/Ifb/qmYEzMZGgwFyTHOg8/WsFudxJ8lOyanHR2N97hNLxq6tptxihM2bRyLmy7Bg+3sjepIl+AJnwteVswFmQ1WlHDQSyuElQTWh62czUpN7pMUdOj1Wdc9y8MWhWsvm2PyBkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CtY3Tja3XPrKeKpN4/f54RHFt1//9h6CecA97NrsGQw=;
 b=I38d7vPu03RDMyWP1hhnwuwySAXtQnyjg46mq4a7LhbVKs5i0Gf4C51GtupB8WKf7hGdaVEu+XGh0ap3FSCs5vY4ciuxcKMCHVlNpTIImE54xZA667i+86IEh4inY1gh3o8Xue8BanWwh+/B5gCZGyAWo5+doc8AzwyKEWVdEcE=
Authentication-Results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB7794.namprd04.prod.outlook.com (2603:10b6:303:13f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Wed, 9 Jun
 2021 12:13:44 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::a153:b7f8:c87f:89f8]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::a153:b7f8:c87f:89f8%9]) with mapi id 15.20.4219.021; Wed, 9 Jun 2021
 12:13:44 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v7 0/1] SBI SRST extension support
Date: Wed,  9 Jun 2021 17:43:21 +0530
Message-Id: <20210609121322.3058-1-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [122.172.176.125]
X-ClientProxiedBy: MA1PR0101CA0036.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:22::22) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wdc.com (122.172.176.125) by
 MA1PR0101CA0036.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:22::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend
 Transport; Wed, 9 Jun 2021 12:13:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b9d19a99-1d36-4765-7f9c-08d92b400662
X-MS-TrafficTypeDiagnostic: CO6PR04MB7794:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR04MB7794F6D454852C07D5959A068D369@CO6PR04MB7794.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gqzEuVUB7/PW7GT681bqZsdRYpThqZcfxTGaIFXnegFOgrZWzf8BsPP8+JtkF5QSS0dWPn5XP/S6bOhr7Dn/Gexlfx0grldiqie3YDg93vGsVKOdV1GwC4Kvydh0xw54Bu/yNOfbj0kIaHjokOqY3+uZfPDQqwuURTUGWK0JSN47xLFHtLg8UZglQe66CO0yXhbgzOBCvB3Jf0A92sshAYqQG4mTFpM7hRDEf4zeEiKVudhxg+S1FJIdoP0Y2iaOfoVTZmQDvzS85U/Bk4PH9SZU5CKuA6YsZP/3ct8o9Wft8h9YXF95vtKVPDeNF7axgDvu0ahXpVaJfO7Y7y2Cys4SNAbgGiLCY9PZlYQ2HzEmChj1z7NXE9VWpw727WfgN4BW57RcnYshPcXSIRnF5UILMxRUSoUXVPRztBj1K9GtauYB/QAIYUa1pJtbzfmIO9DIfSYf34NjyBI4TcD2rz81/a6T2l0oM0UUTYVkxdLOoeRQwfvIybq3gzYd74akkFPKpMawjgLJNl2+tAej62ckdzlrpELk3MKuYP6vE8ac865MsYxWE6OEUeZmSwRHzLQ2jKYoEigDRmfXFJ2MlRklAd+St/4R4T2CdRJNtsPUUx0S03yLNkh6pOXfnA0lUrlv0HHbPaBmNry1th3LozREwuh2tRMXXfAzJlrewLiAkYkaLWAVPUY9E7uq6bC3d+QwuNG9Oxcx9o/S0kJgDeFlN6gYWbyV+jTYs0XLmZAXxBQk+Obd7oQ8JvZmATr8Zbs6wQSRtEeScQhlnyO15Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(346002)(366004)(376002)(8676002)(316002)(55236004)(38100700002)(38350700002)(110136005)(86362001)(54906003)(4326008)(956004)(966005)(478600001)(26005)(186003)(55016002)(8936002)(2616005)(7696005)(52116002)(16526019)(5660300002)(8886007)(6666004)(1076003)(66476007)(66556008)(36756003)(66946007)(83380400001)(2906002)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?daBw3CZ8xtGSbZcxRxVuI1nbHEZHsoPOKauNXmNZjWnCwgcMZ6/bQctmNmFy?=
 =?us-ascii?Q?Q34sDRuQXFx/bNFBYtYr7V7g+Zs0L5AUrAQnp5kxwDifRiH4/MZMTYbkPwum?=
 =?us-ascii?Q?DSPD5JJUSwBdAyUlY0JP8Az05Eie5hNlozKwFDryGyYM11Y4UvsBLGgWleJB?=
 =?us-ascii?Q?aEIMK4WO27WDgUqIj6GnyFrxTW+Rm/4YjpCjQtavDZNex6bRWj1Nvvt8I0ZA?=
 =?us-ascii?Q?uQybcfr1OLuY8M/MkSmav6tinCqXpzd5n48LPEkXAqnyMM4edr3XuFrXXFIT?=
 =?us-ascii?Q?RXJxNs54i5sr25BNqxuZuis5B/zO2oPT0QsEbPUyPNQmsBe1qWBkiJC/Ego4?=
 =?us-ascii?Q?+tQyY4UbzDDP2c8GWbL7ijQoDlSImymQQMNNCvXQ8rdXRjfPRyh099JOZaCP?=
 =?us-ascii?Q?rfVRnFDzkjDpFQf9ajCftdadutXhMiEIiles23ptIkMdd8vp10Ss1vABjwAf?=
 =?us-ascii?Q?L5H3i29Vau/4IskH+ncBhswfoh0qW/E4A4/OOfWyQ2HU81utxC+CPUAdZH21?=
 =?us-ascii?Q?S3nSBAljzGp1kYfC+66v1FISUSc2WqUgKpdMeq9H8CIM7YaKf7nXu7EXeYZw?=
 =?us-ascii?Q?nmJzjB8dQord5Euv/utCTgynu4k0OBHeMQnyUeS485LGgvmhzKOXBZCtFCj0?=
 =?us-ascii?Q?iddd5KzQCo9f4Q2QHAF132mkMOKJpZOAvU/5LLO0KHsnw1BTyEw2L+E+21K4?=
 =?us-ascii?Q?idrsX9C3oDSYziq9DSTzxPzRqxhYVopj1lDMedig3F15o7kBJMEmqk8oH6cW?=
 =?us-ascii?Q?Gm71ioag1iSGA1aEbdfx8r2FyKnewX5jo0cFT2DkorgP92chDILVZN+HfDg1?=
 =?us-ascii?Q?xOS9Bp+KYdolPPn0PuC5gpRejdpWlZITQtNJonV0ocbI0N347xxPaEUmf02o?=
 =?us-ascii?Q?rEz1th2S9yxi9Gf+9AG+Y7HiJOHdxr1/4eyhnhUTH0p/EViC0LLcFpCcx8Qq?=
 =?us-ascii?Q?+zgVC2IMnXZVk9TWCNdTruNJkhGEgYTL7eRTpSsEfaVZh2F6mrcV72rrz2FR?=
 =?us-ascii?Q?4W5+txE1V0b5VLDATVZZyQOwwHLAaoyl21l1QyOgwOi4/MIuu1gtvWDSpnMZ?=
 =?us-ascii?Q?y5o4PGCcZD1Agsxnru0E1ndi4zZsY4p0kf+GrWOOIWpSJQlYEOhypAZRhfi8?=
 =?us-ascii?Q?mnVz84tHw+9oIDoPYnB7JF7KrORPp2PGUG1futCoChqviiLxeBHUqM2CLPYm?=
 =?us-ascii?Q?Fp/dt9vvaiDjHrQcDqczQMaph1G3NQHzfoEHwhcfp/czfFskqW4FPCddYPEZ?=
 =?us-ascii?Q?3/Zndt4hFNsSbmr1WAjXy14gzlSwUzMAyGFxpxPVPyNeuEw1T3bSMrRxmxNf?=
 =?us-ascii?Q?w9Fqef0ym8ovRxOdiIcqDMaJ?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9d19a99-1d36-4765-7f9c-08d92b400662
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 12:13:43.9096 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nLvOJ18XdqpMQEPjNvU1UQ6Kezk1oLS2PXLl5fjxMXnkS2f/UPOzwy0iq21I+oyPSRgZXP2qoo1wYI+tTH0FRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7794
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_051348_698729_16061FC0 
X-CRM114-Status: UNSURE (   9.83  )
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

This series adds SBI SRST extension support to Linux RISC-V.

These patches can be found in riscv_sbi_srst_v7 branch at:
https://github.com/avpatel/linux

Changes since v6:
 - Dropped PATCH1 of v6 series because it's already merged
 - Rebased on Linux-5.13-rc5

Changes since v5:
 - Factored-out pr_info() related change into separate patch
 - Added cover letter

Changes since v4:
 - We should compare both major and minor number to ensure that
   SBI spec version is 0.3 (or above) for detecting SRST extension.

Changes since v3:
 - Rebased on Linux-5.12-rc1
 - Check SBI spec version when probing for SRST extension

Changes since v2:
 - Rebased on Linux-5.10-rc5
 - Updated patch as-per SBI SRST extension available in the latest
   SBI v0.3-draft specification

Changes since v1:
 - Updated patch as-per latest SBI SRST extension draft spec where
   we have only one SBI call with "reset_type" parameter

Anup Patel (1):
  RISC-V: Use SBI SRST extension when available

 arch/riscv/include/asm/sbi.h | 24 ++++++++++++++++++++++++
 arch/riscv/kernel/sbi.c      | 35 +++++++++++++++++++++++++++++++++++
 2 files changed, 59 insertions(+)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
