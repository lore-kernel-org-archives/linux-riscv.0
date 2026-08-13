Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91BDBC5AC67
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Aug 2026 04:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MlfcequBUoUlYHTVRx5mA7ALetTcUV7DVCxMU5ii1aM=; b=TgTnw6MXAYITa/
	2npZM/0x4Eq3tENBdOsER62ko6siLhzUip7/RSKN1B3Bm9OFjU6nrhpnt2DRDjqgPD52bMjI3AUIc
	Q+a9D3ndakyfaaOECwJRoJzAXLQ/ApRewT4I2k88HIn/Vt4HMS5m1cA1SGYnFylMZRxYPt3Wpm9Gn
	dHQgNfp/nhZpU0yU3OWG6LLvUo/5o7bH7er1fyuqWU6jMRclWLMyxV2wX4rdbfAVXjNtLlbt8Q9yK
	t1r1YhGckJSQxFDtIHG7LRfUs8V9v8m61a/DJ4rM4qZzmqhaGsqNIGAm5NmCGP4tTrvFSnXBf9YNE
	C+AHtPhivfABdv6f633w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuNLn-0000000HNR2-1ZnB;
	Thu, 13 Aug 2026 04:47:31 +0000
Received: from mx08-00376f01.pphosted.com ([91.207.212.86])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuNLk-0000000HNQb-1PxA
	for linux-riscv@lists.infradead.org;
	Thu, 13 Aug 2026 04:47:29 +0000
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67D41dMk2084552;
	Thu, 13 Aug 2026 05:47:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	dk201812; bh=irDDyaU0lAdhkJp6/9WuXg26dPciU4Qy/qekG8Efn7I=; b=mmZ
	rgz14p/bc3FVewn3czsazk5QD3pGcKeXw2SHAZHD1zMv5a+gxmMAPTm6hjIpptBb
	1yEPmMM2ZT6jQwhgGmQZ2Dqm64HfVXZ8mxbNJ6BoRuvrC4nwlsfJY2u7mMeLfNcu
	uyjLfu5k/syZ6qZxBWROwBKohfHe81YehCZC77hXN7XRus2aXVfAUkpvsKs7PsBA
	iqS0u8JTBbx7sMQO/QNY3VMBGagzflR23ZIfJGxOF8d92Q3MuEWwrQUJyle7ZdBY
	TNjUHGpb5HR93xXzU9SDp/nfaMfWnaHfy/qX863ysZ3WZnk16k4SZU6bvKgWEQZ2
	AduKZ4oSwtPkp2ZV/8A==
Received: from lo3p265cu004.outbound.protection.outlook.com (mail-uksouthazon11020081.outbound.protection.outlook.com [52.101.196.81])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4fysma21cq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 13 Aug 2026 05:47:05 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rMq8I/c8Ds7SVfHbFC+MV6RORJND8AgqSHAZ50QIlovBWxOy0LxRfV68X9ZNh7k4E3xqIS1vCKEq3Fc0uohg/JgxTN5DnhdSMUnMnTxIES0UdHGdry8mQ7fl0wMDaSOld8G3fpxY/yKzs0hD7Vmu+SRU6p6EpiCRyVLzAmXE2Z0vJtW1uov+3Se7zZLygeKhEtGaT3LxiSwYet8ChGooDab1KE2JJx0dXu/tYUgBg3f0wMog7mpVQBcpZpEBe48PWOcPA52f48Ys0CkvskzJYUWX/Ah5DeMJukQuW8IT+/ZXRW12Do76wilUPi7UXhOg7MLMHUikk3rw9FIXSE2zDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=irDDyaU0lAdhkJp6/9WuXg26dPciU4Qy/qekG8Efn7I=;
 b=sMx+rYTIF4C16RQcmzjfnfq2rHQlAvdo+AMbp3+xKVHLxeXbxBg/TkF+tIP1aF30m82Rlw1DZswkuvLO7saKjTEzxiigdD8zzvZ1a9BFaIu2weAUjHJ4j2A5tm4vR3pZ/0sdviYoeWW+rJqa11v4A3CwI5fwymY89frTcfnPyVGhxkoAR/WFXQfE1QvJ6KtuJSfTCWZBF22x+boUWi9HYd16mIx5bvcNPo0U7GDFGwCNTdFOq2b8nAecnIq86zJmC8iGOgrymjh4W4rIrirK6fSXTylybmvBWCNO2YWcqrAa0o0hPcAHpxi/lwhIlAh5oieE2m/dEWtCuUHQQM1L5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=irDDyaU0lAdhkJp6/9WuXg26dPciU4Qy/qekG8Efn7I=;
 b=dpLgNNIYel1EOCqPQsoTD+85RyYNEB4nEBlcD+m4X3wf0Vdsm4AJwlKaMgekSzNQ+VBVx6LF8lF/JZVctRNodtTydJ/gBFiVhyBswv6WuBogeH54Xt9qALXEGai0sn5rThSlJxjJH74UF+9G7jTfA6wvSCte4X5Up1LFACTUs4M=
Received: from LOCP265MB8661.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4b5::14)
 by LO0P265MB5957.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:289::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 04:47:03 +0000
Received: from LOCP265MB8661.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6b99:94f7:a14f:a722]) by LOCP265MB8661.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6b99:94f7:a14f:a722%3]) with mapi id 15.21.0315.011; Thu, 13 Aug 2026
 04:47:03 +0000
From: Brajesh Gupta <Brajesh.Gupta@imgtec.com>
To: Luigi Santivetti <Luigi.Santivetti@imgtec.com>,
        "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>,
        "tzimmermann@suse.de" <tzimmermann@suse.de>,
        "simona@ffwll.ch" <simona@ffwll.ch>, "pjw@kernel.org" <pjw@kernel.org>,
        "alex@ghiti.fr" <alex@ghiti.fr>,
        "airlied@gmail.com" <airlied@gmail.com>,
        Alessio Belle <Alessio.Belle@imgtec.com>,
        "maarten.lankhorst@linux.intel.com"
	<maarten.lankhorst@linux.intel.com>,
        Alexandru Dadu
	<Alexandru.Dadu@imgtec.com>,
        "mripard@kernel.org" <mripard@kernel.org>,
        "palmer@dabbelt.com" <palmer@dabbelt.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "imagination@lists.freedesktop.org" <imagination@lists.freedesktop.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/imagination: Manage FW VM context from its init and
 fini callbacks
Thread-Topic: [PATCH] drm/imagination: Manage FW VM context from its init and
 fini callbacks
Thread-Index: AQHdKt7IbrrNFQqn10CF1/0TuawGSQ==
Date: Thu, 13 Aug 2026 04:47:03 +0000
Message-ID: <3530a7d628216dd41943db32cde94bd3c1d5620c.camel@imgtec.com>
References: <20260810-b4-upstream-manage-fw-vm-context-from-init-and-fini-v1-1-2c6229e36e5e@imgtec.com>
In-Reply-To: <20260810-b4-upstream-manage-fw-vm-context-from-init-and-fini-v1-1-2c6229e36e5e@imgtec.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LOCP265MB8661:EE_|LO0P265MB5957:EE_
x-ms-office365-filtering-correlation-id: ae572a09-fcf9-4ca8-911f-08def8f5eb57
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|10070799003|376014|7416014|38070700021|10067099003|56012099006|921020|22082099003|18002099003;
x-microsoft-antispam-message-info: euoPQAjPHbXKXtkUYpRkM+ZJyEm7p9btWPEMVBV8wCfBZxyG0xPms4jjZJAj2Xie/FN81N3GpUHrQPs55jgR9tX9Nmvpy6ORQ2e/uaUmhmkN96kqTSK1tMVXCj1u3hARX6FYhK2bP29WMvcktZO8cWcJQuxO3f2LA+BoOoIxZvDphoLz2H6Ry8KmQoNHxtwr+2jpIu5x+LlLbMhi1o5rYMh9ojazKFmWbJgL0FwixJJaimpr+MMGUnjn4M7jPXt+ftonlpjP27uBd7Nw7sJDgEoghYLUcYsfNqZB3WsV8iTyTMG65mBvGz8gc9yz+lcYiY8Cc/jBEK8sDnfVBaefw/J6OkPpIKAK+RwV1D+jNXWohKvUtPifZz8BuqoICA9rrUMGfk9pCKJd5VmEBtlkfo/Ul3mp4RBZoBbUY3Z2pRXMQTI6F9RLapZ+OEzBLGV6PRJrZDFymmKip61DtcymPVdF/BYqMkDxy2jbWEF/uSaOjbqkH7yd/IJOfaKpgBT6hmnytSyCg02iIVwsxPut/NPrgA2KUlTwRPvV7Lh7Hiqx9/ZexVW5iclFzbsGvDawveIROHyqHjfGvSrxfLCnWrVaD1I09Jlct02Bpwwd573KM2UmAyH90YinqPg7JjZSxFxMhRFxgeMN1j7YTStwHyETAy1fm8r6fP7Ii6bAj5h4SdOS9aM+R7NXLvpV4A54cybSS42Z1TIos/JZ/yCchZUldSjZkO+jpiJJpxWjFvY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOCP265MB8661.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(10070799003)(376014)(7416014)(38070700021)(10067099003)(56012099006)(921020)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MWNCOEk4bkJrQXJvQnE4VEpaWExVYzV1SlUyVzJZOU9TSUNreHkvSS83MStW?=
 =?utf-8?B?STBNR1BnZGZNU0F3bmFGR2pHOEhPTncrQzRsZ0pReGdmNGRXREE4UVh4M0Ri?=
 =?utf-8?B?bkpGU1NpMm1FdkdaVWFZTWh3QUNxcllqbmVPd0ZvV1FDWnlsZkNIVm95N0Ey?=
 =?utf-8?B?dGJOQWNDUUp2ODgyR2dZekFyd2xBR21EYUQwaUhwRCtWNWdHQXN0TnMrZjQ0?=
 =?utf-8?B?cmF5eGxhRmszRTU4V1dGVk5aYjVSSzNvcEU0bk92TDZpVzY3RVhWME8wSGMw?=
 =?utf-8?B?OEdKZDNiaks2TTBqL082Mk5EMGdPRGpGOStzVEwvUDVTdnkzWjZaNnFwRWc2?=
 =?utf-8?B?WFNMck0rWXAxWWpScWxYcXBKN0JYRVBiemllV2V3MnJpOVlEVDR4dlRmSGUz?=
 =?utf-8?B?NUF3R29SY2lHY2dXa3ZTV0g2ejB2RlVkeHRBK3dueWpkVzU2cmxmaDhNTWtM?=
 =?utf-8?B?WERVY0FyV1pYcTJUM1hsVlFZSWdoSXZFRVNrQ0s1b2E5M2J4RzZZRGI4R0hG?=
 =?utf-8?B?WVRrRzFIS2UxSW42Y1djbGYrZHZXVVpjZ0tGOERjRFVBUVdWRnh3elNzOGxa?=
 =?utf-8?B?dnRQYWhJY3RMdFFTY1d4VjlNV2xPamNETDJtaHpkUXdxRnZQSUI4RzhmZTdS?=
 =?utf-8?B?bHVYL1dlM1dEck9UekNRZ2RjYU4wT2FnallGWjBZVXZ4angzZFYwNUJCbk5w?=
 =?utf-8?B?Y00rTENsVWYvRVc3SkZTMzU4QXJDaVlMUTlMMUdFcnBqOVhhT2N4aklaNllN?=
 =?utf-8?B?OTM4YW0yM0pmZk5tRVZmT2N1bk1HazFZNXJ3cHVleGZaOUVYNDY0TktLMDdr?=
 =?utf-8?B?K3ZicjhwTFNPdUt2UWR6TzRJSFR1OVB0Q0M5M1Z6VnBkei9OUG1TUUc5S3RK?=
 =?utf-8?B?YkcrRitsUnYyZ3BGblY5dUtmbWxNcTg5RHo5Ky9FMmpUejB2b1VvamIzZHpV?=
 =?utf-8?B?Zkt5Wm9HSG56Wlk5ajlXTlcwNmFFY3RMWktlWmxOQ1hRdUZyeHhLelovRlhK?=
 =?utf-8?B?cDZ6NEo2ZWw2MmUwODJ5WVhLQnBiZWp4dDNtVy9KZEpGb04zcTBBRVA4ekJT?=
 =?utf-8?B?RmlKVjVVTTU3QkoyWjFvRFpBTkV0czYxRDY3T1lKNGkrYlFqdUMwOHhFdjQ1?=
 =?utf-8?B?QXNBNmZUbDJzajJ0Q1JTaTdxak5ocEQ1czEwTVlyeFRaS3phb2tYU2VsKys5?=
 =?utf-8?B?SnhFenVEbHFtYmRJVXpxcW1xbzJnOU1HczhEWkU0RG9FMXdqSWZmOWxPYUhW?=
 =?utf-8?B?QkRiSFJxMGRibFhsdkwzeE53NERXRVQxVzBVejRONmF5dVhZcG9oeFZNTUZ1?=
 =?utf-8?B?OVJrMWY1ZUo4TnRucUsxZVZwMXpXajdtZ2hKd1VRZXlvRFQ3b1NwR2VwV09G?=
 =?utf-8?B?R2NDSVM3bjdiWml6dTRwUFFQYXRmQmZXNWhidFg3bVZlTTNLbVp1eUh2N212?=
 =?utf-8?B?MlkxYzlxejloU21iQjBiMlZ5MHc3TUVGYlV2L0hia1U3MWIxcGw4T2s5aVpq?=
 =?utf-8?B?WFF5SGZOWWNqbkJDZUZrWHFYVFAydlBWWHZDMjJ0NC8rNkF5cVQveSt6SlBq?=
 =?utf-8?B?Q3VIRUVXY2dJUEZoTmRhazBIQUxQMUIvYjNDYm5uaENtdklGTFZ3ZHdXUHAz?=
 =?utf-8?B?aUlKU25ocEpoa0s4dnlERHlnNUNOc2NJUWJ0bHE1M0ZIV0tOR3RnejhtRGdK?=
 =?utf-8?B?b0V6MDdaKzNhRTc1eHN6MDFndzNmZUNWMWpPYjN5Uyt3cTZZVFg1eitLa2hI?=
 =?utf-8?B?enFxcWdYamhNZ3VKcElUMHo3aWhCNVY0OE05Rjg2T3JaNWVWNmkxemFlU2ZZ?=
 =?utf-8?B?MDh1K290WlZWZWlhUDJ4Qk1zdU96c1h4bnVyYTRWaHk4bzBXd2luMHRPY0R1?=
 =?utf-8?B?Q3ZsbG5iSGM1bGRsUnVnQnhsY0xhQ0dpT3dHWHZUSWxMSDZKejZIdnJJL3pR?=
 =?utf-8?B?emtZejYrZXdVNjlIbUUycTFjdUltSWZmUGZvODdScTVPd3ZFelV1ZXU2Q00r?=
 =?utf-8?B?UWxWYVdYNXNxYi9MS25iYkQrWjRjaStUNHFza1ZJOC83M1hyVGFpakJuMUJU?=
 =?utf-8?B?UGVqOHJWZklSdHJLVnhmNHU3aGRJNC9LSFROU2J1QlpxbHhtbm5XK0NWUmxW?=
 =?utf-8?B?TkNUeWNyc2ZmRmZXZnluWExmbE8wdnZzVDBEK2VhTmhoZ3FPem16aHVFbGtw?=
 =?utf-8?B?LzdoRis0SHhPSXZ4bTVhcVhYaFVFU1p2NC9lNnZnQWc5cXRONlhHNy9aRW5O?=
 =?utf-8?B?RFZZQnZWa1BYbkFzNG43MUZNWUlyOEduSzdObDdwd2JpYVRsdkZaTEZIcU1K?=
 =?utf-8?B?bGwvU0k2bVVSdFljT2xqTkR4UWRBSEowcFhnQTR4Q0RVM2tQOUp0SHphS0Ry?=
 =?utf-8?Q?+SP15AmAJ0digFuInXdYYMz9vILo2ZipYd787kH0U19v0?=
x-ms-exchange-antispam-messagedata-1: 2PiofbbJLKrsoGa925cCCRJobZvf5OrrYTk=
Content-ID: <9320D051C925CD4BB27C23461580FBD5@GBRP265.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: s2B75swAecl8U7pmFfWvSBFSOavYZVsR/gAPFb3oP/mpVRxIRz9auj46KP+NPySFCOUnVVlwAhBcE7eeKOhVO6JPPBRbqko3crlgkuttcsEm9V7qlQd4nFvqasktB1ZQHpxwZ46vmwhldHRyQtZvemAhQUs+2Rm9eeWqhQ3fEaPgVNZXEnESn6cJE7mSfIHaXQi/oqwu1cHzU0jiYFYi+HxM7RBUPRBkrFtBK2QChePDK/A9lTRw4CgUy9zfhN6ggtkVOka+GQexY0T+WBsrQn5tnL5fMHin0EdbZRfyR9dwET0imHPmg6IPGZ4G0QxPOMj9xLuGliw3Vn2PhVyB1w==
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LOCP265MB8661.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ae572a09-fcf9-4ca8-911f-08def8f5eb57
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2026 04:47:03.2014
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ukxmtE5iub52k0EDNMsm15cGCsrF5ZH87ts5Pd3m4WeOXMTt8t+dVtIuz4Dn6flXhgJnrCxME85rXlCQQkXmoJDp1+T4r5Zz+Lh/x3GhTOc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB5957
X-Authority-Analysis: v=2.4 cv=BO+DalQG c=1 sm=1 tr=0 ts=6a7d4c49 cx=c_pps
 a=Rvvafz/nfqJTHwFgE6i6/g==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22 a=r_1tXGB3AAAA:8
 a=l6Yow8jhtBBrdGia4ToA:9 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: AZuTD_foXaaTGlsg5UUeBuObwgBufF6d
X-Proofpoint-ORIG-GUID: AZuTD_foXaaTGlsg5UUeBuObwgBufF6d
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDAzMCBTYWx0ZWRfXzKUKFrdOqBiv
 dQGecjHelb9o9kRy4sgoT38oxRHUxbqxurVfxPDVTAUp0cvlD9NoTWgnRSly0d01gNQhCPTAiQX
 LqqEBkMGCXeauMVGdFV71w8fZ8Gdn34=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDAzMCBTYWx0ZWRfX0b5zVGWXYn5f
 eattBldE5daWRM76JyPFe8+22OXuJvzwHpdIowlEev2eYCI5czgI8/SuoQsXpXkeacDTwt4uOeo
 Gc3kQ9j1rG4N+kBuPNKgHL6nsEQcuYsTbO8hKFP0zBYsx0sb+y0rs95hrOhpuikkEgSTztGB3Lt
 Om4+nDl/9Qz5b1a2jQcY0Mm4nwUHWW+Xz7rmNp78H46zNnQKCeaItlvSKj+tt0WQpYlN129gQYW
 n+2jT/arJaTlSVU8xqUv04iTmnY/pLMexltf352EvI/cXL3lDll4CN14d15F1eRVDia86qI7Wzs
 7D0JT8xLpHB2gdcasrfbLeEhpTbhwo+B9tDrmuSvWV/GPnme836I915DTEY55INmtr5w5vq1BIv
 UccSN5egV2TmYQTeKxCjrMJ429JhChUdx4Z7ru9obGgpMA28ocBvLRvj/Nfoa0vI9vw75CWvPg/
 NLAZGiXEKdogJXdf8Mw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_214728_656762_19E51051 
X-CRM114-Status: GOOD (  17.99  )
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

On Mon, 2026-08-10 at 15:31 +0300, Alexandru Dadu wrote:
Hi Alexandru,
> From: Alessio Belle <alessio.belle@imgtec.com>
> 
> While the MIPS firmware virtual memory context is created and destroyed
> from within the MIPS firmware init and fini callbacks, the META and
> RISC-V firmware contexts are created and destroyed from within blocks
> right before or after those callbacks.
> 
> Match the logic for all firmware processors by moving those blocks to
> the META and RISC-V init and fini callbacks.
> 
> Signed-off-by: Alessio Belle <alessio.belle@imgtec.com>
> ---
> Signed-off-by: Alexandru Dadu <alexandru.dadu@imgtec.com>
> ---
>  drivers/gpu/drm/imagination/pvr_device.c   | 25 +------------------------
>  drivers/gpu/drm/imagination/pvr_fw.c       |  6 ++----
>  drivers/gpu/drm/imagination/pvr_fw.h       |  2 +-
>  drivers/gpu/drm/imagination/pvr_fw_meta.c  | 12 ++++++++++++
>  drivers/gpu/drm/imagination/pvr_fw_riscv.c | 12 ++++++++++++
>  5 files changed, 28 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
> index 54fe4180c73c..35eaa54f75ed 100644
> --- a/drivers/gpu/drm/imagination/pvr_device.c
> +++ b/drivers/gpu/drm/imagination/pvr_device.c
> @@ -697,25 +697,7 @@ pvr_device_gpu_init(struct pvr_device *pvr_dev)
>  	if (err)
>  		return err;
>  
> -	if (pvr_dev->fw_dev.processor_type != PVR_FW_PROCESSOR_TYPE_MIPS) {
> -		pvr_dev->kernel_vm_ctx = pvr_vm_create_context(pvr_dev, false);
> -		if (IS_ERR(pvr_dev->kernel_vm_ctx))
> -			return PTR_ERR(pvr_dev->kernel_vm_ctx);
> -	}
> -
> -	err = pvr_fw_init(pvr_dev);
> -	if (err)
> -		goto err_vm_ctx_put;
> -
> -	return 0;
> -
> -err_vm_ctx_put:
> -	if (pvr_dev->fw_dev.processor_type != PVR_FW_PROCESSOR_TYPE_MIPS) {
> -		pvr_vm_context_put(pvr_dev->kernel_vm_ctx);
> -		pvr_dev->kernel_vm_ctx = NULL;
> -	}
> -
> -	return err;
> +	return pvr_fw_init(pvr_dev);
>  }
>  
>  /**
> @@ -726,11 +708,6 @@ static void
>  pvr_device_gpu_fini(struct pvr_device *pvr_dev)
>  {
>  	pvr_fw_fini(pvr_dev);
> -
> -	if (pvr_dev->fw_dev.processor_type != PVR_FW_PROCESSOR_TYPE_MIPS) {
> -		WARN_ON(!pvr_vm_context_put(pvr_dev->kernel_vm_ctx));
> -		pvr_dev->kernel_vm_ctx = NULL;
> -	}
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/imagination/pvr_fw.c b/drivers/gpu/drm/imagination/pvr_fw.c
> index 850a3ec8e775..58ee51cd65df 100644
> --- a/drivers/gpu/drm/imagination/pvr_fw.c
> +++ b/drivers/gpu/drm/imagination/pvr_fw.c
> @@ -1029,8 +1029,7 @@ pvr_fw_init(struct pvr_device *pvr_dev)
>  err_mm_takedown:
>  	drm_mm_takedown(&fw_dev->fw_mm);
>  
> -	if (fw_dev->defs->fini)
> -		fw_dev->defs->fini(pvr_dev);
> +	fw_dev->defs->fini(pvr_dev);
>  
>  	return err;
>  }
> @@ -1063,8 +1062,7 @@ pvr_fw_fini(struct pvr_device *pvr_dev)
>  
>  	drm_mm_takedown(&fw_dev->fw_mm);
>  
> -	if (fw_dev->defs->fini)
> -		fw_dev->defs->fini(pvr_dev);
> +	fw_dev->defs->fini(pvr_dev);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/imagination/pvr_fw.h b/drivers/gpu/drm/imagination/pvr_fw.h
> index 3390c84e4fd3..4b25291135b6 100644
> --- a/drivers/gpu/drm/imagination/pvr_fw.h
> +++ b/drivers/gpu/drm/imagination/pvr_fw.h
> @@ -86,7 +86,7 @@ struct pvr_fw_defs {
>  	 * FW processor specific finalisation.
>  	 * @pvr_dev: Target PowerVR device.
>  	 *
> -	 * This function is optional.
> +	 * This function is mandatory.
>  	 */
>  	void (*fini)(struct pvr_device *pvr_dev);
>  
> diff --git a/drivers/gpu/drm/imagination/pvr_fw_meta.c b/drivers/gpu/drm/imagination/pvr_fw_meta.c
> index 9ff03bc60a08..6c5dc711e81e 100644
> --- a/drivers/gpu/drm/imagination/pvr_fw_meta.c
> +++ b/drivers/gpu/drm/imagination/pvr_fw_meta.c
> @@ -500,9 +500,20 @@ pvr_meta_init(struct pvr_device *pvr_dev)
>  {
>  	pvr_fw_heap_info_init(pvr_dev, ROGUE_FW_HEAP_META_SHIFT, 0);
>  
> +	pvr_dev->kernel_vm_ctx = pvr_vm_create_context(pvr_dev, false);
> +	if (IS_ERR(pvr_dev->kernel_vm_ctx))
> +		return PTR_ERR(pvr_dev->kernel_vm_ctx);
> +
>  	return 0;
>  }
>  
> +static void
> +pvr_meta_fini(struct pvr_device *pvr_dev)
> +{
> +	WARN_ON(!pvr_vm_context_put(pvr_dev->kernel_vm_ctx));
> +	pvr_dev->kernel_vm_ctx = NULL;
> +}
> +
>  static u32
>  pvr_meta_get_fw_addr_with_offset(struct pvr_fw_object *fw_obj, u32 offset)
>  {
> @@ -550,6 +561,7 @@ pvr_meta_irq_clear(struct pvr_device *pvr_dev)
>  
>  const struct pvr_fw_defs pvr_fw_defs_meta = {
>  	.init = pvr_meta_init,
> +	.fini = pvr_meta_fini,
>  	.fw_process = pvr_meta_fw_process,
>  	.vm_map = pvr_meta_vm_map,
>  	.vm_unmap = pvr_meta_vm_unmap,
> diff --git a/drivers/gpu/drm/imagination/pvr_fw_riscv.c b/drivers/gpu/drm/imagination/pvr_fw_riscv.c
> index fc13d483be9a..58bacc522e72 100644
> --- a/drivers/gpu/drm/imagination/pvr_fw_riscv.c
> +++ b/drivers/gpu/drm/imagination/pvr_fw_riscv.c
> @@ -103,9 +103,20 @@ pvr_riscv_init(struct pvr_device *pvr_dev)
>  {
>  	pvr_fw_heap_info_init(pvr_dev, ROGUE_FW_HEAP_RISCV_SHIFT, 0);
>  
> +	pvr_dev->kernel_vm_ctx = pvr_vm_create_context(pvr_dev, false);
> +	if (IS_ERR(pvr_dev->kernel_vm_ctx))
> +		return PTR_ERR(pvr_dev->kernel_vm_ctx);
> +
>  	return 0;
>  }
>  
> +static void
> +pvr_riscv_fini(struct pvr_device *pvr_dev)
> +{
> +	WARN_ON(!pvr_vm_context_put(pvr_dev->kernel_vm_ctx));
> +	pvr_dev->kernel_vm_ctx = NULL;
> +}
> +
>  static u32
>  pvr_riscv_get_fw_addr_with_offset(struct pvr_fw_object *fw_obj, u32 offset)
>  {
> @@ -154,6 +165,7 @@ pvr_riscv_irq_clear(struct pvr_device *pvr_dev)
>  
>  const struct pvr_fw_defs pvr_fw_defs_riscv = {
>  	.init = pvr_riscv_init,
> +	.fini = pvr_riscv_fini,
>  	.fw_process = pvr_riscv_fw_process,
>  	.vm_map = pvr_riscv_vm_map,
>  	.vm_unmap = pvr_riscv_vm_unmap,
> 
> ---
> base-commit: e55fead22ff9ee047ab9f1903860c4b43043514e
> change-id: 20260810-b4-upstream-manage-fw-vm-context-from-init-and-fini-195cdd01cc60
> 
> Best regards,
> --  
> Alexandru Dadu <alexandru.dadu@imgtec.com>
> 
Reviewed by: Brajesh Gupta <brajesh.gupta@imgtec.com>

Thanks,
Brajesh
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
