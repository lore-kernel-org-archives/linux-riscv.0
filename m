Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76565C43334
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Jul 2022 07:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2OfRSuazYGiGmqhlLs4+2yTcRTwi+8NTmcxGDhsfRJ4=; b=Fm3VXaz0M79SjM
	l0Hy/eySGrm6VxTDSIGTQ4C119nuAQaqNlaSDsC1QrDKurQymWJxq4djQsF8rJ+woYU2eumOrhHye
	pOopb4mkB74ywPzcy1rXnxFthkopP9eOU0i4eOv8/pNTiCR6iDRMIS+Rrd2GnZLqifeMJe3ppEKI3
	qVPFoAeJ68l2og9aeZTp/uVpQ7YtxrbiN+qNXaB78yEOk6YNJgWvVWBgRW73e8Ic+XiAeKT2bQy2e
	O8aFfTgp+maxvwqRxMhJ0vzdrxPC6sviHOQeKllKNOU0Wzd+iOK/Zr8kGwjUeTqel2xR/89+gDr6A
	kWy8hlflCKX2G764aSXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBAlL-008WHn-9w; Tue, 12 Jul 2022 07:56:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBAlH-008WE5-1y
	for linux-riscv@lists.infradead.org; Tue, 12 Jul 2022 07:56:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657612610; x=1689148610;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=cw2JqLbehBKQZ3CgbizdhsM4ibUhsUBTBjRDdSrjgcE=;
  b=GsWuedT+spg6QQ56x+bJobdL+yiTMS3WR9CKOJThkvH8F+/F4+x8nNHN
   y/CHC/H01eotbudXWwKz0S5W0xruRU5Md3v4R2nxp6XTRjR+1nq6uYzLi
   mUGHVbqRIS3LBL5J2NIcGxO/xat+5CruygA7FptpULZ14QxLEM/Rie/rg
   g37Fuh1R6xzsWQr0ls2iJpmKFb0GMAMAnjoiKlWXYR0Rrto+McJy2wglz
   hSBJySgvltHQ1VG3xra8e4zf6aCCYTP/HAPT+zifR88YlRSmf3nRd70x+
   rEuV5z2NnP4COLOjM3yINZ+J37zdO8pVM4t8iU89gS7FJaCK5Ol++NB0l
   g==;
X-IronPort-AV: E=Sophos;i="5.92,265,1650956400"; 
   d="scan'208";a="167416887"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Jul 2022 00:56:38 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 12 Jul 2022 00:56:35 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Tue, 12 Jul 2022 00:56:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z10hxPYJ+oWnILw4+6jxxwMsokdRrhY/XgkSDpIgDFGzN/2NKSNfI/NtsElY5dpV/cplRfuiYew4/N5li0w7x3lxi3deYeCLUQgYEDIIHonnL60LsreQx+EV5KdA2ypbVWPwDqka8zA8Uoo2bomkIGbKyCp0e74ACZrco4IR0krFY3BjnzMLqjTAT2sQ2o3BpHjRJ+cdxu/0WHcMmj18ZX2pGQIBRKGAw6redw3/TGh7IqL2Jv/bHNznOOFYnNCBDqneYHN5av6NVXmJTGZ/UI66m3W+ErGNfXEzZZ1QK+bf3KT/bDAglvryvw5KrCdUHkz/pEfwBLx2l3JwDvngvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cw2JqLbehBKQZ3CgbizdhsM4ibUhsUBTBjRDdSrjgcE=;
 b=NGGg4UPPuM8uWtoKkJCB4grSjcvnrTDfTfgRjAtmhjrkoJ5/eYlHdMBGjGP3I5//Lb5/W8bk70VrTSovoht17WRYgvd5CRG1vTlgKISg+U8HbHmdObNAFwAxlqgtsnhNhc30Z8lwRpW/7ktUDxxIj9G3I31Yky23YK9S5QqSsgS4VjnDsKeEs3MTGRMMA/JaJHVDzDsCVUr3K2FzPKQc8CKNPV5bGA6F6Vt4qlBW1YtmL+4kuS+tsYSd7A9Pu9Whr34FLqs+bJYU47LsKVNq2vOI6dbYR3uk2A0yF62WQiGmFo9mrguBAmb6hcrAg2Su0ZbgIyZDxA10uxzrNV9CHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cw2JqLbehBKQZ3CgbizdhsM4ibUhsUBTBjRDdSrjgcE=;
 b=ARubUkL0hEsVlC5Us2RDsW8+UbZnLEatMnsvV3AWpdXNza4gA25OlF4IznCvd3AtVtrBial702UWzXBrlGB4WOeXuhLpUq12RJiHzwHIBGmE7bqsB3205IGy3LOgACt5v7IBvPvd9dlVVqHhaSGEJj7UQ0OAKISyk/DlI4b9Uq4=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BN6PR11MB1652.namprd11.prod.outlook.com (2603:10b6:405:10::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Tue, 12 Jul
 2022 07:56:30 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8d4a:1681:398d:9714]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8d4a:1681:398d:9714%5]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 07:56:29 +0000
From: <Conor.Dooley@microchip.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <thierry.reding@gmail.com>
CC: <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<masahiroy@kernel.org>, <palmer@dabbelt.com>, <fancer.lancer@gmail.com>,
	<sam@ravnborg.org>, <palmer@rivosinc.com>, <vkoul@kernel.org>,
	<daniel.lezcano@linaro.org>, <mail@conchuod.ie>,
	<Eugeniy.Paltsev@synopsys.com>, <damien.lemoal@opensource.wdc.com>,
	<geert@linux-m68k.org>, <niklas.cassel@wdc.com>, <dillon.minfei@gmail.com>,
	<dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <dmaengine@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <robh@kernel.org>
Subject: Re: [PATCH v5 02/13] dt-bindings: display: ili9341: document canaan
 kd233's lcd
Thread-Topic: [PATCH v5 02/13] dt-bindings: display: ili9341: document canaan
 kd233's lcd
Thread-Index: AQHYkLmcGD25Du2KgkO9uXqnRhnbjK16aGKA
Date: Tue, 12 Jul 2022 07:56:29 +0000
Message-ID: <2b265d13-fe69-9f5a-e3fa-7bfdf4ca6d95@microchip.com>
References: <20220705215213.1802496-1-mail@conchuod.ie>
 <20220705215213.1802496-3-mail@conchuod.ie>
In-Reply-To: <20220705215213.1802496-3-mail@conchuod.ie>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1b6a8c72-9b6b-4c29-378a-08da63dc0748
x-ms-traffictypediagnostic: BN6PR11MB1652:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MGEUFRl1JrEvr1K5KfCfsBgabzxWph4MPbYLy4bQyFzy/bZVHc4Dh/fjDB04NbKKR5cXZRTy7Kcr4Y3wJ6HkwrIvVvK9NgGyotLTMP9C737NOAiQUyNi5RaemdmggmJt2eTDzGNSq8SkDeNREDVnd0jLWPEorfSBJxq6KqJ1QnrG4DPHToOiImSqAiJzMbc7KxDDyc5VfiP2lp3yxU3YrDIrSLw3lERX59tMBFaVSGg3vZSIB5m0K+1Jt5BGf7EZgpl2npUuJFiBfO6kDJ71irEKOWzyTi02xkRV8M3LIS9xhCsmiJkv5l2DHgheYzGZ2fpJ1HnD/Ldz9VZ+x159w1RIlBvWpdySPK+qOcL4nO9GO+bbFFc0VNRuNnOmiwBSZZhqsa0r4w+XS4u8TgvlWcEnLPdetxFLjArAFlN5unhBmoS/YZQw4vpHBPwF3MkWsB049tAdm/6fPqFm//UFHVFV/uuJnB96NIRC3L+cZ+5gnCsoxErDgx7Ds1geD4SNQV5pdSwtlvLOoK5nlydCuxB4WIcP7NXxKhHPDNlv8HgM0KDUI3zpAUfzeMZob/DbivwKd7ODVSKCSUPYxjJfeaAexJKqW8bWimG0TdLKSjzKDwsi52/vOmXQ15fSPbukR8tVQwlTlTavFD1j4UDFD9zIpwqUBF61E7IQxM9zN3WgqL4GKYP+sY0wgAekaG9qwXLdhDkl8jkhvCwexncAfLAkEDZDwHYYZw+yrXcp6F6Z79KGc3tE69EE2R4f7Ak/7wnQIFpQt6WnZ/2zo0bG5IA/U/suNwN/vzCCT+N/h5MaQzLyuvi1Bzw5U85n8AMZ+nthh6Wm/TKI1D8lp0Hs6kwRNvxpnOtS8HhfhpTJe9YLAB6Y4ReyZklbc5WraNRbqsPXNhpcs745jPkmFkEKDLabB7+98WNTSAH1Rhcn9eI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(39860400002)(376002)(346002)(396003)(122000001)(2616005)(38070700005)(8676002)(4326008)(76116006)(66556008)(66446008)(64756008)(91956017)(66476007)(66946007)(26005)(6512007)(86362001)(7416002)(53546011)(41300700001)(5660300002)(6506007)(31696002)(8936002)(316002)(110136005)(38100700002)(54906003)(186003)(71200400001)(966005)(6486002)(478600001)(36756003)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q2hENU51dis0SUxldzJiYXJ6S2ErS0ZVYk1lMDR1SmRTNVBjbmVBMmcvSThR?=
 =?utf-8?B?TWhZOGNhREd3dmpFMjduL3FkbkZLczIxdUVXRFQ1dkVKWTd6S2d2S3pwMXdv?=
 =?utf-8?B?NkM4MzFXV0dBSzNOZmo4Y2tRQ0V0MWgzOFR5MGVWQlorSWFPUkZLYVQvL2lr?=
 =?utf-8?B?bTM3ZXlyU0ZMWm91bmhCMzdNZitwRklTQytMQUlUTEU2ZU5ldmZGcURsR1Nn?=
 =?utf-8?B?ZnpacUVXSG5Sei9ka0EzeUFHTEpWcldiZ0J3UmJOaVpoZE16NEZ4aUsvalNa?=
 =?utf-8?B?Z1ZmQTlOWngwVXpVY29leTg1THQ4QzFSeFNmQTJRYjJTWk85azd2OUlwT2VS?=
 =?utf-8?B?bC9pNnFqVDlOcVQvd1FrU3pXeTJiczAzVlJXc1JJcmcxTHpSUUNNQk9LVnVE?=
 =?utf-8?B?OGVKc1pNZmJUMk5jc1lqaUlMc0RacnZRdDBlMzFUOW9xYzBXQmJBM3Y0TWRa?=
 =?utf-8?B?WjVOdnhPbW0wb3ZzcUk3a282OWZhUHBpdjVBRUErVGpNK3ZRdDhOQWZwQ0tl?=
 =?utf-8?B?dTRCb3hpcDJLTjNLVG1neTJaejBlNFZWTEZ1VkwrNkJsWFJLU3JBVkRraW9E?=
 =?utf-8?B?czBZdXYya2U2d3FydFl4WnJtUmNMUmowbVozbGxKQTAzeU9rR2p3SHdYc1gr?=
 =?utf-8?B?dkR3aVlNdW9hZDRILzZEcmsvVHphNFZVN2xIZmJFa05nczBsekcxTytFSFh5?=
 =?utf-8?B?aXdaWWZSWW4wSU53am1kbU1SUGxEaVdrTkw4UnoybHBlajVEWWRwYUlYMDZE?=
 =?utf-8?B?VUs2bWkwYk42VnhRamZTOWgxY0liWGp0dkhXV2xiMm85bEU5NmJtcnFHSHFk?=
 =?utf-8?B?anEvTVdOWGpyWVNJMUd0ZklFU2RhM1FIbmdjZ09GVDZwcUl1MTlIWW9rTXpM?=
 =?utf-8?B?WTJzUE1BSUpzQVR5QUMzTGkxZ1hNaUNKczAvSk1YS2p3WDQweVFDT2hiVVQ5?=
 =?utf-8?B?ekF0V2VuYm0xQ1J1aGd0QlVnRFlFOEtvUjJwUmo4QlZrcTM0ak5rQ05aWEpq?=
 =?utf-8?B?U3pBRE1Pamt0ckRPa2MvMFo3dVhybFJ4ZGl1SlNnTkxxNklldGc1VlVSQndD?=
 =?utf-8?B?ckErNldUUVl6QUxRQWx0ZW91ZnNJVEZxU3JKK3c3RDZPS1lIM1RBVERlN1lu?=
 =?utf-8?B?WCs1dkxvVElrUk9mbEtmMWV2dk9zNVNoWjEzNDFVWGk0N1E5Z2V0bXNaWXAz?=
 =?utf-8?B?dTgzOTdIelRUekVDV0sxMm40RVF2bVd0MUdCZ0xQRzh5bFM2NXRQWmVGR3Vk?=
 =?utf-8?B?OWEwcHB0ajBpRU0yU2lFckZaNTYzTXVhdXh4MkRtQ1NySnFCbFBFSitBVjNF?=
 =?utf-8?B?UE13RmV6YUU0L014Q0FPUXVxeVdQT3NLV1Y4S2JNUEk1bW1BTU8rMTdLS0VY?=
 =?utf-8?B?cWRxcVlGNnMvRGRTMzRnYitTUkpzUDZFRVl3SlRwT21hYUpMMk9wMDhxSEdE?=
 =?utf-8?B?RFpMcnJSSHhTUzlUd0dTOGhSK0RnZGhsc1VtMkw1N21IeDhiTjJkbEtITmoy?=
 =?utf-8?B?UmhjMVJrcGw4eDIrZjhEc0NvajR0bGZ2NlhSMUVTR0RhYUh6Yk52TkhFZ3pY?=
 =?utf-8?B?amJ2YWlSekhSNnZudHFEWXdiSG83VnZzUWZyakdOaHdrYUNNOVgxZnJQOXRR?=
 =?utf-8?B?M3JiN0ZUUGJ0SDFpTjJFR2ptZmJYN1RqUVJYUXpNMnVyeGdrNmtYSkxWTnN5?=
 =?utf-8?B?Z2xzL2hVT0p4Y0Z0UjdwSkx1c1YxR2dPYlRyNHdDcEdveTE2d3krRjdyYyt5?=
 =?utf-8?B?dnU4aUI0a0VxZWxHelRQRUE1UjdCa3FxM25ZejNwQmd4UG0xYnF3aGw1YjhQ?=
 =?utf-8?B?U2RocEhjUmJkZXVhNWV1UXRwRGtyL0tJcmpsWnROVlUrMVRpUzJzaTR1SUdJ?=
 =?utf-8?B?NXN2b01VN01tKzRCcmlJUUNDOUhBRm9RKzZVaC9HTFpLWmlEVFlaMlZaS0Nm?=
 =?utf-8?B?ZDlJNVZrd25GUHE3Q25UdE5oTlE5OEVSbzN4dDN4M3NLTUVST2Z0V3I3MnNO?=
 =?utf-8?B?OERURWdEb2I4bGRORG41c3N1TFVWdkYvd2R5Mms2MjducVNSL2xiVDZGWENq?=
 =?utf-8?B?OTFwNTY2QmhSelRMZWh4OXUvWkVWSHowaXRFUDhEQTJwTytKWkdCTmZ5TEVC?=
 =?utf-8?Q?DkwIhjsH7Ct7vOdxHrDarH4U/?=
Content-ID: <72D7613120F3D94D8D5E1585E3428F8D@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b6a8c72-9b6b-4c29-378a-08da63dc0748
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2022 07:56:29.2161
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ib34FtoMniqpNonl5mwrybCxU5ZXvGYEhnfoDeROsLh8aM3BLSJ8RnQdDENVHnZSK0HZPCSZsVrnb0SdhFJ1tZNZLCJashZm5He77IX98WM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1652
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_005651_210270_6499942C 
X-CRM114-Status: GOOD (  18.58  )
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

DRM Maintainers,
I've not had a comment on patch 1 & 2 (the DRM applicable ones)
from from the files listed maintainer on any version. I'd love
to get these device trees fixed for v5.20 if possible, so I am
bumping a little early b/c it looks like there may not be long
left before the mw opens.

Would you mind applying these two patches? They've both already
got Rob's R-b.

Thanks!
Conor

On 05/07/2022 22:52, Conor Dooley wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The Canaan KD233 development board has a built in LCD.
> Add a specific compatible for it.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>   .../devicetree/bindings/display/panel/ilitek,ili9341.yaml        | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
> index c5571391ca28..99e0cb9440cf 100644
> --- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
> @@ -24,6 +24,7 @@ properties:
>             - adafruit,yx240qv29
>             # ili9341 240*320 Color on stm32f429-disco board
>             - st,sf-tc240t-9370-t
> +          - canaan,kd233-tft
>         - const: ilitek,ili9341
> 
>     reg: true
> --
> 2.37.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
