Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6EB8C43334
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jul 2022 21:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JnR5YFyuBDo5H9D1aXRjQto50sW9ArMKSibMJUfqRtw=; b=NpCan29CdXlFgO
	A1qWmvou5AzUgIIBa2FzmfGdrl+U0jI15H2GXehZhGJ9ukZGrFbpLbfOAr4b4d5lKY2/LCeAmgJnf
	71mD5vPXh4RPZ6ivaPH+aNJSdQUlHOY+AvILvxLxx5N6ulYr2n9O93t82lGdH7Li6K2MtiJjysa4R
	BcFEiReL1xqzZBtKL+3qEDEErxs5m2VMM9o+6CrFhn/6RHioH8UEDsDayyibhtAQH/UQ4I4iR9mso
	WyxPtcXs3Lc/wX/Jj0zeUahK9+N08WhYfCl/X6n8T24gmhOSdDnRZ9/0QmNz60sywJvmfF+5IwgHB
	uBtl6H1reNXdi6C6jebA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBjWF-007tJx-Qt; Wed, 13 Jul 2022 21:03:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBjWC-007tIP-Ie
	for linux-riscv@lists.infradead.org; Wed, 13 Jul 2022 21:03:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657746217; x=1689282217;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ZmxxFoVkYGqzpsEpNtr1jHCheBRTu1N3S2zZO5drZrU=;
  b=BE2TeSVzq1WxyI24lkjMmQykdbACw00ZRU2Zbp97XoXThP4XI4atCa6x
   3wIrrau2AInGVM+w9WZGaxobPblG9bB06ebkHM5FREIQzLFe9Uy89aMaS
   r/QOFFxdZet25ujcJD+OMPaTXCk53o/pUB51DORu2NdZ4bW7Cx5L4TG25
   xJnHfFxdaQ+0lCsq3E4fCxFBM7eTOqq469ROHmC7AqwIryWVqauOrmWJ7
   pZvTrhOjk+BH4Lpd+B8xdOu26iy6oGl2pEisHeC5eH4OzPyKwfvbpSx4G
   JAIwERqTpvsPIpwqdXjnSlRDPwQ/hHnCbOGp4z/j9mQGlJ19TYP6Xe/Hi
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; 
   d="scan'208";a="164629369"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Jul 2022 14:01:34 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 13 Jul 2022 14:00:47 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 13 Jul 2022 14:00:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AA7aGs+tLYXFbM30OMzOGxdPE1CL2vuvbtUkNTH+AbOZKLlUo4ulbqBYnvoX3/sXZ9Jz2oq7fkMVhaZDL6Ig6k4rPHohs2hEP8NohCuiWFTHKr1tjqtvTvMde+M31iK9z5JvgsVHarDg22fHNc8vHDkV+Jyf/H1YG9kVk42mocb8PACsJGPjSMRUTX9y20P9GB+ahgLjBItTJSzHtsckXlFdwoFwJL92W+ROu74RAQy+YzJf4pVpdB9w9Z7TtJWcUCC3hrVJZbmkpa2Hy/OsY2Vq/i1Ou6ylA9im/IakooUQBBK9d3/Hr/uGJv0Gjw2RuMEH2CE5h6tKzVVWFjPmKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZmxxFoVkYGqzpsEpNtr1jHCheBRTu1N3S2zZO5drZrU=;
 b=EDsZF6GtLZS3sgAvpXlSwKUQjVAjcKnbMaCZZvCHK3aY5YmnbQwZzWJHll8ix06JAj43QHnfz3U6kMrcUSPPzqt03y2TiUe5EcwKgGxaP24zfljK9nzTIxZRS/96o+0MBSmVZSNhO9siVHCqmPtlEgKimrA2KBb3LlaAerarUvkR+tp1jk2teBgkZQEB+IJlNHd7qN9uQgDRitYSOY3DQeIzuNdqwp1mQIHzuhPJ05/q/3roKTg788cgQ3MM1jebfk3siM4uElpG6W7kITfhvPW7/CRC7Z1Yj+HAO/6uGIORj1c0HcYQWNJ6ZxxO4po6TjErKlaS8pwTPKrUYWb71A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZmxxFoVkYGqzpsEpNtr1jHCheBRTu1N3S2zZO5drZrU=;
 b=ovAE01Z5U+oxjIkHeB2A/7x81wVOknUEAIfebhCeoTqyPGkUyA/R1tWU+UY/1qfNV8qNfYsbHFeb+rliXF9wsFD40VB81gFdgROMxAWhREu0zpdMnbg7IOvtj6MisabOnyg/Ibn7PZUgGupKryQsxOUzvxk/iy0SHZwCwfu6Jck=
Received: from PH0PR11MB5925.namprd11.prod.outlook.com (2603:10b6:510:143::10)
 by SJ1PR11MB6250.namprd11.prod.outlook.com (2603:10b6:a03:459::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Wed, 13 Jul
 2022 21:00:46 +0000
Received: from PH0PR11MB5925.namprd11.prod.outlook.com
 ([fe80::5c03:1f60:ee1d:3928]) by PH0PR11MB5925.namprd11.prod.outlook.com
 ([fe80::5c03:1f60:ee1d:3928%7]) with mapi id 15.20.5417.026; Wed, 13 Jul 2022
 21:00:45 +0000
From: <Lewis.Hanly@microchip.com>
To: <linux-riscv@lists.infradead.org>, <Conor.Dooley@microchip.com>,
	<brgl@bgdev.pl>, <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
	<palmer@dabbelt.com>, <maz@kernel.org>, <linux-kernel@vger.kernel.org>
CC: <Daire.McNamara@microchip.com>, <Lewis.Hanly@microchip.com>
Subject: Re: [PATCH v2 1/1] gpio: mpfs: add polarfire soc gpio support
Thread-Topic: [PATCH v2 1/1] gpio: mpfs: add polarfire soc gpio support
Thread-Index: AQHYlqemr2KX1URl4Eaxdmj5tFzD4a18KWyAgACggAA=
Date: Wed, 13 Jul 2022 21:00:45 +0000
Message-ID: <9e00e2cca641b735fe56988ca1eec1aef183f481.camel@microchip.com>
References: <20220713105910.931983-1-lewis.hanly@microchip.com>
	 <20220713105910.931983-2-lewis.hanly@microchip.com>
	 <776164f4-21cf-7720-3cf3-3b30b72b8b29@microchip.com>
In-Reply-To: <776164f4-21cf-7720-3cf3-3b30b72b8b29@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: deb59b53-a72b-4fba-6933-08da6512c1a0
x-ms-traffictypediagnostic: SJ1PR11MB6250:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QtMpC5hbRWE7bee4Y2lntJX5wZj37VsrToGpNqMBjKZifB1vlt0fVhOuPDMd0yRWefgc7P8vyAMlcdIH96fvPZL1pLoLxIp5HPa30Ju7GFdu5/JmjdK47sDW/aerEm+V27rj9gQr2WEMU84TRyGq9xKQASxmeuBm1sQKZ4upSB/swls7tUjmBtGNiFPIku1yOm6fYz6k7b60XyY5owo9VLqgw+KSqoHmfHE1CuLekMXbkNCYT7e2Dndd9IvBB1bb4h5pbUZXIxBj79fRHsV72RYQH1wghrU1YQQuxM1y/v6twJH1I44sPT1PEUPMit9wTZa5TMivoHdnY1Uuu+Q3JklL7pF39aMoki5C1aX1qSfYscjzLv67+/m54WV5U9iam+lF/VH6hy0j2i+oULKGmYs3RWBpe8wZ2a3PtpRhlz/if5t0OgmAdnOry6OxyCjwljPlBwa6n/MzjPdpFUEXqRNA3+QaSaZcxyfXpELP8rtXr5VJ6EcFlQhMahqyQsfFu2v0XteUGJixXlol3eHgRfR+HynF50MUWfvPgT7u7OobVjbUt9rTyYRSBXl0OsVa6LypKln57n8wY/nYuyTH5Oe3+E0dqvhIOdcHRrUpJ4SDOSfv6kaXZFU/BUvgjDn1PbefgiM16DP9itjIGoVSZKirDihp4Y7HHCNDSK5/ehkjeYeXwa1QdZbESXduCxUUUHVSdwjNvtzKKnO1VTXonJ02nOpt1zXbGK6XqfV6c2Hl+0AUjdBAiS+lhTip+//Tj+k0F5/jMUwR7ImZf4eLntYcjljYdtBGO+6gVvKopnw3ORA6GrlMQpVLZoYVHkJj
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5925.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(39860400002)(396003)(136003)(376002)(346002)(6486002)(86362001)(26005)(91956017)(53546011)(6506007)(6512007)(2906002)(41300700001)(478600001)(76116006)(38100700002)(2616005)(8936002)(107886003)(5660300002)(36756003)(66476007)(186003)(122000001)(4326008)(66556008)(66946007)(83380400001)(38070700005)(54906003)(110136005)(71200400001)(64756008)(316002)(8676002)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d0xla2xwdEJzWGl0cHZEemZwcTNHeHIyTC9Qb2puQjZuUXVJZHVVb2FyeElv?=
 =?utf-8?B?aEJueGJQVUN0NnpEUW83RTRDSnNOeDN3dkpDUlUzVjlZbk9lck51K2p5U1Jz?=
 =?utf-8?B?S1VxMDJlclNQK1ZKSkxLOU1tYTg2VGNhYmZYUFFlTklkaFRvSmJmUG1vamlD?=
 =?utf-8?B?c0NESngxcytnaWJpRTRVRlVUd2k1WXROSGFnVXA1bXhxY2xKbmxoMG5MYXhJ?=
 =?utf-8?B?cGc0NzVxS2NQUEc5ZHJ3UWVmdk9RMi90QVM5Z3JNT25IcWx0b3JUK0pPQWJN?=
 =?utf-8?B?R0hibkZXS0M4RHVBcEFPRzUyMGtvZ3ZGQ3lKcDdrZ2RhbE1iMDZsMXF4Z1d4?=
 =?utf-8?B?VmwvRkNpMS9rSkd6SDFYTFNPWStuUWR5TXNkSE1jeGpKbzhKZ0V2MUFUT3dK?=
 =?utf-8?B?OG4vb2oyajJVWUpaaFJuTjNQdFFnUjBrQTd0TnpLMzJnbkhsSERYNkN3OGFl?=
 =?utf-8?B?L2tsVU00SWk1M3NlU1p5NjBXakVSSXA5SFJ6S3RRVGRoZ09jRllMcTF5eW5x?=
 =?utf-8?B?cmw1ak5ydDZJWlEvZGV2WDVjTWFxU0Qwc2VZQjF2SHAxc3ZqZkR4UEV6TmE2?=
 =?utf-8?B?ZVBmQUgvZ3N3eGl4SmMwMVZuQXUvVllJM3c0UUovbEJxM3FGT2xJVElsSitY?=
 =?utf-8?B?MkdNUEQ0REptRTFpT0ZQRmdZcDJLY0NQelBFR2JpTFFPblliN2I3VTZkQWNP?=
 =?utf-8?B?WGRIbUZEK3pHL1ltNlFIY1I5Wk5BcUxrVEFsMEdxYzFCUXQyTWlFT1lNNDc1?=
 =?utf-8?B?bWxnQW01RFUwYXBuNklrUnBZT2g5K0ZIVmhBSzhINzNzWjNoQXdRRkJxM0NU?=
 =?utf-8?B?bGQveXl6ODZLdmJRU2s2L3RkYmx4aHpGa29teTl6cFlzK3c0bjVOYkYxRjNv?=
 =?utf-8?B?YWhyOU9LZkhSMThBUW5qT3d1bmQ3QTFJUGkvay9HNmVIVjdmd2x3cVp0eE0z?=
 =?utf-8?B?YUJBRHpvM3l2QzBCbzZEL3RKWUFsRXRkdVk0ZHRUY3diblJ4ZzJiMk8xRW4z?=
 =?utf-8?B?TFV4bExqTkJjTjdaM0xWMmFwVmNpb1htUXg1TFI4V1l2KytxWCtTYmZHcHBS?=
 =?utf-8?B?alg3czFIMkxKSWlsTUtCbzVVOHVvVDAveHZCTk1NejQ4TVNGMTdoMm52NjVD?=
 =?utf-8?B?MHVmNnlxTW00WkVKdG9kWlBrdG5QbFRseUt1bjFwTHRrZG5PY1NneU9QVkNj?=
 =?utf-8?B?d2NwRmc2NTdLejYvRE9rOGhQZHVoUldCNzNxVi85NnI5OVVNZlVYQ2xXbGNN?=
 =?utf-8?B?Q2xPSnBCUFFGVnBpcDZ3TENVWEFVVTIvM0tJZ2RUTW1pNlFlV1VTeVFLTVY0?=
 =?utf-8?B?N3BkQzF6aFJDUUs4dDBzN2w2OElvUlFXMk5lK1FhMHpkNXlHOXlhcVRVcGRr?=
 =?utf-8?B?d0lXV3lWNjJrZDdyc1RueUFqSXp1c3BVaXJVVDcwTjRUUUxGTCtNTC83TTd0?=
 =?utf-8?B?NlZEcmNDQjBIdEZCMjVram9Zb0NSMmZkbGFmRVozSytOMGNlSUEycU5rRUNT?=
 =?utf-8?B?Vi9PbWtTUnEzNW9adzZnTk01OVJ0VlErSTF2VVBYYkxSRXpIL0w4NWlsdmJp?=
 =?utf-8?B?NTc4dFNPMnR5cVFmaU52MTdtZ2gvTTNFWlNQdUpDUWQreEFBMHF2cVdOQ29r?=
 =?utf-8?B?NkRXZXJOVUZKTmJ6RXhrd1JrY3BMTGhxd1V1Q21odTZsTW1jZlZaMDBLTDhk?=
 =?utf-8?B?YTNuWUowY0crbFJuVDlvUERHL1JST0R6WkhnRHNkNDVFWFhLMnc3ZXZZQTdR?=
 =?utf-8?B?SVAxWkUyckJLN2hnTDFiS2VyWHE3UlRKdGl6TVdlckZIQjZoVTZwdlphbVZ1?=
 =?utf-8?B?ZHpNQnlaaDkrTWhnRktBQlRFVFVrR2trTjRGRTJpdjB4NnlFMjhLSWRQOWh6?=
 =?utf-8?B?NVgrdm1DbWV1c2ZlM3dtaE5MbWxvRlI0dUdiK21NemhNWFpBaUJ3bmRJTi9P?=
 =?utf-8?B?R3RGODV3bnJ3Z291aFhQallJZ0JrYk1TbzBDUmFjdGVEMDRwUktGTVFLekhv?=
 =?utf-8?B?ZWlYSERoS3pzbGw1SkV4bm1QNTQwaGdPUU44NDlENnlVWEQveGEwdUt2bjRq?=
 =?utf-8?B?SDFjSDN0UExLSDluSlFwaWhjODNZOVl2RW9HcjIvQWh3UU50RXNYVDR6Mks1?=
 =?utf-8?B?RkV0Um5tcFVQMFdIbVU4VkZGU0psSzhKU01DTzNKYjUvU0YyV1Z3NnJCU1Vr?=
 =?utf-8?B?OVE9PQ==?=
Content-ID: <4CF1D83A40BCF248B0606C429F08B46F@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5925.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: deb59b53-a72b-4fba-6933-08da6512c1a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2022 21:00:45.8522
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +gvzC6nUqLcFCkIWo9MELoBRqkVKIpqZ5VwOjNNs1XQ2xiv5H2IxKTxB6DN2lkyH0xAMOvmaRIB4zXygHkqcC9JhI4x4OaM9ssk1+y3S8lk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6250
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_140336_733341_D328C18D 
X-CRM114-Status: GOOD (  24.74  )
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

Thanks Conor.

On Wed, 2022-07-13 at 11:26 +0000, Conor Dooley - M52691 wrote:
> Hey Lewis,
> Couple comments.
> 
> On 13/07/2022 11:59, lewis.hanly@microchip.com wrote:
> > From: Lewis Hanly <lewis.hanly@microchip.com>
> > 
> > Add a driver to support the Polarfire SoC gpio controller.
> > 
> > Signed-off-by: Lewis Hanly <lewis.hanly@microchip.com>
> > ---
> >   drivers/gpio/Kconfig     |   9 +
> >   drivers/gpio/Makefile    |   1 +
> >   drivers/gpio/gpio-mpfs.c | 379
> > +++++++++++++++++++++++++++++++++++++++
> >   3 files changed, 389 insertions(+)
> >   create mode 100644 drivers/gpio/gpio-mpfs.c
> > 
> > +
> > +static int mpfs_gpio_probe(struct platform_device *pdev)
> > +{
> > +	struct clk *clk;
> > +	struct device *dev = &pdev->dev;
> > +	struct device_node *node = pdev->dev.of_node;
> > +	struct device_node *irq_parent;
> > +	struct gpio_irq_chip *girq;
> > +	struct irq_domain *parent;
> > +	struct mpfs_gpio_chip *mpfs_gpio;
> > +	int i, ret, ngpio;
> > +
> > +	mpfs_gpio = devm_kzalloc(dev, sizeof(*mpfs_gpio), GFP_KERNEL);
> > +	if (!mpfs_gpio)
> > +		return -ENOMEM;
> > +
> > +	mpfs_gpio->base = devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(mpfs_gpio->base))
> > +		return PTR_ERR(mpfs_gpio->base);
> > +
> > +	clk = devm_clk_get(&pdev->dev, NULL);
> > +	if (IS_ERR(clk)) {
> > +		dev_err(&pdev->dev, "devm_clk_get failed\n");
> > +		return PTR_ERR(clk);
> > +	}
> > +
> > +	ret = clk_prepare_enable(clk);
> > +	if (ret) {
> > +		dev_err(&pdev->dev, "failed to enable clock\n");
> > +		return ret;
> > +	}
> > +
> > +	mpfs_gpio->clk = clk;
> > +
> > +	ngpio = of_irq_count(node);
> > +	if (ngpio > NUM_GPIO) {
> > +		dev_err(dev, "Too many GPIO interrupts (max=%d)\n",
> > +			NUM_GPIO);
> 
> This should fit on one line
Can do.
> 
> > +		ret = -ENXIO;
> > +		goto cleanup_clock;
> > +	}
> > +
> > +	irq_parent = of_irq_find_parent(node);
> > +	if (!irq_parent) {
> > +		dev_err(dev, "no IRQ parent node\n");
> > +		ret = -ENODEV;
> > +		goto cleanup_clock;
> > +	}
> > +	parent = irq_find_host(irq_parent);
> > +	if (!parent) {
> > +		dev_err(dev, "no IRQ parent domain\n");
> > +		ret = -ENODEV;
> > +		goto cleanup_clock;
> > +	}
> > +
> > +	/* Get the interrupt numbers.
> 
> netdev style comment
> 
> > +	 * Clear/Disable All interrupts before enabling parent
> > interrupts.
> > +	 */
> > +	for (i = 0; i < ngpio; i++) {
> > +		mpfs_gpio->irq_number[i] = platform_get_irq(pdev, i);
> 
> You need to handle the case where platform_get_irq returns an error
> right?
Was not going to as I don't think it breaks if error. I will do a
little more checking if required.
> 
> > +		mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_IRQ_REG, i,
> > 1);
> > +		mpfs_gpio_assign_bit(mpfs_gpio->base + (i *
> > BYTE_BOUNDARY),
> > +				     MPFS_GPIO_EN_INT, 0);
> > +	}
> > +
> > +	raw_spin_lock_init(&mpfs_gpio->lock);
> > +
> > +	mpfs_gpio->gc.direction_input = mpfs_gpio_direction_input;
> > +	mpfs_gpio->gc.direction_output = mpfs_gpio_direction_output;
> > +	mpfs_gpio->gc.get_direction = mpfs_gpio_get_direction;
> > +	mpfs_gpio->gc.get = mpfs_gpio_get;
> > +	mpfs_gpio->gc.set = mpfs_gpio_set;
> > +	mpfs_gpio->gc.base = -1;
> > +	mpfs_gpio->gc.ngpio = ngpio;
> > +	mpfs_gpio->gc.label = dev_name(dev);
> > +	mpfs_gpio->gc.parent = dev;
> > +	mpfs_gpio->gc.owner = THIS_MODULE;
> > +
> > +	/* Get a pointer to the gpio_irq_chip */
> 
> I doubt this comment is needed
OK.
> 
> > +	girq = &mpfs_gpio->gc.irq;
> > +	gpio_irq_chip_set_chip(girq, &mpfs_gpio_irqchip);
> > +	girq->fwnode = of_node_to_fwnode(node);
> > +	girq->parent_domain = parent;
> > +	girq->child_to_parent_hwirq = mpfs_gpio_child_to_parent_hwirq;
> > +	girq->handler = handle_bad_irq;
> > +	girq->default_type = IRQ_TYPE_NONE;
> > +
> > +	ret = gpiochip_add_data(&mpfs_gpio->gc, mpfs_gpio);
> 
> Can we use a devm_ variant instead here...
Maybe, will check.
> 
> > +	if (ret)
> > +		goto cleanup_clock;
> > +
> > +	platform_set_drvdata(pdev, mpfs_gpio);
> > +	dev_info(dev, "Microchip MPFS GPIO registered, ngpio=%d\n",
> > ngpio);
> > +
> > +	return 0;
> > +
> > +cleanup_clock:
> > +	clk_disable_unprepare(mpfs_gpio->clk);
> > +	return ret;
> > +}
> > +
> > +static int mpfs_gpio_remove(struct platform_device *pdev)
> > +{
> > +	struct mpfs_gpio_chip *mpfs_gpio = platform_get_drvdata(pdev);
> > +
> > +	gpiochip_remove(&mpfs_gpio->gc);
> 
> ... and drop this?
eh, OK.
> 
> > +	clk_disable_unprepare(mpfs_gpio->clk);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct of_device_id mpfs_gpio_match[] = {
> > +	{ .compatible = "microchip,mpfs-gpio", },
> > +	{ /* end of list */ },
> 
> Don't need a comma after the sentinel
OK.
> 
> > +};
> > +
> > +static struct platform_driver mpfs_gpio_driver = {
> > +	.probe = mpfs_gpio_probe,
> > +	.driver = {
> > +		.name = "microchip,mpfs-gpio",
> > +		.of_match_table = of_match_ptr(mpfs_gpio_match),
> > +	},
> > +	.remove = mpfs_gpio_remove,
> > +};
> > +builtin_platform_driver(mpfs_gpio_driver)
> 
> Mising semicolon?
Can add..
> 
> Thanks,
> Conor.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
