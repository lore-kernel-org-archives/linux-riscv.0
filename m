Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CAD1C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Jul 2022 21:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jlYOl8a7hiPZ1fVO1l6bUvVeBpYY9ftTlAkW9863COE=; b=XhSfBTGSJI77r8
	+rVG3VmUHxX1lLE/oCOsShnTAxSNFry9wjuUisoIquDkDweADZ5NrtfNU9BvQsnUJd3z+s40L52AQ
	qH/Ta3R5M3WNeC6Syi+jgBW/DrwM6cNeWvvpj4GFAp5Wxg+58N9bpqlShmZB7EAymPJmdylnwcI0A
	q8HzLRqdLxQqWjags+XyjF9NIsK6kRxyc0LjJYQrE4F0OWHqpCKeTQOKk86ecibjH26h7JvDHSPGd
	ylTnzeWIg9h4hcEoqmGIPjewQH710LZki+22/YUGIdsa5iWvZenvTvYPJKy1cRaJtjnch3+bLnu2E
	sstwBfnnNqzlyBrdF7jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9ZEa-000Ms7-7H; Thu, 07 Jul 2022 21:40:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9ZEX-000MqB-9F
	for linux-riscv@lists.infradead.org; Thu, 07 Jul 2022 21:40:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657230025; x=1688766025;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=l0KRzQE4L5tlwgF/IDJXu7T3dhM1+WdjfdGtYmAG8bg=;
  b=BmWUJur0n+ZUgewvMt6WO5Y/+12DaGzrGG2y5GQqL882++GnjmoWFBh+
   6igt6Agz48weEhuy2CNFt1xqDNbUKBeCU8kRLTmgcwLTe2gVN3hexrmJt
   N1/U6SyRFa1QjOw8hvui4/Lt1PWZsUdwngdfI7ttEFXKopdRitkc5xPuy
   JR2yIdKaKvVExQW2SiWAGXLqubxsoPN2Kcfx5+1ZU6bXgmBCUpSXiGE1N
   heDDE8Mnr/Iqp5rRnGQzC6kIdgBrOTH0kB7Zogw8KXVrGpa0X0TBy4GdT
   Hnw9NZgsjqRKMFmmn4d2A3LOsb3v4sw2toesxtCh484qkdFRypmkuWipZ
   g==;
X-IronPort-AV: E=Sophos;i="5.92,253,1650956400"; 
   d="scan'208";a="163832845"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Jul 2022 14:40:15 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 7 Jul 2022 14:40:15 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Thu, 7 Jul 2022 14:40:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VLacK8c9nAQDhZMl0bHp+omoLRaNH+fHqrTQlVwl6TAOJVZxmnjDpBvWR0lL4/9y7gk2Mps9zJNKuXo3Mn9I6HTgE4JhZRZx5IeC0fKO4WuBKKVhyk+hYJXriR3Y6dE8PDwUowrFYqXk01KHyI7KsohVLqsuFnz8bGJxJSccCmGKOCvQcQY83sd3woZ0MSZ0DE6KcbMUBdcXfGCBRVYT23N7cSjFT6YKok0wih9US2KR8OKFSN3VJz0PSmDJ26J3pFZRSP0ICmKdQQ/Z16SUAT3rsI5Fd4ch/x0r4cuXGVZlX/yejrc/1VNYjHo/0lo0K4T74R4u45hKVKO2H3Ws5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l0KRzQE4L5tlwgF/IDJXu7T3dhM1+WdjfdGtYmAG8bg=;
 b=AtFg/sw7u5/4UaLqn9+1BN+B48mY58/+8TM+NZXk3aFHd/HB/DKcHBoEe0laDoLsXM9tZjPKoqlUqcxRuwjwMvaymPNm5R4OFM+Z7iiF9F1w8SBNKB98FXGmzsU2HPZxzPea2/IGT5yNWZoDePNub3A3s4H1+VL6vMlgywnJxQrq3b5kC3r12xPzuBKRqz2cOrhKgPB4xR0Z5oiQdqRuaVeE3YTMbTE0U9/A5hQJ9+IaRPu2eeEZ1oZHoNuuhtiIWLJv+HxOEfStReTQvdnT+q76M5EQ7ZHKSKsZtPyt/GcR/yCPFZi1fN3tvH+8obe5RjSyitoblN1k7yVcNNlIzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l0KRzQE4L5tlwgF/IDJXu7T3dhM1+WdjfdGtYmAG8bg=;
 b=b7j8g4NrIEHAjGHX4HpP92C4Wdj+/2f3mJT0p67RIhciBVByZMTQeEvn7n/mGb+kfE6jHZ9C5GmrWnbhcHCZ/9m+MtR/glYfWL0kMqSS4NYgd7T8Rl/xtNpIPJszYqKuei8/m3zjbg7nLauNEg7b8HzUrQDZilfux5fdPdHmK9I=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SN6PR11MB3264.namprd11.prod.outlook.com (2603:10b6:805:bd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Thu, 7 Jul
 2022 21:40:10 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8d4a:1681:398d:9714]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8d4a:1681:398d:9714%5]) with mapi id 15.20.5417.016; Thu, 7 Jul 2022
 21:40:10 +0000
From: <Conor.Dooley@microchip.com>
To: <wsa@kernel.org>, <linux-i2c@vger.kernel.org>,
	<ben.dooks@codethink.co.uk>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <Daire.McNamara@microchip.com>
Subject: Re: [PATCH v7 1/2] i2c: add support for microchip fpga i2c
 controllers
Thread-Topic: [PATCH v7 1/2] i2c: add support for microchip fpga i2c
 controllers
Thread-Index: AQHYkUKZtonGGLssTUOORFtF0KSp7a1xue0AgAARRYCAAZmoAIAADOOA
Date: Thu, 7 Jul 2022 21:40:10 +0000
Message-ID: <11ac3a53-02a1-707b-f904-3d5fd2198a2e@microchip.com>
References: <20220706141313.2504237-1-conor.dooley@microchip.com>
 <YsXhyB9GrfUQjy4n@shikoro>
 <0e28e644-a25a-173b-caeb-826cc4fb4537@microchip.com>
 <YsdH6oDsW6Dn7zl+@shikoro>
In-Reply-To: <YsdH6oDsW6Dn7zl+@shikoro>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8326a211-a96e-42c5-4c1b-08da60614478
x-ms-traffictypediagnostic: SN6PR11MB3264:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tSvOKWt8RVS21rO+w5Q8+PElHXyBdsk/DB10vsVllX2ruuoSitl+zF9oyZM49dUK/3DZI53jVNTsq+zAym4QpskeFdl0HgfgjIyxAFdwoA+OLY1X6PevQ7MDHZdKoTOcBkz6IhPAS61KADD1PO1tAt1Ao9XiPpRfYDERXpVrS5djQrPwRmT2kXsdXrlOhzVl7VIq903uLsL2Ztsfu3yhwMdDPECNHeOPMhIJq1xeexfXjJHJAfn89/uqlWcrgpZmQSuHqB2jNBuPel8tNglsT4GFNBmqizXgO6VY1yPuh7JJzJkRzRIeDwLK2Iw5slz/YO0Vc2WRo29aItPuODI68p9YwEPdfmSMxM8ftoAXh1uvgFM3ygcKYim21SCpPqAeqyVq4isdB1EarVaL9yGgSQcXGi4eK60HK1UgBXoUX8rQPYUueAjXcRPmPB8NNtid598NJszv+vltg0r3MOosvkPxunSqBbMaZ8057+O4uFD00q6dyRI+BO8SJycSMHArpZ3Klug8c9gOavGFYiID0SeKuEUhFX5WAYXRmCzbUl/Q8XIYj1WkqZf5OY9wRSI6cjlPWwFwKa8As+IeHC5pQq0Iou3YpOsmI9xCZq59lKSshxd6wgEijuONoIXf9hEADmUNvw8oKf3bgevb6Erpm+69ZXWY9ekjL4ySmQ8M2PFekP6OlMqVTKwjrYzfWn6LtYu8kOHvvjSJ6ny5i9vYJ9ToDSYNQBX5a4tifVrp7YI58vISXDHKeRfwKTFHFDFGa34m/ub8HVMjs9PJcawtQ5I2dVEvkshyQjC6yd1lfuRbfG3GoxYrJuHHrc20waYoF4uyTShy5v2as33NB+bosJxT3b7YblIZEfVo5OHqiR4h1aTUOjEds+gGgWv0QY7w
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(39860400002)(366004)(396003)(376002)(346002)(91956017)(38070700005)(186003)(64756008)(6506007)(110136005)(41300700001)(71200400001)(26005)(122000001)(31686004)(316002)(36756003)(6636002)(53546011)(66446008)(38100700002)(8676002)(31696002)(2906002)(6512007)(8936002)(4744005)(5660300002)(86362001)(76116006)(66556008)(478600001)(66476007)(6486002)(2616005)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OWNFbXJCRHdFR3NRSkJwZnU2dkE4Q09VbjRmNmJRMGR2c2VINXRXMHcvbFVZ?=
 =?utf-8?B?UUp5aEwzbEZGNGo0dmR1SmZPQkVOUXlVbmxxRGF1cGYwMDhHc1hXYzlwelky?=
 =?utf-8?B?RTlXc2FBSFNDWkZkTGR5RGxoampuSGUxWXJPMW9sY29MNnhkdHB3NWUzY0Qy?=
 =?utf-8?B?QmVKZDlmNnk2MHBpR2huZEVXdjV2bExtc2lQenhjak5DOTVoV25iNUVDUHZX?=
 =?utf-8?B?UHkwSWVOdnNwNFJPTE5uVzNQYy9VQlB5bVZRdDM4MDZ0bExFZWZMem83LzA0?=
 =?utf-8?B?VGZMMmU1cHJDSFhOdEtBeVp6L0VUN1Y3VGVEWmkyYVVWSTB2ejNzdWpobUdr?=
 =?utf-8?B?c0Y1QnNlcWdTWmtxUXYvN1pCclB6QjIzUUNUMnRHVDBYVWVXVkI3N1NoSXRB?=
 =?utf-8?B?QldoRWdwcFVUaXJTNXk1M3ZTNnVUR29mWW5hSVgvWXhKaU1PZkRzSmFHcDhP?=
 =?utf-8?B?aVJxQ291SzRVYkJ6QXRXRFdHRVl3UkZnWGJkSFM3cDRFVHA5SDZ5VldCQ2R3?=
 =?utf-8?B?VTY0ZW5ZaGVWbDlmMzN0L0JCaWFCN0lJb3ZHTFBRKy9PTWQyMHlscjZDanlk?=
 =?utf-8?B?eFBScWtRZ3ZZQ3JxUlJXS2M0RzUvMVBOc3Nsc3hwZDhTM25KLy9zNEFmbEJU?=
 =?utf-8?B?WTVZMndteGIvWU82T0oyQWt6Q3ZrUVBFR0VQWGdZL3oxT0RTVmtqRWd2di84?=
 =?utf-8?B?SHhsZUxhUkFrZ0tLcEVuZDhFUm43OXFudFd3RFlReDRQeTdDYVB2OURCcnlK?=
 =?utf-8?B?bFhSZjJjVGNuQWw0WnliUWd2U3JraThocmRaUGRNTEtUSXVaQjIvVC9sUnZl?=
 =?utf-8?B?bXRkdkNQVHpUL1o0N2dkY3NwNXdQV3ZXVW04VTVsdEU1dTFRamVzd01pcDNW?=
 =?utf-8?B?TWQ2MFlwTFlsQXdYZmNGUTFPQjhtSUNFdXN6WHEyZFgwK01USVBrZDFOMHBH?=
 =?utf-8?B?dlZ1L0RZdEZsWkx0L09QSStnMSs0aHk0eFM1TkpVSEQ0dVltbHRUYU5tV2hs?=
 =?utf-8?B?RXNxQUhSM0h1d0Z4L0NRdkxUN3JodnRGYTFvemRoaENrUkNEelBPRWppSGhX?=
 =?utf-8?B?c2dZZXh4a2JZVEQrU2pZYVdGcndaV2s2REk0WkdXQUZEdGtxaXNWWlFNb1Rk?=
 =?utf-8?B?R3JRZWk0RnRabDRPSkVuTEV5WjkrYkFpRmZZc051Qlh0VDFIaG0zdmRYOXll?=
 =?utf-8?B?T1JnTnU5bTNFaWJDNzh5RExuNVZ6eG0zOWJpOEpEWlpiTUxMV3FkMThINklH?=
 =?utf-8?B?eEVGVm5aMGgzS3ZmNm9qMDI1cXY1VjloYUZXS01vM25UZzJhMmVoWE0wYkRp?=
 =?utf-8?B?cmQzbkVpaExNamxYcnNXUG01clUzc0t3SzgyMVY1TnRxS2l0bERXNVlYZ3lj?=
 =?utf-8?B?RXlPdWRKSjA0WlVuUVBMTFFhYmlRMW5NMkRaWE9IbEw4dk04eDhTNTNlOUFH?=
 =?utf-8?B?SGpCeXI4R3V5bVdYanRlcVdmbDZna2Vta1Q3N2RZZEE5MnZFakFzWTc2N2Zi?=
 =?utf-8?B?NXF3YVRZUmVqY3ZZTW1INEUwdUpmOUpZOGV5NEVFK1ZWSVg1d0xkYUY3UEUw?=
 =?utf-8?B?STdQZXR1akl2dWlWV3dDTkltdHZ3RGdOQ0lraFNEVjVYTTViUTBJQlVpVXdq?=
 =?utf-8?B?RnpMY0dqQ3lMOXR0Nm5yN0dQUjVqdnY4bmR5VWd6bFZPY0dvbmN1TTZ1ZjNR?=
 =?utf-8?B?L0ZXVTJvaGF2Y2VyT2I4bTkzMEFiaFNWOEJKS3lqQ2VybEI3azQ0cW5HNDVG?=
 =?utf-8?B?Y1BFc2djckd6Um5rS25DY290VGtBU0NrVjlkSXh4bHp3SnJSRGJQRkZnTWZN?=
 =?utf-8?B?NnJ3WnNHaVRmNUdUd3VMRGhsQ2RqZlllNFZQZitKUVlmMUdKZjluWVBKRmdh?=
 =?utf-8?B?UFlDS25iWE5CN0VqVDh6NzBRbkUyUUUrdDZCV2dLRkJsQVF0aFBKeHBweGg3?=
 =?utf-8?B?ZGRnTG9ELzM5cGk0TERKc29RcVdhQ0xOSjA2S0hZdU9nVTRhQ0VnQWtRQml5?=
 =?utf-8?B?VUxMZXZ2ME1DbjdmdEJKMk9ScGt0QWV5YUdCWVpDemtXVkpiZHdFRVFzV2dR?=
 =?utf-8?B?d0NoN28rSnhKTjY5QzI4UzdwLzdyRHIyT3E1OFZHWXlqdWRBM01FNXNndVRy?=
 =?utf-8?B?OEFJYngyQzJTSS8ybVY3U29JSnFQNTdTUGgwRHl0aDE3dHoxS2NwZ1dmdkY2?=
 =?utf-8?B?VXc9PQ==?=
Content-ID: <C65A1F5A886D684EB9C34AEED805EA4A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8326a211-a96e-42c5-4c1b-08da60614478
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2022 21:40:10.3020
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0+DlH36ZC4YrKnvyTb/WV7IwQYD4JBfo6U5JqMGExxPePAPRuDD6ofJgiLcjw0EaXyilXZB6y4EUXX1mA+jm/x4A7BSHccxw3ydl2V8+H3A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3264
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_144025_427769_C1720877 
X-CRM114-Status: UNSURE (   8.21  )
X-CRM114-Notice: Please train this message.
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

On 07/07/2022 21:54, Wolfram Sang wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
>> Already upstream :)
>> Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml
> 
> Oops, I only checked commits in master..next :D Thanks for the heads up!

No worries. Thanks for the time taken to review.
Conor.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
