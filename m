Return-Path: <SRS0=F3Ra=MX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7C41C32788
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Oct 2018 12:18:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 719B12077C
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Oct 2018 12:18:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XkaaKLZ5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=raithlin.onmicrosoft.com header.i=@raithlin.onmicrosoft.com header.b="gsccCsJh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 719B12077C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=raithlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Iyt9xXENvtD3nZUH+7EMTW8ky6wEAxRmh81oeEG/qc4=; b=XkaaKLZ5O/ONpT
	bo6LeKejgs1VvKjntucBWBRFo4fJDtwUCfkd/jU4yH7Q5+bcEbWct0BmgZ41ySId4BZMAx6yE/bBY
	oab0xWqgnCkF8H2r8TMkOxIsHwlZAxEikU886ADZ/TbV3IvHCggU2eA4fqw4c+6/BKVgyYNhE52cI
	L++LpJM1c7Q2iTt34QMbYx8o9sOqYXbaqdRdoEqOdkaJHSbrEe78lI06vnEHpEkzhF0HgWaoKW2Rp
	D3lBPsCTs1qDVs8sGTZxbdRCvH6JUD33zg5hd2ddNXwskt/MF2XqS9PEagXffjicPBEm/sf2CPP0T
	wHqVRxNa/f43Ve/KxqHA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gAZvW-0008So-RD; Thu, 11 Oct 2018 12:18:50 +0000
Received: from mail-eopbgr660121.outbound.protection.outlook.com
 ([40.107.66.121] helo=CAN01-QB1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAZvH-0008JS-69; Thu, 11 Oct 2018 12:18:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raithlin.onmicrosoft.com; s=selector1-raithlin-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tAwtrOX1iikT9LsyjXS4U4zEXjV9uoPsquW7B5xPxE8=;
 b=gsccCsJhYvXXHQXNferjNaCANiius5/tPn7eJH0FZjJC30pNie2+o1ktquhTU4/De8wC3XykBtnKG8bcJKLM8erlKyDtQaN3qCb4iqLxmpjPSwfDAGOCHnjdWL20c4hocjRRQXqYb8ddR5jSwt1vpyVj+C82n0HEDCzfDXq/n3Q=
Received: from YQXPR0101MB0728.CANPRD01.PROD.OUTLOOK.COM (52.132.75.145) by
 YQXPR0101MB1318.CANPRD01.PROD.OUTLOOK.COM (52.132.80.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1207.26; Thu, 11 Oct 2018 12:18:20 +0000
Received: from YQXPR0101MB0728.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::ad39:95c2:bd53:f191]) by YQXPR0101MB0728.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::ad39:95c2:bd53:f191%5]) with mapi id 15.20.1207.029; Thu, 11 Oct 2018
 12:18:20 +0000
From: "Stephen  Bates" <sbates@raithlin.com>
To: Palmer Dabbelt <palmer@sifive.com>, "logang@deltatee.com"
 <logang@deltatee.com>
Subject: Re: [PATCH 5/5] RISC-V: Implement sparsemem
Thread-Topic: [PATCH 5/5] RISC-V: Implement sparsemem
Thread-Index: AQHUXMbU39/0WnhcQk2X8F37YiR5RqUZONSAgABiBwA=
Date: Thu, 11 Oct 2018 12:18:20 +0000
Message-ID: <15C8B877-4BBE-47E1-98D1-945E9355E757@raithlin.com>
References: <20181005161642.2462-6-logang@deltatee.com>
 <mhng-c93e2f59-7121-4964-bd61-3c4c02044cf3@palmer-si-x1c4>
In-Reply-To: <mhng-c93e2f59-7121-4964-bd61-3c4c02044cf3@palmer-si-x1c4>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.12.0.181008
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=sbates@raithlin.com; 
x-originating-ip: [70.65.250.31]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; YQXPR0101MB1318;
 6:h1QnusshWKrLvit23me9Q0/1PuHSZWoS1SoQqGBbLWzBM5P3Psf5JGpO4BWxPGxzdYSAwrn9pM6bBLKFNRq18DRI7XXJHri03MokRLekul2fw0hcAIcpQsQkyEWifWlMr+DJFtXv7K7Dnrz0GXePB89leMzFtJd2WhwNvhQV/jc4Qkjka0WZ2hpofwXcqdwwBsjXAjDR4Z9YMZcymglXY41xkdRODvrti/IB3lBwWQpUMpCuJtBwzavZOENWoLwpNviZL4B7t8BpIZ+lO8UBmmCnuckYM57jGIFenHrH1CSaqgZ7p5EwopYPWf4To3ACfURyNkt8wxzFuoNuULWmUV8HyLK/X9LwGSPrJyLJZW8ABvAjurh93FrHuouXYIhsEXNFqk174/J9Jht4tjOzieVqnVYENnAZaSQmXx73u0V8TBUfR4TGMf47Q7GPFd+gjSSJW7T0JMv+svgXKfJWLw==;
 5:4LHtfOzuhToAdMsKhpu8j7RsgVxaMvU2zzs3/DjxADFc36363MGbyFO4uRAausK9xebWlOvWxEdzbD2aQjErtk6HAg7XDIkddALIECkV/aQatHOYUtqEk8ga6OkfNLXwpWcyCyo0NN7jRENW4WPywsXOMFLgW/Qipv/HENukyx4=;
 7:/ErsjU0EnFYaQLZGWBqnc1kSb6SvKynk9MbRMHG15DCyCmg5oSpKJPPE+d4XYlMpPNScbGUKf3lcmnWz1DPeJKUYWBe8zfiEFb9DSYweaEzbN7qUEuDh9lDyXIkwkYDNl5hzKCLADoAABMdHOmSDJVaX2kvqq3mUtbKdlgteNDLyRjrbbWe5JZJHojpQ38ekOygmFTwnS5JBJGd3qrJzxHG/SfiU9H3q/Icq+IdfZILAvXGTOsHissM3ZGMGzzf+
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 3cf11e0b-e498-4ffa-14fd-08d62f73a21e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600074)(711020)(2017052603328)(7153060)(7193020);
 SRVR:YQXPR0101MB1318; 
x-ms-traffictypediagnostic: YQXPR0101MB1318:
x-microsoft-antispam-prvs: <YQXPR0101MB1318F64CE6684CF4B01FB3D1AAE10@YQXPR0101MB1318.CANPRD01.PROD.OUTLOOK.COM>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(6040522)(2401047)(8121501046)(5005006)(3231355)(944501410)(52105095)(3002001)(93006095)(93001095)(10201501046)(149066)(150057)(6041310)(2016111802025)(20161123560045)(20161123562045)(20161123558120)(20161123564045)(6043046)(201708071742011)(7699051);
 SRVR:YQXPR0101MB1318; BCL:0; PCL:0; RULEID:; SRVR:YQXPR0101MB1318; 
x-forefront-prvs: 08220FA8D6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(39830400003)(136003)(396003)(376002)(346002)(189003)(199004)(3846002)(5660300001)(105586002)(508600001)(106356001)(86362001)(2900100001)(14454004)(53936002)(71190400001)(36756003)(5250100002)(6506007)(71200400001)(99286004)(26005)(6436002)(6486002)(102836004)(83716004)(7736002)(76176011)(186003)(256004)(316002)(6246003)(476003)(2616005)(446003)(11346002)(486006)(6512007)(25786009)(97736004)(82746002)(81156014)(229853002)(305945005)(66066001)(33656002)(7416002)(68736007)(110136005)(8936002)(81166006)(58126008)(4326008)(8676002)(2906002)(2501003)(39060400002)(6116002)(54906003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:YQXPR0101MB1318;
 H:YQXPR0101MB0728.CANPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: raithlin.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: Gvc160EUWV/h5xHGAwEVQacMGIJRiDkYMDtMkcC1PDeS1t5Bl9pkJQxMPhePncYEi9MFZ44fEayMu6T+p4IvHcX/y43xDlITdzHopO6vt6hdnSrY7zsRY6OAYg31z0rYGSv3u/7jR2g+cIw/dvmIARWM15sBuCPHu7wTt0qFNS6Tt/kRHjSio8LyMvYHvWQ9BinCMM+sR3VhbfHKaKVU947TjojBeZHwtctEmlNTxSYWga6LR7GppQ0cY0BEAHGe8qx/LQqVOprlRFUya1FN0wrNv27wjGmHmNEEFWlzRXMZptfHBekezdPCDfgDOX/C1umNj7uIjyTs6rJkJ5ZQ4QbvCuuJzFQI/beCgvlvRSw=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-ID: <352AFE9402187B489B1B52B575A598FD@CANPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: raithlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cf11e0b-e498-4ffa-14fd-08d62f73a21e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2018 12:18:20.5807 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 18519031-7ff4-4cbb-bbcb-c3252d330f4b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQXPR0101MB1318
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181011_051835_321787_4F43F693 
X-CRM114-Status: GOOD (  14.76  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "robh@kernel.org" <robh@kernel.org>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 Andrew Waterman <andrew@sifive.com>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Michael Clark <michaeljclark@mac.com>,
 "zong@andestech.com" <zong@andestech.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Olof Johansson <olof@lixom.net>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "logang@deltatee.com" <logang@deltatee.com>, Christoph Hellwig <hch@lst.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181011121820.jgI-Cm778HwpyIQGSyUdkJb5auomCc2uaDK4pGeWzuo@z>

Palmer

> I don't really know anything about this, but you're welcome to add a
>    
>    Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

Thanks. I think it would be good to get someone who's familiar with linux/mm to take a look.
    
> if you think it'll help.  I'm assuming you're targeting a different tree for 
> the patch set, in which case it's probably best to keep this together with the 
> rest of it.

No I think this series should be pulled by the RISC-V maintainer. The other patches in this series just refactor some code and need to be ACK'ed by their ARCH developers but I suspect the series should be pulled into RISC-V. That said since it does touch other arch should it be pulled by mm? 

BTW note that RISC-V SPARSEMEM support is pretty useful for all manner of things and not just the p2pdma discussed in the cover.
    
> Thanks for porting your stuff to RISC-V!

You bet ;-)

Stephen
    
    

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
