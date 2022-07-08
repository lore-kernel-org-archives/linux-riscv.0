Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1259C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Jul 2022 14:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VIQoL+QaAaTvEr9GQSxazb3ll16L6+BTCze7cnMp5vs=; b=RBq4LtOFJC2opF
	gm0aK0w/cy8O47UBjYIDAV7wr3Nj5ii1Y2qN9A3xWLWGlqk8ayJRnyasFHxHGA0NDiqnvksgr64gz
	rN81C9Hv42xqQRBTjvcU20P/ykmaRKknxurBMR3H6Yv/Qnp6fUKaoAtIsRw9pSZeRQ1ayYKqrhHgT
	7UkenCOJFp3fb3sdTZwf7Kii7xOwlZLletIC1NJ2rlUTzPodQLU1cIz7mShz6HbRnTGKj3uXxDGLL
	mDC6bKdbMJzthrSz1CoK6brOyDPQ/2wtgYGzCp4/TvDa6t3jSD5AyPzjK3szIYqwC6D5Ksbb6Xlhc
	IjcNTBp6lIlSx1MmG2HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9p4L-004AWd-8W; Fri, 08 Jul 2022 14:34:57 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9p4H-004AVE-Lb
	for linux-riscv@lists.infradead.org; Fri, 08 Jul 2022 14:34:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657290894; x=1688826894;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=nQ19Y/7GIfnksI8z0EoaQ61FZmDXQDIfSkGq9RKvCY8=;
  b=jdZmksgJCXeF9ebmawjLbElQ7vy9vAaFShP+B1GnIyTFlpFJNg5Q7Nys
   sEG5ctRIIXliK0fMLETIUXrqmjM9GXCANNu3kcWHpD4npmb5hRJG41Va3
   ZlAqj3+SUjPZDzoYkGfngrBQW2IfWCDRYUykSlWQFYT5UM5yD3EZ5KBWT
   v2xX4hnYLR6xmZQrbfzroNP/PDiKrUVFg43cIlKxKBUANjtA1lhmOvncz
   CTSs3+sEUmGfqYbdIJhaKKOnWKoWnHrBPWjGedeiQEw1eeZPNL5FUjGwN
   AYaXdFcLg6REbTwzm/WcQ+Lf9wMZiYca6jbPMDWbekJxwsl1fIRQ5caIC
   w==;
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; 
   d="scan'208";a="171341592"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Jul 2022 07:34:53 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 8 Jul 2022 07:34:51 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Fri, 8 Jul 2022 07:34:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PnF5JrJoevtXF8xG1/eCLG5S+PKsE/Gb2HczUW8NUYh9HtJW+fxzDbOwk/xHpf6DxKiwKDHiK5aHiAzqJkn2PhFDA2I0zaGOyneiPuML/35YWY1D1gHJWrGeXOfNpNFWJ0GCSRnWKVY1M+HosQQwu8wRgOOKt4lqhojpOZaD8i45ipOEDzpxwzzq3OtTX4IcJELgi/FaQEacYIQPHBMfO7kiacZdmeHAsAuIqe3nACEAa/02siNkzxxcI1Kcuho2mOnuitvLoU+23DkPsXbM1lB23QLOiIOe2i/yphHddlil8wwhTwgIHHpuHx3t/QP3JUnYZHzdcQXHuUw8ewDrHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nQ19Y/7GIfnksI8z0EoaQ61FZmDXQDIfSkGq9RKvCY8=;
 b=iw/10wiH/TR0N7ZjIwiy344Gox4gl+NYQrTExmhGA85tvUWkHXHHYlFk5CxBPlAvTIzHCZq69+989S8LRbzMFJOiiJ0M30J+Slowzqy14BQY/dIhWm9Q9wV1rpvYTgwe6F8xUN37iNSwIriQO1p92HNvDtG6zvN4gJvc4Fa13r0xZNDxDg91hw8+DeRWpyyKmGgUMBrlyKucCBKnj8rHa4ehxO71T5zw1+DYXw6RlZI5CaDjtjs6Ujnpjtfz7HbvyA46o3MOeADRA2Rt+zlyVxP8w3vLmBmExq3p/yweaJuPmuVBJwDR0lQI7Rc+458YWrrdyf56jll9d9nWgD42+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nQ19Y/7GIfnksI8z0EoaQ61FZmDXQDIfSkGq9RKvCY8=;
 b=jYSDTuWzmQR/yvbWT8A5R3irQGWeX8LlmkiElQArME+wdEFpH1/E6AYa9Uk88ifoqJoD0VlacX6ASWJYRsBX/W7H0QNZ/OwaeEGeKeiyidy8lxo8bqGyqZIsI8UO991Uk+vHHbbiP8Ee3JDfMnJbP5SCIKe3UTBD2/x6GWeVaLY=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BY5PR11MB4257.namprd11.prod.outlook.com (2603:10b6:a03:1ca::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Fri, 8 Jul
 2022 14:34:40 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8d4a:1681:398d:9714]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8d4a:1681:398d:9714%5]) with mapi id 15.20.5417.016; Fri, 8 Jul 2022
 14:34:40 +0000
From: <Conor.Dooley@microchip.com>
To: <thierry.reding@gmail.com>, <u.kleine-koenig@pengutronix.de>,
	<lee.jones@linaro.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>
CC: <Daire.McNamara@microchip.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v4 2/4] riscv: dts: fix the icicle's #pwm-cells
Thread-Topic: [PATCH v4 2/4] riscv: dts: fix the icicle's #pwm-cells
Thread-Index: AQHYktdC2ekXz7/EpkS3MZQSBPwBfq10ig4A
Date: Fri, 8 Jul 2022 14:34:40 +0000
Message-ID: <d611589b-a51f-6807-c3bf-5953e7ff2245@microchip.com>
References: <20220708142937.1120121-1-conor.dooley@microchip.com>
 <20220708142937.1120121-3-conor.dooley@microchip.com>
In-Reply-To: <20220708142937.1120121-3-conor.dooley@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 746b3024-2b43-45b9-6a6d-08da60eefe16
x-ms-traffictypediagnostic: BY5PR11MB4257:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H1kMy8xo/6QHdOPaM5bwjhQXsqNr993SDsWRWn2D9XMmUeZEBc/UwL603DsxNkpN4nuS3LMNulY2u2sKtiFI6ygvgHMFwjjDqrg3vCHtH5DVRWg13l4DMm8eaq2sw/nU06YXH9tPTANAJgR/twwXQdrva+zlaeB8TF24EqsE+7UQA4Bo4nKYJeruKTgSHk4ECzSduQt+TvUVrfdkO5MA6ApRKCpJo0vovD5R2i6ntFIchM2sRmscU59lFc0Mo5R34gi4aPw9OxtgDD4c40wlTM0cSaQqjdbO+GnoLZZszavL0YSYlqRGvZnug/IWTH4+zaKUjdAA5ZQpO4RPNT+3es9e1WvQn7wZrdl7Ppbf1IGjDYj19N+rTB9ylYaLB4tTP3mHiMJWjHQprxOwAloUjbIGlpvt3rbgMq2DTo8etxLTETmtcWsucfytQrrSoMSKTc0U84SLgrHdSAq2gqOlMrWA4ddecvhPQe1TSx6pZVAYeVEkQurLPakjZ1HtUhRd1KWcj+AylKUTA5G3Vza40fhqjM09SiOThzRh+mK1OP6saNB+EBihXt5T9cdOj/f6O4UyxIco3Xo03+cAupRYgTAoP6byFw3d+U196M7N6BYmvhOmt6wzAggA1FkjrsCFxlEc2GvUW4qELOl7pMi7zfNSrTd5NIfy7/yRTuKOFp57NYbHNwY65NMXZxWHWf4sSNeopWpj4IWmu7eJDLruVYrVoeId1o3ArUmwIoBmPl5xTY2vYaZquxdQWQtijrUmWCZTFmkjB9q2yXqBgBGWnJgsdXChGU3xATX+tGwGQ9vL3067zdG9KCfj90tVodrxuJO2e430vFwvTzgUkeuwmCJnQj/pc4Zmai0LlfJf7rB67d1yEs0feIA3x1WrAHmD
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(376002)(396003)(346002)(39860400002)(38100700002)(31696002)(86362001)(8936002)(38070700005)(41300700001)(6486002)(5660300002)(2906002)(122000001)(478600001)(316002)(36756003)(76116006)(4326008)(66556008)(91956017)(66476007)(66946007)(66446008)(64756008)(8676002)(186003)(6512007)(83380400001)(110136005)(6506007)(53546011)(71200400001)(26005)(2616005)(31686004)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dXdqRUJjZWxRRWtHR3FLMGh1b1B3dFVUL09KSUx5a2ZlbnZVNzZZdWdkWmpw?=
 =?utf-8?B?SHdxdGZjNXp5RW04aUVnbDdqVTdFSXExK2gvYUpNSm1xWkF1LzFuenZ3UFor?=
 =?utf-8?B?VWZlc1lORHdtaEpPWXZPZXF3RUhvVkp6T2psL2RZU3Z4WXcvbEtrQUZRaStI?=
 =?utf-8?B?YnBJRys0M2xYYnBkZ0xkSTRncTRqUFpyZlFMYjRiSnZyVXdnaTdXbnJzVnN0?=
 =?utf-8?B?YU1maHVPWVpiTEF0NE0zeVhsQjNXU2MzeFdpdzFtb2FDcy9vM3l4VmdDVkpX?=
 =?utf-8?B?YU5Gc01aNXRvMDFKdmFoUnZwWHFXMXk3YmpXc1Z2cDRVRmlTZmdEQ3dnaVVW?=
 =?utf-8?B?c1kyamsxeDFkczF5T0xSYnFUemoyS29RREVEanJsOXdLOWk3RlRlelg3cFpN?=
 =?utf-8?B?OFJROGpYSi9GczBtVWhFQnZ4WDNuWitBODRKYVpaYnlhZjRJUzVqWkV0T1Vp?=
 =?utf-8?B?L215UVgyWDVWL3BZOE45allWcW1JWXBVNlBSemZRVmk0NmZtK3lGcjlrZVRw?=
 =?utf-8?B?L0dFcW90UkxaUGVuWjJWeDlka3FhWE1lVFNTbmhhdng1Tm9yNkJpYVdpbFNL?=
 =?utf-8?B?ZHJmYmR5OWdBSWw1U1RmNlFTTFI4YVEzOVV4YUdPTWh2RG5SOS8rMFArQzBI?=
 =?utf-8?B?NXZiUmIrNEtMSnZ6TVVMdUUyemNrKzJURzI0ZWtHa0FGRHNJSkFXYjJyUWtP?=
 =?utf-8?B?c3pWVnpJV2lTQmRReWpRaU9hc1pvS0xxempmYmJUS2RVamU4VmROMkdIZ0xK?=
 =?utf-8?B?TjdhQ1YyL3ZSbFZrWUc5UDRFdE1vRk4zMmZsMFJMdktmeEd3cFBEVGtRSzNk?=
 =?utf-8?B?WVhUVWNKWFltbEJWQ09yODFpME5JblZWRlYyR3JBYUo1ZVZIcnVDNko1UEJy?=
 =?utf-8?B?THBOdHExN0l5WnA5MG56UHdPMEdnaVAvdmR5UHhEOXM4cFRzUnhqM25PUEla?=
 =?utf-8?B?cmRSRmxFUDcwQnVud2xKYnN0SytSZHQvTHB1YWtaYXZka0RkeERybTFqQzFi?=
 =?utf-8?B?UnFXMTk3LzdwSXJPWjlZU0JDWC9CTlpHZ2RQUzdYWjFUY0o3b2FGakVqa0pj?=
 =?utf-8?B?SkdtV1FyWEIxTWNSM3VOMldXOGdkM3V1S0xhYTQ3R2xzSzh5eFVBMkVGbjl3?=
 =?utf-8?B?TGtYSXZpeGkvTmdLd3ZqU0lwUk1BMjB4RXFNMW1UK3JpNFFvZkQrOStkR2wz?=
 =?utf-8?B?SlZBbG4ybHBhWlZDK2QxMzQ0bUJVeUorYm4wbklUc2w5UFRPK3F5Q2F3YWMr?=
 =?utf-8?B?aWMvNmFKVTlDTGZlS2pUVUMyYThERnJpMWhOUG5yUUJGaGpwd3NhK0toYlcv?=
 =?utf-8?B?WUo5eHdBZldXQkt4WXF0NUFjUEdvWFRwVm9ib1VweE90VkcrZXVtWXNJOW1P?=
 =?utf-8?B?cVErTmtSeEdzcFdpS2ovM0VFRjF4TTdXRXdqeGZwM3RFa0tnMmg2c2RUQ1FW?=
 =?utf-8?B?aVRDUjlLTUtPc2pIMVhKeVNGWkxDNEJudjJrVXFFcTd6TjJPZUxFTkxaNnJj?=
 =?utf-8?B?RTFVaXFwRWgvTmpaUjl1T2EvdmtBMGdadnlSWFVuWUNobmoyKzBiS2NSZ1Ay?=
 =?utf-8?B?U3JOMm1XeUNiUHhxam1GWUMzZ0lyQWxsMENoanhmTzV0aVNiaXpvWmxUK1Rt?=
 =?utf-8?B?aWF1RVpoUzRua1BpLy9VOFhYRFFkek5BWVh4NUVpUlFZMVFYOFpFWk55cUFT?=
 =?utf-8?B?cWc4K0t3NTRLcVF4aUQyc2E5aDdiRDRyR0lhMTVyY0VsNnpnemV5bFFFeHdF?=
 =?utf-8?B?MzVlOTJXVXgrQmlzemFveW1HdWVpaW9oVTAxZ3p5ZjhFS1p5VklvSHdTSUc4?=
 =?utf-8?B?VE1sWTFjbHhqL2xvMllVNGFpdUlZVTRKR2NMVHNqTnltRDNWdGZlMnBrMXp4?=
 =?utf-8?B?c2lteVFEQm5pVXJ1MVlqQ0dTWmh3KzVRVHF3b090WXRBNUtLSG1VYzBxL1Va?=
 =?utf-8?B?eXN5S1duaGo3alREM01UQ3Q5TjRBdHhSMnZwZ09RenE1UVF0dWVoeFRvcC9o?=
 =?utf-8?B?MWhLRDRIdlM3KzQyWGl4SE5tL1h6OVhPV3hXSEJlcEpZZnRHV05UcVBvQ014?=
 =?utf-8?B?MDhGMUFkUGRSWmxGSkU4cmpIUis0MVNhYTllZ0VFeU50Q2F5eHVhL0xJMTNr?=
 =?utf-8?Q?iN3Aas4zpzE3Gm+DArdArAW0T?=
Content-ID: <20ECB427E469A049B55D8CB1310430E6@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 746b3024-2b43-45b9-6a6d-08da60eefe16
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2022 14:34:40.7243
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QCct0Jgq3nww7Jp0eOxQAUnTlAf47JuZtWL7WDlozdHfy/EwUseUvVDr3/KbTXm77O4WxTBt2lkl5qrkQRH5G/TpOXayA6qdS3BEWgR4HBY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4257
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_073453_921167_5E73D21C 
X-CRM114-Status: GOOD (  19.51  )
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

On 08/07/2022 15:29, Conor Dooley wrote:
> \#pwm-cells for the Icicle kit's fabric PWM was incorrectly set to 2 &
> blindly overridden by the (out of tree) driver anyway. The core can
> support inverted operation, so update the entry to correctly report its
> capabilities.
> 
> Fixes: 72560c6559b8 ("riscv: dts: microchip: add fpga fabric section to icicle kit")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Gah, I messed this patch up... I'll resend.

> ---
>   .../dts/microchip/mpfs-icicle-kit-fabric.dtsi |   2 +-
>   .../dts/microchip/mpfs-tysom-m-fabric.dtsi    |  18 ++
>   .../riscv/boot/dts/microchip/mpfs-tysom-m.dts | 185 ++++++++++++++++++
>   3 files changed, 204 insertions(+), 1 deletion(-)
>   create mode 100644 arch/riscv/boot/dts/microchip/mpfs-tysom-m-fabric.dtsi
>   create mode 100644 arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts
> 
> diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
> index 0d28858b83f2..e09a13aef268 100644
> --- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
> +++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
> @@ -8,7 +8,7 @@ core_pwm0: pwm@41000000 {
>   		compatible = "microchip,corepwm-rtl-v4";
>   		reg = <0x0 0x41000000 0x0 0xF0>;
>   		microchip,sync-update-mask = /bits/ 32 <0>;
> -		#pwm-cells = <2>;
> +		#pwm-cells = <3>;
>   		clocks = <&fabric_clk3>;
>   		status = "disabled";
>   	};
> diff --git a/arch/riscv/boot/dts/microchip/mpfs-tysom-m-fabric.dtsi b/arch/riscv/boot/dts/microchip/mpfs-tysom-m-fabric.dtsi
> new file mode 100644
> index 000000000000..98f642e83ad4
> --- /dev/null
> +++ b/arch/riscv/boot/dts/microchip/mpfs-tysom-m-fabric.dtsi
> @@ -0,0 +1,18 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/* Copyright (c) 2022 Microchip Technology Inc */
> +
> +// #include "dt-bindings/mailbox/miv-ihc.h"
> +
> +/ {
> +	fabric_clk3: fabric-clk3 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <62500000>;
> +	};
> +
> +	fabric_clk1: fabric-clk1 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <125000000>;
> +	};
> +};
> diff --git a/arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts b/arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts
> new file mode 100644
> index 000000000000..0b664c591255
> --- /dev/null
> +++ b/arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts
> @@ -0,0 +1,185 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Original all-in-one devicetree:
> + * Copyright (C) 2020-2022 - Aldec
> + * Rewritten to use includes:
> + * Copyright (C) 2022 - Conor Dooley <conor.dooley@microchip.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "mpfs.dtsi"
> +#include "mpfs-tysom-m-fabric.dtsi"
> +
> +/* Clock frequency (in Hz) of the rtcclk */
> +#define MTIMER_FREQ		1000000
> +
> +/ {
> +	model = "Aldec TySOM-M-MPFS250T";
> +	compatible = "aldec,tysom-m-mpfs250t", "microchip,mpfs";
> +
> +	aliases {
> +		ethernet0 = &mac0;
> +		ethernet1 = &mac1;
> +		serial0 = &mmuart0;
> +		serial1 = &mmuart1;
> +		serial2 = &mmuart2;
> +		serial3 = &mmuart3;
> +		serial4 = &mmuart4;
> +		gpio0 = &gpio0;
> +		gpio1 = &gpio2;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial1:115200n8";
> +	};
> +
> +	cpus {
> +		timebase-frequency = <MTIMER_FREQ>;
> +	};
> +
> +	ddrc_cache_lo: memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x0 0x80000000 0x0 0x2e000000>;
> +		status = "okay";
> +	};
> +
> +	ddrc_cache_hi: memory@1000000000 {
> +		device_type = "memory";
> +		reg = <0x10 0x00000000 0x0 0x40000000>;
> +		status = "okay";
> +	};
> +
> +	soc {
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +		status = "okay";
> +
> +		led0 {
> +			gpios = <&gpio1 23 1>;
> +			default-state = "on";
> +			linux,default-trigger = "heartbeat";
> +		};
> +	};
> +};
> +
> +&i2c0 {
> +	status = "okay";
> +};
> +
> +&i2c1 {
> +	status = "okay";
> +	ina219: ina219@45 {
> +		status = "okay";
> +		compatible = "ti,ina219";
> +		reg = <0x45>;
> +		shunt-resistor = <0x7d0>;
> +	};
> +};
> +
> +&gpio1 {
> +	interrupts = <27 28 29 30 31 32 33 47 35 36 37 38 39 40 41 42 43 44 45 46 34 48 49 50>;
> +	status = "okay";
> +};
> +
> +&mac0 {
> +	status = "okay";
> +	phy-mode = "gmii";
> +	phy-handle = <&phy0>;
> +
> +};
> +
> +&mac1 {
> +	status = "okay";
> +	phy-mode = "gmii";
> +	phy-handle = <&phy1>;
> +	phy1: ethernet-phy@1 {
> +		reg = <1>;
> +		ti,fifo-depth = <0x01>;
> +	};
> +	phy0: ethernet-phy@0 {
> +		reg = <0>;
> +		ti,fifo-depth = <0x01>;
> +	};
> +};
> +
> +&mbox {
> +	status = "okay";
> +};
> +
> +&mmc {
> +	max-frequency = <200000000>;
> +	cap-mmc-highspeed;
> +	cap-sd-highspeed;
> +	no-1-8-v;
> +	disable-wp;
> +	status = "okay";
> +};
> +
> +&mmuart1 {
> +	status = "okay";
> +};
> +
> +&mmuart2 {
> +	status = "okay";
> +};
> +
> +&mmuart3 {
> +	status = "okay";
> +};
> +
> +&mmuart4 {
> +	status = "okay";
> +};
> +
> +&refclk {
> +	clock-frequency = <125000000>;
> +};
> +
> +&rtc {
> +	status = "okay";
> +};
> +
> +&spi0 {
> +	status = "okay";
> +};
> +
> +&spi1 {
> +	status = "okay";
> +	pseFlash@0 {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		compatible = "n25q128a11", "jedec,spi-nor";
> +		status = "okay";
> +		reg = <0x0>;
> +		spi-max-frequency = <10000000>;
> +
> +		partition@test-0 { /* test purposes */
> +			label = "qspi-test-0";
> +			reg = <0x00000000 0x00800000>;
> +		};
> +		partition@test-1 { /* test purposes */
> +			label = "qspi-test-1";
> +			reg = <0x00800000 0x00800000>;
> +		};
> +		partition@test-2 { /* test purposes */
> +			label = "qspi-test-2";
> +			reg = <0x01000000 0x00800000>;
> +		};
> +		partition@test-3 { /* test purposes */
> +			label = "qspi-test-3";
> +			reg = <0x01800000 0x00800000>;
> +		};
> +	};
> +};
> +
> +&syscontroller {
> +	status = "okay";
> +};
> +
> +&usb {
> +	status = "okay";
> +	dr_mode = "host";
> +};

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
