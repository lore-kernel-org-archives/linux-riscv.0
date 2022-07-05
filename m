Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C40C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jul 2022 23:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LRrOd5tgLiKGuJzaSr0Xp6PZmHsF+N7JTec+kOwsp6A=; b=Fqcxxgi1IjfVBD
	H9p8bjrkWER0MGuqk5fvBtlH8OrdvuMrbHsRvxck3GCXc/nMk9jNdSRwIEAuVLKydqVcqEGt0whEx
	7ZmKvNcZ8S9S78nfR0WWPUCXlzkFQH1qgtQvtxudvjjnOgMi3+OzUuomYzANes+kwl72ZGuQavviX
	qorm5stRzsJXlPORagyBfbpXrik5qNY+B3qF5VUpl0K/T0drG0EOVzxM6sJ5Pdbm45nC0H9O1D620
	7aTISIQhUFZIHTE3uhd3VFt5i3k7PQzenuYMNID/h63gLTDQWN1vCGm5qJ/lB+hdXuWxSaJzbDvw0
	rLHuO8fiYYVEGmQpQYXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8raN-003Pgp-V0; Tue, 05 Jul 2022 23:04:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8raK-003Pdd-Gk
	for linux-riscv@lists.infradead.org; Tue, 05 Jul 2022 23:04:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657062240; x=1688598240;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=zAFE2DzldKBlWExVsxwRszugcD9FQZUM+qcLnLP9/wo=;
  b=Ytr3/0sTuz+jDLaJOD023NSiT2sZP4Ymx55KyXdBbXj8qq999M7Ll2j2
   7Fo7OS3eDr+UEJ2h5PtqXO9OuQsMb8X4UAhXQStF6Q2kN6MmWKJRUPFYz
   ukz9pwKZTMe9JcQHlBOc9gu1w78iiFn3ak0QbxlHDiPDpw8HLtlIYsze3
   QKlf9oIWy2sZpLEnLt2ijYNaWx0mlCnFkYLa22H5ysMwHQtzXWhqFgWIA
   HiO0LVMBzmyj/EGvWY7/FxDbnsO4mEKW8zMzPrPi4JxcbD2wapNPxZ5UO
   kw7jM6xuNUCiggqJr/jdx3l1DZOqWjfQLfbQZ7vSCXOX2I5Lu/xdCvH7B
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,248,1650956400"; 
   d="scan'208";a="171164697"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Jul 2022 16:03:58 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 5 Jul 2022 16:03:57 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Tue, 5 Jul 2022 16:03:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RSBimzsqxR3dt91I8cC5GZVc/at0b0nowiWETKkdZl7meIRVM+GOF2+9CrMeHQgUMnm8jn9hqn03nCRjvj3YuwEIzfUb5r/fcMfcxvU9PO2Q1fEuoKIyTXcQGxiAHf908fWMQalbTjt7sZRHyNno1nG3gkKf+3SCj1Y5fcIBJnk7oHAC1FgHiKeqQdi3HGP7zwY9GCpUP5cT8Ta03B/5A8JoCAzET2ubw6bcX24cC82HnABNWI0J9bNkgDxwINkMeb/jU4Y0LGYb24LxAlvmZ542lP8186rUNy0OQ9MnkHp0y2WUM1OT9+Q6uzCQq0Z7e3366ZVhN3XCy2vxGeXf1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zAFE2DzldKBlWExVsxwRszugcD9FQZUM+qcLnLP9/wo=;
 b=QG6FAqVKZ9cFx727W6j7ZezDK2JtSnS97qoaaiJPJt3366/D4sU0IIAuU44ufIpp3DwHByjgARKVeu2jkYFZRmM+PctNutxCfgcK6GOjNJJgvECI5dbN5sICVXjOEkb+WYCImqI/B98IkFNMs5cmrCmkpj7DkZgGApOmdJrHUrzZ7I9mCPzodbx92ZwqCD4mE6qY5BS1SgUNfD7jakyhl0Jd7Jvam9toIiQTYBn9dTt0ktIzlAeEIs0pVsQUjSL7nlU3WV0GbEyC8/H+GJd7hpYCiTN/x2iMs0evFQEDcVQqq63zEzkx9GQvOP94BFpE7o0uxmB1oz9gWemNVrmakA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zAFE2DzldKBlWExVsxwRszugcD9FQZUM+qcLnLP9/wo=;
 b=I5xF7yKYEgBP5Ssqmh/ZyAFhm5/oQn7Z1wfIsOhYsL07/2WXES1xJ9jUaO2uEJ88y9YNIPEX5pLCDPeE5HQaRZ4sPH/PGYi868AD1ncwlWnP9yKUBnrqjpf0aWwXPrX9ZrNTPWo3vwdBVqOSWJiHzRhioxmBe/5X6mIgJnMBy8I=
Received: from PH0PR11MB5160.namprd11.prod.outlook.com (2603:10b6:510:3e::8)
 by DM6PR11MB3355.namprd11.prod.outlook.com (2603:10b6:5:5d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.17; Tue, 5 Jul
 2022 23:03:55 +0000
Received: from PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::6090:db2c:283b:fe69]) by PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::6090:db2c:283b:fe69%8]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 23:03:54 +0000
From: <Conor.Dooley@microchip.com>
To: <Conor.Dooley@microchip.com>, <sudeep.holla@arm.com>
CC: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<Daire.McNamara@microchip.com>, <niklas.cassel@wdc.com>,
	<damien.lemoal@opensource.wdc.com>, <geert@linux-m68k.org>,
	<zong.li@sifive.com>, <kernel@esmil.dk>, <hahnjo@hahnjo.de>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <Brice.Goglin@inria.fr>
Subject: Re: [PATCH 0/5] RISC-V: Add cpu-map topology information nodes
Thread-Topic: [PATCH 0/5] RISC-V: Add cpu-map topology information nodes
Thread-Index: AQHYkKIdHc6oV2H//EKJV+LfcdW+Dq1wN82AgAAD8QCAACn8AA==
Date: Tue, 5 Jul 2022 23:03:54 +0000
Message-ID: <fb7be22c-cf19-0e06-f231-bb5b9167e179@microchip.com>
References: <20220705190435.1790466-1-mail@conchuod.ie>
 <20220705201931.nfwi5rlku7ykmydr@bogus>
 <8f07796a-d9a2-3301-aafb-7fbec4d5b1a2@microchip.com>
In-Reply-To: <8f07796a-d9a2-3301-aafb-7fbec4d5b1a2@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ff204438-897e-40bd-7540-08da5edaa283
x-ms-traffictypediagnostic: DM6PR11MB3355:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d70Ab61YhAllyKyKwiVDtfHCvxuN+6yxyuIzJFwBN18JvidCIOREO65I+h3+bEKcaT+Gqe+HEoiuWYK8+/EXYo4M/XZAuZ6QPg9f9FFJxWbZ4HBDEuNH4oOMoTbsOleDQ5DTmDtrQO2vOqk6Q1nE+cDY/7LSfeeOH6UU6Z1Ztxjl1rs5sAygWfkm8P4dSH9oQm8jrvUeQBbEJxZJ9vZ8Ti18QsTo6RJWeyMglfvbaxGUwej7tGB7lGlFr7lW6qYkBkoFJPKFR9BxEO9GDPOb6cd+M3uIadOOPdriN4Wa/oNtxpTwSRGep2NyUguMP57pPPJWJqVAXn9xnTYxMtkCIcrtU21zNbnsdJ256ax9+bafprf2QskrHaLoewxWXW3WeJTOPRfvHw08uJZmrbV54hBk8vZab+KmZ+m3+X1Vcw9VEq6DyrC7B07zX7x7Uipfyrbo2P3lZOp4V0eczLnuTWpbVfNOM3xkg72UO30ZpbnLKjT2r5W22dPY5dn0IN9G6pKUHmx3N5yCpLnwUdQ4s42z2tYtoAOpDEa4cT5iEafCqLkTV43pg1pFRvZQG1glrEnpyHaa4U1w3JtM5iRVCqRtG5k2oIk5moavSenWwFJu+/+xHGidO61+OAaTxd1kF4atBHefGSBjAd9HsyWmwSp6sFMihhAcmX64urrrFnKAPVdHh4tePxTAp82XIH2FJGSOBRRaDQ10YmNqAwsAM+eqcnjq505PZ57Wh4REOQyc85PlrWkCx7BzppLeTwg5j7TBYlQhWIHpLpKN5eNf/7Dyef/dM6f8eaGmKDaJ6n8TC9HV+tqKQ6OiZFIMHVBjfbzbdMIZDU1ap2MNkgYAYccbKq8Uheg1cFDxZYR1EsvuYP+/nCebiAAfQDM7I6Zm
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5160.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(136003)(396003)(346002)(376002)(366004)(91956017)(38100700002)(66946007)(8676002)(4326008)(76116006)(66556008)(66476007)(66446008)(64756008)(6506007)(5660300002)(7416002)(2906002)(86362001)(31696002)(38070700005)(122000001)(53546011)(8936002)(2616005)(6486002)(478600001)(41300700001)(71200400001)(83380400001)(110136005)(54906003)(316002)(186003)(6512007)(26005)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c2ozQnlSWGhvTjBVb2Ftb1FuaFd5cFQ2YzhaQ1NPODhOM1ZvMnZrTFJPdkFE?=
 =?utf-8?B?NlptQlRQeGxwVHlWN0Y3OEFyUk9YNTFvaC9BMXhhbzFtcDQrR2RKei9OMXly?=
 =?utf-8?B?U2lpNWthY3RSczlCZzI4NGRwZWhBYStzeEwxRmhpNkE3Ukg0VFpTUEdGeG14?=
 =?utf-8?B?V1BlSUgvYks4VEtkS3d3Ym1IWXdHUXpzUFl6MWM1K3czalorcG9vU0Vnc2JS?=
 =?utf-8?B?aERucDRiVGxGV1hOdWlLSk4yaHY4OVBIdVRZL3BEalRoZkxubGVSYkZ6bjVY?=
 =?utf-8?B?clN1QjBZdlN4UnZwakduRjc3b2UzQ3ZqdTdZZGg4UWJZcUYySUtlay92Z3Fv?=
 =?utf-8?B?VVVqMVJ5SHlXcEkyelBpd1g1eWdXUXF2WGgxYWtEZXlad2tmSFoxMlltOEo3?=
 =?utf-8?B?TjM4VUc0SGpENUh0NTN2Qk5BbDJOYjlLSG9BSWhvRUVIbXhUR283cmdIOTQw?=
 =?utf-8?B?WFMyYVZsSzZCdFJlODVBcGpVZ3Z2Y1ZrUmVad1J3YlRpWWU1ZEZlb09pVk9E?=
 =?utf-8?B?d3licnNMVHdmUk1yMnZsSVg3ek5QMzlqb3RVa0RoMVFUNzFNZ1N4WkswZHN4?=
 =?utf-8?B?YmFVVHp3UWdhbUsyUE5hMVp3Y3ljOElkc3dGM2x0OVVQdWxwdmZVNjJZTVBB?=
 =?utf-8?B?bVBPbWFaOGl3R21FN2hRaTZRajJPZEMwNTBRUzIvMlhNZytEbkQrTmtaTGdX?=
 =?utf-8?B?bFZyUGRLL0piS0p5bGFOLzIzbG5YcEc4Z1k3QVFLcnB2ejBNTEQ2Wmx1c1BC?=
 =?utf-8?B?OU9PTnFCN25UM3VqL3pvL2tPcld6YTJ3WEt0WS91TUFwTGc3aTBxVmRmM1pL?=
 =?utf-8?B?VzVsdFcySWcrTjI0K1dLVVJHSjlHaG1OTzlpeUZBaU9TWHBoeEJ2WE8vZHkz?=
 =?utf-8?B?L2wxWU1saWQ1T1dNYzRVRzQ0Yk9DYnJGVlQzb1F3QVJzVzhzQ1VIUFRXcHFK?=
 =?utf-8?B?dTljb0dWSnZHSmFpVlBxb1VORlM3dnlGcmZRT3BjUWJoQkVma25SejZRUXBH?=
 =?utf-8?B?cHoydWZneHdGdmFsVmFZclQreitWTHZ5cCszTW53aG9UTHJvSERaR2xBeUJ0?=
 =?utf-8?B?Y3lSdm83R2Ria3JnOVpXZkFuVTdjQ09wQ3BGOVp0R0s5MHZiSzRRbG5DMTZG?=
 =?utf-8?B?YlVJOHdrUVJ3OXh6ck1RMGZOeCt3UUhLeTFWc2xySWR2ajk0ako1allwaUhJ?=
 =?utf-8?B?c2pDd2xyM2tCUmpGVzRxRnNZV3gzVCt2WEhTdTRWcjdxYlFvM0pZS1JoK0I0?=
 =?utf-8?B?ampuTzJKRFB5ZXlRLzV1Q1RzdEg1YlI2WjN4eGE4dHplNGRiOVA0L25GWmxC?=
 =?utf-8?B?cE1VZDY3NFZyU0tIRlJNUFVGVUw4NUpuU1E5amtlT2VDdzhDZ3JnSE1CUGow?=
 =?utf-8?B?U01nL3NYZERVeXBpUzFJUENvQkF0K3Q4QWNVd0FEVW55aU4zYW56MzVpMHZn?=
 =?utf-8?B?TzUzVGJXNlBQR3RCbllVZ3licDZTQXFIdG5VQlRSMmV4eHloUEQzR1ZSRHdK?=
 =?utf-8?B?YTNTbkpNYncxbWtBYThkcUZXdklkd29RdHJhV3FRdXhMb2ZNVmlLK2hxMU4z?=
 =?utf-8?B?WG12NEUyVVlUQ0FkbnQ5cWV3OE0rM1pzOXdHN2xnUjRNZUNrd3oxcC95TGFh?=
 =?utf-8?B?aE0xOXNzVFV2ZXFGLzV1WERtRlJqOVhNTmtWWXA2U3REZ3lPUGhYNVhKcjZr?=
 =?utf-8?B?bXhRK2Y1U2M0Y1A0d0cwSjZ6VHNzYXJpNWlmUzZFN2d2aTFCQTZyUlAwVUJN?=
 =?utf-8?B?SXRSNDFJM0EvQnkxU0lYN0d5azlFV24xdXdGSm9DdGRTSXUwZzdKcytuWTZC?=
 =?utf-8?B?WUVpWlltcEVnSTNlL2JWVHNEZWp4SFM0Y3NFNXZieVRBK001QXZRaXZTZ2F6?=
 =?utf-8?B?WHByRTJKdFRnQThuQ3RCZmRSSW1kQVpDNENpTVc3YkxRK1hOV1h1QnJpMk04?=
 =?utf-8?B?TVlDN1l6ZlEybityL1FYWHhwS0lqYXhxR1MxMXlES2JQdGlGajQySTVYbDJX?=
 =?utf-8?B?Q2VBai9SWVY4THBCRTl5NlMvZ3Q3VTh3KzdKWWZxVC9ySWtmb3Z4RDQxWXBy?=
 =?utf-8?B?NTJjeDEraGtzQkhvRnpZRHE5SmFGdDE2QXFVR1VIOElhQ2NuOFY2Yi9USjRF?=
 =?utf-8?B?UlJLcERjQkxpNXpNelR1ekpndXA4L2VNZ1QreGtvZVZtN1lOZWx4SDdtYTlB?=
 =?utf-8?B?WkE9PQ==?=
Content-ID: <BA865314538D5345990FF92ECCFB9DFE@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5160.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff204438-897e-40bd-7540-08da5edaa283
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2022 23:03:54.8439
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IYpfU4+DtbKzi0lycmdjTbCrnef3J+efXFWk001+xspP+NRKgSL0L2Rz5vebg/kN7GuutH7nDr1q2Gbov1VF2bdZJ1KL/RwJ81wsr2rndbY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3355
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_160400_894030_B5D3CDA0 
X-CRM114-Status: GOOD (  24.56  )
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



On 05/07/2022 21:33, Conor.Dooley@microchip.com wrote:
> 
> 
> On 05/07/2022 21:19, Sudeep Holla wrote:
>> On Tue, Jul 05, 2022 at 08:04:31PM +0100, Conor Dooley wrote:
>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>
>>> It was reported to me that the Hive Unmatched incorrectly reports
>>> its topology to hwloc, but the StarFive VisionFive did in [0] &
>>> a subsequent off-list email from Brice (the hwloc maintainer).
>>> This turned out not to be entirely true, the /downstream/ version
>>> of the VisionFive does work correctly but not upstream, as the
>>> downstream devicetree has a cpu-map node that was added recently.
>>>
>>> This series adds a cpu-map node to all upstream devicetrees, which
>>> I have tested on mpfs & fu540. The first patch is lifted directly
>>> from the downstream StarFive devicetree.
>>>
>>
>> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
>>
>> I would recommend to have sane defaults in core risc-v code in case of
>> absence of /cpu-map node as it is optional. The reason I mentioned is that
>> Conor mentioned how the default values in absence of the node looked quite
>> wrong. I don't know if it is possible on RISC-V but on ARM64 we do have
>> default values if arch_topology fails to set based on DT/ACPI.
>>
> 
> Yeah the defaults are all -1. I'll add some sane defaults for a v2.
> Thanks,
> Conor.

I shamelessly stole from arm64... Seems to work, but have done minimal
testing (only PolarFire SoC).

Author: Conor Dooley <conor.dooley@microchip.com>
Date:   Wed Jul 6 00:00:34 2022 +0100

    riscv: arch-topology: add sane defaults
    
    RISC-V has no sane defaults to fall back on where there is no cpu-map
    in the devicetree. Add sane defaults in ~the exact same way as ARM64.
    
    Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

diff --git a/arch/riscv/include/asm/topology.h b/arch/riscv/include/asm/topology.h
new file mode 100644
index 000000000000..71c80710f00e
--- /dev/null
+++ b/arch/riscv/include/asm/topology.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022 Microchip Technology Inc. and its subsidiaries
+ */
+
+#ifndef _ASM_RISCV_TOPOLOGY_H
+#define _ASM_RISCV_TOPOLOGY_H
+
+#include <asm-generic/topology.h>
+
+void store_cpu_topology(unsigned int cpuid);
+
+#endif /* _ASM_RISCV_TOPOLOGY_H */
\ No newline at end of file
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index c71d6591d539..9518882ba6f9 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -50,6 +50,7 @@ obj-y += riscv_ksyms.o
 obj-y  += stacktrace.o
 obj-y  += cacheinfo.o
 obj-y  += patch.o
+obj-y  += topology.o
 obj-y  += probes/
 obj-$(CONFIG_MMU) += vdso.o vdso/
 
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index f1e4948a4b52..d551c7f452d4 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -32,6 +32,7 @@
 #include <asm/sections.h>
 #include <asm/sbi.h>
 #include <asm/smp.h>
+#include <asm/topology.h>
 
 #include "head.h"
 
@@ -40,6 +41,8 @@ static DECLARE_COMPLETION(cpu_running);
 void __init smp_prepare_boot_cpu(void)
 {
        init_cpu_topology();
+
+       store_cpu_topology(smp_processor_id());
 }
 
 void __init smp_prepare_cpus(unsigned int max_cpus)
@@ -161,6 +164,7 @@ asmlinkage __visible void smp_callin(void)
        mmgrab(mm);
        current->active_mm = mm;
 
+       store_cpu_topology(curr_cpuid);
        notify_cpu_starting(curr_cpuid);
        numa_add_cpu(curr_cpuid);
        update_siblings_masks(curr_cpuid);
diff --git a/arch/riscv/kernel/topology.c b/arch/riscv/kernel/topology.c
new file mode 100644
index 000000000000..799b3423e0bc
--- /dev/null
+++ b/arch/riscv/kernel/topology.c
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Based on the arm64 version, which was in turn based on arm32, which was
+ * ultimately based on sh's.
+ * The arm64 version was listed as:
+ * Copyright (C) 2011,2013,2014 Linaro Limited.
+ *
+ */
+#include <linux/arch_topology.h>
+#include <linux/topology.h>
+#include <asm/topology.h>
+
+void store_cpu_topology(unsigned int cpuid)
+{
+       struct cpu_topology *cpuid_topo = &cpu_topology[cpuid];
+
+       if (cpuid_topo->package_id != -1)
+               goto topology_populated;
+
+       cpuid_topo->thread_id = -1;
+       cpuid_topo->core_id = cpuid;
+       cpuid_topo->package_id = cpu_to_node(cpuid);
+
+       pr_info("CPU%u: cluster %d core %d thread %d\n",
+                cpuid, cpuid_topo->package_id, cpuid_topo->core_id,
+                cpuid_topo->thread_id);
+
+topology_populated:
+       update_siblings_masks(cpuid);
+}

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
