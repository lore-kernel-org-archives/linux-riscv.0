Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70059C48260
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Feb 2024 16:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ict31vARrwuDwleYYbqa5c1hxXM5scaTdaXUknl/iA=; b=lh23X8/cDuEVuU
	CaSHory/DNS62xqRkpJ3NAENJAUof2XFAFYxQ0WokFJ6z2/zYlR2eP4tesBcsubFUBasdczjK+hX8
	m2ZjH1ASydtCQPLDK1EG7v18uHvjijRalvqVCDgGhttxoDA4OHLlueN+mZg13r40Gq7Rj2V9L/lH3
	5qp43DABCUE3VUJwZRhZJgKLv5exTI3EcNbDxuR2WnX0RRG6NZNUsmWjFfoKyqwHdlvLwJHB70C2G
	feO8dbUb38lrRDulmc5oYrkEMYtNMmfEsKxxRbCZxqgKG1fftHjDq1ryHfznEWx4b3lNIOvf4riZl
	Nfa0r+DCAL04yfx6vG+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY7GI-0000000EJGu-0Ryy;
	Thu, 08 Feb 2024 16:28:30 +0000
Received: from mail-os0jpn01on20600.outbound.protection.outlook.com ([2a01:111:f403:201a::600] helo=JPN01-OS0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY7GE-0000000EJGA-0qm6
	for linux-riscv@lists.infradead.org;
	Thu, 08 Feb 2024 16:28:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FOXpIWk2kjovGzHJ/2iny+RrvhMlvmftpp0SJ5BKliLyPGESZyyykm6wso4lkRiRmbo/+03IIbvMa+SJKNvKe6ScuXBEmhNYZzwK2HPRvW8wbCmcbj9cnLZvN8yPcbwqwmErmQOOrWQLLHJCFbRWXH2peZeFG6QQVXKv7tkzyzj8RNvR5tIr3wgolYysnxh2mLbcci2pSG/M0BzcPWkECYHVkwAKJfqFZAg7XtVUdw70Fch7ncbDZps96fV8oaED8AY+gQ8KCvTa6mhWNZGeup4ZkYwL3uK1t0tepZZdR9m7hl3JYQxZHzyML/HC2Gc6LVpQMzh2oAbmmbtLs5cChg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mvEA0VsxZAsKoVWV/S5wqklRu4q8G7rlWgnAp4dtUy0=;
 b=GcFEnnpJvfnVIrqpipesYq9S65ZSLXkKJnhY8Ter81G9TAyFR6aC6uAv04DQjSOy42XWhEEgK4wJHjrwAFwJHk5NioR/jh+UfGpKb7hamk2bhMDVOTOUZx8xOX5TA0pxK9siTzC5GD+pfabHhGtxS4n3j+NORMHnsNE8I+zIUYYyFu93pnX8+8+5521q48MMFgPyiM35Qodd1mXUDQv9XQcGQxAf/DZM6oiPYTnypiFOCpZ9CYkbtVCDfJMy+Yb3JInUvtgLYZNUzEJEUY0OdEHNJqHjaB7Prpnn/SlmMEol4r+MPn6bGdnQ4TsvBuQdalOSEKH/AqnNiUliEXRvWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mvEA0VsxZAsKoVWV/S5wqklRu4q8G7rlWgnAp4dtUy0=;
 b=BjWdpW5Xb8q0jsf9GMEDpcpPSDyY+0EG5md2+L0gEZlsirypRvR6VDvPtQwBnz0m/B78o2SSIfqrHDpJ1VeBMC9ocaBfNrMO7pejW/MuCLscX8WnhrvoG0pX+WCVeTor1PArCDauknPddA7kR6RrXJviotQxlJPXp+k+YYPHa2U=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYAPR01MB6220.jpnprd01.prod.outlook.com
 (2603:1096:400:84::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.39; Thu, 8 Feb
 2024 16:28:15 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0%3]) with mapi id 15.20.7249.039; Thu, 8 Feb 2024
 16:28:15 +0000
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
Thread-Index: AQHaWox93XkHXchpTkaSnTQ6Ok/3vrEAgGfQgAAWUICAAAlS4A==
Date: Thu, 8 Feb 2024 16:28:15 +0000
Message-ID: <TYCPR01MB112698AB206332D13105C064186442@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
 <20240208124300.2740313-2-claudiu.beznea.uj@bp.renesas.com>
 <TYCPR01MB11269DEA9261CA594EECC949686442@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <67ad8052-1406-4dcb-9e35-5c42ada28797@tuxon.dev>
In-Reply-To: <67ad8052-1406-4dcb-9e35-5c42ada28797@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYAPR01MB6220:EE_
x-ms-office365-filtering-correlation-id: b3adf273-e04c-4725-7cbc-08dc28c2f387
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0KpWX2Gp32TCG2F8h5gqKRPBDvhlSlsQxF8im+6rwCXpSZrez/Y3w0zN54aEzqWGeVcR2jnKrEOuoptMnTOhLl81FTwTsAXrcYGRM8bTzGw/xs+nNuURTyUIUW4Bc8NbUyIZjFklJjU1cvVdoUt1x8us0U6s/Z0JwuA/UypR3CXwaCgsVhZmdofy4KRKRt3qg+81FDH81PTOPtIkLtHEUsw0GIWhGpyL5pCkGrQcl272lYTohD6SYRogPWYLUbDfJOgahsBg4sJ6wbhlBhiKeGiZSf2D3TifhA/scYpqokuHw3lMGCb11HwYhm+wINSZa1dYZVBjD+ccYmbiVq3TV4YPH03/ahGDoKyyBVZsIQMMdSXCGH2BrH2PgEnV0TcjENHHLRtB10Urpc4zdC1UI+C3f/nBz12DeTHj/2LrnexbuBf/MuU+pr/CBI4tL7yfGAwC+g80pUnOKpLcqJULBfBe7Dv6f+4h9JXi1exmtctW7Rtn0zMQ9aOfbz3qr4M1YTV8d9XqNYRkBXwjdVQFh1orc8zaotRDtseGeWEAqDuXs2IQigVuxj7zFMokwCs44p1VPWO6Zo3LB8XZuqwcMmt5TLLkM30Jk3weuzDXn6gBzjfN4Z++xEaDBQOQfAxBIrY2n9pdUlYdaQtpKz0mug==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(136003)(376002)(366004)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(41300700001)(38100700002)(66556008)(66476007)(66446008)(64756008)(54906003)(7696005)(110136005)(76116006)(55236004)(53546011)(6506007)(9686003)(66946007)(478600001)(71200400001)(38070700009)(8936002)(8676002)(316002)(33656002)(122000001)(83380400001)(107886003)(26005)(86362001)(921011)(4326008)(2906002)(52536014)(7416002)(5660300002)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RThPcDgxbXdmTUY3UlR4R3RIdDV1c2txMURyY0Y2TTV5cjdyYWdhcWcwckxN?=
 =?utf-8?B?dnZKcWhiKytWY1d6TkV6T1FZQ1NYMnluWmpVMnAvM3oxZGx1S1hjeEJ2bjZM?=
 =?utf-8?B?TkJaOE5XZnZVRWtPZ2F4eXo4WDVpWXVYUForZW9ZVm5DN3lrWEdlclVIQmNH?=
 =?utf-8?B?N2JKYkVzK0hncURNLzZTbDB2VzJSZk1zbXd0UC9ibFRKeTAwRjl2M1JCQTRq?=
 =?utf-8?B?emNKaWdlclRDamxWOHozT1FxS0ZZL0xhL01Sb3ZMS2dvQWJpOUdDL1NmeCtq?=
 =?utf-8?B?YTdQK25KbmowRVNuSVJCY2dPbUNjMjlVSXJnT2k1VzNCeHFVWnpuSE1lVm5z?=
 =?utf-8?B?RklLa3B0aTJQenE2UE13VUwwNFQ4ZWxBTEtEL29wR2FIVjFiSkVBTi91VEJU?=
 =?utf-8?B?L2s3TXR5RzN6TVJ3dWUzZVp4dTNSejZlbDlPaEtXei9BL1NoTk0vYlpHTDh1?=
 =?utf-8?B?eHRaSHE0UEUxZWhTNG9Vb2wvQm04dGE4aC9DSG9YR250YUNvcWpFZUsxcERF?=
 =?utf-8?B?NnU0R2hLRFN1OHMvREt2SmdNZGxEVXBWK0NhWVQ3QUdLZjErMm1xR2NBaFZ3?=
 =?utf-8?B?cWFUNjlqdkpjOW9RLy9iSXV4MTVDM2hFRzVjdE54WWlzSUtrQUtxVXZFNXJn?=
 =?utf-8?B?elp5NVdMeXEzdW40UmJNTGs2RDVmMkFpbSt3TGwwQU5yQjVwS3orazc0Zk9z?=
 =?utf-8?B?U2N2U3NRR2VoZWRFOWQ1QUYyVkRWRkdydSt5eW9IZy9GUjdyeE1yTUxLdFY0?=
 =?utf-8?B?MmQzMjV0SXhQRXk4MExiSStmVmtTSFJQazhIR3UyMWRUV0Z5eEtDQmZWQWNo?=
 =?utf-8?B?T2dMVnlVOGR1ZlpqOERTNmFhakJ4d2hyVjM2bEsxWkJGbFJDNzhkVGtrOWJH?=
 =?utf-8?B?cjRZZzRmcVFuVHJ0N0ZVZ0VUL2p6NEMzREVUK20rV2RQZnMxVkJabTVia29s?=
 =?utf-8?B?VWRscFo0cWNJcEFyVi8zaU9uQVZrMUFnSHg1L2s4WjlyMFZqSExiZWJUMFRI?=
 =?utf-8?B?ZHVFS0pGdERBZVAvc1lpT00rcUdWV0FKS2RTaml2cXBZemwvakhOSk8xNkE1?=
 =?utf-8?B?c1JSd2VZZTV2Nkh2N2xCZHgwYzdURXB2MHdvZTZkVXZQNHNCNklXMlMrdjJ3?=
 =?utf-8?B?S3BCT0RoOWs5TTMvZ3BXWDgxZmE2ZG5uVG5QdEIrbEpUdU0wejhJdUNZeVg5?=
 =?utf-8?B?em91MnNPT05UNitZTjAwdjZTNHNnNU9naXE0MGREQ3c0NXo2Vk1NOE15eHUy?=
 =?utf-8?B?a2hRdjN3aURYREdCVmhtK09LR1hCNlFQWXg0Q0tUOWNGaWtHYTRMbHBBR1Vo?=
 =?utf-8?B?alk4THk3VnhTSTVtYU9Db0NqQVVBazhIRnI4RkhJM1FvdXY3Ky9aV0FPTEtX?=
 =?utf-8?B?dWJ2czZlQjI5WEtVY0FHMm04MXJjZmJEZERTMTZ0cmtFTDJISHpvNW93cFg1?=
 =?utf-8?B?ekpqSFk4WkN3N2FxT1VNcGV0elIxUGNHMW5aU1d2WWt0eW5uYkl5UmRhOHBm?=
 =?utf-8?B?TXl6aVdwdU1mUlV6QkxCeEtIbzRBZEw2eWNHdjZlV1ptb2NRbS9ub0kreUxr?=
 =?utf-8?B?cjE1dDdoUzUwSUllVVBUeis0VUJNTHRUYU9hS1JwdlRrQWZRSEtzTG0wcWhy?=
 =?utf-8?B?bUFCSDlrRDM5NlZvYTlsSndOb2orcTBUUXk0SkpKOHYzWDhFSFh3SXZIaHB2?=
 =?utf-8?B?NkFxQXp2OEd6SXAveURMaUpZTXQxazY0ZHNEUDdLSUZDeFpQQ3lldkI2cEFa?=
 =?utf-8?B?ZkhoZUFkOTFubDVPZi85WldoT25SWFQ3ZEhqZVlibk5qUWROTmYrRlhBVXdK?=
 =?utf-8?B?N1cxRjFldTFySVBYa0Jocy9BZ25YbGRRSUdqaEM2TVBEZWhNK2hDMXdjdEtX?=
 =?utf-8?B?dHZYZWI3b2NTeWE0SnY3K3NHby9FQUlDZktSRm05MzZXMC9vN2pacmJvZjQy?=
 =?utf-8?B?d1FVckJKNEx0WWJoamJWK2lJR0N0TG9kTS9PT2J3cko2NTZrdTNMQVlpQ2x5?=
 =?utf-8?B?ZkJBTzNDaWdwYTg5ZlpxK3IyaFNhanRONHhicWsrdGkvRDljWG1Nek5reC9q?=
 =?utf-8?B?QzhhSEp1UzRXRXdISUhKNk80R290d1p0OE1KU1BNRElrczZiY2ZCZ2dDVjFp?=
 =?utf-8?B?RG9UcWtIZWRvQVFBaXM3Q09QK2xvRDF6M3RwTkpzNW95UnBQOVdHVWdYaXpO?=
 =?utf-8?B?MlE9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3adf273-e04c-4725-7cbc-08dc28c2f387
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2024 16:28:15.3654
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y4EW43IZL6DjSnd4B7DGzGjIMSsFXbl9j/4EDTjCapj+x8K/8lZAbMmMqmKhiBb/NqPKvsTsaihOhozDrCz7KTQtaWfAMk0Sdd+4xUhSIdU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6220
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_082827_360173_A89EF98A 
X-CRM114-Status: GOOD (  22.74  )
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



> -----Original Message-----
> From: claudiu beznea <claudiu.beznea@tuxon.dev>
> Sent: Thursday, February 8, 2024 3:46 PM
> Subject: Re: [PATCH 01/17] dt-bindings: clock: r9a07g043-cpg: Add power
> domain IDs
> 
> Hi, Biju,
> 
> On 08.02.2024 16:30, Biju Das wrote:
> > Hi Claudiu,
> >
> > Thanks for the patch.
> >
> >> -----Original Message-----
> >> From: Claudiu <claudiu.beznea@tuxon.dev>
> >> Sent: Thursday, February 8, 2024 12:43 PM
> >> Subject: [PATCH 01/17] dt-bindings: clock: r9a07g043-cpg: Add power
> >> domain IDs
> >>
> >> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>
> >> Add power domain IDs for RZ/G2UL (R9A07G043) SoC.
> >>
> >> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >> ---
> >>  include/dt-bindings/clock/r9a07g043-cpg.h | 48
> >> +++++++++++++++++++++++
> >>  1 file changed, 48 insertions(+)
> >>
> >> diff --git a/include/dt-bindings/clock/r9a07g043-cpg.h b/include/dt-
> >> bindings/clock/r9a07g043-cpg.h index 77cde8effdc7..eabfeec7ac37
> >> 100644
> >> --- a/include/dt-bindings/clock/r9a07g043-cpg.h
> >> +++ b/include/dt-bindings/clock/r9a07g043-cpg.h
> >> @@ -200,5 +200,53 @@
> >>  #define R9A07G043_AX45MP_CORE0_RESETN	78	/* RZ/Five Only */
> >>  #define R9A07G043_IAX45_RESETN		79	/* RZ/Five Only */
> >>
> >> +/* Power domain IDs. */
> >> +#define R9A07G043_PD_ALWAYS_ON		0
> >> +#define R9A07G043_PD_GIC		1
> >> +#define R9A07G043_PD_IA55		2
> >> +#define R9A07G043_PD_MHU		3
> >> +#define R9A07G043_PD_CORESIGHT		4
> >> +#define R9A07G043_PD_SYC		5
> >> +#define R9A07G043_PD_DMAC		6
> >> +#define R9A07G043_PD_GTM0		7
> >> +#define R9A07G043_PD_GTM1		8
> >> +#define R9A07G043_PD_GTM2		9
> >> +#define R9A07G043_PD_MTU		10
> >> +#define R9A07G043_PD_POE3		11
> >> +#define R9A07G043_PD_WDT0		12
> >> +#define R9A07G043_PD_SPI		13
> >> +#define R9A07G043_PD_SDHI0		14
> >> +#define R9A07G043_PD_SDHI1		15
> >> +#define R9A07G043_PD_ISU		16
> >> +#define R9A07G043_PD_CRU		17
> >> +#define R9A07G043_PD_LCDC		18
> >> +#define R9A07G043_PD_SSI0		19
> >> +#define R9A07G043_PD_SSI1		20
> >> +#define R9A07G043_PD_SSI2		21
> >> +#define R9A07G043_PD_SSI3		22
> >> +#define R9A07G043_PD_SRC		23
> >> +#define R9A07G043_PD_USB0		24
> >> +#define R9A07G043_PD_USB1		25
> >> +#define R9A07G043_PD_USB_PHY		26
> >> +#define R9A07G043_PD_ETHER0		27
> >> +#define R9A07G043_PD_ETHER1		28
> >> +#define R9A07G043_PD_I2C0		29
> >> +#define R9A07G043_PD_I2C1		30
> >> +#define R9A07G043_PD_I2C2		31
> >> +#define R9A07G043_PD_I2C3		32
> >> +#define R9A07G043_PD_SCIF0		33
> >> +#define R9A07G043_PD_SCIF1		34
> >> +#define R9A07G043_PD_SCIF2		35
> >> +#define R9A07G043_PD_SCIF3		36
> >> +#define R9A07G043_PD_SCIF4		37
> >> +#define R9A07G043_PD_SCI0		38
> >> +#define R9A07G043_PD_SCI1		39
> >> +#define R9A07G043_PD_IRDA		40
> >> +#define R9A07G043_PD_RSPI0		41
> >> +#define R9A07G043_PD_RSPI1		42
> >> +#define R9A07G043_PD_RSPI2		43
> >> +#define R9A07G043_PD_CANFD		44
> >> +#define R9A07G043_PD_ADC		45
> >> +#define R9A07G043_PD_TSU		46
> >
> > Not sure from "Table 42.3 Registers for Module Standby Mode"
> >
> > Power domain ID has to be based on CPG_BUS_***_MSTOP or CPG_CLKON_***
> > As former reduces number of IDs??
> 
> If I understand correctly your point here, you want me to describe PM
> domain in DT with something like:
> 
> power-domains = <&cpg CPG_BUS_X_MSTOP>;

MSTOP bits are distinct for each IP.

<&cpg CPG_BUS_MCPU1_MSTOP x>; x =1..9

2=MTU IP

4= GPT

etc...

Is it something work??

> 
> where X={ACPU, PERI_CPU, PERI_CPU2, REG0, REG1} ?
> 
> With this, I still see the necessity of a 3rd identifier that will be IP
> specific to be able to uniquely match b/w DT description and registered
> power domain. FMPOV, this will lead to a more complicated implementation.
> 
> We need a unique ID that the pm domain xlate will use to xlate the DT
> binding to driver data structures.

Ok.

Cheers,
Biju

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
