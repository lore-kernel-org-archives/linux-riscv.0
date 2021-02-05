Return-Path: <SRS0=lacq=HH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CEFBC433DB
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Feb 2021 00:29:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E046264FAE
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Feb 2021 00:29:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E046264FAE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=JRZTkD94Gt0zKFWwthia9Dqo0+c3Eq07Gc7LwbT2Qpw=; b=VXbAiUyx1V1wlpIpQ9B0FJ+v4
	2ECHe3Jsa0M5ud37cmAF11m97eT2/Nzzua6THx/6ss18ImCUab9w+PgDeD0MG+UCKO9Bob7E9u/f5
	beRvZQVP4Q/moRQhUTpwMvsuLb/AITvlMsfHxHwQ6+mxBwCBJpc8BDijMKDkvHPwqZR0OqKvZZBdA
	EWkJZ0AsbN6fwiD9Wfk64QUmu4WHDRdVFCBUseixrjo57DLeSPqCfaaEsd62vB/b5syiRTnePk4K8
	UQiHbIn6T6Z/sUv9A74Q+iGY3vALXSS0Ih8qHEK2WB343ITsqpZINAWt6+2alL30DlF7mQsAh7hRE
	FwIwak0dg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7p0M-0000sb-Ie; Fri, 05 Feb 2021 00:29:46 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7p0J-0000s6-Fi
 for linux-riscv@lists.infradead.org; Fri, 05 Feb 2021 00:29:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612484983; x=1644020983;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=pVGTG51me0s2yMqfcY4gDO8vMF/Z0dCA+ss1JAjQ3aQ=;
 b=VNYFqyPz3c5rxqfRx/uWxvx3tHW+3YBrJfjaP417L7uz4OxReEubhe+o
 bzYW4UolVhm1RboL7EQi1lT/ZE5HkKi52KKLaVxuWtAT1zhKwhys2XsQP
 GnAf9BfP4LamCxy7uW3qzF7K8fx10z6sOHEmkLf019B8UCc61wHOOI+ul
 j2L0857GUTp8qEs/xVXMWlMEnc8O8nvPh6yDbC9VDmswOskmJiywSj2/X
 h+XIC2s1jUpH6xe5H+96SUB59kSE7uzelarsUc2ssE2FOV6Kz6JxJQdzk
 wSJbXjs2zQiz7R3J6noOS2rdqXdIGGqXwwg4ARGgRODTeWSmewEXJGVNE Q==;
IronPort-SDR: ncXj+8Vr+B+trMxo8rWAu3d+4wTVj18FLZAmi5G+da4rxxgMGLOR9bNGKubYL/P/BR3xFmFNIb
 Ey6WCRUgq6vkfMO24yd5re+Tv2AaRN5neViws3Wn5DACBW/ltuCmfzXvpzYcjxDHIQE4OXd9o5
 p9p7IYpRB2G3pZqS9vwah14/bKGbsci/BE2eEXwPo9kjg3XMdgia/92s0eozHhgjU5eUwyU2S9
 kdgKSA8X6m6CC6G0xv8keycqI73DTeiIZ0tSGD93kIrzNVJu9G6v9Mk5mrIhZquc9tF01Pv1Y+
 fxI=
X-IronPort-AV: E=Sophos;i="5.81,153,1610380800"; d="scan'208";a="159182960"
Received: from mail-mw2nam12lp2041.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.41])
 by ob1.hgst.iphmx.com with ESMTP; 05 Feb 2021 08:29:38 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZsVmEYuzQ0QW5sYtR54GjCRWp6BjvdZk7OJF52p7fXiNng8TAwpXIxLTE3fJAXe98XOqFWiZZx5UjII8P2Asn0wjsxP2xOGVBHsQUiecgqiM26oOB8De/st5VfB22amIuPYS+n70IxD0wHwdYBIyu62ThuAkIBkM+d5+GbyGyXV+f4jchXpfYh/5Rnb2OfOsv5chaHgG6LvWOcJ38z7hlEy8Gk9Pcj5UTwZrY3+EZDqlPEP5CpoFAgTp+v57JmFCdl6E1uvwGXMFZ5WcuZcdsaGuCeTKB4wHIjZer/LBMpl2IjLxp49beJgGKt/yXssxC1TADFbOTr+/cCwog8zYCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a+gnY1wIPkw1Dfm+RQZZdC9B56upBuuxtt+eTXvHHXY=;
 b=N9OzLYHaw5KLXOQ+8ldwBcTUHcBMidtMK8/Tp7B0sDlkFFWNBjmIiL+RoRQF6seQn26Gv+Wt9PvdcmjTAc9lKhMpkn4iwdMHugVI8NK+Velf4tVAqtsAZHbtzYxC+tXba0pbTfjBzrkpfg8gZBa9ajlaJgJQJ8/ma79Iqtdw8ffMyMjhnBuZm+d1ehQTVcs0jsor5kETNJKfvfu60S1lw42Vh6lqbTIVL36tmgxMWPFIUJPp3Gw1/if7J3n9hqST2RnzWa50L4BZko745zl8Z96Ox+ABEvzkBhyyxDuuAiIXDmyIqd43lrCW3dbxBpmBmRyAtJbF08H49mdR7waBXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a+gnY1wIPkw1Dfm+RQZZdC9B56upBuuxtt+eTXvHHXY=;
 b=YT3mEs/7v+Ud+hxthi5qkagd6TqkiAwjxroUTV5v3vJeD9UBM95YmI+8pog1xbDFmuT5MM46hgWeX3LRifG4GZG8YNHyYTqNVClvZCll+O9RKAAaGbS/fTJPZkBitSa60gk/lGrIgtiDBN+pXql9i0SbarBQsEjr48dRYp7Bqtk=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by MN2PR04MB6894.namprd04.prod.outlook.com (2603:10b6:208:1ec::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.21; Fri, 5 Feb
 2021 00:29:35 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d%8]) with mapi id 15.20.3805.024; Fri, 5 Feb 2021
 00:29:35 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "robh@kernel.org" <robh@kernel.org>
Subject: Re: [PATCH v14 07/16] dt-bindings: fix sifive gpio properties
Thread-Topic: [PATCH v14 07/16] dt-bindings: fix sifive gpio properties
Thread-Index: AQHW+U9T59FA/s8Z20mcfAvTuPFEfg==
Date: Fri, 5 Feb 2021 00:29:35 +0000
Message-ID: <BL0PR04MB6514879BEDE7FDB7C863A969E7B29@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20210202103623.200809-1-damien.lemoal@wdc.com>
 <20210202103623.200809-8-damien.lemoal@wdc.com>
 <CAL_JsqJNqKrsB3LJvBpNmY6H3V1c5x4duqB_0p8YKit4+ZYRBw@mail.gmail.com>
 <89cccbae5add85c7bd811f3819ea3db7061e928d.camel@wdc.com>
 <CAL_JsqJeF364bPSNQLGujNHDkA7x8H_H7YXQFNZQ7vDzdAevcA@mail.gmail.com>
 <c9d273c87815a89be314e4e824a365313be0d677.camel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:50f7:ee01:712b:bf92]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: bcc16cd5-55ea-4fe9-97e6-08d8c96d1d88
x-ms-traffictypediagnostic: MN2PR04MB6894:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR04MB6894BDA6CB560FB8CA620D55E7B29@MN2PR04MB6894.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /N4Y+sVlTCtHEP/iAGAw5XQVL5Hs4bcKkaeeod1r1iL31N2hu8YBcpsMhi3nNomDfeIqJ9PXwlZu6fj6VlS6+pdSSbdS/IV1QV9SrYdJcLVST/l7iwdgKewXAPuD15d6OtLMUUFJtwVKj7bIiStea8xYs+Hogixj0qWmpdlrHZTfbqFT3pT3es5GTpTYb25yVfog1er4H55NiHZpjkphZ18sununNAOYkZXVugq9XaI0hoo3Zqc1b6z7Had7/KDwzeiHJrwMVSx/IqbHYPxJJzNcilMldamWV4QsZ3TwXCnh1WDdnmrR5S3Lm1lM11RGKdN143J9K4Iqsc6y3a/O38XIYrY1N9zu1ivvfHGQQYWMvSjRbWg18/xnG3P4LNoRPvv8mQO6gLexRCsvIhxZq97t/1p+1BOlceTyq03wUDPndL7ryNC592UvpaxOvi/fe5P6QUuzBxM64YK8at8mB93N/0rnqa74N4FKT5eFoq2G1yKV4RCsBXslTIBdqydyYqdATT6b4saYRM+kuOyldg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(136003)(346002)(39860400002)(2906002)(33656002)(66446008)(8936002)(55016002)(4326008)(66556008)(53546011)(64756008)(5660300002)(76116006)(8676002)(478600001)(66476007)(7696005)(316002)(86362001)(83380400001)(6506007)(54906003)(71200400001)(186003)(91956017)(66946007)(6916009)(52536014)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?HusbXYAeZPBnAXhbB0EcADmD/YBH1qouDGvkUs6gJ/O6FlwllqIZ8AklHS?=
 =?iso-8859-1?Q?I6+h8eAyzZvvo3+ssF/NjnV48tgXJDdUBO29OzWFWZLWEjjS8iTYg31Iwj?=
 =?iso-8859-1?Q?7NILerDlNXuJtFFB2dufGIunjo22iPN+tGc/k7KMEI+xqS7515sh8ffhyC?=
 =?iso-8859-1?Q?BwuG9M1ARmiPEAhbUYUzaNcgLjNrNN85kuWTS1lkSwvauIOhGY1jbwbVcl?=
 =?iso-8859-1?Q?WxmRUkjo/ZPvwqulgzLXaH3QOxz2XlTf/Pp1KWJw7LpVcl5WE1qZ4+WwP5?=
 =?iso-8859-1?Q?cZtJP8gok13DBN9/iloWZcAHbg1yYwgjbmcM+7lOo8lBpu8imt1zogOVGe?=
 =?iso-8859-1?Q?dIi3kFcHWG1selHP9tbXhup8c+Y/qHcgT78daZwQAecz7VX6r7h16nJirR?=
 =?iso-8859-1?Q?j4MQAfnNzcsfe4vTst0n7vZ48PpIOO5qnXLDhGdm7oW1ciWvgxzJjoATm/?=
 =?iso-8859-1?Q?pU4F6fMRyGD8U/PcvR/9bulDfLhu1iqERxbivFb6Q120SrPI3YSUT1TXP8?=
 =?iso-8859-1?Q?QmG+otP0e2u/4TrZI71UYkoPYREDn1UHZEx4a89/myra/ebrILbOCv6PXq?=
 =?iso-8859-1?Q?6C/M5vq+F1GoMSwgGdEJ2Y29v8wq2u8/xSyQg//JUzaoY3jfuhrlk/wORm?=
 =?iso-8859-1?Q?i3EtXSIiU98KLjt/Ei6eNMkMq7OdQJ1tv54nkrNqKO9qX7OvBeCv/IxhE8?=
 =?iso-8859-1?Q?4Mh6Kj3rvKOZFV9YHSvI/sfL6tJhPAn7HdemUwOvqhhdaha5/zT1tV6aml?=
 =?iso-8859-1?Q?2HRwQzSOdU0VrNV/sz4xNCwqYnV/+WFBIiDffaTFfsDwOan/VH9dJP03eP?=
 =?iso-8859-1?Q?12XCtLMbAiGYXpzeYEflVtJKu/0BiGmeSjZoDekkGxhV3eMRvuDmqPBOTT?=
 =?iso-8859-1?Q?m0sUvg987yjGpcEbSew6LEb30gl+QMHdQsdq5AkYQ5jWb/t0+/6qiOd0s+?=
 =?iso-8859-1?Q?K6e54TsVG6dKFDR6jBC9WtE6synOGg3XoxqcTSugLUoMw+83v4Q4+ockoD?=
 =?iso-8859-1?Q?/Y+Kik8UihD8YRKvmeaPC7/fSyOgBVftRgfRLm4w2bMCe7vlyG5L1ZwxeR?=
 =?iso-8859-1?Q?6vl/49V0xjDdVFK8HpHcwCix5hVHSFpA0JqxwFQCbc+AYj0QVasgHKDAWR?=
 =?iso-8859-1?Q?q6qWMBwEZEcbAM213+YaTSY/S3iY3B6bqvnllN1zQOI1S+yG2QrL4/mRvu?=
 =?iso-8859-1?Q?q1GJebqQeZ67i8ZKu3KISP1hc2/8NTHLaf1vUA0SL7s2DIB5Yi2bi3iT1L?=
 =?iso-8859-1?Q?pWfsa2s6s8EV/icANj2XcneiKmxr2JJdXcJLGHm9W6oERrkFkcP6uzoCrg?=
 =?iso-8859-1?Q?CCbAvVjxM0ihz5rLdztwYfGMcujkOF1o60n687/oEJ+qewSArz1Dm34ViR?=
 =?iso-8859-1?Q?Zxx//vX9/J7dEpWIGBTvOT/I6fVXlKs9Jp77EE7YoroOD6CvVOJSf8Izqv?=
 =?iso-8859-1?Q?BoQFk0qd0jl2iecoMYOGFdzw9zWiF8SxlBmJPA=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcc16cd5-55ea-4fe9-97e6-08d8c96d1d88
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2021 00:29:35.5730 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XRbfEMsY9KMNzh87j4l7Xth4c4ASST4jduSoQNBSFl3xvyeYpLqC2+DdQyXBS+j9UaPLelXJpmL3PLHKqh279g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6894
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_192943_919266_5248AD35 
X-CRM114-Status: GOOD (  27.61  )
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
 Anup Patel <Anup.Patel@wdc.com>, "seanga2@gmail.com" <seanga2@gmail.com>,
 Atish Patra <Atish.Patra@wdc.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2021/02/04 9:47, Damien Le Moal wrote:
> On Wed, 2021-02-03 at 14:41 -0600, Rob Herring wrote:
>> On Wed, Feb 3, 2021 at 6:52 AM Damien Le Moal <Damien.LeMoal@wdc.com> wr=
ote:
>>>
>>> On Tue, 2021-02-02 at 13:02 -0600, Rob Herring wrote:
>>>> On Tue, Feb 2, 2021 at 4:36 AM Damien Le Moal <damien.lemoal@wdc.com> =
wrote:
>>>>>
>>>>> The sifive gpio IP block supports up to 32 GPIOs. Reflect that in the
>>>>> interrupts property description and maxItems. Also add the standard
>>>>> ngpios property to describe the number of GPIOs available on the
>>>>> implementation.
>>>>>
>>>>> Also add the "canaan,k210-gpiohs" compatible string to indicate the u=
se
>>>>> of this gpio controller in the Canaan Kendryte K210 SoC. If this
>>>>> compatible string is used, do not define the clocks property as
>>>>> required as the K210 SoC does not have a software controllable clock
>>>>> for the Sifive gpio IP block.
>>>>>
>>>>> Cc: Paul Walmsley <paul.walmsley@sifive.com>
>>>>> Cc: Rob Herring <robh@kernel.org>
>>>>> Cc: devicetree@vger.kernel.org
>>>>> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
>>>>> ---
>>>>> =A0.../devicetree/bindings/gpio/sifive,gpio.yaml | 21 +++++++++++++++=
+---
>>>>> =A01 file changed, 18 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml =
b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
>>>>> index ab22056f8b44..2cef18ca737c 100644
>>>>> --- a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
>>>>> +++ b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
>>>>> @@ -16,6 +16,7 @@ properties:
>>>>> =A0=A0=A0=A0=A0=A0=A0- enum:
>>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0- sifive,fu540-c000-gpio
>>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0- sifive,fu740-c000-gpio
>>>>> +          - canaan,k210-gpiohs
>>>>> =A0=A0=A0=A0=A0=A0=A0- const: sifive,gpio0
>>>>>
>>>>> =A0=A0=A0reg:
>>>>> @@ -23,9 +24,9 @@ properties:
>>>>>
>>>>> =A0=A0=A0interrupts:
>>>>> =A0=A0=A0=A0=A0description:
>>>>> -      interrupt mapping one per GPIO. Maximum 16 GPIOs.
>>>>> +      interrupt mapping one per GPIO. Maximum 32 GPIOs.
>>>>> =A0=A0=A0=A0=A0minItems: 1
>>>>> -    maxItems: 16
>>>>> +    maxItems: 32
>>>>>
>>>>> =A0=A0=A0interrupt-controller: true
>>>>>
>>>>> @@ -38,6 +39,10 @@ properties:
>>>>> =A0=A0=A0"#gpio-cells":
>>>>> =A0=A0=A0=A0=A0const: 2
>>>>>
>>>>> +  ngpios:
>>>>> +    minimum: 1
>>>>> +    maximum: 32
>>>>
>>>> What's the default as obviously drivers already assume something.
>>>>
>>>> Does a driver actually need to know this? For example, does the
>>>> register stride change or something?
>>>>
>>>> Please don't add it if the only purpose is error check your DT (IOW,
>>>> if it just checks the max cell value in gpios phandles).
>>>
>>> If I remove that, make dtbs_check complains. Looking at othe gpio contr=
oller
>>> bindings, they all have it. So isn't it better to be consistent, and av=
oid make
>>> dtbs_check errors ?
>>
>> That would mean you are already using 'ngpios' and it is undocumented
>> (for this binding). If already in use and possibly having users then
>> that changes things, but that's not what the commit msg says.
>>
>> Not *all* gpio controllers have ngpios. It's a good number, but
>> probably more than need it though. If we wanted it everywhere, there
>> would be a schema enforcing that.
> =

> If I remove the minimum and maximum lines, I get this error:
> =

> ./Documentation/devicetree/bindings/gpio/sifive,gpio.yaml:42:10: [error] =
empty
> value in block mapping (empty-values)
>   CHKDT   Documentation/devicetree/bindings/processed-schema-examples.json
> /home/damien/Projects/RISCV/linux/Documentation/devicetree/bindings/gpio/=
sifive
> ,gpio.yaml: properties:ngpios: None is not of type 'object', 'boolean'
>   SCHEMA  Documentation/devicetree/bindings/processed-schema-examples.json
> /home/damien/Projects/RISCV/linux/Documentation/devicetree/bindings/gpio/=
sifive
> ,gpio.yaml: ignoring, error in schema: properties: ngpios
> warning: no schema found in file:
> ./Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
> =

> If I remove the ngpios property entirely, then I get a hit on the device =
tree:
> =

>   CHECK   arch/riscv/boot/dts/canaan/sipeed_maix_bit.dt.yaml
> /linux/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dt.yaml:
> gpio-controller@38001000: 'ngpios' does not match any of the regexes: 'pi=
nctrl-
> [0-9]+'
> 	From schema:
> /home/damien/Projects/RISCV/linux/Documentation/devicetree/bindings/gpio/=
sifive
> ,gpio.yaml
> =

> Now, If I change the property definition to this:
> =

> diff --git a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
> b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
> index 2cef18ca737c..5c7865180383 100644
> --- a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
> @@ -40,8 +40,11 @@ properties:
>      const: 2
>  =

>    ngpios:
> -    minimum: 1
> -    maximum: 32
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The number of GPIO pins implemented by the controller.
> +      It is 16 for the SiFive SoCs and 32 for the Canaan K210 SoC.
> +
>  =

>    gpio-controller: true
> =

> Then all is OK.
> =

> Which option should I go for here ? If we want to avoid a dtbs_check erro=
r, as
> far as I can see, we can:
> 1) Remove the ngpios property and remove its use from the DTS, which is n=
ot
> nice in my opinion
> 2) Use the modification proposed above
> =

> Please advise. Thanks !
> =


Rob,

Thanks for the reviews and acks on the other patches. I would like to send =
v16
with your suggested fixes. But what should I do about ngpios ? Option (1) o=
r (2)
above ? Any other option ?

Thanks !

-- =

Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
