Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BDB3ECAAA6
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Aug 2022 17:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eWwZwC89e+ECBi02l3QsdBrTH8rJuGClPgLjN+nWM6g=; b=ghxllZBt9nM6vi
	zPicHZ2hMOeYjv6meqPu0OiSJs//iH53aR16H5pQWHcoeOHlrxY3VbwY6z4YPlkKb8lbF1GJuPTAJ
	WZqO7bgdFSrSv0IzT3oQi0mLmUb3b0fvWs4Q6PF5110gdvE6EijQWIqYZWimYoC4TkI/KY4nPMVP0
	4VIuiSt8UaI0KHj7qWzFrt56oqmHDFfslqMkaIVs685ZLSrq8pSBUN3n2g0HznuPYV/fuCgTOJJ/4
	b7JTHSE3V4fiq1T9wA4/+FdbInfnOgFKTMhMpmE03hnpszDgCxhpwpnlFOSb/rrBWijnj8GqVJfLh
	GXw4Ck6eQE9j5gKMgTQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRdan-009TRw-KO; Fri, 26 Aug 2022 17:58:05 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRdaj-009Sxd-GH
	for linux-riscv@lists.infradead.org; Fri, 26 Aug 2022 17:58:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661536681; x=1693072681;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=b8m5EHaqbNB935GWZzz5WAkdjSertpqbRjZLoRqukDQ=;
  b=tUpTigDGbjzcYnEuPRlR8FMmh+hclw2zQ2gPUHfNIbk7J9Z+hP2+fZgK
   GNK/iUpMjPpX3nMHiLD7lfXA/yNVffAApEG3O4OtaSeh5Ezs4VbmkXPID
   Cb5VjnA9ohPwXlZq0Gl6kDQP3Y3TDqtpqGK9N4ydw9L6j4gAFCvfrCM7e
   SP/gYwWoS9wykO0P/mthmejLuv1fTxs/BOe1YKpUJSQwd8XUBiGjftywl
   sHwQeVJWfJP+J359Yx5a2SOdc6Hcoc7ULHJ/0jnieT+2twZKjkRq2615Q
   Kn+iylSbPPkl32VH+jJ+MrJBZ0nrHkYu88j6dI5rX1YQrTXnKQ6XNbbii
   g==;
X-IronPort-AV: E=Sophos;i="5.93,265,1654585200"; 
   d="scan'208";a="110949249"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 Aug 2022 10:57:43 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 26 Aug 2022 10:57:39 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Fri, 26 Aug 2022 10:57:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h6mMYkJ2jPks7v1u8bLL+KL/eDiNLWGdQP9VtxpaZwqhej2HLSwYwvnbN5T8JOPsu6QK2RXmYq8bv5o3YMmncP7RFOLmb3NpSeikAFdPqwozpC+Cx+FT6o2R/iqO2iznpHhJZrr8+PuGbXGxJ2oUC7+rHuuoaor9p7vIcbhxk1JsZP+buLkzR02SDtlx5w4Ya2p5nbOBm4SMjLbAfGP2cTjbpCtOz3S+HqjWjqh+dvrbKvzj3h3oUv+6CENHqpcxxFp4Fs27wOp+7+fz2HA2c3OvrZEgnh2u+uZqZLpp7HmMssfpUokdOtW+bS6kWWpQgNjSn0c+qHHafUgH8C587Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b8m5EHaqbNB935GWZzz5WAkdjSertpqbRjZLoRqukDQ=;
 b=ezLZ7pH4uHzeFEbNj7EAEg2dq8gVzpaJtJ4ezdQQjC5hEs0YstPfyc3ykVetItGT8klOA6LMjQJyDFgjU7j0JTer5gw6ZzCE14Zt1LYgKjqmtqbf8Tic2bB4kICaz/GBRgyyn8I628SvnmMFiebjRvK6DdqHzKuqt3bIzQBPuHfTLnmhdCL6cUoYueStImAAtG+yrlCfPhOrnliDOc7YzcZoWRCFbzzwqrI9kyuV2n9dHEyOm2q4mhbNubux/azQlrQMYBGU+FS3YjRzoQEiEhH9Ey5GS2as/x3samlVVeJROxbHFVQ/3JMP3AYNNS4wVood2olo+ziFOn/XwOU4bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b8m5EHaqbNB935GWZzz5WAkdjSertpqbRjZLoRqukDQ=;
 b=Ktm9EMddCo/J+akQPjktjb/KSfifpD3prMtffsr6sF5lNkxuHaf9oSePycTE6ncw/nhSXzyyXJjbNe5VTSpiY9hxgOURhtPSZYr7OBpPcGTHR277wKz5E9dhBQ9Yehul3159QFjS2qIkdyCJPPENETU+h5QCerGaLqcZDmfpA5I=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BN8PR11MB3555.namprd11.prod.outlook.com (2603:10b6:408:82::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.16; Fri, 26 Aug
 2022 17:57:34 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%9]) with mapi id 15.20.5566.016; Fri, 26 Aug 2022
 17:57:34 +0000
From: <Conor.Dooley@microchip.com>
To: <heiko@sntech.de>, <atishp@atishpatra.org>, <anup@brainfault.org>,
	<will@kernel.org>, <mark.rutland@arm.com>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<philipp.tomsich@vrull.eu>, <cmuellner@linux.com>, <samuel@sholland.org>,
	<guoren@kernel.org>
Subject: Re: [PATCH v2] drivers/perf: riscv_pmu_sbi: add support for PMU
 variant on T-Head C9xx cores
Thread-Topic: [PATCH v2] drivers/perf: riscv_pmu_sbi: add support for PMU
 variant on T-Head C9xx cores
Thread-Index: AQHYuWnn2Mp+lPZc6UGa6dEb3oyfda3Bd86A
Date: Fri, 26 Aug 2022 17:57:33 +0000
Message-ID: <5f72e3da-d87d-2d8d-bb4b-d95dca65d4f7@microchip.com>
References: <20220826163500.1748653-1-heiko@sntech.de>
In-Reply-To: <20220826163500.1748653-1-heiko@sntech.de>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 114d58f6-0c21-40d6-8ad1-08da878c7427
x-ms-traffictypediagnostic: BN8PR11MB3555:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9pUYyDiJmd5/UfV1EkiHQ5FcUJDHo0Gh071mklUAf+RydMfbY9uEA/CGqkJLshYD89cL8EoydrrP1Ae3vtJt2cBRLq00ToBq2e6/OzCu+VyOcpPQ+AaHsIej37ikrlQNypl4hLj+vstq1wbxWYqMSOmiUXNl8Oj6N8y61qotz85SXIcY7ec2gBMHrrnJi+kwdWJkNpgW8vSBka37H2QtHdCGoLNGwwB2BUrVM4y0SIw7Plu/qqQ+tmbA8iWl8FBhqoOzUcOel1R7GgpnGE3pTCgJzIc/NlUkrV9OHftIIP+8wzDknUAiWAMne7Ftikk994EwR4tyhHX0yjI+jODR2jeiv/1mLtt0gXHEaEqgPieRr4e4utUuFUBYWl13+IJtaPeb/udzHfb9X0A7+7BOWQ4mIE9VdDrZmQx/ASx+G3Xr8hGTX7AYB9MEBU1Te2Dg1zmp0BcHgJ52y7umgXLBhJgFu4XtHYUFshWH78ZI7yjDCFsH9d1xHnKTiaE26zA51avm5pQtScJ03Chh+jRh1OMzHBzPFO0X5ICfvsHWSyC185aZCdbQdD98zD9+v90S+dR7VjE1Guj3dQQlz44WgkvmFUAtckqfZ9f7cJwmCo0vJSImnuE1NCBPNTsElXj5952+DvLVDFeRrd2rt8uFh6uwkiecXYcJUWyZjoqYk60aQmr4wNJf9JVEw/r8g/VqBtZ0awvsMy/0rTWK/4W22/J9HkRj1loQBAsPd9lvshHy94p8JRHeG2ZILvr9n9X5O7oEq9RCyKf0iK8fXtN8OYRV7ATeYfmJS7p+48Mlr0N7L6u17xT2SDDIKM2SrESNvAoRLTxaReHE7iQVUKsLraOlm8HfThvGq5eq65N6Wy0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(376002)(366004)(39860400002)(136003)(346002)(478600001)(966005)(6506007)(6512007)(53546011)(6486002)(41300700001)(71200400001)(83380400001)(66446008)(26005)(2616005)(2906002)(8936002)(5660300002)(7416002)(54906003)(316002)(110136005)(186003)(4326008)(8676002)(64756008)(66476007)(66556008)(66946007)(76116006)(91956017)(122000001)(36756003)(38100700002)(86362001)(31696002)(31686004)(38070700005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ck9sbnVncGU2MG9ZQWR1MUZFdmVGQks4dUdVQ2RzTnpUVjkwWGRWR1lLRWlV?=
 =?utf-8?B?WXVQQkpDK0h6RzFWSlVzZkdRMXZ1OXQyR2UxZ240NGVRTWpVN3ZDWHFWWEJy?=
 =?utf-8?B?NE44eEc1NzVnNVlJS3EvT0JoaFMrZVVHMXUrcnpuRURjYVF0QXZSU1laN0Y3?=
 =?utf-8?B?SGFiWEZ6OXpxcWEyUWFVcy9kVWlMWEFxOFI4b21LTVVTZDFNTGVWQkJKZ2hG?=
 =?utf-8?B?MUphSnBtaytkRWNveXpNUGtQTXZnSzNuRjA0dzRFdGNXUG1RWElxTlhRRDQ5?=
 =?utf-8?B?NmFMc05Ma2Z6blFwaWdOUDRIVUE0S0Z5VWRBT3FqbC8zMDhvSVdUTzJQcW1C?=
 =?utf-8?B?RDZjMEZPMTFFdnlYOHNxdU92c3RUc0tScFV1dWxQbnpsMUluT3BHbzlRNTFU?=
 =?utf-8?B?UHlEL3o3b01IR0orNjlQNmdTQlM4eW5YRWtVVUZnUGxzTDBiQ3BBOFJuVGFK?=
 =?utf-8?B?ejF4cVFGcWFGb0ZtbENRc3U2d0gyWitaWFN5NnJSZFI3MnFGUVcwMzJkZUdC?=
 =?utf-8?B?ekM2Z0I1ck5sa3RqTFk5N2ZsbExqLzRKRHpvU2RyTGE2d3RTWW5kYlhxVFRk?=
 =?utf-8?B?My8yNlZrV2RaWWpIR1JycW1rN3hJKzllUDhFS1BXelNScHAwNFl1Z1ZJSEgr?=
 =?utf-8?B?STlMWHdJdUh5dWpmcm1sRVhQU0trTmNpVWlWMXI0Tlo3Qk9rYVM3K3l1d0pp?=
 =?utf-8?B?TkRpdXZTOXNxSk4veEN4eXlUSDlDQ25PWHMrL1BtM2ZZNFVNRFcrcm1DQ3pG?=
 =?utf-8?B?Q3JZMHVDeGtKRkM3UGF3SkJTbXlmU3VxVkI0YWJ1b0p3UHdUUnpmMXlpR0tq?=
 =?utf-8?B?VnhZK1FaTno2UUpQcmxQd3RPMmEwejhLRVN3aXl6akNkWitja2g3cUFWR2V2?=
 =?utf-8?B?TVRxS1Zsd1ZLRCtHZVYwRDVzbmt5dlRWVVFvQzFzNWlPZ2lBUk9RYTlSejRi?=
 =?utf-8?B?Z1NwMzY2VTV5YkxIbUhmbVNHdHRhcVVMa3FwV29BVEJ5am53alovYzZ2VVlR?=
 =?utf-8?B?RHZrTjBoQW1EZ1QxNkpDYXpRbm5zaHQzUHVGVDEyNkovTTRQRFNBOWMwUzNY?=
 =?utf-8?B?aVBDeHNjMlV5a3hPSWo3WVBKQ2pkTXUvc0U5T24xcHRlbEg4MFlveTdxWEtw?=
 =?utf-8?B?RnpDdXZpc1hPdW83MXZjZ0FOb1ZhTTZhbFU5dmx0d0k4ZnlVcW9FYzFWNkdh?=
 =?utf-8?B?a0hLMGdvMVdoMHRGYUdGenhkTUtyWkVHdjZwRzc4a09NY1FFTDZEeGphZFlU?=
 =?utf-8?B?OWptMGtJbFB4eDJpMldVRFI2aW5nR05NdHZzVGVZbGFpcmRwempXeWszQlpK?=
 =?utf-8?B?ZFZqSXVuN3FHU0pkWUQ1OXdBWG1XQTIveXcya1dKekZqVTNNNWJTY1NSZHJl?=
 =?utf-8?B?TkhOZk05S1NlM2NjcjVXZEE5aEIwbEkxdS80MEZKVy9RcjdvV0RuUXN0UG9r?=
 =?utf-8?B?ZG04dS9yR2hhcWVHdEZ0VHZWSXN5ZzM1QmNsZEcvSDRBQTRGcFNXNmkxSkFH?=
 =?utf-8?B?UUdlTmRRRklPSlB6OVVydXBjUENHQndaRXEwSUo5c0xHTnZpTEMxZ2NLM2dD?=
 =?utf-8?B?bTRTNmFHV3l1a1pMeFpnWnAwTTQ5YlhJY1ZvZ2YzWjJDc3VzY0hhcmJxQzRW?=
 =?utf-8?B?WUs3QkdOWVZvNW10NmhiUXo2elR4YmdJcG83R0lmeDJuQTJlWlY3U0ZrUGxa?=
 =?utf-8?B?dys1QlA2enMrSWVoSlkxc3liOHJBWUJjelBuZjlHVC81NDVnb2Rxc2MyTVdu?=
 =?utf-8?B?R0swdmQzZmhWbTZKNGJLTmVpRWVqeDBNTkV5L1FRUUhLZG5aN3VVYXd6R3NW?=
 =?utf-8?B?d0E0ZWNMZmJqK2tBZWFYVmp4ZGdqQm51OXJ0WDk1WWJGR3E1WkxEOHkwQ0NK?=
 =?utf-8?B?LzY2R2hudXRxZXVreUFQR21VQkR0QkhUeDZxdEtWRzdaREk0WFE5alVoaVVl?=
 =?utf-8?B?SnRGUHFXaUtiMHhUY1lVYWo0U3pZa3JSRFV4Qk56QjNNTll6c1BNcks1dTJo?=
 =?utf-8?B?MDB5eWNHdXI5ZXhUVWIraGxRaXJnUHplRzRKOFROV2NEZ0lpNVdmaWxaL1lt?=
 =?utf-8?B?SmVBczFOa090TkFpRmg4ZlcxZGtyb05JUnpUemRER0djN0VuRjJnMHF2eWlO?=
 =?utf-8?B?UVpMYkRlVTMzOEQ5UmdTMWRRRUFlSjhsS1FJaW4yK1hCWlBRRzZFY0dCRkZx?=
 =?utf-8?B?bVE9PQ==?=
Content-ID: <037D7268D6F60D42AE9F45D8276E6972@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 114d58f6-0c21-40d6-8ad1-08da878c7427
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2022 17:57:33.9641
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JeT6MyvtGkHMHU4PpQNFoOfGobb26RqNn6FwCeXidI4gkA+eRv0i4SJlmNRicshnDxCBantDrDS8QaG60XYn/r63cULEDtOyFNlb5Vj8tgo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3555
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220826_105801_659610_D41AEAEA 
X-CRM114-Status: GOOD (  31.88  )
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

On 26/08/2022 17:35, Heiko Stuebner wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> With the T-HEAD C9XX cores being designed before or during the ratification
> to the SSCOFPMF extension, they implement functionality very similar but
> not equal to it. So add some adaptions to allow the C9XX to still handle
> its PMU through the regular SBI PMU interface instead of defining new
> interfaces or drivers.
> 
> To work properly, this requires a matching change in SBI, though the actual
> interface between kernel and SBI does not change.
> 
> The main differences are a the overflow CSR and irq number.
> 
> As the reading of the overflow-csr is in the hot-path during irq handling

Hey Heiko,

Very nitpicky, but I had to read this twice to get it.. If you respin,
it'd be worth adding a comma after "handling".

> use an errata and alternatives to not introduce new conditionals there.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
> changes in v2:
> - use alternatives for the CSR access
> - make the irq num selection a bit nicer
> 
> There is of course a matching opensbi-part whose current implementation can
> be found on [0], but as comments show, this needs some more work still.
> 
> 
> [0] https://patchwork.ozlabs.org/project/opensbi/cover/20220817112004.745776-1-heiko@sntech.de/
> 
>  arch/riscv/Kconfig.erratas           | 14 ++++++++++++
>  arch/riscv/errata/thead/errata.c     | 19 +++++++++++++++++
>  arch/riscv/include/asm/errata_list.h | 16 +++++++++++++-
>  drivers/perf/riscv_pmu_sbi.c         | 32 +++++++++++++++++++---------
>  4 files changed, 70 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig.erratas b/arch/riscv/Kconfig.erratas
> index 6850e9389930..f1eaac4c0073 100644
> --- a/arch/riscv/Kconfig.erratas
> +++ b/arch/riscv/Kconfig.erratas
> @@ -66,4 +66,18 @@ config ERRATA_THEAD_CMO
> 
>           If you don't know what to do here, say "Y".
> 
> +config ERRATA_THEAD_PMU
> +       bool "Apply T-Head PMU errata"
> +       depends on ERRATA_THEAD
> +       depends on RISCV_PMU_SBI
> +       default y
> +       help
> +         The T-Head C9xx cores implement a PMU overflow extension very
> +         similar to the core SSCOFPMF extension.
> +
> +         This will apply the overflow errata to handle the non-standard
> +         behaviour via the regular SBI PMU driver and interface.
> +
> +         If you don't know what to do here, say "Y".
> +
>  endmenu # "CPU errata selection"
> diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
> index 202c83f677b2..e6101eab25c8 100644
> --- a/arch/riscv/errata/thead/errata.c
> +++ b/arch/riscv/errata/thead/errata.c
> @@ -44,6 +44,22 @@ static bool errata_probe_cmo(unsigned int stage,
>  #endif
>  }
> 
> +static bool errata_probe_pmu(unsigned int stage,
> +                            unsigned long arch_id, unsigned long impid)
> +{
> +#ifdef CONFIG_ERRATA_THEAD_PMU

Is there a reason that all the alternatives use ifdef
rather than if(IS_ENABLED())?

> +       if (arch_id != 0 || impid != 0)
> +               return false;
> +
> +       if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
> +               return false;
> +
> +       return true;
> +#else
> +       return false;
> +#endif
> +}
> +
>  static u32 thead_errata_probe(unsigned int stage,
>                               unsigned long archid, unsigned long impid)
>  {
> @@ -55,6 +71,9 @@ static u32 thead_errata_probe(unsigned int stage,
>         if (errata_probe_cmo(stage, archid, impid))
>                 cpu_req_errata |= (1U << ERRATA_THEAD_CMO);
> 
> +       if (errata_probe_pmu(stage, archid, impid))
> +               cpu_req_errata |= (1U << ERRATA_THEAD_PMU);

BIT(ERRATA_THEAD_PMU), no? Ditto for the CMO I guess..

> +
>         return cpu_req_errata;
>  }
> 

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
