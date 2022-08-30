Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0256ECAAA1
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 06:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ALMuiwt8MOllvXd/O3sgavkAQKYg5Q8oxDrfnm5tKjw=; b=a7p2GfOGBOyunS
	h1KOFhYsyoLMkaXaVSQFxBbCfxRXtNn3TK9V99/qz6GzGhHBTCr15TeTbN/iL1kMqz4u832RZeauJ
	sig/e7Y3bMF0nA2gZNoB88c3PN6m2d5t7ZLL5ruBm7SnC7GlkEir/McVkm48+5z1x0oyL4RYOfUVM
	LJUR0ClxJpE2yOEByN0pHs7fKMrtKZphnyL0h4YclCSwm3u2luNtc1TQKq6+B0KJgLQeO0MxAFofz
	Z/ojRb5FZw3TmMYIbSskq54fbES1LuLik+82JYrv6mEE1BudRIseE7wxjw6/GKGsRPnmDltmch6Ax
	UL31Z22y7HEj//WOvToA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSuec-00EPEO-5U; Tue, 30 Aug 2022 06:23:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSueY-00EPBU-KA
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 06:23:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661840594; x=1693376594;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=oMWfKkuGFtyMXWM0ppj8xs3NB80avGY1sqXgraJwtR0=;
  b=u8dAG9m4nGVeHXaCqTmsYVxD+d9J7NtFY6JQeMoutyEI+XbAQTdJH05J
   HZW4tIHZvUYTWVlQD87xiEPDSt4aTBcYBeu8Tlas03heCJ42wmtZOLQ14
   AGGdqnvsPUtBzRCz0MA2VGhrqVHhwnDqOlSW37MZb1T/h4m/QM6AB2Ge/
   /9nUhjssDBVNlNY6Yn6J+ZMcxgkfeMNnSweZiuDn4PmgK07Tw0Fom20LZ
   fo3BkA6DmOXjPUqE/gy9M7vHVVMCD/iBKjC3WqKX1u3Hz8s4wkESfEGgU
   xT264U+i+j1W+0sKFzQxZ+ROCifG9+OrpkQ9yT8ULNtqEYS1jSb2jSNNs
   A==;
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; 
   d="scan'208";a="174754181"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 Aug 2022 23:23:09 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 29 Aug 2022 23:23:08 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Mon, 29 Aug 2022 23:23:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hNFgGWNiVKzFLoKfBmbKENbOgb4R2mbld9GAiQFyuhF8jbTW2t61H5ZQhXaVi3AXgM0zsELGqwzHu5h8tNobkLKf0kfgX5flScRuuT5pcWgN7xsLuMdbG7oHTod/GBCujvgs5NNyOCQhm2QCVD04jwzBkjOnWrGGJbIyVtslKY6BASPH7UXyi9eBKGx0t4bGurJFAhsUKtD6paalioCklNAIKu/pzZE2A27U7wyEzxZCiOiwcV6Z4dvVPb6E61J8atQUrfzqq1I0Xto3FKLCUkh9zvnTnkQ4AVnT4Rj7QiWUz6A2lFlKIsmTMNaLatUbwaaxClhDj76pDs02VDJK2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oMWfKkuGFtyMXWM0ppj8xs3NB80avGY1sqXgraJwtR0=;
 b=mIxoxKFPSt8R2ql6FwI0YI8q87YrnPmt/qIZP5XuaRj47sszpvfNJxS8qs7VoZEVef5KhEd5+fLLveOABu2dw6gayWfWXRZTzAB6un9lptrzRvmNr78YIvHIKG5lZ+beo0HZNHzV01d3vALwtfylzJPeedS5EHbKusDvCxh2c85OHs0TsteevkLCwVx8GBgKUraScxz9qKWlA+FPRAFigQ7skJpYJWsXXSyvIBm6Zu5hJD6njAV5WHcEPN/19QNz3sTDJAang7Pt2aZW2Kskslo1C3bmlKr1YeEZO5cvbT6Xy/yXos1Ne5+SIQ1ead4BKuE9ulQHV+yCUAnYyh6BXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oMWfKkuGFtyMXWM0ppj8xs3NB80avGY1sqXgraJwtR0=;
 b=E/ETQHQuRH763H0Xf1qSgnK4cNUEoacpb4qBzSrB32RytVUdQPvOG1Ie/b9cXXbQtTCBuDt6d1RQD+MuBgLDe70e/seGTrwplK5iYxMcKVVqUmL2O+eJMDH+jUDbLMCBoEQaByuGC0wDTVnVrfhqU8De72TM/4YKH8vdHsbg7nI=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by MN2PR11MB3663.namprd11.prod.outlook.com (2603:10b6:208:f5::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Tue, 30 Aug
 2022 06:23:03 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%9]) with mapi id 15.20.5566.021; Tue, 30 Aug 2022
 06:23:03 +0000
From: <Conor.Dooley@microchip.com>
To: <apatel@ventanamicro.com>
CC: <palmer@dabbelt.com>, <paul.walmsley@sifive.com>, <atishp@atishpatra.org>,
	<heiko@sntech.de>, <anup@brainfault.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/4] Add PMEM support for RISC-V
Thread-Topic: [PATCH 0/4] Add PMEM support for RISC-V
Thread-Index: AQHYu6ZO+JUY+heYt0OoC/OUwNufja3GJbOAgAC5BICAABvTAA==
Date: Tue, 30 Aug 2022 06:23:03 +0000
Message-ID: <7227f283-4644-b226-e875-23de8da86e1e@microchip.com>
References: <20220829125226.511564-1-apatel@ventanamicro.com>
 <f4b2daab-72f6-ab5a-5743-b41bd5e2c920@microchip.com>
 <CAK9=C2UOGR2VQao8CCJ82mRP4kL_1V=8uXyKj_vnOXW7a=Kt8A@mail.gmail.com>
In-Reply-To: <CAK9=C2UOGR2VQao8CCJ82mRP4kL_1V=8uXyKj_vnOXW7a=Kt8A@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: de4b2bf3-259a-46a1-ed9e-08da8a50183a
x-ms-traffictypediagnostic: MN2PR11MB3663:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LKGGvYaFM5U7sgYCyDDk+LUZvxsUH3qrYRdLBPUWjcR+DHkAqmA4efmkK86d0aRwpGp3cMzZbu792soCh0GWns5qB2uTXhGqOfiD3G4E3x9hWCUzw02nKvP0uWtdAQeJdPFS7/39py0lihNpHKtffxAhwAYFa4ItGpFOmnr+d2FWtLVXR/jqo7g9EjGwF0/vc+74skmn7rhbwfutrrt8OF2Qb1zBCWEd+GMB0M9tYaraRXpJoAaxvZnhshNveLbgbpLBudlHWYjlMD7bRI6A6hFkuqM5Wp4rjUgSU6nWzAN6aMd6rK/jIHC7sfGXTtVrYebDFIb39Eha7nQerW8AsLkVJx9HFrFqu6bpcW+XKTkZkhTNl1Ak2ulCWUQ3Vl2y5XxCslUYgRdpZA8iQGvAOITt1GDFU7j0rdl0mUviR9uedFX5vPANCVnOPdbh4YekuA2KidEWrbnxTLJEfSiwHc3uVtE3+q1CVGsAEkdN9B6zAzHjo3EYyUZIEIdK7dx/nmNmHSOGo41vdTGnmr9QxFOt6VhU0Je5LRP2Gwr6sFhKuAMaUa0Pht9OlfQz5vamjCXWOdZ38LIycm5WCdtKFwvBcDnWAKYiGYRS78eqdHg/oK8GSpTGdwI31VpsnVyxpGJdO2fIRsf3vFNxkMwJ2XAZctaIQ3IXzCQnM8tMZl2UXQXV1uEfeGxSHxD3epAMNoUGJFRxItRuyti0BtfCGlkXLbQ8Y2DUnnrFGucAJRqL6+IPbtF9TWCEhxMGmOFL0NTfNCUOd7EM6trSs+t+ArpNwekzwu6rcNpsAHX38HpFqLGF1pcghdqvs7lwu52wT7VzbGrXIGvDmpCz8a+rCuHlnJeja1ktXnpm8IB5Kbg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(396003)(136003)(39860400002)(366004)(346002)(91956017)(966005)(316002)(6916009)(54906003)(66476007)(86362001)(66556008)(6486002)(8676002)(76116006)(31686004)(4326008)(66946007)(31696002)(66446008)(71200400001)(64756008)(5660300002)(478600001)(36756003)(38070700005)(41300700001)(8936002)(4744005)(2616005)(122000001)(26005)(6506007)(2906002)(38100700002)(53546011)(186003)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SlhLNk5vZU1BdENYdEtRTkZ0RHJFbnRNNE1CV1gxSFNselEzY1V3T3FRdXk5?=
 =?utf-8?B?cTIyVFJiTE9iRHpxTUcrVm4yWGJDVUg3bmVEYzFsbk1EYURwYk8xRUdYeVJ1?=
 =?utf-8?B?OXZUNU1BdVlNZVBTVGFQdlBtVkUwL05EbGJsc2NNdTIybzhCYytmZklPRTFz?=
 =?utf-8?B?V0hnTVQxZU9YSGlycmsyZ2hiY1VMQzlXamsydWR1RmtLZXRsVm1CT0VRcSsw?=
 =?utf-8?B?N3pXZnFyMy9GMDZQenNYVFJaYkk0aTN4T2pneEVndVFBdHYxcWloNmZ3RkJH?=
 =?utf-8?B?d01scTROYzZxeldVYnNZNkF6cmxQcXRwK1JlcFlmVVdPNnBCUSs1UWt4Vkh2?=
 =?utf-8?B?SEU5ZDVuY1dCb0JiVFFHc2hwSzE2c0hNM1loY1ZwWHk1QjA5MTZISzNPc1NB?=
 =?utf-8?B?Y2lJZlZFMHpHaUF5ZmJER2VRTGpHTFlZeExtRm0zaEsxdERNVkNvTFY4WjFx?=
 =?utf-8?B?NlhuTWNrZ2lTMzA4NDVnYSs3WlAwYU9HMWRkd0ppOEdXcFdabVFMNSt6TzB4?=
 =?utf-8?B?SEE3Y3FjbGNpNmRBLzBwNnBUY3ROQXVPQVVBajBOK29lRXlqcjhqSXg0c1N4?=
 =?utf-8?B?dGxwTXE0RllhdEZkZDZxOEcwTkhYd3FibmROcnl5Nng1S1hCNGV5UXY0RXMx?=
 =?utf-8?B?OEhhMUhPOWxxazlxaWZUU2Y5bDkyVlMxN0o0VThTN3djd3VabnVEbEo2UmJT?=
 =?utf-8?B?cHdLdVAvQVZBcjV0U3UxeGIyZUt5QkJSQkdRNnNoWmgwcUdKSTNmL3VFd052?=
 =?utf-8?B?R29VdS96bWhnbVF3SHJHckNZUlJEdEtpMzNZbTlQTllWWmlvQnZtcjZqanJJ?=
 =?utf-8?B?NzQ2UFA0THcvekxZbW9IdkJCdkMwR3FNbDM1M0NjV0t0bGpEZkVGVnA1b2NS?=
 =?utf-8?B?TWpPdXdNcUNTZ1hGRHo3dkJCVE5PT2srMlRBUisrNDZDQVlvU1YrQkhLVjJP?=
 =?utf-8?B?ODVWeitRMW5ZWTBPSEJCZ0g5c05yRklZbUErazBEMXdKZHdBWjdBcHF4QTFh?=
 =?utf-8?B?Y2F4bFdURHdCWG9reGxHcGk5bCtDWkE1enUrVFhhekZZaGxnMWxSRENYYWdP?=
 =?utf-8?B?Qk5yNUxjZ3VFM1JZQlRqV1h3K3hlTGo1NnZncE1JRk9xVE5UdDN4VTBzRmZH?=
 =?utf-8?B?NEMwemlic1J1ZnF0UkwwVTRzdHNPc2hKYlhOVkhxOVFUOFZlTVhTTElKbEd6?=
 =?utf-8?B?WmVnQ2lRalRmM0ExMDlRMUU2T2FVaTU2ZXZlcldVQVNwajYyVjZlWjdMdEpl?=
 =?utf-8?B?cGR0eEZVOXZXRkY4bnM3SzQ5a0JOWm55azYrVWxEZHVnY3pvd05BVk44emdH?=
 =?utf-8?B?MFhHVWQxZEgwN1NWak9ZRHJKdGlPemRmTG5TYUdSOTJyTm9pb2dSN1o3b0g5?=
 =?utf-8?B?NTdlSDc3bS9tWFMzQWI2Yzk3a0R6clFRbHJNZFhuVVVKaE96R3dJaEFyUjg2?=
 =?utf-8?B?RFBXWCtwa09aM0p4S2JHeTE4aTVPSTZ0ZmQxc0FmYUMwOWcrWElkOUcwdnkv?=
 =?utf-8?B?SDUrZHZzZGdkOUI5TUhyUy9TVkszYmcvQk90VWFPb0U2TjNlT2RUbVZsbUVL?=
 =?utf-8?B?V3RWY1pEYlFZZTN6b3M0cnhSa1NzTFcwdktIRU15Y2hjNHdtU1Y4Y3Jhb0tq?=
 =?utf-8?B?bnBYZWZreEdxQTgvUHRkM2dxdzZ4ckFlOWNNRFlqeWY4c1BENE5hTFR3dThq?=
 =?utf-8?B?cmhTNmQvR3lDcVhMSDhub250SWpia1g4Q3oyT0paSjBDaXFMNDhxSmNiVGw2?=
 =?utf-8?B?YVAvdnRHdjdBaEt5RnV0U3FrNDM0OGIxUGVCV2hWTTFmSkdNREJ4d0o3YVFH?=
 =?utf-8?B?L0cxMFd3ZCsrT0FoNldvRDRUNkhOYkIwSjBvVVlpVFdFUVRkOXBON2dnUzFB?=
 =?utf-8?B?dERQNGptalFmK0lZZ1VPak84OFRnYldTb0lZaFQydnNoUE1wVkkvaVNzVDdZ?=
 =?utf-8?B?MktJU0YzckY1Rys3bzZ2bUNWb1pTZllDN21KcXRWVkt0SnI1VUFjbGRteHBV?=
 =?utf-8?B?aEtYcEQwYjB5R2tWUTBvNEFLNVM1ZEpXOFBkUjBKUG5nbkRmYWtSQmdOWnNJ?=
 =?utf-8?B?cVlpZDJva3pYbXJlWUdWdG1rclhDdSsxMmEzL3FZMXRLVGdrMmNHaWdyRzU4?=
 =?utf-8?Q?sbeizgDTpjJ9LNg46eaxGb3hW?=
Content-ID: <3468389B9BB46E4799BF1A70F097E4BA@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de4b2bf3-259a-46a1-ed9e-08da8a50183a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2022 06:23:03.4409
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dpDwhvvxq9A76UX9e4LleLr4ARX0JTRnxy/7MTeG5+y8L/+I09GCuZDdEH499Gfby9DCIy8LBKWhui4sf63fLubSzM/Qt0yfQEVO9RX8M7s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3663
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_232315_003697_EAD54010 
X-CRM114-Status: UNSURE (   8.65  )
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

On 30/08/2022 05:43, Anup Patel wrote:
> On Mon, Aug 29, 2022 at 11:11 PM <Conor.Dooley@microchip.com> wrote:
>> LKP already complained about this prior to you posting & as it has
>> all the repro needed, there's not much point in me sharing my config
>> etc:
>> https://lore.kernel.org/all/202208272028.IwrNZ0Ur-lkp@intel.com/
> 
> Strange, I never got this email.

Good ole corporate firewall maybe..

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
