Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD16C00140
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Aug 2022 11:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ztGvnF7cxxZzmJJMDB9adtoZnMLLeHmPRWvczMNOoc=; b=UTZgLBeRF4lZfI
	Y4yY2mGH3mnMpQWhv7OQCwXgyq8Qg6+I4or7Ng5Lfno2VrcMmVk7bBVKSYmu/vtd4kxZ/JbJoFurT
	KLoynA5+GZcEVDL6qINTkYFYt95CBQGjj8ME/K3cXXG/nvPYeiNyWvCRlRWdrIEBX+E7ZI6SxXlrf
	NOdL0orLrDpGYwOnq6KlGh1WI4a0Bm5ujJZiO8VPvi/gGLggvV4ifaBkAOiiPPhNXflG8seY68ucQ
	EKN9+SmejhbvvlK3FS8j7ZnfcUs+/3RPDxLRgIogEhNUtEkBsvAj4UaIT2CDphjst92Hr1Bgy/fvn
	nb8929qVd3Vt5OYypRPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPjNu-009rhN-JF; Sun, 21 Aug 2022 11:44:54 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPjNo-009rb9-6c
	for linux-riscv@lists.infradead.org; Sun, 21 Aug 2022 11:44:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661082289; x=1692618289;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ptSmfmAjpOjmhk6urfUevRkoqWFR951N4zJqMo86Ifg=;
  b=Zwcbyfbcjk2raKSkhcHkcUyt4iNjOilNWxP+mAfhqcTXWTMdac+0fBTt
   XBFEES1/Hy7SJ9vH/+MXwWwUC4BtcB6qpgXv81rAK7QBDk3/yxKqOZw3b
   MMNRDDzE28IArqLvIcjUn2lxeRZ/YCBxesg6xicwOSqtJX7xHvqKIC8lC
   c5SPZ5ViM/7g3xgeUOedwXzT8p81xmd8D/abks2rXGZW1IuTSafp7ZSYr
   ezQljQlVqcz8rFtNl1OP39vmYRucSn9zFUz/8ogSBk2U6EzcKPUAVALal
   c/AUdZgXyKDW7jcsbJK1kOgUgXTi0g+vaZ2Aj5XAcby95chgUHDA0ztIm
   g==;
X-IronPort-AV: E=Sophos;i="5.93,252,1654585200"; 
   d="scan'208";a="170214560"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Aug 2022 04:44:46 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Sun, 21 Aug 2022 04:44:44 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Sun, 21 Aug 2022 04:44:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mz5vt9ZgZx9nX4MW/Qp713Tio30MPtShGVMUAQBdDC1VNWKnl/xqRuxdj9/jglAyVtncWxspMrYbnZUErY0LbL9Of8JC6R112miPd48JKlylaFD0Ku6Z6W4NXELL1XKF+6jxMwu/t1JUREBcUFxGbqNnMD22grN5ni10fmOUQPsEHk5EWLv+tp9UK5uo73+FSBYGAQWvMJg4XKCAWwluMXVxH+esxgu4uFoNGXTEBRzAphGj3RasORKmdkWxoKcrW3uGBAMcvofYUGZGOpzKcU6C0Tyik7t4dvRfG9niCOqAz96su7mex5xxveXzeUTN5adCxSHMMcKoC4TR7cOf2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ptSmfmAjpOjmhk6urfUevRkoqWFR951N4zJqMo86Ifg=;
 b=EojxIIx/DdgzU+ftbqvcXw4tcaO5KwXK7dwU4ppUDrDucUfdN4Tiac8RADphWLIuPVdoPiwNcYjmczHj09++XuhE2dqf+0/hpW4VTdVXpsrduzz5FZk5L5Dzp4dPrK7rTI9o0BaVxT1+RO/P33n/ui8vQprL+x5mgFb+hp/98KJ+LbFIjJM0il3Jm6jLt+SFj5cGgYPXYmPRBm56earUZbA6EUmhj0z4D0NQMfy29LJ9EoqpV8uKEYSmAOtZ4T/eb7Y+Y3JIAZvCVtFhJQocU1+tN5WL81ucOJj8x3aXPOY6tW6EVOS2dOOBBpMERw1+a37XPu89VX1YOXUaJsAvxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ptSmfmAjpOjmhk6urfUevRkoqWFR951N4zJqMo86Ifg=;
 b=ZeH1EJMqkjGQrr6J4KmOIt7OgQztnz51IcYvo5sro8Hf6ELvUtbb4XXiWONFFjDLkEwloGMv9ZjyVklGi6Tdu/7kPOJfWbvNOEJN/HNEUPQYte/m5ZyKTLIewdOzi/ILUsp2SpJzDBmAMZQZUo2jZdJxjHzIVnLW5r/nSJAwOos=
Received: from MWHPR11MB2032.namprd11.prod.outlook.com (2603:10b6:300:2b::13)
 by BYAPR11MB2855.namprd11.prod.outlook.com (2603:10b6:a02:ca::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Sun, 21 Aug
 2022 11:44:42 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by MWHPR11MB2032.namprd11.prod.outlook.com (2603:10b6:300:2b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.19; Sun, 21 Aug
 2022 11:44:11 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%9]) with mapi id 15.20.5546.021; Sun, 21 Aug 2022
 11:44:10 +0000
From: <Conor.Dooley@microchip.com>
To: <mail@conchuod.ie>, <monstr@monstr.eu>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <hca@linux.ibm.com>,
	<gor@linux.ibm.com>, <agordeev@linux.ibm.com>, <borntraeger@linux.ibm.com>,
	<svens@linux.ibm.com>, <ysato@users.sourceforge.jp>, <dalias@libc.org>,
	<davem@davemloft.net>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	<hpa@zytor.com>, <arnd@arndb.de>
CC: <geert@linux-m68k.org>, <keescook@chromium.org>, <peterz@infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-s390@vger.kernel.org>, <linux-sh@vger.kernel.org>,
	<sparclinux@vger.kernel.org>, <linux-arch@vger.kernel.org>
Subject: Re: [PATCH 1/6] asm-generic: add a cpuinfo_ops definition in shared
 code
Thread-Topic: [PATCH 1/6] asm-generic: add a cpuinfo_ops definition in shared
 code
Thread-Index: AQHYtVJWYAEaPR6fJk6EFR/jA4qylK25PAGA
Date: Sun, 21 Aug 2022 11:44:10 +0000
Message-ID: <6ec9945a-d749-2bed-edb5-837a3e3c95ed@microchip.com>
References: <20220821113512.2056409-1-mail@conchuod.ie>
 <20220821113512.2056409-2-mail@conchuod.ie>
In-Reply-To: <20220821113512.2056409-2-mail@conchuod.ie>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2c18ca45-4c4a-4e2b-06c8-08da836a76af
x-ms-traffictypediagnostic: MWHPR11MB2032:EE_|BYAPR11MB2855:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: igO+dvf3XlJk/3UB6K684/LeNJGV9uj+3kM6lHQ4+i3zcdXUbRSZy6Fc2Y/caTL/wDrGgMeHbYvoH+zwBD/rFaL5+H1q//V0LH2QiHNuuRdUOgnp+7JboHa5PJaiqXBPLrjwxmnh5VqkhJEmQtm3sJUlw4ECRqs4zc3S8BrvgUFgMGp+veK1eDtiQZhYPUwWC0ZSE2ok8uoo8JcElyD+frF55GN08pV6k/pOMqZ5xC4N/iuSSAuwjyZwusb8zy2sb9KkovziFFmRPLpqmhf4KzvXHm3htbqoyjqbkcf+fgdJhQ2WNdjml73aP91ynfICM7QUbW2a2+iRw/1tpn2pyh/jOqFnRQEivY14FKMmr7qqzEG0cRbyTuhXo3VthZ18GmAJ0dhI3zcjq/o2T44GG8WPub0QoAQ5hr+yIbJnxWno8W8Ii3RJ6IldX/8Lcnrm5NvkMeTdK9Wp2hh5Z9kEH4nDbYCHD746K3g0aZ9udCWcfwWF93UZJ7GJRwy5N4L4OHDweI7u/gSvF77Qc9y7T4aP25ddnI5qNrhc2W0o2KtJbSTiLDjnyw1OxKINptF6i/hMtpfFjNLitijm0a2KkkcK9KuzWkZI5vxMKLnUUymSozv9D/OG0GaA5wxYkhr3bb6X+QzK1WK11sWxkDUxGcvwqiiINyiSP1Nq/LxprUKoZaoQz5TRhi4wOkhEroukXXf28uaRWhNmoLB4aklKs4BuAS/pv4OS0DPfSbcgLHS6SnInLM9v/NQVtuzUwB84OHWe9B6/AVpKCaZnX6+2aJb0ZwTERlesmA10yS8V31OJxyWtVJ9K9DeQyT+ckaX3+yxiZGlrk+617bxba353LeoOyUjtJXyBTdBPpDKZVePUvYAJPJPJpRNWAcHtj/0o
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB2032.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(376002)(346002)(396003)(39860400002)(2616005)(54906003)(110136005)(66476007)(36756003)(31686004)(64756008)(91956017)(66556008)(66446008)(6486002)(8676002)(66946007)(4326008)(76116006)(478600001)(71200400001)(7416002)(5660300002)(41300700001)(38070700005)(921005)(86362001)(8936002)(31696002)(316002)(53546011)(2906002)(6506007)(38100700002)(6512007)(26005)(122000001)(186003)(83380400001)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?am83VTlQYWZqUkR5NDAwZ0tRY21GV1hiSFQxSnoyc2pCQTdFcEdZNFpKa3Vr?=
 =?utf-8?B?MzJDKzVweStQQlE2WEZOVmtNTURYSGdMcU9tWnJ2RGtaekphZjVjYzBqRnhx?=
 =?utf-8?B?ZzNDR09SOGhKNlA5Yjl1ZkFmTzlGSUpna054R25EeEFiZDdmWkJBYlZrdzhC?=
 =?utf-8?B?Q0g2eUZpZytxSnFJdzYwbVoyM1o0RkJHZnpZMGVGRHNLelZzbGFCc0M3U2FE?=
 =?utf-8?B?VUMzOC8zUWJSQnF5bWNIOHE2Skh1ZWVvQ3hKamM4WHFWSWJ1VFlLZURicjJW?=
 =?utf-8?B?ZFNVVHVOODluNC8vd25wZXI1SFZTZE1pTjBrUmtLb2w4cWozalB3d2gzNkhj?=
 =?utf-8?B?S1JqSzdWemE2czBhM1g0MkpjTjZPNzcvTm01SjBBYmdVay8yN2E2THJ4M2s0?=
 =?utf-8?B?K2pTYU9vUnYxOFB0cCtEUjY5VFpsQzVreTh4bXRYLzEzUlFYOFROTDBpcUg2?=
 =?utf-8?B?Ti8yRVRFVG1yTlF2MmRLck9OV2g1ZzEwd21XZVpEQVJnbzFxakNrVzF4azRK?=
 =?utf-8?B?NE15OXhhdGdhYVo3WVNpL015RjQxREFadm9VVzh0RnFkSmV3TGpDeWtxZG8x?=
 =?utf-8?B?MTBhdXNVYUs0T3djZnNyQWs5ZU1KaEtHTUZETElsVnBBM3dmTkIxa3R5VXll?=
 =?utf-8?B?d2xuWjU4TXorYUNtR1laeHBHbzk1MDRIY0c4ZVVsL01HTHpqMVIyWkxteW1K?=
 =?utf-8?B?ZDBBUUwyR1M5SEY5OWdBQVFFdVd0b3lGT0dzSXNIUGhvMFJrMEl3c2g2bTJp?=
 =?utf-8?B?aVc0UmF3NDZSNFlhMDZyWGtnUTBvUGxJdC9zN2RxdkxBN3E1R2YvYU0vZUJ6?=
 =?utf-8?B?RlVEOGJtZmhHWkptNS84QkRzT1dmTFBqWjlyMWlWQzg1dWFzcVo3ZkZjQ1F6?=
 =?utf-8?B?UTRaWHVnbktnMnRSQWxNdW1OVmhPdDJOb3hkNnFkbkM0eFB5TUp6dVNBTzds?=
 =?utf-8?B?dGVrNkliZGJWWldsR0JsaTBXZzFFQW55dzVmaHZPUS9GWXJ1WDF5a3dYaDEx?=
 =?utf-8?B?TnpaQUNTNVRxSjBhRlY4QldKNHAwY0xTS1FTWVNJaWdBYmdPeTdhbXlIWGVn?=
 =?utf-8?B?ek9VTXVqTUgzT0FvdGtxZEh6NVNhZTlYeTFTL1c1dnMrU2RVZGsweTd6cHcv?=
 =?utf-8?B?c0hJTFU1cTN6Wnl0NTRTVjkwM3pvb3l2Z2dRZWg0L1gwNEpTMmtIYlBUTHQz?=
 =?utf-8?B?ZFZLOXo2bXdNd2xhNVlyWkRQTVQ0NXpJSDNXVFFEU2swQytTMEg3SEYvUkx6?=
 =?utf-8?B?VGlpRVNJbGR2Uy9la1MvR3E3QU1XaENHMzRhNEFsUDhCYVlXdWNuTjVVSmdu?=
 =?utf-8?B?a3pXcCtSSVgwamk4bUJkcEtLMlRzT0lFcStwOWZiTVRwUDJXNXNYekp4YVZx?=
 =?utf-8?B?UFc4NVBSZDkyaWpFa1lTMklpL285bi9peHZ6bVVocW9PeDhCaHNuMmcyWjFQ?=
 =?utf-8?B?QmQwSnkza0JMM0NiWHhua2U0djNOdmRTU0FJQjlNOFpaS1FxL3NuN3NDZGdR?=
 =?utf-8?B?cTFSYTVpTTdxOVpLTDFIdHZPVzF0NFpNSzlaMDFHZ0wzcUlhRVkzaGNGakw1?=
 =?utf-8?B?T0tOQzE4WElEUnZwVE43aE05VkRyRG1SeU9SVlQ3TG1Jd2tOSTBjekttcWpU?=
 =?utf-8?B?QUUvSlBZTlNRSHRvQ1JzUy9jejZqVXgvZThVanpMRkdZYkNBRmZGY2dueTFZ?=
 =?utf-8?B?bU5zdWlFblFRbjBaNTZwa1ozV0Z4UXpuaVhNMUpBcDNEMTIvVUhwNUUwd3hv?=
 =?utf-8?B?WnVCbmlEM0tTcDJMbldkUGJVMmhNT01UaTRuTGlXdHN3Q280ZldKQnFaQ1dS?=
 =?utf-8?B?WkRzblZ6d2dVUGdzYUM3RHJISUpONTkyOXZTQkhEY1RXUWE2NzQwVFMzQjAr?=
 =?utf-8?B?MXNlanZia3gxOHkyTWp5dGJ2aVoxZXRJSVdMSGx3TGhCRnVGMjJaSmgyeDE4?=
 =?utf-8?B?aTY4Q0JPMDJyWDU3NEpaL05QMy9QWjVmaGlQandBdWJTay9xTTExZVBudnNl?=
 =?utf-8?B?SC9saXp2QllDb0swY3prTThXSjZRZ3Nwc2RYbkVRai8yaFowOGp3czJmZHFl?=
 =?utf-8?B?Sk9MdE1WVVNZMEhpaHcySytyZ1ZReFJFdUpxRlVjcjBFb0dUdEkxemJqK3Jl?=
 =?utf-8?Q?TONs8Ph5X3RBmOF/IXBtRKt0g?=
Content-ID: <98503B830589B74D947D2585A1E0BD0C@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c18ca45-4c4a-4e2b-06c8-08da836a76af
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2022 11:44:10.6987
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N/tCBZm8APrXK7ykxdbcRldCzMOvWGoEO1XyUDQzAeEC7QVQyduFW6nC12eQKQXShJG+iI9lhpnnYRu1M8B9xUJNNe0kTQwBT3+oPR6NdIg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2855
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220821_044448_658453_7F984D10 
X-CRM114-Status: GOOD (  18.68  )
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

On 21/08/2022 12:35, Conor Dooley wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> asm-generic: add a cpuinfo_ops definition in shared code

Meh, bad subject..
Obviously not going to respin right away for that.

> 
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> On RISC-V sparse complains that:
> arch/riscv/kernel/cpu.c:204:29: warning: symbol 'cpuinfo_op' was not declared. Should it be static?
> 
> Sure, it could be dumped into asm/processor.h like other archs have
> done, but putting it in an asm-generic header seems to be a saner
> strategy.
> 
> Fixes: 76d2a0493a17 ("RISC-V: Init and Halt Code")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/include/asm/processor.h | 1 +
>  include/asm-generic/processor.h    | 7 +++++++
>  2 files changed, 8 insertions(+)
>  create mode 100644 include/asm-generic/processor.h
> 
> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
> index 19eedd4af4cd..dd2c9a382192 100644
> --- a/arch/riscv/include/asm/processor.h
> +++ b/arch/riscv/include/asm/processor.h
> @@ -9,6 +9,7 @@
>  #include <linux/const.h>
> 
>  #include <vdso/processor.h>
> +#include <asm-generic/processor.h>
> 
>  #include <asm/ptrace.h>
> 
> diff --git a/include/asm-generic/processor.h b/include/asm-generic/processor.h
> new file mode 100644
> index 000000000000..2ec9af562e9b
> --- /dev/null
> +++ b/include/asm-generic/processor.h
> @@ -0,0 +1,7 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __ASM_PROCESSOR_H
> +#define __ASM_PROCESSOR_H
> +
> +extern const struct seq_operations cpuinfo_op;
> +
> +#endif /* __ASM_PROCESSOR_H */
> --
> 2.37.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
