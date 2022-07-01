Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0002CC43334
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Jul 2022 07:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0WOZLKvprswfgGLFaxvCNGIPbPkdoIvnChfyavfOBMI=; b=qwEhGK63XBjZ9l
	cYofMZfLQGpfmfmkeSA6SJ5w0sEa66YUkSE95egyazKTIKiopt+c7Gr0FE505efgH3p+TgPS5Hi2N
	E0/5vHoxl5xOsfyGsmH+XGOADaR+3y+QT7OiG8OxyZs2Ttjw5UBJguzaYxq2uMIiXzhkRyZlI5hJ3
	/Tjqk4bWBd35yMvCLapv4MGEmbgSW9bksvH+H3EkDNniuRJciLOQ4o/irWJs4H6AL6Cos+Cnodb7D
	Ibj/z9FMWKw0J8RZZcXc61hL9okVL0G4GaylB0bbucelaI9RbDn/ZUQPrtwnM3vhLeYeNebAlEeZ6
	0nPZcWopIoPV8DytXxpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7BNX-003T9f-64; Fri, 01 Jul 2022 07:47:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7BNU-003T8S-HI
	for linux-riscv@lists.infradead.org; Fri, 01 Jul 2022 07:47:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656661668; x=1688197668;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=giXcuKiCJi8W2gUqTe2yUapLxff038jlc58PelCef1U=;
  b=PxVBVTCcJKip4yhfjX/hOlPZDTcqGAEJ1+XhkFcdqIeyRimVhJA3JIeq
   uN8DXM/36Nwovwf/bnlTvw5PFNlqNgmwvHaStn7i9CfyXnP8ZRXN5rca4
   75YMkMUfWJlcq9LgKjTNq3f4s0S88vd61BZuY54iM897RBAZVBE9nrzUp
   0X+3bFC1N0J6EB7jgDKGjKIsQkzIS+HKRN6MoJOp9cm1JhYkqbrFBLeEk
   Q9ShHRXTEO55BLgb7h+rR4rOyAQbTFEFvhfYip5vkuJroIVXMb4V7dXkQ
   VXG5AzNLrzJ3FG0gmi9hovhnrqPMZQ+7JSQxy718MpHOwyfgRiTnb0pbp
   A==;
X-IronPort-AV: E=Sophos;i="5.92,236,1650956400"; 
   d="scan'208";a="165967283"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Jul 2022 00:47:36 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 1 Jul 2022 00:47:36 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Fri, 1 Jul 2022 00:47:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zf5vo6y1P/2Cv8SEhk+x2vudC1TsUwydSopTQZINn4NH4j8Tkx4W+7QQjlA5eq0CfD0e4OFWjD8/iNgLiChGRAUEJSOAL0y9Yo3eog0PTnmbACGCZB0UtWJmxIBrythIHeIdKY+3/nmcOCV2uYWZk+oyQDlWwgu0Q1pVd9s84Jc84KBDMoBKMZXbqsyZoiSKZampXUfZoibEviVVvrVGrnIny89C7IiIj13rRvxzl4OKG+g/ZcChDFbf/OxFLaWaVWbatOlTf0TREKNIFwrs8vgucriCFK80BYiJHtCyd4r35jSVxdS++gKjRyGRSHHr+q9brizia+cciQ8XR6YXxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=giXcuKiCJi8W2gUqTe2yUapLxff038jlc58PelCef1U=;
 b=PrN/J5xZp9yqPK1kDiv3Xwpp50vUKi5w66weXp8bDoWE1vNVjVJoQffQdCEiP8479qH/yM0L0wy6oytly8zDpJkPB4VdDouVfNkK48UD09VMsze16z8y5hMQn7mCRGW3w1gsN3AlzGCWj+SPaw0NDwjILI3pa6auVg6/YMfPBTj71CFWfdRsQnbokCB1PzW3J84KBmc86lBDY5KxQYsh3uUy2ZISwK71JvE0HiueWApj1LVlXc+mxqwAcmF+pa4v9CkdNMEos/k+lf9znJSQzkAQu7VTnJr3CiNG3umKkPEUjfvmXO8YW0P2jVeDZ+xDMXSq+xguPsJH/VdxqLt70w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=giXcuKiCJi8W2gUqTe2yUapLxff038jlc58PelCef1U=;
 b=ZTTmnbjc4Gd56YSmdrsVosAdhNCyXmPV/NZ8fCDzji+MWRmNdvbib4VU5w+72ZY8v31XTgu3BWmP1LRvtwM/wWvj9h77c8g7A+E+b1PuTP2EuXvYkkCAbpU9wBc0bHqGxv968H+rtFwEhCFZ6aLNEwZTMoDZnmz7PiElb8KhafI=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by DM5PR11MB1257.namprd11.prod.outlook.com (2603:10b6:3:12::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Fri, 1 Jul
 2022 07:47:34 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::5c8c:c31f:454d:824c]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::5c8c:c31f:454d:824c%8]) with mapi id 15.20.5395.015; Fri, 1 Jul 2022
 07:47:34 +0000
From: <Claudiu.Beznea@microchip.com>
To: <Conor.Dooley@microchip.com>, <davem@davemloft.net>,
	<edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<Nicolas.Ferre@microchip.com>
CC: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [net-next PATCH RESEND 2/2] net: macb: add polarfire soc reset
 support
Thread-Topic: [net-next PATCH RESEND 2/2] net: macb: add polarfire soc reset
 support
Thread-Index: AQHYjR7TauaCitsCNUadh5DGhDTAlg==
Date: Fri, 1 Jul 2022 07:47:34 +0000
Message-ID: <25230de4-4923-94b3-dcdb-e08efb733850@microchip.com>
References: <20220701065831.632785-1-conor.dooley@microchip.com>
 <20220701065831.632785-3-conor.dooley@microchip.com>
In-Reply-To: <20220701065831.632785-3-conor.dooley@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4b5d6ce2-522b-46f3-1654-08da5b35f5fa
x-ms-traffictypediagnostic: DM5PR11MB1257:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: x5b7YdRcyVXmquqEOBzm13GkkKCRwT/kLNOxysI+6WFH5gfoFLLUkS5/IiDZQENOETOFQ4DKVDp40IFZfQNG1ct7KGA5AUsjR0WxklIwhitP0SdQXgq9GTSTlYOU/Wz2PkX+qUGyoK2YVJUg9NN0KordymQocwfH5P9V0zGoXTPjpQslv1JEN32XEg/F670mBPBnXhwHqG2zckABWDjJtEuRZ4u4FC4LnuRdUe2DKf1i4ZTlKP3K66SKeFWJzTjub7XajSJKrN/mMB7RXmyKyUQD+fa0EHPRHiy9aYKS2dczIyntpodRfW+A9L1b/ZSLR5yY8SVZ8Fnc6UvTpVnOENWeRk2CZ5nFrcb5gOW1FsQskMuyTH3Cm6LGsLNv7YpBC0eDtHoG27YFQUsj6+fssSGohKVMnwq2lggGiq8Pk3WET/HL3VwEJd00bzCnE8D5bpVJEHr79veZwL9sq+FsTQHjb1knBZeJoWaJ/8WwviOkEkisWnWEzd7fBNU9qOcSi8O2MsQhfiKevk381tiffgF+WHlxNgvLNtAiEOZLZkh9SK1YOburidgJTqMnzB1G6RWOAy0I51TO+p/emJy24iHtSKwtNSa3SNuPtly0/Pep/7fm2G+kZ090UjJTsKhctCK1Wg2PgJyRbLmdrH0zQHJ0c53hU+bGhc6UmhUXKvS7xoV0UBeng+pkrRPD8gzJedf2F3jWkA/alOIxdXN1A/ruw607MNEAqbqv49wcCBLgCIo+FFEyoHIvTay86MMPiTXfJozPC1o1yhHjeXc09XxuVVkeEz/+cjPdG3+2v/wVOR8RIJe5+KjvazyRUHZ5g5b5F9f7aeuTpCaq5Yp6OUtDgfCPHXfHGmGK2tgisv9bE/rpP++3ia5pREXvLb6s
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1953.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(396003)(366004)(346002)(376002)(39860400002)(6512007)(26005)(64756008)(4326008)(86362001)(2616005)(5660300002)(8936002)(7416002)(38070700005)(53546011)(6486002)(6506007)(478600001)(31696002)(186003)(6636002)(38100700002)(41300700001)(2906002)(54906003)(122000001)(31686004)(8676002)(36756003)(83380400001)(71200400001)(66556008)(66446008)(66946007)(66476007)(76116006)(316002)(91956017)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dEs2Z056MlRNdkE4SSs3cjNOeEV6V1hKNDgzSzVKZGo5OTE1YVkyK1JMaDE4?=
 =?utf-8?B?N1dPaXU3aHBOcVFmYVQ1bHBSZFVueHI3MXE2TWQ3c0tTbUtuczJmSE9VRkMr?=
 =?utf-8?B?UUJLMlhBWDVQZE1IV3h5RWZWM3pDWGxFdjNHNUg4bzA2T2lEbFF2K1U1WitO?=
 =?utf-8?B?ZmsxaE81YUlYWGdudEl0Z3JuaThMQ01Mcy9JOXpXamQ2ZTEvQkFwSWxyR0gx?=
 =?utf-8?B?N2ZOdEJ4c1FEWWU4dk1laTYxZEpLOUNMZ25IelFXZTQzR0J1VUxSOEVrdVhv?=
 =?utf-8?B?QnIvQ1pGZkgzbDBTYmxhanpLUTRmWWptN0tLZkNvcUZBYkp5R3VhY3JnUlFk?=
 =?utf-8?B?RUhKbjhnUmdmZTRpcG9sWCs5UjNNWXNnMW5GRm0wOU1HWFhXbEt1UGl1NmVh?=
 =?utf-8?B?YzhJS0xHejdCakdRaXZVY1RMTlIraC8rcWNmc0RRT01YTWFJUXZOa24xeFFh?=
 =?utf-8?B?Ry8wQlFkUjJvV1FpSHhWbkJOSmFrUGJ6cXhrTUI5bFdtR3dmOHcrUkxUYkNv?=
 =?utf-8?B?VjlMUjB5SThBTXdCd0NEaU4zNFU0TGR2c3RrMFdEZUtXdlJWZFhNcVJPSysr?=
 =?utf-8?B?TU1BZWYwWW1lTUlaaFZnOFVpQktuZmQrbkcydFIzTjUrRE4yNU9mUEJJVndH?=
 =?utf-8?B?NDVvWTdna05qRklmekN0WUpxclVXOUtoVE9WRjNiOElMZXg1ZDIrVXg4MUZs?=
 =?utf-8?B?N2ZacnYrd2ppcUJTNTFibWpSN0VSM0EzOEcxdnpMbzhiaVNSL0NnY1ozOTFJ?=
 =?utf-8?B?d0dnenN2NUxXUTBVa3FBdTl0T0lBVVJsQThWc2xnejZPS0lOeUJvYXlFOVdk?=
 =?utf-8?B?eDV1b0pvWFYxU3dQSnB3dFhjcjhqb25qOW92NzFJN3ZJVjZSWHQrV2tCUUVT?=
 =?utf-8?B?cXBRUnZraW50S3FwaDBVOGErWTQxUWN5OHBJWkhNQ1NGdDROWCs1TFJDR3Vp?=
 =?utf-8?B?WmNrMFFIZW9iTEpwbDlHaVZubW8xUzdGcjM0MEZLZmlMbkg0cGtjOXUvbkx0?=
 =?utf-8?B?RmVoalYzWWlMWExXemxMTUJjYUw3eDdZOWkydndjNWMxMEloRTIrNHMyZVpX?=
 =?utf-8?B?TTlRSURjaE91SjRYa01weTZ2YmRBaTlaaG00MlJzQmhJWUNwWjdrSGs1a1Ri?=
 =?utf-8?B?UkM3eXFuSTkrOVlTbGNpbjBjb0dqYXhPOTNFcm13TTJuLytyODM5RHgvNWIy?=
 =?utf-8?B?T1E0Y1Zyek1BeXY5K1ZVTGQwemJXS2R0aUJSQjRLdEhXVHZITElpTis5ejdS?=
 =?utf-8?B?dTNMMzNVb3lteXFQWVhlaE5zSVFDTUNic0h6cjFxZklHd2ZOUmFxWU50VmxW?=
 =?utf-8?B?RFYwRDFLa3VjYW5EQnBjSkJCQmFlRE5SVUNyWHNFU29hWnV4NVUvYnFnY2dG?=
 =?utf-8?B?c2ptcWk2RjZhaHU5OG9yZktqbUNiVzVqOWg4aFBlMHhNUnh6eG1hOFROOFFI?=
 =?utf-8?B?T2Vmd0d3OE1XRE9EcDhxWVhvLzBlakorbWxsdzNRbldpemFkRWdXRC9oQzdh?=
 =?utf-8?B?anJXTDE1NjRqZ250clpvRlVxU2VpcGh4S3NtdlllbU1ad2N4WVVVRmJnN3R0?=
 =?utf-8?B?ZTc0djlLWFlVbzcweVpZdlhtNDZTMXJlQ1psU0JiU2FDWG1Xa0V1RzNJQkJh?=
 =?utf-8?B?YWREOXJWNDF2TXV6L05nUnA5S3FRUEgxdTBnby9TRUtpUGYyYVF4LzVHYXdJ?=
 =?utf-8?B?a1laQkN2cHdQRTJWU0p4UG1DcHhmV003anpTZ0Z0UGtkREVlN2RjVEg4d2dS?=
 =?utf-8?B?ZDFXdlM1T3FyVDRRWHlraEkyQ2hySTJpbjBCYkR4MmNKcnlIeDNySXVVc0lp?=
 =?utf-8?B?NjdidUo0VWxvSFhraU1ZMkFlcjZoMEc2eGxqMjM2YUJNc1VQOEJlK2wzWWxj?=
 =?utf-8?B?OEcrcnQ4TVNTRk5DekRVY0VVSXNBemtQZnFHMmFCMjhBVmZlWGZOcWlmWDFz?=
 =?utf-8?B?K2k2SEI3QkVQREVPSytCZVF5dUk5a3l6TUxqM2RuU0IyWk4vU213eTgzMDR3?=
 =?utf-8?B?YWgyVjl2cnVzU0pRbXlZU2dKVkVVbTJHQXQrVjFnQmZTMzVWc1FqeFBSSXF6?=
 =?utf-8?B?UGJzU0Nld3Qxc1I1TE1qOE5HdmQ2RXN3SVVSdTZwSHF2ZmE1am9kRnVTaTha?=
 =?utf-8?B?UkVlcXdZWDJYa3JrYkhiUldsTFhXSVBYM2RZeSt3aS9BU1dYOHozcTlRdE42?=
 =?utf-8?B?S1E9PQ==?=
Content-ID: <0F3AF21E4C153D4BB55C33D71AAA8F4D@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1953.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b5d6ce2-522b-46f3-1654-08da5b35f5fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2022 07:47:34.3923
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4IKXeQFzPTsiPM2a20QpJeqLB7FRFIJs9ASTzp8g1SHcc2VGx/FcvQfdnVRpiPXUD1a5uVVzUJv9Lukz7qT6CFe6AAVXEPV2kwygkgop5Rc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1257
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_004748_886856_C1826601 
X-CRM114-Status: GOOD (  24.99  )
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

On 01.07.2022 09:58, Conor Dooley wrote:
> To date, the Microchip PolarFire SoC (MPFS) has been using the
> cdns,macb compatible, however the generic device does not have reset
> support. Add a new compatible & .data for MPFS to hook into the reset
> functionality added for zynqmp support (and make the zynqmp init
> function generic in the process).
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  drivers/net/ethernet/cadence/macb_main.c | 25 +++++++++++++++++-------
>  1 file changed, 18 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
> index d89098f4ede8..325f0463fd42 100644
> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c
> @@ -4689,33 +4689,32 @@ static const struct macb_config np4_config = {
>  	.usrio = &macb_default_usrio,
>  };
>  
> -static int zynqmp_init(struct platform_device *pdev)
> +static int init_reset_optional(struct platform_device *pdev)

It doesn't sound like a good name for this function but I don't have
something better to propose.

>  {
>  	struct net_device *dev = platform_get_drvdata(pdev);
>  	struct macb *bp = netdev_priv(dev);
>  	int ret;
>  
>  	if (bp->phy_interface == PHY_INTERFACE_MODE_SGMII) {
> -		/* Ensure PS-GTR PHY device used in SGMII mode is ready */
> +		/* Ensure PHY device used in SGMII mode is ready */
>  		bp->sgmii_phy = devm_phy_optional_get(&pdev->dev, NULL);
>  
>  		if (IS_ERR(bp->sgmii_phy)) {
>  			ret = PTR_ERR(bp->sgmii_phy);
>  			dev_err_probe(&pdev->dev, ret,
> -				      "failed to get PS-GTR PHY\n");
> +				      "failed to get SGMII PHY\n");
>  			return ret;
>  		}
>  
>  		ret = phy_init(bp->sgmii_phy);
>  		if (ret) {
> -			dev_err(&pdev->dev, "failed to init PS-GTR PHY: %d\n",
> +			dev_err(&pdev->dev, "failed to init SGMII PHY: %d\n",
>  				ret);
>  			return ret;
>  		}
>  	}
>  
> -	/* Fully reset GEM controller at hardware level using zynqmp-reset driver,
> -	 * if mapped in device tree.
> +	/* Fully reset controller at hardware level if mapped in device tree
>  	 */

The new comment can fit on a single line.

>  	ret = device_reset_optional(&pdev->dev);
>  	if (ret) {
> @@ -4737,7 +4736,7 @@ static const struct macb_config zynqmp_config = {
>  			MACB_CAPS_GEM_HAS_PTP | MACB_CAPS_BD_RD_PREFETCH,
>  	.dma_burst_length = 16,
>  	.clk_init = macb_clk_init,
> -	.init = zynqmp_init,
> +	.init = init_reset_optional,
>  	.jumbo_max_len = 10240,
>  	.usrio = &macb_default_usrio,
>  };
> @@ -4751,6 +4750,17 @@ static const struct macb_config zynq_config = {
>  	.usrio = &macb_default_usrio,
>  };
>  
> +static const struct macb_config mpfs_config = {
> +	.caps = MACB_CAPS_GIGABIT_MODE_AVAILABLE |
> +			MACB_CAPS_JUMBO |
> +			MACB_CAPS_GEM_HAS_PTP,

Except for zynqmp and default_gem_config the rest of the capabilities for
other SoCs are aligned something like this:

+	.caps = MACB_CAPS_GIGABIT_MODE_AVAILABLE |
+		MACB_CAPS_JUMBO |
+		MACB_CAPS_GEM_HAS_PTP,

To me it looks better to have you caps aligned this way.

Thank you,
Claudiu Beznea

> +	.dma_burst_length = 16,
> +	.clk_init = macb_clk_init,
> +	.init = init_reset_optional,
> +	.usrio = &macb_default_usrio,
> +	.jumbo_max_len = 10240,
> +};
> +
>  static const struct macb_config sama7g5_gem_config = {
>  	.caps = MACB_CAPS_GIGABIT_MODE_AVAILABLE | MACB_CAPS_CLK_HW_CHG |
>  		MACB_CAPS_MIIONRGMII,
> @@ -4787,6 +4797,7 @@ static const struct of_device_id macb_dt_ids[] = {
>  	{ .compatible = "cdns,zynqmp-gem", .data = &zynqmp_config},
>  	{ .compatible = "cdns,zynq-gem", .data = &zynq_config },
>  	{ .compatible = "sifive,fu540-c000-gem", .data = &fu540_c000_config },
> +	{ .compatible = "microchip,mpfs-macb", .data = &mpfs_config },
>  	{ .compatible = "microchip,sama7g5-gem", .data = &sama7g5_gem_config },
>  	{ .compatible = "microchip,sama7g5-emac", .data = &sama7g5_emac_config },
>  	{ /* sentinel */ }

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
