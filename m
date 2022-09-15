Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B89C32771
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Sep 2022 22:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wJmY2KB7wkK5/bBl4H/c133W94SBc+vyqyzykWx/A1o=; b=KMwUYXYb5VT5Wa
	995AjxlaPOYxJsZ+GaQxoTiRA2bFw/HP3BjH6iSoI5IX0KGLolj0ucllkf5gagQ7lSRoQ6u5s33ZZ
	tDurYphPwzazWgcFuGVZ6FyjNppLh4gSFY3H7OjDV2QrJziY8myIVYZ/luubYSmoYQ7B9FoziO5xj
	1Oo+PpiypNy1PZVv7CNpAzetX7El4282zTB4Z8946JT2OqQkwL2btZ8YpTlB+IGAP7JF+N46Sc4z+
	Y+66ylyOgkkd9Dz0QCKTpWX/D0XhKJTOsgWpdhkM1qAnfyYkIYWEYpBxh33TNMz16evzD+hO3EpQb
	3qEhgAblqbflfHiUd7cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYxIg-0016Hn-UN; Thu, 15 Sep 2022 22:25:38 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYxId-00169L-Ow
	for linux-riscv@lists.infradead.org; Thu, 15 Sep 2022 22:25:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1663280736; x=1694816736;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=lFt4z0Q1xiyuX0wjh9LfZXob0WqEnyHxaZbNzMGMKSo=;
  b=OdkSJ39qCDNjzBjUM+6kclYj3c3DgYG0Q5FtiAUX9NgqHpqyJdPv7CU2
   lIK7ir0qdc7w3hpC3+n1jsV+AruSHWthMx/pfeX3nbOQLMxXD41KVrMUt
   DXmzvoZVCcezwDGwPJy0ZZHXCKrPs57DKa2t99ppwP9HiMtw/wl5+Hygy
   ji8Sp0E0r1blDc5LdUqNdZizHzryFQxBuZwxsucVdOrlFSN2+0EuM/lBZ
   sgDGTDJgyxTANmyeRt1QO+2yJI+4tzhUQl7hz0iYkUsW0IxUD6kand1q6
   fECGYM7YRMetmt1+f1A7uQY85e0xxZ8I2keNYcd7kKHBlransf2hD6Cek
   A==;
X-IronPort-AV: E=Sophos;i="5.93,319,1654585200"; 
   d="scan'208";a="174107263"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Sep 2022 15:25:30 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 15 Sep 2022 15:25:27 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Thu, 15 Sep 2022 15:25:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ki/KEVa6K/mF0y7cbpnQvO56k9teGn3miO20KNKjYCDu/fZTS0Y05kawJfzmw1hG/IGkJXaAJymsZkvjmTNNdOEgJc9Ots4umLiiKD02Ec8UK/n4dtwIq6qFvfyFuRHeuKt8sMl/wUjSByjDPFlIBj0NX8heAVIp2MjNMfu8zrfREsii520GjcM16Gns7YQsqdAPFw7Mt8ISevK5109cUJwz0Dd1AtNpN/tAjxjvnRjQ83ux0ykd9XfcQ5NbUOVN0fO8Hw35pIbz6XIPm37pTd34bfoEpwrnTn5JJlqpIp1J5YNKfpRjpWo3I+YQZJ7SuIKnNn4/ZHlPDXuaqUetSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lFt4z0Q1xiyuX0wjh9LfZXob0WqEnyHxaZbNzMGMKSo=;
 b=ai/EGIWM4Av8llggiEB/KeEiSJ8wsmM7sqnXF+N9sAf+b55yaNlW1BixIu0ZdjOEipE6WR2eYjR3n3km5q6hobx+Nsm6KzC3VTLgsNXbJ9XiYcR45Yj0BSfgyjnuc3QVpMVBIOhdVcfn9RqrbyxefNluJzSchmSWvWQYGNI2zjUSIYJIEOZtEzOildFicG+83yRT4TiKSGva6D9WwljAp2J6f2bAhuqy0yAhsfRAEBxsEQ5TeR0PvKeJu2uInUlcN7x3oKfWD//E3Yfx7LM8cksKTv6eWLBYc9KxTaculrObn/2ySsn8i2/B9m8AcSWs08MbNcWw47E8pcOzamZ36A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lFt4z0Q1xiyuX0wjh9LfZXob0WqEnyHxaZbNzMGMKSo=;
 b=De5mIHqEApsVsCMacEWtF1CV0wtLaJpoFd+adWwywqS9MH5HS8huj6WhzxRs/A0k1oXKoRjr0C34KkouGb2OP//wb8QkkjGOqg8MiMYrm0rp10j3+kg6NZJPNl5ix9gbiP6b1HMg3DI9xQ6jdKmkQEl3H1XCT4wYwotOfPYCXoY=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Thu, 15 Sep
 2022 22:25:25 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5632.015; Thu, 15 Sep 2022
 22:25:25 +0000
From: <Conor.Dooley@microchip.com>
To: <prabhakar.csengg@gmail.com>
CC: <geert+renesas@glider.be>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <heiko@sntech.de>,
	<atishp@rivosinc.com>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-renesas-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <biju.das.jz@bp.renesas.com>,
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v3 05/10] RISC-V: Kconfig.socs: Add Renesas RZ/Five SoC
 kconfig option
Thread-Topic: [PATCH v3 05/10] RISC-V: Kconfig.socs: Add Renesas RZ/Five SoC
 kconfig option
Thread-Index: AQHYyS+BB7don9LvSkGu+r2oTiU5/63g+ZKAgAAWGACAAAIQgA==
Date: Thu, 15 Sep 2022 22:25:25 +0000
Message-ID: <5815ce38-93f2-f6e4-2529-d6927d41ae16@microchip.com>
References: <20220915181558.354737-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220915181558.354737-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <126c611d-b421-cff9-6384-bc468be7ec73@microchip.com>
 <CA+V-a8sv9sFwGktxqkWohQF2FfxyQm=Z5GVNjPW9i2hKxtNWpg@mail.gmail.com>
In-Reply-To: <CA+V-a8sv9sFwGktxqkWohQF2FfxyQm=Z5GVNjPW9i2hKxtNWpg@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5154:EE_|DS0PR11MB6541:EE_
x-ms-office365-filtering-correlation-id: 88b6ac44-6b82-48fe-4be1-08da97692fda
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zPT9y1fY/+7LxE/08ACh0fDFsFL0ju+MdJlgAarCxOUpIZoiMWGmA6JB7DIfn5B7Kq+JDJF9lDlaJEiJ+j8v5vw8X/5qUtwAXOe97qfoHMYFdsoiIORYbCPgP7S8d5wnNC1Nyv2YfKUva9UtiI3leRnjSrKqWA9GZ3BUpIi+j/jo125UIVthIxFbPEYi9HB97KkRQ9fQbQatbABIbwrLJ7VSNr95kqdigMRU5Xt6jnLrA71CAkacp4kfzQHhCe83xnPiIM/TKCcJKCUutBxelCLhgRlc2Spnt/r3CpeyAyyCEvuS+hfV01XUxBH9t6syiwYezK9cccN90Sk7bXStqGVC+ayMNyUqPpfH/pMJq4Me2q8ObrJIobA+dl1hzhIXDpyjkghd7zO+qlQYUhbNdMfoRsir1ts0WCw2rdnRLeQAFgcFHCd08uqEOBGO//PHPfpdhslzEO9YMRuELmq9dDkUSrE71TLBi/lZjy0HD5XgZSUVPM4VmLl5R39WlJTiaijKmIV1zVX7kzQ1hbowZBrBEXjkXD6LPlAeQQiamzNLQcf3wx4h3SMYwZsP5amPaBltp7rIFsWKu0JTmmK94knfodLlrkN2b2TYaJPKx5S0x0wI0q9KIR9nZUQVaQS5LhhB6p/muKLCfxCwt9Y2vzDBdAp7eywhowxx9cjgYhSbUERZHHOJsSvXCl5+mWwT6bUcmlg0C42CD31HoZIuueJ7k2SQXyGJKLg2osmO+Wx0ESyNOQv64BPWvVLwC5iQusgYLlVj3bDLTF+VCpnq3nF/pia5ieoCYEoc9IN50kICsGeGevJrB9o+YrTmXf8Wjq7Ir/mDbl5Nf60LdiBDKYkXTjzkBdgeWyqLcTOGMi1+G8g8UUB5atrwdAoqvzjx66OW82E6LkH1/7k+8e8MPQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(136003)(39860400002)(366004)(396003)(451199015)(478600001)(31696002)(36756003)(4326008)(31686004)(66556008)(316002)(41300700001)(5660300002)(86362001)(38100700002)(76116006)(71200400001)(2616005)(66946007)(66476007)(2906002)(6506007)(122000001)(6486002)(91956017)(8936002)(6512007)(64756008)(7416002)(8676002)(66446008)(38070700005)(186003)(53546011)(54906003)(26005)(966005)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZTJFbW5TdFYrblZoUDlJZ0pYTGZHNUZWVWFZa2pCaUlkM05KZWcyeVZqSi9z?=
 =?utf-8?B?Y3RBSzRZYVpscTltQllUSXlSd3VIU3U0UHdLWTJCTEs2WnNPZENuN0wwUXM3?=
 =?utf-8?B?VFcwS1lvcjdrVXBrZjNmWDZ4Z1lGdnlFdVo1eFIvMGViVEd1VGNEdVBZM0g4?=
 =?utf-8?B?Ump0RDY1Z3l3RFgzRGFtN0l0eUVHc1I0QVpKdFQzWkNFNXlDMEYvbkpkY3pZ?=
 =?utf-8?B?a1ZJN3ExYi9RVU1jdTdKayt0MVJLR25xVjdhTlRpZHlFNmZaVXZnSTVwMVRF?=
 =?utf-8?B?VXRIQ2VuOElRUC9OYW5vMm54MHRBK3dhVWxoekpUUG0xN1FYUHBCamRITkZT?=
 =?utf-8?B?Z1N5M1JEeEFReVhtdnFtTHlyTmhFZUFjM3dZcDJ3eG9kRmNmUVY2WkJGNGwx?=
 =?utf-8?B?dU5SR3YveVd4cGpCNXpUbmZDUTRJeGFvL1ZSUTN3cklDZXdsektLN0xId2hF?=
 =?utf-8?B?cnIzTHFEVlN1WEs5Y1JTV3dIN05zMFl5dE9yUjNnNDUxN21pN25obkZSZjJk?=
 =?utf-8?B?K0d5dkZCWFB1ZUgyM0tZRys2ZE1Xcm9aSGNHWTJKQnlOMmFhdllRRnk3bjZi?=
 =?utf-8?B?YlI1aXQ5WmtOU1VxcXRhbFBITFdQcm1WZjJiM2hFdDdJT0l0Vkc0aFJFNVVI?=
 =?utf-8?B?OGZDMTQvdC9Cc2l0NUIveG9qc2lVUlNYQm1Xb3ZHZy81dlRoQWI2NjEvMUhM?=
 =?utf-8?B?ZEZKclNYZVQ3RUZnK0dhZ0h5MUM4MDlTc3BkKzdkd3AyTmVLNjdzYVd0VC95?=
 =?utf-8?B?bnc3dHYrNDhaVTUvZlplaEZuQVltUllJRk5tUnNCeDdkNEJNMVM5ZzZQT2Zu?=
 =?utf-8?B?SHk3NkszL2hSNkUyNEw2dDFEYWhGV2NreUVtc21OeCt5MWRkekRYSDN1QnBu?=
 =?utf-8?B?TTZCREtrTmlGby9KclhtbzJ5VFkwcG8xZ0ZtYng4R1lWRUdTeHJiL01hZS80?=
 =?utf-8?B?U2ordHAwYm5QQ1NqVUUzajNMcHBpTjlaSGJOMk9uT2pSRDJsVG1PbXJIcERz?=
 =?utf-8?B?ZVhJSTlHcnUxa2VIcmQ0WktNcFhtQVdNQ3lKNnhXWVRYMXJWSWFGNE9uN29p?=
 =?utf-8?B?aHAyajhvVGxxZG10RWFZNHBJWGhJcnl1Z3hsVlVWYW9qU1pvbHBDc1MxbGNF?=
 =?utf-8?B?cXFRZStZMGFxNGJ2elZqWDcxQUhINHF4Z1lJS29xa2ZUTnNtNmFuRUwrbXFM?=
 =?utf-8?B?MFM5TG52WW1VK0RFWlpkLzBwYWNoTlRob0grajFIV0hTZm5rOFVSMHNHSzZF?=
 =?utf-8?B?S1h1dWFBZWV1NDdBaENTRE9sbVRVeVVDV2V4blczSmQvMTFid3ZscXZNNWhO?=
 =?utf-8?B?SWdkdlhVQkdYTEdIWk16NFBiY1kvL3ZGOEJ5enNDTzlhTVJwelBDNHpxTEhK?=
 =?utf-8?B?b1FaMVBsZzk3RE9QV1N0MFlibUpXR1J6QTNPSDVjSEFnVEJ2NzZ5YXFqNUQ4?=
 =?utf-8?B?NFdkb2NTVXVYQ1pUbkZrSUtCR1FVSG9GSzFIUmRKQmM2OVVubllRNXB2anJC?=
 =?utf-8?B?WmU3cGlLME51NGtlbS9HbThTYTRXZHpmaCtrM29FZUhQVmVlR0xicTZoOE1B?=
 =?utf-8?B?V29CaTBtakE1ZGU5dmFhNTFqUHp1blZGQXk4UmN3YmJ0K0g1YVlXNHU5VHZQ?=
 =?utf-8?B?cStIcm5Qai8xUDYwTStncGNwWU4xMnNJY3BEeGhwZkxrb2JteWxrZExndHN3?=
 =?utf-8?B?c25rVENjS2FlUzRldHBSS2t0dHkyaUxLTmRYV0V5Vkc3dERhUFB6MmFRaHNU?=
 =?utf-8?B?M2VzR1ppa0VZeU5JNjhINEp0cklnanhjMVZvQ3hZQ2V2bE83aFNIcjl2bXpv?=
 =?utf-8?B?NDMxM0hiQWxrTUoyTmxBM29lSTlGU3NYbk5LaUNReExlOWxBM1BsV1NtRWFp?=
 =?utf-8?B?dk5LdDRMMDdQZW42a3Rwa3ZNQ05qbTdDWFBwakJZaG5OeXAyM05CSnBWRUdH?=
 =?utf-8?B?c1pDOWRkVks4KzVVUTZEaXJsejdoTnk4Z1pYdElub25oMXU2c1dXck5IdUFP?=
 =?utf-8?B?SzBuclJ1TWVIMlNiQlZWRjVybi9JdUI5MVd5NWRnempuODFPTDZMRGE4V0xt?=
 =?utf-8?B?MzBHVGZYcHB2Vm1vVlpCV0kyTTgxRnE4RG1qMzJCbStYMXhEL2oyVGlDRUh6?=
 =?utf-8?B?aHJsU2NRTFpLZHpYeVp6RG5oWmtKT0JEemc5Ni9rRitMYk1HdjRZOWV6dmwv?=
 =?utf-8?B?MFE9PQ==?=
Content-ID: <2F6ECA28F19B7A42A849EF38D478B7F1@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88b6ac44-6b82-48fe-4be1-08da97692fda
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2022 22:25:25.6229
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qePXKdeWbF79Gzw6fQ+8HjYxJHytf9F0Wvh1TTXPQVGqh/gsf+M76mRLj3fjWQiOmjq4gMevfVvylPPAke4r7HgemY2tDOuHrhHSiAJCGQ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6541
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_152536_218561_7D486547 
X-CRM114-Status: GOOD (  20.63  )
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



On 15/09/2022 23:18, Lad, Prabhakar wrote:
> Hi Conor,
> 
> Thank you for the review.
> 
> On Thu, Sep 15, 2022 at 9:59 PM <Conor.Dooley@microchip.com> wrote:
>>
>> On 15/09/2022 19:15, Prabhakar wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>>
>>> Introduce SOC_RENESAS_RZFIVE config option to enable Renesas RZ/Five
>>> (R9A07G043) SoC, along side also add ARCH_RENESAS config option as most
>>> of the Renesas drivers depend on this config option.
>>>
>>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>> ---
>>> v2->v3
>>> * Included RB tag from Geert
>>>
>>> v1->v2
>>> * No Change
>>> ---
>>>  arch/riscv/Kconfig.socs | 14 ++++++++++++++
>>>  1 file changed, 14 insertions(+)
>>>
>>> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
>>> index 69774bb362d6..91b7f38b77a8 100644
>>> --- a/arch/riscv/Kconfig.socs
>>> +++ b/arch/riscv/Kconfig.socs
>>> @@ -80,4 +80,18 @@ config SOC_CANAAN_K210_DTB_SOURCE
>>>
>>>  endif # SOC_CANAAN
>>>
>>> +config ARCH_RENESAS
>>> +       bool
>>> +       select GPIOLIB
>>> +       select PINCTRL
>>> +       select SOC_BUS
>>
>> Do you really need to select SOC_BUS?
>> Noone else does on RISC-V, hence my curiosity.
>>
> Yes we do need SOC_BUS due to soc_device_register() call in [0].
> Digging further I realized we can drop the above SOC_BUS as
> SOC_RENESAS is selecting SOC_BUS [1]
> 
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/soc/renesas/renesas-soc.c?h=v6.0-rc5#n487
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/soc/renesas/Kconfig?h=v6.0-rc5#n5
> 
>>> +
>>> +config SOC_RENESAS_RZFIVE
>>> +       bool "Renesas RZ/Five SoC"
>>> +       select ARCH_R9A07G043
>>> +       select ARCH_RENESAS
>>> +       select RESET_CONTROLLER
>>> +       help
>>> +         This enables support for Renesas RZ/Five SoC.
>>
>> :thinking: isn't this pretty much what we decided not to do?
>> And instead you would redefine ARCH_RENESAS in this file and
>> not use SOC_RENESAS* at all? Will save me having to purge the
>> the SOC symbol when I do the conversion.
>>
> I was under the impression we didn't come to a conclusion so kept the

Might've been a good idea if I did a summary as I finished..
I guess I'll post one to the list tomorrow if I remember.

> patch as is. I'll just make ARCH_RENESAS visible as Geert suggested
> something like below:
> 
>         config ARCH_RENESAS
>             bool "Renesas RISC-V SoCs"
>             select GPIOLIB
>             select PINCTRL
>             select RESET_CONTROLLER
> 
> 
> Cheers,
> Prabhakar
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
