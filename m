Return-Path: <SRS0=huAv=DA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EA2EC2D0A8
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2020 17:34:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92FC82053B
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2020 17:34:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o7k5zSQP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=osportal.onmicrosoft.com header.i=@osportal.onmicrosoft.com header.b="iHX1S7dn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92FC82053B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=openfive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jlU5LPZwo0b0lcp6wiaJ2b/xnXKP5CHMsoIWo3ym2to=; b=o7k5zSQPwStOgSix6wPnOC5iE
	SIhIUefdXi+p1Qgc7I5bu1R4zTWIrlx/G+ZXvkKNyjWJXvM/+nHhr0WoFXmgnZjvQ+q6WCBZwhvda
	SbaBuJtwOFbiIgPd5ZbVaiV/pl0kzEWfb+wIJWGlRNfhu1Ukn1pgP1fh8kiH/Ub/3jn/JoZqcY8WZ
	GCd8BcDCQLb+sh5DvmEgXS6+9cfnyQ2XWz2e4uSEmG3NsJOJAG/gAJo6pxqEAeKNz81mTxH5A8fhF
	HIwyBVodM06LOHphUEkOLl3jAcEOkvWfPIDjC+JPqReLUbfa6jRWNPoxMt0Zep3d+WJr7FZA7jGsW
	jGK9vzr4A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kL8eI-0003VA-C9; Wed, 23 Sep 2020 17:33:46 +0000
Received: from mail-dm6nam10on2044.outbound.protection.outlook.com
 ([40.107.93.44] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kL8eG-0003Ua-0i
 for linux-riscv@lists.infradead.org; Wed, 23 Sep 2020 17:33:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R+Bpu01WgwY8rUVObR7whTusuj5wQckdiOWZIN971E1V9F3+bpwJf2vyk3IESA0OeGRqcO0SA4NN0ytAwi54FPEtyd86DMOL9Wk8urSBoFQElNOjQDtvOl0ArZApuCpKu08U4nvlkviN6b+3ZphpomdaIwAwYSlx7sDLvepDPhIGUeLV59Vgk9/aIPtDLRvNNViqQd9bpCTdvHO6yCE5Bu4CWTov+O1/nPahxqujvPaaRsb/UzgXaGbLiPNjvWtrhsXGI0mwrVT80KBS9itToRD2W3fR56o+XobtfCiCSYC/QDtNVNVx4PzF2cB/DMkhqcoUuhLkoQ80GaZY2nEK3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I/H2H0L+opiMM37vu+W7lTjPIbZHyyxil5b1uIRjgcM=;
 b=dFIrWl5ReVHi3zs5F3yv4bkmNf4e4VxWGrKIrLlqZ4/r2wGb3VuQVMjtwLd457bkys5XipF6HnmSJTpoVeqB89BuGULVOChhDBjoj/eyo40LwcHG96ZBW5yqCEFKrIFuCgcclrcxvoGjhLVUs0hJS8yHgE8b3ZTj8VGDH69Ncff5u+AuaZ5+O5JfyxFolKv1eCyMJFrZreMolVDN+BLo7tAmgSvseuE0DGpmb0w5w5Po6VEKwHVVvystNUGF5wprQQvF+4SZu51fbC+/8C4hClWQjX5mb08kX9qETjf15t6Qqhm2VXK3DlkRyLr5gK1N3id1zlWi6HbJyOLOt385/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=openfive.com;
 dkim=pass header.d=openfive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=osportal.onmicrosoft.com; s=selector2-osportal-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I/H2H0L+opiMM37vu+W7lTjPIbZHyyxil5b1uIRjgcM=;
 b=iHX1S7dnd3LWEJowrqxkz53Mzal6u4vHuiBov330H5VAQSUIPTbfAsMPNk0+g08qvmah1d8xF5EMJcFYcw6hyGr0tYvpUrN+rj+pe+TQhDYJQrwig3huDQ53b1z55JiEsWRP1wHfoPtFmUVWekQsW9rkmsePkIJKXeZEElh2O/0=
Received: from DM6PR13MB3451.namprd13.prod.outlook.com (2603:10b6:5:1c3::10)
 by DM6PR13MB2362.namprd13.prod.outlook.com (2603:10b6:5:bd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.8; Wed, 23 Sep
 2020 17:33:35 +0000
Received: from DM6PR13MB3451.namprd13.prod.outlook.com
 ([fe80::a48a:1f7c:267c:876]) by DM6PR13MB3451.namprd13.prod.outlook.com
 ([fe80::a48a:1f7c:267c:876%7]) with mapi id 15.20.3433.013; Wed, 23 Sep 2020
 17:33:35 +0000
From: Sagar Kadam <sagar.kadam@openfive.com>
To: Rob Herring <robh@kernel.org>
Subject: RE: [PATCH v1 2/3] dt-bindings: riscv: convert plic bindings to
 json-schema
Thread-Topic: [PATCH v1 2/3] dt-bindings: riscv: convert plic bindings to
 json-schema
Thread-Index: AQHWh19i+MNhYtLbO0WaWaqZxwh8y6l1MMuAgAElMQA=
Date: Wed, 23 Sep 2020 17:33:35 +0000
Message-ID: <DM6PR13MB34519BC4A72557B58445FDF697380@DM6PR13MB3451.namprd13.prod.outlook.com>
References: <1599734644-4791-1-git-send-email-sagar.kadam@sifive.com>
 <1599734644-4791-3-git-send-email-sagar.kadam@sifive.com>
 <20200922203429.GA3188204@bogus>
In-Reply-To: <20200922203429.GA3188204@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=openfive.com;
x-originating-ip: [116.74.150.171]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ba9eb04b-18c0-4654-26f6-08d85fe6ccfe
x-ms-traffictypediagnostic: DM6PR13MB2362:
x-ld-processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR13MB2362C7360313494252C15EA797380@DM6PR13MB2362.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ijp7K2LJg3ThgJ5nGgjea3ayuaRBkSRGF8ndc0flantKclD3WS58JZ60CVxmrEJgSz33Zxo38P2OiJRCoGfIFTRNurNEJpOBIMH6rSIMdqlZlH22NLQUOgAHiROSTSXu29cQzKB66FREuvVCh/c0O2ZxWwRFZ1FeuTa5QSOnsJFJPl1WS3HRsKhokUfzVb+P7qpj9EYy141mQuEe85iI//IcNmM0X/JLro5FSQKzYuxoGGNRbOiLYYdwt0flyd+SoAFZKXF/wpIXF9RUgQb+PYiqQsewdTg29EnbWa0smwbIgi/0PJtEKU5keYcK5gGFHPQC2QigMI2/D7DHz2BNY+bOQZQ7S++QimYgkP646RBT8vq3InQx96AyB6tRrpLsxc6riBVufo2l5eI2BOzSWQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR13MB3451.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(366004)(396003)(39850400004)(136003)(5660300002)(8676002)(966005)(6916009)(107886003)(86362001)(4326008)(9686003)(8936002)(55016002)(7416002)(64756008)(76116006)(33656002)(52536014)(66946007)(66556008)(66446008)(66476007)(71200400001)(83380400001)(316002)(54906003)(44832011)(55236004)(53546011)(6506007)(186003)(7696005)(2906002)(26005)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: zVa4RRNsGG2Rnep8G4ePhc5cPfoQb2ky96ezL2r5Rg7T1GGH3K0BIvpjVw4Ny4tTNrs7PPoT4zJY9/zgrXjccHZ1pS25Vlmn8ffX5Uvcao+D8/MZVRQr8NRDUw0AwWqN3L67mpT5mQzv8D8+ECbIpzNgwgx7Iij8zfX/bkkZ7U6GCSrg1LVPqPKwJzLk8Lo5yXaObKflrMjY7yHI/+sqbIHTkGE0ALL9NwejLiptV3AlcgDxCdBhv0SsN4sHxyqCY5sdk2h3XThJ7VPqBc1su1Itkcf2DRp2c+XtPe/qNjf4wCQDBaBN3SLv1WV/oYuJGYhW4G/puKVP0PYwbVsjxTE5GGvkI+06pwvf8oBQskM5y6ROMAd63D84m4jp7JHak9OypFxVnAZ8DOaOrU9eCVe+sFC7jJXa1+zdE2p2rlqNEtZMaixKW2Ha9f3dHZUIhwh177n+zr2xfPGFvRwit+HV7B4ubteN1VxCO/6Bsvm646XsxMvKiigcTKgqdAyNk6HEdPHSqPs4dNDsU+5cHLzYwag1HR3HNcUWOi81xuVIRVbwE8JNhp1PBaN5aQF6NeuY4Ova4O4xNuPujFnsvxlPYwdT8Er9f0Yz2kbI8/l8OH+OsmDMITx0Qis9AVIz6P9BFxp7PYyjQ/dTXSLuHg==
MIME-Version: 1.0
X-OriginatorOrg: openfive.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR13MB3451.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba9eb04b-18c0-4654-26f6-08d85fe6ccfe
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2020 17:33:35.8640 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TwngPV8XtiqI06j8AFlav0eO/4yOjk0moSkOQZX6Kx5/6PEC/udhpjXtoqytq6Rt59zsh3x5Wk8cSZeEyskWAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR13MB2362
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200923_133344_100699_81F62ED5 
X-CRM114-Status: GOOD (  33.03  )
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
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "jason@lakedaemon.net" <jason@lakedaemon.net>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "sboyd@kernel.org" <sboyd@kernel.org>, "maz@kernel.org" <maz@kernel.org>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yash Shah <yash.shah@openfive.com>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "Paul Walmsley \( Sifive\)" <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hello Rob,

> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Wednesday, September 23, 2020 2:04 AM
> To: Sagar Kadam <sagar.kadam@openfive.com>
> Cc: linux-pwm@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
> riscv@lists.infradead.org; devicetree@vger.kernel.org; linux-
> clk@vger.kernel.org; mturquette@baylibre.com; sboyd@kernel.org; Paul
> Walmsley ( Sifive) <paul.walmsley@sifive.com>; palmer@dabbelt.com;
> tglx@linutronix.de; jason@lakedaemon.net; maz@kernel.org;
> thierry.reding@gmail.com; u.kleine-koenig@pengutronix.de;
> lee.jones@linaro.org; aou@eecs.berkeley.edu; Yash Shah
> <yash.shah@openfive.com>
> Subject: Re: [PATCH v1 2/3] dt-bindings: riscv: convert plic bindings to json-
> schema
> 
> [External Email] Do not click links or attachments unless you recognize the
> sender and know the content is safe
> 
> On Thu, Sep 10, 2020 at 04:14:03PM +0530, Sagar Kadam wrote:
> > Convert device tree bindings for SiFive's PLIC to YAML format
> >
> > Signed-off-by: Sagar Kadam <sagar.kadam@sifive.com>
> > ---
> >  .../interrupt-controller/sifive,plic-1.0.0.txt     |  58 -----------
> >  .../interrupt-controller/sifive,plic-1.0.0.yaml    | 107
> +++++++++++++++++++++
> >  2 files changed, 107 insertions(+), 58 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/interrupt-
> controller/sifive,plic-1.0.0.txt
> >  create mode 100644 Documentation/devicetree/bindings/interrupt-
> controller/sifive,plic-1.0.0.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/interrupt-
> controller/sifive,plic-1.0.0.txt
> b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-
> 1.0.0.txt
> > deleted file mode 100644
> > index 6adf7a6..0000000
> > --- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-
> 1.0.0.txt
> > +++ /dev/null
> > @@ -1,58 +0,0 @@
> > -SiFive Platform-Level Interrupt Controller (PLIC)
> > --------------------------------------------------
> > -
> > -SiFive SOCs include an implementation of the Platform-Level Interrupt
> Controller
> > -(PLIC) high-level specification in the RISC-V Privileged Architecture
> > -specification.  The PLIC connects all external interrupts in the system to all
> > -hart contexts in the system, via the external interrupt source in each hart.
> > -
> > -A hart context is a privilege mode in a hardware execution thread.  For
> example,
> > -in an 4 core system with 2-way SMT, you have 8 harts and probably at
> least two
> > -privilege modes per hart; machine mode and supervisor mode.
> > -
> > -Each interrupt can be enabled on per-context basis.  Any context can claim
> > -a pending enabled interrupt and then release it once it has been handled.
> > -
> > -Each interrupt has a configurable priority.  Higher priority interrupts are
> > -serviced first.  Each context can specify a priority threshold. Interrupts
> > -with priority below this threshold will not cause the PLIC to raise its
> > -interrupt line leading to the context.
> > -
> > -While the PLIC supports both edge-triggered and level-triggered interrupts,
> > -interrupt handlers are oblivious to this distinction and therefore it is not
> > -specified in the PLIC device-tree binding.
> > -
> > -While the RISC-V ISA doesn't specify a memory layout for the PLIC, the
> > -"sifive,plic-1.0.0" device is a concrete implementation of the PLIC that
> > -contains a specific memory layout, which is documented in chapter 8 of
> the
> > -SiFive U5 Coreplex Series Manual <https://static.dev.sifive.com/U54-MC-
> RVCoreIP.pdf>.
> > -
> > -Required properties:
> > -- compatible : "sifive,plic-1.0.0" and a string identifying the actual
> > -  detailed implementation in case that specific bugs need to be worked
> around.
> > -- #address-cells : should be <0> or more.
> > -- #interrupt-cells : should be <1> or more.
> > -- interrupt-controller : Identifies the node as an interrupt controller.
> > -- reg : Should contain 1 register range (address and length).
> > -- interrupts-extended : Specifies which contexts are connected to the PLIC,
> > -  with "-1" specifying that a context is not present.  Each node pointed
> > -  to should be a riscv,cpu-intc node, which has a riscv node as parent.
> > -- riscv,ndev: Specifies how many external interrupts are supported by
> > -  this controller.
> > -
> > -Example:
> > -
> > -     plic: interrupt-controller@c000000 {
> > -             #address-cells = <0>;
> > -             #interrupt-cells = <1>;
> > -             compatible = "sifive,plic-1.0.0", "sifive,fu540-c000-plic";
> > -             interrupt-controller;
> > -             interrupts-extended = <
> > -                     &cpu0-intc 11
> > -                     &cpu1-intc 11 &cpu1-intc 9
> > -                     &cpu2-intc 11 &cpu2-intc 9
> > -                     &cpu3-intc 11 &cpu3-intc 9
> > -                     &cpu4-intc 11 &cpu4-intc 9>;
> > -             reg = <0xc000000 0x4000000>;
> > -             riscv,ndev = <10>;
> > -     };
> > diff --git a/Documentation/devicetree/bindings/interrupt-
> controller/sifive,plic-1.0.0.yaml
> b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-
> 1.0.0.yaml
> > new file mode 100644
> > index 0000000..95c8c85
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-
> 1.0.0.yaml
> > @@ -0,0 +1,107 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +# Copyright (C) 2020 SiFive, Inc.
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/interrupt-controller/sifive,plic-
> 1.0.0.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: SiFive Platform-Level Interrupt Controller (PLIC)
> > +
> > +description:
> > +  SiFive SOCs include an implementation of the Platform-Level Interrupt
> Controller
> > +  (PLIC) high-level specification in the RISC-V Privileged Architecture
> > +  specification. The PLIC connects all external interrupts in the system to all
> > +  hart contexts in the system, via the external interrupt source in each
> hart.
> > +
> > +  A hart context is a privilege mode in a hardware execution thread. For
> example,
> > +  in an 4 core system with 2-way SMT, you have 8 harts and probably at
> least two
> > +  privilege modes per hart; machine mode and supervisor mode.
> > +
> > +  Each interrupt can be enabled on per-context basis. Any context can
> claim
> > +  a pending enabled interrupt and then release it once it has been
> handled.
> > +
> > +  Each interrupt has a configurable priority. Higher priority interrupts are
> > +  serviced first.  Each context can specify a priority threshold. Interrupts
> > +  with priority below this threshold will not cause the PLIC to raise its
> > +  interrupt line leading to the context.
> > +
> > +  While the PLIC supports both edge-triggered and level-triggered
> interrupts,
> > +  interrupt handlers are oblivious to this distinction and therefore it is not
> > +  specified in the PLIC device-tree binding.
> > +
> > +  While the RISC-V ISA doesn't specify a memory layout for the PLIC, the
> > +  "sifive,plic-1.0.0" device is a concrete implementation of the PLIC that
> > +  contains a specific memory layout, which is documented in chapter 8 of
> the
> > +  SiFive U5 Coreplex Series Manual <https://static.dev.sifive.com/U54-MC-
> RVCoreIP.pdf>.
> > +
> > +maintainers:
> > +  - Sagar Kadam <sagar.kadam@sifive.com>
> > +  - Paul Walmsley  <paul.walmsley@sifive.com>
> > +  - Palmer Dabbelt <palmer@dabbelt.com>
> > +
> > +allOf:
> > +  - $ref: /schemas/interrupt-controller.yaml#
> 
> Don't need this. It gets selected matching on node name.
> 
Thanks for your suggestions. I will incorporate your suggestions and send the v2.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: sifive,plic-1.0.0
> > +      - const: sifive,fu540-c000-plic
> 
> Somehow these ended up in the wrong order. Should be most specific to
> least specific.
> 
Yes, will rectify this.
> > +
> > +    description:
> > +      Should be "sifive,plic-1.0.0" and a string identifying the actual
> > +      detailed implementation in case that specific bugs need to be worked
> around.
> 
> Drop this.
> 
> > +
> > +  reg:
> > +    maxItems: 1
> > +    description:  Should contain 1 register range (address and length).
> 
> Drop this. The schema says this...
> 
> > +
> > +  '#address-cells':
> > +    const: 0
> > +    description: Should be <0> or more.
> 
> Drop. 'or more' is wrong. If there's a case with more, it will need to
> be documented.
> 
> > +
> > +  '#interrupt-cells':
> > +    const: 1
> > +    description: Should be <1> or more.
> 
> Same here.
> 
Okay. 
Will remove as suggested above

Thanks & BR,
Sagar

> > +
> > +  interrupt-controller: true
> > +
> > +  interrupts-extended:
> > +    minItems: 1
> > +    description:
> > +      Specifies which contexts are connected to the PLIC, with "-1" specifying
> > +      that a context is not present. Each node pointed to should be a
> > +      riscv,cpu-intc node, which has a riscv node as parent.
> > +
> > +  riscv,ndev:
> > +    $ref: "/schemas/types.yaml#/definitions/uint32"
> > +    description:
> > +      Specifies how many external interrupts are supported by this
> controller.
> > +
> > +required:
> > +  - compatible
> > +  - '#address-cells'
> > +  - '#interrupt-cells'
> > +  - interrupt-controller
> > +  - reg
> > +  - interrupts-extended
> > +  - riscv,ndev
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    plic: interrupt-controller@c000000 {
> > +      #address-cells = <0>;
> > +      #interrupt-cells = <1>;
> > +      compatible = "sifive,plic-1.0.0", "sifive,fu540-c000-plic";
> > +      interrupt-controller;
> > +      interrupts-extended = <
> > +        &cpu0_intc 11
> > +        &cpu1_intc 11 &cpu1_intc 9
> > +        &cpu2_intc 11 &cpu2_intc 9
> > +        &cpu3_intc 11 &cpu3_intc 9
> > +        &cpu4_intc 11 &cpu4_intc 9>;
> > +      reg = <0xc000000 0x4000000>;
> > +      riscv,ndev = <10>;
> > +    };
> > --
> > 2.7.4
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
