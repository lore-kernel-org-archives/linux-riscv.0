Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E26CC77B75
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 07:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kjrx+nQEvT+osb+pmUakwdlKx0TI2Tfgn7CcM07jNVE=; b=hqQ+baGLShLRZA
	QO2phekgsolzOpHfd3iDI98V3MqZPq6d0D96gpKwVidWLnlBxIcWmFHHkzNHMNGfMm+b+1hU84m7j
	gpuSJYUWMcTBkR4QjfznMp7VhNUkSBgZMihlWyKp0Gfjvk25RHycfkrhmlnYP9qsQQyzcRQt4qiJ2
	XxRYornyYEjzZab2tx/vRGsV71E+rqZ5sD8Oev1OPjdLYB5Mp8T2u3LXHub5+GcD+GOTWB5u8UREx
	4TcLcS2QwaViyyIk/e0tbBhsZDlOpymVaK1DFA6uxp+H1a+S7GP3uzquCws/SvLekOtCYzaMLjgDo
	AAPqzbrCWdPhX5Y9Rmfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxNfG-00BFsX-0j;
	Fri, 12 May 2023 07:58:10 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxNfB-00BFpG-1E
	for linux-riscv@lists.infradead.org;
	Fri, 12 May 2023 07:58:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1683878286; x=1715414286;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=z+s13Ce9TqFToE+KrRBFl9igEBjFzHsG4I4QC2nswuU=;
  b=gchWEU8cGWc8ELsEezD9bITjzp468AtvwobBrQgv6aLqi1/hUzsj0HRx
   eQMHfwxQzhd4VmBxUGV/cqr701KgJEf4/mK98cWFbUAMhBXJZEpuJq9uo
   3iAZwnrlamkq+rXlWAKazHqswEWYUUlV0kWXpyE2mcoFOLy1ZtrudOi10
   GmbxzDCPEhWtLqt2+PG4y+uCPubF9uWkylgf5MnI6Dg5sJ+mgQC2l+d11
   nPVzDErooF2sN1F8rhSfYVLgtB0BsewxLBiHjYD8PkqGEJEq1X/5S08Ym
   EV3yjTdbNcGgCGFBIDehwRyyU5ORYDu5j7Go2dv20I2f3M9ZmYMbcnM94
   Q==;
X-IronPort-AV: E=Sophos;i="5.99,269,1677567600"; 
   d="scan'208";a="210914460"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 May 2023 00:57:56 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 12 May 2023 00:57:52 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 12 May 2023 00:57:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ha1u4c4BtsEHhXa03MU4LOjUsOa/vOyOKHrf2AqJYayvK3WIwSCITf1DB6D9/fFUubV/w7S46G811VtahQcaC2OL8OW9CBkSKDSnZu7CsKnlUi24lkx+CPLJHnqtKj6vBxBB+h3uQTjdgT7fFQtGlH2QEwCO6lLixsN6ic1kPOKfp+gDoDKYi8jC8vwr9RKSpBP32nXg3wPaoYEypVleiBEkluXg0szZ6JF6uaukSh8iHvao5mPWVuziUhhTQAYoFaphmCO4sYQtIs4HNkYc3P9VAgoAOfjkHpEJL6DvH9Gz4iE0m2WBZRCR8DRcRVHTI7TgfucXPVRvh7+5t0gsmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z+s13Ce9TqFToE+KrRBFl9igEBjFzHsG4I4QC2nswuU=;
 b=BtuqQCoj6iEDgfsF5+tOUwsG3BqSBn5FETv4Dv/6fGzcKrDy5iiS7hxjxttdNy94NA/hMorO67LDZUoNxN/pcIRx2NB6tE0Pe4Mw3/wnE8S0ePsGydER0xVdWldk+tAQxveTjbMGou8RgFEy6OLenw7Cq34anU7ZPlwTChcGZpotkFtALmz9i5Ev9QhzL/64wFnn9Lez1Ou8qLJ90VE0CqnVylRKyNnbyuca+mLu4eJd7vnc5dR9j3wBF8oDmrCW5osGAUR1GV3FtEeBfWTC0342fdERURM+7mvHkMOvp+AZbMYe7uhDpaf4SDvHygHmEu3BZ/15UBS3lWKOwLTUcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+s13Ce9TqFToE+KrRBFl9igEBjFzHsG4I4QC2nswuU=;
 b=H6bwFkd+prHCo4OnRvBPpfFmw6dGwTNP7VjSkXoDxpV1S53oEB+Rd5JM+jI05xhfHhpUqBC8g7mSdOQmhbhvay3Mn4lFfKJh9iwfXeqzwmHNutlRmWMw8SOWNi+2SrKuwMFIlQAjWQcHReDzLBptQVMzMJtIns6GQPJJD7SIdR0=
Received: from SJ2PR11MB7648.namprd11.prod.outlook.com (2603:10b6:a03:4c3::17)
 by PH7PR11MB5817.namprd11.prod.outlook.com (2603:10b6:510:13a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.29; Fri, 12 May
 2023 07:57:47 +0000
Received: from SJ2PR11MB7648.namprd11.prod.outlook.com
 ([fe80::27bf:a69f:806f:67be]) by SJ2PR11MB7648.namprd11.prod.outlook.com
 ([fe80::27bf:a69f:806f:67be%2]) with mapi id 15.20.6363.033; Fri, 12 May 2023
 07:57:47 +0000
From: <Claudiu.Beznea@microchip.com>
To: <pranavi.somisetty@amd.com>, <Nicolas.Ferre@microchip.com>,
	<davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <richardcochran@gmail.com>, <linux@armlinux.org.uk>,
	<palmer@dabbelt.com>
CC: <git@amd.com>, <michal.simek@amd.com>, <harini.katakam@amd.com>,
	<radhey.shyam.pandey@amd.com>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH net-next v2 2/2] net: macb: Add support for partial store
 and forward
Thread-Topic: [PATCH net-next v2 2/2] net: macb: Add support for partial store
 and forward
Thread-Index: AQHZhKdwukvHvEIW70SEiVHkP3HnIg==
Date: Fri, 12 May 2023 07:57:46 +0000
Message-ID: <deadf131-063c-01d3-b33c-b5aac375d713@microchip.com>
References: <20230511071214.18611-1-pranavi.somisetty@amd.com>
 <20230511071214.18611-3-pranavi.somisetty@amd.com>
In-Reply-To: <20230511071214.18611-3-pranavi.somisetty@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB7648:EE_|PH7PR11MB5817:EE_
x-ms-office365-filtering-correlation-id: eda18171-be91-4f67-c1bd-08db52be9334
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nLwRag0ObD9lnio5BYG0lBZMA0nDRoglUiosvySiZw7NopbKH9YjnxU5/4alQVwlQR56YOyEvLYiMIgk99Sc/tECXmWnsvRYSxoa8S0wzI9EdsEpwF+Osrkx9FXn7eo78nbZlhYdGmarJZzojdvgmCkzaA9aVv0d9Aej4zvb3/ZvuqAQU5+b8ifiGCYFguaOuStDAa8LFqvwu9po8/OPFI0CRwuYD60HKeuToAo+N5CeNm3LTc5G2By8q3DT+11s1xpOlasN+6Rewj7Hn3PcHf4tw9vxoySyN21uUr59+5/e+EsOUw9LPaAWFVlqRipqW3slrjMv3ydxNRtfi4y5C1prVnEg9QthALUd77MJa69nSyiBEwSSqLBrGojkPqJx8QT6iYtUCj0RqiZ62i+ffDvPfu+v+W6Hnf36zNpAx0AvaMOUjp+HJlE81Z6hT97YqjHiCig3RdK7e/klFxuAYQMaDlLWiBbb9Q154bfOxde9Il+O883Zv96nljtbJWRR61031ce7S6r5L2f7RBeQgJT0uDTGRZlGgzB90oh9zVFHEFkjw956GfheDR9Z7c75stbPn1etFBYu1c4D+TXGvPIChI6TbUMIR47kl59MeB9f1N4FqY7fTs6HqjGXDfgTFf9fjqlAONTZOMpiw4nD4RqpptwaDkfhfNjQXt1kRSeOVbjV2EC5yZLsf23PKInz
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(376002)(346002)(39860400002)(366004)(451199021)(31696002)(122000001)(71200400001)(36756003)(6486002)(83380400001)(110136005)(53546011)(2616005)(86362001)(6506007)(186003)(26005)(76116006)(5660300002)(2906002)(38100700002)(54906003)(41300700001)(4326008)(66476007)(91956017)(478600001)(66946007)(6512007)(66556008)(316002)(64756008)(8676002)(8936002)(38070700005)(66446008)(31686004)(7416002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RzcvM1FPNllubURBU3ArUndvNmppNkRyYzRaR2p1ckM0cUlydlpHa1BJc1Ni?=
 =?utf-8?B?V1VURHlmbGpLajR5SmMwRHNzd2ZEQW8rMDE3dFNuOWt0VUdkTWpIUWxhU3Rk?=
 =?utf-8?B?VEt0THlDS0MycnZTa0Y5RWhvU0xneVdGcXdtbXBDNlZkRXhILy9qZHFWVDFD?=
 =?utf-8?B?OExsdVdJTDJOVDkzQWpPd3Fhc2NJcis4YUNXbXhrcFFNWmNQMlNlRnZ5Q1RU?=
 =?utf-8?B?ZUFDRm5jMERqRTV2WDhqY3B5YmIybFpnNzIzMzByUEJuMEd6anBJVzNUa3RG?=
 =?utf-8?B?N2FyOGJCM3FRR0RZZCsvNkdIRHFpOXpCMXl6N3BZSEw4WG5oclVvR1k3RGlx?=
 =?utf-8?B?bmFHZ0piVkpQNkUxbkhGZHlZZitLZ3lXZGg1cW9MbnNTNlZuZE1HaXRRUDlp?=
 =?utf-8?B?b2d1cVdYcEFmcmdmSFFYN3V2M2ZxNy9oMENMcEZnS0pQVGJ2cnVmeE5ldUVw?=
 =?utf-8?B?VHdFdUdjaDd1dm5GS2lUbGZHQnJOV1FlT2x4QkdDbi82ODVZdDNsS2NvZ3lO?=
 =?utf-8?B?SzlLSzQ5djFuUWgva1czVXUzdXI5MktzaUFoUjhvWmYvemhrSGN6WCt3dWZT?=
 =?utf-8?B?NWxJK3dOTWRNZFFWNFZ4ODQreitUUHg0Z0J5RHEvZ1h4S29ySnZlQnZRaStK?=
 =?utf-8?B?c1J1Sy94NURpT2twcHZHMFNZYmdEWFIwUXVNUXBlallGNUZ5RUNOSUdrSkZl?=
 =?utf-8?B?eFJWVEZXQ3ppY0szZHZjaElCK0FKSHVOUUcveDlOU3gzemhLenF4UlRPNDUz?=
 =?utf-8?B?S01nSzRrSXFZRkxleXZWb01GUHpmaGtHeDNZQUtiL0d6TnZsNE81SFZ5MjRh?=
 =?utf-8?B?M2tvZDVzeHd6eUZ1M2FZdUphOVFFOHBPcitUeUMyODFybHh6b2lland1WTFl?=
 =?utf-8?B?eXdsMEd3NEwvd3p2OXVBeUtLa2t3THpRUmFnczBwZjBVQmMyNHpMZ1lZcXk5?=
 =?utf-8?B?ZytZdG1UQStNeTQ1S3YyUk9kdXAxQ0pDZm9oUE81TUJDaUdTNDdIZWVCY2lS?=
 =?utf-8?B?UWNsc0lIYXRtQ01SWjdWRnBBMzIxRWRZSDUvZFpNcE8zQlBTMFA4SVA4RjZW?=
 =?utf-8?B?S3J4ZXNMYnBOcVA4YW5Uc21iWVpHSGRSTlpSY2xCendNQ3lyYVU5MElkU3po?=
 =?utf-8?B?aWlvUWx6ZWpwNERSNWRyQ0diUXRUWkg4Qm9RckxWR2VEVXFxdUMyQ1d3OGp5?=
 =?utf-8?B?eXpWNm1ZMHZKMGJSWXl2U3NDUXhDYnphS1djNjdsRkoweUU5dzRLWjJhTnBC?=
 =?utf-8?B?bUdUd0xYUUs5U3F6NE1XNVBTV1UvZTNPem8zaG4yVkpYeGI2M0YzcnI1MnM0?=
 =?utf-8?B?dmlheEdrb2pUNjFjOXJKS0lmcUJBcGVJM0tUbHNMSFhsUlNzOG1EWGlsVUMz?=
 =?utf-8?B?dGs5ZWpxV3IrckxmVkQ0emRhMGVpamsrem9temZ1SVQ0VWI0czU0UW9ZUXk5?=
 =?utf-8?B?SS90YytYeEN5dmVaSnQ2WElnNURYUUVOS2tFaWszNVJwNmVSMHhQTnIwd2xM?=
 =?utf-8?B?eUN5YWxuTjNpSDg2dXloYTl6YXNqNEhITFJJN0liOXdqbkRPcm54cEk4WTlR?=
 =?utf-8?B?WXUveXlMRlJyMjRRckF6K281VkZkaHppTjBhWlQwbzE2UjdXMnE3bHJGcGJR?=
 =?utf-8?B?Y095UWJ4RmRyUXloZ3ZYb3VDM1ZCdlRKNit3ODdHRWhyQU1PbnFxSHZYQVor?=
 =?utf-8?B?aDRPZGlRbzBlcWpLamV6czRNNHpqcUw5elhtbXp3S1N2RTBMQ3E3M00wb3FD?=
 =?utf-8?B?YWRMTERJSzBOc3ZCeUk5ZWNmTW9jVHl0WnNIVU5DOGQzOWYvMUlRWG1qN2Jx?=
 =?utf-8?B?cGxOay9XbGNxaTJ3blYwdzRmT0o1K3ZGMlg1OWs5dWZOSGt1YU1tQ2VUdFVK?=
 =?utf-8?B?WkRzMEVGOGthdEFnQ0M3bm9NNXlNdHo5OUMwMlcyd3NmbE01OFVsWUgyQ01S?=
 =?utf-8?B?dGxiL1dLbUFoWHp6c2RWWXlpZGNVVHFyTlJyb2V3Z1p2K0VHdmlZOHpBTTVT?=
 =?utf-8?B?ZUloM1FueDVtRk5SUXZ1Uk8xbzBOT1AzeEFhdGlkOW10Wkh0OTVYM2VYTzRE?=
 =?utf-8?B?cWtJUlBaU3NHWkVhMzU5dUtlY3hPYWpVWHUzYU9kZVY5TlNGYkF6YnQwaXhK?=
 =?utf-8?Q?ShR6LtBLQNsXxmR3336bSaSYJ?=
Content-ID: <46A1B3D611FCAB48A926ED8A50F27565@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eda18171-be91-4f67-c1bd-08db52be9334
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2023 07:57:46.9591
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BiUQYZ3hvXZEDDRvoPD0Zl4NwV9MgOA5lYRn6cx+0NDJq9W1dthTrr4fylI+CJHYTYBVS9AiiU/Sxaxpf+euX63haxBNRl762FSLdeEWfuM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5817
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_005805_687108_038259F5 
X-CRM114-Status: GOOD (  22.85  )
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

On 11.05.2023 10:12, Pranavi Somisetty wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> When the receive partial store and forward mode is activated, the
> receiver will only begin to forward the packet to the external AHB
> or AXI slave when enough packet data is stored in the packet buffer.
> The amount of packet data required to activate the forwarding process
> is programmable via watermark registers which are located at the same
> address as the partial store and forward enable bits. Adding support to
> read this rx-watermark value from device-tree, to program the watermark
> registers and enable partial store and forwarding.
> 
> Signed-off-by: Maulik Jodhani <maulik.jodhani@xilinx.com>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> Signed-off-by: Harini Katakam <harini.katakam@xilinx.com>
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
> Signed-off-by: Pranavi Somisetty <pranavi.somisetty@amd.com>
> ---
> Changes v2:
> 
> 1. Removed all the changes related to validating FCS when Rx checksum offload is disabled.
> 2. Instead of using a platform dependent number (0xFFF) for the reset value of rx watermark,
> derive it from designcfg_debug2 register.
> 3. Added a check to see if partial s/f is supported, by reading the
> designcfg_debug6 register.
> ---
>  drivers/net/ethernet/cadence/macb.h      | 14 +++++++
>  drivers/net/ethernet/cadence/macb_main.c | 49 +++++++++++++++++++++++-
>  2 files changed, 61 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/cadence/macb.h b/drivers/net/ethernet/cadence/macb.h
> index 14dfec4db8f9..46833662094d 100644
> --- a/drivers/net/ethernet/cadence/macb.h
> +++ b/drivers/net/ethernet/cadence/macb.h
> @@ -82,6 +82,7 @@
>  #define GEM_NCFGR              0x0004 /* Network Config */
>  #define GEM_USRIO              0x000c /* User IO */
>  #define GEM_DMACFG             0x0010 /* DMA Configuration */
> +#define GEM_PBUFRXCUT          0x0044 /* RX Partial Store and Forward */
>  #define GEM_JML                        0x0048 /* Jumbo Max Length */
>  #define GEM_HS_MAC_CONFIG      0x0050 /* GEM high speed config */
>  #define GEM_HRB                        0x0080 /* Hash Bottom */
> @@ -343,6 +344,11 @@
>  #define GEM_ADDR64_SIZE                1
> 
> 
> +/* Bitfields in PBUFRXCUT */
> +#define GEM_WTRMRK_OFFSET      0 /* Watermark value offset */
> +#define GEM_ENCUTTHRU_OFFSET   31 /* Enable RX partial store and forward */
> +#define GEM_ENCUTTHRU_SIZE     1
> +
>  /* Bitfields in NSR */
>  #define MACB_NSR_LINK_OFFSET   0 /* pcs_link_state */
>  #define MACB_NSR_LINK_SIZE     1
> @@ -509,6 +515,8 @@
>  #define GEM_TX_PKT_BUFF_OFFSET                 21
>  #define GEM_TX_PKT_BUFF_SIZE                   1
> 
> +#define GEM_RX_PBUF_ADDR_OFFSET                        22
> +#define GEM_RX_PBUF_ADDR_SIZE                  4
> 
>  /* Bitfields in DCFG5. */
>  #define GEM_TSU_OFFSET                         8
> @@ -517,6 +525,8 @@
>  /* Bitfields in DCFG6. */
>  #define GEM_PBUF_LSO_OFFSET                    27
>  #define GEM_PBUF_LSO_SIZE                      1
> +#define GEM_PBUF_CUTTHRU_OFFSET                        26
> +#define GEM_PBUF_CUTTHRU_SIZE                  1
>  #define GEM_DAW64_OFFSET                       23
>  #define GEM_DAW64_SIZE                         1
> 
> @@ -718,6 +728,7 @@
>  #define MACB_CAPS_NEEDS_RSTONUBR               0x00000100
>  #define MACB_CAPS_MIIONRGMII                   0x00000200
>  #define MACB_CAPS_NEED_TSUCLK                  0x00000400
> +#define MACB_CAPS_PARTIAL_STORE_FORWARD                0x00000800
>  #define MACB_CAPS_PCS                          0x01000000
>  #define MACB_CAPS_HIGH_SPEED                   0x02000000
>  #define MACB_CAPS_CLK_HW_CHG                   0x04000000
> @@ -1283,6 +1294,9 @@ struct macb {
> 
>         u32                     wol;
> 
> +       /* holds value of rx watermark value for pbuf_rxcutthru register */
> +       u16                     rx_watermark;
> +
>         struct macb_ptp_info    *ptp_info;      /* macb-ptp interface */
> 
>         struct phy              *sgmii_phy;     /* for ZynqMP SGMII mode */
> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
> index 41964fd02452..07b9964e7aa3 100644
> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c
> @@ -2600,6 +2600,7 @@ static void macb_init_rings(struct macb *bp)
>  static void macb_reset_hw(struct macb *bp)
>  {
>         struct macb_queue *queue;
> +       u16 watermark_reset_value;
>         unsigned int q;
>         u32 ctrl = macb_readl(bp, NCR);
> 
> @@ -2617,6 +2618,12 @@ static void macb_reset_hw(struct macb *bp)
>         macb_writel(bp, TSR, -1);
>         macb_writel(bp, RSR, -1);
> 
> +       /* Disable RX partial store and forward and reset watermark value */
> +       if (bp->caps & MACB_CAPS_PARTIAL_STORE_FORWARD) {
> +               watermark_reset_value = (1 << (GEM_BFEXT(RX_PBUF_ADDR, gem_readl(bp, DCFG2)))) - 1;

Is this block needed? Maybe all you need here is just to disable the rx
partial store and forward?

> +               gem_writel(bp, PBUFRXCUT, watermark_reset_value);
> +       }
> +
>         /* Disable all interrupts */
>         for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue) {
>                 queue_writel(queue, IDR, -1);
> @@ -2743,6 +2750,8 @@ static void macb_configure_dma(struct macb *bp)
> 
>  static void macb_init_hw(struct macb *bp)
>  {
> +       u16 watermark_reset_value;
> +       u16 watermark_value;
>         u32 config;
> 
>         macb_reset_hw(bp);
> @@ -2770,6 +2779,14 @@ static void macb_init_hw(struct macb *bp)
>                 bp->rx_frm_len_mask = MACB_RX_JFRMLEN_MASK;
> 
>         macb_configure_dma(bp);
> +
> +       /* Enable RX partial store and forward and set watermark */
> +       if ((bp->caps & MACB_CAPS_PARTIAL_STORE_FORWARD) && bp->rx_watermark) {
> +               watermark_reset_value = (1 << (GEM_BFEXT(RX_PBUF_ADDR, gem_readl(bp, DCFG2)))) - 1;
> +               watermark_value = bp->rx_watermark & watermark_reset_value;

You should validate the value in bp->rx_watermark in probe and here just
update the PBUFRXCUT with that value.

> +               gem_writel(bp, PBUFRXCUT,
> +                          (watermark_value | GEM_BIT(ENCUTTHRU)));
> +       }
>  }
> 
>  /* The hash address register is 64 bits long and takes up two
> @@ -3861,11 +3878,37 @@ static const struct net_device_ops macb_netdev_ops = {
>  static void macb_configure_caps(struct macb *bp,
>                                 const struct macb_config *dt_conf)
>  {
> +       u32 wtrmrk_rst_val;
> +       int retval;
>         u32 dcfg;
> 
>         if (dt_conf)
>                 bp->caps = dt_conf->caps;
> 
> +       /* By default we set to partial store and forward mode for zynqmp.
> +        * Disable if not set in devicetree.
> +        */
> +       if (GEM_BFEXT(PBUF_CUTTHRU, gem_readl(bp, DCFG6))) {
> +               if (bp->caps & MACB_CAPS_PARTIAL_STORE_FORWARD) {

You can get rid of MACB_CAPS_PARTIAL_STORE_FORWARD and consider it enabled
or not based on device tree rx-watermark dt property. Thus you can have
here only:
	if (GEM_BFEXT(PBUF_CUTTHRU, gem_readl(bp, DCFG6)))

and based on the validity of data passed to "rx-watermark" the
bp->rx_watermark will be zero or not. You can check bp->rx_watermark all
over the code to check if rx partial store and fw is enabled.

> +                       retval = of_property_read_u16(bp->pdev->dev.of_node,
> +                                                     "rx-watermark",
> +                                                     &bp->rx_watermark);

E.g. SAMA7G5 has PBUFRXCUT.watermark on 10 bits. Is it the same on Xynqmp?
For compatibility with future implementations and stable DT interface it
would be better to just keep rx-watermark DT property on 32 bits.

> +
> +                       /* Disable partial store and forward in case of error or
> +                        * invalid watermark value
> +                        */
> +                       wtrmrk_rst_val = (1 << (GEM_BFEXT(RX_PBUF_ADDR, gem_readl(bp, DCFG2)))) - 1;
> +                       if (retval || bp->rx_watermark > wtrmrk_rst_val || !bp->rx_watermark) {
> +                               if (bp->rx_watermark > wtrmrk_rst_val) {
> +                                       dev_info(&bp->pdev->dev, "Invalid watermark value\n");
> +                                       bp->rx_watermark = 0;

Checking this in the code should be enough. There is no need to introduce a
new capability.

> +                               }
> +                               dev_info(&bp->pdev->dev, "Not enabling partial store and forward\n");
> +                               bp->caps &= ~MACB_CAPS_PARTIAL_STORE_FORWARD;
> +                       }
> +               }
> +       }
> +
>         if (hw_is_gem(bp->regs, bp->native_io)) {
>                 bp->caps |= MACB_CAPS_MACB_IS_GEM;
> 
> @@ -4813,7 +4856,8 @@ static const struct macb_config np4_config = {
>  static const struct macb_config zynqmp_config = {
>         .caps = MACB_CAPS_GIGABIT_MODE_AVAILABLE |
>                 MACB_CAPS_JUMBO |
> -               MACB_CAPS_GEM_HAS_PTP | MACB_CAPS_BD_RD_PREFETCH,
> +               MACB_CAPS_GEM_HAS_PTP | MACB_CAPS_BD_RD_PREFETCH |
> +               MACB_CAPS_PARTIAL_STORE_FORWARD,
>         .dma_burst_length = 16,
>         .clk_init = macb_clk_init,
>         .init = init_reset_optional,
> @@ -4861,7 +4905,8 @@ static const struct macb_config sama7g5_emac_config = {
> 
>  static const struct macb_config versal_config = {
>         .caps = MACB_CAPS_GIGABIT_MODE_AVAILABLE | MACB_CAPS_JUMBO |
> -               MACB_CAPS_GEM_HAS_PTP | MACB_CAPS_BD_RD_PREFETCH | MACB_CAPS_NEED_TSUCLK,
> +               MACB_CAPS_GEM_HAS_PTP | MACB_CAPS_BD_RD_PREFETCH |
> +               MACB_CAPS_NEED_TSUCLK | MACB_CAPS_PARTIAL_STORE_FORWARD,
>         .dma_burst_length = 16,
>         .clk_init = macb_clk_init,
>         .init = init_reset_optional,
> --
> 2.36.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
