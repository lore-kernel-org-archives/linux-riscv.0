Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0351CDB482
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 09:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2zeiZ960bYr4d+admDTzEIYPf13zwCq8LqPrY3jRhVY=; b=4jJS6WAQ6U0xQL
	M6oaUQ7qi9yR87bivTwsStUYJjRPEWGoa2Xq84jkVNgfhKlA5RgmvK+bmBNAHC7ijpVGgzJ8+TLUC
	zR0XQlowdlLSeaMtS8b3YIvnUO0hpVDAMDhI4OeQ7uKcnWYSWoytyZJ0IaJ89gnax3Qs1ZJqcrZ/P
	tM8j8AFS/sBQ5q7iz4E5O0DHYqCoE25KxphzsWMm+v+36ih83kaQ6uXscfiERFkuIB08szO7Xk8NW
	32hE5rXb0VfMjMSuyvxoGLnD3T7vEcmFjSfaoVmgEwV7gr+7ohuqkDeQFwEwSx8g3BzdSTO6yDogU
	eFKl6Wjag+AIbFFaWfpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt2fO-00EFwY-26;
	Wed, 18 Oct 2023 09:16:38 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt2fL-00EFvP-2J
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 09:16:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1697620595; x=1729156595;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=eWrqEwkPbDxFN4okV293eczzm7byZiVRjRw5oAXAmRk=;
  b=B9Z3D8Dz8kvkujIBmQhLrZSRgOH0857KVjGcm6p1beP3q1ooEzdziOr6
   apz2M0P/cA282ocYovIUmiP0KoCAdVdwX2OTBgPGtQnEBmfyQwQnTy76C
   i1m0AuERZYjJDI65qO3v1Jsy6nyNsfgnCGvhBqfQYpR2MB4zh1btyhUBr
   qJsNxiodUZ7Flc45rxI2gUn/nBRB41HgNL0rfK1uulAuz8gWP+UE/K01w
   B71uIK8aabWGZubJVFEiVkTSDnPk6LeGqHPbaXlhWFA85iLJutvA/yxjP
   BrL6ZEFS3o1qMrhqPOeomLpm5iyiVFl08Mt6t8BkYfmLeGURIyfvQYILo
   A==;
X-CSE-ConnectionGUID: Bs8xqLmiSAeyZGycmmzgIQ==
X-CSE-MsgGUID: izYO0DQkRkO6bV3V94PiLA==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="10174152"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Oct 2023 02:16:26 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 18 Oct 2023 02:16:14 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 18 Oct 2023 02:16:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GUuTur+Mst83o9XcZDkyWPqhNH8pdJT1nNUCiCyyyVDbljZ9gcz1bQ2PyhXZaZbnJMmTf31HEZvBqRawIQxQdlDtPTN35K2mtdgssDZ2aiOv+9iTxaIixNsHOX85ve+/sHhwN3KmBTvgqV2k9GOmsZKUS3HG2svqArhewOqd1UNjfUnVMa7Lej0s2pUfoQkaKRMqv0pzEr21A8zt0b+fJJ6mIZutCBzbGozRrLMRrGsCk8SDJ3NTS5zyz75DJ6d1Nk2phTuuxNPH14s2q5PdD+nzHiUDyEsP8LibDyGs0YCgAnrnmPtSZWOxb3tLe0iisircombxampaVy6R8QFW8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eWrqEwkPbDxFN4okV293eczzm7byZiVRjRw5oAXAmRk=;
 b=Drf8Ra6fHhbB9NqxSH3qox6I2k3CLjKfrMONc5f4ETrtw7bWwFr5WUuS0IUKvkH8XZRXKXWbmuJka6vtbvC/ouYqaC6RT7cI1t33y/6YBpnaieiPao1LmnAfjvjl2HJYHOYFHZubhEFxz8CJZigoNSGqntECa5PGpvJuoh13tC41GwnX1zllzufFGBH/5yIZMzj42rB31fplco7mXzyhFdS+jD1vYZDZZvn2dU1R3+uhOT0kqtnR6CLoleWX9UVq8sOLFhwGklqVlxAIG4YkhTpbtbT0AeS87rKMA4IdaF/wFO8fBE8mY++8WOmLCGSZijlW5UM5ezEIdvUlAycF6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eWrqEwkPbDxFN4okV293eczzm7byZiVRjRw5oAXAmRk=;
 b=QqaDuC1rUoNew1pDK4opV/T6F3iFRDbhT4WQqGv8TlVSJyE/9B4f5iKEWkTEbKV3iLzZE/kZlPFZivRfpNHMJtRuUzI5G19ZIAqgIHdMuAhKdPkcTZ+y0n1tTblHV3MZSypbVf6C+S6z8NkzYh6r3CkzAHfloo6ATmUqvODM3gQ=
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by SA3PR11MB7581.namprd11.prod.outlook.com (2603:10b6:806:31b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Wed, 18 Oct
 2023 09:16:11 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::7e31:26a6:698d:8846]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::7e31:26a6:698d:8846%4]) with mapi id 15.20.6907.022; Wed, 18 Oct 2023
 09:16:11 +0000
From: <Shravan.Chippa@microchip.com>
To: <samuel.holland@sifive.com>, <green.wan@sifive.com>, <vkoul@kernel.org>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<palmer@dabbelt.com>, <paul.walmsley@sifive.com>, <conor+dt@kernel.org>
CC: <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Nagasuresh.Relli@microchip.com>, <Praveen.Kumar@microchip.com>
Subject: RE: [PATCH v2 1/4] dmaengine: sf-pdma: Support
 of_dma_controller_register()
Thread-Topic: [PATCH v2 1/4] dmaengine: sf-pdma: Support
 of_dma_controller_register()
Thread-Index: AQHZ9bEK4k81E6qr/EinIsu+tf8oRbBOZXSAgACloHA=
Date: Wed, 18 Oct 2023 09:16:10 +0000
Message-ID: <PH0PR11MB5611B16C380A9F1F989737CE81D5A@PH0PR11MB5611.namprd11.prod.outlook.com>
References: <20231003042215.142678-1-shravan.chippa@microchip.com>
 <20231003042215.142678-2-shravan.chippa@microchip.com>
 <e5d2e96b-9b16-4aaf-9291-76d1d2222c44@sifive.com>
In-Reply-To: <e5d2e96b-9b16-4aaf-9291-76d1d2222c44@sifive.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5611:EE_|SA3PR11MB7581:EE_
x-ms-office365-filtering-correlation-id: b28703c8-a355-4a2e-5724-08dbcfbade69
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pd/tCDGbH2TcNP5ebRyU42iVRHueXbBcqAsCYSai9ukyjT/DaWjg2uQNEu1eVw4k+EUhn7gqHcYG7uQI9+Kkjz85Ntf156TSFkp9EcjBfN1tpe5ahigPpkopeiIt6q3i8NjtP03i3Oea+5DkK0p1EYeK4BrUEp9u4BGYCbjRo5/JO5AmIRcOnAujxqRJyhvR2efpo3Evq0naA3iG6KK1WI+jNczG+Qh4RktjLJfJU9SWg9hDe1lQ3GIwoKrtFCvORqpm09gBIBkrdVDGz2NDOuR31virWqAcq3pvqt1fPbaYnKCoKmZxC0rr60ckwmvUqFq08FVGFl+LfCQbn8yoH86Gj7XCZrn4lOPbyPvm1FHrkWHlcjjtxUVe8rg4Ml5LeW38orRuB9i0S4bqwYT7V++8QEBNPV8IXLf+4rpTs9DXR26ajsHl/2kkYNm17Bwl8znFZlgWqirqt0whHDW6dgWctq4kV4BNRUoKRdl31Bbzb9XRPjEK/QXSDcSeDaekOl6SzjJiPR8zofuZcPtQ5pTyVJsCqM5EbVJ/vEGmTvTn8lNia3WDICTnZoh5/p9zJ0EheFIc3I69NNQE/GYgmalKvqvOcWro65+mvdge337l78JPzagQWpNPR1Vr9xbl
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(136003)(366004)(376002)(39860400002)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(64756008)(5660300002)(76116006)(316002)(66556008)(54906003)(110136005)(66446008)(66476007)(66946007)(478600001)(8676002)(8936002)(55016003)(966005)(4326008)(38070700005)(38100700002)(83380400001)(52536014)(7416002)(86362001)(107886003)(33656002)(122000001)(41300700001)(9686003)(71200400001)(53546011)(2906002)(7696005)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QU55dUtydDFhNlVJWHhNc1UyQVB2YW1BT0pNZlE1M0lJSWtsMStyY0ZvZ2FU?=
 =?utf-8?B?UjVzRWlwSVEvUnNDNXJvZTdQa3NEWWhMMURsUmQwampQZzl2WFd6djQxRU5v?=
 =?utf-8?B?UnZRZnpLZW5nN0k2V2xCb3hmMmpNSURrSkV1dlYzdWZvNmtVQWJHZnNZU0gz?=
 =?utf-8?B?WnNHbDlvMG4rb2V2UWtBMERKRkRUczN4am41cjYwZENLbTJGOEFEeEh6eWNu?=
 =?utf-8?B?YzZPWjlXMEJ2UVJHMUFmY1IwaDUybW55aUVtc1REazRkdjFYSUdBYUJXZDJK?=
 =?utf-8?B?NkZMRW1oQ0tNOFBhd0d4dDBqWENYZXZtbXROelNNdDRSRjN6Y0pCYmcyMnJU?=
 =?utf-8?B?di9Zb245QmxMQnJtZFRZbjBIWTdUc1BhYUREMGJ2NDFyMVJXNDdjVlJHM3VN?=
 =?utf-8?B?cTFtdkE5MS9uUWhZbG5nTWdTZHh4aEgzekplT2hMRmhENnZHSE5oYzhSdmw4?=
 =?utf-8?B?ektRMmFoVURPWGNTWXRoNE92TExEa0JoQ3l2VVF3WXJndVN1THllTzI5VDNn?=
 =?utf-8?B?bEpIYUV4aTlGZFdGRDZJUGh4TVdzcFhwS3JTWWJ6MWI4cHVwTFBqdkVZNGkx?=
 =?utf-8?B?aHdCT1hObFZnL1NZcWREZXhUVTVBT2RobGNjbmdyY2lPczBuRG1LTUdrT0NZ?=
 =?utf-8?B?Ri9Ib0tqTGRuVnpHMFV1bTVETDB3aW1oVkRlSzJiM1hxU0JlYzdrbC9uWmpL?=
 =?utf-8?B?UTRmZ0RJaUpwWncxR2pzRG9PL2k0Qk9wdERLd2sxNGFxWmtQNWRCc2dzWUpJ?=
 =?utf-8?B?RGFnSTI3WVErWjhPOGh4MXZxNTI1eEc0Vm9hQTQzZUplK1V6K0hSS1FUbm8v?=
 =?utf-8?B?d3lvbDc4bzk2aTM2a2RXeDB6V0NnKzFTTEh1S1Zid3RwdG44emxSMmhHVkt2?=
 =?utf-8?B?REFnVW1WV3BTcWlBOHVKNzQ0akE2Q0tueTQrbHBVYzYwcGdJTGtWU2I1ZUZS?=
 =?utf-8?B?aTFKeHVPdUZ6NU9vRzdrVXRLSThaTmpEQmJ6eGFzU3pmK1V6Q2NEb2VzMGlF?=
 =?utf-8?B?U0tuZEtKWWswcU9ocE9JUmZNUFRwWUt5UFA3SEd2U0UxSmxBd2lBc3FQTHpM?=
 =?utf-8?B?RUZrenM2M28xNzJ6cDVPWEVaY1hHQytkQWZaOTcyaG0xbkdKdW4wZjJadkJ0?=
 =?utf-8?B?VjdaT1JtVDlzNUZuMkN0RlpRdWVmaGN1SnFzaTQvcjRESzJlTDZsS3M0YmxZ?=
 =?utf-8?B?OEFDM2g5SXh3K1BvTGVSemswNjVzdkVSN0xRcEFTWVlhT2VVVUJOZFV1THBn?=
 =?utf-8?B?LzRVMXBLSWZJUmI5Wk5qWEdwc2FDOHNyb0dWTldRYnVPdTZXTFd1SFFpL200?=
 =?utf-8?B?RTNGSHhzQzZDT1dnK1J2SkJyTkFOV2NPVFNSOEVjZERKR044TXY0T3cyMHVF?=
 =?utf-8?B?amJaM0Z0UDZKd2h2WWRLNlRUZmM3YXRsT0dIS2drcDlYN1lKQ3JnTWRWWndo?=
 =?utf-8?B?bkpJOU0wSXl2T3J5bXdFNnY0eE1mMHVNeGdxeTZmbFZjZHhwQk5xWHlrSTRT?=
 =?utf-8?B?SjJ4UVR1dThSdldSZ2JOQ1NtTERBbitMUXJiTkMwR1IzSks3WVpDYzEza1Bt?=
 =?utf-8?B?N3FjU24vdCtubzNoajU0aVMvSGJRWXQ3RGFuZmJSZ3ZXYXJMR0t6Z0RwQ2V2?=
 =?utf-8?B?TTVxMFRFYjY5NHp5aTYxUlg1R0JBUVNDdS9FZ0JXVUp1NUZnMjFqUmh6Rldw?=
 =?utf-8?B?RytzbmQweTBnRTJ1VTBXd3VQRXBPTE9Bb3FIZDExR2tvSWpORVBJczVLRXV1?=
 =?utf-8?B?ckM3RHdnNWZKTXZmZHp5Zlk4V2FhVzdMeFYwWFJEZTI0b0w4WVFCWmVXNWJh?=
 =?utf-8?B?VXlta1N2SDMxREE4Q2IzUWVRRWtrU05JQnhwSVlKYXB6MTZiZjV3MVo1WnFS?=
 =?utf-8?B?K0VDWVkvVE0yK3QxcVlYWXZhM2w2UlpySkVFS1V0MExIaDRLVVppa1Y3aHA5?=
 =?utf-8?B?dm1JbTlBSk5SNHBMR2p4bFkwM1lLNnY1SjBUZWdrMnd1TE9BSjM3Ny9GSkQ4?=
 =?utf-8?B?VzVPOGJLYXYwbGExUEo5SWx4dHA1dWZFMEFwWnNJYWQrQjFGTFdsV2ovc0gy?=
 =?utf-8?B?NE1janU4OGhoUWlQeHE0bGYrZGN6bjk4WXZDeVZxdnVPR2tKcDNwM0psdU5L?=
 =?utf-8?Q?ONk4=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b28703c8-a355-4a2e-5724-08dbcfbade69
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2023 09:16:10.4880
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ale4PWfSX3JBhgFZMwJ7n9VZvRf7pDfOXabUDsTv82ZjFWJaM3W9Oh8T/sS5WeTt0rVAAOuIFtLlNW7k3Gj7fxzx3+sAExdE2ZCdQVC7Q+g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7581
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_021636_062362_1807EEA3 
X-CRM114-Status: GOOD (  30.46  )
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

Hi,

> -----Original Message-----
> From: Samuel Holland <samuel.holland@sifive.com>
> Sent: Wednesday, October 18, 2023 12:03 AM
> To: shravan Chippa - I35088 <Shravan.Chippa@microchip.com>;
> green.wan@sifive.com; vkoul@kernel.org; robh+dt@kernel.org;
> krzysztof.kozlowski+dt@linaro.org; palmer@dabbelt.com;
> paul.walmsley@sifive.com; conor+dt@kernel.org
> Cc: dmaengine@vger.kernel.org; devicetree@vger.kernel.org; linux-
> riscv@lists.infradead.org; linux-kernel@vger.kernel.org; Nagasuresh Relli -
> I67208 <Nagasuresh.Relli@microchip.com>; Praveen Kumar - I30718
> <Praveen.Kumar@microchip.com>
> Subject: Re: [PATCH v2 1/4] dmaengine: sf-pdma: Support
> of_dma_controller_register()
> 
> [You don't often get email from samuel.holland@sifive.com. Learn why this is
> important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the
> content is safe
> 
> Hi,
> 
> On 2023-10-02 11:22 PM, shravan chippa wrote:
> > From: Shravan Chippa <shravan.chippa@microchip.com>
> >
> > Update sf-pdma driver to adopt generic DMA device tree bindings.
> > It calls of_dma_controller_register() with sf-pdma specific
> > of_dma_xlate to get the generic DMA device tree helper support and the
> > DMA clients can look up the sf-pdma controller using standard APIs.
> >
> > Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
> > ---
> >  drivers/dma/sf-pdma/sf-pdma.c | 44
> > +++++++++++++++++++++++++++++++++++
> >  1 file changed, 44 insertions(+)
> >
> > diff --git a/drivers/dma/sf-pdma/sf-pdma.c
> > b/drivers/dma/sf-pdma/sf-pdma.c index d1c6956af452..06a0912a12a1
> > 100644
> > --- a/drivers/dma/sf-pdma/sf-pdma.c
> > +++ b/drivers/dma/sf-pdma/sf-pdma.c
> > @@ -20,6 +20,7 @@
> >  #include <linux/mod_devicetable.h>
> >  #include <linux/dma-mapping.h>
> >  #include <linux/of.h>
> > +#include <linux/of_dma.h>
> >  #include <linux/slab.h>
> >
> >  #include "sf-pdma.h"
> > @@ -490,6 +491,33 @@ static void sf_pdma_setup_chans(struct sf_pdma
> *pdma)
> >       }
> >  }
> >
> > +static struct dma_chan *sf_pdma_of_xlate(struct of_phandle_args
> *dma_spec,
> > +                                      struct of_dma *ofdma) {
> > +     struct sf_pdma *pdma = ofdma->of_dma_data;
> > +     struct device *dev = pdma->dma_dev.dev;
> > +     struct sf_pdma_chan  *chan;
> > +     struct dma_chan *c;
> > +     u32 channel_id;
> > +
> > +     if (dma_spec->args_count != 1) {
> > +             dev_err(dev, "Bad number of cells\n");
> > +             return NULL;
> > +     }
> > +
> > +     channel_id = dma_spec->args[0];
> > +
> > +     chan = &pdma->chans[channel_id];
> > +
> > +     c = dma_get_slave_channel(&chan->vchan.chan);
> 
> This does not look right to me. All of the channels in the controller are identical
> and support arbitrary addresses, so there is no need to use a specific physical
> channel. And unless Microchip has added something on top, the only way to
> trigger a transfer is through the MMIO interface, so there is no request ID to
> differentiate virtual channels either.
> 
> So it seems to me that #dma-cells should really be 0, and this function should
> just call dma_get_any_slave_channel().
> 

Thanks for your comment, yes all the channels are identical.

I have tested with dma_get_any_slave_channel()
it is not working.

dma_get_any_slave_channel() function searching for the DMA channel which has "DMA_SLAVE" capabilities.
But sf-pdma has only "DMA_MEMCPY" capabilities. 

*****************************
struct dma_chan *dma_get_any_slave_channel(struct dma_device *device)
{
        dma_cap_zero(mask);
        dma_cap_set(DMA_SLAVE, mask);
        chan = find_candidate(device, &mask, NULL, NULL);
}
******************************

So "dma_request_chan()" function throws an error like "sf-pdma 3000000.dma-controller: No more channels available"


Thanks,
Shravan.

> Regards,
> Samuel
> 
> > +     if (!c) {
> > +             dev_err(dev, "No more channels available\n");
> > +             return NULL;
> > +     }
> > +
> > +     return c;
> > +}
> > +
> >  static int sf_pdma_probe(struct platform_device *pdev)  {
> >       struct sf_pdma *pdma;
> > @@ -563,7 +591,20 @@ static int sf_pdma_probe(struct platform_device
> *pdev)
> >               return ret;
> >       }
> >
> > +     ret = of_dma_controller_register(pdev->dev.of_node,
> > +                                      sf_pdma_of_xlate, pdma);
> > +     if (ret < 0) {
> > +             dev_err(&pdev->dev,
> > +                     "Can't register SiFive Platform OF_DMA. (%d)\n", ret);
> > +             goto err_unregister;
> > +     }
> > +
> >       return 0;
> > +
> > +err_unregister:
> > +     dma_async_device_unregister(&pdma->dma_dev);
> > +
> > +     return ret;
> >  }
> >
> >  static int sf_pdma_remove(struct platform_device *pdev) @@ -583,6
> > +624,9 @@ static int sf_pdma_remove(struct platform_device *pdev)
> >               tasklet_kill(&ch->err_tasklet);
> >       }
> >
> > +     if (pdev->dev.of_node)
> > +             of_dma_controller_free(pdev->dev.of_node);
> > +
> >       dma_async_device_unregister(&pdma->dma_dev);
> >
> >       return 0;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
