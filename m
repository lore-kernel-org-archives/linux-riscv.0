Return-Path: <SRS0=oZWO=CY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9AA2C43461
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2020 16:09:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7899E21655
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2020 16:09:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sl3g3omu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=osportal.onmicrosoft.com header.i=@osportal.onmicrosoft.com header.b="kRAm4CF0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7899E21655
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=openfive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WNHQtDqlZ0A5L0UTqQXqK6r2cFmp9o5KAwr21X50Xyc=; b=sl3g3omuh70xI/NIH0VhaBs+B
	XIPgeGI7LPkZ/FZsJSdfHnYMgCB4faxCjhidSFccpDYcI94nocv0KxkpWK5j7ByuGpGZIvYGAYOti
	d45v9FDMph5XHz3/kMEe+PMfBpFClF8tkVjOb4FH7aM16hc6pqEXfoPqvLeAXtSMyOGHGFG0LyrQ+
	czsOUzU+s61Uene8DdhJSeRkKGFxNvYO+Szi3SyRbfVGNW0h/+epEbNPX2BCQqRAaS2tSKuVrRbg5
	b7KPADI8ocdwqor2voI60avJCGNw7bTd1BQcrlcx+/1mwybFK+2kmR3Qs+cg3LWVxeABz8JznXdlv
	0OcICSzAg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIDVi-0004Fh-Ry; Tue, 15 Sep 2020 16:08:50 +0000
Received: from mail-bn8nam11on2041.outbound.protection.outlook.com
 ([40.107.236.41] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIDVd-0004BK-86
 for linux-riscv@lists.infradead.org; Tue, 15 Sep 2020 16:08:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=drfQfNB7/fiuMKck1/cbH3gAmlPOv8va8rbg4GzUz64monheHmnlx0krPVyvrykrZalZUekmTtQdNzFZb/685aTsQfJGHcZRQKMpjjhqnXDUDGLXT2AjkH8y81PAoD5zeddn+Fh+Mg6zCZ0IHsJx7/DZ0Ia6CJdcqr91jPu/amtmweF+o8P80ctE8zbOEf3rtF7iOv4lA1AqTINxv0glBW6fDVfbcY37l2ypH/vJGqCRaFI1KZCWCntaNTx8Uk8xYRiFBHhVCEPeCJvnxi8t8QS2lUJSJ+sN8uXsiM9vsJCP8eOa59Zvfxlvdr6b7C29eclsKquqqa8ChohA7K09Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SjFUb7vTs5JToxwM5b7IfhF8omXVbCFvx086OiTs8Rw=;
 b=K/42TvsGr9BSffQ90jcydsTs/iOVx+slk/FWVXuOOEQhFZFPSsMscO/CPpFH0XJAiWyVF+xaxB9eaWEtcb+GQjljISpE2S2iMALE0UJtwmwXgdOWeyXfr8Yu+myTkTUl944TNuaO5pG0rHRsqihkp7cf9cUQGGCjA/qOLymgUiyRajydMejGgUq3GFILC6ZwPwWzxOoaBTHmz6ue3upLdyOV4n/RqE1ZVJa1/hzz00CAPnocGfifJZRXTTv5Q+VPsrQkZZN/jslG2fSGTv9EjcaUP7H/KzlwV+Un852IBdkuYm1Cq3E7AhCp1dxsB8DlMlgouqbUmmm46gg8MHLtIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=openfive.com;
 dkim=pass header.d=openfive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=osportal.onmicrosoft.com; s=selector2-osportal-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SjFUb7vTs5JToxwM5b7IfhF8omXVbCFvx086OiTs8Rw=;
 b=kRAm4CF0pJADTy12JMqKIJt7PfbypSA+sgPrZTRtVBWR17MCY7QmzxHhNJ4nCGDIak0EG9Snc16vTg77RAScyyrO1Rj+PK+ty5IarfHMqeqEn4biBJ4HwRJBAn8b+1GJdH3heLZlIYPKsLwPUVMwJw02lp1bKsYDO22oKrEWnZs=
Received: from DM6PR13MB3451.namprd13.prod.outlook.com (2603:10b6:5:1c3::10)
 by DM5PR13MB1499.namprd13.prod.outlook.com (2603:10b6:3:124::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.8; Tue, 15 Sep
 2020 16:08:39 +0000
Received: from DM6PR13MB3451.namprd13.prod.outlook.com
 ([fe80::a48a:1f7c:267c:876]) by DM6PR13MB3451.namprd13.prod.outlook.com
 ([fe80::a48a:1f7c:267c:876%7]) with mapi id 15.20.3391.009; Tue, 15 Sep 2020
 16:08:38 +0000
From: Sagar Kadam <sagar.kadam@openfive.com>
To: Stephen Boyd <sboyd@kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-pwm@vger.kernel.org"
 <linux-pwm@vger.kernel.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
Subject: RE: [PATCH v1 1/3] dt-bindings: fu540: prci: convert PRCI bindings to
 json-schema
Thread-Topic: [PATCH v1 1/3] dt-bindings: fu540: prci: convert PRCI bindings
 to json-schema
Thread-Index: AQHWh19dauScmTya2kGXAdhgG1hjhKlo2YUAgAEFd1A=
Date: Tue, 15 Sep 2020 16:08:38 +0000
Message-ID: <DM6PR13MB3451EE4E239C49BD9E7F032897200@DM6PR13MB3451.namprd13.prod.outlook.com>
References: <1599734644-4791-1-git-send-email-sagar.kadam@sifive.com>
 <1599734644-4791-2-git-send-email-sagar.kadam@sifive.com>
 <160012842007.4188128.14895985041717484631@swboyd.mtv.corp.google.com>
In-Reply-To: <160012842007.4188128.14895985041717484631@swboyd.mtv.corp.google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=openfive.com;
x-originating-ip: [116.74.150.204]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b99558e6-0033-42a6-5ada-08d859919bad
x-ms-traffictypediagnostic: DM5PR13MB1499:
x-ld-processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR13MB1499DF8FD07A0990836039E997200@DM5PR13MB1499.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Do4AIX+ryad3lQJOqgIzQxxCtrwlR7qcRguaDW6Dxs9Dvyw8xok7FQfOOl8b0nSdmVKuNVBtML27EC2MmDUjzhyM9e9nH8s9hQ0asCsISji1Kg2tu399a2Nk6edrrRp9r8mdKc5gn/bxAx3tkQqfODGEar8l/RQjRdIWDw+qkVFR7IeXfk/LcRNG+bfXzzt4A0rJaouqJSlbGjtKYCAh9yCU0nihkIQ6hjg0VTDVjblNzsnpz4C3Gq3Wrj1v/KodpVwzptAo/tiazAN1yDJdI1x32TrhVS/R+i3PXPX9TZ6N+4KDSwnCVT/Docl33PmYscBs4L5whaeC6r/Jt8G1oFPTkblcqQgW6rvqfys4nxl61d9j4HmSeyP7aDmIlVEJViFfDUy/pDWNXOYEzoZCPQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR13MB3451.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39850400004)(366004)(136003)(346002)(376002)(478600001)(52536014)(55016002)(8676002)(83380400001)(8936002)(33656002)(66556008)(64756008)(66446008)(4326008)(71200400001)(66946007)(66476007)(2906002)(76116006)(107886003)(316002)(86362001)(9686003)(44832011)(5660300002)(966005)(110136005)(6506007)(7696005)(186003)(7416002)(55236004)(53546011)(26005)(54906003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: GVvFcGb7P082hn23jYC6PyW3x3gq8Kit5ymVEoRcT67w3WqrinuzVRvYFla47n5ytWrBg+NNpsS9XHo8B2Q1pgIQhrZQZ+EqDxLrNLNFC2TH+d1aDUPFpKJbDj0ZS7euFdMiLFhQItClbf0SsyHj8EyR9BuZvEiwr0D56e6xUm7u95+89bUedGLdES07mekZbRsKlVGDWNhoH9A/IHpYVmBRxXwnIU3OKGDYnQpC8BO1SQ26+UQo/68JlDEfg0Bq055tAJkAX9vKFJi5BXAaEVMjnPhvNJ6BCE2O/Td230B71430DtPPpTJ5BxWhliFSDswe9D9SAskRgnGFfAIfmxy+t414fhnYjQCUNIaO/XMncljVAiPD2EjeH4N+0l/lpFbkTSFhh08KfWWWZR+QoQmiH2mViQ+anjGwUk+ReqQ2mNTpR32VlubaTMWme2fTXOtWFg9FyvFWkmQWftCscuUGHZJKWvRZH3/UGtlPIXIcLzBNoxQf+Z5t91w5LkbqskQ3K5qhttC0JOIcfJsvagVDWD0EYJp7WvYKTWrYzqV98W9GAOe3X9vDvG6OYalPBNdx85Exa1YivcmcYWHFMJNCoticvFV6+b2B6Ml1jc71z2ce9qNT/yECID5Ot1t750HJD+q6peemaFbBPhaasQ==
MIME-Version: 1.0
X-OriginatorOrg: openfive.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR13MB3451.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b99558e6-0033-42a6-5ada-08d859919bad
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2020 16:08:38.8415 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oiQeeOUqWLj6CjDFZGvQSFna9vTG858V4MsW+UevwhXQq4EQjQ/9PePNqk4nMTrM5vurRAyqws4y2sl++VLvGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR13MB1499
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_120845_345958_C74C3FBC 
X-CRM114-Status: GOOD (  24.53  )
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
Cc: "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "jason@lakedaemon.net" <jason@lakedaemon.net>,
 "maz@kernel.org" <maz@kernel.org>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
 Yash Shah <yash.shah@openfive.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "Paul Walmsley \( Sifive\)" <paul.walmsley@sifive.com>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hello Stephen,

> -----Original Message-----
> From: Stephen Boyd <sboyd@kernel.org>
> Sent: Tuesday, September 15, 2020 5:37 AM
> To: Sagar Kadam <sagar.kadam@openfive.com>;
> devicetree@vger.kernel.org; linux-clk@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-pwm@vger.kernel.org; linux-
> riscv@lists.infradead.org
> Cc: mturquette@baylibre.com; robh+dt@kernel.org; Paul Walmsley ( Sifive)
> <paul.walmsley@sifive.com>; palmer@dabbelt.com; tglx@linutronix.de;
> jason@lakedaemon.net; maz@kernel.org; thierry.reding@gmail.com;
> u.kleine-koenig@pengutronix.de; lee.jones@linaro.org;
> aou@eecs.berkeley.edu; Yash Shah <yash.shah@openfive.com>; Sagar
> Kadam <sagar.kadam@openfive.com>
> Subject: Re: [PATCH v1 1/3] dt-bindings: fu540: prci: convert PRCI bindings
> to json-schema
> 
> [External Email] Do not click links or attachments unless you recognize the
> sender and know the content is safe
> 
> Quoting Sagar Kadam (2020-09-10 03:44:02)
> > diff --git
> > a/Documentation/devicetree/bindings/clock/sifive/fu540-prci.yaml
> > b/Documentation/devicetree/bindings/clock/sifive/fu540-prci.yaml
> > new file mode 100644
> > index 0000000..49386cd
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/sifive/fu540-prci.yaml
> > @@ -0,0 +1,75 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) # Copyright
> > +(C) 2020 SiFive, Inc.
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/clock/sifive/fu540-prci.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: SiFive FU540 Power Reset Clock Interrupt Controller (PRCI)
> > +
> > +maintainers:
> > +  - Sagar Kadam <sagar.kadam@sifive.com>
> > +  - Paul Walmsley  <paul.walmsley@sifive.com>
> > +
> > +description:
> > +  On the FU540 family of SoCs, most system-wide clock and reset
> > +integration
> > +  is via the PRCI IP block.
> > +  The clock consumer should specify the desired clock via the clock
> > +ID
> > +  macros defined in include/dt-bindings/clock/sifive-fu540-prci.h.
> > +  These macros begin with PRCI_CLK_.
> > +
> > +  The hfclk and rtcclk nodes are required, and represent physical
> > + crystals or resonators located on the PCB.  These nodes should be
> > + present  underneath /, rather than /soc.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - sifive,fu540-c000-prci
> > +    description:
> > +      Should have "sifive,<soc>-prci", only one value is supported
> 
> Drop description and have
> 
>     compatible:
>       const: sifive,fu540-c000-prci
> 
Thank you for suggestion here, I will remove this.
> > +
> > +  reg:
> > +    maxItems: 1
> > +    description: Describe the PRCI's register target physical address
> > + region
> 
> Drop description.
> 
Okay.
> > +
> > +  clocks:
> > +    description:
> > +      Should point to the hfclk device tree node and the rtcclk device tree
> node.
> 
> s/device tree node//g

Okay, will remove these.

> 
> > +      The RTC clock here is not a time-of-day clock, but is instead a high-
> stability
> > +      clock source for system timers and cycle counters.
> 
> Better to have:
> 
>     clocks:
>       items:
>         - const: high frequency clock
>         - const: RTC clock
> 
> Can you add clock-names too? Making it optional is OK.
Okay, I will include these optional properties as
            -const: "hfclk"
            -const: "rtcclk"
> 
> > +  "#clock-cells":
> > +    const: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - "#clock-cells"
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    //hfclk and rtcclk present under /, in PCB-specific DT data
> > +    hfclk: hfclk {
> > +      #clock-cells = <0>;
> > +      compatible = "fixed-clock";
> > +      clock-frequency = <33333333>;
> > +      clock-output-names = "hfclk";
> > +    };
> 
> Add a newline here?
> 
Okay.
> > +    rtcclk: rtcclk {
> > +      #clock-cells = <0>;
> > +      compatible = "fixed-clock";
> > +      clock-frequency = <1000000>;
> > +      clock-output-names = "rtcclk";
> > +    };
> 
> These may not be necessary either, just have the clock-controller node
> reference phandles?
> 
Okay.
> > +
> > +    //under /soc, in SoC-specific DT data
> 
> Don't think this comment is necessary.
> 
Okay.

Thanks & BR,
Sagar

> > +    prci: clock-controller@10000000 {
> > +      compatible = "sifive,fu540-c000-prci";
> > +      reg = <0x10000000 0x1000>;
> > +      clocks = <&hfclk>, <&rtcclk>;
> > +      #clock-cells = <1>;
> > +    };
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
