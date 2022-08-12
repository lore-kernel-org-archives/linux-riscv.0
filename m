Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EFFAC00140
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Aug 2022 08:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h+JVRDxFpAejjApY4Qi8GKv5Vt724kjP6UZU5EjgSIs=; b=wHmSJeeKxOdr12
	oDE/V24n4QckRiTvWCJg4IMJhwGEloUgJPV+pmqoHmznHQp+l0/oVtp3CwlFVIoUA2Pt0xzowTrHe
	cBe1hufS9DaQhykiLNRanLGG33sh+NZI1SHhb8NnDO0xh0sOYUMKzfs+8q0hFHNEETv38gyQds7jY
	qoHuQPKNj4YN31kQIOWrAoFLgMi73CIC7wy4H61LqfYz9s4XBVJoo2MQa24NrbXZSN3fJb+FD8qn2
	eN8UXo2ZMTOUfgCmQatdCm1FqTpNB7M4qZL25YyRvwBJMnu4cmlTVxsnZFXrIMioZ5PmkL0zJq1sX
	8BQu+oGDFMVx5AHBYRXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMPef-002Pmm-BO; Fri, 12 Aug 2022 08:04:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMPYW-002EhL-1w
	for linux-riscv@lists.infradead.org; Fri, 12 Aug 2022 07:58:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660291087; x=1691827087;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=zQPduV14rsd8V1MhWV9w2wUeAYTFJAQNyA1itKFZpO4=;
  b=MoBdMWlqJ8tUGuHCnSgMCvUmUNNHZyllV3N5H6tGdaxt8kRn/u3E9QY7
   OuI2BuahJevo/oKSCNLcOv76RhPLpA3jbLnV3/p3GFk7d0TyZv44xyk1F
   YTuSzwf+HnuAdm9AAJP48Tr6oCYPWlhZUjl/+nWT6KdnikDhid8C3dBuq
   RWOQe6FqOOFaNXWGWqnRwyW9q3f0MurG3hiuoFcKkrvd4JBtnUpyVqQ4M
   h17ofoU3OArUF1lKvAq212TJOlNgNemZzyD/Hcxob9zobafGzoSkSl+UO
   wVVHwRGK0LtFegumchcueXGBy7Jun2/pEt2q5sU7FIz0ppus0D+nEDV/g
   A==;
X-IronPort-AV: E=Sophos;i="5.93,231,1654585200"; 
   d="scan'208";a="186187893"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Aug 2022 00:58:00 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Fri, 12 Aug 2022 00:57:59 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Fri, 12 Aug 2022 00:57:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gHX+8/HUfVGZ+arrsBxSZprhGrilEZ11bG73f4rLy5ASW7RLjTNU+N76z3NCNJJrVhU7Z51x9A5WDP/7YUfOZa+MJkNgBZyXF0IKskJUuRZX73MrN0a1atAWNJYb+oS5jIDKOulbzg+Yu0U3wPiovFQtMTk430JTbRh6M1NtPs83tKmRG33VVgmTX12roLI+KLzfKydxXIkobW50rjnlOXSdrjfIgthr8Rqtb7ivESC8TnIAIXMyS9V9AOUlEqr4HrhJEVF4cAkV8YnP3mxLHNg3wKTfvHyZlYKe+XIAlj+HSidzw4vmFsvfOkZDDmmvOUdjPav737LN6haFLUWzGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zQPduV14rsd8V1MhWV9w2wUeAYTFJAQNyA1itKFZpO4=;
 b=aYMZ6OLnNJhzqsNIdUzLcKKPEr+HNdl1O7Q05Dmzs1mVsvKjEY54Vcw4ZBESPiDmTtpg0+qkR/w/yKpVGLgfSNIRUd7X9D6P6k4GhDqPB7+QFfPwQJMKK7Adit5K7qZki2+OF2r9iXFz+/NpUvMBOkt0HwqPxLzG2KaGW5RjLTJJCfQMj/fqpOghOzkKYKWEuer8b332GzsSOo9ABAQw1AJ4nWSqYW/dW1n5V9DGLJDc+cr8Q7scscyBzTo2DL2cJh9zWSJUU0y2yhO0WRnani7dO5DxmB6ctEPEYlXJKk/YBgB7ahdFAA4B0FyfXODcnBhLyjmwYvfqD+gVOzPCFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zQPduV14rsd8V1MhWV9w2wUeAYTFJAQNyA1itKFZpO4=;
 b=Dr+SYP1oaA/u9khnSQzDUdrKwjAtc4sBMBL8Bz1faysG/FNapgHXAoz9S1/jsU9TKeSmJ230kn6I+tKYZrkv9FLbcZ3JLsP8xDgDPLoWMSfYfyUNIe2LrE/Z9liI0hG7YVxNQr5myMsrjvawXwuw5h5iOBIEld+dsk/DYpzxyII=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CO6PR11MB5635.namprd11.prod.outlook.com (2603:10b6:5:35f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Fri, 12 Aug
 2022 07:57:53 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Fri, 12 Aug 2022
 07:57:53 +0000
From: <Conor.Dooley@microchip.com>
To: <krzysztof.kozlowski@linaro.org>, <mail@conchuod.ie>,
	<Daire.McNamara@microchip.com>, <bhelgaas@google.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <paul.walmsley@sifive.com>,
	<greentime.hu@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<lpieralisi@kernel.org>
CC: <linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 1/4] dt-bindings: PCI: fu740-pci: fix missing clock-names
Thread-Topic: [PATCH 1/4] dt-bindings: PCI: fu740-pci: fix missing clock-names
Thread-Index: AQHYrcGlXfP4O+KmiU+P5lKvf6cyY62q4HMAgAAGagA=
Date: Fri, 12 Aug 2022 07:57:53 +0000
Message-ID: <2e74b67d-eef3-8900-ead9-8be7b07b2585@microchip.com>
References: <20220811203306.179744-1-mail@conchuod.ie>
 <20220811203306.179744-2-mail@conchuod.ie>
 <f636ad9d-5e9c-f703-221a-3c09f31ed105@linaro.org>
In-Reply-To: <f636ad9d-5e9c-f703-221a-3c09f31ed105@linaro.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d89d5166-45dd-417a-e5e8-08da7c385c8b
x-ms-traffictypediagnostic: CO6PR11MB5635:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lGBXTG7o/9uXQTXiY0gFSeKlaNhkfwqKt8901nPUM+p+YBqKDuutK1tvJkFkPDrXmTYzzDwkoblvZjQIJ9grPQ8YDnJxLuTnxvoBKQv90kSsG6LO++/1UrQOyRlmCGMPHklMVloGPlnVnBTLVwz4EEvUlqlvcM1kfvHkN0WYO+5mfGcrJVct5hN7Imse0Q0FrYdM2VUI0n08FTwLoqVgfqiER5oOpOI63yesljKSduH0fsYJFyIBGfP5vbZ5MLAs3ZmpmBtkK7ibLei3rSXm8H+OVYn1RV+Nhyd7xPwSs2IgFW7CodXDPpdKarIpRWBDRaZ/YR6PNAYfOXWIN0kkuOyB20FUO8fnKd5dfm32KB3D80OZ1CEZGDLKAeH5cOb8uW4ULrAVA9PXeawigIFwuEZOu39ua0k53h/JF/9EJDHT5KHXUxQ0w00hwx0gfrNO5CZEc6uUwM+Uy707BBch2HKH9T6GVuTimRG2g8R0rOd/laL1L/fYdA6A6EoPHo0pnlkfyn+fARxlo+OxIgNzGgcM65ExO7G3pN6Jyi4KeEMTxshrhjmEScPnkxHl4QKm/6P6JogOnM1JB8YO304DR9iQZuyz4ceLvQl5f37ThUoEoPM90aOaKLf1XpJy2DRmIGRbn3298qZYtumgClwAjPkUIk7j24QVRkELklxAhTNspYW4wl8foyZA1etI6633y81HADT35sBq2Y5dGvklLStBq9zkhZUPJ/vmxAw5AKYX4DPKotf4KovgYeryTCpuWXlYuGqWlAkQukyITCsSivRFTFfHnWvOTB1k8ltDu9gdEF4hwnTtIfiJcKiezynj/c4d2qb8D0B3+nIli1WcRT0GNKJP1uTxF4q4rI22gCxeceeNs/6UdXoZmbbrtmawy0joYoYbX+b+Z3jU9YimHg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(376002)(346002)(366004)(39860400002)(136003)(6486002)(36756003)(6506007)(478600001)(31696002)(86362001)(186003)(41300700001)(38070700005)(6512007)(31686004)(2616005)(53546011)(71200400001)(26005)(83380400001)(64756008)(8676002)(66946007)(91956017)(54906003)(66446008)(66556008)(76116006)(4326008)(316002)(66476007)(122000001)(921005)(7416002)(5660300002)(8936002)(38100700002)(2906002)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TTZueklYT1V3NjZPdzVjb1N0NkdCSFhleDRyRUxRUEpLb0FBZU5DRW1MVm9R?=
 =?utf-8?B?Sk01Ui9CVWtIcUhuZnJtZDFzWC80T0VVR0E0WUJuR1dEZ2JRRUc1dXV1eVRE?=
 =?utf-8?B?T09oL2ljUzNxM2F3S3JaUUkraytBM1E2QU5wZEdvNDlLNVVpTWtxVCsxRGxY?=
 =?utf-8?B?VVJFOVU2c3ZMc3B2RWUzbzRGZzQ1MDZ2V3JHeDFieTJVdTAyZWxZY05PUmZB?=
 =?utf-8?B?elcxUERhSk4zWE9FVjZQejBrZTAwL29Ia29EUERxY200S1VVSkhOQkkyY1N0?=
 =?utf-8?B?M09DUm9zbUU0NFBPTllQV2VvREtXd29lWnF5STZ2NFd2ck1Vb2lpbStWb21T?=
 =?utf-8?B?b0tVYm5JWklFMG9DSWNTRk1mZU01SlV2b29qYmtMSWJqRUlicVpZYUJhdHgz?=
 =?utf-8?B?MFVPTDVHSFJyWDdLc3dKNkxnZEZzN3J6ZVdwL3IwQlFvc212VDZaa04rSEI5?=
 =?utf-8?B?dGZWZmRhbHAxa2V6cjFKblhLSjFxTnZFUmNVZEVVbnJINXhMZFFYNjZHOC9U?=
 =?utf-8?B?VUVBb2kzVEFWdVRpVlZ3NFh3UmNGSFMwOW9BRHVVNWtKMUtTblUwR2pRaDZq?=
 =?utf-8?B?YXQvUFpxOVVkZ0FMMDZwTWNYcTN4T2hoaWlMam8xeUJlSjZXd1lZU2ZDSHhZ?=
 =?utf-8?B?d0VZdktQNkNrV3oyTVBRaG9pb1llbTA5RytGbVE5YlIwaHZoRXJjK2FDY3dQ?=
 =?utf-8?B?V3dKajA3NHlSUVY5aWVYSGNtcWcvN2pKS2oxeUtiRUgzVEF5dXRqZTlLTU1a?=
 =?utf-8?B?TXdIMVpLa0d3UzU1WHo0ZXZQMkpIRmdtTmM1RUtqRlc1RWhmZDV4VXRMZUxM?=
 =?utf-8?B?emdBNGVWeHJWQUdBUzB5Mm1OSnhadmFDSHNQMTZ6eTQ3eFRyU2JHZGNXL1lE?=
 =?utf-8?B?bDNiaEpWWWlEY2xjV2l6WXpVRHY4U2tSdW5LMjY5UVFDeG1PckNhOFVRMUJ1?=
 =?utf-8?B?SUFaSlVQTVJsREJONW5HUk0rbTZBbVA0LzFHZnByS0RBZUlCenUyTUJmZ0Vm?=
 =?utf-8?B?UTVSbzFsMTF5dmRxNEJRNHVOQ1l1V3d5ODgwY2hpZUI5K3J1dXpTVHJ2YUxy?=
 =?utf-8?B?RnNmcXJUdFZvMm9qQkJuQ1ZhbnIwRkNaak5EOHVOUkUzdkRwUFFVY3R4blF6?=
 =?utf-8?B?UnJYMkQ2dmJ3Rk5DemlQcytYNHhGR1lkMGF5cHI2ZW5tVHg4cTMzTkdBZ1d6?=
 =?utf-8?B?VzRpMHZ6VzFtZkRyaWtSTUJ1R1dLVHJBVXhnV2FXczdreUFudldROFRBNzVv?=
 =?utf-8?B?KzFPWExyMU1PeFNSTThFT3Q3cXJVWFVjeDZ6WXB5Uzljc1o1WlYyd2I1TE5Q?=
 =?utf-8?B?MHErYm5WRVFZL2pvME9MNWRVKzF6djhVaU5Bd2hBSDI0MHpBc2tmWlpEM3BI?=
 =?utf-8?B?VXUrYWRKcFNCR0RWWGZlSFZXMERwOEFpU0gxbFduNmFjb2UzbzI3M1N4UkFj?=
 =?utf-8?B?T1ROcnYwdVBMbWtrKytxUSs1a1l1a3V3Z05leUxJcDlISjJCMlI2a05BWUhq?=
 =?utf-8?B?NmYzR2VaZmlJajJNZURIRVVQUmI5emJVRG1qNlE5UEpmZTI4bXFSclpuQlJl?=
 =?utf-8?B?T0I3ZXZsK2dsVm5HKzZkQWRDR05TbWg0NHVHUVhYNENNSWo2Rk15TzdUb0Jm?=
 =?utf-8?B?QldYSFAyNkNscWRpeHQ0OUdKVHlGcDR5bTduS3FtbnpZU1FFcHQ4MUJPdVpG?=
 =?utf-8?B?cGZtR3pZNDJnN1hhd2U5SGtTZU9WbVdLYkF4V1BvZFJpWjJoQ09mV0RiQUc4?=
 =?utf-8?B?MUJmUFZNRmo5K3RuVXpyS0NTaFIzWHg5VmRPbmdYcEw5ZzNrbHp6VzNWRHNL?=
 =?utf-8?B?UDlHVHMwOUJqWC9qT0ZaTENabFY4TGtRamRHWVNMMXlvWWYvdS9idWQ3SjNT?=
 =?utf-8?B?aVZ6akk0alB4S09mUUJCS214YjFKVEJEdHUvTk9MQXNmMDU3cDhXSTNGeXdu?=
 =?utf-8?B?U2Q5dTc4ZnJ3T3BGSm5WM3ZKd3ZsZG1vZS9mem9yTVZYUHYxNG1sOTA2WEVt?=
 =?utf-8?B?MjhWV1diNER0SkxYMWV1bU9CdWZadVd2cUp6K0lQQWtpVWVQNTR0NmxJc1Ju?=
 =?utf-8?B?eXVkbHY5YWkxWXNPZU1NMko4cjVzZVkwMkQ3eVhkWm1laUM5eWJCL0R1Wlkr?=
 =?utf-8?Q?DaFJYrTeUDpfd9M2iolzae1Z6?=
Content-ID: <0A786E069F4CF0499B2D13C44AF8F85C@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d89d5166-45dd-417a-e5e8-08da7c385c8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2022 07:57:53.8562
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R4X3v8ITfJ7PYvFUJoL1JaTpGf4NsNdSG9Af01EERKjcaVo1o8kEKMtD/jNTeWeIUkfXONJNAanXy/j83k9GIg4k9+/1JieDk64mAIE3yv4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5635
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_005808_440185_1DD89712 
X-CRM114-Status: GOOD (  17.35  )
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

On 12/08/2022 08:34, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 11/08/2022 23:33, Conor Dooley wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> The commit in the fixes tag removed the clock-names property from the
> 
> Instead:
> The commit b92225b034c0 ("dt-bindings: PCI: designware: Fix
> 'unevaluatedProperties' warnings")....
> 
>> SiFive FU740 PCI Controller dt-binding,
> 
> No, it did not do it... At least I cannot see it. Where is the removal
> exactly in that patch? The commit removed clock-names from required, not
> from properties.

I rewrote the commmit message 3 times as I went back and forth on the
"right" change to make, prob just added the wrong fixes tag to a copy
paste of the original message.
Thanks,
Conor.

> 
>   but it was already in the dts
>> for the FU740. dtbs_check was not able to pick up on this at the time
>> but v2022.08 of dt-schema now can:
>>
>> arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dtb: pcie@e00000000: Unevaluated properties are not allowed ('clock-names' was unexpected)
>>          From schema: linux/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
>>
>> The Linux driver does not use this property, but outside of the kernel
>> this property may have users. Re-add the property and its "clocks"
>> dependency.
>>
> 
> 
> Best regards,
> Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
