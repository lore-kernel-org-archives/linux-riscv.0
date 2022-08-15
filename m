Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A409C25B0E
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Aug 2022 18:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YEhjhqHAHWLW8GJBKfdjo4XY5DZZH1/deqrK5QpcFX4=; b=XSPGLgbF7fLyh4
	BevfmKpi88bVu7kCqc33vO73LhHuLX+egqb5Kn5la+yaW0SP7XjGyI72MDEoRNVwh8mAskkW+cswW
	p/ojNYUHcPWAJSP4PgV3lHMx+fjFBG5/Ry0YjtoDh9lB5EzUAwZjINZcs97vtZn5vNcJ4FtH/suDq
	3SQp5+zQxBUyIbqb6N4MN0+GMh275DP4u9F71sT+KdQt90yw9Cq83thAHw+SMaqLWCwX0nP0Mxhxx
	1i4JJGqgV5xIHwH3BL26IYp9GyoCqQz+ck3z4t5iOPJNlSXih3IpM8xhBTh+EbIk6tozp9bXI2gbp
	gn3FTk9lul+8VJWbNAIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNf8O-003RH0-Ai; Mon, 15 Aug 2022 18:48:20 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNevD-003HEc-AQ
	for linux-riscv@lists.infradead.org; Mon, 15 Aug 2022 18:34:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660588484; x=1692124484;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=6B05DTc7/3NRzggygnA2/PvoF+8NIleTzwuUXOHEDBU=;
  b=voX60fCx6i23Ab8xavufTB3jGaNwImtLG94dxDruNIWUuMXCqsvt3gSO
   sFj7dpE/BSj+JCu+eAdYKE8ArbEF4sVDQYx+DwXAdJhcEPvmgnuo8jx8/
   Xu1IKiXrTfQ8aChCOcbTNkf7V+X4ZxIae57OLqY/Nkis0WyBe+yTRkkJD
   +nSQYf4pnHNR08RyneX/M5Wvx3xrCXPHA+PzqYUihNU3LxKsdvS8hYsbA
   7jD+poU7AA7JndBIMD+XkohTcu1ejj6WJAU2lwN8OVhI2EcoT6jIlw9oU
   YeQU/+0wz3xMy+Q+cwPZY3MciVEd88gz3yMl6dD7yleTQ5lhHBCifznc1
   A==;
X-IronPort-AV: E=Sophos;i="5.93,238,1654585200"; 
   d="scan'208";a="169365898"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Aug 2022 11:34:40 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 15 Aug 2022 11:34:39 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Mon, 15 Aug 2022 11:34:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C0sxd/uGHkihZgXWliFtVX3nbUmW+YriV8IMe6AtFPUSAxQElhobEa++FPhuaCNKjE/RselfEMwsD6SPDUu6Z2+SDhXWK3XZh8Mxav2oEyMIwlN1rPhxPuyJouwQQK45UjruUjGCnBoj/u6KQc39xMIMhX/SEtu+HxTpDnE7q9da7+H3XmwN4BTMiEHDhV0FGyEikOBheBVAoCl2Wbp9nNC6FLSs3kR4Ijitbxzoyo3Ro1CktPdG18QhaDTet3kRO6MVjKZ0D1XeYlAuxWzPWhDnpgYNERPIClnLRsT5IPO1bCq/wNykb6RHJCwqxTDaXUfd4JAZqn/AkRpBe5+FrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6B05DTc7/3NRzggygnA2/PvoF+8NIleTzwuUXOHEDBU=;
 b=Uc8iNkUkMdCQYmDLMEziA0BleFr6JPfL25C/nfMbe4q7gFIvXAqqoqmYr6xTt7eObZOjcDaqC1OpTUN9gOugc/o4hVvx0vsqdHoX99cluG4ABYMLFVPmk+Em3afCPj/8hgPmfQ28W5/dwnDrdPI6Qo+g/3NG9NX3oc2YHJkvsAUNP9eY4kQUWGyp8ZA8Fqiym+kYNYnQz32AKjvZtigdJ99Y1mN1oSU4VuvMCw6RH0zMI4cwoIp530lIgr73SxeYZp2zkSvUsHW4YcCg9ZgpwAc86YrZpC5q79gTnHnh/Nw4MMAERpzKTcMBkaHppp4wHk1xw8+wxjd4r0NRgjW/tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6B05DTc7/3NRzggygnA2/PvoF+8NIleTzwuUXOHEDBU=;
 b=CWkLBlKVWggP5+XdQCkLaBParL9a/3eIrjYibSeuahlY9zoTwwR05NNi7YgRry0YrVG/DFjL4Y0UgHWISgf3eeHil/hi36OImc1mQ9J7U0AJrmxRRFztir0W/7TnnVCzyNnHe85g28w90wTn440+z3h4w+OmxZfGn4EAYE5eaR0=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by MW4PR11MB5912.namprd11.prod.outlook.com (2603:10b6:303:18a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.20; Mon, 15 Aug
 2022 18:34:35 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Mon, 15 Aug 2022
 18:34:34 +0000
From: <Conor.Dooley@microchip.com>
To: <samuel@sholland.org>, <wens@csie.org>, <jernej.skrabec@gmail.com>,
	<linux-sunxi@lists.linux.dev>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>
CC: <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH 07/12] riscv: dts: allwinner: Add Allwinner D1 Nezha
 devicetree
Thread-Topic: [PATCH 07/12] riscv: dts: allwinner: Add Allwinner D1 Nezha
 devicetree
Thread-Index: AQHYsGUr+3EH8+Kn3EeAQmOckfNsnK2wOoAAgAAQCgA=
Date: Mon, 15 Aug 2022 18:34:34 +0000
Message-ID: <822fae38-bc81-b7e2-23cf-be71f3c6fff4@microchip.com>
References: <20220815050815.22340-1-samuel@sholland.org>
 <20220815050815.22340-8-samuel@sholland.org>
 <ee3b13fb-109d-ca5a-537e-27cce50926e1@microchip.com>
In-Reply-To: <ee3b13fb-109d-ca5a-537e-27cce50926e1@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3b1c6a2c-d4b4-4234-d6a4-08da7eeccd48
x-ms-traffictypediagnostic: MW4PR11MB5912:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dxH1kws64LD8a91mqdycXsDZ439V+PwhBFbRw1YKiUn0JECFrj8n7roxO8sO2UFJtWPotq3lc2OWdYVEHeEq+USUdEqh5WnE+Hcq2kvUTl1Qc2OxcrSdFCxcUeoJR6rEZOktiFRq5yqFAsad9d2Eo4b/a17timKhScXX2xGVZDGaGcCi592XxR1IJ8LV9J2I0+ATVgY2b0i6mp5bC6W208Q7VHEXxZ1yGtrCRIs0UaBw4jsN3YeS3J6SVIN0VRett6LfIYY8gM7V2F62oTIzIwAQjthKB0UyNc2fB+f1QtkzEAh38gOvXUSpE9Dav1szTFxXOsvk1qFmmOBGmLxaWqtcpInugZBbQkQXS1T5JJuiQPBEHEqkci4B+lVOatAjxc0CFGkjoLbIQoPY+QRzGrtAzIDkRJ9IvbKgPZkgjU5Gkk0sC7Po77UWIP2M7wznEH/ddATvHnUqdwR4PaZTqoQeVE8ypCucnLn5LJP1Pctk9icVLSlwWFY9NfCmK4rnxn7NczRaiAY3kajWVZAA2v3J3BEa4XCRQNkrhZcHcnCy0UEaTIoRT5ocPxXZlxtXaaEv9754bAOuEPxgYWpirZql7oG+DXL+eaCwk1kJ573ggxxw7p+m3oqW1fRuF6NzgMGTGt3KJEYUev15I6L/aBR6fwnItPqYusgtsTU+oE5oiE9N5r6C7WXPEVNt9zub+bd+67eHZj1FL61Er5/DIFcFCKOeRrDN7wgC3pmj36uUwdBdT62xHnhm9gAP6JKcnFvI4L4GMJINAged0Bm0j/Ug3LgiSp03Zv93mxSyTQ4SIjZKGsOLTtce3IFWKN1/guxf4o6/KLM+F391tXk0V5MPyyvOyOBK38+2B+srEpDbxG7sGdE2Qt/xoq7gZxI8NNP+4Eam2EpWVBdRwGUM+w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(396003)(346002)(376002)(366004)(39860400002)(86362001)(6506007)(71200400001)(122000001)(7416002)(66446008)(66946007)(64756008)(31696002)(66556008)(5660300002)(76116006)(478600001)(54906003)(8936002)(8676002)(6486002)(66476007)(38100700002)(4326008)(26005)(110136005)(186003)(83380400001)(36756003)(2616005)(91956017)(38070700005)(31686004)(41300700001)(53546011)(6512007)(966005)(2906002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dktZTjhTUzc0R1ZHeUFkbHYrallpNGF4c3FyUUcwbmlqci8va2JvTGhLcEhz?=
 =?utf-8?B?cWtCR2pNZWZBYm03THdtSXltQ0oxNTFiYjFuZnZjR3RiNElaRzFZZmNibEIy?=
 =?utf-8?B?Ujl1RE1jK3lnT05venZjY3VKQTNWTjBqUjk0ZzVnRjM2Rit4UklPZnV2N1Zv?=
 =?utf-8?B?dGFGY05QNXpQNHBoTzVCSVdKeXFyQ2RGeERzN0F4NzFBcmx3U3p3ejJ6eHgv?=
 =?utf-8?B?aGRZeUhJdjBmN25JVUVLZmZ0VEtSWml5QXV6dW5SWit6N3R1QnZDTFh1dS9X?=
 =?utf-8?B?ekY3YU82b1hGZzg1Ri9jSk5sTUJyNm5GK251RTdUNDdhc1pteXFkZXdmaEkw?=
 =?utf-8?B?QjRjaUtURGl6Tyt1V0tQSHdPbEdlZ0p3QXRpNGd3YWhEZlkxYW5RRFYzMUZM?=
 =?utf-8?B?bGVLRnA3eDNhZHJpTGErdmh5SlFiTGZFSDgvbUFzRWFEWlYvQ3hxRWZhRmJj?=
 =?utf-8?B?TFIyb3RFaWo1VGJuY1Bsam5CUWhJWWxmQVRUV2JNRU13THRObjhZWjVHZlE2?=
 =?utf-8?B?aVVMZlNXaHhydmVkc04vSFlIQVNHdGxyUDFmVUMxZFN2SXdNRmo1YUtHVW1z?=
 =?utf-8?B?SXhyckJCUTRwNzluQUtpcTFhS0NHMHhIZ0N2by9wSmdmZWxuRVFGdzVNOTM0?=
 =?utf-8?B?TnFrNDgzSmYzenBFM0V2M0tuTzN5Wm9DbEdIM3cxWEI1b3dhYS9Jc2hCcWlZ?=
 =?utf-8?B?NURuekxnaGQ4Wml4dUg2RnVoblIvMTdRb3JmZnRGSUJoTTdQU3hNU2MvVEkr?=
 =?utf-8?B?OUlvNUdDc0tEbk5YTDBZUnJaQTdVNy9nUThpdDA4NHZ0VVRoc01ZeHh5VDRy?=
 =?utf-8?B?V3EwTzhrVHBuWXZFOWU0UVJJTEFrN3d6T0MySXgwQzJXZGhiNHFkZDRJMVNO?=
 =?utf-8?B?aU9vQ2xtczdhUFFoZ1E5QjQxZWhuWUkxS1VpQ2tra0l6T3l0STVrZTVkbDV6?=
 =?utf-8?B?Y0lYeEFrTXFkVDV1UTVQcHFEMEFqa2F6TS9QQzh5bXVYb2hMMkxhaU1rSVUy?=
 =?utf-8?B?Rk5TaVFwUkZXcUUxaE9kSGtSK2RITm1nVDl2ckdLaXdEdlhwUWhWM0JiTk9s?=
 =?utf-8?B?TlhpV2NFTmxTUnNZVXIzU2IzU1cvVVd6c1VFTU85SGQ3Y3JTUExUb3hxcW1O?=
 =?utf-8?B?Sy85TWY0R1pFTGMxSE50S2dnaTdiQ3pRRk9rU2NDK3B1bFJibHJOcGpGTUdp?=
 =?utf-8?B?TnpSVDhXZmVubmgwbE1NbzFzV0RGaVV5NDhFNTFGSFEwYTRhVTh3VW1Lbytk?=
 =?utf-8?B?L2xYQ0s1dGczYVhVelFidjFXNlVQc3BtN1BrNlNSalN0Wmt4VWVydTRzUThH?=
 =?utf-8?B?VURkOWdyQ0kyWUNJMVJzU1JxcDVmNGFKczNtazh3aXA1RXJkbnFMdUl0S0lw?=
 =?utf-8?B?MmkybGdtb1BucGc0TTg0SU9hK3dLY3ZXT0JMRHJybnpzNmJyaXQ5ZmRaN3N6?=
 =?utf-8?B?dHQzR3h5TWVnUDllYS8xSmhZaCtZKzA2VVMxRGhDUjFtSkE3eU04MVVhQ29N?=
 =?utf-8?B?ZVpKTDg2czFHZFZITEhUVks3TlpiVDh4Q3pTUHlJTGFnSTlJWVhIUU9keCtR?=
 =?utf-8?B?ZG1XN2V5TytBb2RtenZQTGEra3JDcWg2VmNPM1RjdXdJV1k5QWdrM2o0d0lC?=
 =?utf-8?B?cTgwZjBGZ2Q0eUkzRU9kT1dwVm9pTTFHL1ZQRGtmUi9teVZFME4vRGlSVFRB?=
 =?utf-8?B?czV5dU9PYWpiVXdKU3BPazVkRFR0MVQ2VWpaaDRQVzd1ZmRwemR4VXZLTHJF?=
 =?utf-8?B?T2MralkzU3hzcXNVVzB0VGFzNkVyOU1mY1g3akxVMVNUTDF5bkxxazhvK2JV?=
 =?utf-8?B?dnphTjdpUjVhNFd3S3BYdklBNzVldXZtWXJDWmI3WWVqdVJwN0MxUWpYcG1S?=
 =?utf-8?B?d20xaENTMldpVDh3NFdpVVloT0tTQ2h1Zy90QjlkSFZXRXY0U0hvN2cxc1R3?=
 =?utf-8?B?MjZ0blRJSXVWZzBZRTJ3d3Z0OVR2c2ZzRHFoR0xEelVWS1pQK3E3WDhvckMz?=
 =?utf-8?B?OXhIOTdwOW1kVU52VXZQTSswSFQwUG1JYTFBbGt4c0ZOd1hDaHBqZ1JWSTRs?=
 =?utf-8?B?YzJIUXRmdHJmTDNWVWtXTzlOc3IvNWxoVlVtOS9vYVlMRXpRK1E5dkhLelNL?=
 =?utf-8?Q?72tALaQ+3A9htJ46So0b6+yKd?=
Content-ID: <95485B13EB00AC4F86E42633496E09A8@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b1c6a2c-d4b4-4234-d6a4-08da7eeccd48
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2022 18:34:34.7362
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZP3/JD3R1draavi9EnBG7zV2Po7B0jNpZjVCcAlxyIw7Sm2MnTyhFneq/H91QUS3BfRiRq5XTZDeIhJ1jWh/1Mr1tJwjBsUIXsPX8dVFVJQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5912
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_113444_382186_4F1B65AF 
X-CRM114-Status: GOOD (  22.93  )
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

On 15/08/2022 18:37, Conor Dooley - M52691 wrote:
> On 15/08/2022 06:08, Samuel Holland wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> "D1 Nezha" is Allwinner's first-party development board for the D1 SoC.
>> It was shipped with 512M, 1G, or 2G of DDR3. It supports onboard audio,
>> HDMI, gigabit Ethernet, WiFi and Bluetooth, USB 2.0 host and OTG ports,
>> plus low-speed I/O from the SoC and a GPIO expander chip.
>>
>> Most other D1 boards copied the Nezha's power tree, with the 1.8V rail
>> powered by the SoCs internal LDOA, analog domains powered by ALDO, and
>> the rest of the board powered by always-on fixed regulators. Some (but
>> not all) boards also copied the PWM CPU regulator. To avoid duplication,
>> factor out the out the regulator references that are common across all
>> known boards.
>>
>> Signed-off-by: Samuel Holland <samuel@sholland.org>
> 
> Hey Samuel,
> Replying here as it's the board I happen to have but I saw some kernel
> panics. Some of this has reproduced for Ron/drmpeg on an unmatched:
> https://www.w6rz.net/segfault.png
> but some of this is different:
> https://gist.github.com/ConchuOD/7d87f574df1ddc56f192e505ecab6574
> 
> defconfig is default riscv defconfig - the DRM modules + my cmdline:
> CONFIG_CMDLINE="earlyprintk=sunxi-uart,0x02500000 earlycon console=ttyS0,115200"

I seem to be making a hames of things today. Started it with the email
to the wrong patchset this morning and now here I am 12h later and I am
messing up my stuff here too :/

I think I confused myself with the configs & logs. This one here was the
default defconfig + CONFIG_CMDLINE [0]:
https://gist.github.com/ConchuOD/7d87f574df1ddc56f192e505ecab6574#file-log-txt-no-drm

This one was from the d1-wip branch that I had been using prior
to the patchset with CONFIG_CMDLINE [0]:
https://gist.github.com/ConchuOD/7d87f574df1ddc56f192e505ecab6574#file-log-txt-with-drm

And with a defconfig from Heiko I get hangs where output dies using
CONFIG_CMDLINE [1]:
https://paste.debian.net/1250519/
https://gist.github.com/ConchuOD/7d87f574df1ddc56f192e505ecab6574#file-heiko-config

For all of the above I have used:
0 - CONFIG_CMDLINE="root=/dev/nfs ip=dhcp nfsroot=192.168.2.5:/stuff/nfs_share earlyprintk=sunxi-uart,0x02500000 earlycon console=ttyS0,115200"
1 - CONFIG_CMDLINE="earlyprintk=sunxi-uart,0x02500000 earlycon console=ttyS0,115200"

If I don't use [1], I don't get any output on the uart my u-boot uses.

Heiko reminded me that the D1 needs the memory nodes from the dts etc,
so it's actually using the u-boot dts. Did you make breaking changes
between what worked with the d1-wip branch and this submission?
I'll update what my u-boot has, but in the meantime hopefully this
makes things a little clearer.

Sorry for all the noise etc, I seem to be all over the shop today.
Conor.

>
> lmk if you want anymore info :)
> Conor.
> 
>> ---
>>
>>  arch/riscv/boot/dts/allwinner/Makefile        |   1 +
>>  .../sun20i-d1-common-regulators.dtsi          |  51 ++++++
>>  .../boot/dts/allwinner/sun20i-d1-nezha.dts    | 171 ++++++++++++++++++
>>  3 files changed, 223 insertions(+)
>>  create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-common-regulators.dtsi
>>  create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts
>>
>> diff --git a/arch/riscv/boot/dts/allwinner/Makefile b/arch/riscv/boot/dts/allwinner/Makefile
>> index f66554cd5c45..b0a15e8c8d82 100644
>> --- a/arch/riscv/boot/dts/allwinner/Makefile
>> +++ b/arch/riscv/boot/dts/allwinner/Makefile
>> @@ -1 +1,2 @@
>>  # SPDX-License-Identifier: GPL-2.0
>> +dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-nezha.dtb
>> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-common-regulators.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1-common-regulators.dtsi
>> new file mode 100644
>> index 000000000000..143a3e710c3c
>> --- /dev/null
>> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-common-regulators.dtsi
>> @@ -0,0 +1,51 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
>> +// Copyright (C) 2021-2022 Samuel Holland <samuel@sholland.org>
>> +
>> +/ {
>> +       reg_vcc: vcc {
>> +               compatible = "regulator-fixed";
>> +               regulator-name = "vcc";
>> +               regulator-min-microvolt = <5000000>;
>> +               regulator-max-microvolt = <5000000>;
>> +       };
>> +
>> +       reg_vcc_3v3: vcc-3v3 {
>> +               compatible = "regulator-fixed";
>> +               regulator-name = "vcc-3v3";
>> +               regulator-min-microvolt = <3300000>;
>> +               regulator-max-microvolt = <3300000>;
>> +               vin-supply = <&reg_vcc>;
>> +       };
>> +};
>> +
>> +&lradc {
>> +       vref-supply = <&reg_aldo>;
>> +};
>> +
>> +&pio {
>> +       vcc-pb-supply = <&reg_vcc_3v3>;
>> +       vcc-pc-supply = <&reg_vcc_3v3>;
>> +       vcc-pd-supply = <&reg_vcc_3v3>;
>> +       vcc-pe-supply = <&reg_vcc_3v3>;
>> +       vcc-pf-supply = <&reg_vcc_3v3>;
>> +       vcc-pg-supply = <&reg_vcc_3v3>;
>> +};
>> +
>> +&reg_aldo {
>> +       regulator-min-microvolt = <1800000>;
>> +       regulator-max-microvolt = <1800000>;
>> +       vdd33-supply = <&reg_vcc_3v3>;
>> +};
>> +
>> +&reg_hpldo {
>> +       regulator-min-microvolt = <1800000>;
>> +       regulator-max-microvolt = <1800000>;
>> +       hpldoin-supply = <&reg_vcc_3v3>;
>> +};
>> +
>> +&reg_ldoa {
>> +       regulator-always-on;
>> +       regulator-min-microvolt = <1800000>;
>> +       regulator-max-microvolt = <1800000>;
>> +       ldo-in-supply = <&reg_vcc_3v3>;
>> +};
>> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts b/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts
>> new file mode 100644
>> index 000000000000..df865ee15fcf
>> --- /dev/null
>> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts
>> @@ -0,0 +1,171 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
>> +// Copyright (C) 2021-2022 Samuel Holland <samuel@sholland.org>
>> +
>> +/dts-v1/;
>> +
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/input/input.h>
>> +
>> +#include "sun20i-d1.dtsi"
>> +#include "sun20i-d1-common-regulators.dtsi"
>> +
>> +/ {
>> +       model = "Allwinner D1 Nezha";
>> +       compatible = "allwinner,d1-nezha", "allwinner,sun20i-d1";
>> +
>> +       aliases {
>> +               ethernet0 = &emac;
>> +               ethernet1 = &xr829;
>> +               mmc0 = &mmc0;
>> +               serial0 = &uart0;
>> +       };
>> +
>> +       chosen {
>> +               stdout-path = "serial0:115200n8";
>> +       };
>> +
>> +       reg_usbvbus: usbvbus {
>> +               compatible = "regulator-fixed";
>> +               regulator-name = "usbvbus";
>> +               regulator-min-microvolt = <5000000>;
>> +               regulator-max-microvolt = <5000000>;
>> +               gpio = <&pio 3 19 GPIO_ACTIVE_HIGH>; /* PD19 */
>> +               enable-active-high;
>> +               vin-supply = <&reg_vcc>;
>> +       };
>> +
>> +       /*
>> +        * This regulator is PWM-controlled, but the PWM controller is not
>> +        * yet supported, so fix the regulator to its default voltage.
>> +        */
>> +       reg_vdd_cpu: vdd-cpu {
>> +               compatible = "regulator-fixed";
>> +               regulator-name = "vdd-cpu";
>> +               regulator-min-microvolt = <1100000>;
>> +               regulator-max-microvolt = <1100000>;
>> +               vin-supply = <&reg_vcc>;
>> +       };
>> +
>> +       wifi_pwrseq: wifi-pwrseq {
>> +               compatible = "mmc-pwrseq-simple";
>> +               reset-gpios = <&pio 6 12 GPIO_ACTIVE_LOW>; /* PG12 */
>> +       };
>> +};
>> +
>> +&cpu0 {
>> +       cpu-supply = <&reg_vdd_cpu>;
>> +};
>> +
>> +&ehci0 {
>> +       status = "okay";
>> +};
>> +
>> +&ehci1 {
>> +       status = "okay";
>> +};
>> +
>> +&emac {
>> +       pinctrl-0 = <&rgmii_pe_pins>;
>> +       pinctrl-names = "default";
>> +       phy-handle = <&ext_rgmii_phy>;
>> +       phy-mode = "rgmii-id";
>> +       phy-supply = <&reg_vcc_3v3>;
>> +       status = "okay";
>> +};
>> +
>> +&i2c2 {
>> +       pinctrl-0 = <&i2c2_pb0_pins>;
>> +       pinctrl-names = "default";
>> +       status = "okay";
>> +
>> +       pcf8574a: gpio@38 {
>> +               compatible = "nxp,pcf8574a";
>> +               reg = <0x38>;
>> +               interrupt-parent = <&pio>;
>> +               interrupts = <1 2 IRQ_TYPE_LEVEL_LOW>; /* PB2 */
>> +               interrupt-controller;
>> +               gpio-controller;
>> +               #gpio-cells = <2>;
>> +               #interrupt-cells = <2>;
>> +       };
>> +};
>> +
>> +&lradc {
>> +       status = "okay";
>> +
>> +       button-160 {
>> +               label = "OK";
>> +               linux,code = <KEY_OK>;
>> +               channel = <0>;
>> +               voltage = <160000>;
>> +       };
>> +};
>> +
>> +&mdio {
>> +       ext_rgmii_phy: ethernet-phy@1 {
>> +               compatible = "ethernet-phy-ieee802.3-c22";
>> +               reg = <1>;
>> +       };
>> +};
>> +
>> +&mmc0 {
>> +       bus-width = <4>;
>> +       cd-gpios = <&pio 5 6 GPIO_ACTIVE_HIGH>; /* PF6 */
>> +       disable-wp;
>> +       vmmc-supply = <&reg_vcc_3v3>;
>> +       vqmmc-supply = <&reg_vcc_3v3>;
>> +       pinctrl-0 = <&mmc0_pins>;
>> +       pinctrl-names = "default";
>> +       status = "okay";
>> +};
>> +
>> +&mmc1 {
>> +       bus-width = <4>;
>> +       mmc-pwrseq = <&wifi_pwrseq>;
>> +       non-removable;
>> +       vmmc-supply = <&reg_vcc_3v3>;
>> +       vqmmc-supply = <&reg_vcc_3v3>;
>> +       pinctrl-0 = <&mmc1_pins>;
>> +       pinctrl-names = "default";
>> +       status = "okay";
>> +
>> +       xr829: wifi@1 {
>> +               reg = <1>;
>> +       };
>> +};
>> +
>> +&ohci0 {
>> +       status = "okay";
>> +};
>> +
>> +&ohci1 {
>> +       status = "okay";
>> +};
>> +
>> +&uart0 {
>> +       pinctrl-0 = <&uart0_pb8_pins>;
>> +       pinctrl-names = "default";
>> +       status = "okay";
>> +};
>> +
>> +&uart1 {
>> +       uart-has-rtscts;
>> +       pinctrl-0 = <&uart1_pg6_pins>, <&uart1_pg8_rts_cts_pins>;
>> +       pinctrl-names = "default";
>> +       status = "okay";
>> +
>> +       /* XR829 bluetooth is connected here */
>> +};
>> +
>> +&usb_otg {
>> +       dr_mode = "otg";
>> +       status = "okay";
>> +};
>> +
>> +&usbphy {
>> +       usb0_id_det-gpios = <&pio 3 21 GPIO_ACTIVE_HIGH>; /* PD21 */
>> +       usb0_vbus_det-gpios = <&pio 3 20 GPIO_ACTIVE_HIGH>; /* PD20 */
>> +       usb0_vbus-supply = <&reg_usbvbus>;
>> +       usb1_vbus-supply = <&reg_vcc>;
>> +       status = "okay";
>> +};
>> --
>> 2.35.1
>>
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
