Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2B1C32773
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 13:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KXMyitiz/ZUDZxKhPS5qTlwsQVxt760krNwuNI3fDgo=; b=K6yo3XqmXqxSOu
	P/SStQNG/SrMTFaXgyysgoejAaICwO1iCy8+rzzv/8L7gwjn3bhXAkyw3jPGtPOFda8q+uSiCXNbP
	GukQcuq3R7082yKHJwUPX6MTdde75pPPhzlhln25OnaxHVqMpHT0j+Txi3Yw0KIuu00K9Olq7vpoF
	rp6LvoGvbkrndrott0B4CwN6Oi4TqqRIjO0r8odTyYgo6sux2xdpAP0kbMP91tgBIbFcBeNB2uEOq
	cVoMCCcSfmzdJ3BD17JglR2yvsXhEPqdkQo+R++X7oekpEJnB7dpAYYVwSMgLuk8RANJzDZvZ7VVZ
	vmoh+4UOCxhxU1GoLoRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP1qU-008fUY-E4; Fri, 19 Aug 2022 13:15:30 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP1qQ-008fRK-E7
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 13:15:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660914926; x=1692450926;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=eflQw37o37FmagzPujcUQ53RgfqhPVMV9qSDxhqw64w=;
  b=LPcQ3LllSwSjkNvHLLLrBHMv3WIfdUDiLrlXdvWWmRCGTVDtpQ+OMeua
   0YxVNHvsn1SieLyj/+Zn4dRkv2XzTI/d/BwJuhgYFrjFv9IAy1PRGEQlr
   I2iU+cUIVZsgbuDs9LyGp1Acp0b2+/SILyMAKWcWePnT7dzfn0SXisLBn
   z5cvMb0GgJPxWQeLDg8CsBJA8/7PG2xcrpQx9Bv0YRHSk2xmQ9s7Jjd9K
   DBDT9ceKpQjieZy8jG3odb6ymJJPb2cM3buF7R+ChQuL8tP39aOUqpGcx
   WVVCM546jBmSI3GjBI+ile5JkcLcbDh2aBHnclWWoWldhDycGZ56Ik9ED
   w==;
X-IronPort-AV: E=Sophos;i="5.93,248,1654585200"; 
   d="scan'208";a="109797179"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Aug 2022 06:15:23 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 19 Aug 2022 06:15:23 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Fri, 19 Aug 2022 06:15:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oapfos8WSk02C3QrzDPAVkWuBKd2Y0adi7LFE850M8C5zQj0aO8j60RkfSVfDSG6JxL1DdlU+7QAYmqtEmUEP49qDFPs97Vbo/ohnPhG9ZHW0C5gEljHOC1HvtkRf/1Jmrcx135JxoG10GHyDYfcipeFjK7Vcl8s/Uo12b0XukisEXtqHHKS0BPlZAsLQPX09JeBxX45OmrThsEjm+6lcCAssBF3ORDftjqfi+OsAu1XVOU7TEk0x8nu4gaMExG1lVmYk9B4amUnMAca8e6eDpSGP747d32NrsNlPjD/K6XyW4oI7MmpZ+YIOJHUmOYg6EyjTAvhaN87gw5XVQvYSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eflQw37o37FmagzPujcUQ53RgfqhPVMV9qSDxhqw64w=;
 b=Oqo12hGswcKSlLFYCkzjmYIFbFKZUqWpxjp1xzz0/ctabPimPYrt7cG6DNUAed47xSbAg0atZM3u6Jdcpgb+Dm5K0lMZTxqfU9GUNSvRb8R2CbfkkrggVZMNQddYfzDwSv9r/HGK07JgCFgpOiFCdHTnzwwxN5zIaoBHw6depx7AkgA/c4G5lLLHQaS3O/kdMpLx3KhPLMCizcbFMsggMscdyV7Do10xRw3zjqMAQnt7DuedvjQ1zqXdb15lxwSnB4fjmq1r8armqHjWfzbH/xZKDaelKB7UkE3Qpv2JEgzmj5N7+iHYvygWuI+YJam9ipicpIRbdGJlk/Qxpcme6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eflQw37o37FmagzPujcUQ53RgfqhPVMV9qSDxhqw64w=;
 b=Hw8IzaUNB7Oxkm5mAcyDKhNrmAGioSCsHthoKmI1YhyMgERiyHUjAlD1zDSB7aSrLpP74M3Mpv91Qpzcdqj2Up+Bll7lotZ4D3IsH0+zA5SRXGVRErbhIjepT6d/snUOscDkCY4OCsPxZNM+5I8jGmcVf94eW9RuTsE+eNXI1ck=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by PH7PR11MB6330.namprd11.prod.outlook.com (2603:10b6:510:1fe::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.27; Fri, 19 Aug
 2022 13:15:18 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%9]) with mapi id 15.20.5546.018; Fri, 19 Aug 2022
 13:15:17 +0000
From: <Conor.Dooley@microchip.com>
To: <krzysztof.kozlowski@linaro.org>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<Daire.McNamara@microchip.com>
CC: <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 6/6] riscv: dts: microchip: add the mpfs' fabric clock
 control
Thread-Topic: [PATCH 6/6] riscv: dts: microchip: add the mpfs' fabric clock
 control
Thread-Index: AQHYs8dCZDCkQVxYIEq9YtBMJX9yKK22LDYAgAAHm4A=
Date: Fri, 19 Aug 2022 13:15:17 +0000
Message-ID: <3ffba600-bda9-8ffa-a435-9a6f94e072b8@microchip.com>
References: <20220819122259.183600-1-conor.dooley@microchip.com>
 <20220819122259.183600-7-conor.dooley@microchip.com>
 <3df8d4bd-3d38-cecd-6589-ccc1be01b886@linaro.org>
In-Reply-To: <3df8d4bd-3d38-cecd-6589-ccc1be01b886@linaro.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2d3cec93-863b-4750-9206-08da81e4dc86
x-ms-traffictypediagnostic: PH7PR11MB6330:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p1nAi9QtaforTaNZpdXWbLIidLndwiyCMQHKXZsjK4/VhteueHd2YFuxXIfpWFse2oYKFs7NhVU8UAe6A90/Sk3528sd21rW4t3funGzxVScD7h3euc0L/Sgcn86QM1/ufd7UdqCjLENOQSvYfTY2PzKk3QAL/2sj3ZfGlYRd5AfghnCeGihSjshuXCkCBgE6zAxazVbNHEYKXTE1iUic8QD2eNLaYfShCYbv5xPu2Us6wBVg/Zdom5G2dHVQ7T1Pesd9W9Sg9Mghx4bYIWHhDChHALgLGuHcG9wWkYTelvpRnRHbD657HpP+5OymPhdZ0feRsegeoaDdJvsqi8yGKTH36D8jszU3f0AKUAjZgO82xH060YRqF7l74OVrvutorr1knSWzLZ0JM+RKBy7/iSh87+gRw6Nr6LGx5tw8hulOn9kC4pEZEbAfYVyR0mWcAkKCGgEGqi8M9Rd/PQprdVTh9VCuRIRTotnufxCT9WHXFX3lla2goQtFvDnkv/Dwoes+RVppm8c7X3+jhp3nMKgeUV+8a/O5nxn5XaAuFuGNnyKJWmOqUEuWxl1EWEjJzAZxx/ieRxTmDsDsWoah9gZXvmG7kPKzl/2vIR1RjFWBVwFBWQpkywh+xbUNfSYs1Leh/T5W7J9VBZZ12lKv6dFigMMw2MN4UrMXZfAwmHWEPBYdpg26e1vhfM9Ag6JKroxO8cxnihAcnTQ5s03eGaEAv96O7skMjx5Q/yWFyrgMYejTutQQBKEtqickWmqFy4ZtAgdxQJ5QUDAgIvoKkrF/rwmYfC3QOx/kk6DkgZIMeG8lCANwddtvkVe0BT/eZMIGjcUSzXVDqsjW77xtSJuZlQU6iZeEDPr3ysQUyY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(136003)(39860400002)(346002)(366004)(396003)(8676002)(66556008)(66446008)(53546011)(64756008)(6512007)(41300700001)(66476007)(5660300002)(4326008)(66946007)(2906002)(54906003)(110136005)(6506007)(8936002)(6486002)(91956017)(186003)(83380400001)(26005)(6636002)(2616005)(76116006)(31696002)(478600001)(7416002)(38100700002)(36756003)(122000001)(71200400001)(86362001)(31686004)(316002)(38070700005)(45980500001)(43740500002)(86284004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WUhQNVBDK1lsTkNzNGxCYk93QVFKOGpwU0FQejhoeDh6VXdnQUJ0L0luV0Fs?=
 =?utf-8?B?T2J6STlxcGY1cGZkWERMT0NnKy9ZVWNBZmsrKzhyS2hVa29CNXNaWDVjQTRG?=
 =?utf-8?B?Zm5wLyt5UUt3QW5jRHk1ZmNBQWFHblB2bXRrOGYzMWZzeDVMQUZvcVhoTXUy?=
 =?utf-8?B?aDU2Z0R1ZWozWGhadXJsdjJNYVFGa2dub2FBU2wvdnh4MnRLbzMwNmtVbHBk?=
 =?utf-8?B?aVdtNnNxZ0wwWmlDMTJYWVNqNDNNSTBaRlBCdW03VjlWN2V6Q1l6TTJSR2M5?=
 =?utf-8?B?NDhKOTN0V0k1UGpnWUhPZ09vUVBwS1pxTUJobmpBdUhHb1krcG9IcnMrckxx?=
 =?utf-8?B?d0lEU1pUWkNTb0F0WWIxOXVQTXNYbDhOWFZHNVhHQUxaTEJ4L2Y5SHkyT2ky?=
 =?utf-8?B?Q2MxWEN0eVRsemYvVEtCTW85dHZ3NGdzRVRsUllZcC9NU21IRzBqNDBHYWJj?=
 =?utf-8?B?TmduS3dnenRnWmdDYVlndEdUVjcvN1JzSUNOTDNYbkRnRlBYRnNuS3FwU1NJ?=
 =?utf-8?B?YkREdG9qUkFpblgvRW5PeFlzWUlLUVk3T0pwTGFpNEVKR3VwV29FMWl1d2xN?=
 =?utf-8?B?MVJLUXhiTEdGUml1VGRIZkt5SW4wZm9tUHZReVc2SFhWd29Ub1JFOFd4U1ZR?=
 =?utf-8?B?TlpERFA1UmxXckZRa09ZMVJJTHlsRUtXaUVYb01ja0FxV01FNWw2V1FnN0xD?=
 =?utf-8?B?UXlhR0dqenlrRVFtanpyVjZxNmlQQmExUTd4TGc2V3JJZmJjeXBBNzJzWDZB?=
 =?utf-8?B?UWd4ZDlMQWZkS1R0QXE5c2ljK3Z2Mi9zZkJyU2p2MW9TUkJ6RzZMZ1Zoa3l0?=
 =?utf-8?B?VGZ5S3pnK2V3MWc5eWNLNUxtd2Y3U0h1Ykt5UWZMcnNXTGJkWE5IYWN5TFVL?=
 =?utf-8?B?eGt2am5DRmpOVnQ5UnlsaDRYaEd6SHVsTnhtR0RVVXJiRGl2VVhGUnQwT1B2?=
 =?utf-8?B?bFh1aWwybDlZRlNCQ0lPOEllMWUweXo0Mm5SUm5wb1VRU0J0Y2JLSFhmQjdF?=
 =?utf-8?B?ajIrR21wNEhOaVJZMWJsRW9kQndKeThiSTFLQy9YcVF2WW14UG0yMmx1YzNX?=
 =?utf-8?B?Q3lLeVNiLzlWek80dWtvWEFxaVlNeU1yaFBET3I4Z3R1TzZhNmdvcWR3NlA4?=
 =?utf-8?B?T1BjU1V4MVU0dWI1Unh4MXBscnU2cHlLR2tiaXRXeTN4TzlUcTMvdkYwZHU1?=
 =?utf-8?B?NWVMNCtMTytqeGFManNpQkplaWNNZnVVbk90RGVBc2pBd1NiTUMxT0hMY3NH?=
 =?utf-8?B?NzduNkZ2L012Y1E1cW8ycXFDMHdMV3ZJNmlRM294d01NcGdSeUJFN0lZdmdX?=
 =?utf-8?B?Z1lreVVocG4wSHNsQUZQaU5Nc2J6VWdOTGRVb0Vubm1EMVR1RTM0YVhCR042?=
 =?utf-8?B?azR5UnMwNFlNdXVSY3BzSnJOTHBZbkdCY2pEOEJQY3MvZ09vcHZDaW52clpC?=
 =?utf-8?B?TVB1RVp0RDVKOUQ4dEZQV1hFbGxseVo3dG1mOUNwZUNkbXo5R0pvckRVUTZO?=
 =?utf-8?B?TGFhaVp5MXhXQ2pmUnFwaUJvUVk1b2Q3UTdkald6TmJYS3VFTm5MWUh5NlBB?=
 =?utf-8?B?RzBjbTgveXVoYTNTeFRvVXgwSmt3Uk1LYnV1NFhLandvOWU0OUU4djNHK240?=
 =?utf-8?B?bHVGckJhNzZKLzJHWWhTWEQwRFN5MzJqOUlkd2tQUWFLK3BQVkJpODdxQnN0?=
 =?utf-8?B?bXFZM2ZVUE81aHFVUVJZaWsyTFBpK21tWlRxU2NOUDhIdFVPb2w0SkZqbkl5?=
 =?utf-8?B?RnA1NnZoNjBTbmdkekhCTTBqTlV1WUY3RndNWWNZUExUQktrWTZWeVorbmwy?=
 =?utf-8?B?NzQxM2xBU1dTNWJDMW5TbDFweE9xUkJJSzVGS3p6OTQwZ0tVbkFpeExNMGQz?=
 =?utf-8?B?N1N0ZEUrWkpjTVV6c3FMYVpVVUpnRlE1eGpTRkpBdXhTc01KcHlFQk9MV1Q5?=
 =?utf-8?B?bkUzQ3BMQjdNemNzakx2bUQ0M3JqWjZsaU5pejZkVllLajc5cjFHZ3dFOTZa?=
 =?utf-8?B?b1gyU1RsSm1STUx0SnBjaHBldG9hMTkyREVJZWROYTJLM2J2OWdzZkswVERY?=
 =?utf-8?B?VFA5Rkk0aEx5SXN4K1RhdEppUkVOOXVvaUFPa2JVU3JIUERoR0UwNjhRV2oy?=
 =?utf-8?Q?o/JJu00AaHWhiqS2DnTYkkCmw?=
Content-ID: <143B11E6C2D4074DA906BFF1B9AAD5A6@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d3cec93-863b-4750-9206-08da81e4dc86
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2022 13:15:17.8054
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vfuKll9fMQaBH7I77S2UWZOsa+V3kraKFdHeyDTpy4/37Ijv0uHyodMbcEVFSE8BiBL3D4+4a8F4m6qhL0KrrCZ6vl+/4ZNV2HCnPT881uY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6330
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_061526_921260_F5F53D22 
X-CRM114-Status: GOOD (  23.14  )
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

On 19/08/2022 13:47, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 19/08/2022 15:23, Conor Dooley wrote:
>> The "fabric clocks" in current PolarFire SoC device trees are not
>> really fixed clocks. Their frequency is set by the bitstream, so having
>> them located in -fabric.dtsi is not a problem - they're just as "fixed"
>> as the IP blocks etc used in the FPGA fabric.
>> However, their configuration can be read at runtime (and to an extent
>> they can be controlled, although the intended usage is static
>> configurations set by the bitstream) through the system controller bus.
>>
> 
> Thank you for your patch. There is something to discuss/improve.
> 
>> +&pcie {
>> +     clocks = <&fabric_clk1>, <&fabric_clk1>, <&fabric_clk3>;
>> +     clock-names = "fic0", "fic1", "fic3";
>> +};
>> diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
>> index 499c2e63ad35..dd15b6d1a3c9 100644
>> --- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
>> +++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
>> @@ -236,6 +236,38 @@ clkcfg: clkcfg@20002000 {
>>                        #clock-cells = <1>;
>>                };
>>
>> +             ccc_se: cccseclk@38010000 {
> 
> Although you call it "Clock Conditioning Circuitry", but the role of
> this device is a clock-controller, isn't it? If so, node names should be
> generic, so "clock-controller".

Thanks for the prompt reply Krzysztof!
I suspected that this is what I was going to hear back. The reason I
had used the non-generic node name is that I wanted to use it for the
"name" of the clocks in the clock framework. As you can see, there are
four instances of the same clock, and I am using the of_node's name to
generate the unique names the clock framework requires, like so:

# cat clk_summary
    clock
-------------------------
  cccrefclk
     cccnwclk_pll1
        cccnwclk_pll1_out3
        cccnwclk_pll1_out2
        cccnwclk_pll1_out1
        cccnwclk_pll1_out0
     cccnwclk_pll0
        cccnwclk_pll0_out3
        cccnwclk_pll0_out2
        cccnwclk_pll0_out1
        cccnwclk_pll0_out0
     cccswclk_pll1
        cccswclk_pll1_out3
        cccswclk_pll1_out2
        cccswclk_pll1_out1
        cccswclk_pll1_out0
     cccnsclk_pll0
        cccswclk_pll0_out3
        cccswclk_pll0_out2
        cccswclk_pll0_out1
        cccswclk_pll0_out0

Maybe that is me exploiting the "should", but I was not sure how to
include the location in the devicetree.

I had experimented with a "microchip,ordinal" or "microchip,location"
string property to do the same thing but I thought you/Rob might not
like that - is location/placement on the chip a relevant property of the
hardware? I'd argue that for an FPGA, where the user is the one deciding
what clocks what, it could be relevant to some degree.

Knowing if a CCC is the north-west one has some extra benefits as it
is co-located with the PLLs for the processor & has a reduced input
mux range.

Any suggestions would be appreciated, even if it is just a NAK to all of
the above!

Thanks,
Conor.




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
