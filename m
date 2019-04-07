Return-Path: <SRS0=ACrE=SJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89CC0C10F0E
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  7 Apr 2019 07:36:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E63221738
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  7 Apr 2019 07:36:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m7FElzu7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="ffQ1Kg4l";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="g0AvTar5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E63221738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4pnsJNpVf1rUdvbaNQaopx/i7Nc1dF4j9HrF5DJfwH0=; b=m7FElzu7BHnB3M
	43Y9mW/i+WpuH4Du+rLKgZ4xmJJ4FC07ErHiIJonsh5gJQFjAnbBXXXKoSlL6cH+ktsGZa5pnY4Oa
	xsvrgW3n6mRSENB12KBe5e6nnTlNM8c9LL7dtCZNIbUUhoIV+r/iCyvho6lW7O6WIGHkDZeQ8kDAV
	TwWBsMl/EInWhZI8kGFfP7wolg+ZhC6ZNLJNmZlmczGhmzbozZpKY2aGen8kWVmKpG3mmnkB77Y+y
	QvEbDoHGch5vicNeiP5CLeFy1/NeGjVKhTBm3LOhY9CzVtA+KGlYiuelQNPlBKN0h3tNHuBDdJdoR
	8qHnmLccmvIL+SdNVtdQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hD2M1-00015U-LI; Sun, 07 Apr 2019 07:36:37 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hD2Lx-00014S-Rx
 for linux-riscv@lists.infradead.org; Sun, 07 Apr 2019 07:36:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1554622593; x=1586158593;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=hf+7XgvMIgFp96vaIgIBOOUSsweGiw2Y6fv8zahrGXw=;
 b=ffQ1Kg4ledSnrc7nAxRkPkWFOOmDsdIwwdMV/YtaiV01Dfdfv/4DWdQI
 8SVRSjpa0bO0y0xBG5bwl//z3OCCxseBb2OLoRdczEk92Gbzd/bZu/0ew
 Om4U39NpidZ4sYiYZmv0ljIBe4iW/iu+Rmt8VYb3ZZKC3HBcgeciXsADq
 Ox4B3LSoYS/NWZVy8qd8CQ/pMgHVw38FAIVR5yYZ7mOBVF2E45mGbozYR
 yuDrbbia4vcIUW+Zfi3XukFaMuegpvAgftKlcraC73mhMrBmwQwpgi6O5
 rFnIaqpyZYU+ubiLlAb9PZh/di44QRErAdEKEmJTG45C1Ak9LsLlxUBoU Q==;
X-IronPort-AV: E=Sophos;i="5.60,320,1549900800"; d="scan'208";a="210952897"
Received: from mail-bn3nam01lp2054.outbound.protection.outlook.com (HELO
 NAM01-BN3-obe.outbound.protection.outlook.com) ([104.47.33.54])
 by ob1.hgst.iphmx.com with ESMTP; 07 Apr 2019 15:36:24 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hf+7XgvMIgFp96vaIgIBOOUSsweGiw2Y6fv8zahrGXw=;
 b=g0AvTar541q2LgzoPusXf0Hw262FsQ4NYVre8JM1bMQQvlQiJsOED6Vz4uTtoRyegT6HebAcZpRzKOePbTdM3kN3ep6FvMeACratOhQPRoChBiFb0sYTuI1OFfKRz5nUteBx3n0hlnLUEVwS2B66WB1cW78dyTKm2WRwkep4nq0=
Received: from MN2PR04MB5967.namprd04.prod.outlook.com (20.178.246.143) by
 MN2PR04MB6031.namprd04.prod.outlook.com (20.178.246.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1771.13; Sun, 7 Apr 2019 07:36:22 +0000
Received: from MN2PR04MB5967.namprd04.prod.outlook.com
 ([fe80::a97e:3013:d700:6b95]) by MN2PR04MB5967.namprd04.prod.outlook.com
 ([fe80::a97e:3013:d700:6b95%4]) with mapi id 15.20.1771.016; Sun, 7 Apr 2019
 07:36:22 +0000
From: Christoph Hellwig <Christoph.Hellwig@wdc.com>
To: "sw-dev@groups.riscv.org" <sw-dev@groups.riscv.org>, "palmer@sifive.com"
 <palmer@sifive.com>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, "hw-dev@groups.riscv.org"
 <hw-dev@groups.riscv.org>, "isa-dev@groups.riscv.org"
 <isa-dev@groups.riscv.org>
Subject: Re: [isa-dev] Re: UNIX-Class Platform Specification Working Group
Thread-Topic: [isa-dev] Re: UNIX-Class Platform Specification Working Group
Thread-Index: AQHU68ZmH8q9z/4Xo0+gypQutt4l4aYwUY6A
Date: Sun, 7 Apr 2019 07:36:22 +0000
Message-ID: <c1ea959e9114929b72f5b3d687e70429a3737d25.camel@wdc.com>
References: <mhng-99966160-5466-4cfc-b3d8-48ad48d3dc74@palmer-si-x1c4>
 <CANs6eMn4+6XGaSOGyWoD5RK2DjQo2SUUHphqmL_dwQD-Xu-omQ@mail.gmail.com>
In-Reply-To: <CANs6eMn4+6XGaSOGyWoD5RK2DjQo2SUUHphqmL_dwQD-Xu-omQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Christoph.Hellwig@wdc.com; 
x-originating-ip: [89.144.214.194]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 68c79b34-ed83-48f1-4bb5-08d6bb2bbbd1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600139)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR04MB6031; 
x-ms-traffictypediagnostic: MN2PR04MB6031:
x-ms-exchange-purlcount: 1
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MN2PR04MB603111A92ED29629E10C8493FF530@MN2PR04MB6031.namprd04.prod.outlook.com>
x-forefront-prvs: 00003DBFE7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(346002)(39860400002)(396003)(136003)(366004)(189003)(199004)(2201001)(118296001)(486006)(476003)(2616005)(5660300002)(186003)(11346002)(6506007)(14454004)(72206003)(102836004)(53546011)(26005)(99286004)(76176011)(446003)(256004)(86362001)(478600001)(106356001)(105586002)(66066001)(7736002)(68736007)(110136005)(36756003)(6436002)(2906002)(229853002)(97736004)(71200400001)(316002)(6512007)(2501003)(966005)(6116002)(71190400001)(53936002)(3846002)(4326008)(8936002)(81156014)(8676002)(6486002)(6246003)(81166006)(25786009)(6306002)(305945005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR04MB6031;
 H:MN2PR04MB5967.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hDFmza+CpjcWKxM4FKPconvJR/w2dN/Jvnoxo0jgJdubLJm8y0H2mTROTUWt4f1p9b+UCuqk30ZrqiZ9sYnJbcoaJU/yjYCMfbcVlzhGG5mhweG6rtvBwu4mf2SDMrs8vNIja2XLfuCdLgQXicbc2BGP/pb7GX0BFXI5mrFSI7NLhI6KjcV/djDCFBpU0Qskuln+OdoQje7Z8eu5u03q29nZXs7N0rL7c2/QheEvem5b/niZ/4xwhcAAgIyfh57AClWKgl5ak/7gcKCscrxFSqoUqnL7+qTDMx7UzqVvdqMKvYf7nyTyQOAl3GkIhsJfRfqwDA2k9eeJinOa+ieo/YxVAWNPaeUJQ2or7hQWKlW+mMhwhA4M7vX/IRkDRNq8PhK6zszf+J3d5lHJZP4eZSHzGhg4mBTAx/rAoPIfgoI=
Content-ID: <8E43E388C53B0E4C986D684F60FC52B0@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68c79b34-ed83-48f1-4bb5-08d6bb2bbbd1
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2019 07:36:22.4474 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190407_003634_096398_10D32132 
X-CRM114-Status: GOOD (  24.63  )
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
Cc: Atish Patra <Atish.Patra@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 2019-04-05 at 08:43 -0700, Palmer Dabbelt wrote:
> Sorry for the delay, but it appears we now have a mailing list set
> up!  I managed to announce the group right in the middle of the
> workspace -> groups.io transition, which means we're the first group
> to try out the new infrastructure.  As a result there may be some
> wrinkles, but at least a handful of us can get into the group so with
> any luck it'll work for anyone else.
> 
> You should be able to join here: 
> https://lists.risc-v.org/g/tech-unixplatformspec/topics .  Just like
> the other RISC-V specs, you'll need to be a member of the RISC-V
> foundation to contribute to the platform specification -- sorry if
> there was some confusion in my original email.

So in the past the way to join was through workspace.riscv.org - but
login in there just returns an internal server error.  Has lists.risc-
v.org replaced the above infrastructure or is it in addition?

> 
> On Tue, Apr 2, 2019 at 9:50 AM Palmer Dabbelt <palmer@sifive.com>
> wrote:
> > Atish and I have approval from the RISC-V technical committee and
> > board to 
> > start a group to manage the UNIX-class platform specification. 
> > This working 
> > group will start by defining a subset of this platform
> > specification that both 
> > allows compatibility with existing implementations and
> > extensibility for the 
> > future needs.  The contents of this first platform specification
> > will include:
> > 
> > * A versioning scheme for future versions of the UNIX-class
> > platform 
> >   specification.
> > * A specification for a platform-level interrupt controller that is
> > compatible 
> >   with existing implementations of SiFive's PLIC.
> > * A specification for a standard SBI that is compatible with the
> > current 
> >   implementation in Linux as well being extensible for future
> > needs.
> > * An SBI extension for CPU power management.
> > * A specification of the interface between a bootloader and
> > supervisor-mode 
> >   software.
> > 
> > Since this working group mostly consists of standardizing existing 
> > implementations, I hope it can progress quickly.  As such, I'd like
> > to set a 
> > 6-month deadline between when the working group is started (ie,
> > today) and when 
> > a specification enters the 45-day review period.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
