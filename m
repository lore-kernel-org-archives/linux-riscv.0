Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D60C32771
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 14:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dIO1WrglQ/Fqml7oeL8/PB6S3/W59F9gPRXCQ+yqOeY=; b=ZzcWhEXwq8T0Jc
	BpRBtyBGq96lDffJzz73M3lzfHRTqOntQ3ri8p94CK904yFDV1/PC0ky/ksw4jR49Z4V7Ek9LaNPJ
	2PKNSo/JwdIDGNYIaKlKhCDijy0BA/Nj1LF2v7D1Wv+paHU+Mz0maY0g0JIIh/saPTB5IieROxXVy
	Mcs5kqVXHFIkrH9Xn8oUEwVQW5wNP3j20qB+AC+IRge3lWz5MQ1EaQoY4OrXnpu9te5GK6apk7YRT
	nUAp5elqtTMl7PGEhfwoXlOAn99kFUFiEFxiY6v8uRDCofaE66vyf9yvWuH+H5rA+b4XuqOF0fg8t
	BAPYXnl/j7j8ipY3P+QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP32x-009WfS-Mi; Fri, 19 Aug 2022 14:32:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP32u-009Wcr-FS
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 14:32:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660919543; x=1692455543;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=VWyqepu5/oYiahH+n7isnmUV2y9xD4r1Bw6QGPue5zY=;
  b=CeYrnYiBNijwI+Gt+3Gy5/qC0qrm9aecyOV7IQ9vOe82BLzx1tQfiKJN
   DJT8W5rsvGL9zZDmFqk++ZMdXTnIec0lC4ppYE8DYSwMK9DrBibhMpAK6
   k2vmMCVpgzfm1t695mg0hBLWeclohqyVksYK6DxLfjKXjrqU4W9HcmouX
   2+viHKdteE8ZWU0Q7Gmb7zJaSGilR/CIguLQx8ns4W4HFb5uDCT7NMtYZ
   UXrm28E2T8ET1Hmh0lY1iLzdG3/yyEhZJK5Hk8r7a5iq1DT+7jbYdQNcl
   aLuZvSXdJzhMFQdgVHMGs7E8vjV/y4izENzzou4F/35gyfjORbzc2h3kP
   A==;
X-IronPort-AV: E=Sophos;i="5.93,248,1654585200"; 
   d="scan'208";a="177085967"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Aug 2022 07:32:16 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 19 Aug 2022 07:32:15 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Fri, 19 Aug 2022 07:32:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HH3pG0kY/YOIcMdmZBT2lxQhPBBBUYwh8R/J/Pzx2ZvY8jdxAQdwOaT6ikW9XL9BHaC9OduPAAJXU+4x69KFMFTzE3porTo0ZwhyGBmCJcUdChsmp4C4/tUgPZXCWDgfSZUIP74LfO54iTmcEXOA/TzmF/zAV8LNoqViDMJKSS0fX9T3m4qo7iDb+oSoVwtubFOeay6BKOydXcWaHI5sRiclByojG+BvA/rxeab1f6LmijJDCdG12oTiikLNJdwmI27wEeJ0NhI0KUv3zdYXOynPF1NW/m1OAPXTwhXYNUtcO1wK57C6AUOAo1/+6rCsQjOUYI5qYmoeMdyy40RIxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VWyqepu5/oYiahH+n7isnmUV2y9xD4r1Bw6QGPue5zY=;
 b=JIoLEKTYlwdtB+EKL7U0VCAQr/VnUq0NrXO1mAU3wncmq7XWNn3Q5SHYfylByXJD5Oz+IE0p6DdH2/KBq4AvKPtnsxrS0Cdn0HaVDQaepv/M1DdNHnpUEjAknM7bfKWfs+aja5EseAbLiIOgo47WXi8ekyNkKGUrZ5Wp8CW3W9nmzd/UINCTrNoUA+8QK7gPJjhNUqmTnkQc+I+VyYT5aVQbOi/4wjeUYeULT7yd8u7BTn0kLBvcejT/4xhstXvFBtcUFnyER8dcP0CLu7wzXrjQO9o46OJNPDGza/kbUj3nG3gu/LwEU3nwgK7i+GmGVhdFg6CBwKqLWDVEE96b7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VWyqepu5/oYiahH+n7isnmUV2y9xD4r1Bw6QGPue5zY=;
 b=b3cZujPzlWj2QRYXvrhMk9OkIrM9R1ztGFNaHB2x0IQDg6krLdDSjuGS33BCdhHFi231cmn1h+e+7S+UQXU65f9v/xT7xMB2dTkCouYH5lsdwuOV5/tPfV/+knfjZ28gzHdvRXSuxUK/J4o2Co/EaqsQ5I+ruvnpceFsGqX6T6c=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM5PR1101MB2172.namprd11.prod.outlook.com (2603:10b6:4:50::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18; Fri, 19 Aug
 2022 14:32:10 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%9]) with mapi id 15.20.5546.018; Fri, 19 Aug 2022
 14:32:09 +0000
From: <Conor.Dooley@microchip.com>
To: <krzysztof.kozlowski@linaro.org>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<Daire.McNamara@microchip.com>
CC: <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 6/6] riscv: dts: microchip: add the mpfs' fabric clock
 control
Thread-Topic: [PATCH 6/6] riscv: dts: microchip: add the mpfs' fabric clock
 control
Thread-Index: AQHYs8dCZDCkQVxYIEq9YtBMJX9yKK22LDYAgAAHm4CAAAPOAIAABY6AgAAFKACAAAINgIAAAmIAgAACh4A=
Date: Fri, 19 Aug 2022 14:32:09 +0000
Message-ID: <560e80df-4819-1062-50ee-eb1d1d19bae1@microchip.com>
References: <20220819122259.183600-1-conor.dooley@microchip.com>
 <20220819122259.183600-7-conor.dooley@microchip.com>
 <3df8d4bd-3d38-cecd-6589-ccc1be01b886@linaro.org>
 <3ffba600-bda9-8ffa-a435-9a6f94e072b8@microchip.com>
 <f3d8be5c-737b-8c71-9926-a4036c797769@linaro.org>
 <19ca2ca1-c678-c669-4214-e92416e37191@microchip.com>
 <138af26e-8e36-63a0-d3a0-5af866318839@linaro.org>
 <f8496006-7487-7b7e-1a53-ec38492dfe70@microchip.com>
 <4e12e8c3-2170-eaab-d910-f674bcc93f79@linaro.org>
In-Reply-To: <4e12e8c3-2170-eaab-d910-f674bcc93f79@linaro.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1300ade7-c21e-43a0-443a-08da81ef9988
x-ms-traffictypediagnostic: DM5PR1101MB2172:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jP4CzNCLroctCqw5hPvYqUwp9hLuboMYWNrj/72JjD1hn7X9J11aG4SOUYrgtGhEJ3U5+ITO0vPSmha1lcUBjXDuLp0N810eJLyf0FQEm7gi3v3W7hqxTbDmyytzdIw+RbqZJLsXeFX2LoVsawrDLqMtH7l0josllAM+TV9SyGPbCLyeAhEwwCL2uvmhobAYy0W22rSHi4p1CbzTctjQIFasUkpMbFcpHZPrxodExPglq94ASlEnnT0Uh+AH51OkSCq2/0CrXvMrj3ZWrqTosFG157SMwen7blEBmUlc+wdm5ULeq4DYJS5IQ3ywslY+AYCcFhsoVlpg0Xdep0AODkfwG0flsAqc191Wl03642A59Ki37rwAqFqLMu2Y2A+HLOKHHrTJmZkb3IP7yTbJIfbN9odGAoA/UtCVj2Qr8BV78bp3gW1w1/baMM4QOe6pR7PDzWzcMeO2KMS7446PYxLOiEhBtHQjuFUwNMRJqOsFOqCT2Eq0CsodVYRZvQCgZ/u1t5+RY9eocZdCdxukp4ahu+rRL7oYB/eltjAKhEqoA2tBgWRtJWO4T7xNyo+oM3Jf9rwRvb8v11xvmqklRjsmImWhfqIBXDvH0WTXMxO3n7Ry0B8vG/pzMMThL5C8oGuRt8FMNPOHJnnu794EkWZnSSX5pDRrYibuEuyL2AjragEMAiR5n5QJjbmWkUg/okBFXl2MDdTJLo57HfqSfaK6Er2uZlfH7O61Gb/taWuMZ31pCYDQDwf3O9UZcCiR+PKJR4yiujsdnmAGXAU4Ku95hGQk770SYNwdwJvW2LumLMsBbK78a3C+mS5zWQsb6hJyalZBjfUEsOyOrFUQiw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(346002)(39860400002)(136003)(366004)(396003)(186003)(2616005)(83380400001)(6636002)(316002)(91956017)(5660300002)(26005)(6506007)(6512007)(36756003)(31686004)(478600001)(41300700001)(71200400001)(53546011)(6486002)(38070700005)(86362001)(31696002)(122000001)(2906002)(76116006)(4326008)(8676002)(66946007)(64756008)(66556008)(66476007)(66446008)(54906003)(38100700002)(8936002)(7416002)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MzY4VEdnZkNZTkFYRHdvL3hpKy9FQUdZRW5waCtBSng2eWtrcWhLcFo4WkpX?=
 =?utf-8?B?Y0FKRklWZ05Jd21ZL1pLampwT3lUTWNpY3FnMWppalJHdnZnaUJxUDVNbG15?=
 =?utf-8?B?L1NoQVdrcm1oWWw0V3ltVThRL0U4elRwdDlodGhOOGphcWp3NGdvbzB1cmRi?=
 =?utf-8?B?MzU5OTBJcis2bnhiNkV5VVNKVk1CeXFhK1o5ZEZZdjN4bm1RVncxbGFTQUp0?=
 =?utf-8?B?VStjbzNkYklNVDBLem9TRFp0dlplM3RUeGtRcloxYzVaQnM1SHZWNitrWUFR?=
 =?utf-8?B?eC9sTjg2aE5LaWViSFl5bDFnVFVCbm56NHF1U3RJUENKMjZhQm8zcWZIZDVu?=
 =?utf-8?B?cm14R01rVmI0R09NbE1VSkY1SkFKZUlsRkVLKzNkRURoelBSYkdYQkkzV1g0?=
 =?utf-8?B?L2pBZlRwMENzWUlIZytLaUlXOUw0TmYxUjZIUWxuNlNlMGpoSHRDL3Facy9p?=
 =?utf-8?B?Y2QzTldWRUtkbUtubzBVR3pZQk10ZWRqb1FvZGprQzNhZ3V5ajlTVUpSRTlh?=
 =?utf-8?B?eTlFakt6NVN1dnVCR2cwdUV3UDQxa3k1bzV1OFBCa0FiRTRlQzdHdWkxQWt6?=
 =?utf-8?B?RGxXN2YrcXBjUnNiSXZDV2tUQnBqT25Ecjd1Wk5KaTF1T3ZlVzFrUDZsK0ZK?=
 =?utf-8?B?T3J2R0JuOVdXTzhub05qTCtrbS83dHJVdU56SEY2VEYwZ09iOXN6UVNDNlV3?=
 =?utf-8?B?d1MzTHpiRnpSMmUxbEtyR2pLeTJuWmlZNFJRSTJLZzdGZlZnSmFVbWpxbnMz?=
 =?utf-8?B?TnlGdmhrRGM1a1I0TGd3MFVLeXZkKzNwUGxqbEozenVubjY1ZEh1aGdTSC9Q?=
 =?utf-8?B?a2hRRXdkR1BjNzczRmVuMTYxUTVaQm5VVnZjaWNVeTlBSDhFTHBYSHQvb0Vj?=
 =?utf-8?B?TmpCK1ZXWkdNQ2FlSEgzQlduYVlBMzBOQWh1bFhJaWc0NllZRmxoQ0dwQng2?=
 =?utf-8?B?Ykk0dUIyS2dVZjRJZ05XaThCbGpoby9DbXI1R2txN1hvQ1NKSDdRb2Rlbzd0?=
 =?utf-8?B?OTFPeGpiODBzcFhiSkpSRkRRYjVYcTZzNVFjaW5WYU5DSzBROWJqYzc2Zkcv?=
 =?utf-8?B?VlV5a01SdVBOOW5VeHpRTDFibGhXRTdCYy9FRlMrbjhETmFCRnhUVCtCMnBz?=
 =?utf-8?B?cWZ5Q3Q2dXVsVnRCeTNTT3RjdTZaUzZUYlpzMi8wOUFacnFrU05hbmtOMGg5?=
 =?utf-8?B?ZzNzZ2RwblZDckJ2eGNudnFTdXFod2d1Z1B6dDdyQTdiUnd2RTAxVm5QRWcw?=
 =?utf-8?B?VnJuay8wRGNNTzkvZkJrNndzeTh5NDNiWFc5VWVwc1B2cURlKzNxM1FhUlVQ?=
 =?utf-8?B?RXR0bWpCWm1Xei8zZVBVTTVkemVkY2thQUdHWW5OUkYxb3dLTzR4OW81TWFz?=
 =?utf-8?B?MjNnc0ZTRE1HTEUvWUlqYTF5SW01UUc1TldGbUpETDVvcmJLaTg5Qi9pNWE5?=
 =?utf-8?B?VzZUTkN5YnQ3ZWVDR3ZUNHJZeTZndGkvZnY5Yk43eWpNOU5sTXN5MzVaRW5I?=
 =?utf-8?B?bTdCL1VmL1lRcC9hRjFuTXZmWkZsaWtobEtObTMrcEt1cGc5NXBNVGhJSHF2?=
 =?utf-8?B?NWcreEswN1ZqOHdyN3lXNmtkaU16NCtKb1hKVlhaajdjTEQva3FKNlNQRE1k?=
 =?utf-8?B?QXEzcjVFSkdsUG5TSWFrWjJkeEl4aC90cVdGL3BsaTVNWm9zZWIvV0lZRlJS?=
 =?utf-8?B?N2RsK3gzT0JDZ0Q4ODVSb1FEZjhRRU5INHN0TFNlanRDeVByK0NMNGJYYitr?=
 =?utf-8?B?cnVBOWkxaHlNRStOZnAzd1ZDaUh3Y3oxSVVROGlmVThZMExRdnRlWWh2bnI2?=
 =?utf-8?B?a0RhQ0FmSGFhdmgwVzh0S0ViMUorQUJ3ancxRUVmRXBoZ3lQQkRQOFNpZzlz?=
 =?utf-8?B?UmdQamdLWlduNmpYYWJQUXZPcXlXN1ZpWm5FQ25SdXlCSDNSckI1dm1DL0lQ?=
 =?utf-8?B?ZjE5NHg1clVkaEZPaWdoWGNETXhDRTdEc2VwSkRPUkYySkZVYzloOEJkbkEy?=
 =?utf-8?B?NVRuQU1HT1ZoV1IrcWVGRVN2bFJrVTJRbGRXYnJDdVoxMzg0SFY0dktlczVh?=
 =?utf-8?B?T0h4SDU5TWNyK2F6T3FMVklEeWlWU28ybS9FaTBBZnBacnJYQ1NROWdMMG1z?=
 =?utf-8?Q?lh8cyWXRNqHaEL73PZ3+QELZD?=
Content-ID: <D9B279053B053B45BF28701065A54778@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1300ade7-c21e-43a0-443a-08da81ef9988
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2022 14:32:09.8876
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sk66GTjjvvjUUTT9uNSLLSPBgT0WCNm/Z1xnfl46OAJnbCggScU45rS4HRj2WNI8ZUKS6nkZLRNrQoGhTOaZEMqPmo2p0NPIoEJ7gUv8mBk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2172
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_073224_548631_EA975F9D 
X-CRM114-Status: GOOD (  19.56  )
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

On 19/08/2022 15:22, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 19/08/2022 17:14, Conor.Dooley@microchip.com wrote:
>> On 19/08/2022 15:06, Krzysztof Kozlowski wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> On 19/08/2022 16:48, Conor.Dooley@microchip.com wrote:
>>>> On 19/08/2022 14:28, Krzysztof Kozlowski wrote:
>>>>>> Maybe that is me exploiting the "should", but I was not sure how to
>>>>>> include the location in the devicetree.
>>>>>
>>>>> Neither node names nor clock names are considered an ABI, but some
>>>>> pieces like to rely on them. Now you created such dependency so imagine
>>>>> someone prepares a DTSI/DTS with "clock-controller" names for all four
>>>>> blocks. How you driver would behave?
>>>>
>>>> -EEXIST, registration fails in the core.
>>>>
>>>>> The DTS would be perfectly valid but driver would not accept it
>>>>> (conflicting names) or behave incorrect.
>>>>>
>>>>> I think what you need is the clock-output-names property. The core
>>>>> schema dtschema/schemas/clock/clock.yaml recommends unified
>>>>> interpretation of it - list of names for all the clocks - but accepts
>>>>> other uses, e.g. as a prefix.
>>>>
>>>> So could I do `clock-output-names = "ccc_nw";`. That would work for me,
>>>> with one question:
>>>> How would I enforce the unique-ness of this property, since it would be
>>>> a per CCC/clock-controller property? Maybe I missed something, but I
>>>> gave it a shot with two different CCC nodes having "ccc_nw" & dtbs_check
>>>> did not complain. Up to me to explain the restriction in the dt-bindings
>>>> description?
>>>
>>> Uniqueness among entire DTS? I don't think you can, except of course
>>> mentioning it in description. Your driver should handle such DTS -
>>> minimally by gracefully failing but better behaving in some default way.
>>
>> It fails not-too-gracefully at the moment, but that could easily be
>> changed. Truncated base address I suppose would be a meaningful thing
>> to fall back to afterwards.
>>
>>>
>>>>
>>>> FWIW I would then have:
>>>> ccc_sw: clock-controller@38400000 {
>>>>         compatible = "microchip,mpfs-ccc";
>>>>         reg = <0x0 0x38400000 0x0 0x1000>, <0x0 0x38800000 0x0 0x1000>,
>>>>               <0x0 0x39400000 0x0 0x1000>, <0x0 0x39800000 0x0 0x1000>;
>>>>         #clock-cells = <1>;
>>>>         clock-output-names = "ccc_sw";
>>>>         status = "disabled";
>>>> };
>>>>
>>>> & in the binding:
>>>>      clock-output-names:
>>>>        pattern: ^ccc_[ns][ew]$
>>>
>>> Yes, although this won't enforce uniqueness.
>>
>> I know :( I'll respin next week I guess, thanks again.
> 
> 
> The issue with this is that we are getting close to tying bindings with
> your Linux implementation. What if other implementation does not use
> these names as prefix and instead creates some other clock names (as
> clock names are not considered ABI)? Your binding would still enforce
> such property with a specific pattern.
> 
> The clock names should not really matter, so if you have conflict of
> names among multiple controllers, I think driver should embed unit
> address in the name (as fallback of clock-output-name) and the binding
> should not enforce specific pattern.

Not sure if you just passed over it, but I agree:
>> Truncated base address I suppose would be a meaningful thing
>> to fall back to afterwards.

But if the names aren't an ABI, then either there's not much point in
having the regex at all for clock-output-names or failing the check for
it does not matter. I'll have a think over the weekend about what
exactly to do, but I think the driver side of this is clear to me now &
what not to do in the binding is too.

> I can easily imagine a real hardware board design with
> "sexy_duck_ccc_pll1_out3" clock names. :)

If Alestorm made a board with our FPGA, I could see that..
I'd buy the t-shirt too!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
