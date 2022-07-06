Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD752C43334
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Jul 2022 10:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f5cEVGUSR+PpQumpqw6vnyZCy/A1tyNGXQRDX9uSJ4I=; b=HxrtORsp0pqNs/
	vTeHsoWTfEL/1IKMx3gmBbOIRxbPzJbS4g8YLsX5Fcda37VOe64tI5MJpt2KQTY8XNynRow33+Gmf
	XMqXfWb56bcmP1rcIENnqLwqfWJcOOGCd+24ROa7SZYUBEMMN/BGfFIBC4BWlQSY0Tf/K/asNjSFO
	QOhAIFhQ+1PB93MJebD3X2PC0qZyvmbbyUFy2WFxbNbdpCvhKkdZuBwrMkLWwYdHm+TtNwVPfMhyY
	tpa2Ivz7vh7/2AZ1PnFu18aktf1QRhG4UL5ewuQzDyVmufDrqRCCddVmechUtcD8BfMxjw3irLmB1
	cIsOMiK6wdj21DUPuPzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o91sa-0086k8-3i; Wed, 06 Jul 2022 10:03:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o91Yr-007sek-QH
	for linux-riscv@lists.infradead.org; Wed, 06 Jul 2022 09:43:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657100589; x=1688636589;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=vaqgWDec7rpya2fHtXy2HBmNGBzfLlaGPboZgo3h5r0=;
  b=GT1b4JxtP1TEjBFd7RJe6DBbMsljfBcME3njbmHZRy1A8lprdCiwiKPk
   ha6wNeRyWc94YsIFCT8eISEycZ6YOAnptbtsPNZxZzBi3EQk10BKH4edg
   3ktDkBYmRU/4oD5alHiNUmQzvmI7LWBnkXVbZupaC+bac+k0rdk/CZ71H
   +LiOVcYEHTRl921XI8lXDBM8y8CLdOAUyITogWdwoc4/RB3KKGOx/XAGl
   LmA8DQTl4JZT9DYt+LV+hUaCHMjkHC7gMcapviq1nZ9mAOIqUL3L5isGA
   IvaYeNcwvCXLJfdl9n5hbKbqTYisrn0UaTK9vZ8gmq0BY6oO4Dx7UgpaW
   g==;
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; 
   d="scan'208";a="163536733"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Jul 2022 02:43:08 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 6 Jul 2022 02:43:07 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Wed, 6 Jul 2022 02:43:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gUmakOewfRSshQFqW+sXwFx2kuWDnocJySqED4EXxpPjEIaka9ezZdPfZe+q/LaUG8WJTVe55qGyxif9mdO+eTf7QJWIfGKEHS1hNHsb744+jxr1SGbrTAZJCoxTa02dhhv6y8dipQ5W2OY9gDieQiEzMhwtB/I/a8v8P78JSRrVNyXa41BK1K5S8LB7p03Dax2aA0jtDMHSCq3W/CKqEOwGZKVMbjkodbZP/wehfEkgd9AidIYmQ5DZlhbKEISF+6zubzSgWee8yIxkND08qZXesX+jR5y5LUJDWWhdsRa0i8wnvze9G2FRaPqMLIJiq1eUfaWHpHA0m4tk0NdodA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vaqgWDec7rpya2fHtXy2HBmNGBzfLlaGPboZgo3h5r0=;
 b=giR4+4SMKdvtgKutYWaY9Q8dZGphV0Z4+P2zn8p+YvE0den2EumZQEH5MiQOgUsEAnx9zb7aFun+4eg4IpJHPF5Pe8dJSSfZzvZFdbQ+anI+kr7sPNt4U4b7M2tsBtDHLInoO17VFTo0sdTHy0k0OUtM9sBoHv+JC6G+IRHr4glRkg9J1yq3ygFRgiOwcQwTm2RbKEXeY3Xxw2IYqFuMNKuA1OwSjP1/1ZvhP03PW5DxHp6FvO8SQQYCEWkNK2kd37lcyx6p8paCCS1ovM1mlOttsnlWjUzd7xMV/fpYosLOjXriD9inGHXK3W6Otw1na1+SE5Zk5TLMUqTYHENE7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vaqgWDec7rpya2fHtXy2HBmNGBzfLlaGPboZgo3h5r0=;
 b=MykJxBYwLhBiEvP5fc142Pf0EYGx/bkFhyOiChatnZXtvVCaY+1copEM5NsvFkwtkd87oKks6i0E9ld1cbZk+ZQs0pYa+hHJN2jYYn3bklil9yaEvjMg/6yV3itKAcJBnjagtOwTkIugxVAyd7YrIkwngLnqf1aaLXh+Eh2Obec=
Received: from PH0PR11MB5160.namprd11.prod.outlook.com (2603:10b6:510:3e::8)
 by SN6PR11MB2992.namprd11.prod.outlook.com (2603:10b6:805:d4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.17; Wed, 6 Jul
 2022 09:43:02 +0000
Received: from PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::6090:db2c:283b:fe69]) by PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::6090:db2c:283b:fe69%8]) with mapi id 15.20.5395.021; Wed, 6 Jul 2022
 09:43:02 +0000
From: <Conor.Dooley@microchip.com>
To: <sudeep.holla@arm.com>, <Conor.Dooley@microchip.com>
CC: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<Daire.McNamara@microchip.com>, <niklas.cassel@wdc.com>,
	<damien.lemoal@opensource.wdc.com>, <geert@linux-m68k.org>,
	<zong.li@sifive.com>, <kernel@esmil.dk>, <hahnjo@hahnjo.de>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <Brice.Goglin@inria.fr>
Subject: Re: [PATCH 0/5] RISC-V: Add cpu-map topology information nodes
Thread-Topic: [PATCH 0/5] RISC-V: Add cpu-map topology information nodes
Thread-Index: AQHYkKIdHc6oV2H//EKJV+LfcdW+Dq1wN82AgAAD8QCAACn8AIAArIoAgAAGDIA=
Date: Wed, 6 Jul 2022 09:43:02 +0000
Message-ID: <9f26cd2a-b389-3f4b-b7d2-06fa5c2d7016@microchip.com>
References: <20220705190435.1790466-1-mail@conchuod.ie>
 <20220705201931.nfwi5rlku7ykmydr@bogus>
 <8f07796a-d9a2-3301-aafb-7fbec4d5b1a2@microchip.com>
 <fb7be22c-cf19-0e06-f231-bb5b9167e179@microchip.com>
 <20220706092126.k6zaknwcwzyg22ak@bogus>
In-Reply-To: <20220706092126.k6zaknwcwzyg22ak@bogus>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8b7dbcb1-ec8c-4df3-0d50-08da5f33eb4d
x-ms-traffictypediagnostic: SN6PR11MB2992:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4V/2yBoM/cgID15QuyMZX3kTNWyp1ocV9/AMZpS1JdNHOir0lQr4kqcjf/y4lPpQKmi7cb27sC9jiEM03D/0lhOJttJ8lJbu6tdoCQ4HPPa8ttUrJDvT9pmA6hfTGbTdvxCBgnRz12EaX3EnLeKlI/o46EsAC9UT8l634PQ1DYXxneb+x45rMzySVrAzekBpCRpU67/HEvcauCiod/OKFMuIJZ4XJzeQtv2epc48P1HheG0/UVA9vC7+PPpLyFtLCYGaWUzYWkAKOi8vPP0fnuA9hea/BnEKRvQuvgMDgRHopynneby9Kb8/uViu3x86uTFnLksBS+54CQ0Bdgfp/eNZGxuEi6Yg005VSSjfeDFJr8mzhBYCbMeAv+u40JAM5NJ2nhBPDJLL3V0L5xSvXonZP+tFSCMXGdaLXAUsZihXRC83fIVOlof8w/LKaa+vyXKnjpKudwpC1MH4MUZivXsqB3uVKauZHltZkmUT37uaSQF7Ig+Ish2v6EwEJcRamOS81+yIfiJdyL0Yk3oP13buVtnaZyfaE2T54qPzBtUkOD4JMXQaDX/ZAdasleEn/0SC+7d6sBRiCS5RuDuk4t94V5cWWYbSdLjW8hXI5E1Q4sq4r3Kld+PYzCVWKHr1H4OvOOJrvsaX4oGFLA5wl7DUgqCnbhRa7Opt4nl2nf6Ajcqeue5BGrDIMAoiUEfGURYpaoKQhvyKMTugoQTDMQo1qcLtwNlg7qenldWT7iJ7grkwbcUkGjQ4pdmABVbbJqYoRcniu6TAImVze7jxCDzv6llSuERP4eQFaS/Glbo4kG8uM76EYCqH5Rn5DNgX77umr4x7eOqPgU85BuwaZBDCU/J+wOrhA6PvwzKI2UbqyYq5jlTIikIly/3Soj3H
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5160.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(346002)(136003)(39860400002)(376002)(366004)(316002)(41300700001)(86362001)(31686004)(38100700002)(31696002)(6486002)(8936002)(38070700005)(122000001)(7416002)(2906002)(5660300002)(66476007)(110136005)(66446008)(76116006)(478600001)(6506007)(64756008)(66946007)(8676002)(4326008)(66556008)(91956017)(186003)(26005)(83380400001)(71200400001)(36756003)(2616005)(6512007)(54906003)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V3ozQ3pqcUVUZ05DVXFGZUs5M3NMcGx2UUpaUlladkN1TnBYYWRZRWtUc2dJ?=
 =?utf-8?B?eDhwaG5xTHdReWlraDNGblNRS3JaNFJZOGR1azUrVDl4bzBJZi8zdFFWSkQ3?=
 =?utf-8?B?WFYzOEMwY1p4TXl1V0xNOEh1c0w1S0Nza1RZL2dzUllTaitkSWJWTmVQa3hH?=
 =?utf-8?B?UnQ3YWdEWlRKQ1pKSUU1RTczdzRlUDI4dlB2RWRTcUFlZGdPL3p1NVhCcjRU?=
 =?utf-8?B?TzRrak1FaVBTb3pRZE5ZbnJjWkRWU21NdnNxclpNd3NaTk1lc1ZKKzJBczRV?=
 =?utf-8?B?YWFYMW9FQmY1K1VXWVZ4ZnZaSCtGbG50dGZoUUtyYm1ZSkN6KzFMK0Jmd0g3?=
 =?utf-8?B?L1ZYMkVaNEdzazVJa3NZSHM5UU9UR2NwOGJnVG1TdTJBKzRFS0t1cG5EUE5q?=
 =?utf-8?B?NmJkZ3c4TTZKUWU3NjBkWEJvYWlpbE5mbmUwcFZDOTVIaFM3SktselZKZ0ZG?=
 =?utf-8?B?WHhUeG5aWnQxMGd1UTN1Qy8yU1AvYThGcldDMGtyRVlZVUdCSHp2ZmtLaWFB?=
 =?utf-8?B?Zm12TU9kZGVUMHRUelZ1b2lGckxKV01wcTNMZFU0ZWs4VUZVdTFQalV4MGdC?=
 =?utf-8?B?cHN4M1ZkdFljOVRNbUJFQXlDaTVibjFIYUUyWEVOQllzM0VOb2RGajVMc3I1?=
 =?utf-8?B?MjU3N3BqRndDWWd6N2R2TU1vUnc3VWxiQk1NVGlTenlxL3YyVFdrd1dTWmo5?=
 =?utf-8?B?MStjM29VNnVPemhmUTlNUVRlaityb1BONDBSUnNJY1FhQXlPdWRmZ1RvOGF1?=
 =?utf-8?B?aFg1S3M2aEZsQ2NaZDluNkpzLzhXMEdCN20yLzdjeEh4MHIwaW4wR0dmcDNH?=
 =?utf-8?B?YTR5ZFRyek8yM1E3a2FaUDhpZEw1RjB0dCt3WU9zRzJ4V2EzcE9rZGg0TGpF?=
 =?utf-8?B?VnFibE1yT0hmSXJ0ZXJVeTNwTGdnUHF1WG94QzhFV3ZKaW9QMXRSYTR5TVZv?=
 =?utf-8?B?ZU9wNmhjOTRDSmNLVTBmRVIyMjFxWkhHL20yZ1Q5SUpJWGJjeTk1WUo5SmZx?=
 =?utf-8?B?YUk4T0I1V21pVGV3aVNaV29CYlB6RWErQW1pL29OZGtjOXJTdXJqSkVGNzhP?=
 =?utf-8?B?ZGFWbUZJb2dSSENIOHpiZEV3bWxyS0Z6TU1LeXVtRnozZVN6enBuY3JoWUdh?=
 =?utf-8?B?OTRKM0FsTVFIdW94OStMME5mZHhCMnA2cWRWQmVSdE96L1NJRTFVbTVSMWRC?=
 =?utf-8?B?ZEREc24yTnJGWmtKT1VteWJZR0Fyd3FVRE9lWlpyWWVuSUp5YUV3dllOS3FQ?=
 =?utf-8?B?U0hZNEdBNyt4S0dFNDhjV2Yra2pRZmYzVlBGZkR5VW5Xd2t5dmJNSHYvTW41?=
 =?utf-8?B?Y2FFK01mWWx6OHNFc0RSVXVSY3ZpaWFlZi9zV1lQenA5OG9YS2RCRXYzWlNI?=
 =?utf-8?B?R0lqUzlZT1gyNFF5R2ZGYjZVMkhmMFp4TzMxTkxsZkhvLzh2TG5ZdXZjUVdQ?=
 =?utf-8?B?dXRHajN5UGcrRUhrWFhiK05DVWtzcUhWNFlDZzRYblNESGdUbUp6NFcrcE15?=
 =?utf-8?B?cjVsRWloYzMxOEx6VUNPK2ZaRnByMHZsazZGV3RzTzdDQ0JkUmFrd0J4cVRl?=
 =?utf-8?B?SE1uaEhMY0lvTmVkbU5obFcwSkpaUzF2KzFxVzNMR3pUbGJ5YzA2QUFNSGha?=
 =?utf-8?B?bnptOVNOejVXcEtBTXZIb0tNTnRDcGcvSVkyRS9ac2kwWWMyd1NNWWY0ck11?=
 =?utf-8?B?K0xyMVBoemVEaHNRb2I5aWNRcG5JQis0OHNudHZBZmF0L0d1eFd1STF2ejVT?=
 =?utf-8?B?TEZwbUxtbTFEZVRBamUzaFNER0grZ1N5Z2tzejlISkxmQi9JdWx1dVlDV3B5?=
 =?utf-8?B?L1hKWDcwZGphempUblJaZU5PVnhBbmVhZm96UUszTmV2V3ZEZGZ5OGpjRDNh?=
 =?utf-8?B?VzlhRHlkTDU5NU1QY0dDRkhZWTdlWkdnN01ERmVEYWVVc0phMFE0dXkyZVVP?=
 =?utf-8?B?ZVVYM0tVV3BRZHo3K1BsYWtTQUE0bVM3RmgwR3prK082RG9PeS9lMkRNcEZM?=
 =?utf-8?B?aW9PZEpWd2RObFN1WUdPWVpuOU4wVU80MUw0SnJ4ci8zQlM3N2NmUXMwYVFI?=
 =?utf-8?B?dk9RUVhOZDArRy8vTXM5NERxMjhZamo1Z0dsZGJRelJvMW95MUxLRGNQcU16?=
 =?utf-8?Q?44YP8o2YxbH49l0+Yy10PUutp?=
Content-ID: <F7D9F216B8A5AA4C9B251311077777FB@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5160.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b7dbcb1-ec8c-4df3-0d50-08da5f33eb4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2022 09:43:02.1842
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oqVOvJQjjCncshiYlodS1N9/SxR4A83zaSS0a4+MU+z+FxLOVVcXMrGnQHfG+1iFH10LshjvBXkErBeVUE7F66tSCUvOORgiLt09Iacv1rw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2992
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_024310_140790_23962CEA 
X-CRM114-Status: GOOD (  22.40  )
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



On 06/07/2022 10:21, Sudeep Holla wrote:
> On Tue, Jul 05, 2022 at 11:03:54PM +0000, Conor.Dooley@microchip.com wrote:
>>
>>
>> On 05/07/2022 21:33, Conor.Dooley@microchip.com wrote:
>>>
>>>
>>> On 05/07/2022 21:19, Sudeep Holla wrote:
>>>> On Tue, Jul 05, 2022 at 08:04:31PM +0100, Conor Dooley wrote:
>>>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>>>
>>>>> It was reported to me that the Hive Unmatched incorrectly reports
>>>>> its topology to hwloc, but the StarFive VisionFive did in [0] &
>>>>> a subsequent off-list email from Brice (the hwloc maintainer).
>>>>> This turned out not to be entirely true, the /downstream/ version
>>>>> of the VisionFive does work correctly but not upstream, as the
>>>>> downstream devicetree has a cpu-map node that was added recently.
>>>>>
>>>>> This series adds a cpu-map node to all upstream devicetrees, which
>>>>> I have tested on mpfs & fu540. The first patch is lifted directly
>>>>> from the downstream StarFive devicetree.
>>>>>
>>>>
>>>> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
>>>>
>>>> I would recommend to have sane defaults in core risc-v code in case of
>>>> absence of /cpu-map node as it is optional. The reason I mentioned is that
>>>> Conor mentioned how the default values in absence of the node looked quite
>>>> wrong. I don't know if it is possible on RISC-V but on ARM64 we do have
>>>> default values if arch_topology fails to set based on DT/ACPI.
>>>>
>>>
>>> Yeah the defaults are all -1. I'll add some sane defaults for a v2.
>>> Thanks,
>>> Conor.
>>
>> I shamelessly stole from arm64... Seems to work, but have done minimal
>> testing (only PolarFire SoC).
>>
>> Author: Conor Dooley <conor.dooley@microchip.com>
>> Date:   Wed Jul 6 00:00:34 2022 +0100
>>
>>      riscv: arch-topology: add sane defaults
>>      
>>      RISC-V has no sane defaults to fall back on where there is no cpu-map
>>      in the devicetree. Add sane defaults in ~the exact same way as ARM64.
>>      
>>      Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>
>> diff --git a/arch/riscv/include/asm/topology.h b/arch/riscv/include/asm/topology.h
>> new file mode 100644
>> index 000000000000..71c80710f00e
>> --- /dev/null
>> +++ b/arch/riscv/include/asm/topology.h
>> @@ -0,0 +1,13 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2022 Microchip Technology Inc. and its subsidiaries
>> + */
>> +
>> +#ifndef _ASM_RISCV_TOPOLOGY_H
>> +#define _ASM_RISCV_TOPOLOGY_H
>> +
>> +#include <asm-generic/topology.h>
>> +
>> +void store_cpu_topology(unsigned int cpuid);
>> +
>> +#endif /* _ASM_RISCV_TOPOLOGY_H */
>> \ No newline at end of file
>> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
>> index c71d6591d539..9518882ba6f9 100644
>> --- a/arch/riscv/kernel/Makefile
>> +++ b/arch/riscv/kernel/Makefile
>> @@ -50,6 +50,7 @@ obj-y += riscv_ksyms.o
>>   obj-y  += stacktrace.o
>>   obj-y  += cacheinfo.o
>>   obj-y  += patch.o
>> +obj-y  += topology.o
>>   obj-y  += probes/
>>   obj-$(CONFIG_MMU) += vdso.o vdso/
>>   
>> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
>> index f1e4948a4b52..d551c7f452d4 100644
>> --- a/arch/riscv/kernel/smpboot.c
>> +++ b/arch/riscv/kernel/smpboot.c
>> @@ -32,6 +32,7 @@
>>   #include <asm/sections.h>
>>   #include <asm/sbi.h>
>>   #include <asm/smp.h>
>> +#include <asm/topology.h>
>>   
>>   #include "head.h"
>>   
>> @@ -40,6 +41,8 @@ static DECLARE_COMPLETION(cpu_running);
>>   void __init smp_prepare_boot_cpu(void)
>>   {
>>          init_cpu_topology();
>> +
>> +       store_cpu_topology(smp_processor_id());
>>   }
>>   
>>   void __init smp_prepare_cpus(unsigned int max_cpus)
>> @@ -161,6 +164,7 @@ asmlinkage __visible void smp_callin(void)
>>          mmgrab(mm);
>>          current->active_mm = mm;
>>   
>> +       store_cpu_topology(curr_cpuid);
>>          notify_cpu_starting(curr_cpuid);
>>          numa_add_cpu(curr_cpuid);
>>          update_siblings_masks(curr_cpuid);
>> diff --git a/arch/riscv/kernel/topology.c b/arch/riscv/kernel/topology.c
>> new file mode 100644
>> index 000000000000..799b3423e0bc
>> --- /dev/null
>> +++ b/arch/riscv/kernel/topology.c
>> @@ -0,0 +1,30 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Based on the arm64 version, which was in turn based on arm32, which was
>> + * ultimately based on sh's.
>> + * The arm64 version was listed as:
>> + * Copyright (C) 2011,2013,2014 Linaro Limited.
>> + *
>> + */
>> +#include <linux/arch_topology.h>
>> +#include <linux/topology.h>
>> +#include <asm/topology.h>
>> +
>> +void store_cpu_topology(unsigned int cpuid)
>> +{
>> +       struct cpu_topology *cpuid_topo = &cpu_topology[cpuid];
>> +
>> +       if (cpuid_topo->package_id != -1)
>> +               goto topology_populated;
>> +
>> +       cpuid_topo->thread_id = -1;
>> +       cpuid_topo->core_id = cpuid;
>> +       cpuid_topo->package_id = cpu_to_node(cpuid);
>> +
>> +       pr_info("CPU%u: cluster %d core %d thread %d\n",
>> +                cpuid, cpuid_topo->package_id, cpuid_topo->core_id,
>> +                cpuid_topo->thread_id);
>> +
>> +topology_populated:
>> +       update_siblings_masks(cpuid);
>> +}
>>
> 
> Looks good. Again package id is not cluster. This is what my series is
> addressing. So update the log as Package instead of Cluster above. The
> cluster id will be -1 unless you can get that for DT.


Cool, I'll respin a v2 without this included then & get the series
backported since this is user visible & will fix all existing supported
platforms.


I'll send the topology code changes separately to avoid it going
forwards.
Thanks!
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
