Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C760C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Apr 2022 13:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=APi5ufXBK6KvusBkkL/zVBy2u5XOWgRTQJGFM42TI/E=; b=kVHWa+k8R8Jufn
	QkBFsuCi9lgxZ2FXLoUC1qooB5yhVXY/uwUaF6g519NHlB5nx1jjzbojc/n++7qh/lxvO+0zjI5kl
	1SphG8sf7HRsC9IgK1ta5rdccywQs3uhxnMRc1eST8sAs5odwt/mkwwsgobZ6VRLyDNs8CcJIykGZ
	tfXcpqf4JIlM48Zf0SEnBYcbMb/tRYnT0JUAGCsAO+lWxqzED9XOsAqHE1VEX8AbxrLLRoTmspi2b
	OX8fgKyuXxDw2UWirs3jkfoXIDLd235ydckvC7LuUVFjrCpkgCjXqrz1YbS2/dEWMmz58nm4A4bL8
	V9jsp1ScxMWbLMA7Jmdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndu2p-0099Cc-G2; Mon, 11 Apr 2022 13:25:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndu2f-00999j-CN
 for linux-riscv@lists.infradead.org; Mon, 11 Apr 2022 13:25:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1649683517; x=1681219517;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=6N+NsFsKt0nqXYOsrX9XHv74oBnoAwjbYgz7iLQrCTI=;
 b=vQbvr8nfgHP5Y193lTGHheMiDMo6/XpWxep2PeUIXN+LTdAlT1Mwgugq
 hTrf5rY7Jsj8H0qB3VdOqWp4tDGfn/4uhe9ZOxG3F/81lzBnUHvpzuaUg
 I+/K8z990j/wiWZeHzuNGg0RrM757ATRi5YAu8WhSr7FE17QFSDHMsTQw
 4YmL3jOgI5/E56iMGcFlQkmE43tviz6Q2AL6NckHgwBMfQXzXw09Fdwx4
 Tk+/nXuinRzrxHBceH1ATWiV6usoRVb6I4PRjWvv8IukNacWmiAPdU9Io
 KORFjpXYGWJpC7NgnMlEoVxGEijRRkNQtegnSJAxKjEuDCvd/tWeqLSH0 g==;
X-IronPort-AV: E=Sophos;i="5.90,251,1643698800"; d="scan'208";a="169175744"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Apr 2022 06:25:16 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 11 Apr 2022 06:25:16 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Mon, 11 Apr 2022 06:25:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RPtLFxk2j4tYqPqxXuvAgNGY799OEiMJIpOSzi5kkDhkn3puRVDS0Tm+GRAtHPk1Ee3mb4XdbZ7rsT3Y5hpGU8cRM/He8TXnFntXq7+Qrx9bMJx9BnUT9kmhnNN39bT5RODv68c2V+EaLuBTYbEUcoP1VnlmIO35MxNlli+Gind2CBo/liow0pHyTpW3Nfn3sUZywcDKC96f3TPYF4SznkzWEft5n8qH4Hx5U0E3Q06f2Uc9KY2G+1wchFG0z7EHobOL0jGCXl9S/njtRo9BZu2xbfN6o3X6macNgySd/bN6tS7Sw9sbOkV1lvtqfca63KZ7Zs5HJSZHCPWsBBWXrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6N+NsFsKt0nqXYOsrX9XHv74oBnoAwjbYgz7iLQrCTI=;
 b=AsiQnc/FK+rc+n+7h+DgGhJzK0n/kyxVbMVXFqbE8IeN6AU5xDIlSSKaebMwFwU71JXSba1zyEbrbngHYbigPi4SQ5+Emi8MT9aPWy8iNCZQA3w4gsBVl58bZAioFdWZ6GKNBFzncXfxIFZ0foYWd3yDcggeUTAmGrnLOhZ4f8jtaEpG7Yn1T9MsA5pLIscMvuM+8hHF9TrPwhu1xA1kZ3vzlmGNxpRS/lE6z+DMpzs9eDbPh0D733BMHLFHTaegJi+n/4QvGrm6L0Xeg5+CeCzM1q1JzPvbHgWINxaDw+kvAkRja8xRH9El1l6SjrDpH17Vx/GrvSGFbAZLW/LbDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6N+NsFsKt0nqXYOsrX9XHv74oBnoAwjbYgz7iLQrCTI=;
 b=WN7STFoZ5l13OFrasQ1+i7HmqgKQIJBC7ZXaJnUpy/ZPpCgwtgdb3QiZHgH3whV9k4xAyPdbiNzN5Xm/Q8QaTWT+2bQAdXuApHWYxYwHGFJp1Hl/GXLGPBvQAT56HkjSLgqQNB4VP3tbk9SqRSumxfBP6Dfdb22XFthilpMf6sg=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by SJ0PR11MB5938.namprd11.prod.outlook.com (2603:10b6:a03:42d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 13:25:06 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::dc95:437b:6564:f220]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::dc95:437b:6564:f220%8]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 13:25:05 +0000
From: <Conor.Dooley@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <aou@eecs.berkeley.edu>,
 <paul.walmsley@sifive.com>, <palmer@rivosinc.com>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>
CC: <Daire.McNamara@microchip.com>, <linux-rtc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 9/9] riscv: dts: microchip: reparent mpfs clocks
Thread-Topic: [PATCH v2 9/9] riscv: dts: microchip: reparent mpfs clocks
Thread-Index: AQHYTYK4eg1gx8fXXE+CK0jbXT7VJ6zqs/yA
Date: Mon, 11 Apr 2022 13:25:05 +0000
Message-ID: <580d91d4-f716-61f7-5a87-11c9a2240053@microchip.com>
References: <20220411085916.941433-1-conor.dooley@microchip.com>
 <20220411085916.941433-10-conor.dooley@microchip.com>
In-Reply-To: <20220411085916.941433-10-conor.dooley@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 31205013-4fd0-4a30-4754-08da1bbeb141
x-ms-traffictypediagnostic: SJ0PR11MB5938:EE_
x-microsoft-antispam-prvs: <SJ0PR11MB5938B61BCA314ADD6C529AD298EA9@SJ0PR11MB5938.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rwghzUEtwujy0Ic8E+5KxqnbyYBCB6qdKwVkIqvaEITv06YnDvynlQMt2biHSjqJBDkHbMltjvBabfJ+jI43Xjf5sL3I/Xi+kFSZQJoq+bmi5WIQWwp9tDJ2CVfpZlWb203FUK72xPz+Rq9NLj8/PD3tsR6sj/UpK1HAcZiRGAdRiIi9vvVp2T4CsFK/78TuvWzMuciIryRO1dnab5Nl+nwjrqege1nEnq/iwpCyfXga560uzRH2iv+j1Q7KqsUq1y9sI6K4js7W3MLNuk3cuW/roskXLDVzHQaaX+E5KY7vZC7l2INiYY1vay0XKJ6EP0yaSVljVxspWnFPvU9+0fQJ6FP+OtovVgoRfdog5RkZD6MvB5hWNsAUJiYw8JuffKxThmG1GKBAcxqI6vZRjO5GDCZyhUu+6HfPuHozqu4MljjuHbvMH1hoL8T36puSkPVBeu/Blbx8tIi7zdAEf1Nrxgj2h822bWTH9MmbBo/HX18TwXj4ztWcSpGr8kIkH2FB0QopyavMgEBMWOLmOXHreZQRIWZMm2XM8q95oibx/uECkgj8MDJfmgvLidmLDHxXxrzWYo7ssM3kMpQ61Txr+NA+cz1pCdbfB1qvmeJ7P33GnGtpu5qXrc6ZY3nB0DwalNHUW5h3J/EhPzI02jbdPYjrjN2CJZjyPWzMi32BkLxSwXq+nIfIfDkHj3S79iVLuTfJ0zfhH0iNF2fOJmkgIM+gv2CEAfhUERhBJbj/Ls5CWH9BBCAUlvOmqayLLGxLofS8ZtUmnxuMkxLuJg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(38100700002)(7416002)(8936002)(2906002)(122000001)(31696002)(5660300002)(316002)(38070700005)(6512007)(53546011)(66476007)(26005)(6506007)(54906003)(110136005)(186003)(36756003)(71200400001)(6486002)(508600001)(2616005)(76116006)(66946007)(66556008)(91956017)(8676002)(64756008)(66446008)(4326008)(31686004)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bmdoMEtQdTlQT2tWTkZtL3FRaHJQV3h3LzNDc3hQbmRyZjhSSnRydUErb0ti?=
 =?utf-8?B?N21ta21XSHl3d0FQd1hHZk56dnFKdnVySGJOWUJoMDRiV092NGh6QXE2SHR6?=
 =?utf-8?B?WERZZVpsOG1hV0ZlT1FxK2tUOXlkYlluK00vc0NZVG44K3MwZHdxcWN1a2NQ?=
 =?utf-8?B?cStJRDYzTndkNENjSktHMGVaN0VVQ0hMTVhBZWhlbWV4TEYxb2FybkwwMllx?=
 =?utf-8?B?VTR0ZG52VlFuV2RiMVAzT3hBeExLZWFVYzNESlMwc3BBem9pNDZ6clVyRGdE?=
 =?utf-8?B?ZllLL3J0clRWN3V5YlFUWkZlVDdvVFpPT3BZWFdtb2RJWlovUWVaU2Fic0VE?=
 =?utf-8?B?a0VXTVRNc0I5NGd3V0tYVS9aRFd2ZDh1ZnA3WWZ4Vi9ZZjR3ZHpkOVc3UGEz?=
 =?utf-8?B?a0hyRzB4VUVUSUxUV1o2L0t0ZzFvb2VRRnNsQnhWSlJrZ1VxTkFXMVc2SGlU?=
 =?utf-8?B?VDFlZXpydzlLa1Y3eXQrRkZJVHRHWG9laEx2aHB3ZW56bnlyYUROYVJKcEti?=
 =?utf-8?B?TXZVeitScVBCRnNnanNYNTFqNDZiNnJiQ2pqRG1DTjF1RC83NnYxQnVsZjFa?=
 =?utf-8?B?RjRGa29YTEQxaTYveWx3aUY0MkNFcExhUkFkK3dxZGxsa1dvRk40c3paSkVs?=
 =?utf-8?B?UElSSEU2RHVNU1FwOEZOQWYvQUhoN3hwL0F4Y3dIN2U3VjZRbE03VlVtbERY?=
 =?utf-8?B?SHdrMzBHKzF2ZVhuUkh2MDYzcmNTeE40RmsvZmtMZlhxK1dPbm5SeFo3ZHM1?=
 =?utf-8?B?QkJoY0E5K2FzRVZOcUhBQndpcGJWZldadElnYittT0ZlNDVoVzBXZkhYKzBh?=
 =?utf-8?B?aUxZUTU4ZHRYY0x1WlZiby95dWJtNXFFSUQ4YXU5UUhwSFV6WGZ1eE9oUjhF?=
 =?utf-8?B?Mm1vTnhLNGplQm5GaDgyYlVLenNtejdmUW1JZXFwOFY5RlViaVVraUFVOUg0?=
 =?utf-8?B?NkM0dys2WGdKUXdFMFZPK2JLWjhxL3NoRjRuZzBuc0k4MFRYZEY3S3BIZkt0?=
 =?utf-8?B?Q0JWKzlEK254UEZDV3Z1ZTAyT3R5MEhLQm5oR3pSbVBKVWppcllzcngreU1z?=
 =?utf-8?B?Z0FvdUsvaitjZXVvdTIwUDk2M01qUTFUcm1kMGYxY2kvZGpMdGhiSnJVV2dk?=
 =?utf-8?B?ZGJoZ2hINVhWR3BZZXB5RjhYZktSczgvMVlsaU9qa2RFaEdJU2Q0RkhVT2Zp?=
 =?utf-8?B?WVZ6eDZSeFo1T0ZjRG5kdTd3TVBOemhubFRodHJEMk5CYjhqY1NDNEFiclI5?=
 =?utf-8?B?cHcrWFlFbHk0U1J2a1pia29wQUp5RmNrY2xiRGJUUWJ4aW0rdkhwcDFGUldk?=
 =?utf-8?B?Z0hLK0JJd3JLTVh4b1c3NlVBMWhVVTZSZW51RXhZZGZMNmFNaVE5VTBEWUg1?=
 =?utf-8?B?N0RnZGpxMTgrbFNZYjhjNjZhSEtBa2tXTFdneitzRUtueUxZd0JNZnM0V3hr?=
 =?utf-8?B?cDJIQzRpdlVWM3hVMVJkbXFXbE94eTdlN0FJODNnejlPNWVGVDU4L1d3VWVx?=
 =?utf-8?B?TFA2WkE4VkVuc3BjeHI1cXRabnNnbzJKYWFHb0E2YXhLM1c5b2ZLU3JrQWIx?=
 =?utf-8?B?RWVWM3VHTktiOS9GN1B1SDBsTFIzcFFSSDdRZWtjUEU1bDhramtTdzJHZk41?=
 =?utf-8?B?N0hEZFVVZjV2bndNZWV4dlZWa3l6dzRKTjIxOEZqVzgraFBnanpJL3A2NFpN?=
 =?utf-8?B?QVdjY0ZJeXpORHFwK3pzSys1WndkWjgrVFB3NnA3cDZ2S3RSVnVYK0x1VFBI?=
 =?utf-8?B?cHA0enZvQXcrMlRCOEw2QkFyNHB2VmRnQVhVQmdKRm04TWxrUXZleU1hc1pp?=
 =?utf-8?B?ZmpXaFkvdVdQVk5aWGVSTVJDRlAveUExT1VXYkRPQXg1NkxCSndRV3NKZW0r?=
 =?utf-8?B?emJoYlFwcmw3SUt6ZkZTZDExZnpsWm0ydnNCbUNiRCtSL2JueFdXTklPYXFH?=
 =?utf-8?B?aDYvMGpZSVlYTTNkakVEZ1NsYkhrekxzODBUSHdVWkswajd4WjBOeDZYQWZQ?=
 =?utf-8?B?VWZoaVovazVjUFhibzFxZWllbVdIbzNReDZwQktobFVnREUwclhoMDRJb1Qw?=
 =?utf-8?B?bUZDYWYvOWZmQzg4T3M5bXRUN2RnS3N6QWxuZnRMV203dHI2dmtJNTJCR284?=
 =?utf-8?B?eUtFUVRBamlHeEtvWFJIMzdMOUxhMEJNY25pYVNNRDBoSnNnMjJJUzVLYmxO?=
 =?utf-8?B?NHhzS0x1T05qWlZwaExVb1o3SjFuQ1c1SUx1bVpzYUQyZVpvMmcwSlhLRXFG?=
 =?utf-8?B?czcxN2M3UDlkR09obkNrNW54UVBCcUpxQzVSaVhlaHVrazl6VDViWFYxc3pR?=
 =?utf-8?B?UGYwWUl0SG9Fa1Z5UEFCWVUwdjAvMlhTNnNkQWVJaXBpN3A0VU5NZz09?=
Content-ID: <A5F44D0D95CFC64D96DE9E0D962B1C93@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31205013-4fd0-4a30-4754-08da1bbeb141
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2022 13:25:05.6508 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3ie0WO3rZ23L6na3A+kZCEvT68PwS7UAEdOUQl2ZDuQv3r1r1234lxE5haBVOdC5l2mfh2TNCgMQPW3nXS3t2ShxXpZjvplVURe8ByQ9uUU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5938
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_062517_673122_92ACE1F5 
X-CRM114-Status: GOOD (  22.38  )
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

On 11/04/2022 08:59, Conor Dooley wrote:
> The 600M clock in the fabric is not the real reference, replace it with
> a 125M clock which is the correct value for the icicle kit. Rename the
> msspllclk node to mssrefclk since this is now the input to, not the
> output of, the msspll clock. Control of the msspll clock has been moved
> into the clock configurator, so add the register range for it to the clk
> configurator. Finally, add a new output of the clock config block which
> will provide the 1M reference clock for the MTIMER and the rtc.
> 
> Fixes: feeb38685523 ("Update the Icicle Kit device tree")

This is not the correct fixes tag. The one I meant to put was:
Fixes: 528a5b1f2556 ("riscv: dts: microchip: add new peripherals to icicle kit device tree")

However, that's the commit the RTC was added in but not the refclk.
Can I have two fixes tags? The other one would be:
Fixes: 0fa6107eca41 ("RISC-V: Initial DTS for Microchip ICICLE board")

Although that seems like a sign that this should really be two commits...

> Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>   .../boot/dts/microchip/microchip-mpfs-icicle-kit.dts      | 2 +-
>   arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi         | 8 ++++----
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> index cd2fe80fa81a..3392153dd0f1 100644
> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> @@ -45,7 +45,7 @@ ddrc_cache_hi: memory@1000000000 {
>   };
>   
>   &refclk {
> -	clock-frequency = <600000000>;
> +	clock-frequency = <125000000>;
>   };
>   
>   &mmuart1 {
> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> index 3b48b7f35410..746c4d4e7686 100644
> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> @@ -141,7 +141,7 @@ cpu4_intc: interrupt-controller {
>   		};
>   	};
>   
> -	refclk: msspllclk {
> +	refclk: mssrefclk {
>   		compatible = "fixed-clock";
>   		#clock-cells = <0>;
>   	};
> @@ -190,7 +190,7 @@ plic: interrupt-controller@c000000 {
>   
>   		clkcfg: clkcfg@20002000 {
>   			compatible = "microchip,mpfs-clkcfg";
> -			reg = <0x0 0x20002000 0x0 0x1000>;
> +			reg = <0x0 0x20002000 0x0 0x1000>, <0x0 0x3E001000 0x0 0x1000>;
>   			clocks = <&refclk>;
>   			#clock-cells = <1>;
>   		};
> @@ -393,8 +393,8 @@ rtc: rtc@20124000 {
>   			reg = <0x0 0x20124000 0x0 0x1000>;
>   			interrupt-parent = <&plic>;
>   			interrupts = <80>, <81>;
> -			clocks = <&clkcfg CLK_RTC>;
> -			clock-names = "rtc";
> +			clocks = <&clkcfg CLK_RTC>, <&clkcfg CLK_RTCREF>;
> +			clock-names = "rtc", "rtcref";
>   			status = "disabled";
>   		};
>   

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
