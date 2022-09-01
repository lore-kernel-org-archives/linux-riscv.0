Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 075ADECAAD1
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Sep 2022 15:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9RP0s8PxCyZIjidwF1RDCtZczex0Va8Qxeni+J1I7Hk=; b=qOk7mUe0eRWn5A
	+eBuhE2wk0z8LJdOqFU80J0bR+mdp8OH/XYfGDaCRO2nDw94XCR2D2/TC+EHzrmwh+TSQIAGwz3Z7
	9618Zoljcqi7xHGRIv6JpGJ8xQ/cjFCL1UYb31vRYgdG8vC+ssw8HbtVTVPQTpBuussfRZpcajH54
	NzRizbfUjpglI3g+JzBcZUhMpBoB60sToha4B5CHfyfYj07aNzdcBDOQ1ad0uDAfIc0uP32orIv0+
	LQBczSXGriMLkOIsSgVToFL1/FtkhsSHrQ4OoyEw+Bvmfg2DM0sFdnRSeV/ZM5ndVXy7dXtChT9rm
	twtE3JEvFTiDeeKZ9ILg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTmJ5-00Cvuc-QS; Thu, 01 Sep 2022 15:40:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTmJ1-00CvtB-Lg
	for linux-riscv@lists.infradead.org; Thu, 01 Sep 2022 15:40:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662046835; x=1693582835;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=5g66Mphp1hWAH768hQkYL382TeOP4m0C4WzIreVfnYc=;
  b=pIv+DxpQmGpP02EH+eY7iFFjOyt64BLi2Oo3uWnYZd+FwPQLVEeN/Vds
   hXYgzBSSWXvqxm3r6YMauxqd7T7W/z9an4dVtDq17gcUViMTmpIrCW/4Y
   aJdMzWzQb71vSysm1FoIpBKOS569fM5rQi6BLxEGgtmgOIJHl5aaUqlnd
   cBScY+lvYjqHoe/a5njHDNf4LswDZ+9jKDMVD+p1GkT7uDpWpYzfjQErg
   AwFLFwOTiDTT5pCGmK1l2cgQHvGZxLCSO1BnSRKN+XP5Z1kIoxRMpW6f/
   guTs9X+f4vO3dUdO5LP/dAwxOeFvKM7jhleLEYi98oKxkhyyz/+QlarHb
   A==;
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; 
   d="scan'208";a="175219307"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Sep 2022 08:40:18 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 1 Sep 2022 08:40:12 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Thu, 1 Sep 2022 08:40:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZZUq8voDre4mJ10ZOIfIwDT025+klnvkoLjC43UKHbVBv8La93JWMKeUu9DWnTMLUP1GrrTqmUkjvxEkQhcOg8Xq11oVMauSTjHEKjsoKGTsIYPae/yLsVMQP6LI4GVfMRYIF02siXCA/p+LImKbfv8omyYgvEWxoF2z8geC2Zvq27osA7BcRLnOz0Xfz6SAfa2KpSGty37B/bAckMWeGJ0CgAu6jM5QuVIllhAabaWKaVLR7nWn+8bqh+dfsBJX3FlUIimSSIbyjX0liHkFXkp9XP68KLC6h2GLHN2LYOSZq2KTRTrocXgNNi4pQeSsr8BCvvOdK/NiAcRNlURb2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5g66Mphp1hWAH768hQkYL382TeOP4m0C4WzIreVfnYc=;
 b=QDXJiuOe1c86IxKN0bfkgGoipb6fv1OoqkUf2duCE9xI4dNUYgAHUt8N3Qmjr73/LYI0wgo/CppGJFRIsElFTk/ivSEYl29Lo3jE6WDaFd/gQ7rpHacQWx1DYC/kNGGvbLcjis8tSfWqErhPjsdOmeJDiDJh9qez9pwMJTEerK9a6F6yivupaXMF8Lh9orBSVhTVFMwkRYyWo6S9yGujUp9EFe8Eh8iGjxkX9WvSq2IkQbg0Gm6B4WbZR1OidbjziwQGjxDkuEJ1OkiOLLEq+AUAAO22l0GYv6Uu83F00W7boN3N6nvG3z7WAhZai+GgNCnOLYXITr9Ayq3BVkXPrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5g66Mphp1hWAH768hQkYL382TeOP4m0C4WzIreVfnYc=;
 b=kqYKLwYgPY3Jmjld0DEdvgJr26FCKJlvM+Xkws4ns24X4Ku0WF7UdydQ/DOluTXUtyEkb+oBWVetOOMjCtPShbcFssiaLGKk1QZPztK6X1mONA5rgQOYXTTarj5wIa72AlpgLLTWVkZ9+qWoW6RPhyTzFbIP+OP8DBo1Hs3MgPw=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CH2PR11MB4469.namprd11.prod.outlook.com (2603:10b6:610:43::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Thu, 1 Sep
 2022 15:40:06 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5588.010; Thu, 1 Sep 2022
 15:40:06 +0000
From: <Conor.Dooley@microchip.com>
To: <zouyipeng@huawei.com>, <linux-riscv@lists.infradead.org>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
CC: <liaochang1@huawei.com>, <chris.zjh@huawei.com>
Subject: Re: [PATCH] riscv:lib: optimize memcmp with ld insn
Thread-Topic: [PATCH] riscv:lib: optimize memcmp with ld insn
Thread-Index: AQHYvTsz2ZzE0Vvu602ydwyjTDJ37a3I/UyAgAGcm4CAAB3aAA==
Date: Thu, 1 Sep 2022 15:40:06 +0000
Message-ID: <02ad1ccf-6a38-9539-a66f-2faaeeddc715@microchip.com>
References: <20220831130754.93422-1-zouyipeng@huawei.com>
 <594e8d95-c039-6c8f-4669-6c9a514cbc91@microchip.com>
 <eeb9bb24-15b1-3b8f-bc52-a2c6e4a39716@huawei.com>
In-Reply-To: <eeb9bb24-15b1-3b8f-bc52-a2c6e4a39716@huawei.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8c1c846b-2694-4e34-4fd3-08da8c303ea6
x-ms-traffictypediagnostic: CH2PR11MB4469:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LJcsfuSvN1l+dsCwAROfRYa8LjpNJYc/WaNG4+31ADFVZ8I7tYqUmWvtMNyWBFoHRmwszgy38ckfpUJMMTzW5RKUkEZm+4BfOHDo6W7dyf9qFwMBFWJ9FYaws3jPEOlX+60K8bppptijNW1ib6VWHnJc4CmICbIcbpBLlQdSq7Dxe1F0ecOUFN6WOrSpBmn0B7F+kLyGeWVwNvANE/5QfzSJBymhgnV0+q6RVnyzEb09BNIh0wJ3mG8QPQenqSAfDnTeg0tksgE86heisWH/8XTGVLlpxgbOzVD4IMyhhiFcvk3ZmBquG2vHjU0ow+pejh6ZApnA8Fu4vhrkYN6fB2COpaOrUTiGz3NKoHfF7B8eOM11rSq9Q53/i6xDQH/6+5GeUAz6vII0UERYuWSnk5f5GSG0CKi9ap7g6P9G6qEy/3ZvQyqGk/yzljb6R2ttnKYahnJpPPZHdXQFEMwcCpybwe4SM9PaMvPzG1mKYtMlFspGPMK84NTxAuBPgwVjF0Sa1Bi/WQIQZmzKIah85I8dD6MFMapaU6hUgiHI9dRcTsuGtJwsJmfkygWMKXfUo6SxYAGh/VHjwKG/eIft8jL7RJdD+wbhGtTLUBCuLvF0/RGARl1rFFeUtoF5cdUcK78l5XPzKmui7bASQiUFM/9oPeuxYZyKYJ1Ok6gblXMrCpq9mYSENLJRANbK5U83spb2sCW3XDIe5k94svsTaBhkQCuiGtgaktl4102tqGM6XWaFPNIQNxZ7vbLBeItZyGyibdN3J8zy1EzSHVzRpqyD9PuiIHRKpGN3nCimXVTn/+bNAjy61q8GR1ymVe4OU8MYMmEDRZ8NkfT70Hgw7A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(396003)(376002)(366004)(136003)(39860400002)(38070700005)(6486002)(41300700001)(6506007)(478600001)(316002)(36756003)(71200400001)(26005)(6512007)(110136005)(54906003)(53546011)(86362001)(31696002)(2616005)(2906002)(83380400001)(186003)(4326008)(64756008)(8936002)(5660300002)(91956017)(31686004)(66556008)(8676002)(66446008)(66946007)(66476007)(76116006)(122000001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eUppQUxYUFV5RmhrWWlPUUN1VmNOa0xxRUlXdmQxNDNkdVpXNnZkTTZVeDVr?=
 =?utf-8?B?Qk84TXcwcC9yZG5HaG84YVJJQi9tWkUvWjR2NTI3SUpiYjJKSEJrampucnJW?=
 =?utf-8?B?Q2dvcDJYaDI3Wlk1UGdLSGJBUnYxYm5wM0MzbmlZT0JwZFR4NlZ6RGNBRmkr?=
 =?utf-8?B?Nks1MDYxTEtGeFJZOHFreVFHeSs3cTFWdHlURnhDSHVYdHlZcllFNnJtSW4x?=
 =?utf-8?B?dnNRWWhEazFxZDZZVkIrc3hSUjJPdmwyaHg2YXgzUmRTYkcrbUs3S3BqZnhr?=
 =?utf-8?B?cGJ3MTNZZzZDeWo2RW0vVFVHeS82L3Njei9aaWdHQ25BZEdrcHYvY1BsRkVB?=
 =?utf-8?B?aUZYQjVueWhtUUVYd1hiNkZZNHNhOExmcklEdDhsd1FoeTFrMCtSVnU5blNN?=
 =?utf-8?B?YVJ6MVQzMTJtQ3NNTEpvQWdqL2dCRUFSNHZDd2ZGZERSN0lZazhUTUwwblBJ?=
 =?utf-8?B?d2paM3lMY0dJUit1UHl0WmpNNHRwamNoRXFZakFrWFEwUFBWdlAyY0ZVRU8x?=
 =?utf-8?B?SUs0SVh4c0VYT1pwZUsxbGZYS2tocXFYQVIzM1c3VXBVdjE1RkNXbnVOVWU1?=
 =?utf-8?B?VDBpOEsySVFYeGVnYzVCUjR4VHlPaE1wNjVNYTFzZVppWXM0SEdQaHFwUTFy?=
 =?utf-8?B?R2Nzelgwd0ZRcGxlZFdkTHdYc1ppaEZwOUQzdE9Qd2dMYis4Rk1ZaUhkSE5P?=
 =?utf-8?B?R1dIWFRXOTJOeE1iS1hUeHZSK21NNk1yMERLOTJ2bVNyN1ZySW5WalNhT3Jx?=
 =?utf-8?B?Nys1L1ovbitZN1FIbzNNdUNCakxaUFlpYWFnaS84dVU5ckwzcnUxMjRuT2NN?=
 =?utf-8?B?Rm8zZ2VidFpLV2owWklNSHNRamUzUVZEVVhsSHVBVjBCRWFBa2dQeFZkeEpm?=
 =?utf-8?B?MWk3QzZXbVNmRHpTb3VqeG1GdmMvaE40NWNlenNwOUtwTFd2dFFYZVBYZTM0?=
 =?utf-8?B?NVRqMDFHRzNxeFVpUFFQV1pZSUlhQXhjaVczQkhyWGRlQm9kSm5Vc3hrTGdm?=
 =?utf-8?B?NlNtdnhvVEJXZlZNWVlsSXBqREY0SHpScllzdkdKcW5tRmt3L3VuQ1Y0cmFY?=
 =?utf-8?B?Vkl6clFEN3RYRnl2TEVjb1I5Q3UvTlBiZGgyclhlUDNCNG8rNUJLQ2J0bTdD?=
 =?utf-8?B?TjZyNU5xekxWeHpMMmZLc1IyTnBMRGc1bVQ1VXQyWHU0L1hTN1hRc2xOUjRM?=
 =?utf-8?B?OFBVcWNzK3F5SEpOYUQwaU1MRmNadzJ1b1UzVUMvMnRzWEFUTDJtRzlPaWE0?=
 =?utf-8?B?OURoVGl0TGNJOVRoTWorcFNqMUo0bzNjWkU2aDVFN3psSUlSYTZvSnJERFBZ?=
 =?utf-8?B?aVFqZFZXY0Y5ZVAvb2l2eC95cGlkWmhGZnVHVmdHQVQ3RDRXMmppa1hGbUhx?=
 =?utf-8?B?S2hKVlNKS0M3MVBGdHRlSHFPMG0rZ1E1dnkxdUZJU2lzdGo0Mi9QTGkyQXB2?=
 =?utf-8?B?STYrSDdWWjhLWTJCRTNWd3pNamt3WGxHSGkzbTAxekp4Y0RURVk1MlYwb2Uw?=
 =?utf-8?B?R1pCWHpKdUhkOUVIR1JTZG4yN1BHdUNNWlJoVnpUL3ZUUmdLYjBxTUZ0Vmp0?=
 =?utf-8?B?YnVaS0N5ZFNEZWVpZGp5c1lSN05PZXVtY3VrdmcrVjgyZWdvYXJQZHZjeW4r?=
 =?utf-8?B?YUQvK3BnMTZTVUFySjFrTTF3RzRuNHQrdmVITkdJdDdjTWdrUmxCaGZ6cURD?=
 =?utf-8?B?UnZlaWp1NGFvK2dsOVR3SkZpYUdXYW95VjNUYVhyQk1ZcU4veUwyVjA1UW5Z?=
 =?utf-8?B?ZW4xRWdoSTg5K0QrWVVrQTdGRGtjZUorSWFWN1Z4TlFHcWxJQzg4Q0tqMXND?=
 =?utf-8?B?dkE5cmJMQ3RXWG16V1A3OUtxa0ZFUGtycU45Mlc2d2NTcXBMOGF6L3R5K2ND?=
 =?utf-8?B?ZVd0dVJkZ21QM3F1OXl2MDdWRU1zTndXT3BjQ1BZOVFjbERaWHJzSDhTcDU2?=
 =?utf-8?B?Tm9JOHVyemE4TEVYNHM4dDV4TGFGcDBSemtMTVcrbTZ0UXE0M25MdndkbldH?=
 =?utf-8?B?d0FCdVhpbHJXSlgrRGx6R3JLcjVTbTAwNExZZVc1Q3kra1cvMFdIbEhFa0RZ?=
 =?utf-8?B?eE1HREliU2pNeG9ZNTBDSUpaeWJ1MStveFRTNjJHTUhnRlJ0TnFmRXI3dW93?=
 =?utf-8?Q?XXrIjvDg7ZCGq1PYBB1t7wVqj?=
Content-ID: <5D41B6F66926574D9D28B11C926902CE@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c1c846b-2694-4e34-4fd3-08da8c303ea6
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2022 15:40:06.3596
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o4abGUE1mVcYkDcYGL0qEDJ/E00QXpc1rA2orh+YkFDdNDMJ/4eoxHhUzNeLqKDPmrjOrkrlm25mIYKZMJW/WT8NmK6wJ8dqe4M4OnU80wU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB4469
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_084036_034729_5AD09E05 
X-CRM114-Status: GOOD (  16.54  )
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

T24gMDEvMDkvMjAyMiAxNDo1MywgWWlwZW5nIFpvdSB3cm90ZToNCj4gRVhURVJOQUwgRU1BSUw6
IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0
aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiDlnKggMjAyMi84LzMxIDIxOjE2LCBDb25vci5Eb29s
ZXlAbWljcm9jaGlwLmNvbSDlhpnpgZM6DQo+PiBPbiAzMS8wOC8yMDIyIDE0OjA3LCBZaXBlbmcg
Wm91IHdyb3RlOg0KPj4+IHJpc2N2OmxpYjogb3B0aW1pemUgbWVtY21wIHdpdGggbGQgaW5zbg0K
Pj4gTWlub3Igbml0OiAicmlzY3Y6IGxpYjoNCj4gb2sNCj4+PiBFWFRFUk5BTCBFTUFJTDogRG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBj
b250ZW50IGlzIHNhZmUNCj4+Pg0KPj4+IEN1cnJlbnRseSBtZW1jbXAgd2FzIGltcGxlbWVudGVk
IGluIGMgY29kZShsaWIvc3RyaW5nLmMpLCB3aGljaCBjb21wYXJlDQo+Pj4gbWVtb3J5IHBlciBi
eXRlLg0KPj4+DQo+Pj4gVGhpcyBwYXRjaCB1c2UgbGQgaW5zbiBjb21wYXJlIG1lbW9yeSBwZXIg
d29yZCB0byBpbXByb3ZlLiBGcm9tIHRoZSB0ZXN0DQo+Pj4gUmVzdWx0cywgdGhpcyB3aWxsIHRh
a2Ugc2V2ZXJhbCB0aW1lcyBvcHRpbWl6ZWQuDQo+PiBIZXkgWWlwZW5nLA0KPj4gQ291bGQgeW91
IHNoYXJlIHNvbWUgbW9yZSBpbmZvcm1hdGlvbiBhYm91dCB0aGUgdGVzdHMgeW91IGRpZD8NCj4+
IFRoZSB0ZXN0IHJlc3VsdHMgc2hvd2luZyB0aGUgJSBpbXByb3ZlbWVudCB3b3VsZCBiZSBuaWNl
IDopDQo+PiBUaGFua3MsDQo+PiBDb25vci4NCj4gDQo+IE9mY291cnNlLCBCdXQgTXkgYm9hcmQg
d2FzIG5vdCByZWFkeSwgU28gaSBqdXN0IHRlc3QgdGhpcyBwYXRjaCBvbiBxZW11DQo+IFJWNjQg
JiBSVjMyIC4NCj4gDQo+IEFsbG9jIDgsNCwxS0IgYnVmZmVyIHRvIGNvbXBhcmUsIGVhY2ggbG9v
cCAxMGsgdGltZXMuDQoNCkkgZml4ZWQgdGhhdCB1cCBzaW5jZSBpdCB3YXMgZmFpcmx5IHVucmVh
ZGFibGUuLg0KDQpTaXplKEIpIE1pbihucykgQVZHKG5zKSAvL2JlZm9yZQ0KDQo4ayAgICAgIDQw
ODAwICAgNDYzMTYNCjRrICAgICAgMjY1MDAgICAzMjMwMg0KMWsgICAgICAxNTYwMCAgIDE3OTY1
DQoNClNpemUoQikgTWluKG5zKSBBVkcobnMpIC8vYWZ0ZXINCg0KOGsgICAgICAxNjEwMCAgIDIx
MjgxDQo0ayAgICAgIDE0MjAwICAgMTY0NDYNCjFrICAgICAgMTI0MDAgICAxNDMxNg0KDQoNCkkg
dGhpbmsgcHV0dGluZyB0aGlzIGludG8gdGhlIGNvbW1pdCBtZXNzYWdlIHdvdWxkIGJlIG5pY2Uu
DQoNCkkgYW0gbm8gd2hpenogb24gdGhlc2Uga2luZHMgb2YgdGhpbmdzLCBidXQgd2l0aCB0aGUg
Y29tbWl0IG1lc3NhZ2UNCmZpeGVkIHVwOg0KUmV2aWV3ZWQtYnk6IENvbm9yIERvb2xleSA8Y29u
b3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+DQoNCj4+PiBTaWduZWQtb2ZmLWJ5OiBZaXBlbmcgWm91
IDx6b3V5aXBlbmdAaHVhd2VpLmNvbT4NCj4+PiAtLS0NCj4+PiDCoMKgIGFyY2gvcmlzY3YvaW5j
bHVkZS9hc20vc3RyaW5nLmggfMKgIDMgKysNCj4+PiDCoMKgIGFyY2gvcmlzY3YvbGliL01ha2Vm
aWxlwqDCoMKgwqDCoMKgwqDCoCB8wqAgMSArDQo+Pj4gwqDCoCBhcmNoL3Jpc2N2L2xpYi9tZW1j
bXAuU8KgwqDCoMKgwqDCoMKgwqAgfCA1OSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysNCj4+PiDCoMKgIDMgZmlsZXMgY2hhbmdlZCwgNjMgaW5zZXJ0aW9ucygrKQ0KPj4+IMKgwqAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvbGliL21lbWNtcC5TDQo+Pj4NCj4+PiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zdHJpbmcuaCBiL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vc3RyaW5nLmgNCj4+PiBpbmRleCA5MDkwNDkzNjY1NTUuLjMzMzdiNDNkMzgwMyAx
MDA2NDQNCj4+PiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3N0cmluZy5oDQo+Pj4gKysr
IGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zdHJpbmcuaA0KPj4+IEBAIC0xOCw2ICsxOCw5IEBA
IGV4dGVybiBhc21saW5rYWdlIHZvaWQgKl9fbWVtY3B5KHZvaWQgKiwgY29uc3Qgdm9pZCAqLCBz
aXplX3QpOw0KPj4+IMKgwqAgI2RlZmluZSBfX0hBVkVfQVJDSF9NRU1NT1ZFDQo+Pj4gwqDCoCBl
eHRlcm4gYXNtbGlua2FnZSB2b2lkICptZW1tb3ZlKHZvaWQgKiwgY29uc3Qgdm9pZCAqLCBzaXpl
X3QpOw0KPj4+IMKgwqAgZXh0ZXJuIGFzbWxpbmthZ2Ugdm9pZCAqX19tZW1tb3ZlKHZvaWQgKiwg
Y29uc3Qgdm9pZCAqLCBzaXplX3QpOw0KPj4+ICsjZGVmaW5lIF9fSEFWRV9BUkNIX01FTUNNUA0K
Pj4+ICtleHRlcm4gaW50IG1lbWNtcChjb25zdCB2b2lkICosIGNvbnN0IHZvaWQgKiwgc2l6ZV90
KTsNCj4+PiArDQo+Pj4gwqDCoCAvKiBGb3IgdGhvc2UgZmlsZXMgd2hpY2ggZG9uJ3Qgd2FudCB0
byBjaGVjayBieSBrYXNhbi4gKi8NCj4+PiDCoMKgICNpZiBkZWZpbmVkKENPTkZJR19LQVNBTikg
JiYgIWRlZmluZWQoX19TQU5JVElaRV9BRERSRVNTX18pDQo+Pj4gwqDCoCAjZGVmaW5lIG1lbWNw
eShkc3QsIHNyYywgbGVuKSBfX21lbWNweShkc3QsIHNyYywgbGVuKQ0KPj4+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2xpYi9NYWtlZmlsZSBiL2FyY2gvcmlzY3YvbGliL01ha2VmaWxlDQo+Pj4g
aW5kZXggMjVkNWM5NjY0ZTU3Li43MDc3M2JmMGM0NzEgMTAwNjQ0DQo+Pj4gLS0tIGEvYXJjaC9y
aXNjdi9saWIvTWFrZWZpbGUNCj4+PiArKysgYi9hcmNoL3Jpc2N2L2xpYi9NYWtlZmlsZQ0KPj4+
IEBAIC0zLDYgKzMsNyBAQCBsaWItecKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCArPSBkZWxheS5vDQo+Pj4gwqDCoCBsaWItecKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgKz0gbWVtY3B5Lm8NCj4+PiDCoMKgIGxpYi15wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCArPSBtZW1zZXQubw0KPj4+IMKgwqAgbGliLXnCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgICs9IG1lbW1vdmUubw0KPj4+ICtsaWItecKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgKz0gbWVtY21wLm8NCj4+PiDCoMKgIGxpYi0kKENPTkZJR19NTVUp
wqDCoMKgwqDCoCArPSB1YWNjZXNzLm8NCj4+PiDCoMKgIGxpYi0kKENPTkZJR182NEJJVCnCoMKg
wqAgKz0gdGlzaGlmdC5vDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9saWIvbWVt
Y21wLlMgYi9hcmNoL3Jpc2N2L2xpYi9tZW1jbXAuUw0KPj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
DQo+Pj4gaW5kZXggMDAwMDAwMDAwMDAwLi44M2FmMWM0MzNlNmYNCj4+PiAtLS0gL2Rldi9udWxs
DQo+Pj4gKysrIGIvYXJjaC9yaXNjdi9saWIvbWVtY21wLlMNCj4+PiBAQCAtMCwwICsxLDU5IEBA
DQo+Pj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkgKi8NCj4+PiAr
LyoNCj4+PiArICogQ29weXJpZ2h0IChDKSAyMDIyIHpvdXlpcGVuZ0BodWF3ZWkuY29tDQo+Pj4g
KyAqLw0KPj4+ICsjaW5jbHVkZSA8bGludXgvbGlua2FnZS5oPg0KPj4+ICsjaW5jbHVkZSA8YXNt
LWdlbmVyaWMvZXhwb3J0Lmg+DQo+Pj4gKyNpbmNsdWRlIDxhc20vYXNtLmg+DQo+Pj4gKw0KPj4+
ICsvKiBhcmdybWVudHM6DQo+Pj4gKyogYTA6IGFkZHIwDQo+Pj4gKyogYTE6IGFkZHIxDQo+Pj4g
KyogYTI6IHNpemUNCj4+PiArKi8NCj4+PiArI2RlZmluZSBhZGRyMMKgIGEwDQo+Pj4gKyNkZWZp
bmUgYWRkcjHCoCBhMQ0KPj4+ICsjZGVmaW5lIGxpbWl0wqAgYTINCj4+PiArDQo+Pj4gKyNkZWZp
bmUgZGF0YTDCoCBhMw0KPj4+ICsjZGVmaW5lIGRhdGExwqAgYTQNCj4+PiArI2RlZmluZSB0bXDC
oMKgwqAgdDMNCj4+PiArI2RlZmluZSBhYWRkcsKgIHQ0DQo+Pj4gKyNkZWZpbmUgcmV0dXJuIGEw
DQo+Pj4gKw0KPj4+ICsvKiBsb2FkIGFuZCBjb21wYXJlICovDQo+Pj4gKy5tYWNybyBMRF9DTVAg
b3AgZDAgZDEgYTAgYTEgb2Zmc2V0DQo+Pj4gK8KgwqDCoMKgwqDCoCBcb3AgXGQwLCAwKFxhMCkN
Cj4+PiArwqDCoMKgwqDCoMKgIFxvcCBcZDEsIDAoXGExKQ0KPj4+ICvCoMKgwqDCoMKgwqAgYWRk
aSBcYTAsIFxhMCwgXG9mZnNldA0KPj4+ICvCoMKgwqDCoMKgwqAgYWRkaSBcYTEsIFxhMSwgXG9m
ZnNldA0KPj4+ICvCoMKgwqDCoMKgwqAgc3ViIHRtcCwgXGQwLCBcZDENCj4+PiArLmVuZG0NCj4+
PiArDQo+Pj4gK0VOVFJZKG1lbWNtcCkNCj4+PiArwqDCoMKgwqDCoMKgIC8qIHRlc3QgbGltaXQg
YWxpZ2VuZCB3aXRoIFNaUkVHICovDQo+Pj4gK8KgwqDCoMKgwqDCoCBhbmRpIHRtcCwgbGltaXQs
IFNaUkVHIC0gMQ0KPj4+ICvCoMKgwqDCoMKgwqAgLyogbG9hZCB0YWlsICovDQo+Pj4gK8KgwqDC
oMKgwqDCoCBhZGQgYWFkZHIsIGFkZHIwLCBsaW1pdA0KPj4+ICvCoMKgwqDCoMKgwqAgc3ViIGFh
ZGRyLCBhYWRkciwgdG1wDQo+Pj4gK8KgwqDCoMKgwqDCoCBhZGQgbGltaXQsIGFkZHIwLCBsaW1p
dA0KPj4+ICsNCj4+PiArLkxsb29wV29yZDoNCj4+PiArwqDCoMKgwqDCoMKgIHNsdHUgdG1wLCBh
ZGRyMCwgYWFkZHINCj4+PiArwqDCoMKgwqDCoMKgIGJlcXogdG1wLCAuTGxvb3BCeXRlDQo+Pj4g
Kw0KPj4+ICvCoMKgwqDCoMKgwqAgTERfQ01QIFJFR19MIGRhdGEwIGRhdGExIGFkZHIwIGFkZHIx
IFNaUkVHDQo+Pj4gK8KgwqDCoMKgwqDCoCBiZXF6IHRtcCwgLkxsb29wV29yZA0KPj4+ICvCoMKg
wqDCoMKgwqAgaiAuTHJldHVybg0KPj4+ICsNCj4+PiArLkxsb29wQnl0ZToNCj4+PiArwqDCoMKg
wqDCoMKgIHNsdHUgdG1wLCBhZGRyMCwgbGltaXQNCj4+PiArwqDCoMKgwqDCoMKgIGJlcXogdG1w
LCAuTHJldHVybg0KPj4+ICsNCj4+PiArwqDCoMKgwqDCoMKgIExEX0NNUCBsYnUgZGF0YTAgZGF0
YTEgYWRkcjAgYWRkcjEgMQ0KPj4+ICvCoMKgwqDCoMKgwqAgYmVxeiB0bXAsIC5MbG9vcEJ5dGUN
Cj4+PiArLkxyZXR1cm46DQo+Pj4gK8KgwqDCoMKgwqDCoCBtdiByZXR1cm4sIHRtcA0KPj4+ICvC
oMKgwqDCoMKgwqAgcmV0DQo+Pj4gK0VORChtZW1jbXApDQo+Pj4gK0VYUE9SVF9TWU1CT0wobWVt
Y21wKTsNCj4+PiAtLSANCj4+PiAyLjE3LjENCj4+Pg0KPiAtLSANCj4gUmVnYXJkcywNCj4gWWlw
ZW5nIFpvdQ0KPiANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
