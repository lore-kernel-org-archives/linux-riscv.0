Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22006C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Nov 2022 08:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gzfP/N42ts8YLHPI6yiteekeZpGOxjrxexm0K95jPQk=; b=mPIHejV3wkrRXo
	7sjU4gm5JMlZkC8ApDyno3/vN93CDZvmFvOSiFsh3wNFUEnMtF7y0b6JuYMD+dgGW0QtES5e/EVkO
	IPTttPr9SYNc7Exu3H+ve5CklHXbm8+vHPq4Efz2HSK+irdIjrRWDsEEOV271KFvLmp4yHXTX8a5X
	jg7u3v3w8XNXUnvhjAbtIMf/qvcmvUItvWbTXFFpYXmRF8LJFXMTebFx/68BsvGXfcsAl1BC2ZXHk
	N9WTcUJtJ37m7qITQ7jFueCH5jIhFft5+ijO+vnFEwJ9hhGC5UbJi/fyYvdHkZwhwefZ+C30hR+Yo
	TQs/B2Annjs9ctpQkMYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxOq5-006Naw-Po; Tue, 22 Nov 2022 08:41:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxOpy-006NTF-VM
	for linux-riscv@lists.infradead.org; Tue, 22 Nov 2022 08:41:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669106462; x=1700642462;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ztx6cwsSc7OJg2KpVwho/114uqS+JntSzV0OQ6bQhKw=;
  b=0GFnr4/6kyXau1gWDapBl6tyfb20zdlNOAL/vXW97AnIq7iP2nFqNSUZ
   PQ8ULiugAZ5u6JafnnVXmL51TJU3oq3UyXZWEfLbSbb098mkibNZfPhTw
   oxJR6cNh43LahoUrML6DTYCKSN4t4f52bVM2YcDIKAJdplqhjuDOrBIN8
   RC+qMUsMIfX1N5ASALDpmOPq/iLJlLoj3PjMe3ERsK2aDhx9jfM7I5gWV
   kYPvooFqweA3+RcVgmkzL5g0JSmJD8Vea2xEn1L5strjAJW9TBqnn0YOk
   o8ixSOQu11/kBPjs8xaU5eyoVDs62taZpwnrUdzdoI+oR5TiY0T5+dJR/
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,183,1665471600"; 
   d="scan'208";a="190051564"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Nov 2022 01:41:00 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 22 Nov 2022 01:40:58 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Tue, 22 Nov 2022 01:40:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UlW55UF21xcf4Qnp9dkBLyDJtxzndVv0NSg9FkxBNx/aO4hzTnYMim/L7W3l4Gqlixm027nNrmerXQjkqK3sUSaQZmu6QvvJg0tqTrqH72AYXzLpEm4VSLH4wcJ4YTS4BgUnMpccTVH+yQO4PXnUZp09KghmFupUmXTJeqmEeL4OKtztwNm8UOP7EQGx0FC2kslOinY2OHHRkLcLI9dp1grthOYzFHC3DHqc98YW4t9Rh2D3KczbUoajalh9PLVZvE8b0+5cxoQ8te9Vr+nE3d7j2aQvbPsLDhqJc5X9yIlxrYpDZSGEpoeOmCuWxr9Ps1RRGD1uUdeXFhVI6bWwUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ztx6cwsSc7OJg2KpVwho/114uqS+JntSzV0OQ6bQhKw=;
 b=PXG+LGuyTLJBLYG3GfLTNeG5wJxZY0B9X1s+MRLSQ7ArQ4V4VlN5rNxBz/uM2nzh7NUblWOFIiH5QM/1CsQafAIOUsybGuggDCSBwVCdnYaAv4YLjA9YffT0MHho7rUOhDk8znFjBQvQs/R8kpPYVippVZaen53D8SAN9vaoAJwr/2zS1SWmQg9k/tAd31rxqS/Qdju7I0YUnv/RWUKQRO5qJyhFYfOEGUOT3JfHgMIGd9A2WZzp5CjLMrgwhpD64OkYNEPm+rUcR8tH0WZq/Y4OcLji4O9+oRQkJRiQfMq54IA2HOqTaG9aK1WRRNuRLXXcnS73u8P3jKb62FaFiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ztx6cwsSc7OJg2KpVwho/114uqS+JntSzV0OQ6bQhKw=;
 b=Tt4KSPZd4mcB32QN/GyafiS9cZOcuZV9/rlQ8kBieaMuTg6WM/eFmbfmow4mT83qg6C3pAjdOW0c/68XLJaxLek6ONkfPZg2MBV5o9HynY4/AnsLPsaFyXktDYEqZQQh9COFdI04Yog9OfVpxGktvfTzp1WcRCjT2V8YNtNP9Dk=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SA2PR11MB4793.namprd11.prod.outlook.com (2603:10b6:806:fa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Tue, 22 Nov
 2022 08:40:56 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::f79d:bb4a:e2a1:7bb6]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::f79d:bb4a:e2a1:7bb6%5]) with mapi id 15.20.5834.015; Tue, 22 Nov 2022
 08:40:55 +0000
From: <Conor.Dooley@microchip.com>
To: <geert@linux-m68k.org>, <conor@kernel.org>
CC: <linux-riscv@lists.infradead.org>, <arnd@arndb.de>, <hch@infradead.org>,
	<damien.lemoal@opensource.wdc.com>, <emil.renner.berthing@canonical.com>,
	<heiko@sntech.de>, <palmer@dabbelt.com>, <samuel@sholland.org>
Subject: Re: [PATCH v1 5/7] RISC-V: stop selecting the PolarFire SoC clock
 driver
Thread-Topic: [PATCH v1 5/7] RISC-V: stop selecting the PolarFire SoC clock
 driver
Thread-Index: AQHY/fc3sCZzfN8xW0GPzGMEOGBRJq5KnusAgAABWgA=
Date: Tue, 22 Nov 2022 08:40:55 +0000
Message-ID: <c5fbb518-417a-68a0-4fa3-4fa77ba16b80@microchip.com>
References: <20221121221414.109965-1-conor@kernel.org>
 <20221121221414.109965-6-conor@kernel.org>
 <CAMuHMdX+jcxJ3owbxtSk9KLjtLeG1g29A8SFdH-F9PQ56-7oAg@mail.gmail.com>
In-Reply-To: <CAMuHMdX+jcxJ3owbxtSk9KLjtLeG1g29A8SFdH-F9PQ56-7oAg@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5154:EE_|SA2PR11MB4793:EE_
x-ms-office365-filtering-correlation-id: b63fa234-aab4-4305-2035-08dacc6545b1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GvoNXP0vyWfZCZB6ogmFnaBjh6gadnn6Cd/RepXFfKEVTCLDq56Ww4Bqey0SmI/YZzltP3pY6GijDNT0LooG0mqfYJTQeIVCZum4oKS8zCr5GHqOVBJh7EvbXyNWe+3gI+x8GKVlZYnFWrsA/l5oTLNyiwM7/npptsvfxDI1mW8jMNdNRa167+vJnmcVujYECItkSgMZP1XH4HHldV1lLYR5N6MsG8NJC99E8UICvZRqMTydYG7MTG9RJy7JFZeRU0WplV28YP/NqBcvM/B3yFtPROPuGw35Bx2qORFHTJvp94SaJKVbh2elXocCP9cZMjrOwTtCCVniLuk7cnOgtclSd3a3DruP9W0au1bAiW1biypTFvI7ZVtPdpqi1q6G9tFx96+8hIMqmD1KoIKQvl6+Xh6DLhO5DlmFe9JpRJJnW/R/pq30AK9y0WiuQC00NkAPatUZpwr0OhSXgNaL/KmLgonA2Rpi4LJpLQrkUL+LwNx6MM0N25bUXMQvREyFdlS2As+a8bYKRtBI454U5Z4CejOxzIW2Eh++LiKAO5lXVIsYCgDzySMMHugRneHC4NLGvfLCD971McO30Aj1FnXhPrY8CIdTpOIACK4F9q4igChY1EEbs4jxZnYSWgbNCa1R31C/+uPrj/qoJf2byZhkQluZmmFF4Zb9wBzkGCridU42H3vglR8058ECe/+S4RAyXczeLBhe+z6M5PPZD64ytiP/uNgxkcJMvZ47ZHKK2BImyswMYVn+UuSwKlS4bzbsi+pUal/ZAaO9lnDzhA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(346002)(39860400002)(376002)(136003)(396003)(451199015)(478600001)(38070700005)(6486002)(36756003)(83380400001)(2616005)(186003)(71200400001)(26005)(5660300002)(86362001)(6506007)(6512007)(8936002)(53546011)(31696002)(41300700001)(2906002)(31686004)(4744005)(38100700002)(122000001)(91956017)(54906003)(110136005)(7416002)(66476007)(76116006)(4326008)(64756008)(66446008)(8676002)(66556008)(66946007)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NnJ4b3Q5ejVUQlNGUTlqL1h0d1lGZzliQTMrSUQ1eUFPa1BYVUY1ejBMNUlD?=
 =?utf-8?B?VC9uRlZpeEYyUGJXQW0rMldsOEhHZUlYSjJZTWxkZmViNzBNTTdyeS9Tcjd2?=
 =?utf-8?B?YmxPcUErTkNrS1RsRjU1VmVqLzhPak12Vng2MHNDUlJQeVVaU3NtaUZxeXBR?=
 =?utf-8?B?VTNDWEFtbXF0aTFUckV1eEJETm5KTTVxN3B0ejJQcVkwdlpONGhSV2NZeDRw?=
 =?utf-8?B?OXZIUWREWTI1TktkUkZETElTYk0zR0lXY1FPNXVzbjFxOUxaNW9NVXFIRXQ5?=
 =?utf-8?B?VlhWUThTcnphbG8rangrMzJqcGdmQUNiN09HRm9RS29qZldsYXdDM1dXYzFN?=
 =?utf-8?B?cTJlZ25QRmxDRk9DbTdwa2hkVHBLZFRwMEpzMGdEbXB2Z01YYW5GeXhCQW1L?=
 =?utf-8?B?TEJwL1FRU3JDUTJ6c3NNMlpGeU9qeWU2eEI1R0VJT21aUVJFaU10U2ZIWStl?=
 =?utf-8?B?VHkxR0tOZWI0REZEWEs2RmdoZmZZTjI2Y1pmR1NFSk9qb2UwQ0gwcUE1VkZK?=
 =?utf-8?B?QTFjM0JDSGxtZ3haVzVVZ3V5aTdTMUZobU9mMG5ZQUpsNi9EeTZKYnhqdU1y?=
 =?utf-8?B?SjZsK2diTkl5Q0VGZ1VoWnQrYm1zSCtvTDk2V05ldFlnSTJSRzhHSUlBb0pJ?=
 =?utf-8?B?Yjcvamx1bS8wOEpNNS9nTVRNaHlEOGJnWnZMMlZxTEZQUlpnUW04elZCVG1N?=
 =?utf-8?B?TEh4Nm1iWjJhWVJKL3RjUjd3MU91bm9oeGdjam1LVFR3L21PNkVqVXhkeDc5?=
 =?utf-8?B?dzdjUXdoS1B4Z0hEOWwvZFk1UnBVcUNVRDZYU0N6VDdmOFNnMExjVTJlRVlB?=
 =?utf-8?B?TDNoUTVvUi9GanBIdVFNWmV1SW8rV3BCNVl4RXdzNkVwVkdEOGV3cDhYWkdD?=
 =?utf-8?B?Nm90NG9OdTVtMUZsQjJTeWg0c245bE0rbTAzd1JxY2lhaDNrV3oxTU8wTFJy?=
 =?utf-8?B?V0VMTXEzNm0xTW9RbUdQblVVek5uM2pUSTdqMUdTRFpZeHhhdEdocFI0eElw?=
 =?utf-8?B?TjhFQktiM01iQlJSUWlmOE9EMytWYUpTV3BjeWxLdzJydHAvMjlQTGpPelhR?=
 =?utf-8?B?RW5WeTcwNHhmcFBBV3hicXY4c3J4QXBaZlNYL1NWNHZkdDRabStjOVdjTDhi?=
 =?utf-8?B?RHBzVWExbTJlclVQY3N2ZGFVOVptY0NBVXNJVTNlSHIvL2ZxVVVwQ0ZoSjBn?=
 =?utf-8?B?NXRZbXBhejhCTUJ3ZkI4Rm94RTR2VXl4WTYzcFZxUmxYVnVqdWdHeER2ajVY?=
 =?utf-8?B?SUZJOGRGcGs0b2tBNFlDbzQxNG4zM0pzUno0MkxLRlNOR1lacXMrbUhQUitC?=
 =?utf-8?B?TlJ2a2dzdUs1RlpocHZtak5YbUxUcnA5eVRIVmgwbUhxY2JkdHJpQkNKTXBW?=
 =?utf-8?B?bnBuRWppbi9Vdy9mQ2FGaEtMcmt6MFRJL0dvdDJxK2lQZVpZSDhQOTFTemlG?=
 =?utf-8?B?dDd1OTNUaFBHMFZieW5sUm1uNk45c0EvcFZLMGdxNXg1K0NQaG9GNG9OYUNT?=
 =?utf-8?B?d2RsSXAyeis2SlEyVStSSkMzVW1QaHdXNDBvQWdycWV0UHlXdWk3TmtubGh1?=
 =?utf-8?B?UldaWW9tTUpPb1hGUFNWbU5TdnoxOEtzYkEzYWRQeHZsOS94N0hXbVFySVRU?=
 =?utf-8?B?S3NUa3R4U01xQmVkUk9QdVFXNFJrQmZNR0grZkp6S2drdm9QaWVocUIrMGY1?=
 =?utf-8?B?dU8zZTBJNVVQbGJMVDB6MjhPdlVjNlBTZW1OcXltV09KdnN3cGE3M1h4Vm9m?=
 =?utf-8?B?OUp3Q1ovT0k4aHF1TzNnMnVGcWo2VnRBSndwZURDWHRlNVBBQUhlRm5BNWpB?=
 =?utf-8?B?anF4NTdVRE9IVW9NYzJSQ0pCRGZqOS90U1ZwVUwxR0NNd3pDN0RYOUdGTm8v?=
 =?utf-8?B?MkhVSWt0T2JiaXIvNFEyNm4xTVRPeFN6M2ZPekt1OE94aDZrZ3VKRWV6T2wy?=
 =?utf-8?B?RG9PdWxESjdnNENXWm55YUlaVGlFbGtBeExmdUF5NjBzTnBOUHZyZXJuN3Q0?=
 =?utf-8?B?d0ZuR2N5c1djdHNGUTBqQWwvR20xMVkzRXhaVGE1SEUrZVRncnczeWQ4dVBq?=
 =?utf-8?B?cHR2azRQWU9MZ1o4WTZGUVVodFB3K2pzUDFxVVUyTVU1SStGTSttZTNIa3Ns?=
 =?utf-8?Q?Rc1r5AJc3A/DGaBlwCLYj8bcg?=
Content-ID: <2A01F02A8D50D8479A1F0537D12C5D35@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b63fa234-aab4-4305-2035-08dacc6545b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2022 08:40:55.9033
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kSdmmH33LuniEeyL2iPlFaYL9NQBHKpTQWZTs3DccpsF35nqBYcQrjHksuOD7rsf3+9+Sc10rbcGdEzX5HnL1UmhFBEaIz+Dv7qfvGUprdg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4793
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_004103_388465_C5353C11 
X-CRM114-Status: GOOD (  13.52  )
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

On 22/11/2022 08:35, Geert Uytterhoeven wrote:
> On Mon, Nov 21, 2022 at 11:18 PM Conor Dooley <conor@kernel.org> wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> The driver is now enabled by default if SOC_MICROCHIP_POLARFIRE so
>> there is no longer a need to select it in Kconfig.socs
> 
> Where is it enabled by default?
> I cannot seem to find that location...

Huh, you're right.. I could have sworn I had submitted a patch for
that but it turns out I only submitted a patch to make the SiFive
clk stuff default on. I suppose my defconfig has an explicit set in
it and I never noticed.

Thanks Geert!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
