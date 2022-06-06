Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C7CBC433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jun 2022 16:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U/CXEsWAOZvrarkg5fg9lPXuU0gPu3M7ejGFRHMzjHg=; b=WcWnJQUso5/cLW
	/GeuFsPlUy4ZqZj7ww2sTxiqAhc3nbiVa1rjYt59IceiaLsdX1MdEAwsYY8r2a9j8CdK05WX5igAc
	xexHZgV3jL0LYTKPOW720Lq84vtfQ8YPWrQjYhqyqGYx7irqBKTbZ4aqe/aTSKWG2Z4HcXGMWu1/G
	913lek/ai4UPFYprS2lsMds4IGgPZ0GMd/sZZTip5DmZBmlB1KtbiuMik1eCvwggN9mLbt7qr1+8U
	VYxUCn8HnzN0mB8JuQeQxmOZTbjSPGhoGarKp2tgHW5lQ+Rg2di3g+/biQh3G3Y86e6UMeKHBSAwb
	/pVFnpFHATmPakPhvhSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyFrc-00281w-Uw; Mon, 06 Jun 2022 16:46:00 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyFrY-002806-FQ
	for linux-riscv@lists.infradead.org; Mon, 06 Jun 2022 16:45:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1654533956; x=1686069956;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=XxMqMAx/yMCoK3XgfvEj5ENksFm3ozsBiGtjATepiMw=;
  b=l+amf3MorgJ4F1Qhk8lHCWernFFSrxPd/ovpcE4i2/c1tRCrtJvUfOYo
   T5UI+JYV+NG7Zl09CjT7Rzr/cXnX2qj+7/y25ge/ltuIu1wsc8Gw1Pqwl
   lwi/Ydc8L7KulDdm2/F6s6+Bu456YLqHhMbFdOubL1U8cbHPVo11i0Eth
   c1c+ZIV62QmMKX9ZY+VAU3nRS9vB40vgC6eHjl6IeyWA0YEpj0nE2kbtv
   3AaEoTdC/kh4QKzpYnXrFnz5KzIz2YcsePbn87kkpln+tIx9by8Mr2dcU
   afC2yxEPe7gJ7Cl5OO++GjgLvEG4IVwsQ+0MzerB9ZORD+rrStCp9afnE
   Q==;
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="167277855"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Jun 2022 09:45:52 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 6 Jun 2022 09:45:52 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Mon, 6 Jun 2022 09:45:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TEkaVmFbAb13/6jFtz6MWOvYleqRaCmRGBb3Nh4nijaq3TGzQVv5aSrxcnhgiaQ+AjRyF/XQFSYT/Q+eBUEDLm6kJiS70K+z8VCA55Z6hxMDPnHJXVOWqxyyjEfeEu1Ex9z7OZK1eQWer5gYosSfB4cTQ8QQ2hsRCY8vRQVvohrW7boxg0E50zgR+e6ZYn48wZb1MFG7DcudW1IKSb/vwPTnU9A0OXU6XJBQ980l9qe0RzIFas2uFzJ40cuPAYIXUOJE/6qm4WDylMeHqjPlLqNyquLw7SZjcnZ5OXno9zr5Jz/yR0lufz9CG9Ri1VkMXH4U1hVp4vCaYYLzzmeKsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XxMqMAx/yMCoK3XgfvEj5ENksFm3ozsBiGtjATepiMw=;
 b=a7qCjCp+39vXDo7PVELLE2EnK/v22liury1G+LYhUVUCtSJQ98tl37lBuJkJwLLc9jLG0hMnMT3zY8p4nsRjJ1fAaPJ2xrZg6isWSW7Q4sz3fPGTFU6XZHJNb4dV+Trla+PBC8FyF2Ckz+sMv9OfATkCe2Ns9p0MQCIaXGtiVGN/SWmD2f/xQkNidVaNM1rfRSQv0tU7q0+7mEKA/R89j2ndE24X1ak7okt+qGVQxXcRWJnKVhzUYUwX/AYEy13M+Zf6P284fg7w2roLKF2HoAos1oSKRnaYp1/sXPapP7vy+WXz/HbmzS0kJKHdaFTHn+9AxZeOuePLry8lhKY/ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XxMqMAx/yMCoK3XgfvEj5ENksFm3ozsBiGtjATepiMw=;
 b=osrYndOOmoW0eMCgG5mLWwvmujHPhlrDXOwFAQ9Jh/h3zQXcn9u0AD7OSLpoXDZtxslvWBB1WD+oOO//XHfq7WacZYyoC0eGbHWhZMEXGItMeaXdvJ92bKZLexJQEvginArc9MUIvETFU5A1lA2CW1pryqdD6stnOyrrxxIVpyI=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BYAPR11MB3591.namprd11.prod.outlook.com (2603:10b6:a03:b4::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.17; Mon, 6 Jun
 2022 16:45:45 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5314.019; Mon, 6 Jun 2022
 16:45:45 +0000
From: <Conor.Dooley@microchip.com>
To: <kettenis@openbsd.org>, <kernel@esmil.dk>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
CC: <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: dts: startfive: currect number of external
 interrupts
Thread-Topic: [PATCH] riscv: dts: startfive: currect number of external
 interrupts
Thread-Index: AQHYecLPKKEbTDzMnE2JoGa00372qq1CljQA
Date: Mon, 6 Jun 2022 16:45:44 +0000
Message-ID: <6acff7ab-6f97-b17a-ce9a-a526aac81181@microchip.com>
References: <20220606162924.71418-1-kettenis@openbsd.org>
In-Reply-To: <20220606162924.71418-1-kettenis@openbsd.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2d347f80-7ae5-4050-143e-08da47dc004a
x-ms-traffictypediagnostic: BYAPR11MB3591:EE_
x-microsoft-antispam-prvs: <BYAPR11MB35917EB212B34D11F531EDB598A29@BYAPR11MB3591.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iszqnAh5DHlLvc6eWHRriha7uKlt658TepA86gZaJXyKSzVCVndQXqwMmmBegHP3i+9f7gP2+BFTLPiBGQSZz8JCPJEXqd1M1/biVUC/kIj62L9GyCPf6/ZP3Bx6kgPH/QusnaR9mErTGmLOrwKdBqINL8r5dW4ZYG5xGmIDfHe/c/3dnsioBraaluUWEvwL5qPY4Awi11mkOuHrq4Y8BI16F4UR6Fzx11W9FLGsH7sC9o52hGAuChvxRxsRdpGU7gA9EWv6IsH45MrXhbb3sW+RMCNJupm1AzZw9IPuZCJ5JOhm37holktRQSlWsV9krSlqSZELqheGlysO6ZdltEeSKMsxBT4DZoi5Gmevj+28xdGmBrkUeIwhi0SBFhpTjN7rRKLlFYXHai9M2eA4MBL26UuWPMhWY/OAw9LhW+7G2LTTmVYHVDVVAURtLntcqKV6eXoqpBWVMc6dnFBNm64nSrp/xJGVxRMBVhHK36FSXiyWuJLeE0jW7YSRr/i3O+KjPHVyNAUQUyP6XHVzsNhgtBE9ES4ezCC3Ce+zxGo0D4WGF1GUIDaJVGzfihrNWm1DiWER1fLY8QyqwqDpLtStayzber1rwAivtcCV/eDLR43lvqO7YkkuDTOKb1GKj9SheBJ9wSJcprKg2cscyje5A2kWxg2yxXDG+CMSYAZQWm4AijfBfYMMnO/LKWmHFKoMiHOZvb+rw/RtOmEH15Ju9vQXBO/wkNHAz5z4t43MWeWQwihLpE6I8+NpywEubtRhrvVQ54/GvQsRs5Ma+PmvOBBWMq3dD2jipCB6RdkUbE03VrAhdbxjRFYEOYhCTAyYiImkv0Py/jTj9YpI+oQEJTNGjnGWL2CVBTYfjVI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(6512007)(38070700005)(6506007)(5660300002)(508600001)(8936002)(53546011)(6486002)(966005)(2906002)(7416002)(83380400001)(122000001)(2616005)(86362001)(31696002)(186003)(66476007)(64756008)(76116006)(66946007)(66556008)(91956017)(66446008)(31686004)(71200400001)(8676002)(4326008)(38100700002)(316002)(110136005)(36756003)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bUhWMUVUV1hEdXJvSkUrMnQ3cTJkcCswTmo3ZXJNb2RJMy9nZlhHemhpUGtD?=
 =?utf-8?B?K3U5b2JvZzMyNDVTOERONXVWK01mTTExWFR5S1UrWmZSa3R6MHNoRmkwaFc2?=
 =?utf-8?B?bUc3K0Y5Yk1zZm03eWh5VS9ndHZ3cHh1akFBeUFsdjlvSU1UWkUyS1BsUms3?=
 =?utf-8?B?RGNrbzlzSFZSTGJROFR5SldhSGRnMTlVWWYvbVp4M1ZQUDRsMHN5SlAvaktG?=
 =?utf-8?B?M3lLMTJLV1dMd3RKR1hFdkFBSWY3akJua1d5MlA0dDhqbzY5Y0JvUGpoOVJ3?=
 =?utf-8?B?MWlLaGIrOUozMUlxQzNtYTVoVDFLb3JMSG9ickRNUlZUaFRROWdCanNaR0JM?=
 =?utf-8?B?NXYwcXk5Z0lYelBYYlAvRXpkS01lUmpFWUtPSU5yREVRN25GYlVsUWtIOGRh?=
 =?utf-8?B?S3hSVVJxSWNjLzBuRUlyNDdGR1NMekVmR0RkMW5aRSt6aWs3eWlMNEdFY1J2?=
 =?utf-8?B?UUtLL0gxYUZnUHhqdm4rZ29FdW9OMWNNTzBoS1dkRVZDV1gxTlZFcWhaUVR5?=
 =?utf-8?B?b1U3NXBWcE5sd0ZTWTNsSFlpMEpqMTRLUHVXaDVhV2E5MnVwZVMydWlGWWZT?=
 =?utf-8?B?MUdIYXExdm11RE1mejUreFM5ZjI5ZDZMd0lUc3EzVTk2WG1rRkRYamt4cWZO?=
 =?utf-8?B?L2M0bHpKWVlVODBpdERKUTNvTGxLbUd4OUgxbXM2bXRadTdEM0Y5SnVSa0tI?=
 =?utf-8?B?Z2JNQk9QdzdsL3MyU091cW85WEU1TWd3ZUlyM09ObEFNcXdCNitUTnhQSlN1?=
 =?utf-8?B?Q1pRN3FpL3Q4aUhkQTRTZnJyZzdlWnNnU0hWUTNuSFRsZ2kvNE9DcWp2RTFa?=
 =?utf-8?B?TmE0RlQ3SUw4NjZ6QzM2WW90WFE2R1lKNDM3MHgvdlQ5V2VhYS9HNGtRSVpj?=
 =?utf-8?B?L2pSY2YrOGtDWG5leXdEYzQyNXozd1JoeENWdDg0TEhsTDFGM2EzN0dVdDgw?=
 =?utf-8?B?Qkw2VDVSSmVFc3hkVTRiOExXVXQxSXU4SWRKYnBzQkwrWnpjRWpzSnB0bHEz?=
 =?utf-8?B?TFQvQVg4a2lEa1RJZWxjck1KNXlQVTZKOWNzVHRLZ21QeEhLY2lMZkxQNzZi?=
 =?utf-8?B?N2JOOWd1Qzc5dGJmTXNUK1dTcnk1NmNMWGdLR0wvd1ZoNEcrT0EwWTJ5bVND?=
 =?utf-8?B?MDJ1T0ltNGpGNTJMM3phNmwrOUdya3cycDdCeFdYQkgwWXZKbTNGcXl5ZVd5?=
 =?utf-8?B?UnN1MWN4RDF3ZGV6eHVOY0t3eTZScDdsOTJQd0VESldubGRsVk1LQjljZmpi?=
 =?utf-8?B?THU5SUZaRmRkMWtaR0tab1BnanNTSWNpK0d3WXNzeEpkV2c2UWd5ekllcE54?=
 =?utf-8?B?QS9CTXJLSVk5NmhvR2lHRHJWTGZZRU1JUVBleDBVUDA3U3BacGJDWUxOWjQz?=
 =?utf-8?B?ZklYLzVKYUtKQmJnS2haUlZ5eldPY3BkQnNvTGhtM1ovUVJlR2pRZEZlRWto?=
 =?utf-8?B?aEpwTHA4THRGMW8zZ29yNW1mS0toY05XZHNwODNzZ2xTZVlaWXVpT2N1R3BK?=
 =?utf-8?B?RkJwTEpCSnZzWmMyUGhIczM0ZW9BWVIxaG5jZ0w3QXFaV2tsZkZGeFhrMVVw?=
 =?utf-8?B?aG1RTGdCOTdneTQ3QWZrOHE0Q1phRjlFTzJEMEtoejlnRlh4bjhqYWJGUm11?=
 =?utf-8?B?U0lBdHBvVHIzQ1oyenBwNkxsMVpXa2VKMWo0dHNpRDd0dlRJbEwrZkQzRlY2?=
 =?utf-8?B?Y0hoNU1tWHViSkhpc0JKc3FGajcwS1lCSk5ReHVlSktWbGExRFhlL0lLUisw?=
 =?utf-8?B?MXdOWDBzZjNqWTJTVmYvQS9ISjUxTlVWaXNzMmRnMDNSYU5XRDIvRkcvemll?=
 =?utf-8?B?QnZzVW1NMlpFckZVaGcyejhUYWZrSm9lcFRid0ZMSEcwMHBPSnVoeWwyQ09r?=
 =?utf-8?B?aFRzSDZDMFRPdkhlQXBKMGZsZUVLQ1l6bkI2d0N4b3haMVZUb2R4UEtsanBG?=
 =?utf-8?B?N2NIc2QvUjVGWTEyUW4xWnlROWZ6K2ZzNFFDUTZBT3d6ZW9WbVVhZVBBSDdi?=
 =?utf-8?B?RzhyQzZoN3FZV3ZPR3NyUk94ay9lOEpXdTc4VWNRNWtFOVNJc3RoRVZYbEYz?=
 =?utf-8?B?dWg2SUJ1Q3krcXI1QWQ2Nitaakt3cW5CSEVwVDNmVUxTcFREbXNXNm94MUdx?=
 =?utf-8?B?bGl1WU8xd2R4UVlwZTJqU2hwcGREMERQeFpuNk1qc1JtOHRjbk0vT3A4RDZK?=
 =?utf-8?B?KzRSRXAvQkhmeHprcVNWdjdtL3MrSE4zQ2J6QU5sTGF2VjU1N0JOYkp6RUNX?=
 =?utf-8?B?Wi95eGM0SnZPSG80Ui9jdTZSeDBsYkZMUFpxWkk0NGFBa3VETUoySHB5S2Ix?=
 =?utf-8?B?YWxjTnEvNi9seVpVYkxnOFVJeEZadnRLTlJWMks0Wk1oMFMrMnFqWFNQT0dx?=
 =?utf-8?Q?wIXsWfHm5m/2wZAc=3D?=
Content-ID: <D4B4B1769061A84C9A4F0B0FB57DDF38@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d347f80-7ae5-4050-143e-08da47dc004a
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2022 16:45:44.9109
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +YIZLz1TB9ITdAobh54d1mpDAPNwe0p971wg9/lWousV4yuWCyVxoMC4jGkZnR2cbtdPGhpBlKogj8oDjwPGwDGsbO0FpdSNGf7opyh5SU8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3591
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_094556_790956_887045AC 
X-CRM114-Status: GOOD (  20.72  )
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

On 06/06/2022 17:29, Mark Kettenis wrote:
> [PATCH] riscv: dts: startfive: currect number of external interrupts

Just as a nit: s/startfive/starfive

> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> The PLIC integrated on the Vic_U7_Core integrated on the StarFive
> JH7100 SoC actually supports 133 external interrupts.  127 of these
> are exposed to the outside world; the remainder are used by other
> devices that are part of the core-complex such as the L2 cache
> controller.  But all 133 interrupts are external interrupts as far
> as the PLIC is concerned.  Fixing the property that specifies the
> number of external interrupts allows the driver to manage these
> additional interrupts, whch is important since the interrupts for
> the L2 cache controller are enabled by default.

This sentence is a little hard to follow, maybe:
Fix the property so that the driver can manage these additional
external interrupts, which is important...

> 
> Signed-off-by: Mark Kettenis <kettenis@openbsd.org>

Also, I suppose:
Fixes: ec85362fb121 ("RISC-V: Add initial StarFive JH7100 device tree")

> ---
>  arch/riscv/boot/dts/starfive/jh7100.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi b/arch/riscv/boot/dts/starfive/jh7100.dtsi
> index 69f22f9aad9d..f48e232a72a7 100644
> --- a/arch/riscv/boot/dts/starfive/jh7100.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
> @@ -118,7 +118,7 @@ plic: interrupt-controller@c000000 {
>                         interrupt-controller;
>                         #address-cells = <0>;
>                         #interrupt-cells = <1>;
> -                       riscv,ndev = <127>;
> +                       riscv,ndev = <133>;
>                 };
> 
>                 clkgen: clock-controller@11800000 {
> --
> 2.36.0
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
