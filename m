Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB79C28D13
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Aug 2022 09:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ATJKYz1yJ3pSg4Rx+mZI6NFBya0porC+0IK3VNbkUw=; b=aUn63N8YCHS5Qf
	So7yOoJG+RjayZqzzoJLV9QHImZcW3lrag03b8WQUn6RK67vxU7Piu4t4jLfeQCs/e0dnmgPu7kn2
	86+vobxOR2EbodwDNqC5SlQQBsHqDkyroxA+kLnp3tR8nB2bdCz2AoypxKnduSrKRiToQRqG6zvYQ
	jcLxSLLeYmBO9nIoZcYgKsI7ieuXJJklipd9mAsRY/UgmSgC08Oqqxz6xULq+Tnp6sT+HWFfvZSUW
	tIZJFkgERWibK4jb08s7Cle6Y1Y7tKKkJp/Eo7sOhdvOls1M+azHA2zpDJpktFEq43ca+8llifSQ9
	jNTWJ5p/U9wy2uhoYmfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ3a7-006vTu-Fi; Mon, 22 Aug 2022 09:18:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ3a2-006vPX-83
	for linux-riscv@lists.infradead.org; Mon, 22 Aug 2022 09:18:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661159926; x=1692695926;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=SBaJIwMCN2f/okb6b/a0eW8qQUGr/rn/36WOkrXtNOc=;
  b=N/pLO9wosOpZntOJdW2Dyth2Z6Jlu4TatkTpwEJLxQh0ZqykDFU9eQqn
   /LbvDBa/EnNI/Yw9CNlYa+YLJyYcEAqbJfw8iqtZGghWxlibEHvc5yBaA
   p+tu+UFT74z1t34eKnamAN/4LxLwvY+Ge6zowBZw/4RysW8WOBzSmBXVq
   tLlfl0LIdbYUwnhkMvEuMpnvKhJ4M/M4AfhMdoz5q6TePyTLnIdrn8/Th
   g8Tw/mEBOGFj5xvzoda5rK8LcsW0034isGQyc27vagfHzHTgQbHvgvckL
   kIsyG3NyZSNvOHsC/zXmtBnaEshVw8aPCi63oFqYdgzxHdalBaSo6W3pl
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,254,1654585200"; 
   d="scan'208";a="170312286"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Aug 2022 02:18:41 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 22 Aug 2022 02:18:39 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Mon, 22 Aug 2022 02:18:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EayjFmhgBxBxdaP8zkc1wStLX18c7LHGmWUXzxN+9z1lEYfwoqNkOgPkGbsA1zPfowNfRvN1MO6sG36zedV4vYwdRpVgF6en+Db2AlPMMpHilwlxQQeAVplMMiCu3MITfiEY954WzRxnnoV+noXi0o4MHtKTjOXqQuh3MTnTj6M9KWv9RqNZ3w++lRsNgUadD6Ld5slMgBR8miFeZ/NRjpc/Ns41ZmaMs2dQBskEDVCr93U1DAvpFnC0B+RlaocazYjGqiI4YQiUVWJRCxj/qPWxhdL1c+hF20AS6CNknv+ztQCEf5aseYmiNPjUaViP+95FsdbJ67ZcU3w6xuSAew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SBaJIwMCN2f/okb6b/a0eW8qQUGr/rn/36WOkrXtNOc=;
 b=PebTgGYxBnwCb0fWy365QH5eetGmJaQiKo1DN4/HbMf7WyG/qkR/mYTlIliSDGsCxJdnEIaAr6MKxo7dVMpZj0Qqw+HvAC3sKQQOX5pk+Qw1U00AnuknVCVEsHh7lKthBU+wpjPISfaOPGGdWNhZa3KXkwI11g1bcdv/6DDUuk47co3GJjCpG4j9Fq5c4SBbQl9J44oKduCcMNiUY3WibspKDzc5lET2oMKvnPsmHS1axAzHdfa6VxJBLu+/0cS1cBsMuXjsCZ/UlFrPaY7SQgKBAZXKsikErShQXeKipYlhJxivxhwBaTnmEZB0aFV0v+6TlGNjLYcmhqZaPdXmXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SBaJIwMCN2f/okb6b/a0eW8qQUGr/rn/36WOkrXtNOc=;
 b=YKrfC0dnbZuQBMe/OHLbmtWMI7jM9l85VaIDCrYI2WyLWvjMEm1QdRV/SA8xDEJ3NHwTu+/BrUU0BaJC653IXgPnXfu9/wetSpYoZ7vFCpsxJsfKlAgizI+y7dT0RhFYl7nIqbNdjYOQHRNnA1UW5x8Te10RT8xTru5/UMc8CEw=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM8PR11MB5589.namprd11.prod.outlook.com (2603:10b6:8:26::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.19; Mon, 22 Aug 2022 09:18:26 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%9]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 09:18:26 +0000
From: <Conor.Dooley@microchip.com>
To: <dan.carpenter@oracle.com>, <kbuild@lists.01.org>,
	<thierry.reding@gmail.com>, <u.kleine-koenig@pengutronix.de>,
	<robh+dt@kernel.org>, <krzk@kernel.org>
CC: <lkp@intel.com>, <kbuild-all@lists.01.org>,
	<Daire.McNamara@microchip.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v9 3/4] pwm: add microchip soft ip corePWM driver
Thread-Topic: [PATCH v9 3/4] pwm: add microchip soft ip corePWM driver
Thread-Index: AQHYs6nYVFSeLfjtSkW5QyAbpeym6K26nv2AgAAJ34A=
Date: Mon, 22 Aug 2022 09:18:26 +0000
Message-ID: <be336a32-e729-b357-7db0-bacc02776cb2@microchip.com>
References: <202208212329.XETz1mt0-lkp@intel.com>
In-Reply-To: <202208212329.XETz1mt0-lkp@intel.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a1e2809d-0923-46ae-7514-08da841f44dd
x-ms-traffictypediagnostic: DM8PR11MB5589:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3dPoxYySSb5r2rLJ2CX/R2i1xV0r8a3Hf/PKBHj7itt6JzB/bDCaa4quToz/7PKDU651wEP7hv9r55fGdE+wMjvi3g1KoUj0zrYv9ayXUYeYjZD6y7quS6PMPKB1WhMvPp5lFNPCtpjJUfBu+U1jPCcGcnZXOoWDsIGderCpXoaYeJTngkxGGdXo7zBujlfS614rWv0LinNlzGYcv8UYKank3ThVXe8iDzsHEbu7XvHFbZUvupdo0EYdeSwK/Xp1i2D+yzvQot/7t1IXS5/sA0lEvBSd+j3HdneIvFFN+H+1V3OolVtAB41MMFKN4xCDDDU5GJM1cXQhzX3DNvxd9lfBHrT6FpMOwDcEmh1kH9fyRnqp5JtgzNguMcmWHAa7XUTvFgX+JZYk7Hfcc0FNvVr+s2ZFzh/nm5XZfPjJYySIvKGD636IWRwhvnAWaUyfR3N592hGgVh/HGIlgyOeodw/AV0bV9dWZuRkW4W2JxliwOZ1VaHllcB912DtzHKdThP6njP8RCJHpbC5SSLMgEWXdCmuGNWfokGbGj597lQduDyDZX+9xY0N7jmX4WMZmfQvqjSLqXQphjdTPZnRGg4HzIvKVjRqM4p00B2rK6MxXWWdr143m+IOBfl3XIwrnGkEjlE4ZAKHzI1ErLMPuVrAxOyY4JciTx12l5yIbLWG/qRaGLTKinprqZMgSIXurAh/o4ezIN3KyvNKPqKP0yqpvL77h3aTRyAdoCr/qSalTl5MNkJs8JF3NHfxBEb9C1kP8xhIN1+vkW8RJaowGjRWh325OOI6hmWn1p4KXKucXtPe/8wnFSICeWHJ9Mt8/Tk8VmsD8JjHdd/IT5U2bHFAi5QcmmAxYkyNQenXicQ043SrE6OI09ly3oYv9dHIt5Xdk+6PspARYsMZWWZ4Ug==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(39860400002)(396003)(376002)(346002)(366004)(4326008)(122000001)(7416002)(8936002)(26005)(71200400001)(6512007)(6506007)(5660300002)(53546011)(83380400001)(31686004)(36756003)(54906003)(316002)(66446008)(64756008)(76116006)(91956017)(66946007)(8676002)(66476007)(66556008)(86362001)(31696002)(2906002)(38100700002)(110136005)(2616005)(186003)(38070700005)(966005)(6486002)(478600001)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TmY1NFBVZU9CNTVwajk0YjNpTXhaSWVXSW14akJsSWEzak0xNXVaY3VXYm16?=
 =?utf-8?B?aXhCVFRzMjBCOUFOcFVrVFN0T3cwL2FHd1hDTXV3UlduaHZic29FYWxwdk1P?=
 =?utf-8?B?eGEwNmkxSS9mVlB5Ym5WSkdYbkdRZDdxVXZjYzZQeldpUERNWmZBMlJ3djA0?=
 =?utf-8?B?VkNuMU11T2t0YzE3a2FpdU5nVGlZK0F6c1g2RUt3Z3FJK0d3cEQvWEN5dVRu?=
 =?utf-8?B?ZXl5ZjVOQXNVOUdDa2pYaEw5RW1qYStCQWs1UUsvYndMZjIvQlRmU1NRWlR6?=
 =?utf-8?B?OTUzaW9KdXA4aWlmK2RuT2JRNnJxZk16WkdvamdYUE5mZEQxL3VML2FLTjBQ?=
 =?utf-8?B?VkV1WHYzRXJVdXQ4Kyt1NHhvTExvbWpBc0U5YS9RTWwzS0wxSXRINUxjRXlT?=
 =?utf-8?B?TURBYTNCTy9kK3hUYnhMZTdzMFhLL250ZkR6SGhQNUIzdUVhU3VyTnJ6OThu?=
 =?utf-8?B?WDBub1hzZFNQbWZaR2JGUDhlZ0VEQWhiTUlsL0RVbkdvMlcvV1F0OXhQK0Er?=
 =?utf-8?B?QkJGQlhId0FNT2VrVHF0QjZxdkNHZnBTL3lUcHh5a2ZFRkZyWjFhajFBT2pE?=
 =?utf-8?B?L1JJR1ZTMGxQamFVeVlaZWpDcCtiUUVoN2JmRDdnMWIzVkRzMzUwOWNYcTRs?=
 =?utf-8?B?R25uN3hJejAwdnNxcFFKdGpMRzNmRGtNSWNjVnp0V04wQSs1amxYbzJ0ckFB?=
 =?utf-8?B?Z2t6Q1F0RXpnSW8vMFZWbnNJNjhTOFI0anBXYjY4YVp4Q29LQ3oxZEgwYWZt?=
 =?utf-8?B?Q0dKT3laOHIzejNTTnBtQ1hlemk1Tm96aStSUzlXd2x1SGpNM2U5Tmg4RS95?=
 =?utf-8?B?OWRnSEpnRkRDS09VV2xsWHhyWlpZRk9FUFdkRFBPbFRWQ0RydmVNcGtNb0FP?=
 =?utf-8?B?YjJWcGhDSzV6dVp1bmhHY3gyVjFEdktBUzFjSnVTTVJyQlh6MEtHd1JqaW1G?=
 =?utf-8?B?Sm51MEhPRW82by96U2JvRURpcEV6WVc1T0txM3NuVmFvYlJTOVJoSTNvMkhC?=
 =?utf-8?B?VTBIU2J3NHlKSHZ2NVRwaERjQmNXTmVuUkFhbDkvZk92RmxSa3RlbHhlUGhK?=
 =?utf-8?B?SEdHV3F2VW1PTmd3bWFvZUZkYlROZ21UdytnczRiamtVbW9aOUNrcFY1WDNB?=
 =?utf-8?B?YzRNTFpNekt1M29ndXRNNVozcWVKc3RkZytMbWZESnpzNW95c1dkQkUyR2Uw?=
 =?utf-8?B?WXRIdkMvSXlpRkxiV2dVTGlXb0tVdGg5RGhYUVFiTzZkZFh5RSsybFk5bFpT?=
 =?utf-8?B?MlZkVTJhaFg1eklPbXlYc3pMdHVYYTdDaHZFNWNxWjhPc09iYlFPbkpSM1Qr?=
 =?utf-8?B?a0pQb2p1M2t4aWY0OGV6RzYxVFUyY0xHOTNLTkZ1cGdNVTJOT2hjeHRBcU1l?=
 =?utf-8?B?ZGtCWUVRRW1BdXJPdjRaSkFHUU93WUlpNFJLazdYNE54ZXFRM3c3WmRWaTZh?=
 =?utf-8?B?Yk5WMUFFdXNjSFF0NDl4QWs2SFY0VEQ4UEovWmRiQzdXZnh0TUowdGgwSlli?=
 =?utf-8?B?TVdkTkFmMUJnM1ZiQWxSUWYvU1UxMnc4cjQ3cVAveTFjL1dmU2wrZG9VMFZI?=
 =?utf-8?B?TUYzSkpiNEl0M2IxdWdzVUhlYkV0MTFIdWMxNDBEUk90NHNldFFwc1RMQS9V?=
 =?utf-8?B?Z0RXTXpWcGpDcE9PR1pkdkR1S0dVMHQ0ZG9EUG5LNHpmYnpFTXkwdkxEWHg0?=
 =?utf-8?B?VktWTzJwMHMrTzhwWllwU3IxRm9PNzRHeGIxR1F4NUlVOFJ5cEsyaGpVN1dV?=
 =?utf-8?B?cmV6dm01ZkRYYXFMZnVTUkVUTGhFVkZSVTFGaUpRU3ZWL1hiWnhsYzBhcXFH?=
 =?utf-8?B?YWpRcG9YM1VMcXpjdklZaVBkSWgwSzRneTB0YUFmVEhCVWp0K2YwcUJtcURh?=
 =?utf-8?B?dFVsVURPVi9pcjdDZjhUcU1aY01XSGN1T0gyc3lZbHBNbitibFA3TXByWm5G?=
 =?utf-8?B?RTMwNVNnZ1VVell6TFZQVTlpM3lhNWYrNERQb0E3bSszNkhBYmU2M1pLUkxL?=
 =?utf-8?B?dWh5TGFEMTNGMVFTZm9ETWhHSHdFT1NkR3pEdmNwVVJGVmxlS2gyQWZTTDhI?=
 =?utf-8?B?K25obnduWmFsdVkwWVpPdFBMbmhLV0djL3ZRcWw4TGorbSs5NHFMYUN4WnBz?=
 =?utf-8?Q?SstezibiW99yUZunz6+W/OZ0Q?=
Content-ID: <1BF59765BE73C148956D7C2705D08679@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1e2809d-0923-46ae-7514-08da841f44dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2022 09:18:26.0250
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AIo6aBi6A4AIiTkJQguV1WwZoodcEsQSVIvT/6uylQag7UKgOUAdCBLin1aDCw0jeZ53ANaXXH8UM3rksxtgdmR12qQJ4PCi7TYlSzbaV/8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5589
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_021846_705698_3A4376FE 
X-CRM114-Status: GOOD (  14.73  )
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

On 22/08/2022 09:42, Dan Carpenter wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi Conor,
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Conor-Dooley/Microchip-soft-ip-corePWM-driver/20220819-170106
> base:   568035b01cfb107af8d2e4bd2fb9aea22cf5b868
> config: arm64-randconfig-m031-20220821 (https://download.01.org/0day-ci/archive/20220821/202208212329.XETz1mt0-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 12.1.0
> 
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> smatch warnings:
> drivers/pwm/pwm-microchip-core.c:295 mchp_core_pwm_apply() warn: inconsistent returns '&mchp_core_pwm->lock'.

Totally correct, there's a missing unlock. I'll send a v10 at some stage this week.
Thanks Dan,
Conor.

> 
> vim +295 drivers/pwm/pwm-microchip-core.c
> 
> ae39414af22131 Conor Dooley 2022-08-19  200  static int mchp_core_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
> ae39414af22131 Conor Dooley 2022-08-19  201                            const struct pwm_state *state)
> ae39414af22131 Conor Dooley 2022-08-19  202  {
> ae39414af22131 Conor Dooley 2022-08-19  203     struct mchp_core_pwm_chip *mchp_core_pwm = to_mchp_core_pwm(chip);
> ae39414af22131 Conor Dooley 2022-08-19  204     struct pwm_state current_state = pwm->state;
> ae39414af22131 Conor Dooley 2022-08-19  205     bool period_locked;
> ae39414af22131 Conor Dooley 2022-08-19  206     u64 duty_steps;
> ae39414af22131 Conor Dooley 2022-08-19  207     u16 prescale;
> ae39414af22131 Conor Dooley 2022-08-19  208     u8 period_steps;
> ae39414af22131 Conor Dooley 2022-08-19  209     int ret;
> ae39414af22131 Conor Dooley 2022-08-19  210
> ae39414af22131 Conor Dooley 2022-08-19  211     mutex_lock(&mchp_core_pwm->lock);
> ae39414af22131 Conor Dooley 2022-08-19  212
> ae39414af22131 Conor Dooley 2022-08-19  213     if (!state->enabled) {
> ae39414af22131 Conor Dooley 2022-08-19  214             mchp_core_pwm_enable(chip, pwm, false, current_state.period);
> ae39414af22131 Conor Dooley 2022-08-19  215             mutex_unlock(&mchp_core_pwm->lock);
> ae39414af22131 Conor Dooley 2022-08-19  216             return 0;
> ae39414af22131 Conor Dooley 2022-08-19  217     }
> ae39414af22131 Conor Dooley 2022-08-19  218
> ae39414af22131 Conor Dooley 2022-08-19  219     /*
> ae39414af22131 Conor Dooley 2022-08-19  220      * If the only thing that has changed is the duty cycle or the polarity,
> ae39414af22131 Conor Dooley 2022-08-19  221      * we can shortcut the calculations and just compute/apply the new duty
> ae39414af22131 Conor Dooley 2022-08-19  222      * cycle pos & neg edges
> ae39414af22131 Conor Dooley 2022-08-19  223      * As all the channels share the same period, do not allow it to be
> ae39414af22131 Conor Dooley 2022-08-19  224      * changed if any other channels are enabled.
> ae39414af22131 Conor Dooley 2022-08-19  225      * If the period is locked, it may not be possible to use a period
> ae39414af22131 Conor Dooley 2022-08-19  226      * less than that requested. In that case, we just abort.
> ae39414af22131 Conor Dooley 2022-08-19  227      */
> ae39414af22131 Conor Dooley 2022-08-19  228     period_locked = mchp_core_pwm->channel_enabled & ~(1 << pwm->hwpwm);
> ae39414af22131 Conor Dooley 2022-08-19  229
> ae39414af22131 Conor Dooley 2022-08-19  230     if (period_locked) {
> ae39414af22131 Conor Dooley 2022-08-19  231             u16 hw_prescale;
> ae39414af22131 Conor Dooley 2022-08-19  232             u8 hw_period_steps;
> ae39414af22131 Conor Dooley 2022-08-19  233
> ae39414af22131 Conor Dooley 2022-08-19  234             mchp_core_pwm_calc_period(chip, state, (u8 *)&prescale, &period_steps);
> ae39414af22131 Conor Dooley 2022-08-19  235             hw_prescale = readb_relaxed(mchp_core_pwm->base + MCHPCOREPWM_PRESCALE);
> ae39414af22131 Conor Dooley 2022-08-19  236             hw_period_steps = readb_relaxed(mchp_core_pwm->base + MCHPCOREPWM_PERIOD);
> ae39414af22131 Conor Dooley 2022-08-19  237
> ae39414af22131 Conor Dooley 2022-08-19  238             if ((period_steps + 1) * (prescale + 1) <
> ae39414af22131 Conor Dooley 2022-08-19  239                 (hw_period_steps + 1) * (hw_prescale + 1)) {
> ae39414af22131 Conor Dooley 2022-08-19  240                     mutex_unlock(&mchp_core_pwm->lock);
> ae39414af22131 Conor Dooley 2022-08-19  241                     return -EINVAL;
> ae39414af22131 Conor Dooley 2022-08-19  242             }
> ae39414af22131 Conor Dooley 2022-08-19  243
> ae39414af22131 Conor Dooley 2022-08-19  244             /*
> ae39414af22131 Conor Dooley 2022-08-19  245              * It is possible that something could have set the period_steps
> ae39414af22131 Conor Dooley 2022-08-19  246              * register to 0xff, which would prevent us from setting a 100%
> ae39414af22131 Conor Dooley 2022-08-19  247              * duty cycle, as explained in the mchp_core_pwm_calc_period()
> ae39414af22131 Conor Dooley 2022-08-19  248              * above.
> ae39414af22131 Conor Dooley 2022-08-19  249              * The period is locked and we cannot change this, so we abort.
> ae39414af22131 Conor Dooley 2022-08-19  250              */
> ae39414af22131 Conor Dooley 2022-08-19  251             if (period_steps == MCHPCOREPWM_PERIOD_STEPS_MAX)
> ae39414af22131 Conor Dooley 2022-08-19  252                     return -EINVAL;
> 
> mutex_unlock(&mchp_core_pwm->lock); before the retun?
> 
> ae39414af22131 Conor Dooley 2022-08-19  253
> ae39414af22131 Conor Dooley 2022-08-19  254             prescale = hw_prescale;
> ae39414af22131 Conor Dooley 2022-08-19  255             period_steps = hw_period_steps;
> ae39414af22131 Conor Dooley 2022-08-19  256     } else if (!current_state.enabled || current_state.period != state->period) {
> ae39414af22131 Conor Dooley 2022-08-19  257             ret = mchp_core_pwm_calc_period(chip, state, (u8 *)&prescale, &period_steps);
> ae39414af22131 Conor Dooley 2022-08-19  258             if (ret) {
> ae39414af22131 Conor Dooley 2022-08-19  259                     mutex_unlock(&mchp_core_pwm->lock);
> ae39414af22131 Conor Dooley 2022-08-19  260                     return ret;
> ae39414af22131 Conor Dooley 2022-08-19  261             }
> ae39414af22131 Conor Dooley 2022-08-19  262             mchp_core_pwm_apply_period(mchp_core_pwm, prescale, period_steps);
> ae39414af22131 Conor Dooley 2022-08-19  263     } else {
> ae39414af22131 Conor Dooley 2022-08-19  264             prescale = readb_relaxed(mchp_core_pwm->base + MCHPCOREPWM_PRESCALE);
> ae39414af22131 Conor Dooley 2022-08-19  265             period_steps = readb_relaxed(mchp_core_pwm->base + MCHPCOREPWM_PERIOD);
> ae39414af22131 Conor Dooley 2022-08-19  266
> ae39414af22131 Conor Dooley 2022-08-19  267             /*
> ae39414af22131 Conor Dooley 2022-08-19  268              * As above, it is possible that something could have set the
> ae39414af22131 Conor Dooley 2022-08-19  269              * period_steps register to 0xff, which would prevent us from
> ae39414af22131 Conor Dooley 2022-08-19  270              * setting a 100% duty cycle, as explained above.
> ae39414af22131 Conor Dooley 2022-08-19  271              * As the period is not locked, we are free to fix this.
> ae39414af22131 Conor Dooley 2022-08-19  272              */
> ae39414af22131 Conor Dooley 2022-08-19  273             if (period_steps == MCHPCOREPWM_PERIOD_STEPS_MAX) {
> ae39414af22131 Conor Dooley 2022-08-19  274                     period_steps -= 1;
> ae39414af22131 Conor Dooley 2022-08-19  275                     mchp_core_pwm_apply_period(mchp_core_pwm, prescale, period_steps);
> ae39414af22131 Conor Dooley 2022-08-19  276             }
> ae39414af22131 Conor Dooley 2022-08-19  277     }
> ae39414af22131 Conor Dooley 2022-08-19  278
> ae39414af22131 Conor Dooley 2022-08-19  279     duty_steps = mchp_core_pwm_calc_duty(chip, pwm, state, prescale, period_steps);
> ae39414af22131 Conor Dooley 2022-08-19  280
> ae39414af22131 Conor Dooley 2022-08-19  281     /*
> ae39414af22131 Conor Dooley 2022-08-19  282      * Because the period is per channel, it is possible that the requested
> ae39414af22131 Conor Dooley 2022-08-19  283      * duty cycle is longer than the period, in which case cap it to the
> ae39414af22131 Conor Dooley 2022-08-19  284      * period, IOW a 100% duty cycle.
> ae39414af22131 Conor Dooley 2022-08-19  285      */
> ae39414af22131 Conor Dooley 2022-08-19  286     if (duty_steps > period_steps)
> ae39414af22131 Conor Dooley 2022-08-19  287             duty_steps = period_steps + 1;
> ae39414af22131 Conor Dooley 2022-08-19  288
> ae39414af22131 Conor Dooley 2022-08-19  289     mchp_core_pwm_apply_duty(chip, pwm, state, duty_steps, period_steps);
> ae39414af22131 Conor Dooley 2022-08-19  290
> ae39414af22131 Conor Dooley 2022-08-19  291     mchp_core_pwm_enable(chip, pwm, true, state->period);
> ae39414af22131 Conor Dooley 2022-08-19  292
> ae39414af22131 Conor Dooley 2022-08-19  293     mutex_unlock(&mchp_core_pwm->lock);
> ae39414af22131 Conor Dooley 2022-08-19  294
> ae39414af22131 Conor Dooley 2022-08-19 @295     return 0;
> ae39414af22131 Conor Dooley 2022-08-19  296  }
> 
> --
> 0-DAY CI Kernel Test Service
> https://01.org/lkp
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
