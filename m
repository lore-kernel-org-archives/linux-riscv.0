Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 822C9C25B06
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Aug 2022 11:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=80IM3rucUz5eZ4KcEi09rHuC2bpHxdleVv/dz0OigT8=; b=Rzfw54AmQMJul1
	LLTYtKQWkg4PEP4X5nFFOCGKQP40AWGVFzaKrwIQFzevuFMIJnA0Z1ZP0zNo3Q9pL4g0KgD+9csYw
	n3mxxcBiJ9PnDfxTSPhXtKyDaa2QAh/iRgJKk+TfoeOARw4qtuIdebsJ+yEecITKzmPqBogLE6Ef0
	moAw/xhx3q26d8SbbM+rXHVeWIgExV9I3I8DxpxflCpS7guw1gu/FGsMk51/jTU5iLz2+QBqAAHEy
	F0HCSAHTjwL6YpSWu64cWddmNmJkzMSnGyK7y4h0EYd3g6OwU77PPDfSqwYzuhd6NmArrc51NUH2U
	LfMMvJrvKCzuO0kpnP/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLkEw-00Beuf-1V; Wed, 10 Aug 2022 11:51:10 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLkEo-00Beot-9X
	for linux-riscv@lists.infradead.org; Wed, 10 Aug 2022 11:51:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660132262; x=1691668262;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=8Idu/mce8Ovg4tNAqc4xG14Lg5IJRqeWZCwAErx/sGc=;
  b=Sl/kS8Ohdye37vqRF0jnMM4pzcdlExNXJPbLxmgQ9SEiX+3e3S7bhvgW
   gOdNIUha7ZQ6CcUHRfDs2PfpN9wHb6rJRUcrosszuEln5OhK8J6UzRzMF
   hXJLSpKSDTB30GTX9AcSqDY1muCqN/yvytWawsHEqCTvOX3CWfehCj5WW
   BliTkX+CY+8c8IwN/6dwkZDXg7Z62X2xBqKnocga4rap51ghJkZ8K3gCa
   JLS3iowFxw3F2fEkn/DXP9E2hDZZ6gI9DZZe1KIHtXtl+OWUbKa90m99P
   ZIZLnd7YLdDECxHXp8VPr3Q/kc6w+QDQtLbvbBlMytRRFhaW6D8YOrQQk
   A==;
X-IronPort-AV: E=Sophos;i="5.93,227,1654585200"; 
   d="scan'208";a="108402689"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Aug 2022 04:50:47 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 10 Aug 2022 04:50:47 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Wed, 10 Aug 2022 04:50:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZH+FEq5yMh2EANGw/O/ej7ApVz1HoxYa+csMRpypp0Qf477AyMaAi5yC/NR2rkT5YOiBbKjlDpnI4txl4EDo98dtl/fQNN3xdxXwQV08VWKtRmeOgG54Uu2OPgSGe43x27VTfCvBRTI4uqvjsQ1N18QLGs4Oiwk9Z34oLsUZDE+kw9PRaxnRasafCT7S1eKandkgx3NhALH/Oq5XmOOxYvmw/2wiRuN/ZtVtAUz4yKPavNTUaHLXoQbgCfAFPGRBmZZOP3xtja4kNIhXcawH/hQJihonnj7Q2f7xosVuFXv05+0qv+q+RtmF5sRLihpxREtwKYt1dPBuvf+3O7dyUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Idu/mce8Ovg4tNAqc4xG14Lg5IJRqeWZCwAErx/sGc=;
 b=f7UKsO6aE5ghoV0KKhBjvHmGwhMlIgZbvqbNaeTLKjOWFIR9lvoaB/IrounNJZHZVWitXRlJRCzIftPu5Mm20sEyfMRS5WjHweFt82Orkxdgknu/5zHdc/i2FpPBelRKJtM65JT3WdYKApKIf7x6yE8e94mTXSHLKIrVIVtJkSc0bi6QqrOQwoZw+pMJZkcp5iJr8pDn1CksLlu8/qE8/OsOa8/Gjb1T5bnEY44yaHsZbSu21ACHmRVLv4B3lutrSOh30ybxfrTka/wdR6AD94Z+3YRg1IRrTrNxs1rDa0R2jPY4lRhhhb/wnLhpCzpwPRJ5UA7KAlr4sALk/Ic8WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Idu/mce8Ovg4tNAqc4xG14Lg5IJRqeWZCwAErx/sGc=;
 b=k8yCCLCOQ+7jQWrk7o8Cuvx1FQkvf/Kqubvk8DbpZMx4UoynWvCiC1jqmsXOm2DPbsp98oMFfNOt9AG04ANYlQiFObcmXgXk5e/XcyZ44mH2D6pjUqlTvgJJytP1ZEgrtAF0b7ErjlojMOrs0iTfHo3dphlrE+oPKwYOZiKiVcU=
Received: from SN6PR11MB3264.namprd11.prod.outlook.com (2603:10b6:805:bd::16)
 by MN2PR11MB3583.namprd11.prod.outlook.com (2603:10b6:208:ea::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Wed, 10 Aug
 2022 11:50:43 +0000
Received: from SN6PR11MB3264.namprd11.prod.outlook.com
 ([fe80::c9b4:8aa2:5c9e:ffc2]) by SN6PR11MB3264.namprd11.prod.outlook.com
 ([fe80::c9b4:8aa2:5c9e:ffc2%7]) with mapi id 15.20.5482.015; Wed, 10 Aug 2022
 11:50:43 +0000
From: <Daire.McNamara@microchip.com>
To: <p.zabel@pengutronix.de>, <palmer@dabbelt.com>,
	<Conor.Dooley@microchip.com>, <krzysztof.kozlowski+dt@linaro.org>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>
CC: <paul.walmsley@sifive.com>, <linux-riscv@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v2 00/12] PolarFire SoC reset controller & clock cleanups
Thread-Topic: [PATCH v2 00/12] PolarFire SoC reset controller & clock cleanups
Thread-Index: AQHYj5/vOL2GhL7ldEmlpRxgi0llCK2oP5SA
Date: Wed, 10 Aug 2022 11:50:43 +0000
Message-ID: <7d259ef8bfd7345906a6694bb5897bf2ada4acb2.camel@microchip.com>
References: <20220704121558.2088698-1-conor.dooley@microchip.com>
In-Reply-To: <20220704121558.2088698-1-conor.dooley@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 113f0672-5615-4af7-96da-08da7ac68e2b
x-ms-traffictypediagnostic: MN2PR11MB3583:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pGWxlL6l9ilKienCuj3ZjwMxWHFNJ1/7vBCuDzyH+pkqz0mv9fnhEamDLL26E2QtgDx4/wnK3fPZPWPYVjt0IILzaTPz48UwMqquFIZLH4R1BWD7JIkDT9jfQerfR6joZEWtmfFwAcj0n0vlaS5XZr0ugBrCyOLxaYTJPtoHSBEGZW9U6cwOxvKq8NCUaRwShXdvWwU1CT75T3fM/BuJaANUqxV9MTaGH2r0WFXYrCjKPlfcD4Ltqy464gqxPRCldS9J5AxpG1Tz2psN+Y/S6fIBcfmxA2VvXSb+pawTPAiS+H+IZLVlSwX3JNIckXgx0KTiosUnSZdBY9+ujJX3w2pbqXOmV10+rwcf/iXfpM23rANDYXsAap86R1HOhgm8CaxjwhpULPAdIwLnQgpFQBKf2mFE6xfJ4/SL/AqgyY8FpmD9FclB6R55jdgHGN6Q5casmSdRiDR5WUc8WpWIZEPUpggZxhTLnEMX7b1oy12+bbEjDpSwBpRATVr960KJxCe2lMrPu1UITDeE7rZs0GEL/kRBJZ69C18T9xYZyX4i1Lsim1wUkuwkgPxjtJaZx4M/GkHq1Z4/KLESr00LS7fMaxqtiGGqtwaRca8jBT948Oi7GLW98za7hF806YRZPj4WaGAz3NYmVgRS2OzUYwOzK8k4Y/+VMgf6IGdSb5BagW9PGiXc3stkGUt7E/ezGZsAH8no3XTuKIHmXuH6hZxD8SJdgq5HMNaWp5jX/El/+wQxhnUbYAGBeMmZ30UhhKLlgul7u6EKMBN+SHX0ChXqmEgi7uJ+iDYcxGC2SlSRZiWmHSPUYLd5cKwW+iVz
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3264.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(136003)(346002)(376002)(366004)(396003)(186003)(8936002)(41300700001)(122000001)(36756003)(71200400001)(2616005)(83380400001)(66556008)(66946007)(7416002)(66476007)(64756008)(66446008)(26005)(38100700002)(5660300002)(54906003)(6486002)(38070700005)(91956017)(966005)(316002)(8676002)(4326008)(76116006)(6506007)(2906002)(86362001)(110136005)(478600001)(6512007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TlovS2JwMVRoRlBqTVhLMXJMRWtaSExpa3pidkk2WFJ3dkNDdzVNRVQwc0sw?=
 =?utf-8?B?eHJ1UWxCdlNrLzhoQk9KTHRWam13aGZhTGk4dXEzSmFHTjBSZ1VjSU9uNHJH?=
 =?utf-8?B?S3l4M01LOS9XVUJNNTNvb1NvUW5vVzFJZXNJSDU0OVFSdHh3VWlKZzRHU0Yw?=
 =?utf-8?B?WHdUOW56dkhjZVF0OWJkUVozY2xqbjZjWnR1Slpvd2hXdlA1akZoVEpGQnhr?=
 =?utf-8?B?WVZ6aFhFd044Q1NYOVlGNk0rVHlGRFZiRjFyZHk3ZkxpOXM0NFd0TExGTTFu?=
 =?utf-8?B?K0lPUnBUcWE4dUVCWlRzZ0ZCOEFQVDJhQ1Z2UkpCZHQ1Tzg1b1FMWHg2S3Bw?=
 =?utf-8?B?Z0ZlbWs5VjBMWEtQVlg5a1lWUG9JOFh4eEJiUXU1WHk2Y3dmM3JOaHdNRlZa?=
 =?utf-8?B?RExYNVJUN0FXck01a21JZDZVcm05bitBYXZzd3JLOVQyRkoyLzFLWnl1NjRX?=
 =?utf-8?B?RkZJQjlqRmhYWnFMcjdIUkQ5SzlwaG1GaU1ISXc4ZjJZYzFMMXlMaGhzREVW?=
 =?utf-8?B?c2diaU1lTXpWa0lyZG95SUxTTFlQKzJzZTRzMElPODNTTDVsNEs5RkxTdTJZ?=
 =?utf-8?B?SXAvMldVWVpXNE1nNFlPWXVja3FjMWZsM2U4L2ZhMmdudVpWRU8yY3RvN0dN?=
 =?utf-8?B?MGZuRFo5c2tqYU91aGhGeWhlL2paNysvRmNTTnBVWGs0RHFBNitUS2xDcmNE?=
 =?utf-8?B?NWI1czJMOW5JbFlLS29pTkF1aGttUVpOOHVQbnBHVHhaU0RSd3VUdmtNOTZX?=
 =?utf-8?B?RjBkbk1QMEUwa3p5azNwcVVPMEVYbUtLMlR2d05BL3liQjlJN095V1NobmNS?=
 =?utf-8?B?V2Y4TmFFOGFMaWZUUUgzVlVtT2RYMGFISzMxMGczcG1Vcm52UWFWLzhaTUN1?=
 =?utf-8?B?Q2I5NUQ4eW45czluekt4UlZ3OFBrYmcrckJxMExHaXo1enJhWVJiRDVaZlNn?=
 =?utf-8?B?bHVSWHNkOWdEcFlrUHJFZERneDk3UXB4aGgxU2Vmb3ZZZ2RwRlUwZ25odThs?=
 =?utf-8?B?MmUrRFFlbkF0a1VmUCsxcng0VnVEeHVoVkI0SUlpV0tXaG9pR0NFeCsya2Vs?=
 =?utf-8?B?dEtkOGRxYlBmV1R0UVk0Q1N1c2lNVGduZzJualRORFhvSUkvSVdsSWo4VmRG?=
 =?utf-8?B?YWhqSFJPWU4rcFErR2FNcGg0bzl5ZjV4UmRoNVd4OWUxVm9tRjhnbW5FRTRq?=
 =?utf-8?B?RjJRQUNoTm9PNzFoWm11MVZXa3VSYzkxUnpjN1plQ2JwYUpNbi9jVXNRbmdS?=
 =?utf-8?B?NzV6RVFVTUVkaDJraGR5QjJ4MDB5N0JYMXZob1pqaXcvaUE3MDVsQU9yUDJ6?=
 =?utf-8?B?RTdEaXlaTFErOEZsWjRmMnNPM2xHZm1zVC9CYmFSN0tjUGsvRVJhTXl6K0ov?=
 =?utf-8?B?b0RvbExmR1BUSEF1bDRFdzhzTEU1c2VMSzBsWXI5M1V4RjJYRHd1dlVuWUJi?=
 =?utf-8?B?RXAzZzIrRTFoZVVZTTkyTFBUSHZvazJOT01YcklnZkVWOWZJSjdEMVEwV05v?=
 =?utf-8?B?dDBJSVROWmFCbEVlSnNycGlRMG4zQmcwR3pSRFNsbmdCcVUvTjNQanJCV2NF?=
 =?utf-8?B?ZkV0bnpxMlA3UkUvZUxHa0lScjVNYUhXVGNQMjVSc3BKY3U0bmFyWXBWWVNZ?=
 =?utf-8?B?SnYwUHZ6WEhPeHVRS1hwc1dlUENiZEtMcGt0SXB3aFNGNmRKRHJseUZ3bSsr?=
 =?utf-8?B?R3ArdElub2ZVZEZrak52TW9tUkFEcHNleFpaZFFTZjZMVVIxMVJqNWtNcVhv?=
 =?utf-8?B?bFZ4Y01nZGRadmxRUTBNNldNbnZSMCtWd1RBMHJOS252Q3dXa1U2c3ZFOHVt?=
 =?utf-8?B?VWs1SVdubHJ1amhyUWVGdFhYM0hyYmorQ24yS1VKa2lPbFpiV1hsQzhsS3c1?=
 =?utf-8?B?b3VwQXlhQ2Z2ejV3bzh6ZUF0SjVORjJiN0haVlFDenVsdU0zQWZZaHB3Y3RF?=
 =?utf-8?B?Rjhocm5YQlVYUStOZ0pEM3g2c2VEeDFRZFhyYk1KRThUa1VqZWx0TEZxZGlv?=
 =?utf-8?B?SW5mWjJza1JNbVJBcWxpWVdyek9IbDFBUmNxSTROS3IwSjFNN1ZwZGNvQm1n?=
 =?utf-8?B?ZHhZSGlzUEdIc0dZRVFCVEVHYkdBZnhkTDZHeEd0NHh2Um1rSm1qSlVnWUx6?=
 =?utf-8?B?T2RQYys0NjRwRzdIRkl2Y2NlNTVGTFEvZGdLUmM5YzZFWFpQNFRhWVF3QkJE?=
 =?utf-8?B?a0E9PQ==?=
Content-ID: <DA9A43233831D64B941B62B3276A79B0@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 113f0672-5615-4af7-96da-08da7ac68e2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2022 11:50:43.3524
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hPpT4eIivm9Fop9FNLxqLbmXVDMavEe9o4B/Xc2t/6Snqc+fUOaCJRMdlXAWAIB1lQjKArdOD3tC5F3SfD4o6+cVv2sZkHvHlWi7pJdt2c4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3583
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_045102_480329_5B6CE577 
X-CRM114-Status: GOOD (  24.66  )
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

Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>

On Mon, 2022-07-04 at 13:15 +0100, Conor Dooley wrote:
> Hey all,
> I know I have not sat on the RFC I sent about the aux. bus parts
> for too long, but figured I'd just send the whole thing anyway to all
> lists etc.
> 
> Kinda two things happening in this series, but I sent it together to
> ensure the second part would apply correctly.
> 
> The first is the reset controller that I promised after discovering
> the
> issue triggered by CONFIG_PM & the phy not coming up correctly. I
> have
> now removed all the messing with resets from clock enable/disable
> functions & now use the aux bus to set up a reset controller driver.
> Since I needed something to test it, I hooked up the reset for the
> Cadence MACB on PolarFire SoC. This has been split into a second
> series
> for v2:
> https://lore.kernel.org/all/20220704114511.1892332-1-conor.dooley@microchip.com/
> 
> The second part adds rate control for the MSS PLL clock, followed by
> some simplifications to the driver & conversions of some custom
> structs
> to the corresponding structs in the framework.
> 
> Thanks,
> Conor.
> 
> Changes since v1:
> - split off the net patches
> - clk: actually pass the spinlock to the converted dividers & gates
> - reset: added a spinlock around RMW access to registers
> - reset: switched to BIT(i) macros
> - reset: used local copies of some variables as pointed out by
> Philipp
> - reset: dropped the success printout
> 
> Conor Dooley (12):
>   dt-bindings: clk: microchip: mpfs: add reset controller support
>   clk: microchip: mpfs: add reset controller
>   reset: add polarfire soc reset support
>   MAINTAINERS: add polarfire soc reset controller
>   riscv: dts: microchip: add mpfs specific macb reset support
>   clk: microchip: mpfs: add module_authors entries
>   clk: microchip: mpfs: add MSS pll's set & round rate
>   clk: microchip: mpfs: move id & offset out of clock structs
>   clk: microchip: mpfs: simplify control reg access
>   clk: microchip: mpfs: delete 2 line mpfs_clk_register_foo()
>   clk: microchip: mpfs: convert cfg_clk to clk_divider
>   clk: microchip: mpfs: convert periph_clk to clk_gate
> 
>  .../bindings/clock/microchip,mpfs.yaml        |  17 +-
>  MAINTAINERS                                   |   1 +
>  arch/riscv/boot/dts/microchip/mpfs.dtsi       |   7 +-
>  drivers/clk/microchip/Kconfig                 |   1 +
>  drivers/clk/microchip/clk-mpfs.c              | 379 +++++++++-------
> --
>  drivers/reset/Kconfig                         |   7 +
>  drivers/reset/Makefile                        |   2 +-
>  drivers/reset/reset-mpfs.c                    | 157 ++++++++
>  include/soc/microchip/mpfs.h                  |   8 +
>  9 files changed, 386 insertions(+), 193 deletions(-)
>  create mode 100644 drivers/reset/reset-mpfs.c
> 
> 
> base-commit: b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
