Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B482CC43334
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jul 2022 15:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z3skPgDPMqc2DHpdY2+YDfXODLqRhLraED3v/rje0X0=; b=lvuirp1Z6Dykcz
	MwZwujIRnE13J/qM4UHkopfFmx3nUiU5F7v4Ug80bPekHwOhtHVUhibxlzRnAo/dXaJWuVs3U9s0t
	WB7VNPrRWuuzPqtwJw3QhfqH74ZypIOC5K/FzSKaRa9H51VzUM6b424Uq05JSh1B5iLTthm8Lumfr
	81DO1XMyWc+KvEPQ20h0AUxNwaMO1vw+4iy7ScAYgi9rCqjXapVut4NAI6bafJiGvW+nOiKAXXFVt
	vC2ugFIIEnqnRewg3TxOaydW3oDCvS9VRSl0E6hQi1fPjx+lAU22//FBL+y2AEJTqwpBJ7vRQJWNE
	H3I6aiX5K0xD5gb9G/1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8kJC-0015Fz-8f; Tue, 05 Jul 2022 15:17:50 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8kJ7-0015Dw-6j
	for linux-riscv@lists.infradead.org; Tue, 05 Jul 2022 15:17:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657034264; x=1688570264;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=oa6lGQMNqjpATpDk0dENyQFFsVeW6PBs9683wxWgIR8=;
  b=I78m4ZNOP8SsBaBcW3lOvPRwlp7ZNQS8xHOE2X5dpqnNFYSLtVG9MyGG
   QXzDDnEpF6ieTkmwjBY2WUWJse5fYtniCmyLvsKw+hquwDbqMYLn9AMQt
   qdR9C1W7KQUyytAX2E25F++9dhdyl8M70W0Z5Y+ti0CZcEIZiecAQswBF
   ueOyWfidWsFId2WxxWWd9RJt6w6m75Y8oDsXoerlMbnbwyYbDxFaemigX
   g+gXgCaTSzF4AP/IRkvJsx3Xj1UDQYAysHHiG4UV5TERxj2fIv0b2pOiU
   vQ8KZMNHMpljYjPFQo9n8Xz2VVGkU2HJ5g4PqWc3jXkfhjYcR8lEzj8SE
   g==;
X-IronPort-AV: E=Sophos;i="5.92,247,1650956400"; 
   d="scan'208";a="103098744"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Jul 2022 08:17:38 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 5 Jul 2022 08:17:35 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Tue, 5 Jul 2022 08:17:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nnndgzI55wgg0laxyylBFLiYgtUddNODkgnODLbADuGNB6Dtqb9aU4E2xBDoSg4Crfoe5EssGs3ofAeHLu5Q+eRe7kvMkxO5guQCc4A1ISgy2Ne7inNlBWAnZlg+P5joPXS+qP2VxXazlOJrvrsXfU8w+TKYdWjdmxQZmHfzSnzAEDNEr1b7CZ84Ja9TVUX3nBJCFORfVAV3wvhUT1eRkjD1LA+/HUBA8vvGxBz/jvc7OzAqsX8T37g1XjJanW1qAxbulWl9fe8H272EuyJa4ii2ml/xkUkyv7cGO0aB3KpQ2bKdGYyo4WPippAt5rdkd6GbRLA2CkRTDUiog6EyTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oa6lGQMNqjpATpDk0dENyQFFsVeW6PBs9683wxWgIR8=;
 b=Sc2MFb5leFvzMDTWJLY1J06Q+a7thkpcEVtroxm08qgw9NKI2G5SnCSJxa6JHi/w0bRrv08AIQbHdHLy3qQyAJZnYxSNU6jnZJJhEaISSw8uPj3Rb+ebTsN8NYqIaJxRFQwAjCKtO4xMy0aIwJAz1SzinOrJ44GOiQdl9sA6M5Bgip5oFGT3JloGjwojtWCHu8VcG2qPOGtjZHXgL1otMW4JRUuB6La+JTJIMvfOF0I7B0y3+KOQxX/cPR3hX0WENAeGmFYzv76mDx0iLcVNSBzxSvKUrCbytXfNg0jfxux8H/oktkie4bgWBSewIDUSoP9DbBe43MbHnhe87y3Tkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oa6lGQMNqjpATpDk0dENyQFFsVeW6PBs9683wxWgIR8=;
 b=ETILAmhTu6mih9PW/OexIebbCZZFn831urKkpZb27wIMB45HL68o73p78eiPA9FW7cpXQ7xtpZScKJjGsbAq+pUlRybgBGmxPAyiMN9J5dmIonTNzv1PNHgENyw+Pc4uij14pkwZzmDovVe8TUHiq/RbETmmHXwe6bnYPLSs0FI=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BL1PR11MB5511.namprd11.prod.outlook.com (2603:10b6:208:317::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Tue, 5 Jul
 2022 15:17:30 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 15:17:30 +0000
From: <Conor.Dooley@microchip.com>
To: <Lewis.Hanly@microchip.com>, <linux-gpio@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <palmer@dabbelt.com>, <maz@kernel.org>
CC: <paul.walmsley@sifive.com>, <Daire.McNamara@microchip.com>
Subject: Re: [PATCH 1/1] gpio: mpfs - add polarfire soc gpio support
Thread-Topic: [PATCH 1/1] gpio: mpfs - add polarfire soc gpio support
Thread-Index: AQHYkHYRZlV4T3y/qkWINTdo4m9xmq1v48KA
Date: Tue, 5 Jul 2022 15:17:29 +0000
Message-ID: <7284c221-8438-63e7-5ed1-bc0a4a36cc75@microchip.com>
References: <20220705134912.2740421-1-lewis.hanly@microchip.com>
 <20220705134912.2740421-2-lewis.hanly@microchip.com>
In-Reply-To: <20220705134912.2740421-2-lewis.hanly@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 223adf18-7287-4a08-1d29-08da5e997a34
x-ms-traffictypediagnostic: BL1PR11MB5511:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 33+glukvMMidSEreV15o6n/STAKV3XvrqUb8vYTBvRcM7sfkhF0Pjji230rC3ufwJJFyMhdZfMmgdO7OCa74kbCAEq6/oQxajf8yJ1T51IgtQCh9pnPzjPt6LVJPfGigGaEKquuussemVHuxexMcRzleVW04ed0pflLdgOd4cUqcJJypw97NiUjSmP8d80khuenb42c/3dwAos2BW0JcXi+K/dMq9nVseC9RXoK0ZyE75oWTQQQxYjjVgFws4JzEYyrA0kKkn2LakG3y0PE6dAgqoB7kIXtEvV9vpLSSU3H8NcFdkgiFktxRJrgaFTx7JZdaPA3xr2xR8akceauB2Q1xFehCQR+gaTfhebWY5wI1cC9MBCgS1sRxxK3pJd3Ucj0YyoBJVxnl0jcs3rWsKhWYe6Cp5lwlXZwdwZ8lHyb1PjnxK+/KmNB6DJsp/yS/rdPM3oVuuPFaFrPeqByJ9IT123CpZNJmXuJcjIPCuRbmONFLLgrVAAuyvMoDFdg6Nf3+i1Oj1MsgfVgyXN1czUFUrV60FbWDHH1rrkTh2WWMf9hf94w929hw+vtm2C5/gRg49hvenjpJGvenvnhmdsyKcLOyT8cskJX0JkUqslnX0Zw2VWfIFTWPiNlXK/D28zh8XBznjP3gmI7u6hRF81uOOJVm3v5E4aCTVIuaACNeLaNickU5Vf7+YsX/s/t15xg8Cp9QzU5BPoRPKGQBY6rwRc4XgmvvZmHH7fUCLUj3BovO1t68hdgRy1drpfZQbwun+8MxbmVuFq+I7WlHsJaYrmyTIRMc2oz5cnIA8pZR/XQRtgWEq6OwmjXiMoktDJQ2afpvN78QJASbaM7Hn/fNJO9ZyQ7v/t055stwvt9v1O+ALrlKOoqisWqSl21v
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(396003)(366004)(39860400002)(376002)(136003)(478600001)(6486002)(38100700002)(71200400001)(107886003)(66446008)(186003)(2616005)(36756003)(31686004)(6506007)(41300700001)(53546011)(110136005)(2906002)(316002)(122000001)(54906003)(8936002)(5660300002)(31696002)(86362001)(30864003)(38070700005)(26005)(6512007)(83380400001)(64756008)(66946007)(66476007)(66556008)(76116006)(91956017)(4326008)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WGdLemxSRHMzRWhobE85d3Z2UWM1UTFHUjQ0RXFPdDBOUzJINGxFZ29PZTNC?=
 =?utf-8?B?TG9HTWN2b1ZNd1l0bU9uTmcvNGtLSUIyWFR5cWdLbFA4eDJFRXZVYUFSY2oz?=
 =?utf-8?B?cmpXQWVMWDVnN3NLQlNvb0w2NGJJQXFiWW1SZzlQU2NWU2R1UnE5SUxIYi9x?=
 =?utf-8?B?NHROVnc3dVl4WjBoeXp1M1V1U1RjL2hlSUNQU3BBUWJ5NHJaeHhOdkVPbnl5?=
 =?utf-8?B?R2tTVmZzR0NkRDFJWXRoSmpnOHl0ekI4Wmd6MXorQWsxL3AwQWRGZFFEWDVT?=
 =?utf-8?B?em96T1pRUmNSclRvbHRuQ0lINjJqcUNWUWJjcXk5czgxZ1ZScXNBcElKSVFN?=
 =?utf-8?B?ekF5NVQyOTl3STlpQkxHNUdzanhZTHp5UmpmZzNucXU0Zmx6L0hFOEsxN2dj?=
 =?utf-8?B?NlBLZ044R2NHdjAvMzYzWVVLRWhzeXl6VnFJSHhNTmhka2hCSGI3Wnk0bUxv?=
 =?utf-8?B?UmVUSXRyL0lNM29qZWI3LzU5YjFoV3RkU1AvbHZ6ZUp0djNHTEJwSDJza2Q5?=
 =?utf-8?B?bGc5ekk2SFJIY1NUYmxjYktHa1pxdXhFeUkwdElyUDIraXVnN0NhU0l3R1Rz?=
 =?utf-8?B?Y2pNcWlHdGRid0lCazg0UXVRNmxmdmJBaElIMFNGTms0cm1TVUY4SU9pc2F6?=
 =?utf-8?B?aUQvYUwrRHFvZnIwMytrRjU3ckhjVDUyTGxycytaSUJFT0F2cVhRK1dYRUYv?=
 =?utf-8?B?SCt3S1NPQy92YTVQMW9jdTJkMndHZG1qUlp0aWdIL0dHWWZ3NGdUUGZPZE13?=
 =?utf-8?B?OUhUSWxRT2pmV04ydnljSjZGelVWU0RubnI4Y0ZqaW5Zd0cxNWg3dDlOSnVM?=
 =?utf-8?B?TnZXOWVQUDhCcy83Mlp6dXFYZkUxY2lEV25Bak9ybFV1Q3ZhM1NZK1RlVkR1?=
 =?utf-8?B?QlltL0QyNkxLQW5VUWlzWUo0V0JVbHkrREl4U3hxMHNqWWJITTBuRW5lV0JG?=
 =?utf-8?B?K1R1azVud0hwd2hIRVU1WjZiOG1Na3dxWUE2NEFHYlViWjNIMGg1VDBKeTF3?=
 =?utf-8?B?Z210ZEd0M2lxVDg1alJsU2JUd28rdGN1RElEY0h5bllOM0ZGM0MzdWpPSVhQ?=
 =?utf-8?B?N01FZ2Q0MmVYQitNVFFUOXh6aEFYaitwdHV5aFhkbHh4RitkTFdwNGV6UDA0?=
 =?utf-8?B?MyticlJjYk1IVVltdjVYQUkwZzdHM0pZbWE1MUJHL1F1MzYvTVk4aGgzUEFS?=
 =?utf-8?B?eEtUYStOQmFaSGdJQWRzc2VUejRaNTB6VGl6UWZ3TzcyNWRUY0svbUhpRVoz?=
 =?utf-8?B?ZFF4QXNlRHVIVThvZmtYdkg3UTYySWR0WXNMZ3VlelV3YjY4K3JRd2swaXRX?=
 =?utf-8?B?R0tzNnFBZitMKzBZV0VCREtDdGJpTmtxQnZyeWVzTkJEalEwaWxZanJxYlh1?=
 =?utf-8?B?Sy9RdzNkb2FDU3k5WEkyRFpCMFd2aWY3QkhHYWJYTlZQNnpjSXhEazJOUTho?=
 =?utf-8?B?b1BHUnRSSXRhd0k0WUJveFBneiswR3NwWkFJT0U0VmY5QkNQa1grcnJVSmZr?=
 =?utf-8?B?Sm5BaEtyVFcrVzg5dnB6UDQ2RzN5NGYrU3dEVElnTTc2dTlvQzBRV3c3OTlK?=
 =?utf-8?B?TG81YlpNQlFJOVZuRkxCWXkxY3psNGVYR1c2SWdkNzRZRnhPYUFpemVmQmx4?=
 =?utf-8?B?YVJYNmNIcTIrZjJuWkF1WUp5NzVMVUZSVDNWRmJReW9pNHFILzNvZlJOSnMz?=
 =?utf-8?B?cXZyQk4vQlBXUTNoeVJyM2VMdUdDdVdNWVRUZ1huVm5qVWV5SWM2ckNNOHZG?=
 =?utf-8?B?MU9GV3RKUGZOUVp6dm5nclcyYmJocEltYmVNMjhwZXFSVVJQdHVPRGd0UDFr?=
 =?utf-8?B?VjZya0pDeXVpRmNQaHQ1bHRaK3hQQ1B0cXZDS21NTk9TSGJnR2RQUEd6c2hh?=
 =?utf-8?B?VWNSNnpjVWxwUmdieWNIb2Y5eEdodXJiaEx5UVhHWnd3elhZdHZha1ZHMGtP?=
 =?utf-8?B?NjBGektoUnFqcTZFTzBnZHBWT1dpUUw3dXVrWDI2NEpFbGlSalBUSDhDalAz?=
 =?utf-8?B?SHcyOWNYTVBMaUpnWUNZSXJNMktTMTR1aXlXOHFzMW5OZnRJd1A4bE04Wnl6?=
 =?utf-8?B?UzVxQmxrdUVOQ2VSN3E4bGNReFJUaDZQdCtLTlhaU29PL0hreVB3UmtHYklE?=
 =?utf-8?Q?BAlhPjeW3MN7iw0NABTMj+m8g?=
Content-ID: <A870B00B8A71A24B92A89258F3A9989F@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 223adf18-7287-4a08-1d29-08da5e997a34
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2022 15:17:29.9106
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wKXZSiVR/pov/2X2RydTvCYcKhel8kg/SoyZ16l0rDUiD/qkGZJ9tuipxPReXvTWE0sR2fMb1h/95x3mEZaqCIX1JP8oI+/c+1vuiQzqMXE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5511
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_081745_596110_660A564A 
X-CRM114-Status: GOOD (  21.60  )
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

On 05/07/2022 14:49, lewis.hanly@microchip.com wrote:
> From: Lewis Hanly <lewis.hanly@microchip.com>
> 
> Add a driver to support the Polarfire SoC gpio controller.
> 
> Signed-off-by: Lewis Hanly <lewis.hanly@microchip.com>

Hey Lewis,
Got an error building this against v5.19-rc4 w/ the default
riscv defconfig + CONFIG_GPIO_POLARFIRE_SOC=y

/stuff/linux/drivers/gpio/gpio-mpfs.c: In function 'mpfs_gpio_probe':
/stuff/linux/drivers/gpio/gpio-mpfs.c:290:20: error: 'struct irq_chip' has no member named 'parent_device'
  290 |         irq_c->chip->parent_device = dev;
      |                    ^~
make[5]: *** [/stuff/linux/scripts/Makefile.build:249: drivers/gpio/gpio-mpfs.o] Error 1
make[4]: *** [/stuff/linux/scripts/Makefile.build:466: drivers/gpio] Error 2
make[4]: *** Waiting for unfinished jobs....

Also, please add the GPIO maintainers to V2:
Linus Walleij <linus.walleij@linaro.org> (maintainer:GPIO SUBSYSTEM)
Bartosz Golaszewski <brgl@bgdev.pl> (maintainer:GPIO SUBSYSTEM)

Thanks,
Conor.

> ---
>  drivers/gpio/Kconfig     |   7 +
>  drivers/gpio/Makefile    |   1 +
>  drivers/gpio/gpio-mpfs.c | 358 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 366 insertions(+)
>  create mode 100644 drivers/gpio/gpio-mpfs.c
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index b01961999ced..e279eac198da 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -490,6 +490,13 @@ config GPIO_PMIC_EIC_SPRD
>  	help
>  	  Say yes here to support Spreadtrum PMIC EIC device.
>  
> +config GPIO_POLARFIRE_SOC
> +	bool "Microchip FPGA GPIO support"
> +	depends on OF_GPIO
> +	select GPIOLIB_IRQCHIP
> +	help
> +	  Say yes here to support the GPIO device on Microchip FPGAs
> +
>  config GPIO_PXA
>  	bool "PXA GPIO support"
>  	depends on ARCH_PXA || ARCH_MMP || COMPILE_TEST
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index 14352f6dfe8e..3b8b6703e593 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -119,6 +119,7 @@ obj-$(CONFIG_GPIO_PCI_IDIO_16)		+= gpio-pci-idio-16.o
>  obj-$(CONFIG_GPIO_PISOSR)		+= gpio-pisosr.o
>  obj-$(CONFIG_GPIO_PL061)		+= gpio-pl061.o
>  obj-$(CONFIG_GPIO_PMIC_EIC_SPRD)	+= gpio-pmic-eic-sprd.o
> +obj-$(CONFIG_GPIO_POLARFIRE_SOC)	+= gpio-mpfs.o
>  obj-$(CONFIG_GPIO_PXA)			+= gpio-pxa.o
>  obj-$(CONFIG_GPIO_RASPBERRYPI_EXP)	+= gpio-raspberrypi-exp.o
>  obj-$(CONFIG_GPIO_RC5T583)		+= gpio-rc5t583.o
> diff --git a/drivers/gpio/gpio-mpfs.c b/drivers/gpio/gpio-mpfs.c
> new file mode 100644
> index 000000000000..df48f2836e97
> --- /dev/null
> +++ b/drivers/gpio/gpio-mpfs.c
> @@ -0,0 +1,358 @@
> +// SPDX-License-Identifier: (GPL-2.0)
> +/*
> + * Microchip PolarFire SoC (MPFS) GPIO controller driver
> + *
> + * Copyright (c) 2018-2022 Microchip Technology Inc. and its subsidiaries
> + *
> + * Author: Lewis Hanly <lewis.hanly@microchip.com>
> + *
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/clk.h>
> +#include <linux/device.h>
> +#include <linux/errno.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/init.h>
> +#include <linux/irq.h>
> +#include <linux/irqchip/chained_irq.h>
> +#include <linux/of.h>
> +#include <linux/of_irq.h>
> +#include <linux/platform_device.h>
> +#include <linux/spinlock.h>
> +
> +#define NUM_GPIO			32
> +#define BYTE_BOUNDARY			0x04
> +#define MPFS_GPIO_EN_INT		3
> +#define MPFS_GPIO_EN_OUT_BUF		BIT(2)
> +#define MPFS_GPIO_EN_IN			BIT(1)
> +#define MPFS_GPIO_EN_OUT		BIT(0)
> +
> +#define MPFS_GPIO_TYPE_INT_EDGE_BOTH	0x80
> +#define MPFS_GPIO_TYPE_INT_EDGE_NEG	0x60
> +#define MPFS_GPIO_TYPE_INT_EDGE_POS	0x40
> +#define MPFS_GPIO_TYPE_INT_LEVEL_LOW	0x20
> +#define MPFS_GPIO_TYPE_INT_LEVEL_HIGH	0x00
> +#define MPFS_GPIO_TYPE_INT_MASK		GENMASK(7, 5)
> +#define MPFS_IRQ_REG			0x80
> +#define MPFS_INP_REG			0x84
> +#define MPFS_OUTP_REG			0x88
> +
> +struct mpfs_gpio_chip {
> +	void __iomem *base;
> +	struct clk *clk;
> +	spinlock_t lock; /* lock */
> +	struct gpio_chip gc;
> +};
> +
> +static void mpfs_gpio_assign_bit(void __iomem *addr, unsigned int bit_offset, int value)
> +{
> +	u32 output = readl(addr);
> +
> +	if (value)
> +		output |= BIT(bit_offset);
> +	else
> +		output &= ~BIT(bit_offset);
> +
> +	writel(output, addr);
> +}
> +
> +static int mpfs_gpio_direction_input(struct gpio_chip *gc, unsigned int gpio_index)
> +{
> +	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
> +	u32 gpio_cfg;
> +	unsigned long flags;
> +
> +	if (gpio_index >= NUM_GPIO)
> +		return -EINVAL;
> +
> +	spin_lock_irqsave(&mpfs_gpio->lock, flags);
> +
> +	gpio_cfg = readl(mpfs_gpio->base + (gpio_index * BYTE_BOUNDARY));
> +	gpio_cfg |= MPFS_GPIO_EN_IN;
> +	gpio_cfg &= ~(MPFS_GPIO_EN_OUT | MPFS_GPIO_EN_OUT_BUF);
> +	writel(gpio_cfg, mpfs_gpio->base + (gpio_index * BYTE_BOUNDARY));
> +
> +	spin_unlock_irqrestore(&mpfs_gpio->lock, flags);
> +
> +	return 0;
> +}
> +
> +static int mpfs_gpio_direction_output(struct gpio_chip *gc, unsigned int gpio_index, int value)
> +{
> +	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
> +	u32 gpio_cfg;
> +	unsigned long flags;
> +
> +	if (gpio_index >= NUM_GPIO)
> +		return -EINVAL;
> +
> +	spin_lock_irqsave(&mpfs_gpio->lock, flags);
> +
> +	gpio_cfg = readl(mpfs_gpio->base + (gpio_index * BYTE_BOUNDARY));
> +	gpio_cfg |= MPFS_GPIO_EN_OUT | MPFS_GPIO_EN_OUT_BUF;
> +	gpio_cfg &= ~MPFS_GPIO_EN_IN;
> +	writel(gpio_cfg, mpfs_gpio->base + (gpio_index * BYTE_BOUNDARY));
> +
> +	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_OUTP_REG, gpio_index, value);
> +
> +	spin_unlock_irqrestore(&mpfs_gpio->lock, flags);
> +
> +	return 0;
> +}
> +
> +static int mpfs_gpio_get_direction(struct gpio_chip *gc,
> +				   unsigned int gpio_index)
> +{
> +	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
> +	u32 gpio_cfg;
> +
> +	if (gpio_index >= NUM_GPIO)
> +		return -EINVAL;
> +
> +	gpio_cfg = readl(mpfs_gpio->base + (gpio_index * BYTE_BOUNDARY));
> +
> +	if (gpio_cfg & MPFS_GPIO_EN_IN)
> +		return 1;
> +
> +	return 0;
> +}
> +
> +static int mpfs_gpio_get(struct gpio_chip *gc,
> +			 unsigned int gpio_index)
> +{
> +	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
> +
> +	if (gpio_index >= NUM_GPIO)
> +		return -EINVAL;
> +
> +	return !!(readl(mpfs_gpio->base + MPFS_INP_REG) & BIT(gpio_index));
> +}
> +
> +static void mpfs_gpio_set(struct gpio_chip *gc, unsigned int gpio_index, int value)
> +{
> +	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
> +	unsigned long flags;
> +
> +	if (gpio_index >= NUM_GPIO)
> +		return;
> +
> +	spin_lock_irqsave(&mpfs_gpio->lock, flags);
> +
> +	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_OUTP_REG,
> +			     gpio_index, value);
> +
> +	spin_unlock_irqrestore(&mpfs_gpio->lock, flags);
> +}
> +
> +static int mpfs_gpio_irq_set_type(struct irq_data *data, unsigned int type)
> +{
> +	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
> +	int gpio_index = irqd_to_hwirq(data);
> +	u32 interrupt_type;
> +	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
> +	u32 gpio_cfg;
> +	unsigned long flags;
> +
> +	if (gpio_index >= NUM_GPIO)
> +		return -EINVAL;
> +
> +	switch (type) {
> +	case IRQ_TYPE_EDGE_BOTH:
> +		interrupt_type = MPFS_GPIO_TYPE_INT_EDGE_BOTH;
> +		break;
> +
> +	case IRQ_TYPE_EDGE_FALLING:
> +		interrupt_type = MPFS_GPIO_TYPE_INT_EDGE_NEG;
> +		break;
> +
> +	case IRQ_TYPE_EDGE_RISING:
> +		interrupt_type = MPFS_GPIO_TYPE_INT_EDGE_POS;
> +		break;
> +
> +	case IRQ_TYPE_LEVEL_HIGH:
> +		interrupt_type = MPFS_GPIO_TYPE_INT_LEVEL_HIGH;
> +		break;
> +
> +	case IRQ_TYPE_LEVEL_LOW:
> +	default:
> +		interrupt_type = MPFS_GPIO_TYPE_INT_LEVEL_LOW;
> +		break;
> +	}
> +
> +	spin_lock_irqsave(&mpfs_gpio->lock, flags);
> +
> +	gpio_cfg = readl(mpfs_gpio->base + (gpio_index * BYTE_BOUNDARY));
> +	gpio_cfg &= ~MPFS_GPIO_TYPE_INT_MASK;
> +	gpio_cfg |= interrupt_type;
> +	writel(gpio_cfg, mpfs_gpio->base + (gpio_index * BYTE_BOUNDARY));
> +
> +	spin_unlock_irqrestore(&mpfs_gpio->lock, flags);
> +
> +	return 0;
> +}
> +
> +static void mpfs_gpio_irq_enable(struct irq_data *data)
> +{
> +	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
> +	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
> +	int gpio_index = irqd_to_hwirq(data) % NUM_GPIO;
> +
> +	mpfs_gpio_direction_input(gc, gpio_index);
> +	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_IRQ_REG, gpio_index, 1);
> +	mpfs_gpio_assign_bit(mpfs_gpio->base + (gpio_index * BYTE_BOUNDARY),
> +			     MPFS_GPIO_EN_INT, 1);
> +}
> +
> +static void mpfs_gpio_irq_disable(struct irq_data *data)
> +{
> +	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
> +	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
> +	int gpio_index = irqd_to_hwirq(data) % NUM_GPIO;
> +
> +	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_IRQ_REG, gpio_index, 1);
> +	mpfs_gpio_assign_bit(mpfs_gpio->base + (gpio_index * BYTE_BOUNDARY),
> +			     MPFS_GPIO_EN_INT, 0);
> +}
> +
> +static struct irq_chip mpfs_gpio_irqchip = {
> +	.name = "mpfs_gpio_irqchip",
> +	.irq_set_type = mpfs_gpio_irq_set_type,
> +	.irq_enable = mpfs_gpio_irq_enable,
> +	.irq_disable = mpfs_gpio_irq_disable,
> +	.flags = IRQCHIP_MASK_ON_SUSPEND,
> +};
> +
> +static irqreturn_t mpfs_gpio_irq_handler(int irq, void *mpfs_gpio_data)
> +{
> +	struct mpfs_gpio_chip *mpfs_gpio = mpfs_gpio_data;
> +	unsigned long status;
> +	int offset;
> +
> +	status = readl(mpfs_gpio->base + MPFS_IRQ_REG);
> +
> +	for_each_set_bit(offset, &status, mpfs_gpio->gc.ngpio) {
> +		mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_IRQ_REG, offset, 1);
> +		generic_handle_irq(irq_find_mapping(mpfs_gpio->gc.irq.domain, offset));
> +	}
> +	return IRQ_HANDLED;
> +}
> +
> +static int mpfs_gpio_probe(struct platform_device *pdev)
> +{
> +	struct clk *clk;
> +	struct device *dev = &pdev->dev;
> +	struct device_node *node = pdev->dev.of_node;
> +	struct mpfs_gpio_chip *mpfs_gpio;
> +	int i, ret, ngpio;
> +	struct gpio_irq_chip *irq_c;
> +
> +	mpfs_gpio = devm_kzalloc(dev, sizeof(*mpfs_gpio), GFP_KERNEL);
> +	if (!mpfs_gpio)
> +		return -ENOMEM;
> +
> +	mpfs_gpio->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(mpfs_gpio->base)) {
> +		dev_err(dev, "failed to allocate device memory\n");
> +		return PTR_ERR(mpfs_gpio->base);
> +	}
> +	clk = devm_clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(clk), "failed to get clock\n");
> +
> +	ret = clk_prepare_enable(clk);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "failed to enable clock\n");
> +
> +	mpfs_gpio->clk = clk;
> +
> +	spin_lock_init(&mpfs_gpio->lock);
> +
> +	ngpio = of_irq_count(node);
> +	if (ngpio > NUM_GPIO) {
> +		dev_err(dev, "too many interrupts\n");
> +		goto cleanup_clock;
> +	}
> +
> +	mpfs_gpio->gc.direction_input = mpfs_gpio_direction_input;
> +	mpfs_gpio->gc.direction_output = mpfs_gpio_direction_output;
> +	mpfs_gpio->gc.get_direction = mpfs_gpio_get_direction;
> +	mpfs_gpio->gc.get = mpfs_gpio_get;
> +	mpfs_gpio->gc.set = mpfs_gpio_set;
> +	mpfs_gpio->gc.base = -1;
> +	mpfs_gpio->gc.ngpio = ngpio;
> +	mpfs_gpio->gc.label = dev_name(dev);
> +	mpfs_gpio->gc.parent = dev;
> +	mpfs_gpio->gc.owner = THIS_MODULE;
> +
> +	irq_c = &mpfs_gpio->gc.irq;
> +	irq_c->chip = &mpfs_gpio_irqchip;
> +	irq_c->chip->parent_device = dev;
> +	irq_c->handler = handle_simple_irq;
> +
> +	ret = devm_irq_alloc_descs(&pdev->dev, -1, 0, ngpio, 0);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to allocate descs\n");
> +		goto cleanup_clock;
> +	}
> +
> +	/*
> +	 * Setup the interrupt handlers. Interrupts can be
> +	 * direct and/or non-direct mode, based on register value:
> +	 * GPIO_INTERRUPT_FAB_CR.
> +	 */
> +	for (i = 0; i < ngpio; i++) {
> +		int irq = platform_get_irq_optional(pdev, i);
> +
> +		if (irq < 0)
> +			continue;
> +
> +		ret = devm_request_irq(&pdev->dev, irq,
> +				       mpfs_gpio_irq_handler,
> +				       IRQF_SHARED, mpfs_gpio->gc.label, mpfs_gpio);
> +		if (ret) {
> +			dev_err(&pdev->dev, "failed to request irq %d: %d\n",
> +				irq, ret);
> +			goto cleanup_clock;
> +		}
> +	}
> +
> +	ret = gpiochip_add_data(&mpfs_gpio->gc, mpfs_gpio);
> +	if (ret)
> +		goto cleanup_clock;
> +
> +	platform_set_drvdata(pdev, mpfs_gpio);
> +	dev_info(dev, "Microchip MPFS GPIO registered %d GPIOs\n", ngpio);
> +
> +	return 0;
> +
> +cleanup_clock:
> +	clk_disable_unprepare(mpfs_gpio->clk);
> +	return ret;
> +}
> +
> +static int mpfs_gpio_remove(struct platform_device *pdev)
> +{
> +	struct mpfs_gpio_chip *mpfs_gpio = platform_get_drvdata(pdev);
> +
> +	gpiochip_remove(&mpfs_gpio->gc);
> +	clk_disable_unprepare(mpfs_gpio->clk);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id mpfs_gpio_match[] = {
> +	{ .compatible = "microchip,mpfs-gpio", },
> +	{ /* end of list */ },
> +};
> +
> +static struct platform_driver mpfs_gpio_driver = {
> +	.probe = mpfs_gpio_probe,
> +	.driver = {
> +		.name = "microchip,mpfs-gpio",
> +		.of_match_table = of_match_ptr(mpfs_gpio_match),
> +	},
> +	.remove = mpfs_gpio_remove,
> +};
> +
> +builtin_platform_driver(mpfs_gpio_driver);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
