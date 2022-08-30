Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1DEECAAD4
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 08:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BjDZrysOFQ2o1sMqMzWL7twup8GR1FPbNDsJg3uay1w=; b=fMdXzfxv3g4m88
	B6ob4R5S4bAZDBetrdLkW27NM5TL3cEFVDW6OKlpkhXPQhM9Mr4f1t2ju/JyydvUsObTIQ29b7Zzq
	FH+SPiI2VjCmKBe61muPSm+rceI2hCqPi6YkAEqFLxOpzo4j/MkQi9UVnJ+rDfltzcAg2coNQBxNp
	mGZROal4H8FEeeVsg+B7kl3TAT5B/aQUgrwSWx4LY+xNo9+PwBVeEBEVvrBqFEsp8ZjEfkH/wIg/i
	pmN7srXSeNe9K2ZzRzlnYOHAh8m/AMcPHhXNqArvuNYmgpmo8FPn5IJxw0Q34OrsmIXCGA6O6t3nU
	2CLU1NMDLwOjCEED/p9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSwoa-00FIsX-8J; Tue, 30 Aug 2022 08:41:44 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSwoS-00FIr1-Kp
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 08:41:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661848896; x=1693384896;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=rRBBLGuDHgzMKEIK8TPNwlkTULY+CMBRH9tBEoHzeDs=;
  b=ZnTqKFjMF5f2qhKgmSvjVIKZiDwbLxETlZa+D9g/0HkZP6bjC+v++z+p
   DhMIEkHJO78946nppsUtW71jG+jDZdbQXAuQuhpNIkSzIxMd0dcv199mR
   /3YF76DHvC9wxD6y7KjibN2FQSnwoFkOYojTSid9ANHwcOLR93nHbIrO+
   /7jxhfIQYXxh4HjfpL+ei3axywR3dXv0TYSVIYuCk9mVX4GK0bx2McMt1
   TjYQxwM9026D9pRRnG09DscetSmLg5upu4q7osUhZCTBLuF84amND6Rlc
   vH6WkhWBHlG3J6z4UNrTwaaIr71ZC7e7JrTuNaNvw+xnBKBwY9vUZL0su
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; 
   d="scan'208";a="111347873"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Aug 2022 01:41:35 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 30 Aug 2022 01:41:35 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Tue, 30 Aug 2022 01:41:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DH44KfEPFu1wEAXKnNoEqTyysSrjf6zAcJsIHoZBNtqSWgbZh4n06cR+veay1eE2FSnWVwO1NEfwuUL/KLvDorznTWGobAIlU6t/bOZp/y73eikpSAfy2pyEqK5DhvcOC9jykKVIG/wRyXxKMMgdtpzKzowppHm0adE6vLTspsk9YwN6v/cvcBcCyxRszwEtggIrRMozLuBbqT9zXD6E+bQcaZ7ocMfrhO97F4jbID0FcTOehFjom6MFPUd1IrM6BVu37Woum0rFUu8Wg2cNu9uKVxcerFy/fOM/3EZSkK5di7w0YAj1vrbF7b5Pvg8QmCUqo36xnixpxXb6oGc/0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rRBBLGuDHgzMKEIK8TPNwlkTULY+CMBRH9tBEoHzeDs=;
 b=aQWHumTy08xn2Jv4gR4rAT1vYEFqICbL+a9T34a//PHQp65HXDIjA5vi7sX9TgMFTumEgvZJWBtfHg8+zkwscsc1/VlBIzL4IwdQKdJlzPzurRZKLefLQoCefQLuUlAj+DH67op8iXMIDFgYICEsCA0CH4pSbLOUJBLfo9mqVhFrB7cUMmnl1uOfrq2xrIOhDeVdjMlCHrYjvMrz8JiQIe69CrIZIKb0xp3C4Y7vwELplLZp+8AokPuY5/Oasphqbls1cc/dFLI8D6IN6giGyTExdZgwpUhhnq8jFpTs8nE/gcqSlaPFsbq2U1HcCI3BGEY3uuDYK9+vmD34Yd27Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rRBBLGuDHgzMKEIK8TPNwlkTULY+CMBRH9tBEoHzeDs=;
 b=vF5yhnjfOijvWgb0rNlfcEkujGX8MtuqbbXQiStueEmOIVGl3W6snMUOuWoYVZNJ9duPxjWyb3FdQPkdMVbtSGmXlYUrqutjHknlNl9onXwm9zDJJ6DkSylZJiLcBzs9LKx5MSXE2iH5AfZNYQyD7EU3dFA3DeYtsY6VDm1fXwQ=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CH0PR11MB5233.namprd11.prod.outlook.com (2603:10b6:610:e0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Tue, 30 Aug
 2022 08:41:32 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%9]) with mapi id 15.20.5566.021; Tue, 30 Aug 2022
 08:41:32 +0000
From: <Conor.Dooley@microchip.com>
To: <zong.li@sifive.com>
CC: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<palmer@dabbelt.com>, <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<greentime.hu@sifive.com>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] soc: sifive: l2 cache: Rename SiFive L2 cache to
 composible cache.
Thread-Topic: [PATCH 2/3] soc: sifive: l2 cache: Rename SiFive L2 cache to
 composible cache.
Thread-Index: AQHYu2+0mRQQ5mCpPkuQboDoEF5AOK3FdGUAgAAawACAAZKDgA==
Date: Tue, 30 Aug 2022 08:41:32 +0000
Message-ID: <e155125d-6a8a-aa28-b331-9c36d21305a5@microchip.com>
References: <20220829062202.3287-1-zong.li@sifive.com>
 <20220829062202.3287-3-zong.li@sifive.com>
 <1a0da77e-8b26-a6aa-4af2-bf852470230a@microchip.com>
 <CANXhq0rHnsRP=Djin53Nc5n3aYY-=ALu7=F-1Y+-U3_L_ehG6g@mail.gmail.com>
In-Reply-To: <CANXhq0rHnsRP=Djin53Nc5n3aYY-=ALu7=F-1Y+-U3_L_ehG6g@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bcd6852d-759c-40aa-aa80-08da8a6370ea
x-ms-traffictypediagnostic: CH0PR11MB5233:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +sglhhcUIKCCDeIR8Urh1t4woDTCsyeN50fHxJx85zD7i7tN6ZUmknm9PizkBthwTCmQTfrNGVeP65w8+X1m7UMWlEsqhzge0Ke0WbjKnjiJyRfSkETeDMQ25yBUgPy/xRpK+nl299FIg5aJ9kWSi9io4gM64nW29aYdwOpe60bQGlcdzdkIuUphgztx3j3g42ymO8ZmcUmsDDsL42mxDBdpZSBVV6cVKsC7X/DNbUeApnthmmIvD7GZTL6+X3BVkbPtLK+gxi2j8t1BzJURrsC8T4JcOXeRHSTUMZZQSKGfdEunwMpmvBPmZhCSQBsaUuld6KarZGFQ142UvDNBfRik1WBdwylLHifauZDhqoE/nnqCztFlHatfb5SLRhCq0G+g3X7tob51nXXjUktYSTG+iOmCkf21P3TCwEdIGFBoTtgULUsXOXGJQgYCu6p065M+bTTprUWoY9Z948Qd+1pghMYJLcMC8o4b6SaGhl7jmrtKcdjHD2NXCagOptWv1hLlGeZAOR08dCdgc8jgAfyiWf5MkkJd4TBlOj5AOejExgKZLIbX+PEx93Dkifn6SHA5nc00MGAEDOeSfYMTYsb2QCvQp50AgGLQMtMy5yhVeUGF2M2n7nqtol6hDBdXS8GA11LNNYC4zCol+roTZbS3HtzJksXfzQxVMUooPQrOG9lMM+ublJY8ootr4prAWxERCo6YcCbQ56bNjNhRXdiewOo01dKcM94N6L+AeYURmyqGjkwvLHPfvovH3aCoMlE0b8wXL5LF54iujQpJrjqTK2YFDp5ColfsECqvmcvP3mFSE6cHNAkGx1Rvqlk0
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(6029001)(396003)(366004)(376002)(136003)(346002)(39860400002)(64756008)(91956017)(2616005)(53546011)(2906002)(66446008)(4326008)(31686004)(8676002)(66556008)(66476007)(54906003)(6506007)(6486002)(66946007)(76116006)(36756003)(71200400001)(6916009)(186003)(83380400001)(316002)(122000001)(6512007)(26005)(38100700002)(86362001)(31696002)(478600001)(38070700005)(41300700001)(8936002)(7416002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cHl3MVZUSzBCUCtveFR6R0tyUFFjdGRGZ0lwbkF5SFh5RWJUVTBySlJCTUpU?=
 =?utf-8?B?ZlJnOXRtVC9pVjJUWWo5N1VUYThSc28rdjBJdTZ4UUdlMjIyVFZsWnRTTEFL?=
 =?utf-8?B?TXlMUmI5dGFJRzhLaGMwNDRtZmVWVG5nNjcrUTQzb3lCWkh6M3FWV0xiV0Jk?=
 =?utf-8?B?ajZCYUZKaThtNm5KUWx2VzJIL1EzRHBWYVBMRGtac0YrUWk3S2p4U2t0NkZE?=
 =?utf-8?B?K0Q4Z1pDUEdYVmF3U3pDSnZDSE90Y2RYQmZlVWRoK2Q0WElFVkViQ1hwNGZi?=
 =?utf-8?B?cll2bHoxMit4c3VLRW5YV3V0RnQ1NkQydVV1ZlFqVG0xcnVyczVDRmNFb2Nj?=
 =?utf-8?B?QlozcWxrVmNucTNDZHdXSGlOQVRMNkc1TU9lNTNtR2ZKZWV0bnFKbUVpbm9C?=
 =?utf-8?B?ZzVKbmJZbG9KbjBzYXFJVUw3eGdESmhpUEtRQ1ZHZytjVTg1RzV1ZU4wOHo4?=
 =?utf-8?B?a2ZiY3lrREJoa09zUXgxd041S3REeHBSb2NxRU95V3Z0NW1COEVuMWM1MHZW?=
 =?utf-8?B?Y0x4RlF2eTg5UFhST0Y3ckg1WmJuVjRwK1E3eEtJSjVaMFJzcWxUNDhUdSs1?=
 =?utf-8?B?RDU0Qks2VmhRTm5LVytTend6NHVGbWl0dU1rMTNtYVQrTHpFVldtRjZvUm44?=
 =?utf-8?B?cWJWNXNHaDFQcjBHZnhXdGdJT3VxUWtqbFFvTVlIV0w1ZEo1SUJ1WjEwMWFh?=
 =?utf-8?B?THFTMWNOSnp0ejJDTElsczBsUjBsaUt1SU44WjluWk5wSC9VcjlQTzVnb05o?=
 =?utf-8?B?Wkl6WWdVKzVWTUs0NDlFTlpwQktyY08wM2RFU1NIVjd2WGFJY09VT0RSYktP?=
 =?utf-8?B?N3hBMDBPOEdVdDNReWphK0JRZVRuWWN6aUFzalhoNkdUV242cWpDUUoycHlD?=
 =?utf-8?B?YzAwckFZeU9xeDRuZWl3bFNaK2F5Q1NadnZaVk5xNnFOTytGeWF6TzV6emcz?=
 =?utf-8?B?eWlTc3AxeUU4eTBwNWpUQ21ZWEgrZ2JSYjVRWU9ONUI0bytYQ0gyY2NOR2FC?=
 =?utf-8?B?eWMwYk1BWkhXSnJYQXl4SzdpRDVGaVYrTGlUWXdOVy9tWEZ3TVBXUUNkTFB3?=
 =?utf-8?B?TGFLUFZxUXU4VzV0Njh0cG1yU2N3V2dPb0FRZUVWOS9ObFFBck94U2QrVksy?=
 =?utf-8?B?b1Z6dTRZdVFXVW1vVGlCbGUxSXRkVG5qNUVsejE3TkpSR1g0M0N6K3NoQmxQ?=
 =?utf-8?B?bDZxU2toT1pwUEJ3TzY5Y3NkbVhWVUpUTDFkenNuTncvZ1Bpdmpab25DUHdO?=
 =?utf-8?B?TktyMWUrODYwMlJvZy9IeEVxTzFwMU9lMGh3aFBMb2NUVkhmS2xMRGpYL3J5?=
 =?utf-8?B?bmRjdnJhQkxuRE1vUEI4N1RydE1zVU12V0RjQ3FHU2lYRnR2eDA3YUtjMTdx?=
 =?utf-8?B?RmV4Y2lrZFZUTE5BQ3lWWmR2RmhTdE5tWUN2Z2tCVHY4YVFla3kzbWhYYXdl?=
 =?utf-8?B?RnBHT3Rmem1mMi8wVFZ3NDFUU010U0gvL1JRangwNWtDbW1VeHEvVk5YQVBn?=
 =?utf-8?B?RGF0UHNOM05XYkFHWnl3NzgwbjZaK3h2QUpTNUNncktCUHJ3QlZSdXd5bGo3?=
 =?utf-8?B?aFF0SWJHYkwvc1hJeklDL1FDejVpWXBocUFxOHRTR0w2YVlPdjY2bVY5WGIz?=
 =?utf-8?B?M3FXb2RPYTlvUGNqdzBjSDRxckplTWpaSzc0VHJsK0VqS1A0dDZUeG0xWTZj?=
 =?utf-8?B?TkFReXFjNjE4SXNiM2E4NXBsS3JlekxXMHhzWHFuRGtNTHhuY2drQmFTZHhZ?=
 =?utf-8?B?Ti9aaWV4OXQ3N00vOVZ4U05zTTZ2bzFuNll1UTJLYjg4anNPYVVGaVc2SWV3?=
 =?utf-8?B?Q1hBUzFYU3A0SVdmSVhwRWI5bmRNcHN5ZjE2WE5HSmUzU0xJSmFpdzgwTXov?=
 =?utf-8?B?ODNkcWt2NEVlZ2hNS2x6dk80R0VEUVhOSk5mSlNTd3VwRFBKWHk1d3ZZSWRS?=
 =?utf-8?B?WmgxdVBwbVp2Qk5KNlZJdFgxMWJQQTJrWnFwTjhPK1dqem14UTNuUE1VaWNr?=
 =?utf-8?B?ejZsMm1Hemx4ZHFpenQxQXg0NkFnQ3dZbWxSUHhwL2hkUzBvelNFZm5zYzJG?=
 =?utf-8?B?ZVVacFNoWU1UZHRLbU9zWlZNYStCaEdZUmJSdE41bUxBeVZzdDI5cG9BNFRR?=
 =?utf-8?Q?3Iq1wpoJRjF2LDU0nPGKvei8w?=
Content-ID: <9C6B735A020BF64C9715D11F8B32B905@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcd6852d-759c-40aa-aa80-08da8a6370ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2022 08:41:32.7012
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tapRXA06q3d8n7Ku5bwEbdEAumd83rijgiRMH4uEpniC1/PfUz5DBFhEYi6INQ8ZETk1nSp7aFfduGcr0cddtD60bI22/r3WBiqs0MYgdko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5233
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_014139_982314_F19435E0 
X-CRM114-Status: GOOD (  20.12  )
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

On 29/08/2022 09:40, Zong Li wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Mon, Aug 29, 2022 at 3:05 PM <Conor.Dooley@microchip.com> wrote:
>>
>> Hey Zong,
>>
>> On 29/08/2022 07:22, Zong Li wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> From: Greentime Hu <greentime.hu@sifive.com>
>>>
>>> Since composible cache may be L3 cache if pL2 cache exists, we should use
>>> its original name composible cache to prevent confusion.
>>>
>>> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
>>> Signed-off-by: Zong Li <zong.li@sifive.com>

>>>
>>> diff --git a/drivers/soc/sifive/Kconfig b/drivers/soc/sifive/Kconfig
>>> index 58cf8c40d08d..3d65d2771f9a 100644
>>> --- a/drivers/soc/sifive/Kconfig
>>> +++ b/drivers/soc/sifive/Kconfig
>>> @@ -2,9 +2,10 @@
>>>
>>>    if SOC_SIFIVE
>>>
>>> -config SIFIVE_L2
>>> -       bool "Sifive L2 Cache controller"
>>> +config SIFIVE_CCACHE
>>> +       bool "Sifive composable Cache controller"
>>> +       default y
>>
>> Changing this to default on is not a rename of the file..
>> This should be in a different patch.
> 
> Okay, let me separate it to another patch, but I guess we could remove
> it, and enable it by user. What is your perspective on it?

Personally I would like to leave the default y out & leave it up
to the user - the driver is more informational than anything else
so I don't think making it default to on makes sense.



>>> +
>>> +#define SIFIVE_CCACHE_DIRECCFIX_LOW 0x100
>>> +#define SIFIVE_CCACHE_DIRECCFIX_HIGH 0x104
>>> +#define SIFIVE_CCACHE_DIRECCFIX_COUNT 0x108
>>> +
>>> +#define SIFIVE_CCACHE_DATECCFIX_LOW 0x140
>>> +#define SIFIVE_CCACHE_DATECCFIX_HIGH 0x144
>>> +#define SIFIVE_CCACHE_DATECCFIX_COUNT 0x148
>>> +
>>> +#define SIFIVE_CCACHE_DATECCFAIL_LOW 0x160
>>> +#define SIFIVE_CCACHE_DATECCFAIL_HIGH 0x164
>>> +#define SIFIVE_CCACHE_DATECCFAIL_COUNT 0x168
>>> +
>>> +#define SIFIVE_CCACHE_CONFIG 0x00
>>> +#define SIFIVE_CCACHE_WAYENABLE 0x08
>>> +#define SIFIVE_CCACHE_ECCINJECTERR 0x40
>>
>>   From what I can see, you've also changed these around too?
>> Please generate the patch's diff so that the rename is detected & the
>> diff shows only what changed in the file. The -M option is what you
>> are looking for.
>>
>> I have a couple other comments to make about what's changed here other,
>> thatn the rename but I will do so against a v2 where the diff is usable.
>>
> 
> Let me sent the v2 patch, and separate the rename and diff part

Great, thanks. I'll take another look at it then.

Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
