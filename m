Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF84DC48260
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Feb 2024 23:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z5xCrxRUmV0nvUg8QvpsLf2HXq/U8URRTW0O2ltpIhs=; b=fFXKvo690RyeNt
	lM29cQtjh8VbG8rYAMa/VKDVg926aOcxrYr3a9fKQ9dTdGcUODKiK2ecGuKs0Kqe7jSRvPnUbegCp
	qMuGcl0AgGNzPm7F6A/SDaCa87Q64vEngPAncEFSWxF0Q1SKKFokf3vGnTAF+4Au2/r7PQ+gL67nw
	V8SB9jYHnbuWOuWfH+ERdYDnzfpaVj+H8DXzgTXqakH7b6G0xInBnipx+MzKkB2s/pyWmmd2lCQv3
	Qn3Agxi6t/OP+XugMlPyo80KDFXFWT8EiP0i94Gxy7eOnQQEo8a+FRn1qqOD3lQaUennMauucWtLn
	96TyfYCyE6q6nsoaadqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX8U2-00000005ZI5-44CT;
	Mon, 05 Feb 2024 23:34:38 +0000
Received: from mail-bjschn02on20721.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::721] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWS4R-0000000HZcA-3EiT
	for linux-riscv@lists.infradead.org;
	Sun, 04 Feb 2024 02:17:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DB8bvlEyV8v4AklccW1zZ9niNzxNux/cph26O+sNMShZ2GIUBcjOZoprHRNYUugDBAmgpE0Pkfdz+MpdVkxOn6RjwFWXWNYTlAFGoVVkIw1U73rHf56ZiLtfHZ4xR6UynSBTzG9DT/h4aOt1eFq5M8t99CtmhTCpIisP3iJadFg6bDvzTK+21wp4PyReiZeDJL1h4sHlmu6+wmFE91bRl4ZgimFCQD+Z4Fq2mHswU1nB8VlnzMSrRee9vF4/W1jO1pP/p07TI+I/FvJBKytWkN3/9pN6v5YOMRJqkLZJtDRjVpj4dKsM+9wY8Ic87+Zy0T8cFibszS4YEicC7lqCrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xM0rQQqpdXIeXMTyOrJSDM/ll7BB3p58wx2q8HkvxK4=;
 b=LlAOPOq/j5LA79SLGBMBDEmEHEo2eTcj7xzqwmmYrT3dJLYM6j6bzImNnywNG37xgRXh0BpgAQY1RcAJYx72WNmU3KKApPxhqM5fHA3jaD4r7UBqhbBVzneNRvB2D3lln2TXKKWzHSIw5F7kBmWKYGNymFKqkHPHLoN/kWAVChlFgjpZGlqq3fXecfKU/8Uu3tRs9QMpPP5fmxHj9GPiMEYGGIdUorj8popmIr1mIf2WkxUv9kjoYFHg/V0+tX2zO8bVHdI6UnTOyeMgiSxxTOVj9vkuP6A8pWmiQmRvSY3fPPaxVV0s36OM+amlJJAy4FXSutSNBhcFMpDK5odrwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from SHXPR01MB0671.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::10) by SHXPR01MB0880.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.28; Sun, 4 Feb
 2024 02:01:04 +0000
Received: from SHXPR01MB0671.CHNPR01.prod.partner.outlook.cn
 ([fe80::b0af:4c9d:2058:a344]) by
 SHXPR01MB0671.CHNPR01.prod.partner.outlook.cn ([fe80::b0af:4c9d:2058:a344%6])
 with mapi id 15.20.7249.025; Sun, 4 Feb 2024 02:01:04 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Conor Dooley <conor@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Emil
 Renner Berthing <kernel@esmil.dk>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Jack
 Zhu <jack.zhu@starfivetech.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: =?gb2312?B?u9i4tDogu9i4tDogu9i4tDogW3YyXSByaXNjdjogZHRzOiBzdGFyZml2ZTog?=
 =?gb2312?Q?jh7110:_Add_camera_subsystem_nodes?=
Thread-Topic: =?gb2312?B?u9i4tDogu9i4tDogW3YyXSByaXNjdjogZHRzOiBzdGFyZml2ZTogamg3MTEw?=
 =?gb2312?Q?:_Add_camera_subsystem_nodes?=
Thread-Index: AQHaU1XbC4h2Cxa8Q0qBcekBfbY08LDz/xMAgAC4KBCAAR2gAIAAguQQgADwi4CAAixdsA==
Date: Sun, 4 Feb 2024 02:01:03 +0000
Message-ID: <SHXPR01MB0671F4FA0292CDF3034FEE48F240A@SHXPR01MB0671.CHNPR01.prod.partner.outlook.cn>
References: <20240130082509.217683-1-changhuang.liang@starfivetech.com>
 <20240131-recycling-entering-b742e0e835eb@spud>
 <SH0PR01MB06675EF7ACD1452C4DEBE45FF243A@SH0PR01MB0667.CHNPR01.prod.partner.outlook.cn>
 <20240201-handiwork-excretion-36aa2eea0709@spud>
 <SHXPR01MB0671975B6B2455E43A5C7D86F242A@SHXPR01MB0671.CHNPR01.prod.partner.outlook.cn>
 <20240202-spoiler-deceit-0e9ac720fd2c@spud>
In-Reply-To: <20240202-spoiler-deceit-0e9ac720fd2c@spud>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SHXPR01MB0671:EE_|SHXPR01MB0880:EE_
x-ms-office365-filtering-correlation-id: d07fa423-eb82-46b5-1623-08dc252524b3
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6ZGrGks22nVeZuArXZuw3aKAJEhp+WztYrsA8Y1MK+VQ14kj+CYe44JUioPGeLnMmo7YM6G/eoKfpjKD/xJjps30JMwis+o8P92cUE8LYB53s6wpgvC87uOsV0Pj3ow5ZpPWP/yxCssomCg6YJmX27ZCdsENrhiqtOSpaBLs1OjL1ljbqHOVK53Rc6j8Uh/FTfvb78WiXE/dkLtoaYD5/nRadBFnlmIDjtzAajZYng42DnRq1f76bn2yKZ3bUh78OYRo0Jbq+cShRIIeHgFB8ss+3VTdnam8FuRlkTLte01170nJRKvEJIXdxlRiQ5vk6SsIxEpl5QomUHted26ZUA6JB/icmW3oN/WQQ12mKf0SG9SESSpvgHFyrucMdF29ul9JJkXp1+B92mjwk1qwSOU8IY1o3/FvCKZR4aJ40zhf/bS7ZELclJQaQ6CzWvj74Ny8CoIMY9QhPuhmeLUhHVaRA1VWuyMN+XS5bMz26rZAwezOolNe9Gwsjz0ZZbx1dps9zp3AYXvwOri92V1zMlOMqtn/WU+MSXSDzr6RIEK0VtaJcYLhFivHf1sCNZQs
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SHXPR01MB0671.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(39830400003)(136003)(396003)(346002)(366004)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(508600001)(64756008)(6916009)(41320700001)(38070700009)(224303003)(76116006)(8936002)(66446008)(66556008)(33656002)(4326008)(66946007)(44832011)(2906002)(66476007)(7416002)(86362001)(7696005)(9686003)(40180700001)(38100700002)(122000001)(5660300002)(40160700002)(83380400001)(966005)(54906003)(71200400001)(41300700001)(26005)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?dk85Y1h2YzhHY3ZmZ1FUT1NnK09zdlBLVFpuZVJ0c2VOenQ5NW1oZURwNkdB?=
 =?gb2312?B?QnByUmFvbFpoVWxhM0NNaVRlS1hMM0RvOFdPMjZpUEhycXU4ck83d0xIZVJ5?=
 =?gb2312?B?ZjR2QkZwN3V3UU04VEJ3aXp4bGhjc2cvRmd1dlFIVjU0NTRPb3ZPY2pIeEg0?=
 =?gb2312?B?NWRBQjFVeklYa1l4dWRKU3J0VEp1dWZzd0FoQlFmNk9BaFJOQTVwMDd0L20y?=
 =?gb2312?B?bE5yYzFGT0g4S1M1UTBpQWJZcGp2cFFYZ1YvZFIvUE1mUll6N1BlYlZiT2Rp?=
 =?gb2312?B?MUV3alo1Yjk0a1F3UTU2a3lXZFM0Nk9zcUxCYThoNjdzT28rWEJ3Y3p6OC9V?=
 =?gb2312?B?Smc3aFVIQmRWa1JNUG8rVWdobGZmTTE0VXRseUdOVzJzb1E2MTNRL05EY2Fj?=
 =?gb2312?B?T2t5QjFhTHRUd1hFckFBVU1rY1Q5VXpiMktkVkgzY1JxTG9zRU1wTU5tcnZ4?=
 =?gb2312?B?VnpHdk1oVG9POTF5TUttOWtRc0I3ekdHS2Z6c25tOEo5WDJ4Wi96Y1hHZHhZ?=
 =?gb2312?B?QWR4V1kxbHNOVDhsSy9RWEdaTzJOaDdlNG5RdE9aemhUVGNVRktqeWR0MGpG?=
 =?gb2312?B?MjVXVUJXQjFZem5yS3Z1bGhzZm9HWnU4bG12bnNGSVMzSzdmcm1peGpleHFs?=
 =?gb2312?B?M3VEZk9vNllTWHE3Z0pvSmNCeGNvNWYrb2poM3p3Tmxnc3F5S1dTTTlubDVn?=
 =?gb2312?B?N3N2ZE5haXZBVTBuT2E4VTIrTUV5RGthNkdKZkpHeXJvRnBOcHdrdXhWZ1BP?=
 =?gb2312?B?Uk1uWUg0dUpFOEk2emZsUVVvaFFyNVh3MHJ5bjRnOXliVy9HeEdjWEpLdktX?=
 =?gb2312?B?Nit6M0htZ3VxdUdzUUt5bmd6RXVpQ1dyL1F3MVFEcTIvdk9PS3IyTDVJV0lj?=
 =?gb2312?B?cVpPUGRGeUMzbWdnRlFhZDcrNjlCdytxZXRORjZ6UXZvcVJ0Wk5yQzJVR2Rt?=
 =?gb2312?B?UER0MHo4UHlxK2xhY1drb0hKSjNRdjE2NThWN1JYdERiVC9tUjczaFpkdU9B?=
 =?gb2312?B?eExYSGhnVjJSd09IS3dwQWlsZURkOUE0R0o5NkRWOFRGekp6c0RLWVREdnZX?=
 =?gb2312?B?cWJ1L2l2a1I1OUtUSEFHQVVyd0lnWmhUN09kdkVsMFFCazdxUGc5Nkh0RDFX?=
 =?gb2312?B?bkd5dHhaU2tDT2xoZEtoaHl6MUE1WUlwRStRMFpId3IxOXFOT0Z5dEdnUFhW?=
 =?gb2312?B?U1VrY0YrYWRCWHU0N3RxQm80QzBoRE42aXQ4a2l4THBOTEYvNVBBRXA3RVR3?=
 =?gb2312?B?aUVOV3VGYnBCY0hoZGtlMWR0VjZ0c2IzQnFRVmxmeExTUHVBU0FxNi90K0Nw?=
 =?gb2312?B?OVVvYUwyM0F3ZlZMUktwdmNKK3g2b1BuZUM3RXZWN1B4MExVQ3daclQxamFa?=
 =?gb2312?B?a3RZbkFnKzM3aVNFSjBrSEZjdUlmV3lJbDVXMUZUYks4VkJmbG00MWk3bkc0?=
 =?gb2312?B?aEh1RE8rR0doR3ZFQkJWT3cySmpud3d4SWZFaVUxc3lidUMvNlFjbUplK1ZM?=
 =?gb2312?B?c2QrMXFCMVZMSmdzc1BlV2VIaFI0ZjZxcVFCWVFwd05nMG1lVmw4SGc2YVJC?=
 =?gb2312?B?RWFrKzg1SkNvaC82dmtuWmRqL3JpT1ltcjdYSytYRTJ5cU5Ha0JZTHNZKzRG?=
 =?gb2312?B?dWkzRnN0L0dCSm1QMllMN3ZqTVJMQ0ttV2t4Rm1PQ2lBbHZjRjZWMWhGNFpT?=
 =?gb2312?B?SHFmUHRlK1BDMXlscitOVE1naTBuaHFOUmJhUHVCa1RkbE5MR0tweG9jNnlT?=
 =?gb2312?B?aWFOWTh3RGJ6RlZKa1BTczF6MWRzcTAvTmZVWCtJY2lhWnhRNjhSTy9BTHdF?=
 =?gb2312?B?S05zamMxN3BKeXUweU1XUzVnOHFrUzhOd0t6ZXdWQXFUQ2lKYnVxN0pEVWx3?=
 =?gb2312?B?bjUrNUwvOFU0aExML3hoT1NWb3lVdkRNRittTW5ibGNxV1hJeThwMXhZTGNV?=
 =?gb2312?B?WWc1U0M4SUQ3SmpGRjc3ZmtySXk0N2dWV3hzUGhaVVRZejNkYzFmaEFneWc2?=
 =?gb2312?B?M29qaHFKUFdyLzAzZVQ4S2o2R3NTcU5OY0NyZTJxc21jMjBqU0NCaHIwYnRR?=
 =?gb2312?B?T0xnMXptZ0hhTHZoY2Q1NVZJMWJ0QVYzN0ZobUFVZzNnOXkwWXRvc3ZCSG5p?=
 =?gb2312?B?ejI2Ti9IU1JqR2JGaU83QVI3K3NDZnNIbk5VMlQrdmNXUkR3dGxzOTBMQlZB?=
 =?gb2312?B?S3c9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0671.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: d07fa423-eb82-46b5-1623-08dc252524b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2024 02:01:03.9248
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uHWwIRNVGyw+zNkdofUDBRhi3kvapoN4NIL1ztv16dFFdA+rNz8K69KB8d49AabzFOE79T/eVZ3cv+evINja2l05WQIgyuc+lGGXrO4D9YA1+tv0QdoJ6GxwHgAGSJV4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0880
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240203_181723_821948_F36A221D 
X-CRM114-Status: GOOD (  17.90  )
X-Mailman-Approved-At: Mon, 05 Feb 2024 15:34:38 -0800
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


Hi, Conor,

[...]
> > > > > > +	imx219_clk: imx219-clock {
> > > > > > +		compatible = "fixed-clock";
> > > > > > +		clock-output-names = "imx219_clk";
> > > > > > +		clock-frequency = <24000000>;
> > > > > > +		#clock-cells = <0>;
> > > > > > +	};
> > > > >
> > > > > Why do you need an output name here?
> > > >
> > > > The output name can be unnecessary.
> > > >
> > > > > Also, where does this clock come from? Is it an oscillator on the board?
> > > > >
> > > >
> > > > This clock come from imx219, not the VisionFive 2 board.
> > >
> > > If the camera is not on the visionfive 2 board, why are you adding
> > > this to visionfive-2.dtsi?
> >
> > It seems that I need to use dtso. Right?
> 
> Yes. FWIW, the same comments as applied for the sound card Walker tried to
> add applies here too, unless this ships with the boards:
> | I'm not against allowing in-tree overlays for
> | hats/capes/daughter-boards that come bundled with a board, but
> | accepting ones for a hat that someone decided to use theoretically has
> | no limit! The "someone" in this case might be a StarFive developer,
> | but it could be any random one of your customers next!
> https://lore.kernel.org/linux-riscv/20230510-riveter-ridden-3f056251e623@s
> pud/
> 
> I figure this is a similar case as that?

Yes, I will drop the IMX219 node in next version.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
