Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81DA2C43334
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Jul 2022 16:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1OBcPm276zL/nbyG84JXeoYTyBbHoP/Je8l0iTuNLOU=; b=Qyc4QjOXwoyL/a
	E4KDm2eK4pXHnhllqPWc9RWEFBLtcoZuxH0PQdCyYh4yTp+ageoSpVqYTH/BEaY59dHjJeDOF44F0
	/jQLtJYT1JUsC2FstE7fnuwed2ZWzK3xFTB8XCzdfRDQ+gdgR7tpG96ikWfxPMGjw26cJcpn3LX9X
	8NdmD2ynJ+qXJ2W/49nCv1Dl7qY0n71mIYhtAmbp5b37n1vhUJYn20f4SsXJ9jCx+64M63Fz8dAF1
	gP+z6J7mH4+3ry650amqI7w85KfGikalDAvismAVssqjsrcGw3t2U4aCZRgIMZh2oDQ39f4i31sG/
	O2noOmpcTgkXoAOkqtsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7JPS-005weI-Cm; Fri, 01 Jul 2022 16:22:22 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7JPO-005wZi-Ib
	for linux-riscv@lists.infradead.org; Fri, 01 Jul 2022 16:22:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656692538; x=1688228538;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=kKYsXffn6HfynDK8LPkLfFJ0rS311cQXK0svujjUjwI=;
  b=fKFkwjQl+snP4yMTvkg4tQcx+ZvUkSa/sC1lp508nEaXrN3p5k4tNyQ1
   pY8fbVYPkqg+dGmJvhutL61IqYGgs2qPfUI0JSvzWl4Ap5ecUGXhl+wYH
   vIodos+emeMm6WFBQ+R6+h1ws08fKMIzoHT+h/riHMjOFFm3n0kKLOgSP
   5ztFzZb2dNPMY35uYYffeW0k91LvHjDTaIEJrX5nP5LyWBi7fNABT4vuS
   daygmp6ekQOkVEB4Za8h/6RPFXeNMeOzefrv8X4S29vLmbhq+jtSimC2i
   sAD/LzAeZsNEv87E6xety7edR61/c5xQZSx1ZqBwtRmE6VSSbzb0EJwzo
   g==;
X-IronPort-AV: E=Sophos;i="5.92,237,1650956400"; 
   d="scan'208";a="166036782"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Jul 2022 09:21:00 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 1 Jul 2022 09:20:57 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Fri, 1 Jul 2022 09:20:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fuB0wlBp8s0LOaPjx1sH+gtDR1KK5kh7kq2v96rcmd6A+6WZMmAssY9ZAg267GCCuuEcJqsBFR2bYIDRMDd0mXu22mvAhSEDcQTBoKxaoVVckl6tjF/H5iasmTlDbPTaIQGyuu6b6SQ5JsLXYeJ+2FRUdhPUu6Xc+GZjYHBqNrpaLRHgqqzY7FvdbmlDDb6AWdHEuoM2fP4G662GOxvmggLHU1HyfH1DkwK223kvnrM2i/MZx4APPinDgxSjs8OfInGg3X07TJKJ/AyRe0p0ldfcj/JJQeDwVtCcnb7nk0e0lKn65y61CJSE7EnxlI34Tz1okJOQ0mvnqoNE0+0PJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kKYsXffn6HfynDK8LPkLfFJ0rS311cQXK0svujjUjwI=;
 b=ab5rpifQye2VqRB6Z/4ws+csl4kzPMkFAx+yZruqz1H9Oyc/9AoefTeUa/OkRElpmpnsGKUsg6sXokNZywxq/XgPHpjm3Wev+kcxhT2/PCEZuXJy9n452EQWk/k4aDpkYNIlwu7brk1sQApc5Af6JNiDPA126EkM8vnnoYO5wKLaTHO6fH4vaBJaoa9bWklirT+Vnh207mRcOO42amSN6wsryAHrv/uNOKd9ZOIiwbxlwG8IQPH/jsc+TYkONamAjHU3wiUJftI3R2Ll00xm5B6HmGa8ZNYy0kkG1QBc/Rw3NINZQhSV2Sk3taftUvyiJhSOW0Kt5/YVIpK5Okf5Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kKYsXffn6HfynDK8LPkLfFJ0rS311cQXK0svujjUjwI=;
 b=e33vmbfHLsA+PbrgtaH64E4cDjRgQUgbCq/2JpZT60S4csKfB3TEmm/ecviG1b7kfkx7k+COIsoS8TIsCU0UlY1aR3hQevMWZsSpnArPB3GSK8lTwcJ2HAe23VsTmo8IDbhvaXiV0JN6MmkaGfHdZcuNdU0StZvqmlZxQyT42PM=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CO1PR11MB4929.namprd11.prod.outlook.com (2603:10b6:303:6d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Fri, 1 Jul
 2022 16:20:52 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5395.015; Fri, 1 Jul 2022
 16:20:52 +0000
From: <Conor.Dooley@microchip.com>
To: <p.zabel@pengutronix.de>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <palmer@dabbelt.com>, <Nicolas.Ferre@microchip.com>,
	<Claudiu.Beznea@microchip.com>, <Daire.McNamara@microchip.com>
CC: <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v1 04/14] reset: add polarfire soc reset support
Thread-Topic: [PATCH v1 04/14] reset: add polarfire soc reset support
Thread-Index: AQHYjFiLUdivMuF33kSysKGuotnsQq1nqk8AgAB3kwCAAZJ8gA==
Date: Fri, 1 Jul 2022 16:20:52 +0000
Message-ID: <df782fe9-4c2d-5df7-f3ba-78eae6f0cfbd@microchip.com>
References: <20220630080532.323731-1-conor.dooley@microchip.com>
 <20220630080532.323731-5-conor.dooley@microchip.com>
 <813a3b51f82a11a86bd3af2c3299c344e08e8963.camel@pengutronix.de>
 <eed577e2-b416-dfea-a830-2c037e34ac64@microchip.com>
In-Reply-To: <eed577e2-b416-dfea-a830-2c037e34ac64@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0bbd6ec8-29bd-4a3f-483f-08da5b7daacc
x-ms-traffictypediagnostic: CO1PR11MB4929:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p3VpKVYFwoGw2wewbtk9dnWNd1DMcNpKxHZc5Z+XlS+ZS7Kvar6yGPFMqfrvxzDPbBpo+fSiVT323QXl3kVSJHYiAvBH7ALzzWWYpny6/Fm6gZhJ3JHojvEKxEaV/ERiUgLoI2xV3qeIC1YF0Gvopo1DbkGNMoXE4d3kFJyKCuhP4K6Sb2wRqIG9oAIv21Q99x8eo3yrLWXHAy7LvGeHOhbIUZLi9QaBrnHjPdVXgU56UayrW5921e+yCoBOWaV/Pr9ukbdwpCK6Y/OAkssN4/M5C+We3t9iyRj703TcHu+PACjIp1QKbHYnJZNevcmrwF0oq2BAbH6uAckjCOWTJ0ftfHCt3J19YZSoORAwcrAucIxrqjT4hATykfpwXdrCHPasMX+5JojKRv6L5EwGXPkzEG/Wp+/D6vmuRAPVMKFxMVPwRc2UeQFBg+RSQ9NxBAJpegxtLY68rnekcSRol93HkJE4sxVEULNsoI1+V9d2MDgtji+WyUiXekzEoxeQetSOF12qwS9rW1W/sYZDw4J5v7MizKTteDP1FYT+iRGMpPympKk/sqx8N0gOB7CPPrpKWAMQjQjUcI9OcqLJYPE9oMsfqihTrzHc1Myrt7ThrdE9EWg8ncjHLHD9aT/eq6fmz+UV6DSey8KI66vtHy0SKVwuChuxjOe3N3bbIKXlh/FAhhUrtgrCLE8qptUMBSV661/gzn4T8ypeAhqOHf5USUEVsvzJYx2aTWsyxzPLAd8Z+4WldgxYArNfb3sWaxmrbOPwL2/TejQskJ0eTLGDBQW/MBxvtt40TQUTVKldyDxgzgGyLzm9bQWJqUt226o7O9w0Eszd+39Je2EF1GQMaVlEwWR7x7mzB+y9Cir1qH23mCsUP3cb8eHH2yV8xyoHA0rEC4SMrOnIzRqUNw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(39860400002)(376002)(346002)(366004)(396003)(66446008)(83380400001)(921005)(31696002)(478600001)(86362001)(36756003)(66946007)(38070700005)(38100700002)(122000001)(71200400001)(6636002)(110136005)(186003)(2616005)(53546011)(5660300002)(41300700001)(54906003)(6506007)(26005)(6486002)(6512007)(2906002)(7416002)(8936002)(76116006)(66476007)(316002)(8676002)(91956017)(64756008)(4326008)(31686004)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OFE4c201VG1JR2VSaERRUWxyOFVleWVwRFdCd2tiOUc0aGRCOUp1eWFZSTJU?=
 =?utf-8?B?V0ZqQmZpRjRiU1NqMFRpTEZYTHliSmQvOHVIdy9HWjBFeG5OVC91amVnWVI5?=
 =?utf-8?B?cEdJa2RVZWNOM05TQ0xWVlNmOUdKVWVRR2djcTFXQmhUSTVCTkNHbXhGajlu?=
 =?utf-8?B?RTNjQ3FwWFpNVjd1aU0xZzJKcnovWC9YL2lQMWZuZzNGZ1pjcVoydVFJUmZw?=
 =?utf-8?B?MTlxOExtY3phR1d4UTdaWFVBQWhqblZWQXVtems3NlhNS0ZMUmU4R0RWNUgr?=
 =?utf-8?B?T041YXFMN09KbUhUZFBSMUo0MVVpd3JDb0lrN3FMdnd4MXpyRnkvT0VGZzNv?=
 =?utf-8?B?YzFlQnJJMnoxR3ZrTEtCeVk3ZlpLUGw1TENzTFp0Q1JQVXhiYkFjcTZybk5L?=
 =?utf-8?B?NHpJYmhQbGQ5S08vOCthQlh6Z3k4QVU4UzlIdmRNdmtBOUNzL1lNc1hvM3Yw?=
 =?utf-8?B?TW9rUXdrT2dCY2JoZ3hYMHhub1pna0U0NjFGL0k5emp4ZThSYkR1a0czMklO?=
 =?utf-8?B?OHc1bWlUcTl2Q3pTak9hWm84WGNBcW1naVI4WEROVWhXdC8rcDBpQ09Gcm54?=
 =?utf-8?B?QVFiVjM1OFFXeUZFZ0dMcHZZN2k5Q3NQWlRKTnU4dVNqNnQ2MzhBbktvMlMy?=
 =?utf-8?B?R3dJc1lNekpYcWNyeVgxQkQ5TWpHdHh4UHRjMHVLL29IdC9FVnNQdVltNFdP?=
 =?utf-8?B?TTNRdWZEemdSVmQ4UEkvUHYzYlRwUnNGRnhNVm4yTVpPcjVnQWJSQWVmbW1s?=
 =?utf-8?B?dERwZ1VVNlc2NzBRT3Q3anI0WGYxT3QySFpCMzJpN3QzenlLRXUzRjlLM25Y?=
 =?utf-8?B?Y0xvNUxvQ2UwQjdtbUp3VTJEaXEyYzFrTDdSZDg4L3VxdkQ2V1kyazY3RzU2?=
 =?utf-8?B?Q3l2YWdRZGNxTU1OMHRISzJaMHRGWVl2R1ZnbWRjMXR0SlFlN2Z0QjlSeTll?=
 =?utf-8?B?YUdYMWVKaHIveURyV2ZKbE8wTFYyZkovRVFtakkzQUtaTUtRV1Q3N1B5QlVj?=
 =?utf-8?B?NXk0STRSQ3p4QjhHK1E0eDl2czREaTEyV05sRy9qNERSNlpzcXlMWGtpVzB2?=
 =?utf-8?B?Q0cvRkdqUitxQzlHK2d1cXcyWlVoTWZBaTJqOWVSTk1Yajc3TVZyOXVVSjFm?=
 =?utf-8?B?UUVaMTRqTUF3MG1mdm9GQnpyMkJlNitkM0NmMnkwTkVmTVJlMVRnWmFqYU9Z?=
 =?utf-8?B?R2hjd2V6TkFvajVCbnZhT05TdlVzS0JNaFFBMmRnK0VaalNtbHlPcmxlMjNW?=
 =?utf-8?B?SWVrVkFMamg4bW8rODJGNXhxb0M3Q3YzeEhNcVVZZCtpeDZ3d1RJYzIwL0R1?=
 =?utf-8?B?ci9WWmhuOHRseVJZTTFia0p4eGl6TkJXbWFpRWtoUXY5d1FXM0FWUUhUYVZj?=
 =?utf-8?B?OTJiS2x1WnJNWnJsQzV3NS8va0ZGR3hnSFIyZHJWU3A3eStmdm1xTWVzSXcx?=
 =?utf-8?B?cHFZdk40dXZMNXBxVFlXbXk2N2s1WEloVUovMmg1SjJuMHRQOWI4eGRKM1Bj?=
 =?utf-8?B?emJ4dklveUVsK1c0K0s3MVpqdlFGRElWYnFMVTlaRjBSYlRwemR1M1UyWU13?=
 =?utf-8?B?TGt6MTNBdVVUVnBGV3JuYWpKS21IbU5sUWlYYXl2N0ZKc0NsTUtBUGc5U2hU?=
 =?utf-8?B?dGFHRitzMGhma1hwYVdpQ2QyVjBYMHNVYzRMUzFSQnM5MzBnNitrTmg5RThq?=
 =?utf-8?B?aWhkUnRib0Rlc2RrclRoM1pFdTAyMWNoQnhiT0k5TCtpQi9VQ29pdGFBZUxq?=
 =?utf-8?B?dWRDbk9hOHlCMlZhK21rUE1VN0dNdGFOR1AyRnFTZGtrZXh2ZzV6QUZSWS9Z?=
 =?utf-8?B?QnNmUUNLdTd1SFMxNlVUUjhYcXhtOWIxN0lNbU1ibGJvbzBUOVNwQ2xVbndk?=
 =?utf-8?B?YUFzN2RENmM2MDhsZjU1UVh4eWdObjc0WkNGenFPNS9mWE1DTjhxaWwvV0M2?=
 =?utf-8?B?THRlZU4wYzFoUUVrRlhxMS80ZXFRSm4rajlhM1UxR085aEdTbTh3aGQ0OUtw?=
 =?utf-8?B?aC9qSVc2eE5ralJZdmVNM1R4SXpWNlM1dGZBVTcvWURIcW5zZ0ZDQXVENWVu?=
 =?utf-8?B?eTJic3FKZGY0Um5oNHY3bEhoWGNMU3NjSUdjVTdzYW5PeEs3eU9nS0FEMTAx?=
 =?utf-8?B?UURraGhnNU9YdWZJd3FHc0dSRVVBTFNjWGVMendJUFdZMnRHQlBKRThBaGlF?=
 =?utf-8?B?Unc9PQ==?=
Content-ID: <FE42C0446F923F409B9F277F9F03179C@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bbd6ec8-29bd-4a3f-483f-08da5b7daacc
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2022 16:20:52.0276
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cHT+kuu3EHWS+4v17BnYsl3C+SGdvurPCVWC6ziy2vZzJvARKOBlUW2VUWPCC9ZS49fcFSIWs8cX3H96lKDr47k+d9AYZuPCfpDObygtxDc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4929
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_092218_774673_C3677B2A 
X-CRM114-Status: GOOD (  17.73  )
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

On 30/06/2022 17:20, Conor Dooley - M52691 wrote:
> On 30/06/2022 10:12, Philipp Zabel wrote:
> 
> (This came to me oddly quoted, so I have fixed it myself)
> 
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> Hi Conor,
>>>
>>> On Do, 2022-06-30 at 09:05 +0100, Conor Dooley wrote:
>>> Add support for the resets on Microchip's PolarFire SoC (MPFS).
>>> Reset control is a single register, wedged in between registers for
>>> clock control. To fit with existed DT etc, the reset controller is
>>>
>> existing                     ^
>>>
>>> created using the aux device framework & set up in the clock driver.
>>>
>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>> ---
>>>  drivers/reset/Kconfig      |   9 +++
>>>  drivers/reset/Makefile     |   2 +-
>>>  drivers/reset/reset-mpfs.c | 145 +++++++++++++++++++++++++++++++++++++
>>>  3 files changed, 155 insertions(+), 1 deletion(-)
>>>  create mode 100644 drivers/reset/reset-mpfs.c
>>>
>>> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
>>> index 93c8d07ee328..edf48951f763 100644
>>> --- a/drivers/reset/Kconfig
>>> +++ b/drivers/reset/Kconfig
>>> @@ -122,6 +122,15 @@ config RESET_MCHP_SPARX5
>>>         help
>>>           This driver supports switch core reset for the Microchip Sparx5 SoC.
>>>
>>>
>>> +config RESET_POLARFIRE_SOC
>>> +       bool "Microchip PolarFire SoC (MPFS) Reset Driver"
>>> +       depends on AUXILIARY_BUS && MCHP_CLK_MPFS
>>> +       default MCHP_CLK_MPFS
>>> +       help
>>> +         This driver supports peripheral reset for the Microchip PolarFire SoC
>>> +
>>> +         CONFIG_RESET_MPFS
>>>
>> This doesn't look intentional.
> 
> Correct. I fixed it when rebasing on -next and forgot to re-fix it
> when I had to reset back to -rc2...
> 
>>>
>>> +
>>>  config RESET_MESON
>>>         tristate "Meson Reset Driver"
>>>         depends on ARCH_MESON || COMPILE_TEST
>>> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
>>> index a80a9c4008a7..5fac3a753858 100644
>>> --- a/drivers/reset/Makefile
>>> +++ b/drivers/reset/Makefile
>>> @@ -17,6 +17,7 @@ obj-$(CONFIG_RESET_K210) += reset-k210.o
>>>  obj-$(CONFIG_RESET_LANTIQ) += reset-lantiq.o
>>>  obj-$(CONFIG_RESET_LPC18XX) += reset-lpc18xx.o
>>>  obj-$(CONFIG_RESET_MCHP_SPARX5) += reset-microchip-sparx5.o
>>> +obj-$(CONFIG_RESET_POLARFIRE_SOC) += reset-mpfs.o
>>>  obj-$(CONFIG_RESET_MESON) += reset-meson.o
>>>  obj-$(CONFIG_RESET_MESON_AUDIO_ARB) += reset-meson-audio-arb.o
>>>  obj-$(CONFIG_RESET_NPCM) += reset-npcm.o
>>> @@ -38,4 +39,3 @@ obj-$(CONFIG_RESET_UNIPHIER) += reset-uniphier.o
>>>  obj-$(CONFIG_RESET_UNIPHIER_GLUE) += reset-uniphier-glue.o
>>>  obj-$(CONFIG_RESET_ZYNQ) += reset-zynq.o
>>>  obj-$(CONFIG_ARCH_ZYNQMP) += reset-zynqmp.o
>>> -
>>> diff --git a/drivers/reset/reset-mpfs.c b/drivers/reset/reset-mpfs.c
>>> new file mode 100644
>>> index 000000000000..49c47a3e6c70
>>> --- /dev/null
>>> +++ b/drivers/reset/reset-mpfs.c
>>> @@ -0,0 +1,145 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * PolarFire SoC (MPFS) Peripheral Clock Reset Controller
>>> + *
>>> + * Author: Conor Dooley <conor.dooley@microchip.com>
>>> + * Copyright (c) 2022 Microchip Technology Inc. and its subsidiaries.
>>> + *
>>> + */
>>> +#include <linux/auxiliary_bus.h>
>>> +#include <linux/delay.h>
>>> +#include <linux/module.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/reset-controller.h>
>>> +#include <dt-bindings/clock/microchip,mpfs-clock.h>
>>> +#include <soc/microchip/mpfs.h>
>>> +
>>> +/*
>>> + * The ENVM reset is the lowest bit in the register & I am using the CLK_FOO
>>> + * defines in the dt to make things easier to configure - so this is accounting
>>> + * for the offset of 3 there.
>>> + */
>>> +#define MPFS_PERIPH_OFFSET     CLK_ENVM
>>> +#define MPFS_NUM_RESETS                30u
>>> +#define MPFS_SLEEP_MIN_US      100
>>> +#define MPFS_SLEEP_MAX_US      200
>>> +
>>> +/*
>>> + * Peripheral clock resets
>>> + */
>>> +
>>> +static int mpfs_assert(struct reset_controller_dev *rcdev, unsigned long id)
>>> +{
>>> +       u32 reg;
>>> +
>>> +       reg = mpfs_reset_read(rcdev->dev);
>>> +       reg |= (1u << id);
>>> +       mpfs_reset_write(rcdev->dev, reg);
>>
>> This is missing a spinlock to protect against concurrent read-modify-
>> writes.
>>>
>>> +
>>> +       return 0;
>>> +}
>>> +
>>> +static int mpfs_deassert(struct reset_controller_dev *rcdev, unsigned long id)
>>> +{
>>> +       u32 reg, val;
>>> +
>>> +       reg = mpfs_reset_read(rcdev->dev);
>>> +       val = reg & ~(1u << id);
>>
>> You could use BIT(id) instead of (1u << id).
>>
>>> +       mpfs_reset_write(rcdev->dev, val);
>>> +
>>> +       return 0;
>>> +}
>>> +
>>> +static int mpfs_status(struct reset_controller_dev *rcdev, unsigned long id)
>>> +{
>>> +       u32 reg = mpfs_reset_read(rcdev->dev);
>>> +
>>> +       return (reg & (1u << id));
>>
>> Side note, this works because MPFS_NUM_RESETS makes sure the sign bit
>> is never hit.
> 
> I can add a comment to that effect if you want?

I'm going to respin with the two net patches removed.
I'll operate on the assumption of adding a comment here...

> 
>>>
>>> +}
>>> +
>>> +static int mpfs_reset(struct reset_controller_dev *rcdev, unsigned long id)
>>> +{
>>> +       mpfs_assert(rcdev, id);
>>> +
>>> +       usleep_range(MPFS_SLEEP_MIN_US, MPFS_SLEEP_MAX_US);
>>> +
>>> +       mpfs_deassert(rcdev, id);
>>> +
>>> +       return 0;
>>> +}
>>> +
>>> +static const struct reset_control_ops mpfs_reset_ops = {
>>> +       .reset = mpfs_reset,
>>> +       .assert = mpfs_assert,
>>> +       .deassert = mpfs_deassert,
>>> +       .status = mpfs_status,
>>> +};
>>> +
>>> +static int mpfs_reset_xlate(struct reset_controller_dev *rcdev,
>>> +                           const struct of_phandle_args *reset_spec)
>>> +{
>>> +       unsigned int index = reset_spec->args[0];
>>> +
>>> +       /*
>>> +        * CLK_RESERVED does not map to a clock, but it does map to a reset,
>>> +        * so it has to be accounted for here. It is the reset for the fabric,
>>> +        * so if this reset gets called - do not reset it.
>>> +        */
>>> +       if (index == CLK_RESERVED) {
>>> +               dev_err(rcdev->dev, "Resetting the fabric is not supported\n");
>>> +               return -EINVAL;
>>> +       }
>>> +
>>> +       if (index < MPFS_PERIPH_OFFSET || index >= (MPFS_PERIPH_OFFSET + rcdev->nr_resets)) {
>>> +               dev_err(rcdev->dev, "Invalid reset index %u\n", reset_spec->args[0]);
>>
>> s/reset_spec->args[0]/index/
>>
>>> +               return -EINVAL;
>>> +       }
>>> +
>>> +       return index - MPFS_PERIPH_OFFSET;
>>> +}
>>> +
>>> +static int mpfs_reset_probe(struct auxiliary_device *adev,
>>> +                           const struct auxiliary_device_id *id)
>>> +{
>>> +       struct device *dev = &adev->dev;
>>> +       struct reset_controller_dev *rcdev;
>>> +       int ret;
>>> +
>>> +       rcdev = devm_kzalloc(dev, sizeof(*rcdev), GFP_KERNEL);
>>> +       if (!rcdev)
>>> +               return -ENOMEM;
>>> +
>>> +       rcdev->dev = dev;
>>> +       rcdev->dev->parent = adev->dev.parent;
>>>
>>> s/adev->dev./dev->/
>>>
>>> +       rcdev->ops = &mpfs_reset_ops;
>>> +       rcdev->of_node = adev->dev.parent->of_node;
>>>
>>> s/adev->dev./dev->/
>>>
>>> +       rcdev->of_reset_n_cells = 1;
>>> +       rcdev->of_xlate = mpfs_reset_xlate;
>>> +       rcdev->nr_resets = MPFS_NUM_RESETS;
>>> +
>>> +       ret = devm_reset_controller_register(dev, rcdev);
>>> +       if (!ret)
>>> +               dev_info(dev, "Registered MPFS reset controller\n");
>>
>> Is this really useful information for most users?
> 
> Probably not, but it is useful for my CI haha.
> If you don't like it, I will remove it.

...and removal here.
Thanks for your review Philipp :)
Conor.

> 
>>
>>> +
>>> +       return ret;
>>> +}
>>> +
>>> +static const struct auxiliary_device_id mpfs_reset_ids[] = {
>>> +       {
>>> +               .name = "clk_mpfs.reset-mpfs",
>>> +       },
>>> +       { }
>>> +};
>>> +MODULE_DEVICE_TABLE(auxiliary, mpfs_reset_ids);
>>> +
>>> +static struct auxiliary_driver mpfs_reset_driver = {
>>> +       .probe          = mpfs_reset_probe,
>>> +       .id_table       = mpfs_reset_ids,
>>> +};
>>> +
>>> +module_auxiliary_driver(mpfs_reset_driver);
>>> +
>>> +MODULE_DESCRIPTION("Microchip PolarFire SoC Reset Driver");
>>> +MODULE_AUTHOR("Conor Dooley <conor.dooley@microchip.com>");
>>> +MODULE_LICENSE("GPL");
>>> +MODULE_IMPORT_NS(MCHP_CLK_MPFS);
>>>
>> regards
>> Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
