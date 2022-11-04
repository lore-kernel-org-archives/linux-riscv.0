Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F26C433FE
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Nov 2022 09:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KaKwzWmPr5o6pzzx/7IRC0Gee4QSDZScKDpGmHNobAM=; b=hW0WSYpBpBrvtO
	wbfpFJKSwj4fj2+PhpVkUycQy57A0+ocht9pRwIDwxKbHhdChO/9+8NASr8VH8rFjbzovv51aJpnh
	BOhqrG4HlUDYxCqrSzzmxyCh8x62WScxIyD86fbEAo0VKUSfJC2YJ1xEAqcBaa1Ckkcxc9dG7RHtl
	VzHhW9nakOOYfFsmJaixY2GBnk+UPSvNtHFcWYG5TSDal3MOf1voLhlCRqofWLyxCoLdFFwsYrmN6
	mvbL8EKp9+OqVQPbIkCj4mzsnl2msLQmYiAo11lZlR7YgbXDeAmmAWpOr15nTetEUkfpE+j5TtO77
	m0t00K+5o+tSeUQEXRyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqslk-0033M3-9X; Fri, 04 Nov 2022 09:13:44 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqslg-0033KK-QA
	for linux-riscv@lists.infradead.org; Fri, 04 Nov 2022 09:13:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1667553222; x=1699089222;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=XRF0XhNFaiImFRxA/R8oEatBCL54LN9FVZaLw95suyA=;
  b=KJc8cXvWQWwPiep6XOSwCKRqXtbHINd2E/gjQnQHTlGjFe0M3Me38C22
   UD4f8vtfrdf/lVRp6+uZyWabW0P5Y5IxnYeUCAqCbLYcLZWop8oSCS9YJ
   TvbY3xYhydFFljPOI9jPGwh9MnM1hB3oM9k7btqggzkuNn9WPfDerc1cO
   C6bdD4WOMCux04cxD0Dst1E7YxMpHcygQ01ehNzYwvgB74L4LsOU6nutm
   PcZ5l4PTYVLt0e9rsNKLx88I5WDcEQWoJ94ny86+Q1pm+Kw/2e5iVcw4C
   5vdJb9WS12+0sgGTz6unwxosiLodNB8rLMwz1GYcRYFgGbaphRoNnTb7Z
   w==;
X-IronPort-AV: E=Sophos;i="5.96,137,1665471600"; 
   d="scan'208";a="187610292"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Nov 2022 02:13:40 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 4 Nov 2022 02:13:39 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Fri, 4 Nov 2022 02:13:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eOc9Hw5SjGv25anbf/fIbqXGAhej1e1E8wQBW53i6nWxVuv/gSgE1AO6fqzJxn1VPYBBbVZsnEfIsO0y6/7P2XeSdInt5y/fdPC0BWDpUZs/+6A54uLPa/1iL8WxFc6ajEx96cOf57PEmDja703Op+rh7fGR4HtjPtxPQPUid52sY8Yw4QVIbohHW6n25GfRkWUyFIJ+09CA+nKoaLovoPr+EB9o9CHHEJYIOTwbaumiNJNoTwQZBQVVjBZCF3jIGWDru6+Uf8VdyXIst5a0YhwyDEn9qVbR36y9fc8eBgVagnU+DQJCoTU/j1+ke/bpDbGOXBZESo+nWY36qy+taQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XRF0XhNFaiImFRxA/R8oEatBCL54LN9FVZaLw95suyA=;
 b=YUZhAXxCLvnLsTO2nU767JY47dhSoUz3Rqq7gr0vtqUP3t6XFfsuGpFXr1LdxDnVKDsUW5PDHj2WeHuJpIsJpdemg4Jv+bXp3Ym0M+/33RRvpIGbsHXxphRz8BnYltgVBfKFGDYHneYFXugSNjA/azdWHYSdrWn0tmGk4efcx4zuIzmu9HmnVRZJEKtWVq9IkrA04KguqfYTCtkY7sSDClxNvjgrT/5Pw2PJOgNLAN97/wmyUpQCIBY9swYv6dFrpBULRfwYap60lzh9IxicSsOc0jb8mpFyY1+Bi5bKlJ3pavdRvA2lKGMyhQcVuXpvAYrA5Isl8pBW1un6hGddAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XRF0XhNFaiImFRxA/R8oEatBCL54LN9FVZaLw95suyA=;
 b=V/fBg3stRMy90gySlW8ZnWfNpKRb/INQ4OVrkuxliDTttoHdvcy0zj1/DfuJK2WCwUkbPa9sbKxrau/ooTNg4+I8enhxSdDw6/IziQCdzhmFZ9K453OPyYaP+c07E0KAA83eJdrXZG+XTk6seKBv6cMvyrnW19BmU75wkCEaiOQ=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BL1PR11MB5397.namprd11.prod.outlook.com (2603:10b6:208:308::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Fri, 4 Nov
 2022 09:13:32 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8609:f8c9:b65f:8efa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8609:f8c9:b65f:8efa%4]) with mapi id 15.20.5791.022; Fri, 4 Nov 2022
 09:13:32 +0000
From: <Conor.Dooley@microchip.com>
To: <guoren@kernel.org>, <vineetg@rivosinc.com>, <andy.chiu@sifive.com>
CC: <stillson@rivosinc.com>, <ren_guo@c-sky.com>, <guoren@linux.alibaba.com>,
	<anup@brainfault.org>, <greentime.hu@sifive.com>, <palmer@rivosinc.com>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<ebiederm@xmission.com>, <keescook@chromium.org>, <atishp@atishpatra.org>,
	<oleg@redhat.com>, <heinrich.schuchardt@canonical.com>,
	<mchitale@ventanamicro.com>, <pbonzini@redhat.com>,
	<panqinglin2020@iscas.ac.cn>, <alexandre.ghiti@canonical.com>,
	<arnd@arndb.de>, <vincent.chen@sifive.com>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v12 02/17] riscv: Extending cpufeature.c to detect
 V-extension
Thread-Topic: [PATCH v12 02/17] riscv: Extending cpufeature.c to detect
 V-extension
Thread-Index: AQHYzgOS0Ic647j2fEu8VOHGP6P9Ka4uUtyAgAAPGICAAAAqAIAAXUYA
Date: Fri, 4 Nov 2022 09:13:32 +0000
Message-ID: <3cf13920-b2f4-670e-1f28-70940862c0cd@microchip.com>
References: <20220921214439.1491510-1-stillson@rivosinc.com>
 <20220921214439.1491510-2-stillson@rivosinc.com>
 <4b6e20fb-d013-0a09-0b74-b6c46e045af3@rivosinc.com>
 <CAJF2gTSPoKu_owEb6+MLhAgK5nz2FTRDkTn4qfXF4KyA-XTwvw@mail.gmail.com>
 <CAJF2gTT_z96V3kjPtr9hpTq8XRn0x=91wFNPYFFdetAA2u-01Q@mail.gmail.com>
In-Reply-To: <CAJF2gTT_z96V3kjPtr9hpTq8XRn0x=91wFNPYFFdetAA2u-01Q@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5154:EE_|BL1PR11MB5397:EE_
x-ms-office365-filtering-correlation-id: 71ee20e7-c271-4522-ec67-08dabe44d88a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UwRdJ8rdqVWw7vwjFz66FZl8/4MuA3sALheccd+NI8nZVFZIfRHB3rfaqgcqitzUqiyFST+YoEHK99tvlYbxHVvHyIrBkOD9+zTxHFxxV9mYYbFvEF6IMR9C/v9eZCaNAD3eVnjHWv8oEcmthWPsNIZwu33eC5P6q8jnzJIixRs4CnzweikTk1iRbPnNLZ9b+W8JpIHElGwUnX3sNKvvZBIp4KH+UftVn5rWoWhmp2ovaNUwTNRKmSGoA9lspz5Cj6YnK5LryK7Ka0zuaogFAS5jBHGnRXLzo3VW3YdUxgDgraf9AFM2oJS3GNoGi/MaFuhZxrdfPznOeBX4c3CbQ+nNlKD/Eaiaimc2YwWJwvzMRzk61rM411l73kN//SCGOd3NFAwXH8efsYY5WS5evk1PQcW+XbNZue8Y+JhyFPXI45wqpHmjWOpgw+BJWe7io57XnuXBCYIr6ghXP9ljCgFe6OdbPnpKkydo1kj+zNPbct+V2JAeQms2N78V2n8pOrx3mGSVcEyygkEkwAl0iNpmhVh61qC0Y9m0z15VRvfLmU/Sys+C5MOtVMVxvVnPwFFmtC9+WlapnOlcqAJDPlemOQP3dk0pj7rReYhEmWAYkqS533FGimrZYT1/Ayi3N0GrbNR2cCDtsv05AzsI3JIf9hEsAn7skKaFtN1jXXkdI/0UsrKqBdSPTOOawHcDlU8jYnWnQ/ogRi7CJdqiR6BqFFaOWFP+iDpl+eAoXEnzdpl1guXa36KGOZ0cYSYJ+kSo4oGMS5lizRoOcUEhYHOwtEmE3auHajoyxhu8CK7aJl3ZyTTuAPAz52LhpwKdQHPkYOlzc7hFKncbygssnw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(396003)(136003)(39860400002)(366004)(451199015)(36756003)(6506007)(31696002)(31686004)(54906003)(6486002)(316002)(66946007)(64756008)(91956017)(76116006)(66446008)(66476007)(53546011)(66556008)(478600001)(38070700005)(5660300002)(186003)(38100700002)(2906002)(8936002)(71200400001)(26005)(6512007)(4326008)(86362001)(122000001)(83380400001)(110136005)(41300700001)(7416002)(2616005)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZVRWcGpkYU1GMHN3VTJqTHIwQzRCY1VTSjFuSFl5U2lHd1dxbGhrU083U2Vz?=
 =?utf-8?B?YmpXcmhVdFU3NlQ1MVl1UG8wVC9sMENObkNBRVNUK1gxcnlZVWdqZ3hmTVFZ?=
 =?utf-8?B?QnFYMWdROTlqcTN4eVkrbnZUak5GSVB2VDYvNWh2b1c0TW15eGVFOFRRQ3RJ?=
 =?utf-8?B?c1ZqakxGVjZZcGdDK3BORlR0ZGpPTjNweGQveDFBcUZoU3JZRWcvQzJBRjlQ?=
 =?utf-8?B?RjlPV2xMTW8zUGZlMmlrTTZKK0pjWE9oTUJLb1d4cmgvRUVrZ2dmaFpDZCtJ?=
 =?utf-8?B?b21rajdUcm5rdStFWDNURlBqeDdkck1iZms4dUlNc3B6WnhaZ1puQVJaM1Bj?=
 =?utf-8?B?NVBmdUtISWN1dmJHb290Q3dWSmxYbDBQcnZaQTYyZi9DVDgvc1oyai9OL2Y3?=
 =?utf-8?B?UkZYSUdiYWYxU2VMdlFIV1AxWDZsSDdLS3ZLbktrcVY2bTgxcDliNCtiUjdL?=
 =?utf-8?B?QVFOZmh5ZXduMXAxK0kraU1JL3Fya1NoVFhnWlF5QlYxVk1LR0hMSVh6OG1y?=
 =?utf-8?B?Y2JIY0pOa3pxSEdyOHJMTkdKNzk5WGRyeUtKU1lJbTdDVzVHajJlVjY5SzNp?=
 =?utf-8?B?SXpyV0RIL2FnN1ZHdTZBcUVsOFgzVUUxWUprUVpTOTNYcm1XSm1rcVRCa1VM?=
 =?utf-8?B?MFVEcVFlQ1pJaU1HTFZQcEZlaGQ3Ynk5d3B2amVkamhhTTFVb3hGYTl3N09s?=
 =?utf-8?B?UnUzcnprK2pCWVNDdVNpNnhUUDdQMUtXZ202VlpPSFlMcDJhV0lmQ28vVWNH?=
 =?utf-8?B?QVgxSVNFdm5xaldRcG11QWg1RG95WGRJckZucHlBVXZsR0x4a1lDbC95c2t2?=
 =?utf-8?B?QW50UlAzbkFsR1lsS2EzS1dMZS9oZENJWmkwdU5YWGFkZ2o1SC9nMFFEK0x4?=
 =?utf-8?B?YXhMcmhDck16aXV5SDVZYTNsOWFzcGw0cVdTZnNqZGdGQ3Y5MHBBUG9JcFpX?=
 =?utf-8?B?c1BCT1RrU3NxVGFTT09oaDZPLzJQbE1IeW9DeTdraVZURjg0N0FLRnZKMjZn?=
 =?utf-8?B?U1dtakI4MUh2aFF1WmMzOEk0U3BaWFdHNEhDVC9FTTVGcVpDaWMrVGFqL2dE?=
 =?utf-8?B?cVl4WDM2KzRtN0xsbXdMbXUxS1VUd0VHaXNyd2hGdXk0S1M0d2RYVGFhQ3lv?=
 =?utf-8?B?Tkw2cDZjQzVQNTZOZFVKNVhaTkhVMFNXb1diTXpYYUlTb2F3alVXZEhjdzc2?=
 =?utf-8?B?YUxMRUdLc1IrZTdGWmJpMlVtdUp4RkhzR3ZYY1RZVUxDM0JyRDBiQndkNlFI?=
 =?utf-8?B?VUczelh3TzRnYXV1UXlQRjB6NGpUMk5Oc1F4Q2JvOUR3UCtaQjh1UTdaZ25E?=
 =?utf-8?B?YW1ESUpBUWMvdEw4UWlEL3A4Wm54NDN6dGUrNTh0dUxHeXNLMCtmZ2Voa0VZ?=
 =?utf-8?B?d3ZqdzJUK25ucTlrUERkVjJ3Y3JLRXo0V1VnQUd6N2ltQzd1UWlrdTN6R01B?=
 =?utf-8?B?aEtvckN4eXk3QldGYUFTOWtTUWJ5ODRNdnZJYU9XeW9nN2VZS1BRSGdQQzZ0?=
 =?utf-8?B?Vml4K29LdG5naDdYSVh0T0tNL1RjUlFGcXdtQ3luZjVCLzRpa3hXRnNEQzly?=
 =?utf-8?B?TGE3MDZmK3dRcmVLNFRTWldqOUJ5RkJibmd3SkMvUndDRVpCc1B3SzdzZTZ0?=
 =?utf-8?B?cnkvaHRHTEJyZ2lIN1ZYNEkraTlhbEczRi8vb3hEYUlyWENDWWZxYVdhYlpV?=
 =?utf-8?B?NWpLMzZaM0x3bU9Zd0VpUitPc1dVZDRsTHZ4YU42eEJSeVdGUWlSRXhxS2g5?=
 =?utf-8?B?NGRDV3Vza3BNLzVYRmJmYkppMkJUN2xNUU4wRUlsSVlubTNWZnFyNXBjM2RN?=
 =?utf-8?B?V2hTSy9jQzJIS0ttbmxVNTBqd0NlaGJjNmNMd01zRy85aUkzcXJsYjE0MkRD?=
 =?utf-8?B?WWNKVzEweHZvRUNuN08wcXVQcmY1S29sSnpPU1AvWHNzeGg1aS9XMDh0T3Zn?=
 =?utf-8?B?RFptVlE4bGJMcmZRdnFHL3dZWnEzR0djQjZsVTR5SDVmYW5SN2UzeUZKNkdE?=
 =?utf-8?B?WFhjUDk5VGd6N1I4L2wrbVNBR21BMms4SDNDczRyOWN5a2VmdzE2aW0rMGhX?=
 =?utf-8?B?dGNBMVhhWldWZDlaR3J0bHBkdSsySFV1NFdEd3hOM0Vic0tnYmpOaVRSRTNt?=
 =?utf-8?Q?/kqoepmVi5i/tHaeRbJEe+qMO?=
Content-ID: <830CE31E7260624B812258A56C2D3980@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71ee20e7-c271-4522-ec67-08dabe44d88a
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2022 09:13:32.6227
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2FB5Bf/VR6YMv6OAo7gOscwoxtF6DUucxpNmvWerZV+HoJyQSpL9+qMWdnco+Alafq+jqH4QW0R8G0PXU7k8INOBuGbRBIHhbhNCOeU0eHc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5397
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_021341_164446_224F25A4 
X-CRM114-Status: GOOD (  13.89  )
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

+CC linux-riscv <linux-riscv@lists.infradead.org>

I'm not sure who dropped it, but please don't :(

On 04/11/2022 03:39, Guo Ren wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Sorry, F.Y.I again
> 
> andy.chiu@sifive.com
> 
> On Fri, Nov 4, 2022 at 11:39 AM Guo Ren <guoren@kernel.org> wrote:
>>
>> F.Y.I andy.chiu@sifive.com
>>
>> On Fri, Nov 4, 2022 at 10:45 AM Vineet Gupta <vineetg@rivosinc.com> wrote:
>>>
>>>
>>>
>>> On 9/21/22 14:43, Chris Stillson wrote:
>>>> From: Guo Ren <ren_guo@c-sky.com>
>>>>
>>>> Current cpufeature.c doesn't support detecting V-extension, because
>>>> "rv64" also contain a 'v' letter and we need to skip it.
>>>>
>>>> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
>>>> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
>>>> Reviewed-by: Anup Patel <anup@brainfault.org>
>>>> Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
>>>> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
>>>> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
>>>
>>> Reviewed-by: Vineet Gupta <vineetg@rivosinc.com>
>>>
>>>> ---
>>>>   arch/riscv/include/uapi/asm/hwcap.h | 1 +
>>>>   arch/riscv/kernel/cpufeature.c      | 1 +
>>>>   2 files changed, 2 insertions(+)
>>>>
>>>> diff --git a/arch/riscv/include/uapi/asm/hwcap.h b/arch/riscv/include/uapi/asm/hwcap.h
>>>> index 46dc3f5ee99f..c52bb7bbbabe 100644
>>>> --- a/arch/riscv/include/uapi/asm/hwcap.h
>>>> +++ b/arch/riscv/include/uapi/asm/hwcap.h
>>>> @@ -21,5 +21,6 @@
>>>>   #define COMPAT_HWCAP_ISA_F  (1 << ('F' - 'A'))
>>>>   #define COMPAT_HWCAP_ISA_D  (1 << ('D' - 'A'))
>>>>   #define COMPAT_HWCAP_ISA_C  (1 << ('C' - 'A'))
>>>> +#define COMPAT_HWCAP_ISA_V   (1 << ('V' - 'A'))
>>>>
>>>>   #endif /* _UAPI_ASM_RISCV_HWCAP_H */
>>>> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
>>>> index 553d755483ed..8d4448c2d4f4 100644
>>>> --- a/arch/riscv/kernel/cpufeature.c
>>>> +++ b/arch/riscv/kernel/cpufeature.c
>>>> @@ -83,6 +83,7 @@ void __init riscv_fill_hwcap(void)
>>>>       isa2hwcap['f'] = isa2hwcap['F'] = COMPAT_HWCAP_ISA_F;
>>>>       isa2hwcap['d'] = isa2hwcap['D'] = COMPAT_HWCAP_ISA_D;
>>>>       isa2hwcap['c'] = isa2hwcap['C'] = COMPAT_HWCAP_ISA_C;
>>>> +     isa2hwcap['v'] = isa2hwcap['V'] = COMPAT_HWCAP_ISA_V;
>>>>
>>>>       elf_hwcap = 0;
>>>>
>>>
>>
>>
>> --
>> Best Regards
>>  Guo Ren
> 
> 
> 
> --
> Best Regards
>  Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
