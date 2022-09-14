Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C1EAECAAD3
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Sep 2022 14:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZgLdSJcrEstqnsxNAHjI8hgDfZ13HA6mqI4J6wuGFfU=; b=XOQbL0qyc6o6tx
	fFE89Ir9DToM9Ej+VQtAhNRoewixlWR10Il8y7lWgovVMWL0Ui61tnJrc+9jzU7txfmgCzj2K2ZOl
	lIngcx49UJjGzSrlENdOr3THMIJzX3I36EaFffopMlKoy/IJUEUioKCeofOvt1irVtRuK6tQ7CGYB
	OYV9V4tawbDjooaXWSS8Anz2JhNU0sjUMDC9WrfaprWHCdvNIAvfYRIYIDC3XxNlg1P5LzfPVn9xe
	eCmya+vxqlLAWbZ2RqQNuxxeuYOPT2So3cpDw1KyR1BG45LJlur1exS5jEYQyIbV09rztl1/nxPpL
	1wvPrssyPMiJ7pw3X/CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYTmg-002tMe-Ny; Wed, 14 Sep 2022 14:54:38 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYTmd-002tLX-28
	for linux-riscv@lists.infradead.org; Wed, 14 Sep 2022 14:54:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1663167274; x=1694703274;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=9kI1ClOIzXU2KfJbUNpZOgF9+rl9gLyrNNnw6NNiZVc=;
  b=t9yfEC/JsHIUAd/l/dyptZ3nejpOkQLV63RYSJW6pGZ+a3+QjjDuK6rx
   4HcBEkY1PiEWNz9qO5/P068FvUkU9dzMbE3DA87Vlun54uBoRLYoTtViw
   VGUR+VSIabRUEEuSQ5S32WfbD9Ac10GOG/pLXvBDHOcKa/29QSvZB6vwd
   wvCal5Y0bqknB7x5A/2g/OJN3N2cTe67e9uuMX4qLpvs9CVSqrrnaHGML
   CV7+qJ2xdwQhBsKwaik8kvP4vyidpdQFc2bpWpDX4Ee0OdithHZIxRMY6
   mNBlCLOWeOM60MFoF3JzeO5XrlkcK2Wn+V86V7i3p0pK11Gl8lVYyVF6C
   g==;
X-IronPort-AV: E=Sophos;i="5.93,315,1654585200"; 
   d="scan'208";a="177138981"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Sep 2022 07:54:28 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 14 Sep 2022 07:54:20 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Wed, 14 Sep 2022 07:54:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NoUxjAw3C6PmG56FHYOYADQm+oX0eUobtMV70skpiPwLLZ6B7aj0cAbmBCx7qeLRZhYC3Ja41tFmmX1opzs4qCNjQ0WFkQnsMrHehT9lUKXgLkdwzQlDLQWqgh+mVy5F9lANjUPybkumk/X8H5hJtcMOVoTeh+xIFPR9n5bCjc1OY6PxkNQWVL3dv2erUA36MVG70v1ZwShc9QxDawawNj0HAb/UE6G0/t1l0IAgwJIjVp2UqaCC8a4OAP0HNM1g3grlm6xYW15CaA+xNsghxRvuj1OUw4BBrdxOQwdC+MPXDj4VmBh/IChtio2ZqxxRvUasKDzNXrpnIT4hB7VtWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9kI1ClOIzXU2KfJbUNpZOgF9+rl9gLyrNNnw6NNiZVc=;
 b=g+4v309JUyBPNCx7ma9AiiaoLfXj/wSARJJcKvmEjEHHaZe3rk3thQv+nW+Pn7joG1G7iXqqU+Z/K9IkQfwlh2pj7sMuPOZ15vdqSWEb5hFXl/H+iG3TMur8LgjjvCtDBl5Ulur1oCq9SWb5s/XxvnKK0NzXb4nWHa3+SbubLIXe4YDL314jnuvZSzWVfPUz0dHAbp4q1q3yKx+nqiznQkSTYPsCcHnLoHbABmYLImPytroVubg/zJbFt/xH5kOnshNqf6tkJDJ+QtiFMZSOoBb8GRjDiVyfIwLOHQuqYKQVX8ny0fwqCvyz4tB6DbWsl93YAE3grNbyayYNhnG6dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9kI1ClOIzXU2KfJbUNpZOgF9+rl9gLyrNNnw6NNiZVc=;
 b=C8o1N22EXU+K4u8QUJmpWWmKv9D+xVW7p5DKHorCCos+l2vLfBwYO2525NdvhIo3NysftnToLfBNkOBNf9w8PJqXQAlpWA5g1mz5dg2aWTHg94jS3R7/3p/pqmVlW1uwLoDWjSIHqjr4B1O3VY7Te1xbHOGWU9avST6VR1TpkUI=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DS0PR11MB6446.namprd11.prod.outlook.com (2603:10b6:8:c5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Wed, 14 Sep
 2022 14:54:15 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 14:54:15 +0000
From: <Conor.Dooley@microchip.com>
To: <apatel@ventanamicro.com>, <heiko@sntech.de>
CC: <palmer@rivosinc.com>, <linux-riscv@lists.infradead.org>,
	<nathan@kernel.org>, <mail@conchuod.ie>, <atishp@atishpatra.org>,
	<ajones@ventanamicro.com>, <anup@brainfault.org>, <lkp@intel.com>
Subject: Re: [PATCH] RISC-V: move riscv_cbom_block_size to the correct #ifdef
 block
Thread-Topic: [PATCH] RISC-V: move riscv_cbom_block_size to the correct #ifdef
 block
Thread-Index: AQHYyEeGuo8Fx4+tsUK8Avc6BmWIUq3fAPeAgAACLwA=
Date: Wed, 14 Sep 2022 14:54:15 +0000
Message-ID: <0662b2d4-5cd3-f240-ee9f-f6da4482b07e@microchip.com>
References: <20220914143648.74022-1-heiko@sntech.de>
 <CAK9=C2V+4bn_xi-u0Z0TLmtir02em66PBS2tcaD9DCXKxqxzhA@mail.gmail.com>
In-Reply-To: <CAK9=C2V+4bn_xi-u0Z0TLmtir02em66PBS2tcaD9DCXKxqxzhA@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5154:EE_|DS0PR11MB6446:EE_
x-ms-office365-filtering-correlation-id: b1cd3e8b-0cb3-41ae-1768-08da9660fe3d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FAcXFlQFiwGokHLEYFCSVFh7k53SEFyfH+wVlKI8G0Y43Y2hVOKcpflehwJkjqqrwVJqKLySHQDRHacE0bdjnhWdT1dFLDTRE9H6YJrCSroQiusc2rbg/QDICwyAB1HliZmcvTtc/PqDN+GTrDXiGLaEArbFN5mrjXhyDwMimsEiLS2s0nXfWPUBh+uOygH2eGzf0cLx7ddQp9nFjq0mRnkQlTarVfFnHPKosnN70SuJQl9AfusOoI2wct9XueTHJHJIay4FEjMCPvPP8HO3RY9ZizffRD36ZLrwIyL0PvWSruAKXTsptTfIHjZ64jViFB/mRrvLoUdto0/6U9Xd+LCyuJy9YJg2Ll37flZXp0HROYryGYZyTjq7iIWYK+WSf8RxH96d/zYB+169mjgPETzPAK6mk2Q1Gw/BnTNpHIcrpmIS3dH+9Q4tYNIG/Do7uL/bL9pRQ9RGtYx5KvNKmt/SG43MkJOaNi3iK5kkIZNXAtTVY0WgN/jZa6o+hJCr5YZpzjyXvEdH2mSewDGX0RbqJenPGeoEInYNohqM9kJQgjnZ1i2M9JywzUXjK6dzbFb9xvrbj4eiq0RfWmA2qbqUHJRvwx+CjXQ/8Zvjo/OuqUapDGu8YrUFdKRns4BWJuKoc89OD5W6V2JKGuZBS2sokdRlhOL+L9EJzeavcOoLObkCmOta+UcTDmo8OmOTZLxpSRYFCTy1ht2InmBb5/VTlofhbHMBPlkoGgEe+sjH0hxHE1jGFkbyuWxkLISJqc68koRaUqfYA2GJXmTb/qZdVn1DGps4QU0bauh+TnjxbGJ7RODlF4Hnwm3Fhit04IJ5J1sw7+2Nks7Xb3Ke0lcJxx9/16GjSNc34pbg5sE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(136003)(346002)(376002)(366004)(39860400002)(451199015)(71200400001)(36756003)(122000001)(5660300002)(41300700001)(66476007)(4326008)(110136005)(31686004)(6506007)(64756008)(66556008)(86362001)(53546011)(38100700002)(91956017)(478600001)(186003)(2616005)(83380400001)(8676002)(66446008)(76116006)(38070700005)(66946007)(8936002)(6486002)(316002)(54906003)(6512007)(26005)(31696002)(966005)(2906002)(7416002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d0VraWJSdlk2N2RMai9CeUh3MTVyWEJ1RHJVc2MzVGdsZ0pLVTZkWklYL2ZN?=
 =?utf-8?B?MHJJeVRvY29jYmRhS0pGZGlNWld6MWZ0MncybWpLeU9qemFVNWRpb2Y4SVNJ?=
 =?utf-8?B?b0hsSno5Z0JJWUxRTUc2WkhKNEcrcTcxa3pkMDF0Z1F0QytlTlhGYzBQMXp2?=
 =?utf-8?B?OVVRdUNLWGFsd2V0SGVibTBpTnFjR3JRMUozZmZyZzNOeGUwUysvYkdaZSsv?=
 =?utf-8?B?bmljOC9CR2xZQnRTbE9JQ2ovdUt3TDQvbm40Q2YvRlpDSTRVMWVKL2RCSmZq?=
 =?utf-8?B?RHowVDhNekdrTjRBS1c4ZThUdlVhZDJpUkVuK08zMUxDa29pM2VPNnlXVzI1?=
 =?utf-8?B?elBDN0c4ak9MeC9WRytKV2ZUelA5STdHQ0htR3ljd2xPMUEzT3lzN0xZalVs?=
 =?utf-8?B?Vkg3NXVxTHRJYVhIUE1QODFMM3k2bVpFT0N0TmJsK2I3eFhicVl3ajAyWWx4?=
 =?utf-8?B?QktiZ2Zqc2RudnFCdTFWcFVKNUNaUXg4c0dsa1c4cEQ0VEgrcFdTNkF4K282?=
 =?utf-8?B?MGw5bDlHelBmdkRocnFFL01wUGNHZDR5aWlRODI2UWNxYjNRc2QzM1NjditH?=
 =?utf-8?B?eEN5bFlrUEtRWDJxS2xXWktPQzd6WEN5M1dOeDNSSjYwcHBrZkxTL2hZNG1s?=
 =?utf-8?B?ajVRTXovMFplRnV4a2dQWHBwWjRlUEJzUXlhQTVZVzRJdW1ZL045WXZTTWNq?=
 =?utf-8?B?N2RhbkNqSkdqRENsQVhlSm5IT1lRYko2YzVmNTV1cms2ODlFK1VPWHQ2Wnpu?=
 =?utf-8?B?RDBGcDhnaktYdUt3QnFsOSswYlN0RklzMGxFQWcvckxFRGhyM2JVWHJQRjBK?=
 =?utf-8?B?TDA2RXp6RDhHb3UwOUpoVlUwN0dBZ09lbE55aE5yZUpYS25sZERPb04yMTlj?=
 =?utf-8?B?RjE5WjFNMlBlZDU3STRDRmZCOFQ5U1oxdzMyazhkK1BKclFEZjIrMWRFOUxo?=
 =?utf-8?B?dStpNlBiRjFMM2lhTHltTmJsbHEzSnQ2TWFyTmhJWkZQN2s4eWRSZk43enNB?=
 =?utf-8?B?VnloOUxSU2VWQ3dDdEE5THRBeHZPREpmNHZPL0h4cWd4OUZDNDIvYkdXK0R4?=
 =?utf-8?B?ZmFvc0JDQmNWYUw0OVc4eCtvN3dkNEk3WFdnUFM0VWlPSG1tVWl2K0ZlbVk1?=
 =?utf-8?B?N2k4RnQ5U0IxbmFxWVR4ekJRVFAyK2lEdzNDZlpoWllHOUVPNExZY29vSXln?=
 =?utf-8?B?NGdIZFNvMXQ4d3BxcFZ1YTNyMFd0eTlNMVgzaWkyaG9ySjRMOGx2R29iZlpH?=
 =?utf-8?B?NTQzVUdFWlM0b1ZCMElXSEN5N0RsUmVvdkNWMVdEcy92YWw2NENyVXFjYWhm?=
 =?utf-8?B?Y2I4eXdjbDJneGtxWVhnT0lsOGZ3eXhtNVZWcGc1RGNvNHFIa1JnM2cyQUZY?=
 =?utf-8?B?b2JnVmJCSkR6Y1NoSmFrZEhPZldic1lzSS82YUlVcDFwTXVCTE9YWHdQcnZQ?=
 =?utf-8?B?V0U1TWk1WFJYU3JmNjFSS0E3UitQL1kwSUxad1MxdjBJWWU2REdENHJYTzlQ?=
 =?utf-8?B?aU40YmdsWVNVUnlOaC8xeWVGaEhzMVpJTjlUMVQ0TWVneXFFTXNRelF6YTky?=
 =?utf-8?B?ZkRxYTc0RW1QZkR5Kzh6cnRPS1JJT0prU1JtNS9TS2xqc2xySXhldUtualhO?=
 =?utf-8?B?T2VUVVhXcmFCRit3TkZ5SlZjbkY2ZHRrYkljcEtsenFmTEpDUTZoQnRKK2FU?=
 =?utf-8?B?angvN3BxdHcvRDJDQzBOZ0d5NTQ4c3VXNWl6YWtod1JMNWYwVVQvUndsanMw?=
 =?utf-8?B?SnBWSEtCZXI4dzh2TFZiVklMRlR3VWxuYmxVYmsyN0syOENTOWcwby9lUHdH?=
 =?utf-8?B?RWRFWS9vVmZJZ2VvY0k0STM2VmoyZFNIVE9QS29lakxBNmtIYmh3MjA5VnNv?=
 =?utf-8?B?UktGc3VZN3RkWlZuWjEzREhGRGVPVDd4b3BicW5maHl4L3pTM0dCZHFrK0Zi?=
 =?utf-8?B?UXBJZnI4dGZLVWdnK1kxTFBUbmE5U3ZNTk9pcnJIMTRIcDZ2anU0L1JuWlM4?=
 =?utf-8?B?V2EyWDRuTTZWQmpUV0kwVUlRT044YTdmbTcxN0hCa0YxaXp2L0JzVFUxT0pY?=
 =?utf-8?B?OHJ4am9jbUFGWWh6eTQ1OGJ5UVNsTUlVejZUd3NJM0tKd1ZkRDlYeUpuK2Fx?=
 =?utf-8?B?Y085aEdSZzhBR1pnbHlOQk9PN1lqb0NoUkQvQWFVZW1jWDdVc2xIN0tEcm1E?=
 =?utf-8?B?ZXc9PQ==?=
Content-ID: <34CFB94817F3A041A1BE3F87D67091AC@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1cd3e8b-0cb3-41ae-1768-08da9660fe3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2022 14:54:15.2633
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PJE1MqDxXEOBLeXQrlxVovuLDCSW8Lin0jMsLigSw7YpmbsIVMsbUjo3ZrO0M023s7mCJiA7QU2rEEyfXQYHV1Wv9xhB1edd27aA6xxVaYI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6446
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_075435_424423_57AEAB11 
X-CRM114-Status: GOOD (  23.60  )
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

On 14/09/2022 15:46, Anup Patel wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Wed, Sep 14, 2022 at 8:07 PM Heiko Stuebner <heiko@sntech.de> wrote:
>>
>> riscv_cbom_block_size is used by all current non-coherent dma operations,
>> not only the zicbom variant. So move it over the block also containing
>> the riscv_noncoherent_supported() prototype.
> 
> At the moment, only non-coherent DMA operations use riscv_cbom_block_size
> but soon we have other parties using it as well. For example, the RISC-V PMEM
> support and KVM RISC-V Zicbom support.
> 
> I am not sure if this is the right thing to do.

This is a fix for a current error reported by LKP.
When said future users need to use it - they can move it to a better location
IMO.

Thanks,
Conor.

> 
> Regards,
> Anup
> 
>>
>> Fixes: 8f7e001e0325 ("RISC-V: Clean up the Zicbom block size probing")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
>> ---
>>   arch/riscv/include/asm/cacheflush.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
>> index a89c005b4bbf..5c16d901d3da 100644
>> --- a/arch/riscv/include/asm/cacheflush.h
>> +++ b/arch/riscv/include/asm/cacheflush.h
>> @@ -43,13 +43,13 @@ void flush_icache_mm(struct mm_struct *mm, bool local);
>>   #endif /* CONFIG_SMP */
>>
>>   #ifdef CONFIG_RISCV_ISA_ZICBOM
>> -extern unsigned int riscv_cbom_block_size;
>>   void riscv_init_cbom_blocksize(void);
>>   #else
>>   static inline void riscv_init_cbom_blocksize(void) { }
>>   #endif
>>
>>   #ifdef CONFIG_RISCV_DMA_NONCOHERENT
>> +extern unsigned int riscv_cbom_block_size;
>>   void riscv_noncoherent_supported(void);
>>   #endif
>>
>> --
>> 2.35.1
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
