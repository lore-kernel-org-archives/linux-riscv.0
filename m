Return-Path: <SRS0=7ZJm=QU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C247C282C2
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 06:05:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BF48222BE
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 06:05:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oqrpMAut";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="WTMpYHSi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="knJ5QkZC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BF48222BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aiSxjerRg4fE32MWDannu0nuIXRVaCcUuM6f3la2JNE=; b=oqrpMAutCWvQs8
	rGreCzNtCqvDv0jSfGsyvEvftwSEM81CKy9XYVyGCrahRBP7EFynNN/L5wFNHYecfpZ+yF0P60aWa
	NJ/bnl+uYG3sB3tIkgj2fRI11P9JEv2KEhtx3QJ1rzoSdb0UW62ukBtH8WPfZbbKxj4qLoRcheU+j
	Pu/iFP+9KoMr0a28PrncSt42Og1ESdVZNB4uOFjCiH9Mj/Gsxb1SvrIafIGHGG2/YUjgs9iMxigLI
	sTa8PNzGqFGVPaBqanFy5VLCRit3x1R4KRhR7DYN9ynHkXSmGU/epe8e16YewnH7cIYJptFsOCxed
	sDeSMn3ygS6b6NIRfsgA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtnfk-0006ZR-KP; Wed, 13 Feb 2019 06:05:28 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtnfh-0006Yy-LF
 for linux-riscv@lists.infradead.org; Wed, 13 Feb 2019 06:05:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1550037926; x=1581573926;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=npIJGtEiK/Peu2iEODFrEI6r0AVh3bRqe0c1MRU6V+0=;
 b=WTMpYHSi3TNtLCsYxBH9LJU+mFgkrsgj39qoWOhJ0LajRzYD+ZT2mIGg
 +HFPHs8nuYUAvtYUASaQ4/koEJRoh9VzJmfgLeJuh5/ardWuTaMovHhip
 XSnD42nPzEJDKqPfBtjI1ngwwaJRW3WUteN3ATrbrHR2DySDr4VJupD/b
 rJO06l+WVAoNJE1pwwuLSpGpgnFO2aqGsR5hLKg4AW8NXyUrDPT1P20JB
 SJk/S+WIk5NlEbVQmifuQAnS4pip/M31d/Kg2Piq4lTn06waO05msTysh
 Yol1a2Tpf3nqvm2cJap9TPUKVF1p0Qe+t9CRvqM1Iq+Ubpf9GyThOdjLr w==;
X-IronPort-AV: E=Sophos;i="5.58,364,1544457600"; d="scan'208";a="106095354"
Received: from mail-dm3nam03lp2055.outbound.protection.outlook.com (HELO
 NAM03-DM3-obe.outbound.protection.outlook.com) ([104.47.41.55])
 by ob1.hgst.iphmx.com with ESMTP; 13 Feb 2019 14:05:22 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=npIJGtEiK/Peu2iEODFrEI6r0AVh3bRqe0c1MRU6V+0=;
 b=knJ5QkZCUVxiUAt0FC2pRuVPr6WwJEoYz0zo22ejtpot+9LgrPnTYukIH1xqyyn5+dlb9+oR0sF7ujWEATxNPKrG4o20s2BlryrSE+9TnRWnuf/ktvODfF+7MeOuoHOY4r8JyMbTlqircY6CDFj0nUWyBBdSyC6myduORuRRbJE=
Received: from MN2PR04MB6061.namprd04.prod.outlook.com (20.178.247.148) by
 MN2PR04MB5503.namprd04.prod.outlook.com (20.178.245.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1601.21; Wed, 13 Feb 2019 06:05:19 +0000
Received: from MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::2cdb:c465:af57:8be1]) by MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::2cdb:c465:af57:8be1%7]) with mapi id 15.20.1601.023; Wed, 13 Feb 2019
 06:05:19 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: RE: [PATCH v2 6/6] RISC-V: Implement keepinitrd kernel parameter
Thread-Topic: [PATCH v2 6/6] RISC-V: Implement keepinitrd kernel parameter
Thread-Index: AQHUr/rvNlD18fFOHEuGvgVx64rC4aXb43KAgAA2jICAAIwvgIAAlc7ggAAlagCAAAKk4A==
Date: Wed, 13 Feb 2019 06:05:19 +0000
Message-ID: <MN2PR04MB606129EF849F6AD914047D388D660@MN2PR04MB6061.namprd04.prod.outlook.com>
References: <20190119132650.9978-1-anup.patel@wdc.com>
 <20190119132650.9978-7-anup.patel@wdc.com>
 <20190212070807.GD26747@infradead.org>
 <CAAhSdy1NED22YyYrAJDqPkDqT1c2ms2QC9OjHP0qLwHT+o2zvg@mail.gmail.com>
 <20190212184505.GA10984@infradead.org>
 <MN2PR04MB60615E8737B56B1B213B5FA58D660@MN2PR04MB6061.namprd04.prod.outlook.com>
 <20190213055510.GA5725@infradead.org>
In-Reply-To: <20190213055510.GA5725@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.179.161]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: afb1f3e4-ac55-4a9f-f4bc-08d691793b7a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600110)(711020)(4605077)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:MN2PR04MB5503; 
x-ms-traffictypediagnostic: MN2PR04MB5503:
x-ms-exchange-purlcount: 1
wdcipoutbound: EOP-TRUE
x-microsoft-exchange-diagnostics: =?us-ascii?Q?1; MN2PR04MB5503;
 23:PZSPPPCRua7VQL/fVNyf4xcqem4syrWa3GPOX88V5?=
 =?us-ascii?Q?Jf6bhYhFRXsqpojil03iipbD9n3WoadIxZLfn12VSXDsLnNK3xYW7ef2lDlD?=
 =?us-ascii?Q?RRpk4MaPzkKrjy6FWRTFI4o+cFTICLQYDskact/ceX4QAmsxTZuXPtioitVP?=
 =?us-ascii?Q?Y2/J5sAb5XsoBUsI/M0wyyr4wVqzAgeYVIOLTJMe451KFRU3sAAJ+whJtnSJ?=
 =?us-ascii?Q?2GEX4jJWuoOd/I+3j+1ROZ5hR50ONq+uTWrrI7TJdkNWOVAthwxaEHNeuhJn?=
 =?us-ascii?Q?qhagANooq/7RFmFMVCU8qN93+aiP0nxtKeImn4vtdKMIvzKOJxq8Q+GrVAj8?=
 =?us-ascii?Q?znO9czXn5ojbmQbxv6MQb9bHUOpUYHyeQuUfhnY/hnLenTdAEzZOMTrBhs7q?=
 =?us-ascii?Q?1GyqD7zNMVzTYIP4Q0LktgScc3LiU/oddgUQ3QhUF0dGtXnpG2uBrQ2MLh2+?=
 =?us-ascii?Q?CDxeYzMkKKvzdY5DUZF7vhjkqKliOLEvgg9PO1ktdU7HgHKadKD/erQ6uFvl?=
 =?us-ascii?Q?/5MX8homgBihguuhtzcMpJ662nnkrvUrLuhMVCSXoYmKbb09Hn2981cZ6SjM?=
 =?us-ascii?Q?UDIGZ0zde7f2NkKlzcG+RaDjuGQ0S48/qNM+nAMAE+yQhGUPP1keU4/gmnzs?=
 =?us-ascii?Q?4X2/8HZ3U2EqefkSUC3/61DB1/bpurUy1K5jfb5TqGLtr8Oc/LatNyRGpsvm?=
 =?us-ascii?Q?sPWP0NMUsSQ5TeGm62j/PlDtY8cDxcFUg1Nwoy9CPR0/sg5De3/+uzxCizQ/?=
 =?us-ascii?Q?3KnWrxUB+jEKbIa+eSrH1FUPBkAEqV7IpwC758k0Y4HDd50oP+4v65xt03Ww?=
 =?us-ascii?Q?9ppegJkb4eL492upeV6kjBVr3j/WFfgL5yMzCD4NpeRkoMoTNiAcnShSCvvy?=
 =?us-ascii?Q?I7/g/86P2cpXn+16nXgDbX6NfvxvhGqg/gP8q8mrtJn4jtr46tw4LHGFsD0J?=
 =?us-ascii?Q?hL76DZRTV5oa+o7KKlHuTnXcgi3c4uI55RfxsH404R1rK5gdL1zzO1oVs/QB?=
 =?us-ascii?Q?+fTNRY7RotslLegK1NfD4ZC2mZ20k80paq+ftldy7MZIheF1NV2Zu7omaMJw?=
 =?us-ascii?Q?kC2rEMGeCrXOqAUEvh5aGswVmWE5P8EwXzC1a8JTZ79YwWbirWmF4zowZjf8?=
 =?us-ascii?Q?nYBmpyluHqqTr+WNtNy5xl1K02IuQSWQTIqMCcPWD0ihYB+E/AyKNOFpKsNk?=
 =?us-ascii?Q?DfAuMzuIPLB0OvuHi7tkX8eYO7zJkm/An50sFuVBXYXZA6o0904ipv4ff0+D?=
 =?us-ascii?Q?uqcYMA1H6lHcTRNqLixT4fiORS08c6xuz592SBvaK+BTgGWWHKlB7EJgUnEF?=
 =?us-ascii?Q?xTJktRqpGZ+XqHwFi//S3o=3D?=
x-microsoft-antispam-prvs: <MN2PR04MB55030AA46EBB838F2050DE238D660@MN2PR04MB5503.namprd04.prod.outlook.com>
x-forefront-prvs: 094700CA91
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(39860400002)(136003)(396003)(376002)(346002)(199004)(13464003)(189003)(99286004)(76176011)(33656002)(8676002)(7696005)(6436002)(71200400001)(71190400001)(54906003)(93886005)(81166006)(305945005)(478600001)(25786009)(81156014)(66066001)(14454004)(966005)(4326008)(72206003)(6306002)(7736002)(55016002)(105586002)(6246003)(74316002)(53936002)(476003)(106356001)(11346002)(486006)(6346003)(102836004)(9686003)(14444005)(229853002)(186003)(26005)(2906002)(86362001)(8936002)(68736007)(6916009)(3846002)(97736004)(53546011)(316002)(256004)(6506007)(446003)(6116002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR04MB5503;
 H:MN2PR04MB6061.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Anup.Patel@wdc.com; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: KJpL83UKZ1i4P/ca7G0qfvAIdXl6V3XbfiF/hBGHBAMJUVrz/Q/oEYWw9LzIjEFyN6/6xN5d1ONkXGdchaHBn25uNDOH/H5htzYBUs+IYy1d/+ANuz/y3QOMqzCFMzcRXAnbpD+r1iG2I0gw5cXs245iNduyyXbewXL2Av4fKRIP+5sK7c9otD1zCq28E63l0QOWAtMmCTlMgv1k6ngDNKjx4lD8OypYFPpFzD66kN+aZlSeQp39BTx7E5cSDBuaKT46iztPyX5RsOOMqUaOjE8qyNzpK0ptfIMSox38qDn1YWotJcjtBCFQz0G9eLMK91BS99BnAC9Rv+yYebtJRl7tZK9VU2CcwKLl7APrE107/UUcjWAif2vf3otc7aTIbjctMeWVh3J4qxcPks/TUNXUrMltJWDQ000InMx4TnU=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afb1f3e4-ac55-4a9f-f4bc-08d691793b7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2019 06:05:19.2576 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB5503
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190212_220525_842722_D57EBDC4 
X-CRM114-Status: GOOD (  17.46  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Atish Patra <Atish.Patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org



> -----Original Message-----
> From: Christoph Hellwig [mailto:hch@infradead.org]
> Sent: Wednesday, February 13, 2019 11:25 AM
> To: Anup Patel <Anup.Patel@wdc.com>
> Cc: Christoph Hellwig <hch@infradead.org>; Anup Patel
> <anup@brainfault.org>; Palmer Dabbelt <palmer@sifive.com>; linux-
> kernel@vger.kernel.org; Atish Patra <Atish.Patra@wdc.com>; Albert Ou
> <aou@eecs.berkeley.edu>; Paul Walmsley <paul.walmsley@sifive.com>;
> linux-riscv@lists.infradead.org
> Subject: Re: [PATCH v2 6/6] RISC-V: Implement keepinitrd kernel parameter
> 
> On Wed, Feb 13, 2019 at 03:43:06AM +0000, Anup Patel wrote:
> > Sure, the keepinitrd=0 by default so it will always free-up initrd by default.
> > Please look at v3 patchset.
> >
> > Of course, we need separate patch to update documentation of
> keepinitrd.
> 
> No, we need to not just blindly copy what arm did for historic reasons unless
> we have a very good reason of our own.
> 
> In addition to not having a real need for any of this in a new setup, it also is
> duplicated by the retain_initrd parameter which is implemented in generic
> code - and for that the commit message at least has a rationale related to
> kexec:
> 
> https://lkml.org/lkml/2006/12/7/15

Sure, I will re-work this patch to always free-up initrd.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
