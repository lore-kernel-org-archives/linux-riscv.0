Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF18ECAAD5
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Sep 2022 19:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X2IpwS7cZVn6V5bLpUOkyNYaNcfUro/xULji3SEl08I=; b=IUPfDjvKsYfxhZ
	oxqyEOAkQlT96vq5kOvJfStuS6KevCrHlQFZvkrXU7tCahUMcedYK+Li12LXRCXksI48sGYw/0K34
	eGssAgup+Ze27PXsBGKOlq932gr7CKzGgunlzliUX27kJI07ruWCEXEm3d4VCsFhnMpgd4bCfsFqD
	780IvpAFK8lkyBco17e6XvxDEqqbe2W5c8dnqTj9zGVc1Q3seZmd39q/UExOyRx5T0UPyA1g+Ck7d
	WU+wl53cSpb2k5c25+9ybMauUCn+VGpgTKwgVzRogj4qytp8/S10h459qBgxt4FZkowH46Nvjhcwp
	O1EnqdPlkRSE/q8mmdQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVI0t-009YsE-F1; Mon, 05 Sep 2022 19:44:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVHbn-0096kW-1Q
	for linux-riscv@lists.infradead.org; Mon, 05 Sep 2022 19:18:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662405491; x=1693941491;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=3s6CnyeKoyzwi9qeCR5AiCdpIk7pDTy870IfRfklSVc=;
  b=PxYVeYF0oCECSqanhEW/op2Lay8rdy/B6T2ckcdE+vNeTBNPRRQCq+Ry
   z6CvrMYpr/PaUkkEnWmGAMZmyP/9MUmqJkFB8TkiKNj8TqkXCpad0IbQo
   O0Pei1OG8YLtFSjQ6xx5wDyo1eltnIzN16w6bIScgtkWzMTBH82mSYTNN
   aB6F+4jAKKyvdMEMpyDs/vkm7c6f0V+v8JM9f8pBZH7NE/P7KTv9GQKK5
   JFfdDKcAzSjFnxsT75/k4VXQRUArlB+9ZfuLQ6RRqezLwBbHHWwH/qPPc
   Nega75lMaGFzcoS/62jWghmbUpVckkD0fIm6ROeV4RckC9aDcMwUqZY4H
   g==;
X-IronPort-AV: E=Sophos;i="5.93,292,1654585200"; 
   d="scan'208";a="172465570"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Sep 2022 12:18:01 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 5 Sep 2022 12:18:01 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Mon, 5 Sep 2022 12:18:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KbEHa84ARHiYGqm6gcI6RhNBJF/ImnhydV1GG+p82qXzRFPJiVO6IxRyknpBIuCt+MJkVY9Vc4Z+jzcjyvmBRttThI+DQNIFwgPt/Jntvz3mmSBOWyILcRZWUwLXBBo6Pyut3WK+mVAndxKXUuCyjqEsq0P2FZroJUkm+ep3pcoqjSpV1eoXHBaqzbcrfqi38/PDsiwwCkSpXJyH/JaM9LRDRk7qZGwTRjHz+ZypEr9OmHK0TwJ9MriPPUWKHQn/S0aojqAt9scW6Uxs0kFJVlndDtLFaBflYkXkta3fuQvbEG4WmEfjEWrHD73h4Rprugza1J7twG//3eVnyl0ETg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3s6CnyeKoyzwi9qeCR5AiCdpIk7pDTy870IfRfklSVc=;
 b=NpPU1V54zaOiXHK9B8zEZ2N6EDJjexr3Q3RjHYNJla/d63NnYovHcUTz0ENEOcVjvqDz4aJ3L+fQjZfYqOA36Ogke+p7X+ubePI6Tj5EQdLWBek60FE08Q6NmW8egTdbKLrwvcksYMD3ld+mWur1JTnhWZ4rbJ+HgClqgpBfiMexO8Q/iDoZl8TQ7Xw/2/7ZXwqaTVxDIjeBYJf22h6RoclOW2UWvv5OUPqHyjwooWgjWfGgEM1k6tLluz3aD/rbPnMNgS7fvu2vxgqjk1NestsLDK7/q+Ia7eBe41n6hzd04zQbHdykDFy+nT7m8z89vDi38ZNqFwsv49fNhSrsLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3s6CnyeKoyzwi9qeCR5AiCdpIk7pDTy870IfRfklSVc=;
 b=jMDrqBLzpONqdbByqkGliKORgf9sQ9Nyoq2w6IStNLBVpgDZrjSRxcdHqvVnP8JEjSfhwKGJUHdW9eeKQW2qCGNGRgTIICA//Qthdh0+E7r5mt/bA6gZkWIz1BjUlI0RCM0r2vh4mBWfe0lRmbfKq38P+U2ja1VunWDs59DJFvs=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SA0PR11MB4752.namprd11.prod.outlook.com (2603:10b6:806:99::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Mon, 5 Sep
 2022 19:17:56 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 19:17:56 +0000
From: <Conor.Dooley@microchip.com>
To: <heiko@sntech.de>, <atishp@atishpatra.org>, <anup@brainfault.org>,
	<will@kernel.org>, <mark.rutland@arm.com>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Conor.Dooley@microchip.com>
Subject: Re: [PATCH v3] drivers/perf: riscv_pmu_sbi: add support for PMU
 variant on T-Head C9xx cores
Thread-Topic: [PATCH v3] drivers/perf: riscv_pmu_sbi: add support for PMU
 variant on T-Head C9xx cores
Thread-Index: AQHYwTJKH1gNsbjXlUCKjBTcO3YrE63RNgKA
Date: Mon, 5 Sep 2022 19:17:56 +0000
Message-ID: <72d1fe6b-0873-0a28-fd1d-ea84e84c767f@microchip.com>
References: <20220905141644.2468891-1-heiko@sntech.de>
In-Reply-To: <20220905141644.2468891-1-heiko@sntech.de>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c5698908-8bcd-45ba-1a0e-08da8f735693
x-ms-traffictypediagnostic: SA0PR11MB4752:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rq5DCSH5nv8Spy8SaFhHDWynk5AsMXUofURjwP7nPtSyCw2Z2jqNV9mlifzbGV5GHOLGi/NV6uIu3MqAMPxse3XjyNn3PgfZyijlQ4W/zO73QsAqgYAFeHyTMRdp9igUJHuW1iACnZbF0zkqFck9fqKMDx/QyvsvPwIz5Rgiml5K/NaC3ykQR48/Pgja0edN7ANQVNghmdIZbYUuVG4gfHEU9ZmIpZujuqhZX1Vz/zamki7RMDmzQLjElTlJ69FVB1OWH4YzIpsbV2HC5lkFYQ4sgC007gUTDPuuAHQ5xFlY7Tidcz1cSaJupAImB679mAUYdxUI77HyyWXvsKgdw8Gp9XLlWbDR2bdQCCN7EuBpZge3ZR6VX0W9J14CDFknRkoFwyGmMwHd+kVgEsm/X5ms6aQXMyywEaTPV6x2N8+3d2k8deJ1kp6eZ7Xash7NvieeD6eDHSkjRSxJa67k6a7aWrl+hQ5VH6xSuYWCK6ijfdH1SG0GP5bXglH47ng54e6Y/J4iCuvYwh9px0/Mr1oW+Zqce8Ai6aLQySUA4OSLQ5j/sJNeeCJgznq7OKZZLfrR06oRJbIXfSsXL8BZhvBemiUEwbiOkYpfSEuFZFEh8/tCDNHTf77DTZhtuiZvHNb4p9XRPiYIGoFRpwkK7esDGnbWbJSys+ZUNPiwwOZ+9WqcQBJZUOOQoup0QfmDakVhJ1jluMpAO2MThDnnHSx6jg3uWFytWAoRY0aaVz3R50WRFun9Gn9uJzt368I/fRFPjFSUVdIvvcwgXr4wCsUECFvgU4RDJu/NuOoPhYX+fh9Uajol4uONvAUhqZGbotC+daJKxRKdQ4oQz/uycc7k3Uv1A6IMjg7XsehhzbwUqvKuqJj6yK33uE0a5hyNF5x1/JCDlmxBRCsFl1XPgQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(366004)(136003)(39860400002)(376002)(396003)(38070700005)(38100700002)(64756008)(122000001)(4326008)(66446008)(8676002)(91956017)(76116006)(66946007)(66556008)(66476007)(110136005)(54906003)(316002)(478600001)(2906002)(5660300002)(8936002)(53546011)(6512007)(26005)(7416002)(83380400001)(2616005)(186003)(71200400001)(6486002)(107886003)(966005)(41300700001)(6506007)(31686004)(86362001)(36756003)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Yy9ONXVzU3BNMWR6WlZxZjY1b0c3WjJQSTI3UmIvamtER1lsMlhFb25jNHdL?=
 =?utf-8?B?YmhZZExCVkhacWVCR0U2a2kva3Fpc2E1b2xXVmFnT09MRnhoRUJQZVZXRURX?=
 =?utf-8?B?N3FLRlplZzRva0UzVmRrVUdqL2dBRFlXcjNRN1NrRGRZcVZKU2krbFk3cWFw?=
 =?utf-8?B?cFpMR1pJYXRzMHJKa3E3NFl4dFlnYmRxR1M3Y0srRW5VT0srZVFJYzd3dU4w?=
 =?utf-8?B?V0VKQm81TFlxUzZxbDZSaTRvSEVmbHptRTBBc29kdzhLVm1rZFNERllZb1Ru?=
 =?utf-8?B?RFFJNzBIRlh2Z0N5K3czR3RJaWdRcFNjTmVDSHZSbXJzT09pMWYraW0xd0lO?=
 =?utf-8?B?WjJKSnB5djJJSFNFQ2Z1L3poL0JVNEg0RkhZTWtSSDl4SlVacUFoUWhpUlM3?=
 =?utf-8?B?OGlzYS8zQzFVcysxWFJ1azhkaWN2d1AvSmliUDg2U0ZLWnNzZnBmTnB6VVlO?=
 =?utf-8?B?NkJWK1Y0d2JOTm5CeGdxc1hMeGJqcWZCVjBEMU9qZDJXQjVyQlBsT0tMTitN?=
 =?utf-8?B?bEJhdEVLelh6VmE3Wk5wOFl1djJIWUwyT1p2eFFJUldOdzhuUUpBQ0IybWNn?=
 =?utf-8?B?QkdkVTlEeGdqR1gvS3dIcE9weFBkODdac2hOUE5pMjlia1lyVnNlQStPb0pR?=
 =?utf-8?B?c05OQUUzL1pyWlAvWXNZaGNxa1pkM1lUQ3FoUlZTdUtjcFdQOWFmWEVyNDcx?=
 =?utf-8?B?Vk9TdVRMYTdnZWdIVWFhaGNzZEJUSVlSUUZ2N3lTdUw1MDVxcE5JVUFnalJ0?=
 =?utf-8?B?WGNUdERMT3JaN1l2eEE1UW1NdklCbkZBcm4xemY4WlRlMGpEWDByWEM0L01J?=
 =?utf-8?B?dGZwemxBd2tMTUpSbEI4MzJ4NlE4SHdaOTJQWmx3ajJUUkltQkQ1ZnJxQVZV?=
 =?utf-8?B?RWY5UkZMaEFQSXVOZWV5Q3pJNkZLa01KRitZQ3pmSUpXRE13YlZ2bDdqVEdu?=
 =?utf-8?B?KzlvREJlZjVJNDRROEc4RVBEYkNEd3dLVnhsTDhza21Na2UxVFZhSmcrampk?=
 =?utf-8?B?V1VETnA1MU5oTmtrcEJMNFJmODJ1MHlxOXFmaHlpZTM5NEFZaS9YbnNoVU9z?=
 =?utf-8?B?aEZFODZkMkdwQWk3bVZZbXpXQ2hMUklRMTZjQWg0aDdRbkc1VDIvVGdSZ21N?=
 =?utf-8?B?WjRqOWY5dEVvaUpqQk03RnFiNHFIMzBWOGh1cStwVUI5SUdBUzlpVHZmK3E5?=
 =?utf-8?B?ekIzM3B5cmM5cGFTNFN4aGo3K1oyb2xnWVZLazRiSmdMMVNEVDJqOEUvRW8r?=
 =?utf-8?B?UW1QR1NPM3FtS05QNmJicmgxZjY1cjJBY1FGWkZ6dk56VVcwRkFnTkQvQkds?=
 =?utf-8?B?cldHaXJRdHVyRzAyQjRwTHVmNSs0RzNpcUlKZDV5SFJxamJvRTljMVFZa0Iy?=
 =?utf-8?B?aXJqWTBCNkwxa0VRR2Q4TFFhUVNsS01JYXo4TkJJbVMvdzlhQmRUdU00VTNG?=
 =?utf-8?B?dStnK0U3UVNSbFVBc1NBOWhLRFpCOXFSSmNtbThlbm9KRVN2UzI1UVVnRXBG?=
 =?utf-8?B?d1liMk5KTzlJTHo0Q1dxVFk1RWxIR0hxSVY0ZGl2dlVseGVWOHorR3VYeUZZ?=
 =?utf-8?B?UExqaStHTS9NK3Q1QlpCemVGeUxVMG55SXo2eGJpelNwcUNBRWNrd3VIa1Fi?=
 =?utf-8?B?T3E1MTEzanFNcTI3b01xMmZVeWduNVhzeG9zNFFjbnBKSWhTd1ZvbVN1OEdm?=
 =?utf-8?B?cW9YRWVTRmJMb0FUUU0xdHE1Y056MUtCajFxN1V0WkJoSGU2cTExSlNpMk80?=
 =?utf-8?B?Sk5uQkRVcmllTXNadUp4Rm40Mm9DRGdjSWprRFoyT1RMWDFJM0hieG1MUmRL?=
 =?utf-8?B?S1VTTWRSU0JMYmRPY0l6V0hVYXhYTENSbXlmbllYYTdTVlNUUUM5cFl1aldy?=
 =?utf-8?B?TVlQK1dXT1R4NEFXdEx1MTZsQVlGQUUzUit4U2xuSHJqSjRzeERGK2kxS1My?=
 =?utf-8?B?THR0WTZKRlA0bUlTSU9GcWJaKzNvcS9UYktsbU4wMlhMTjJuYkk3ZHNITUVK?=
 =?utf-8?B?TFJsV1JyVmY5Q0Z6V0YxaiswallGMXNXMTNvYlc1cU9VdG1CYks3eEFkZ2Ex?=
 =?utf-8?B?dWpIU2c2K21jNC9LRFR5U0VwUE9ZcTdIV3haazJLbWFWTUJ3M1piaXJFdFJS?=
 =?utf-8?Q?YCSLyPjOiw/pJAS8IfneyQmd/?=
Content-ID: <18140EC03A461F44A895CBE7CD01EBE7@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5698908-8bcd-45ba-1a0e-08da8f735693
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2022 19:17:56.2526
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +rsnmFdvMeYE9S8WYeOZ7hMEIxjDgR4+nSX9TDdJ6bOeXXBRuEfrVt7d5uFOBvXM+MLEpqPzirE/ZwVBauSjNego6javYkPXGY+VeyJgRhw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4752
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_121811_221987_30BCF85B 
X-CRM114-Status: GOOD (  31.03  )
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

On 05/09/2022 15:16, Heiko Stuebner wrote:
> With the T-HEAD C9XX cores being designed before or during the ratification
> to the SSCOFPMF extension, it implements functionality very similar but
> not equal to it.
> 
> It implements overflow handling and also some privilege-mode filtering.
> While SSCOFPMF supports this for all modes, the C9XX only implements the
> filtering for M-mode and S-mode but not user-mode.
> 
> So add some adaptions to allow the C9XX to still handle
> its PMU through the regular SBI PMU interface instead of defining new
> interfaces or drivers.
> 
> To work properly, this requires a matching change in SBI, though the actual
> interface between kernel and SBI does not change.
> 
> The main differences are a the overflow CSR and irq number.
> 
> As the reading of the overflow-csr is in the hot-path during irq handling,
> use an errata and alternatives to not introduce new conditionals there.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

modulo Andreas' question being answered satisfactorially, this is:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> ---
> changes in v3:
> - improve commit message (Atish, Conor)
> - IS_ENABLED and BIT() in errata probe (Conor)
> 
> The change depends on my cpufeature/t-head errata probe cleanup series [1].
> 
> 
> changes in v2:
> - use alternatives for the CSR access
> - make the irq num selection a bit nicer
> 
> There is of course a matching opensbi-part whose current implementation can
> be found on [0], but as comments show, this needs some more work still.
> 
> 
> [0] https://patchwork.ozlabs.org/project/opensbi/cover/20220817112004.745776-1-heiko@sntech.de/
> [1] https://lore.kernel.org/all/20220905111027.2463297-1-heiko@sntech.de/
> 
>  arch/riscv/Kconfig.erratas           | 14 ++++++++++++
>  arch/riscv/errata/thead/errata.c     | 18 ++++++++++++++++
>  arch/riscv/include/asm/errata_list.h | 16 +++++++++++++-
>  drivers/perf/riscv_pmu_sbi.c         | 32 +++++++++++++++++++---------
>  4 files changed, 69 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig.erratas b/arch/riscv/Kconfig.erratas
> index 6850e9389930..f1eaac4c0073 100644
> --- a/arch/riscv/Kconfig.erratas
> +++ b/arch/riscv/Kconfig.erratas
> @@ -66,4 +66,18 @@ config ERRATA_THEAD_CMO
>  
>  	  If you don't know what to do here, say "Y".
>  
> +config ERRATA_THEAD_PMU
> +	bool "Apply T-Head PMU errata"
> +	depends on ERRATA_THEAD
> +	depends on RISCV_PMU_SBI
> +	default y
> +	help
> +	  The T-Head C9xx cores implement a PMU overflow extension very
> +	  similar to the core SSCOFPMF extension.
> +
> +	  This will apply the overflow errata to handle the non-standard
> +	  behaviour via the regular SBI PMU driver and interface.
> +
> +	  If you don't know what to do here, say "Y".
> +
>  endmenu # "CPU errata selection"
> diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
> index 902e12452821..d4b1526538ad 100644
> --- a/arch/riscv/errata/thead/errata.c
> +++ b/arch/riscv/errata/thead/errata.c
> @@ -46,6 +46,21 @@ static bool errata_probe_cmo(unsigned int stage,
>  	return true;
>  }
>  
> +static bool errata_probe_pmu(unsigned int stage,
> +			     unsigned long arch_id, unsigned long impid)
> +{
> +	if (!IS_ENABLED(CONFIG_ERRATA_THEAD_PMU))
> +		return false;
> +
> +	if (arch_id != 0 || impid != 0)
> +		return false;
> +
> +	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
> +		return false;
> +
> +	return true;
> +}
> +
>  static u32 thead_errata_probe(unsigned int stage,
>  			      unsigned long archid, unsigned long impid)
>  {
> @@ -57,6 +72,9 @@ static u32 thead_errata_probe(unsigned int stage,
>  	if (errata_probe_cmo(stage, archid, impid))
>  		cpu_req_errata |= BIT(ERRATA_THEAD_CMO);
>  
> +	if (errata_probe_pmu(stage, archid, impid))
> +		cpu_req_errata |= BIT(ERRATA_THEAD_PMU);
> +
>  	return cpu_req_errata;
>  }
>  
> diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
> index 19a771085781..4180312d2a70 100644
> --- a/arch/riscv/include/asm/errata_list.h
> +++ b/arch/riscv/include/asm/errata_list.h
> @@ -6,6 +6,7 @@
>  #define ASM_ERRATA_LIST_H
>  
>  #include <asm/alternative.h>
> +#include <asm/csr.h>
>  #include <asm/vendorid_list.h>
>  
>  #ifdef CONFIG_ERRATA_SIFIVE
> @@ -17,7 +18,8 @@
>  #ifdef CONFIG_ERRATA_THEAD
>  #define	ERRATA_THEAD_PBMT 0
>  #define	ERRATA_THEAD_CMO 1
> -#define	ERRATA_THEAD_NUMBER 2
> +#define	ERRATA_THEAD_PMU 2
> +#define	ERRATA_THEAD_NUMBER 3
>  #endif
>  
>  #define	CPUFEATURE_SVPBMT 0
> @@ -142,6 +144,18 @@ asm volatile(ALTERNATIVE_2(						\
>  	    "r"((unsigned long)(_start) + (_size))			\
>  	: "a0")
>  
> +#define THEAD_C9XX_RV_IRQ_PMU			17
> +#define THEAD_C9XX_CSR_SCOUNTEROF		0x5c5
> +
> +#define ALT_SBI_PMU_OVERFLOW(__ovl)					\
> +asm volatile(ALTERNATIVE(						\
> +	"csrr %0, " __stringify(CSR_SSCOUNTOVF),			\
> +	"csrr %0, " __stringify(THEAD_C9XX_CSR_SCOUNTEROF),		\
> +		THEAD_VENDOR_ID, ERRATA_THEAD_PMU,			\
> +		CONFIG_ERRATA_THEAD_PMU)				\
> +	: "=r" (__ovl) :						\
> +	: "memory")
> +
>  #endif /* __ASSEMBLY__ */
>  
>  #endif
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 6f6681bbfd36..f814d3ce5ba2 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -19,6 +19,7 @@
>  #include <linux/of.h>
>  #include <linux/cpu_pm.h>
>  
> +#include <asm/errata_list.h>
>  #include <asm/sbi.h>
>  #include <asm/hwcap.h>
>  
> @@ -46,6 +47,8 @@ static const struct attribute_group *riscv_pmu_attr_groups[] = {
>   * per_cpu in case of harts with different pmu counters
>   */
>  static union sbi_pmu_ctr_info *pmu_ctr_list;
> +static bool riscv_pmu_use_irq;
> +static unsigned int riscv_pmu_irq_num;
>  static unsigned int riscv_pmu_irq;
>  
>  struct sbi_pmu_event_data {
> @@ -575,7 +578,7 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
>  	fidx = find_first_bit(cpu_hw_evt->used_hw_ctrs, RISCV_MAX_COUNTERS);
>  	event = cpu_hw_evt->events[fidx];
>  	if (!event) {
> -		csr_clear(CSR_SIP, SIP_LCOFIP);
> +		csr_clear(CSR_SIP, BIT(riscv_pmu_irq_num));
>  		return IRQ_NONE;
>  	}
>  
> @@ -583,13 +586,13 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
>  	pmu_sbi_stop_hw_ctrs(pmu);
>  
>  	/* Overflow status register should only be read after counter are stopped */
> -	overflow = csr_read(CSR_SSCOUNTOVF);
> +	ALT_SBI_PMU_OVERFLOW(overflow);
>  
>  	/*
>  	 * Overflow interrupt pending bit should only be cleared after stopping
>  	 * all the counters to avoid any race condition.
>  	 */
> -	csr_clear(CSR_SIP, SIP_LCOFIP);
> +	csr_clear(CSR_SIP, BIT(riscv_pmu_irq_num));
>  
>  	/* No overflow bit is set */
>  	if (!overflow)
> @@ -651,10 +654,10 @@ static int pmu_sbi_starting_cpu(unsigned int cpu, struct hlist_node *node)
>  	/* Stop all the counters so that they can be enabled from perf */
>  	pmu_sbi_stop_all(pmu);
>  
> -	if (riscv_isa_extension_available(NULL, SSCOFPMF)) {
> +	if (riscv_pmu_use_irq) {
>  		cpu_hw_evt->irq = riscv_pmu_irq;
> -		csr_clear(CSR_IP, BIT(RV_IRQ_PMU));
> -		csr_set(CSR_IE, BIT(RV_IRQ_PMU));
> +		csr_clear(CSR_IP, BIT(riscv_pmu_irq_num));
> +		csr_set(CSR_IE, BIT(riscv_pmu_irq_num));
>  		enable_percpu_irq(riscv_pmu_irq, IRQ_TYPE_NONE);
>  	}
>  
> @@ -663,9 +666,9 @@ static int pmu_sbi_starting_cpu(unsigned int cpu, struct hlist_node *node)
>  
>  static int pmu_sbi_dying_cpu(unsigned int cpu, struct hlist_node *node)
>  {
> -	if (riscv_isa_extension_available(NULL, SSCOFPMF)) {
> +	if (riscv_pmu_use_irq) {
>  		disable_percpu_irq(riscv_pmu_irq);
> -		csr_clear(CSR_IE, BIT(RV_IRQ_PMU));
> +		csr_clear(CSR_IE, BIT(riscv_pmu_irq_num));
>  	}
>  
>  	/* Disable all counters access for user mode now */
> @@ -681,7 +684,16 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu *pmu, struct platform_device *pde
>  	struct device_node *cpu, *child;
>  	struct irq_domain *domain = NULL;
>  
> -	if (!riscv_isa_extension_available(NULL, SSCOFPMF))
> +	if (riscv_isa_extension_available(NULL, SSCOFPMF)) {
> +		riscv_pmu_irq_num = RV_IRQ_PMU;
> +		riscv_pmu_use_irq = true;
> +	} else if (sbi_get_mvendorid() == THEAD_VENDOR_ID &&
> +		   sbi_get_marchid() == 0 && sbi_get_mimpid() == 0) {
> +		riscv_pmu_irq_num = THEAD_C9XX_RV_IRQ_PMU;
> +		riscv_pmu_use_irq = true;
> +	}
> +
> +	if (!riscv_pmu_use_irq)
>  		return -EOPNOTSUPP;
>  
>  	for_each_of_cpu_node(cpu) {
> @@ -703,7 +715,7 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu *pmu, struct platform_device *pde
>  		return -ENODEV;
>  	}
>  
> -	riscv_pmu_irq = irq_create_mapping(domain, RV_IRQ_PMU);
> +	riscv_pmu_irq = irq_create_mapping(domain, riscv_pmu_irq_num);
>  	if (!riscv_pmu_irq) {
>  		pr_err("Failed to map PMU interrupt for node\n");
>  		return -ENODEV;
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
