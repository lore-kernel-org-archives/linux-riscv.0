Return-Path: <SRS0=pf/r=FU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 612E8C4361B
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Dec 2020 06:12:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85F1223343
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Dec 2020 06:12:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85F1223343
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=openfive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=d9b9l+nBUPvoFnKV6T8/OsIwjQBzEevf1lS9KF7833w=; b=X9QQ4S6PTG/u688bQf4XM4kov
	3XNDow0uy2JEN48g+pJY9y6EHQ+rgFjg0rwY33wljaWFEtMfik5NtCHOoTBsCXrgTlK7LKyc7EYPs
	cpLMSTBpZbB2mADb6txrH8y4ZMaOpDAEgzVUkHwaViiI9T4d+rI58ljot4B00uNpa+CBIggS7bwLs
	ffafCYtrw2ukp2HCr1mJZpydGQXMWwAcHOAklaHk+0py8i3G3yXYGvNrv0XI/5OG79UC6EDX52nut
	qvUITsebSaSyKG4o+KP28pnL0rzuzY+BvgXqJPKYNh82B8X61FaAadE8OfwegP4SBH2jZCtVuTn9L
	WHe47eOXg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpQ3E-0002Qe-G6; Wed, 16 Dec 2020 06:12:40 +0000
Received: from mail-bn8nam11on2060.outbound.protection.outlook.com
 ([40.107.236.60] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpQ3B-0002QA-Fv
 for linux-riscv@lists.infradead.org; Wed, 16 Dec 2020 06:12:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=biR7a+X7KL8uQMqHC8tIwsqT6DnBVLyrS87CZ486dbw8w2BiquwntN2x1HLS1kL4krufMMlPg4XPX8KYRJDibWNUR+ma/kXvzzmqFO3h8sarlOTNyMLu4SSFsfcCFy5JoPAtoV1r+9vsaYbgmrw27P/miAqvTmQvRhOW/PYT2NaVymvyHOxdCunvPyZbhrT4mcNyh/UNe/i92Rk1mt7J9+LZAdrsZfTLs+BsugoItYtMJ+/oYI4NEy1jIZrGMXl9eHt7iTPu/UjbthMNt2vJhd66Fugj2IMIEFWzzAhSUQegOf1PyYk7vBPZArUiyaVcFd0NaPz46zrgJkoNV6XSNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QJm7MAd6NfKxZlD4uEyJO8/8qZ3oKzMykT3TGj/i184=;
 b=aGPjIyn1CyRViLzCXlR9NDpToLHkCu4FNaUHMgfltp5yfuSrks8hF86bYofuADtGLQ7BB3Cn0/1bniJ1UIchk/512JkolY8fsxruw5El4nIUpdQ24rDqh1b69nhYHdPxvwn0G2VL1gFb9qDVw0Uy/Z+pjSh/jcNskHTe+j49BNubDKxXRPYmqzlTBq/d+Gt4VV0GMVKCPRYGeML2i94G2F/xnMXN9HhXWPF0w5YhtgtZZ9fiCawZS3TwBBgwcFEg0S7ZDko1seyd2Jpg6gI8/y6LPNZB22rrE+zx6qCl2NMPH0rSy4XGyF1LXur85A4RULf9JBhnULD6qHcAv3xVqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=openfive.com;
 dkim=pass header.d=openfive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=osportal.onmicrosoft.com; s=selector2-osportal-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QJm7MAd6NfKxZlD4uEyJO8/8qZ3oKzMykT3TGj/i184=;
 b=JhoPaSYh1jR2OhKq22hySFNblSZYDPMeN36k/vhuxax2exrkHwszSPMixyOHsyjDUIgjNTNbvuBIjJp9qMiUb5EFgytlaUXr7S3qP4m4bSfCCJezr7+ykeHNHs6/O0yPt+iqTllqREHAcye010auef579G1QW7X7Nwp7kATgKFg=
Received: from BY5PR13MB4453.namprd13.prod.outlook.com (2603:10b6:a03:1d1::19)
 by BYAPR13MB2839.namprd13.prod.outlook.com (2603:10b6:a03:b3::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.13; Wed, 16 Dec
 2020 06:12:31 +0000
Received: from BY5PR13MB4453.namprd13.prod.outlook.com
 ([fe80::7c13:1ac6:9f2a:5eae]) by BY5PR13MB4453.namprd13.prod.outlook.com
 ([fe80::7c13:1ac6:9f2a:5eae%6]) with mapi id 15.20.3676.016; Wed, 16 Dec 2020
 06:12:31 +0000
From: Yash Shah <yash.shah@openfive.com>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: RE: [PATCH v2 7/9] riscv: dts: add initial support for the SiFive
 FU740-C000 SoC
Thread-Topic: [PATCH v2 7/9] riscv: dts: add initial support for the SiFive
 FU740-C000 SoC
Thread-Index: AQHWzR6JqEv/BdKn8Eapft4N/qmyd6nwWDeAgAD9P4CAB/NigIAAAXSg
Date: Wed, 16 Dec 2020 06:12:30 +0000
Message-ID: <BY5PR13MB4453C2D078F13E60DAE356B982C50@BY5PR13MB4453.namprd13.prod.outlook.com>
References: <1607403341-57214-1-git-send-email-yash.shah@sifive.com>
 <1607403341-57214-8-git-send-email-yash.shah@sifive.com>
 <CAEUhbmURfwMYo6FTuL7TP7daSuhBOOpcZX-mfCxCTVS+QiaHqA@mail.gmail.com>
 <BY5PR13MB44539E6CDB009EFA6AB7CAFA82C50@BY5PR13MB4453.namprd13.prod.outlook.com>
 <CAEUhbmWrCpKraUpijggkiNXa40OAnN9YJF1iFWnrnrhJZN1joA@mail.gmail.com>
In-Reply-To: <CAEUhbmWrCpKraUpijggkiNXa40OAnN9YJF1iFWnrnrhJZN1joA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=openfive.com;
x-originating-ip: [210.16.112.23]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 82edec86-dd9d-496e-ffb9-08d8a1899268
x-ms-traffictypediagnostic: BYAPR13MB2839:
x-ld-processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR13MB2839913A8C4EB394C687AFC782C50@BYAPR13MB2839.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZIPlPvwYzFQKUI4VhDBTSPvJvsgjzzM4XLE7OQfCxVkXSz9VteUtDotoWTOWLS5+sz4hoxSyBTivvgcw8JmUTYp4LcAfdFJSvKPhMwQl5hboxL6x+5L+vTjUgpyMyJYF+M/K9ts1ghHFdvOLkp76iv7GPRArHG9Nezb4qnbAELeEfmVZSQITu4kJhANmOimKZbMlqm35bXkPL2FcvkHYvfnAS0gQ4S9D445OQLNa0Y4o9zUK3xAxOZUwqu9+2BfFBu/MX6FmLi+u76/ZIDAkzzmXwhd7/k/k67OsdMoI3VBdkWA6CgujuX91X90I14MmNcIH+5iB4uKrICpMoa9d4byCFcxZOXfaPIcfmwcJLXI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR13MB4453.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(346002)(366004)(136003)(39840400004)(376002)(396003)(53546011)(8936002)(7696005)(5660300002)(316002)(86362001)(55016002)(9686003)(7416002)(8676002)(76116006)(2906002)(52536014)(54906003)(6506007)(66446008)(66556008)(66946007)(6916009)(4326008)(64756008)(66476007)(83380400001)(44832011)(33656002)(71200400001)(186003)(478600001)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?bnZZM0lMcUNqYTBNeTh1S2tSc3BEY0FmQ3FJblVLeDI3b1hUOXNFbXp0WDhs?=
 =?utf-8?B?b0JzRmptTzhkZ3M0KzNma01EaVNMSVJna3JwUzNzejN2VW5VU0NyN1UrYUZo?=
 =?utf-8?B?Qk5EYU9tTlBZaDhUSzdtbVBLelFyMm9YNFFZRVIzYkRTYlQ4YzByQU9yeWs3?=
 =?utf-8?B?OStxNlJJQUh6V3p2cVVJNVF3b3RXL1F6NDZiQ1FVR2dJaUM1OFBuYzJnblBH?=
 =?utf-8?B?dXVjTnoxWEdScHFlMnF5YlRIcjE5b1duT2N6bFBUdWRpQk5TcVRQckh1azJS?=
 =?utf-8?B?S1BoaWlGTjBJamhVemVDMDNnVmRJT0NwV2gzYXlZTjFnY2ZrSkxpakxDcndT?=
 =?utf-8?B?Y2puK3h3K0N3aHA2UFhTZmNaK0xsZ2kwK2sralczSGFkQmhHK2dkU2RZVHlV?=
 =?utf-8?B?Q3QxOGJYcEVLa0E2T2tFM0VJeUpiNGRtaFkxUlpCWVBxSk1rNXlQck9VcjhG?=
 =?utf-8?B?dmFQRk4xZUFDUGQxZGRrdVdtTSsySm9FSVRJT2JVVmk2Z3R4aXlOVWhwVnA5?=
 =?utf-8?B?dWsyb0ZSVURra1pkMGlZYVZjMnhMcllCM3dQZnNPLzBvblpmbEZJejYrYnU3?=
 =?utf-8?B?Q1YyQStUcktlMWVkcWF6aTlob01mdWlwYUR2NjNEN0JnTVpvdGFzWmk0ajEz?=
 =?utf-8?B?K3Nsa2dTOGJQNXZRQzNNK21lREpscXVCTEZXMC8vWTZaaGVCUGR6V081TG9r?=
 =?utf-8?B?dUNaNXZJSFFnQXJUQ0Y1UnJaTXZzWE9sU2tZSi9sNTk1WFdkdjVzQnJNNDRm?=
 =?utf-8?B?UzJ3R2JHSFcwNXhybU9JTlkxR3ZJQTZDVUFNQ1VIV2xHbitmc0lNUWZibXdR?=
 =?utf-8?B?WGhNODhUa2NQM2NrRWwwZnZIVU9GWEVMNUhrRkErbGZnSjB1L0ljN0Npc2VS?=
 =?utf-8?B?THhlUGYvbWxXUnR3UXNSR2ROaERKSnlibUNFNDJ0WUxpQ0NnR2Fkd1E5Q0t6?=
 =?utf-8?B?ZXltR1B3Tmdsa2MzWC9UakQrVnhpZ0xIZ0hPMmZrVGFXQjNTc1Y1dGNXZEU4?=
 =?utf-8?B?aFlmYlM1d3VXWE9kK2JOdURBNFJPMFV4K2ErZkVsbENBVFFRNzJtSUw3QlBI?=
 =?utf-8?B?MThiTmQ0TjIrK1JxSWJBbW5qTG1iQkJocHFvNVpERjdvMnhVdzlJQkhGdW1U?=
 =?utf-8?B?RVJxVHFjYm0rVjN1OVNvRE5vblYwK2hMRmFGSXBsREszUzdiVTlJSERCZU9N?=
 =?utf-8?B?bUEvb1dkTjczZlQ2MUYrb1ZjRTRHaWg4S1BMQUlTaVNINDBjVnVRRVU4NnRy?=
 =?utf-8?B?TmNUa1J2NUE3bmFicVRBTzRnRkR4eUlqQ0QwUlpKRzkrZllQODZwRVRkelEx?=
 =?utf-8?Q?hwEhLpQmU96hA=3D?=
MIME-Version: 1.0
X-OriginatorOrg: openfive.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR13MB4453.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82edec86-dd9d-496e-ffb9-08d8a1899268
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2020 06:12:30.9810 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kWeSGkm3RgdQA3Y+VOf4d5ghCD/M3fht8PQkfMZdKUOxIw/0RrMvhxW3cTW/BfGbcus0BITiO5AZmqLi8xxKSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR13MB2839
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_011237_576933_8227F401 
X-CRM114-Status: GOOD (  28.14  )
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
Cc: "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 Peter Korsgaard <peter@korsgaard.com>, Albert Ou <aou@eecs.berkeley.edu>,
 devicetree <devicetree@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "Paul Walmsley \( Sifive\)" <paul.walmsley@sifive.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "andrew@lunn.ch" <andrew@lunn.ch>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

> -----Original Message-----
> From: Bin Meng <bmeng.cn@gmail.com>
> Sent: 16 December 2020 11:36
> To: Yash Shah <yash.shah@openfive.com>
> Cc: linux-spi@vger.kernel.org; linux-serial@vger.kernel.org; linux-
> pwm@vger.kernel.org; linux-i2c@vger.kernel.org; linux-kernel <linux-
> kernel@vger.kernel.org>; linux-riscv <linux-riscv@lists.infradead.org>;
> devicetree <devicetree@vger.kernel.org>; open list:GPIO SUBSYSTEM <linux-
> gpio@vger.kernel.org>; broonie@kernel.org; Greg Kroah-Hartman
> <gregkh@linuxfoundation.org>; Albert Ou <aou@eecs.berkeley.edu>;
> lee.jones@linaro.org; u.kleine-koenig@pengutronix.de; Thierry Reding
> <thierry.reding@gmail.com>; andrew@lunn.ch; Peter Korsgaard
> <peter@korsgaard.com>; Paul Walmsley ( Sifive)
> <paul.walmsley@sifive.com>; Palmer Dabbelt <palmer@dabbelt.com>; Rob
> Herring <robh+dt@kernel.org>; Bartosz Golaszewski
> <bgolaszewski@baylibre.com>; Linus Walleij <linus.walleij@linaro.org>
> Subject: Re: [PATCH v2 7/9] riscv: dts: add initial support for the SiFive FU740-
> C000 SoC
> 
> [External Email] Do not click links or attachments unless you recognize the
> sender and know the content is safe
> 
> Hi Yash,
> 
> On Wed, Dec 16, 2020 at 1:24 PM Yash Shah <yash.shah@openfive.com>
> wrote:
> >
> > > -----Original Message-----
> > > From: Bin Meng <bmeng.cn@gmail.com>
> > > Sent: 10 December 2020 19:05
> > > To: Yash Shah <yash.shah@openfive.com>
> > > Cc: linux-spi@vger.kernel.org; linux-serial@vger.kernel.org; linux-
> > > pwm@vger.kernel.org; linux-i2c@vger.kernel.org; linux-kernel <linux-
> > > kernel@vger.kernel.org>; linux-riscv
> > > <linux-riscv@lists.infradead.org>;
> > > devicetree <devicetree@vger.kernel.org>; open list:GPIO SUBSYSTEM
> > > <linux- gpio@vger.kernel.org>; broonie@kernel.org; Greg
> > > Kroah-Hartman <gregkh@linuxfoundation.org>; Albert Ou
> > > <aou@eecs.berkeley.edu>; lee.jones@linaro.org;
> > > u.kleine-koenig@pengutronix.de; Thierry Reding
> > > <thierry.reding@gmail.com>; andrew@lunn.ch; Peter Korsgaard
> > > <peter@korsgaard.com>; Paul Walmsley ( Sifive)
> > > <paul.walmsley@sifive.com>; Palmer Dabbelt <palmer@dabbelt.com>;
> Rob
> > > Herring <robh+dt@kernel.org>; Bartosz Golaszewski
> > > <bgolaszewski@baylibre.com>; Linus Walleij
> > > <linus.walleij@linaro.org>
> > > Subject: Re: [PATCH v2 7/9] riscv: dts: add initial support for the
> > > SiFive FU740-
> > > C000 SoC
> > >
> > > [External Email] Do not click links or attachments unless you
> > > recognize the sender and know the content is safe
> > >
> > > On Tue, Dec 8, 2020 at 3:06 PM Yash Shah <yash.shah@sifive.com>
> wrote:
> > > >
> > > > Add initial support for the SiFive FU540-C000 SoC. FU740-C000 is
> > > > built
> > >
> > > FU740-C000 Soc
> > >
> > > > around the SiFIve U7 Core Complex and a TileLink interconnect.
> > > >
> > > > This file is expected to grow as more device drivers are added to
> > > > the kernel.
> > > >
> > > > Signed-off-by: Yash Shah <yash.shah@sifive.com>
> > > > ---
> > > >  arch/riscv/boot/dts/sifive/fu740-c000.dtsi | 293
> > > > +++++++++++++++++++++++++++++
> > > >  1 file changed, 293 insertions(+)  create mode 100644
> > > > arch/riscv/boot/dts/sifive/fu740-c000.dtsi
> > > >
> > > > diff --git a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
> > > > b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
> > > > new file mode 100644
> > > > index 0000000..eeb4f8c3
> > > > --- /dev/null
> > > > +++ b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
> > > > @@ -0,0 +1,293 @@
> >
> > ...
> >
> > > > +               plic0: interrupt-controller@c000000 {
> > > > +                       #interrupt-cells = <1>;
> > > > +                       #address-cells = <0>;
> > > > +                       compatible = "sifive,fu540-c000-plic",
> > > > + "sifive,plic-1.0.0";
> > >
> > > I don't see bindings updated for FU740 PLIC, like "sifive,fu740-c000-plic"?
> >
> > That's because it is not required. There won't be any difference in driver
> code for FU740 plic.
> 
> Are there any driver changes for the drivers that have an updated
> fu640-c000-* bindings? I don't see them in the linux-riscv list.

Yes, they will be posted soon.

- Yash

> 
> >
> > ...
> >
> > > > +               eth0: ethernet@10090000 {
> > > > +                       compatible = "sifive,fu540-c000-gem";
> > >
> > > "sifive,fu740-c000-gem"?
> > >
> >
> > Same reason as above.
> >
> > Thanks for your review.
> 
> Regards,
> Bin
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
