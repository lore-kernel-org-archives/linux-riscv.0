Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2654BECAAA1
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 07:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jxENOPgYk/+ClnBaM8E5dJTOTk8QiJsVQ/gUbDseOzM=; b=Y8bq5flqJshT1V
	ygEiHe/WORehlTNGo4xxc6gSa0hLjIg0iw224AfSBMSU0ASazcT+lxOlpBi8tFWaVNL1QizLPrxZD
	t2QF6TTL+CC3sf8+fcKkwd3JtI9I/dWfc/H+vaSXP5HR0l0R70YgXg+4baDhSU2Yj26t4NS7jySKZ
	cLKk87nHw+wMcgAHeQP/LUNP2b7B4I7o+cz5B30Vh5vycHP9PMZVAm6HaiYXaM0nnaT+DJIR/XEoH
	/t5uEOROWBcCVhxZI0PxHH+nWwdOe2INq3ZyG7R0/uqdITm1cxEd+n2HYy3UKeip9DOIPDgD3XbuE
	R+bocyhLeiwwcXRn9k2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVT0k-00AoMa-0K; Tue, 06 Sep 2022 07:28:42 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVT0e-00AoK1-Ic
	for linux-riscv@lists.infradead.org; Tue, 06 Sep 2022 07:28:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662449317; x=1693985317;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=1s3HVpR+eR91ab1rV1UHq7dlksNCKVOO8r4df/XZj8k=;
  b=b8pG8bPoDu8g62JbcXR/kVCikr5cR9N1Ar52VmW4h40SN3cnujmAGav5
   FVk50dbLUshreC+2ruwRh6QzJ+gk5RiWPgIqjSqW/C5C8KOlfM03G3YM+
   OMjHppDdL73GMdltQ66897T2a+1gIZm3Tsf/dYcmLyiPBsZQ933jlw+1e
   tAINGZSiJk34E2AN9bkFPwD43fpr37wkYrQQTfrbwL5uOBTbmuVm4sCke
   5lRsag/JoATKuOlWTtfPYREjtJ2+aE7EiGdveowjWZ4eO8HZccrL/8JvB
   Ibmc6zMYwEpfdT4mAXmTZpaXD3pcgkTF2SFp6DAXsda2NofQtPSKB9+kP
   g==;
X-IronPort-AV: E=Sophos;i="5.93,293,1654585200"; 
   d="scan'208";a="172529510"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Sep 2022 00:28:28 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 6 Sep 2022 00:28:26 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Tue, 6 Sep 2022 00:28:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PDi7bP3V8/xkS7faSu6QJdTMU4TMR0kDtrO2k96e2W8uE7xwlVkMxux30mfJSK4LdFevQ6ZyJJEkwjH6EuU6r3LafEPa+3399TBqi07XIPSjgXvv6uiBIfmxhCNl3KqfZ5iWq7pbgn91CBvCPhrxfxWFiFlFgliYIjFNnTo+l54xMJv3unQIPglhHS5rq135JrxFyF1Z8tameG0kTXCm1t7IMmnG3ZYycTj+9kPH2fd7CdFO9yMg4uHMd3nr/++75bRrmF+fdffcdmKpAnaxYzKHmLHaq0NqPdQRno8UUNVePAUFHMICYG3ci/5jN1cVkdFZosf/+bnap7oRwWcFgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1s3HVpR+eR91ab1rV1UHq7dlksNCKVOO8r4df/XZj8k=;
 b=Wddx3STHD9czNDYnU7Ms9WclgxUy+DLAyGdnwTgonqe9XBZ2+iQESWcCA78Ren0X94SkDryErum/gVOpVjpLH0WMHt8Dr8LNaXdw0S0Zgy0Kebob6+HOsm/aA0UEjFCQLpVU7JGUGAvrf9kxgzKL652o3XT0cv/qwsig9SkP85wVjLsul5KuwGeCanfgWQCaM3nC5DwDy9UVrRL82YZNNucv36koKtuWHjZQOxmdz4qksjay2GNAZ+70a/0mkM/EzfBojqg5CfcLSoDhYMHfCm2e+DyM30WjWn6aj9utJIfyAq1AR+z30HzvxChELBM9lAVzaHVh40WmAQqCYjK6fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1s3HVpR+eR91ab1rV1UHq7dlksNCKVOO8r4df/XZj8k=;
 b=DNQzMPD/0GW4agLSIXSqTs/ofGSi6mkKpdeiODG7lZymfpOphX56KvE4zAo3Dwcn5xbQkq2GM9iLhAoHHlLkocjdou2QCbjQ724XCOOdPFFQS6jHT7LbX98q6PYVRPfDH8+dzEck+weyg8/A8Wm3jzStc4rz+SZWtZoJ5FG4dsY=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by DM6PR11MB3275.namprd11.prod.outlook.com (2603:10b6:5:5e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.15; Tue, 6 Sep
 2022 07:28:21 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::a159:97ec:24bc:6610]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::a159:97ec:24bc:6610%11]) with mapi id 15.20.5588.014; Tue, 6 Sep 2022
 07:28:21 +0000
From: <Claudiu.Beznea@microchip.com>
To: <Conor.Dooley@microchip.com>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<Daire.McNamara@microchip.com>, <Hugh.Breslin@microchip.com>
CC: <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v4 4/5] clk: microchip: add PolarFire SoC fabric clock
 support
Thread-Topic: [PATCH v4 4/5] clk: microchip: add PolarFire SoC fabric clock
 support
Thread-Index: AQHYwcI8qJ/+1LH+MEi+VxJGLzPk0w==
Date: Tue, 6 Sep 2022 07:28:21 +0000
Message-ID: <e3477cef-dc8f-3c20-126b-cbd514233867@microchip.com>
References: <20220830122855.2207752-1-conor.dooley@microchip.com>
 <20220830122855.2207752-5-conor.dooley@microchip.com>
In-Reply-To: <20220830122855.2207752-5-conor.dooley@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6335db3f-5376-452e-2f3e-08da8fd96039
x-ms-traffictypediagnostic: DM6PR11MB3275:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fESFtfXidW0RueP8L24A1ehRvxThwkHWqXHwGO9/6s/nvVivX3M5pngoHUX/FSi5ieDyRVIOoZcw7IouJMP5FuoT4NZZ2SQ1MCVZY6M1pvdlQpYNctKcPQA9bjn8cNQxNKX2GpHZJf0SlSAOhQACh7SalnWkdo3Q4nMkf7cLViXwTRfCIFgRa4YJbDV64KoluHvYzEoYQnzNPEK0LVD0J7fWmhbUn5mrorBG5jWGxF/QyW6ZQY9K8x60OoFbUVQeR81k4rYz4P09A0Q1jiMImlYbBvYSPLsPR2rNMjzzyG8KJxwfUOa8/ZGo7HXih71BM33RWfH+ikIuTbnVsddGFQ+HRbuGVeMN/o0ykd1rng7vH724F/XaMnoP8j6YP7Z5KzTHzdx5WNcfemEOk5ip/ce0HlEfDFa15Kct+mf/bLNH9ja2q+L+TfYwxYdlD3joKAg9exQumBLVtHgrLx/7SONn1Z492M5ZpAMlEfZ2xP9PAFrHVK+zKeaC2ZN908bmtI77li/3Ez4YfSScz12mQ3e5rGKgo7YJoM0mJgXZQPpAcK5Fdr0KTxS8c1wa6a+9rvHY9eRcorf7+ordvi95mXWMZ9D1nk3EAmTGP9Qedzz+r7NA4ArYECZbgT2xTIKBiR68zm9BzGacylpihbScjDehskpKK0YzCMv7Af9mjR7L1qQDE6pmT6IcweihVgqjRSnPLGebJV56sOkYyUZQeP2xzeyBak9Tuodmy6+2SAl8w4+q0bsO37rfbGcjTdAckKr0MrQFGE1A9jVzyTnW3tYoeK+GsoZINoImRGRrbun7ffKKLxH14VzpjG0fNyM32+3dHQu+fNAKsEK0sJq0UgtbcreD7LrMuh6bpJuXZU8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1953.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(39860400002)(396003)(376002)(136003)(366004)(31686004)(53546011)(6506007)(186003)(6512007)(2616005)(30864003)(8936002)(7416002)(5660300002)(26005)(41300700001)(31696002)(86362001)(478600001)(6486002)(71200400001)(966005)(36756003)(122000001)(38070700005)(83380400001)(66446008)(6636002)(76116006)(2906002)(66476007)(54906003)(38100700002)(110136005)(316002)(8676002)(66946007)(66556008)(64756008)(91956017)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NXpBQTYzbjZNSk9SbUF0c1hNL0R2UTNCYVdwRXY0QTZTZVFMSlhVZDEzeE9u?=
 =?utf-8?B?N3pISTdXN0E5eEo4K0cxakRlS2Jhc2F4ei9VQUpjb2NLUkhNZkR1WXk3ckNV?=
 =?utf-8?B?U1RqYmFlSlphdVdYdkd0dERraGR5QXY5c01mSVlCeEdPTkZ4L0pYekVyaUZS?=
 =?utf-8?B?d3IyUzhyTjJQaTVpdUUwcU5IRkdVMFNST0Q0VmhKcDVNczNzejhiWWNRY1Fi?=
 =?utf-8?B?dHJPNUFHK0o1Z1I1cnNmMVNQR3BNNDd6WXEzeDNQNjZ3enZxRnJxWTBTdjJY?=
 =?utf-8?B?anJGU29IMUlxTjdpcUlQV3V4WGE1RkpPeHc5YXh2YzJqSUlWS2thdnBPUlYv?=
 =?utf-8?B?L0tKK0JiUWl0eFRoOHJFSmY5YlNBRjJSendYaER1QldBankxMktaUk5mT3Uw?=
 =?utf-8?B?UWVEOGpXT1lhUGtScngwdVhQSitCL3B5SUwvTW9Kdjc5dlJQdUtTWEJVMm4w?=
 =?utf-8?B?NXA1YWd2OHFyS1VnOFVUUEM1UC9KVWZmT1lmR2paVjVGUEFZdFZoNkNtSWNQ?=
 =?utf-8?B?U1F2MVNidkQxMXNoNlN0YWNXZWtqTUdNcXRVZnpTZDdrSmV5VmRmZTF1anND?=
 =?utf-8?B?UURVRFprOHpjNzBtY1U4dTYzRGM5bHJQLzhkdnVnTTFNVTdBNlZRNXRYN2Zm?=
 =?utf-8?B?cEcveEJ5bUczTTVJYUlkMExCMXB4NXF5M2t3dmJRTEdWa2RNTXdsZ1JoYTRZ?=
 =?utf-8?B?TExvVXhxV2VJdUtXcXpaQjRkQVJVc01nM3BnNTd1OGdwWndqNjR1T2xwemhW?=
 =?utf-8?B?NzZpVThBaHpMb01jYTI0STRSZEJZQ2x5YlA0T3h5RlFVNUxTUk9wNE1hR1R5?=
 =?utf-8?B?bm9EUGxuUFZ5Nk5ERVJOdmNmMURBNG9kYzU2WjJLQ2RBWE03QVpQUnZxQ2t6?=
 =?utf-8?B?VXRDa0ltN21NYzRNejQ2OHF3Yy9IaEMzNG94MkxpWkRLVmwrdzNNTU5paHBT?=
 =?utf-8?B?MmpESldZVS9DbFVCUzZxaUxpZGxFSlhQYTdzT2twUWtDZ0E3MGZjekNyMjEr?=
 =?utf-8?B?bnZ1ZWp5RjcrRVJ5V0toN0N3eDNwbWtITm5CUXpPeWxFdGhpdmRlUFVsa0hl?=
 =?utf-8?B?Rkh1T2daTmw2T25iUldyVWJqRmh4YUNrbHFoSHNFd1M4dzRndlVpaVVrbEw2?=
 =?utf-8?B?SEx5OEVqWHBRNmd5RzV5YWE3NTlyNjZDNDhKdVlybXY0MGZmelBneGpqaTVD?=
 =?utf-8?B?ZUxhdFlTY2tuQklzeCtoNThUZXRUQjdJdTdxNzlkT1FTcjZoZk5YSEQwOVoy?=
 =?utf-8?B?alc2S09uMkRPTFhoRVlEVmNFSHVFekpsSlVXN2wvWGNQRi9NT0xzN3lvczQ4?=
 =?utf-8?B?cFY5TUFiRE1xUXZjaGxaTndrMkhTWWNsLzZHVm90Sy91ak9GK3FtR1RXWHpm?=
 =?utf-8?B?Q3k0Rk5ETHhIT1pFWXE2ckRVamZDZWJzZm01czQxblAyYnh5NXZPdWIrWlU5?=
 =?utf-8?B?SzYvZGNIb3NUZUhNSGNkcmVrcFJOZ1RpSmpRUWFVbmJrU3V3QjdkYzQrTEN5?=
 =?utf-8?B?Sm9EVHdBOGRrWnJLbG5VOFJQeWhLaUlSYmVrNkNHcEdVcDFXQmlQVnpUTGs1?=
 =?utf-8?B?TUJ6Z01VRmIzRFc3YkIxNmw0dnVsOWtkV3Y2Q1RoUEdCRVdsdzZPR2xlNjQ2?=
 =?utf-8?B?bTNHMkg0d294RU5TeXp2V3I4eU41bmhTeDNwamFYWkQxSW5hRjdHQnlFRjY0?=
 =?utf-8?B?MGtUTXU4TFFVbWk4QXNlUWtLQ3BHQzJyR1BHeDdtS3R6ZFZGL3h4WmQyZTZT?=
 =?utf-8?B?N1JtL2VzcmJDdllkS3lpT2pyNDlublJEYm9NZ3k5UVZmMWlRUllTYkR2cDBQ?=
 =?utf-8?B?Zy95YkxuTXRPYVZKUjl0c1BQZGhLTnpQOTMycjZURVVucGFHVWJBZENjdmdt?=
 =?utf-8?B?ZU9qSkJwYUZrMzZPOFF2WHBjVzJ3M3VzRUEwZkhwbmJSTjk5M0tVOVpIbm9j?=
 =?utf-8?B?dVFiNU5CYTN5QVloQ0RISVp6dm9IRHZlL3ppanpuSEkvS0RzVEZoRVo2OVJk?=
 =?utf-8?B?emxDTHd6WWlpUzNZbTRCaEdHNmdJODdmUDNGakxUeng1blNlYVc1bGlaRitU?=
 =?utf-8?B?LzFqSTNody95Rk1tdHk1WVFWbUZkVG4yQWZJTHIycnlVcFNhVXlwUXhSQVBr?=
 =?utf-8?B?bDJrUHJXQm54bkdHek5kQVltSTJNQ0hoL1FnTHFuZUlhTis2aTJrQ3pCWExU?=
 =?utf-8?B?NGc9PQ==?=
Content-ID: <9DFC831FB145AD4A8CC69158161975B0@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1953.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6335db3f-5376-452e-2f3e-08da8fd96039
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2022 07:28:21.0757
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: izQ+bG7usZWxAZiw3g9fMBUO+UTDrPWV2IPA6DFVfHZV2j1nNcVhFPO/JaXce3kot9C7txk6rD+SjNuvH6FWIUAcu2HMcZFcLCbJ+cRkkEg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3275
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_002837_048601_2E6D2DEE 
X-CRM114-Status: GOOD (  23.08  )
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

On 30.08.2022 15:28, Conor Dooley wrote:
> Add a driver to support the PLLs in PolarFire SoC's Clock Conditioning
> Circuitry, an instance of which is located in each ordinal corner of
> the FPGA. Only get_rate() is supported as these clocks are intended to
> be statically configured by the FPGA design. Currently, the DLLs are
> not supported by this driver. For more information on the hardware, see
> "PolarFire SoC FPGA Clocking Resources" in the link below.
> 
> Link: https://onlinedocs.microchip.com/pr/GUID-8F0CC4C0-0317-4262-89CA-CE7773ED1931-en-US-1/index.html
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  drivers/clk/microchip/Makefile       |   1 +
>  drivers/clk/microchip/clk-mpfs-ccc.c | 290 +++++++++++++++++++++++++++
>  2 files changed, 291 insertions(+)
>  create mode 100644 drivers/clk/microchip/clk-mpfs-ccc.c
> 
> diff --git a/drivers/clk/microchip/Makefile b/drivers/clk/microchip/Makefile
> index 5fa6dcf30a9a..13250e04e46c 100644
> --- a/drivers/clk/microchip/Makefile
> +++ b/drivers/clk/microchip/Makefile
> @@ -2,3 +2,4 @@
>  obj-$(CONFIG_COMMON_CLK_PIC32) += clk-core.o
>  obj-$(CONFIG_PIC32MZDA) += clk-pic32mzda.o
>  obj-$(CONFIG_MCHP_CLK_MPFS) += clk-mpfs.o
> +obj-$(CONFIG_MCHP_CLK_MPFS) += clk-mpfs-ccc.o
> diff --git a/drivers/clk/microchip/clk-mpfs-ccc.c b/drivers/clk/microchip/clk-mpfs-ccc.c
> new file mode 100644
> index 000000000000..c776bae981db
> --- /dev/null
> +++ b/drivers/clk/microchip/clk-mpfs-ccc.c
> @@ -0,0 +1,290 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Author: Conor Dooley <conor.dooley@microchip.com>
> + *
> + * Copyright (C) 2022 Microchip Technology Inc. and its subsidiaries
> + */
> +#include "asm-generic/errno-base.h"
> +#include <linux/clk-provider.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <dt-bindings/clock/microchip,mpfs-clock.h>
> +
> +/* address offset of control registers */
> +#define MPFS_CCC_PLL_CR			0x04u
> +#define MPFS_CCC_REF_CR			0x08u
> +#define MPFS_CCC_SSCG_2_CR		0x2Cu
> +#define MPFS_CCC_POSTDIV01_CR		0x10u
> +#define MPFS_CCC_POSTDIV23_CR		0x14u
> +
> +#define MPFS_CCC_FBDIV_SHIFT		0x00u
> +#define MPFS_CCC_FBDIV_WIDTH		0x0Cu
> +#define MPFS_CCC_POSTDIV0_SHIFT		0x08u
> +#define MPFS_CCC_POSTDIV1_SHIFT		0x18u
> +#define MPFS_CCC_POSTDIV2_SHIFT		MPFS_CCC_POSTDIV0_SHIFT
> +#define MPFS_CCC_POSTDIV3_SHIFT		MPFS_CCC_POSTDIV1_SHIFT
> +#define MPFS_CCC_POSTDIV_WIDTH		0x06u
> +#define MPFS_CCC_REFCLK_SEL		BIT(6)
> +#define MPFS_CCC_REFDIV_SHIFT		0x08u
> +#define MPFS_CCC_REFDIV_WIDTH		0x06u
> +
> +#define MPFS_CCC_FIXED_DIV		4
> +#define MPFS_CCC_OUTPUTS_PER_PLL	4
> +#define MPFS_CCC_REFS_PER_PLL		2
> +
> +struct mpfs_ccc_data {
> +	void __iomem **pll_base;
> +	struct device *dev;
> +	struct clk_hw_onecell_data hw_data;
> +};
> +
> +struct mpfs_ccc_pll_hw_clock {
> +	void __iomem *base;
> +	const char *name;
> +	const struct clk_parent_data *parents;
> +	unsigned int id;
> +	u32 reg_offset;
> +	u32 shift;
> +	u32 width;
> +	u32 flags;
> +	struct clk_hw hw;
> +	struct clk_init_data init;
> +};
> +
> +#define to_mpfs_ccc_clk(_hw) container_of(_hw, struct mpfs_ccc_pll_hw_clock, hw)
> +
> +/*
> + * mpfs_ccc_lock prevents anything else from writing to a fabric ccc
> + * while a software locked register is being written.
> + */
> +static DEFINE_SPINLOCK(mpfs_ccc_lock);
> +
> +static const struct clk_parent_data mpfs_ccc_pll0_refs[] = {
> +	{ .fw_name = "pll0_ref0" },
> +	{ .fw_name = "pll0_ref1" },
> +};
> +
> +static const struct clk_parent_data mpfs_ccc_pll1_refs[] = {
> +	{ .fw_name = "pll1_ref0" },
> +	{ .fw_name = "pll1_ref1" },
> +};
> +
> +static unsigned long mpfs_ccc_pll_recalc_rate(struct clk_hw *hw, unsigned long prate)
> +{
> +	struct mpfs_ccc_pll_hw_clock *ccc_hw = to_mpfs_ccc_clk(hw);
> +	void __iomem *mult_addr = ccc_hw->base + ccc_hw->reg_offset;
> +	void __iomem *ref_div_addr = ccc_hw->base + MPFS_CCC_REF_CR;
> +	u32 mult, ref_div;
> +
> +	mult = readl_relaxed(mult_addr) >> MPFS_CCC_FBDIV_SHIFT;
> +	mult &= clk_div_mask(MPFS_CCC_FBDIV_WIDTH);
> +	ref_div = readl_relaxed(ref_div_addr) >> MPFS_CCC_REFDIV_SHIFT;
> +	ref_div &= clk_div_mask(MPFS_CCC_REFDIV_WIDTH);
> +
> +	return prate * mult / (ref_div * MPFS_CCC_FIXED_DIV);
> +}
> +
> +static u8 mpfs_ccc_pll_get_parent(struct clk_hw *hw)
> +{
> +	struct mpfs_ccc_pll_hw_clock *ccc_hw = to_mpfs_ccc_clk(hw);
> +	void __iomem *pll_cr_addr = ccc_hw->base + MPFS_CCC_PLL_CR;
> +
> +	return !!(readl_relaxed(pll_cr_addr) & MPFS_CCC_REFCLK_SEL);
> +}
> +
> +static const struct clk_ops mpfs_ccc_pll_ops = {
> +	.recalc_rate = mpfs_ccc_pll_recalc_rate,
> +	.get_parent = mpfs_ccc_pll_get_parent,
> +};
> +
> +#define CLK_CCC_PLL(_id, _parents, _shift, _width, _flags, _offset) {		\
> +	.id = _id,									\
> +	.shift = _shift,								\
> +	.width = _width,								\
> +	.reg_offset = _offset,								\
> +	.flags = _flags,								\
> +	.parents = _parents,\

There is a bit of missalignment of \ in this macro.

> +}
> +
> +static struct mpfs_ccc_pll_hw_clock mpfs_ccc_pll_clks[] = {
> +	CLK_CCC_PLL(CLK_CCC_PLL0, mpfs_ccc_pll0_refs, MPFS_CCC_FBDIV_SHIFT,
> +		    MPFS_CCC_FBDIV_WIDTH, 0, MPFS_CCC_SSCG_2_CR),
> +	CLK_CCC_PLL(CLK_CCC_PLL1, mpfs_ccc_pll1_refs, MPFS_CCC_FBDIV_SHIFT,
> +		    MPFS_CCC_FBDIV_WIDTH, 0, MPFS_CCC_SSCG_2_CR),
> +};
> +
> +struct mpfs_ccc_out_hw_clock {
> +	struct clk_divider divider;
> +	struct clk_init_data init;
> +	unsigned int id;
> +	u32 reg_offset;
> +};
> +
> +#define CLK_CCC_OUT(_id, _shift, _width, _flags, _offset) {	\
> +	.id = _id,						\
> +	.divider.shift = _shift,				\
> +	.divider.width = _width,				\
> +	.reg_offset = _offset,					\
> +	.divider.flags = _flags,				\
> +	.divider.lock = &mpfs_ccc_lock,				\
> +}
> +
> +static struct mpfs_ccc_out_hw_clock mpfs_ccc_pll0out_clks[] = {
> +	CLK_CCC_OUT(CLK_CCC_PLL0_OUT0, MPFS_CCC_POSTDIV0_SHIFT, MPFS_CCC_POSTDIV_WIDTH,
> +		    CLK_DIVIDER_ONE_BASED, MPFS_CCC_POSTDIV01_CR),
> +	CLK_CCC_OUT(CLK_CCC_PLL0_OUT1, MPFS_CCC_POSTDIV1_SHIFT, MPFS_CCC_POSTDIV_WIDTH,
> +		    CLK_DIVIDER_ONE_BASED, MPFS_CCC_POSTDIV01_CR),
> +	CLK_CCC_OUT(CLK_CCC_PLL0_OUT2, MPFS_CCC_POSTDIV2_SHIFT, MPFS_CCC_POSTDIV_WIDTH,
> +		    CLK_DIVIDER_ONE_BASED, MPFS_CCC_POSTDIV23_CR),
> +	CLK_CCC_OUT(CLK_CCC_PLL0_OUT3, MPFS_CCC_POSTDIV3_SHIFT, MPFS_CCC_POSTDIV_WIDTH,
> +		    CLK_DIVIDER_ONE_BASED, MPFS_CCC_POSTDIV23_CR),
> +};
> +
> +static struct mpfs_ccc_out_hw_clock mpfs_ccc_pll1out_clks[] = {
> +	CLK_CCC_OUT(CLK_CCC_PLL1_OUT0, MPFS_CCC_POSTDIV0_SHIFT, MPFS_CCC_POSTDIV_WIDTH,
> +		    CLK_DIVIDER_ONE_BASED, MPFS_CCC_POSTDIV01_CR),
> +	CLK_CCC_OUT(CLK_CCC_PLL1_OUT1, MPFS_CCC_POSTDIV1_SHIFT, MPFS_CCC_POSTDIV_WIDTH,
> +		    CLK_DIVIDER_ONE_BASED, MPFS_CCC_POSTDIV01_CR),
> +	CLK_CCC_OUT(CLK_CCC_PLL1_OUT2, MPFS_CCC_POSTDIV2_SHIFT, MPFS_CCC_POSTDIV_WIDTH,
> +		    CLK_DIVIDER_ONE_BASED, MPFS_CCC_POSTDIV23_CR),
> +	CLK_CCC_OUT(CLK_CCC_PLL1_OUT3, MPFS_CCC_POSTDIV3_SHIFT, MPFS_CCC_POSTDIV_WIDTH,
> +		    CLK_DIVIDER_ONE_BASED, MPFS_CCC_POSTDIV23_CR),
> +};
> +
> +static struct mpfs_ccc_out_hw_clock *mpfs_ccc_pllout_clks[] = {
> +	mpfs_ccc_pll0out_clks, mpfs_ccc_pll1out_clks
> +};
> +
> +static int mpfs_ccc_register_outputs(struct device *dev, struct mpfs_ccc_out_hw_clock *out_hws,
> +				     unsigned int num_clks, struct mpfs_ccc_data *data,
> +				     struct mpfs_ccc_pll_hw_clock *parent)
> +{
> +	int ret;
> +
> +	for (unsigned int i = 0; i < num_clks; i++) {
> +		struct mpfs_ccc_out_hw_clock *out_hw = &out_hws[i];
> +		char *name = devm_kzalloc(dev, 23, GFP_KERNEL);
> +
> +		snprintf(name, 23, "%s_out%u", parent->name, i);
> +		out_hw->divider.hw.init = CLK_HW_INIT_HW(name, &parent->hw, &clk_divider_ops, 0);
> +		out_hw->divider.reg = data->pll_base[i / MPFS_CCC_OUTPUTS_PER_PLL] +
> +			out_hw->reg_offset;
> +
> +		ret = devm_clk_hw_register(dev, &out_hw->divider.hw);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "failed to register clock id: %d\n",
> +					     out_hw->id);
> +
> +		data->hw_data.hws[out_hw->id] = &out_hw->divider.hw;
> +	}
> +
> +	return 0;
> +}
> +
> +#define CLK_HW_INIT_PARENTS_DATA_FIXED_SIZE(_name, _parents, _ops, _flags)	\
> +	(&(struct clk_init_data) {						\
> +		.flags		= _flags,					\
> +		.name		= _name,					\
> +		.parent_data	= _parents,					\
> +		.num_parents	= MPFS_CCC_REFS_PER_PLL,			\
> +		.ops		= _ops,						\
> +	})
> +
> +static int mpfs_ccc_register_plls(struct device *dev, struct mpfs_ccc_pll_hw_clock *pll_hws,
> +				  unsigned int num_clks, struct mpfs_ccc_data *data)
> +{
> +	int ret;
> +
> +	for (unsigned int i = 0; i < num_clks; i++) {
> +		struct mpfs_ccc_pll_hw_clock *pll_hw = &pll_hws[i];
> +		char *name = devm_kzalloc(dev, 18, GFP_KERNEL);
> +
> +		pll_hw->base = data->pll_base[i];
> +		snprintf(name, 18, "ccc%s_pll%u", strchrnul(dev->of_node->full_name, '@'), i);
> +		pll_hw->name = (const char *)name;
> +		pll_hw->hw.init = CLK_HW_INIT_PARENTS_DATA_FIXED_SIZE(pll_hw->name,
> +								      pll_hw->parents,
> +								      &mpfs_ccc_pll_ops, 0);
> +
> +		ret = devm_clk_hw_register(dev, &pll_hw->hw);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "failed to register ccc id: %d\n",
> +					     pll_hw->id);
> +
> +		data->hw_data.hws[pll_hw->id] = &pll_hw->hw;
> +
> +		ret = mpfs_ccc_register_outputs(dev, mpfs_ccc_pllout_clks[i],
> +						MPFS_CCC_OUTPUTS_PER_PLL, data, pll_hw);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mpfs_ccc_probe(struct platform_device *pdev)
> +{
> +	struct mpfs_ccc_data *clk_data;
> +	void __iomem *pll_base[ARRAY_SIZE(mpfs_ccc_pll_clks)];
> +	unsigned int num_clks;
> +	int ret;
> +
> +	num_clks = ARRAY_SIZE(mpfs_ccc_pll_clks) + ARRAY_SIZE(mpfs_ccc_pll0out_clks)
> +		+ ARRAY_SIZE(mpfs_ccc_pll1out_clks);

Usually, as far as I can tell, there are no (or not too much) lines
starting with arithmetic signs, but these goes at the end of the previous
lines. This allows you to also align the ARRAY_SIZE() macros to each others.

Other than that:

Reviewed-by: Claudiu Beznea <claudiu.beznea@microchip.com>



> +
> +	clk_data = devm_kzalloc(&pdev->dev, struct_size(clk_data, hw_data.hws, num_clks),
> +				GFP_KERNEL);
> +	if (!clk_data)
> +		return -ENOMEM;
> +
> +	pll_base[0] = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(pll_base[0]))
> +		return PTR_ERR(pll_base[0]);
> +
> +	pll_base[1] = devm_platform_ioremap_resource(pdev, 1);
> +	if (IS_ERR(pll_base[1]))
> +		return PTR_ERR(pll_base[1]);
> +
> +	clk_data->pll_base = pll_base;
> +	clk_data->hw_data.num = num_clks;
> +	clk_data->dev = &pdev->dev;
> +
> +	ret = mpfs_ccc_register_plls(clk_data->dev, mpfs_ccc_pll_clks,
> +				     ARRAY_SIZE(mpfs_ccc_pll_clks), clk_data);
> +	if (ret)
> +		return ret;
> +
> +	return devm_of_clk_add_hw_provider(clk_data->dev, of_clk_hw_onecell_get,
> +					   &clk_data->hw_data);
> +}
> +
> +static const struct of_device_id mpfs_ccc_of_match_table[] = {
> +	{ .compatible = "microchip,mpfs-ccc", },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, mpfs_ccc_of_match_table);
> +
> +static struct platform_driver mpfs_ccc_driver = {
> +	.probe = mpfs_ccc_probe,
> +	.driver	= {
> +		.name = "microchip-mpfs-ccc",
> +		.of_match_table = mpfs_ccc_of_match_table,
> +	},
> +};
> +
> +static int __init clk_ccc_init(void)
> +{
> +	return platform_driver_register(&mpfs_ccc_driver);
> +}
> +core_initcall(clk_ccc_init);
> +
> +static void __exit clk_ccc_exit(void)
> +{
> +	platform_driver_unregister(&mpfs_ccc_driver);
> +}
> +module_exit(clk_ccc_exit);
> +
> +MODULE_DESCRIPTION("Microchip PolarFire SoC Clock Conditioning Circuitry Driver");
> +MODULE_AUTHOR("Conor Dooley <conor.dooley@microchip.com>");
> +MODULE_LICENSE("GPL");

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
