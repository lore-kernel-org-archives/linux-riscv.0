Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F187C25B0E
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Aug 2022 20:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/UKho16SR4fdoBKMW+7e5ue3eJgpFzchafzuasO7TIg=; b=sPgNyAchiOT23x
	50D4KJvSjzx1/j9i5F4jlVANoezVsnKxz4ZpGpqBdGC+zXE6Z5VNX8UVtcb8HO++uzCl7cLSDMXNi
	bmNIYgbsT3sCZd2VJlL+Yox3UxTOlJAbd+04fq1FSpch5VzWG6BJGSO0SYqneMlip6jcgR1BV93Hg
	WSJWSoX6eBERlDfiDzsxIzHTzi2takIeJoGTxXm0zcGbihGwLGHOmMH9UqGeK9iG2yPVVVtzDVSNW
	XQt4P+8zVKV5djAOXNRHzI2uN6in0ie9BAHxYiAov0OMIu4AO+nxz5TVMSV2nQWI7IWUOZDTeAaa4
	MMA7XyBLEHB5EYYLcCpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO2xX-006h9z-2l; Tue, 16 Aug 2022 20:14:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO2xT-006h63-Az; Tue, 16 Aug 2022 20:14:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660680879; x=1692216879;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=mMqH9Lna6Tl6lUpkAGZH1C51BUVzqUYqcH5lBkKSi7k=;
  b=yo6j6gDiqSAfeNCNVXRs1qlhg/zB0alCGAFdaFpxa0NPFz8aO1q687EB
   hVuYW9TqK91c8byziDY+WnDVq0IBXsTbZoMWu4r1j9y5ciyV/HN2Jskfm
   iYv9eovsuYmzh9phosDzksqBAJr9W79o3xR7+Favh51UZrHiMTj2Y4+Ks
   oNVWJol09w2OIn9sb8MGY6Uig/NnRi0eDFBCrYWuav4bpxZvoabhAAeWR
   NDh8JZ4QhOOgXIy+pmn+DeVQqJBXCFnAeHDc2L+twT2zA18317BjEbdDd
   BWlTMhV9nv5CNLm9OyxaEL+8LRJppvlNYpEZ+Wnfc39WhLWtxv6BgjuQi
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,242,1654585200"; 
   d="scan'208";a="176511216"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Aug 2022 13:14:31 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 16 Aug 2022 13:14:31 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Tue, 16 Aug 2022 13:14:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yv/cRjPS6XQYa68FGsxIjLn0wZnSYhv+CWQpdKVWAD8XsZ3TQ/RJZwGJChuLDUnnRExF2vjfBvlKr9mcpumlf7Qn2fItlwrQ0ttE8tK3CWmmSDpPju5m0buoNKbMm6wCM9eDHepI6E8+/cgoXwFMcicNrKjB7iUvyTXl9tHUTUigGfzdC2rO/hezK64lEVVqWRldNFlxPtGZ+hu1/tRjnPCpQMmTI/b5ch7Lva0cjz5+YAOIIhF5VC74T+ipukXAM/Otra6L7msGVtCiG/ogX8wFD1qd1IEcUSdh7xwf+DgkRTkCs680F6Hl9YPDvP+2IMNO70lWRkfk63VSWv+xXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mMqH9Lna6Tl6lUpkAGZH1C51BUVzqUYqcH5lBkKSi7k=;
 b=NZ+bYt/Qq45KTV5Jx9QjXjheloG23EI3qVhIpq/Gb4zQv9grFEasjR1EiAB5xcyGDLBKASjTcjXZKMP+2cLf0qsLczcNMRvYNR1B2919+dxzAIdmGgZcWM3X+jc+J/9EjYxMarhhJFt277r7VwhZgxl08GaDwk3jDkh4W1ocfEGmXIx9REEJyWB8vWG7av+d3W7GeG8Wt40TrJ4XtgLwZ50PR5zW5/hZ7EMxNaDv5idcxYYVHsBAVXKhCptIbQ9FwTBSA84ySYwCeTSBFhLRbpXUmEmbAExG+YErQzl55YW+C3sH+Kp5S9aQNZ037uqMYjxc7WVFEwfE8X1p0+/MWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mMqH9Lna6Tl6lUpkAGZH1C51BUVzqUYqcH5lBkKSi7k=;
 b=ZciEvz8fT5ICTydzC/GgDKWTIv28b+IuO2rUFrYxGD9j4qUGGbmbSvkucwJCPdU++Oi06/mTTWR1JQfuLRF6oYXL6vHWy5Hu18diLbPahxR5k34wiQp6Tv2lA9+nfrSiCmHymZgqLllvoVDTbzOLQ0lpQxoVOVtuCeqpTYQUAeo=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by MWHPR11MB1407.namprd11.prod.outlook.com (2603:10b6:300:26::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Tue, 16 Aug
 2022 20:14:26 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Tue, 16 Aug 2022
 20:14:25 +0000
From: <Conor.Dooley@microchip.com>
To: <ajones@ventanamicro.com>, <linux-riscv@lists.infradead.org>,
	<kvm-riscv@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, <daolu@rivosinc.com>,
	<jszhang@kernel.org>, <palmer@dabbelt.com>, <re@w6rz.net>,
	<apatel@ventanamicro.com>
Subject: Re: [PATCH] riscv: Ensure isa-ext static keys are writable
Thread-Topic: [PATCH] riscv: Ensure isa-ext static keys are writable
Thread-Index: AQHYsY2eGYLw8iAi7E2kcFjuy+7hb62x9nSA
Date: Tue, 16 Aug 2022 20:14:25 +0000
Message-ID: <6f392592-e2fd-9fa1-4f43-c79a489d95ae@microchip.com>
References: <20220816163058.3004536-1-ajones@ventanamicro.com>
In-Reply-To: <20220816163058.3004536-1-ajones@ventanamicro.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9fb7b860-c9fa-4ec3-69bf-08da7fc3eab2
x-ms-traffictypediagnostic: MWHPR11MB1407:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NIyDZXfjziB305UeenVTh9UkpH6/8WOkBWjmDE/+g8+wg5zv6GynlGwlf1d0b6LJXpYdAM0dMibx4Mcs/tw7usCq0ut2vehQafQQeeNzClvwrKy44pZG3ydcn2v8VxF/GQ6V+tRPtIhSigSLH2hLa1hv51OCm8lu+agBFW9er5+dpdmk7elTNygj4B+BPQVrlQ/RATCW/8TPfeIjfJ92ecPW2GVwVYwQS/u1LpR7+EGacz+2kyQkJyHY6Qp/cq3W5W3v3EYVytGrBqy0dHzfBYqoHgMY9N5KylZm1ttGnccg3G2xm6BZ7DUCMEpYI/458xJccKcyTxF5mICRjHxmlVrSloVy5W+k0U3kv/RBAhBoj/JOSqjJlYCflExt6KVCSAStYNgnaf8dnOLFvNpQmdKl7OIlG5v6lXJ278Q5//1YV4JT5tAjLKEuAxgsX0WidCJiu0RqqM3c78z8lSi+ITnaow+NUf1NwFx5BgS5GOgEkBXK+/hi8eAgXkqKe78NlH2u3AiUfRZ2l9jd5c0STRkWOvlagNKZ0TVB7sVSl/5WekMQoA1h3F719hpYu2rDhjKwSRwn6otOQ1e/iN/3YvZk/uvQNP+6SBvcx95No42FBdNKzkEhRk0kcvCdmoUBZWvbYoPlJm7yWnc0QeVqOZWsEsbflKeE9OfOHXn8+G0CYWBBQfHF8v6kvjvTWY+b4QXR67iDTPeIpsYPns0eiB/jDjqRGKyMGnhym+K8f/SQrB8+RXk9V+Ptht7pY9OBqizMwq/eFEqpx9FjZmeWcIaqE9L6gfv+nBvuPsCGuvLPsIg5RzA1aOKzDQm6rUopVkWUaEjbsfo/upcGLpfUNp6VAVKYllPD9Bmyn9+AtGi2q/871GvNPc1MT6DuOJ9E
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(136003)(396003)(376002)(39860400002)(346002)(2616005)(38100700002)(31696002)(316002)(86362001)(91956017)(66556008)(8676002)(64756008)(66446008)(4326008)(66476007)(122000001)(66946007)(38070700005)(6506007)(6486002)(76116006)(53546011)(478600001)(83380400001)(5660300002)(36756003)(8936002)(6512007)(186003)(26005)(54906003)(71200400001)(41300700001)(110136005)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TTVaVyt3V1hVTTc4emhJazg2QjRDT3lEVFoxd2xpSjBDdnhnMGhDQlpFdXhB?=
 =?utf-8?B?bzVsRUVmL0wvZGlIU2QrbkdqZ0drNUNYVXE0SXA4SWptRnBISUYrTmlTZWNQ?=
 =?utf-8?B?TTVhNENjTmNVYlRDT2ZkOTNrUjNkaC9WNEdLTXFIb2s0amROekorUXBCa0lY?=
 =?utf-8?B?TWk3NlYrVlFjT051R2g2TXU3YmdjVm1DMk9PUStpUFdzQXJCV3ZIcEFiaXVU?=
 =?utf-8?B?YzJmcXY3OUtNL1ZHUzRQbndYbjl4bGRvcVhOcE1NMlFaWW1IakhoYk8yZlla?=
 =?utf-8?B?WktVcmhKcnBRdnh5citIbEF0aTMwZXdmOFIwYjJRZXBQOVdsOEVXVVlkOElv?=
 =?utf-8?B?YUdRTnhENlJpNGk3YS92YnROVmtRRDN2WHlYeDhmdlpTSDN3MDFpQzlReWN1?=
 =?utf-8?B?cjEvamJKR1ptemVoQkpLQVRpWDhXalQwNkFncjk2N2dHRUYrUFc2S01BY1U1?=
 =?utf-8?B?bEE0M0k5Q3lZZHd2aVFxQjBEREk4T3RyNkJsdXErTlVYWmhTclZXQlZ0OWJN?=
 =?utf-8?B?RGdSMUdTNmYvYUVSdHJ2UXRsU3hhZVZsT29ldC94ZjdRVVNTTHM5YmFWbUNH?=
 =?utf-8?B?Ky9FZ0x1UkpVUHk1UUhxN2Jqb242bGZJY1BQWTdGdDJMd1JJZnVUY1lpR2Fl?=
 =?utf-8?B?SCtIT2I3dUYyWXZ5NGpMWXZuWnB0ZXRvcW9MczM3RDh2RVU2U0xUcjJMb05p?=
 =?utf-8?B?WlNhV0czU29wT2xOSjhwNGpsV29RUVBhbVY1S2dJdW05QzFrRUhKQ2R3b3NO?=
 =?utf-8?B?RFB3OUw4ZVMrTkVpeHlZU2JoNTFvVitEdmZVb1dDSERvRytaZXE2OE9aQldL?=
 =?utf-8?B?SWNkSHV6QzlLazkyMTB1RGd0aEd2OXV4ZlVmL3dZL016WDg1U1NyZ2h2M2I2?=
 =?utf-8?B?UW4rSVQyOGRBTUtremlXN1NzUmZTM2dVQk1IVlZaUWZLS2RUTFpNOFBkaWZv?=
 =?utf-8?B?clFiaGxySUdNUnJINmwwWVlwZFptWWFHQ2xZazdYTFZhWUt5ak9UcUJINUs4?=
 =?utf-8?B?UkRHZk1lb1pjbVNFeElOSGJZMWNVV0FLSXRIVzdGL1FUK3J6RldIUE81bnBG?=
 =?utf-8?B?aVZuMU5VQzNuUHpnQ1NIR3BOT05CZ0dDNmFxNXNkSGhBU0tRdmVPSGxqN2l6?=
 =?utf-8?B?aHlWVXN0SGF5NCtCSDg2dDNSU213YTRtNDRUTnQrWVNnT091MGVKbEp4bk1U?=
 =?utf-8?B?M3I3ay84S1dQTXg5SncyL0EzeklvUC92LzhYbEx1OENyYjBkMTFHMUo3c3I5?=
 =?utf-8?B?VENrUCs2WUlpWGVSdFNRWmh2U2QzWmlYS2g3MTgzL1dFdE1kSE1rOFlTNFBa?=
 =?utf-8?B?THpGd0NGSHB1QkNST3B0dXBGUjRmQTl0Z1lrQ2tUZE0vVVRwUi9CU3BEbE9x?=
 =?utf-8?B?ZnVZaSt0Vnd1ODZpU2t6aURsVDY5MkMxcGVEZ01RWkhVNEovZXdndTUvYnk1?=
 =?utf-8?B?SlhlUXlsczR4Wnl4WmNodUpnMTZlbnlWM29SSXYvQU8yTUVlWlF4bU1ZeHRi?=
 =?utf-8?B?UVYzVWhlWUdEbUkySFI2WndMZE1YYnU4OXkwWVJQd1NWUHlGQ3p5TW5pbzl6?=
 =?utf-8?B?bnlMVXlyaFJackRMRERObUt5UDhOSHZhNFJrUkZDamNIWEYyTTNlVzdmZ2pu?=
 =?utf-8?B?Z3VBdkpDc0pjODZqZWVtQk1RUm90Vm05KzAvZk1hQVZUTVoxU0FieGIzQVdi?=
 =?utf-8?B?alFUdHY4Zjc0UnNaNER5T1c0akhRUDBZVFpoRGcwdS9TVlIwVTFJbUxTQ2dJ?=
 =?utf-8?B?eEFaVUUwUlVpSTVncURlb2I2QUpkR0tBT3l6Yng0aVgvWUJQS1hhNllISWpu?=
 =?utf-8?B?UGRRRTBSRlo5akwxT1R6UVZuMU1Wak1abXZvQUg1NVZXb3BnQjRmeDBXdmFm?=
 =?utf-8?B?TnU5VGZzMGxHWVE2YUxOWHN5UXBCZjBJQi9VUjJjbXpGdVFoNUdxZjRCUFVs?=
 =?utf-8?B?SitsbkZXeDJibFdQYnFIR1UwQVQyZ2ZCMXRUYVNIMFY5cHVhak1BU21ONjM4?=
 =?utf-8?B?MlI3ajAzcE9oVXE4MjNqcDJzcmFtRXlERUhlemNTZ0YxNXN3S29KUjlTVjhq?=
 =?utf-8?B?TnNVaGVqdmlHSExsSkJxUXFxSkk2ZTloelhKeWY1N2lJc1RCNzlOMFk4S0RC?=
 =?utf-8?Q?LMIU0bkp9ikia18gCUZsr7CQt?=
Content-ID: <90465026C89F844C9E8A2947815775B9@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fb7b860-c9fa-4ec3-69bf-08da7fc3eab2
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2022 20:14:25.9101
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GuE6dw76LRteIIufEB/lvs693SRkhEoBX6+Ta/j3oXoFRcPz7rm8FFP3Jm7k7ZH4McPZL/yFvUs+csOYcXNB9ZSQQHA0sMOmKkfacDvzu6M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1407
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_131439_682154_8B5DD726 
X-CRM114-Status: GOOD (  17.57  )
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

On 16/08/2022 17:30, Andrew Jones wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> riscv_isa_ext_keys[] is an array of static keys used in the unified
> ISA extension framework. The keys added to this array may be used
> anywhere, including in modules. Ensure the keys remain writable by
> placing them in the data section.
> 
> The need to change riscv_isa_ext_keys[]'s section was found when the
> kvm module started failing to load. Commit 8eb060e10185 ("arch/riscv:
> add Zihintpause support") adds a static branch check for a newly
> added isa-ext key to cpu_relax(), which kvm uses.
> 
> Fixes: c360cbec3511 ("riscv: introduce unified static key mechanism for ISA extensions")
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

Tested-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for the fix!

Still got issues booting mainline on my D1, but this is
no longer one of them :)

> ---
>  arch/riscv/kernel/cpufeature.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 553d755483ed..3b5583db9d80 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -28,7 +28,7 @@ unsigned long elf_hwcap __read_mostly;
>  /* Host ISA bitmap */
>  static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
> 
> -__ro_after_init DEFINE_STATIC_KEY_ARRAY_FALSE(riscv_isa_ext_keys, RISCV_ISA_EXT_KEY_MAX);
> +DEFINE_STATIC_KEY_ARRAY_FALSE(riscv_isa_ext_keys, RISCV_ISA_EXT_KEY_MAX);
>  EXPORT_SYMBOL(riscv_isa_ext_keys);
> 
>  /**
> --
> 2.37.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
