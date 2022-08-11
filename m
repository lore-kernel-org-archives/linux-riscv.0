Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B3A7C19F2A
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Aug 2022 21:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XNyJAZtCCO9UTeec0q441gVocwOEnSoPxLTHwU2Tn8Q=; b=CwDgB0c3YuGa8H
	R2mrRdGaEaRf7aVmPtWbg9PRF/lFox3E2HP3QNmKJLFaIMdEcaDa22jXoxrzjU6ijjUtJkbuCj9JV
	4TVdazElJxIDQfZgBcRxxAxXJRPbRtg1GpGiWN67o0XWV2zviwbI1W1W5tr3kiCewxcda5m20qnYo
	6lplkxJjCLluCLTaRuy2cdkbpHIgSCy4VGALsQYrgutCU+gQsTDWtYfvQ8d1wLOtfmE3TET9IFQ7k
	bU3D8bIFn8eqPTQVW45tZhIdGRZp69IiIVi6xpRE9muzOOwUVxw9a8SHqBpD70cTF0BW2f+JaQNoo
	evIFeY5RpLr7WMGEyqpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMFgt-005Urs-DA; Thu, 11 Aug 2022 21:26:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMFgq-005Uoj-7E
	for linux-riscv@lists.infradead.org; Thu, 11 Aug 2022 21:26:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660253164; x=1691789164;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=srKFLbhpvPvCpfepSNZnkdLlZV3slLVj2DOnGX6qFo0=;
  b=OvPBY6KKS4Am8R+DMNHZWooJTqmsWED4lZs0kmHxXPLfCkxBF3siLmdG
   M3sv+xDqUWRnZHgLOOo/PevCkYmtZizcylZ7OuUgsBkvcYA/1h7gWXsWH
   JS+hzX6hyu+rGL+6A8NpUskn+5uG/0FTQuXHD5oJv9OPincj5FTBr29ut
   Qe9ByBcmxU7dRAY2kDdPhCWV00gevD/h2GSqoeSHQ1tPo6H0rSHYGM6wi
   HHeHsOJ5KcVyOSgjIsD7SynGl6KV/9u3bHUagmvQZt59Fa2VE5+irzM7Z
   HC6s52KpI7LyIoldxDPBgiHx7CFZPfVdBuTgAeA+MvGmnSkO/v6N7gjAv
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,230,1654585200"; 
   d="scan'208";a="186137918"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Aug 2022 14:26:03 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 11 Aug 2022 14:26:03 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Thu, 11 Aug 2022 14:26:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f8ahFYfOWu06bpSS1JJu+2RvpMAx0zJAhOzh6Z+YKc/a/DVvj3tl3mKzQaRaSAh5pJDXL5UybaS5mLxG8o45VXHYrAq7hxiMZZ9VObN8tbY4Qxxixdh4XvSs/vB1njx2f6IzCmsshVypcVLNCgjYooSDGn71D/0KJyIB2at2ClO4yY9abHUh2AVM3KphZkY6DvZywuTMccyms+Lq0ic+Wjb2PsvwvEIFLEoA7aR4AO0D1zJ2uDx5LeKQxU7aiK+AkJzaCq7DjXQC4s88SmN0x9dbnJQgFuEWJDCtyaut0C3NqMsk41q5BSf+u12CxW0yJ5DHdKA7ruuxJrlM4fMonQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=srKFLbhpvPvCpfepSNZnkdLlZV3slLVj2DOnGX6qFo0=;
 b=oA5psf4Yidr/OTellQnz++Xzi+92rw9AqTeMl6YedlKa5TakzdvZKt/q3tfHYP7i+FBRX5JFN4cB/i3lN+7T6gQIp7Kmpunj2I49Wk9rb7Bf6CMnkxzdnwqdy0YXfOTkWztlZjPxmO/jjJ1DgPGl/xX8B+Sz4Gk+KEIAEZEBBEVYh+xJHvBtGTra1n7VZqyeFW+x1JglMJf63mNGSC/eF8S/KoCqzZ1uImsHU9cd4YyT+nwjj3kBwHnK08kmKrJWygRddAnzQCe7HZhPYdF7dRmZ4VEu1nM34t3l5uUd8zqMswWCw1gg5JHZYp03uF3b3b4l6Q97SLgigPwSvnQ8RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=srKFLbhpvPvCpfepSNZnkdLlZV3slLVj2DOnGX6qFo0=;
 b=gZpETvhaxrT+Q74O8u4dDwceQXW0OI7FLsEcKyDvUYD9ghJ+d2Q8gmmRH6mtKhnsftcgwq0UWvYb4k2PSbEFZdrHeilUY0g8brRQEW+1OgIkBPdXRFtoFpy0BtrP/UcG2abeKfa6Xmb+bcH1E/bGLS70Bz/W0Mku+ZNVgMvsC9A=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by PH0PR11MB4920.namprd11.prod.outlook.com (2603:10b6:510:41::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Thu, 11 Aug
 2022 21:26:00 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Thu, 11 Aug 2022
 21:26:00 +0000
From: <Conor.Dooley@microchip.com>
To: <palmer@dabbelt.com>
CC: <ben.dooks@sifive.com>, <linux-riscv@lists.infradead.org>,
	<paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<sudip.mukherjee@sifive.com>, <jude.onyenegecha@sifive.com>
Subject: Re: [PATCH] riscv/vdso: fix missing vdso_data declaration
Thread-Topic: [PATCH] riscv/vdso: fix missing vdso_data declaration
Thread-Index: AQHYlwUDWewAM0BLJUeq97TdYernnq19aZYAgCz094CAAAVQAA==
Date: Thu, 11 Aug 2022 21:26:00 +0000
Message-ID: <ddf6dc4a-eaa1-7fdb-62d3-9f25bd1da9a5@microchip.com>
References: <mhng-66872b72-36b1-42f8-abde-3af0af59298e@palmer-ri-x1c9>
In-Reply-To: <mhng-66872b72-36b1-42f8-abde-3af0af59298e@palmer-ri-x1c9>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 62e0f756-610e-4eaa-5900-08da7be0165a
x-ms-traffictypediagnostic: PH0PR11MB4920:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BFec7ftEi3X6nBygpH5oFIkwWU+LeXqDx7wHIOL1pYcugeFSGjcXGzAPNQI4MD4WuoAjkYmFlxKYF+Hqtif74IfVxuC5P452xdCtZ5X+BO50gA/nVR4X2mjSvRErgfTqI9pFc9AOytEcRVNgG8qOz3jabXXCiKmQisH54xz/YXOYqTe+PnsxpDEb0RdfQgs58wAWF7vqeAv2fuaOE+CF3/zd/BsOLBxNPeZsKcXvo2ewNmFXvAJEwUaizidqrc/WOuuDLy9JlIQsHfk8lV8sUQ6Ips/ieKoVQ6INs2q3rYDaft+0YH7n7w7A73gm3CBOHrSRLysr4gt/cW8MNL0UJHhPXUqAcqqAqJBSlAbJaeLvcjZDr8bHiEq0++jDCKKQnx/YRmx1y1a6iIsJpC1o9NZvm7JBij4wC+7Qwn0I/yH7ccKxeFBXQcCSv8Tb1Co3flB0usn8AGH2qMi0LK9jhr6aBA2JPsRfGrEXUqyQQbFnD9oU+EIN0ttxjaSvTY4hEhp16/jRkYWKtqOX7Y6Wl8oRcndeputdYL9htfpxK70+Gtlt2UJo4C817Dc9CVZP2rV48QlK4vynFWzluZua3sijLiyeS73IhOfJ7jNK8lMBtW4BWNVo0aclYXgHUuJXS+Pp8v7Nd9UseW870Dohckxxd1yJJ4qKqLMJFzs7KihTU8Q7HCxr0Jw2fFH5NoDrTbhfd3AiQc+xYC0tdPxewBNWw6fX0MqYdTeddU0cY0lvN170Gxf2gnjw7Bki9+983zWeG/+smn3uI8lakAV6qnAKH4bdtYvlBBe/bn08lyyqnuXRJLOqQvWIrP56E/+ZX2fv8AY92v9+QkdpTXq4RlulZD49HD+SH6J4sO6qeWKDQO0dj/2rN8xo5055CpML7MKN6KsTNbfrXRHfePZBjg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(376002)(346002)(136003)(39860400002)(396003)(316002)(66946007)(6916009)(76116006)(66556008)(66476007)(66446008)(64756008)(8676002)(4326008)(54906003)(91956017)(5660300002)(8936002)(2906002)(38100700002)(122000001)(38070700005)(86362001)(36756003)(31696002)(966005)(6486002)(478600001)(6506007)(41300700001)(71200400001)(83380400001)(53546011)(26005)(6512007)(186003)(2616005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TUxlSmg5Ylk5bVdReXg3NVZ2NTZXc3NjTnk5SGJCQjZpeGZXanRpLzlWOFlI?=
 =?utf-8?B?N3oxSERoMDdWM25oQkE1c0lvRmdXSU1wekM3OGZiNlB2V2QwQ0g4NkhuVWFs?=
 =?utf-8?B?OUpDYTJUcGRjRnVKNytFUk5nOGFFSDgyZGpJSk1Ua1lybkV0N1dWNk9FdzRi?=
 =?utf-8?B?UmV5TVNZdlM2WG8ybHlja3Fob3N5aW13MWU4MjVHSUhwT25WQWlEQUVlcjZQ?=
 =?utf-8?B?L1FWWG5WOS9TT0JKT0xIRlJJTlJqSTBGMHFIK3hTUXpWUjE3SVRzajNsZlJY?=
 =?utf-8?B?cFZ0cnphWWVjSUxWSUlnYjBua3EwVmhyK3RveGJ4WFBNMlNoZktmV1c3RFRu?=
 =?utf-8?B?dEdoYzV3ZnZZaGpMV0tnT0R5L3RxMVBBckFFeGVtc2xQTmtJWVdQQWdzc0RQ?=
 =?utf-8?B?d2ZCVDFzM3lKVVFqT0gwODhwaXlGaFB4MVpvSDVmTldBNklyaU02VXJLR01E?=
 =?utf-8?B?TzlLOXQ0WnJGZm9HYzJmVkM1Nnl2OURPV1VJYXkyaG5aSGxBcFpzS0R5eHJ2?=
 =?utf-8?B?eFhsa094b05hK1R0VnoyNzFNaTZYVlkzRWpTZHNKOW1vQi9QQ3lVUXJQTWR0?=
 =?utf-8?B?N3ByTTF6bW4rdE4xbDZmOXJwMTR4YU5jZFhadkhWc2NXMDZHVUVTOTQxSjVy?=
 =?utf-8?B?bFlXVUwzYWdsYm9HYm9IMXdsdms0ZExjeWg1aWY5WjZYdU1paWtQSGVGYnRE?=
 =?utf-8?B?YWxQRVJ2OHQzQ2JZSDU2WDdRTkRyWTdySkFicVVRQnpBamZJcDVoNml4RnE5?=
 =?utf-8?B?cUMvYzI0SER5QmFjNk85amQvSm9OZktZV2pCM1B6dXhHUVArV09CTWJtOHNT?=
 =?utf-8?B?TWllVW9lUHZrdFNKNGUrNGo3TTBHL3pranZHMmFNSEVDUnZCSU5sV1o1Um9O?=
 =?utf-8?B?OFVGTEZmZzc2eXFJek84Z0lzWHJ5Q1VtamFVTDZqRlRpZ1RsWDVjaTZKbHZH?=
 =?utf-8?B?Ri9QdE9VdEtkUG9hZ0ZGZ1lHL0Y3d0VEb1ZjVlg3SlN1MkFVR3VnK0o5bXBV?=
 =?utf-8?B?Ni9VMjVma0x1bFhCWXFMdUNDK1g0TUx4UFpNU3ZOOWh0Unp2bldHc0xGcnJF?=
 =?utf-8?B?cS9JcUJxNU9KYTJqWkhXUnZ4UHY5TE43RjY4S1dpZU05SHdmVFFJaXBLL2NU?=
 =?utf-8?B?U0VlUE9TTis3Qnp3RFpjR1V6UDIrNDJaY1duVmk5VVRGSDExTnJxRm1NVnZG?=
 =?utf-8?B?d0lTRGxzNm1LY3lJRktCMVFRWXVlbm1mTmhHa3JuMUdJc2k2cDM4d3pkSUFZ?=
 =?utf-8?B?NUFFK1pucDFrVjNIUWw5V0l2V05nRHVPV3g4MUFNU3FvL0xTMkFLQ2wxbEpr?=
 =?utf-8?B?Rk1mQ1hWLzFxS2s2ejBhRGRtaVc1bkl1YWlXekMwNlFGbTQzVWpNeTZxTmtT?=
 =?utf-8?B?N3BuenhTZDQ4U2lRZ0tGajNKVWtITEtxYitjSTFJQWp0ZVhHZFdsalNZdWto?=
 =?utf-8?B?OTcySzFOamxoa0tiNm1qVDVRMkNJOVVxeHlOLzRqdVhHdHo2R1N1TkhJWDFi?=
 =?utf-8?B?Y2JONytQTS9uTGloalV0Tkp3V1dhZXdSSUpoVnJTOE9xaTFUaUxKaVowb2E1?=
 =?utf-8?B?bElXaCtSWWNMQ3o0eFBuOXpSYlIxUndvbkJUTXFxdjZibzM2RjhtSkM1N3Jw?=
 =?utf-8?B?U3NCWXdXenc0MkFseFFPNFRnaTVwWHdpT1ZsRXQrZXMyakMvTVN5N1dmMUV5?=
 =?utf-8?B?Mzl0NmxHWlQ0Tk9iQVIzemRISldxWEkrbmpWdEhGMzhQemxFT2N1Rzl1OHhD?=
 =?utf-8?B?dlR1R0ZuL2ErWXc0Yy9HQ3RBVCsrU0NsZlJkUkxDbG8vamhLUSs1djFlVUJH?=
 =?utf-8?B?NFdvbTJpZVJvN3NtSXJQaXQrWEJ0cWxueVQrTzk3N2FZdElMd0Qrd1ppSllt?=
 =?utf-8?B?Y28rMEw2dXlocnVqa2JYRGpiS3MvZEhWSVlSb250aFp3ZmVwY0Z6alFhOWYv?=
 =?utf-8?B?KzVpY2JIV29wWnlQMkZmeTdvLzNZWElRaTl3elBUQ1BLK2hJQVZEeEhBcEls?=
 =?utf-8?B?WW1SRlQ4WGE5RjlOWlJaQTZicVZIUHNReE5ObGI0dEZiVk1Ea251TndLSXZ0?=
 =?utf-8?B?VWZ3R2lsUlRCZnQ2T1krS2hhTzJHc0JGUmxGVmtZVWkxM1p2R09GVzIxckdu?=
 =?utf-8?Q?kurV6fWMxpp+qLxn3gnRh+h3p?=
Content-ID: <FF84086BF6F2B947BDD3D5657BAB6A64@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62e0f756-610e-4eaa-5900-08da7be0165a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2022 21:26:00.3788
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yesQwOSWkzYXB7hj7CrY2oLySkGCM5r16DWcsvG0ee7gdXXLjqeDLGkIw0d6NYcJnBf5eD7ujzqBurYA95QWKMp7V3ipajV2G2AEWpdAi5w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4920
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_142604_578277_48B56211 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTEvMDgvMjAyMiAyMjowNiwgUGFsbWVyIERhYmJlbHQgd3JvdGU6DQo+IEVYVEVSTkFMIEVN
QUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtu
b3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gT24gV2VkLCAxMyBKdWwgMjAyMiAyMzozNDoz
NiBQRFQgKC0wNzAwKSwgQ29ub3IuRG9vbGV5QG1pY3JvY2hpcC5jb20gd3JvdGU6DQo+PiBPbiAx
My8wNy8yMDIyIDIzOjA2LCBCZW4gRG9va3Mgd3JvdGU6DQo+Pj4gRVhURVJOQUwgRU1BSUw6IERv
IG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0aGUg
Y29udGVudCBpcyBzYWZlDQo+Pj4NCj4+PiBUaGUgdmRzb19kYXRhIGlzIGRlZmluZWQgYnkgaGFz
IG5vIGRlY2xhcmF0aW9uIGFzIHRoZQ0KPj4+IGFyY2gvcmlzY3Yva2VybmVsL3Zkc28uYyBkb2Vz
IG5vdCBpbmNsdWRlIGFzbS92ZHNvL3ZzeXNjYWxsLmgNCj4+PiBmb3IgdGhlIGRlZmluaXRpb24u
IEZpeCB0aGUgZm9sbG93aW5nIHNwYXJzZSB3YXJuaW5nIGJ5DQo+Pj4gYWRkaW5nIGluIHRoZSBh
c20vdmRzby92c3lzY2FsbC5oDQo+Pj4NCj4+PiBhcmNoL3Jpc2N2L2tlcm5lbC92ZHNvLmM6NDI6
MTg6IHdhcm5pbmc6IHN5bWJvbCAndmRzb19kYXRhJyB3YXMgbm90IGRlY2xhcmVkLiBTaG91bGQg
aXQgYmUgc3RhdGljPw0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogQmVuIERvb2tzIDxiZW4uZG9v
a3NAc2lmaXZlLmNvbT4NCj4+DQo+PiBSZXZpZXdlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5k
b29sZXlAbWljcm9jaGlwLmNvbT4NCj4gDQo+IFRoaXMgb25lIGdpdmVzIG1lIGEgYnVuY2ggb2Yg
YnVpbGQgZXJyb3JzLCB0aGluZ3MgbGlrZQ0KDQpIbW0sIHdoYXQncyB5b3VyIGRlZmNvbmZpZyBm
b3IgdGhpcz8NCkkgdGVzdGVkIHdpdGggbXkgZGV2IGRlZmNvbmZpZyBhbmQgcmlzY3YncyBkZWZh
dWx0IG9uZSBhdCB0aGUgdGltZSBidXQNCnNhdyBub3RoaW5nLiBUcmllZCBib3RoIGFnYWluIG5v
dyAmIG5vIGVycm9ycy4NCg0KPiANCj4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC9zY3JhdGNoL21l
cmdlcy9rby1saW51eC1uZXh0L2xpbnV4L2luY2x1ZGUvdmRzby9kYXRhcGFnZS5oOjEzNywNCj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZyb20gL3NjcmF0Y2gvbWVyZ2VzL2tvLWxp
bnV4LW5leHQvbGludXgvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZHNvL3ZzeXNjYWxsLmg6OCwN
Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZyb20gL3NjcmF0Y2gvbWVyZ2VzL2tv
LWxpbnV4LW5leHQvbGludXgvYXJjaC9yaXNjdi9rZXJuZWwvdmRzby5jOjE2Og0KPiAvc2NyYXRj
aC9tZXJnZXMva28tbGludXgtbmV4dC9saW51eC9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zkc28v
Z2V0dGltZW9mZGF5Lmg6IEluIGZ1bmN0aW9uICdnZXR0aW1lb2ZkYXlfZmFsbGJhY2snOg0KPiAv
c2NyYXRjaC9tZXJnZXMva28tbGludXgtbmV4dC9saW51eC9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3Zkc28vZ2V0dGltZW9mZGF5Lmg6MjE6Mzg6IGVycm9yOiAnX19OUl9nZXR0aW1lb2ZkYXknIHVu
ZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKQ0KPiDCoCAyMSB8wqDCoMKgwqDC
oMKgwqDCoCByZWdpc3RlciBsb25nIG5yIGFzbSgiYTciKSA9IF9fTlJfZ2V0dGltZW9mZGF5Ow0K
PiDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXn5+fn5+fn5+fn5+fn5+fn4NCj4gL3NjcmF0
Y2gvbWVyZ2VzL2tvLWxpbnV4LW5leHQvbGludXgvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZHNv
L2dldHRpbWVvZmRheS5oOjIxOjM4OiBub3RlOiBlYWNoIHVuZGVjbGFyZWQgaWRlbnRpZmllciBp
cyByZXBvcnRlZCBvbmx5IG9uY2UgZm9yIGVhY2ggZnVuY3Rpb24gaXQgYXBwZWFycyBpbg0KPiAv
c2NyYXRjaC9tZXJnZXMva28tbGludXgtbmV4dC9saW51eC9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3Zkc28vZ2V0dGltZW9mZGF5Lmg6IEluIGZ1bmN0aW9uICdjbG9ja19nZXR0aW1lX2ZhbGxiYWNr
JzoNCj4gL3NjcmF0Y2gvbWVyZ2VzL2tvLWxpbnV4LW5leHQvbGludXgvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS92ZHNvL2dldHRpbWVvZmRheS5oOjM3OjM4OiBlcnJvcjogJ19fTlJfY2xvY2tfZ2V0
dGltZScgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rpb24pDQo+IMKgIDM3IHzC
oMKgwqDCoMKgwqDCoMKgIHJlZ2lzdGVyIGxvbmcgbnIgYXNtKCJhNyIpID0gX19OUl9jbG9ja19n
ZXR0aW1lOw0KPiDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXn5+fn5+fn5+fn5+fn5+fn5+
DQo+IC9zY3JhdGNoL21lcmdlcy9rby1saW51eC1uZXh0L2xpbnV4L2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vdmRzby9nZXR0aW1lb2ZkYXkuaDogSW4gZnVuY3Rpb24gJ2Nsb2NrX2dldHJlc19mYWxs
YmFjayc6DQo+IC9zY3JhdGNoL21lcmdlcy9rby1saW51eC1uZXh0L2xpbnV4L2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vdmRzby9nZXR0aW1lb2ZkYXkuaDo1MzozODogZXJyb3I6ICdfX05SX2Nsb2Nr
X2dldHJlcycgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rpb24pDQo+IMKgIDUz
IHzCoMKgwqDCoMKgwqDCoMKgIHJlZ2lzdGVyIGxvbmcgbnIgYXNtKCJhNyIpID0gX19OUl9jbG9j
a19nZXRyZXM7DQo+IMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBefn5+fn5+fn5+fn5+fn5+
fg0KPiAvc2NyYXRjaC9tZXJnZXMva28tbGludXgtbmV4dC9saW51eC9hcmNoL3Jpc2N2L2tlcm5l
bC92ZHNvLmM6IEF0IHRvcCBsZXZlbDoNCj4gL3NjcmF0Y2gvbWVyZ2VzL2tvLWxpbnV4LW5leHQv
bGludXgvYXJjaC9yaXNjdi9rZXJuZWwvdmRzby5jOjIyOjg6IGVycm9yOiByZWRlZmluaXRpb24g
b2YgJ3N0cnVjdCB2ZHNvX2RhdGEnDQo+IMKgIDIyIHwgc3RydWN0IHZkc29fZGF0YSB7DQo+IMKg
wqDCoMKgIHzCoMKgwqDCoMKgwqDCoCBefn5+fn5+fn4NCj4gL3NjcmF0Y2gvbWVyZ2VzL2tvLWxp
bnV4LW5leHQvbGludXgvaW5jbHVkZS92ZHNvL2RhdGFwYWdlLmg6OTA6ODogbm90ZTogb3JpZ2lu
YWxseSBkZWZpbmVkIGhlcmUNCj4gwqAgOTAgfCBzdHJ1Y3QgdmRzb19kYXRhIHsNCj4gwqDCoMKg
wqAgfMKgwqDCoMKgwqDCoMKgIF5+fn5+fn5+fg0KPiAvc2NyYXRjaC9tZXJnZXMva28tbGludXgt
bmV4dC9saW51eC9hcmNoL3Jpc2N2L2tlcm5lbC92ZHNvLmM6NTE6MTk6IGVycm9yOiBjb25mbGlj
dGluZyB0eXBlcyBmb3IgJ3Zkc29fZGF0YSc7IGhhdmUgJ3N0cnVjdCB2ZHNvX2RhdGEgKicNCj4g
wqAgNTEgfCBzdHJ1Y3QgdmRzb19kYXRhICp2ZHNvX2RhdGEgPSAmdmRzb19kYXRhX3N0b3JlLmRh
dGE7DQo+IMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXn5+
fn5+fn5+DQo+IC9zY3JhdGNoL21lcmdlcy9rby1saW51eC1uZXh0L2xpbnV4L2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vdmRzby92c3lzY2FsbC5oOjEwOjI2OiBub3RlOiBwcmV2aW91cyBkZWNsYXJh
dGlvbiBvZiAndmRzb19kYXRhJyB3aXRoIHR5cGUgJ3N0cnVjdCB2ZHNvX2RhdGEgKicNCj4gwqAg
MTAgfCBleHRlcm4gc3RydWN0IHZkc29fZGF0YSAqdmRzb19kYXRhOw0KPiDCoMKgwqDCoCB8wqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXn5+fn5+fn5+
DQo+IA0KPj4NCj4+PiAtLS0NCj4+PiDCoCBhcmNoL3Jpc2N2L2tlcm5lbC92ZHNvLmMgfCAxICsN
Cj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4+Pg0KPj4+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC92ZHNvLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC92ZHNvLmMN
Cj4+PiBpbmRleCA2OWIwNWI2YzE4MWIuLjc1NjRmMDIwODk1NyAxMDA2NDQNCj4+PiAtLS0gYS9h
cmNoL3Jpc2N2L2tlcm5lbC92ZHNvLmMNCj4+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC92ZHNv
LmMNCj4+PiBAQCAtMTMsNiArMTMsNyBAQA0KPj4+IMKgICNpbmNsdWRlIDxsaW51eC9lcnIuaD4N
Cj4+PiDCoCAjaW5jbHVkZSA8YXNtL3BhZ2UuaD4NCj4+PiDCoCAjaW5jbHVkZSA8YXNtL3Zkc28u
aD4NCj4+PiArI2luY2x1ZGUgPGFzbS92ZHNvL3ZzeXNjYWxsLmg+DQo+Pj4gwqAgI2luY2x1ZGUg
PGxpbnV4L3RpbWVfbmFtZXNwYWNlLmg+DQo+Pj4NCj4+PiDCoCAjaWZkZWYgQ09ORklHX0dFTkVS
SUNfVElNRV9WU1lTQ0FMTA0KPj4+IC0tIA0KPj4+IDIuMzUuMQ0KPj4+DQo+Pj4NCj4+PiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPj4+IGxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdA0KPj4+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcNCj4+
PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
DQo+Pg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
