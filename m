Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A564DCA101A
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Aug 2024 22:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9fU/9I3zX7k4MS98ZEPVc6zI4bLJesSHokfPSlH9qmY=; b=qlM66zBXBpbHLP
	I6wj0qwoSEPZ4fYgiV7Q95oHkG4c45a2YjEs4d8vjSrCC4ryjMumQ4OxdT2e22mLyr3Eyv4ZuzNo1
	3mOrlEOKNlZoeU83pKV9JIxcUXviXruDs9Koynt10Lx+KaI2iB0+0vpWG4h5mQgPKHReS/yJTkf0V
	HD4BhPUk9v62d7eq5Z3X94oNKciTn4W50WGJ2OYD7mCbq6hNNfwaB82Gp5uz9NTTRz3twE9BqrMA3
	Qwzv4G4TWwdBXH7TFkRmVOAX83UKfRncbHar14I30J5ihS0cvPIEXffS6vXaEfvp2sJrNEVYi9rhj
	t6WADSzM+EIeM8lFGSsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skARu-00000007x9c-09FF;
	Fri, 30 Aug 2024 22:50:34 +0000
Received: from mail-bn7nam10olkn20812.outbound.protection.outlook.com ([2a01:111:f403:2804::812] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skARr-00000007x8m-00CF
	for linux-riscv@lists.infradead.org;
	Fri, 30 Aug 2024 22:50:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iDyVjE9DD7xwyUv/RmpNPnyP8jIJnBQDCDQZYhanLYLO9VVjE6xCPgQW9OTBxmB05poPNK2zot+rQP1PL+mRuVrzHTolUoNKky13f8pHQeJxe+MaJNXSZ6fLv4G5/k4oWryZjxDVaDnlXxN39tU869+NtNwWRJFIdf+W5VNgOJ7q4/SgzZSN3XsgLlVxr5FuhCy9W9PWTLJ18yqqN4Zlt9f35cKe0vZBo4MsiX5nFjUL5ydADod+gGkVuyCqMS05vJXYAK11yLm0PV/wvqbKWvwLxkO1XTFukCNJ+84OEC/ojqENj6FUICZMnfzDhiFtWSiWrdkMf1/s76h3jZXGvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oJaFiopGRC+tzrDQXTsbRWXPHqsboKqRmIukwo/3NLA=;
 b=rKryPoGXAq5aoz7OvWJYSGSHREtLaON3Vi/8oC5Ib1fcloPjmG85XWSDBzl+WbDv2NTpXUj/KBI0E/0lSfYb5dwN9kTXjhJ+ulP5UqVa9fWsOtKKQUfK+fwDhkRYWwFiwRknoMTwybJw++4XVjzwP9AA8BxfyPvUiOq/XTtoRi2moNs1Bi3DLKPZgK2X/LZpIqck4MMXlJ3Vqzr0WW0dKiXLhiU9Sse2tnpdcAD4ZiIIt98lQYpAZATrM6Yt/04eTXU9m0eOY+V2uSr+OnXhbYJB7JWp+vpvfzH4tjQYkeUsSuLOMFSKK0sFGs6hlaHB8eTpZiWv9gHQNrR2YKnS9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oJaFiopGRC+tzrDQXTsbRWXPHqsboKqRmIukwo/3NLA=;
 b=Lzh/mT0aEyoPcg0SyE5ekE9CyfbthLtXRP/L0947GfwJpoZGtNi5mBFtLka5kPnABoujMW7cIS29Xb5DsfdinGv3Xmzdju9hknIP9WYJ7jU+xuhqQY5fGy5JmtmGSgShNGNc1zrvZk1wbMO5EzODskpKQD62SjugR0YIeeaqiRzrvdIT4Abwz1+U1hyAJDOPxB/xd6sVYsAlaipa0+LlbR2QCO6iq07kg/bXmGJIAusgvsW75HGh6A2hJPyTCmSApaG80jGX5+RnJpB2fGkQ5PEE+Ux2mh+wFe4Fqbiy0BBG1zlRaj0Fe2QLODgnHCAodMJQ7MetZuEeRSBH8Bq/Zw==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by SA1PR20MB4490.namprd20.prod.outlook.com (2603:10b6:806:23e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Fri, 30 Aug
 2024 22:50:20 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%4]) with mapi id 15.20.7897.021; Fri, 30 Aug 2024
 22:50:20 +0000
Date: Sat, 31 Aug 2024 06:49:13 +0800
From: Inochi Amaoto <inochiama@outlook.com>
To: Thomas Bonnefille <thomas@tbonnefille.fr>, 
	Inochi Amaoto <inochiama@outlook.com>, Chen Wang <unicorn_wang@outlook.com>
Cc: Drew Fustini <dfustini@baylibre.com>, 
	Haylen Chu <heylenay@outlook.com>, Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Liu Gui <kenneth.liu@sophgo.com>, Yixun Lan <dlan@gentoo.org>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v4 7/7] riscv: dts: sophgo: cv1812h: add pinctrl support
Message-ID: <IA1PR20MB49533422CE4FF7EB1AEE4CC7BB972@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953DC78BB0FE0C57EA94F91BBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB495348B5FFE61FF1D76ECC4DBBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
 <5a463f00-a03d-4cf3-be3c-970ca5611486@tbonnefille.fr>
Content-Disposition: inline
In-Reply-To: <5a463f00-a03d-4cf3-be3c-970ca5611486@tbonnefille.fr>
X-TMN: [kTKUHA75PGCKDngYYAKhyYT0gOjo8oOoZI3O46cs20k=]
X-ClientProxiedBy: TY2PR06CA0047.apcprd06.prod.outlook.com
 (2603:1096:404:2e::35) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <v2eimzohhcndw3oiz4wysonepai6eezwyqszwus47lrlx7zso7@4jkzf626g7xf>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|SA1PR20MB4490:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b7de223-39b6-47d3-3ed1-08dcc9462000
X-Microsoft-Antispam: BCL:0;ARA:14566002|6090799003|19110799003|15080799006|461199028|5072599009|8060799006|1602099012|440099028|4302099013|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info: tFteZiR/tMH/mbE86zxrj8X6sQbGdvqlEeey+tkkOTKqHIZew5yAj4gwp6LumqSuPuDi5WvzVvNnkcTUy+b7CsZ14Kw7NdHwbtPwvTavjCXxCshZuOjPBxXWbPHrxP7nFlHf4Jy/+0vpskHMouSD4UYSxcDy7vpPPbBCtcEwzrDUat6buCONHB5WkxuRmA+XReNdqvNS/yv77B+MBKR4iqnhXRtVSe/lPd1y/1zEnp+eFkC3vHnuGYO1XeU7AR6+BgBOcjnqGRJNUqOKtvYHEtl3FHd3rQkAVdMh4RqK+pthVkt2kWvC6ug4LnnOGEpsPZs8TXMUu7usP4oCJgVmA1WWS3OSFe4RpuiZMMU1F6kTJx7xd9E2NW7FhpmdzPURyscW9emIF/QYuf5JWGWLxdQBkrQUkbY45zM+dAfPHO0T9fmEiCuytAz2XrbHeLYT/eCs0BVVMz1pqNxcDd6pDll8tvZ6aP/C5FmEHchfGDEsqxSHExUROBH2N0vsFMH3DweDjM2B66h01PcMj/99+FMNY4SC1iwbloKUx8sxXKfRBqkf0OW8v+F5Jn/yRK0LDl0QUCuBod2AkcO4zLbHlzegnK0gQuTxGnUA0K3TkbGBZOlY8aMqZykNV3gF24+wbLviBMnrF3mNOGNl5ttI9t4cLAWdejQG6p5VfgqDyZ6/8O8juxYyU/VX+vznHidVGUMjPqCC7SB7n0aT33hGxuiIg4bx0mMP7GW8jvvXraVJL+SCpoXo7lECAwuG3YII0zUQTCJlDKkCknybQ85xhuzWTSl1ysPnuPq51Ld3Na9Yz2IYDZqjNa/vgShdosm2t8D7EfC6y4vZPhrb6HHG0E6innp0USK9U6iUtRTlOutV1ooXyoEQZxVcwRuN/2JiCZAlIS0ZSAbNZLXEEyv+sVMeIYsCvkv3wrGwCsMkdRI=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TxSHOjd09WzwAL2LHjuEOJIeAT3X47+LTTu5spMqjEeEc0RP9uPztFCDs/vH?=
 =?us-ascii?Q?qC146Mc3mu7i2mw++UTv48D2AxEs5TsxWNFrZANaIMXQGYVwOSmP+AbxUSRy?=
 =?us-ascii?Q?YjLOnrbj36TrZEk17FliTwlt3FFynZjaPrPoqUbtB+GWx9CFkUZFiNLTMNgf?=
 =?us-ascii?Q?w9OzTW0L3cPDMZsHx+roIzSvVIrKKSrLlEzUd2sIzxqFA9VuoAiDIohhyqDI?=
 =?us-ascii?Q?MvOBA5ROTq+v3+2/o/NDB8UzZf455bgrMIlneRedhCwFzkbkJBUO2CxSjsZo?=
 =?us-ascii?Q?nS6ZQMn2ADJUH4+GHX0P/E9IRF3S3lvbx0NZOIc/ruA5nAG1YyD5GDonWLA6?=
 =?us-ascii?Q?MWp/uoGxA+n1zYACKao9RLBpPpoyAm474Er8/k3kEqgIYY6rLoxWofHiRydn?=
 =?us-ascii?Q?H+DElP6tE+DRTJGDlZCfdXIq4UQdB62YtNQES1ysJ/y+Ophznsx+j4vELONj?=
 =?us-ascii?Q?aeN4bKQXSDKEomd8UxknbmRBV/irvvarOMc58e5FzWf+2g+RVbO4Xsf7Ks00?=
 =?us-ascii?Q?+BMHU6GfXBs2yQd5EXlUalTtWqYq8fljzpWlVYkRq3Q/B5XoYtq7zVz3L1vz?=
 =?us-ascii?Q?6C+RkG8f4gte2bGeeUqUfNTuFn1/LEt0I6l828r6cTmx/+sOxV4XVOVI0PN7?=
 =?us-ascii?Q?No0btpWuIHt6/CAxxpBHHWa2VpOXX8XSRxmkXwNcnMi93269ND4JG75VLu/E?=
 =?us-ascii?Q?0wKH5Ccp7B/bigM162pZyCxp3MKl+g0NVG8Ir1uZEzvWH/2S49tuLiwhPx8H?=
 =?us-ascii?Q?3tyx6UNM/tpXffloIguyOGFQ0yVLDZ8F/0UCo4Mp1kRI4wMnuiZmztIDxx3d?=
 =?us-ascii?Q?cdh3spl6d6cL5ZBG/O1IZzC2pIgYZS9MPhYtHQlPaiBsSYipDAsJUdYTyTYe?=
 =?us-ascii?Q?1ckY+ZG/ICDkEVxmzDUhkk7+g2P9bxG1vp2qmJUSW9qlfkI6p4+i42bA7E+/?=
 =?us-ascii?Q?KyGR7lMI+EbKNnlZ/lSzvV3VaRTkV068wSJG3/WwRtCAR6HDOGfTV0wIKVWD?=
 =?us-ascii?Q?7mWmbN8/Ymo8HQujgPVGaNfaoYn7l6AsBkSEZX+oxhv1VvaPk4Fhf6tBQ6Cq?=
 =?us-ascii?Q?QBHZgQNWhMTEmsQysRTCVdo+4sCWCUBE5ANLefEAfY5w9XLRYXFlsloj1KK1?=
 =?us-ascii?Q?uqTlP/6r0OxeZRfUZ2K+ObqQEedUU4MESmyibSpOQ2+mjNOMPw2x0jE1Cqn+?=
 =?us-ascii?Q?ZHvWMrUIbZitZkBzIDswxh1XCiarmUEvrUo8cnldMXMQ8YhL7l/H/0LY+s7f?=
 =?us-ascii?Q?Mjr4pOCeuULevRZGSwJY?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b7de223-39b6-47d3-3ed1-08dcc9462000
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 22:50:20.3195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR20MB4490
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_155031_082928_90BF6C3E 
X-CRM114-Status: GOOD (  20.56  )
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

On Fri, Aug 30, 2024 at 03:00:03PM GMT, Thomas Bonnefille wrote:
> On 8/2/24 2:35 AM, Inochi Amaoto wrote:
> > Add pinctrl node for CV1812H SoC.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> > ---
> >   arch/riscv/boot/dts/sophgo/cv1812h.dtsi | 10 ++++++++++
> >   1 file changed, 10 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
> > index 8fcb400574ed..2dfa450f0d26 100644
> > --- a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
> > +++ b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
> > @@ -4,6 +4,7 @@
> >    */
> > 
> >   #include <dt-bindings/interrupt-controller/irq.h>
> > +#include <dt-bindings/pinctrl/pinctrl-cv1812h.h>
> >   #include "cv18xx.dtsi"
> >   #include "cv181x.dtsi"
> 
> Hello Inochi,
> I'm trying to apply your patch to the LicheeRV Nano series but I can't find
> the file "cv181x.dtsi", neither in the upstream v6.11-rc5 nor in the
> additional required patch.
> It was first mentioned in the v3 of your patch series.
> Was it supposed to appear here ?
> 
> If so, can you help me figure out where to find it?
> 

It seems that I have made a mistake. The cv181x.dtsi file comes 
from emmc node for cv181x (it is not upstreamed). 
I have send a new version to fix these dts file change [1], you
can try them. Moreover, using the commit from for-next tree is
also OK, I rebase the patch to the right one when applying these
patches.

https://lore.kernel.org/all/IA1PR20MB495374DB8C4208575AAC9675BB972@IA1PR20MB4953.namprd20.prod.outlook.com/

Regard,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
