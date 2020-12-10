Return-Path: <SRS0=mXjn=FO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8989FC4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 10:28:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 208D923AC4
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 10:28:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 208D923AC4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eSiY99F2tO01887JunzOiKj2DXeA6j3MV24ao6XOGvQ=; b=oqpvD0arIWRQo/8JrTX1rI0CN8
	SLal47Is+hdZnLi97uOJazkVX21bCU+laSunmEylgWD0CMAM7YTnbznu0ViDkGXr1TYnVmNFCUmDz
	ijNVIFFlMi7NGNGndYu+CDAUVyF12+XjrdZzMv22EICHIEieFhw+ivxFJbIHszSXWr/gEV0QTBk9K
	Vlnx4zOLgSuMLTkq46K3yOBXcC1s8AMqIhDS8xuz4ifLxGXdpurNDvs7Em4dPBE2Kpa5LFZIEO5yz
	xQRI+/aavfPDVJYfMVMZa2AwH3R23QDdSL6HD5dMa7ClJpRQoVvz7KtNotcXO9Dy5lTRTlNbWSqX8
	Ancu+4fA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knJBT-0006Ve-Id; Thu, 10 Dec 2020 10:28:27 +0000
Received: from mail-dm6nam12on2081.outbound.protection.outlook.com
 ([40.107.243.81] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knJBQ-0006US-FZ
 for linux-riscv@lists.infradead.org; Thu, 10 Dec 2020 10:28:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZRxjz94Xct+s80KiBNJaEUZGzXG49N89WZi/Tb2dpBGygxcm6oBB6WA1CfqDxNi0BUSOWWJRD/TenH1UpWn21b4yETuSJ+NSktWURKpi96fEHzHC5641bJLCOOeUAbi+bSZA/4J587OaPksjWyFCq9eD6sfcrxwR6FCo7j3mRPNALYY4ikllwKo7SL/0HsWB7TD5URdcv0aW08Zp/XYNgIoyMaxTeuw8kgeXA8fMnCkxAXI/I47Td68s+XrqNWI7gxpWClfjDwY41ypJLRWoy6i8dWQ0PbCn51V1ZLvC+mdsOVXrAwdyw2T/1WjoKOQG8DFJqnmN6BCl5WFfwzLApg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/6jP1E6Y2eStRDJQZdz8DOfQehvO4a+eDWdbu7G5bG8=;
 b=bcgSXIF4PTuQ1bmGaL+u0IUweNUBPg/eP9dyO9WhG1+Yii3QYFhIX3KBOEoBXCsegylxA2ff2by1Xka+XpH4GPTOafhO6WAmYTw/VIdLRHRQVCD5uxUB8VpriAl0NkG+/6gL4i2sNEnSw/lHcfzCX2bw+oA0QEF+RodZu3EZAnOXZODvLml1xtCAJUYady87ukOH7N7SS5Cg/OhdA7yMG65eouNW4Xb2qLIkR3ORWNmX2iy5O5y9sNXMSQorMzvKvHiG6ilM/tVRWcwUhNysDydUVg4SFFT4bgGw+qCaEZpPqAmh5Gjg+MhbRDvc6ENmtHiGnm7ozKHM4DWtGhTIoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/6jP1E6Y2eStRDJQZdz8DOfQehvO4a+eDWdbu7G5bG8=;
 b=g5uU39VMyV0W1dDfXs/3X5eeRR+Sb/z6HwgRCR2Bc/XloU6EuJB2Cxi6A4e+g0o40gA0c7+Q3FwHfZyFgkDme2/gxaxWJDScetsxoO2ms3USyiIFbUiG7hOD1P1JMlYtXerN/jm91h8K5XkkCZP/yC1ENxT9RowAKhDLUKYxOWM=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=none action=none header.from=sifive.com; 
Received: from BY5PR13MB4453.namprd13.prod.outlook.com (2603:10b6:a03:1d1::19)
 by BYAPR13MB2838.namprd13.prod.outlook.com (2603:10b6:a03:fe::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.11; Thu, 10 Dec
 2020 10:28:19 +0000
Received: from BY5PR13MB4453.namprd13.prod.outlook.com
 ([fe80::7c13:1ac6:9f2a:5eae]) by BY5PR13MB4453.namprd13.prod.outlook.com
 ([fe80::7c13:1ac6:9f2a:5eae%8]) with mapi id 15.20.3654.015; Thu, 10 Dec 2020
 10:28:19 +0000
From: Yash Shah <yash.shah@sifive.com>
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: [PATCH v3 0/2] riscv: sifive_l2_cache: Add support for SiFive FU740
 SoC
Date: Thu, 10 Dec 2020 15:58:01 +0530
Message-Id: <1607596083-81480-1-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [159.117.144.156]
X-ClientProxiedBy: CH0PR13CA0015.namprd13.prod.outlook.com
 (2603:10b6:610:b1::20) To BY5PR13MB4453.namprd13.prod.outlook.com
 (2603:10b6:a03:1d1::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from osubuntu003.open-silicon.com (159.117.144.156) by
 CH0PR13CA0015.namprd13.prod.outlook.com (2603:10b6:610:b1::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.9 via Frontend Transport; Thu, 10 Dec 2020 10:28:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 57a73673-1e50-4a57-a452-08d89cf65022
X-MS-TrafficTypeDiagnostic: BYAPR13MB2838:
X-LD-Processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR13MB2838D44B0AC01A869B4D734082CB0@BYAPR13MB2838.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UhP69ojUEUIld3yld+czOann3BFRn6kI0CN+JBczeOc4zpuAaq3xbAbaIZTdWxi9lxU4FqaK9z1lJKzUL+68sf4kOV+M5+K6LP00CxzD5HGgJbOTKwJrYCyFyYrhAPNesBWz89SyZiCWthw/kr8y9nOvxlocownJqXWnMpxXAqwK/FE9cR2I9Ci8oE5rM1xjChBjo8AGmMyl601hG9s6L5dXqvao6XLg5GV/lq0OoDNx14MrvplaOei4CrKHVd6k98P85YF6LL3D/rsBP+F5yYcSGG9SkLZxD7sEy+kdbKAmD22FiOfwt8snMq/x+apD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR13MB4453.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(376002)(366004)(136003)(346002)(7416002)(508600001)(26005)(8676002)(36756003)(4326008)(956004)(66476007)(2616005)(42882007)(66556008)(107886003)(44832011)(8936002)(16526019)(186003)(66946007)(83170400001)(83380400001)(6486002)(52116002)(2906002)(6666004)(5660300002)(4744005)(6506007)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?4zBpseSo3kBuMIBmDEr+n/3gmKsCVaf+8KcrFcIQpnLopkvPZkGzU8rKyFK3?=
 =?us-ascii?Q?19baTHA9hTcvirH052/1FBGtdzazmmMHP5paHHD+6ES5ojmYWzpioHFhbAY9?=
 =?us-ascii?Q?M1H+UYWBQJmVChTd7OP+Y8HHlwkNWVJb4vwfFXpchzQlOmNDsZaXD0kSNcVQ?=
 =?us-ascii?Q?YakFGj0XrgjpbJWx4U1qUtCvZz6LdSiB6MteZcn3Wbvf+/a02/TDMnrqMzax?=
 =?us-ascii?Q?5HET/+ty3WRf4ufq+lPxwMrsBFoNzylRYhVTB6m7qhh1zu1DP+Db68/v51hS?=
 =?us-ascii?Q?obTK91UXMRFbBpAk7LAQsWHLY2331p3sKFh85El4LGqCAeqIR6rRz4211o4W?=
 =?us-ascii?Q?F+OAilsM7N8SyJuCWoeOfN+cuqDx0FkABvZlc0Z2jqzXsOSJ9uFZWndqTZC6?=
 =?us-ascii?Q?Mv9jXqXDTxDKm1FQWz51y3eQlHuYo66BIbRgfsT2DKTlW51BHGsXQS4At1Xb?=
 =?us-ascii?Q?SjDcnEAFaZskQFFFESrta7BbLq7fCK2WDcKXdNMvp8rol82vOzGLBh4bE1ih?=
 =?us-ascii?Q?pc/G9Q3g1ulmGntilNyUH2GuM4h21eYzP7PL012zLixKtDtiwSeSRCIGevv8?=
 =?us-ascii?Q?B+ckS6yhVp7YuUvm2OBfE29hzwUWobBBow3TQCK3Ps0qcdq1woZnGF+FfUaT?=
 =?us-ascii?Q?jToUuUUC1My1bjihQYq6Dp1zVOFTZWtWe6Cd1IZjID3R20Nsv7pcdJnus+8k?=
 =?us-ascii?Q?S4OGs9Di7yPGI7+NSo+u+gDYEVBho+YoWE7KY6CGfwPXQyAweZwGZBhwLORe?=
 =?us-ascii?Q?8gBmpyAcnNwX0RfnQYz47Ukoi+Mj+2kHd4KzOpOaDVBUeJ7SjffX5Ug6eq2t?=
 =?us-ascii?Q?tsTWs29+Lcosx6eRA8y1k5wwnomg5p6hykuyLjkfGNnFVeQb35ea5ltsyDrU?=
 =?us-ascii?Q?2RxXEYF8lWNrbvxMEVsZR3W6JgJ01n/dt7pubxDeMO5b0zcLTeGe3PxJq/pn?=
 =?us-ascii?Q?j1FgLg1m5t7R92WbmyTys+b/xNo7XK08MspMA7upcnaSVIueOW3PZyO7r+oy?=
 =?us-ascii?Q?5E34?=
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR13MB4453.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2020 10:28:19.1209 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-Network-Message-Id: 57a73673-1e50-4a57-a452-08d89cf65022
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IQaOeGApIuYndXlS1PbiaLm9HhqW2t8OFRLIDVwa+fXiyv+mbxDlImIrnOSEzLfErHfNZKDavpAe2lKHEvGHQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR13MB2838
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_052824_752361_83A8F89A 
X-CRM114-Status: UNSURE (   9.11  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, anup@brainfault.org, paul.walmsley@sifive.com,
 wsa@kernel.org, sachin.ghadi@sifive.com, Yash Shah <yash.shah@sifive.com>,
 robh+dt@kernel.org, palmer@dabbelt.com, sagar.kadam@sifive.com,
 Jonathan.Cameron@huawei.com, bp@suse.de, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add support for additional interrupt present in SiFive FU740 chip.

Changes:
v3:
- Rename the subject line of dt-binding patch
- Add the additional interrupt "DirFail" as the last entry so as to keep
  the order of all previous index same.

v2:
- Changes as per Rob Herring's request on v1

Yash Shah (2):
  dt-bindings: riscv: Update l2 cache DT documentation to add support
    for SiFive FU740
  RISC-V: sifive_l2_cache: Update L2 cache driver to support SiFive
    FU740

 .../devicetree/bindings/riscv/sifive-l2-cache.yaml | 34 +++++++++++++++++++---
 drivers/soc/sifive/sifive_l2_cache.c               | 27 +++++++++++++++--
 2 files changed, 54 insertions(+), 7 deletions(-)

-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
