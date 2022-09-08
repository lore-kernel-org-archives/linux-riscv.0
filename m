Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 214B0C38145
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 12:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ncV9tKfSd8LkyXaLrV8DFswDG7LNLk2lCPzx4w1qfns=; b=ZbgJbmj5MxYldg
	uY4M3HjdNbjI22p7KKgcP+skxUBSI7lKInSF6VOy/6GVogWA7L/aWCe8/8NU2Wy8YMJ/fN1Go68Qi
	fqlaPQv5AYo3iMyMK3Hs7zwj+AioQClMy9j5Igs0yWY21zZqRNwJVDswWkzHI2m+f0K3tp/RnUCmA
	A6ygNcHCjQBoZCivBE866tAfFeyzO1PgNyhbuZd4BAHxKsZEaeqU/tJiBx0wnWffeT4xnRDEBdoyW
	JUFSAIbEUQmceS/gDAoywKTnKbE+gF0mCPa9KVhQXPQQVoVSSkm2taTSoF8FPacLYCSMJ+mWtdNiQ
	T9nZVxbZKsem57wu51gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWGsO-003OxL-OA; Thu, 08 Sep 2022 12:43:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWGsK-003OsQ-4j
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 12:43:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662641000; x=1694177000;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=CdTcFctMeZSRLycC/eoK8wHBGNh/DFwP54Tt1DCSqnw=;
  b=boviMcYVA/46C/5+KDtVvM5d5LnbfciFhQ6DKxj2CHsV5V7P1SLxnjwv
   ssl4JEqAyT1wiTTveGc/mEFoG9GJzUXLXIZ3903lt+mkw0antPyyRT+4e
   3vC+fSWbY9SkJ3mNx7gq3F06XrpNs5hNk5Yr5yVDUi5teBU+8MvoVHjLK
   leofue+oXLmJ2u0k+xXwQJeH/4B/qeVuAqs8AGo78Bf1jS6J3wpArUiQv
   lTGscteZbYgstbGm49wGk4TGKh4cCg+ZwKOrQUeddFCZva7Df2Byr3FHe
   kUkCxZlRdl3bguzvrkl4QbFW7ZyHWKJ6pKOP8Tu8L21b9/F/pEdhLecyx
   A==;
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; 
   d="scan'208";a="179559788"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Sep 2022 05:43:16 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 8 Sep 2022 05:43:15 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Thu, 8 Sep 2022 05:43:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nf5L7lwfGQ3FO6fEomfxlfroLPcNZmDDth0o4R4+lT5Mm/e0IUmwqEBrMccvJtcmSdi0nCI8P/QO+eY8rhE/DnI/mXjWOy/zWsUMGOG8TfsqoHQgrVIBp+CPXqRmT7rTDimu9ujUpp1uFS90SQnVajp6R5lGR05HQ1JVtpRwzmDKccKbjik2KIebElztFnXDbuHwwSUKUNYZTRxcCcUCP+ZbZzcIdpcUdK1qrKQtWkcTLUGmOqjT1rm8X84ykOAxbqMixMDUJ31JjznFhKKMW2w+mtoW3zhRwvsJ+1hIacbAE/uNtecr5wPn+AggmBcM5ZIibO0bn16FktPalXkbLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CdTcFctMeZSRLycC/eoK8wHBGNh/DFwP54Tt1DCSqnw=;
 b=nPN3g0tLk2L7FlLZUIP5YB779zEaekI4+ZKrh+uKAk/IKIn/4KLS/ljVQ3CfJIusfnVGvSnv17LWLUEvI6pJvBUKJCS9mXHHRocaUWrAFjETJ0ZoenTlVOUHlujv8GYMfcV6bwrhzxBLvfY1UZD57FFbLZzPHAmV4nAv1FKV9yDBuSogN06cZo5FYeoOf3mFvxbuKZzT0iOqM5KO4icUJ+YD6g1CmMJyMVAHrF/i9BtONK6KM520KIOg9KHg8MoMWXq7xPRaKwXiYSX2MHBkh/21Ja1zyB0r8+KQGT595p1+QKYjVnA6PBIaU5YgEIkOT1wuYsmqUtMDrfnfR9nUYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CdTcFctMeZSRLycC/eoK8wHBGNh/DFwP54Tt1DCSqnw=;
 b=kJmiIzY3egx+ur6SdH3EKp8y5os/q/VINlOTB02voU3j+u6Wjs7pOFMtdyEXq7oh4mcQE5g3r6cttSfauBJS0oBPhFiplyfiikPnIk/QhK/LMj9xD8I7RuM1C0vf2LVcRb8QFnLXWOCdY1NZnoZdzJdahd4p1VRA/GSej+NFxNM=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by MN2PR11MB4189.namprd11.prod.outlook.com (2603:10b6:208:139::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Thu, 8 Sep
 2022 12:43:01 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5612.014; Thu, 8 Sep 2022
 12:43:00 +0000
From: <Conor.Dooley@microchip.com>
To: <biju.das.jz@bp.renesas.com>, <atishp@atishpatra.org>,
	<palmer@dabbelt.com>
CC: <prabhakar.mahadev-lad.rj@bp.renesas.com>, <paul.walmsley@sifive.com>,
	<aou@eecs.berkeley.edu>, <atishp@rivosinc.com>, <apatel@ventanamicro.com>,
	<geert+renesas@glider.be>, <linux-riscv@lists.infradead.org>,
	<linux-renesas-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<prabhakar.csengg@gmail.com>
Subject: Re: [RFC PATCH 1/2] riscv: vendors: andes: Add support to configure
 the PMA regions
Thread-Topic: [RFC PATCH 1/2] riscv: vendors: andes: Add support to configure
 the PMA regions
Thread-Index: AQHYwdqljaYH7D6050aAz/t+qDALqK3SNfiAgAJOpACAAB1VgIAAlz4AgABEFAA=
Date: Thu, 8 Sep 2022 12:43:00 +0000
Message-ID: <5e894d87-8abb-540d-fbd6-8a1d6f9d0e91@microchip.com>
References: <20220906102154.32526-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220906102154.32526-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <8ecb62b7-53c4-1c43-65b3-567d8c12e131@microchip.com>
 <CAOnJCUKLpRz4Fbx1XiMnap-ELw2k1c8E9V8bZiSP+x7z9Z5QrA@mail.gmail.com>
 <f362eaeb-6ccd-4392-a346-55fa5ae25e13@microchip.com>
 <OS0PR01MB5922833FDCA60892191B211A86409@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922833FDCA60892191B211A86409@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5154:EE_|MN2PR11MB4189:EE_
x-ms-office365-filtering-correlation-id: e455fea0-a20f-43c2-f60b-08da9197aa02
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9c+cNwbbTq+fURMDN59gaMQWyDy3FF+ie1mgan/8PNUsoYQ+asO8M8LPjoCNUJfQnKdPIBF+1HalGwF670haJCNWwp9iDbnnZFTTsLI1szK0qjt9dGgEH7Ex+hE0UjF8doIvoPks6SYsuQqueH+0Ypa6xXJWc67Na4mDdBLahKBva+8p/iq+XG0P4VeDS197Hjvl0Aa01Gon0qq1Orp2Xy93mr/OvXFhIIsLawJh80KfPfKVdagP11b1o4HFs8YmwKNog05EjY/Fs+b4rxVHtECYz59WLCsZj0alxwWtr6ZONI/kgtbh4vWQFIt8VThAcodDuaVoniyeLHJ9KHz3dZ+GDEPVss0AHJ5itwcff9acQlTtEJ7snBXguOxMLBWpnCYJXlpVMOwQUPKN+8KXaGVN8NGQvVs/FNLUGOIDsEQVhUH/kCMusw4N+1+q/ZNM6XHHJdQRH1/KXZLdFNmjHJm5KzUIp2QjMDGemWfLAsCOhOCuZJ1ru1I1vPbb381LkSV1S19SfDfe/K+wgDKBJE3kegGFt5gaMXZDFcbfhCyByi/jmwrLj0PafUmNowsJ/53+Isfn8kexuiGiqFy1Y8c4YFbPY8Oloh1w2Xw5Ck9P4nX3ZNtybdhxH4aqxcU5EfrFrDeOjWriC8iN4nxxiC8gOU4Lf8k1hRMObKAZXNHVQ7EHvsjq7ZVFCBPtTSfAlNy51uu2bcpDP4WP8xv6MkixCJUgv8OArOrIVGMIzmOP2JCYUG+xXQq2XFFLorgwe60fzQl7yEUp2E2nUNCsu34MadDv+GCODijD34fl1G8vmRDvFl/ZzgN4B/Ece4Cv0faFHcZvOJGLN3nu4N42gftcSZooR8vvE5DmkzhFe3c=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(136003)(346002)(366004)(396003)(39860400002)(38070700005)(66446008)(122000001)(38100700002)(66556008)(91956017)(66946007)(66476007)(64756008)(8676002)(54906003)(76116006)(4326008)(45080400002)(316002)(110136005)(2906002)(5660300002)(8936002)(53546011)(2616005)(41300700001)(6512007)(7416002)(186003)(31686004)(83380400001)(478600001)(71200400001)(6486002)(966005)(6506007)(26005)(31696002)(86362001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eVNDczF2QU9oWDBlTXptVzdpWUZ3Ky82SjV0VzhMVmlZSXlHU3oyTWhJU1la?=
 =?utf-8?B?dXNCL0cxQ2YrUDhNb0JXOWxTS0QzQk9HVmZmSjZtU3JoTCt4T1BpLzltZVhy?=
 =?utf-8?B?RjR1NmxTUUw5b3U0cFlYRVNsYTJPbS85NVFTd3BPamppZWc4VWxZT2puczNs?=
 =?utf-8?B?S0MwUktUMVRBYkhJK3h2aTh2Qzg5R1FlaGdqNGN6US84Q2VCSjk2aTI4TWdJ?=
 =?utf-8?B?YmdNS2NnNTZTMXp0cmh1NzZqRXRPcUhKRkkvWlp5RGZkc0RQRTc3bDljaXVz?=
 =?utf-8?B?dXEyQnBpeXV1RjlUQkp4OXJDc2c2RXI1R2pJbEpCWHI4V29qTk83OGVNb1l2?=
 =?utf-8?B?Y05RTnlWYjIyR0ZjbXRramVCanhTanR5c3Y0Wk1uNGp2UHJWZjBWQ2lGeWhs?=
 =?utf-8?B?ZUU4di8xR2NiSUtNeU5mdy83NHRwek1zTTI5Yjk0dzE2THJmdlJDcEpjWkEy?=
 =?utf-8?B?YWlISUxXNUJLZ0lENFk1TlhvNkVySTJ0WStxTzFUTGpJRTEwWGdYN0cybGVm?=
 =?utf-8?B?UGx0T0M5d0Q2VzBBTnRMYnVwd2hsdU5DTzhiL3ZDZzU4SzdVTmhEdjVjUlZl?=
 =?utf-8?B?VHRCQnNmVTg0N0R4V1IzYkNJTmt4UFI2ZnZ1SXRnNS9RL2VSc1lrNldxYU9v?=
 =?utf-8?B?di9ZTXMySnZQMldkU1AvM1Nzc3FVUVBPSDBDaGxWSkE0clRVbjBFVWNxdDZz?=
 =?utf-8?B?WFlUMnl2TFIyblcxb2lHZy9IOWtKcGY1bFZ0WGEzZHFZZzZWeUdQQkQwdVo0?=
 =?utf-8?B?d2phTjlGbjgvS2JPRkFmdUN1dkxYbDdjcElueDZQRUI1V2pnM05XVkpscmE2?=
 =?utf-8?B?UFB3VndnRXBvOGg0L2tlSlFDUFo4TjZYSzFlcVdWY2Y2aGk1ZzBOME9lQUtj?=
 =?utf-8?B?ZXJPdHdmMk5QR2k0WEY3WFc2cnp0Q1k2QUVaTytBaFpXY0R3ZjV4NStKby95?=
 =?utf-8?B?S1N0d1p5STA3NjZlcFU4YlFzc29MNlhVMG5TR003ZytGUGd3ZGxvTW5tSEpZ?=
 =?utf-8?B?cTRaOVk2YzIySXNsQjdyVnhHRFR0VG5TVDNrZG95YlhTUGdTaFpvYk45ejcz?=
 =?utf-8?B?VXJCd2FqVE1DV3hITkpZWFo4dmEwTEZ3RHNBRFlBR1A3L2pxejJpK0twZGFP?=
 =?utf-8?B?VWdPQ3FjdTVVbU15THZhaDRXeWZIS2NtNXVGTEVZUFB1OEF1YUdtMmRvb3Ez?=
 =?utf-8?B?SmhJcW13aU1xNTB4WW1Ka3lwWE9TTUNpTkFQUFRRWjhpMkp1WC9LeFYzNEJn?=
 =?utf-8?B?VjB6UnV0N09mRkEvSGd6M2lDRjZJeHhLTEpKWklOZlJOTmltWUhWT3pIb3ZO?=
 =?utf-8?B?eEorOFVQN1F5cE1pYWpVSVJEOUhnZjBWakI0SVhIS2RHREE1elBzeE1NRHZn?=
 =?utf-8?B?eU5ESzdERk5DVWpITkMxVXZTN3N6WTRrQTdkK2hBVDBzb2RoVEJpcUxPZmFC?=
 =?utf-8?B?RXY1RVBYWit6WEdkSnR1UHpMbGZ3dzdtcW5JNTh2UUJzVzhLVHoreU5rVTJn?=
 =?utf-8?B?bVRMS2VXbGpXdVg4TEd6L2lsazhNbmYvRm5YeCtpTnYrUzkrRkJsYjBVY3J6?=
 =?utf-8?B?Rnk3eXc5SXJzeHFoVHlkQUlhQ0JITFcxdWV0ZytrUnB4V1RXdFdwdis1RW1R?=
 =?utf-8?B?REx1dTFscytFdG5EcUdJd0JmKzFYSGZVd1k2TUQ3cW9TRTBuUko3TkZ1RjM1?=
 =?utf-8?B?eHZhU1lVRDhtUjBGSFl3SHRnTldpNkhheHR3V2JlUk5zbkZzb3BWL3ZMMVoz?=
 =?utf-8?B?b2MvaEJ1ZisyeEFQbnlyM3k4cmN3RlBJM2U1TGlMc08vZW1ubnpUNlJWYThT?=
 =?utf-8?B?MmRHN1V6YUllZ3hyUy9HVUZnZWg1T2N1WDVsSWFIWVMybU9WVHY2KzhkTWYr?=
 =?utf-8?B?MnBsTTBpZWpSYy9vdENONzBxT0dLd2F5Y0hsOVJHNkNRVTU0Vi9kcWNLVkRy?=
 =?utf-8?B?dWtiOTRDajI4MENwc3pQblM0MXFQYXp6U1d5QkNTM2tNUXVUZ0Y4ZHRvMlZ2?=
 =?utf-8?B?NnVscTk2SDl4dDFBSWt0T21NODlHS0JZMFF4UXBtVVpzM0JlNHg1SVF4TXJo?=
 =?utf-8?B?cTBxSWwzS0QrTWFha01yRzVlUlFOYU1VaHBqM2NpaTFGYmM2eVZmMkQ4S0V3?=
 =?utf-8?Q?KjW0ctXrAMpi4e4IBXWBaDdc8?=
Content-ID: <A38D3DCC1F00A448A199BA8D84517530@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e455fea0-a20f-43c2-f60b-08da9197aa02
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2022 12:43:00.4131
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: axgrj5gSNNfb2ZqcpTaI5SYAKqQEi9MTyX9qPeBEDBhvUOQCrDbmYv6ccpUlrBEXUI8Yii3ORcusgunxYQb3F5UjgHwYnjucaWCE8vArWBY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4189
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_054320_225754_7ABA0242 
X-CRM114-Status: GOOD (  20.41  )
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

On 08/09/2022 09:39, Biju Das wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi Conor, Atish,
> 
> What RISC-V devices you have?

A bunch ;)

A __couple__ PolarFire SoC boards, HiFive Unleashed, D1 Nezha,
Canaan k210 MAIX something & the VisionFive.

> Ours is RISC-V uniprocessor without IO Coherence Port.

What does "IO Coherence Port" mean? Zicbo*?

> Currently USB, ethernet, SDHI/eMMC doesn't work with standard
> DMA api's.

Sounds pretty similar to the D1 so.

> On RISC-V world, how do we handle DMA api for uniprocessor without
> IO Coherence Port?

If you do mean Zicbo* you're into errata territory there & I don't
know if that'll be acceptable upstream - not for me to make that
call...

Thanks,
Conor.

> 
> Cheers,
> Biju
> 
> 
> 
>> -----Original Message-----
>> From: Conor.Dooley@microchip.com <Conor.Dooley@microchip.com>
>> Sent: 08 September 2022 00:38
>> To: atishp@atishpatra.org
>> Cc: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>;
>> paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu;
>> atishp@rivosinc.com; apatel@ventanamicro.com; geert+renesas@glider.be;
>> linux-riscv@lists.infradead.org; linux-renesas-soc@vger.kernel.org;
>> linux-kernel@vger.kernel.org; prabhakar.csengg@gmail.com; Biju Das
>> <biju.das.jz@bp.renesas.com>
>> Subject: Re: [RFC PATCH 1/2] riscv: vendors: andes: Add support to
>> configure the PMA regions
>>
>> On 07/09/2022 22:52, Atish Patra wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know
>>> the content is safe
>>>
>>>
>>> On Tue, Sep 6, 2022 at 3:40 AM <Conor.Dooley@microchip.com
>>> <mailto:Conor.Dooley@microchip.com>> wrote:
>>>
>>> On 06/09/2022 11:21, Lad Prabhakar wrote:
>>>
>>>> diff --git a/arch/riscv/include/asm/sbi.h
>>>> b/arch/riscv/include/asm/sbi.h index 2a0ef738695e..10a7c855d125
>>>> 100644 --- a/arch/riscv/include/asm/sbi.h +++
>>>> b/arch/riscv/include/asm/sbi.h @@ -37,6 +37,7 @@ enum sbi_ext_id {
>>>>
>>>> /* Vendor extensions must lie within this range */
>>>> SBI_EXT_VENDOR_START = 0x09000000, +       SBI_EXT_ANDES =
>>>> 0x0900031E, SBI_EXT_VENDOR_END = 0x09FFFFFF, };
>>>
>>> Everything else aside, I am very interested in what's happening here.
>>> I'll take a proper look through things later, but for now:
>>>
>>> For PolarFire SoC we have an InterHart Communication SBI EXT that
>>> would would like to upstream support for. We are not aiming to put the
>>> driver itself in arch/riscv - it's just a mailbox driver, but I would
>>> like to use sbi.h for defining the vendor id etc.
>>>
>>> I am not sure how this all aligns with:
>>>> We'll only accept patches for new modules or extensions if the
>>>> specifications for those modules or extensions are listed as being
>>>> "Frozen" or "Ratified" by the RISC-V Foundation. (Developers may, of
>>>> course, maintain their own Linux kernel trees that contain code for
>>>> any draft extensions that they wish.)
>>>>
>>>> Additionally, the RISC-V specification allows implementors to create
>>>> their own custom extensions. These custom extensions aren't required
>>>> to go through any review or ratification process by the RISC-V
>>>> Foundation. To avoid the maintenance complexity and potential
>>>> performance impact of adding kernel code for implementor-specific
>>>> RISC-V extensions, we'll only to accept patches for extensions that
>>>> have been officially frozen or ratified by the RISC-V Foundation.
>>>> (Implementors, may, of course, maintain their own Linux kernel trees
>>>> containing code for any custom extensions that they wish.)
>>>
>>> Which is in:
>>> https://jpn01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdocs
>>> .kernel.org%2Friscv%2Fpatch-acceptance.html&amp;data=05%7C01%7Cbiju.da
>>> s.jz%40bp.renesas.com%7C7fd3275accdb450e547a08da912a0042%7C53d82571da1
>>> 947e49cb4625a166a4a2a%7C0%7C0%7C637981906834865446%7CUnknown%7CTWFpbGZ
>>> sb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3
>>> D%7C3000%7C%7C%7C&amp;sdata=YAV2Ahz7TFMJJ3wCj%2FAdDuDEcPq0kXXL%2B3o6FA
>>> d0%2BUI%3D&amp;reserved=0
>>> <https://jpn01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdoc
>>> s.kernel.org%2Friscv%2Fpatch-acceptance.html&amp;data=05%7C01%7Cbiju.d
>>> as.jz%40bp.renesas.com%7C7fd3275accdb450e547a08da912a0042%7C53d82571da
>>> 1947e49cb4625a166a4a2a%7C0%7C0%7C637981906834865446%7CUnknown%7CTWFpbG
>>> Zsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%
>>> 3D%7C3000%7C%7C%7C&amp;sdata=YAV2Ahz7TFMJJ3wCj%2FAdDuDEcPq0kXXL%2B3o6F
>>> Ad0%2BUI%3D&amp;reserved=0>
>>>
>>> It is unclear to me whether that is just for ISA extensions or if that
>>> covers SBI extensions too. At least for us, since we don't touch arch
>>> code there is relatively little friction & there's no concerns about
>>> reducing the portability of a kernel since it is just a regular old
>>> driver.
>>>
>>>
>>> It covers the standard SBI extensions as well. However, I don't think
>>> this includes a vendor extension as there is no freeze or ratification
>>> associated with vendor extensions.
>>>
>>> It would be good to discuss the policy around vendor SBI extensions
>>> during LPC as well. We also need to discuss the ACPI policy as well.
>>> We most likely need a BoF to discuss these adhoc topics. I will check
>>> if we can schedule a BoF in advance.
>>
>> I did briefly mention this to Palmer on IRC last night, just was busy
>> today & didn't get a chance to reply here. The indication there was that
>> yes, this paragraph did cover SBI extensions - which would make vendor
>> extensions not permitted upstream.
>>
>> We (microchip) are "only" doing a few ecalls in a driver but this seems a
>> fair bit more intrusive since it is in arch code. Even if the answer is a
>> "no" - a no from the horses mouth rather than on IRC & maybe some
>> rewording of that doc to be clearer would be nice.
>>
>> I'd be down for a BoF, even if just to get a "no" in person haha
>>
>> Conor.
>>
>>>
>>> I was planning on cornering some people *cough* Palmer *cough* at LPC
>>> and asking him what his thoughts were there.
>>>
>>> FWIW this is what we have been doing:
>>> https://jpn01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgith
>>> ub.com%2Flinux4microchip%2Flinux%2Fblob%2Flinux-5.15-mchp%2Fdrivers%2F
>>> mailbox%2Fmailbox-miv-ihc.c%23L27&amp;data=05%7C01%7Cbiju.das.jz%40bp.
>>> renesas.com%7C7fd3275accdb450e547a08da912a0042%7C53d82571da1947e49cb46
>>> 25a166a4a2a%7C0%7C0%7C637981906834865446%7CUnknown%7CTWFpbGZsb3d8eyJWI
>>> joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7
>>> C%7C%7C&amp;sdata=seNiuv6EsY1u0SIT33%2F0CWHJu401d5zSaNmVb%2BUHKPM%3D&a
>>> mp;reserved=0
>>> <https://jpn01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit
>>> hub.com%2Flinux4microchip%2Flinux%2Fblob%2Flinux-5.15-mchp%2Fdrivers%2
>>> Fmailbox%2Fmailbox-miv-ihc.c%23L27&amp;data=05%7C01%7Cbiju.das.jz%40bp
>>> .renesas.com%7C7fd3275accdb450e547a08da912a0042%7C53d82571da1947e49cb4
>>> 625a166a4a2a%7C0%7C0%7C637981906834865446%7CUnknown%7CTWFpbGZsb3d8eyJW
>>> IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%
>>> 7C%7C%7C&amp;sdata=seNiuv6EsY1u0SIT33%2F0CWHJu401d5zSaNmVb%2BUHKPM%3D&
>>> amp;reserved=0>
>>>
>>>   The IP itself has not stabilised yet, so we have not sent any patches
>>> yet, but we do intend doing so...
>>>
>>> But yea, I'll take a properly look at what you're doing here soonTM,
>>> although at this point it may be the other side of LPC.
>>>
>>> btw, where can I get my hands on your hardware?
>>>
>>> Thanks, Conor.
>>>
>>>
>>> _______________________________________________ linux-riscv mailing
>>> list linux-riscv@lists.infradead.org
>>> <mailto:linux-riscv@lists.infradead.org>
>>> https://jpn01.safelinks.protection.outlook.com/?url=http%3A%2F%2Flists
>>> .infradead.org%2Fmailman%2Flistinfo%2Flinux-riscv&amp;data=05%7C01%7Cb
>>> iju.das.jz%40bp.renesas.com%7C7fd3275accdb450e547a08da912a0042%7C53d82
>>> 571da1947e49cb4625a166a4a2a%7C0%7C0%7C637981906834865446%7CUnknown%7CT
>>> WFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI
>>> 6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=AaMGs%2BqRpuw8MOWci3qPvJ1W5U296Vp%2B
>>> higFxDSoHmo%3D&amp;reserved=0
>>> <https://jpn01.safelinks.protection.outlook.com/?url=http%3A%2F%2Flist
>>> s.infradead.org%2Fmailman%2Flistinfo%2Flinux-riscv&amp;data=05%7C01%7C
>>> biju.das.jz%40bp.renesas.com%7C7fd3275accdb450e547a08da912a0042%7C53d8
>>> 2571da1947e49cb4625a166a4a2a%7C0%7C0%7C637981906834865446%7CUnknown%7C
>>> TWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC
>>> I6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=AaMGs%2BqRpuw8MOWci3qPvJ1W5U296Vp%2
>>> BhigFxDSoHmo%3D&amp;reserved=0>
>>>
>>>
>>>
>>> -- Regards, Atish
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
