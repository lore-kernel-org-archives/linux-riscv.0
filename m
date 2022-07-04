Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A1CC43334
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Jul 2022 15:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RMdhpXxPqyXAPVixNhSDVl1UV97lfMY1pZnElTe3t70=; b=njrb6Aff+VTj1a
	fOBfsat/8WWWl3nBQieiBEFZDTBTexNIlLzjoTv9Y/rKakNqGrrvOAnbIr1Ad22weFNur4OWt2MCc
	EyMS5VRVSjQdlqBWWvu/NeCkbFbaWO9+uIwGFcHs8P9A5ZKYVOvtlpWsLu8ktzO2thCymiCQkKu8M
	wYevB0wCVKchcxUKMlWdZVVlbJxDkmNdFDT2iIL8u93/bBznK3P2f82cjinMwmrwIdF/cIMSKK5ey
	bwHLlB1+X24SIxG+Mf90lwF9aNPDc4MKSVi9muSv8h9ff51p304RHthNIsaIZqQiJVNakEB1pCFMu
	GooPFEHDCVZyXO2/oyVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8Nix-009dPe-Tf; Mon, 04 Jul 2022 15:10:56 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8Nij-009dFZ-8l; Mon, 04 Jul 2022 15:10:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656947441; x=1688483441;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=6ylrDYKeGR9AhHNvfqkqySkmJ0K4XypnoOT7Jk4JAcE=;
  b=w5UmolqHH02QbhKtXsPuUHBkjI4s638m5YSnZvUhT6siHvKSZoflWksl
   gGvtgiwLayBEyRfKQRVhioTc6zjINMJUd4q6hKif6IWbc0L+p0SR/Yil2
   Bhs/5Th5npIwq2wg+N4QiC4yYFOlGHxnbuoBpwwO7ET/nMcG9lveMJ2Lq
   K2YQ47jJ+XfpzJpAMUJw/7UtP08Xul65nwrqi15DnLqNRHCJwnxSENIJy
   Aa8vZEYCBS3wTDr/V0bZx3G/L7B/KwO0bkB7cBDVE+Fe+hpQG9imtuCAW
   cS1SUypduEYAQCB4Zb8AeSwaHrilKw3fgSvrFXmKNiJTkCYROvcb9owf8
   A==;
X-IronPort-AV: E=Sophos;i="5.92,243,1650956400"; 
   d="scan'208";a="166288200"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Jul 2022 08:10:37 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 4 Jul 2022 08:10:36 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Mon, 4 Jul 2022 08:10:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q8tpRZ6Sf5tOJsGSuoVV96ZcIFp4GHoYxgq/QZiZa+fJRUYGGR+S5NXe9MEKVEhZLZFQVXlkadwJjuo2J1alJwcOPovTRRZd1Rc+TKFKCzSbOrsbjY0m7HD9C26GbmBPxKT2cqz8nFRSBhsiOt8x8Dol5R8tfrT2a72w+5CGXSdD2VWmxCe2m7xZsafkz5FZ2h9jysS3Y8BrmOgQoN0Y+/wtin1nEIbFJau3nvnF6Aqq9XhpNi54G/Y359ACKDlphGBwE2D4H7CC/8isbFG3cyo2L7nmtJC9FiVAUobyB3I/S146G+l6r9uvvGAltK+UDc1Zf+HYYpNiK0oi/NTNRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ylrDYKeGR9AhHNvfqkqySkmJ0K4XypnoOT7Jk4JAcE=;
 b=ZhuP2sgtc9QQElzwfq42fzXnIIUuqqhZSJW/Tfe8YsZPzOLj5diTJoTMvYRZ4twIQEZd739OHBpl2pGiI4/2c9bkkQpwNLntV1BdsjpLq5I2VrTKcmxynyxGFGTIOgrYZf62meSC8i3DkwRolGIT4eN34ifndRI4usT7I61nUpvCXOaxn0Tv091xz6UATIiZZQoSdDWonquoyztTVJHy225dLZoXNKbeHfLXe+x8EbyJqDPfZRhol1TfTvnW6h21ELlMPXg5n/uW7bCAs7F3CMaQgr9HMyd9jB+YC6c/AMqSztqigFMvre12Gdc8dQkGncZ6gpBsbLtoFXOiqMqC3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ylrDYKeGR9AhHNvfqkqySkmJ0K4XypnoOT7Jk4JAcE=;
 b=st0ZYhtdU5OROONkMfFJVf4oekJJhxFu9AxiREQShnCcAq/GoFfdDOFyKKry1pe3nbz6H6Q+oARJKijcdrAZ5Wl47FzL1JmRxNkHV9xf+9VB4YWuTa6GkKio3or9taMOmfLToqwTxWPJRUrHFXWxAQjzQS0XMcKzEYdELjQBzYI=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BYAPR11MB3528.namprd11.prod.outlook.com (2603:10b6:a03:87::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Mon, 4 Jul
 2022 15:10:30 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5395.020; Mon, 4 Jul 2022
 15:10:30 +0000
From: <Conor.Dooley@microchip.com>
To: <sudeep.holla@arm.com>, <linux-kernel@vger.kernel.org>,
	<gregkh@linuxfoundation.org>
CC: <Valentina.FernandezAlanis@microchip.com>, <vincent.guittot@linaro.org>,
	<dietmar.eggemann@arm.com>, <wangqing@vivo.com>, <robh+dt@kernel.org>,
	<rafael@kernel.org>, <ionela.voinescu@arm.com>, <pierre.gondois@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v6 00/21] arch_topology: Updates to add socket support and
 fix cluster ids
Thread-Topic: [PATCH v6 00/21] arch_topology: Updates to add socket support
 and fix cluster ids
Thread-Index: AQHYj48tVAbdjlL6mUiIMD866kQSr61uUUaA
Date: Mon, 4 Jul 2022 15:10:30 +0000
Message-ID: <6a647b6b-c913-b9d7-a23e-b17a8034c5c8@microchip.com>
References: <20220704101605.1318280-1-sudeep.holla@arm.com>
In-Reply-To: <20220704101605.1318280-1-sudeep.holla@arm.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 49b8f98a-9a8b-43a8-819d-08da5dcf55b9
x-ms-traffictypediagnostic: BYAPR11MB3528:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: =?utf-8?B?c0xGWGdIWkxDSGxjVThBaWIwclNRZEQxWnJmcmhrNzkvdWpkSndkZ0pCZFlt?=
 =?utf-8?B?YXZjQVNNYnN4ZHdhdmhSRGw5dEYvOWZFWEd4cXE2bloydDJTdkgvQ2M2Yy9h?=
 =?utf-8?B?aVF0TDJYMmViTDJ3ZFNsRFE2UDRyZUxtZTI2eW9JakRUMUkvYVdMZlhFZEhx?=
 =?utf-8?B?R29EU1JVanZHb0RCTCsySUJIVmRqNWxIMkY0MzU1VzEyMXFhT0JEK1hLUlFh?=
 =?utf-8?B?aEhjRjJJemtlblVqOW5ZS2FDbitHM0hJRmliaDlwM3JsUUV2UUxNUTh1aGU4?=
 =?utf-8?B?WU1HU041WXl3UWxIWFpLV2lTbFhINU9Ec0VUYUFidDBvc1lReHdPRnZDUzk3?=
 =?utf-8?B?NTg3eTR0RERJSnFRSkVoQXlIRVBSekhTOVVWWW1TM0R0QkIrcXdjRFRnN2hr?=
 =?utf-8?B?TUtMSzZMUmNKZ2hjd2l0dGE5djZ1VkNvTFQxNnV1cUhPYStOejhBSVJCYXJQ?=
 =?utf-8?B?cGVMWTUyc0hJcEhvOUFjSi8zbUJDelJEVkdwN1R2SDRpV1YvL2NzVXB1YjRE?=
 =?utf-8?B?c042a0QrN3BVZ2k1UG1hSmY3T3orNjY4aEFOd29rbXFXU1hoMTFmOHFTMExM?=
 =?utf-8?B?RGFuU1FBMTVoODh2aUtYeXFCTm82RzVKelJTc2c2TXZCM1RFMmhNd0xQaDEw?=
 =?utf-8?B?bGRNdDNPVm1XZzVKMlFxMHFjU2s4ZUhBZlNTNzByZTdoaCtSSkNLK1lhSTNL?=
 =?utf-8?B?Z0JIZFpMemNXTnJsWHhrVXZPcFlZWTBvekFzV3BiQnhEdkJnMWNJb2tqQ0Qw?=
 =?utf-8?B?Q1Jwc2Y1TDVRZ2dkNXNhbUFaMndVK053NjRENGZRcEVXbUppdkZEcGpJdFE5?=
 =?utf-8?B?QUdIOENQMUFwRjJvMU95b0k5Z1c2NmJiTm4yTFVnSkVEYnlZTzBOaWpjSWR5?=
 =?utf-8?B?V1diWEJVdWZ1anpjNUkyZHdNRXNvcVkrQ2ZDK3Z0eUdqSWhNR3pCVFhVQWJJ?=
 =?utf-8?B?cnd2WmdGcDdmb2lCWCtnWDdMbklJd0xtM3FlYTZxNUMyL0tsRWsyVE52eHRX?=
 =?utf-8?B?ZG4xU3pJOFlHeStYNDZnOEhFNmkrKzQ0TU9RWEhCZDJCSDQvaDFEc3NzVU9L?=
 =?utf-8?B?c0FXVFM1Y3hQbU5nQnhlZjhZM3VVdEJJaUZubjNVSlBBTUk0OGZxNm9obXhI?=
 =?utf-8?B?c2E2U3l0N05TeHB2eXF1RUhlM3hMQm9Kd2EvQjQwNm5ScW0vYlVOZ09OditI?=
 =?utf-8?B?NDcwbk5CWkY0NFhKQzF2OFdHdGtQc2plUG94K2RrcFczdUc4ZDhaUzJVNzVq?=
 =?utf-8?B?c0lWM3dzbXI5U3hGa3Z5QzJPenZ5WEFLdnA4VzRHeE9LN0hEQT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(376002)(396003)(136003)(366004)(346002)(66446008)(66946007)(5660300002)(64756008)(15650500001)(66476007)(66556008)(7416002)(8936002)(2906002)(86362001)(36756003)(31696002)(186003)(122000001)(38100700002)(76116006)(38070700005)(71200400001)(6486002)(41300700001)(478600001)(91956017)(316002)(54906003)(53546011)(110136005)(83380400001)(2616005)(8676002)(31686004)(26005)(6512007)(966005)(6506007)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MTkzNGRqUVNHZHowTzl1U1U5dXA4MkpRWExaTGN2QzJqUDVSNytYQ1hsajJM?=
 =?utf-8?B?NGtLd2h6WjZkMkJKRWpOa2hVaUU5czk3Q0htbFh5Vjk4dlhwRENpcUpwcTBm?=
 =?utf-8?B?bGlJeCtDWUxCYmdVUzkyTHk5Y2QrOURMLy9KWHZqeW9rT3ZKUXdncGI4K2o1?=
 =?utf-8?B?V0pHVHczM1MxUEtYL09xZXhTVFkrUUpzOXdOS0lRYm1kWW5hRjY1MlFhSXFx?=
 =?utf-8?B?MGprTTcycTlKcVNVcFJjdFRaQXF2VDg1bnBBczRKSDBGRFRTZE9FN1FTRnJy?=
 =?utf-8?B?aTRBelNJN1hwSkMxbzI5cUtpRlJOdC9TcGlnTTJyQndHZDVUSGNWdk15RU1L?=
 =?utf-8?B?TXZIZVl6dFNvTkZRa3hOVWVDL2F6RnUycGtycWV4SnkyYjd1WDBjL0dLbzJn?=
 =?utf-8?B?dEVWWkJEcFlZQ1pHV3c1QWFRSEt6NUZvdWVoN3hDclNoRVRQQ245MnZRdFNr?=
 =?utf-8?B?Vlp4eXVBTnlPYnVKdm1sNTd0T2hZemtHYksycnZPOWorTlQ5SlhSRCsvYkVR?=
 =?utf-8?B?OWNsTUF6SGhDSVUvWnhGazZUNVBsV21zL3RPalRuc1JqaStSRW9DWXVuV25h?=
 =?utf-8?B?SDI1S0tLQk9zN2pJN2FXazQrVFRDZ3EvTDBYRHp5OEwrbXY0RnJEdlY4cDZU?=
 =?utf-8?B?V1ZmY0U2alYwWWxEL0hYaEpsdXc2UzRwYzFYYnVHOUFWL2N4MGprWjZnVzFq?=
 =?utf-8?B?Wjg1L2NYQ0RyYUpqMUlrWnRlNkRLMklsZ2VsczdaY2ZaLzhqVkVJWSsxQ3JQ?=
 =?utf-8?B?QUpSSTVkaytYNm1wbTdCZitTcGwraVJVS08zd0Y4dTF4UG5mazFZQWJwSk40?=
 =?utf-8?B?clRld2IxanJtRXBHREFvanVuNWNTd0xEdmxvdmZCRHVudUhTdm1VYXBXMzI0?=
 =?utf-8?B?VnlQRTZsVVpRT3hWMDVyZWpiUk5KT1ovTXhzWDRzRXpDeUk2NlpKZnk5ZTJt?=
 =?utf-8?B?VVpoK3hsVDIxMm1CVVRLTE5hK1BoR0Ixd0hiZjhnc0U0V0hOSDVzZ3doSmc5?=
 =?utf-8?B?d0tBRW9aMkRDTy9JOHVEVlZ6ZEwzK0tZN1dwTVZ4Q3FXb1dLZnNXb1lmb01w?=
 =?utf-8?B?bDVTck9tOGJSLzFCK0w5Sk8zQk5UaEdiOEVHdTF0YXdJOTN5UVVFYW0rWjdk?=
 =?utf-8?B?Uk5pVzQwc1YrQmlYcTNmWGtROHNoeElhNm13S0VZdEU4dFAvZ1o5NDdjQUNR?=
 =?utf-8?B?cGNMSEVJbEtQZW4yRXVTd05VWkVkZThqTHUwblp0MGhxNXJRRlN0VDgrUkph?=
 =?utf-8?B?cllqN2FJdkdFSGVoMDdSNnVIait3QmZBSnAzZEJyMktSM3FjRGNyaXBiNVJp?=
 =?utf-8?B?QmJKNVZjYytiZXpHbXl2elJTZjJJRG5JSTRFY3ZhQ2tkckM5MnVFUzFFUjFZ?=
 =?utf-8?B?YWtsbkZnZTRPSWZURnFjMTkvOFU5N0laTllHTWZybGs0NTF1UERVOHpyVWJ1?=
 =?utf-8?B?cU9jbzd3L2tsdG5lSmZtZ2M5UUhXYmlsMW1iT1JzOHlDM1dZTmlwRXMwVjl5?=
 =?utf-8?B?UnFIOGVoZVpvRnhsMzA0QVloelVhK3RtMEd6NTg1NllnaEROTlZaOWNhRDZK?=
 =?utf-8?B?NXdtODhOTjdaQWtMU1VHUndtZlAzL3dqVDJ3RjRIS3ErdE5aL3BHN3dDZHJ5?=
 =?utf-8?B?MjRaUy9GVVlxOUhzemJ4ck9RTE1CZGM0b21GdTRRTk9zbVVlTEYvdmpKT3Rs?=
 =?utf-8?B?VTJBTDY0ZkdLM1F5UUtXU1gxakY3VXd3RGdNRWJvOFY3Yzh1N0xTSWNNcmE2?=
 =?utf-8?B?MlVtUWZkdFNTVWhwK1JBcmZGempIQ2o2NHl2Wm5aVEQ3bzF2WlNvOTJKQ0Ix?=
 =?utf-8?B?Ni8xUW8wZ3Iremkxenc2R0pkV2g3R1pVU2dZZjNmN3hTY1BWSVdzcnpIbzZO?=
 =?utf-8?B?TXhOc1BZSitCVldydXMzTHZXUGJLSytYbGpyZXZuTzhsZm16Ymtzajh3SWUx?=
 =?utf-8?B?UW9kbWNBSjJOc2ozcmJNNTBGRG1SM1FMamVZNXhveWZwUXgrTVZjajlXYkFp?=
 =?utf-8?B?WElGSzVjNldKL1FxUjcvOGdtRGJJR0JSODZhL3ZKWWpwVDRUdDJWV1lsMWVu?=
 =?utf-8?B?cVl1K2t3U0grRHM3bmhNQ2lZSDkwbTRnSEd3a0hnNTJWTExhM29jYk1iVnJ0?=
 =?utf-8?Q?vGPTmMBJpAgaKmNqnsqPxp2ew?=
Content-ID: <C37C2530732E4B4AA8D583D390C35246@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49b8f98a-9a8b-43a8-819d-08da5dcf55b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2022 15:10:30.3711
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z5NEOyxYkKHDlRiifngNHCo6VnYd/LMy5w2eI0sfV/bDbbo6gtOg/dGQOFxKisOOobKIF+RwVf1AZ6hy9lpO7uHHjcdFBCic1oqIr+uSFyA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3528
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_081041_624766_D1C63A81 
X-CRM114-Status: GOOD (  31.61  )
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

On 04/07/2022 11:15, Sudeep Holla wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi Greg,
> 
> Let me know if you prefer to pull the patches directly or prefer pull
> request. It has been in -next for a while now.
> 
> Hi All,
> 
> This version updates cacheinfo to populate and use the information from
> there for all the cache topology.
> 
> This series intends to fix some discrepancies we have in the CPU topology
> parsing from the device tree /cpu-map node. Also this diverges from the
> behaviour on a ACPI enabled platform. The expectation is that both DT
> and ACPI enabled systems must present consistent view of the CPU topology.
> 
> Currently we assign generated cluster count as the physical package identifier
> for each CPU which is wrong. The device tree bindings for CPU topology supports
> sockets to infer the socket or physical package identifier for a given CPU.
> Also we don't check if all the cores/threads belong to the same cluster before
> updating their sibling masks which is fine as we don't set the cluster id yet.
> 
> These changes also assigns the cluster identifier as parsed from the device tree
> cluster nodes within /cpu-map without support for nesting of the clusters.
> Finally, it also add support for socket nodes in /cpu-map. With this the
> parsing of exact same information from ACPI PPTT and /cpu-map DT node
> aligns well.
> 
> The only exception is that the last level cache id information can be
> inferred from the same ACPI PPTT while we need to parse CPU cache nodes
> in the device tree.

For DT + RISC-V on PolarFire SoC and SiFive fu540
Tested-by: Conor Dooley <conor.dooley@microchip.com>

Anecdotally, v5 was tested on the !SMP D1 which worked fine when
CONFIG_SMP was enabled.

Thanks,
Conor.

> 
> 
> v5[5]->v6:
>         - Handled out of memory case in early detected correctly after
>           Conor reported boot failures on some RISC-V platform. Also
>           added a log to show up failure of early cacheinfo detection.
>         - Added "Remove the unused find_acpi_cpu_cache_topology()" which
>           was missed earlier and posted separately
>         - Added all the additional tags recieved
> 
> v4[4]->v5[5]:
>         - Added all the tags recieved so far. Rafael has acked only change
>           in ACPI and Catalin has acked only change in arm64.
>         - Addressed all the typos pointed by Ionela and dropped the patch
>           removing the checks for invalid package id as discussed and update
>           depth in nested cluster warning check.
> 
> v3[3]->v4[4]:
>         - Updated ACPI PPTT fw_token to use table offset instead of virtual
>           address as it could get changed for everytime it is mapped before
>           the global acpi_permanent_mmap is set
>         - Added warning for the topology with nested clusters
>         - Added update to cpu_clustergroup_mask so that introduction of
>           correct cluster_id doesn't break existing platforms by limiting
>           the span of clustergroup_mask(by Ionela)
> 
> v2[2]->v3[3]:
>         - Dropped support to get the device node for the CPU's LLC
>         - Updated cacheinfo to support calling of detect_cache_attributes
>           early in smp_prepare_cpus stage
>         - Added support to check if LLC is valid and shared in the cacheinfo
>         - Used the same in arch_topology
> 
> v1[1]->v2[2]:
>         - Updated ID validity check include all non-negative value
>         - Added support to get the device node for the CPU's last level cache
>         - Added support to build llc_sibling on DT platforms
> 
> [1] https://lore.kernel.org/lkml/20220513095559.1034633-1-sudeep.holla@arm.com
> [2] https://lore.kernel.org/lkml/20220518093325.2070336-1-sudeep.holla@arm.com
> [3] https://lore.kernel.org/lkml/20220525081416.3306043-1-sudeep.holla@arm.com
> [4] https://lore.kernel.org/lkml/20220621192034.3332546-1-sudeep.holla@arm.com
> [5] https://lore.kernel.org/lkml/20220627165047.336669-1-sudeep.holla@arm.com
> 
> Ionela Voinescu (1):
>   arch_topology: Limit span of cpu_clustergroup_mask()
> 
> Sudeep Holla (20):
>   ACPI: PPTT: Use table offset as fw_token instead of virtual address
>   cacheinfo: Use of_cpu_device_node_get instead cpu_dev->of_node
>   cacheinfo: Add helper to access any cache index for a given CPU
>   cacheinfo: Move cache_leaves_are_shared out of CONFIG_OF
>   cacheinfo: Add support to check if last level cache(LLC) is valid or shared
>   cacheinfo: Allow early detection and population of cache attributes
>   cacheinfo: Use cache identifiers to check if the caches are shared if available
>   cacheinfo: Align checks in cache_shared_cpu_map_{setup,remove} for readability
>   arch_topology: Add support to parse and detect cache attributes
>   arch_topology: Use the last level cache information from the cacheinfo
>   arm64: topology: Remove redundant setting of llc_id in CPU topology
>   arch_topology: Drop LLC identifier stash from the CPU topology
>   arch_topology: Set thread sibling cpumask only within the cluster
>   arch_topology: Check for non-negative value rather than -1 for IDs validity
>   arch_topology: Avoid parsing through all the CPUs once a outlier CPU is found
>   arch_topology: Don't set cluster identifier as physical package identifier
>   arch_topology: Set cluster identifier in each core/thread from /cpu-map
>   arch_topology: Add support for parsing sockets in /cpu-map
>   arch_topology: Warn that topology for nested clusters is not supported
>   ACPI: Remove the unused find_acpi_cpu_cache_topology()
> 
>  arch/arm64/kernel/topology.c  |  14 ----
>  drivers/acpi/pptt.c           |  40 +---------
>  drivers/base/arch_topology.c  | 102 ++++++++++++++++++------
>  drivers/base/cacheinfo.c      | 143 ++++++++++++++++++++++------------
>  include/linux/acpi.h          |   5 --
>  include/linux/arch_topology.h |   1 -
>  include/linux/cacheinfo.h     |   3 +
>  7 files changed, 175 insertions(+), 133 deletions(-)
> 
> --
> 2.37.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
