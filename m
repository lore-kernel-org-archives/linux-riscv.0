Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A7FC43334
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jul 2022 20:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5iKCdQnSbMTaOChtsYvnHQ/KyWbea2yPAi8dA9Yhdps=; b=gK5z/1rD3YsldD
	m5x0RJ+sEBp1APw2nFYhPy13SgecgfsbPtfUsflIEXoJs1O/1a12UOw6/bhShnDwOU3Q8uljcyDz9
	d321oGNBe9uSARu43bKIohv+w5q5EJeiG+I7B/tzT2VUOsxLXY5/mCH4FjnnL8XUbJ8aLcfCh+A3m
	TxwPu8BvMJC4k9785ZUlcL7AD28MqTE91x4hngsDAT7prE9iicmuQNLJUk99EvYcFq+4p9UXwLPg0
	DBh7Q08DqvhNfakttHx6Ekd7dAXha/EKI4qFWimeJa5uSQFcSyMnIl1jJB7pUlx1tMa51qKH871tT
	Y6/CwBJXwxkn7dckGdiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8owp-002ZM7-Qb; Tue, 05 Jul 2022 20:15:03 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8owZ-002ZGy-Rd; Tue, 05 Jul 2022 20:14:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657052087; x=1688588087;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=2TyEkr7k74JmtxwSNV5r/yyeP6m98K3SYOds55tZPd0=;
  b=CjF2dKDqcYA/gaM2A6iLcJgMC0wJz72oHP9b4fp3LXCm75pMsd2enl+f
   9AKhA2o/oUos4/4uo+GFV188QDxBNz35SDIdxTV6HMzRL8AObjbhAN6oi
   1ubAXA193PbLQ5pR7Al3OFPcIYKSmqZudG10hsDFxK55QkonsJv4rpC5c
   JZzSQjjgc9uL9dlvvrtPApOuQeKoKmzGf1qo2qcd4qaQ0Yk/E+Rji5zHY
   qiWCUTAYXv1mjElaCFurZaVWnNdrmJgZYx1Xw+mcJBV5FWMU9THfYwm0G
   MvlCGaYO9kmgod1bHrYG1xAYgbjUAfk5VQeOWu9x5kb5irZR8euRXl5sS
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,247,1650956400"; 
   d="scan'208";a="103144624"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Jul 2022 13:14:43 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 5 Jul 2022 13:14:43 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Tue, 5 Jul 2022 13:14:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tm1OeMsSZtQXOq7zp92WG2tapa5V2MQEVxinrBDvXk3ALWZY4fxNYvzIQaEsgXOLnccDf3bpymnUtVc92SvWo/Zwy9wPpIM8iczBL665hF3m8f0JQP/e1MSkKn9Lc2AO820h0D2bnaJbPQxVDQBa8S2uzjNqH15nL6zWSkwY3KB13o59ah8jhdNs9pWwAEX+HxXLMMFq8NVjWy2n/i4BQRv7OYgWnnAQ3kjzj9n7URyxmSoBRNeRLwXft2ThklCZxQ2frg6830M5WJrBOl5oBSpNHBB18j94Pd4w0TwE+OXlRBJkgb5QnhwiyEPD2M18ozROLibXLAmR9xhFIgWcHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2TyEkr7k74JmtxwSNV5r/yyeP6m98K3SYOds55tZPd0=;
 b=SZHnEDgPAeb1CNmzX8aU0pVzCR4NR9KnM0JOjsEkCRNSTWY6V3BaCQnFnyv1AMi0CDs+NG3oPccZOCQOfyBAAjXVV3AxDYe11Xpeh40Szrxt1z7KB8TUiDB1A7nOtlmnDvXiv1CCO9MAqMYchYFMXVAPcsYEO29MWHkpgIg862YCoDIYe86/vm5rrif6A4IETqVQUYvi55xjU2ZhpFcVzX8xKSuzoWx/tEww1biz3Nsggam63sk8GDwaiOm5Zzf2avS8uZ/fWgslhLGaxdOKUhucvjAWbgEWPePoCYd8VxzpbxXf12bT6DtWLWnUOo/G/b+T3RModemYdcEQgpJ48w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2TyEkr7k74JmtxwSNV5r/yyeP6m98K3SYOds55tZPd0=;
 b=QwFiTG5rY13JJeFbwQPHWU5P6ibNAMiDj/9/RhHO8J3ErgbzQ5P6aroQmn620tF2xOv1LR4Ljzhb4zsp0Nu8WSU+AOiC6GtxND7vONhOGktgGP+sdbZJJCs/cr3UUtlMm4D/KADasEXB7+Mz7bXwYHMC86+HeXXspyhLWtzgvSM=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SJ0PR11MB5772.namprd11.prod.outlook.com (2603:10b6:a03:422::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Tue, 5 Jul
 2022 20:14:38 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 20:14:38 +0000
From: <Conor.Dooley@microchip.com>
To: <sudeep.holla@arm.com>, <Conor.Dooley@microchip.com>
CC: <Brice.Goglin@inria.fr>, <linux-kernel@vger.kernel.org>,
	<gregkh@linuxfoundation.org>, <Valentina.FernandezAlanis@microchip.com>,
	<vincent.guittot@linaro.org>, <dietmar.eggemann@arm.com>,
	<wangqing@vivo.com>, <robh+dt@kernel.org>, <rafael@kernel.org>,
	<ionela.voinescu@arm.com>, <pierre.gondois@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<kernel@esmil.dk>
Subject: Re: [PATCH v6 00/21] arch_topology: Updates to add socket support and
 fix cluster ids
Thread-Topic: [PATCH v6 00/21] arch_topology: Updates to add socket support
 and fix cluster ids
Thread-Index: AQHYj48tVAbdjlL6mUiIMD866kQSr61uUUaAgAFk5gCAAG9PAIAAESSAgAAB9YA=
Date: Tue, 5 Jul 2022 20:14:38 +0000
Message-ID: <d4b7bfbe-c6a5-c0a9-8aae-7d04682a5271@microchip.com>
References: <20220704101605.1318280-1-sudeep.holla@arm.com>
 <6a647b6b-c913-b9d7-a23e-b17a8034c5c8@microchip.com>
 <507c6b64-fc23-3eea-e4c1-4d426025d658@inria.fr>
 <da1cf1aa-7291-92cd-4b62-0af0d0d12277@microchip.com>
 <20220705200737.unxj2hdcowdjdkt2@bogus>
In-Reply-To: <20220705200737.unxj2hdcowdjdkt2@bogus>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8ccb5e1a-549a-453c-a0f2-08da5ec2fc9e
x-ms-traffictypediagnostic: SJ0PR11MB5772:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 92vkWQomd+ram6VYzDT3mywYHepSYpyNV9/2ibJA62ruAbINrUiu/VUNAyTJa1Ex+X+atLvfDwHr5b7+aOHaQl476lrX6IHLZ5I+SMY3YjNPu0Eu5pCuI0IGAR9b9l+P84SOl5n50u9dd7xH6zprh4AgcZcb+9xCAI9yw0fvRL0zCjD4wGE6JTFHOoHSRHAsdHoDYQZyEv1mqDqTxbv9dtGhMMlZWYTNMyq9+KbHN0B7b6c0uFq23OCBChleNKxOvaLGAFXuvGIA1WRocKHdK/iQT56ggwVAHq5S3pyqTYG6eunPxMLD/yoQ2gs1uS8jUMcw0IVCq4BXBaciYlc5J2kzOD7PQD78KHEh+6xV43sjQ3akv9btxKrG3FLWgYWYJ9Mk4XDIAGicg8duE3nI0YKny8+ZP+++uGbdDf4uQa2GRCsiEQczW8VxOvrDr1QaPfNGOmiDiYoCJL0YOyZ23L+iveI0TtO1FhqfJS44u+aTKW0XKNeBbHOUAWH/dP4C5Gcumvnw9jaD+7XoZqZWzYymAZnkXFYXTZgeQuUNgsu1C80Ne8GWcGIDoP2VhxTrSNvtYcncXTHqjKodyzTH3+GztaLyah7VIJB/jJs3xLQdNHZLZTCmuQxA8OT8M8X7nDfxhwQ4WzDNID/nrzGjmu6yFKBeHZcUxORsRA94tqeggZxPyBVMMr2jv340Il2udxS8dk0Tv/4CA9ItiOmNPG1hLnpgWwgmuh5TXX5pAe+/gk+LY1P/OJIYB+XgpoB6hOtfp5i8Tg9FjmlzLDg4fQgnEHFg87TYpBR4U9z5GXOkDpq+g7hk4EaraOI0z1W6rKCytZqyqJEN3YBJMZTe+1MgjSMK2p5wyMZotZu70NO/jmpmQRfQEEePpUjPamIPNQ+gQZJctbYxsYFe1e1rmGYev9TdmpINcBrzi4/6tTCg+fzZj0rXbGmUQ1JGmlDR
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(376002)(39860400002)(136003)(396003)(346002)(186003)(83380400001)(110136005)(66446008)(66946007)(66556008)(7416002)(66476007)(76116006)(38100700002)(91956017)(5660300002)(54906003)(8676002)(316002)(8936002)(41300700001)(6506007)(53546011)(26005)(6512007)(71200400001)(2906002)(122000001)(478600001)(966005)(38070700005)(6486002)(86362001)(31686004)(36756003)(2616005)(31696002)(64756008)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TlFON0szTFNYd2N6dTVrRit4NUo3anlYdElFdXVvM205dVN5SmhZTnR6OEd6?=
 =?utf-8?B?RnFHWDFiNmZPMFphT05aTWZLd2VrdmQveWp1MjFibENpVVhiTWhGKzB5QnUz?=
 =?utf-8?B?TFRIcUQ1OUxGK0o4YkxCa1F0YzY5Tk16ejA0NjBuT1F3bWgxUUdQOEpUWjVT?=
 =?utf-8?B?d3dKbzZxUzhDSWE2MkhQaUp1aDg1enU2cS9taUlwTy9TWTVGeGZrbDBueGpI?=
 =?utf-8?B?WGpsNlVRWlRYWmV3bjd4L2tWTjRMajd0bitXR2R6OG01QTBTZFAwVkhlVEZC?=
 =?utf-8?B?eXRKbm9yczE1N2x2c21uZGVyUXNkZmdFMlY5TER5b1hPSHZXZ3ExZk1nMlcv?=
 =?utf-8?B?dFR1QUE5UEwyOUFhZStzTXpNRHpmRlpHQkhSUkQ5TzYxUGlpeXFXRzNWTU1y?=
 =?utf-8?B?MEh4TWVxLzJGK3dRK3I5aUtjUWVTakJHMjd2T2QwZFBVbDJqZkFjZFpOcFlO?=
 =?utf-8?B?YzhpTWRtZkg1K2NNbEgzVHZtMWhScHFMVElTVmlEcVlNR2J6Tk5lRDd0dUFr?=
 =?utf-8?B?MlVwY1FjcWRHU21HL1RMeitlcnJIZURWMFRmTGRmYkJ5OVl5cE80S09LYldR?=
 =?utf-8?B?aHN4Nzc1YTV3UGR0KzFrWHBLZW16V0dFQ3hTWEZNMEM1cmVKZ05TMG1rdThD?=
 =?utf-8?B?QWFKZ24wTTdOdUtXTWZhV1FlY0grMFh0a2lyVjVocDgvQ0NJa3oySnBoTWRt?=
 =?utf-8?B?MnhvSEZDVzhYZ3VpNzdpYXFqVFZGcjdqNHR2blFuZ2g1TENDUGh2SG0vZ3lT?=
 =?utf-8?B?NzBzcWFPOGlzYTVFRjU5dEFGcXZuVXhHeDlMWTljd0dLSlRXTnBpRDFuNll0?=
 =?utf-8?B?RFU5b0lPaExwOXh3bnN2eWorWCtoMkxhMktib1YyNFowT1BuSVNkaGxnRXhE?=
 =?utf-8?B?YUhPZTh2NFdKTFVYNXd5M3YwNFJUM0VjZ1FleGhsVWxBcUJPNWlzSlJTYkQz?=
 =?utf-8?B?VC9GWEd3YkZ2ZzVOR1djR0tlUXVjUThId2VOUzNISzQ1b3ZBMFNzcFVWYzJ5?=
 =?utf-8?B?a0s2QzJMQUIwam9wL0ZTNlIwc1VCVmIveUxETDQ3R1kyekl2TWt2MUZkQ2Mx?=
 =?utf-8?B?ODU3eHNyOVNQSTJDZkJ0NXI0Tk5HSCtBaFppNzRmQWlTcTBkNVhWa0M1cGd6?=
 =?utf-8?B?S2oyZk1ZamN6TGd5SmhDNktYNHhSV0VKTmJnekplTTdxMkd3NXIrTWx5ZnEr?=
 =?utf-8?B?Z1NsVzcyRzFaazR1czZaQnVGUGIrcytITkd1YW9NaWdYN29ZTVBxZUU0aTJJ?=
 =?utf-8?B?b2tVRXpWL3QxL3k5UmIzSTh0MXdUUnpyNmtKQ0orbW5XdlUwaGNJejNqdUJ3?=
 =?utf-8?B?b3c0U1J4WUxJeDlSZXVaSmNUNm5tcURIVGJ2aG1jeUFhdHlSZitKVStxQnRw?=
 =?utf-8?B?UFNOaXFIWDQ1cmc3T3o5b0VwWXBLVm4vOW5aT1lkRUlzbVZJTitLSXhCVTJK?=
 =?utf-8?B?VHBPR3prZjZrMTN1U3hXeUVaL04yS2d2TlBUbWdFNlZoS0xJUDRPNlVlQVA2?=
 =?utf-8?B?NlJkenNWZEVVRVU3MllCcW9zRWxUT2ZtbWkxeUh4YUJwNEdHR2V0MlI0TDlS?=
 =?utf-8?B?cnJSMGtRWkZNQ05MTWp3d2owUmFNQjJnYnFIKzZNR3Jrd0pYNmROdXAzL3FW?=
 =?utf-8?B?WFc0Q3REYld5OERPdTNNWGlQSGZES2p5ajZnemZvYXN2dmd5eVNFLy9KUkIw?=
 =?utf-8?B?UllldXF1WjRVMXJjTlV1NzhRRHltenc2emRpQW9kUE1PQk5KekpUbWhuWGhj?=
 =?utf-8?B?TXdHdXpVZFV6TGtGMzVjNVNMOFRrOXJ6V1BWWjBtYmp3dEpuWHB1Y1p0SDhj?=
 =?utf-8?B?ajFzNXNKcUJrSXNLdlBER2VPeG5KZzhYZzRsOVRqUW9TNEhwdHF3cWc4dk12?=
 =?utf-8?B?WlB6eFNRbWZ2WGRZSDY2VVFFNTczK3ZLcTR1ZnFydUV4amlRV2RPYlU2cXdu?=
 =?utf-8?B?TVFXd0c4eGNOeXd6RU1YNEMxamV1QWpkRFpjU3JiOGFwb1dWYmxub0tyV0hC?=
 =?utf-8?B?dDVJVXZBM3ZSOXpWSzdaZWFoSUMrSDZ0bnBxMWJveGhWdkV5VzZiRzl2NVBH?=
 =?utf-8?B?bS9uRGpONDFPNXZjYi9NSmtTQStMWXRZK2N0QmFxcVBpYVd4ZHdOS29tWElD?=
 =?utf-8?B?dW5xZ25BOGFTSVFIYktJbVFTNk5rZ0VtL05CcWNGSEZ2RE94ZWVyMTlFbnBJ?=
 =?utf-8?B?Rmc9PQ==?=
Content-ID: <01FE9C67F5489B4B903DEF85AF955017@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ccb5e1a-549a-453c-a0f2-08da5ec2fc9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2022 20:14:38.0954
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TIpYSAIzykfzU7Sq1P6DhVyUnmHMQRI057qgBw5huURhzDUd5tT6XXXZB32TOLkU9J7/UfI2tn8IbktWkT5Wc+eusyc5EVPlTkNEtBImzrs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_131448_232672_C7E0BF29 
X-CRM114-Status: GOOD (  30.37  )
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



On 05/07/2022 21:07, Sudeep Holla wrote:
> On Tue, Jul 05, 2022 at 07:06:17PM +0000, Conor.Dooley@microchip.com wrote:
>> [Adding back the CC list from the original thread]
>>
>> On 05/07/2022 13:27, Brice Goglin wrote:
>>> [You don't often get email from brice.goglin@inria.fr. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> Hello Conor
>>>
>>> I am the main developer of hwloc [1] which is used by many people to
>>> detect the topology of servers. We're started to see some users of hwloc
>>> on RISC-V and we got some reports about the topology exposed by
>>> Linux/sysfs being wrong on some platforms.
>>>
>>> For instance https://github.com/open-mpi/hwloc/issues/536 says HiFive
>>> Unmatched with SiFive Freedom U740 running Linux 5.15 exposes a single
>>> core with 4 threads instead of 4 cores, while StarFive VisionFive v1
>>> with JH7100 running 5.18.5 correctly exposes 2 cores.
>>
>> And with Sudeep's patches applied I get (next-20220704):
>> # hwloc-calc -N core all
>> 1
>> # hwloc-calc -N pu all
>> 4
>> On a PolarFire SoC (so the same as a SiFive U540).
>> So unfortunately, these patches are not the fix you seek!
>>
> 
> Not sure what you mean by that ?

Nothing meaningful really, just saying that this patchset
was unrelated to the problem he reported his response to
it.

> 
>> Wracked my brains for a bit, but could not see any differences
>> between the U740 and the JH7100. Culprit seems to be the lack
>> of a cpu-map node (which is only present in the downstream dt).
>>
> 
> Indeed, the topology depends on /cpu-map node. However on ARM64 we do
> have fallback settings in absence of /cpu-map node so that it is handled
> correctly. I wasn't sure what was or can be done on RISC-V as /cpu-map
> is optional.
> 
>> I've sent patches for the upstream devicetrees:
>> https://lore.kernel.org/linux-riscv/20220705190435.1790466-1-mail@conchuod.ie/
>>
> 
> I will take a look.
> 
>>> Does it depend a lot on the platform because
>>> device-tree and/or ACPI aren't always properly filled by vendors?
> 
> Absolutely.
> 
>>> Does it depend a lot on the Linux kernel version?
> 
> Ideally not much, but hey we had some issues on Arm64 too which this series
> is addressing.
> 
>>> Should I expect significant improvements for both in the next months?
> 
> Not much in topology or nothing planned. I have no idea on NUMA
> 
> 
> Hi Conor,
> 
> I would have preferred you to add me to the original thread and referred
> this thread from there. I don't want to derail the discussion in this
> thread as nothing much can be done here.

This is the original thread! It was just one off-list email that was a
to me only response to this arch_topologu thread that you can see here

But yeah - should have CCed you on the cpu-map stuff too.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
