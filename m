Return-Path: <SRS0=kFy7=CD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AAA7C433E1
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2020 16:42:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18B38207F7
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2020 16:42:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QER42Fuy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=osportal.onmicrosoft.com header.i=@osportal.onmicrosoft.com header.b="Bej8Rv3F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18B38207F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=openfive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rXNGHIulFo4j4yiuaUClea2JGvkGo+WNKau8qpJjdAE=; b=QER42Fuytw++TIscf7WVxTo/O
	PSIFl2LR5as0cwSPljwVRXmxJpKN8s1LUOAgbk+gCPmf0VJffI54Q/uTC7wIa2XBUVKpcnW9ZofaB
	QQ9PSWG3Baj7ytUjB8OauR51gAytbeg+RDqJG6PC29mSRLpg0viv5ILjLuAQSnTpsrC9ywk31bVfu
	pB+TuvO6G8qTw68uZqzZqy6EKeUII7E2FhwP5mnimhM1Sq2U6Sm5PWacXFoe6dirL4ZpqbZ2I0BPU
	3bugxQJGSw34IPIXgg8N4mNpxWS+NWD3C7BGScEJsJmsG0vF6XZzOAFbwJzfmNcZf6nTb5mLNt4zO
	d5NnmlaIw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAc1F-0007XC-T7; Tue, 25 Aug 2020 16:41:57 +0000
Received: from mail-co1nam11on2069.outbound.protection.outlook.com
 ([40.107.220.69] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAc1C-0007WU-PV
 for linux-riscv@lists.infradead.org; Tue, 25 Aug 2020 16:41:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OHkb1MYgpFiK/wdp/zrdfiT2pKz8oj3AWINYCfJk1Rqu9J5Xq6bW+ng68BWoqnWGlEa8cTUt6rO/zNbVJRlzkmM4yp3Caz8PuYsGLGPMmAN37mMSVGIzJMZJz4UDRTQv+BIzEM9x7kPfSCnVkJOSCsvyVjhOKMZiRfvp5zYXkpVGSDBIa2yJ+3qGvxE7y2nmgjJEvi0tIo4Ym9ClYjt2Z3EW9RETQC20Xb7bDggIJR38Vn3bsezvfLa+/Li+93L/T1RAo1b7oS4khAVRHpXd/laVvvRDASafTOo+8WMaOQA6JAD5QAlTYiZ/qW0m/lXLiC+YQYLD4ZEO7SI+0FabYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AGJ3qj0AdicAXz80DBZOO08NI4PFKjgtEE9nM3/hRUA=;
 b=Mf2rmv5Z+OWFn/2eJm33zVaEokNiwWij5iqnouEPS/0ivh8C7H4Im2Buj6QBzbmLJ6DM30Zwmw3kVTz375M4Bpl9+2f52QloZpoSSaJ7MSuUjlwJkiq79ZjFFSdguiAvl7zR+iev6usRIK2z0ZkKqKH59GHD55B3z6/DeHvu18V+Zan2u+lw/w08U+JEcs2TGlXwjN85Ln+vpa87ud43Hd6D6hXArUKZdCi0nWNHPPDmPEpZM98LMpgVr4fyfXp4oWV0xkhawl/QUCr1FILc6/fkE3HB0hKuqJGNEpIoSyHFKUjXj4NSch1Nvlq70Kniljv+tOnQEd5ewk9DJUhfEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=openfive.com;
 dkim=pass header.d=openfive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=osportal.onmicrosoft.com; s=selector2-osportal-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AGJ3qj0AdicAXz80DBZOO08NI4PFKjgtEE9nM3/hRUA=;
 b=Bej8Rv3FAVQ0IIVUTkFWzKGgf9kH7xb93YySj4zYgpjADTuCKnhPlHf7wJFwAPjPjQalC37NqjdcoF07erVBpx/V92d6tAeUR2vNQiHSKYhEFlz3qjO5eRof50JYwhNx8lscuxBlf9pYe2nzO+sIEkDWd10ualLpCzKzG9LShiI=
Received: from DM6PR13MB3451.namprd13.prod.outlook.com (2603:10b6:5:1c3::10)
 by DM5PR13MB1420.namprd13.prod.outlook.com (2603:10b6:3:11c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.10; Tue, 25 Aug
 2020 16:41:51 +0000
Received: from DM6PR13MB3451.namprd13.prod.outlook.com
 ([fe80::f570:90c6:f6d5:c078]) by DM6PR13MB3451.namprd13.prod.outlook.com
 ([fe80::f570:90c6:f6d5:c078%7]) with mapi id 15.20.3326.019; Tue, 25 Aug 2020
 16:41:51 +0000
From: Sagar Kadam <sagar.kadam@openfive.com>
To: Rob Herring <robh@kernel.org>
Subject: RE: [PATCH 1/1] dt-bindings: riscv: sifive-l2-cache: convert bindings
 to json-schema
Thread-Topic: [PATCH 1/1] dt-bindings: riscv: sifive-l2-cache: convert
 bindings to json-schema
Thread-Index: AQHWeetFYcQYSaG/+EK5zgQ5BKIJhalHhiCAgADfjACAAJ3xgIAAAzDA
Date: Tue, 25 Aug 2020 16:41:51 +0000
Message-ID: <DM6PR13MB3451470F2D9FC2C87317C4EB97570@DM6PR13MB3451.namprd13.prod.outlook.com>
References: <1598255421-8274-1-git-send-email-sagar.kadam@sifive.com>
 <1598255421-8274-2-git-send-email-sagar.kadam@sifive.com>
 <20200824173539.GA2939042@bogus>
 <DM6PR13MB3451089239FDA8F87BA6410497570@DM6PR13MB3451.namprd13.prod.outlook.com>
 <CAL_Jsq+AfvgpXDt4vQmg2UcV7ARYKPw6hxJvuLotJH5xApz6cw@mail.gmail.com>
In-Reply-To: <CAL_Jsq+AfvgpXDt4vQmg2UcV7ARYKPw6hxJvuLotJH5xApz6cw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=openfive.com;
x-originating-ip: [116.74.148.206]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 01118a87-c0a5-4da3-9e5b-08d84915c487
x-ms-traffictypediagnostic: DM5PR13MB1420:
x-ld-processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR13MB1420C7A5C9C54E968B166C3A97570@DM5PR13MB1420.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: m2BH0E+TLDDoetVk5ZV7Pg17P5MdK/DqB/LQhbTZkizyolVciZU1dFXbO1gGBud3Ff02OIa6TxgnoldGD6ym+2sKWK5JKU9dgDgTztjNXZFh2aDaMl7hZ9/rxJSpI8itCXaEZPkgOcu5A7yHn2DRujo/oO5CQ/2eEpJUkRtDNTUk+G6rgh7ap21KMHrnui2tGpC+7OqrDMlFFtLp1DExiGx5e6Oo+6WBKFW8b3Lg/0p2y77vUHXwUYbm+MvgHogycfgY4PEgUUISvYJWO/DlwuIpllMbiOK8awtgao85t/cP2EGlgZg3UJvjM8FLmeLVRmleRAwYJcVdykG8EPnprg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR13MB3451.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(136003)(366004)(39830400003)(346002)(396003)(44832011)(5660300002)(4326008)(26005)(316002)(2906002)(54906003)(86362001)(478600001)(83380400001)(66556008)(66946007)(52536014)(66446008)(64756008)(76116006)(66476007)(71200400001)(9686003)(8676002)(186003)(8936002)(53546011)(55236004)(7696005)(33656002)(55016002)(6506007)(6916009);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: IRRWh8ONUJps7Zax/qGIdNkWUcoSzPZiQeorxtH04ljjOkF2vskINXaFuKRjW9x00D3tPbpP/73DYATTmDz/oLUZEpM+AbPKEhoKX5cM37/txkjFBZxUFt6u6+vZmvubSSRU5yPlVlu606fRFvbPYh9Rgdodoj5eRIKJqBgEHWNTZezwUvxGrAcSJJFB5gK+Owk6XQwrhhTp9Luy4jSQf/NXYvSFV9OTJB3K65y2Zns4W0cwrfrJVNxttjoKkpl7lynauLBGLscFjoteAuzwO9EFTWEuLzdUzaTgWaHby9xXFVvqI/jpjZ5SmN0bcWXhv0IA9rIcJy1466oW0G+wh+WJp8L8cnqhlwSTTmCTTKwb8X/skAM17D6XE7M5/NgXap/9evgeqrYe3CvQmUlAAhBJEOOe7hfMowMY1K5+DwdqFBq+JEObUZ//xVAJynPN63Xl8X6unckuEkcSxLxIrcSV70aWj3gLkTCGuL6mRLLDdfnj8sI2Vadn2Q714bmN8WJ8RGInAHqJXBzbZRJRvzRbWOExGSCP4owNY4XFddmfY7namwEcXnZ/g+dB4WRdtTBNI9o8jR8ReH+1NqV1269H7ehgKtTuzKVoCbZq31jHXLWSxGN+pD32nAkyRhHmojXQCNhvz1knQdflUxtY5w==
MIME-Version: 1.0
X-OriginatorOrg: openfive.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR13MB3451.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01118a87-c0a5-4da3-9e5b-08d84915c487
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2020 16:41:51.1059 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9GcFZOXJ1NLJsHhhByqNJtiO4WkqEtWrcEpQvgpMY7S/hIj+Xa2riXltq07MnigmkVxfDogVIgkloZQSwHLYmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR13MB1420
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_124154_997207_27A76C3D 
X-CRM114-Status: GOOD (  20.38  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yash Shah <yash.shah@openfive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "Paul Walmsley \( Sifive\)" <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Rob,

> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Tuesday, August 25, 2020 9:51 PM
> To: Sagar Kadam <sagar.kadam@openfive.com>
> Cc: aou@eecs.berkeley.edu; devicetree@vger.kernel.org; Paul Walmsley (
> Sifive) <paul.walmsley@sifive.com>; Yash Shah <yash.shah@openfive.com>;
> palmer@dabbelt.com; linux-kernel@vger.kernel.org; linux-
> riscv@lists.infradead.org
> Subject: Re: [PATCH 1/1] dt-bindings: riscv: sifive-l2-cache: convert bindings
> to json-schema
> 
> [External Email] Do not click links or attachments unless you recognize the
> sender and know the content is safe
> 
> On Tue, Aug 25, 2020 at 2:47 AM Sagar Kadam
> <sagar.kadam@openfive.com> wrote:
> >
> > Hello Rob,
> >
> > > -----Original Message-----
> > > From: Rob Herring <robh@kernel.org>
> > > Sent: Monday, August 24, 2020 11:06 PM
> > > To: Sagar Kadam <sagar.kadam@openfive.com>
> > > Cc: aou@eecs.berkeley.edu; devicetree@vger.kernel.org; Paul Walmsley
> > > (
> > > Sifive) <paul.walmsley@sifive.com>; robh+dt@kernel.org; Yash Shah
> > > <yash.shah@openfive.com>; palmer@dabbelt.com; linux-
> > > kernel@vger.kernel.org; linux-riscv@lists.infradead.org
> > > Subject: Re: [PATCH 1/1] dt-bindings: riscv: sifive-l2-cache:
> > > convert bindings to json-schema
> > >
> > > [External Email] Do not click links or attachments unless you
> > > recognize the sender and know the content is safe
> > >
> > > On Mon, 24 Aug 2020 13:20:21 +0530, Sagar Kadam wrote:
> > > > Convert the device tree bindings for the SiFive's FU540-C000 SoC's
> > > > L2 Cache controller to YAML format.
> > > >
> > > > Signed-off-by: Sagar Kadam <sagar.kadam@sifive.com>
> > > > ---
> > > >  .../devicetree/bindings/riscv/sifive-l2-cache.txt  | 51
> > > > ------------ .../devicetree/bindings/riscv/sifive-l2-cache.yaml |
> > > > 93
> > > > ++++++++++++++++++++++
> > > >  2 files changed, 93 insertions(+), 51 deletions(-)  delete mode
> > > > 100644 Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt
> > > >  create mode 100644
> > > > Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> > > >
> > >
> > >
> > > My bot found errors running 'make dt_binding_check' on your patch:
> > >
> >
> > I had checked using DT_SCHEMA_FILES option due to which it didn't
> > catch any error on other schemas. Without this I could regenerate the
> error you mentioned.
> > I will fix it and update. Sorry for the error.
> 
> Update your kernel. DT_SCHEMA_FILES setting no longer matters on current
> tree. It only affects 'dtbs_check' now.
> 

Thanks for the input.
Sure, I see v5.9-rc2 as latest tag on mainline, I will base and fix my patch above it.

BR,
Sagar

> Rob
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
