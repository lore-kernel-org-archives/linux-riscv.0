Return-Path: <SRS0=1C2h=O6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD594C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 21 Dec 2018 22:12:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8108F2173C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 21 Dec 2018 22:12:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GnKL5PyH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="aVYOwG3m";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="gSFaqF5b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8108F2173C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WhI6WivkmtXK50EzqUAPA5XV0cMHPoGlZH7cocINKy0=; b=GnKL5PyHEcgQId
	vUYx6BV6mbpoScl35vWY2cBQLoEMYPI+U9HwpnKvDiGz2iLKV5Ay+2CBxfViV4WQqnPyZpmEKuBge
	SavY/mR0W7ci38sNIEqjLUEGrsy7kAnHB4KFF5sOIWKJo2FZ8aDCMYP3Xm1kd3mXbeyYHvQnFRACV
	LriK27XB3GmF0SgtOMtoH6mbW5iKnykUd8lwYhWvKK5+J8sUg6VnDBwGFz3qmoZPdRQDsBDj54byA
	cQwQqtMBChRc1x63x8GV/yzl7IvN3bOhcrOyJ/NiuOnlH9vyBcOv3eov0byisxOgXbJZj6TiBH7l6
	Sm0oybOV7IE5qE2r8UDg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gaT1h-0002za-9v; Fri, 21 Dec 2018 22:12:13 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gaT1e-0002ym-6h
 for linux-riscv@lists.infradead.org; Fri, 21 Dec 2018 22:12:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1545430330; x=1576966330;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ljM+yKwkmMlDGQuZDLZ1gGR+3IE0pLFGBFEdz+jxidI=;
 b=aVYOwG3mrNV0oHm0GkycO5pbY7zFQ16ntwdUEugZ4qK58ESEYbiwI1o5
 xiIP6/8wCnG9T7WkiCmz7oB6/l5BgW+V3FAAdirfISVH/4uhcoSfOUqDk
 JlScCD47ogLcErTrNFBw/7rGT9vQNe3NvqblC0g9/tUarqMzutJ2+dX3I
 gRIKct2FBkYFMhH1+vygKi5COII8Zm9p1jHleafMeTHVsSWQvhWQeI75r
 3/lGfyvFn2PSgDYVTxpiaiLnesbaoGpl7+OlU7WJczQdw/nQ2/Kyq+xt3
 Yre4p6/b2UUswFE3W8w5LQ3qbsvx7DXiXzMuFxb9N/CrJyIMAxxLkWGdC Q==;
X-IronPort-AV: E=Sophos;i="5.56,383,1539619200"; d="scan'208";a="201952907"
Received: from mail-sn1nam04lp2051.outbound.protection.outlook.com (HELO
 NAM04-SN1-obe.outbound.protection.outlook.com) ([104.47.44.51])
 by ob1.hgst.iphmx.com with ESMTP; 22 Dec 2018 06:11:57 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ljM+yKwkmMlDGQuZDLZ1gGR+3IE0pLFGBFEdz+jxidI=;
 b=gSFaqF5bIVg5oP0QtR8m3era53gWOekHPtsAR6M985g0PO0oh/45tFaNAaeL0GcdvL4z5K+oG99YINgPin1TXg1gROv+Ay2qqgKxPokk2FsXyf0WQMiolManW6tvmk1HDGIGcYTkAu96+Ae0MJpgUZa14WnGe3+uWy9Tjlp5YdE=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
 MWHPR04MB0287.namprd04.prod.outlook.com (10.169.202.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1446.18; Fri, 21 Dec 2018 22:11:54 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
 ([fe80::9067:fb44:66b2:7604]) by MWHPR04MB0401.namprd04.prod.outlook.com
 ([fe80::9067:fb44:66b2:7604%4]) with mapi id 15.20.1446.022; Fri, 21 Dec 2018
 22:11:54 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>
Subject: Re: [PATCH] RISC-V: defconfig: Enable Generic PCIE by default
Thread-Topic: [PATCH] RISC-V: defconfig: Enable Generic PCIE by default
Thread-Index: AQHUmWBEawqGhX/hUk+WG09gQflaXKWJj9CAgAACgwCAAAFkgIAALeOA
Date: Fri, 21 Dec 2018 22:11:54 +0000
Message-ID: <c51c125f40a12a3afdd8272bbbf0670673a15349.camel@wdc.com>
References: <20181221190615.19003-1-alistair.francis@wdc.com>
 <alpine.DEB.2.21.9999.1812211110260.777@viisi.sifive.com>
 <541e8b85bc2d3010741daadddc71ada52b847b8f.camel@wdc.com>
 <alpine.DEB.2.21.9999.1812211124180.777@viisi.sifive.com>
In-Reply-To: <alpine.DEB.2.21.9999.1812211124180.777@viisi.sifive.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Alistair.Francis@wdc.com; 
x-originating-ip: [199.255.44.171]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0287;
 6:SWKbTU5+h8OUKEIXPMz0z7kxwu7gOScvrCo3KusifPSKDf3tQzn/oJzjYYX2HMiSjwBGUGJd2YyHHzS8emuD87jLifd9DkacMZ8tmSADoOZjG2M++H8E+UCBEmFm2MQ/ltuBET54M5mo20VnvtS2zGW3w5FSQAQueJiJ0f1b91wabY+Z9oiadaUbuthx4OSuJgU2Z8G6fWF5hR0HB4VtaWps/RhkDTFzdBzYcWcbbqsTOyqF0YkhZOedn6LTU80yMedr2T9ZFaLeJ5J5gVpEa2KKWfE5dprd6MZLR3jKJ/r3H0bxnZZ33LokTddF6VaynwOx2lAHrIIAjMmlAMhT1kbmhR7xSOCn8t340y3snJk2RlamyPSNzsMpXmp7YCMn5Lktj1yqL1RL0Sr4gIJUCtp4YJEdZfHIdCkag14GUXdRjiX9qjjzGX6wDDRn9ywYiXE8Zxm5YtZdwHQSOgIGbg==;
 5:I5V8BK+9G9Nsc0RPlrBgyn9BomwokdqZ4X3iYuIE3Am7WTjENls5+pSbotn4m4FI9TKMEpPHUQgi62ByVwMxgZ8lbknUZn2UUHAqiM82MZVdsxuoH/TcxSTkZk8tSZ1sfl4qKkE14DmV8jm+R+vdLJygzBid76CLwpSfEzv8dpA=;
 7:puKwup3isEQ4+/WJUii1Z3nafoF1pzl35YKAbhnYjox8+JGG/w+j/vXXBg2cvTGNcrtKhmgCT86C4+eRhcXLzNMULU8nOsEbNqEdPkboGORAyzfiDsTsqwXwk2SqlIea/BMBf5F0ubm+SgEReyeahg==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: db0ad81f-9f14-43ce-ec30-08d6679150e6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR04MB0287; 
x-ms-traffictypediagnostic: MWHPR04MB0287:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB028770E3C46324EFB2EDE9F290B80@MWHPR04MB0287.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(3230021)(999002)(5005026)(6040522)(2401047)(8121501046)(10201501046)(3231475)(944501520)(52105112)(3002001)(93006095)(93001095)(6055026)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123562045)(20161123558120)(20161123560045)(201708071742011)(7699051)(76991095);
 SRVR:MWHPR04MB0287; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0287; 
x-forefront-prvs: 0893636978
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(366004)(376002)(136003)(346002)(396003)(189003)(199004)(25786009)(256004)(86362001)(229853002)(6512007)(8936002)(71190400001)(7736002)(71200400001)(8676002)(81156014)(2501003)(97736004)(4001150100001)(6916009)(6486002)(4326008)(53936002)(6246003)(5660300001)(105586002)(81166006)(106356001)(5640700003)(68736007)(2351001)(99286004)(118296001)(3846002)(6116002)(2906002)(6436002)(305945005)(66066001)(14454004)(36756003)(446003)(93886005)(11346002)(6506007)(76176011)(486006)(2616005)(476003)(26005)(186003)(72206003)(102836004)(54906003)(316002)(478600001)(41533002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0287;
 H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: YJ0TTBmn8LbodERkYVdCcmDJlSyDQ7TTvXdmJ434QWH3nvJR1aWXDWQxX56C7KLNuEQUcY4+6z7Q+9elVrkQyB4FYQaw+sUJYRGsdXSv70ygJ2zZ6fH2wjn8RVG/bHeqMdlAv5BGw3XotgDzGBMBRGitet2XgTTfpBAiW+anRdcktYXZ9bBZ+JViIkGkglRJd9Q+ss1vnrNRq+bXVrGXGj7s+55XvO/L8A3RFvpU1yyMVcKyP5hACym0huKVCTqSIv2xzVDKUEtBgjBTCB0ah9zN9PoUhfpmynNZ1rJQIeByE4N/pbeel95Qo/mvuw6G
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-ID: <718EA65B5C257F44816E37EAD5E68318@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db0ad81f-9f14-43ce-ec30-08d6679150e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2018 22:11:54.3502 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0287
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181221_141210_441755_F8851DEE 
X-CRM114-Status: GOOD (  19.42  )
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
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "palmer@sifive.com" <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 2018-12-21 at 11:27 -0800, Paul Walmsley wrote:
> On Fri, 21 Dec 2018, Alistair Francis wrote:
> 
> > When the MicroSemi driver does eventually go upstream this will
> > probably have to be discussed though as either the config or device
> > tree will need to be edited to ensure only one PCIe device is
> > present.
> 
> The right way to do that is to have two separate DT files: one for
> the 
> HiFive-U board alone; the other for the HiFive-U plus the expansion
> board 
> combo.  There shouldn't be any problems with keeping both drivers
> enabled 
> in the defconfig.

Agreed, the only problem is that the device tree comes from the boards
firmware at the moment.

Alistair

> 
> 
> - Paul
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
