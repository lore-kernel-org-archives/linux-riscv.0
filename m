Return-Path: <SRS0=kFy7=CD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71BE7C433DF
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2020 08:47:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 322512065F
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2020 08:47:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gbKAck4u";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=osportal.onmicrosoft.com header.i=@osportal.onmicrosoft.com header.b="hXwjY4jN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 322512065F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=openfive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=idMFsRIY/xwIhsliPCWGNJBx7Ocgit1d1ES92bLjPPg=; b=gbKAck4uz8MAxh3KnUyeTGYMA
	s8keAPD0SMetmtLsjgjY7tr0KGmx+nxd7km8vW4KRZETdcVPVTjKIEKcu9XyJFRnX3OjLmSr0PrvV
	gda4vVx9/rgKxtV1VI7zmP9eK8rohPAHFAm+8ePErAAE8G1/DljMheGkkhyIFtP/5aegfzbJ0r4u8
	CxZB05/QJ8Q5w/pbrrYIKHq/W1C+vmKwDqks1Dw7/m66ho6KgBDMMw/AlD3zl4pHagTkbMggsBra1
	KsR7PmzJ8yWN1k0UEkLUibqqaDsDjT1/kRdd6PryNFsQsuSw9E1kbvuM8BPj/5/tAGgJPY9Bol+KX
	x1C1Krumg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAUbt-0000Y4-A2; Tue, 25 Aug 2020 08:47:17 +0000
Received: from mail-dm6nam11on2041.outbound.protection.outlook.com
 ([40.107.223.41] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAUbo-0000Wx-Ln
 for linux-riscv@lists.infradead.org; Tue, 25 Aug 2020 08:47:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZtWCYjl0EfUKOlkU135EXgTLkwGjB9Q4A9M6IlsNtz+ibcuIpiJiqaHvbIMhhN7AoNjW/+neDAmoOYw2AynRLEP1b4w+j+2yxDlFMpQ5hNIJ3K7N5TIL4U/T5ieUEk49m4n+wPMunqR4In467TELBSWZly9feoMHB1tvxS6gr7v9Uk9p22gg1kIWxW/6Cbp0oheyBjCXCVs8n0JVlVYUxjWMvnggM36ehl/6a+T4dmik+eDVT27HPcgOV+GXr4sMyIs7fRw4+jZCvQA5qWlA82j06Gd63IhA+zK+rRdW4hSQngRdko3BRaqqK6AjDEopHbrV576JPZs1iupignlQzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I2eB0/brippDyCn/lHjYPWzsdS9fQkGsuGi5+QibBoQ=;
 b=On66FSuPk2A7/FKU8xpHpuBNVMqFclGmw0ZWvty5vBSa9XFY1wFG4PfoOoVeyRfwMHk0P7JwZawbE7x9rPjM1pWncv2i2coT28x8wZwpTJjdrcsRd6vLRnHOAh7+Ws8xsJnKKKWwVd7iYY7xHH4xfZhNPycDCmZb35tT733omE1x5Q7MQm8eptjHb0oCWa4d4V9EWdRU/OrIn+4uUgYwLJOi2ejkRgI2ex0KhvkCUBppRHYfACFqYrqSOhzmhWIJAwo/DWR1wWsYT/ggmD8GEbC5BQ2OH9NpSgilGWf98O0htKGD0q5scQ9+EOPfyimjTGOHzaE8ZrkDZQ6eNybLDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=openfive.com;
 dkim=pass header.d=openfive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=osportal.onmicrosoft.com; s=selector2-osportal-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I2eB0/brippDyCn/lHjYPWzsdS9fQkGsuGi5+QibBoQ=;
 b=hXwjY4jN8BrCjwWBx881ZOCjmsZXDwEtwQnGPWMBNW0hmuJWJ0vZRqAEYiJajZilCr6GossPGfDS2srvc3328JCI8R78FSj8iR9Yvnf/a8fGAQJoZ7/x54WwocweEKk6exEUk0EGeWCHzE6iC3Adcvn/6OgRai6Xw++Z2LuI2qc=
Received: from DM6PR13MB3451.namprd13.prod.outlook.com (2603:10b6:5:1c3::10)
 by DM6PR13MB2828.namprd13.prod.outlook.com (2603:10b6:5:13e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.15; Tue, 25 Aug
 2020 08:47:09 +0000
Received: from DM6PR13MB3451.namprd13.prod.outlook.com
 ([fe80::f570:90c6:f6d5:c078]) by DM6PR13MB3451.namprd13.prod.outlook.com
 ([fe80::f570:90c6:f6d5:c078%7]) with mapi id 15.20.3326.019; Tue, 25 Aug 2020
 08:47:09 +0000
From: Sagar Kadam <sagar.kadam@openfive.com>
To: Rob Herring <robh@kernel.org>
Subject: RE: [PATCH 1/1] dt-bindings: riscv: sifive-l2-cache: convert bindings
 to json-schema
Thread-Topic: [PATCH 1/1] dt-bindings: riscv: sifive-l2-cache: convert
 bindings to json-schema
Thread-Index: AQHWeetFYcQYSaG/+EK5zgQ5BKIJhalHhiCAgADfjAA=
Date: Tue, 25 Aug 2020 08:47:09 +0000
Message-ID: <DM6PR13MB3451089239FDA8F87BA6410497570@DM6PR13MB3451.namprd13.prod.outlook.com>
References: <1598255421-8274-1-git-send-email-sagar.kadam@sifive.com>
 <1598255421-8274-2-git-send-email-sagar.kadam@sifive.com>
 <20200824173539.GA2939042@bogus>
In-Reply-To: <20200824173539.GA2939042@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=openfive.com;
x-originating-ip: [116.74.148.206]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 06f8c845-9b00-4503-8825-08d848d37414
x-ms-traffictypediagnostic: DM6PR13MB2828:
x-ld-processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR13MB2828F9115E8432BCD1FE6C0C97570@DM6PR13MB2828.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5TCir9yxgng9r11umiLJ5//y8L/ZeU9u7WOmUSukCe6eH1YlrXi6W3mCQJnvzxKg70QLm9pKEqO/YNg7VOyWo8mH69oxG/apLfHzsrODXHLRMmDBHM9emTI74T04NQC0R6Mqh4iOvV/NjLBRq2WMo1f7MNGMRR4V01QJhfHWZFBX0o395coI8RuE75TWLxhdhYbaiqFzd/Vq/VcIkfgJVBHHmATQ/QL23Y0VC+IBuWgalt16hV/68YSz4358Sr6aqjZ7awlnlD8bZ48YNd1Xazw8YilVTCgxO4yOdadYgBoSWK/neFAF1uiGvgf7FiLo3t3NA9v2YAFBZWmRih08U/h10vXRde7qF9WakQeCFYWFDZa7JAWGTZ8zY3sgcMgcCZguHVQhZLC86oRNTVlmyg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR13MB3451.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(136003)(366004)(396003)(346002)(39850400004)(55236004)(186003)(6506007)(26005)(478600001)(44832011)(71200400001)(4326008)(316002)(53546011)(966005)(30864003)(52536014)(86362001)(5660300002)(55016002)(33656002)(54906003)(6916009)(66946007)(64756008)(76116006)(66476007)(83380400001)(66446008)(66556008)(8936002)(7696005)(9686003)(2906002)(8676002)(579004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: fzqbE9nAqtgYNmyQLtN3wysgE7xhgJYfqBUZ10vZEAJ2iwZ1laYo/ouvLw/eBvyeWAa+eJxBh8jmgV0GHfMmlP7nlm1InlQkiFqCwEDJq1sTCej0CQKTtF+CKha2OFGehVpN4c8LizLe/t+B6tp4sO50bMX+WOBPah+dy7ZnBrPel145o1hf8TFH3eGo4ILrltjUk+yp+sq3/4kT/MYjem2ZTHQ8WKun2lB08uMHhrXfA1HNxzhIKE8yBos3Yvwi/n8wvYA7U+8sAbyVl1ydOl4Y3tY8hgE8/ED+FpTpvZx337/2Np1xHZVttAwT9iLhwHp1XiyXtoKFAbnpV0bQR7UipaXD5uKv5kcUdWryZ8Wy6A8HKMICoQ/8sLFsad0KSbRHtxztIgnjNDrYIHe/lbtXr6Ac584fFjMxCdXPeRNX4gRm5T5/E17/gaHnmvpii/FPlTrrAaTGQENmDsvpbeYU/UKckFF+CLZBUQvVPil8u/mWg3vPiZcm996Um56OZaQHoN6XP8SiJalw132m/gh9TUupZY7+LvQ5wOMZWHF566ERD9BfDqbER3KOjxEC2QZhrw8AiNF6M/EHW7F+r0dixd6azdduHB0Ghl/SY5RFb6ImxWzqUObElhfdFousQ4OXY5S52CY9m289OQGODA==
MIME-Version: 1.0
X-OriginatorOrg: openfive.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR13MB3451.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06f8c845-9b00-4503-8825-08d848d37414
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2020 08:47:09.4587 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8kXWO+tVDruYaLCWQQUB4dhBhc4TMGF3VaGLnJUpqVs3hRchYayQspniY6qVnYDEkxFpN9LTYvb/FBa+WYsmcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR13MB2828
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_044712_903596_194BB197 
X-CRM114-Status: GOOD (  15.67  )
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
 Yash Shah <yash.shah@openfive.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>, "Paul Walmsley \(
 Sifive\)" <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hello Rob,

> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Monday, August 24, 2020 11:06 PM
> To: Sagar Kadam <sagar.kadam@openfive.com>
> Cc: aou@eecs.berkeley.edu; devicetree@vger.kernel.org; Paul Walmsley (
> Sifive) <paul.walmsley@sifive.com>; robh+dt@kernel.org; Yash Shah
> <yash.shah@openfive.com>; palmer@dabbelt.com; linux-
> kernel@vger.kernel.org; linux-riscv@lists.infradead.org
> Subject: Re: [PATCH 1/1] dt-bindings: riscv: sifive-l2-cache: convert bindings
> to json-schema
> 
> [External Email] Do not click links or attachments unless you recognize the
> sender and know the content is safe
> 
> On Mon, 24 Aug 2020 13:20:21 +0530, Sagar Kadam wrote:
> > Convert the device tree bindings for the SiFive's FU540-C000 SoC's L2
> > Cache controller to YAML format.
> >
> > Signed-off-by: Sagar Kadam <sagar.kadam@sifive.com>
> > ---
> >  .../devicetree/bindings/riscv/sifive-l2-cache.txt  | 51 ------------
> > .../devicetree/bindings/riscv/sifive-l2-cache.yaml | 93
> > ++++++++++++++++++++++
> >  2 files changed, 93 insertions(+), 51 deletions(-)  delete mode
> > 100644 Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt
> >  create mode 100644
> > Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> >
> 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
 
I had checked using DT_SCHEMA_FILES option due to which it didn't catch any error on other 
schemas. Without this I could regenerate the error you mentioned.
I will fix it and update. Sorry for the error.

Thanks & BR,
Sagar

> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/thermal/thermal-cooling-
> devices.example.dt.yaml: l2-cache: $nodename:0: 'l2-cache' does not match
> '^(cache-controller|cpu)(@[0-9a-f,]+)*$'
>         From schema: /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/thermal/thermal-cooling-
> devices.example.dt.yaml: l2-cache: compatible:0: 'cache' is not one of
> ['sifive,fu540-c000-ccache']
>         From schema: /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/thermal/thermal-cooling-
> devices.example.dt.yaml: l2-cache: compatible: ['cache'] is too short
>         From schema: /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/thermal/thermal-cooling-
> devices.example.dt.yaml: l2-cache: 'l3-cache' does not match any of the
> regexes: 'pinctrl-[0-9]+'
>         From schema: /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/thermal/thermal-cooling-
> devices.example.dt.yaml: l2-cache: 'cache-block-size' is a required property
>         From schema: /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/thermal/thermal-cooling-
> devices.example.dt.yaml: l2-cache: 'cache-level' is a required property
>         From schema: /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/thermal/thermal-cooling-
> devices.example.dt.yaml: l2-cache: 'cache-sets' is a required property
>         From schema: /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/thermal/thermal-cooling-
> devices.example.dt.yaml: l2-cache: 'cache-size' is a required property
>         From schema: /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/thermal/thermal-cooling-
> devices.example.dt.yaml: l2-cache: 'cache-unified' is a required property
>         From schema: /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/thermal/thermal-cooling-
> devices.example.dt.yaml: l2-cache: 'reg' is a required property
>         From schema: /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/thermal/thermal-cooling-
> devices.example.dt.yaml: l2-cache: {'compatible': ['cache'], 'next-level-cache':
> [[2]], 'phandle': [[1]], 'l3-cache': {'compatible': ['cache'], 'phandle': [[2]]},
> '$nodename': ['l2-cache']} is not valid under any of the given schemas
> {'$filename': '/builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml',
>  '$id': 'http://devicetree.org/schemas/riscv/sifive-l2-cache.yaml#',
>  '$schema': 'http://devicetree.org/meta-schemas/core.yaml#',
>  '$select_validator': <jsonschema.validators.create.<locals>.Validator object
> at 0x7efcd84bc850>,
>  'additionalProperties': False,
>  'allOf': [{'$ref': '/schemas/cache-controller.yaml#'}],
>  'oneOf': [{'required': ['interrupts']},
>            {'required': ['interrupts-extended']}],
>  'patternProperties': {'pinctrl-[0-9]+': True},
>  'properties': {'$nodename': True,
>                 'cache-block-size': {'additionalItems': False,
>                                      'items': [{'additionalItems': False,
>                                                 'items': [{'const': 64}],
>                                                 'maxItems': 1,
>                                                 'minItems': 1,
>                                                 'type': 'array'}],
>                                      'maxItems': 1,
>                                      'minItems': 1,
>                                      'type': 'array'},
>                 'cache-level': {'additionalItems': False,
>                                 'items': [{'additionalItems': False,
>                                            'items': [{'const': 2}],
>                                            'maxItems': 1,
>                                            'minItems': 1,
>                                            'type': 'array'}],
>                                 'maxItems': 1,
>                                 'minItems': 1,
>                                 'type': 'array'},
>                 'cache-sets': {'additionalItems': False,
>                                'items': [{'additionalItems': False,
>                                           'items': [{'const': 1024}],
>                                           'maxItems': 1,
>                                           'minItems': 1,
>                                           'type': 'array'}],
>                                'maxItems': 1,
>                                'minItems': 1,
>                                'type': 'array'},
>                 'cache-size': {'additionalItems': False,
>                                'items': [{'additionalItems': False,
>                                           'items': [{'const': 2097152}],
>                                           'maxItems': 1,
>                                           'minItems': 1,
>                                           'type': 'array'}],
>                                'maxItems': 1,
>                                'minItems': 1,
>                                'type': 'array'},
>                 'cache-unified': True,
>                 'compatible': {'additionalItems': False,
>                                'items': [{'enum': ['sifive,fu540-c000-ccache']},
>                                          {'const': 'cache'}],
>                                'maxItems': 2,
>                                'minItems': 2,
>                                'type': 'array'},
>                 'interrupt-parent': True,
>                 'interrupts': {'maxItems': 3, 'minItems': 1},
>                 'interrupts-extended': {'maxItems': 3, 'minItems': 1},
>                 'memory-region': {},
>                 'next-level-cache': {},
>                 'phandle': True,
>                 'pinctrl-names': True,
>                 'reg': {'maxItems': 1, 'minItems': 1},
>                 'status': True},
>  'required': ['compatible',
>               'cache-block-size',
>               'cache-level',
>               'cache-sets',
>               'cache-size',
>               'cache-unified',
>               'reg'],
>  'select': {'properties': {'compatible': {'contains': {'enum': ['cache',
>                                                                 'sifive,fu540-c000-ccache']}}},
>             'required': ['compatible']},
>  'title': 'SiFive L2 Cache Controller'} (Possible causes of the failure):
>         /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/thermal/thermal-cooling-
> devices.example.dt.yaml: l2-cache: 'interrupts' is a required property
> 
>         From schema: /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/thermal/thermal-cooling-
> devices.example.dt.yaml: l3-cache: $nodename:0: 'l3-cache' does not match
> '^(cache-controller|cpu)(@[0-9a-f,]+)*$'
>         From schema: /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/thermal/thermal-cooling-
> devices.example.dt.yaml: l3-cache: compatible:0: 'cache' is not one of
> ['sifive,fu540-c000-ccache']
>         From schema: /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/thermal/thermal-cooling-
> devices.example.dt.yaml: l3-cache: compatible: ['cache'] is too short
>         From schema: /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/thermal/thermal-cooling-
> devices.example.dt.yaml: l3-cache: 'cache-block-size' is a required property
>         From schema: /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/thermal/thermal-cooling-
> devices.example.dt.yaml: l3-cache: 'cache-level' is a required property
>         From schema: /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/thermal/thermal-cooling-
> devices.example.dt.yaml: l3-cache: 'cache-sets' is a required property
>         From schema: /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/thermal/thermal-cooling-
> devices.example.dt.yaml: l3-cache: 'cache-size' is a required property
>         From schema: /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/thermal/thermal-cooling-
> devices.example.dt.yaml: l3-cache: 'cache-unified' is a required property
>         From schema: /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/thermal/thermal-cooling-
> devices.example.dt.yaml: l3-cache: 'reg' is a required property
>         From schema: /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/thermal/thermal-cooling-
> devices.example.dt.yaml: l3-cache: {'compatible': ['cache'], 'phandle': [[2]],
> '$nodename': ['l3-cache']} is not valid under any of the given schemas
> {'$filename': '/builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml',
>  '$id': 'http://devicetree.org/schemas/riscv/sifive-l2-cache.yaml#',
>  '$schema': 'http://devicetree.org/meta-schemas/core.yaml#',
>  '$select_validator': <jsonschema.validators.create.<locals>.Validator object
> at 0x7efcd84bc850>,
>  'additionalProperties': False,
>  'allOf': [{'$ref': '/schemas/cache-controller.yaml#'}],
>  'oneOf': [{'required': ['interrupts']},
>            {'required': ['interrupts-extended']}],
>  'patternProperties': {'pinctrl-[0-9]+': True},
>  'properties': {'$nodename': True,
>                 'cache-block-size': {'additionalItems': False,
>                                      'items': [{'additionalItems': False,
>                                                 'items': [{'const': 64}],
>                                                 'maxItems': 1,
>                                                 'minItems': 1,
>                                                 'type': 'array'}],
>                                      'maxItems': 1,
>                                      'minItems': 1,
>                                      'type': 'array'},
>                 'cache-level': {'additionalItems': False,
>                                 'items': [{'additionalItems': False,
>                                            'items': [{'const': 2}],
>                                            'maxItems': 1,
>                                            'minItems': 1,
>                                            'type': 'array'}],
>                                 'maxItems': 1,
>                                 'minItems': 1,
>                                 'type': 'array'},
>                 'cache-sets': {'additionalItems': False,
>                                'items': [{'additionalItems': False,
>                                           'items': [{'const': 1024}],
>                                           'maxItems': 1,
>                                           'minItems': 1,
>                                           'type': 'array'}],
>                                'maxItems': 1,
>                                'minItems': 1,
>                                'type': 'array'},
>                 'cache-size': {'additionalItems': False,
>                                'items': [{'additionalItems': False,
>                                           'items': [{'const': 2097152}],
>                                           'maxItems': 1,
>                                           'minItems': 1,
>                                           'type': 'array'}],
>                                'maxItems': 1,
>                                'minItems': 1,
>                                'type': 'array'},
>                 'cache-unified': True,
>                 'compatible': {'additionalItems': False,
>                                'items': [{'enum': ['sifive,fu540-c000-ccache']},
>                                          {'const': 'cache'}],
>                                'maxItems': 2,
>                                'minItems': 2,
>                                'type': 'array'},
>                 'interrupt-parent': True,
>                 'interrupts': {'maxItems': 3, 'minItems': 1},
>                 'interrupts-extended': {'maxItems': 3, 'minItems': 1},
>                 'memory-region': {},
>                 'next-level-cache': {},
>                 'phandle': True,
>                 'pinctrl-names': True,
>                 'reg': {'maxItems': 1, 'minItems': 1},
>                 'status': True},
>  'required': ['compatible',
>               'cache-block-size',
>               'cache-level',
>               'cache-sets',
>               'cache-size',
>               'cache-unified',
>               'reg'],
>  'select': {'properties': {'compatible': {'contains': {'enum': ['cache',
>                                                                 'sifive,fu540-c000-ccache']}}},
>             'required': ['compatible']},
>  'title': 'SiFive L2 Cache Controller'} (Possible causes of the failure):
>         /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/thermal/thermal-cooling-
> devices.example.dt.yaml: l3-cache: 'interrupts' is a required property
> 
>         From schema: /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/power/renesas,rcar-
> sysc.example.dt.yaml: cache-controller-0: $nodename:0: 'cache-controller-0'
> does not match '^(cache-controller|cpu)(@[0-9a-f,]+)*$'
>         From schema: /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/power/renesas,rcar-
> sysc.example.dt.yaml: cache-controller-0: compatible:0: 'cache' is not one of
> ['sifive,fu540-c000-ccache']
>         From schema: /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/power/renesas,rcar-
> sysc.example.dt.yaml: cache-controller-0: compatible: ['cache'] is too short
>         From schema: /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/power/renesas,rcar-
> sysc.example.dt.yaml: cache-controller-0: 'power-domains' does not match
> any of the regexes: 'pinctrl-[0-9]+'
>         From schema: /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/power/renesas,rcar-
> sysc.example.dt.yaml: cache-controller-0: 'cache-block-size' is a required
> property
>         From schema: /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/power/renesas,rcar-
> sysc.example.dt.yaml: cache-controller-0: 'cache-sets' is a required property
>         From schema: /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/power/renesas,rcar-
> sysc.example.dt.yaml: cache-controller-0: 'cache-size' is a required property
>         From schema: /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/power/renesas,rcar-
> sysc.example.dt.yaml: cache-controller-0: 'reg' is a required property
>         From schema: /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/power/renesas,rcar-
> sysc.example.dt.yaml: cache-controller-0: {'compatible': ['cache'], 'power-
> domains': [[1, 12]], 'cache-unified': True, 'cache-level': [[2]], '$nodename':
> ['cache-controller-0']} is not valid under any of the given schemas
> {'$filename': '/builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml',
>  '$id': 'http://devicetree.org/schemas/riscv/sifive-l2-cache.yaml#',
>  '$schema': 'http://devicetree.org/meta-schemas/core.yaml#',
>  '$select_validator': <jsonschema.validators.create.<locals>.Validator object
> at 0x7f26dd3928b0>,
>  'additionalProperties': False,
>  'allOf': [{'$ref': '/schemas/cache-controller.yaml#'}],
>  'oneOf': [{'required': ['interrupts']},
>            {'required': ['interrupts-extended']}],
>  'patternProperties': {'pinctrl-[0-9]+': True},
>  'properties': {'$nodename': True,
>                 'cache-block-size': {'additionalItems': False,
>                                      'items': [{'additionalItems': False,
>                                                 'items': [{'const': 64}],
>                                                 'maxItems': 1,
>                                                 'minItems': 1,
>                                                 'type': 'array'}],
>                                      'maxItems': 1,
>                                      'minItems': 1,
>                                      'type': 'array'},
>                 'cache-level': {'additionalItems': False,
>                                 'items': [{'additionalItems': False,
>                                            'items': [{'const': 2}],
>                                            'maxItems': 1,
>                                            'minItems': 1,
>                                            'type': 'array'}],
>                                 'maxItems': 1,
>                                 'minItems': 1,
>                                 'type': 'array'},
>                 'cache-sets': {'additionalItems': False,
>                                'items': [{'additionalItems': False,
>                                           'items': [{'const': 1024}],
>                                           'maxItems': 1,
>                                           'minItems': 1,
>                                           'type': 'array'}],
>                                'maxItems': 1,
>                                'minItems': 1,
>                                'type': 'array'},
>                 'cache-size': {'additionalItems': False,
>                                'items': [{'additionalItems': False,
>                                           'items': [{'const': 2097152}],
>                                           'maxItems': 1,
>                                           'minItems': 1,
>                                           'type': 'array'}],
>                                'maxItems': 1,
>                                'minItems': 1,
>                                'type': 'array'},
>                 'cache-unified': True,
>                 'compatible': {'additionalItems': False,
>                                'items': [{'enum': ['sifive,fu540-c000-ccache']},
>                                          {'const': 'cache'}],
>                                'maxItems': 2,
>                                'minItems': 2,
>                                'type': 'array'},
>                 'interrupt-parent': True,
>                 'interrupts': {'maxItems': 3, 'minItems': 1},
>                 'interrupts-extended': {'maxItems': 3, 'minItems': 1},
>                 'memory-region': {},
>                 'next-level-cache': {},
>                 'phandle': True,
>                 'pinctrl-names': True,
>                 'reg': {'maxItems': 1, 'minItems': 1},
>                 'status': True},
>  'required': ['compatible',
>               'cache-block-size',
>               'cache-level',
>               'cache-sets',
>               'cache-size',
>               'cache-unified',
>               'reg'],
>  'select': {'properties': {'compatible': {'contains': {'enum': ['cache',
>                                                                 'sifive,fu540-c000-ccache']}}},
>             'required': ['compatible']},
>  'title': 'SiFive L2 Cache Controller'} (Possible causes of the failure):
>         /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/power/renesas,rcar-
> sysc.example.dt.yaml: cache-controller-0: 'interrupts' is a required property
> 
>         From schema: /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> 
> 
> See https://patchwork.ozlabs.org/patch/1350111
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure dt-schema is up to date:
> 
> pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --
> upgrade
> 
> Please check and re-submit.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
