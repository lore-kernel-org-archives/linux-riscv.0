Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F6A5ECAAD4
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Aug 2022 10:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eJBZlFq3RW54MvOOuJhv3LxShlH3xepqt2/41y8Ms/c=; b=bdRnEWmn2ZhbOk
	G9vMoVuh7WXI5CqUFImrsWVpGQp8VXvawBHt6c10YYMcz0B8GI720ONLtij0jbhF231ol+MMhgvze
	SY1FPbnqRGLrAOKUVubxdQVwYvDWNm7BekdP4ULDHkOsM/7RRszk9pNAP7P4hLp18hYBk1DWPtFqZ
	5XXlHnwgDcX55JoOnX3K6n5mp/ABJ2/0zEWMzp6v9n8eGV9+0CTUx4qc6+QmVgRMwS5ttawnPvWzT
	/4J4ucJrb8KqTNP9vbCH4m/6waDsxQXs/xwSKF4gFPUCpGgdxgADYZv8OulyXwC0PWo0s0tYFfNUE
	W/oiSou3pRMiIyljSjMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSc4d-007Ni0-8x; Mon, 29 Aug 2022 10:32:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSc4Z-007Nc6-Lw
	for linux-riscv@lists.infradead.org; Mon, 29 Aug 2022 10:32:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661769171; x=1693305171;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=50hL9fUVNiSQ/9A39BW3z3brUgtFpX+B48k/5hh/DFg=;
  b=ElQEyFo9I6iQCFIPttdDnFahPNpGALNSvFnPdyArIzq/ENyIk+Dv71kF
   u6IMdeUKftDjrJ67vux2T7z0bjaY3zoKSWiPnoSPlYHqJLFEaOic+j6Mq
   +xTmFHt2E9BUo/y7Hm/SWhItcvgcMmihvrS6My9O2E91G4FgsIVqCvfYn
   Fb0Zmxc2LkpVeEdOnv7KcGpX+l7vDnYS5AAUnzxvfrQfm7BSoBwBSnSPR
   YHojjc3F+JHCbtE85r4WHt/mX1KjbGMtHt5knREtsPp2KdVb3Ainl6p0E
   kIViUdCwv+++wXWd0zeq+yeE8OHYgMlvcG9lJGIXXKxt7d8q6vySFrKhy
   A==;
X-IronPort-AV: E=Sophos;i="5.93,272,1654585200"; 
   d="scan'208";a="174599709"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 Aug 2022 03:32:43 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 29 Aug 2022 03:32:43 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Mon, 29 Aug 2022 03:32:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gOMZ7QzynqY4A9lbgLQsyOYQFzsQpJGxWFtgMIImaCSzHMjnzU3BBsoyJCtDxCZE8mOuXqxMuEgGWNwq5bHvOHg/LGfb3hTQRvIqTXknaq6tisiVA+wydq/xVpkXvAsFDiNInvgKH1pxprInaYHt8vNocd6h5mNwMz92H3kaSpd1LHoiSrasHWdLOqK1XXggVurIatuFi5gHAtLLZlfuyYoP5bTWBEnMmuUszi2yfSXfrvAewguoDuqv4kZHUGXWojE4PRoQMwna2SQ7ojjWlUnqh+N+z0sxyGe/nd0LF6heYzPLUdZ/VXtmex0JzlGayAgUemUtjsC/bfAsak2Q/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=50hL9fUVNiSQ/9A39BW3z3brUgtFpX+B48k/5hh/DFg=;
 b=aDhuMr6W83VqwtMv8L0KNQWBJtsTM9HA2D2v/AojQQCvWKKhI6kVhkTh7nIq9OF8XSEAxljYmHJQBJa+Zr6E5uAvb5PycUKfDerhFVIXuo5GNd4I4NAFxZG8ObCfg2SAQ5yZTvxxYYC0mBzDiPeDX48nE57GL1uQJaNB0ZNSLo36u2rWH0gjk3OTGKSliNHOBqzwM7iAXfS2qx1yBC8JP/VCWPBH6iGQBfzd3aVWMSApPCccdoAz+GvjvMe9T5RrJj3j1sVGUMI2yup1TnBXDFd5+9G/0eS+ghFjsFFGiBd1t8GtL9+ytQWAGhydAuoO91OyHfZWztIaGlF/H0OJ6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=50hL9fUVNiSQ/9A39BW3z3brUgtFpX+B48k/5hh/DFg=;
 b=Xou/78melj55aBpvmBM7dxIA9QcfrbJxAA1ItebuIQ9+WmueaUSYz5zWvzUah287RSmdpZ7Ow4eOktUuhBd92rodXMbJLllOPUUOSfBBmZM7dhg0Uh2LQxAyuNKzAcVeMTQErhl0Jf83wp+yAGk0tc+eMEZJaPNcDblKVHefoEM=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BL0PR11MB3121.namprd11.prod.outlook.com (2603:10b6:208:7e::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 10:32:40 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%9]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 10:32:40 +0000
From: <Conor.Dooley@microchip.com>
To: <heinrich.schuchardt@canonical.com>
CC: <robh+dt@kernel.org>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <krzysztof.kozlowski@canonical.com>,
	<sashal@kernel.org>, <geert@linux-m68k.org>, <atish.patra@wdc.com>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH 1/1] riscv: dts: microchip: correct L2 cache interrupts
Thread-Topic: [PATCH 1/1] riscv: dts: microchip: correct L2 cache interrupts
Thread-Index: AQHYu4dTtNgUHpEviEaOXT3l7oIUCK3FrjGA
Date: Mon, 29 Aug 2022 10:32:39 +0000
Message-ID: <4a62d792-012c-f8d1-ff5c-4d0edc2037e4@microchip.com>
References: <20220829091034.109258-1-heinrich.schuchardt@canonical.com>
In-Reply-To: <20220829091034.109258-1-heinrich.schuchardt@canonical.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 305479b9-ec5d-46fb-c320-08da89a9cc8e
x-ms-traffictypediagnostic: BL0PR11MB3121:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: x46osSI7b1Gp4gXZuAvHY6UO4ZM/q4DI6WgxdBRLhgovpRVU9r2qsa/LWmlPd6dzANSgIhxtIdVR27MrEUt2NjVqJ9bzTQVuH/DmcCVG3Hw8uyniePu780RzDce5323ChbtDN2o70aeAEvLWZ5nC4W8XLhp6b6FHh6p+62K4tUgiBdZ/6wvNjK7U6YkSAbAI9EbuDYcR+jlSCFMIyOuijEG5sKZM+fLBlsIYR6/Y2TNP2eRS3Tv5wf9syqRn+oi2BovdvpzQZJF4WrfHtDgN3SEC59ZY3uQEFzRwO0OPfyDcD+SKAggTFX2pQJGtyiZGFzr5OJ3V8ppuRnNb8WvH1yIRuc6ePhDd2OZo0+TfNLu+2ZwYp+9+kVeyhsnZr8atII6Q8EKYR8QEUCxjcVPRp772oBizbBG7GYIsaQCnkON1F2xFcgMshseYLwuGAYlSaue3Fg7y2a+r7+Ww0ut03nmIQE7Iy+pr5pf+ERUQHqge3pNC8OCtJZbtlxP49THf7L/YiziXrp8UoeaxeL7XBaGJ1s7yOYN+gpefskY0kSmJuItIy1iDxR6lLN5Zk5DgYefuKg6EtzelhPid6i812gKKDf08HPQe6bEXUW6SnscaLu8NetLrA/2yvE5/A1N7oyRncr4UBdbvdn7Ce7MpsJgiSvDDxGqoQfCylSWa3ixeuMODQQXUB0zlZrSLk/MQ94cuE1FkPBk3rr74rAvWUXwDqwURZrOvoSBCCJ5T8ZCCfj47gVjdhXNt6WE930KWzSgvOLgNQhqkADuCZgI3gzZXcCeaLVf/NRDgDxBpW92n338ZpHwbRDih90D7809kJwIe+Y7S6W4wU+4UFjAvGYWf24ScWPLzeyuRG8e4qKA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(376002)(136003)(346002)(366004)(396003)(31686004)(66446008)(2906002)(91956017)(4326008)(6512007)(7416002)(66946007)(8676002)(76116006)(66556008)(66476007)(64756008)(8936002)(71200400001)(53546011)(6506007)(316002)(6916009)(54906003)(26005)(966005)(6486002)(41300700001)(478600001)(86362001)(2616005)(186003)(122000001)(38070700005)(83380400001)(31696002)(36756003)(5660300002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a1JtTkhuVjUycnI2bnQxOFdaVHg1dXhSNlljZG1FQU1Ga1c4ZzIrZGV5NUFS?=
 =?utf-8?B?Z084SS94RzUwY0lPVklhYWJPb1BVTkNOc2tqOHBqTmxFZDgyQnlKQkpuNDBm?=
 =?utf-8?B?cjlaM1pub05GZGRjUjNIMlAxYkZjSHp4dC82QWtBYWQrN2d2ZTZMN0s0TnZq?=
 =?utf-8?B?MFZRakpMWE0zc1NaQ3BVYWZpZDdNSGpwTUJqRlFYN2RHd2VZbTExdUFyZnhT?=
 =?utf-8?B?NktyRGM5bEQ3U24yNEFvVSs5NWJSa1F6OEJqckg2cndQK2ZhajB0dEEvQ3Z0?=
 =?utf-8?B?STFOYnpFMG9yOTNUWDFQcUVGMFVjQXFSeUlWd21zVnpWZ1J2L2o4MjJZNmdT?=
 =?utf-8?B?TWxJMTRQREozODRRc09kS05HeFc1VTNUVHFSN3MwUm8rUUVFdG9YZEtIQnJW?=
 =?utf-8?B?UHNNVnJ5VjArdXpxdlZyWER6bUpoMVBsUzhDMWxydHJRK1FoUHkyOFArNzBY?=
 =?utf-8?B?Mk04TlZxZFh2NDRRekI3RVdKZS9hMXFyQThkQmlvNFFzNEF6R0ZEcm14N2hl?=
 =?utf-8?B?VE9FQk5NUi9SaXZHYTRSdGVucUc2YlFZUmg4L05jd25JTlFzdkZPaldnMnRo?=
 =?utf-8?B?TkllRTYwcE93TzFIdnMwSk1Zd2huSmJtdFZ0eEJFSHZPc2U1bWovLzVFRW85?=
 =?utf-8?B?ODh1WU5QZDJuSW9QZW11S0xnNWRxRGVjUEpsL2dDbzd0YkI4TGt3VHR5RHF1?=
 =?utf-8?B?RVhOSHQwUFB2bTlyWlRudW5rK1JENnJ3Tm1adXllenRxeHg2Tm4yaEJ5RDZ3?=
 =?utf-8?B?ZGFKQ3o5VDRCblE5RFVwN3hWQ3NiMFNWemdsOElqbE56cE12R1ZOWkYxZjB2?=
 =?utf-8?B?RmFuYzdoZG1ERGNZYXEwcEQyZWlyOW1rZDRiLzNoTnZKdVg4Tm9Yckx3cnRQ?=
 =?utf-8?B?MmpUMVYvbEs4eUdQdG90L0ZndWVUTzFHTWN3MWVjeGJOeS9Ud0hyV015V3Jr?=
 =?utf-8?B?cTh5UkM5dmpvSDJBbTY4c1d1UUNOU0l3RktaTjBycTFVWjBoNnY0TW15bVQ2?=
 =?utf-8?B?RGltM2pseEFHTlVPQkt0V2t3c2VxWFVmSFlCdk9EcHlOVUxqcTNWc3NIYS9X?=
 =?utf-8?B?d0ljcGtLY1dkMkcyL2pyeFVCTzJmeE5PM0FhSXlZS1pra2k0ZFRZMnk2czlt?=
 =?utf-8?B?OEY0QkZSTEtTOUdDeWtDU2RRdCsrV0lJOGhxZUJkLzU4TWhMZHZUZk9HelE0?=
 =?utf-8?B?L0VFV2lYMUJscXNGa3JUWXJpaDhndVpwYjYrQXRpQmdYNHNSV0JTcU1qQVI4?=
 =?utf-8?B?WlNaYmZ5dTBlT284M0RzcndJRElkLzFiQjh6YWsyaWR0Y3V2eDk2RWp4L3p6?=
 =?utf-8?B?Wmg2MTJjSHNYb09qdXFNeFI1cDhLUnd4VVVaYjNiZUtJeGdTMG9DTXdtVHB6?=
 =?utf-8?B?YU5wMk12NloyWUNOOTFkNzNocEl1ZnY4cTlYSnp2alhPZTVzVUxEcDQ3bnVa?=
 =?utf-8?B?N2NnMG9Xd1JVK3VNWUdhb0VwdzJ6K05vdFpHWGtIWDloZnhLNG5tcUtpbFVp?=
 =?utf-8?B?NFlIYXlmdzA3UDJ3VDJCZGhWSkQzVVJnSG4wclV3cUhMSEdHQVdVY083disy?=
 =?utf-8?B?bjlXR004WU5STWZqbEFTQkJBOHZSUC9MbGZMa1RUL3VpWnZadGpaT1BxQy9j?=
 =?utf-8?B?cTkwRURTekFZSGp5cXFIMnBTU25QRzdUcUxJUm5rb0k3NVZCYVlEQ09HZnJK?=
 =?utf-8?B?TWdGMUNxbGdRQ0kvdEtMcGttV3pWcDJSR1dQblhOeGY2Q21RcCt6dDVFTzhu?=
 =?utf-8?B?aGE5eUxmdmFHeDZ4c0hRUkh1MFJscUVsNnYvbDF0OWdlVWFBVis5dmFNeWty?=
 =?utf-8?B?YnZQajlMK1d4V2R5czNjUEM2U1Y5dWpKbnJocnA3OHJiVGMxQ1M3ZlhZT3d2?=
 =?utf-8?B?bmpDdVhPVEMxZlRJUlVuRWE5bHN0dTVENFRiczlPeU8wQmNpT0NjVkZDdjVO?=
 =?utf-8?B?SWhVQlNmTjJNbldBYWt2N2xtVFZuaHBWQWZKdWxPUTdEWVVKMFpZalVtczBR?=
 =?utf-8?B?R0JjL2tmL291b1JZVDcyTnNUWjdURkRTQVErOHp5YjkxZWtqbi9nS2lVWVdi?=
 =?utf-8?B?TVZEc2JqQkFRNVZBOHNCUkg2Z3dlTjVQcjZqSDlCSTFHMDdhWUNDYUIrelNK?=
 =?utf-8?Q?GJG+WvcjfeqwAYBC231vjHcrH?=
Content-ID: <29DFBF4D9B3A7F439479794386EB3D19@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 305479b9-ec5d-46fb-c320-08da89a9cc8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2022 10:32:40.0108
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wH45uCC/mYAjVBpmcx4R1XfMB1JxLONdJ+4cmmUjENd+zRl8mG19bCJDbLtODgGN2xX8tA9qzcddI64MblVVxv7RlEylUk/KNHCrix/oHKw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_033252_133832_2E0CDF69 
X-CRM114-Status: GOOD (  21.27  )
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

On 29/08/2022 10:10, Heinrich Schuchardt wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> This is a backport of commit 34fc9cc3aebe to v5.15.
> 
> The "PolarFire SoC MSS Technical Reference Manual" documents the
> following PLIC interrupts:
> 
> 1 - L2 Cache Controller Signals when a metadata correction event occurs
> 2 - L2 Cache Controller Signals when an uncorrectable metadata event occurs
> 3 - L2 Cache Controller Signals when a data correction event occurs
> 4 - L2 Cache Controller Signals when an uncorrectable data event occurs
> 
> This differs from the SiFive FU540 which only has three L2 cache related
> interrupts.
> 
> The sequence in the device tree is defined by an enum:
> 
>      enum {
>              DIR_CORR = 0,
>              DATA_CORR,
>              DATA_UNCORR,
>              DIR_UNCORR,
>      };
> 
> So the correct sequence of the L2 cache interrupts is
> 
>      interrupts = <1>, <3>, <4>, <2>;
> 
> This manifests as an unusable system if the l2-cache driver is enabled,
> as the wrong interrupt gets cleared & the handler prints errors to the
> console ad infinitum.
> 
> Fixes: 0fa6107eca41 ("RISC-V: Initial DTS for Microchip ICICLE board")
> CC: stable@vger.kernel.org # 5.15: e35b07a7df9b: riscv: dts: microchip: mpfs: Group tuples in interrupt properties

Looks like I screwed up here... I assume the non-application is due
to the rename.

> Link: https://lore.kernel.org/all/20220817132521.3159388-1-heinrich.schuchardt@canonical.com/
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
>   arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> index 4ef4bcb74872..57989b2ac186 100644
> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> @@ -153,7 +153,7 @@ cache-controller@2010000 {
>                          cache-size = <2097152>;
>                          cache-unified;
>                          interrupt-parent = <&plic>;
> -                       interrupts = <1 2 3>;
> +                       interrupts = <1>, <3>, <4>, <2>;

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks Heinrich.

>                          reg = <0x0 0x2010000 0x0 0x1000>;
>                  };
> 
> --
> 2.37.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
