Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF2FC04A68
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Jul 2022 12:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hDgqHslP2egvAiydl19g6PLFOPSSkF0VJzYJVLQig14=; b=niBiryOB/9mf1T
	B3wNFtBVsL6FbaHbv0gMwOQk0Mc7fgZYBrCIGtPZfcZRoMRo23SB0dKsordMkZeqMNHTJJBC3h3xW
	wI3/MQ9vAqFjoJK9pPtpsYCoOTaclpNMhVgb3ODbSohXefZkF5yK+w7ES7rUjXVhvFRxmWs/5x5rO
	jq0CWnQo7xEo7EIpSkkviAOupcTiSWZKjOf9sJBIdc+Hw5/0j1/ajER3OI3dpqJs4vmnvKHJ7S5sS
	cR8VLgh+bggJWOuh+T31XAjkKi8+mHHwspYdOEXVTCKb1QcbqHwkC2VXNrisJctleQkR/ceP73pmS
	cl+xp7c0BY+70J4HWpKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGg2b-00DR1a-1O; Wed, 27 Jul 2022 12:21:29 +0000
Received: from mail-tycjpn01on2128.outbound.protection.outlook.com ([40.107.114.128] helo=JPN01-TYC-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGg2W-00DQvh-07
	for linux-riscv@lists.infradead.org; Wed, 27 Jul 2022 12:21:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eHe3McSwEIF8rEdk0E5HHvf9f2r3QtTJElEhWr2/usXdhW+ZmXfNXqkujTFN4schZl3xtW5FCRIA/D0C/fQcstnUuaF44tJ9YitR6cjiJH37CIXpmx3Hgrp5kJMmP8lJZsFTtd0RIFPs4alrQLclKTC8pUXxZYSSHuMuZM6EU/UnKZb9qia0g03b7GZTK2SuyxT08HMNzDEirYgU+vXCaL7g1CGum3bx8inRVdrqVlxYt6WIotTyXpqFc2cwuKzjX5J+yJ33zigiJLTkO8wsKp+zS5LpOKigqva9o2gAUIH33dRzRQRKzNpqY0AvtGca7pTew9/znqWuyVJSkfyVnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=puVB+DHGg93+C7AVh7z8q82UI+6ly/rRnbI00n51GNQ=;
 b=fV6kKNzBr/o+MHq9RGcKhjizit/Hodq34ZTohscT+tZ9y5PCJNJ7estw/pwxEB089xavK2Gd+gSANcl50Z8snf17nDSieU3olWaKsxNjSDVbSznT53/ulykRsOcpqULUPF0A801xH42woGMVloM1GCP8MF06c/yRDuB3xaYhET6oSPHbmSnwfwa2D/A7Q+6NfN9cOogbmqMDOjb5sv4Y6Jiv0UQY4uFUVcSaVdnoABlhIqu0xgHzwLqy2ySxL1DtjzAjoAWFNiy+T+ab5iT35wSp/SBzBR73VDUkQpLMcRh2+31eKVO4wNbqoEw/mOzq8hZbzZxHvmC6p/w6oVN0cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=puVB+DHGg93+C7AVh7z8q82UI+6ly/rRnbI00n51GNQ=;
 b=JtIqkhLYVqy4LpTMUNjKYM8209uvga9pnbss0kXDlI8LgG3fxqEmR1HoWTplugsH0LevsIh63qzc5cCfp6roxxVTCwn33zsLAihQLm+Bfy2jNDqCipkkV3q18lMXBW0R2hoh2GobPLP8evFV09Fq27IxySRWIbuJxnhGnX5RG+c=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB9354.jpnprd01.prod.outlook.com (2603:1096:400:196::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Wed, 27 Jul
 2022 12:21:15 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b046:d8a3:ac9c:75b5]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b046:d8a3:ac9c:75b5%6]) with mapi id 15.20.5458.025; Wed, 27 Jul 2022
 12:21:15 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "Lad, Prabhakar"
	<prabhakar.csengg@gmail.com>
CC: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, Linux-Renesas
	<linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv
	<linux-riscv@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 4/6] dt-bindings: riscv: Add DT binding documentation for
 Renesas RZ/Five SoC and SMARC EVK
Thread-Topic: [PATCH 4/6] dt-bindings: riscv: Add DT binding documentation for
 Renesas RZ/Five SoC and SMARC EVK
Thread-Index:  AQHYoRp+5i2kwB4v6Ue8zM4Y97KIiq2R6rqAgAADKoCAAA22gIAAAzUAgAAAzoCAABjHAIAAAfcAgAAJcsA=
Date: Wed, 27 Jul 2022 12:21:15 +0000
Message-ID:  <OS0PR01MB5922763582B836DA45CDFF0886979@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220726180623.1668-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220726180623.1668-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <636e9214-4b36-e9a6-3c6b-b6edb944335e@linaro.org>
 <CA+V-a8sTw1qzuTeD2vb7RgDmmNdEP5qEcxXCjrFgkyrBrLrt5Q@mail.gmail.com>
 <e64cc15e-b31e-876d-b3cf-b60d255c495b@linaro.org>
 <CA+V-a8u1VW9xaj2KjySyMuegpisLVENO_6uJOpAFZGbKziYLYw@mail.gmail.com>
 <e31e0c1f-4755-704e-8428-93970877d8f5@linaro.org>
 <CA+V-a8sX=Frs_cds9MriauTFRvcZUNCvoeZ+SaC0GUpL7L6qhg@mail.gmail.com>
 <9f32a4a9-66b4-ba2e-1713-436103c2faf8@linaro.org>
In-Reply-To: <9f32a4a9-66b4-ba2e-1713-436103c2faf8@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7e243cae-51f1-4ea1-cec9-08da6fca8039
x-ms-traffictypediagnostic: TYCPR01MB9354:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  DHX4FVOhvt8lH0Dl1AcXTGX35xqCHJkB6XmDxupo+ICMcohvoLVsl31G4ljxOsqfXyNOH0nqT9qtG/SM2ETGc3wXjPM4TMtKXJ9HDzrOP4O6eKNMdP5zzGsy+/Vn5iMzDFv/vrz4iwfoD9pQI9Xm5Vgpo4YQDCKbi/3Uq/ArA2sslnug2MuHv/AVzS9dimm2O10pLFyKaUiA0Q1BvTxcsc7cNUX65937lZAfHelIzTEVeNeHQrYdHlTrRBBWeGdQSVcJ2kFUaDesZIJLYZx+EQy96q2KYuj8f/oXdH9EX1MQ9yUioA2rvECa+0Gk9jFOtqaFhCDw7Q+ztrQhGBamVaFtNr63kwrgR4bSmyUsP/pEu+jERHxEIJxAO9EKdNDH3N2Ad2Z2zNTozyyerKihPqdRGgcubkj8rKQjcznp2aZLvmw3dWmv3GHXmLqjzd/IVC0N246DJNm77LfTlLpzNuiUFT2Og1gqRRHy1hfTADIBXHyEv0Ns99pyK9yoXPj5TATTBp4tfPnyQ02rwH2IV/SGFbW8H09G7k97wCMzTqHtrx/VaOaSMt9rzXwI8MWnh0Bgfntq0XTKqRaodwaoLjEYDfJ7798XeBSivOmM/ru1Y5JxRTGYb5zApgLHuoTsMkIhseLCYtGfdtJgO1nKIJ4qGhIvgBDpqRopWqQEKL9sLa/HvYHr7nM+t6Aovgvz1hTo4opdlEvFQ9KvQUdBpX/MOrZYqyPzDXOKa2LDGHQCrmCy6xyFJsBl3fJ3djTlD5nRcosDosSlu96uvLRhFjAvtt3r74KVA0cqwuNF0iSRNrwVgIswzCP//iRsI2og
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(366004)(39860400002)(376002)(346002)(136003)(5660300002)(4744005)(55016003)(2906002)(316002)(54906003)(8936002)(52536014)(110136005)(66476007)(7416002)(64756008)(66446008)(76116006)(66556008)(66946007)(8676002)(4326008)(26005)(7696005)(38070700005)(33656002)(41300700001)(86362001)(478600001)(53546011)(71200400001)(9686003)(38100700002)(6506007)(186003)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?b21UTDIrRzFlRXdhMStsYTg2M0xGSEk2K3hnREJQbHJxL0I2WHNUN3M4RzEy?=
 =?utf-8?B?Vm1RWUdzUFE1MXk1UUhwMGt1bWlmRzd3b0ZSekcxbHF2aHFiRlQ5cjRwSjN6?=
 =?utf-8?B?NHJKV0dvWmtZUXpHNk52Y25VbGc5SFU0WkU2bGdSWTUrZThoQTE2T2crUUl6?=
 =?utf-8?B?a3Q4WGNLNUloRlFCdUdCbTBNOU4yRWMvbXpyNUFlZUZLZi9GdXhJcXROMUtt?=
 =?utf-8?B?K3orc2QvNGFyQ3RoZ0JUaEEwTEZRWkcveEMrWDZnMGppcEN4cSttcjBSOVhv?=
 =?utf-8?B?a1d4SWxPZzJLcVg4YVVtUGRKbnB6SkRvK3lmcnMxd3AyYklaWDJsMUxiL3VY?=
 =?utf-8?B?SDZmdWlRNEJyblZSL0JhRjJpUHhjcTQ2aTg1UVJhZzJoMjB0RVJjVzAzZGFC?=
 =?utf-8?B?RDdISVpYb3RyTFJCYnUzaCtnYmc1WU5ncG9CSmlNTmdTdHdkN244Zm9meXg3?=
 =?utf-8?B?TWw1NUlxL2lrY21YN2Y1Q2RWQ01UL3BMZDg3T3htTkMzVmNraUdUbGs2aG9F?=
 =?utf-8?B?OFh2QUwrN1dScGd6RUsyKzg2SDNGeHlJVU1ERmZTaWhhdU41Q2MxNU56aUkr?=
 =?utf-8?B?NjZSbGVHaVlLZDE1OHZQb2V5VHlhWkdSd2Vxaldpa3k3OHhKWHBqUDhFalNx?=
 =?utf-8?B?YXlOaGd3SzhSMWdVblhEUFhVZURWK2Zrd1Zta2dDcW1JOVhsOWxOWnhJR2RF?=
 =?utf-8?B?OFQ2bTVzdmQ5eGVwRmNLYmt1dXBubk10RUlGRDRnclQrT280Und4cmNzYTU3?=
 =?utf-8?B?cWRHYmNoM1A5cE51d0Q1SjFMc3BObTFBSkNiYVNFc3E5RDdKdHQrbmo2N2t0?=
 =?utf-8?B?TGFSS2tZbVRYYlRQNm92TDAyOGFJUnEwMzdzYmhYaEtiRDlkalBLTDZ6Yk5U?=
 =?utf-8?B?SnZuMzdFQlA4K2VCSmRQeCtGSGxDNU85dm1vY1oyMUhoamFudkZVT2ZsYlo0?=
 =?utf-8?B?djB5eGJDSTQyYUpnQ1k2b1d4Ri9ZZHQxZFB4YjRxQjVDMlBENnl1ZlJpbkZ6?=
 =?utf-8?B?TWU3cmlSc1lQdS8wWUZtQWJ0S2k3ZEVSOG5FQndVNFlWUDd4OStuUDlvMGYv?=
 =?utf-8?B?dEppV3cvQTR6YXNsSTdEaU9mWUhSaWdVZTRtS05hVXRNZG9qd0hTdkl0Y1pn?=
 =?utf-8?B?cEd6ME5kVzAvMHdvalB2RFZYbXdNcTRJZEZ3OXcxNDluRWplU2sxR1hUVEV1?=
 =?utf-8?B?V3dBc2FqdEJxY1BNZEg2RjdYSnJqSTJ6VHh5QnBSVThUWERSYlBZeHpuWisv?=
 =?utf-8?B?KzAvTlVvVzhqVmZGUUdCVkJreXFZVVRuNEZCUFFtRGo2aGVKMWppaFNqR0Vu?=
 =?utf-8?B?QUxCSHNmNytnQkNVcUhta2d0bmtTYmx3bDUvamppc2FrOS9xVDNGMldRY1Zt?=
 =?utf-8?B?Mm9uUTBTOG5WTG1heWw5RDA1ZkRqSHFwYVdQQWlISU9mUk1HdDJSVnRObGJt?=
 =?utf-8?B?TUMzUzlGYmlCaC9nbzVTQVFYSE5veUI2ZkVIQTJDUkNOQVkrbTVRU296Y1h0?=
 =?utf-8?B?b2xoS0h0UVhNS2FFUTA3ZDhkZ3hURW0xR2EvQVVmVkp5WTR2Qm5kNkc4R1Ra?=
 =?utf-8?B?SFUzOVFFSEFVVlFCZG5QdllBdzRMOXlpcllUNGZTUEhMQVVvTGtCRElYVk95?=
 =?utf-8?B?SXdGUWNKSnZqalhGbnViRW1CRWJZMXR4ZVFJMWUwMGw5V21JRE5pQ0F5THZ3?=
 =?utf-8?B?K21idkJMbUhVUWhkUGQ0ZjM2bGNDWmRDamhINnhvZSs4Z3RNcXVXRzJlWmgx?=
 =?utf-8?B?UGxVRTdaTTZCYjgxV2w1WFdKTUZxU3BFMkFlbmJaVG1YcmlJcTZ1TDdaeEJi?=
 =?utf-8?B?V01MMTJhNFV1QW1pWVRXUXlkMHlSUGJ1NjkyUXo3bWc3S1cySk8wVXlsSWY0?=
 =?utf-8?B?eSswZWEvRUE0cGNaak80Uk53M2tlYS9EMUR2ajJrS1lxc2hSUUtzZlZIZTdz?=
 =?utf-8?B?N0pJUkdwSWpydHNObHJPOWVmNkcxYTN1VmFCWWJRZ3c5Y21oWXJyWFU4cUlY?=
 =?utf-8?B?T0xYbW0zUG94MjF0MHVqelhPMXdxOGlpZ0dsYjRUbUJGMG5DMFd1ejhWVnh3?=
 =?utf-8?B?VjlIZ2xRcStHTys3TnM4VDdzVGlMRURhL3pOVXlNRzZoV0NEMGhnUThqbm4z?=
 =?utf-8?B?UTJDYVM3dHhKandyVXRlYjNBRnRObE52Y05FcEx2OHU2UGIweDNQdGNPUlIx?=
 =?utf-8?B?WXc9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e243cae-51f1-4ea1-cec9-08da6fca8039
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2022 12:21:15.1539
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gV1JMYQCql/BDveGjlTSrvdtic01VAW8ZPkTiAViGku1DsskEwJdGNHthLW0AW9Zsvcks+kY6Ba1MCxSEOf/voZ6ckqcl0P+ZNUpywPdQCQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_052124_067301_2BF8013C 
X-CRM114-Status: GOOD (  17.05  )
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

Hi,

> Subject: Re: [PATCH 4/6] dt-bindings: riscv: Add DT binding
> documentation for Renesas RZ/Five SoC and SMARC EVK
> 
> On 27/07/2022 13:37, Lad, Prabhakar wrote:
> >>>>
> >>> I did run the dtbs_check test as per your suggestion (below is the
> >>> log) and didn't see "no matching schema error"
> >>>
> >>
> >> So you do not see any errors at all. Then it does not work, does it?
> >>
> > Right I reverted my changes I can see it complaining, dtb_check seems
> > to have returned false positive in my case.
> >
> > What approach would you suggest to ignore the schema here?
> 
> I don't think currently it would work with your approach. Instead, you
> should select here all SoCs which the schema should match.
> 
> This leads to my previous concern - you use the same SoC compatible for
> two different architectures and different SoCs: ARMv8 and RISC-V.

Or is it same SoC(R9A07G043) based on two different CPU architectures (ARMv8 and RISC-V)
Using same SoM and Carrier board?

Cheers,
Biju
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
