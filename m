Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4809CC32772
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Aug 2022 20:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=04AXW8dmu4g7yhjwRzbu4Co1ULGh19q/hs5reonsMF0=; b=zGdAy/elprE+bn
	UvOAR4/GBb+080n5jpgq/S8bortKQSntV2/zP5JrSwCA7WEJ0YOMDx4NumEzTYiQtykPjbz8EkITW
	ZmlfoMcWFrHxb/C4r7ZFls+/uv/lh1lUAelvcweIFZ9s8A2ljVZ8TDulEwLqFLGa3MXYYr+rLhb+9
	VXhVfHDvikWbtpUb1l8rVMiHNS3EnOISPKg6afpyBM5NJeDm74c4nBy3lCJrjfHtT2KlLaBLmaUJv
	CgvmiBppWVyHcm8QD16NF/7klHGRk1qA2ZTUoi/EpvBxhnT0j8WAFiEHJT9FA4PmrayKvClgJbwGQ
	mHnfFi7ks+ez+37Ghbww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQaPL-008gUn-2J; Tue, 23 Aug 2022 20:21:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQaPH-008gTd-HR
	for linux-riscv@lists.infradead.org; Tue, 23 Aug 2022 20:21:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661286111; x=1692822111;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=fd5JEAj7DlgUcvTkhEODPAN8zWSiHUIrL/kK4e6oHbI=;
  b=J+6BAvjjT0pb6mfn40JF9csjz4BosF/FvC8EGLtdnmercxuXqyl2B5TU
   aDVs3C0dsRsODz53fNShUplZ6NGp6hT5QW0BmaCyLpM7J05qTagD/4cSI
   ayDqeDUhzAM8eUBtCLwKIrbJwUEqpKBmw3Dg/NgAMe9AQei4q8eI3Ba01
   gt1zRqzuzDE4E3LFJ8dd2iVgNWHP0h0GGMDH85CukEB9h7fLIWB6xVQST
   rxFqVe9CJ1gqbF5bQa7eCkN76bMmTSWdWxnI5KqTXMk8/3SYBl7K4ABZh
   SLSibBae3r4AQHBZfUqhWR/c/TApOPORavwZ5fULkTSfUS47YjlCSIsxt
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,258,1654585200"; 
   d="scan'208";a="110384176"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 23 Aug 2022 13:21:46 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 23 Aug 2022 13:21:37 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Tue, 23 Aug 2022 13:21:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YvoYq21qFwdoqCuZHrL/7UlwAvu1fW6HAHDGoO10dptDyfp9oE2UPc7BLB8Z6ZggCwZKCgjS9hWQilsQhExZIwze8x8DQt7T9c1XK41o2eqYSMiVhXyD5tv0ZqPI5ncXWu26b1iVw63Ib840Sh4m77i/2vEuHI3a8S/rsadpbU1TGIC6D+4hma+jXPwAf5SISbJctPiuP6SRPTdvfACrkD2wHzLYIPU5j9vHU/7yUZ4on2SWMBfG0DyFzQ/28LyZIEQkldvsDnmIyu1xr+bH/OouzmlzhXcw1Zq9tgdNe2Gm1njHgZVLQdA1n+oWZwJEX8R4KTmXgxOnOmdHhreLZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fd5JEAj7DlgUcvTkhEODPAN8zWSiHUIrL/kK4e6oHbI=;
 b=iZdVB/ik+n7h6jWvdT5HESpAXc0MjcHcD662j1d9ssOLD73qDbF/TN4Ghal6jI+S4RJex40vttWcBFl4flfJYku6lvP1ZUbGjfJA4c1Ua/72F843p6T8WnHf3xTe6dlSbNUbE4TETgAXb7zMRkFd5pusvu/7FTU3nV9R4+l45ujLQF7RIr2FC8KH+DAhCnS6jJ4JMQfZo+DMjnTTqQ17bN3jd6JhbhbOYFfIz8/ajWxS4+6tXGwQity1W/l8EUQY4l/tGXvCUdcRYQh5wiTc/IjN7cHafzqUGa7KVNMRfSg1Y7TlVDHLOptYqLqbcTUC1R/PsJqrAYG4vD7sPorgOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fd5JEAj7DlgUcvTkhEODPAN8zWSiHUIrL/kK4e6oHbI=;
 b=bBNkU+dzUNw4Ut4jh8AfkTeT/0puf3Jz6XtRxPWoFS3L9MpGKgbl6hiE1LtYLFybMCiJ/UICVMlfdBQulqPD7xval5dztI0moZYIMksmA4Ep9cvJnvch4t2n4/BF44SyTcxReCw/aJyYa0k6iZhW+OjnDgof4RI62AkyXsPvEjE=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM6PR11MB2780.namprd11.prod.outlook.com (2603:10b6:5:c8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Tue, 23 Aug
 2022 20:21:36 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%9]) with mapi id 15.20.5546.022; Tue, 23 Aug 2022
 20:21:35 +0000
From: <Conor.Dooley@microchip.com>
To: <lpieralisi@kernel.org>, <robh@kernel.org>
CC: <mail@conchuod.ie>, <Daire.McNamara@microchip.com>, <robh+dt@kernel.org>,
	<aou@eecs.berkeley.edu>, <palmer@dabbelt.com>, <devicetree@vger.kernel.org>,
	<greentime.hu@sifive.com>, <paul.walmsley@sifive.com>, <bhelgaas@google.com>,
	<krzysztof.kozlowski+dt@linaro.org>, <linux-riscv@lists.infradead.org>,
	<linux-pci@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/7] dt-bindings: PCI: fu740-pci: fix missing
 clock-names
Thread-Topic: [PATCH v3 1/7] dt-bindings: PCI: fu740-pci: fix missing
 clock-names
Thread-Index: AQHYtCGI89ol/1151kuiN4krOoIqia27UDsAgADPt4CAANOsgA==
Date: Tue, 23 Aug 2022 20:21:35 +0000
Message-ID: <8a8c39ce-5f4a-655d-de1e-952fd7392cc3@microchip.com>
References: <20220819231415.3860210-1-mail@conchuod.ie>
 <20220819231415.3860210-2-mail@conchuod.ie>
 <20220822192032.GA283027-robh@kernel.org> <YwSFPwOkPIVC02fM@lpieralisi>
In-Reply-To: <YwSFPwOkPIVC02fM@lpieralisi>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e1a9dfc5-1f01-473e-b36d-08da854513d8
x-ms-traffictypediagnostic: DM6PR11MB2780:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4svo34RZhVJqKq0ZrFWDi1as7X0QT+qai0aamW4jYn/fu6j56PVbhgCxWiieU65t4oap5yXIZTQF8EWhdV1NxpCUego/jVoKGrdgMQEtmrP1Y/Gk9p6ixMHblsA9vdfT3KX8U0bsX2nlcF8RWlKugdEG+MURY7eks64lIIa7+XqmQtcMd1xMRvxgJRZLUYy+8Di9SbF+L1YOE45d6YMFMsQ4TyvwmrNOEGZKwdEr/oP39j3Q7IyHYD2aDBOviP9Ev52wiXdlFHBjLLYPqOP+epjJBnrPu7xpiHxLNbhXtCMAq1ZLVzaH59i+Ehq5q1a/901kZKUgNiIAsw9fhMGR5ZP4TmzfZBu+vexsRiUsHa1Vcis87WT7IwsYuxAuLGOgmkadX68/xWX5/LhBxTtAf1bP0chRTDlRUa5exUJBiWdt0Sk45Jb7ZV18/Ipvbq0uMYNskCWg45JWSWn5/D9gC/HufxjCQQvI1/VkCDyVCg7+1IHwWh3b44gf8Zx0aiF5LnIlYsL64YxlkEXWsIdTn6tHA0Jbna72IsQ/daWjdPZkbWtkDR1rJ0UY26kqvIX0QFcNQz/KIS1N9+J/7QNOTrFNk7abY1692rd29RcXaxlGrh5YiD3uPbSRPX1G4P0XBTTJkICUHBhoc5aqzsg6ICXnXMV80R5vaBpSOkP0eQGzICt0KRt+t1cqnHbu4GvWVUO+LqV15HMNgGQYY4axma/x/2G4L99fkDEdHQKHlkxacaUHRi0cHF0PqwuGsx81vi9xAI/pURF+Ks4+W6DxNDRDVS2WWiOtsmTEWMi2mQY1w+p4j5l8FwGOyMKqFAs/VEbEr4o9U8AcrFF1g3yAPw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(376002)(136003)(346002)(366004)(396003)(36756003)(8936002)(7416002)(316002)(66446008)(2906002)(76116006)(66556008)(8676002)(66946007)(54906003)(110136005)(31686004)(66476007)(4326008)(53546011)(26005)(64756008)(71200400001)(5660300002)(41300700001)(6512007)(6486002)(478600001)(6506007)(2616005)(186003)(122000001)(86362001)(91956017)(38100700002)(83380400001)(31696002)(38070700005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Ly95K3E4dlpKYWtERjRFOHlkVXFzNjR5bUkwaTgrMlgrK0hROHQweUxtYUhP?=
 =?utf-8?B?ZjA3TFBRQVlYc0k3dkFyVjlwSDRpMVdSVWxGMVpFNTFlV2l4VndudHNlbmtz?=
 =?utf-8?B?Vk10OW5IalJITmx0N2dwMTdqcGV5SFpNQzhSSU5SNTJWNDZlQ3lwalFOU3Q2?=
 =?utf-8?B?OEZaYmt0Z1hoNGtpdUc3eEZINU5lRVMyRnRDOHMxRzF1dlRCbUlHRVVIRVc2?=
 =?utf-8?B?VldOdEFMWDNTUkhraFF2WlpJbjlpWkJadGM0WG8vMjZKNDVQMm5KdUNTc1dC?=
 =?utf-8?B?SzZPSVBRK1R2UnJGRUpFOWVWMW5FR21KbnlaM3FqeUF1SXhXRS9XcFUxSEZu?=
 =?utf-8?B?aDFFdDRyOWNXdVBMQkJ4bU1VN2NsSFdwWEZrTDluMks4bG1pWWNHSWJuRC9G?=
 =?utf-8?B?TFV0TXpmL1RuU2h0RUpvZmpTTVc0b0RnejVDbHpDeE1FbFZZWUdOVkVWcUpp?=
 =?utf-8?B?Z2JWLzdjczc4bm5Fb0ZtNDB0MUN2MGtPNGVDRncwUzZHVy9GN1dVMVhieDVw?=
 =?utf-8?B?U1NReVFpWkp0UGMwQ2E2NTlTL3FKdjFjeXZyRFovb1p4aG1CMEZ0T3dJTEFO?=
 =?utf-8?B?ay8rVGc4WTBIeW1mcVRCU29ONlZyK1ZQRUxiY2huc2RuN0NIMXJQV1JnMFNW?=
 =?utf-8?B?NHRNWVdxY2NZaWxMbUJJTWtjWlIyVy9YbllocjVLaTdVTnNZSjlKUUUyS21Y?=
 =?utf-8?B?UTVmZjgzY1p5TzB2UzkwNVU1S2c3R240L3hhTzZwYlRHNzh4UXZHMHFYbnRU?=
 =?utf-8?B?OEh5SDc1MnJkY0xUWUxxNE12MHBqZHZENG4rUTB6aFZIcGdHZnFSVmZTenJQ?=
 =?utf-8?B?Vk4reU5WamYraEZORFdlc09ZaVlQUG8vNitYUG1DZEt3MWE2ZlExYWhjRy9N?=
 =?utf-8?B?RU8xZVNnOEJvVTFrNnJaT3o4WlBZSkdZNzUyUFpCSUxENFBpdlcyemdlclRw?=
 =?utf-8?B?WXR5UUxodkpTYUdISWovRlFiZmI2UFRtcVcrQmZZMGVZVysvZjBTeExJZWpn?=
 =?utf-8?B?THpIbDJBL25PRlNTNHYvc0R2NzhwejN6RTB5TEs0SzYxSDF4aGE5UENtbWVu?=
 =?utf-8?B?QWxWVk8velp6NHUxWW8zeS93dk05cWx2L1R0R011ZlJSTU9XNUNHSVc1WVdS?=
 =?utf-8?B?YkRCSXBhbDVwdmh0WElITGZqbm11N0JsWDNrZkxpWGlYN3JKeTVQRmt1ZklZ?=
 =?utf-8?B?dzV3cS9pdWFEM2hoTlY4d1NpMEhaUkdLVWpjeUFnOHd1OWl2eDRBY0xzSk1D?=
 =?utf-8?B?S21xSFlpcGNJRlhPaUxYSGc1QzU3K2tCQ1FESWRTaEZHdTZiMnZUdkltTTgw?=
 =?utf-8?B?bXgvY2IyckhHKzRDMHVLS1ZyZ0h6bzVScG1WVkdNTE43anRJTUNIWU9qV2xv?=
 =?utf-8?B?RUFjMCtoWEZFclFuMjViYnozc2h6dHQwbGNVSEZCYjRUTGphZ2sxamdxTUtr?=
 =?utf-8?B?c2lSRTZrN1hDTUFNVmpCaThlVE5MeFNGMXpLYkcyVUlpTDhGWUtNYU8xdHZv?=
 =?utf-8?B?UVRLL3JCL0xhRXVZZ05Ud0d6ZFQvckYvcGN4ZndGcEJzRDJsaVEySkZDd1pE?=
 =?utf-8?B?MGUrMU1OR0Q3NEdoUHRkYzEwVk15U2JZVUVwQms4VFVVRFZ4N1VNdXl2a2hj?=
 =?utf-8?B?SXFTS3U5cnArb3AwbTRUUmFRb2JzbmV6aHBSK252bnkrcERYTHB3OXJSc3M0?=
 =?utf-8?B?UVBuT3VhN1N4ajBLMFVNNGRCWHdOQ21jY1RUUktPMm02eXRzalppWUp2TUcw?=
 =?utf-8?B?V3lUOGMyMlE0c2hIWCsxdDRweTlRdFlZS3FkUll4M2ZGUGpQR2dyUE94NzF3?=
 =?utf-8?B?Mm43bU1nOFRpODF1MjNqRTdqQm1ldXBGUFl3dG9QamdHZ1VGOWxTU0p5K01m?=
 =?utf-8?B?VnRtZDgvOGlwcU0xbFNNa3I5SGd3YkVtZ2dVeVpKQnZxbjNyL1BFUWNPVTlo?=
 =?utf-8?B?Tm41RlcrYjlJQ2V3Vm1mUkJ0SHZLbG5uK3JRNTBvL3dsSnc2MGVCTHpaRnln?=
 =?utf-8?B?aWdGMldoVnVBQ1Y4M20rQWhYdnQ4alBEL2ZEWTlJSzNCcW4rR0dFZjZQS1NI?=
 =?utf-8?B?SUNFNW1GYUFFVjJQTFRhTDViQmhMVVVzQmtUaFRGY3hqTXRWY245SDdNTmFt?=
 =?utf-8?B?WTNIT0dGem0wc1B4b3hGVVpLRklUcWJyTnNsUjFMd2hNWUZjdS91RnVRL3NT?=
 =?utf-8?B?a0E9PQ==?=
Content-ID: <2DF4215A66F71944BD5DD1F04DE2C20A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1a9dfc5-1f01-473e-b36d-08da854513d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2022 20:21:35.8240
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J5KqqSIF6j0xluKpEOtKg8DRRr1VG3WO8HQ1tRL/e7kL466Y3PGncV1Nt/I7tkN2oHt9UneKaRd9/dm4T/H7M1EQUm9pkCTmostiJoveR5c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2780
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_132151_667480_E75AD7C2 
X-CRM114-Status: GOOD (  13.53  )
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

On 23/08/2022 08:43, Lorenzo Pieralisi wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Mon, Aug 22, 2022 at 02:20:32PM -0500, Rob Herring wrote:
>> On Sat, 20 Aug 2022 00:14:10 +0100, Conor Dooley wrote:
>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>
>>> The commit b92225b034c0 ("dt-bindings: PCI: designware: Fix
>>> 'unevaluatedProperties' warnings") removed the clock-names property as
>>> a requirement and from the example as it triggered unevaluatedProperty
>>> warnings. dtbs_check was not able to pick up on this at the time, but
>>> now can:
>>>
>>> arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dtb: pcie@e00000000: Unevaluated properties are not allowed ('clock-names' was unexpected)
>>>         From schema: linux/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
>>>
>>> The property was already in use by the FU740 DTS and the clock must be
>>> enabled. The Linux and FreeBSD drivers require the property to enable
>>> the clocks correctly Re-add the property and its "clocks" dependency,
>>> while making it required.
>>>
>>> Fixes: b92225b034c0 ("dt-bindings: PCI: designware: Fix 'unevaluatedProperties' warnings")
>>> Fixes: 43cea116be0b ("dt-bindings: PCI: Add SiFive FU740 PCIe host controller")
>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>> ---
>>> v2022.08 of dt-schema is required.
>>> ---
>>>  .../devicetree/bindings/pci/sifive,fu740-pcie.yaml        | 8 ++++++++
>>>  1 file changed, 8 insertions(+)
>>>
>>
>> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> Should I pick these bindings updates up ?

It was my expectation anyway that you would take the binding patches.
They're marked "not applicable" in the dt patchwork so appear that
Rob does not want to take them. Won't speak for him though!

I intend to take the dts part of the series through riscv's fixes as
the series will get the arch down to zero dtbs_check warnings. Could
you take the patches through the PCI fixes tree please?

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
