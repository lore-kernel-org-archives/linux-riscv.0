Return-Path: <SRS0=LlRU=HV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA32CC433DB
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Feb 2021 06:54:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12B1164DD3
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Feb 2021 06:54:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12B1164DD3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=mOkkLUVtJ+9hemI+Ew2hD25Kt0ydVPIoURTsukHfZcY=; b=t3XGRM1IDnsjvK2tV9rQFhVKl
	mZIaEfuwMA2pJqCefeclQvM0P/ZtxxUIp7p+uXhn3AD6OktB3jHPfhQBgG9qhGKKN7oD5IjVS2knz
	1z+QeETJPwg2s+KFIAnNsmf3JhiF6b7QzlboFc8ea2PBqVwzEOa9c/TOZSrUSkAagVNjrPEKDuu2r
	CymEMvcBsscvnOR1m6VIWL8vA6+5xh5MEHkoN60ydEasC4vW1eR3nXco7kTlVU0hFukG6CFWxFoaX
	Dt7mlwkuj6OMoqDfwCAu2SaVHHWAqPfP+i2WCHT40v1x8uR/guMcEB4rd5bEobGxeQFIgKiDQpacG
	b02o7cmAw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCzg5-0002CG-K9; Fri, 19 Feb 2021 06:54:13 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCzg1-00029L-Hf
 for linux-riscv@lists.infradead.org; Fri, 19 Feb 2021 06:54:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1613717649; x=1645253649;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=HbcFY4P56HwwE1uwKGl0H1O0d5edP6I7P5vmcJy2Or4=;
 b=oa7gGAaCrffNoSc+g+DsQt8mfjnvRbYQbkq24j5Mq/8l8IH/zShrNVqX
 Y/MRMSq+c/cIL5bSUZJo+B2JLfK43x/VkrpPMDNbOsDw+kZCeyxYMZx1n
 tamGJTRL5sXAU9YV1NmGfEBxDcZYWlxODqKXXtfh5IwbvKC4AUhYgfKCO
 lbyWaxoHpfi6i7OYnUMRwNz8Qe+CJG4cH6TV+IWlrniB8tNkiWt+pj2Er
 2vmYeiJxGmJfA01tU6RYhWBS5jQzLtrkksRrnhSrlSA/ebhI8CMpIyPeW
 xCFsT2HsB3hA4GJ2W+AAimIUtCvvHuzF5Wrx9hKluw6aUGxJ90YjxImJI g==;
IronPort-SDR: l1eHbSUzgAFgaYnlRuPnnRf6azSefHhLzTlrsNu80YckggQCgQ39iIxVdeUaKDZq2BH70cPstH
 pFfBYBR72pLhbmuXkHzbQLAiXW5TjJDDgz0Gg+ldV5NKP8SK5BZY+BPWp/LIMmX32/Lo61MNSG
 NDo2o5dmCWqB7aZvw9J8aytM9bisge6vF5OCOtKlOKgYR0o0azDv4XUwsAcmKkUbV+cBDhCfE0
 sq6ImSbELWsf8hqv3eg/guui4nCoctp82pDKqEkdvjqIKJQPirUEtYEJTJ30n9Oj22LTIiXM/+
 0xA=
X-IronPort-AV: E=Sophos;i="5.81,189,1610380800"; d="scan'208";a="164816361"
Received: from mail-bn8nam12lp2172.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.172])
 by ob1.hgst.iphmx.com with ESMTP; 19 Feb 2021 14:54:05 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SvwnlKOxmSl/y8JMs7/fu5zFCFteaXTmPFOhc7mFIKp6n+JR5jUe7OmNs73ZMn8wNH282Ka7MD5Jpz1D1TiJ6QaqPasgmP/gfsm4dLBZaoBn6msTrU1vIwYfaKtEeHbkZJwHAV7rgvD4vio3oo1zCSi2/Vifdv9kIZugnwFhJTJwFYsRJZne5TjUtlCkjhK7WGUsX3b3aQnX+Un1cAD+bhmGoPsveqT2mcgzvUwDmikuoEPH//zxCGwN2VOZE9QpKjN9GY+nTU5vMMvvuRHXuKvjY84nUDsX3dYt3ocx1iyg5rRRJyBsg7i/g5eKVA5K3Lmnfk2NXRyPRiqz6Gnr/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+zh8HEC7ytiB5vTXw1ZFDV85Gc7937EjfLDgtJTNPDg=;
 b=mcGuKyOfQ0srZb0yFoww0hUQkGwYocmMgp5UEv8DkMVSEO27ZFfMaFPaeToLGczbJuePuN09Gaoe158vE1302GVMpNJfskkn+2NwS6/rReEmDgiNDJebsSD5aEO09wYy3ILO0A449OxSKA3Gtb5iJ42+Ixn1CQS/7PJxPSxpduSKXJvKeokK231XS/6y07LP1j/UUOA+HcTA4UtZRgqMjCzGpJl+v9Am5cIlsmDzEbbqjbLbwGhM0ePXoVPu7/KuM6CtlmbEFC4PkjS9i6AGEzClw5+z8tlUHICFIeg1pbVoh962Lm+IdgLTquxvEHAW830Zm5NFifOG5wM5D7ETRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+zh8HEC7ytiB5vTXw1ZFDV85Gc7937EjfLDgtJTNPDg=;
 b=F5qLlgGkSY6j+FuDE25MUeo4QxSvowXOWsDPYrMQpF/I9rPoroCZ03OdWoqBIDsqGWejxLz7XipL6BguOmrsDxt1qwfkyV6CSuXpBpem3XfOZuT9wW9h9GxaB24N9iiCTEefH7nQMRIJfCP7nuoPJyPY1+MKlv1EPzXwCU+rqnY=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by MN2PR04MB6352.namprd04.prod.outlook.com (2603:10b6:208:1ab::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.31; Fri, 19 Feb
 2021 06:54:04 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d%7]) with mapi id 15.20.3846.042; Fri, 19 Feb 2021
 06:54:04 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v19 00/17] RISC-V Kendryte K210 support improvements
Thread-Topic: [PATCH v19 00/17] RISC-V Kendryte K210 support improvements
Thread-Index: AQHW/2nyQe/49l3x+EOJmr/UBwS+7Q==
Date: Fri, 19 Feb 2021 06:54:03 +0000
Message-ID: <BL0PR04MB65149B2F9A3722043CE65E79E7849@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <mhng-2ab8e6d6-d777-42a7-af47-de68fdcfc8f9@palmerdabbelt-glaptop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:5483:c7e9:dbac:91d4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: eb4d0888-700a-4e33-7759-08d8d4a3251a
x-ms-traffictypediagnostic: MN2PR04MB6352:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR04MB6352F60B804C895EC95D861AE7849@MN2PR04MB6352.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qJuYXkxv3ix8MHUhIwlarD7zew9AuR/W7uxSHH4DaLNutFITMjUyw7AvEBMR1awCGuZxA8/vDz9x24QS4T+d68+Sdq1gKt/OWG5bB39YfEfonPxVIzHrC01NnzjK28qJkpFnA0t7lz33lL/GdrvjpjFhcgzM+Sv+YG8nbBe1ZUIlDER+gzMvD7iTMnBG0W1MR9oe76BN+BZPwS2uRKwm3nTZ7N+7QP6sZLY6BankMuosDAOQMcuITImDlpQlkWH42lgqLYWy3/UcxlP0g3Ok+dCKl6hGZhSMktY0BrLPRQJQYoXKus9AMxWpvQpQOhKtDipuxaBdg22hpncyJVO5O0b0JRkEUMK6nj6xmRhg56rUFAm5tRV5GF50DsEd3BPDaPWDZqJNo/l4Q7ewU/BFjxUR3roRawc3EwSfPzZ4CG+6knrXkka/YHymc1nZPRruBn7wdbqLGo6f9QNVA7n6u6R7vLDLIC1dx4YrzXXw9KnC3OfsaiIle2jA9adRftWO/gddExAAW7DKUksk4zxlv2I3V6vd69vgqbGcI8l6dum+uOFG0q6P+X0FepmFPzZQjjZUchNI5Y+hEnSmujeosi91CH0l3w5Su9czajNBtWg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(39860400002)(366004)(136003)(346002)(53546011)(478600001)(76116006)(55016002)(5660300002)(71200400001)(6506007)(66946007)(8676002)(2906002)(66556008)(7696005)(66476007)(9686003)(186003)(52536014)(83380400001)(316002)(54906003)(64756008)(8936002)(966005)(33656002)(66446008)(6916009)(86362001)(91956017)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?0SbRv55fpZiMWgCW+BndqmoQDRI8rS8ptA5IFVkhgmUHeXBHEK10GhhLjmhi?=
 =?us-ascii?Q?6IVlNIw83Mf0VLGCY0z0Vio0TBXHSKbWOq+mD+fG3KDanepF2p8V4NfkZ8g6?=
 =?us-ascii?Q?LYJM4BFY2nlyBCZTCRmkK0M9UCnYsXvZF9/XXz0i3jIWNdV/lf8QZz2V20lj?=
 =?us-ascii?Q?VCdxPP19zE9dpnW2UknKJVcXfnnh3ts8iYTgMhD0rHGB8gZNYMpysGKwPAf+?=
 =?us-ascii?Q?YrS0OPVCo0MZWZYLXJRLG4EBTDwY1UGc2qJLQDxYkh2aBVGA3BwV61tpa2Rd?=
 =?us-ascii?Q?EkshVYvUg793tdNpJkd1cSCwzfw9r4Tk4TWLTv6S3nlYHpGWTr7MvAyBxZWu?=
 =?us-ascii?Q?R1WTHDAgxkBAO0qg/IJ5k/pLqcs24h45nT2Q3Gnqwrzz812oMbY+VO6ZSVFO?=
 =?us-ascii?Q?uzhIp7SQmsm1UolFUch37rmhIos15DjDouJHU21ujj0G9D/sCXB1P7BDa9+T?=
 =?us-ascii?Q?KVI9ThKKKo0/xOt4aGGL362Xd6Ewbq+4cF5Z6uy/GkwFarSK2SMS5hWt77D/?=
 =?us-ascii?Q?9PEFG5Q291FekEJVg/DUVWobFiN0rNn6PmsYvvupfOOa+C5kZlyM2uNrXcXM?=
 =?us-ascii?Q?e1DMrE3g8iiBCecPxiK5hM+UTs5EXX+bx1vWjIlvFFQlC6CBwG1JfdPwWyWY?=
 =?us-ascii?Q?Ds1betBMXIGx018W0nQZihv37JDpgicxRnXCMU3CCS/W8TtixuYIYKCVOz9z?=
 =?us-ascii?Q?aMYV+h91WXUFP10S2B6huHYWNDLeA2tXWNqt2tMzTnwcFOdyldoHzTHITsN4?=
 =?us-ascii?Q?KJOHConvQlW/7g87IPpXn7I/ui7vYuiY1MSS1O0CMVJKtcNrld3kFB+xt94S?=
 =?us-ascii?Q?FwUQ/08DxxyPsfcGVOUv6N8E4M4sUR5qF+ghzt8iPQ8f0pcElPHxM0HPKAT5?=
 =?us-ascii?Q?/wpsQc6tGviiFj0ceu07Woav+jKCLH6zgXeUNFvAmORFH6vcgYCOljpaIhcy?=
 =?us-ascii?Q?SfhL9XyWngJ0P/re+pC+dqk8oydh4R0EF8CNkYPVpCQ7d4yxPA5+PzbbwTr3?=
 =?us-ascii?Q?gjJMLp467iyibiAR84duew9/5yNubKW13Y5c9NafFY0pIyU8w6yhUpljJJqA?=
 =?us-ascii?Q?laJkma87+GObCIeHcU4KBLVkueOrCsG9/UJQ6C7i+hOAaIZNLpgR7dyWNTik?=
 =?us-ascii?Q?g8F5OE3Z644pb62kHm4obabdrjjKUK/9mwuJrzMmeHCe/5ySah+1cJX6Rlrc?=
 =?us-ascii?Q?eL0wkSk+PbnI1Kr5vzuLG6KZ+puvPZSk1gylq4S+cA67zq9/Yu6Q7lKc/JqH?=
 =?us-ascii?Q?ciS28v6S8clkKE625fAsxxvXCFyfDQiS0NaczlYFiM2SelGc15vhwpO9OBn2?=
 =?us-ascii?Q?XeJv1ZEvrcY+ri3gDdagaE/DyrBYAwAXFmjND4WLiuyTxHx75T5jqQPlvQJI?=
 =?us-ascii?Q?mef9lbNLUNH1snCtUehA8Y5XwYRpkCIbFV04uWOe9CmGZdqnhg=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb4d0888-700a-4e33-7759-08d8d4a3251a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2021 06:54:03.9338 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZSkFE836r+LJ/++KlCEUYBWJqNvyJr8vZku80A0bJAIiaQZBYcVdJNhkbVIPZaieRGFbzoGKkFBar328JF5NRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6352
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210219_015410_000307_1DF4ABD3 
X-CRM114-Status: GOOD (  21.39  )
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
Cc: Stephen Boyd <sboyd@kernel.org>, Atish Patra <Atish.Patra@wdc.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Anup Patel <Anup.Patel@wdc.com>, "seanga2@gmail.com" <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2021/02/19 15:29, Palmer Dabbelt wrote:
> On Tue, 09 Feb 2021 21:02:13 PST (-0800), Damien Le Moal wrote:
>> This series of patches improves support for boards based on the Canaan
>> Kendryte K210 RISC-V dual core SoC. Minimal support for this SoC is
>> already included in the kernel. These patches complete it, enabling
>> support for most peripherals present on the SoC as well as introducing
>> device trees for the various K210 boards available on the market today
>> from SiPeed and Kendryte.
>>
>> The patches here are the remaining patches not yet applied.
>>
>> Patch 1 adds the SoC clock driver.
> 
> I don't see a Review or Ack for this one, so I haven't taken it.  Not sure if I
> just missed it or if it's going in through the clock tree.

Stephen sent his reviewed-by. It is on lore:

https://lore.kernel.org/linux-riscv/161301087300.1254594.18438542581140302342@swboyd.mtv.corp.google.com/

There are a few additional nits he pointed out but I will send an incremental
patch for these later. I think this patch needs to go through the risc-v tree
since it touches the sysctl driver too.

> 
>> Patches 2 to 9 add and update device tree bindings documentation to
>> document the K210 device tree files. In particular, patch 2 and 3
>> define compatible strings used for the SoC CPU and for the K210 based
>> boards supported.
>>
>> Patches 10 to 15 update the existing K210 base device tree and add new
>> device tree files for several K210 based boards: MAIX Bit, MAIXDUINO,
>> MAIX Dock and MAIX Go boards from SiPeed and the KD233 development
>> board from Canaan.
> 
> Looks like I already have patch 10.

How come ? This version is the fixed one which removes undocumented dt nodes.
Did you queue an older version ?

> 
> The other DT files have an entry for a microphone with an undocumented
> compatible string, which triggers checkpatch.  I've removed it, along with the
> audio entry that references it.  I don't really have an opinion on how that
> stuff is in the DT, just that we need to document whatever we put in there.  If
> it breaks something I'm happy to swap it out for another version, I'm not
> planning on sending it up until next week (I'm sening a PR this week, just with
> some older stuff).

Works for me. Thanks.

> 
> Thanks!


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
