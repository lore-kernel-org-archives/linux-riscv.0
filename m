Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40864C3DA49
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 02:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OiazqVjpDRe8auA8n7foDHj8o54HVFBWCJ+kyESPKcg=; b=k3hWdJRMinu2jv
	8wZVCyfoOwjMhFeTXU00tybFnO/pnb33FRvrdw9yLxycjLXalheeBuq2XXL7RaJuc1HvjtGt9Yxxs
	I5Z5Q4TL0fabA2XbqhboztMK0wb0wkpL4OeQnNrnNHF4BfvpNl+2CMcZmULiCc8oyBXNXxplgvSQ2
	b7lwNbhbScBVkDU9q5BImlprAfeC4t1UHTXAvNRnthCgH5MgJjek+TU4k1c/Gw7E8oojrLx1o23SF
	MS1T4hjpXMKdH1z+A7L8ZuAp1l9Zh/DZHMxscwhPmpKNKJH0+j6vJ5kZPEpPG3g1u+7UozdzHHdSE
	pGZLp9L/6+qkWVdBrE6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTuOb-0000000CMN8-3PSG;
	Wed, 17 Jul 2024 02:27:57 +0000
Received: from mail-co1nam11olkn20801.outbound.protection.outlook.com ([2a01:111:f403:2c16::801] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTuOY-0000000CMMK-42Qy
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 02:27:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ME79TZl3FFLC411L2Gn5GTC2mYreBSorDeIH7g2zX6usB38bVTXiQVlaLx2A36k6c+v1llPjl1/vlqJA9+E3F5YDZX0gEK4qf3ZsAbXY036b9kbqwQDAesU88MnGyR45afSZ55oSmSRh1S7JxD0fAzaqOuCj1DUiErgIGTmpNycFreaRVAWdECIynattf8wdpnAa/8iDsWUlSxORaixoiz08PxmGtt05s81MV4LPTGUhf5ewxGCxiOogybWhbo2Ko19ON8sepi3OnaEUB4ioGb2NidUm9kdg/Xu20xuBaLBp74Hs0NoxLzfIjN0QKoliiJDft2y3euFBl/zfa3pw9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AZgKl3B/8dHb/TcyCcwIqNJDHxSERe2huM5gXDBl0qw=;
 b=yNeHw4fJR+ijfB55s8vVF5kM+CVLu3cRS8GnNCuzEweehZT2Dwy/hBJyF6pnn0RMmz6xzvJZ4T/niUxXo6G7mPBg4Yn//ydVBpEu1FW2GkQ24GjYFRE1iqHD/EGBgPEaHL5Fr+66G699hDFCkQkSVDN6x7NMLEQG0brLWaHzi6UXRJKVpzEvYW+CCaVnjLwpszbgX+VbIH35TdPHFn1FmukRo4G4BOaVrCbUZcXqrvtoXaiiqafJXW/dyH6VSQab9vrxpyzt9P0gaRFUbFVgSR4TiiWL1T4rouNGgAHl3RYt/sv0WMcnN+eTM7xpii5GzIfu/bikrGPoq38UeM1qWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AZgKl3B/8dHb/TcyCcwIqNJDHxSERe2huM5gXDBl0qw=;
 b=OHYaMyOvi0cc1SOpAo27EDZ/eh7Xq1P7JR7SovpBrI2pEJjSqvIdG+HmaQSawnvYsE01zM0FtsiF4nZbTZ3LTm3I624YjJg3IQCM1B4AKOtVdadAqCJnjfeYaXVWSUIzJ2XmoeWsaim/TUlv9N4YtpV1/9Uz/0LXaeJ0ulJYRwXWSkY6hTFkE213kJ5znyAyUAHnWsGCK06gIoi3Sm/RT9Q9VVwqITx9Ct8YucVYCmPcqqeeR/tbpL5pwrOsEliOJrcXc5jZKI3BqKvurfv+c3Zc76Z122I6tZUkxr3DhuGp65rWPoaYQ518Tq+ZQtyT/MTzXIeagXwkjqLrzU7Z1g==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by SA1PR20MB7058.namprd20.prod.outlook.com (2603:10b6:806:3b1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Wed, 17 Jul
 2024 02:27:48 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%6]) with mapi id 15.20.7784.015; Wed, 17 Jul 2024
 02:27:48 +0000
Date: Wed, 17 Jul 2024 10:27:35 +0800
From: Inochi Amaoto <inochiama@outlook.com>
To: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@outlook.com>, Conor Dooley <conor@kernel.org>, 
	Haylen Chu <heylenay@outlook.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Jisheng Zhang <jszhang@kernel.org>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 1/3] dt-bindings: thermal: sophgo,cv1800-thermal: Add
 Sophgo CV1800 thermal
Message-ID: <IA1PR20MB495329786AD07F076BBD6867BBA32@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <SEYPR01MB422158B2766DA03728AD90CBD7A22@SEYPR01MB4221.apcprd01.prod.exchangelabs.com>
 <SEYPR01MB4221281561CCE511A5094D28D7A22@SEYPR01MB4221.apcprd01.prod.exchangelabs.com>
 <MA0P287MB2822445DD34485B94D22E7FFFEA22@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <20240716-cloning-canopy-a6799dc7f3b9@spud>
 <MA0P287MB28228BA5CC8B6F61A4C237E9FEA32@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <IA1PR20MB4953D97AE6DAD99C386CB7DFBBA32@IA1PR20MB4953.namprd20.prod.outlook.com>
 <MA0P287MB2822A2F07F21FC5445EF8946FEA32@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Content-Disposition: inline
In-Reply-To: <MA0P287MB2822A2F07F21FC5445EF8946FEA32@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
X-TMN: [tekwYpYzYGeGNfLs91HrSG0dAb4X1l+Hi0r25o254wA=]
X-ClientProxiedBy: OS0PR01CA0014.jpnprd01.prod.outlook.com
 (2603:1096:604:24::19) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <3rb42l4kdb52k4wf6nnoc74kjrkwmetwztzhsyi5rux3lvn2xb@tjmxcaryjrl3>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|SA1PR20MB7058:EE_
X-MS-Office365-Filtering-Correlation-Id: 30faf12f-518c-465e-74c1-08dca6080ced
X-Microsoft-Antispam: BCL:0;ARA:14566002|8060799006|19110799003|461199028|1602099012|440099028|3412199025|4302099013|1710799026;
X-Microsoft-Antispam-Message-Info: uvG7BEu8YaaF0XId14VczX5lmenj0buRNXtPqFcZZ2jf7ZmDdjck8bcbi4RpqwWRS3M0x+UqQU+9JoGrQl+sdQW9kGPpoqDl/HuHMIm4YW6VDZfMzq77GGzXjAjhFHWoQSTI89ISSwnXZ/Z0U5S6fgibRlOjuzVOmpw+zPMpQx2cl9n+9IrWasLQU9uZ2A5GxKKZJJSg68Onsr5YAXA1UHtQYlStmqt21Ayh+X3o+68E+UqJRei5Gvk/yc+a+MPnDuoTTzYlR9v3NOY3fA5xmyPipc2ELwnFSEcm77ZFhgSfJrDKazMhoBUeyKLOrz1OtmdCcxeXTkr+2s00EIuTaYMhPsK1UZSqRtrL19RoCkioXbkqzYG7tbnz7QpLP8i0ykPRx7yxgkjzRCv8oDQDCU0d6qYjaN6ECU0t+SDx60zhYCnmsDWLyNUgV9IXVChEaI8qhi0axl/8ZZPrUbxT8ojEhVw1TSU2NNmacYHVnjPBOUagO7o47v3MGgdKMvSGrZFT2iyH5MZhlKpuv8HkeE2rLdrl4PUJWaZ5yqv780ptrOE3F0WQkJSSDDfVxXAThlqmWgRflq2WYGSUTMuoMh8/v80zSUgPXTLH8/cbz8JtHQzV/uMgRaUg6LDsZi8riVAsWBa/vr2JUMKKUsaIdCcE/H3yh3TWm0kjyCba3qwZeaxfhrQB4aVMXYWoWDcvMBBa/h/3xEjY91dumGRHH69R96nNAOEkHFpGvQnSUFn+8P7UYTmd5rfq4xXroT2QwCMkE+HFfsJVdnTKwwX2xwfCvwLLrBfTTNvD3D+XgP8=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?/gmxrn6UxFBdsAo5p+vZ8IdsIs6PrHYV5zC647K9/S1X6BswUagecN+vbm?=
 =?iso-8859-1?Q?BASCyScoxHyNx1IctNgrsl5oEHlAxm59e9itmahNewbwK4xvc0nRNz6C/w?=
 =?iso-8859-1?Q?MaD/n5zFdrFIj1I8/MYV7JH2JouPCLogHtSe06KZ47qB3ftQVbUP4WUsKY?=
 =?iso-8859-1?Q?d2pMhDGFLOFA1HdB10d/ObWtRxC0UR2duCf/a0jzwHHlJ+kqFGJc1b32gs?=
 =?iso-8859-1?Q?svciuMzl4AKz14DI0hWGiVYNLG4mO+anfkCZ/pq2KFOGdnO97DL91Ukbab?=
 =?iso-8859-1?Q?FaQlDUyxuy2sY1kg9+38RKQtlmjb+t3lXvMZyhMHDWMHSdz6HgzoL0eHrm?=
 =?iso-8859-1?Q?3Ddqvg3QqY0JHHTzUU2aC07u9MyUkxQ7QKqr1LncFscnMXy7tF1fU/icra?=
 =?iso-8859-1?Q?PI2y8WmzG/Qpd1vgNWnPcKdbZMifuGll8vWaTDSxe1lnWDj5pelW5rs6PS?=
 =?iso-8859-1?Q?ANZw0fM77GMnGr/78P24Icxc/0scQ3Fn8QlRr4AC//eCrrNeO8qw6aqu7I?=
 =?iso-8859-1?Q?V9gwnvCfdyaIz2HZj7T9gN7nO4PNWdPIphWGkhR+dn2LeUHR3LR5wnTkhp?=
 =?iso-8859-1?Q?+QI5vlQi6n5oCW8xkIoOPHsFtm8WWjuOx40twIhpmBmQib+wSEr+vj+WZJ?=
 =?iso-8859-1?Q?mziE+LYenOjNpyQ05jneZIbz5FCzCRV/0qjbxNPT440Ngki9akyL/T2msM?=
 =?iso-8859-1?Q?ZgsVVXuxGRuSbFFEWay+S+h/rmOZ2WTTilmUWwOzQCj37KImWmr8FTKNDk?=
 =?iso-8859-1?Q?ClLZjkv6oEpVReZ0RpkrQQME+XjQp6xOkk3aE2mmgwaInQ5kH6tBxVcn+m?=
 =?iso-8859-1?Q?K38JqYX2kR5dBn96jbiH+Ub0xqOyqwvFMNK7reCIobUNoTdXjQXXY/plKX?=
 =?iso-8859-1?Q?8G48Cjx+TZ3uA8u3erzhMeca59ZrHb+UPxOlPrqHJlAulPQNkJVN1ovlDI?=
 =?iso-8859-1?Q?nsfARXOw1CqPXH5vWGbkeKxnOhMtmauBbAOmjHzduFYcCIu3lo/K1fWG6e?=
 =?iso-8859-1?Q?+D3ozJGK59F694CQPwnDipj/Vr76OJPbhUcwnbUon5iQyh7NFRwKAonN/a?=
 =?iso-8859-1?Q?KbaUX8sgTlIaV8r+lK5pTKq9PynijN4d0SYZzoiTHi3bdAfER6sKxX4MqS?=
 =?iso-8859-1?Q?SLGTkKgSgl77D03dU8L+SpgS7BrZ8xfmI8oQq34J3GAZCVExgIqScZskQJ?=
 =?iso-8859-1?Q?T5q2QFhXmtP09MWJUBYVIOSk9KZysrx0BhUAVdCRi2l1pbdVaoT83++rhr?=
 =?iso-8859-1?Q?o4VzKjgzYHkEkW1gdydUMmoceyHkc1nZKp5AL1RlFMDfKYrSsnqbFLjjg5?=
 =?iso-8859-1?Q?NCZC?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30faf12f-518c-465e-74c1-08dca6080ced
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 02:27:48.8959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR20MB7058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_192755_053798_911E0095 
X-CRM114-Status: GOOD (  31.48  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jul 17, 2024 at 10:14:46AM GMT, Chen Wang wrote:
> =

> On 2024/7/17 9:27, Inochi Amaoto wrote:
> > On Wed, Jul 17, 2024 at 08:05:10AM GMT, Chen Wang wrote:
> > > On 2024/7/16 23:48, Conor Dooley wrote:
> > > > On Tue, Jul 16, 2024 at 08:43:19PM +0800, Chen Wang wrote:
> > > > > On 2024/7/16 17:42, Haylen Chu wrote:
> > > > > > Add devicetree binding documentation for thermal sensors integr=
ated in
> > > > > > Sophgo CV180X SoCs.
> > > > > > =

> > > > > > Signed-off-by: Haylen Chu <heylenay@outlook.com>
> > > > > > ---
> > > > > >     .../thermal/sophgo,cv1800-thermal.yaml        | 55 ++++++++=
+++++++++++
> > > > > I see sometimes you call it cv1800, and in patch 3, the file name=
 is
> > > > > cv180x_thermal.c, and for dts changes, you changed cv18xx.dtsi. P=
lease unify
> > > > > it.
> > > > > =

> > > > > I think sg200x is new name for cv181x serias, so if you want to c=
over
> > > > > cv180x/sg200x, is cv18xx better?
> > > > > =

> > > > > >     1 file changed, 55 insertions(+)
> > > > > >     create mode 100644 Documentation/devicetree/bindings/therma=
l/sophgo,cv1800-thermal.yaml
> > > > > > =

> > > > > > diff --git a/Documentation/devicetree/bindings/thermal/sophgo,c=
v1800-thermal.yaml b/Documentation/devicetree/bindings/thermal/sophgo,cv180=
0-thermal.yaml
> > > > > > new file mode 100644
> > > > > > index 000000000000..58bd4432cd10
> > > > > > --- /dev/null
> > > > > > +++ b/Documentation/devicetree/bindings/thermal/sophgo,cv1800-t=
hermal.yaml
> > > > > > @@ -0,0 +1,55 @@
> > > > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > > > +%YAML 1.2
> > > > > > +---
> > > > > > +$id: http://devicetree.org/schemas/thermal/sophgo,cv1800-therm=
al.yaml#
> > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > +
> > > > > > +title: Sophgo CV1800 on-SoC Thermal Sensor
> > > > > > +
> > > > > > +maintainers:
> > > > > > +  - Haylen Chu <heylenay@outlook.com>
> > > > > > +
> > > > > > +description: Sophgo CV1800 on-SoC thermal sensor
> > > > > > +
> > > > > > +properties:
> > > > > > +  compatible:
> > > > > > +    enum:
> > > > > > +      - sophgo,cv1800-thermal
> > > > > cv18xx-thermal ?
> > > > Please, no wildcards in compatibles :/
> > > Sorry for my confusion.
> > > =

> > > Haylen, so you want a compatible that matches an actual SoC and use it
> > > everywhere?
> > > =

> > This should depend. If this peripheral is SoC specific, it is OK
> > for using SoC specific compatible. Otherwise, it should be series
> > specific.
> > =

> > For thermal sensors, I suggest using series-based compatible name
> > as this peripheral is the same across the whole series IIRC.
> =

> What's the=A0 "series-based compatible name" do you mean? Can you give an
> example?
> =


You can take clk as an exmaple. "cv1800-clk", "cv1810-clk" and =

"sg2000-clk". As you already know, sophgo use the same clk tree
for the same series.

> And allow me clarify, what I said "a compatible that matches an actual SoC
> and use it everywhere" means to define "sophgo,cv1800-thermal" just as
> Haylen did and use it for all cv18xx SoC chips.
> =


I know it. But there may be something like the pinctrl. They share the same
logic, but have different data and layout. In fact, I am sure the thermal =

is not suitable for this case.

> Anyway, as Conor suggested, we'd better not use wildcards (char 'x') in
> compatibles.
> =


Yeah, I agree.

> Thanks,
> =

> Chen
> =

> > > Or we can add ones for each SoC and have a fallback to cv1800.
> > SoC specific compatible means most of the SoC have different part
> > for this peripheral. For safety, it may not use the fallback
> > generic compatible.
> > =

> > Regards,
> > Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
