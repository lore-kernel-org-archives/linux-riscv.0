Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 803FBECAAD5
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Aug 2022 21:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ap8JqwCGm5hBJSmML6JgKMLC4rE9+jlm564zfiBDEyE=; b=Yra9LjGkUeJglp
	EYVWdtbyRYYU+8hhJAfdzvPsq5LReluckPpftF+n3kb+KseNM+S1GZZQPCwF6AxlSot7PoBbf53Lr
	oZNiuiuSO4kr+NG3Rp2js1W8OaD92YaMC3ujusXOKT42148sj4XxxAh1VlFXQfh0aNedWU/R75NkY
	grXF3TUL/MpeQ1H1Y/t3RU+/7sbjK/44Na+MWL7Oh9WnbiM+9jvchK1SO6V/1a5c+dEVDJfAdJOuf
	wchXHJPxtlP6upn5g+I5YPPfC9lyreVlxRIz7x+FXqDAyowKKAAWRU4Q/2zBLYZ1CJz3o2XUBevrb
	RZ8IKDynFaTxnJhGpgZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oS37G-001S5f-Gt; Sat, 27 Aug 2022 21:13:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oS37B-001RvW-Ia
	for linux-riscv@lists.infradead.org; Sat, 27 Aug 2022 21:13:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661634793; x=1693170793;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=TdcNBytt9/ChjYJ35cCVuTI+9SS6eJ0E9N/kmd/UpK4=;
  b=RV2qQ4XDyIckAhHRDgukxUGJzVt2CqAtfvv6UNd3FVcIcpqpAPsA3HSl
   dW+U2IJZGBfNszMjCiRY17V1m5t2FTCm6+p3nChpt0fu1xwZWt6KbeFce
   r+b8MTdOBVuUWW1RWKc0feK8nEGKwypqcN/CJJcq4cKZwIX/Bf68m4iuf
   xK5li80/IfSREExOe2xuZmqkGeGqtQktCnTqY3dvG+5+ViAUFo8kvoEan
   LDpjm/dDV04UAhlliEqHudwX0fQ88mjBgZEqV37FR7nILljZul2Mq4x+v
   wBLyVuRx3HTO521txCh8F9KN5R6c51rbAQgLGq1v+B5cqILLzdgoImuNj
   A==;
X-IronPort-AV: E=Sophos;i="5.93,269,1654585200"; 
   d="scan'208";a="178005791"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Aug 2022 14:13:09 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Sat, 27 Aug 2022 14:13:08 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Sat, 27 Aug 2022 14:13:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TlvIX3qr5iNDeO+VonAnazQ36AH1Pna0q532Pt/ngZscSMCKYy2VXDanKT7xVFZRINTx96k7dMPbMvLKjuymLo8o5OnLT3PQ79soaZIabdipa5nxJR2PfMU6fqmWDEBYBtCXOrRXdPUp590ls3E/zzxx2j2qns0B56r4PyZWOjVJgBcGiL5HWcaxEECORYgbHbwPYWiETyheay/ilbTTTBxo8H3VzMZ36yY1kQSz2JDysL5kNYF9h91cjQJafgdEZDBa5z/DwzkaqiiKb0z7bVex5BTLRD/oxkJGuBZuafdl1ZYJrCGd5c74ptors2B92gH/3DChbhp7g8rTVml9nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TdcNBytt9/ChjYJ35cCVuTI+9SS6eJ0E9N/kmd/UpK4=;
 b=FiizS8D1RqOiCWx0gUu5QnxdCqhJ7R20KqqsR5abzBxMInOsT3dpCx5TEySY9gJEhrha2oM4xN6RoY9YgXaeYVxJhq3EUYFAQsaZ6CwOm3MpI0YjQueEQzd+kJfS9wDZYRq0J1l3oMCgBpwSRmmnCTa2o9QiBCDEoa0CeI3P57audyAjGnFfc45gi4L7Te/19vJDCWq1qRkFgp2Go+0e0mXYRwFOO8JUVSItFwZoOh/hEnnJcHk5jhq5jvvasXtSPk8qxlW5eDK/QjsrdC2SQqpVRalX3xR3vFdxgLlX5kRjAfUTG83INguF+gl18i3Gj20mI1D9kVI5Hg0FsIoHew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TdcNBytt9/ChjYJ35cCVuTI+9SS6eJ0E9N/kmd/UpK4=;
 b=SznHCYoDsThBS6HPR5KHajz/r0EKLUXiP4qcrJe3sA1PKVtaYr5mzAxkd68aVVzUUmqckpkhl35mtaXehig2NqVaKyTsASf91+tfj08M0ebyN/z5ImlnFtkkisLTLtwiN6US4EL5T2OnlwukcHxvegr2pQWULd/tLhrgSRxYCKU=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by MN2PR11MB4430.namprd11.prod.outlook.com (2603:10b6:208:192::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.19; Sat, 27 Aug
 2022 21:13:04 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%9]) with mapi id 15.20.5566.019; Sat, 27 Aug 2022
 21:13:03 +0000
From: <Conor.Dooley@microchip.com>
To: <jszhang@kernel.org>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<ajones@ventanamicro.com>
Subject: Re: [PATCH v2] riscv: enable THP_SWAP for RV64
Thread-Topic: [PATCH v2] riscv: enable THP_SWAP for RV64
Thread-Index: AQHYufzf4JJbBuNch02tBI9sTRPCrK3DP5sA
Date: Sat, 27 Aug 2022 21:13:03 +0000
Message-ID: <0256a458-440c-171c-2a6f-e88a50c16f82@microchip.com>
References: <20220827095815.698-1-jszhang@kernel.org>
In-Reply-To: <20220827095815.698-1-jszhang@kernel.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8ca4f509-1a2a-4f31-081c-08da8870ede7
x-ms-traffictypediagnostic: MN2PR11MB4430:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DGoUGfzbkdkCDlrkTJDlQlCpZcIFo8VwgWqy9p89GGCs40P1MJ9/pKEo1sww3bCLCv89umuA4RX5FMWhxzDWacQParQujUZchqTlYv9dnT1xnUeJuKKIptafCJPMeu48BuN0ZeloUtgIqmmeo6sPxqGTbf5Vs2PNn5Lx/uE4IExUXH+/8Y21v6LVSvDwfNH6xFEOrIxJ5a4qaxELE059pOhXKCEethDqoXfy3KubXUf1z8+Bsu69wkxcRrDwZLmLTADf5n85Tx2CDR8N1GaYQE9luXMNm8wrbL1WXkTIFpCV0kdEBQGcyhLUVm4NUH7pHRh6+7U90L3jJlyuVHW7UcmvMvF24pCeOYCC4Pzw0q28c2qB9B/ZkU/AeRNipUns5dgfH6HjpIvLKDmfh8CuX7q/vll/Mgop4Rr59MEZO4f5ItqRlEOASqbyRg2VPLLOWaHxN/6+3X/ygkDv0lfpRJVk7z9A8YNoIx0JzQOeEGluczgub8q2++wlH2oHIxcIzx0Zmknwinn95swX9FBcWFowNRznZg1Vf78CS4zGmZbJqZI7+w607ti2grVjgRFbScMLMSU9X/JwdGGhN1KJ+ZnGTuJLw3a0fPXP4VGKIAaEmBvtjK+Wg08VOJO/brQWUUtFPmqqCjJbkNAJyDasjbz2OolGpuWrKrBGsQNnNrQOBUXxeqGGgVO7e/T8SxbfNk932Z74FKwV3JOFHbgXoCQYuodXoXLpCvqq0APmxcjDIBXz3HPz02PxHgEwQKY3CopTpndDyY2QT7mlOugM+1MbRCOYeocCBpZi3jzOmTVi+ukR+eJGbatIlVGBnrBq6zhwfJ3fJnFBcA7kHAPhig==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(376002)(396003)(39860400002)(366004)(346002)(83380400001)(38070700005)(122000001)(38100700002)(110136005)(76116006)(54906003)(5660300002)(316002)(8936002)(91956017)(66946007)(66556008)(66476007)(64756008)(66446008)(4326008)(2906002)(186003)(2616005)(6486002)(478600001)(41300700001)(71200400001)(53546011)(6512007)(6506007)(26005)(31696002)(36756003)(31686004)(86362001)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bnAzY0VaUTNnVGpoUHdSNmxjR0dUMmJ2bFMrb2w5SGJ3MWRiTUFLSmxKLzl4?=
 =?utf-8?B?M0Y2NFlJUzdNQm1HZUl1WEVzNUt1L0hLRnpaWG1SbWplN2N4K09KUHlCM3lJ?=
 =?utf-8?B?bzhMVzk3Y04yaGlrSlBBdjRXbGJNUUVvV0Q2eC9QemdWZWYwOW4wRFRMTGI3?=
 =?utf-8?B?ZlRyM1ZRRFZ6THpqMVdoYkhQcVRYZEdmaEtRY1BqOHJyWnZBa3FrakxUYzUz?=
 =?utf-8?B?aWJXV3Y3d3lhVk5yS1ZqSFRhL09JU0l2QlR5ZnVkbjRITDFrM1lIQ2tNQnRB?=
 =?utf-8?B?S2JQcXF6Mk9lUlVFZ1UzbDByRmRKZ3B2N1IvVEZOcGZzQmIwTVlGaE1RRUNM?=
 =?utf-8?B?Rm9TdnFNOEoxaEtTOGJJekZNOFpKSWlKWk1XU1N2aWxzcGxGbThsWjFsazdx?=
 =?utf-8?B?dTFaK2kwMU5Ka1VjakxnaEJGbVNyRmZHNFhqeFpzNWdPbmdjNnlETWFxYmE3?=
 =?utf-8?B?Y0xmdEpyS1h6MjlwVjQ0K2NhR0hYNy80Y2ZoQStEU0g4SExrbElYZTlqYnVa?=
 =?utf-8?B?QlpaMFRZS0RHa2R0R2h5U3o5VjNORjRXMTRMMzN4NzNHMWJvYWN5M0hpSFZC?=
 =?utf-8?B?Ymk1NVVuTzM0bHJnc3lkM3RQZG1ySGFqUWwrUTR4dkNJakxCcjlUZmdBMUpG?=
 =?utf-8?B?VlVobkFFSnZUUFBLR2JrYW8rSmU3UEtvUitGakVvMmlGbFh3eUMwNCsydDNx?=
 =?utf-8?B?d2FBVk82YkJDcFVTZFc1MVovOVN4TjlnbzhOSXdOOWsxYVVFZTh4RTBYa0F0?=
 =?utf-8?B?cjVTeXdKenoyTWVWNUhqYnBTUmsxbklOQWxTTXdFZHZobFdIRXRUN2lMd01E?=
 =?utf-8?B?UkZNVTI4T1N1elJucDJNdGNyWG5KRHVSKy9Rd3Z1M290MGNFMVlTSXhUUDRs?=
 =?utf-8?B?S3orT0xqNUkrUWpjS3JVMy9vankxUjZXbm9IV0VlTEpxSFJnMkxERGxYdWxN?=
 =?utf-8?B?U1FxUFdDWGF4Nkx0UGw0RFBuT2lXVjV4VGExUWdwS1FOMkdWRU0wNWozWnha?=
 =?utf-8?B?Vm1URStkelhwSzdvdzUzam94UEVyWmVCUUNFTmZ2SW96b2tOTTJZVWxwSms2?=
 =?utf-8?B?SXRQNTRTUFJyVHpLV1VJTG9MMGlUK3JLYzNPdlhhSjh6dERwR3JqOVhBajMv?=
 =?utf-8?B?VHEyazdiSEl2blVRTTJBWFBTaE5pckhwQy9nMWZXYlRybUZxaHhRL3o2c08w?=
 =?utf-8?B?akYzZXU2RDJJUGV2aklPM1Vqay8vZVg0NnNidlBqNkFxa3NuVmFCMURNdHI5?=
 =?utf-8?B?UHpZWDdaU2kza3M2ZnhWQmxRRGhKeFV4VmJiWW44Z1I1M2ovVURDT3RNNTc0?=
 =?utf-8?B?Snoyei9PdEU5alFscHUrRWNrWUlEekRxbmVuemRIaUpNNlpxczdyMmhhdDBT?=
 =?utf-8?B?OXVXd3ltRGhqcExNQzdxU01kV2g4MDFvYkVtYkVrQkRwQ2JiaTJRL2pJMWgx?=
 =?utf-8?B?MU8zQ3BybkJoZEo5MksvY0FVb1VpR1E5eEdaNHNudE4zKzIrY0hMQkw0UWkw?=
 =?utf-8?B?enk0ZkViTHhFcTBtV1NITU9mczFXdWxmS0pScm5xcFRmSjFGcWRKZTBmOWJP?=
 =?utf-8?B?eDJVdk9ucVdlQ2VVeGxIWjJFS1prYmVrMERxWCtXVjZCdFU4ZC92SGZwa1d6?=
 =?utf-8?B?Y29Ha0hDOUJ4SWQ2TGJySy9YNEtUSi85S0dadkM2NjRYK3h6VE9nZVY1Tmti?=
 =?utf-8?B?WDFQN2wvTUNNZXRHRHIwZXVpOW1MamdJUDRhRS9ERHIzUW44V01ObmN2QjQz?=
 =?utf-8?B?SHVwNjdSekI1NXM4NHVqY3ZCZzFNUVhJeEFKcHl2dENQMUxjZWhhZFNEcm1K?=
 =?utf-8?B?bjZhOWZjYVFNUnpiaEE3THVNOSsySEdxNTYyME0weHU5cG1sQmNkTktKSS9Q?=
 =?utf-8?B?V1dFb2RucEZJSWRkOXFURUZITklkT2N6alRrc2RBekJqN0JPa1BJTFIvNm9s?=
 =?utf-8?B?a1Z4NFFCUzIwYkVlSlVlUWkxVkZwNWJvUlUxQnIrM093NGtWZDZ3TS8yU1pE?=
 =?utf-8?B?OTQ1dGd3K0JvdXBvV3lCcTBTWElPaU4rYVV2WGtWSkZiYjkreDFmT2Z4bzhF?=
 =?utf-8?B?YTFTclF0SWFrTUplQmFjOVdaamRHQkxYaFFqSmxuTTFqNndyMVBQeUxxOHY2?=
 =?utf-8?Q?KNEfk7hgCoDdGhljgOCKFAYUv?=
Content-ID: <9732437204AC0B4793C355B7D2BC5B16@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ca4f509-1a2a-4f31-081c-08da8870ede7
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2022 21:13:03.4777
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bWiQaVhiMo5N0gK9/GGrR2ldkQn9edEMNWsOk4eLzx0s64nFKXBtXbaNfkeRQwDtFsF9KsL7DIxNgiSH0RpkCTcNmtlWBTOjKJLExUinwWw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4430
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220827_141314_934293_C868051A 
X-CRM114-Status: GOOD (  17.91  )
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

Hey Jisheng,
On 27/08/2022 10:58, Jisheng Zhang wrote:
> I have a Sipeed Lichee RV dock board which only has 512MB DDR, so
> memory optimizations such as swap on zram are helpful. As is seen
> in commit d0637c505f8a ("arm64: enable THP_SWAP for arm64") and
> commit bd4c82c22c367e ("mm, THP, swap: delay splitting THP after
> swapped out"), THP_SWAP can improve the swap throughput significantly.
> 
> Enable THP_SWAP for RV64, testing the micro-benchmark which is
> introduced by commit d0637c505f8a ("arm64: enable THP_SWAP for arm64")
> shows below numbers on the Lichee RV dock board:
> 
> thp swp throughput w/o patch: 66908 bytes/ms (mean of 10 tests)
> thp swp throughput w/ patch: 322638 bytes/ms (mean of 10 tests)

I know the original commit message contains this, but it's a little
odd. If the patch /enables/ THP then how would there be THP swap
prior to the patch?

> 
> Improved by 382%!

I could not replicate the after numbers on my nezha, so I suspect
I am missing something in my config/setup. zswap is enabled and is
working, TRANSPARENT_HUGEPAGE is enabled etc. Not that it matters
for acceptance of the patch though.

I gave it a try and nothing went up in flames while using zswap so:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
> Since v1:
>  - collect reviewed-by tag
>  - make ARCH_WANTS_THP_SWAP rely on HAVE_ARCH_TRANSPARENT_HUGEPAGE
>    instead
> 
>  arch/riscv/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index ed66c31e4655..79e52441e18b 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -45,6 +45,7 @@ config RISCV
>  	select ARCH_WANT_FRAME_POINTERS
>  	select ARCH_WANT_GENERAL_HUGETLB
>  	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
> +	select ARCH_WANTS_THP_SWAP if HAVE_ARCH_TRANSPARENT_HUGEPAGE
>  	select BINFMT_FLAT_NO_DATA_START_OFFSET if !MMU
>  	select BUILDTIME_TABLE_SORT if MMU
>  	select CLONE_BACKWARDS
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
