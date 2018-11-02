Return-Path: <SRS0=t+eB=NN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DA05C6786F
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  2 Nov 2018 04:29:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6D472082D
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  2 Nov 2018 04:29:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LJEhkFW0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6D472082D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hpe.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bBjdut7Ki1M3yGtZBGl2jboixqVBMJ5Ta3rKX9VjUdY=; b=LJEhkFW0KCkuqC
	X4FR1xPYFnUgdLI1yvcRu6msQfbDPBtvHo0q+/qs+TXzCd4z55tFjJggDSgUzIdoe9dNBN+gWCvbR
	Q8Dr+xPoeGBgYrrSi0IJvakf/5kmFQn3Jz0Wu7zhpky2z//LBgUxpHanbCB9crTi46wC6sWFpYvI3
	82xb0HdL3ruGaz1VRgM4b+W4rflxyNauq8kwqVbLKK8z3SoEExkcSnh/fEtLNrp+pFZyOkN/cGTHl
	2VwtPND8VIhGj8B4dmEJTsdrAPfihQWeUGkNyvsjcnaHNR8xeGE2xeP2+f7DIb4m7mr809KXJ27Wj
	iNLUm5KKjdoY8VJV12bA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gIR5R-0000d8-Uz; Fri, 02 Nov 2018 04:29:33 +0000
Received: from g9t5008.houston.hpe.com ([15.241.48.72])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIR5N-0000bU-Ue
 for linux-riscv@lists.infradead.org; Fri, 02 Nov 2018 04:29:32 +0000
Received: from G4W9121.americas.hpqcorp.net (g4w9121.houston.hp.com
 [16.210.21.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by g9t5008.houston.hpe.com (Postfix) with ESMTPS id 4828492;
 Fri,  2 Nov 2018 04:29:11 +0000 (UTC)
Received: from G9W8456.americas.hpqcorp.net (2002:10d8:a15f::10d8:a15f) by
 G4W9121.americas.hpqcorp.net (2002:10d2:1510::10d2:1510) with Microsoft SMTP
 Server (TLS) id 15.0.1367.3; Fri, 2 Nov 2018 04:29:11 +0000
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (15.241.52.12) by
 G9W8456.americas.hpqcorp.net (16.216.161.95) with Microsoft SMTP
 Server (TLS)
 id 15.0.1367.3 via Frontend Transport; Fri, 2 Nov 2018 04:29:11 +0000
Received: from TU4PR8401MB0958.NAMPRD84.PROD.OUTLOOK.COM (10.169.47.11) by
 TU4PR8401MB0720.NAMPRD84.PROD.OUTLOOK.COM (10.169.45.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1294.26; Fri, 2 Nov 2018 04:29:09 +0000
Received: from TU4PR8401MB0958.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::40f:8c5:f31e:355f]) by TU4PR8401MB0958.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::40f:8c5:f31e:355f%7]) with mapi id 15.20.1273.027; Fri, 2 Nov 2018
 04:29:09 +0000
From: "Chang, Abner (HPS SW/FW Technologist)" <abner.chang@hpe.com>
To: Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@sifive.com>
Subject: RE: SBI extension proposal
Thread-Topic: SBI extension proposal
Thread-Index: AQHUcUbctwM8nXMZUU6atK0+B4IP1KU6pcOAgAAEPYCAAALhgIAAdDWAgACpuoCAAAqAAIAADwxQ
Date: Fri, 2 Nov 2018 04:29:08 +0000
Message-ID:
 <TU4PR8401MB09584566CCE279C368CFC145FFCF0@TU4PR8401MB0958.NAMPRD84.PROD.OUTLOOK.COM>
References: <20181101164205.l2bra3a6kihjpuib@excalibur.cnev.de>
 <mhng-dd74f93c-74b1-4701-a73c-339d81aa0bd0@palmer-si-x1c4>
 <CAAhSdy3ZX=BqMS-MYnTHNZ9hxkJbt8i5nf5rOTf41FJ6rUpWpA@mail.gmail.com>
In-Reply-To: <CAAhSdy3ZX=BqMS-MYnTHNZ9hxkJbt8i5nf5rOTf41FJ6rUpWpA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=abner.chang@hpe.com; 
x-originating-ip: [16.242.247.138]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; TU4PR8401MB0720;
 6:zpO1I26k+lU9b67McqNvxxJIiephaWb6qYWl5r9nNjdmEwy+0WeD5O/HX3Cn2MKTgXxp5dVZpSDT7t25CpitGOitzEP2WDAcwweOy/ywl5Tgb4IlXLpmcpAw0lo7zsOghx6eSBjuBbUq2FoQ7gVSr74xb02TQ7VkDujzSD5KFu5NETeZsGkuVZD5sKOZza550rrJP0NAlO1gvX5Zw9RrXrYBzSIALV840lZoeVktXNWqzfVSAJPGwpP0qibHA0H+Jg9GlrMVVfs4nXoQWaXSnTwTWLVlnee+MaoApjqk9qYLZIkYt8Jk9PnIDfiXOgHVfpxuM6nOpmQck7Di5PINvFCpxboJxuW5dl680PYAFeV7f4myHg1jSWXkApz02xMzx09pKS0Zo1ZPtokcyaAl5Pa0Yb/m5sVP6o3W946EAY0HWai2vc03npka8FQbdTZQAa4wqivjW6ExAvoz4jDfzw==;
 5:m9ZfrbHcTUiY4BrhpCWTPt1kKbdLyl2lcXG26Lr5HStlmmumyneTwt5LoSTgJIxjlRdectnGNH5x32EbFB+hXQgG5zwBywKeU/eh5MufRWrXcffVOijv27FQ4R1gKSyhqo3voIhHIfa/dUsRDQTMaAGQQXYR3NLfGsYUcSPrIWs=;
 7:M4+s0TFvYpLMoyeakoBxJMUbAkRX5LbinJ5R5XE/XupIKKyjMP1eg+7BbS7/vVBC8UboxfjvODEWXMBz8Uy/pILtNlQC5KoD0B9tvGW/pODexhYpW+KRWNtkNR2WPPgi0WrdaW+H5XpKy4Ymp+Uweg==
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
 SFS:(10019020)(376002)(39860400002)(366004)(136003)(346002)(396003)(13464003)(189003)(199004)(7696005)(575784001)(25786009)(102836004)(76176011)(2906002)(53546011)(105586002)(478600001)(6506007)(3480700004)(7736002)(86362001)(53936002)(229853002)(8676002)(305945005)(39060400002)(476003)(14454004)(33656002)(256004)(7416002)(74316002)(97736004)(6246003)(9686003)(66066001)(71190400001)(71200400001)(11346002)(106356001)(446003)(81166006)(99286004)(6116002)(55016002)(8936002)(3846002)(68736007)(26005)(6436002)(561944003)(186003)(2900100001)(110136005)(316002)(4326008)(54906003)(486006)(7116003)(5660300001)(81156014);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TU4PR8401MB0720;
 H:TU4PR8401MB0958.NAMPRD84.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-office365-filtering-correlation-id: 8fe1a04c-e206-4f34-9394-08d6407bbb7d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:TU4PR8401MB0720; 
x-ms-traffictypediagnostic: TU4PR8401MB0720:
x-microsoft-antispam-prvs: <TU4PR8401MB0720D1176FBC4A43F389C39FFFCF0@TU4PR8401MB0720.NAMPRD84.PROD.OUTLOOK.COM>
x-exchange-antispam-report-test: UriScan:(258649278758335)(180628864354917)(85827821059158)(227479698468861)(222181515654134);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231382)(944501410)(52105095)(3002001)(10201501046)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123560045)(20161123564045)(20161123558120)(201708071742011)(7699051)(76991095);
 SRVR:TU4PR8401MB0720; BCL:0; PCL:0; RULEID:; SRVR:TU4PR8401MB0720; 
x-forefront-prvs: 08444C7C87
received-spf: None (protection.outlook.com: hpe.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: 5EqX+r+iqv4A+MHVjBo0O91I+vwAHAJR0EvxDfTbvLzVZnyzSI30Q4jfGhpHiCdAln34l2UH2k+pmQ3SJUhpy/7q6rw2hTaokphKMQ063zl6Qv8aON3m9rTWDdZc5ja/rD1ezME5ryu3hd80I9Sm0k3f3wa2s5s69Il0WZH2FWSbgCNKh92Vji98SG+zNWW3pncCbmBhmiFBN86xx+Msc634eT0X36y2SfM37qK5+A3wUBGj7+0WkltDvGynBzrXecAd/SKz8gXjaCxxU8CaaSgAgwTtBxEfKt8ce5bQ2sV/oEfW+TOJYF5kc3WPHQwNi5jsrd43uCz0xxFbGQk2YhZ0A227C+W/Qi5JtuPvqCE=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fe1a04c-e206-4f34-9394-08d6407bbb7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2018 04:29:08.9297 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TU4PR8401MB0720
X-OriginatorOrg: hpe.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181101_212930_084504_F36BCB8C 
X-CRM114-Status: GOOD (  25.62  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Zong Li <zong@andestech.com>,
 Damien Le Moal <Damien.LeMoal@wdc.com>,
 Olof Johansson <olof.johansson@gmail.com>, Andrew Waterman <andrew@sifive.com>,
 "alankao@andestech.com" <alankao@andestech.com>, "Chen,
 Gilbert" <gilbert.chen@hpe.com>, "philipp@hug.cx" <philipp@hug.cx>,
 "vincentc@andestech.com" <vincentc@andestech.com>,
 "rjones@redhat.com" <rjones@redhat.com>, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <atish.patra@wdc.com>, Michael Clark <mjc@sifive.com>,
 Arnd Bergmann <arnd@arndb.de>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "merker@debian.org" <merker@debian.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "David.Abdurachmanov@cern.ch" <David.Abdurachmanov@cern.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181102042908.SCCJ-rHNJwqFSbdrYf8FcaWL8T66rO1vG9QkC7Lzdds@z>

> -----Original Message-----
> From: Anup Patel [mailto:anup@brainfault.org]
> Sent: Friday, November 02, 2018 11:27 AM
> To: Palmer Dabbelt <palmer@sifive.com>
> Cc: merker@debian.org; rjones@redhat.com; Mark Rutland
> <mark.rutland@arm.com>; Christoph Hellwig <hch@infradead.org>; Damien
> Le Moal <Damien.LeMoal@wdc.com>; Olof Johansson
> <olof.johansson@gmail.com>; Andrew Waterman <andrew@sifive.com>;
> alankao@andestech.com; philipp@hug.cx; Zong Li <zong@andestech.com>;
> Atish Patra <atish.patra@wdc.com>; Michael Clark <mjc@sifive.com>; Arnd
> Bergmann <arnd@arndb.de>; paul.walmsley@sifive.com; linux-
> riscv@lists.infradead.org; Chang, Abner (HPS SW/FW Technologist)
> <abner.chang@hpe.com>; vincentc@andestech.com;
> David.Abdurachmanov@cern.ch
> Subject: Re: SBI extension proposal
> 
> On Fri, Nov 2, 2018 at 8:19 AM Palmer Dabbelt <palmer@sifive.com> wrote:
> >
> > On Thu, 01 Nov 2018 09:42:05 PDT (-0700), merker@debian.org wrote:
> > > On Thu, Nov 01, 2018 at 09:46:09AM +0000, Richard W.M. Jones wrote:
> > >> On Thu, Nov 01, 2018 at 03:05:51PM +0530, Anup Patel wrote:
> > > [...]
> > >> > > How about putting the version information into device tree and
> > >> > > use the compatible string?  This seems more reliable than
> > >> > > probing.
> > >> > > e.g.
> > >> > > firmware {
> > >> > >         sbi {
> > >> > >                 compatible = "riscv,sbi-r0p1", "riscv,sbi-r0p2";
> > >> > >         };
> > >> > > };
> > >> >
> > >> > If it was just DT then I think having this information in DT
> > >> > makes sense. In future, we might definitely see some ACPI support
> > >> > in RISC-V too (just like ARM64 world).
> > >>
> > >> I agree.  Please try not to make things that depend on DT, as it's
> > >> a Linux-only description which isn't suitable for other OSes and
> > >> has a poorly defined ABI.
> > >
> > > the notion that DT is a "Linux-only" description and not suitable
> > > for other operating systems isn't correct.  Besides being used by
> > > Linux, device-tree is also used by at least U-Boot, FreeBSD and
> > > NetBSD.  Based on issues in the early days of DT one can surely
> > > discuss about device-tree ABI stability, but since then a lot of
> > > effort has been put into making DT ABI-stable, and in my experience
> > > this effort has been successful.  On the other hand I have
> > > experienced way more ACPI issues on x86-64 hardware than I would
> > > like to remember, so I tend to assume that in the ACPI world also
> > > not everything is nice and shining.
> >
> > I'm treating device tree as a stable interface, at least once it's
> > written down as a spec (like all our other interfaces).  At SiFive
> > we're treating it as the standard interface for static device
> > discovery, so interface breaks will be a huge pain.
> 
> DT is a great HW description style (my opinion) but then there are ACPI fans
> too.
> 
> I think SBI spec should be independent of DT or ACPI or any other HW
> description style. In fact, a simple bare-metal programs (without DT or ACPI
> support) should also be able to make complete use of SBI. This will allow us
> to develop baremetal test suit for SBI calls.
> 
Agree.
Please also consider EFI firmware code base. There is no DT in UEFI spec for H/W devices or other information. We would like to leverage SBI spec as well, and implement SBI in EFI firmware. Having SBI version in SBI spec makes more sense to different FW frameworks.

> Regards,
> Anup
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
