Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61ED0C2BB41
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Aug 2022 06:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R8CNpbTNpb43/AbVgakR1TOHgdf8Ataf4ASvqE99U3A=; b=Q0ElsqdsUjBnQ9
	yAckTK7HKvTK0ngF+wo7Ekhdjmio6ggzE3DL0QYEAlp1Oc392DCpawf18ntHIDiSjwdM+Tw5PPYv6
	ECKTu1CJhgOZoUJCOK+jqJ4lv7bzyjyfIvrUI/hHwgd3uFZSJskyoIOjGBfocyDhV6lcT1hBsGko3
	zGZSLEDEmU5H82XMoVV5Hs4f2AABtsO0qxEqAL2mO32zF3KeQ1yQfzURe6mTEv6ba/xNp8agriJz0
	LuC3Lz2zUwh/VqkI2bA69Urvnvf9445rqSuvqfnVtCrH42iurXRcnB9waZ2VR6XujCYK898WvPeG4
	2eCR+8VMwtc8WVmYYMXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNqEC-00DwA9-5h; Tue, 16 Aug 2022 06:39:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNqE8-00Dw6q-8s
	for linux-riscv@lists.infradead.org; Tue, 16 Aug 2022 06:39:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660631940; x=1692167940;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=cmtpWEkehJZpTpbsPqY37BQ+pGwsgpQGc0ZzvqBeVRw=;
  b=FuoKoZhrjX0eXCm/Jk0i5Y5ZIYxX96uq0X7GzKxIJD/Y2bjE3iVqF5Dt
   Wvedt7aVzkQJNTprvjY4lLKK44e8Up81fRzuEj6BLCEHYeMDHdl3QE5ZN
   vs6YSRHsEWBgl2DX6FCwjENqmXkJ7eShHXDkhGUjKNgSuO5r41too7qte
   JXYN0DAJB12SUR9guN30bxYG/ERvH4EYagcshqbYB/zSWZd6oMkVMocfJ
   y/eQgpSp+1NHODfDpdHcNgQ7h8Enj+Ta220epkM6fMlAB7/4WufXPSCOS
   DW2lgltbzVS202esidte12o7IIPWmH1zOL/1AiH59e8ZKgY5voV2ln8NU
   A==;
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200"; 
   d="scan'208";a="176531215"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Aug 2022 23:38:57 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 15 Aug 2022 23:38:57 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Mon, 15 Aug 2022 23:38:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CJt9h/9JPV5FHkGuvco59V74yQUe87R/khd3yhp2pnaq6fJswIS4oFC1SYpgTYd8VPmTA0QOe/XxWmDCEyKNXo4WFPpEcigIe36qDsr4/elU+Olodr2Nm5Hk74eGIvqoLaqJ87yvGjHKu2X/URCNNTJ6A7/YSZ0DkFb9xsGCEOqLZbNMkhnYtzWx9buZuVkM05Ou/qM7d+ceupjmYu6E9njqoanEZ3/G5X7C11iB8ueK7e6yGd5gcgaUcNIAmY+hCb9KdJNYihTB3n3piIbhTS16TYyOt85DqQe8lzKHy4MoIs3MS40sxaNpChbfYK0baLum3KmC5tPIbq4vtFTKFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cmtpWEkehJZpTpbsPqY37BQ+pGwsgpQGc0ZzvqBeVRw=;
 b=JW12ZygcbX0rFnZe/GjXqTyK4rw08x85qCvlAbt4uJ2NLtoZDb2hznKAOmNH85LowjIEsCOBekJbTErn0WPhqGpcjr3L0cGpZeAMAOnCPNtBEu4nfTPOJdyDuS6wjLJXf1vUe4OU3dpeqh6rwmXeUfg+TOmdIGKd4YpR0oY3CCiA47MVUPn4oj4P+nQ+EQZtkPM2v6IQt30YEht0Jv0gcWNiguFyBxxH5+meRjf+cLRVoxR9JRvmrcqOY0A9QXzVnpONfhPdP+iNDhF+nJx1qi2inwnXMWdz8XLCcwCp8XLe7+hhs9KTp7vLH7CboHsAHcaBf2V8MuSMEE9Bx+wTYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cmtpWEkehJZpTpbsPqY37BQ+pGwsgpQGc0ZzvqBeVRw=;
 b=NfwsRkjAOpzzAIf65ZdOG9vJtC+8X233afSRFLaaFJpGvgskVQAP97DhgcKAzvWjSJGtMHggCVTkYKQ3MQ26AK0/lxhaEUoXiWxnKZJV/ksMsW0FoLhK3G9O1QBZ9jiqMVh73MoakX1pq59KESVp7K/zp8xsiuteKSnnTdoExzQ=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM5PR11MB1243.namprd11.prod.outlook.com (2603:10b6:3:8::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.11; Tue, 16 Aug 2022 06:38:55 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Tue, 16 Aug 2022
 06:38:54 +0000
From: <Conor.Dooley@microchip.com>
To: <samuel@sholland.org>, <wens@csie.org>, <jernej.skrabec@gmail.com>,
	<linux-sunxi@lists.linux.dev>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>, <robh+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <krzysztof.kozlowski+dt@linaro.org>
CC: <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/12] riscv: Allwinner D1 platform support
Thread-Topic: [PATCH 00/12] riscv: Allwinner D1 platform support
Thread-Index: AQHYsGUX6yPEPkvFO0eCq9swdC/Ww62vig+AgACpiACAAJ8rgIAAQhUA
Date: Tue, 16 Aug 2022 06:38:54 +0000
Message-ID: <42417044-8635-8dc9-9e25-be79d9d6f099@microchip.com>
References: <20220815050815.22340-1-samuel@sholland.org>
 <50dc816c-3129-f5aa-9777-99c6f0fa58f1@microchip.com>
 <6b8cd27d-5671-7bcb-549d-e903cf019fe3@microchip.com>
 <6d54da3f-d4fc-7c40-38d6-4f02c7346458@sholland.org>
In-Reply-To: <6d54da3f-d4fc-7c40-38d6-4f02c7346458@sholland.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 568c6301-c7e2-45db-4b35-08da7f51fd53
x-ms-traffictypediagnostic: DM5PR11MB1243:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: =?utf-8?B?dVVCRyt4WFM3cDRQT0F2cmpCZ3hTeS96YVM1Smxkd3Z3Z1FlTENZZUJnQStR?=
 =?utf-8?B?RUYreEZhdmRob2p5L0tGS3VuTEhNUGtaSjNncU5URTlWRVlwcDZ4MlZ2cWRh?=
 =?utf-8?B?QXBmZHdxOVkzYTZZbG9jNkIwaTRtM1RFTnRxNlVzWCtpdzdiTXlLVlNnQzFs?=
 =?utf-8?B?OFN2NWlveFl4cUZ5YkNrTzBzdHlYc1Y5blUzZEphbTBNODhTQWx1ajRvblBF?=
 =?utf-8?B?MEQrMUdZekt6NmFvYld2WkJGTVptaXc1ODlyVkxUVW52bVl5OXBUUWU0em1z?=
 =?utf-8?B?a2ZOWjZzaU94WmQ4eGJFY1haMERFSlJVUWNWd2Zkb1VsZkMxcHZSVTlnWHdP?=
 =?utf-8?B?MjhJVGpqOTI2Z3RudFFPaDViSHVNUHV5dTRYVWpaeXZNOGJYd3V2MTFiSUVs?=
 =?utf-8?B?eHpUOVFvTThxUDdFdGQwM2dEdEdaTVozOGgwdXhMQWtwZEtrbUNOTUIzVDFt?=
 =?utf-8?B?OW9tWWRTVEFMSVZGV1oza3huazRmKzVIZFBFYzFHZHZaQXNsQlFYMXpTb3hD?=
 =?utf-8?B?eVVLRnc3T202N2dIWHBEbzZRdUNXWFpicVlmNlBVT0pHWXAydzNRSVJiYmFQ?=
 =?utf-8?B?Y0VpNlJRVGlzalpieFNPZ2t3SldjUlp0ZjZtb2s2dFdpMENqUEJBa2ozbTNW?=
 =?utf-8?B?VHBwQVFwN0hLbklYMjNXL3NEcEp0aUVNcWN1OVA3SjNJSVJ1dnJtVkdKYVlX?=
 =?utf-8?B?bEZveTdKV0NuaHZzQXY3MHIxcEMyZ3ZsVk1ZdEtBSmRaZWVSVXZTSWJqQ2lF?=
 =?utf-8?B?QXpSSkNUV1hWanpCSHdhVnFJMExlcWpoUHpQZEU0aThnZGxWbTYwNXgyS2JG?=
 =?utf-8?B?eTlFWmN6TWdoR0dtZXFlMXQxdnNqTkZCUmo2UnVHcFhxb25ydC9tTDVzT0g0?=
 =?utf-8?B?Z1lGRGl3c3ZYT05zS3hWRmZyQXJmbWhjNGVRWlZFQ25QOFY1d2cvTGk2bHZw?=
 =?utf-8?B?aHRBV0cxNDRKRXZ6bmlvUUprS0crNU05MXBnaEtlMXV3NWE5UFY1L2xKeW9E?=
 =?utf-8?B?NjA4dGx3YkdpVUlPbkFKSEt5OS9KRVhONWl6bG9aYlVUOW1LZitKTHZDWmln?=
 =?utf-8?B?N0I5Y1RTTGl3cXQzQVpBajV3cUQvM21yRWt3NWdSbFVKdCtDTEFqdWtoeTZY?=
 =?utf-8?B?S084MUVSajExbm5qM3hJTzA5OUh0eXFHS2d3SzhiS0R3NWNKRDc0bFEvZi9K?=
 =?utf-8?B?VVF0dUdqTnRYbzczNGN5ZU1oS29qbUZBVzhRUWxPdjNsZmhqbmtYWG0zTE14?=
 =?utf-8?B?UjV1a2hIK1hQcm84Y1VwQ1N3KzFycVBGdCt0V25XQyt5NkUvZz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(376002)(346002)(136003)(39860400002)(26005)(316002)(8676002)(6506007)(36756003)(110136005)(921005)(38070700005)(53546011)(7416002)(83380400001)(6512007)(478600001)(31686004)(186003)(41300700001)(2616005)(122000001)(966005)(64756008)(86362001)(2906002)(6486002)(31696002)(4326008)(76116006)(5660300002)(91956017)(66476007)(66556008)(71200400001)(66446008)(8936002)(38100700002)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cFJyQm5vK0lVYWNFTTFVK1VBMkVxZHlYRnh2b2hNTG0rR2V2aEU5a1ZYQXBT?=
 =?utf-8?B?N2FhZ3k0TmVMVkJVTU9GK2JNL2NGd1BsdWh5d2dhdHEwWnI2d2Y4Ukp4NzdG?=
 =?utf-8?B?MzlYSU5YNXRvci9TMEQxdGN4VU1xcGYyblBKVWJSbk1xdjM5ZnhpQjMxU0hC?=
 =?utf-8?B?by8yVGpUUWZERWxYZ3g3dmxpWnBIZHZ3WDFwbS9UWnh6NFdjdjNlUFdLQmla?=
 =?utf-8?B?OTk0RHloU3ZKU3lGQ1BpNHJFWjRmZjFnaGFtUHpkdys3YlhkcHdiMmc0VHBt?=
 =?utf-8?B?WXlDT1R3bFFvd0FZa3U3UC9lMG5Zb3hXZTh6TE9leHJwSDVhdmlrMFhYQnI1?=
 =?utf-8?B?cXlMUnh4WUxYNXNERCs1Rkpxb0pwUURmaHRvRDNRZWlFNk1OeE1XL2RVY2Rj?=
 =?utf-8?B?VUNyODRCQlg2YW1qYTdUcHJGcHp2UHNNQitRa3EyTW8wZjZVenhGU1IrQUtQ?=
 =?utf-8?B?clNYWVkvU0JsUDJXMTZVRXJ0dFZ2QWFwUWdwK1E0bWFiYlVibEFGcEllVmtH?=
 =?utf-8?B?emZuRmRaOUhoSlp6OEoxS3V6TG5WUWx2V0dqQWRmSHBuSkI2SG5lVXBNbWZF?=
 =?utf-8?B?Wk9RUFBCTnc2c2FWalBTT1BFMEl3WnZWNG9KUUlmWUpvMVdXUWJhbXN4ZTQr?=
 =?utf-8?B?Rk5ZdVNnS0NDUmEwNUlobzBoUG1PL01QQnZTd0tqdFVSOHVFVHNoOGZ4Yklq?=
 =?utf-8?B?QmFWYWlHN0R6ZDluZEtGRGtHcDJTcmhEV0NhMHRWa3Y5SHVBS0tPdzJBTVJZ?=
 =?utf-8?B?ejF5NXV1enAzZGJSWWJtcDJWMGRJVEJJVzNkZURPZUdDcnhjVHVMdW8wcFU1?=
 =?utf-8?B?SjJ1dnpuYjdtTk5EZ2dTV1krbkxwVWd4MWpHUWhzNXorRU02ODBEUldkeGV2?=
 =?utf-8?B?NmJYOHJ6TDJ2T0x2d0Njam85SHViYmxKRXM0SWNXS0Z1aTU2RTNDMHZvNmF1?=
 =?utf-8?B?eGN5c014UCtGZXBucVhJWU1yeFVoTlJGVUNvOTRmTklaOEM2WWxFYnl5TmNY?=
 =?utf-8?B?R21OMnROamNsSnowZG9qYjI2MkNPdkFnY1JESDhMSmdFcElSR1pwSGJoekhh?=
 =?utf-8?B?SUJXRWhDcTQ5OHEyVTFoSWRUU2JlekI2c2RjK3VFeWZYMHVEU3JZTTNINlJz?=
 =?utf-8?B?aHY5S2VoemNZM21US25xWXNOc3BtcFhUcXJjNTJQN0t4aUVvNHpVNU9HY3pP?=
 =?utf-8?B?d3R5ZHIyb0xtcjVtTjlKK3V3V2FxZUNKYzNLOFVXa1g3aVE3QnRLNXJ0ODBR?=
 =?utf-8?B?UStGWHlIekxlU3JBTVdUTDN6NG5mVDFQMnZqNTg5clYxNXU5czcrci9pbW1Y?=
 =?utf-8?B?U3h1ZUNJVURNZU5SZCs1amFoMGQvZlpEa0U0aFl4RlJhU2tkODUrRGFUWmx4?=
 =?utf-8?B?WUJ5YnoxZUtKeFRKcHFCb2hLR2d4QmI5dG5aNlBGOEZYWGlFSVh0Vmw0dmxL?=
 =?utf-8?B?eFhZeGhUQ2l5MkFPTjJ0eVY0QzAxL2hRWUFuL3R5d1QrMXVQZXRYQndyemc4?=
 =?utf-8?B?QzlqTmpPUDNrUDAxQ0U5WTdoaEJwNE13OVgzbXNMVXpYb1k4V0VGd3FxcUMw?=
 =?utf-8?B?R1d4eC9BQWM1QklzMEVoeXR3UWNXc1VvOG5VT0NuMU9nSEcySDc0b1BERVJ1?=
 =?utf-8?B?c2daeDlzOFlaaXgyb2g1WldZaWpWdzhOc2x4RXNPQ3ZvL3pxVHBaVFQ2Tmx2?=
 =?utf-8?B?Y3p4UTRKdlp3Q2ZpQ2dHWWFHMjNQbVB5NHBJalgvWVowVG5pSnV6bDNhaWNu?=
 =?utf-8?B?UmJVWHFjUi9TYnp4ZnJEQ3hrTkNoLzJ1ZlhLVUYvTGtQSGhtMGxTM2ZlL0Vm?=
 =?utf-8?B?VDVRNHluQ1FWUHAyZmR0NmxIMXdvMSsweXMwT2JiM0pPZ3FoTm1hZWRNQlBV?=
 =?utf-8?B?bHUzOGlwVUtUeVcvUGdBSi8rL0xzTDl0R3RGS0IvaDdiem9ndDZISHZDWThI?=
 =?utf-8?B?KzU1d1huZHVEbTJ5SFg0UXAvYmczRHdpeVMzcEkrb1ZLVVVQaGIwYjhGQ2Fo?=
 =?utf-8?B?N3c1Vk5vZ3FhZU9WM0t3Y1BXSEU1OWxXMFVMZWhOSkdrQTgvcmV0K1FUVWJT?=
 =?utf-8?B?c1BRd0dwbWhWSmI3VmIweVNqcXNsNm1ObkdGRmZodVBtTHliSFFSOU40cnd0?=
 =?utf-8?Q?E7hv6qL9eUIA6M8hkUlIqdC3R?=
Content-ID: <67608BE79EC2F74F91150D2221699AE8@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 568c6301-c7e2-45db-4b35-08da7f51fd53
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2022 06:38:54.5362
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wASk5bVkTwwTVlMuCyuCVhTAEr8w99/vDguadPamPk9w8H2K/ifTS19gLRKflsRuyCUptlk2Ea8yZBJXiBQ+ZoTCh+9oGuzib1V1+tZvAhw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1243
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_233900_606415_67D65E3C 
X-CRM114-Status: GOOD (  25.57  )
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

On 16/08/2022 03:42, Samuel Holland wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 8/15/22 12:12 PM, Conor.Dooley@microchip.com wrote:
>> On 15/08/2022 08:05, Conor Dooley wrote:
>>> Hey Samuel,
>>> Apologies for the last email, the first 5 patches in this series
>>> didn't correctly land in my inbox and I skimmed & replied to the
>>> wrong cover letter... I blame it being pre 8 AM ;)
>>>
>>> On 15/08/2022 06:08, Samuel Holland wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>
>>>> This series adds the Kconfig/defconfig plumbing and devicetrees for a
>>>> range of Allwinner D1-based boards. Many features are already enabled,
>>>> including USB, Ethernet, and WiFi.
>>>>
>>>> The SoC devicetree uses bindings from the following series which have
>>>> not yet been merged:
>>>> - SRAM controller:
>>>>     https://lore.kernel.org/lkml/20220815041248.53268-1-samuel@sholland.org/
>>>> - NVMEM cell bits property change:
>>>>     https://lore.kernel.org/lkml/20220814173656.11856-1-samuel@sholland.org/
>>>> - In-package LDO regulators:
>>>>     https://lore.kernel.org/lkml/20220815043436.20170-1-samuel@sholland.org/
>>>>
>>>> All three of these are required to set the correct I/O domain voltages
>>>> in the pin controller, which I would consider important to have in the
>>>> initial version of the devicetree.
>>>>
>>>> The SoC devicetree does contain one small hack to avoid a dependency on
>>>> the audio codec binding, since that is not ready yet: the codec node
>>>> uses a bare "simple-mfd", "syscon" compatible.
>>>
>>>
>>> I tried this series on top of both 6.0-rc1 & next, but I saw a shed
>>> load of errors from dtbs_check. I'll take a look at the rest of the
>>> series later on, but just FYI. This time I did at least read the
>>> right cover letter and actually applied your dependent series..
>>> /facepalm
>>>
>>> I have been trying to get riscv down to 0 warnings and would not be
>>> in favour of accepting patches that go in the other direction.
>>> (This patchset currently produces about 47 new warnings)
> 
> Only 4 unique ones :)
> 
> Thanks for checking this. I had done a couple of passes cleaning things up. The
> remaining warnings are the ones I was unsure how to fix.
> 
>> FWIW this is what I see, LMK if I am missing something.
>> allwinner/sun20i-d1-lichee-rv.dtb: i2c@2502000: Unevaluated properties are not allowed ('dma-names', 'dmas' were unexpected)
> 
> This one is new with dt-schema 2022.08.1 (I was previously on d1f3102e locally).
> I'm not sure if it is a bug in the binding or in the dt-schema tool. The
> warnings go away if I do:

Yup, there were some changes to handling of unevaluatedProperties
between .07 & .08
> 
> --- a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
> @@ -72,6 +72,7 @@ required:
>     - interrupts
> 
>   allOf:
> +  - $ref: /schemas/dma/dma.yaml#
>     - $ref: /schemas/i2c/i2c-controller.yaml#
>     - if:
>         properties:
> 
> But I wouldn't expect this to be necessary, since dma.yaml has "select: true".
> Compare the this with the UARTs. Neither serial/snps-dw-apb-uart.yaml nor
> serial/serial.yaml references any DMA properties, yet there is no warning for those.
> 
>> allwinner/sun20i-d1-clockworkpi-v3.14.dtb: pmic@34: compatible: 'oneOf' conditional failed, one must be fixed:
>> allwinner/sun20i-d1-devterm-v3.14.dtb: pmic@34: compatible: 'oneOf' conditional failed, one must be fixed:
> 
> The new compatible is in linux-next. I can add it to the cover letter for v2:
> https://lore.kernel.org/linux-devicetree/20220810013430.27061-1-samuel@sholland.org/
> https://git.kernel.org/lee/mfd/c/97ecda0f615e

Please do :)

> 
>> allwinner/sun20i-d1-lichee-rv.dtb: ethernet@4500000: Unevaluated properties are not allowed ('mdio', 'reset-names', 'resets' were unexpected)
> 
> This showed up with a dt-schema update in the last year or so. This may be a bug
> in the binding? allwinner,sun8i-a83t-emac.yaml picks up these three properties
> from snps,dwmac.yaml, but does not have them in its own "properties" block.
> (resets and reset-names are even in "required"!)
> 
>> allwinner/sun20i-d1-lichee-rv-86-panel-720p.dtb: ethernet@4500000: Unevaluated properties are not allowed ('phy-supply' was unexpected)
>> allwinner/sun20i-d1-dongshan-nezha-stu.dtb: ethernet@4500000: Unevaluated properties are not allowed ('phy-supply' was unexpected)
> 
> I think this one is just flat out missing from the binding. It is present in the
> other two Allwinner Ethernet MAC bindings, but not this one.

Cool. Maybe Rob Or Krzysztof can shed some light on the others.

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
