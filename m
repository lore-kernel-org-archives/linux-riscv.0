Return-Path: <SRS0=Z6yX=OZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27DFCC433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Oct 2021 08:22:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCD8961354
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Oct 2021 08:22:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DCD8961354
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kuuibeQP5hbSP+hYM6YkXNRPfFTwicn7pFGYxc9cHEQ=; b=fTofAZdy1Jltbk
	RyhItUFcIKUzWrDy7s//I1fzRJMu5SLxUiFonQFe/sD05vc3gT8GgzBKEa/T+iZaxSUJqD0OS/30A
	sKYez9GDa9/mNZMKXl4k1c0rusmtrA4Y8W+5cgtlsrk9Mvvrg3oUf1u9LlFQnByKx2K3PPtQg9HB3
	9Lp00ZKinXqu5Ch7NemhHOefKPv0Rwy5lt6qVrzCFIYmuEee9y5qm3EvnrZy0PLuH9b/XbIIaBpD3
	AOLXLPgfXNfPR6zt/YJYQcZLf4bgurOzRk0cf8nG+C7FExTx/QD9+DY5A37XGzYD3kR0htMtEHqVW
	ud5Fq3EnA9GCwO2MP6tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXfiF-009WPI-0H; Tue, 05 Oct 2021 08:22:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXfiA-009WNv-Jg
 for linux-riscv@lists.infradead.org; Tue, 05 Oct 2021 08:22:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1633422127; x=1664958127;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=fHNUL8waXePhv9G2xbIY2RnTFLfSrV1S2l2tpFWCe4Y=;
 b=CU1UxAJYp86f21Rbee3AdAnCVPcdt05ptIZroaWsSmR3957U+3E7EPMX
 KWhQjoPxkFn04qh1CSvEHnVuvnXI5v1N4LpJ77NaK1lbnPq/1/1PrqiUd
 zMIKPJTEtiUmhIaP1GbHJlOd48JMgWhdNpJXQQ/zqPqhsqCDYr0T869Dj
 W0sQC5mhAqFLfnCM32KOxs0z6achETb3WX4S8j4SKNWrKbPdxVMrWTbOl
 CJoagddHHALhnaucycuFiFvlQaDGNVu3ylHwW8ZzZVylqi3FGsXHrH4WW
 ki+ry1CqyI31EI0OTLpBYEaJKxySQDfKv7tOVj3vK/3ZtrMlBiBSPsLwu Q==;
IronPort-SDR: 7fjCO0+kT3NcQlW8iBzm2+hGaaC5VSJBu5J15/B2egDAk4fvzG0oRZvNH3lAOEENlsS92w3uVI
 GoVKFOXqHA0Fyy6KVW3vSNmQ7HTXV0EcdqBXgOrlAcEVtr8ZrVhqFQO+/mg44zltKdOwewK3uI
 dw8zC8waVl5DgMLsxiuuSBO9n1vpv2vHtPOrDz4i1XyuLu6zg13+uAP/owDtwLnrZiTf+M2vbw
 Aj4kLk+yTSTLwUr3o9V63V15V8sr+PcC+Ol82eNEJIBrxGTRtjR3W2KPLOdUytzWB7VYyHek5v
 kWCjnX5kEfPNqJ7u02dU5+zi
X-IronPort-AV: E=Sophos;i="5.85,348,1624345200"; d="scan'208";a="138485717"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 05 Oct 2021 01:22:05 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 5 Oct 2021 01:22:03 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14 via Frontend Transport; Tue, 5 Oct 2021 01:22:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zt0NQrDvz2/h5b/lqRLx5ATw1KyaEJz21CysDs5FLpqBwILQlW4jaz7BecqdHkenbLLEyQMDIJkCAQ7Wt0ldIjkObnAKsL2cdgWdLORSOuLCTfLQtnfITiiVVRxaQ7TE53kyOtn2B3Mxg0C2It/pUtKXVdsPWg7nGEux+w+QV+OgkmonvAGi2ZVVbx5nei2TJC+0eihUgBwn0jozDZzLuVx4m2xUgdBWXX2wf30Ktf3nBSvmlNcwTu5N5v/+EPk8sX8eNY1Uc768Z6+ycgd5knzNOkZjctdfgLJoJn3G+3cRZ14MK8S3BRQncXLCgWDvReEnWf/+ShvGXX3UYm413Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fHNUL8waXePhv9G2xbIY2RnTFLfSrV1S2l2tpFWCe4Y=;
 b=IKzlK8r33XSgr88rKekGL3CiNQ2YIrUoKN89vpdhY5Z5V2AagvTDb5sTEd75DjAYOLJUEq3ebPFXp9Fu0BkGNTcAmzao3WT8hZ6OGb70ycA0paseUgq5V/FjopG120FGcHw1XH82ZEoZuYGIBpCt7H2ukrh5UDlRyJJ1Hz6MAplxHnBUXf3+BNafR50AV5DhtWrlQ/1EVJD0NeDtx2VEdNy43pZ+pAsCmsp5H9ebulwvHMTQLxiCxN7kR+gUPkwv7nSTzeu0mAEPpWpl0s84bU3PsN0PQkXCAEOoWuR1jtueJDQesbfFqrH5ZZRZ12jTkKynU4uSDiD8TRQ8EySI8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fHNUL8waXePhv9G2xbIY2RnTFLfSrV1S2l2tpFWCe4Y=;
 b=X8EU9oF3o44JtxqVARwjqd2oqQAAmQEy4s7E5bx7RHWV0QAFt3v7vaHj5elODqNRfra/qJN95QIV3HI5C04pHCzr5U4LE8bbCD8eA6Rk/jEwMNfdo8fLlNYXpy6fcP/St20WFxO/P3ifr3yZZkrL1p0BsoMVNU1grpVbJaZEVKk=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by CO1PR11MB4865.namprd11.prod.outlook.com (2603:10b6:303:9c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Tue, 5 Oct
 2021 08:22:02 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::6111:3d29:64ad:c763]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::6111:3d29:64ad:c763%5]) with mapi id 15.20.4566.022; Tue, 5 Oct 2021
 08:22:02 +0000
From: <Conor.Dooley@microchip.com>
To: <krzysztof.kozlowski@canonical.com>, <ulf.hansson@linaro.org>,
 <robh+dt@kernel.org>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
 <aou@eecs.berkeley.edu>, <geert@linux-m68k.org>,
 <yamada.masahiro@socionext.com>, <piotrs@cadence.com>,
 <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v4 4/6] riscv: dts: microchip: drop duplicated MMC/SDHC
 node
Thread-Topic: [PATCH v4 4/6] riscv: dts: microchip: drop duplicated MMC/SDHC
 node
Thread-Index: AQHXs55R2guPC/TgQEO8NaYle2BPvavEHPiA
Date: Tue, 5 Oct 2021 08:22:01 +0000
Message-ID: <1ed22834-1b85-d8d7-dff5-6bab6df0c06a@microchip.com>
References: <20210927125044.20046-1-krzysztof.kozlowski@canonical.com>
 <20210927125044.20046-4-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210927125044.20046-4-krzysztof.kozlowski@canonical.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: canonical.com; dkim=none (message not signed)
 header.d=none;canonical.com; dmarc=none action=none
 header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1dc37723-8897-4fa4-156f-08d987d9353b
x-ms-traffictypediagnostic: CO1PR11MB4865:
x-microsoft-antispam-prvs: <CO1PR11MB486562F855C44FCC392FE63098AF9@CO1PR11MB4865.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6R01QB3kMB3HR48z0LJwXl6/XgzqUz/1rU8SgbB/DFB4XR3jYhQvZtoHJ3WrH5oyYH5Xo1vWumfMk+Zr0MuwSaguFSH3tmLqaXemeQNECr3oxKWhZnI810IFSeUR4SuAyLN0EVq7RHWR6LbnVmwSGdMGgCdjnRqR5besGkbQkykIse4SKPbqY6stbegROAqE6+kejf2AmFQLsWNdqUwqfTfHOTbNKmfAkWkQwJPb8l45k9rSLQWhyKFFk71JevhLPdSmsxa1tGD+IW2eAV1Q6+d/ghPg1oCGKr70aHsWzu/B9tNmJWDWdRER2gLa+wd4a1jzqUc4uyE09O3l6clCTQauz7mQy1o1Yg58jZHRYpb8Ecs0XmQ+50RgaL/s486SKtypqJe+SelwDcAoxwJiKyF+n2pyzlBRUan8PoHzPR1mqcxT52CB7j3eUTnebyqayJps7KIsCTpsi6RtRYpyT4+uP2pSiGmvq7CDJuyDycmRB3dMsUkuC8Zk3m018IFhyptyfp06G5MERo66SLSZYnqGRE8b1ulM4jL9YHd4ltJgVbKb9opoLCAM3hRSoffl8nbWThWsTM94zLiRTKsR0upDMOoEi0sT4klViIndS64WHtPQC3SViYf3hH3Gvmj7IPpgcDgyvXP1YABupwXldfN6JEcS25FBv/5bjyKxpYveFW83CZcrzw3G/ogLNjBuKVvPfbJYTX1tD2lJsor9VVszt+TM7srRCm49GJynvGtdcZhcVmfmnEs4rvyFAFck7/3khO1uhoShNGNHCy/fbkAwtUtqihbuJaTrzpcI6kQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66946007)(921005)(38070700005)(122000001)(71200400001)(53546011)(2906002)(38100700002)(86362001)(91956017)(76116006)(5660300002)(31686004)(26005)(83380400001)(31696002)(66476007)(66446008)(6486002)(186003)(7416002)(6506007)(8936002)(316002)(508600001)(6512007)(36756003)(66556008)(2616005)(8676002)(110136005)(64756008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QlZyeEJ4U01pNXo2Wm1GMkFBOXZQZkhVOVFldGxRbXVvRlc1R1cxbEVjN05S?=
 =?utf-8?B?bkFHMnB0TUNualRsQXdhZTgxYWQzWVZuQmJGa005b29FVGdWNDhzMlRuNmxt?=
 =?utf-8?B?eDlnV3ZrYS9VSU0rcCt0aUxkWVJzdElYc2hwRDh2Wk1aYUNjS1crMFZEYWp6?=
 =?utf-8?B?MEdKUzhaeGh2dXRZRmdsUmVkeG5kSXdDcGJrTitxcUhCYW9PelFjdHBmdTVH?=
 =?utf-8?B?Mmd5UVVpU256NlpJa1p2NG1Pb0dod25XS2NldUhBZFVuSzBpRUJLSm9jZVRM?=
 =?utf-8?B?c20zV1pLNEozcFZqcHlKSjB4UFJpNnRSWUxEQllHTDYvbjczSmNRTEZvdnln?=
 =?utf-8?B?NlJLSmtWWkIreE1LVm5iK1ZEQno5bHNSU2dLVzkyaG0wK0tNM2tiT2U3V2Q4?=
 =?utf-8?B?UFh6ZUFxUWJlVGRQYWRmSTBvaGlwVzQwMVNUT2p1bE00RUlFVVJaVDhnU1dB?=
 =?utf-8?B?ZGVrWk8rdDEvYUdWbURxUnlDVzYyTVRPVFFUWmFFUHhyVHpiWlBzWW5RVjln?=
 =?utf-8?B?cEgxTEg0WnhPOTNlSStQMVUrSy8xLy9mejZDQnpDV3Q3S3c4bVJQcU14aTk5?=
 =?utf-8?B?RS9EZ0xwbzhBelBLdjBUUDlhZktYNERrNG1Mb3ExaEMxaE9UbGpqZXc5UU1k?=
 =?utf-8?B?NFVTNG8wMGFFMHBnUy9JRkxxdCs2ZHZuTWk4aXlXdVVCbXpYU3o1SHBjSFgz?=
 =?utf-8?B?RHJMdUhuTE13TlpGNHViTzV5Zmc3eVg3cXJTaFNuR2tsdzRLcHNLRzV1SWI1?=
 =?utf-8?B?MzZBN3JCV2JoVVhWODlDMWhLNGh5UmpoVVZUTUZaMkFPaTErVWZYamIrVmds?=
 =?utf-8?B?SjVhRXY4cUtnYkFiMG1GaFdnOEtzT0h4dVZjS2h6bVBJb0Fac1UrRzE5ZmFW?=
 =?utf-8?B?U0lQVDc3UFRVTHhDanhJQmc5M25rV1Y5U2N1cVdKMjBUOHJRUC9PeEM4M280?=
 =?utf-8?B?SWxVc3hrTXRsbDdWMi81WTFpQS9FVUpHQnJKdVpEMWl1VUQ1RlkycGtRNEpV?=
 =?utf-8?B?cTllUlVXYm1adnpCSytEL1cyeVFVOWVNSzBiV3BzS3BqeHE0M29oUnJLR2NR?=
 =?utf-8?B?TFp5RDNHclRrQnZJdTBJRmxuamFHb1FsYWp4enQyMzNsYWZRQitQcGc3eUNP?=
 =?utf-8?B?MzJ4cmQrZ0NaK1lnYnVJa0ZYTkVtdjhRZUdBNmpIelMvckZQYjRCSDJiaGIr?=
 =?utf-8?B?M0VkdTZPVDdDZVpzWUcvZ1RRY0dRMFA3YThybURzYVc3a1lqOVdNR1J3Wmtl?=
 =?utf-8?B?Y045M1JLdUF4dWJYcWlqd2J5UUZRemF1R09xSXE1RmRwVnNaWFU3YnlJSk8y?=
 =?utf-8?B?b0d5N3hDSHNNOEhLYTNINDBZZGR4c0xUbGtpOUVwN09Galc4T0lFazdIYWdx?=
 =?utf-8?B?bHBHbHVmeUtVamV4TUdpSFRhbExmciswNUFicStLV1JZN0x2NEpGM3RxMGRZ?=
 =?utf-8?B?Y3dXcGwyei9IYmp1Mm44TFFmMkxEY1NPcU16b0VXVXhubFR0OHBqZEdtbXo0?=
 =?utf-8?B?TmxtcnlER2l6Q2F1cWtKWU5BUDZjN0UyOCsxaTBjZS9vWVBkbk9JaHNNZzRm?=
 =?utf-8?B?V3RiY2hQZTNqc2duaUk3dWtBbldMV2xWOVdvWFlidXQrZU1vVXdBcUNUQ09G?=
 =?utf-8?B?Y1h1dHpwUksyMENITjJ4VGxVbU9HQ2VWeTYyMUpRaTFmV00zSlJvQ2FXS1FW?=
 =?utf-8?B?TC9tM0hiZFI0R1krZVFXZzFOYkJOUFkrZDZaVnZybDVrNTE3Z3QzTXUwRXhB?=
 =?utf-8?Q?6UwJJAQMhHaiSLuf3Q=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <81A521710199A049B00BA0D9A3FA8942@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dc37723-8897-4fa4-156f-08d987d9353b
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2021 08:22:01.9367 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z1qiaZgvPa+AClNZfG5rkKxzltikX4iEtOXH5RvXI7Yy7rzP8aAfGwI77zCUIZvMH21SeoYrug7+WpgRCBKY4t0ODYL0UOeGmOxFzE8NLIA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4865
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_012206_764371_F792373F 
X-CRM114-Status: GOOD (  19.03  )
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

On 27/09/2021 13:50, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>
> Devicetree source is a description of hardware and hardware has only one
> block @20008000 which can be configured either as eMMC or SDHC.  Having
> two node for different modes is an obscure, unusual and confusing way to
> configure it.  Instead the board file is supposed to customize the block
> to its needs, e.g. to SDHC mode.
>
> This fixes dtbs_check warning:
>    arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dt.yaml: sdhc@20008000: $nodename:0: 'sdhc@20008000' does not match '^mmc(@.*)?$'
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>
> ---
>
> Changes since v3:
> 1. Keep two interrupts.
> 2. Add comment.
>
> Changes since v1:
> 1. Move also bus-width, suggested by Geert.
> ---
>   .../microchip/microchip-mpfs-icicle-kit.dts   | 11 ++++++-
>   .../boot/dts/microchip/microchip-mpfs.dtsi    | 29 ++-----------------
>   2 files changed, 12 insertions(+), 28 deletions(-)
>
> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> index 07f1f3cab686..fc1e5869df1b 100644
> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> @@ -51,8 +51,17 @@ &serial3 {
>          status = "okay";
>   };
>
> -&sdcard {
> +&mmc {
>          status = "okay";
> +
> +       bus-width = <4>;
> +       disable-wp;
> +       cap-sd-highspeed;
> +       card-detect-delay = <200>;
> +       sd-uhs-sdr12;
> +       sd-uhs-sdr25;
> +       sd-uhs-sdr50;
> +       sd-uhs-sdr104;
>   };
>
>   &emac0 {
> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> index 1d04c661bccf..b15e93d1702b 100644
> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> @@ -262,39 +262,14 @@ serial3: serial@20104000 {
>                          status = "disabled";
>                  };
>
> -               emmc: mmc@20008000 {
> +               /* Common node entry for emmc/sd */
> +               mmc: mmc@20008000 {
>                          compatible = "cdns,sd4hc";
>                          reg = <0x0 0x20008000 0x0 0x1000>;
>                          interrupt-parent = <&plic>;
>                          interrupts = <88 89>;
>                          pinctrl-names = "default";
>                          clocks = <&clkcfg 6>;
> -                       bus-width = <4>;
> -                       cap-mmc-highspeed;
> -                       mmc-ddr-3_3v;
> -                       max-frequency = <200000000>;
> -                       non-removable;
> -                       no-sd;
> -                       no-sdio;
> -                       voltage-ranges = <3300 3300>;
> -                       status = "disabled";
> -               };
> -
> -               sdcard: sdhc@20008000 {
> -                       compatible = "cdns,sd4hc";
> -                       reg = <0x0 0x20008000 0x0 0x1000>;
> -                       interrupt-parent = <&plic>;
> -                       interrupts = <88>;
> -                       pinctrl-names = "default";
> -                       clocks = <&clkcfg 6>;
> -                       bus-width = <4>;
> -                       disable-wp;
> -                       cap-sd-highspeed;
> -                       card-detect-delay = <200>;
> -                       sd-uhs-sdr12;
> -                       sd-uhs-sdr25;
> -                       sd-uhs-sdr50;
> -                       sd-uhs-sdr104;
>                          max-frequency = <200000000>;
>                          status = "disabled";
>                  };
> --
> 2.30.2
>
Reviewed-by: Conor Dooley<conor.dooley@microchip.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
