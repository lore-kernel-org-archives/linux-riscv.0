Return-Path: <SRS0=tjIm=KO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B87F2C433B4
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 03:38:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A20761261
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 03:38:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A20761261
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=X1osxxPk/BadyC/3SdjiLXr+qoQUCy4eQKK+QbRvJl8=; b=TETf1aIcS4woizwhLh7LjeRNa
	U3n82R/DJWhlnsaBkMQNz06X7DSj/RR9gimTo4OUssC/JO9ZJK+RnprhsgmFw49UliEjLJDMrXTI5
	kyH8zEC0Y61pMeGAH06GbZCe6vEun1s7cTt4SAZKoDkMeW8Le9SqlWjgI5wOlS6+b/5xaT/oehuhL
	J/fe/k3f/tvdo8+AsBv52xn8pF1z4dogCCtIi4DagqmRTqGLcpMx+JQrkE4aZFjdTcV/rg+jzn1bc
	EwiM7UxdxgucgNJDUmjQTeuE3zwcXRSh1BzHXzyjzNSP8bKVqfQNJuQO/cHTETW1wuVIWDl1/NnUg
	m4Mo9qQRA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljD1u-002bhs-1B; Wed, 19 May 2021 03:37:54 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljD1I-002bUx-Vu; Wed, 19 May 2021 03:37:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=MIME-Version:Content-Type:
 Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=jgKKe5dyXVT3lvu6gQ+jrXssvzhq7Py5bhO1yx4TAEA=; b=U+/3G99mYszyAp2gxaTxByCKaP
 k4DCR/K1xZ7T9g42Sb4O++YLs8txDiUSgSWHkpKSDY1IrMto8Ok0JjPkbBJw3OcOmYLoaPPGXotKc
 uork+NdzNVwNKyhda752gHeOKYCcjwFGPHioO+WN5T/uKKmeBI69nglrwm+PeQx5SGm2qEA5UkQW4
 ZEYMi1xTGnFqKA+NIat4HyDU8mqRYY2+/OYJw9QAKEpYvqRpzytp/PE8Lth27GV5gSQN1smR6MMxv
 W7Z0IKiwwa5qH4vSL+v4gxR8l1QXumSP5uLxsGDHspVoWYGvT98vefUg7ZgRSnueeCeQND6CblYyY
 H7JHgbsQ==;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljD1G-00F5kE-0N; Wed, 19 May 2021 03:37:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1621395434; x=1652931434;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Lpt13wgVJtIqg6elfRb5V9ihJleJV8TiEzxJdW05d+E=;
 b=oiwj2ReGMK+UF2uauQ6aC/74ZHNxi3S4MAjYIY35xosA1pNb6SHcZR0Y
 /Al1IayBMshPMnefFV4wcndjvxQ5fmu0YJAuExniX/KZyX6FZP7LhgXIq
 32esWz3+E9R2o4l1uJFaNm+yvbOVYkUjAV1tSTvZcBQjmFZXHW0giXmob
 ZhzX5N3HmPscFNglMdQphCr36B/58fwZwsuNItYsrlxRqZQh/E5AvtS6l
 BIhwQXUEWL3eOi32Fpcn/3m3J1R7GFjGpWSc86ZA4ewiKUdiI644aINqF
 4/a2nAq29E2JAHqKSOIQZRgoAYcqVeVv2yFgeXlF/6k467IcMBj0sT7b9 g==;
IronPort-SDR: iWsf025p607lk4vdFmOwJYEocgCUwgKkPh76OUtNXxr+mboDOJQbkhCT79n6/FjVnpHaU8c3oT
 0gM/DD/a99K4Jo+IolABxLmV4PvGL+8fAsdmS4qEiDET8KCRGpWVb/OdrXqwnO3yxrG/l8gdMV
 RqJNu51OCQyo5rVje5OIoofetD0aX7UF43C3o6kRqeABtnirbFdO7NGS3gNdmJPswPn2Iu6NA8
 jLpzczCPO6GqpcKFok9UCNSesFucmxYqKjzmI43/ontt3KPN0pHrOa5RnufcNRanf6Y4hsdvp8
 xUw=
X-IronPort-AV: E=Sophos;i="5.82,311,1613404800"; d="scan'208";a="272597290"
Received: from mail-co1nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.169])
 by ob1.hgst.iphmx.com with ESMTP; 19 May 2021 11:37:15 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZDjEEkpHNt7PtZOdruOhRzBChGPitlmimRg+grkij6/C23bmQQeIhAf8Eatg6WOzxfy5txjKZggvAmJJT0dcNau8GJ9d6z/DqcTeolnwau8q78E7tVc/D6kosZA3mYc8trHC3CxY6V9gb4PcVUvC373yX7kQ/GYF6uESdzpznB+WlmnMlwcS36gqdUJcvRXlDlu7Ao2vUrA4gWdnsDG95/F1/+XUFhN82VViYXCgELoRxB6po/RVMK0uW0BSZsWwk92vmwHVpi1PTD1hYLZqPZmX+eLqEmzsW5Nx1hd3J11FE6ic2mIGtgutO9gCh+2xingCVRIR3XKWAEh/Ka9JWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jgKKe5dyXVT3lvu6gQ+jrXssvzhq7Py5bhO1yx4TAEA=;
 b=lZZuV8vsdmSG7rEsZavTmzLzCBMvPROBWB4mGImPXnhy9k7+cpMDPKQYXvdGBGmN92oI0YXU7QXQ7Jnb6gW8mPRxCBVGLEamza2ZakxYaVQKRFWK0K6RmZOtEAf11satLlTpxnNwNtOnP8rHu81lMHglAwoVVg9UNLEdPUS00KpeB0IbGNDCHKApQIKjkHCHJCRvJHddl9JSdXIHmmHmLwlLnmpQ3k/iurs5hJvQw7YEBxMbYZ94iQklU6ePMu3DcKLRC7RkTt4DAUbBQCnP0lcR+Pvf5MBQiMpgoWL0kncmZWpiNyggemQTCWVDqpQJIt+0IYb3nxEKii13qybaIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jgKKe5dyXVT3lvu6gQ+jrXssvzhq7Py5bhO1yx4TAEA=;
 b=RoIUaFdVHjtHTeaGgCMXyIyB7OBE8uaLXbK2y99ss2x1ifVg8oJ9ovK01JHPPVBFfQ4VT/jpT2fpMnhBuS0EsNLS0GctOtReswVjhGFRVE3e7AibNFpqd03lPGJ79U7T6xiKI7PBbmCgURQ58K0tNy7yhRRCSGlqHStrmasnT9w=
Authentication-Results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB7761.namprd04.prod.outlook.com (2603:10b6:5:35f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Wed, 19 May
 2021 03:37:12 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::88a0:bf18:b01d:1a50]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::88a0:bf18:b01d:1a50%4]) with mapi id 15.20.4129.033; Wed, 19 May 2021
 03:37:12 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alexander Graf <graf@amazon.com>, Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, Anup Patel <anup@brainfault.org>,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v18 11/18] RISC-V: KVM: Implement MMU notifiers
Date: Wed, 19 May 2021 09:05:46 +0530
Message-Id: <20210519033553.1110536-12-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519033553.1110536-1-anup.patel@wdc.com>
References: <20210519033553.1110536-1-anup.patel@wdc.com>
X-Originating-IP: [122.179.32.148]
X-ClientProxiedBy: MA1PR0101CA0057.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:20::19) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wdc.com (122.179.32.148) by
 MA1PR0101CA0057.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:20::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25 via Frontend
 Transport; Wed, 19 May 2021 03:37:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4fe25389-ce77-4538-9030-08d91a77634a
X-MS-TrafficTypeDiagnostic: CO6PR04MB7761:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR04MB7761827720278ECD32D3139D8D2B9@CO6PR04MB7761.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bnnVJ3I6w6fZ9ViR/S8WVbtfRNWteVn3D/3DthbT54W9WC4ojvQQBbwHP4Le6BM9OuwXhjvIHxGrIdx1h+RMNSsucde588bCUcreLDKmrt3HTBD1AwukLXw5molYjW9gzkKl8XS6C+aYmx99Pa70kTW1tLxs32TiCrXU9sw0eq0jpJan704J50NcSh08sIpIVudEt+cm1oqlNpOjQ3ywULJKbDbxn2D4uIxk5XEI4IBS73y6IuIc9wVgGWdrm70RuoCNSJr2evk0ChDeaw+wb4PaWi3mfXOOxZHFMUNelNf47bPjDFL0HrXO+xLwR3LqNGb6oj70qgFELpOcNgFny8hqvG7DtixnwG0aUJIcNp2DPGJUTkp+MA7GZW/vBYWyQpwcf3VpUzrFyydZgR6cBHZf//H49N55pDBK3xmGur0G7nLkPf9p5xCOrmG0AiB97EBCwxexumqMZ2TFl29N3QK+a3zfAfLWyO1AX8JNfarRYoQsaeb8/lr0iRIB1K8c0dIm/d2dqYx9aY/zvPrAEtoBzmXOyqsr6CNO8paEIqExM3myBxvlh6xH9B8qiktiPUSR0KGmgiTiM4Bqpx4K/eSDyY9qtS+MkmyZqSa+sLg0hVi3w5c8s/prcZGCfFKK668Zau1vGIPCkXNJp3D1wQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(136003)(376002)(39860400002)(346002)(316002)(38350700002)(55016002)(38100700002)(66476007)(66946007)(1076003)(2616005)(186003)(5660300002)(4326008)(26005)(8936002)(478600001)(86362001)(2906002)(52116002)(7696005)(16526019)(110136005)(83380400001)(8676002)(6666004)(66556008)(36756003)(7416002)(956004)(54906003)(44832011)(8886007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?OOp9SscNwCd0gcTgvBcrkk7gBVTd3EAb9JVBoOPCqFPfCVWV087McfeD62Hx?=
 =?us-ascii?Q?P/idNKHQVdolax5pSpEO7FakEvgsFOGDgszrVKjHd6RfZpRJaP1cuQ96r1JB?=
 =?us-ascii?Q?dUv2HO2mwulziFKQnF2mrlRfcq1Nu5GR1MNJV/9o4eGj+aGZwZqTddOmQbpp?=
 =?us-ascii?Q?AcS/e1c4YVyiXzQ552pPRPCyYHhH6nvupNT6mMX/XadbNOrcQCS5CCXoOEEY?=
 =?us-ascii?Q?uPmMAD7BkGeDiicKvKB82iTIPpkijlePLG1ImGMqB1JSVZt7pWXJIuy2qqr8?=
 =?us-ascii?Q?rpz4jwziWTDelwJP8SPqwPFt6mFwBb/dheZ2HspHFh/bDVJw7vGRPbt3jTFm?=
 =?us-ascii?Q?PEKYfIE+vbRrWqbjrmXM+kxWlxoMrnp+JZG4Bf+cMFVTipP2o0yX4GecVRcG?=
 =?us-ascii?Q?OBHiZ+/p1GLV0L2kCh8ml5KvH6JvZSSUPQxVaE4TJqJE1U5RTe2Tl7n/1MgP?=
 =?us-ascii?Q?aiB2gFngP39a2op/tR3B4WroY0P92ifzwvfrZJTZxPSeZ3DRkdll+hhHjP0K?=
 =?us-ascii?Q?1NZmdcbTduRqmb0Aotpc8L86oe9EHka6uiU8rlkwhvAPyK4i/tnRPIPXS/v2?=
 =?us-ascii?Q?LMgD8nkV8ZXlTzSgef03VxcCZafyc4mE1KPo2FBt24zUfswCyeg45j7tRPgI?=
 =?us-ascii?Q?8SMbU2HHakvtPNx2lZQ54+49n40dnQB91JMfcOVqQ915MKZgi4Vas93Mzy8R?=
 =?us-ascii?Q?aayBir0IxsDMWgtJg0WEe5okBQpK4Fpp/N+ww2G+Dvyh3PDkF8ccbjvxBtTJ?=
 =?us-ascii?Q?s6C/BWLhlRHIcQBImz3Vs/zPWDE2cLbxCWZVAlEdbZhboFbFDFoNLddrMHte?=
 =?us-ascii?Q?Pf/A60tzt7uYVLcx0s+B6kPoNxw9DQrB/iAq6c5GwPMClSNLXHUc85QvvdiN?=
 =?us-ascii?Q?SXM/YuvebkAL9ONu6p+ZjB6Jwmyuv8Ibep3I3As5wdm28ShaMvU891VZc38h?=
 =?us-ascii?Q?c5MSrq8trXF2OFtZnA6xJ0qk4fFz1MO38iqCvaZhiSWpxN8W3fSuuUgqZ1m1?=
 =?us-ascii?Q?SNx8p0FjcPgapKNF/X8GGsf83s+TBrLmqid9kAikJDBF3SSPfZuSvFKw7jk6?=
 =?us-ascii?Q?f+5ldAcR88YWEmqRA+GM4HKXfAQWKQlKFmuPxxvf/kBMSkoCgfijxbBWqZ7k?=
 =?us-ascii?Q?9WKeD4T1zhyr/aUQ28ENWoxPMS8FGdmuh5mUhiph2AZ6LNA7qUH6l2iD+V1B?=
 =?us-ascii?Q?3wRRg6WAMcEdPzCozk078/k4oSimwUFUd6LDLqEytwrLbB13qfouqATF9w5y?=
 =?us-ascii?Q?nTN8H5I/11oyvDLg97jSaUn0YaNM+EajUrtNe76Qdm5zH9OnKYplOfer90AY?=
 =?us-ascii?Q?0eYp44lnZGMA96kzjGt6SUEg?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fe25389-ce77-4538-9030-08d91a77634a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 03:37:12.0649 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K037Ap5FGU/0dXxhx3oNGtEo8W8ENg5m79VosvYLH9WdYTIA0+R6JChrjT6ipC/lP6UfZpxT4fTssKsmd0DH+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7761
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_203714_195112_E47B3A52 
X-CRM114-Status: GOOD (  19.87  )
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

This patch implements MMU notifiers for KVM RISC-V so that Guest
physical address space is in-sync with Host physical address space.

This will allow swapping, page migration, etc to work transparently
with KVM RISC-V.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Alexander Graf <graf@amazon.com>
---
 arch/riscv/include/asm/kvm_host.h |  2 +
 arch/riscv/kvm/Kconfig            |  1 +
 arch/riscv/kvm/mmu.c              | 90 +++++++++++++++++++++++++++++--
 arch/riscv/kvm/vm.c               |  1 +
 4 files changed, 89 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index d2a7d299d67c..51fe663b5093 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -201,6 +201,8 @@ static inline void kvm_arch_sync_events(struct kvm *kvm) {}
 static inline void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu) {}
 static inline void kvm_arch_vcpu_block_finish(struct kvm_vcpu *vcpu) {}
 
+#define KVM_ARCH_WANT_MMU_NOTIFIER
+
 void __kvm_riscv_hfence_gvma_vmid_gpa(unsigned long gpa, unsigned long vmid);
 void __kvm_riscv_hfence_gvma_vmid(unsigned long vmid);
 void __kvm_riscv_hfence_gvma_gpa(unsigned long gpa);
diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
index 633063edaee8..a712bb910cda 100644
--- a/arch/riscv/kvm/Kconfig
+++ b/arch/riscv/kvm/Kconfig
@@ -20,6 +20,7 @@ if VIRTUALIZATION
 config KVM
 	tristate "Kernel-based Virtual Machine (KVM) support (EXPERIMENTAL)"
 	depends on RISCV_SBI && MMU
+	select MMU_NOTIFIER
 	select PREEMPT_NOTIFIERS
 	select ANON_INODES
 	select KVM_MMIO
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index fcf9967f4b29..428bf8915a45 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -300,7 +300,8 @@ static void stage2_op_pte(struct kvm *kvm, gpa_t addr,
 	}
 }
 
-static void stage2_unmap_range(struct kvm *kvm, gpa_t start, gpa_t size)
+static void stage2_unmap_range(struct kvm *kvm, gpa_t start,
+			       gpa_t size, bool may_block)
 {
 	int ret;
 	pte_t *ptep;
@@ -325,6 +326,13 @@ static void stage2_unmap_range(struct kvm *kvm, gpa_t start, gpa_t size)
 
 next:
 		addr += page_size;
+
+		/*
+		 * If the range is too large, release the kvm->mmu_lock
+		 * to prevent starvation and lockup detector warnings.
+		 */
+		if (may_block && addr < end)
+			cond_resched_lock(&kvm->mmu_lock);
 	}
 }
 
@@ -405,7 +413,6 @@ static int stage2_ioremap(struct kvm *kvm, gpa_t gpa, phys_addr_t hpa,
 out:
 	stage2_cache_flush(&pcache);
 	return ret;
-
 }
 
 void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
@@ -547,7 +554,7 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 	spin_lock(&kvm->mmu_lock);
 	if (ret)
 		stage2_unmap_range(kvm, mem->guest_phys_addr,
-				   mem->memory_size);
+				   mem->memory_size, false);
 	spin_unlock(&kvm->mmu_lock);
 
 out:
@@ -555,6 +562,73 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 	return ret;
 }
 
+bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
+{
+	if (!kvm->arch.pgd)
+		return 0;
+
+	stage2_unmap_range(kvm, range->start << PAGE_SHIFT,
+			   (range->end - range->start) << PAGE_SHIFT,
+			   range->may_block);
+	return 0;
+}
+
+bool kvm_set_spte_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
+{
+	int ret;
+	kvm_pfn_t pfn = pte_pfn(range->pte);
+
+	if (!kvm->arch.pgd)
+		return 0;
+
+	WARN_ON(range->end - range->start != 1);
+
+	ret = stage2_map_page(kvm, NULL, range->start << PAGE_SHIFT,
+			      __pfn_to_phys(pfn), PAGE_SIZE, true, true);
+	if (ret) {
+		kvm_err("Failed to map stage2 page (error %d)\n", ret);
+		return 1;
+	}
+
+	return 0;
+}
+
+bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
+{
+	pte_t *ptep;
+	u32 ptep_level = 0;
+	u64 size = (range->end - range->start) << PAGE_SHIFT;
+
+	if (!kvm->arch.pgd)
+		return 0;
+
+	WARN_ON(size != PAGE_SIZE && size != PMD_SIZE && size != PGDIR_SIZE);
+
+	if (!stage2_get_leaf_entry(kvm, range->start << PAGE_SHIFT,
+				   &ptep, &ptep_level))
+		return 0;
+
+	return ptep_test_and_clear_young(NULL, 0, ptep);
+}
+
+bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
+{
+	pte_t *ptep;
+	u32 ptep_level = 0;
+	u64 size = (range->end - range->start) << PAGE_SHIFT;
+
+	if (!kvm->arch.pgd)
+		return 0;
+
+	WARN_ON(size != PAGE_SIZE && size != PMD_SIZE && size != PGDIR_SIZE);
+
+	if (!stage2_get_leaf_entry(kvm, range->start << PAGE_SHIFT,
+				   &ptep, &ptep_level))
+		return 0;
+
+	return pte_young(*ptep);
+}
+
 int kvm_riscv_stage2_map(struct kvm_vcpu *vcpu,
 			 struct kvm_memory_slot *memslot,
 			 gpa_t gpa, unsigned long hva, bool is_write)
@@ -569,7 +643,7 @@ int kvm_riscv_stage2_map(struct kvm_vcpu *vcpu,
 	struct kvm_mmu_page_cache *pcache = &vcpu->arch.mmu_page_cache;
 	bool logging = (memslot->dirty_bitmap &&
 			!(memslot->flags & KVM_MEM_READONLY)) ? true : false;
-	unsigned long vma_pagesize;
+	unsigned long vma_pagesize, mmu_seq;
 
 	mmap_read_lock(current->mm);
 
@@ -608,6 +682,8 @@ int kvm_riscv_stage2_map(struct kvm_vcpu *vcpu,
 		return ret;
 	}
 
+	mmu_seq = kvm->mmu_notifier_seq;
+
 	hfn = gfn_to_pfn_prot(kvm, gfn, is_write, &writeable);
 	if (hfn == KVM_PFN_ERR_HWPOISON) {
 		send_sig_mceerr(BUS_MCEERR_AR, (void __user *)hva,
@@ -626,6 +702,9 @@ int kvm_riscv_stage2_map(struct kvm_vcpu *vcpu,
 
 	spin_lock(&kvm->mmu_lock);
 
+	if (mmu_notifier_retry(kvm, mmu_seq))
+		goto out_unlock;
+
 	if (writeable) {
 		kvm_set_pfn_dirty(hfn);
 		mark_page_dirty(kvm, gfn);
@@ -639,6 +718,7 @@ int kvm_riscv_stage2_map(struct kvm_vcpu *vcpu,
 	if (ret)
 		kvm_err("Failed to map in stage2\n");
 
+out_unlock:
 	spin_unlock(&kvm->mmu_lock);
 	kvm_set_pfn_accessed(hfn);
 	kvm_release_pfn_clean(hfn);
@@ -675,7 +755,7 @@ void kvm_riscv_stage2_free_pgd(struct kvm *kvm)
 
 	spin_lock(&kvm->mmu_lock);
 	if (kvm->arch.pgd) {
-		stage2_unmap_range(kvm, 0UL, stage2_gpa_size);
+		stage2_unmap_range(kvm, 0UL, stage2_gpa_size, false);
 		pgd = READ_ONCE(kvm->arch.pgd);
 		kvm->arch.pgd = NULL;
 		kvm->arch.pgd_phys = 0;
diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
index 6cde69a82252..00a1a88008be 100644
--- a/arch/riscv/kvm/vm.c
+++ b/arch/riscv/kvm/vm.c
@@ -49,6 +49,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_IOEVENTFD:
 	case KVM_CAP_DEVICE_CTRL:
 	case KVM_CAP_USER_MEMORY:
+	case KVM_CAP_SYNC_MMU:
 	case KVM_CAP_DESTROY_MEMORY_REGION_WORKS:
 	case KVM_CAP_ONE_REG:
 	case KVM_CAP_READONLY_MEM:
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
