Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E530DC25B0E
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Aug 2022 11:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lh8DZs6gl0bkKWozNOGIbuJLHFlYV/9x0ajPoH8MrZs=; b=iW+HEcqkX6gPCh
	yRB9cMwLZG3Dt38nOumQ840aKTCbT+2J/M9+IQ3mhv6nP9aqr0V7l6aXZQ2tVWOvd6LLxvWVy9uAZ
	r/yx6NL3CgRgRI3oXbw2hidXvCGMotZ8/WvXo7LaoZbSmi/t7JhuWtV44qsxau3Oa3ffjYPhPSwI1
	DGROEHV92K0+sd7fPuQX8uPrkK/RIg7vXlxAW7ZXQJxDzJk9pau3d5rdReSneI3Dv8qzw26thE6pP
	FKXPsc2nQJry+f41LxXlXjvATTi38cMkGUuLTQOrQjuwpj4/lliaLEi0mhc4b/q5Cf61hF/1YVRk4
	XM1GZKd23yQTaE3VO54Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNuqV-001cco-DX; Tue, 16 Aug 2022 11:34:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNuqR-001cX5-JL
	for linux-riscv@lists.infradead.org; Tue, 16 Aug 2022 11:34:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660649691; x=1692185691;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=RiDFVnoyHDjyPRjLtTpTbsxAAiw6ExdnFsnZ8IhLkqM=;
  b=K82IxiY87imrrEZLVS0ULFqbqFsB3lqneJBFIuHwMX9o9fBh2rz4vqWS
   3Iv+6bzLeZ2ocGtlFzfsbf+5FnHeP9Inxwb/7uSQdV7mn5NHIjXHGnGrS
   XgBmr+TffmeWIwtSf3cDcywVEveAGdHbKpK9DboVpEpmQo8W8aSJz2Cnw
   slZYq34ZXvOJIE1Rd7NG4CiVdR4JeMpfCNEVdnUg9jGPl20sY1dp4N7y0
   Gxmrn7X8wxPdEqNFO9Bb0je0HlfuNTBDKsCanaz2HVS2HZFPJSEwhpoOP
   UvzSGlylRktgEiUw36sCsNfvuXkWezU1q1NWjsNgA9dze4zQ1+YNu8Wiv
   A==;
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200"; 
   d="scan'208";a="172651688"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Aug 2022 04:34:40 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 16 Aug 2022 04:34:40 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Tue, 16 Aug 2022 04:34:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DtCUpny1GaKZ4i0VRCSIXkLuK0XrcwVG/SvN0MdP/0Z2xMLbAKj598jVZTRI6x+HSuY/MffFfLf/pvXcVJK0iPX9b0TbFxLP1mX4w6MJ7fXYOH+SpFoMTtn3vwpB/aW+VyQmXzdGItwdvDZ0GZvDVM1JnSKy+Qd4nxzO2PGi7CnoPKqzyKxYb99RNSGObs+FhOxchk/YlURWX1H7vAROQn8q5eW+KUULEpxdMH60cVwt7SQDcar9w7L6N4Qo6+fhGF9gvXchZzxu/ohSKsO+GTu2zOSmDl1IJn3Cb5mffIp7fI08F7fvVyG42SWo0Ht4HgiyM7Ka7kA+wcbC5t5zbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RiDFVnoyHDjyPRjLtTpTbsxAAiw6ExdnFsnZ8IhLkqM=;
 b=FxbUUR3S3OwTq/WNAjIHU5lzfSMnxYvDv1Ecd13CkUYuBGIKh+0Ub4mLxNEzyhMY0tMJQis+pYNGbX2KEJZBEzaCtiKav0NcYDyUkKb5oE1R0a1s4XbkXGTjIxDFPW31fAxm2G0tP+QCMsrpxsM8STCHxFb/ZNeyCRw+8a+HIlvPTjhq+g1UgOxXQv2HvHhNlwALe6bvVCE2G+OQHldwbp4xGEYtaVf1px13BHLiswtl0mhcQFfJabYh2gFij57nPVxHCsZSJjermO984FoCAaGFAJJd+RV39+FDJtJ+rFgA/18klCYSrOmyC9eINq5gD6u7ilKR/8pRmPmFCRpJYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RiDFVnoyHDjyPRjLtTpTbsxAAiw6ExdnFsnZ8IhLkqM=;
 b=qVqv3aFDY9SHCzX4ELf2MZqmguSHlOK3MVG+2OFCsDn7trf2IKoI150jsi8VhYRjDkNcSCIc1wSSqzfOiqk+ab1Hf9uYs5Y7AuXetAoyVgOf1LvWoiuPxoMmS1JGevYmtPmPHXmHjXkGhIJcFZKgiDCTyR2HgXRs+EbBClNGdkE=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by MN2PR11MB3677.namprd11.prod.outlook.com (2603:10b6:208:f6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Tue, 16 Aug
 2022 11:34:36 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Tue, 16 Aug 2022
 11:34:36 +0000
From: <Conor.Dooley@microchip.com>
To: <krzysztof.kozlowski@linaro.org>, <andre.przywara@arm.com>
CC: <jernej.skrabec@gmail.com>, <samuel@sholland.org>, <wens@csie.org>,
	<linux-sunxi@lists.linux.dev>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>, <heiko@sntech.de>, <robh+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH 06/12] riscv: dts: allwinner: Add the D1 SoC base
 devicetree
Thread-Topic: [PATCH 06/12] riscv: dts: allwinner: Add the D1 SoC base
 devicetree
Thread-Index: AQHYsGUwgMumzpPtekanQb2zMhKHQ62xJnqAgAACSwCAABbygIAAA9uAgAAEr4CAABXYAIAAAu6AgAAAT4CAAAYegA==
Date: Tue, 16 Aug 2022 11:34:36 +0000
Message-ID: <4280f460-7963-10f0-a815-4bb1b62a62fe@microchip.com>
References: <20220815050815.22340-1-samuel@sholland.org>
 <5593349.DvuYhMxLoT@jernej-laptop> <3881930.ZaRXLXkqSa@diego>
 <2249129.ElGaqSPkdT@jernej-laptop>
 <b5401052-e803-9788-64d6-82b2737533ce@linaro.org>
 <20220816120050.07dc2416@donnerap.cambridge.arm.com>
 <29072f12-b9a3-9815-ad52-5c4f6b1634b3@linaro.org>
 <14753794-245a-7b27-3bd9-46b80666b7af@linaro.org>
In-Reply-To: <14753794-245a-7b27-3bd9-46b80666b7af@linaro.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6a702506-0046-4767-858c-08da7f7b4c30
x-ms-traffictypediagnostic: MN2PR11MB3677:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Nnt8Y4fmXlCye2FCG85+9cfnRnGYQ18DK/7LLIhC7L/L3dQ7UOP7duiLJaSSZPRzn7icxD0c+DPiZZJMskHU1f+HWBIbRikO937v3uWRFsKlytU0y3IR1b+fmb6pk1l9rd5SpEZmIssnhmgJVxkrVCm1SeZ06rW5xaGSEvSD+lg1IpBjIgTQsuV0RXZ5kMl89icUllEeKt88DkcGJlx6vnpDoFwULQsHF0kgy+RmC0vWmf1KyP18eLHTyW9Vw2zzZ3QA03dohgTcutV1nFnVnnRGu3WHocAqe5Fk1GHjH7WnGeugfOyQKWNHgUEVyi4ScLIydG9EQ4IHv5pvdJkWav8gnfIwRxAdDkZcXbxqdY+2UlfpH+0Et8RZigXyaNtQDJzKuR8cOOxj4glPVLaGDM4wmT2ehDVNk7dvxnY0ZUeNzvcW7vqTxKCUw56s8MnJLaWK/h7gStKxrn0nnenAdGe9W7d/Qik1PQnHjFMBCko/Y4o3J0euDw4tCC37EJu6P4YL0mHbX6FNbUXo7pY/kapNnYtF6SOALndqHWPUBHlvLTb14ZRICi7K6v0MyaIRETiqps2xmEsFYiJyuz75BrCxcFKeQ7JmCcz2h1m2VyrDO2QIk3T1zMT0geoeOZRaSdU4bvy9vP8j7dOi32aUkQrmeGS3U5iMeflwBE4uE/H/7aWnxlzatL+/UUA5wI0gNEED7aWLwK3Y770RgJdUP4ae+hydD+Gdk0pflsm5GiGMG/kk84xczFzQy6AOmwxlH4wSmDtcOAqzEZHHCU1B5wVJI44TbqKHCeVIrA1f04zy4yVzaDeiJSQPzjgoMeEe0Wb7SmbbKy5vj/GLg67GpkurEatLcJOUAmgnYjINbtnojx32CyA1hgmchqftQIfQ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(396003)(376002)(346002)(136003)(366004)(31686004)(8936002)(36756003)(2616005)(186003)(26005)(6506007)(7416002)(6512007)(53546011)(38100700002)(110136005)(86362001)(316002)(54906003)(76116006)(2906002)(66446008)(66476007)(31696002)(4326008)(66946007)(8676002)(91956017)(41300700001)(64756008)(71200400001)(66556008)(5660300002)(83380400001)(122000001)(6486002)(478600001)(38070700005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eFRrT0RiQ0hSL0IrMythUWZQN0t4dzBhbEJlOCt6THE5VjJjZzdkSjMrSnM3?=
 =?utf-8?B?aDd1d0sxdHhSQlUxWTJQdWZZNXpuSXlWS3BnV0pNRUYvcXFYOGFXVzVSdDRz?=
 =?utf-8?B?WmljWWJ0RWlPZUJ2SlEvYWJVWkNGajJaRU9lbzdNWnNPTjFXd0h1VStTa1Nj?=
 =?utf-8?B?cm45UHFpTjRaYitiQ1pEU2JOU2wwbUhtMDVLQXJmKy9CTEFvbnpsMzBReTN6?=
 =?utf-8?B?d0dhR1hXd3FYdWZFS1c4aHhGQ1MzVWNISTNJZ3M2RUs3eGxNdFU2czBHVVgz?=
 =?utf-8?B?S3BWQXJJMmNIOC95WUljeHJmbkVNVFJUdENxSlNWNFBxMFFuOVN6NU4xMmxN?=
 =?utf-8?B?RlhIUVR6T2NlR2YzU2NlVHhnTm1pVUh3RFpzeTROSUFOTVVwVGViU080c0Nt?=
 =?utf-8?B?QkVnV3ZhQWF6aDN6NlhkRUJvOHRDMnRiMHBNL1Ntc1hoTGFBV3FCdUZybHM1?=
 =?utf-8?B?UHlmUGJuWWhyOUNDR1ZiN0VjQ2YvM0pmeEFvanAwNDNzREYwektqM0JGSklk?=
 =?utf-8?B?TCtJKzkxSlBaUUJ4aVM1SlJWZjhJU2kxWlIrVE1BdGtyYmUrNnloUW8vQ2Iv?=
 =?utf-8?B?UFVyalFrVm1VeklsQUMrUzBVS1BrNlZjWEFXZTNtMkhtQTNSVWttTlZqR1JY?=
 =?utf-8?B?MHdBZVBoMzc4ZlBjTitUekNOandGMEpPdE1lSCtLVlh5MzdMQWFjOW5pcHM5?=
 =?utf-8?B?aC9uMElubGNPSWoxWHFjeGRhSS9LaE0yWEZqeVpGREV3Q1dtN0tFbURKbXBY?=
 =?utf-8?B?UzlYUVJtcFZWMjZzRGQ1TnpXS3c1Y2xSTzNjbG1rb0NlNTNncURyNkpyall5?=
 =?utf-8?B?WHlURVA2cHFZWjZIQmRWc08xNlp2QVZ5cHlxbkpoYnEveGNyTXkyVnlWUVpJ?=
 =?utf-8?B?MnJEdWhJRXJXaTZiWmYrYXNlVUhlcGZLa01qWktzNWNHNVBtdEF5WjU5Q1lW?=
 =?utf-8?B?U2pnMXZsalkyZm0vLzgvTWNXMXR2RFVSaGlMWFRFLzJRWXEweUR3ZVRiQUdV?=
 =?utf-8?B?M3RUMWJUdFdMeTBtZjk4MDNabjlmdzQzN2Q0eWJkTXBHUWE1aG1WVFdjWGpM?=
 =?utf-8?B?KzQraWhQWEVXaGc1RGhaZDRmSjVNc3BjSkZaTGc5WHFPNk83QnRZeU05YUxy?=
 =?utf-8?B?TDZ3M0RKWjVkWm4rdzIrU2o0cTB3eit5YWlxd2U2Y1lUYUt1VzFUdTJvbGN4?=
 =?utf-8?B?QnUwVFI5MUJiZXZ0WlFGSW9vUUdGWktWTDlaNlNVS1BrWDlpVlAweHpiOFZF?=
 =?utf-8?B?bHVvUlZiaXFhVWJHaStoeFcvcW1qMWwyRkJXWmxrQWEzNHRYYVBHQUVjMmZ6?=
 =?utf-8?B?b0dtL3ZSa3RraDRBVEZhbnJQQmJYa3k3bVdPa2RZbTQxeVNFUzRnTE9LU1dQ?=
 =?utf-8?B?UHFXaEtiZU1zSmV6WUs1Q2x4MW9xQXlxMVdwaWhtWGlRSmVHSTdxUGNkTkU5?=
 =?utf-8?B?Ung3UjVGSWVCeTNiWUFzMGxjc2NEVEVzTTRiRnR1SkpZajhPTjJpeU9LMTJw?=
 =?utf-8?B?ME9aTzNnQVFXalcrUUhyaTFtS0YrNjd4U2lKSERoaHhwbWdxb0lmM0FvWnhV?=
 =?utf-8?B?Sk83MmFIOVNaa1ZFTnAreGRXSHJJT2J3TmFsMXN6R3h3MGt4c2lnWFRmbWxF?=
 =?utf-8?B?YWY4NmlIb3FVK2FzWnZxL3U2WDVKN21xZVF6QW96ZmlGZFdEbUxITjFaOE5t?=
 =?utf-8?B?VWR4VGIvK0wwZGpmSFdjME1UcDAyWC96VWVvZFY0UmZwUnBWSWo3WFppZ00v?=
 =?utf-8?B?UUUzUk9aWCtFYmJwMzF4dDRjMWt5ZEptNFFPdlQzaXlwckh0OHFURnB1bW9k?=
 =?utf-8?B?QkpkL2VTOEJhc282NTNSSUlNcWVQODRkNWVWakpXSXdWTFk1UHpxZzY1dUdN?=
 =?utf-8?B?TE5nN1EyR2Y5NVRDOFlITmRKVFEwSGtWZ0hGdU5XdDk2VTRMR3Y1UENOYVkv?=
 =?utf-8?B?azN3WGF3THhUNGlYYkUwR3U1TFdaWEdXNVgwNW5xbUR2SU9GVEw3SnNmY2li?=
 =?utf-8?B?WXpPcStJR0U0NnE0Q2RablpiZThQenRsUldseHZSNVdsQUEvK1oxbVhrTm5C?=
 =?utf-8?B?UitMQWE2V0Fuekg2UkMrRFh1Z3hDejVtVElYem8wdDEwcmhRWnl2c09xWXVW?=
 =?utf-8?Q?lE/D09AvJ12m4dcq9/IWuDXq0?=
Content-ID: <61B317E6A356B540B742BE22229116F2@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a702506-0046-4767-858c-08da7f7b4c30
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2022 11:34:36.1831
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5In2NVrTNrGpWqf4Md1HL8UTS2YfAQ9Kro0zmDaJW1tkhMshL8ZHM4yfEMn7fSk4KO5bHlF3mk+J9POda6K1D67L/jq1onn8pnE9nw51mMk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3677
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_043451_747133_4972FB86 
X-CRM114-Status: GOOD (  14.29  )
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

On 16/08/2022 12:12, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 16/08/2022 14:11, Krzysztof Kozlowski wrote:
>>>
>>> I think one reason might be that this is so central to the whole SoC
>>> operation, that it's already referenced multiple times in the base .dtsi.
>>> And having a yet unresolved reference in the .dtsi looks dodgy.
>>>
>>> NVidia seems to omit a base oscillator (maybe it's implicit in their
>>> binding design), Marvell doesn't use a fixed-clock (but still puts their
>>> base clock in armada-37xx.dtsi).
>>>
>>> Exynos and Renesas put a *stub* fixed-clock in the .dtsi, and set the
>>> frequency in the board .dts files. Would this be a compromise?
>>
>> This is exactly what I said before. The clock frequency is a property of
>> the board. Feel free to keep the rest of the clock in the SoC DTSI to
>> reduce duplication, but at minimum the clock should go to the board.
> 
> 
> s/minimum the clock should go to the board/minimum the clock frequency
> should go to the board./

FWIW this is what the PolarFire SoC stuff does (thanks to either
yourself or Geert) & it'd be nice to continue that precedence for
riscv dts going forward. No point IMO in duplicating things done
in the past in arch/arm if that's now considered bad practice.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
