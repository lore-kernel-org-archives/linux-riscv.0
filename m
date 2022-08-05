Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B70FC00140
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Aug 2022 17:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DWpLeU3DGJJ3rfnib9AGp8xEFhjCkKZbrEDwFYEPlsQ=; b=Kj/fgzss767Qn6
	jn3xRA6yKQ6OtzFwouD/ZZn5UBhprqJqy5/qyHQSS10J8CkXPAiujwKucnTJLcAZT3WX+c3paY7IZ
	QBaKxG3Z/AUuJqDYFMPa48XUy3xFTMWUg6tIFBplYWA7zdi/KpzgjWnNF9S7jIy1lxDNkbgbN3D0F
	K7n3lWKr4dtQ//E+LMFmC0MNparnWN8AzppLdzDMD5S9dqBDbrs+cCbIlgrTxhJWuf9keskw4iUMV
	LJ1ibfPhx2oXRl3O6l59PQaBQKCdEGmUAXXSv3oWFA3bIb2GRMSho98RndSOiZSbQQsdwsbc/wwgu
	AVipnXQQfT11KRYkL7GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oK1Tj-00HDXW-3T; Fri, 05 Aug 2022 17:51:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oK1Tg-00HDVX-1F
	for linux-riscv@lists.infradead.org; Fri, 05 Aug 2022 17:51:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1659721877; x=1691257877;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=anvkgUne42O4APCZpNYfvy+0OUCSTCe955lutFq5O1A=;
  b=1owhhjk8fr8ZiiZmQ5c3kOz38u+CULksuUG9nQW+5c/qLvzQhexfKp5m
   ZETRllGNeqxBLeF8/Ag+XTAt3uOJWvIESBWzatYTMl6I7H3q85TIAyAMt
   LWyC9Rh6n2RzRjU7TGNidEDUY9eWhlnzFGh1iXgO7nVgvpKsqN4cQfAQJ
   4LHwvOCb0XTQyi0DIi5rmhIbPIRE0fUpjXrJyIY/iyCFgQtRol4E8cPt7
   aUNILRnwFgz0XOr1rsBytu3srH6lt5duJTZv6ilB+g1ytYSwKQ8QyGUeE
   f+nbc5s6uy8LHDDs9BMKaCxcP5NEe6brxvIvOJ0NPIzg8Fx8d0Vgy0L/t
   A==;
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; 
   d="scan'208";a="168044980"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Aug 2022 10:51:12 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 5 Aug 2022 10:51:02 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Fri, 5 Aug 2022 10:51:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hn3jYByfOx+EXwif74o9jGS0q2V/yKyQ8PPucc2+NImI/tN9JzaEx/+Hduk78KT0dQcOv72qm0pJtapdQTVNT2SUEasBs0hfLSar+u2gvNdxhnk4thPrFX/z63myFy9UJ78Rwot43gOFKj8J5BFay0Xpva0taJFOvIMUUqCfaKU5MsUcan1VOg3Gd7lv7gQXyBmni3uSMdN/rEhaae5DEs37Td6i2yDzOfTNGQnlAGIj/rCgzHTrw60G1fDp63LrWD34KU4bNH0lGzJDmyQDKbqUEw38HbHKviLNBVD0bNXELSjy0hZMp00Q4FYLDhab+ERaMK6u8X94A3nVbMaIOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=anvkgUne42O4APCZpNYfvy+0OUCSTCe955lutFq5O1A=;
 b=gzlZjmIvcpI/FW0XJX23Z6Ml7g9GACTf2px54bXLPJVP+nYBtsfp8kqQsMpe0qOworrlG1AplGcvFcNMn4HIOG+upktudGZ7hKsu8NIphZn8gTN4mZKLyskfjAT/WSwr0ZaK9OGtdjZ+QjlfNnVkk6Y+oWF+Ktou5y+CrboukMxQgnIk826L0eF9566rsgkhMYT5JVhhr8SdndhZWN8e4iiCrttY9pTmcjdTThgQhPXU+nJ8buJ/Fn9JJ0NJoxSk1x785q9414LbYSWBuKFe7kuyUhKg+OY9Pj1eTLEkNau8eAxBD46cGj1MqKRX+cXXkPOOr444D9U3b5VEeHXI7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=anvkgUne42O4APCZpNYfvy+0OUCSTCe955lutFq5O1A=;
 b=Zil/PimKT5I1a3O1sut+b4qiZphhY/TqfRkiYcuekieCJz8rq27prUHyuyRbEAFRJNPzEPyQ1s1+H678NFp8AU+lmUg08DUdhIaQrpkOYasBjCEPSi5NOLT2i4iNoKE2+s8gvoApJmSQ6cNWdyXP4Ux0myQ2jxm8/+zGFHTLVcM=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SN6PR11MB3312.namprd11.prod.outlook.com (2603:10b6:805:c8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Fri, 5 Aug
 2022 17:51:01 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5504.016; Fri, 5 Aug 2022
 17:51:01 +0000
From: <Conor.Dooley@microchip.com>
To: <palmer@rivosinc.com>
CC: <airlied@linux.ie>, <robh+dt@kernel.org>, <vkoul@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <daniel@ffwll.ch>,
	<thierry.reding@gmail.com>, <sam@ravnborg.org>,
	<Eugeniy.Paltsev@synopsys.com>, <fancer.lancer@gmail.com>,
	<daniel.lezcano@linaro.org>, <paul.walmsley@sifive.com>,
	<aou@eecs.berkeley.edu>, <masahiroy@kernel.org>,
	<damien.lemoal@opensource.wdc.com>, <geert@linux-m68k.org>,
	<niklas.cassel@wdc.com>, <dillon.minfei@gmail.com>,
	<dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <dmaengine@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v5 00/13] Canaan devicetree fixes
Thread-Topic: [PATCH v5 00/13] Canaan devicetree fixes
Thread-Index: AQHYkLmL7CYc+NRsR0eTQHc1KpCiaq1+edOAgAAB/ICAIkqWAA==
Date: Fri, 5 Aug 2022 17:51:00 +0000
Message-ID: <338e4fd5-9d6d-6f83-30fb-3ab3ed0ead31@microchip.com>
References: <mhng-85044754-c361-40bc-a6a2-7082f35930bb@palmer-ri-x1c9>
 <e8d235f3-fdf0-891e-1f9f-387c6e6af7da@microchip.com>
In-Reply-To: <e8d235f3-fdf0-891e-1f9f-387c6e6af7da@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f3c1310d-4abc-4a92-d7ae-08da770b0f3b
x-ms-traffictypediagnostic: SN6PR11MB3312:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MJ0iLZD8ISjfOcZBEuUqXXkbAvfE7e6uM04V863unGJ2fwt5h0DrUMyZhY9aNu51bvz1e96OB41MUbdOuMuPRfWzHHNgC3xDtbshMYoqpbg1zPqvGtOnw2wF6puEquAixwns5bbUMh410lMFq3TpIm20cgPcGQwRvIZ4k82NaqqD2zqGHEgPZ2IxytmRmYbVFGXcF9BadWJGjeH8Ucv8fcuPIW1b3O2LUcwdFpgDyfpbqDbNldVRGA15snkqFvSXXqVujs8YfFJ/b2QoR091KpNn12XPKqR5THDnXF+Iaz9I4glMX2GayNVZxU4jHKOg5RY18UYOh5F8b+VaX8bkTUxfDpGKPkyR8A4kRzpcfnDtIRyfpv7y8aHhJV3tPGng1/BP1Un/drnfbWcLyMOGX3BPIwSTHK/hqsO3BnWNr1xHdqlDh8TGJ3Gz/Z+mLc49pjpUsToTGm61hX/h6+w1RWGIHW5LUs1ViqqiRaRfftC0U1bfdYiS7hLMY3NN2I4yFFcXro93h5Fup2Ajp8JFXE4Ut02UvYz1rDsgfuh2yvvjT6bmHvJL3X7NR2cssDRxvsQkMrbkU1PN3fAp/VYHpjQd5gICP/uTh0XPS8WCTJq6n+wIQOM1+Ze1xsRNWxg7IgLIpKjve7jYphXDg1FThhjyW4buJ0hZ0P8+RQkbD26SDnMb0k0OODwikSKUvU4rychNuXIjSk3EGAVD5eS4D4MZ+kLalIDkVVY+JM4ZKtE+NduigQLPfeCY6gkJg2d0Z3QF9/HEaLhGViQwSfqwdTDZQ8rKL3LlGzZjdZ8gPjtwlttMfs7FlYOwLtV7bC4UF0iMx2gBPWUbgpIpl1oBWR7B+TQxOdlL0spKPMUHO/c=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(376002)(396003)(136003)(39860400002)(366004)(8936002)(2906002)(38070700005)(122000001)(38100700002)(6486002)(64756008)(66446008)(66476007)(66946007)(91956017)(66556008)(316002)(54906003)(6916009)(76116006)(8676002)(478600001)(2616005)(186003)(41300700001)(5660300002)(6506007)(26005)(6512007)(53546011)(71200400001)(7416002)(86362001)(31686004)(36756003)(31696002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q0krUEU0Y0l4TzNiWEY0RkpaeWNaRUN3U1B4VVhlRUFKM0lYVzQxS2RKbUk1?=
 =?utf-8?B?YVBRSS8zUGZJTW5DRk9jTXpKQ25nZ1NvREcyai9pdnFyZ0lVQW5UUFJiQTFC?=
 =?utf-8?B?Z2xQTTJtam13VzZEU29LODdZUG4zLyt5MW9LL1lOTFFrRGNvMXp3aHloOFoy?=
 =?utf-8?B?QjByWm1MdFZyUEVhMUpwU2RBejRZQ3p3OU9VUFo4NkZBVVErY1ZMaURVU05x?=
 =?utf-8?B?azhUbTJQOWsyVGdMVHhEaDQxZUJsUHJrTHVlQW5PZURqeGxTMWlMM3VaYytJ?=
 =?utf-8?B?c1lCNG02c0tFMGZ1N21DaWFNOVhTS0xLcTMxV1ZiVWMwL2ZORFgwL1llN0Zp?=
 =?utf-8?B?NHNKZ3lvMjlCU0hkU2RMV0FUY3NMRlJSSk9hM3d0UmpZTnFhMHBlZUQ0RWgw?=
 =?utf-8?B?RGZpUDU0dDhRbzcycU1KRjl3YUpsQU9tNjhRdko3SGdiejVkM05DaFEzRUJq?=
 =?utf-8?B?V040V0tYSWY5U3JVMEhzdTFQQTJMZjlxQU0ya2J6SWl1d3pUWlNsQThpeWRS?=
 =?utf-8?B?ZWRlTTI4Y3BXWVhLMFNSVmcyMk5HTnM4SGNBdE9HQjBRU1E2M1ZhZzlWRnZx?=
 =?utf-8?B?bHR6cFlBZGtwNVFsQ3F4ODZJY29uWENsWk5vYkxiZzNZaDRQQ1ExQktZekhZ?=
 =?utf-8?B?UHJ2bUtaVmo0Sy9BMjMrbFV2a29vNXl6NlZTa2RVb1FDejFONGdaMFkyY2Zr?=
 =?utf-8?B?bkUyU0czVG9Kb2l3ZjhsVS9LQXNpSkFnLy90WVdKakhkQTI2dFE3NzEvWXpE?=
 =?utf-8?B?SWF3U1J6N0Z3SDhQRTJQM1g3UUt1eFc5Q0gvZUNrVG1iVWduYjZyTTVTNk5E?=
 =?utf-8?B?bmFyNkN0MWduRzF5WnlWNjFrcldzamZZd1RudGZhblQvdG5tZHV0ai9Qd2d5?=
 =?utf-8?B?RW4raVJWVWRoYWQ1Q2V3d3hNZXhIMmRKOXhPS01hTWpWcE5WZkVLUXA4K3Zi?=
 =?utf-8?B?OW50MGhndzRkWHdEazE1MEs1eXg3ZW5EdkFIVXFCWkR3aDRtM2JRc1FLRTlV?=
 =?utf-8?B?Y29NSm0xL095andPcFY0RGtTOUlPRitJbUJyYVNVb3lwWEZJSnlRUkNkT1VC?=
 =?utf-8?B?czZBamw3THpNYzF5MEM3K2RSWUVKREhvZVNKYzV4SEtqZHY3aTlvR2h3MHFV?=
 =?utf-8?B?ZkJrOTVtSm5HRVEzWE8yamw2WkFGdVpmM0lhNjc3VGNwRHh4UHBsSmlnOHgy?=
 =?utf-8?B?N2RTVDBaQjZpR20rKzYreklzd2xaUFcxc0RNSXVMeDNoaFdnTFh4Y2J3NkNi?=
 =?utf-8?B?SnZTU25Tc2NuWFJNalNjanUyMnNJUlJzemhlNnFQRGQrNXhqd2NoSVhZTGRr?=
 =?utf-8?B?ZjFIVjhNajJSOFRMQVo5ZE5nbHQxc0FVblNWZHhWTUNJOUhZY3lsVjd0eGRv?=
 =?utf-8?B?RHRwRThodFNjSFFlWjJrS0gwSlNJUkRtSW1oMm1NaG5wYUw2ckhHTEhQN1dj?=
 =?utf-8?B?YjJqTWJ6UE9ybk8vWHZQazNJcFpjVnM1YmJLc1IzN0FMYmtoZnYzRm1qNTJo?=
 =?utf-8?B?WUxRTUxhQ2NXclN1VG1jNitrYjdJSGpha0lFQ2NlRDM0NGJTWWl6QXJMK2JV?=
 =?utf-8?B?N3o5TVRoLzNPKysvcXVCWmJwb2o3RW9nOXlzais4dFo3cXQwL1UxUmVyTDdY?=
 =?utf-8?B?VWk0VHNYRE95bGh3MUQ4Q2E3K1RXVFdiTUZoOFp6Zkl3ckhRcFhhdGpSOXFv?=
 =?utf-8?B?YTRSWDlDeTBEWm5lR2hyV0Y0bWFnL01MOER6R3hvbUhmMGppS3dnUUZ2K3JZ?=
 =?utf-8?B?K0txOGlFQU1wRWZERTl0WFdxRGJpTUtBV1lOQ0hKU0JHMWVuSHJLQ1JNaHBj?=
 =?utf-8?B?RC84dEZPL0lQajdTbnhFSkxaaXl4dmYrK0VUUzRLOTFQeFdzRm5LZzErTFJ1?=
 =?utf-8?B?cDgxbEN3VGU1Y2dsUVJZT2RNUjAyM2VvN1A0bXBKZDVoWjdKc3BCK1Jvenhw?=
 =?utf-8?B?aUU0UWdNZ0wwcVMxSWNNSkVXRWtCWmFIWTRJaElUMlBsS1IvdkhTMDFPVWMr?=
 =?utf-8?B?djJ0TFM1ZWdPUzBhT256cTZseVkzWWtWNldGRkhhbEhFd1UyRGVwWkQ0N2Yz?=
 =?utf-8?B?aWhIdEd5blI5RHRYSGJkUGsxSmhGM3NsMFRxMTZDMzRXaUJWNk1YNVA2MSt1?=
 =?utf-8?B?aHJKSWI2UHFpMnZxQTI0anBXeGs4N2p1L1hJR04xYjFET0ZocWZ2eDVybzZy?=
 =?utf-8?B?NWc9PQ==?=
Content-ID: <88708D333B767244B3938B29C8407FA8@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3c1310d-4abc-4a92-d7ae-08da770b0f3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2022 17:51:00.9803
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mIammqRKTLwBawntoXDqJXFX+WsCfVzSESlSLYLPdj+bOC8Vkw4LKZuIfOU9Os585pZ8n/1/YtjcvjaPvvREmr4VbHBpB0spkrQDt1smgCg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3312
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_105116_168469_4B74BCFD 
X-CRM114-Status: GOOD (  16.80  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTQvMDcvMjAyMiAyMzoxMSwgQ29ub3IgRG9vbGV5IC0gTTUyNjkxIHdyb3RlOg0KPiBPbiAx
NC8wNy8yMDIyIDIzOjA0LCBQYWxtZXIgRGFiYmVsdCB3cm90ZToNCj4+IEknbSB0cnlpbmcgdG8g
c29ydCBvdXQgaG93IHRvIG1lcmdlIHRoaXMgb25lLsKgIEknbSBub3Qgb3Bwb3NlZCB0byB0YWtp
bmcgaXQgdGhyb3VnaCB0aGUgUklTQy1WIHRyZWUgYXMgUm9iJ3MgcmV2aWV3ZWQvYWNrZWQgdGhl
IGJpbmRpbmdzLCBidXQganVzdCBmaWd1cmVkIEknZCBzYXkgc29tZXRoaW5nIGJlZm9yZSBwdXR0
aW5nIGFueXRoaW5nIG9uIGZvci1uZXh0IHRvIHRyeSBhbmQgbWluaW1pemUgY29uZnVzaW9uLg0K
Pj4NCj4+IFVubGVzcyBJJ20gbWlzc2luZyBzb21ldGhpbmcgaXQncyBqdXN0IHBhdGNoIDMgdGhh
dCdzIGJlZW4gdGFrZW4gc28gZmFyLCB2aWEgVmlub2QncyB0cmVlLsKgIEkndmUgZHJvcHBlZCB0
aGF0IG9uZSBhbmQgcHV0IHRoZSByZXN0IG9uIHBhbG1lci9yaXNjdi1jYW5hYW5fZHRfc2NoZW1h
LCBpZiB0aGF0IGxvb2tzIGdvb2QgdGhlbiBJJ2xsIHRha2UgaXQgaW50byByaXNjdi9mb3ItbmV4
dCB3aGVuIHRoaXMgbG9vcHMgYmFjayB0byB0aGUgdG9wIG9mIG15IHF1ZXVlLg0KPj4NCj4+IFRo
YW5rcyENCj4gDQo+IFBhdGNoZXMgMSAmIDIgbmV2ZXIgZ290IHJldmlldyBmcm9tIHRoZSBEUk0g
c2lkZSBhbmQgcGF0Y2ggMTINCj4gZGVwZW5kcyBvbiB0aG9zZS4gSWYgaXQgY29tZXMgdG8gaXQs
IHlvdSBjb3VsZCBkcm9wIHRob3NlIHRocmVlDQo+IChhbmQgcGF0Y2ggMyB0aGF0IFZpbm9kIHRv
b2spLiBUaGUgb25seSBvdGhlciBvbmUgaXMgcGF0Y2ggNCwNCj4gd2hpY2ggaGFzIEtyenlzenRv
ZidzIGFjayBhcyBtZW1vcnktY29udHJvbGxlciBtYWludGFpbmVyLCBzbw0KPiB0aGF0IG9uZSBz
aG91bGQgYmUgb2theS4NCg0KSGV5IFBhbG1lciwNClRoZXNlIGZpeGVzIGhhdmUgYmVlbiBzaXR0
aW5nIG9uIHBhbG1lci9yaXNjdi1jYW5hYW5fZHRfc2NoZW1hIGZvcg0KYSBmZXcgd2Vla3Mgbm93
LCB3aXRob3V0IGFuIGF1dG9idWlsZGVyIGNvbXBsYWludCBldGMuIENvdWxkIHlvdQ0KbW92ZSBp
dCBvbnRvIGZvci1uZXh0Pw0KV291bGQgYmUgbmljZSB0byBjbGVhciB0aGVzZSB1cCBmb3IgNi4w
IDopDQpUaGFua3MsDQpDb25vci4NCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
