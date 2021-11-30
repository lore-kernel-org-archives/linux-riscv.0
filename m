Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB43CC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Nov 2021 08:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PL2tYjCKn+VU0ywuBMWIoLAdpVClAo7uhUHqmFfzTNI=; b=M0RIcl893Ehcso
	Kd61EliaP256wI0cgUiXN0GlrqarPQ6/PCgbJA/qtSJNg6RMiE95aSjc1sJU1Dc4XH5zgJ/LxjOs3
	fAvZrLHT9r7GsY9nwty4efxlok1afSSKPxP/Y0VQZD169ukR94/dzBh30gaf06DTXY3sVClnv3xfX
	CSwKzSnIXN9kqGcLXoEUiyhrXDWbxq7exi2HxkyhwuNPxkumoYfoDBIDRSQ7NFbOQXIvSQ9xKwW1P
	SrQfG/wMdTKKnUdGiRCnkLmVKD81v9A75vF1K+cYgHGw26p9Sh3WdGNAljoPXqRZhRDL3nxLlXWOV
	Bz67bQWIrTi4mtHoPSQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mryc6-0048oz-9F; Tue, 30 Nov 2021 08:35:46 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mryc2-0048n4-Gq
 for linux-riscv@lists.infradead.org; Tue, 30 Nov 2021 08:35:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1638261342; x=1669797342;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ROVkIvQoQzqMhuD20JFf3bk/3xpKm6GRrOWBIIP4rlA=;
 b=2YWfav9/0lmcartZ0WAGfhzWPU2HANrsd9Pdt+z3mFhTXk/BBXpjuUuJ
 t+z9zWI5YEJz5Sa6yYXOXb1KDUuCrWDlKnrG1RfYDQz6f7+1s6YvlhBtD
 gi5jP+WUp8gWrp3XycBqp/7JQQ476A1pVC8RZLgrmyqeJhHwBcQ5CBZIp
 5/aazCq8UAJzE860oophXExT6zSeFoc06gD5BLaFB1iZEmezj0cGTDh8M
 FSGwbBOJYi3HwApT/S61G1WstL34JTw8mVWJS61hVwdejTniVk5WlkHOZ
 /8rXiVK9xVtMYahQ6D/inA4DYprjicRDMHl/5q+9xbGCZqN4sigo1Rk4n A==;
IronPort-SDR: MH6TIwLhMRUFxN+DgbfD3YM7eZSKG4BAeJ2xnaQzKjHKTOqStZATsSXJ2dcgGN+iH1nQKLAHeT
 gqzhdBmwFICK/TfRLUm8SbIuP6Ct5BTNO8xLiFRHBUywwx/kR9X02BC5hVdIgYZVSk1tDTeM98
 AxKGszS4fVBJNpcLNYEs66shg5pmDPUxtlNTG/PlWpMGmnQtpQrvndWjOwJSsBjYeoZNgBp4bk
 QgwoDpBnIPxqtP791wre3sALG7rie308T7mYG7S7djyvXBNUBum3J/7dWZAoLwZev8O+c7LC7r
 ZxxGxrUMPXgWqd3dmi6qUgoZ
X-IronPort-AV: E=Sophos;i="5.87,275,1631602800"; d="scan'208";a="77965963"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 30 Nov 2021 01:35:40 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 30 Nov 2021 01:35:40 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Tue, 30 Nov 2021 01:35:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ncghz9vdJeFXA1lrul4lieiYGO4uXpAxpxm9OgdPiIQ5Fkr9hEnJZko2afgq6q0jlEF9zTMIA0E8pgivq7CqbqQ62I9cmTq/n9pMik7EN1eCKOEIoFj0hJ3lv66De2/6iHL8RrdO/yYpPZNsqTU/YNhOtZ9KzcDaABmnV55vqsvFmCz69h1VkaBDS5V2l1SLWddieYMimtbuthf2z+qnCW4xoTZOE9H4WZxRiEY8GKK9SvfwgUMenVxc5PvPBfaJj14/YrT63fqrWBgg4zJN26nCMdN2DvoSKgQQ3KCzwJJIHE6U/iAk1zLyPSBPRBvzrItrXtMYiWCF6+WOaLyxnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ROVkIvQoQzqMhuD20JFf3bk/3xpKm6GRrOWBIIP4rlA=;
 b=mlM5XWv86F8+n8R0NAiRC3cfC0VC4gzWM21kyPq1uN1cH2o+7BH6eaQKQa6vDnFlPxnosb3UHRNYnNKg/Oio21F3bpcdtIb6Vmf8xAOGM2GYyV4fzOSo5w2U6JokuBBXFveTtUkO8QjuxXValWrJNevRV1PGBl3WHcz13nXVRxVnS9kTIefZZtMvtT8JUyikkB+J8qwmdtm8uq+8OfjiTzSDmP925YzXOcQEPgsP9nH2H+YZ5E0HpyffJ+K+q8BPwv0aszLn0VAAUQu5GtzLFUYi1931thsx2fsG6ietbRD1zwbi1G6p51rt3Gk77iyMPRDWYtSkY9n+QuLaeDaLVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ROVkIvQoQzqMhuD20JFf3bk/3xpKm6GRrOWBIIP4rlA=;
 b=lobthqbkEEYlQ7buxiNlDZ1Mr8Ot/oMNbFFO4yGdhQwHXNFQPbzHVaV1GjLqN8B2xUGmqOTrhMgxLkHM0LfsAJ20BJPwMG2dQkyQPnO810mx918ob4rGX8A054QBI5wZP53bj5pYasokUUbjG6XGZtJtkbJ5+iGYFQbuPmwGuKI=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by MW5PR11MB5857.namprd11.prod.outlook.com (2603:10b6:303:19d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Tue, 30 Nov
 2021 08:35:34 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::f579:5f0c:dfab:2d27]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::f579:5f0c:dfab:2d27%6]) with mapi id 15.20.4734.024; Tue, 30 Nov 2021
 08:35:34 +0000
From: <Conor.Dooley@microchip.com>
To: <robh@kernel.org>
CC: <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
 <jassisinghbrar@gmail.com>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
 <aou@eecs.berkeley.edu>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <broonie@kernel.org>,
 <gregkh@linuxfoundation.org>, <Lewis.Hanly@microchip.com>,
 <Daire.McNamara@microchip.com>, <atish.patra@wdc.com>,
 <Ivan.Griffin@microchip.com>, <linux-gpio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-i2c@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-crypto@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <linux-usb@vger.kernel.org>,
 <krzysztof.kozlowski@canonical.com>, <geert@linux-m68k.org>,
 <bin.meng@windriver.com>
Subject: Re: [PATCH 03/13] dt-bindings: soc/microchip: update sys ctrlr compat
 string
Thread-Topic: [PATCH 03/13] dt-bindings: soc/microchip: update sys ctrlr
 compat string
Thread-Index: AQHX1LJNdMdlY4vowEeneOogTbWpzawbDvGAgADSigA=
Date: Tue, 30 Nov 2021 08:35:34 +0000
Message-ID: <63e29e99-d064-b157-eabc-ff08f55eef72@microchip.com>
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-4-conor.dooley@microchip.com>
 <YaUyDUsyEoaA6nky@robh.at.kernel.org>
In-Reply-To: <YaUyDUsyEoaA6nky@robh.at.kernel.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0a48a33c-82af-4d82-ea45-08d9b3dc60af
x-ms-traffictypediagnostic: MW5PR11MB5857:
x-microsoft-antispam-prvs: <MW5PR11MB5857C11BEBEB14C69F9AEC8A98679@MW5PR11MB5857.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TxqjtUT75lMNwoNkXmIdjYi74DXikGWA3jlRnNY1MgRmnwN+3WM9ycyjOvNgp/fiFNKHjlUoxyTUQzYYqSNA9aenufhiASv00cyfFu5bWLJvd0z7EhBrpn+SrtYxIWdnMe3RwJTn64FNlNlk8L6daeIAOOMtYp6uIvKvHeKfNRF+mkjf6svh5/R7su56MuUfPLDc4X4A7wAcajlXEiHj7NGZjqMGapqyaCIWgpXzTKmVsO2KU97TKFlZs6B8U5n5iODQh8i/qXValAQaMfF7CXf4Q3TB9rLRfowWH9BKXhjKTqz0gYUS4FjYvzpe6YzA5ic2B57mhgCUzSlFkHLopyFyRU/e9FqBGgbsqRBbzex+68qrxJvTD5ZRQ9WGpLKLS88JeWr/pzBjorp9n/l3bdfZJrZ+DDlUe+FLiqFBv7CIAUzvpodvh/ZDAeEvEvCve5Sjl0/jrawWf9/PhAKg2WJHtl0uvK7dDZVC+0DOfVwV6anV9zKDKS1mYSSw4ci/8G19ImLT1prnGa1thSjGTy6nRCZcLg3FPgM+Njien4SRxRnvmSOINVU5WRi45m5jMK30msk7qWHtlQrY74i6yUnzPDt6OxLKOmyt/+Jz40yOGxg0CkU/yReWJEveqda9dqSEAP0OHuuXB4VwN5b/BKtYe8/E01+XwoIR0QzuMs4dCqvwYgXxTjEj78mMaVFHnNn+nCIQ+zYcZM626U6AlHtdpQ7elmZJNWog5m9xSGtfllOeIrlbGYZKvP4vrHfOzMiNPmEwT+StI/fhtXp0mWhxO0MJmdny6MlZFQmMbYZsllxMKgayvdOnOhCyhszn
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(64756008)(76116006)(8936002)(91956017)(66946007)(83380400001)(6916009)(66476007)(316002)(26005)(66446008)(2616005)(15650500001)(86362001)(36756003)(6486002)(38100700002)(7416002)(8676002)(38070700005)(4326008)(54906003)(71200400001)(6506007)(2906002)(6512007)(186003)(31696002)(122000001)(508600001)(5660300002)(31686004)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UFp4Rlp0RGtQZVNnM1dkemMrT2xOeGpFcklITCtCeHBRTTg0NGRqSFBaV1RF?=
 =?utf-8?B?VWRVK1RvVmY3ZDhOdDYvaC9JOVBSRnNBcTdMYWl3Z0RLNU9GclBGOXNyRWlK?=
 =?utf-8?B?bFN5MDdJTnN6bWZycGpVQWlVYUlOUHd2QVU1ODcyTndXbVZ3TTMzbWdpbkJi?=
 =?utf-8?B?SlJ6MXVlUW5BNGlEZkcrVG9JUThpNGdCSDh2cWpDNHV3QnJmUHRML3FIQVBj?=
 =?utf-8?B?OEY1R2x4cEJ1cFRYYzJBbldmQkpMSmU2ZVdUQ1ZMdnI2S0FwUzhSTk1zNGV5?=
 =?utf-8?B?L25oQjk4aGFqYWtSSjk1VmFWSkFuVlpYa1Bob3Nma3BBNHhvNWF3VytyUWZD?=
 =?utf-8?B?UnNZNjIzajNlMUliRnBJcUR2TXlOWkI3T1l3K1hrUTRUYmtocXFJejlmUzJv?=
 =?utf-8?B?UzJBT0ZqdkM5b2p6MTVwRm8ySm9oMkpPUW9kTDQ5RFR3OUx4ZjZrR1JtRHdr?=
 =?utf-8?B?SXpxcjRrdllHUGtseVRCZjJxeVdNL0JvVkoyM0ZXdWFLclpmZVZpZmxhTWlu?=
 =?utf-8?B?Y3ZOOG05L0tjRjh1MTNtYnQ0dnQ4czlhVHlpRHdCWkpIL1pyOXF2eFBVYjlr?=
 =?utf-8?B?aXJ6Yi9XMjNlQTFRZ3ZUU2tIQ2JicDR3NlBDL1piL1pZVFhvSkxxcituK0ZQ?=
 =?utf-8?B?dWNMMzEzOHczdkhIK0NQbWpvMzlXWll3cUJtUlhqUFppOStvL1F5aFBYM2Qz?=
 =?utf-8?B?Y2JVZUpXN0JUVXFqMzRrVEsvYlNUMWdQSXBjenB2akNYd1orY0lLbUo4UDdR?=
 =?utf-8?B?bVdIR0c2WFRjam5aU1BncEJMQ3A2VEhvTHpCcG43YlhuVnRsenRDVTZaSWVN?=
 =?utf-8?B?S1V4aFZ0Qkh4RXVSc1NYbEZyb1R5L09lbHFLblNsYUVJa2Y5R01pc1EvRUU4?=
 =?utf-8?B?Yk4zK3FvTTdkQkFPNFRncGd1N3BhcUM1Z1pkaWRtM0laV0UzZ2FRZUpkMWFs?=
 =?utf-8?B?S2VwenRNWUUzdHVoVVc4QWN4ekZiaXRjcUo4TXdyV0pLc01DTDRtOW8yMkFX?=
 =?utf-8?B?L1F5R2I4dkRaRTNUOHhtcEk0VXJya2ZFQXBkK2hrTGI0dFJJaHJzMUJnakl2?=
 =?utf-8?B?N0ExK1hOeC9laW9yQ1JCNUtqREx1RFl6ZnN5TkczZUQ5dTFMTE4xOGxwcXlF?=
 =?utf-8?B?ZFprL2ZnTUFQcXFoUkJ5U0dPbnNuVjdzWTRMbFNHRURZbDU1WFN2TlRLd1py?=
 =?utf-8?B?b1FScVIySUFYUmI4WWh1dnRaaHVUTFBmV0hQYkJvUldId2h3SXZId2ozUnBL?=
 =?utf-8?B?UTZUMng2MXovcVBVVjV1VFpaS1VKa3A2MGZRVjZzODIwRVpiRXhpdGNHR3Ju?=
 =?utf-8?B?b3dBVUNGNVlIYklmaXRUNUgrTXNvdjNHOXBUckJxdVZnUzZTSjY3cmtpYTZ2?=
 =?utf-8?B?TGRzZ3JuZFo3T0xqQWZ0V1BLalhLblBvY0d3Q0NmZTZoa0p3MHdtZEY2dGNk?=
 =?utf-8?B?dFRSajhUZ2RLVTYra3F6WWVRNElMUFB1SzBNeGM4NkdFRzVOWlJqdHdjVjdO?=
 =?utf-8?B?ckcwOTZjb2RSVkliVlJRbUpuejlMMkVwMWdyalBnR254QXVXU1UwM3ZnUFk0?=
 =?utf-8?B?eE85QXQrQy9NeUNVUkx4Uk43b2svVHRGRzgrT0ZjOEY0SlBIMmpIZDVtcFVj?=
 =?utf-8?B?TWVveFFEZHNpTnFkMTU1VnFZNzVIOXI2cDRYK3lnWHNSVVBoaXdnNU5lWU5k?=
 =?utf-8?B?citUV1NoQVJLaHRrdW84UURoL2dTZ1cvMXgwUnR0L3lBcFJTNlBuWTNXU1NB?=
 =?utf-8?B?LzN4b2svbklTTU9BcEFMWW5LYTFZczg2MUxJTm91QzVDQ2grekFGMWs1dW1X?=
 =?utf-8?B?NThLNCttMFlaRHNFWTVCbnF4Zm5sYUhsOEtCK2tXQnM4dDNCS2JCajIyMGk1?=
 =?utf-8?B?SjRyMzZCS2w5aUVyZ1dBeWJXay9YMVB2SURxcmY5OGszbTBlbTI5NzJxNmVS?=
 =?utf-8?B?QnpQYThGUDh3d0xONlJjVkRjL1V6Vm8wUUpxcWR1MGJGRFM1TzBHWklETXNM?=
 =?utf-8?B?VFZsbmx5RGsveEJHRlMrQk5nZk5jaFVwTDFwbC8vaVp3QnVnWVR4OVJjS2VY?=
 =?utf-8?B?RC9rdXo0bnZhTnlud09HbFBWYS82bGZ6WHVJNkkrZEsyYXRvZzVUY0FHeity?=
 =?utf-8?B?cm1IY2FDK0w4c2RrdkxCRUJaUUYxWFRMU3VOVjBWSXlIYUlHeVRJakVFSFlr?=
 =?utf-8?B?NzhVaU5UVkVJTXhQdnFzSXJGOHBMUmFpeldoZWxrTmpMNEJHaVh6OTQyZDJ1?=
 =?utf-8?B?N2NnUU4zV29JTnFuYWJteDZCdllnPT0=?=
Content-ID: <7EB259CAAF9B0A4094BB4EA194BB8AD2@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a48a33c-82af-4d82-ea45-08d9b3dc60af
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2021 08:35:34.1583 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EQNZdNuC5sUtJdYn84Ln33SqIJpul3zHe7KqQt+u/ZiDoVnIy8oyvpZkwi0IaLCDT5yxmbeHVB9OW1piHGds+muveui2+mz96jSJxOTHUkE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5857
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_003542_710555_A55E5659 
X-CRM114-Status: GOOD (  20.87  )
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

On 29/11/2021 20:03, Rob Herring wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Mon, Nov 08, 2021 at 03:05:44PM +0000, conor.dooley@microchip.com wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> Update 'compatible' strings for system controller drivers to the
>> approved Microchip name.
> 
> Why do I care what Microchip approved? You all picked identifiers
> (that's all it is) and now get to live with them.
Hi Rob,

You're speaking to the person who was perfectly happy with 
"polarfire-soc" when I wrote the binding last year, but I was asked to 
change it in order avoid having a different compatible string in the 
device tree for the soc and in the binding for a device that only exists 
in that soc.

If the v2 was a complete rename from "polarfire-soc-*" to "mpfs-*", 
including the file name - as opposed to an addition and I changed the 
commit message to the following would you be happier with the patch?

 > Change "polarfire-soc-*" compatible strings to "mpfs-*" in its system
 > controller bindings in order to match the compatible string used in
 > the soc binding and device tree.

Thanks,
Conor.

> 
>>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>   .../bindings/mailbox/microchip,polarfire-soc-mailbox.yaml     | 4 +++-
>>   .../soc/microchip/microchip,polarfire-soc-sys-controller.yaml | 4 +++-
>>   drivers/mailbox/mailbox-mpfs.c                                | 1 +
>>   3 files changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mailbox/microchip,polarfire-soc-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/microchip,polarfire-soc-mailbox.yaml
>> index bbb173ea483c..b08c8a158eea 100644
>> --- a/Documentation/devicetree/bindings/mailbox/microchip,polarfire-soc-mailbox.yaml
>> +++ b/Documentation/devicetree/bindings/mailbox/microchip,polarfire-soc-mailbox.yaml
>> @@ -11,7 +11,9 @@ maintainers:
>>
>>   properties:
>>     compatible:
>> -    const: microchip,polarfire-soc-mailbox
>> +    enum:
>> +      - microchip,polarfire-soc-mailbox
>> +      - microchip,mpfs-mailbox
>>
>>     reg:
>>       items:
>> diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml
>> index 2cd3bc6bd8d6..d6c953cd154b 100644
>> --- a/Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml
>> +++ b/Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml
>> @@ -19,7 +19,9 @@ properties:
>>       maxItems: 1
>>
>>     compatible:
>> -    const: microchip,polarfire-soc-sys-controller
>> +    enum:
>> +      - microchip,polarfire-soc-sys-controller
>> +      - microchip,mpfs-sys-controller
>>
>>   required:
>>     - compatible
>> diff --git a/drivers/mailbox/mailbox-mpfs.c b/drivers/mailbox/mailbox-mpfs.c
>> index 0d6e2231a2c7..9d5e558a6ee6 100644
>> --- a/drivers/mailbox/mailbox-mpfs.c
>> +++ b/drivers/mailbox/mailbox-mpfs.c
>> @@ -233,6 +233,7 @@ static int mpfs_mbox_probe(struct platform_device *pdev)
>>
>>   static const struct of_device_id mpfs_mbox_of_match[] = {
>>        {.compatible = "microchip,polarfire-soc-mailbox", },
>> +     {.compatible = "microchip,mpfs-mailbox", },
>>        {},
>>   };
>>   MODULE_DEVICE_TABLE(of, mpfs_mbox_of_match);
>> --
>> 2.33.1
>>
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
