Return-Path: <SRS0=pdFK=IN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6328C43381
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Mar 2021 11:06:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5401D64E99
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Mar 2021 11:06:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5401D64E99
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=urBM6H9tr/HQO/ps2Heis43ecgeGCsVKdmhuvsabdig=; b=l52FyurjAwTLgM01UfbQe9f6ME
	tCSqzg6T6nsXY/N2ktbN614rbfxtboRVKDXalmvqRFKyHxKtqdsTUMpm99aRydya93M/HUQ2XD0ou
	0ABOmwzxyrGul54ZLl2X4boT59M2DAmw867lluMmFla3eMaCCwRQlP/TGRu2/QMFAhE6jdpK5TWOG
	o3i4zx0/3W2K5yg/B1j1QwWkjvKc6njvXxfvLEGsXB3f2fCAV/wAdoZNvtRn5QuS7UmhX/8aJWq5S
	6T7OkBGvRZLxViw6KrsSTozZL+6++g97TTWau3yyWiJo5WkMioWfxOi5MbcMnzFe4IIQ/t4e5wdTD
	RIWSi5zA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLl34-00Fc6v-Ud; Mon, 15 Mar 2021 11:06:11 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLl2i-00Fc1P-7t
 for linux-riscv@lists.infradead.org; Mon, 15 Mar 2021 11:05:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1615806348; x=1647342348;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=hgq5A8WjGNdVD4pOgiDPxLFVgcuagyoo801xVGoaTeY=;
 b=XBmDWryC6W3drtaSZQ5o3zcXMkHChw/aleveUU//5KF+BwLmG4ZzkKwz
 Hhe3og60v0xd5WHgh/iR5tR3DdYvEVtJuvSkpR0ODHx/GJTTvwuTmUQTg
 1FmRPXediOPNPUDW88KR9CJLq5161J127Uyp2PdsuLnPdsk322Pw/o42Z
 3bZt1kVRVf9BLYiI8EE/hgBHpCAbBh6iAb5Gw4H84ZgfGFSXZztgNIvrA
 Fz+b900NyQR+HvcypZ3jwEJzr7rJL+cAl2f090mrU6WyEAkdsMqfekcVO
 LLvTYpfGo17LDMZU28cMNvaYMdij0N+An0020S7fO3ML+ZgTr1ba6ucpE w==;
IronPort-SDR: IdB4tSPSeUYcXKpdeQojxRbgkFHiHolacImmLR+WJfegoalh9PrIgOLzxq0hnnUzKCXOgqE79n
 P9ikn73qnW7witcAHiqn0bNY7A78DRClJoB+B6eKN8o5ivJ2Eh39Z7RDVVebaTtj5A0a/Pzyh7
 lNkM0bd+isBCDlDqjjnUJ+huUQV7+XK9OyD9tP542LJOU5qQvM/yeqRyEIwVfga0tDfaCRkzva
 N1cNvaJ1f7a05aSOcx2TBSwZOsQlRkVbz4bLZQQbK4QAj9MzH1TJHLUP5pRq+YuQW21d5Wjpv6
 oLc=
X-IronPort-AV: E=Sophos;i="5.81,249,1610380800"; d="scan'208";a="272873343"
Received: from mail-dm6nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.109])
 by ob1.hgst.iphmx.com with ESMTP; 15 Mar 2021 19:05:33 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HbkWfylQ1xCmyqNaan3ZhfFWqXFwdWzR6AF1SNIQZvlMfezfXXyrp5Ljwe6173vpv0OYn8YfkEp3R0He+TDQtmf1JhOxiU/IeOo/O/4s70RwKOZOEFpEvGchdBgQmux41AbhN/PBMBUIbwxUEMHOJVxNWOrxMDLZAWmsHMPFiUhoH0ruZv45zIYpdi3ngFNymSzxiu/+5R4Mj3AeBzmEqmz0G1wVNtVs2ADKRaWpcQWkhg2oZ9KFdNRyzbWok3+y7Spf5oDZbMFQqnK+mEn7EgWXjGePPzeKaBAIkwPWlwZ6kVLor3q3TlzNc+DwSbJ52vLEaMTsp0l7b9YL2kfx7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u/qrNX8dZfCqtqd3SdFYLuqFj1CdwBc9C4DVo557cVw=;
 b=AVovKaXk3sf/8XxWcaHh485obI8rrop5ZHRt8f+U9g8vfT5uW9IbSjakiTjo35ACZYlQsEZdk45lGU/Zag3XExEJ0YBRijRsdrvOs55yrY/ygNy9Snzy4ATjOkRT7qQSnhiKs+BDmM8oqJrOY6NMuFwY3CbeI8wvseejSBUQ+gPKV+9uOPvAOBxtnsRsGcRRfjRH9qYHT502GFr12ApZ7rs02g3VIj2p3rL56y2vbhpNZKLGpLca+l0FCwOPKlPZF1wmtvCnrqpYAC+phYeC3GAUerQFw+H62l6JliAWlD7G8Hpq6z4n5xu1vHggTkGtSlcwlpmFipTgMysHSMZDWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u/qrNX8dZfCqtqd3SdFYLuqFj1CdwBc9C4DVo557cVw=;
 b=yoxA3OzMRwVKQTQGK46ynCqTm50csZfRwW33Yz47clagfTNpwfF0LTLxMbNPznW/7GgGPkmP8zeHo56u2+upZ7K41hPJuT/bufiTmmpcrHwhljLVw05ievUcpB+rn5QObvJj6YN8Zc792izvanDu1UW8H91O6fAb6evp5oPV4YY=
Authentication-Results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
Received: from DM6PR04MB6201.namprd04.prod.outlook.com (2603:10b6:5:127::32)
 by DM6PR04MB5547.namprd04.prod.outlook.com (2603:10b6:5:121::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 11:05:32 +0000
Received: from DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::38c0:cc46:192b:1868]) by DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::38c0:cc46:192b:1868%7]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 11:05:32 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v6 0/2] SBI SRST extension support
Date: Mon, 15 Mar 2021 16:34:58 +0530
Message-Id: <20210315110500.802897-1-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [122.167.33.244]
X-ClientProxiedBy: MAXPR01CA0097.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::15) To DM6PR04MB6201.namprd04.prod.outlook.com
 (2603:10b6:5:127::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wdc.com (122.167.33.244) by
 MAXPR01CA0097.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:5d::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.31 via Frontend Transport; Mon, 15 Mar 2021 11:05:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9ff3f9e5-304d-4fd7-1203-08d8e7a24002
X-MS-TrafficTypeDiagnostic: DM6PR04MB5547:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR04MB55476D4F9ED837398383DD0B8D6C9@DM6PR04MB5547.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nPqI9r+/FIH0oC9ZuY70Rq5vQHzylxjRV4uClPjoAP93ZKOHJNr9897c8bLBLDj9zCLqhMJaL9PikkiFz+uFT3cAVAWF9hEENWvdxc8IQX2Nh4Gq/Tn2jvXFG51JX/KCsmRPmOwMhpvzqlJV6DUYKngmPUTPI3vfRvmujHR4jz+NLqIveIdExdfC+NBcw9Pptst/LxM20O1BVw30FoZU3TeC8fv0mZZgdhLDmTk0pvfynCpVdIpEP2FBxRi0v/hl7BmLY6ym0Arw/jVnm6Dv/NkKaLZ/4I9QoMivjsNSEMSJVuu12uCg2QyzvNx1Q1n2ao1eau/zGtVNESNftg8Y5vyEBJwNYdE9WL20ReuciWHCiNqEgL7373PCAfQKmheLXUa/5UYqhZKOjcEuatOQOagI1M3gn926gOx4Ggbv+xrIYXFzpbkSQLs/wCPIgJzY6FnWrSLWgBDxBwb6fEYzk9nzlSoZFnKORMr6CbD4K0rUQOEV5eYzaCJDwgBGFfzgsTtPuqfdv7jUdaRNgy1vh9hg4e1cK+mNZC9PB9EDF/Pjl0VaTVECxQqHF3URry5IXZ7I+B2LRuhBHjx2HTOSWtjZZwBjhkr9bbczU4LDkL70ZwsWq48l65UvFOt9rWXbqhOUiDDz7Sh9ma9haNEqZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB6201.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(136003)(376002)(346002)(396003)(52116002)(4326008)(5660300002)(2906002)(8886007)(83380400001)(66556008)(966005)(66476007)(86362001)(54906003)(956004)(478600001)(2616005)(316002)(110136005)(26005)(16526019)(186003)(1076003)(8676002)(7696005)(8936002)(6666004)(55016002)(44832011)(66946007)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?zffVNjP6rv/r8Q0JEZMDb8i6m17kvTI4SThMYCOlT5taHJn7Iw5ZRBpTaxKz?=
 =?us-ascii?Q?tAUUaLtFRpPPqMiGnYjj+6A2VmldtVicVIvqeN8OVhIuaPIQU5sfYhwjiF/r?=
 =?us-ascii?Q?7RwUAFGvocAiYa7aBotpnk7tL746rMyTOYUSpakd1MWGRd1GiuVbxL/2f+6X?=
 =?us-ascii?Q?nqwy2yrmM2Njw9WLT6PRrx6T0IMMHM2jBeK0eCshaUuJAOpiTnigyCoGBMVr?=
 =?us-ascii?Q?ttP3VvdkVXTjvx827c2IYC9qNHT2QvNGVO5eCq8EC0FRuQg5X2V5U4ketz5c?=
 =?us-ascii?Q?NKwy0+tFyiRFIH3wE2na8d9bR0QgY4NSEuM/4kWPWYhN4gkewVGNWDXI+jA2?=
 =?us-ascii?Q?IuMoj//SvUJJx0v6wIrY3LU5e8edsnIkSXMmi1SdrnUw0wMOw6iB7LqaiJww?=
 =?us-ascii?Q?TMJKvvbEuYx38u3A9zsB4qkJXMQTze5gDUfc1ddRXhOwOVmuezYDFA/HKZdH?=
 =?us-ascii?Q?/40oSdHrQ2PiytRtEDc9Gv5fpe/WGyRqUrGTvhkQDOjpKSOzrGKGjOOo413l?=
 =?us-ascii?Q?Yzy5FAJqUCfSu4pApTJTebm2bn/rKPk/Ar5LMUX1sBGTXExOaR7XYQ4Kq3nN?=
 =?us-ascii?Q?rCbM6xipq8CZY3kIF3LZeEfHJTzamiOJmw85Ulmtqp8T9HjAgjBJ4J0t3mxC?=
 =?us-ascii?Q?zhLvJbleUm8Dn8Jz897XnxADHvANZoI7mSrRmBWQjyQx/mHT6DYghZ6MXl3n?=
 =?us-ascii?Q?XWpkxVkmPCvo+GCNHFKAZ7xKo2rqzhNuOgZvUehHp2mKbfl0ifqGLisrKqeQ?=
 =?us-ascii?Q?OYFLEIMQ6Z3hNB84zuUCSuzs0pTDwQ7pYgtwWpby6QSZ9h5QHqSdchD2GNQG?=
 =?us-ascii?Q?UD/8pJg3U+0Eeyb0gvrB/qObvUT9kMWEE7mrpe4borQF77J3OXZOEbB+VKnt?=
 =?us-ascii?Q?mVoD4O9Fq64CyUkq5tgZ7JZ7JTv2R968e7Ydlp95M7VgUUNF0+dU0DY/hMtI?=
 =?us-ascii?Q?GewP9nCCMEjOjVxodOakUDlECe/BoD3Ai4A68/UGsrri7QXgjVMMPcxP3r2O?=
 =?us-ascii?Q?yEmHtS71PT/59lnzYhOj10rYU0x3PPTw9BOMsQ20Nt7IFF0Znyudl6JN4xSV?=
 =?us-ascii?Q?wutpKQ2bMCyNaGe+EewbH+pNHrR61qzLDcerFGd+QAgsS9ueGX3YslB3mzJC?=
 =?us-ascii?Q?OfUqD49Ew5kftUateaY91kl+YaFbtYFtg7SdV3NhX/7kToOqZxyEYiNvOoDd?=
 =?us-ascii?Q?deWJw9XVcT/9YoMQ4PjO4Z5SpX1BQGZGEWf4WgvjGiPGY6eneaOiomGoMmsG?=
 =?us-ascii?Q?dO+U098LEGcwHIKNQkcwmM77pNDaqfyKN+19u9JgwPpRiG3mrwrDQnLM25ZM?=
 =?us-ascii?Q?TxvfXZ5uT8kH9wcSI23Wq00h?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ff3f9e5-304d-4fd7-1203-08d8e7a24002
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6201.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 11:05:32.2437 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xLp7iIqsxmuyESKATZiB3V/0GLu6I65DU8hZ+vxwFozkO9DbSc6xyAwIUnnNCQZEmw/ewkiGtUQyvAplTCqD0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB5547
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_110549_621154_DE5EEA0C 
X-CRM114-Status: GOOD (  10.39  )
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

These patches can be found in riscv_sbi_srst_v6 branch at:
https://github.com/avpatel/linux

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

Anup Patel (2):
  RISC-V: Don't print SBI version for all detected extensions
  RISC-V: Use SBI SRST extension when available

 arch/riscv/include/asm/sbi.h | 24 +++++++++++++++++++++
 arch/riscv/kernel/sbi.c      | 41 +++++++++++++++++++++++++++++++++---
 2 files changed, 62 insertions(+), 3 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
