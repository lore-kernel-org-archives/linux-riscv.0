Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC58AC25B0E
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Aug 2022 15:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HooxQnSp01lplSpZ3Pb1c24z4k+pRXzMOmf2CYIiv7Q=; b=XEKobJEEuclCmK
	LuhOcelk7nuMTLNlZRIIS16zp+UBlh9a3H8pYv0zskjs/rTzJEfPavkNdFZENsx8/cI5mpXukBWw7
	st6fwAZPkFGBJhCvxrinjmYgVv8Vs/jAj3mmCM43szweLF6/xZEV5FfAiiPohFqpv0QuHWafECTBE
	0Qfnm1P7V6CUVrTazxbFEVC44sqhRkod8IahQwd7gw6dqcPA5joiQvp0vQv1pNlXxkGKhJWOTSB9r
	xGwylAPny+8KPD7vtMqDwcWhVE2RWy33tOQJ4O5L3/F5fbjUqBbBVLFIdudUDEcmgzukkd0Q1tffB
	VyKW12EhIK/rZUEeAy/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNylx-0048mz-R4; Tue, 16 Aug 2022 15:46:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNylt-0048hr-Sb
	for linux-riscv@lists.infradead.org; Tue, 16 Aug 2022 15:46:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660664785; x=1692200785;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=aq5XNlPDvyS2yAQDbXiaUYheNb4wuTz//E/6msSECZs=;
  b=d/gcgmnhi4ctxooofq8y37wpoxK9tuuRzRkvh6JseF4YMKf9iyt3HQWB
   HbXV8K26a3VCYAb8rvwzErHsfL+3rjnn4S4Na7dX82gXy8rptwcUI2i8h
   UfXZ9ZJtAhrYQmH9sOp0qh0MRHemCqFzBtIfB3CBNB88fSPFUyb3TPqxs
   mVpXj5LkU9QgwQuSGTyrFVA2AeakUlaBildFwhja1BVZXjzzQEQpulAO/
   W7G9wuznnicwzlhRWyA+XHR7wQYc2vnpnUpbGgmlsw1Wrq4DJ0Hs/X/Z3
   b0LY33zQExxHZIjkoQR6HOhlQASNa6Eq3WSz7NgJ1COuaPSDbA6biGJFa
   g==;
X-IronPort-AV: E=Sophos;i="5.93,241,1654585200"; 
   d="scan'208";a="176617408"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Aug 2022 08:46:22 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 16 Aug 2022 08:46:22 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Tue, 16 Aug 2022 08:46:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k/9Ps5pM0y28ff0QhDb9C1J1grikfEhpOkQtE9wmtwXrWCG3gQnKvBY9ukZSkICPJIhrChEvR/IkaksOu2teps7V3S+yDg6sfPpWZtKFBCMhl9KFhDruqOPeqwvN3ov0csbNTZ5SJWA64gxtwxymD43muQfjWJsQpryEnwXTv0dPC4dvea/0m4Hyx1zcsyxR9AlZdo+VpKSoPYBxyc50e6+woYvTnDG5d36ysCHqgsg2sryYFO2KoD5sQigD9S7zzpHXCF9zaZzT23Yr5XDGy80UA4qODGgiwhVSFevzbqhfc8Lnm1ZFAO0SprwCRS1da01mLBEYQmyIIIrVbJhf/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aq5XNlPDvyS2yAQDbXiaUYheNb4wuTz//E/6msSECZs=;
 b=NGuls8hX8PhUoq+mmc5udhBGCA6fod2AvRUCjibsYaWrnGdH9g+t+XBOx+dLDytIA4eGAdoyGfeZBBJD6V4ct1LLYkIu4DAbY+cdfY30OM6wWUbJHH6d+pf1+VlZPTjzEXkrD9ZtpaRufb6lQc2oMinef9CJg71eaTbKF/wzmDFp/lcUNXC0nudb6JkqAB4NMAkTnWPl5tuHMI2QNVDM/hJDjbgR/6hMzj8LGdSuoxRn1gRANhR6S1h4BxRN06xPbo4s8P+Qqpjxx+2j8EHOO8IpjPnuhQ6MGqQc26gzd2N1BWpTtwajWxwq7J/EWsjp/1R33ZD5k91RPuHH2RZd9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aq5XNlPDvyS2yAQDbXiaUYheNb4wuTz//E/6msSECZs=;
 b=iJp40QzbNKxXPuKQ6v96dKR09I8WWk/MT0Zhmd133vLrlvr6pF3mWKHtY1+8KHlRHAogMYF5GnqiREFTgD1aPRGFB2GYUPRcov2TVURjtl+Q9AUqLbGXo5MuBiyHenuHKR8u3lN2rtgMywrPXVitOaWVtD+w/O8Sf5MUtFeJg08=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by IA1PR11MB6443.namprd11.prod.outlook.com (2603:10b6:208:3a8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.28; Tue, 16 Aug
 2022 15:46:19 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Tue, 16 Aug 2022
 15:46:19 +0000
From: <Conor.Dooley@microchip.com>
To: <daolu@rivosinc.com>, <re@w6rz.net>
CC: <linux-riscv@lists.infradead.org>, <palmer@rivosinc.com>,
	<heiko@sntech.de>
Subject: Re: Regression on Linux 6.0-rc1
Thread-Topic: Regression on Linux 6.0-rc1
Thread-Index: AQHYsW/X3U1UG9LMLEeiiZ5TFs5SU62xnkwAgAANegA=
Date: Tue, 16 Aug 2022 15:46:19 +0000
Message-ID: <8ab1d9a8-c7e0-8246-c107-1fc0d9e7734f@microchip.com>
References: <728ecbd5-975a-168e-efab-3c0030be21d5@w6rz.net>
 <CAKh7v-QYC7rhc3043OL6EqdjFV7uGivU7REjnTi6JsYQAnnc+A@mail.gmail.com>
In-Reply-To: <CAKh7v-QYC7rhc3043OL6EqdjFV7uGivU7REjnTi6JsYQAnnc+A@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2168059d-f958-4f3d-c3ea-08da7f9e765b
x-ms-traffictypediagnostic: IA1PR11MB6443:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pVi25161FO94/LMcbf+rYRJZfRQaZXosMHhEev1sZrfBQyUJB4fLjzn0X2mImgZzLTICacr+MzU7o0786nln7ODLzjhjSsXWXeXJghsDiI5llOIxC2rkyjCh2oGxkzkkq8nZV8AZNJkadnoi6YY0l2xFw2SNzU5I/oL3rO8akrdN7dkbiYAZz4dOBL49o1+pfvb5stu9IoweCK6ymQm4/cV9LR+6nRnCIk37moSmwX6T5MNt7BYTvriIYLJo+R7yWms8g/QhqJ4SSzpm0gN+tcc4PlVb0pM40jNb6KmNM4iZ3K6dY2QoDsSWQK3YJFJM2+xBQb9Ynrp/SjKAKFu87D3iq3onB0JRFXl53cOU0FV27kmtFzhsrGrkuQh7fMXN+PlLScKFTuixQ0X9FEC1Osrabu5Ie1jK5O5lzTlUbEcSeOGNOnUsY6fD7OUlasQe/9h0BVe0IIeIPZgmi37NlabU3i2ptip6KvEEoiGBoW0Ml8TP2Q6JVWiZV79bnCTALCJ+aaZtHFqka2A180eBZJB/g/Orb3bAXE307XcrZeV5TI4+PHvVyVXjLWzMMNOCLoXgAdpRUA8PTh1mQX0G9mufW5OC9IXVHv+GfyBSDmuU1ASYul1kggI7lCocNAGoNGIAxXT2/IZ42G0fmtsTcFdBRAQqQGG65PfMl3APjqRv1hpc72k/6RmygC6OyjHKDSf/rDu6+sRzy+dN0tVPjhhZrREuc9Kf5X3HxuhEbgyMYab9rFiRXRtqJNkshz0n9s0085jgUNn5oVB3pQ5XNavJXOQL15VJDGVC5BFWEOzSBEN2AGtJAVKjGFbNTtUPJNIpkdfbVXvysgVtpQvUjSD7wl6LSiTDXFyDYsycQaQKfOSyzdKM9AWvjjKUglb+z5WhMt3cuisAkVvd+y10L9mcYoi8bdb3Whzw3E6SqRk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(346002)(366004)(376002)(136003)(39860400002)(45080400002)(38070700005)(122000001)(38100700002)(36756003)(110136005)(31686004)(54906003)(71200400001)(316002)(2906002)(53546011)(41300700001)(8936002)(91956017)(6506007)(5660300002)(8676002)(26005)(76116006)(66446008)(66556008)(64756008)(4326008)(66476007)(66946007)(6512007)(966005)(2616005)(6486002)(31696002)(478600001)(186003)(86362001)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d3JXOTg5YjVFWUlQalFlRi9uSkoyUk1DSlp6b0o3OStWOERNRVlaQ09VTUZC?=
 =?utf-8?B?ck1zajlTVlBpd2RDOTRsOHlFWDRSNDZ4NVIyT09MZlRjT0pXSDQ4YWFZUktu?=
 =?utf-8?B?ZUxBWVJhUUNPejI0VThWMEFCUjVRVkhKTHJ6bXNIVTFRbVhscWNiSmptSDBk?=
 =?utf-8?B?dEtnZ1ZDeU5aODY3S2d3Q2F2cUVBQkJXWFJFWmdqdlF4aUJPa1RyLyt4ZXZK?=
 =?utf-8?B?RmZLT1ZnblE5VFNFOW91T1dxNUJKcENYMmM1R0RjL09YdTNxRllNYmpsZ0V1?=
 =?utf-8?B?bXdhWUxCanJUdndZUGs3YnlNWW9BTDY5SC82M2ZTNCsrUzR1REVhT0xFWlFD?=
 =?utf-8?B?YWQybFRxVmk1V1VCZUR3M2g1aFB4ampYWjZLRi85MEF0ckRCSmhLcytQR1JS?=
 =?utf-8?B?eDg1ak9uYlAzci9CV3ovdGd0RTBQcWdIUEhseHRybmU4cmh0VS9Lc3BjZWcw?=
 =?utf-8?B?RVBmVlFHcDh5aUxnaFdDbzV3QzQ1M3VNNFhycVZla0ZDZGJqdWkvNmhweW9r?=
 =?utf-8?B?V0NIR21kTldyYm9tdnF4Q2JjQ3BSL043S3VUV2ttZStxcXVOZERNVk8yR3Bn?=
 =?utf-8?B?bG9mWThhQTJPN0Uvd3d3SkZBVWNyKzhIUHZiNEdPZzI1dHJVV08wWkRmSytB?=
 =?utf-8?B?OVRqc2RoTytrczZZL0JTYUVzSkZrUlRvcW5memFwQ3E4Nk5ETitUVTJhY2hG?=
 =?utf-8?B?dTU4K3dTYUU4bm9DTG5OdG8wcHh0STFWU0dPb01iUDFPQ3NIUnBnWiszVEl6?=
 =?utf-8?B?UmkwU09KMHd1cUxRaFNaRWVnT1oyR3NuREVraUZ2WHFCSk15ZGl3ZFJBSGhH?=
 =?utf-8?B?dGFRbXlEZDhTaEozL0dqMVFXaWpqRjhUSlVSV0g0Yy9KN2NIazluRlRxK0x0?=
 =?utf-8?B?SzlCWGxKZit5VjF0YjV1OFc3eHFMZDYraGtNV1RtWkxzQTVKSXVSYWM2R09C?=
 =?utf-8?B?T0g0RHlZNHJIMEc2SEszOE1OQzlxNVQ4SW1ZcDNSbTE5THZPcnp5VW40SXpn?=
 =?utf-8?B?aEU4WEtkbC9ucGtHN1o1TFplVnROSDM2YklrNWFoUHBrOFd5cDNlOG5NMWk5?=
 =?utf-8?B?RVQ3RmlLSzNrdXdtS09nYlBKQUpVcVVJYy9vblJTV1VadlBvL2xkZm9KUkg2?=
 =?utf-8?B?U0ZacU91Nk54MGM0Mk1zcnhlUHRPYmpGRHdsTzFxck9UcktIbWFiS0hQN0ZI?=
 =?utf-8?B?RjZpVWN6QjRmTFdrR0I4b3kvRVZDVVNQaHZZb1Q5YW5DQ0JLN0xmYkZmd3Vi?=
 =?utf-8?B?WTFhR0J5aE1uUldoWmR5eXBCdDRXWVd6aVE0TUdmYXUvb2lFY2p4bXh3Rkw5?=
 =?utf-8?B?eDdnVlhQeGdwalczd2pza3hHMmtZcnBYOTVsdS9hbENtR3djSXV0Y3hjZTBi?=
 =?utf-8?B?ZElGRXdrbnRNenMxYkhEN2JEcTBQaTRoRm5TNDBJTTNHc2gyRWZiWUNFR2dj?=
 =?utf-8?B?UGo2NHBtNzBraXp6cXJpbGpUZFNpQWJpbjNETGxpdlQzTGE3eFF4ZjY4dExp?=
 =?utf-8?B?aEgzcVdDVTlZOE9BTFdwS1dCREMrTllWUm13QVlHaVU2d1k2bk9ZYjUwL2JP?=
 =?utf-8?B?NStDTE9hSmQ1N0Q2QzI4TGlTQTlhdkRHQStibk9ZNWd5UWtUUTVzNDNJcG9H?=
 =?utf-8?B?RmpLcW9Vb2JtclpFeVViTnFHeU5OdHNhVTlHOHZiMm9SZnpBT3JhdTJWVkZV?=
 =?utf-8?B?WTBxa2pmQ1NNZDY2V2dKTEp1RW91L3h4OFIzZjJzbU05SE5pNm9wMEZwSUxy?=
 =?utf-8?B?amlBL1kxaUJBMTNMSTBnVE53a3JLVVNuMC9jZWVRd1p1TnRWYVFtdFlFUk1u?=
 =?utf-8?B?ZEE1Q3ZTWlBTWnd2S2hBV0FNdThtZ3BrTUFGZm9ndjVHazg4YW5JVmVQbjlQ?=
 =?utf-8?B?RjJDUkdCaVIzVDIvTFFoUUc1NjdCUnpWc1pEMG9WVHdpaUJPdnZna08wNVVo?=
 =?utf-8?B?cU5CZFA3S1JXWnlRektGUWJjaGt3Szg2YmJGSU9ZN1BtbFNYWU5WaktCWUxS?=
 =?utf-8?B?ZHpqMW80UmhPdnpSRnM2N0FrVGJGL1RjQnFvYVIrMnBqWFlwd1BCZmNQbnpa?=
 =?utf-8?B?OU9tWnc4REF1NFJtNUNUUmlyNW11NHNKUzdxWVdMR2dxYm4yWjQwMWhFclZO?=
 =?utf-8?Q?KaguFBEryaf9CFJsWJFq2AGaR?=
Content-ID: <5492880ABA4F6D4BA6A37BDD5425DBEC@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2168059d-f958-4f3d-c3ea-08da7f9e765b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2022 15:46:19.3007
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 74t4OITAv04iGTsAF8UZzVp0jBbQ6sh0aLwMTOtU1URbiaILmSAyXQ2RJmWo0+N64whSAfpyIf+zFIICLgopGEonPZX0kxxNI1t7v1+kv3M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6443
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_084626_222476_67B862D2 
X-CRM114-Status: GOOD (  12.24  )
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

On 16/08/2022 15:58, Dao Lu wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> I will take a look at it, sorry about that.
> 
> Thanks,
> Dao
> 
> On Tue, Aug 16, 2022 at 5:58 AM Ron Economos <re@w6rz.net> wrote:
>>
>> The following Oops occurs on Linux 6.0-rc1 on the HiFive Unmatched. This
>> is with gcc 11.2.0 and binutils 2.38 (from
>> https://github.com/riscv-collab/riscv-gnu-toolchain).
>>
>> Begin: Loading essential drivers ... [   14.774748] Unable to handle
>> kernel paging request at virtual address ffffffff813cdc90
>> [   14.781976] Oops [#1]
>> [   14.784163] Modules linked in: raid6_pq(+) libcrc32c raid1 raid0
>> multipath linear da9063_regulator
>> [   14.800763] CPU: 1 PID: 248 Comm: modprobe Not tainted 6.0.0-rc1 #1
>> [   14.806747] Hardware name: SiFive HiFive Unmatched A00 (DT)
>> [   14.812307] epc : jump_label_module_notify+0x1bc/0x270
>> [   14.817430]  ra : jump_label_module_notify+0x19a/0x270
>> [   14.822555] epc : ffffffff801b804c ra : ffffffff801b802a sp :
>> ffffffc80424bc0
>> [   14.829766]  gp : ffffffff81a2d7b8 tp : ffffffd895ae1980 t0 :
>> ffffffd88067e20
>> [   14.836975]  t1 : 6f1d98585898183f t2 : ffffffdbfed19e58 s0 :
>> ffffffc80424bc0
>> [   14.844185]  s1 : ffffffff813cdc88 a0 : 0000000000000000 a1 :
>> 000000000000000
>> [   14.851394]  a2 : 0000000000000000 a3 : ffffffff01c77000 a4 :
>> 000000000000000
>> [   14.858602]  a5 : 0000000000000000 a6 : 0000000000ff0000 a7 :
>> 000000000000021
>> [   14.865812]  s2 : ffffffff01c73000 s3 : ffffffff01c740c0 s4 :
>> ffffffd88067e80
>> [   14.873021]  s5 : ffffffff01c73010 s6 : 0000000000000dc0 s7 :
>> ffffffff813cdf0
>> [   14.880230]  s8 : ffffffd88067e282 s9 : ffffffff01c73008 s10:
>> 000000000000002
>> [   14.887439]  s11: ffffffc80424bd50 t3 : e26cb9592a0e8a69 t4 :
>> 000000800000000
>> [   14.894649]  t5 : 000000ff00000000 t6 : ffffffd8819ac4a0
>> [   14.899945] status: 0000000200000120 badaddr: ffffffff813cdc90 cause:
>> 000000f
>> [   14.907853] [<ffffffff8004055a>]
>> blocking_notifier_call_chain_robust+0x72/0x8
>> [   14.915061] [<ffffffff800a1dfc>] load_module+0x17bc/0x1e98
>> [   14.920531] [<ffffffff800a2718>] __do_sys_finit_module+0x98/0x100
>> [   14.926611] [<ffffffff800a27a4>] sys_finit_module+0x24/0x30
>> [   14.932170] [<ffffffff80003ca6>] ret_from_syscall+0x0/0x2
>> [   14.937680] ---[ end trace 0000000000000000 ]---
>> Segmentation fault

FWIW I got one of these while trying out the d1 patchset yesterday :)

[    5.856640] Unable to handle kernel paging request at virtual address ffffffff80dd4cb0
[    5.865027] Oops [#1]
[    5.867420] Modules linked in: drm(+) i2c_core drm_panel_orientation_quirks backlight
[    5.875649] CPU: 0 PID: 86 Comm: modprobe Not tainted 6.0.0-rc1-00030-g9c1ba73cde81-dirty #1
[    5.884491] Hardware name: Allwinner D1 Nezha (DT)
[    5.889505] epc : jump_label_module_notify+0x19e/0x230
[    5.894915]  ra : jump_label_module_notify+0x172/0x230
[    5.900298] epc : ffffffff80107182 ra : ffffffff80107156 sp : ffffffc8041f3c10
[    5.907872]  gp : ffffffff812f7ad0 tp : ffffffd80191c500 t0 : ffffffd803561bc0
[    5.915444]  t1 : 0000000000000000 t2 : 00000000013b3e62 s0 : ffffffc8041f3c70
[    5.923025]  s1 : ffffffff80dd4ca8 a0 : 0000000000000000 a1 : 0000000000000000
[    5.930614]  a2 : 0000000000000000 a3 : ffffffff01483000 a4 : 0000000000000000
[    5.938178]  a5 : 0000000000000000 a6 : ffffffff80106882 a7 : ffffffff80106a6e
[    5.945759]  s2 : ffffffff013d3000 s3 : ffffffff013d55c0 s4 : ffffffd803561b40
[    5.953340]  s5 : ffffffff013d3010 s6 : 0000000000000dc0 s7 : ffffffff80dd4f90
[    5.960930]  s8 : ffffffd803561b82 s9 : ffffffff013d3008 s10: ffffffff013d55c8
[    5.968511]  s11: ffffffc8041f3d50 t3 : 0000000000000001 t4 : fefefefefefefeff
[    5.976093]  t5 : 0000000000000001 t6 : 0000000000040000
[    5.981662] status: 0000000200000120 badaddr: ffffffff80dd4cb0 cause: 000000000000000f
[    5.989954] [<ffffffff8002c96c>] blocking_notifier_call_chain_robust+0x5a/0xc2
[    5.997533] [<ffffffff80073f9a>] load_module+0x10fc/0x17b6
[    6.003299] [<ffffffff80074824>] __do_sys_finit_module+0x90/0xc8
[    6.009621] [<ffffffff80074880>] sys_finit_module+0x10/0x18
[    6.015466] [<ffffffff8000330a>] ret_from_syscall+0x0/0x2
[    6.021486] ---[ end trace 0000000000000000 ]---
[   15.757304] ------------[ cut here ]------------

I don't see it on any of my PolarFire SoC configs though, just I am
just not loading any modules that trigger it..
Thanks,
Conor.

>>
>> Manually bisected to this commit:
>>
>> arch/riscv: add Zihintpause support
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8eb060e10185cfc97ef0200d197ec246ba0f9f8c
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
