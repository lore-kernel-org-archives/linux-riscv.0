Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26BCEC43334
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jun 2022 15:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kG+/xTuvtNRLbPbS5+38MRHE+1V0wJRcDBEtnvgUuVk=; b=BzzWOwUMkkaM5r
	l5WpWCfyvBo7Egcvu68J7y8/n5tf/QISRKjwm7jCgDqkBhHhTFYen6WzIn/wtNDUN1PnZzVWbAByY
	2reahYjRq//xbF+Si612V8hqA55GIy0NLdUl7E6X7v1fCw4+EE+9vp7wWA4cDSkXLYKAemCeRAvsW
	jQmnF/Hf+CQYRuu1AmXRtkRbtGF1LiCi0jjmBQyvdTeyGhEKv3DdN9UzeTBU3AmJBab+I+3W47b0p
	rRJy8afpUFJNKtRde+xNWTJcQ7i0lTmnlqtCRruzACZRwDPfehMi5faLYUixpcPrgC6ql7Em+fRrr
	Eg+J0NjmybJVCcJMVuZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3fno-006ADm-Mc; Tue, 21 Jun 2022 15:28:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3fnk-006ABM-KM
	for linux-riscv@lists.infradead.org; Tue, 21 Jun 2022 15:28:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1655825304; x=1687361304;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=gBf0LqQowmHbqndEtyfr0waTAdzyPbEs2AQBRT64W14=;
  b=w3xB6kvRId/UhxjgV+YmRJfkJMzi70sCcugf4xIiCS26gNTQiD3Lywrt
   g7ieFqAv4l0iq29/ilwh1ER0LnICph5DCIJYwhxUIo0R0of3yMH4Ho1g0
   PUpYkYzJLxqAHaH7+ZdA+xAeIIaF4BzkEY2HxVNzapeNwPehRvgo6AzmR
   YiAKEIqTMTYl60rZviCi1SfIlGr+fjd+eqhodlXCFu6csxp9dPkmkRiCI
   t3/kgowfssEn0qun9p2iaRUgQ8CegSJRzOVGejYjgTv+Q5Urx5J2RTCV+
   QRrIselHUwcg41GW2i3MP2JZHWw5YKKcNz4PJM6bwUAqj52xP7kc/vrfo
   g==;
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; 
   d="scan'208";a="178890249"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Jun 2022 08:28:20 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 21 Jun 2022 08:28:20 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Tue, 21 Jun 2022 08:28:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dS9b3dimkETi0d7O7DemGfi2twyLc/QZiI94SQGyi0j9G7NopPyVx31ZZFYVaNzFc+Ec9+g/05oCDXrPVPgILpw8SQhZ6Eor6zdq6WENiB+kCmoPw0Xt67RwzyBOYPvRn0pUMF8lOaXyS8L8x25JYrSUuqEEIumcBpUoqvEvPp2UuRnlWG/MkRqxup+zOpyvWAdVKmUZbKLHp1+/RJiwIlGQR8My4+nnQk01jJ82YfQ84TxCbRVMQRA/4jkuairQj0Nuv/WWOz9zPNImPRXclgcLFM4D4Ao0m8XT6yLGTIjIQux0X6X1Fvjp1bFlMAblyXXJrTbMaj6aiy6x0GtGQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gBf0LqQowmHbqndEtyfr0waTAdzyPbEs2AQBRT64W14=;
 b=FPuuJZxsupyW8E4ew5Z/3gCFelZb6AAgQNMckHdn/R4QxZp0fCVthNIR8dQ7T0aZYVxsxmb8at2fwIKpN10yI0IeU7ELkM0bILjV6mDdDho2B88qxgYWXucUDI/0j3xt5dEmdS6Rk9Zl48oqnD2xUdN26rRV34UxkairMz71zh3AdZoBowdyp1x1moTPWWFDK87m8kiPvj2rgGdyMbQpv4ZK1miVtEOzLgEGx8aOAdT0HGCqS/SAl/DP4Pi/nZJHVf2A+5tJNo1gT051onVrDsAqDuMN9bA+pnCnXlQGbDGcl0aX6N64dnXeRxbcGmtIyGKfifxRvCt6oqqWwg6+Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gBf0LqQowmHbqndEtyfr0waTAdzyPbEs2AQBRT64W14=;
 b=EITnqaJ9LSbUA1T4GGHNhbnTiMLP/jGWtu/acR02CpksFpMG7RZD02Kq7o+nf2u9JVDEEqSYQu7qLzi+IJWl5jm2IS5xwN7ZsoALZr1TW+FKG9lNObWlGpsUH6QuFKIns227A7QkiLUujZMWo1WcgMsQuaZT+RdJsxpHUFm4HlQ=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CY4PR11MB2037.namprd11.prod.outlook.com (2603:10b6:903:2f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Tue, 21 Jun
 2022 15:28:12 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5353.022; Tue, 21 Jun 2022
 15:28:12 +0000
From: <Conor.Dooley@microchip.com>
To: <gregkh@linuxfoundation.org>
CC: <b-liu@ti.com>, <Daire.McNamara@microchip.com>,
	<Valentina.FernandezAlanis@microchip.com>, <linux-kernel@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<ben.dooks@codethink.co.uk>, <heinrich.schuchardt@canonical.com>,
	<Nicolas.Ferre@microchip.com>, <Cristian.Birsan@microchip.com>
Subject: Re: [PATCH v2 0/2] Add support for PolarFire SoC's musb controller
Thread-Topic: [PATCH v2 0/2] Add support for PolarFire SoC's musb controller
Thread-Index: AQHYfxuMNjzv9qrP8E6NLA6/7ruhLa1Z+lWAgAALTQCAAAMwAA==
Date: Tue, 21 Jun 2022 15:28:12 +0000
Message-ID: <ebeed0db-eb78-7f77-f4d8-93c7c7caab24@microchip.com>
References: <20220613114642.1615292-1-conor.dooley@microchip.com>
 <YrHXZYe4e4vlCHh3@kroah.com>
 <6c9001fa-5315-c9f4-b7b9-05248635750d@microchip.com>
In-Reply-To: <6c9001fa-5315-c9f4-b7b9-05248635750d@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d5c2a207-b7fd-42f1-323c-08da539aa7a0
x-ms-traffictypediagnostic: CY4PR11MB2037:EE_
x-microsoft-antispam-prvs: <CY4PR11MB2037BFEADB23EA170D89655A98B39@CY4PR11MB2037.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rNfb9pzylr80k0p3kmtUX3EuZCqob9oeC/rjRL/ddM1yM0BfoyQ4diCr7j1xACEiYFoF7jNb+yPehGife3AjexNqiZAVxXiiYkzt/T50F6qpSs7fDDNrO8RUV2pXQ+pGHZNDomqdUiJBr0aQlV9ByTMYsvcf9QpCDeFEVAwMmy2Lcq0LR9k+vCEpPcQWBVjPYkHCuPKy2LWfWfK1myMOJCao5APxn07B7U6JnstoBIGBTasuDOmzwTtFXxd2RLgI3w+rjOcZQmVDi/SYdtLmnUEGcpC2h6M+6AzYyErvN2cLZBaXJZBzfuLYVffzeRG9O9mEo7/npSD+JfCkPtxj0/RTdwVdjrA35AulgTQymhNonR33wZYg/PNp0XbNj0S9JLcapuC1diSyzjnnvscLDdIDbetXjVbeQhbPQO0m9wRHWJHzIb209ajJraL0UFH+J5Iw6AQRHSorO2FuSDn/ELBLfuvoYfucsfzfLnR02o2L4sVPWinB82nvtXxw3isDTKAzJh300kUmkTYSF3D0sb90js916xnKJpMVc1cSPuJrD1Opk7gpcoggLon4yKgkPQz8LQ4EKNPfZomfDbjFzU6b0/mcGQ5+cdbEKkPttfIJYTt1gQ2doO09evn/C16xHKGseOWR50g/xZ86+9Qxqr6my6gus/I1scPJ3a5dMx3TSAX8/ikRogNct69PJrDT6jXJrA8aoFWdEyUMLzp4ypDJXIHj3jAuB1Slf7joETPXUzabQJlNSTfKMdkKa69mXRaRnXiz+VDSXuFvMbo13g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(366004)(376002)(396003)(346002)(136003)(186003)(83380400001)(38070700005)(122000001)(86362001)(31696002)(38100700002)(6486002)(71200400001)(558084003)(5660300002)(2906002)(31686004)(478600001)(76116006)(54906003)(6916009)(66946007)(91956017)(316002)(6506007)(8936002)(66476007)(66446008)(66556008)(64756008)(107886003)(4326008)(8676002)(26005)(53546011)(6512007)(2616005)(41300700001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V3N6VUZ6a0hFQ0R5NHpaWUhWdm80WVdLR1VDS1k1S2IyMXFTZlA3S2d1NThK?=
 =?utf-8?B?K1ZSVjJoQVpqOUJYaXZacGJSNkliRC9DcGxnelVQWWRnRWpzSWhaYmx6d3ls?=
 =?utf-8?B?THgrS1liS2IzdXMwV08vT0hBWXpLaWlYWHJoV2I3TSt6dFh6QlZyL1pBbDQ1?=
 =?utf-8?B?OUdMS2xqUW5VNWNtZUxGZVQrdzQrOFRYRzE1OFprTVV1OU9rUXFBR3RhRElR?=
 =?utf-8?B?L3RrUE1vN2VrVzBobVhXdkt0ZTY3Wmwrc3Vyd3doN2FuM2tvR0hlVG1palNn?=
 =?utf-8?B?Q3UrRytYN1c0M24zVUV4dTRqc0psem9EekdFcnBjYkFEaEYrV3g5Ym05bERx?=
 =?utf-8?B?WjBsVW1YbWtmTzVnK2ZWeS9jVTMvSTJJWldTZzRkTS9PWDRUWGFVVmhhai9q?=
 =?utf-8?B?M2dkMHJTRkhHSWNEbDdRVU9qN2JzZHFOTnJTNDZNU3kyQS9va09XZlVVVlMy?=
 =?utf-8?B?WDhZL0l5Z056d05CdUh5SGFXRHQ1VWFPVitvWVlGVW1rTGQ2RGYyYW1aQU5w?=
 =?utf-8?B?VnZNT1NWOExpd3IxTHQxVkFLcVBWeVpVdjRpTjdBUnFRTmwvbWFvWmhQbXZY?=
 =?utf-8?B?dll0UXlHYzhLcW5KU09NRnRWcnppYnJBeE9QOUlCcHhlVG1iZnlscUd0Sysz?=
 =?utf-8?B?ZDFWeTRLMnhiTGZmWTVWdTdMS2hJRTZKdlBCTDhRYTYzMzNlSXdyUkdxTi9V?=
 =?utf-8?B?emNVMGxZc3M0dXE3VURqclNpYkgwelhyTFRkNWZpMmM1ZVJOUmo3eVdDZE9z?=
 =?utf-8?B?N0ZQU0w0TThMaDl2SGhIeFNaUEtjY2lNbWdQdHNpbTZVcmg5MHhWdjhxelZn?=
 =?utf-8?B?Rmx0c2xUSXU5aUZxWDR3emZHcDJRbGtBUHBZZHBSbEZTZk1UYzFKbWxRL3Nq?=
 =?utf-8?B?YUdGeTBiZnhXWVVQdHR3Zkh6STVMV2dEWjFSQW1QTU5vSU0rTHRCOTkwTzNv?=
 =?utf-8?B?a0FxVE53WVZ3WjdUVk5sKzhmeWl6aDE3bTd3ait4V1gydnV6RHpjSkV2d2xG?=
 =?utf-8?B?Q0d0THN5Y09ZZkE2ME1vV3lHazRqVUxTM0llOWcwcG5YYng1eDhSNVJHR0JC?=
 =?utf-8?B?dTh6NzdxOVZ1QjZuQnhqRHNZcVpPWVNqUHp3QlgzSk9COTB1MmFwVE8yQzFH?=
 =?utf-8?B?Q0U5MTRvRjFmNHZXMmdWd1Qycnd3N3U1SHdQVENPUUpEQm1FaUtBbkFhQUxN?=
 =?utf-8?B?UDRlWkhVck1VandLY01RdHp0R2tQdEpsOXp0aWNXYVJUMDdhT1hjWXh0eEJW?=
 =?utf-8?B?OFpPcXVzaWYzcFFmT21FTGZTNE9LRnVsQ25vazl5ZUQrZ0dnZ1orQ3ppdnpk?=
 =?utf-8?B?a2VWSkREYjl5MnF1TEo4ZFNLVjcvcUExZCtMNUllNVd6NTVQbXJROUkxSWFZ?=
 =?utf-8?B?S1luUWE1K3VFb1MrVWwyL0txNVM5aHo1eFJwWDFEM2VPWnVHbU9oWFA5VHQ3?=
 =?utf-8?B?Zy9PVnJNMkx6eFRRMUVnUDhaQjBOK2U3VUtqandOUkI5ZmptQ2ZXSUpOOHFB?=
 =?utf-8?B?dzFCdjlIWHRrcVNSN0pMQnllenladm1jU1pGWmw5MVhTM1RIYlk2Y3FOVmlG?=
 =?utf-8?B?UEV4ekg2eDBKTXYwTDVQMm1jZ0dyTnAwbWZDekZ0WDMrdG9IY09UR3ZRZllW?=
 =?utf-8?B?a3ZhTWswRnp2TG9Jdy9LbDVWOXhEeDJRZmJXRXE2WXlPWXJ3ZzFGM1NrcVJD?=
 =?utf-8?B?ZVNhZlYrVVdWU05SL0xRbDlwRGVJZ3pLWGdrdytKY3dmRW1RdC9pcmdaTmlj?=
 =?utf-8?B?dDZEN1ZzdmJybWxqbkYyS2sydmswTTNoZ0ZuWDREczZFQ3cwZVY1anBueHIz?=
 =?utf-8?B?ZWI1aUl4MVpHaE1oaGxvdFdHb1Q1YlhCd2VQY1VUcWpTZC9rWFZXdUVEVjE0?=
 =?utf-8?B?eEQ1OGpyRy9Ed3RlWXV0N3piZy95YkpsaGNwTHVHVW1qWUpRcjJxdHNwdktC?=
 =?utf-8?B?a2NtamtOenNOOU9rbkNnQ0xmWmszLyt6aG80SGZudWJWOW5pNEZPRWlhOGt6?=
 =?utf-8?B?OEVUb0dHV0hrOWZkenRwb1VwZ1FGS3VmR0tISllMbTgzQ1dEN2Y4dXltRS9o?=
 =?utf-8?B?N3h2a3pGdG0wMERLRWNiRzA2alp6K3R5WlEwMHMrYXdaNEFmY3dWaytENUVY?=
 =?utf-8?B?R0ptaU9VZUt2ek1uUng4R29zcXBCTXFhY3QwRFZFQk0xbFVSUkNCQTRVcnVD?=
 =?utf-8?B?cDR0TGlCcHM3WU5yMGVnRzJ3SFVBUTl0L3ZBa25UWU5qa0ZEWkkrMmt6M1FI?=
 =?utf-8?B?QjhRWXczUE9ROXVnVWVPQWV2ajJuTDFWWnlLd2lDdjVGbUpBM0RBR0NNY09R?=
 =?utf-8?B?RlpLTkpEL0dTQkJreWdpdnJtdzhUL1M2MGQvbHZOS1JUTHFGTytwQ3NqWklD?=
 =?utf-8?Q?IPNvV17pW9fGI3oE=3D?=
Content-ID: <8D8C05E373096348AC9FFD81064629EB@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5c2a207-b7fd-42f1-323c-08da539aa7a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2022 15:28:12.8396
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F5djYuEQgJhy+SuF6i6I3h38ubrOOn6o+CwX4yLfCdeICRe8sI+wMh/CiDX6JUZtIMIgmM4P6wr8vLCuyVDxaw29TWIUN99CZKtflTSV4Ao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB2037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_082824_734179_EF2DADB8 
X-CRM114-Status: UNSURE (   9.09  )
X-CRM114-Notice: Please train this message.
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

On 21/06/2022 16:16, Conor Dooley - M52691 wrote:
> 
> 
> I can resend from an account that does pass DKIM if you like...

nvm, I see you've applied it.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
