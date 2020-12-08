Return-Path: <SRS0=oC46=FM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90E09C433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 04:56:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4130C23A5E
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 04:56:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4130C23A5E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/YdDQvXrKv2PfbFKsUvZK8plNBhrpZvCXUYkMmsD60A=; b=RwcJcSWgg9RTagmW6Rw7qbTq3
	tmrrKClKwcztfn0DS0lTpMY9Sl1C2nMy3BSTIVvNLN0rcm08cXiE1iQSVI8yDO8EboNsx/Pw5dRam
	41STFUIH5vTMqLbcc4VwvBG8LKeQbUBGJ/j0wiXhKQzpixPz8TSeLD43qs0fRAZMEARA6tveQRhuE
	0MyyOJEXIIoSIvWelErFTEPbtfxX/YmvikBvucWh8GleVx0scf5fiFXn083XUDVRuPrUkDcz1CVub
	CEJGbbyN9SF14KROTAfuuGBS8dcC9J2B2qTyNTZboLbH47kGln09Rqoltzkcg9ZzUXuMQnmeQEBIk
	X9pBBujUg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmV2z-00044T-Df; Tue, 08 Dec 2020 04:56:21 +0000
Received: from mail-mw2nam10on2042.outbound.protection.outlook.com
 ([40.107.94.42] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmV2w-00043b-4V
 for linux-riscv@lists.infradead.org; Tue, 08 Dec 2020 04:56:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KEVzl+buGruSG+/qRc+V4HYAzkyNp6RFR76KfxYrwjjLG+A1sJhmA2c/21OFX2aRg7u2ZqQTjqeI92Zrw5Ylh6Ku7xdAqJ7K96ZTJVbg2Ve1396FNoagElmB4G2eW7ZQtcQM+bf8lRrInvlRyKrryXGIwtvs8a6y9VV6p3cv+sjtw9+J7lywg1AMQOXMuMqv27JdBHhDmAzXDgNlYqjGoxH/k53/J0elExZyUyyZiKxjXyjuEjmJNHFHR9tZOY3trgAIWsXXSO0M0qb0hWVp/M/O6oOH9yMoREzujiLkGK4cgpNv6hI0sz1IMGp8F4PS5uAassxqlk/Zzk8iDGjspA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N79OTZrrmmNuvMV8VCNul+2BOseccZypgFYJqQlM50w=;
 b=dl7Y4oA8Q0MzOf3L+no/SLkIzyUipWjP3REPj3dlg6cFq9kCl149dXnzWTk8YrWLSMbdSbtjY7eGvOAAtxxmieCbABIcFcv720d3StiLnqiiJm7aQpMXK+Vu8LufPEg2aEDLo9UQsehXl0cXnCmT9wHxWuy5+L/JUQxHk/SeifGlURwpHmHW83TLGFO5kwppqmOq094CqxBhrwm/mQnv64Sb2QliKgIjDNkBYBh1JfbyHq+cmwKp1rMoT1V1GuYQy2cPhaqRF/d2E49RJ1Iqwu+H0pGvhhduO+HUxWdHZ03pG9XiyKluQhv+3mUKJ7/dILy60GK+1oKrO+kXtSGtuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N79OTZrrmmNuvMV8VCNul+2BOseccZypgFYJqQlM50w=;
 b=fjXprMmT8EpFYPd3i4RThveHcVS0+u6wMFP0Wdi7zse5sw1YWDf3DHTS3E4Mm90FNgeAqWfDxkvjWL0wIR/WpMxNkGVoTHz4czd5Jg1yhcwbpfbbhqWHnJRhDZxnE/EDXZn8vBy5AdoCcj3Qh81C1tkOPhA3ztS4/Pk6NUvCIbI=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=none action=none header.from=sifive.com; 
Received: from BY5PR13MB4453.namprd13.prod.outlook.com (2603:10b6:a03:1d1::19)
 by BY5PR13MB3745.namprd13.prod.outlook.com (2603:10b6:a03:22e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.7; Tue, 8 Dec
 2020 04:56:15 +0000
Received: from BY5PR13MB4453.namprd13.prod.outlook.com
 ([fe80::7c13:1ac6:9f2a:5eae]) by BY5PR13MB4453.namprd13.prod.outlook.com
 ([fe80::7c13:1ac6:9f2a:5eae%8]) with mapi id 15.20.3654.012; Tue, 8 Dec 2020
 04:56:15 +0000
From: Yash Shah <yash.shah@sifive.com>
To: linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH v2 2/9] dt-bindings: spi: Update DT binding docs to support
 SiFive FU740 SoC
Date: Tue,  8 Dec 2020 10:25:34 +0530
Message-Id: <1607403341-57214-3-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607403341-57214-1-git-send-email-yash.shah@sifive.com>
References: <1607403341-57214-1-git-send-email-yash.shah@sifive.com>
X-Originating-IP: [159.117.144.156]
X-ClientProxiedBy: PN1PR0101CA0041.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:c::27) To BY5PR13MB4453.namprd13.prod.outlook.com
 (2603:10b6:a03:1d1::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from osubuntu003.open-silicon.com (159.117.144.156) by
 PN1PR0101CA0041.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:c::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Tue, 8 Dec 2020 04:56:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cdbb8064-7d22-4259-3c3c-08d89b3597fd
X-MS-TrafficTypeDiagnostic: BY5PR13MB3745:
X-LD-Processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR13MB374583C4DEB173E5C41B865B82CD0@BY5PR13MB3745.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yI/MrqYCDO1ZvS9lEopau7oJn9xQ93MDNTxVzgtzwi2QhrhT3icF3oX5WNlxQJpsJswS2+fxXVXccMNkgDTWKZbFFYVFlITcgsSjN9yDZOUksB+xUFw6GK7HMFz7OpToccHWL6fvnCPU/5XgmhLi7w9508dwEQVU7pOEaA+MKL1bkulmQuXr0J6Vd3NFpZONBqAq+obJ3D+9jmI47zCsIHRQhWBi3jdqIFBSXu33iArR7bVUDlgV91oN146yxDnImBF2pEOg0zo8EH0uqAT7dVO8Mhps0ZOfdSkizq5hHA5z+yzsYQ+yEpzi14joRhqO0DlrO9ZhuoZADkoGqB3AfA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR13MB4453.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(366004)(376002)(396003)(39850400004)(136003)(346002)(4326008)(6666004)(6506007)(956004)(16526019)(66556008)(66476007)(7416002)(42882007)(2616005)(6486002)(26005)(478600001)(186003)(316002)(44832011)(36756003)(8936002)(83380400001)(66946007)(6512007)(107886003)(5660300002)(83170400001)(2906002)(52116002)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?gFYK+Ti7UwHCFaT3Eti8Y3v6wDoJ8M9lvYBKOaNVZSGGc3ipzoasLsXjP95n?=
 =?us-ascii?Q?tFLkEQin0ctII69ZHQbNm7y3mKhFGvdP7vwW4eJmR2EeOCIWsph0fVvKeQyJ?=
 =?us-ascii?Q?KMZNsQnwVDvUlFZ7ihGDJ2IV4JcxwHaiWS4CeWMPrSvGQuSm+BR7MXCggwke?=
 =?us-ascii?Q?8URYKw9hGmsbvd7Lm7PpnDMHNyjCu60m0nzLSfF1M/EwyMxr2aMLgH3yzREL?=
 =?us-ascii?Q?WucE7KXKLNe7RUUlhmPDYM2+YtiRkSwFvM/lFQ9obdf6SYDSv+WVtJZZ/EdS?=
 =?us-ascii?Q?mRkphsAsQMM7817yI0uIypJSJt89KY29a7qOWACVQ0srziCxOUfMigkgEkWH?=
 =?us-ascii?Q?jZg4xbQ3GU8X9bkQSdYN8wFihCvAg4Oxw1zC2l7fT4vxCuM5Nj56eMVYxqJR?=
 =?us-ascii?Q?3Ld8UlEzcymA2p/8Y1Pp1T0SfUYxB2JqJYimJeh85otCUtWNjHiYL5UOa0f5?=
 =?us-ascii?Q?E4vevw3k79P/4xDCswvdjXFlQCQMYLVMStK0Xu30DBE/2W5I44YuxDhWH7Jk?=
 =?us-ascii?Q?nVn3Tcdpto2GssuBJcLvzKByL+ajhAPEnPgEuhJO7V/WrxbllEwYhVKv0UX3?=
 =?us-ascii?Q?z6GYfEpWuwOXv3+m9tuRKgzHg6PE2oBgyaHyp/OpM3PyW9QovChvsTfu+eBm?=
 =?us-ascii?Q?KLLXkGx8yXgnQPJVaDZD8+cAHqKizMb4+TbVawLYgRsT0f1lsfEX2EXil7/C?=
 =?us-ascii?Q?kUij8uPVDAES21jWqA7JyY7/ftc0BEnrV18FAZOAfj53W5vD3V1VMWTpSVRQ?=
 =?us-ascii?Q?rprn8bIj/DSVorilCZr5zNh7H7lej5iinrrUpzKe+2OdJalwLbv2xlzDpifG?=
 =?us-ascii?Q?EpIXs7cYnlvFAgNCV7Tu3UDwVofQy9JwCJYcGLUcp+eNDXoXkyqE+yDwelVo?=
 =?us-ascii?Q?GYwmDiYUxVZ8plEZnuH985BnTU18cX7rlVZkNZTbObaaA2/sIjwYAwqGjiHf?=
 =?us-ascii?Q?Rs2fOMA9P4jwQkYJx+W5i0PYC0afmKd+Jtph9bgXDNsAajCQ3syz6XOYQp40?=
 =?us-ascii?Q?ylNZ?=
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR13MB4453.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 04:56:15.6939 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-Network-Message-Id: cdbb8064-7d22-4259-3c3c-08d89b3597fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S4mCiekn6ZkE3tvpU0Sh7wQNCKRqF1PQLVzazc+ihMzX+5SWpzb2F7tw2RUNVF6miepl5ePe19EMvXEtGLqyUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR13MB3745
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_235618_228996_E04B90DB 
X-CRM114-Status: GOOD (  10.55  )
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
Cc: andrew@lunn.ch, peter@korsgaard.com, aou@eecs.berkeley.edu,
 gregkh@linuxfoundation.org, broonie@kernel.org, paul.walmsley@sifive.com,
 robh+dt@kernel.org, bgolaszewski@baylibre.com,
 Yash Shah <yash.shah@sifive.com>, thierry.reding@gmail.com, palmer@dabbelt.com,
 u.kleine-koenig@pengutronix.de, lee.jones@linaro.org, linus.walleij@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add new compatible strings to the DT binding documents to support SiFive
FU740-C000.

Signed-off-by: Yash Shah <yash.shah@sifive.com>
---
 Documentation/devicetree/bindings/spi/spi-sifive.yaml | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/spi-sifive.yaml b/Documentation/devicetree/bindings/spi/spi-sifive.yaml
index 56dcf1d..6e7e394 100644
--- a/Documentation/devicetree/bindings/spi/spi-sifive.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-sifive.yaml
@@ -17,15 +17,17 @@ allOf:
 properties:
   compatible:
     items:
-      - const: sifive,fu540-c000-spi
+      - enum:
+          - sifive,fu540-c000-spi
+          - sifive,fu740-c000-spi
       - const: sifive,spi0
 
     description:
       Should be "sifive,<chip>-spi" and "sifive,spi<version>".
       Supported compatible strings are -
-      "sifive,fu540-c000-spi" for the SiFive SPI v0 as integrated
-      onto the SiFive FU540 chip, and "sifive,spi0" for the SiFive
-      SPI v0 IP block with no chip integration tweaks.
+      "sifive,fu540-c000-spi" and "sifive,fu740-c000-spi" for the SiFive SPI v0
+      as integrated onto the SiFive FU540 and FU740 chip resp, and "sifive,spi0"
+      for the SiFive SPI v0 IP block with no chip integration tweaks.
       Please refer to sifive-blocks-ip-versioning.txt for details
 
       SPI RTL that corresponds to the IP block version numbers can be found here -
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
