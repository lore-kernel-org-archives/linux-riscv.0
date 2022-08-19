Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 410D5C32771
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 22:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kUOPDsilGllIh2wX8ZrKOa5vmAew4yCiIaOJQCvAHaQ=; b=qrktB2gcbPEHzk
	NuYFiMZb2bGqjaW2pq00/Pd2fO82BduNmaBB5jXcNVx96C+9DAoDez5enBZwe1PF0Q3L5/WfJUC/r
	laQf2QA89kjMACzzW+5yso0DdrRSbdkrhMzs3RKNjCOS0+VXW6PJOAJt3a9Fqx17sxdTGcSlqA47X
	r+7sDmkWbRRuRhF4SIzkSjkxzfOo+HPmwwEfwG7jI4eG99JYi7ysfO8SuRZvIihN45N2jHvzzNLyn
	Ym4mXAQVFeRaSoGPVyzR5rfSBqQEgNkS7d+2sxT+4ChyoEgT0bk67en1vVDfJjhf+3sJJBBF38RKt
	w23PBxTDvS/NMimlsn7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPACk-00Ciux-DA; Fri, 19 Aug 2022 22:11:02 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPACf-00Ciq8-K4
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 22:11:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660947057; x=1692483057;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=iEpEgUJXdkgKvDVneeAe7zFnBG1hbebZ5QL9OHBUI9c=;
  b=WEOuJAxLv9snXbFL0dbxw3GI/sZSP0Dj9m1QXQy3IAGqgD7EKO6S0Yha
   MzXZb3fvyuGMlcze9S59d5OlQlwKxtq33IbMFmonWIXMDGf9VkcLOnOfO
   14nSQf9lUswoHNOMsyrekM0X8GZOoJEYYy3ENaAZ3YK60BXcUe5jCAdSt
   PJvySfyGYn98Ud9YmP8hy238DIAA8J47cDAL1YweKCxewTYpq2JTs0tWm
   nLoOPsAsZdXegDrU4FTby/MCou59XzpfwByQQUpzp/DwdoedFniovauet
   vjiOIEJ6ledyjYHr2xCjoIDIz8X9WSRMogQ5TG8f9hmsWdTH7ytK95ujN
   w==;
X-IronPort-AV: E=Sophos;i="5.93,249,1654585200"; 
   d="scan'208";a="170098490"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Aug 2022 15:10:51 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 19 Aug 2022 15:10:50 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Fri, 19 Aug 2022 15:10:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n4SfrfgcNon+caCqGDsRFymECxxmV9Nd5ykVvzKdRGw5HeMzCEjPWRIkDU7R11TgD7ymBaKuOQE+aNYAbz9HdOSm5wmoAV4QkcL1rI+H9bJMj39lN5VRw+VWaEE6uRp4DvMeD7uPCrwanQ+gP6J6iZEjCSK56Ns/kXsKwzqM6UBJXJpUl7WfdTxGyJ/rx128mbkogWVZ6I2K8dimx5kEJj0KgWHW+JzoHzLrNW3ZsHFZOcDBI3cySnoXHzGifjiEBYAcOdkrnWhEAv+kWBE/vczuPVQ2jviLY6zQb1Vq4g79onEVJ4V3DkB1xYjFFGCL1zzNk+4T7RsSe8+9meu0pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iEpEgUJXdkgKvDVneeAe7zFnBG1hbebZ5QL9OHBUI9c=;
 b=S9MKfkRue0otEGXcBSc4PmvMJhD5eFCtrOd5UoTegY46ZxnZTY4XB/Bff4fMxzgm7Diq4L/T2Adw/0FPst4Y7JeHDDek/qKUz8EMqGyT+FY83WSj6IHy3aI1uINyiBWrEemEkcviluIOC6AhggtWrCTxYDbow/UriV1MB/cnZdORyxH32wYOP46f8pc3LlGfa+htGMRYSxuIYNMDZeKrbJuGW9nAkRUWEg1CZBLv6PJLr5zKmxOYYgGTtRfN9i6cSWmoJ6uwUcFTWI9CutIGI9UCnhH/LcZtpXhLWTxh6HALYsw4NieqB2qyoWytAymO7+PrU195Dn3sB6m5e464GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iEpEgUJXdkgKvDVneeAe7zFnBG1hbebZ5QL9OHBUI9c=;
 b=at52Zbbe4F8OeriV3gbGXRlSN72kDuvtj3KIjzRFs0FycjCGhdN3AHCmevf1xSBiwyIIEJlSsDoQKGHR9HYdtejlhJ/p9/gTiXdMUTm70ZjAUXxdGQZmYx7bOdhEHb7gNjp88HtIpJHUl/3lkBy9ApViTGGACJ9EXvNlM1+onW4=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SN6PR11MB2767.namprd11.prod.outlook.com (2603:10b6:805:5a::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18; Fri, 19 Aug
 2022 22:10:45 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%9]) with mapi id 15.20.5546.018; Fri, 19 Aug 2022
 22:10:44 +0000
From: <Conor.Dooley@microchip.com>
To: <samuel@sholland.org>, <wens@csie.org>, <jernej.skrabec@gmail.com>,
	<linux-sunxi@lists.linux.dev>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>
CC: <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<heiko@sntech.de>
Subject: Re: [PATCH 07/12] riscv: dts: allwinner: Add Allwinner D1 Nezha
 devicetree
Thread-Topic: [PATCH 07/12] riscv: dts: allwinner: Add Allwinner D1 Nezha
 devicetree
Thread-Index: AQHYsGUr+3EH8+Kn3EeAQmOckfNsnK220EMA
Date: Fri, 19 Aug 2022 22:10:44 +0000
Message-ID: <adc4a8e2-7347-7616-99b9-59762023b2ff@microchip.com>
References: <20220815050815.22340-1-samuel@sholland.org>
 <20220815050815.22340-8-samuel@sholland.org>
In-Reply-To: <20220815050815.22340-8-samuel@sholland.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bd43ce9d-8847-4aad-251c-08da822fa9a6
x-ms-traffictypediagnostic: SN6PR11MB2767:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1FcKL9U7AQfbceYmJST3vIFX6HqIdZe7Q/eR+6ln40tsvMnjmskoET6ijnTao0qpetXheIzRBKxwtcIjCdVzuTeKmiePLJIKnS3/ZFZMwUKU2Z/B2R46KOKwcK3xML205cHhQtr6XNLWdKecT3WSS+ffBXK05Gx+xDj5BI2HObkrvmYdRJumE+bCmfAPH3K2r/OULklJRwXibpq8u7JsZF1+mxGh+bqM7GJPe0Fw5BhRjA4m/eKSr4x+AX1aXRADAhCchciWZBONdLxPPMtGjfzEe8uzkdKs8b5jR47hT75DPIjyzNdGrY2Y+nDABgOumGygxh7LN/zaQ44XQ5faz3a4Cc0PXMuMVSzV8yv/4Kfni/TxtBFzyIHUyuKW/d05cZvTTBv9LnpIjyi2K0nJ03eYUy7C+wcrvErLDZZ0yu5LG/Jxf9eekqI3nz/PwqbZtJWq7WqxLaMGH8fUKQyF/AcKsNAKg4631gHZs5veI5UeDW6+IapfAdHSOxjeQ7iko6E3HOBJxgP+RyA4wgg8oJfIZNz+U7nXR384kvPuoviqNK3Ch4Ko9hyMU84ZBATcGcLhhf3I48T7ymFHNcpjbvboLrVki7I04M12c/0VGnkgztvynpDScHE/b/nDR8g54dvstkD9Yykx8HAd0BI/qsnrR+fUZ4Fo5nw1xmE5oCuEG5J3QM8yA47A6ZeBNWSoUsKfIph5cCzXTupXrEgC6HPXWLNlcH6i8ZlU88TvWx6r2l0nQJYEpDebNmFBz+gEE+HMoxwvvFiXGSVRPi7KiuSi0+w6ktuThSEfPW2fcEqlhBebt/n0JOLa3V/pwt3YkOOy/FFauDFQbBUSLZwTDg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(39860400002)(376002)(396003)(366004)(76116006)(6506007)(71200400001)(53546011)(110136005)(5660300002)(186003)(2616005)(66446008)(66556008)(31686004)(66476007)(4326008)(91956017)(36756003)(64756008)(66946007)(86362001)(31696002)(6512007)(26005)(2906002)(8676002)(38070700005)(83380400001)(7416002)(41300700001)(6486002)(54906003)(8936002)(122000001)(316002)(478600001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V2J0VlRlWTRZK1cxTDdlQzV6ZW5CbUp4SmRIZFhDZWwvSWZ0RkczaDZxdW9m?=
 =?utf-8?B?TEJyc3dKMERxWWdqYWI4N2U5c1dNSEFtMEpnQWpiNG1KaHFtNU9sT3lBNXEx?=
 =?utf-8?B?QjhrcU16UDg5Y0pqbHA0MGhVVkVISFRJelBLSGxpVHhhc0N5L29EWjRRaktH?=
 =?utf-8?B?RE1TUnVwdjFYMDlxTWJqeHdDS3pxQWJmdWNPNExESVJlcFF5bFNSckpKVGVn?=
 =?utf-8?B?Z0UyVkhrLy8remNWaW02OXB4UTdwdENmSTFWYk5uU0IrSHFjd2lKNDlqd3Zo?=
 =?utf-8?B?d2F3QXRZSGdBUE9WS1pycEs4aVUxYkx5MndGYlptZFZXNms5VW03a25zMXpH?=
 =?utf-8?B?SGQzNVgxZ1h2bTBDRUVOUmh3MUkwaEtrUkN4RFd5bEtycU5tY3EvNkhUVndB?=
 =?utf-8?B?OFJZTVovNHF3VnNJc3hLRzRBRStQaVVtOHNZeTBDVUNad1dKNE5uYThNYjlj?=
 =?utf-8?B?dVM4N0tsSDhEZW9OaGJFTlFvbUxNcVlmeFg4NWNkcmRHTE0zN1YxWk9zZ0Y1?=
 =?utf-8?B?SG9pM0c5aXhhZ1ZQUWNleFBCRGszMERSZWQ5a0h2cTZ0WTZkNGdTcUlXYkd4?=
 =?utf-8?B?MTNKZE9uZGVkcDhON00vbTBGL0JUa1MyMWpDZWRIY2hJZ2w0MFN0aVZyV3ph?=
 =?utf-8?B?VEh6TXZNT00vT2pQcmxRVVJvL2p5YTk0aUNxKzFjVnJuQmR1WkIwcFVhZzhn?=
 =?utf-8?B?alUyeHFjLzNkWjhsOStPVTI0dnJGTlFSTjFLNk94MzJoNDdscCtQa01yOUYx?=
 =?utf-8?B?Rm8rRFNLTnlwR2V5NWVSYVNWaDZheEE0M2dUMVJvYTZ1cFJ1OUtKZk1TTGNr?=
 =?utf-8?B?ODBwWHhETitJc0ZhbGJKckdpU0xocEdjYzJtZDBManp3WSttMWhIMnV5TGkw?=
 =?utf-8?B?emRUdnRtTGZMeWVtcUEzYjdrQkVnZWZOMUdCQ0NPUXFrVVY4dHVaQWNLVmZY?=
 =?utf-8?B?YjczSzNNWnhKVkloSVpUZGRWSnNuNU1TWW81aFVsN3dZbzIxMU4wL3lQZExR?=
 =?utf-8?B?NVNWWWhtU3VsMzRORlphS2lJUnd4allXWkVSTnY3R1JXV21MQVJIY09Cd0dv?=
 =?utf-8?B?T09qR3JYNmNBenNiSE0xcmJnMXdmSElzM2R1UDdvZms0WmRabmhzbkZsdXdj?=
 =?utf-8?B?c2FJTkhNWXU1dzlRN01ZRGFmakZHWVhnaDh3Vk5lOUxabU5sdHZvdTNJOHFk?=
 =?utf-8?B?ZmdhQVVwVDdpQlpLMFpZTmtrcml0Q2VVMEJPSURGYkxjcW1CUXZxQlZPOVVo?=
 =?utf-8?B?K1Evbkp5WnZFVHhNNFRaYmJEUDRJbGJkeXhZVnFwYWhONUk1QVJNNStHdTR1?=
 =?utf-8?B?L3FBSlhEMjNuUHV1VmlWaGJOOHF2Slk0Ry9ZRkIxeVRTT2tGL0lDVVAwaURP?=
 =?utf-8?B?U01WMm5heFl4b1hMa1pOUDlHMVhQa2J1MUdUS1VVK3NNbnVTdlU2R25wY1FJ?=
 =?utf-8?B?STlsRXhka1prbUpDaUxUT0s4b2hZeEx1YkxwM1F2SkVYdjFuSFR0NkRaRFlj?=
 =?utf-8?B?Szg2N0EvV2N2Slg4MVM0WHRPcHE1UFk0QUZ5dEZVU2EyUU52bUJIZVRlbG4v?=
 =?utf-8?B?Z0wwTHRydXlkVDJKZDBTOVlhcEJXaUpOOERBVmlXbytpWm05YUxJM3orYnRP?=
 =?utf-8?B?T0F0NllTemVFRUdhVWFIamZFSTJFdWh5Z1FpVERYWXZPV05Xblg4QTY2U2Vu?=
 =?utf-8?B?QzFITFRWaW1BKzlpL0lwbmFrZUpJNUI3MGV2MTZQZ1lsdy9FMms5MVY1TEI3?=
 =?utf-8?B?ZTR5UlExR014enRGbzNxaEo0M0FGSUQ3YlljUWNmcXYrZWVKakJFc2Z4SzV2?=
 =?utf-8?B?dHg1U1YyeWc2eUJXNlRncTZKUDh5U3NRZWRBQVd3OUN3d3YvZkpkaWVteXJQ?=
 =?utf-8?B?MFNnbG9VaTFhYnBjQ0wvc2Jra0J2YUtNZE9LNVA3dm5weFMzUjBxZytsaW52?=
 =?utf-8?B?Slk5L2p0R0FZaW9NYllaSXJZZStrcWljcG1wR2ZKNHdHSno4S0orSGZiVXlN?=
 =?utf-8?B?VEJYb1lRN2NUK2I3dGJwVTBNQjlqMFBBVlZKWU9mWUFFTnBvUmlmYWhKZ3Bx?=
 =?utf-8?B?Tm5GTHAvZ3EwNWJEdWxnTnhBUStNNmU0ZzdNMUoxd1dhbkJJSS83NnZQWGYr?=
 =?utf-8?Q?h+9mD5UZCumqdq3plCOQ63q1v?=
Content-ID: <EB626764EFC2B241879DFB9CAE3CE718@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd43ce9d-8847-4aad-251c-08da822fa9a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2022 22:10:44.7189
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /EmHN9L4nVSqFzVvqkbY+coD6P7Bo3v9tqZyRWVbEbf92MAbODbBkF50TvgLlEkvh7QCxb85qzq4QicPOpRTTIOUcTu5fKwOCfEeoDrsaX0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2767
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_151058_128064_3E4B63A8 
X-CRM114-Status: GOOD (  25.90  )
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

Hey Samuel,

Finally got around to giving this a go with the fix for loading
modules which is mostly what was blocking me before..

On 15/08/2022 06:08, Samuel Holland wrote:
> "D1 Nezha" is Allwinner's first-party development board for the D1 SoC.
> It was shipped with 512M, 1G, or 2G of DDR3. It supports onboard audio,

I am really not keen on the way you have things, with the memory
nodes removed from the device tree. I know your preferred flow
for booting these things might be to pass the dtb up from U-Boot,
but I think the devicetree in the kernel should be usable in a
standalone manner, even if that is the barest-minimum memory
config.

I did figure out all of my issues getting booted, thanks partly
to Heiko. The U-Boot dtb being misaligned was part of it as was
my initramfs with some stale sunxi modules in it causing RCU
stalls.. so sorry for the noise on that front (and thanks again
to Heiko!).

Modulo the memory node, since I had to hack that in to get things
working & I do not want to have to keep doing:
Tested-by: Conor Dooley <conor.dooley@microchip.com>

Thanks & apologies again for the modules-related issues - it was
hard to debug that one since module loading was broken on RISC-V
at the time.
Conor.

> HDMI, gigabit Ethernet, WiFi and Bluetooth, USB 2.0 host and OTG ports,
> plus low-speed I/O from the SoC and a GPIO expander chip.
> 
> Most other D1 boards copied the Nezha's power tree, with the 1.8V rail
> powered by the SoCs internal LDOA, analog domains powered by ALDO, and
> the rest of the board powered by always-on fixed regulators. Some (but
> not all) boards also copied the PWM CPU regulator. To avoid duplication,
> factor out the out the regulator references that are common across all
> known boards.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
>  arch/riscv/boot/dts/allwinner/Makefile        |   1 +
>  .../sun20i-d1-common-regulators.dtsi          |  51 ++++++
>  .../boot/dts/allwinner/sun20i-d1-nezha.dts    | 171 ++++++++++++++++++
>  3 files changed, 223 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-common-regulators.dtsi
>  create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts
> 
> diff --git a/arch/riscv/boot/dts/allwinner/Makefile b/arch/riscv/boot/dts/allwinner/Makefile
> index f66554cd5c45..b0a15e8c8d82 100644
> --- a/arch/riscv/boot/dts/allwinner/Makefile
> +++ b/arch/riscv/boot/dts/allwinner/Makefile
> @@ -1 +1,2 @@
>  # SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-nezha.dtb
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-common-regulators.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1-common-regulators.dtsi
> new file mode 100644
> index 000000000000..143a3e710c3c
> --- /dev/null
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-common-regulators.dtsi
> @@ -0,0 +1,51 @@
> +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +// Copyright (C) 2021-2022 Samuel Holland <samuel@sholland.org>
> +
> +/ {
> +	reg_vcc: vcc {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +	};
> +
> +	reg_vcc_3v3: vcc-3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc-3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&reg_vcc>;
> +	};
> +};
> +
> +&lradc {
> +	vref-supply = <&reg_aldo>;
> +};
> +
> +&pio {
> +	vcc-pb-supply = <&reg_vcc_3v3>;
> +	vcc-pc-supply = <&reg_vcc_3v3>;
> +	vcc-pd-supply = <&reg_vcc_3v3>;
> +	vcc-pe-supply = <&reg_vcc_3v3>;
> +	vcc-pf-supply = <&reg_vcc_3v3>;
> +	vcc-pg-supply = <&reg_vcc_3v3>;
> +};
> +
> +&reg_aldo {
> +	regulator-min-microvolt = <1800000>;
> +	regulator-max-microvolt = <1800000>;
> +	vdd33-supply = <&reg_vcc_3v3>;
> +};
> +
> +&reg_hpldo {
> +	regulator-min-microvolt = <1800000>;
> +	regulator-max-microvolt = <1800000>;
> +	hpldoin-supply = <&reg_vcc_3v3>;
> +};
> +
> +&reg_ldoa {
> +	regulator-always-on;
> +	regulator-min-microvolt = <1800000>;
> +	regulator-max-microvolt = <1800000>;
> +	ldo-in-supply = <&reg_vcc_3v3>;
> +};
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts b/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts
> new file mode 100644
> index 000000000000..df865ee15fcf
> --- /dev/null
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts
> @@ -0,0 +1,171 @@
> +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +// Copyright (C) 2021-2022 Samuel Holland <samuel@sholland.org>
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +
> +#include "sun20i-d1.dtsi"
> +#include "sun20i-d1-common-regulators.dtsi"
> +
> +/ {
> +	model = "Allwinner D1 Nezha";
> +	compatible = "allwinner,d1-nezha", "allwinner,sun20i-d1";
> +
> +	aliases {
> +		ethernet0 = &emac;
> +		ethernet1 = &xr829;
> +		mmc0 = &mmc0;
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	reg_usbvbus: usbvbus {
> +		compatible = "regulator-fixed";
> +		regulator-name = "usbvbus";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		gpio = <&pio 3 19 GPIO_ACTIVE_HIGH>; /* PD19 */
> +		enable-active-high;
> +		vin-supply = <&reg_vcc>;
> +	};
> +
> +	/*
> +	 * This regulator is PWM-controlled, but the PWM controller is not
> +	 * yet supported, so fix the regulator to its default voltage.
> +	 */
> +	reg_vdd_cpu: vdd-cpu {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vdd-cpu";
> +		regulator-min-microvolt = <1100000>;
> +		regulator-max-microvolt = <1100000>;
> +		vin-supply = <&reg_vcc>;
> +	};
> +
> +	wifi_pwrseq: wifi-pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		reset-gpios = <&pio 6 12 GPIO_ACTIVE_LOW>; /* PG12 */
> +	};
> +};
> +
> +&cpu0 {
> +	cpu-supply = <&reg_vdd_cpu>;
> +};
> +
> +&ehci0 {
> +	status = "okay";
> +};
> +
> +&ehci1 {
> +	status = "okay";
> +};
> +
> +&emac {
> +	pinctrl-0 = <&rgmii_pe_pins>;
> +	pinctrl-names = "default";
> +	phy-handle = <&ext_rgmii_phy>;
> +	phy-mode = "rgmii-id";
> +	phy-supply = <&reg_vcc_3v3>;
> +	status = "okay";
> +};
> +
> +&i2c2 {
> +	pinctrl-0 = <&i2c2_pb0_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	pcf8574a: gpio@38 {
> +		compatible = "nxp,pcf8574a";
> +		reg = <0x38>;
> +		interrupt-parent = <&pio>;
> +		interrupts = <1 2 IRQ_TYPE_LEVEL_LOW>; /* PB2 */
> +		interrupt-controller;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		#interrupt-cells = <2>;
> +	};
> +};
> +
> +&lradc {
> +	status = "okay";
> +
> +	button-160 {
> +		label = "OK";
> +		linux,code = <KEY_OK>;
> +		channel = <0>;
> +		voltage = <160000>;
> +	};
> +};
> +
> +&mdio {
> +	ext_rgmii_phy: ethernet-phy@1 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <1>;
> +	};
> +};
> +
> +&mmc0 {
> +	bus-width = <4>;
> +	cd-gpios = <&pio 5 6 GPIO_ACTIVE_HIGH>; /* PF6 */
> +	disable-wp;
> +	vmmc-supply = <&reg_vcc_3v3>;
> +	vqmmc-supply = <&reg_vcc_3v3>;
> +	pinctrl-0 = <&mmc0_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +&mmc1 {
> +	bus-width = <4>;
> +	mmc-pwrseq = <&wifi_pwrseq>;
> +	non-removable;
> +	vmmc-supply = <&reg_vcc_3v3>;
> +	vqmmc-supply = <&reg_vcc_3v3>;
> +	pinctrl-0 = <&mmc1_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	xr829: wifi@1 {
> +		reg = <1>;
> +	};
> +};
> +
> +&ohci0 {
> +	status = "okay";
> +};
> +
> +&ohci1 {
> +	status = "okay";
> +};
> +
> +&uart0 {
> +	pinctrl-0 = <&uart0_pb8_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +&uart1 {
> +	uart-has-rtscts;
> +	pinctrl-0 = <&uart1_pg6_pins>, <&uart1_pg8_rts_cts_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	/* XR829 bluetooth is connected here */
> +};
> +
> +&usb_otg {
> +	dr_mode = "otg";
> +	status = "okay";
> +};
> +
> +&usbphy {
> +	usb0_id_det-gpios = <&pio 3 21 GPIO_ACTIVE_HIGH>; /* PD21 */
> +	usb0_vbus_det-gpios = <&pio 3 20 GPIO_ACTIVE_HIGH>; /* PD20 */
> +	usb0_vbus-supply = <&reg_usbvbus>;
> +	usb1_vbus-supply = <&reg_vcc>;
> +	status = "okay";
> +};
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
