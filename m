Return-Path: <SRS0=1C2h=O6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 592AAC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 21 Dec 2018 23:03:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A820218D9
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 21 Dec 2018 23:03:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G4ov/wh9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="lC3sxOi2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="bts3sYoE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A820218D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E1ryYD9AiIc2A/FdVhnOabu8Y+YWZbXTDWGJh2Qdvac=; b=G4ov/wh9QKQ7yM
	WYxDnz/IQ6Gh0EL7+8/sN7eQN0Uu07B11349DvY2czeHUeu0Z+0rETmLQY4RgRVjTc8T8AeN21kxl
	813j2eb4akuRgEqRePSfcx9bwO93ySxFvy6RnXcqXhdMfNnilQfraSEXFgPBPZWIhJUewZ9gbXeJ8
	v4Q8IBz4nGfku1N/c5SAg13gpGEMqK7rN8xic+a4ULDGCc8xG+RYnZvH1/BMCMYjFsTsaDj1YeP7o
	4TknIpWwOhdxuEcrnRSGzDLXw1+Hb4jD+e+9eM+WNiMS6uIVr6vsHTx0RGuLoXKIhAyLkjhFzOtkN
	4cmN5h9sTOuwYBiezpIQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gaTpU-0000qD-02; Fri, 21 Dec 2018 23:03:40 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gaTpR-0000pI-Jh
 for linux-riscv@lists.infradead.org; Fri, 21 Dec 2018 23:03:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1545433418; x=1576969418;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=L4GaNSiAqepeWAiidtuIP/AMYmLx0NbaCw2C3NLRUis=;
 b=lC3sxOi2KuzKbwMWoIQnJVA74+N63V9SxuICVOMsqVUFShwG+gmd+oRc
 OBblQ3iPo+5uFyYQ3gBv3/CGcIZ8V+9YlxSh/sdr5bvwNQY8XMOI9CAve
 FHgHQoA79rYL/w3rdnOLjCKw8JlXRIfbg2ZOCSmgelyIOq2mtbZqWiSMY
 V7NiQUoIc8NMbe4YUk99fPAxF9eyBf9ENQj0d3weuOz/sgxasGZt6zxSW
 8VcMFRi0GDr+tqLknG9WKb2LZtHmoqHbVQNqjjRDnO+9kvDsSTWaMy6y1
 k8qbPPof6Jk5eQZM0OFgt4mv6C/TNukEUFhqMg19LdqCgXurU/nwELwOk Q==;
X-IronPort-AV: E=Sophos;i="5.56,383,1539619200"; d="scan'208";a="97212977"
Received: from mail-by2nam05lp2051.outbound.protection.outlook.com (HELO
 NAM05-BY2-obe.outbound.protection.outlook.com) ([104.47.50.51])
 by ob1.hgst.iphmx.com with ESMTP; 22 Dec 2018 07:03:24 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L4GaNSiAqepeWAiidtuIP/AMYmLx0NbaCw2C3NLRUis=;
 b=bts3sYoEBtCC/KSHzp8LYAkq7C8Y/q2+8MccTpuq6YS8PujkCYeJOh3omurOVY7IeBOMqlQ0MOG8lF44ugYH8+HeotqiMtzARQn3phlGZYYfkBdceu7Y3uAJiPvUoZYejYkDqy91cuJiqdI1VJBPK+JbLurcFee0z2IyMADhVTA=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
 MWHPR04MB1086.namprd04.prod.outlook.com (10.174.250.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1446.23; Fri, 21 Dec 2018 23:03:22 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
 ([fe80::9067:fb44:66b2:7604]) by MWHPR04MB0401.namprd04.prod.outlook.com
 ([fe80::9067:fb44:66b2:7604%4]) with mapi id 15.20.1446.022; Fri, 21 Dec 2018
 23:03:21 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>
Subject: Re: [PATCH] RISC-V: defconfig: Enable Generic PCIE by default
Thread-Topic: [PATCH] RISC-V: defconfig: Enable Generic PCIE by default
Thread-Index: AQHUmWBEawqGhX/hUk+WG09gQflaXKWJj9CAgAACgwCAAAFkgIAALeOAgAAGQICAAAggAA==
Date: Fri, 21 Dec 2018 23:03:21 +0000
Message-ID: <ac8f991f5c3e0b5de8dea6b187e1daca198b4677.camel@wdc.com>
References: <20181221190615.19003-1-alistair.francis@wdc.com>
 <alpine.DEB.2.21.9999.1812211110260.777@viisi.sifive.com>
 <541e8b85bc2d3010741daadddc71ada52b847b8f.camel@wdc.com>
 <alpine.DEB.2.21.9999.1812211124180.777@viisi.sifive.com>
 <c51c125f40a12a3afdd8272bbbf0670673a15349.camel@wdc.com>
 <alpine.DEB.2.21.9999.1812211433290.777@viisi.sifive.com>
In-Reply-To: <alpine.DEB.2.21.9999.1812211433290.777@viisi.sifive.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Alistair.Francis@wdc.com; 
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB1086;
 6:TSQvRCbpJd1DRhwbL2sMlpMNJhV+3lGIYxCw4/TCPzlQO4om+BpOT/qaZQeSI12TOB66bVpHu7xD89XhxwvZ29tn9teyPdCedigY2A2beXjk9Ak0U2ARlPh1HP3GOfVCVnOOk5L5xAVywqrhG0wd1OLZbPWD/W/DWzSvYMUnulb3ViHaPMoPPqgCpdl/5VNSuYiXBMu7n2jKclH5BSitRiDtPKy45OTXGLL+OkCIEuKENkU3x90hY0tBmqLEkWw5lums3D64emVn+2lCm+STOQX8jTgwzJZL72t5FCa5sqt7UKA6jwNeva7OeCdR1q1ynOPfZdj2YoOXJjbURbMMl4AkguR2a4qn5A04Vbyo7YWsiLRmjenTm1B+c2gxWCO5HdTZaiMnNsYmj2vrWkhX6dw4NMUFSlgrrMSgL2uJ+beKOMR9mSq0+qXtNszzS0W5QMp1awQ9RSt95VFZ/UrESQ==;
 5:lwF43SfwLCn2EsWZSX/VTz2MFF3Z/89o03UYILSw7T/7q8PRJlZY6t4udJokORLGX+88l6YhaKb/C20KLNNho7jN6i3kGzZ66Ji+m0Pjw0jGol5fSjvdDk9xgczqwiPRk/G9ZS6PVtRhZMVsA2k1GLGBQcHSM4mshTP7dlAnTt8=;
 7:4ND4RZIEy3a388JmJepF9S208Hh8kcn0cM0NIZQIKQR1B8WMzDKdFhthHdYQS2xyyGa4+zka8QJYhAV8gGq9Ib//OIQpCbfx4kVBUu1Ha8i9uQwEXIJkMneF1TnevqXgebOkWhyeDw4tntc0ql0eWw==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 0d880e5f-2fd8-4efd-e30d-08d667988132
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR04MB1086; 
x-ms-traffictypediagnostic: MWHPR04MB1086:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB1086D959058A589AE21E28A090B80@MWHPR04MB1086.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(3230021)(999002)(5005026)(6040522)(2401047)(8121501046)(3002001)(10201501046)(93006095)(93001095)(3231475)(944501520)(52105112)(6055026)(149066)(150057)(6041310)(20161123558120)(20161123564045)(20161123562045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
 SRVR:MWHPR04MB1086; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB1086; 
x-forefront-prvs: 0893636978
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(136003)(39860400002)(376002)(366004)(396003)(199004)(189003)(6306002)(6512007)(476003)(446003)(2616005)(36756003)(4001150100001)(106356001)(11346002)(99286004)(68736007)(105586002)(97736004)(5640700003)(4326008)(102836004)(6916009)(26005)(93886005)(2351001)(186003)(54906003)(316002)(25786009)(6486002)(229853002)(7736002)(8676002)(305945005)(256004)(2906002)(72206003)(6436002)(5660300001)(966005)(66066001)(14454004)(86362001)(76176011)(6246003)(6506007)(71190400001)(71200400001)(6116002)(478600001)(2501003)(53936002)(118296001)(81156014)(486006)(8936002)(3846002)(81166006)(41533002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB1086;
 H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-microsoft-antispam-message-info: u4AtUuaHBF2spM3ueksxKNCsv0Pwnl1MC87uzgJ3aYjo/JAs61GIvIcnBbFymiqN1UKGTajdM/P5cECJ7oL4um371kJRzkINTl64/rFHn9rrxeGhHVCysq1mJI85SuGgR9ymoOlUeYyfDva0Ttn4kTk7r8wKJ5SyYnK/TCxq9yyHPrAMLTu9s7DsJBhJhJUCCLQP65lNe5eXPc6mmtvhMPJ2vEgvWiOYCT0MZsYht4Oz+8WxSO1OeyCNeuJPSTv9DfCQxCtBlFuoNRN9WasJ9drVUnVax0rQcCwrbbj/yFcTckQm38KQZWSelDHHaa0I
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-ID: <877AA9BEA49D204EA179EFED18063BFD@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d880e5f-2fd8-4efd-e30d-08d667988132
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2018 23:03:21.8658 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB1086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181221_150337_691656_61835F95 
X-CRM114-Status: GOOD (  21.76  )
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

On Fri, 2018-12-21 at 14:34 -0800, Paul Walmsley wrote:
> 
> On Fri, 21 Dec 2018, Alistair Francis wrote:
> 
> > On Fri, 2018-12-21 at 11:27 -0800, Paul Walmsley wrote:
> > > On Fri, 21 Dec 2018, Alistair Francis wrote:
> > > 
> > > > When the MicroSemi driver does eventually go upstream this will
> > > > probably have to be discussed though as either the config or
> > > > device
> > > > tree will need to be edited to ensure only one PCIe device is
> > > > present.
> > > 
> > > The right way to do that is to have two separate DT files: one
> > > for the 
> > > HiFive-U board alone; the other for the HiFive-U plus the
> > > expansion 
> > > board combo.  There shouldn't be any problems with keeping both 
> > > drivers enabled in the defconfig.
> > 
> > Agreed, the only problem is that the device tree comes from the
> > boards
> > firmware at the moment.
> 
> The switchover is in progress:
> 
> https://lore.kernel.org/linux-riscv/41dac7a1-3f66-6a3f-8a68-206688e5bd9e@sifive.com/T/#t

Great! I didn't know it was in progress.

Alistair

> 
> 
> - Paul
> 
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
