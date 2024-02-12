Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03322C48297
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Feb 2024 10:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hd5kS6FzOysunZvsVN2Ke2PRZePLWNBEztFahwquY9k=; b=gOj7O4B2YWsZu0
	wfxQg4wTgwZwgJBDfxh3MtNKIOwRY+qQcNWvavU9gnsEabSBJQ5VoVnx8VdgGIgpfeOLQB9Qu4OtT
	AoDu7JyxlrXdeEohFEYtF/fGddOp+ZvYKRBDqwmalkqAaigLgonKxlYK/+gmCvM1bgAJMELN5xUWO
	fref9lQUL0cyS1biGlYd/Y6bpPs4BOhIuWGHFFErjAXiFBKN4BxPM9260gF8fM8m+8ADA6c/EQDjr
	d6V/+NdT1zeZP15grfiE/Bbvfpa1V8/ZxCkE8utZtNZD1QBPRvTLJ8vjAeR6CrI2y5zTJgB+9yc1b
	O1ePTtLIHPivtDXVK5/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZTby-00000004tUe-3T9G;
	Mon, 12 Feb 2024 10:32:30 +0000
Received: from mail-os0jpn01on20600.outbound.protection.outlook.com ([2a01:111:f403:201a::600] helo=JPN01-OS0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZTbv-00000004tSE-0ECS
	for linux-riscv@lists.infradead.org;
	Mon, 12 Feb 2024 10:32:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SfGxnmxFujBd6xLQhq0Hq8BzrFq7+7Sxh8YCOKNscLs2JKDXEs87lFasMKrn44aIPMV35HJDNxCRrUjKttSiDm5/pT4Ic/vUlPw1ftGTwZBrU5PmXKs1RIDcUI5qwhBWz38c4rEceR0WJHsNfWP9aWln2SaQnh9G6yZXZz9FaLdV2TZ3Vgm2KS+hS6HIABTobAcDuV/a8gd85TgMGXoPsKKaTDz9wQBDxj431TmqpY0jgJ37WuvAE7iTIwoR0mKzQypj2VS3DZ0Y1QhdEwhCUZn2z+cSiwBDYk/eEXkC0lTjbCo/jjoEPnrWWrZQBr6XKvQS5/VXRsD4+aAieJ46/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UtoHjpiAFfSttlIVa1aPzlW0gZx9xe5rLybuAPWUDm8=;
 b=OIN9OphZ/Cgu+6fixvxMxHZkcLm/eUEacv9vNe/dqpjjNoTTFOHtfb/fFdjL7xuNXeEvuapmn5LQk/H26o658utTlOjR+XYPZFmY2XyuU7eX0JsDKmWGVQJ5pNACfY+7FKEvyH+sL9/NxfnvFt+Lg0fvT1xSs7tM/tsCuJsA3YXB3C4jNeYl0HvSnXGpORyUQ5bz8qeP12ExK8DtGhDdspAK6Jq++eHC0tj9t5a30xkmoT655lOtYyrjKJZL1T59cy4pxKzKfW5+R1seyvjlfX7C2bsBFiZ/VJ4KYkaXpdX5XxqzsyuDuXoD6gS7tmn+dU/iwLVngi4CCmrQ5XUGpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UtoHjpiAFfSttlIVa1aPzlW0gZx9xe5rLybuAPWUDm8=;
 b=pNkMoBsG1fP7Nf1HQmliiqMTlqu1vRl58Ta0e/WNklsXVotpjFogVx8Bg/gOiu793HA0o8ewdHWRTe+iaAMdzdO0NkywxRRDikryz52p3QlKYJuBfvdd3480U1R6KCP8ldxWgzWzgzFMYr6X3wj0wgTIAqKDromptf7JUSMzrQY=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by OS3PR01MB8269.jpnprd01.prod.outlook.com
 (2603:1096:604:1a0::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.35; Mon, 12 Feb
 2024 10:32:18 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0%3]) with mapi id 15.20.7270.033; Mon, 12 Feb 2024
 10:32:18 +0000
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
Thread-Index: AQHaWox93XkHXchpTkaSnTQ6Ok/3vrEAgGfQgAAWUICAAAlS4IAACXEAgAAoXKCABYymgIAADp0ggAAXD4CAAACZYA==
Date: Mon, 12 Feb 2024 10:32:18 +0000
Message-ID: <TYCPR01MB112695D036C4738828F16678586482@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
 <20240208124300.2740313-2-claudiu.beznea.uj@bp.renesas.com>
 <TYCPR01MB11269DEA9261CA594EECC949686442@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <67ad8052-1406-4dcb-9e35-5c42ada28797@tuxon.dev>
 <TYCPR01MB112698AB206332D13105C064186442@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <e170f5f8-f95c-4553-b088-1072345fae53@tuxon.dev>
 <TYCPR01MB11269015C92AA327DC6BFA76586442@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <786f90f4-ba47-46cb-b5e0-e3c42b1b741a@tuxon.dev>
 <TYCPR01MB11269A240E2EDD460D0B97B9786482@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <b484c9ef-254e-4cdb-8409-6f0af1171335@tuxon.dev>
In-Reply-To: <b484c9ef-254e-4cdb-8409-6f0af1171335@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|OS3PR01MB8269:EE_
x-ms-office365-filtering-correlation-id: 4e393f96-a4fe-4f49-9f18-08dc2bb5e37d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5mGlkQaInUDLza+wTqLUyvZGq5RXRjGZ5qoLLr0IywIwUPxafQh4Qyvw1PYtCpEw4CQbU/QNmjnR2WrsL1q6rsWqzTVmBEv+5oL5KzUOkvxDTUGnlRZw4sX+/YBfpXZQS/ioFhW1c1tH5GeK46WaUYmnd8bKTkLf9sPU1EZbOBlNRdWIwZtPQnLhECFUeHx8ooyyhOjSc7pjOLoFYISjaKSpksvE8YzSnt6Kn9YeG86OMNteI5Y1w0prPMFMsJzjEwlvRPng/jOjYkXwcyKH+HnPv8M4wuO3RULsMWKJEh3n1fVNTWldQ/6yokbUoPBPzOEozjGgNfKt6y59aBNrF19gh0Kl4mJVsiyDizOB4YPzN/YEwLpLo4oiJKLWabBjRx6OY0a5mjAZuClvVBeRw2tfFrYh1KNgtSvjIJQGaUtCj3Y9htadh390uA9guk+Rxknq5Zn5kk46pVc2W2kVIlp/WtfRcXfh/yyvbJ1MbOH5cJY+N1u8FCpCb8Gp351Vy8Ox72Os/F68gl8eHxO5RfPXGGQctPvDK03TITXJFSnmkdMLFujiK2jqKmm5eFh0ZckW2z0lC2rRRLgMzRdcLqg3O0lr5FlJ8ttFLnozC3Mh64fYy6EJ8S8kJCKVXHfSx7vboXDWjfm+THJTL2J1OQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(396003)(39860400002)(346002)(366004)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(5660300002)(26005)(71200400001)(41300700001)(55016003)(2906002)(66946007)(66476007)(66556008)(66446008)(64756008)(76116006)(7416002)(8936002)(8676002)(52536014)(4326008)(478600001)(83380400001)(38070700009)(53546011)(110136005)(316002)(7696005)(55236004)(6506007)(54906003)(9686003)(107886003)(86362001)(122000001)(921011)(38100700002)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Wkp4UTBuZlJSQXU3bjR5dFAwamc2eTFHVnVVMENzTHZaSklJelB4YW5JQ0Ir?=
 =?utf-8?B?V1ptYTNYazYwUUhEK3M1WU50Y0VZMmk0WkhKWWtrMm5TN2hhNVNvVUh2cU8r?=
 =?utf-8?B?Nm9ZUm9DQzBSWUZvOW51SkFqYUM3OUFBZisyVE5mR0lQUUUzRGZOclhsMDl6?=
 =?utf-8?B?aXdPdWt0M3ZtYnpHVnRHd3YrMUVrMEpBUjl1UmtCa0lMcUhXWGZxaXhUSWRC?=
 =?utf-8?B?dHhCMUJkaTNWdG9JNEZTeHR3bDY4RThoY2NrTHNPSWxlUnlTNGoxSFF3enU1?=
 =?utf-8?B?UGt4M2hMOG5Wci9WNzQ2Tkh1ZXBaQ2RNUDR4SjZ0WW5jOUdsRktTTFRqRG9L?=
 =?utf-8?B?Q01JUDdCYW9GL1BGNERDM2hZWGU5STN4bTNJbUdLSWNsQnVHOEtoZGlkbWJn?=
 =?utf-8?B?Z2lrTE5jV1dxWGt2bGozemFmSGdWWVZUeFZkZ1dyREpaWDQ0SDl6bU9LMmdn?=
 =?utf-8?B?RmtFbngrV0l1QXJ3VlB6Q1cxMDAwRWtXZmZXamFtd1UvRHF4d0FkKzlCNUFZ?=
 =?utf-8?B?M1lCUEJZZ3VhcTZ6clp6SVBheE5wSDl2aGovalpBREF6T0ZDOGptVjRLMVRO?=
 =?utf-8?B?NlZNMFJJUk5BaUFRU2wvZGFtTmt6ZkZVNnFmNWpTdk45S1lXRFN1YjU5Y2xz?=
 =?utf-8?B?dk9wVUIydTZTSWJZa2lZSDZmbnVxSjNNcVhRbDhLVXJpSWpHbnh5OXlXVjJ1?=
 =?utf-8?B?WCtFVCt3Z3ZQZ21JUGxYeWNIcjI4RzRKaXBOQnNSem11Tk8xVmxrN1BrUDFM?=
 =?utf-8?B?aXhEcm9oYTlzQnhqUG5NT0NzdDExeElYQWlpT0xHK3JhRDkvK0tjTC9PU2lz?=
 =?utf-8?B?NlpFVzEyZnZBc3VnUEx5dk1za2p2ZW5LR2krZW41MmF0cEVYRDdNU1pVMjBw?=
 =?utf-8?B?WEFjb2tIT2FvOUJzVGgySEttMVBhZWdlUEhHenZxcmRlc2J0ejhEZzRWZ0FF?=
 =?utf-8?B?ODVMakZ0OEphTHRFakZiWTJDb0hTOU1OclU4YTQ1cGkyb0htS05BMzRtTXhR?=
 =?utf-8?B?T044RGxuejhVQlc4S3I4K210NkRqUG9XNE43M2JUbUp6NjhJajR0c0w1cGFO?=
 =?utf-8?B?eDdMaTFFSU1JRnpveC9JWWxDdk1tYVRBcno3YjlZVTlxVWhIRHNBR0xVY3E3?=
 =?utf-8?B?ays0RVY1c2p0dmdTTHJIc0VHeTdWSnA0cVF2bDNNZHBHUExhU1E1RkpGMSs3?=
 =?utf-8?B?bWdaZnFPNE40MHpnbmVWVDJqWTJoc1NtKzYvWEs2VHd6NDhhdHVxOGhzaUlr?=
 =?utf-8?B?c1BLYVB3eUYwSHhxYkl5RGFhTStNbEZQTDBwek9qRlZ3VFMzdCtFbTBvcFp2?=
 =?utf-8?B?cXhhZktkaUVVSVJIY2p0dWgyMWFSK0lRK2plZkFub1lYTWJ1eWNoQzk3MTlY?=
 =?utf-8?B?Uy9qcldIWkVJb0UrSjVyZ09yMGo3cTdlU1crelFmQmI2ay9xN0xETHkrbUZr?=
 =?utf-8?B?aGk5bU1NUjNpM0drQlJ5eWY4ZmNLdDNadE1PWVRZR3pjNWV0UmlBMjJWa01Y?=
 =?utf-8?B?Vy90RXNOMGZqbWVKREJ1b2R0Zk9hSUdQYVJLM2dWYzAvUjBoS29YZ2hSaUdu?=
 =?utf-8?B?UUJsbGUzU2ZYdTNQL2xXSTA4WmMyYTBuZ3B6c2owbnBnRytYMXVmZ0VjcXB3?=
 =?utf-8?B?RU8yWEhZM1JybWxLZlQ4RVBGN1htU2xYMU42SmFlYTVZV2M0T2RYVmcwNTlS?=
 =?utf-8?B?R0VDTmdwSnNxM0RUaEJ6MmlvWDgxd3lWOXY4TERUaWVMSnZsaUVHVEhSQ3g1?=
 =?utf-8?B?SnUrZ1JkQ2tmUEdQUVo3bFE2MkRmU1d3UnJZOWxaV1QxeE5DL0x5ZkQwU1Jq?=
 =?utf-8?B?c1RWYjZscVNLY2puandhYmJlbU8vNDQrTkRZemcvTTMzVkx2NEkwWUEwQllI?=
 =?utf-8?B?VFhWVHdkUkRaRmdxd0xkZkVyL2pEVDE1bkc4eU5sUjNwQWFLWXNEWWNXeVcz?=
 =?utf-8?B?RGpsS0dCQ29yS3pCWUF1blpHSkI1V0NWTVhJeWxtaHRxNWJ6amR0STZQTmVN?=
 =?utf-8?B?Qk1tVWk3elR2djJIemhUb3dKWkJsS1dMQ0o1cS9ndXI5Y0N3UnZDelN5NDRC?=
 =?utf-8?B?N1V1WUNtUzhmd3RETFJnT0YrRTh5TmcwbXZzSFJVUlNUYWdJejJnR0lLSHNJ?=
 =?utf-8?B?ZzhsNUlHYkRZMVZoTVVhcnBqbHpNanFvN2ppcHErL2VuZXNoSzdZWmlKSXZN?=
 =?utf-8?B?MGc9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e393f96-a4fe-4f49-9f18-08dc2bb5e37d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2024 10:32:18.5069
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4u9B6PZWkin79DvTgS4xvZK+Bvkf+WH/iSTFExiXPegICXKjvWb0xd8Gvox7V0Oi7oGHBmYP75s0d7jn+s2fCM97PuVyp3BMPu+GvMi28Mk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8269
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_023227_805045_49ABA079 
X-CRM114-Status: GOOD (  26.11  )
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
> Sent: Monday, February 12, 2024 10:17 AM
> Subject: Re: [PATCH 01/17] dt-bindings: clock: r9a07g043-cpg: Add power
> domain IDs
> 
> 
> 
> On 12.02.2024 10:59, Biju Das wrote:
> > Hi Claudiu,
> >
> >> -----Original Message-----
> >> From: claudiu beznea <claudiu.beznea@tuxon.dev>
> >> Sent: Monday, February 12, 2024 8:02 AM
> >> Subject: Re: [PATCH 01/17] dt-bindings: clock: r9a07g043-cpg: Add
> >> power domain IDs
> >>
> >> Hi, Biju,
> >>
> >> On 08.02.2024 21:20, Biju Das wrote:
> >>>
> >>>
> >>>> -----Original Message-----
> >>>> From: claudiu beznea <claudiu.beznea@tuxon.dev>
> >>>> Sent: Thursday, February 8, 2024 4:53 PM
> >>>> To: Biju Das <biju.das.jz@bp.renesas.com>; geert+renesas@glider.be;
> >>>> mturquette@baylibre.com; sboyd@kernel.org; robh@kernel.org;
> >>>> krzysztof.kozlowski+dt@linaro.org; conor+dt@kernel.org;
> >>>> magnus.damm@gmail.com; paul.walmsley@sifive.com;
> >>>> palmer@dabbelt.com; aou@eecs.berkeley.edu
> >>>> Cc: linux-renesas-soc@vger.kernel.org; linux-clk@vger.kernel.org;
> >>>> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
> >>>> riscv@lists.infradead.org; Claudiu Beznea
> >>>> <claudiu.beznea.uj@bp.renesas.com>
> >>>> Subject: Re: [PATCH 01/17] dt-bindings: clock: r9a07g043-cpg: Add
> >>>> power domain IDs
> >>>>
> >>>>
> >>>>
> >>>> On 08.02.2024 18:28, Biju Das wrote:
> >>>>>
> >>>>>
> >>>>>> -----Original Message-----
> >>>>>> From: claudiu beznea <claudiu.beznea@tuxon.dev>
> >>>>>> Sent: Thursday, February 8, 2024 3:46 PM
> >>>>>> Subject: Re: [PATCH 01/17] dt-bindings: clock: r9a07g043-cpg: Add
> >>>>>> power domain IDs
> >>>>>>
> >>>>>> Hi, Biju,
> >>>>>>
> >>>>>> On 08.02.2024 16:30, Biju Das wrote:
> >>>>>>> Hi Claudiu,
> >>>>>>>
> >>>>>>> Thanks for the patch.
> >>>>>>>
> >>>>>>>> -----Original Message-----
> >>>>>>>> From: Claudiu <claudiu.beznea@tuxon.dev>
> >>>>>>>> Sent: Thursday, February 8, 2024 12:43 PM
> >>>>>>>> Subject: [PATCH 01/17] dt-bindings: clock: r9a07g043-cpg: Add
> >>>>>>>> power domain IDs
> >>>>>>>>
> >>>>>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>>>>>>>
> >>>>>>>> Add power domain IDs for RZ/G2UL (R9A07G043) SoC.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Claudiu Beznea
> >>>>>>>> <claudiu.beznea.uj@bp.renesas.com>
> >>>>>>>> ---
> >>>>>>>>  include/dt-bindings/clock/r9a07g043-cpg.h | 48
> >>>>>>>> +++++++++++++++++++++++
> >>>>>>>>  1 file changed, 48 insertions(+)
> [ ... ]
> 
> >>>>>>>> +#define R9A07G043_PD_TSU		46
> >>>>>>>
> >>>>>>> Not sure from "Table 42.3 Registers for Module Standby Mode"
> >>>>>>>
> >>>>>>> Power domain ID has to be based on CPG_BUS_***_MSTOP or
> >>>>>>> CPG_CLKON_*** As former reduces number of IDs??
> >>>>>>
> >>>>>> If I understand correctly your point here, you want me to
> >>>>>> describe PM domain in DT with something like:
> >>>>>>
> >>>>>> power-domains = <&cpg CPG_BUS_X_MSTOP>;
> >>>>>
> >>>>> MSTOP bits are distinct for each IP.
> >>>>>
> >>>>> <&cpg CPG_BUS_MCPU1_MSTOP x>; x =1..9
> >>>>>
> >>>>> 2=MTU IP
> >>>>>
> >>>>> 4= GPT
> >>>>>
> >>>>> etc...
> >>>>>
> >>>>> Is it something work??
> >>>>
> >>>> It might work. But:
> >>>>
> >>>> - you have to consider that some IPs have more than one MSTOP bit,
> >>>> thus, do
> >>>>   we want to uniquely identify these with all MSTOP bits (thus the
> >>>> 2nd cell
> >>>>   being a bitmask) or only one is enough?
> >>>
> >>> We can have an encoding in that case 8:16 24 bit entries
> >>
> >> I consider this complicates the bindings. I don't consider this is
> >> the way going forward. But I may be wrong. I'll let Geert to give his
> >> opinion on it and change it afterwards, if any.
> >>
> >>>
> >>>> - some HW blocks (e.g. OTFDE_DDR) have no MSTOP bits associated (as
> >>>> of
> >> my
> >>>>   current research), so, only PWRDN
> >>>
> >>> Why do we want to add power domain support for DDR?
> >>
> >> To power it up (in case bootloader does any settings in this area)
> >> such that the system will not block while booting.
> >
> > DDR is enabled by TF_A and is not touched by linux, so why are we
> > adding Power domain at all in first place. TZC DDR is not accessible in
> normal world.
> >
> > So if you don't add DDR power domains, linux doesn't know about any
> > thing about and it should work like current case.
> 
> It is related to the way MSTOP and PWRDN hardware features works together.
> PWRDN allows you to save more power by setting IP specific bits in this
> registers after you set the MSTOP.
> 
> OFTDE_DDR and TZCDDR have PWRDN bits dedicated as well as other IPs (e.g.
> serial, ethernet, etc) in CPG_PWRDN_IP2. Setting CPG_PWRDN_MSTOP_ENABLE to
> CPG_PWRDN_MSTOP applies the power down for the IPs specified in
> CPG_PWRDN_{IP1, IP2}.
> 
> It may happen (as in my case) to have a bootloader that sets all the bits
> in CPG_PWRD_{IP1,IP2}.
> 
> If you want to save power for the other IPs listed in CPG_PWRD_{IP1,IP2}
> you have to instantiate power domains for the blocks that you don't want
> to be powered down due to setting CPG_PWRDN_MSTOP_ENABLE to
> CPG_PWRDN_MSTOP, to power them up. Otherwise the system will block when
> setting CPG_PWRDN_MSTOP_ENABLE to CPG_PWRDN_MSTOP (if bootloaders
> previously did some settings in the above specified registers).
> 
> Hope it was clear.

OK got it, Basically you are saying linux PM messes up the CPG_PWRDN_IP2 bits({0,1}
set by TF_A for DDR/TZC DDR and leading to boot failure.

Cheers,
Biju
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
