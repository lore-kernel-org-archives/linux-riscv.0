Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43BD4C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jun 2022 19:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8PdZa9CJ2tq+KTSpP7Rr/T80dxUs23V7zMhgGx/ztrw=; b=bywiK7/xr8xJks
	QiEBg7K+aopMK7sOG+N5/gqJ//XGiahQkjCMN+nhZs0c4rMpsVcmyA1CFqwxyP4PmFiygrXSg8SLY
	jAlXSUXKftErC2rPr7yFYjspWaOm6hLZbed/nIK0klycLFcfJixa5KCTYq+UOGre9oh40vonzvoaq
	UhYvrnoXwzEDhS66mmZcStzjuRiYlNE/VPuLkQd68Lmxn/qdJnzNkUd/niAiZ9waY32gRFtXFNBF4
	kk+gf/wOaFz9iFtEQ2P8l3hwiHlvUthqQXsnCWl69vai1M5gVuASjSPQpgRZtgN2hEari98XeK6XW
	nAA0dzhP0y+AOAe0XWpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6zt7-001DGV-Eo; Thu, 30 Jun 2022 19:31:41 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6zt4-001DES-DY
	for linux-riscv@lists.infradead.org; Thu, 30 Jun 2022 19:31:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656617498; x=1688153498;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=kDkag0PntXR/C/RzP9V4Kihj0tlSowfhs16lhQGjrEs=;
  b=1JLPR09IEA5sizQn1Vbg4OlnXxKcNgNUMvT3/qyezroxXYMSUXMIX3M/
   uRfKPeiswV+X5o/2R8HOAn8bQrnF5jM7fPwkYf9fnRnPuHPEw33+PmfqJ
   SF4xeppUhauiPEygjhdc6+BWMs8ksALeFJlngWI0fxqDLM2qhXiePLWe8
   jffwVDAbLoyA2IOFxqFuWF8p1DVSCi609AkzLgc4qFzKBTsOm+LyxZ2S6
   SwwkEjZHG9MNpABo7x8yuBlleCUUjQ8390hvAjkHxWKwxxwX/FgyYZf29
   mwiFGVsDLl1yBv7a+k6gNACW72JJdL9s1WpnlW7yDUP8hBaiV+Rj8Ew1/
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,235,1650956400"; 
   d="scan'208";a="165902969"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Jun 2022 12:31:33 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 30 Jun 2022 12:31:25 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Thu, 30 Jun 2022 12:31:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oh7l2nNGGRjR+QDS+yUpd1JhvWce4Lgws0DL+E7dmSXIQNrrF9v9C2W16VLKNf5ufeO/2gC1OvfJREJJFeVyahOoJAcNt4I6cI/1WbYYnXK96STldleNq8xvWlziAJTVzIDp+nRqnxxvcndniUFZ3nMXQNfAAFgTSWi9M6yDWLvjSaWeqmTFtFCrjF3Pjogqc/IhPgaeSG6LbxniBGAJe8CfrsGqvn2tTyRhrkJRfpk53M9k6sNMj5/6az3bomkuf15xQ3FyuyVndBWFeBX5Oz14B2HPLzIr4gha8XIfyMvEuL8q+iFsXHttgka3Y1PZLVSnlkh2rjduwu1p/BqodQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kDkag0PntXR/C/RzP9V4Kihj0tlSowfhs16lhQGjrEs=;
 b=Kh+trpHv7rOLoNbL49Ad96UZnZVllCVfJCS5tkILtt6/k+16TnsR4HoaNz+yB5NhSEkXDIz9svz5uWMU/Wzr4Cc6+2Dn6YYAmpYrk+st/tdP8D25is9BqMD5HwVfkqds5j22OXN5SGa28sIy9GMcsiBy3vgIxZV/zyp/kgz3nwUNkMLMRcAjEjPH1YtZreahFBrLrAE0id+rnOmAZ8CxvmCii+++G1ZME52o0Eb48QKSPmZfxAZN75VD9IV+awAmYKFu3OlvwYIFPR4ccEzZ7+/q76DTn3/NOGGIUQ/VmFwqP+1Wh7CzgDBmfik1Flzk2EvCD5Pt83Cxy8znf/ylpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kDkag0PntXR/C/RzP9V4Kihj0tlSowfhs16lhQGjrEs=;
 b=axYXhzdX8BLW+UkzrHU3MqxuRiy4IfmY7XCUoXAJeMtYQ1XxXpsrc+kWmRUT01qFioMKawyS2QQdnk3Sql/yjSgB7xx+w36PhPLk+f7KvDv8HB2OtXLrIMjnrM7GWL5F/7Epy7ecey5/zOESGMyDyTBp40auK5QHsx/+ZP3KRvc=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM6PR11MB3708.namprd11.prod.outlook.com (2603:10b6:5:146::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Thu, 30 Jun
 2022 19:31:20 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5373.022; Thu, 30 Jun 2022
 19:31:20 +0000
From: <Conor.Dooley@microchip.com>
To: <Niklas.Cassel@wdc.com>
CC: <airlied@linux.ie>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <thierry.reding@gmail.com>,
	<sam@ravnborg.org>, <Eugeniy.Paltsev@synopsys.com>, <vkoul@kernel.org>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>, <fancer.lancer@gmail.com>,
	<daniel.lezcano@linaro.org>, <palmer@dabbelt.com>, <palmer@rivosinc.com>,
	<tglx@linutronix.de>, <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<masahiroy@kernel.org>, <damien.lemoal@opensource.wdc.com>,
	<geert@linux-m68k.org>, <dillon.minfei@gmail.com>, <joabreu@synopsys.com>,
	<dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <dmaengine@vger.kernel.org>,
	<alsa-devel@alsa-project.org>, <linux-spi@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v3 13/15] riscv: dts: canaan: fix bus {ranges,reg}
 warnings
Thread-Topic: [PATCH v3 13/15] riscv: dts: canaan: fix bus {ranges,reg}
 warnings
Thread-Index: AQHYi+h3hoTHjH1NZU+cAhsP+cEeWa1oKv0AgAADh4CAACmcgA==
Date: Thu, 30 Jun 2022 19:31:20 +0000
Message-ID: <026527d3-ef75-92aa-36ab-32da47cca418@microchip.com>
References: <20220629184343.3438856-1-mail@conchuod.ie>
 <20220629184343.3438856-14-mail@conchuod.ie> <Yr3UKQ/772oFyvc6@x1-carbon>
 <3fec7542-c5f9-8812-732a-d624b0506ca9@microchip.com>
In-Reply-To: <3fec7542-c5f9-8812-732a-d624b0506ca9@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7f8bc0e1-7c02-46fc-41a7-08da5acf1c2b
x-ms-traffictypediagnostic: DM6PR11MB3708:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GAi38OHTfyarF3upjWlsko2aDgnygYYE68pq1Fb9EtFTLJBBYspTUrD2/+StcKiur/dx+ZAC3kmSGEKmgdxdekZNy4/ki4UhQkvppYvzsKMRaUnB0GtM4fdBwxZbpzHho1824zKtnc35dOxDlVH2SqTp3g3vLwsKW6MOfIDDi8HH9q3jKhyg0b915qHDt2uRakfucrEMwvzGp0hyB7OwiLywydLHOeaX8pXGwClN1ojlIOSm8PxwVov5EQSSg+onAL+++p9WwWmKv0KH+iq8slKQlXwEqNjVT1sTOMeC4O/wDVJpniTnuKsEoD7Qa1KN/Ws728xMHU0DOIFfkLVPc7ph1gnlEXOpXqOYN4JLZ7AHnnAcv/7D6+0Bwg249iDL6YK2bZnUlrAmT8VVb577wrxF7pF37qzAERDBU5pC13dnPkqAWyq9ZRgeU0OBSOp+QDkNS0CFZ5rthYeAyevYZFHooB2Bg3DJY4BEM33SK3TL1xYBQ3YPgb+LvxzVURCXHBe20hErC8Uhr1xjInWQ98VeyGjl8QmobPm3DhqQ+BpW4qdEhOx5RH4/aHpzOsgoMl0lvesR+FwDM4iwFdwcvO4eraTnla7UPQQ2V7m/ZVPTmG2W7eY6CvOMXXtuKl7GBFpnv4iyQKXwQieS+axrVX9huUzZXwxMxSrGSP8283wbBOd5i93j3Gr5rqzruKZO8uh4B333VSH1aIVxh4O8jDxp1I1agYo52Wc/kTQ9OEhosjzuSI9sl8u5GEQqh46UO2GsxaQU2qwXmyrE1c4OoQETvoTDJ9m35TxSieOpWBRXf2V3229YR3AeUkms9+imzewlFTG2i6Jvn+He6JuMT5HZSistMlWPzorhQz0KOZ1d3tCkZBm1cIxDZ6rcVUv2
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(366004)(396003)(136003)(39860400002)(376002)(6916009)(186003)(31686004)(38100700002)(2906002)(71200400001)(91956017)(54906003)(316002)(6486002)(36756003)(478600001)(7406005)(7416002)(2616005)(76116006)(6512007)(66446008)(122000001)(64756008)(5660300002)(86362001)(31696002)(8936002)(8676002)(38070700005)(83380400001)(66946007)(4326008)(66476007)(41300700001)(26005)(6506007)(53546011)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZVYzZVBJa1pJZlp6VEg0bzRNbWR4azZEa1VSNXpHck9raDVqcW12TzVqZ2hr?=
 =?utf-8?B?dkVWejRLSXhTNWZqRk9yK2p0WjNzV3gydGF3NXdwNTdQMzFMRWQwSzVxWlhT?=
 =?utf-8?B?WkhHaDdWY2R2T2trRFNGaHNHOWU0S0xwMytJK21kVUtyazlCYzdITTBjODFB?=
 =?utf-8?B?SjNlVGUrcitUTVFJR2VETHpldFpQWm9tRHNJemVsckQyQk1iSkdjNXhCcjBR?=
 =?utf-8?B?dzhRMk5lbVNsc2tBL3l2UnJLY0s1TU5BNWlsUEMvQ0l0Ky9rajg5OUZUeHQz?=
 =?utf-8?B?cUdPWW9kRFd3ZE9SRVBVZEp2TGJqRjJpdktRdDNPZy9hNlRER0hlNmg5Y2V0?=
 =?utf-8?B?WVJyWGwrMzROV0crVktXZFFFeXhwUkpQcG4ySE5uMEkwc0pxTHhaQnloWEE4?=
 =?utf-8?B?KytPVmJrUmluU2FxVU4yUVN0azNOMWxzZTlPZGlXSmtRdjBmWDJFY3MrdGh6?=
 =?utf-8?B?Z2xXS3VFK3pXRTZNSi84Z0Noc2ZkQkQxUmEvUy9PaUxXRk5OM2hzc1l6MWlh?=
 =?utf-8?B?bUtseURPU01NYjg4enNvSERoay9rTHU5bHFQSGI1TlRwamgwNjUwY0pKTWVF?=
 =?utf-8?B?TFY0VEVuUUZVd29XbHlXUUgzQTlNYUMrbFpVQTV5em9TdkF6Nmd3MkVleUVQ?=
 =?utf-8?B?d2RPN0s3MVpnby94WVc1ZnRObUdTS3E5SjF4WGdpcXZaU3FPaTVDeHVyRGJn?=
 =?utf-8?B?SWRwMDlFWVAvQk5MWm9yb1hoRWllbDdzMkhYOXh1UjUrV2pZaHRuWnlkUHlS?=
 =?utf-8?B?eFBmRjRXd3VCVk9KRkRIdnRqQmFMYzd3ZUhNczZXNHBURHNKbDEzajhZVjZl?=
 =?utf-8?B?anFqdEhXZEsxNEhLWUF1Y0JjcFhRSmRIcXJvUlVuSThuNzJ5WHRKcnFkLzRO?=
 =?utf-8?B?d0hhem5DRkdOOFlQRTM1bFJLNlpSeU56aFVUWlh5QWVrcXlGSHUvc09EKzBM?=
 =?utf-8?B?cWFad2dHYjhweUphZThtRDV2OVg1VDRLTHAwZ2JJRVBuVEptc1dmTXFWWVR1?=
 =?utf-8?B?YkZvVVh4dThMa2xxMCs5Z1BXZU9OdDE4UStlQXB6U25qTzNDU0dOUFJ6T3Zi?=
 =?utf-8?B?UFlYUC94NUZkVWNOZktUbjRTaHBITkpXQlRDK3VXL3RNcVN0SHlKbVFQejhB?=
 =?utf-8?B?VjZST2xCckZ4UDJ0TE5uWTFXcWNIVjUvd2tXTEVON250V0E4SFpiNnZDa2dp?=
 =?utf-8?B?K0ZpY0kveWFCK3B6aCsrWkU5UnBENlpCUkVMNzVlM0cvQXByTXBhNTN6TVg1?=
 =?utf-8?B?V0JjakMySFphUFFmNURDTmFjNTBtTmF1bnl1MFZrb2NPeWRKc0hKcEI1NnNQ?=
 =?utf-8?B?bFpZWmFwSTdDNzNUUFUrMzBUUWZnNzhDVHIzbGZHV1ZNTklnVVYya2Rabjht?=
 =?utf-8?B?bERwRzNKMm1Za2ZnUTNPcldZdkpPdXhmRVpkVStlYTlOQzlqQWhiTlNicDE4?=
 =?utf-8?B?Ry9sK1FrVTlXMUQ3SisybmR0NkJuTFp1OU13OWFPSHUzQWhnODVxT2M4YS9x?=
 =?utf-8?B?UUNnM3R5QzNnZVloMzhURElEb0tjVXVLelhESFl0b09jQy9pZE1JKzcxaGVC?=
 =?utf-8?B?T1JhN09hMk53bk9ubHdQNkZXZGdrV01ycVdhblJqR29JVkd0aHEzTm1NK3ky?=
 =?utf-8?B?NXZJc0FLdlpWdjJhN2RGTDZWc1ZSVkdpRlZjZDRlT0NnbzhEY0hUYzlaNlNw?=
 =?utf-8?B?L3NsRDgvYzlPNWU4cnpnRXNyOW1qQ21aV0tNN2NNaXMydTNKMmhjdXB6SitN?=
 =?utf-8?B?Kyswbzh5blg1TUQvY2JsVmNzWmdiVUdpNW1hME9VUyt6dzRjQU1kY3NObmNj?=
 =?utf-8?B?aHRhdytjanBxN0JPdGppM1FndTA2Nmk5NXFWczMxMFFwcWlXQUZkb055c3dK?=
 =?utf-8?B?cC9Ia0k4SUh4L2plMk92TnYwL1Y5anM2TkdsN2JMOXZLWm45dXpmMnJZS0pO?=
 =?utf-8?B?Y1IzTkFqWCszK2JRaW9qS0NjT0dVTnFHUnB2bzdoVFhEcGhjVGJkdFo4aCtQ?=
 =?utf-8?B?eGRmblQ1SHZTVVUrZm9XdmtHK3Yyd25LL1lVMjNVSGNvUmZsRFkrNlY3U1M3?=
 =?utf-8?B?Sk9VVjdLOWlyMnNQY2NtbHQrYjZJc0o4YklvdFF6RWpBd0tGOFdqZVBOTTBE?=
 =?utf-8?B?eUFPREFQV252d0JucWRWMis3OFV6RVp3TVRtN3YycVFhM05vWUR2ZEpoV2d0?=
 =?utf-8?B?a3c9PQ==?=
Content-ID: <0339CCE983E86E43A80182C384703A2C@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f8bc0e1-7c02-46fc-41a7-08da5acf1c2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2022 19:31:20.3361
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q4Valr6G64GePKiFPmh/BygqdqPASjfUFxHwdU104u58SUzQt5VlLhiMMqLbgOv34t7IauW+Ryjwd62sctWqYf/4MAGWwFxcLAQZTDDBcFQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3708
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_123138_568130_2158A4A3 
X-CRM114-Status: GOOD (  15.74  )
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

On 30/06/2022 18:02, Conor Dooley wrote:
> 
> 
> On 30/06/2022 17:49, Niklas Cassel wrote:
>> On Wed, Jun 29, 2022 at 07:43:42PM +0100, Conor Dooley wrote:
>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>
>>> The k210 devicetrees warn about missing/empty reg and/or ranges
>>> properties:
>>> arch/riscv/boot/dts/canaan/k210.dtsi:408.22-460.5: Warning (unit_address_vs_reg): /soc/bus@52000000: node has a unit name, but no reg or ranges property
>>> arch/riscv/boot/dts/canaan/k210.dtsi:352.22-406.5: Warning (simple_bus_reg): /soc/bus@50400000: missing or empty reg/ranges property
>>>
>>> Add reg and ranges properties that naively cap the buses after the
>>> allocation of their last devices.
>>>
>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>> ---
>>>  arch/riscv/boot/dts/canaan/k210.dtsi | 9 ++++++---
>>>  1 file changed, 6 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
>>> index 948dc235e39d..6a34dc4f3e51 100644
>>> --- a/arch/riscv/boot/dts/canaan/k210.dtsi
>>> +++ b/arch/riscv/boot/dts/canaan/k210.dtsi
>>> @@ -163,7 +163,8 @@ apb0: bus@50200000 {
>>>  			#address-cells = <1>;
>>>  			#size-cells = <1>;
>>>  			compatible = "simple-pm-bus";
>>> -			ranges;
>>> +			regs = <0x50200000 0x200000>;
>>> +			ranges = <0x50200000 0x50200000 0x200000>;
>>
>> This looks wrong.
>>
>> The property is called "reg" not "regs".
> 
> Yeah...
> 
>>
>> And I don't think that you should provide "reg" at all,
>> simply supplying "ranges" should be sufficient, no?
> 
> I don't recall why I put the regs in, I'll drop it if
> possible & respond if I can't.
> IIRC, it did actually complain.

It does not complain. Good spot, thanks.
I'll drop "regs" for v4.
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
