Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A3FDC54EE9
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 19:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NB06YGlHsNaggHV/N3nI/3/mvverWSxg3sxwnUCWpcs=; b=KYLBsY6Edus84V
	ebOS0sEkf0iPzvXqprqOHB0Dmmq2/j2j6tl3HI4QW3pz5Mr7YNne52U3PZfNtZ3Uzr8ybXD3Lb+UT
	EKq+crTcIGKOitWIEAZDmTrDfi3E2wbTXniQ78GIeZEDVw0u+JYkaId5idaAO2fl9hyEeja0DWmew
	NDgaa7GRQC+ZHI44flN/4MePs/ytLHqFYswy38RKxZ9BOEHOYe13+4FObAmJ41MEtGHfWvZcT337O
	bMWY3TyCrm6QZw1pdKDlBjjUk/laNEk2DVk9rCfwRJJczxRbNkuCRP5PyCr9pJo5TN6AfjsCBImX2
	DVAK5W3tBZ2RFSwZZwmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaisy-0060ym-Ez; Tue, 20 Sep 2022 19:26:24 +0000
Received: from mail-os0jpn01on2106.outbound.protection.outlook.com ([40.107.113.106] helo=JPN01-OS0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaisu-0060vq-Jk
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 19:26:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ergY+kpRDUNkcNM/yfjJzdP/yzOl6Jy+4fzj353C5SzM7mH999EpzDHcpHLdsVbyNNGWMsOvbZFAvIWtgTdnbX5HEwZBevM98cAEn286x6jMuFjsmLW04vBfzMi16waz83GvvZy/MrUs1Lv5n1E1akhKBwuOzejYADj0dP/2x3FV8Sd15IBI3O3d03oCSENoPl8LOLQwYIp43JtKZE+UArlMYx9pssrd2czrKWj6ZRZofiXKXmR82/HxEFKxWhbQt0wBQkht5uZOq+/cE6j+DHLpRHOp+59qRFSWax+Sa4GklnSRuonP1ryxct9ZxKx0eUjTrpbE2uXGmwG9pMkKpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BBcNAR7OEBUyeayWVfMxWnzHHAm2Pyn9uhyEy2Y3hNA=;
 b=DcmofQoCTxaiKkh+KeJvSfAVNUXID5V8jL2F910UEPB7sLc8EGmNAwo7fRuv5srGzcQ43/uEL2rbZyqjenVmnoKfSsainCI/IfNS6mxxcmPNSkBNK0HUiILmd0nntxwjr4TCUC/IetMPmU+qtVnm0xN7GOX+khvKYEQjSkezs+7VZXvYDN0fOp/mednFhdzkRBRokQYJaPQXgrvfvg2k563l87j1hSR4c8GbO6iVlFqJYq1VSI55vBCYixEz4QwefAfva9/jYKtBP6kHOMAA1hlBBHpx1FspwxsLs61JRYuHf5DWJYRao2iqaY18T6vryzkH+jkT//PRNP15izalDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BBcNAR7OEBUyeayWVfMxWnzHHAm2Pyn9uhyEy2Y3hNA=;
 b=nB01NIcA17Od8M7MekIrrDOqNP1oOPvsHl8Nb0NvjNiy7W6s0/P96q8If7cRJn4e7JqkJw3UH9SWf1NWg5unEJ7CvwWHf1Kf9Vd2ejJTy0BLRff5TVzqRRMVLSeMk65W6C7OCYCBuaAQSxlnV0TEl2r5LT1J4yknmN+saEqMfEc=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY3PR01MB10455.jpnprd01.prod.outlook.com (2603:1096:400:313::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.15; Tue, 20 Sep
 2022 19:26:13 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c502:8f9f:ec5e:8e3f]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c502:8f9f:ec5e:8e3f%3]) with mapi id 15.20.5654.015; Tue, 20 Sep 2022
 19:26:13 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus
 Damm <magnus.damm@gmail.com>, Conor Dooley <conor.dooley@microchip.com>
CC: Heiko Stuebner <heiko@sntech.de>, Heinrich Schuchardt
	<heinrich.schuchardt@canonical.com>, Atish Patra <atishp@rivosinc.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v4 07/10] riscv: dts: r9a07g043: Add placeholder nodes
Thread-Topic: [PATCH v4 07/10] riscv: dts: r9a07g043: Add placeholder nodes
Thread-Index: AQHYzSHUiYFQxotF30GY+2sg2SrZHa3oru6AgAAEELA=
Date: Tue, 20 Sep 2022 19:26:13 +0000
Message-ID:  <OS0PR01MB59224D591B8A227A5655ECDE864C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220920184904.90495-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220920184904.90495-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <OS0PR01MB5922AFDAFE3DEBBFFF875875864C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To:  <OS0PR01MB5922AFDAFE3DEBBFFF875875864C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TY3PR01MB10455:EE_
x-ms-office365-filtering-correlation-id: d7f1f7fa-a979-4a9e-d1fb-08da9b3dfb61
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  bubj3O3t51EBB0SBuysCvwnG1VGkYIFc82XaUnl49Lq/IDkAt8OTB39M3W6/6HlbE6AHYacIGsnBe3f8niHaKzkFsZnqElZnvtG0eUNNqqju395efckdd/vS11MNs5JxbqdUciQyUK+i3H79gQpj+Ypq3JgwR8KW50EUoUiechisg3P0D634+J+aPxS81oqGxt5zU9jBq6WS4mAuQ6L3niTHkz8Curn/SybTrypAAzFqIryUdBTpoh/ZuCTY/tWS+3pHAjoN5kkZYvxMXoPaSVa30dr/FZOkhUCl/BFcsyBMuJBACecn4pnos0MyaIeF2vvKK/HH3HQ1TqicMajM2Nj76acEVOmPbwY5+oD+PMDYcAX8BwjwRZcn+5jcC1aYaArVEN1sd0IG+UMCS7iZGP9U1KhbRIZvSRrHZ+rLr7zf5TxAIJJotJ+QoULUGxMQtyyUR7EruTDGisnwlyDZdiJc/YINHtdgA6sO4DRLwRRszyspvCShn3qiumBYwvcN/7lO2PLVu8x9vayUwUbJEVh3+ZDG7uetgXaZaxs/3Nm+L68cTfw4ApxtPW7PWzK7XJ66svXOYOkstE4OmJD46EazISs/z4YWBpDMGETeDqE/2wRAedmFWIK73zIKNTjRk/wYCjS5Kts9/ncljC1eTIOM9hvbI/wXTcGY2WmytUBHPmRBAjB5+gwAMVe5sfetZ9Vi4sdVxFy/mL6iFrLY4E3ASLfH02iaLxlcelKrQ42hSRkq4Xy3Ggdxa6YR19yHBxCp7peeTnOSqLj3g9QgVg==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(136003)(346002)(376002)(366004)(451199015)(41300700001)(83380400001)(2906002)(66476007)(66446008)(64756008)(2940100002)(66556008)(7416002)(53546011)(71200400001)(55016003)(186003)(478600001)(6506007)(107886003)(7696005)(38070700005)(38100700002)(5660300002)(316002)(76116006)(66946007)(26005)(8936002)(33656002)(86362001)(4326008)(54906003)(52536014)(122000001)(8676002)(9686003)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?bmYKCogikEofdc5lTxCGYUBeGEaab9lZeQhBGY92ytUdHtZIkfjNw36m8XY3?=
 =?us-ascii?Q?g+Cc/y5MWwvgTOjZ3+E5yl5n2sFmcDugH3S/yPJWmYkpuRwDm+RW72h1rpcP?=
 =?us-ascii?Q?ruH4Yw9sksnKZ1A8gi3a4B6rKYLJvLvwT3lfVv/mu6ncEYMCdvVqjlwpHp7K?=
 =?us-ascii?Q?kKDOBbDSEphcQmRHYQJgBpmV2qN8UWXCTp+TwPoHdeTxxrfxTyIkGy8JVbqd?=
 =?us-ascii?Q?d7xDvY6vmZYUrFLaDE2+GzwqyTrezZtx17zF442heS4iVz0MF7QwqaYx8zGp?=
 =?us-ascii?Q?MzyvA/KxsupM8gUV0LWZgAVGmpt7AgydImhem+GDZ33B1fqCTegkHcgK++Fr?=
 =?us-ascii?Q?h0afXBUjKcWBmbIIUIR7SGGqLXAsdFwJdsve24wJPfyu5j9p8/N29JX90oym?=
 =?us-ascii?Q?oQGLtgbnlluHZb0rO2lyGFY3u9ddNqmIB5b8coURYboSYH7hIPzoncUxYSAq?=
 =?us-ascii?Q?Uh6vdNuyeZHgXA3mIy/f6IViptDluI5sttt/lNNZV8rfLXLy84AkLTo4ABNe?=
 =?us-ascii?Q?ncueddHzH7jWmNkQU+BprPaM1F7YY5LvsTwhQhgvj9fzYbqIdWStay6j1cfK?=
 =?us-ascii?Q?9Z9z8ZCq+OQ+m/JI6/+YLXUvPQIoLFRdbdwWUUR8Ftbj2nTD0yXxwBxiiHUt?=
 =?us-ascii?Q?iLyKfmD4kmiB8BW23iZBkhSyXKiz7U+Vzm84E0auRL4TrjHJ+eCMdsKtT8nu?=
 =?us-ascii?Q?YnND1Td7/gTxfRBq6rZWoyUFFvj/BsUscnQ9GMYUWTxYnILzIXRrZ9B/c1hm?=
 =?us-ascii?Q?d+ZQc3Pp+B5Ajb1j61UvYIElUFRDYSli50QAooW4T5/sTkBlQq0bGRP8ASi1?=
 =?us-ascii?Q?ohIgVX7jPCz2CLZSXEuiPv3Ct4/FlTXG2KGScsRrU96dP1MBzEdUMgtIgBFC?=
 =?us-ascii?Q?aSaOiP4HoNn4+JB3aSi0T6yg7Qo/aVCMchBpME2ZgvxhbVMuuKqER7xM3rov?=
 =?us-ascii?Q?3/qQAXDMtW7MapxoKG+QZql1WaU3nh+Moq5S/0ly0UwIJdhWOIA4WcD8sMDX?=
 =?us-ascii?Q?r/H1qniQawUHh/ZY/TpfJPaSZV3I4gfNCx1l1cOqbNFDuDFxCOtNXvo3ne6g?=
 =?us-ascii?Q?kv33zNPkQZhYxnDW70/PsceYnVhBXzqcKFY01E7JgyYw0HYQPs7ls/c9iK/q?=
 =?us-ascii?Q?llv4dJVhVWl4iQPq9Ay0KDfOy6PgYd1L5+qalbt46oQYnh3hQCsKmhA7RTt4?=
 =?us-ascii?Q?5Tf3jzJ8fk2M1Py1FDD0BcgA7v2Q/46IUEHFqFLtzjXQxFJuR7U+lhIEc1Ik?=
 =?us-ascii?Q?dlXM0EPbNlmE3iBhiCA1dh7UVd+IRRvO37Uwo4yfdIBdpjl727lTpit/ZELj?=
 =?us-ascii?Q?BJteZJhRGcYnuCLvGtJtvhwYQ9pT5ghp/0s/pAgrJNdQRHdrD1ODJt2QO7nM?=
 =?us-ascii?Q?hSNVakeIoo6H4k0PLWRgNRdJ841VmN/ecIxVBWg3EME9RXMo3xkF3T3LBxKx?=
 =?us-ascii?Q?TCQoHVppRVZo2S6plzfnpRD+m8nEOcvRiXMojymOIVuoGLDHXaWFWPtsoi+f?=
 =?us-ascii?Q?4IOBNDbJN6UjcVE8BejaaqDqAaQWFal1e+ue43iHhC2MBd+EIARGnEfVayFZ?=
 =?us-ascii?Q?ESTC1Gs1L7jg9zE8n/zVzLQSs1PL/kn+yuxZid1KrGpyp4Mq4Xztkj1ZOQaw?=
 =?us-ascii?Q?+w=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7f1f7fa-a979-4a9e-d1fb-08da9b3dfb61
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2022 19:26:13.8836
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mjLmC0O/0iRmEgh7wfVAoWVAdvQeTkD1xK36yGe6s1nAap5ZmJOesCjVTgBTgW4vEYiKhK3cNJFbISkQA+YvtnetVRlF3Z88FU2l+0qzm58=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10455
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_122621_570686_80C4BEEA 
X-CRM114-Status: GOOD (  27.34  )
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


Just ignore my mail, As I realised IRQ property in each node will be a problem.

Cheers,
Biju

> -----Original Message-----
> From: Biju Das
> Sent: 20 September 2022 20:22
> To: Prabhakar <prabhakar.csengg@gmail.com>; Rob Herring
> <robh+dt@kernel.org>; Krzysztof Kozlowski
> <krzysztof.kozlowski+dt@linaro.org>; Paul Walmsley
> <paul.walmsley@sifive.com>; Palmer Dabbelt <palmer@dabbelt.com>;
> Albert Ou <aou@eecs.berkeley.edu>; Geert Uytterhoeven
> <geert+renesas@glider.be>; Magnus Damm <magnus.damm@gmail.com>; Conor
> Dooley <conor.dooley@microchip.com>
> Cc: Heiko Stuebner <heiko@sntech.de>; Heinrich Schuchardt
> <heinrich.schuchardt@canonical.com>; Atish Patra
> <atishp@rivosinc.com>; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-riscv@lists.infradead.org; linux-
> renesas-soc@vger.kernel.org; Prabhakar Mahadev Lad <prabhakar.mahadev-
> lad.rj@bp.renesas.com>
> Subject: RE: [PATCH v4 07/10] riscv: dts: r9a07g043: Add placeholder
> nodes
> 
> Hi Prabhakar,
> 
> Thanks for the patch.
> 
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add empty placeholder nodes to RZ/Five (R9A07G043) SoC DTSI.
> >
> > This is in preparation to reuse the RZ/G2UL SMARC SoM and carrier
> > board DTSIs([0] and [1]).
> 
> Just a question,
> 
> Why can't we reuse SoC dtsi as well, as 90% of the SoC nodes are same?
> 
> Split common stuff from arch/arm/boot/dts/renesas/r9a07g043.dtsi
> 
> and add ARM specific CPU, IRQ to
> arch/arm/boot/dts/renesas/r9a07g043u.dtsi
> 
> RISC-V specific CPU, IRQ to
> arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
> 
> Both r9a07g043{u,f} dtsi will add common dtsi.
> 
> 
> Cheers,
> Biju
> 
> 
> >
> > As the RZ/G2UL SMARC EVK enables almost all the blocks supported by
> > the SoC and whereas for the RZ/Five SMARC EVK we will gradually be
> > enabling the blocks as a result we are adding the placeholder nodes
> to
> > avoid DTB compilation errors (currently we dont have support in DTC
> to
> > delete the reference nodes without actual nodes).
> >
> > [0] arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
> > [1] arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-
> lad.rj@bp.renesas.com>
> > ---
> > v3 -> v4
> > * Dropped status and reg-names properties
> > * Updated the commit message
> > * Note sbc node is not enabled in RZ/G2UL SMARC EVK but will be soon
> >   enabled so added a placeholder for this too.
> >
> > v2 -> v3
> > * New patch
> > ---
> >  arch/riscv/boot/dts/renesas/r9a07g043.dtsi | 150
> > +++++++++++++++++++++
> >  1 file changed, 150 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/renesas/r9a07g043.dtsi
> > b/arch/riscv/boot/dts/renesas/r9a07g043.dtsi
> > index fb6733f3cc2b..d90d263b1b13 100644
> > --- a/arch/riscv/boot/dts/renesas/r9a07g043.dtsi
> > +++ b/arch/riscv/boot/dts/renesas/r9a07g043.dtsi
> > @@ -13,6 +13,14 @@ / {
> >  	#address-cells = <2>;
> >  	#size-cells = <2>;
> >
> > +	audio_clk1: audio1-clk {
> > +		/* placeholder */
> > +	};
> > +
> > +	audio_clk2: audio2-clk {
> > +		/* placeholder */
> > +	};
> > +
> >  	cpus {
> >  		#address-cells = <1>;
> >  		#size-cells = <0>;
> > @@ -54,6 +62,19 @@ soc: soc {
> >  		#size-cells = <2>;
> >  		ranges;
> >
> > +		ssi1: ssi@1004a000 {
> > +			reg = <0 0x1004a000 0 0x400>;
> > +			#sound-dai-cells = <0>;
> > +
> > +			/* placeholder */
> > +		};
> > +
> > +		spi1: spi@1004b000 {
> > +			reg = <0 0x1004b000 0 0x400>;
> > +
> > +			/* placeholder */
> > +		};
> > +
> >  		scif0: serial@1004b800 {
> >  			compatible = "renesas,scif-r9a07g043",
> >  				     "renesas,scif-r9a07g044";
> > @@ -73,6 +94,41 @@ scif0: serial@1004b800 {
> >  			status = "disabled";
> >  		};
> >
> > +		canfd: can@10050000 {
> > +			reg = <0 0x10050000 0 0x8000>;
> > +
> > +			/* placeholder */
> > +		};
> > +
> > +		i2c0: i2c@10058000 {
> > +			reg = <0 0x10058000 0 0x400>;
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +			/* placeholder */
> > +		};
> > +
> > +		i2c1: i2c@10058400 {
> > +			reg = <0 0x10058400 0 0x400>;
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +
> > +			/* placeholder */
> > +		};
> > +
> > +		adc: adc@10059000 {
> > +			reg = <0 0x10059000 0 0x400>;
> > +
> > +			/* placeholder */
> > +		};
> > +
> > +		sbc: spi@10060000 {
> > +			reg = <0 0x10060000 0 0x10000>,
> > +			      <0 0x20000000 0 0x10000000>,
> > +			      <0 0x10070000 0 0x10000>;
> > +
> > +			/* placeholder */
> > +		};
> > +
> >  		cpg: clock-controller@11010000 {
> >  			compatible = "renesas,r9a07g043-cpg";
> >  			reg = <0 0x11010000 0 0x10000>;
> > @@ -104,6 +160,82 @@ pinctrl: pinctrl@11030000 {
> >  				 <&cpg R9A07G043_GPIO_SPARE_RESETN>;
> >  		};
> >
> > +		sdhi0: mmc@11c00000 {
> > +			reg = <0x0 0x11c00000 0 0x10000>;
> > +
> > +			/* placeholder */
> > +		};
> > +
> > +		sdhi1: mmc@11c10000 {
> > +			reg = <0x0 0x11c10000 0 0x10000>;
> > +
> > +			/* placeholder */
> > +		};
> > +
> > +		eth0: ethernet@11c20000 {
> > +			reg = <0 0x11c20000 0 0x10000>;
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +
> > +			/* placeholder */
> > +		};
> > +
> > +		eth1: ethernet@11c30000 {
> > +			reg = <0 0x11c30000 0 0x10000>;
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +
> > +			/* placeholder */
> > +		};
> > +
> > +		phyrst: usbphy-ctrl@11c40000 {
> > +			reg = <0 0x11c40000 0 0x10000>;
> > +
> > +			/* placeholder */
> > +		};
> > +
> > +		ohci0: usb@11c50000 {
> > +			reg = <0 0x11c50000 0 0x100>;
> > +
> > +			/* placeholder */
> > +		};
> > +
> > +		ohci1: usb@11c70000 {
> > +			reg = <0 0x11c70000 0 0x100>;
> > +
> > +			/* placeholder */
> > +		};
> > +
> > +		ehci0: usb@11c50100 {
> > +			reg = <0 0x11c50100 0 0x100>;
> > +
> > +			/* placeholder */
> > +		};
> > +
> > +		ehci1: usb@11c70100 {
> > +			reg = <0 0x11c70100 0 0x100>;
> > +
> > +			/* placeholder */
> > +		};
> > +
> > +		usb2_phy0: usb-phy@11c50200 {
> > +			reg = <0 0x11c50200 0 0x700>;
> > +
> > +			/* placeholder */
> > +		};
> > +
> > +		usb2_phy1: usb-phy@11c70200 {
> > +			reg = <0 0x11c70200 0 0x700>;
> > +
> > +			/* placeholder */
> > +		};
> > +
> > +		hsusb: usb@11c60000 {
> > +			reg = <0 0x11c60000 0 0x10000>;
> > +
> > +			/* placeholder */
> > +		};
> > +
> >  		plic: interrupt-controller@12c00000 {
> >  			compatible = "renesas,r9a07g043-plic",
> "andestech,nceplic100";
> >  			#interrupt-cells = <2>;
> > @@ -116,5 +248,23 @@ plic: interrupt-controller@12c00000 {
> >  			resets = <&cpg R9A07G043_NCEPLIC_ARESETN>;
> >  			interrupts-extended = <&cpu0_intc 11 &cpu0_intc 9>;
> >  		};
> > +
> > +		wdt0: watchdog@12800800 {
> > +			reg = <0 0x12800800 0 0x400>;
> > +
> > +			/* placeholder */
> > +		};
> > +
> > +		ostm1: timer@12801400 {
> > +			reg = <0x0 0x12801400 0x0 0x400>;
> > +
> > +			/* placeholder */
> > +		};
> > +
> > +		ostm2: timer@12801800 {
> > +			reg = <0x0 0x12801800 0x0 0x400>;
> > +
> > +			/* placeholder */
> > +		};
> >  	};
> >  };
> > --
> > 2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
