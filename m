Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB9EEC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jun 2022 13:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d+u+YVKlarghYlmyrt5hh92F4cZcR9ijcxefvvgS0oE=; b=dFqMmqS/F3w8co
	uH1z6PR3ABCjkxbbTZHiPqC6ZX/UPSuI186dRT5dlHaGwjKpITljz2i9+3BGfDUOV2qqmxZPZZDbD
	RxrDgqRScRQbJBQKth5ZhEFPAfcAekfaNm5LjYsa0iicaaRRgDIf9oYl7kqp81nsjhJ+L4UmOeeFS
	i8a3jfMN3U+KZIesJteq9tzyZ1ud6W1ubnkfNcXv/pPWaeXAF/yd+y8R8VaBsR13bcbnzkpgY6J2S
	x10X2omO5affX8nP+5DQeaEedEpfGzm07hE+TCAblP6Ob7fCgUxh70kMGEfvsCXvib4JET1j0uoaZ
	AHYMkUcCXSGeFC7HXMiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0kDM-003ry8-6s; Mon, 13 Jun 2022 13:34:44 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0kCb-003rPz-FN
	for linux-riscv@lists.infradead.org; Mon, 13 Jun 2022 13:33:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1655127238; x=1686663238;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=NYTzrNeqVb+fGOxdZTkR6COs6E1kBMz3PogkTo7waT0=;
  b=w6mChjifGrLJzPsjdv6o1iRSNhFFsul5GJ1klIhtxBd4munqYldPfm8g
   Nr0VdmOLxUiKC90aUt7xZcpLOkfcrDNrdRno3igCZvq22ghD9Tvq0TmZw
   PT+VGGX/cSWtW4R95sWN9IQAotftW3oCokjJgIDedRp83ao5Ft41rjXFb
   Bqjl9kcZ6Nz2BorZcor/lKJ9uZYGScaC/WgGkM3gaQ33FBsV2ecmc3o71
   V6egoOKbAD9HF8EU7rLNfZwD6sKIBRjnxa9TrXueas5UD9f0a5tQ421NA
   hEp33nM3C9TeyvzkRB/tgs8YfYb1PJ1sDhTvcjRj3eLGWIF9zCbnqtGYP
   g==;
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; 
   d="scan'208";a="160056718"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Jun 2022 06:33:57 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 13 Jun 2022 06:33:52 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Mon, 13 Jun 2022 06:33:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z3N4N/z6MsFpXHZdJaX1Fcc/1NoawA/4TCpvCGKr/qmwuvudMQDWDQiWXW3tyMgGwCNxy96PL2x3EgJl1IKnO39uCbOUHCSG49AomiCn5wcI4T5RtDZST9ZKGjEcQex9Lpw/DaUJlbIAH8jEI7jV6lBSkER+TgA0ogrpyuz7kLtmTfSEIeorXj8LLME1NN9pj9bVQtmsVykNFHMsrRodAOMr6IhAB+ej78QKHGQrSrx2F2iMnbngz4s9G21vQak1sNMyO6vq2d5U85PVNwh5xa3XrTGZ5p0KOkxyCAlFiG90sdbWddfTUlJqPowzj2Xb09OYpw+5/NOYNKCaYUojJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NYTzrNeqVb+fGOxdZTkR6COs6E1kBMz3PogkTo7waT0=;
 b=P2N+HU19spI2K5ppjx8Yy8O9rUKDwGZXTvZ4U08NKQ0/IngviOLwbuRjwC95MDoKlmd5YC0V6pf2cQ50X9vVMQWV+ZS9OOWQjpzkLzhxXlw1xfIRJCAs6a6DkQanhYVXW9i7Ab968PIAGpigaN57li7hXQ5PWDy/t4U+7bXelyvqP3U4zE7Ro+xO+c5rXtodB7WEYeqajthjhkrXqRNYWQr7P1CyBZM6DMEdJAonSypydduYANmCVQxa1z1YrkmMLHamcSdOAvRIIcDP26PDCUsbkdLGvcRWeWYCzwpSWAujYiHyXSJIYiY4IUeuLXs8mjl71z/0hmK+QMSKbQHjSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NYTzrNeqVb+fGOxdZTkR6COs6E1kBMz3PogkTo7waT0=;
 b=UvLu5N6HIgOSzrxEKqKaZOARxY17bJp9j9MutN5F3V5bBi1eBVriRUjqHkGkJLmI/f4sNGrNxsTCpvBLkBmDpF1Ju7wm5ChmDkpLY0v0mmz9OQLXNRwwzQSoB6+uJnp17JdZW7eNBfGMEAPWbTHbFg0oZpkeCBYN45It2k5g7aA=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CY4PR11MB1640.namprd11.prod.outlook.com (2603:10b6:910:8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.15; Mon, 13 Jun
 2022 13:33:49 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5332.022; Mon, 13 Jun 2022
 13:33:49 +0000
From: <Conor.Dooley@microchip.com>
To: <palmer@dabbelt.com>, <palmer@rivosinc.com>
CC: <Conor.Dooley@microchip.com>, <linux-i2c@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<lee.jones@linaro.org>, <robh+dt@kernel.org>, <linux-mmc@vger.kernel.org>,
	<paul.walmsley@sifive.com>, <atulkhare@rivosinc.com>,
	<support.opensource@diasemi.com>, <andrew@lunn.ch>,
	<krzysztof.kozlowski@linaro.org>, <stwiss.opensource@diasemi.com>,
	<linux-riscv@lists.infradead.org>, <aou@eecs.berkeley.edu>,
	<ulf.hansson@linaro.org>, <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v3 4/4] riscv: dts: sifive: "fix" pmic watchdog node name
Thread-Topic: [PATCH v3 4/4] riscv: dts: sifive: "fix" pmic watchdog node name
Thread-Index: AQHYeeIGXs9WOWYBI0qGmFVsFT4u2a1NYDuA
Date: Mon, 13 Jun 2022 13:33:49 +0000
Message-ID: <ee29eefa-9206-b84a-e27c-4e4388865db0@microchip.com>
References: <20220606201343.514391-1-mail@conchuod.ie>
 <20220606201343.514391-5-mail@conchuod.ie>
In-Reply-To: <20220606201343.514391-5-mail@conchuod.ie>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dbdc8a35-ebe4-40c2-c5b7-08da4d415979
x-ms-traffictypediagnostic: CY4PR11MB1640:EE_
x-microsoft-antispam-prvs: <CY4PR11MB16402C89BC6CC3A18E8BA3FB98AB9@CY4PR11MB1640.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yzUva/k3cZAac+HMyXZ23xl90O/xFTMs/R9NTHZJJJW3J02/6nJ3iKZ4wsCVQA9tAAxyOXJnJb4UlCMy4JlvFdeGKsO5B6pmifgmSauJ8WVS1MHECUeD/7ubIOLFQ2zt24L8FTRF/BhkCSZmguFWiiuNDXwfHlniMOy0g7doN/XYHBigu0VG8Xt2lWufRLRn8GMB3dvgSt7tvg5roqtBzwz1Q+HzFpdOrc8pePajQQXqPIwRRorvG7acFfIZScmK0+4lLek5RnNT6qBaH7lLYXuxULlR7MGGGJvh2upj0F8BEdaBUaK7ySJanr3sN3cW39SiwqX+Xvsjq6Cuv4ZzjTF5EOYG+gmVlELb2+2fM7f7S/JYuJep3WYxzMnhd1Korb4ykFo+zzUMXF1G8xIsud6bd1swSPujOp6TWfy9HBOWbAJqqwIL9+2MRtdk1zGLX87DB07zxppdK6geoUXtRliH2w2hBEPsK1BwEs1tWK4hmyrPL5ZonE+3bTCbWxGP48tW8kX9hhilp1cC45g4a1nxj3DcZ9AcwcARRWydtJe0lsMl0lVmlNTxUM5p+QYAdt9704Nic7DO/DhFHM3E9JfThZtnqnIBFN53YrAT9lowiJ9iqQrtqUWHLJqzaamAcjxWf3PQE2gKQAUbMDm2ST26CJOAeJZ66p9RR+xOVyPAMcSVmyXza5gUAOUATgwSwTj++vnwkAgCbUjbSJBZ5KPsIzSIOMslwwNwTY2A3sUzLxMcO2S1XKTzsXEC51Z3XQd4rREPQuhrHgBF4DK5Jw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(2906002)(508600001)(8676002)(66946007)(6486002)(64756008)(66556008)(66446008)(91956017)(71200400001)(31686004)(86362001)(316002)(53546011)(26005)(76116006)(6512007)(6506007)(54906003)(110136005)(66476007)(4326008)(31696002)(36756003)(38100700002)(2616005)(83380400001)(186003)(8936002)(122000001)(5660300002)(7416002)(38070700005)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ejVCbTN5NXdZZXNXUDVON3hneDhEaVJTbnNqazlnSVdQWE5adFlFYlFaellN?=
 =?utf-8?B?MTJqdFNCdkYxdWgyc2FxZHo5OTVYV0tSajRRQUsrSmZOV040d0RuaWJCUVRJ?=
 =?utf-8?B?NGNKZ1U5U0h4Y0JOVnhCM21oOFVjTkpkNVVLNjltQ25pN0ZabC9PVFV2RVNT?=
 =?utf-8?B?eEl5Q0RQbG5wL3llWkZIY25YdXdicFJGSWE4UXo1L3lnUDViUmtuS1VSNzhQ?=
 =?utf-8?B?dXo5ekpZOEZ4VWhvNWdLMTBjUFVWZE9qNG1QalhPQ1FNV3FHS2lLQzJRdVJP?=
 =?utf-8?B?VUVUd3JISllwZzVSVHVxSnBON2lERHk1UFB4SldYQVU5NzhUVEhLRk9uNlg0?=
 =?utf-8?B?cXhYdzNnVUlId01obVJCWUNETGpMeFkya3N3YnJSckpnNVpNUzFVYnhnVU9L?=
 =?utf-8?B?NW5RaU9rRjAyYjFFTkpwTzZHU09pRUJENlk0bkp1ZXlmQnlUTERVNHNDOWFs?=
 =?utf-8?B?ekNOQW1kOUxoUnc1QnpONFVpbWd6QWtydDFnMmI0NERuTm13QlJYNjdVaXRZ?=
 =?utf-8?B?K0l0TmVMZkxDajhpU1hkYU42OEYxY0JPcGkvSTkrNE1JTlhVNlgwNUswRWtL?=
 =?utf-8?B?YnNkYjN6SzBCVUdDTy9zbGk5UHRFYzFYeUdYeVZvMXBCU1B3WEx2eUgzdkMr?=
 =?utf-8?B?NG5VVEZUcG9KUndRenUxeGhqRnpsVU9tNWo2bWlOQW0zNnErcG9DT0xqSEw3?=
 =?utf-8?B?YUw4emdOU0Rlcmltc0x2ZmxhbTF4Snl2clFDdkQwUXNMY21GdkhSUTFWbFYv?=
 =?utf-8?B?YWpXczZZUVgrMnhjK243a2JMdDV4OEt1ODd3bnd2V0ZPVysyeDhnV1FzRTFU?=
 =?utf-8?B?M3lxeXNrc0ZzZUs5RlhGYjFKclVmNDQrTzlINUh2bDdWTjc4UXNUOVFyaTdL?=
 =?utf-8?B?bW1adk5KeU8wdFRSYTF4OWxiTUZpRmZyWFdZMnp0b2RrVks5ZFR5Q3lPMWVl?=
 =?utf-8?B?WWR2L3phRmRhbDVncjdEOTVLUG5ITlR4WFpsanZReDI4cWVOU1ZNWDIxd3JN?=
 =?utf-8?B?Zms5M0hXeDlWNVdwakxUQjlBdEdtMzJEN2FSZU0rWFF2eCs5S3NFMkFHWStn?=
 =?utf-8?B?ZllSdUo3VFVaYXROSmFGbi9sT2hHM0VtekFRUHE3NGsrTlFXMHo5QW8wKy9I?=
 =?utf-8?B?MzlpMmRydldWR3o5QndjVVBMSXEydjFhQ3RSZzN2N0V0WHBsNSsxZ3MzZjNk?=
 =?utf-8?B?ZzVpUjZhOWJYZEZxcXRMY3FlT3lRNW56RS94S3I2cVdqTWR1WTZmODh5QkhX?=
 =?utf-8?B?N0JpZmh4YzRVRlcyQW42cU1aQURsZWRBVWJQNCswR1Q3VThWTWEySHZYQy91?=
 =?utf-8?B?cEM3WHprMjdqbkZLbFR6Mld4S0RJc2xtZGEwdTZYZFJ5dytzMzdiNHRod2w3?=
 =?utf-8?B?VzZ1Yk5haHdpbHduWWJYRW5DZDVVeDY4dHlVMEc2dExTMzBxQjViNmxYWGdQ?=
 =?utf-8?B?RHVqME9UQ0huVk9DWnpKaVliVEpIVFV2VnlQdFFqVEJ1MjJJMitqbVZQRzlE?=
 =?utf-8?B?czdHTWFyMVlSbzZJaVlZcDZWQnJxKzFndHZXdGR2RnFlSzNkL283VURSOW1p?=
 =?utf-8?B?L3JTVHZ3VEl2MWthV3JWMUM4bE5aOCtVcWpJcmNyLzByaXFONnJRK3BmeE9T?=
 =?utf-8?B?NU9rZDlEUVBFWTZ0SmxxNVJFWEZiRThxN1c0QUZ6OFdwbHh1U2lHMEgwNlR5?=
 =?utf-8?B?cWVCOHNUM3Y5MFhudnNTYUIwRjRZUEdNMDFjYmU5bTV6TWlNNytiRm1WNmQx?=
 =?utf-8?B?N3ZpeXUyM1RTTUxLNkFxSVQzaFMyWW0rZ0RaSlpqN1FNeFRrT29oZGJ4UmxR?=
 =?utf-8?B?bVlsakhJYVZYWU5xd1R2aHliQ3RINk53MGV3SmZ1dVJpZ2tkeEJzMFZBamo2?=
 =?utf-8?B?bWRjZEJ1ZVJRQ2M0WmQvQmlCL0pMN3ZBc1BNT1lWZUpXSnB6d2J0dUlGaHFz?=
 =?utf-8?B?dzV3Ym9tRklQTEFMV1dtbHRlQmd2eURTb2lIOVlaMW40TFczbytqcjh3QkZV?=
 =?utf-8?B?azhrdUE1cGRqdnpHa2lTazNWVWptT3JCUzFNdXVXS3lteUQ4ZktIbWJZdU5Q?=
 =?utf-8?B?YXVkNHkySGRhbEozQ2FXQ0RkRGFYdlFCYjlhRytITTI3TXdWOU1ZN01rMGt2?=
 =?utf-8?B?ZGFGWUMzOVAxbWEwRUUycy9mdHZEcWEybFYyN08vbzc5dmFaUmlGaDV0RVU3?=
 =?utf-8?B?aGo3ZE90RFZJMWZ2ZUw0dGhOR055U0MrUU9KWXhyUHd6TGE1cks1L01jU3RF?=
 =?utf-8?B?cmZJYWRVWWRZU0RBNE9pK3Z0ZC91VmtjYXVBZUhBbm1NT1JYeDk4dlBxbk1C?=
 =?utf-8?B?UVVWOU5xK2F6dWIrellRd2NDVVBYT3djRStaTGpxbHJsWlNNWXNGUFVSSzBR?=
 =?utf-8?Q?pyvTZhGE1NISd8Ug=3D?=
Content-ID: <066D5F8254A32347ADC7B75063334C16@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbdc8a35-ebe4-40c2-c5b7-08da4d415979
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2022 13:33:49.5243
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9ebNzwR4LnHiOsPfY9xN9DjaCM/B8LyyC71iprEWwsqVbE7Zjy0Bz1tsYCaOM25mDCusMkJ+HtAwyb1blStHo5s0/a76aLh3M9QEHWoHxXM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1640
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_063357_742413_B6CA9175 
X-CRM114-Status: GOOD (  15.48  )
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


On 06/06/2022 21:13, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> After converting the pmic watchdog binding to yaml, dtbs_check complains
> that the node name doesn't match the binding. "Fix" it.

Hey Palmer,
The three dt-binding changes were accepted - do I need to poke SiFive to
ack the dts change or are you fine just taking it?
Thanks,
Conor.

> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>   arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> index c4ed9efdff03..1f386b07a832 100644
> --- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> +++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> @@ -90,7 +90,7 @@ rtc {
>   			compatible = "dlg,da9063-rtc";
>   		};
>   
> -		wdt {
> +		watchdog {
>   			compatible = "dlg,da9063-watchdog";
>   		};
>   
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
