Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 194EEC48297
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Feb 2024 09:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KjP0VZRtW4UMWDvEpnEwwSBS9CDRckQ4HTp/z4NIo6E=; b=wwSlgsL9MjsIyp
	uwHfgji1UEinpxMZvj+BOE9+rATZ+tfcFHDOHQNJKqTbIKivOxyvVbC2rO2cyd7qkQSaZOGMCYLai
	seWDs9R1npmqn9VRBIYEaYbbdF5K+cTNOP5vGP1KgDn5pV4rewbVZOodqiZIKxe05RkEAY8f2pxWu
	coT+jhSMMeW8LwGpoUhl28TTk3LzgDG+nGm/T7hTFW+TJvztGnItRKlRYUdwRE4YcLbXXchd5Cqkk
	JT4Kzp4cSxvRf7TZF63d1KP21lNkejTCZrgVndE5/cFCeROhH3/Y5FDssMBsBeHrEQbQEy8sOf1cE
	T4S4qissq9Ls9JlbJD3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZSAQ-00000004gQ5-2g98;
	Mon, 12 Feb 2024 08:59:58 +0000
Received: from mail-tycjpn01on20600.outbound.protection.outlook.com ([2a01:111:f403:2019::600] helo=JPN01-TYC-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZSAN-00000004gOo-1JkX
	for linux-riscv@lists.infradead.org;
	Mon, 12 Feb 2024 08:59:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XMSy0TAItq6k6dkpXO9FFDl8QKCOBSS08MVDjnj11OktSBXZFor2tTdeYRcbtbrlD/OnxaVwXfhvFmzDXZEbOColtdfqxBnKUKeF3T7sk+kusxgsFX8vujCvD8u+d92+Sv2Oj7yXg2ryIGOGwAhZv9k9vuv3NbstX109FYHkycygVxaDZLIRw12PyklCiDDeZYeeJOfYhIDoWt1UQ8kb23eWPfkDQMoFjNvVL0l1YHW4LP0p5t3Jz+ylzBoQ5tpwCE5JSU4qhNsBRxdWJkc74nR0E4y/Hu6sR8yI8SWYhXfLgkRNzpSCcCPbwC45Kkvt+rBcC1gkZytvZ7AcX3JtzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BneneExqYj5zRde8QMX20E5RkVo6edeDUWZIHUj9iyY=;
 b=L0ugGN752DfbI7KY9hSvTsB6VnpMfeWDfM2XeUzt9U/jKzon36ffut7Lw2P+syIgSVWuhU/x42ef+G301qmbRjCOiXAVGIjOO6YO6AN/2TmKDdzBI5sbDvZ6kX4H/O/YwgW8yV6Fne+iHZCHwmxDiHVMYOw5ARG2IKq5Zf0nJa2H7KlIRpveN8V06A4ilZ8aW8lI0yzHU6aVhhJqmIN9nVnV5GFr7ywgCj+b94zlLfhchZuuTQ1GmDUMsVBOYSIQJUJGUSrUPj07shoRPGXIRXB2C15dX51mWpjVKT1LQRqLFN7B/QrDqVteh3M10q/IJjyTGjBh6U92CApFRQ5S+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BneneExqYj5zRde8QMX20E5RkVo6edeDUWZIHUj9iyY=;
 b=hDQLAufBbNbO4l9f5kSICYUHGFfG85bIYnpP999SGqHGCG5FA/jWZ4GZt6X9AVTEDaGS0piLnrboslLv78NFY3bFlU6rRBWe0n8DILmgbAalU7ePEpG4AaBzUIr9wErD2KkfmF2wH37oPsBpzHO8LG8mXH0XZuck8dK3JtPAey8=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by OS3PR01MB9929.jpnprd01.prod.outlook.com
 (2603:1096:604:1ef::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.37; Mon, 12 Feb
 2024 08:59:38 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0%3]) with mapi id 15.20.7270.033; Mon, 12 Feb 2024
 08:59:38 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "palmer@dabbelt.com"
	<palmer@dabbelt.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Claudiu
 Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: RE: [PATCH 01/17] dt-bindings: clock: r9a07g043-cpg: Add power domain
 IDs
Thread-Topic: [PATCH 01/17] dt-bindings: clock: r9a07g043-cpg: Add power
 domain IDs
Thread-Index: AQHaWox93XkHXchpTkaSnTQ6Ok/3vrEAgGfQgAAWUICAAAlS4IAACXEAgAAoXKCABYymgIAADp0g
Date: Mon, 12 Feb 2024 08:59:38 +0000
Message-ID: <TYCPR01MB11269A240E2EDD460D0B97B9786482@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
 <20240208124300.2740313-2-claudiu.beznea.uj@bp.renesas.com>
 <TYCPR01MB11269DEA9261CA594EECC949686442@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <67ad8052-1406-4dcb-9e35-5c42ada28797@tuxon.dev>
 <TYCPR01MB112698AB206332D13105C064186442@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <e170f5f8-f95c-4553-b088-1072345fae53@tuxon.dev>
 <TYCPR01MB11269015C92AA327DC6BFA76586442@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <786f90f4-ba47-46cb-b5e0-e3c42b1b741a@tuxon.dev>
In-Reply-To: <786f90f4-ba47-46cb-b5e0-e3c42b1b741a@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|OS3PR01MB9929:EE_
x-ms-office365-filtering-correlation-id: b82cdd68-bbb7-4b16-d806-08dc2ba8f188
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: o8nrYZFi6WZatuoK289cp+uRKK/mNUxDjd4dpyhzxxEK/5hwVbrRpkWVb49Uhf/+SsOeWKlXx2HHN4bM4veHrxTlZUoqRnrh6pZgmYACHwe3kZjCnPv3UHW4uW4YaQdMnilTz9tmkWbTMx7UJR6Wv5Q/wgXLcjlr+a7YUWffTKAO6xIq5TsIQ+eMqqp7mLvM5LVKa6oJ95eR2LNwDvbcYKx7sk8sFpXYp5NaQgu5FCLL02SWMHtH1vAHxuwRr9K24ZGNUiwbmKkw4ibUW6vQGMSs8xCqdRIzUjfZr67J+1z7pQIOruWNQEfbUXfvExGCsvaQAXiDdV55dOWZocFPJyL5jNiWozr2DLpGNdDer8NC/CBbHWyZUl819quDguRf0VM1tcuZgkyaqJmClylQNJeDkSi6IbPTCUcam5SlCx5tuEJrkRmiKtWASF+vUhZ/Dwndb4AVfKJoNdsgJ++k3E1SUtRl5SnJaTUXMOvWFWY43ou2L9TFBkmOszKddRvqYssgD2EHP4eTlf2bosAbEQv1cALJ3Pmc04s1F0naeKS5fhiQwpm+uoeGJ4n5KQvp05AaBlb/NjQphPwNmlE7DpEhwT7szJuuQ4QjctAaUXqVkeHlXw4+ps51H3o3N8ahOFmpy8fZMhEY5AHbEvhI4Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(376002)(396003)(346002)(366004)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(71200400001)(26005)(41300700001)(55016003)(2906002)(4326008)(5660300002)(66476007)(64756008)(66446008)(76116006)(52536014)(8676002)(7416002)(8936002)(66556008)(66946007)(478600001)(110136005)(38070700009)(83380400001)(53546011)(316002)(9686003)(7696005)(55236004)(6506007)(54906003)(107886003)(86362001)(122000001)(38100700002)(33656002)(921011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZjlFQ3ROVXdIUzIxSU5zek5obWlHWHNuc0xHS1RmQmpSWW9rSXZITzVVUGtM?=
 =?utf-8?B?SWxIQ2IvU3hPQXRJS2FoZ2cwL2puMFJ1Q1p2NkYycnRkQ29hek1uR09HTGhN?=
 =?utf-8?B?TUsyKzA2aDVBQUZ0Zmo1a1cxbmtrQUtpaHJhTHlFSS8ydW1nTkg0a1l5cTc2?=
 =?utf-8?B?WmJEVVpSa1hRSlV1bDIxbXRqME93T3lFSDhuckswb1ZrYXJkeEZRdm01aFdp?=
 =?utf-8?B?aHZmUTVlL3o0Z1JJSVJWN2ZaY2hBNXJBSTY0NzN3QmMrWkpSQmlvNkJTT1VD?=
 =?utf-8?B?aHJ0NGsrNkd0VWdtbUJXSjVoWGZVYkxiRTkvMDdpb0hrUGhVcFJjUkxRcThK?=
 =?utf-8?B?NGp5aU1lbklScWp0RWRGZ3ZlMXdyNlpBUEtJeVkrTnFNblFKRS8yVVNWNWlJ?=
 =?utf-8?B?MnV3ZTY0OUZoQWN3Z0c2dGVENWM0eUNiUUNnaFRWSmNMTmxmSDJlMWQ5RGRk?=
 =?utf-8?B?eUV2aVVEbjM5MUtIM1F2NGU5VG1rQTRoYWlSWDhXSVUyb2cvNUNjNTNrcDVq?=
 =?utf-8?B?UTdiRVF3S0JoWmZjMnVnMDM2SFdTTHI1YmJSbkQyL1lKUVBzOGZ5aVRxQzBW?=
 =?utf-8?B?YTE5WlhtMHg3ZHh2VlpYd3oyK3FiYjFnVjROUEptWEJFU0Y2VDNUWnlYRk1l?=
 =?utf-8?B?Nk9rWXRsQWZac1BYMFNHV3FMM2g1SVRTMGJFOFREQ3dRMmJpM3RYbzE0enI1?=
 =?utf-8?B?MnJ3R2toL2xMNTB6Ti95cXVIek9xSWF0L2cxSUtHSFE4TmNramsxOEJleXdI?=
 =?utf-8?B?cXEvZjh4S1ZuSTVXenEwNmRtcWpKdTdCYVNtQ2FmWjFjMWtadDlhOURlUTdD?=
 =?utf-8?B?U3JwcjZuOFo4TFhUSTF2MjZmSGxoczNBNnZrTFlHeTBLWCtLUTVQemlNQkh4?=
 =?utf-8?B?STN5NWhmdDYwcEx4TWRKOGNUdWZhQXN5TktnMWZuT1VKZndrNVV2YTdMWFYr?=
 =?utf-8?B?cG1qSEZiTU5VQXEwVHZJb2s1M1BUNXY3a053Z2NjN0swaEVrL1Y4Q3RrdmRh?=
 =?utf-8?B?NjV4eDZKbXg5V0lzaDV2RTNiQUgzeUIrSXNUS2h3eW1Xd3gwenZSMytCRVJE?=
 =?utf-8?B?N3lCVWxUNG5mc24vdWJvNDlMd1U3dTdydzUydmdUWjJqdFFaWkp3d3lIREpr?=
 =?utf-8?B?RjBFaGFJNmp4ZzJLU1cxR1pkbExkd1UvWFRMdGtUWXlIQmFvNUJTeDZwb09P?=
 =?utf-8?B?aktmY29QejVKcDl6Z3lZb1kvK3hybHB4ZzlxL1BLTGlvRS9VT29Qd2J0L084?=
 =?utf-8?B?SUh3TmFKaGF3dlVYS0pNTVRvdkZzVE5ab0hjWlZhUnc4MW8yZFcwRm52YkE0?=
 =?utf-8?B?Lzd2K3BqUE9QQjNSY2lyL09RWmszSmVUd2o0a2dyNFpLMW5uanUzb0NlOVBi?=
 =?utf-8?B?eEh0cDM0MEZkZW9hOGhsSmxheC9GTnFjK2NPOU1mTWpOQ3lucC9uRzNnTnpz?=
 =?utf-8?B?KzE3UWtQUjBQdnZrdXhWcWl0akcrZGo1dXBxc29INEV2TjZBaWtnTDJ3YzJ3?=
 =?utf-8?B?QjhzbDRjTTVObmxXOXhmNkhMV0orV05qZURFSHhpRjBFdlBYbFdaZ0pHSjRO?=
 =?utf-8?B?elZVTmZ4eEJVM2hHM1Y2ejBhdzFxQmRLRHNoanBYbHV2eENvNzVRdUxPMFkw?=
 =?utf-8?B?U3p0K2Jud1BJbVRzRlljUFc4UnhVcDBUWjJIUmhoMVBzZExMMlFNT1hHTGht?=
 =?utf-8?B?WEwvd05jLzdsdFBiNlpSUHZvMlpOWnNRZmdNWVV0czJySDhtK3YwK0prQWdq?=
 =?utf-8?B?dm5hbDlaa1dwYkRjSFFjRHZTUFZOOHZJbzFmam96SmtjMktta2QzZ0NrUFVm?=
 =?utf-8?B?QU5VT2VWVThVRk0rUGZlcHlibXdFYUJpRVU3SSs2RW0rK2NoSHBXOGZ2QWhx?=
 =?utf-8?B?K1MwR0R0Y2pMT1Uva01IQW1DNjBveThSMFAzZGt5eXlGeDh4bVZtUXBVZW4v?=
 =?utf-8?B?U3JaVk5LbzlkRTNRTUdrRUFZaS9tNnFoS1FVa2dyWllFTEhRckJjUGVEcCtH?=
 =?utf-8?B?ajJDYjVkcmZzeUFiUVB5Y2h3b2tqQVQ4NDhpK3JQYUtaOTIzRkhCUjJvT3RV?=
 =?utf-8?B?MmpIU1FERUJHanVucW5YcWxVdG85NjN0ZnhVcnplSTY4Rm9KeC9TRW1NZkJi?=
 =?utf-8?B?OE10RUp2ejNLSHM2QmhoSE9Ram1uSno4bUNpQUFTeklxRjk3QjhwaERacDdF?=
 =?utf-8?B?Snc9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b82cdd68-bbb7-4b16-d806-08dc2ba8f188
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2024 08:59:38.6164
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SOzQMo8tjPt8+jJzDc54DpvFj5VU7OokOwSaKr/sPgYOk/Iq+iLu2RZ4R4vKyvTLN4B1uRwY1L1I/ech3ucZiAJihC28cBgHvPLL4spIW2k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9929
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_005955_604991_60ED4889 
X-CRM114-Status: GOOD (  13.88  )
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

Hi Claudiu,

> -----Original Message-----
> From: claudiu beznea <claudiu.beznea@tuxon.dev>
> Sent: Monday, February 12, 2024 8:02 AM
> Subject: Re: [PATCH 01/17] dt-bindings: clock: r9a07g043-cpg: Add power
> domain IDs
> 
> Hi, Biju,
> 
> On 08.02.2024 21:20, Biju Das wrote:
> >
> >
> >> -----Original Message-----
> >> From: claudiu beznea <claudiu.beznea@tuxon.dev>
> >> Sent: Thursday, February 8, 2024 4:53 PM
> >> To: Biju Das <biju.das.jz@bp.renesas.com>; geert+renesas@glider.be;
> >> mturquette@baylibre.com; sboyd@kernel.org; robh@kernel.org;
> >> krzysztof.kozlowski+dt@linaro.org; conor+dt@kernel.org;
> >> magnus.damm@gmail.com; paul.walmsley@sifive.com; palmer@dabbelt.com;
> >> aou@eecs.berkeley.edu
> >> Cc: linux-renesas-soc@vger.kernel.org; linux-clk@vger.kernel.org;
> >> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
> >> riscv@lists.infradead.org; Claudiu Beznea
> >> <claudiu.beznea.uj@bp.renesas.com>
> >> Subject: Re: [PATCH 01/17] dt-bindings: clock: r9a07g043-cpg: Add
> >> power domain IDs
> >>
> >>
> >>
> >> On 08.02.2024 18:28, Biju Das wrote:
> >>>
> >>>
> >>>> -----Original Message-----
> >>>> From: claudiu beznea <claudiu.beznea@tuxon.dev>
> >>>> Sent: Thursday, February 8, 2024 3:46 PM
> >>>> Subject: Re: [PATCH 01/17] dt-bindings: clock: r9a07g043-cpg: Add
> >>>> power domain IDs
> >>>>
> >>>> Hi, Biju,
> >>>>
> >>>> On 08.02.2024 16:30, Biju Das wrote:
> >>>>> Hi Claudiu,
> >>>>>
> >>>>> Thanks for the patch.
> >>>>>
> >>>>>> -----Original Message-----
> >>>>>> From: Claudiu <claudiu.beznea@tuxon.dev>
> >>>>>> Sent: Thursday, February 8, 2024 12:43 PM
> >>>>>> Subject: [PATCH 01/17] dt-bindings: clock: r9a07g043-cpg: Add
> >>>>>> power domain IDs
> >>>>>>
> >>>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>>>>>
> >>>>>> Add power domain IDs for RZ/G2UL (R9A07G043) SoC.
> >>>>>>
> >>>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>>>>> ---
> >>>>>>  include/dt-bindings/clock/r9a07g043-cpg.h | 48
> >>>>>> +++++++++++++++++++++++
> >>>>>>  1 file changed, 48 insertions(+)
> >>>>>>
> >>>>>> diff --git a/include/dt-bindings/clock/r9a07g043-cpg.h
> >>>>>> b/include/dt- bindings/clock/r9a07g043-cpg.h index
> >>>>>> 77cde8effdc7..eabfeec7ac37
> >>>>>> 100644
> >>>>>> --- a/include/dt-bindings/clock/r9a07g043-cpg.h
> >>>>>> +++ b/include/dt-bindings/clock/r9a07g043-cpg.h
> >>>>>> @@ -200,5 +200,53 @@
> >>>>>>  #define R9A07G043_AX45MP_CORE0_RESETN	78	/* RZ/Five Only */
> >>>>>>  #define R9A07G043_IAX45_RESETN		79	/* RZ/Five Only */
> >>>>>>
> >>>>>> +/* Power domain IDs. */
> >>>>>> +#define R9A07G043_PD_ALWAYS_ON		0
> >>>>>> +#define R9A07G043_PD_GIC		1
> >>>>>> +#define R9A07G043_PD_IA55		2
> >>>>>> +#define R9A07G043_PD_MHU		3
> >>>>>> +#define R9A07G043_PD_CORESIGHT		4
> >>>>>> +#define R9A07G043_PD_SYC		5
> >>>>>> +#define R9A07G043_PD_DMAC		6
> >>>>>> +#define R9A07G043_PD_GTM0		7
> >>>>>> +#define R9A07G043_PD_GTM1		8
> >>>>>> +#define R9A07G043_PD_GTM2		9
> >>>>>> +#define R9A07G043_PD_MTU		10
> >>>>>> +#define R9A07G043_PD_POE3		11
> >>>>>> +#define R9A07G043_PD_WDT0		12
> >>>>>> +#define R9A07G043_PD_SPI		13
> >>>>>> +#define R9A07G043_PD_SDHI0		14
> >>>>>> +#define R9A07G043_PD_SDHI1		15
> >>>>>> +#define R9A07G043_PD_ISU		16
> >>>>>> +#define R9A07G043_PD_CRU		17
> >>>>>> +#define R9A07G043_PD_LCDC		18
> >>>>>> +#define R9A07G043_PD_SSI0		19
> >>>>>> +#define R9A07G043_PD_SSI1		20
> >>>>>> +#define R9A07G043_PD_SSI2		21
> >>>>>> +#define R9A07G043_PD_SSI3		22
> >>>>>> +#define R9A07G043_PD_SRC		23
> >>>>>> +#define R9A07G043_PD_USB0		24
> >>>>>> +#define R9A07G043_PD_USB1		25
> >>>>>> +#define R9A07G043_PD_USB_PHY		26
> >>>>>> +#define R9A07G043_PD_ETHER0		27
> >>>>>> +#define R9A07G043_PD_ETHER1		28
> >>>>>> +#define R9A07G043_PD_I2C0		29
> >>>>>> +#define R9A07G043_PD_I2C1		30
> >>>>>> +#define R9A07G043_PD_I2C2		31
> >>>>>> +#define R9A07G043_PD_I2C3		32
> >>>>>> +#define R9A07G043_PD_SCIF0		33
> >>>>>> +#define R9A07G043_PD_SCIF1		34
> >>>>>> +#define R9A07G043_PD_SCIF2		35
> >>>>>> +#define R9A07G043_PD_SCIF3		36
> >>>>>> +#define R9A07G043_PD_SCIF4		37
> >>>>>> +#define R9A07G043_PD_SCI0		38
> >>>>>> +#define R9A07G043_PD_SCI1		39
> >>>>>> +#define R9A07G043_PD_IRDA		40
> >>>>>> +#define R9A07G043_PD_RSPI0		41
> >>>>>> +#define R9A07G043_PD_RSPI1		42
> >>>>>> +#define R9A07G043_PD_RSPI2		43
> >>>>>> +#define R9A07G043_PD_CANFD		44
> >>>>>> +#define R9A07G043_PD_ADC		45
> >>>>>> +#define R9A07G043_PD_TSU		46
> >>>>>
> >>>>> Not sure from "Table 42.3 Registers for Module Standby Mode"
> >>>>>
> >>>>> Power domain ID has to be based on CPG_BUS_***_MSTOP or
> >>>>> CPG_CLKON_*** As former reduces number of IDs??
> >>>>
> >>>> If I understand correctly your point here, you want me to describe
> >>>> PM domain in DT with something like:
> >>>>
> >>>> power-domains = <&cpg CPG_BUS_X_MSTOP>;
> >>>
> >>> MSTOP bits are distinct for each IP.
> >>>
> >>> <&cpg CPG_BUS_MCPU1_MSTOP x>; x =1..9
> >>>
> >>> 2=MTU IP
> >>>
> >>> 4= GPT
> >>>
> >>> etc...
> >>>
> >>> Is it something work??
> >>
> >> It might work. But:
> >>
> >> - you have to consider that some IPs have more than one MSTOP bit,
> >> thus, do
> >>   we want to uniquely identify these with all MSTOP bits (thus the
> >> 2nd cell
> >>   being a bitmask) or only one is enough?
> >
> > We can have an encoding in that case 8:16 24 bit entries
> 
> I consider this complicates the bindings. I don't consider this is the way
> going forward. But I may be wrong. I'll let Geert to give his opinion on
> it and change it afterwards, if any.
> 
> >
> >> - some HW blocks (e.g. OTFDE_DDR) have no MSTOP bits associated (as of
> my
> >>   current research), so, only PWRDN
> >
> > Why do we want to add power domain support for DDR?
> 
> To power it up (in case bootloader does any settings in this area) such
> that the system will not block while booting.

DDR is enabled by TF_A and is not touched by linux, so why are we adding
Power domain at all in first place. TZC DDR is not accessible in normal world.

So if you don't add DDR power domains, linux doesn't know about any thing about
and it should work like current case.

> 
> It is explained in cover letter:
> 
> The current DT
> bindings were updated with module IDs for the modules listed in tables
> with name "Registers for Module Standby Mode" (see HW manual) exception
> being RZ/G3S where, *due to the power down functionality*, the DDR,
> TZCDDR, OTFDE_DDR were also added, to avoid system being blocked due to
> the following lines of code from patch 7/17.
> 
> +       /* Prepare for power down the BUSes in power down mode. */
> +       if (info->pm_domain_pwrdn_mstop)
> +               writel(CPG_PWRDN_MSTOP_ENABLE, priv->base +
> + CPG_PWRDN_MSTOP);
> 
> >
> >> - some HW blocks have both MSTOP and PWRDN
> >
> > That will be an array right?
> 
> I'm not sure what you want to say here.

This has to be an array PM domains(multi PM domain) like clocks?

Or 

It can be  handled as sibliling power domain like sibling clocks in RZ/G2L Gbether.

Cheers,
Biju
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
