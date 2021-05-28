Return-Path: <SRS0=2wW0=KX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45FF8C47087
	for <linux-riscv@archiver.kernel.org>; Fri, 28 May 2021 08:58:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F350261222
	for <linux-riscv@archiver.kernel.org>; Fri, 28 May 2021 08:58:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F350261222
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=CKM/twaFxek/FP/UNnmWDiJD3Cr+Es7DmyfurAtcWuY=; b=0HSkKrdd5sn5GY
	r0aAZ0ieBVdbiao/iQMRBPMfKEn6JJWjn3FYWvSDNWmeZSuAw3x09+aPV5zcP+o6oA0Qbg9rJFmT5
	72zejNHNOw3TGsWTDrCM/RGAcA3v8P8wzVAUnh2oSB88NdgAiTzQIHPGBtf+sc3W1gguStGp+hfQR
	0hQ8jBNEzYCCPXsVwNXJ3tU8EqqnErWKHETU96PLbB707IhJzpKyFe9hfm7NvMbqvt4IfLrw1GNX9
	vsCIPljRbSivq4VODObCq23DBq4cCQsZ8wYZqQvcWMz1wga+IJMBMHhtRPTOLukoXMXZcScs2Z8MQ
	YaApJUlT+9uAM9x2Fn4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmYJu-00DdBc-8Q; Fri, 28 May 2021 08:58:18 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmYJr-00Dd7v-0R
 for linux-riscv@lists.infradead.org; Fri, 28 May 2021 08:58:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1622192296; x=1653728296;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=FKd6bciYmCkxjT1KHA/7dsvJQwgiurV+m95NQiLRW54=;
 b=ROe2120eR9xBP0XDKlzzoy46GjxEBT+q4j9RUgVb18j3ksTT2wtDYYKx
 J37Dw05LFPRo1X1wYj7hQ4g0HSAhMwUvtcm4PSj1vJ41utixtdcIxw4Dt
 PQFYHiXYekLcJQMqQyOYDK6+GXWxxZiGyjDiwdN0N3R7i00XcchDuqKOJ
 NI75pRl0a4dIkQTiYwfv351ES4OjRaqlaG+aA8RgEpS2yQB79L9rcgD40
 ltbOD1fXcpENY6HMX4nZ8XxCdSnruv/mtGXCTMw760MJ04Wq0leF8ed2K
 QiS3ubEpZID3TpacikywT1K2kM//wAruaxWWuCsKWPT+vO607zZAx1v05 w==;
IronPort-SDR: XM2gtNkLpZbCPpYAO/30cHhIaoKy8y7dGqw3vMWY7yP+8THFHJJsmGHNdfOiR254ClfYcBfjW/
 WdFJ2cBlM2o/xVpg2/uSjIRs4zSUbKDnBRS2mwxJ4znSOaF/1JhoSvNzlhIYV5OSFsQXmpZixm
 X9UPGsmzgk+CWvLYV/hhCidPRCQC68pNYAXdfwYdisVNtNYZeksRKcTFW2mS52+cH278p614Bm
 EDS3LT3EPIHFWE1B3/lWgthZhyj96DAbiXw8tRECvGtiF4MwD9Bvw72UboTFQXelRTiN96ZW7D
 5e0=
X-IronPort-AV: E=Sophos;i="5.83,229,1616428800"; d="scan'208";a="170323223"
Received: from mail-bn8nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.168])
 by ob1.hgst.iphmx.com with ESMTP; 28 May 2021 16:58:10 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SKty2aw6pRyeKp0W9CBDhbgdEa1Vz3B5+xlmZs2avqwT7g0x3sV7Nonoi5a1NjCHoB0R9jNZLszOIpKxFkJkaIaqZQbUUIdwZZ9FUU1PrRon8uPuJl6ljlSBFKr2MtL5mQFAz45DH36NgTAt9H6r29sT70O6tpJMNPKOonL369wtSO+vWyMazgSeeQkpyQTChr8xwVgecQ6oAcGtEcPQQ+LD5bTxL+LMx9X2+z9Dc0xnj+oYmpxdW1dBin7H6WKvHjbuwaAvQLBJetYt/Q68WmvyeRcHS8xmy++NyTknoSH3xf3L/Araq6RqHN3CBWTmf06gC5eO5ne3q+hLxa6K9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N8jSMEjtN1LhRoPwET+juO87LfQAT8u4kTaRPaHtS44=;
 b=GDfDqSQi2CeLGLoTiH0zbV4CZaUwkJop9GEPQYLWXniGzFghMbhFG7lDtmLd8Tu2OSbomLqCmNV2Pna3xrxVGurLv8lciY+tmAYpR2EwXIK4s8eC9Vdmqsft0lqEN1crylunlUR3i5P713kwrQspvTkiOf/5uFtRbEuQzZb8KPA4t9pMh41ZD44/I+wzE5PP6ozqPxKA5i1xSMtyOk4uNi1zT2E7fo+e3UwytK+Fi7CU9WoEux04Oz9y9MhSoM+qU9vqp9re8iMw6ryy0npr3xsENI3Tu4n/Me06GK4hucEfBuN3LH9zPqA82AU6/nDTkRD/FI+WoBv4fHmhJvH96A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N8jSMEjtN1LhRoPwET+juO87LfQAT8u4kTaRPaHtS44=;
 b=E9mO0eM5+w7ZV9Lhzs2kZu0IXcGB7tpiVzTU3WNf0j/8k4AtajbsR65viR+F1rR6q7qf+/zkQbDxIgT0OpDhLZNHWkyyTqU3Cb3+MwGqzpYLLbeYd5SyXyOgR6Hjxbl50c7WGd5SaQ3L6FySMp/PsVRaTZvov6BnVhVm2ZHhAsk=
Received: from CH2PR04MB7078.namprd04.prod.outlook.com (2603:10b6:610:98::9)
 by CH2PR04MB6522.namprd04.prod.outlook.com (2603:10b6:610:34::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Fri, 28 May
 2021 08:58:07 +0000
Received: from CH2PR04MB7078.namprd04.prod.outlook.com
 ([fe80::4506:831d:3073:8a57]) by CH2PR04MB7078.namprd04.prod.outlook.com
 ([fe80::4506:831d:3073:8a57%9]) with mapi id 15.20.4173.024; Fri, 28 May 2021
 08:58:07 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Paolo Bonzini
 <pbonzini@redhat.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel
 <anup@brainfault.org>, linux-riscv <linux-riscv@lists.infradead.org>, Anup
 Patel <Anup.Patel@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>, Palmer
 Dabbelt <palmer@dabbelt.com>
Subject: Re: arch/riscv/staging
Thread-Topic: arch/riscv/staging
Thread-Index: AQHXTeXRiqrAsGq9/0GkDSZAPwkNlQ==
Date: Fri, 28 May 2021 08:58:07 +0000
Message-ID: <CH2PR04MB70782F16D88C700AB621D1B6E7229@CH2PR04MB7078.namprd04.prod.outlook.com>
References: <DM6PR04MB70811AC515371C5728DDE6A2E7299@DM6PR04MB7081.namprd04.prod.outlook.com>
 <DM6PR04MB7081D11851CD0D3863C4ABA9E7299@DM6PR04MB7081.namprd04.prod.outlook.com>
 <9eb59267-542b-8adc-07-d795f5a43098@sifive.com>
 <CAAhSdy3RFGEq0+ZWUjsVCsmR8EvQzs6JOQMRXt7+92wNnCE27w@mail.gmail.com>
 <53424413-4a31-7a12-759a-49e3f41f11a@sifive.com>
 <9f107eaf-cc6e-d554-c923-62fb317c4d4b@redhat.com>
 <YLCvdmwPrm/S/GKg@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:4140:5e35:28b2:297]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d96befb3-d159-4a37-7f1c-08d921b6b666
x-ms-traffictypediagnostic: CH2PR04MB6522:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR04MB6522909DFA20D3B8496A4FB2E7229@CH2PR04MB6522.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aoj6Tb+/S4xEiV0Jfkas5kN5Pa78dmWsWnwMtMr80wvK6dvBljQL8cD5Dtyeim5szINFK3M9jTX0LxR3TbPK9DI3b9FhbpcKCuMUQvUvs12BR7PKxDiAfnBzvl8TtScTDp2cianIg+NIisqi4yhL3dxof7HJfQlxiTVUR7a6UTBSqXvbRZIi7ndUJhSohaGF1yKXH8hckzzYgKXcvNHWrKEsJNaBuAwC8H9Oc34JWO57uCf6deGkMYDDdmpaf+7Lsfq0fHpTthgnak1VJaDN+CBarCTTt/Vj1J/6Twz0e6kNIATeMkhh5AlyRHefTyiwa3gGdQD/Jd7VwNp391SkjBtwbWAKCj2SL+wq8WjV5rnaLOWpuikbIjGKtLqkBA0h8JPe3uA17DGnfwyks7u96lDon/2WHcoBUrMOg7SUVrPk1XeJz/6dDSQt7kmImr5ODICcThJLkGyjfE2XhPT4I3pKEeLt618wn7c3G96CcVLgOiOoEjH70QLI4m5V5eUcOe8uVP8Jv5HqNplBS0iM9vngg1AhJTBlDXYRdU3oOsDNZIR86TnKB4tqmydQRoW8kvY4AsIEAmuLIIYFRkFVch2oCeHU3gBuVpMdefijQOfi9KMaHbMQMj3hkshk1BSXhAGTQSVhL0z21VjzcexFgyjj4rtmcPNb9xvFsXFy62uLXZ2+T3J48kPlmHtxWUVbDhySKAotOJTl/TR/I8tX0A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR04MB7078.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(39860400002)(396003)(136003)(9686003)(52536014)(4326008)(5660300002)(91956017)(55016002)(66946007)(76116006)(64756008)(66476007)(66556008)(66446008)(6506007)(8676002)(316002)(33656002)(7696005)(3480700007)(478600001)(53546011)(83380400001)(186003)(71200400001)(54906003)(966005)(86362001)(8936002)(2906002)(38100700002)(110136005)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?edCusrXs6HKBt7bQ859aIPtFXdnHj6fWWGc2m7+hGjVe60GWu7N/csdkCg9k?=
 =?us-ascii?Q?MMKpnQqSDzGb5pArDrc/bZwVe+6eWuR34yqpebDq1IaMkqMQgglHIgTapQd9?=
 =?us-ascii?Q?ON1qgD+bBShy2M/WlAbu0649Edzk7otJZIhOHeYgDMfpZSeveWCkKMqp5t3N?=
 =?us-ascii?Q?mNfnRxuzLpR1nR7WV+YRPEVRvEvCPbBHE6zi/520reAY7v3qTFhBCTB9yFS1?=
 =?us-ascii?Q?VeBTPEnioXdeFgxPFfYVAt8r60XC1EyqqvcIHsjUip42yNgrh42yR9n7X95U?=
 =?us-ascii?Q?2+6s6zsAU4UnrNq4vo2MU+HcJ4LOE0uftuUyojdj7+8Q8IfVTgmm5mWEzWks?=
 =?us-ascii?Q?Y7FiRvA+fGTcZmjOu41z4v+oi8KNc2q7ZNncxzBymXug+Gia30rlO8+nlfty?=
 =?us-ascii?Q?31+UYjCGv8XJ01iynluG5o8j9JeMbw8wK+2bhWBvCNYdXjyzdwNXcaWSDBUO?=
 =?us-ascii?Q?9BCmdH8XiTrFG14TN4M9TpkqzfA4y7lOiOqf2d8vKiPGI7qWsgCPNinP3l9n?=
 =?us-ascii?Q?2+zsc4ktZmcDNlBnhrM8mqbNigMh/co5DKtV9w1wZczYAKvDLqWcm9jlPKA3?=
 =?us-ascii?Q?0KZPxumyhlPIPHPIturhmffTL3I5oLFJ0C7d/Mp3HTXTv9SNP3cVKSdHHH67?=
 =?us-ascii?Q?Lv58zq4pNgvw3ha8aN2d5zaNvHI7HqbvMOfB6SeZUT/+OtVIDpLC7lR43YJ8?=
 =?us-ascii?Q?Uy4LuvgCAhtJ+JnnGpoCYR+nNY7A+RoZXsh4Knfs0THDw3rLIkykk48p32yH?=
 =?us-ascii?Q?bNoWLC3qhyPPrMAgCsEscTxId7yjOLBlT3xAhpOqtYs4AgyjHJfwqv9PAQtA?=
 =?us-ascii?Q?TIwPR9KNjfrowUZh7gzHdLHJss9f2kIhIN1m/g39zcHOkUGMovry9qmuL4EP?=
 =?us-ascii?Q?aWzh/5q3X+vB1coI5TMVc0nX6QTImbYvNrNKxhB2picNyGklCIruUiVdV1Ks?=
 =?us-ascii?Q?Jq0a2pQrZVHt/PXPtlJiLwRtvo7u36p0oa96Ev7hAwLppHTqUCpPsmgMMQtn?=
 =?us-ascii?Q?KInsllaBnxSEXFb+SycWuEER+YMjTxcDLN6Uf5aX2L3vzHT6y+2pgdjw+Myr?=
 =?us-ascii?Q?sAw1qHll059XqxzMNY/ZdEaoXGEquiHsttg7AlT3q8yf1+zpVmbbyeSF57Wb?=
 =?us-ascii?Q?yYIVYBw+eZdEuNzgLbRpJuf+7nxfUsVttFnDZvjuWXdhZi2Ye+v0WTm0rEVR?=
 =?us-ascii?Q?nzGHY5X3cGIxcgF/8iyeZec9rUy1Nd7o41wLPSJL7Ry1p9YRk3yTRsZTqpgT?=
 =?us-ascii?Q?PmVzGQiZwOqeMwxgbL24v7/Wd/9XkCWlJKA5qIslGJsFVjXnH+js02N8PyZH?=
 =?us-ascii?Q?F6ID4SbcAMHs6JnFo30LUFgp7GP9YqVjUHD9o5kQ5Xoyh9UVl3dT2QTP4/s7?=
 =?us-ascii?Q?rtPjrL9jFAWIppcw6fc+aOWue35W6LxXz3wFGWnpJl7oyWZ0oQ=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB7078.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d96befb3-d159-4a37-7f1c-08d921b6b666
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2021 08:58:07.6386 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZU+89g0r9L9LmHUWGjTVyI7NKmWEABJLzJcoYduULW9OtQ1HIthjP+jCGCPWzH0ZbTIeysgzBLjTPDVoqzrcjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6522
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_015815_238110_67113747 
X-CRM114-Status: GOOD (  16.53  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2021/05/28 17:53, Greg Kroah-Hartman wrote:
> On Fri, May 28, 2021 at 10:29:16AM +0200, Paolo Bonzini wrote:
>> On 28/05/21 03:06, Paul Walmsley wrote:
>>> OK, well, maybe you and Damien can get together and spell out what you all
>>> are concerned about regarding forks.  Then we can see if there's anything
>>> that should be done to address it.
>>>
>>> Right now the only fork risk that I can see is related to the architecture
>>> itself.
>>
>> The risk is that improvements to KVM RISC-V are developed in forks rather
>> than in a single git tree.
> 
> Eventually they need to come back into the mainline tree, so that should
> not be that big of an issue.
> 
> If it is, again, get the spec finished, what is preventing that from
> happening this week?

We (kernel & riscv software developers) do not get to decide alone. RISC-V
International specification group decides. And our input does not seem to have
much effect on the completion timing. See this thread:

https://lists.riscv.org/g/tech-privileged/topic/80346318#465


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
