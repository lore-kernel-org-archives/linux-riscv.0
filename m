Return-Path: <SRS0=wFsd=DO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96862C4363C
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Oct 2020 03:38:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9ACA208C3
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Oct 2020 03:38:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RGvbnOtK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=osportal.onmicrosoft.com header.i=@osportal.onmicrosoft.com header.b="ZENTqp38"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9ACA208C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=openfive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xk2TpXjf/0thigJB9ok5sbqgN+QFesmJfZFkrOao2uo=; b=RGvbnOtKicO4Pg67/75oqneil
	+LUzA1mQl9q34OqeXxECMilVttxv57z72pEo+5eTJH+RkGDubZs6BykkOVNbwvnmBYU5RtI8h6Ix0
	qbizGuRoyGhdQcE0Lj1b3x3VQYs+HwMu1fEGcjfm+RGvDbtUonc5rX1xvK74gjjCWV5GNFp39FILu
	gyonjAx6DUpUcLuMbgo/iqlthp4LO5IxN5MMWWNeMPWtBemuoWg6A0sJMAd+qH8geCv8Y2fcyDwtu
	aIB73vNHp6SoKYCchC+pnp5XLTy48sMGJqNKbxh0GRwt4JsR9ZFMF9oM/duJcLo78eyFU47au0OIu
	OK+BjpW7w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQ0Hs-000809-NQ; Wed, 07 Oct 2020 03:38:44 +0000
Received: from mail-eopbgr770042.outbound.protection.outlook.com
 ([40.107.77.42] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQ0Hp-0007zU-0s
 for linux-riscv@lists.infradead.org; Wed, 07 Oct 2020 03:38:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PPjIw77wqA6rQ7r42kqtrsuvJ8WJLwIXQKJb01eEvn6gH998YlBd69QOrZmOqi9derUfijGSDnsKdj7OxI3liyxv9H2OdMHzBTerpdefeHClwjX2VM/sPAnv0vTrh0lUZ57AY3PV+DHq+dHHyprJH6UnNWVhjggHsX9qZdnXrnjb+nvFPldDzc24jdosf48FwbAu3GVGHcepPE6WV9R7GierOd5ZZwejcIj78XDQbNEdkGi/49YskKKJZ/1a12R2CNjxuWI7dGOrYS5R6qJMqv7ZPMVHA3hDsIrzZZyGnALDtcyuopdtBhwq2gR0602ThtineIA434WtpkreaB/7gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TmdJXpH+QuLU3HRTbQ5xGn0KmliMiR+6xZpCscNTlH8=;
 b=A/uNAlrAJjyT+HinOFdtse+u3iEDZO3L6XjTaytqNt5mOF3wKQlsxa4/a/6aTVrvqtbZ5Q56A+ccRI+uRUWMjt8UEHi1BDMfxQB3OYbBV2WI4h28p+52XyZEnNoYhTCKmHKZIZES+qHqSpTBQ6M+XLq5v8gf+WuTngLOTdwBeaFVdPujki1g3YmStxgmGZRLU1CM1lKVMc1KwsslrEOv/DnpmYKyDWG8Lvkj7jVT+9pTZYql8aQBcLbYgHZ0DnBZMVPk9a7K18c7IbSU/T4jx74Cn9dBEPA2x8HDK0MJzorCq3qgh/iY3TC0yY88C5sRxNQMB/uNQPdkIl7oyKk0pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=openfive.com;
 dkim=pass header.d=openfive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=osportal.onmicrosoft.com; s=selector2-osportal-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TmdJXpH+QuLU3HRTbQ5xGn0KmliMiR+6xZpCscNTlH8=;
 b=ZENTqp384Hj5gqA1fdUsOhtnmdnZKP7D7/NaT77ARuVp7B08Gkg04fD/+NaF4LlCck4QxMp7ISC+t+TTN16B/CDK7PoeSrA59Ll3ncpcPshedIPcMX5i5gDxAo4wmXviFEDCHO9K4vQRbqSV5zC6QxIcYnIdjBRCDLCBta9uts8=
Received: from DM6PR13MB3451.namprd13.prod.outlook.com (2603:10b6:5:1c3::10)
 by DM6PR13MB2524.namprd13.prod.outlook.com (2603:10b6:5:ca::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.13; Wed, 7 Oct
 2020 03:38:32 +0000
Received: from DM6PR13MB3451.namprd13.prod.outlook.com
 ([fe80::a48a:1f7c:267c:876]) by DM6PR13MB3451.namprd13.prod.outlook.com
 ([fe80::a48a:1f7c:267c:876%7]) with mapi id 15.20.3455.021; Wed, 7 Oct 2020
 03:38:32 +0000
From: Sagar Kadam <sagar.kadam@openfive.com>
To: Rob Herring <robh@kernel.org>
Subject: RE: [PATCH v2 1/3] dt-bindings: fu540: prci: convert PRCI bindings to
 json-schema
Thread-Topic: [PATCH v2 1/3] dt-bindings: fu540: prci: convert PRCI bindings
 to json-schema
Thread-Index: AQHWlnXeXXLTxHlPR0agfuqgQBIFramK9AgAgACUlnA=
Date: Wed, 7 Oct 2020 03:38:32 +0000
Message-ID: <DM6PR13MB345196DCD0894CD0C77DCFC6970A0@DM6PR13MB3451.namprd13.prod.outlook.com>
References: <1601393531-2402-1-git-send-email-sagar.kadam@sifive.com>
 <1601393531-2402-2-git-send-email-sagar.kadam@sifive.com>
 <20201006184244.GA2610231@bogus>
In-Reply-To: <20201006184244.GA2610231@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=openfive.com;
x-originating-ip: [116.74.151.16]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7169d408-cc5a-414e-c4a0-08d86a7276fe
x-ms-traffictypediagnostic: DM6PR13MB2524:
x-ld-processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR13MB25244DF2231D452805E983E3970A0@DM6PR13MB2524.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1332;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HbY5C1zHFTvz2Gnra3wtAI5JFk/PUuogKW6aGdLPb2XqJDgRWNyn8qv+iGKISelPODXvRsHghE7oud5GSpjvDF+TY9HCVg+QR6sEv5xwNoBsjya9hGDhFhsgUdCNjVDwqpuxvxFU0FvJr99DphWuKj0HdP6rmb8FmNsEz8E5Q6tPJoV8FOP5mH6mVlNmeFGluhg1VHL77ykaFV6pwzLbjevSZAAY+IQUJJWPqXR5TF0IK9+c6H9JSA8sARpqNtN9gKNGH27RQ2cFqp8V9dxos25cc4vhZN2TCM6gLpZPTp4qSkqE346+3M2AEbylua0hAncHkdlwdzcdehTiD4ENKQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR13MB3451.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(346002)(396003)(366004)(136003)(39850400004)(8676002)(7696005)(4326008)(86362001)(478600001)(44832011)(26005)(55236004)(6506007)(53546011)(33656002)(186003)(9686003)(64756008)(8936002)(66446008)(55016002)(316002)(71200400001)(6916009)(54906003)(52536014)(5660300002)(66556008)(66476007)(7416002)(2906002)(66946007)(83380400001)(76116006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: nby6Dx2z2LLxqwlFCU7sknVZUM4Hc1gOPxs5KAHXVt/09QOK4C9sl7HKBM1sRZwIuYJCimwJQZK6tHzdPDZO5b3A7GPf/pNh/xd+4CPxAC6zgf9Q77De1oDn43qnN1q4qLUCgOlXjpGrkGoHAfz3p6JPiGY96XLig9Hn1iZYkREpj/R8b9XGfyFn5Qf0YlZ68kBHNM6wZsRZoO3bzqLqeCCPtn+dEzSYLzLPrKahtHMfffW4ulzq1gc3+0OEgpTpnkT4Oy/PzGmWvft7XK7z3yWrfiR8Rt/DA8k19Fz4C466I5DsM5fU+EusCfq9q6bnLvXHne4ElFSXPcCHKWRHyfqH2wnpvKgaK5IHp3N6B8sobyRN1u5To0BJ9phGGlInDkLkaf+p/kikR2xuHt2g5dtIXnVzmC32c2QODfXvNtACFj/2Yd7qljxH0zVlIMmXkauDN5UN6ISTkR2QSFhfLf0JY07aImQo0DaD9TbHhGqI1UG6KFrRvPEtOXbzYJGk7DY1HyXEpQ3nS/yP/PuFTBWB4JmcTR2BLn+n66tMLAK01NGau2vCcHgK6Jm8OjCO28XnFq4/i+ewR+b0bR0YmvGbnPY6dnKmIsFRPmWiyMTxQ5EcPobY3rx2wWCoyBuG/WQipqQUcx1lW/nVExP+fQ==
MIME-Version: 1.0
X-OriginatorOrg: openfive.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR13MB3451.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7169d408-cc5a-414e-c4a0-08d86a7276fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2020 03:38:32.4361 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lX4sV84yOcFmF7Fx9F5sCnrQcCK6nSghDpmgUrOR42fApFl6MlJqVRVxeIhDGGc6Y36NVBHn47MSbhShQp80nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR13MB2524
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_233841_072549_B2F9A90C 
X-CRM114-Status: GOOD (  13.13  )
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
 "jason@lakedaemon.net" <jason@lakedaemon.net>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "sboyd@kernel.org" <sboyd@kernel.org>, "maz@kernel.org" <maz@kernel.org>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "Paul Walmsley \( Sifive\)" <paul.walmsley@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Yash Shah <yash.shah@openfive.com>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Wednesday, October 7, 2020 12:13 AM
> To: Sagar Kadam <sagar.kadam@openfive.com>
> Cc: aou@eecs.berkeley.edu; linux-riscv@lists.infradead.org;
> tglx@linutronix.de; linux-pwm@vger.kernel.org; palmer@dabbelt.com;
> jason@lakedaemon.net; Yash Shah <yash.shah@openfive.com>;
> thierry.reding@gmail.com; lee.jones@linaro.org; u.kleine-
> koenig@pengutronix.de; robh+dt@kernel.org; Paul Walmsley ( Sifive)
> <paul.walmsley@sifive.com>; linux-kernel@vger.kernel.org; linux-
> clk@vger.kernel.org; maz@kernel.org; mturquette@baylibre.com;
> devicetree@vger.kernel.org; sboyd@kernel.org
> Subject: Re: [PATCH v2 1/3] dt-bindings: fu540: prci: convert PRCI bindings to
> json-schema
> 
> [External Email] Do not click links or attachments unless you recognize the
> sender and know the content is safe
> 
> On Tue, 29 Sep 2020 21:02:09 +0530, Sagar Kadam wrote:
> > FU540-C000 SoC from SiFive has a PRCI block, here we convert the
> > device tree bindings from txt to YAML.
> >
> > Signed-off-by: Sagar Kadam <sagar.kadam@sifive.com>
> > ---
> >  .../bindings/clock/sifive/fu540-prci.txt           | 46 -----------------
> >  .../bindings/clock/sifive/fu540-prci.yaml          | 60
> ++++++++++++++++++++++
> >  2 files changed, 60 insertions(+), 46 deletions(-)  delete mode
> > 100644 Documentation/devicetree/bindings/clock/sifive/fu540-prci.txt
> >  create mode 100644
> > Documentation/devicetree/bindings/clock/sifive/fu540-prci.yaml
> >
> 
> Applied, thanks!

Thanks Rob for applying these patches.

BR,
Sagar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
