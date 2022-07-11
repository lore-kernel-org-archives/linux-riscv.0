Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B35FC43334
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jul 2022 12:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JfjUeAi/25tass5wbnhvBsdFA6zK7qkm6AOflIK83gw=; b=ymOhSKaZHuezC3
	CnYFIN8YOx+LQ8uDOKXe48wB4UxS44FfKWx6qL5KhgcBFI5UbHpmxOvlh3GkZle6rJNduj82JNxgY
	6DgFC0w1SeuPlt2U1dhPiKga2dJiusaejoTNviPbGO8llaBDLenmzIGJ++eUzAr0KEzvn1hZbpkIf
	CPuJy6C+CvN32Lo6zKwLR7CfM9XyxGJAn0u3XyHJohACaEsTg/DBklGKqy78J+XAi/UXU0nRJyKYi
	f7q9CPiL+lflBMgpNGOjwHC/AvDmUnBEOsP4fSc10SFnvHNiwBcQ+le8Rej4j1ZEr7uPeQ9thFhJ4
	mGA4SNT61N20Nd3Xru8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAsUj-001Ouy-VC; Mon, 11 Jul 2022 12:26:34 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAsUf-001OpV-Sp
	for linux-riscv@lists.infradead.org; Mon, 11 Jul 2022 12:26:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657542389; x=1689078389;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=CHG0iaukymntBTiHPJjRtibB+vT2aTxIu/0cltPGwIU=;
  b=h7u+y6KztLkty2qhAezEXsSYCIYf6MnkIjNd/qcncqU7vHFl2nbVxhK7
   h1xhvHn0fLnnjWqlW5AginCTVyVHnwkJxf4urAD1omE87BABFJAdGaJCK
   6koqMOQNffHkwZC4x3PSPZh2zxs2J5qsFDphQfOHoTDH8CLpy/MFRQUFA
   6y9QFNaJtDOqKOJ4EpOpnveipLTyK3WhpWCPNPcpEszQVLBEUGOjQNF44
   3loYyj7sK1RDxUyVDcKA3O80Gs0xKMsEMCCVsQrlHR2AMP0v7XQBkcWBE
   FApxYKIfN2sGnWgk+d95MXZgxgxVuwKYvSLPUT0at961OJxIYOyhBCgzg
   A==;
X-IronPort-AV: E=Sophos;i="5.92,262,1650956400"; 
   d="scan'208";a="167267693"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Jul 2022 05:26:25 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 11 Jul 2022 05:26:24 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Mon, 11 Jul 2022 05:26:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HVdbP31VNeKjFZlrteeIi+IKo+MMYGWpG4NdyS+zm5X7ucyk0lnuwA1DeTc3yVBRcyr1nCYho4+3GCsJ0HZHey7YCIAB9jd8P6xZPCdzgxVufuQi69JFt408Vx/EESaV6byIDvV2J1SRhh3sVT9pZnG5T2N9hH2hTV7pA3rDiGWpoTmNJZSNWblb/rIfQW85eskCF4lu6XFaAy0Gc8ZQOzpR+hSSEFc3/pQqhjxCJZ+VT6c54k03qlxKLt+iBscdP/pVvfl6gCHfNJaOLTnBtSjR0FbqPgFcfE0v9v+2z+WyuBu+iK5SMo0B1Wv86B/c4j/MPaQo8VLcdPso2hydNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CHG0iaukymntBTiHPJjRtibB+vT2aTxIu/0cltPGwIU=;
 b=lp6WXNuO2DxrEgGa6HaEQ6kG+25YTibmtGhtjyGEbzqYwTkOcGaBWg0BaPLcUB3TXBSSmtgvoY9STdHj+SI26WIM2XDtQaXzzZltQpmHJFL9IUayDkq32zBG7614y5IDWenT2t9QwToxRtKHg0/kO+OwEtcxCACnyCYIMYw1PA19BkGB7MrK1jDXS5JPLzCyxBi+4ilA7ZNC3nFoGnCM+CvWV8g9wv8FiZNgwLjWkkAZvcsDOxe9hJ60fDeRWfv0QuAaiS7VPnbCk1TfqCbzXMBBWNjtPIfg7ojF3QhJMZiDjFkA/uaQNqKl7YHG6SH2VpaFAnOfZgVFn470qiA5tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CHG0iaukymntBTiHPJjRtibB+vT2aTxIu/0cltPGwIU=;
 b=YgKiTPUDeJ+Fq0u4h/qZTaJlrL8ljRNVYNG6DTbt9hsybVMN1ocSVHOuzode1MEaoxIwu+gkCs8UQzBBmi2H1ybM3IuuujuhpsXM65rLwc8BKepyxW+SXzxJzFnBYweACzaAnPYwXXIZfVPEkrZFUjqwOIAIns822BPEZAnSABY=
Received: from PH0PR11MB5925.namprd11.prod.outlook.com (2603:10b6:510:143::10)
 by SN6PR11MB2926.namprd11.prod.outlook.com (2603:10b6:805:ce::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Mon, 11 Jul
 2022 12:26:21 +0000
Received: from PH0PR11MB5925.namprd11.prod.outlook.com
 ([fe80::5c03:1f60:ee1d:3928]) by PH0PR11MB5925.namprd11.prod.outlook.com
 ([fe80::5c03:1f60:ee1d:3928%7]) with mapi id 15.20.5417.026; Mon, 11 Jul 2022
 12:26:21 +0000
From: <Lewis.Hanly@microchip.com>
To: <maz@kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-gpio@vger.kernel.org>, <ben.dooks@codethink.co.uk>,
	<palmer@dabbelt.com>
CC: <paul.walmsley@sifive.com>, <Conor.Dooley@microchip.com>,
	<Daire.McNamara@microchip.com>
Subject: Re: [PATCH 1/1] gpio: mpfs - add polarfire soc gpio support
Thread-Topic: [PATCH 1/1] gpio: mpfs - add polarfire soc gpio support
Thread-Index: AQHYkHYQCAXtENkIrkiuOdPJtyNDq61xHnwAgAgDcQA=
Date: Mon, 11 Jul 2022 12:26:21 +0000
Message-ID: <a8f52555d18c677fda2aedf8acdbbb764132a1ed.camel@microchip.com>
References: <20220705134912.2740421-1-lewis.hanly@microchip.com>
	 <20220705134912.2740421-2-lewis.hanly@microchip.com>
	 <b916f508-aa9c-08df-f562-a0bd62163a95@codethink.co.uk>
In-Reply-To: <b916f508-aa9c-08df-f562-a0bd62163a95@codethink.co.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1f8b4a6d-b2f9-433a-a913-08da6338900d
x-ms-traffictypediagnostic: SN6PR11MB2926:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Jtf0CxEppnJWo+F9SrjoXTaAYQOXnpyQ/jzA8WLPZhreJusmnvhLqcdf+VS52L9hPVUjE3QqULkLMbfyjuwmUNhsFQq2ArSNeFibGyPct3Sa7mmF3DOWpsOxGLoMV0JF9wkKWo9YxkAFzuTDGx1z1PonuDHSEBqBSTrar2jZRyPwPM5Kq5bzI+WWvKsM74rOcIQfyqVC4bZh53DWxwZencuNjw+hvVoN/EUaaUfrNVONLJAffTnqtzRluVO8J8nlglVsPgtn8TGVD7pqoiofNk3QUvXjgSRnTkT9gRQ0gmBAK8Lotyk5OZ0zbIi6Ah71SuSnOHpsyY2VGy4OBJYt0J39BacbMFkM7cCAFD1uifuERW8FDEBmn5HrHP4u5CG6lteRAa1z4mWLS3MxNS+n0YM/4aKsr1DBVf7rFeZJSmr9L+OtBj0NPycUWIxAP0kSUKncYBWK9nNEkssbNiuP3PjGfUuCs6FbyoGVotl/0VCb8p5KXio0Ru94eIsbhODypezOtMdjiO98xcO1GQjKMfPS/pQQZb6Uha4UKqL+buVFYwD6UiCdbnq+pKx1HWPGmPWAA9lVjEBkH46XmAM4ZDXnyXfoe8VjGZqo60mMuExYsnDAQ5hIKHLfJnOG89T7I6K/A9nye7zYXa2CEan8jlfsHy9pW+Su/sNn1fTEIrfdGsQzJYTVZFH8GKhXsUE6GNNov2ar6LgKQtKF5Sr7Ry8AGApGYdFrbPnT9MQN4y0m8lZSHV4QTDX7i8nF6WI+Wb47kZOFqcD66EiPX+Q/mRCh4cpVx8kmYO0T+aqFAds6MMT8ildw8/RgVW60yQoH0pshCv8Vc2lkXYLvVMmVMSU1aB/XMD2i+TFX9cqsqvI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5925.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(39860400002)(346002)(396003)(376002)(366004)(54906003)(110136005)(316002)(41300700001)(966005)(478600001)(6486002)(6506007)(71200400001)(53546011)(2906002)(8936002)(64756008)(66946007)(66446008)(66556008)(66476007)(8676002)(76116006)(5660300002)(30864003)(91956017)(4326008)(36756003)(38070700005)(122000001)(26005)(6512007)(83380400001)(86362001)(107886003)(38100700002)(186003)(2616005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MGpteTlXdU9SOFRpZkUzZ2c3SjE1TnpJVXhJbXZtS1VEaWVCM1lZQ0pocFFm?=
 =?utf-8?B?dW02K1pPYkpEZHBIdzEyZ3pBMzZ6SkJJK2kwZDc1MU1TTFQzWGJwYmxTZXYz?=
 =?utf-8?B?NUw2WGs1UjR0WDg2K1pncnNxbXI3R1NSZmozQjIwYUFEbDVjTmZmZFNDVjk4?=
 =?utf-8?B?dk9XdllScFU4ZmtnR2FLVzhCY3JIOTBiNXZSZlRWU0JxM2syTHFoUC9RdDZy?=
 =?utf-8?B?QjdnUXAxL3A0eHQvdkloYzVkbTZBWGx4QmFuKzVDcmNWWmluTXErTFRnTHF1?=
 =?utf-8?B?a1dESm85V1JnaGFQTnhtRENwdkJSdzM4OHJIbE9mMUhObXBzZjZ1VE4rYm83?=
 =?utf-8?B?V2xmSkI5R01NMjdySEl1c3A2OTZVaXNXTysxL3dxaDIrRTVLa0Y3NW5HekUv?=
 =?utf-8?B?V0RaWEhVbWNVQStKNHdGYnozVGpoeDFzOHE4VjY0d2dxRzhYeW9DcTN0ZjFV?=
 =?utf-8?B?dm0zd09nYWlBeEVkbUlkRUFVVnkyUnhBRnhFT0R1MnVrL0FkTnl6WEpZY2xh?=
 =?utf-8?B?dzlHeVl1UzRmZ25QM0w1QUkwbE9oSzN6VXBvdEN2K3lXUVAxNUpWZ05WcnFr?=
 =?utf-8?B?dFZrcUlWMm1ycjN2dTdleTZWR2pnZCtTWEp3U2MxSXM0OXFKT01zY3I5ME1t?=
 =?utf-8?B?WU1JdHlQVFg2bzg1VUV3SUd2U3NVTUtpUzBwRVcyMStsY05SdzRxdWhHbnIx?=
 =?utf-8?B?eW9oY0c2LzlEVXBXLzJoOFNLbE94eVg3cE9mcVEzdHNsQzZGUnV0NVE4bTZB?=
 =?utf-8?B?UXVReEdhZjQ1VUVkSGpULzF4QzJkVzcrZkwrNG9RbWxFS0tkaS9kWkx2ZzMv?=
 =?utf-8?B?QzZ6NzN1eE1ESUpkM3pLT2JSeVNrRzU4QXJTT0NBSTY3dmRMSGd5aEgvcmpt?=
 =?utf-8?B?dzA2OEZoVkV2a1RjQVZUTkF2QnhkL0g4OE1OdzFZNmhBaERodGIycEcybVdy?=
 =?utf-8?B?TXIwcjRHLzB5TG00UkhDV1RWblh1MGgyUHdNNHVYUkN3VTRBU1BLMmhNbEtY?=
 =?utf-8?B?NVdDb0hNSjQ4bjVsa05ZbGFnRzJOWDV6OU5xT29hd0srUzY4QWwwWURUQ2dD?=
 =?utf-8?B?YlZUZkZTZXNibHVhWVpRWkxLR0lieFJDZHgwcDJzb0FwZ3JSRXY2STVLVU9u?=
 =?utf-8?B?aE11RHE0NWpTRUg2NlYxK2lsZUxNcktTbGx5MGRHYWpEcnN6MElZTXMyN0xt?=
 =?utf-8?B?NW1DajErR2d2YllJR2xCVlNzalk2clllQW85MEpNZm1JVXJKV3VrTkhZVUNp?=
 =?utf-8?B?aWZUTEJqdzZIdXE2NVhFRmpybGdjcHhDNGtTSDY2aFVBblB0d1EzcHh1SmEy?=
 =?utf-8?B?VkVNSFliV0lCTXZtRHcrNGM0UEJkcU1ORVptR0RqM2hhaGpYQ3JsdDVkQjVl?=
 =?utf-8?B?Q3JlaVk3NCtadzFBWDdJNlF5M2kvNVk3WDBoM2ozWEF1TGw3ZE1yQi9FcXRU?=
 =?utf-8?B?Q293b043dU1TaHBsaHlaTkNmSHRUcnJSN25QR3UwNEhYdG5qTkVVQW1ZYjdw?=
 =?utf-8?B?dmZHWEQxd2dVZVBMSzFoZzd2K1greXIwbTc2ektJbUVvV0p0NlkvSDlTMkZL?=
 =?utf-8?B?MDBiTFZRRTJhUVRiL1p0MVhVZTdCNUZWWGlMRU5RdGo2aVRoQW1GOG9SRVVu?=
 =?utf-8?B?YklJRlp2ZzBrWGpTRWtvaTJWV3FrdUN3Q2dZYzBkZnJZeGlqcTBUZUhOSTB3?=
 =?utf-8?B?Z0RhUVU5RStSaTFNK3hSNVRwMGtocy83amxUaXhyM2FPQlkxNU94T2JJQnow?=
 =?utf-8?B?WWlKZVRKTm5xL1NQQ3gxNGZ5VnNCWkdzMk1pTEJtaW1ZdE5GQ1Vselp5MWpV?=
 =?utf-8?B?MXRnRUtqOVBQMWlqUEEzWEN0WEZGRkx6S0ZEWnFXaytBYkx6M1lsSG5DS2hu?=
 =?utf-8?B?TTdjY0dyZzlJc0pXMEdTMzVSTzN4MUZneDZsbGp0cDV0WGZKU0IrYlAxU0hI?=
 =?utf-8?B?WFdKYTZ1NTlXc045VFdnaStuOUdNN2JrZy9EeUw2NTVXc0dzWUFpTXZ2R3hC?=
 =?utf-8?B?dGcwL3MwaFd5ZkJXTCtqOGlJeTdLTXlpWGN3TzBYMkRuV1oxUzNZTWdRbGY0?=
 =?utf-8?B?UUlFTHprRS9JSU10VGRGNGttcytGRk8rZHpxL09LdTlTdUVjd2I2N2s5QnB6?=
 =?utf-8?B?NGRYeXlTelNsMlhMNHVha0pJRGh1M2VHV3ZrN3JMNjVMVC8rTmNyVTZpa3Ru?=
 =?utf-8?B?UWc9PQ==?=
Content-ID: <1E0DBA9B62B6F84396A01B6D0CD759E9@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5925.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f8b4a6d-b2f9-433a-a913-08da6338900d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2022 12:26:21.2323
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qe5SccqsbAuqNikAo0aMieLoqoRGf+k5mO/rSmfaQ1edSudJuSoQlJQMa/67TV11nihntDoknx6deoOx2d0A6Id8m+FEGkORuyTqeOSHWdM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2926
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_052630_355205_3A0AE8A8 
X-CRM114-Status: GOOD (  26.46  )
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


Thanks Ben for feedback,working on next version with some of your
updates and also from Marc.

Regards,
Lewis

On Wed, 2022-07-06 at 11:03 +0100, Ben Dooks wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you
> know the content is safe
> 
> On 05/07/2022 14:49, lewis.hanly@microchip.com wrote:
> > From: Lewis Hanly <lewis.hanly@microchip.com>
> > 
> > Add a driver to support the Polarfire SoC gpio controller.
> > 
> > Signed-off-by: Lewis Hanly <lewis.hanly@microchip.com>
> > ---
> >   drivers/gpio/Kconfig     |   7 +
> >   drivers/gpio/Makefile    |   1 +
> >   drivers/gpio/gpio-mpfs.c | 358
> > +++++++++++++++++++++++++++++++++++++++
> >   3 files changed, 366 insertions(+)
> >   create mode 100644 drivers/gpio/gpio-mpfs.c
> > 
> 
> snip
> 
> > diff --git a/drivers/gpio/gpio-mpfs.c b/drivers/gpio/gpio-mpfs.c
> > new file mode 100644
> > index 000000000000..df48f2836e97
> > --- /dev/null
> > +++ b/drivers/gpio/gpio-mpfs.c
> > @@ -0,0 +1,358 @@
> > +// SPDX-License-Identifier: (GPL-2.0)
> > +/*
> > + * Microchip PolarFire SoC (MPFS) GPIO controller driver
> > + *
> > + * Copyright (c) 2018-2022 Microchip Technology Inc. and its
> > subsidiaries
> > + *
> > + * Author: Lewis Hanly <lewis.hanly@microchip.com>
> > + *
> > + */
> > +
> > +#include <linux/bitops.h>
> > +#include <linux/clk.h>
> > +#include <linux/device.h>
> > +#include <linux/errno.h>
> > +#include <linux/gpio/driver.h>
> > +#include <linux/init.h>
> > +#include <linux/irq.h>
> > +#include <linux/irqchip/chained_irq.h>
> > +#include <linux/of.h>
> > +#include <linux/of_irq.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/spinlock.h>
> > +
> > +#define NUM_GPIO                     32
> > +#define BYTE_BOUNDARY                        0x04
> > +#define MPFS_GPIO_EN_INT             3
> > +#define MPFS_GPIO_EN_OUT_BUF         BIT(2)
> > +#define MPFS_GPIO_EN_IN                      BIT(1)
> > +#define MPFS_GPIO_EN_OUT             BIT(0)
> > +
> > +#define MPFS_GPIO_TYPE_INT_EDGE_BOTH 0x80
> > +#define MPFS_GPIO_TYPE_INT_EDGE_NEG  0x60
> > +#define MPFS_GPIO_TYPE_INT_EDGE_POS  0x40
> > +#define MPFS_GPIO_TYPE_INT_LEVEL_LOW 0x20
> > +#define MPFS_GPIO_TYPE_INT_LEVEL_HIGH        0x00
> > +#define MPFS_GPIO_TYPE_INT_MASK              GENMASK(7, 5)
> > +#define MPFS_IRQ_REG                 0x80
> > +#define MPFS_INP_REG                 0x84
> > +#define MPFS_OUTP_REG                        0x88
> > +
> > +struct mpfs_gpio_chip {
> > +     void __iomem *base;
> > +     struct clk *clk;
> > +     spinlock_t lock; /* lock */
> > +     struct gpio_chip gc;
> > +};
> > +
> > +static void mpfs_gpio_assign_bit(void __iomem *addr, unsigned int
> > bit_offset, int value)
> > +{
> > +     u32 output = readl(addr);
> > +
> > +     if (value)
> > +             output |= BIT(bit_offset);
> > +     else
> > +             output &= ~BIT(bit_offset);
> > +
> > +     writel(output, addr);
> > +}
> > +
> > +static int mpfs_gpio_direction_input(struct gpio_chip *gc,
> > unsigned int gpio_index)
> > +{
> > +     struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
> > +     u32 gpio_cfg;
> > +     unsigned long flags;
> > +
> > +     if (gpio_index >= NUM_GPIO)
> > +             return -EINVAL;
> 
> 
> > +     spin_lock_irqsave(&mpfs_gpio->lock, flags);
> > +
> > +     gpio_cfg = readl(mpfs_gpio->base + (gpio_index *
> > BYTE_BOUNDARY));
> > +     gpio_cfg |= MPFS_GPIO_EN_IN;
> > +     gpio_cfg &= ~(MPFS_GPIO_EN_OUT | MPFS_GPIO_EN_OUT_BUF);
> > +     writel(gpio_cfg, mpfs_gpio->base + (gpio_index *
> > BYTE_BOUNDARY));
> > +
> > +     spin_unlock_irqrestore(&mpfs_gpio->lock, flags);
> > +
> > +     return 0;
> > +}
> > +
> > +static int mpfs_gpio_direction_output(struct gpio_chip *gc,
> > unsigned int gpio_index, int value)
> > +{
> > +     struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
> > +     u32 gpio_cfg;
> > +     unsigned long flags;
> > +
> > +     if (gpio_index >= NUM_GPIO)
> > +             return -EINVAL;
> 
> Is this necessary, shouldn't gpio layer have checked this already?
No, removing all instances.
> 
> > +     spin_lock_irqsave(&mpfs_gpio->lock, flags);
> > +
> > +     gpio_cfg = readl(mpfs_gpio->base + (gpio_index *
> > BYTE_BOUNDARY));
> > +     gpio_cfg |= MPFS_GPIO_EN_OUT | MPFS_GPIO_EN_OUT_BUF;
> > +     gpio_cfg &= ~MPFS_GPIO_EN_IN;
> > +     writel(gpio_cfg, mpfs_gpio->base + (gpio_index *
> > BYTE_BOUNDARY));
> > +
> > +     mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_OUTP_REG,
> > gpio_index, value);
> > +
> > +     spin_unlock_irqrestore(&mpfs_gpio->lock, flags);
> > +
> > +     return 0;
> > +}
> > +
> > +static int mpfs_gpio_get_direction(struct gpio_chip *gc,
> > +                                unsigned int gpio_index)
> > +{
> > +     struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
> > +     u32 gpio_cfg;
> > +
> > +     if (gpio_index >= NUM_GPIO)
> > +             return -EINVAL;
> 
> Is this necessary, shouldn't gpio layer have checked this already?
> 
> > +     gpio_cfg = readl(mpfs_gpio->base + (gpio_index *
> > BYTE_BOUNDARY));
> > +
> > +     if (gpio_cfg & MPFS_GPIO_EN_IN)
> > +             return 1;
> > +
> > +     return 0;
> > +}
> > +
> > +static int mpfs_gpio_get(struct gpio_chip *gc,
> > +                      unsigned int gpio_index)
> > +{
> > +     struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
> > +
> > +     if (gpio_index >= NUM_GPIO)
> > +             return -EINVAL;
> 
> Is this necessary, shouldn't gpio layer have checked this already?
> 
> > +     return !!(readl(mpfs_gpio->base + MPFS_INP_REG) &
> > BIT(gpio_index));
> > +}
> > +
> > +static void mpfs_gpio_set(struct gpio_chip *gc, unsigned int
> > gpio_index, int value)
> > +{
> > +     struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
> > +     unsigned long flags;
> > +
> > +     if (gpio_index >= NUM_GPIO)
> > +             return;
> 
> Is this necessary, shouldn't gpio layer have checked this already?
> 
> > +     spin_lock_irqsave(&mpfs_gpio->lock, flags);
> > +
> > +     mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_OUTP_REG,
> > +                          gpio_index, value);
> > +
> > +     spin_unlock_irqrestore(&mpfs_gpio->lock, flags);
> > +}
> > +
> > +static int mpfs_gpio_irq_set_type(struct irq_data *data, unsigned
> > int type)
> > +{
> > +     struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
> > +     int gpio_index = irqd_to_hwirq(data);
> > +     u32 interrupt_type;
> > +     struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
> > +     u32 gpio_cfg;
> > +     unsigned long flags;
> > +
> > +     if (gpio_index >= NUM_GPIO)
> > +             return -EINVAL;
> > 
> 
> Is this necessary, shouldn't gpio layer have checked this already?
> 
> > +     switch (type) {
> > +     case IRQ_TYPE_EDGE_BOTH:
> > +             interrupt_type = MPFS_GPIO_TYPE_INT_EDGE_BOTH;
> > +             break;
> > +
> > +     case IRQ_TYPE_EDGE_FALLING:
> > +             interrupt_type = MPFS_GPIO_TYPE_INT_EDGE_NEG;
> > +             break;
> > +
> > +     case IRQ_TYPE_EDGE_RISING:
> > +             interrupt_type = MPFS_GPIO_TYPE_INT_EDGE_POS;
> > +             break;
> > +
> > +     case IRQ_TYPE_LEVEL_HIGH:
> > +             interrupt_type = MPFS_GPIO_TYPE_INT_LEVEL_HIGH;
> > +             break;
> > +
> > +     case IRQ_TYPE_LEVEL_LOW:
> > +     default:
> > +             interrupt_type = MPFS_GPIO_TYPE_INT_LEVEL_LOW;
> > +             break;
> > +     }
> > +
> > +     spin_lock_irqsave(&mpfs_gpio->lock, flags);
> > +
> > +     gpio_cfg = readl(mpfs_gpio->base + (gpio_index *
> > BYTE_BOUNDARY));
> > +     gpio_cfg &= ~MPFS_GPIO_TYPE_INT_MASK;
> > +     gpio_cfg |= interrupt_type;
> > +     writel(gpio_cfg, mpfs_gpio->base + (gpio_index *
> > BYTE_BOUNDARY));
> > +
> > +     spin_unlock_irqrestore(&mpfs_gpio->lock, flags);
> > +
> > +     return 0;
> > +}
> > +
> > +static void mpfs_gpio_irq_enable(struct irq_data *data)
> > +{
> > +     struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
> > +     struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
> > +     int gpio_index = irqd_to_hwirq(data) % NUM_GPIO;
> > +
> > +     mpfs_gpio_direction_input(gc, gpio_index);
> > +     mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_IRQ_REG,
> > gpio_index, 1);
> > +     mpfs_gpio_assign_bit(mpfs_gpio->base + (gpio_index *
> > BYTE_BOUNDARY),
> > +                          MPFS_GPIO_EN_INT, 1);
> > +}
> > +
> > +static void mpfs_gpio_irq_disable(struct irq_data *data)
> > +{
> > +     struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
> > +     struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
> > +     int gpio_index = irqd_to_hwirq(data) % NUM_GPIO;
> > +
> > +     mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_IRQ_REG,
> > gpio_index, 1);
> > +     mpfs_gpio_assign_bit(mpfs_gpio->base + (gpio_index *
> > BYTE_BOUNDARY),
> > +                          MPFS_GPIO_EN_INT, 0);
> > +}
> > +
> > +static struct irq_chip mpfs_gpio_irqchip = {
> > +     .name = "mpfs_gpio_irqchip",
> > +     .irq_set_type = mpfs_gpio_irq_set_type,
> > +     .irq_enable = mpfs_gpio_irq_enable,
> > +     .irq_disable = mpfs_gpio_irq_disable,
> > +     .flags = IRQCHIP_MASK_ON_SUSPEND,
> > +};
> > +
> > +static irqreturn_t mpfs_gpio_irq_handler(int irq, void
> > *mpfs_gpio_data)
> > +{
> > +     struct mpfs_gpio_chip *mpfs_gpio = mpfs_gpio_data;
> > +     unsigned long status;
> > +     int offset;
> > +
> > +     status = readl(mpfs_gpio->base + MPFS_IRQ_REG);
> > +
> > +     for_each_set_bit(offset, &status, mpfs_gpio->gc.ngpio) {
> > +             mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_IRQ_REG,
> > offset, 1);
> > +             generic_handle_irq(irq_find_mapping(mpfs_gpio-
> > >gc.irq.domain, offset));
> > +     }
> > +     return IRQ_HANDLED;
> > +}
> > +
> > +static int mpfs_gpio_probe(struct platform_device *pdev)
> > +{
> > +     struct clk *clk;
> > +     struct device *dev = &pdev->dev;
> > +     struct device_node *node = pdev->dev.of_node;
> > +     struct mpfs_gpio_chip *mpfs_gpio;
> > +     int i, ret, ngpio;
> > +     struct gpio_irq_chip *irq_c;
> > +
> > +     mpfs_gpio = devm_kzalloc(dev, sizeof(*mpfs_gpio),
> > GFP_KERNEL);
> > +     if (!mpfs_gpio)
> > +             return -ENOMEM;
> > +
> > +     mpfs_gpio->base = devm_platform_ioremap_resource(pdev, 0);
> > +     if (IS_ERR(mpfs_gpio->base)) {
> > +             dev_err(dev, "failed to allocate device memory\n");
> > +             return PTR_ERR(mpfs_gpio->base);
> > +     }
> 
> seems to be a mix of dev_err and dev_err_probe() in here?
will update to to use only dev_err_probe
> 
> > +     clk = devm_clk_get(&pdev->dev, NULL);
> > +     if (IS_ERR(clk))
> > +             return dev_err_probe(&pdev->dev, PTR_ERR(clk),
> > "failed to get clock\n");
> > +
> > +     ret = clk_prepare_enable(clk);
> > +     if (ret)
> > +             return dev_err_probe(&pdev->dev, ret, "failed to
> > enable clock\n");
> > +
> > +     mpfs_gpio->clk = clk;
> > +
> > +     spin_lock_init(&mpfs_gpio->lock);
> > +
> > +     ngpio = of_irq_count(node);
> > +     if (ngpio > NUM_GPIO) {
> > +             dev_err(dev, "too many interrupts\n");
> > +             goto cleanup_clock;
> > +     }
> > +
> > +     mpfs_gpio->gc.direction_input = mpfs_gpio_direction_input;
> > +     mpfs_gpio->gc.direction_output = mpfs_gpio_direction_output;
> > +     mpfs_gpio->gc.get_direction = mpfs_gpio_get_direction;
> > +     mpfs_gpio->gc.get = mpfs_gpio_get;
> > +     mpfs_gpio->gc.set = mpfs_gpio_set;
> > +     mpfs_gpio->gc.base = -1;
> > +     mpfs_gpio->gc.ngpio = ngpio;
> > +     mpfs_gpio->gc.label = dev_name(dev);
> > +     mpfs_gpio->gc.parent = dev;
> > +     mpfs_gpio->gc.owner = THIS_MODULE;
> > +
> > +     irq_c = &mpfs_gpio->gc.irq;
> > +     irq_c->chip = &mpfs_gpio_irqchip;
> > +     irq_c->chip->parent_device = dev;
> > +     irq_c->handler = handle_simple_irq;
> > +
> > +     ret = devm_irq_alloc_descs(&pdev->dev, -1, 0, ngpio, 0);
> > +     if (ret < 0) {
> > +             dev_err(dev, "failed to allocate descs\n");
> > +             goto cleanup_clock;
> > +     }
> > +
> > +     /*
> > +      * Setup the interrupt handlers. Interrupts can be
> > +      * direct and/or non-direct mode, based on register value:
> > +      * GPIO_INTERRUPT_FAB_CR.
> > +      */
> > +     for (i = 0; i < ngpio; i++) {
> > +             int irq = platform_get_irq_optional(pdev, i);
> > +
> > +             if (irq < 0)
> > +                     continue;
> > +
> > +             ret = devm_request_irq(&pdev->dev, irq,
> > +                                    mpfs_gpio_irq_handler,
> > +                                    IRQF_SHARED, mpfs_gpio-
> > >gc.label, mpfs_gpio);
> > +             if (ret) {
> > +                     dev_err(&pdev->dev, "failed to request irq
> > %d: %d\n",
> > +                             irq, ret);
> > +                     goto cleanup_clock;
> > +             }
> > +     }
> > +
> > +     ret = gpiochip_add_data(&mpfs_gpio->gc, mpfs_gpio);
> > +     if (ret)
> > +             goto cleanup_clock;
> > +
> > +     platform_set_drvdata(pdev, mpfs_gpio);
> > +     dev_info(dev, "Microchip MPFS GPIO registered %d GPIOs\n",
> > ngpio);
> > +
> > +     return 0;
> > +
> > +cleanup_clock:
> > +     clk_disable_unprepare(mpfs_gpio->clk);
> > +     return ret;
> > +}
> 
> do you need to deal with EPROBEDEFER in the above probe?
> 
> > +
> > +static int mpfs_gpio_remove(struct platform_device *pdev)
> > +{
> > +     struct mpfs_gpio_chip *mpfs_gpio =
> > platform_get_drvdata(pdev);
> > +
> > +     gpiochip_remove(&mpfs_gpio->gc);
> > +     clk_disable_unprepare(mpfs_gpio->clk);
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct of_device_id mpfs_gpio_match[] = {
> > +     { .compatible = "microchip,mpfs-gpio", },
> > +     { /* end of list */ },
> > +};
> > +
> > +static struct platform_driver mpfs_gpio_driver = {
> > +     .probe = mpfs_gpio_probe,
> > +     .driver = {
> > +             .name = "microchip,mpfs-gpio",
> > +             .of_match_table = of_match_ptr(mpfs_gpio_match),
> > +     },
> > +     .remove = mpfs_gpio_remove,
> > +};
> > +
> > +builtin_platform_driver(mpfs_gpio_driver);
> 
> MODULE_AUTHOR and associated info could do with being at the bottom.

It's not a module, author info at top of file.

> 
> --
> Ben Dooks                               http://www.codethink.co.uk/
> Senior Engineer                         Codethink - Providing Genius
> 
> https://www.codethink.co.uk/privacy.html
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
