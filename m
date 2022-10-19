Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4BF1C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Oct 2022 12:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KtFtYgXdBbwa2kadEgK9XzvQwlTZVNWWBNarpYFef2g=; b=j+kzUwCggwpjiO
	I7ostpPwHVmfSOJaCz/2B3ONZHdR9NK2q9Dd6h3RysQLnkf/M9UTtXsxGEXuw6IpmU11/k60Sso1F
	THtsQgKG/6KPEva5tpxTm3hmSFPEsndRzZCdmAgj7omah4wlZtHEbj8ScuymS3g4K8Lgz85g34oql
	fOl2bxlmQTryTZbW28o5ec5YRTv6kbWD7ZJsUFIz91rnETjGglMa9krTC2BMzRErs04H8SMu5sbxj
	XS6Jx8JzQQLnEay4e/yvA0q6+mAIAtqpGYwcUsN1cBjv+sf43bjGslJD8xCqm6l/Pv2IFmTQl1+2K
	U47iAgW81j6EGWaY6EfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol8Im-001X9Z-Rg; Wed, 19 Oct 2022 12:36:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol8Ii-001X93-Ai
	for linux-riscv@lists.infradead.org; Wed, 19 Oct 2022 12:36:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1666182960; x=1697718960;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=du9UDdwrXXr1YE0tQegPHyHCBuiDQbobtfIWKP9z598=;
  b=siBMHt2RwcbI3u5ZYiUQ4rm4FoX6anWhjeZb0+3nKj+FXF0CxrdHpnB8
   OD/fGZp4hAKSmlf26VzeSsYFQHjyXqliz5GB2uRZXaNto/F0TNTOBW1R1
   BSidlQ9wQt7BK1sbs4WVQb2/Ke1OYkWXANmmcZmDDvg9E2sRhtNKO9rzJ
   TcU5JsJOXXu5y0unn7LP4fDPA2TWQsXGrk8e+5y2MA1rfCZe1vjSqaslI
   aP/lhIN16IMywt+LO7W7Mt4/8qDTJnKg6Kr2NrZjjKd9xg8NbabuLSe1Z
   DKMo/PfpQ7e+Ugmhvd8l8n76pzVWos+RPvbCijyXZBh7Yw/IevRvNtUN2
   A==;
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; 
   d="scan'208";a="182933124"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Oct 2022 05:35:59 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 19 Oct 2022 05:35:50 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Wed, 19 Oct 2022 05:35:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cbt1j7LEOsKnBNn6jatdJ/jFMc3UHcIlJ5fUi4hWacAOuKBh82C8RsE522+oqtQvidGhmoGzyJTXTUQPGAjn2u6T8XGe3zN5oiDAN01ak7j0RzbzZ7ctfpulkvMkKr30hlNRDm/k21cFB1091UQi7pNg3BQH6DZ0eqGuDLfHRnTprONqQHAy9wAKqi3v3/UgJ9ZRxfrevYYKOMsihy37cVPkIRvdqmQoEqTd3B+/mhRne49qaMTuqPxLCtlXk/qnh+hhVLuXK1H4t56HkA4QMiRKx76ZjIWPzq6a/2YQQG+9A5IS0jSDLnRrWz2jLy2Km+w++oN7zL31KFg3uQv+bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=du9UDdwrXXr1YE0tQegPHyHCBuiDQbobtfIWKP9z598=;
 b=PSRMED7VhPOI7SJLPCgYG8T4kaXmom4W0CDwH1uhtDwvPYt9K3gtgTH1pxK0J4bNGl0FGpTbSAXyYc5KViwdV7K1eA5m+aTteijBtXePADfW0cw/CP3tBWcUUkxRe690cSFE6Y/PK4vtjmxlpbM8smk8UG/4Gv7s6sSaZgRBU/15WYcoj3Y6P5QYTQJ35ZhdKPkqGX15L4wslz4Oe+2jhgf8aWUmQeLLxDibvPeDkQ3HMwaS2tmKU3qa4h6oQeQY2a539HL9IXTismMEOhMmLz5/yyRgBZYEO1QmUD3m+t3jhkvvgAaPBnfdHz/YRQlNLg+yMg8MGVzz9UQQ4UDvxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=du9UDdwrXXr1YE0tQegPHyHCBuiDQbobtfIWKP9z598=;
 b=P7PqhiM46w0vdL/7PAWJWqr8Ph/NnMs6NsvaVRVTc1s7o0gJ7Bnzuyjum7RvKwZTvy5U7dj6rz4SrbypgNMT6b48+hoT3GymRDKn6sc+xTr6RxCGEjBQPjwCmryTAHup+jGJbFpT8p/0CcEPbaGaZFYRGNCpwN/htd7ReSuRT08=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by PH8PR11MB7024.namprd11.prod.outlook.com (2603:10b6:510:220::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Wed, 19 Oct
 2022 12:35:43 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::1304:e061:45a4:23e1]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::1304:e061:45a4:23e1%5]) with mapi id 15.20.5723.034; Wed, 19 Oct 2022
 12:35:37 +0000
From: <Conor.Dooley@microchip.com>
To: <heiko@sntech.de>, <palmer@dabbelt.com>, <paul.walmsley@sifive.com>,
	<apatel@ventanamicro.com>
CC: <atishp@atishpatra.org>, <anup@brainfault.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<ajones@ventanamicro.com>, <lkp@intel.com>
Subject: Re: [PATCH v3 1/4] RISC-V: Fix compilation without RISCV_ISA_ZICBOM
Thread-Topic: [PATCH v3 1/4] RISC-V: Fix compilation without RISCV_ISA_ZICBOM
Thread-Index: AQHY47S/3UtRjYha3E2B2m30lp7pmK4VpdQAgAABRoA=
Date: Wed, 19 Oct 2022 12:35:37 +0000
Message-ID: <2045deec-09a5-c696-dee1-f2c7457fbb18@microchip.com>
References: <20221019121622.179024-1-apatel@ventanamicro.com>
 <20221019121622.179024-2-apatel@ventanamicro.com> <5869751.lOV4Wx5bFT@phil>
In-Reply-To: <5869751.lOV4Wx5bFT@phil>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5154:EE_|PH8PR11MB7024:EE_
x-ms-office365-filtering-correlation-id: 620c3aed-d8a8-422a-151b-08dab1ce6cae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: X7egvodF06ruF4siYLGca/imZF5dNAM31G8lpTSRPaSB6NuPBisrMsprH0eQkfezyivN+Ay0BS8NkRfDYzSV31Moq+Pku7cOpt4AP1WQ6OUi0XgY4cxrW45hWVvlniYMBwlkQ2YqsTvBz3Ql/sS48KeKB0t/g2vIJ2FLzFKOm9sAU6s1PN46W8/AWjHyZg63UcW47/vipl7sbdutkxRKaGC92B/SP2AuqH3MNYnNQTjZc6utKz1YZ5J1GqJaDtLzAecqCN6BUGAs0x0OPIIH6AQtXSOrw9WbjxyZcBzhNDZJ9n+2oOju1e2PfV+K2aZEfGSxImlhwfVhmvLuTJzQ3cfqTfxHz/Dcn+3wZ5wMMZy0+mo74Zl8brfqjmRq+MGpc7SEElOZqaGzlZJgeDTjdjuLhNbj/jYeIZAtHNoETsGCDRXTm2L5iHkRDAFJYdIoVdruP3cvUft0CoXNCssRCL6BgFgjSpNXek++Lfd/8kMGfyg1I3OZLLH11vlhfwK+YwwoINoceF8N5ijNsp6pgL9ya0zq2BciHbtgyTghld5uWBaNc0XN2Vm0UBBmDRw80dBtRlM6qCMEbbyLXGw+vCGG8oGuMT8mVLFyqW9aeeujcy3XLtwFMzJEdmlAevZYS/qZCqzyrmGSwoUeY9Adf91Oln9qkTGkYIqnz5dLUWYZVPemmeYqU2CIfG+7zXC+W4E+xtI6cvZ37IuWyhfNrNgAEFlQ6mtpNLG1jB2Ddq7aB8mVlowsbq2plWfbeTrxGl8nr+UJz4SFpTliZ/05s4HYAjLCIYWW12fsb33TFUpwDYK419X3RkdTPruXozb2E2LZIgvdXpjAet8HhXEOM6U+uL6Z9hYjwePtgpgWYe0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(366004)(346002)(136003)(39860400002)(396003)(451199015)(26005)(41300700001)(6512007)(66946007)(38070700005)(478600001)(2616005)(186003)(36756003)(2906002)(6506007)(7416002)(8936002)(4326008)(5660300002)(31696002)(86362001)(53546011)(38100700002)(91956017)(110136005)(316002)(54906003)(122000001)(66446008)(966005)(71200400001)(6486002)(8676002)(64756008)(66476007)(83380400001)(66556008)(76116006)(31686004)(66899015)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aVd5b3RXbldpYnNiNjhDajhWc0VDc203Z3Y5ODRpdlJselp4RlpuMnZJQnQ4?=
 =?utf-8?B?Rjc2d3JzajdDV3JycDl4YXlCL09xaStiSVpNSGlCZ2dTUDlvNG5HTkRoenVw?=
 =?utf-8?B?NHVRSk5Ua0F1ZlhmRG9wVTFreWFXVnVCMlMySWN5UEZEZDFNU2NXNmpKamQx?=
 =?utf-8?B?dzh5a29XK3liQmpwbFNkY0FSTGg4MTRkZUg0NTQ2RG1iWGdNODJtTnNGRzV5?=
 =?utf-8?B?ZkNMbzNqQlVsb1VncWNEV3JzUlBLWVpyNlZTMElvdFNwd0JsQVQ3SHllTEIy?=
 =?utf-8?B?R0IzczlIRXdQd2k0NTErakxDakhuYjQ5NHZEWnJtWit5bS9rNlVUYlQzTlNp?=
 =?utf-8?B?V2VrU3VNQzJoNUE1RE9uQ3NaUmwwYTNaR3Nta1NMTDBYdzZWRjVkZENLUTlO?=
 =?utf-8?B?WTBuTjdvU3Q3a2FIc2hYeFpmNXJvakYyWGhnYVkvVUREcTdJV3Vsc0krYVl1?=
 =?utf-8?B?T0NPZWU4cHJXZlRTaSs1dVFQalNvaVhDZmZLWTBuREZDeWEzbng3REFKTHBY?=
 =?utf-8?B?UHQzczhacytTSW9oVi9DY3FEQy8yNmEwOXVrS0NleS80YU1PMW9ocE5jQ3Zm?=
 =?utf-8?B?TlVNVjV5R0pIbVVOQmphWHVzaVlTdXN0a2k4ZkJkWHB4QzhQVXRSYjVjcksr?=
 =?utf-8?B?Vjkwc3J2emE1d3dXdWcrNFJzckhmWkFYbXJXbi9jcFNiWlFlVTJzT1ZJVnBJ?=
 =?utf-8?B?WWRXYTZHL3lDcDY0Wm1UU3F0VUIrMitaVG00cmhtcUF1WjdzQWVMbHl5SUNx?=
 =?utf-8?B?QXA2emsxc1dMQWNyMzBBeTZ4MmZnc0hqVWhJSExBbkt0UlNRbkpRdm1TeUR3?=
 =?utf-8?B?M2dHSkpzOGVzUEtvakt1bVpTK0swTkdsSHRMTUpsY2Y3SnV4WVQzZ1dMWUF5?=
 =?utf-8?B?Yi9haEhIMm1uOXR0ZllaMHNubGtmWkN6VlIrM3NER3g2bjNDTFhmdTBoRWJk?=
 =?utf-8?B?SDhhUDN4ODhRZnQ3NmJDK0pqN2lDSzB3NFhHaXc3Y1NweVFHTGFyUzJGdisr?=
 =?utf-8?B?N2YreTVweks5a2dOYVNQenh0VGNlQS9TcmNTY2duY1ljd3dZaWZ6QkR4STh5?=
 =?utf-8?B?WmlDMm9IazF1NnVHQ0crclNRQTdsaHBDNHVIdGpuTVFhZDIwRm5zd3E3SEp2?=
 =?utf-8?B?L21KdmordDJKb0JuWjV4eEQwT2E5c0VVOXRRWWxpYzV4b3ZYYmxJNjdRa2E5?=
 =?utf-8?B?TVhBMExwUWRWUDJScVdEcnQxR2htc283ZFYxOGMySk1kc1pPVCtRMWp3aDlC?=
 =?utf-8?B?bW5NVWs2Z0RhRklNa1hGR1E5WjJ6akFpQlhwYWpubStMYmRwK3JDWWgwZzdE?=
 =?utf-8?B?ZkN2OXI2dUpNMUg1SGV5dnJsSzM4NUJTMTlJME1VdnFBVWhhMWRCanB5eGpi?=
 =?utf-8?B?Sm0zQ1BYbU5iOE9HSWlYUklUSEJEakFscXRIV2pKeCtLR3BKdFB2d244OUls?=
 =?utf-8?B?ZzV2NmVKZkQyb1paSjYzUjhvblBmdjk1cVN2R2J0c0JSelV6WU5kM0gySHli?=
 =?utf-8?B?U3R1SFVycnFSMTVYSTlGMVo4WUVwelNGNlJHRHNteitna21iQVU3SjBBVkJv?=
 =?utf-8?B?azhscnpLelZZSHkwNmFTaFpBK3ZNWHg0aGRtQ2h6UUZGSWRZemNoZlhUVU0r?=
 =?utf-8?B?ajFLRkxLRFRmSmRhZjlQRHVlVmE3OUMvL3JMZk5KYTI5a1dLcnE1VU1kRFBi?=
 =?utf-8?B?eXNOSUgyV0F1c2VhR2tEdE1jNjNMUUMzUWt5UTJ6RGdZcGtNUXdrRkszb1pv?=
 =?utf-8?B?c3h6WjdtMVdidU4zWU9QNlhhTDVseFhrMkpWTE82MTBXTkVhbDBxaWhlR0JY?=
 =?utf-8?B?eDZTMDVuZTU1cDFDRVlIU1lWK2dMN0NRd0t3aWhDaUg1cEhpTUlac0Z0SjFL?=
 =?utf-8?B?SVlDQ09oVGt2S20xWlp6T1BrV3ljOWwxbS9jSE8vdGtodHJ6SDgrVnh6Uk5a?=
 =?utf-8?B?R2lVTnR4akFtM015azRKRVBBRXE3SlV5Z1ExT1dSWjJtZk0zT1h4S25Hc0E4?=
 =?utf-8?B?TzlBZjVRZ0czT0FYWXI5cHJtMHFJaVdVVkoxRWRGK1crQ2VjclN1ZDNON09h?=
 =?utf-8?B?MmcyN0wyR09ya1drbzZ5WkFzMnFzTkY5elpJWmFEdnNKMFgrc0F2d0NRbXFj?=
 =?utf-8?Q?nSGHDCeWoB0zMH7SPxsEAiXU5?=
Content-ID: <39C2FE60D2692141BE4A3159F4F61714@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 620c3aed-d8a8-422a-151b-08dab1ce6cae
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2022 12:35:37.0761
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XfYfFkLpOchKhUd4Vrt4A5xNjfy+5XJUWMdRlpnTLIFj3JSFu/lvBYJpwgVOCTrd/SaCrcvcDZL1gvsFkFPSMTXlrk29s8IA0xM5yyTCfds=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_053600_686177_3A153448 
X-CRM114-Status: GOOD (  24.81  )
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

On 19/10/2022 13:30, Heiko Stuebner wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi Anup,
> 
> Am Mittwoch, 19. Oktober 2022, 14:16:19 CEST schrieb Anup Patel:
>> From: Andrew Jones <ajones@ventanamicro.com>
>>
>> riscv_cbom_block_size and riscv_init_cbom_blocksize() should always
>> be available and riscv_init_cbom_blocksize() should always be
>> invoked, even when compiling without RISCV_ISA_ZICBOM enabled. This
>> is because disabling RISCV_ISA_ZICBOM means "don't use zicbom
>> instructions in the kernel" not "pretend there isn't zicbom, even
>> when there is". When zicbom is available, whether the kernel enables
>> its use with RISCV_ISA_ZICBOM or not, KVM will offer it to guests.
>> Ensure we can build KVM and that the block size is initialized even
>> when compiling without RISCV_ISA_ZICBOM.
> 
> either I'm way very low on coffee or something is strange here :-) .
> 
> I can fully grasp the need to init the cbom blocksize for guests, even when
> the main kernel isn't using it, but below in the patch itself it is still:
> 
> +#ifdef CONFIG_RISCV_ISA_ZICBOM
> +void riscv_init_cbom_blocksize(void)
> +{
> [...]
> 
> so the init_cbom_blocksize function is still inside a RISCV_ISA_ZICBOM
> ifdef?

FWIW:
Drew's patch, or at least the version of it that I have been using/did
a review of, does not have init_cbom_blocksize() inside such a #ifdef.

> 
> 
> Heiko
> 
> 
>>
>> Fixes: 8f7e001e0325 ("RISC-V: Clean up the Zicbom block size probing")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
>> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>   arch/riscv/mm/cacheflush.c      | 41 +++++++++++++++++++++++++++++++++
>>   arch/riscv/mm/dma-noncoherent.c | 41 ---------------------------------
>>   2 files changed, 41 insertions(+), 41 deletions(-)
>>
>> diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
>> index 6cb7d96ad9c7..f318b2553612 100644
>> --- a/arch/riscv/mm/cacheflush.c
>> +++ b/arch/riscv/mm/cacheflush.c
>> @@ -3,6 +3,8 @@
>>    * Copyright (C) 2017 SiFive
>>    */
>>
>> +#include <linux/of.h>
>> +#include <linux/of_device.h>
>>   #include <asm/cacheflush.h>
>>
>>   #ifdef CONFIG_SMP
>> @@ -86,3 +88,42 @@ void flush_icache_pte(pte_t pte)
>>                flush_icache_all();
>>   }
>>   #endif /* CONFIG_MMU */
>> +
>> +unsigned int riscv_cbom_block_size;
>> +EXPORT_SYMBOL_GPL(riscv_cbom_block_size);
>> +
>> +#ifdef CONFIG_RISCV_ISA_ZICBOM
>> +void riscv_init_cbom_blocksize(void)
>> +{
>> +     struct device_node *node;
>> +     unsigned long cbom_hartid;
>> +     u32 val, probed_block_size;
>> +     int ret;
>> +
>> +     probed_block_size = 0;
>> +     for_each_of_cpu_node(node) {
>> +             unsigned long hartid;
>> +
>> +             ret = riscv_of_processor_hartid(node, &hartid);
>> +             if (ret)
>> +                     continue;
>> +
>> +             /* set block-size for cbom extension if available */
>> +             ret = of_property_read_u32(node, "riscv,cbom-block-size", &val);
>> +             if (ret)
>> +                     continue;
>> +
>> +             if (!probed_block_size) {
>> +                     probed_block_size = val;
>> +                     cbom_hartid = hartid;
>> +             } else {
>> +                     if (probed_block_size != val)
>> +                             pr_warn("cbom-block-size mismatched between harts %lu and %lu\n",
>> +                                     cbom_hartid, hartid);
>> +             }
>> +     }
>> +
>> +     if (probed_block_size)
>> +             riscv_cbom_block_size = probed_block_size;
>> +}
>> +#endif
>> diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
>> index b0add983530a..d919efab6eba 100644
>> --- a/arch/riscv/mm/dma-noncoherent.c
>> +++ b/arch/riscv/mm/dma-noncoherent.c
>> @@ -8,13 +8,8 @@
>>   #include <linux/dma-direct.h>
>>   #include <linux/dma-map-ops.h>
>>   #include <linux/mm.h>
>> -#include <linux/of.h>
>> -#include <linux/of_device.h>
>>   #include <asm/cacheflush.h>
>>
>> -unsigned int riscv_cbom_block_size;
>> -EXPORT_SYMBOL_GPL(riscv_cbom_block_size);
>> -
>>   static bool noncoherent_supported;
>>
>>   void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
>> @@ -77,42 +72,6 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
>>        dev->dma_coherent = coherent;
>>   }
>>
>> -#ifdef CONFIG_RISCV_ISA_ZICBOM
>> -void riscv_init_cbom_blocksize(void)
>> -{
>> -     struct device_node *node;
>> -     unsigned long cbom_hartid;
>> -     u32 val, probed_block_size;
>> -     int ret;
>> -
>> -     probed_block_size = 0;
>> -     for_each_of_cpu_node(node) {
>> -             unsigned long hartid;
>> -
>> -             ret = riscv_of_processor_hartid(node, &hartid);
>> -             if (ret)
>> -                     continue;
>> -
>> -             /* set block-size for cbom extension if available */
>> -             ret = of_property_read_u32(node, "riscv,cbom-block-size", &val);
>> -             if (ret)
>> -                     continue;
>> -
>> -             if (!probed_block_size) {
>> -                     probed_block_size = val;
>> -                     cbom_hartid = hartid;
>> -             } else {
>> -                     if (probed_block_size != val)
>> -                             pr_warn("cbom-block-size mismatched between harts %lu and %lu\n",
>> -                                     cbom_hartid, hartid);
>> -             }
>> -     }
>> -
>> -     if (probed_block_size)
>> -             riscv_cbom_block_size = probed_block_size;
>> -}
>> -#endif
>> -
>>   void riscv_noncoherent_supported(void)
>>   {
>>        WARN(!riscv_cbom_block_size,
>>
> 
> 
> 
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
