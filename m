Return-Path: <SRS0=oB3y=I4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 080B7C433C1
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 04:54:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AA8461580
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 04:54:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AA8461580
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=baRwGGnktH+j7ii+D8O0aVHgT399y9i+W7ouR182E0E=; b=fFD4x3JJdqpsKYRs0aY2TRQSZ
	KTvKpivQ93kvUf1SmE7GlnbtM1Me/xC1dbbuKQHBcPeJdhYUj/jUaUYRZhnSy6HaFVl4PGmXUWFnY
	MIT3d1ukitX+q6+GethAFO61Hb/4aZ2ylcxUk2aVR5Yj/kFRGYTG6FXLNJ0C18ZumP63AIez79MsV
	R3a7+vPepQRbceqdgtgRJub5n3G3TkxOb6dT0PsVelhhgXpropp/xI3yG0p/bsmyEWtfGpg+hTUCF
	G2QsT7Ql8HNZ1MsFP66lyph66VJj2f1eriW9oKzMGfVfAvF3PeAiWsMRMr6DLSCA8xQ2MXHnC020N
	eo/6uyKfg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR6OZ-002iAq-5k; Tue, 30 Mar 2021 04:54:27 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lR6OT-002i9q-IG
 for linux-riscv@lists.infradead.org; Tue, 30 Mar 2021 04:54:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1617080061; x=1648616061;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FuRTLMB8S9haaNEMKBaXIHC95eqC8Z4u6i16BP9+aj8=;
 b=nRe9xi+ZsjjtwmS3Hp5cXoRODGQ9fiFljldxMh9O1U4XkkXBgApuZQb7
 QWNRajnCBYcKXK7qQHXKnNmEX4c0x9/kPTEx7HiwT1+mBfghVcqY4lxit
 feIjedlKdPfHJV10nbjdcniPdxPtsrTIY2Rn253yVLIxyATPMMoXsh3u/
 BkyBs43+6PhKnUOuHWK6GWP0S4nIYIY7ZMfZN49kk2ZRy48S+Rwz5FL1s
 Vqyyh51rzemGO5dFmKy/OuZFfcpxH3ou83r4u8WKF25TVh1vYuk9Zzsa5
 9C3XnL8CR3TXHSS7PE4X0Qt7qe5ZtSJg/zR0zKEz2u0LdoYYGz21OuTFp Q==;
IronPort-SDR: DpgkQQcPsozQnTNefoLWdN0TZr8K9T8Dl3VonFTTPCcGbJPZTmYJbKybJ59wNfnac3eDqmTF+t
 hdm8j6pJJflaztkW6U+Ui8H8b2vjIgwrjlhXEo2+YeOcXMi7Oid85w7jsSn0whNoeNjjLywu+C
 8TorYcJfuMYV68579am6FANawCPwXnRj9BR7Mq190AAEHRYAsbmnFqd5HjTJiJeBP19UEMV73n
 LYpOm/g+9FLY8LitcTeaQIlnWf0+wN20Zzpi0sp5bX8OQaiIRwyDgpCrUFsFZakgryWR03ydsc
 m1w=
X-IronPort-AV: E=Sophos;i="5.81,289,1610380800"; d="scan'208";a="163306644"
Received: from mail-dm3nam07lp2044.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.44])
 by ob1.hgst.iphmx.com with ESMTP; 30 Mar 2021 12:54:11 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c+Jf5jV14aRm9CKlIc14exriZdil6M2s6tLCd8pA3oDYOk3ecsuMEmEgeYOcXomwECCYQ5hISOdqbGh2e0Bh7AnnpQeRBiw2satxZlxdY+UHkA9nnaQ6t9xpyFi+VoaJd4357wlv92SpJhqGO0NMVqA6laA/Tii+pse396kJqZEPyIsIpMVRWQz/zhoLkhSlm63rgQ3/lFCVl7mB7vyRrm9hH8Pu1IaMBMJ+21JsKyFUvRiV9J9TuwBxqUluu2Pb0i2LW9Cx6QAxuvrK1dI0kRmuIAwCAW6NhEaNKssRrVR+94BHfZ8T5QY/s8+nhxwsDQ8WK+Iv8u3KYzNZ3G4B6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FuRTLMB8S9haaNEMKBaXIHC95eqC8Z4u6i16BP9+aj8=;
 b=dPMaDnIP24XqEUj6QQwBX65sajqfbgkf9rnKDR2ooPLFnYx2ApOcYYRCCdkCeQ3PJMb2PmbO+5QVFaZUf5HNaox2oRiBwSeFIRdkm0M/43KD0iU6bKt7AmQSTAHZPtaZ1efSB5j+vbl2TC67Z3EmQGyRPpl4N2nmNGZfK00s/jEGnM12S/vqkVH/wKiIGNBrpjtO+tUUsmkmdkf7xiPUuN8UWOAbIoUyFqZT2G/9vPzx/YlKPwNcFWSiP0ntVe7LiEMGT1HkaOVUFVBrLmwY0ABGh8CwatjOo0LKKeJBzLoDWrrw8F5SqWNnhzesC5suB3EZQyzPeE2JTP0Rhd7eBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FuRTLMB8S9haaNEMKBaXIHC95eqC8Z4u6i16BP9+aj8=;
 b=q/HFBwkXINn+R3+qADI+cGw1gaFq/CvGvDEchnSKJzARX/RNKJ6ydIBdzJBqPVBQpT6g1rmk8aPkk/WDBxolDYxcFBnhYyY/Dcar42HhXJQCSP0vhNWB5pUilkMN8Tg9f4BlLOad38f9kkZE6Ec2P+vksu0oeYl8bxA6FNzHCNs=
Received: from DM6PR04MB6201.namprd04.prod.outlook.com (2603:10b6:5:127::32)
 by DM6PR04MB4329.namprd04.prod.outlook.com (2603:10b6:5:9a::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Tue, 30 Mar
 2021 04:54:10 +0000
Received: from DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::38c0:cc46:192b:1868]) by DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::38c0:cc46:192b:1868%7]) with mapi id 15.20.3977.033; Tue, 30 Mar 2021
 04:54:10 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Guo Ren <guoren@kernel.org>, Peter Zijlstra <peterz@infradead.org>
CC: linux-riscv <linux-riscv@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, "linux-csky@vger.kernel.org"
 <linux-csky@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, Guo
 Ren <guoren@linux.alibaba.com>, Will Deacon <will@kernel.org>, Ingo Molnar
 <mingo@redhat.com>, Waiman Long <longman@redhat.com>, Arnd Bergmann
 <arnd@arndb.de>, Anup Patel <anup@brainfault.org>
Subject: RE: [PATCH v4 3/4] locking/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
Thread-Topic: [PATCH v4 3/4] locking/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
Thread-Index: AQHXIzQ13Qj+G1dtVUSTIu+6TgYVfKqamdaAgAA6hoCAAAIFgIAACcWAgAANXoCAAPGCgIAAGwkw
Date: Tue, 30 Mar 2021 04:54:10 +0000
Message-ID: <DM6PR04MB62011884B58F1F4BD5909D308D7D9@DM6PR04MB6201.namprd04.prod.outlook.com>
References: <1616868399-82848-1-git-send-email-guoren@kernel.org>
 <1616868399-82848-4-git-send-email-guoren@kernel.org>
 <YGGGqftfr872/4CU@hirez.programming.kicks-ass.net>
 <CAJF2gTQNV+_txMHJw0cmtS-xcnuaCja-F7XBuOL_J0yN39c+uQ@mail.gmail.com>
 <YGG5c4QGq6q+lKZI@hirez.programming.kicks-ass.net>
 <CAJF2gTQUe237NY-kh+4_Yk4DTFJmA5_xgNQ5+BMpFZpUDUEYdw@mail.gmail.com>
 <YGHM2/s4FpWZiEQ6@hirez.programming.kicks-ass.net>
 <CAJF2gTRncV1+GT7nBpYkvfpyaG57o9ecaHBjoR6gEQAkG2ELrg@mail.gmail.com>
In-Reply-To: <CAJF2gTRncV1+GT7nBpYkvfpyaG57o9ecaHBjoR6gEQAkG2ELrg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [122.172.186.121]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7787b79d-796f-499c-fb91-08d8f337db77
x-ms-traffictypediagnostic: DM6PR04MB4329:
x-microsoft-antispam-prvs: <DM6PR04MB432902FC3D9D70A6972109258D7D9@DM6PR04MB4329.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 02Ovv4ymkLxst/2lIDUGGfyCowfjnuh9P3ZQaRlz8WH/w0NBEHXGBmYkhVoLMt0fe5piwXnsOa+2bPY5QmxwtxbsT1Eua/TpAQBRVIU9UVp6R7O7dU5KNpimgBl6nyS/rBkaYMgHOg6k/U2BhywJUs+SPYwMdcNWqbKIWMHZ4zyDI4JO7K5PMycrVsZYiPB5j3RdHUzS5zCfp2DZomn1aH3Vrll/bCg8G5naiXL077gRzG0Ck8kLUE8d1R5T/cLlgn3rVPYzl1APvKe3pgIBg3ywtn/nsEJn/gVXyexnWFgkKdD5TBbZw6JppmjJIqkmhp+9lBboNZiipPwDjgDm4eHY4VpC0eh0KIPRlSFmE9gimtsPBYskO3jHxk4Guj1pmp2GFrSg2VxUsznYSSBoQrvLxyPC2h6JMLgvftzskvxdEU68mHGckpn7kJxrixTRekxfiqSf1lh3ZIVmYAzaa1B/BxaMxA46qgJFTiQx0GLhMXFO9NJluLDJqpUmrjQJLL7sgj5DMpFseUEEZVVewNgBgckjpQ05VckAt9QUN9MtR+JXQ81mOOJGT20o47nk61v9zBBhbYslkRHN6T5/mcapB/vFmsghRQin0a+hWBYyJFHtj58gbYgbcxmUODNo2JKbIPA01SVRQ0eFpgc6v5n3J7OPcOklE0g+hRus5ddBA2lqBLiuXmOwyMPeYY1b7xHP+q3/BOpepEwP3IxGWEvjceKNWiSMqAiHzGj9gi6cddKnDPWFydh9g9FbHn1R
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB6201.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(376002)(366004)(346002)(136003)(6506007)(7416002)(53546011)(83380400001)(7696005)(76116006)(9686003)(71200400001)(55016002)(86362001)(52536014)(966005)(5660300002)(26005)(54906003)(316002)(64756008)(66946007)(110136005)(478600001)(8936002)(2906002)(66476007)(66556008)(66446008)(8676002)(38100700001)(4326008)(55236004)(186003)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?UytUYnp0Zm9IR1BLR1QyTklGMlpIZ281eDJGZ3p2aVJnd1NURUtyUEdtL1I2?=
 =?utf-8?B?YmFWME1ZbVI1SXBFdjhoTHkzWmhNbmVOeFdvT1J2RXNKamx4c3o3R05KOVNP?=
 =?utf-8?B?aEplS2hZeHA5aFo3ZkxMRG93cmJQRnoyUmY3N2l1eHRCendZakdmTVRyNXVp?=
 =?utf-8?B?Mlc3dnBhSnR4V0ZDT3RpclpvZ0tEaG9hUStXR2RUamNuSmNOVVMyR3NSNzZj?=
 =?utf-8?B?MjRkSHNFajRSVFVNVlV1Snkrd0wzUGI4WS8yS1lUWURFUDVPN0JEMkNUZDJl?=
 =?utf-8?B?T3kvTzcvdzB4K0gzQTZXOWdPMEE2TkxPZmFoTUV0UnJIcXAzNWpMNjlVRmlZ?=
 =?utf-8?B?L0tEb0dqelZFbFBGWXNVQmVUWGpnZDFBZG1aSEdBelhzM3hCL2FDdzFLbGtQ?=
 =?utf-8?B?YUNIOWc5NVRyVEtjYjZkNHoyandJMEo3L1NOalJnWWZ4Y09MR0haTERDa1VP?=
 =?utf-8?B?d1dwNUl6V3lYejRqQlJUMFJLOXZ4QnN0MVhIRDV2WjYzdENuck9hSUEreUhI?=
 =?utf-8?B?RmpQNHBBWHBhV1FITTlrSEI4ekZ6Q29Fa244YmhReXdmV3k5VTV5Uy8zaEdO?=
 =?utf-8?B?dWg3aGZ1R2k1THU4M0xyVjdSSTlsOGltVnV5Q3Z5TGZOQUxRQmFHYnJNa1cy?=
 =?utf-8?B?SFNrdVo4Rk4zaEF1ZTFrbkNOYlFNWTBNeUZxRENpV0VYU25oanpVQlpJdGxG?=
 =?utf-8?B?clo1cjhhc09tRllRaGxBaVhFaUxpMk9UcEJ1R0V4bXNWdkRNTXAwd0UrbCtH?=
 =?utf-8?B?aHBuTDc2QURKNFpBc2tWTDAyc3pNLzBGSVBhQnM1VVBUY2YxU0FQek9NclhK?=
 =?utf-8?B?TWVBeGhEaFdyVnJ4alhidW9EYitROVoyMTJpYTV6Z1BzSExnaU5ybTNnYkpk?=
 =?utf-8?B?YndLdFRobDVucTc1NE5RSXFwWW5zN0t0dTVBZTJsMFdMVzB1VGFzZ0l1azB2?=
 =?utf-8?B?NXh4ZEpzSzVZN2ExaFRvUkRFVVhrS242V3c1c3VDcDlVUEdLVVI2NCs3U3R6?=
 =?utf-8?B?aTM0MzVtanpFWVJsWWhqWU1zam9vbXk3ZWZITVM4c1JiRWZuQVZrb25KRk0z?=
 =?utf-8?B?Vk5xY3NMNVNzaUk1d2NCVk93U3FlT2xRYjd1d2V4Sk9GWTA2a05CL2toY000?=
 =?utf-8?B?QlB5UXNKWC96ZmlnelhuaFhiTXRUMDR4b0NUek9iQi9lWGdCTzNxVWtGYnkr?=
 =?utf-8?B?OFV0cTNLN0JHa1p2cmNEZkxFYytvSmVtRlVpaWtjSjFuK25lTmtKSldZZ0dL?=
 =?utf-8?B?TmIwcXBjd1VMelF3S1RkUGgrTjFIaExDZzFDOVEwc3NCTXFkVnFRbENNbWkw?=
 =?utf-8?B?UVdTbVlnUmNHNGc4c29Bc2hHUWRlcmEzTCtkcm5PWG81MVZzeTJSbnpUb2pD?=
 =?utf-8?B?ZTY1alFrejRQanVnbnZhVmhFK3M0ZGUxZ2YzNmg2OHRJcHBNSWl5VjFMVW5h?=
 =?utf-8?B?SWVUTFFWNldLRjZMb3RNd1pyRVdveHdCeVZ4SWVWdkwwVmQ5VmR6QVZSZEt4?=
 =?utf-8?B?QVRzZjRrUVdaMVpjSmtaNkptME4xVjcwcmlRYVYza28yYlJXZzg3TG1WVlFo?=
 =?utf-8?B?Q0wyQzJpd2VGai9YeG1tSmNZbU5RSFUrNnIrbktpTVczYXFna0QyajFuM3A4?=
 =?utf-8?B?OExzK3JFbUxNZzhsbnJaeEZIUG91WHNKMk1Ddnd6WXQ0NTc0ditDWjNvWDdI?=
 =?utf-8?B?UExYNExtQnc2RWhxbXk1ZHVZYStNRVpmWWIyWngyZWY1dnBlRmFOeGEycDdI?=
 =?utf-8?Q?7mJoy30LWlg2yQwPeq/T1TW/16BBbhQ63kGxKYq?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6201.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7787b79d-796f-499c-fb91-08d8f337db77
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2021 04:54:10.2370 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WKnYb/gXgCXA9BzewmHHZd1yhRxn5qjqVx+7x6O/TYcyY/r0nAZvhuq17ZAZt29czrI19z/AObedHun+AQF4Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB4329
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_055422_243492_3354105E 
X-CRM114-Status: GOOD (  26.31  )
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



> -----Original Message-----
> From: Guo Ren <guoren@kernel.org>
> Sent: 30 March 2021 08:44
> To: Peter Zijlstra <peterz@infradead.org>
> Cc: linux-riscv <linux-riscv@lists.infradead.org>; Linux Kernel Mailing List
> <linux-kernel@vger.kernel.org>; linux-csky@vger.kernel.org; linux-arch
> <linux-arch@vger.kernel.org>; Guo Ren <guoren@linux.alibaba.com>; Will
> Deacon <will@kernel.org>; Ingo Molnar <mingo@redhat.com>; Waiman
> Long <longman@redhat.com>; Arnd Bergmann <arnd@arndb.de>; Anup
> Patel <anup@brainfault.org>
> Subject: Re: [PATCH v4 3/4] locking/qspinlock: Add
> ARCH_USE_QUEUED_SPINLOCKS_XCHG32
> 
> On Mon, Mar 29, 2021 at 8:50 PM Peter Zijlstra <peterz@infradead.org>
> wrote:
> >
> > On Mon, Mar 29, 2021 at 08:01:41PM +0800, Guo Ren wrote:
> > > u32 a = 0x55aa66bb;
> > > u16 *ptr = &a;
> > >
> > > CPU0                       CPU1
> > > =========             =========
> > > xchg16(ptr, new)     while(1)
> > >                                     WRITE_ONCE(*(ptr + 1), x);
> > >
> > > When we use lr.w/sc.w implement xchg16, it'll cause CPU0 deadlock.
> >
> > Then I think your LL/SC is broken.
> >
> > That also means you really don't want to build super complex locking
> > primitives on top, because that live-lock will percolate through.
> Do you mean the below implementation has live-lock risk?
> +static __always_inline u32 xchg_tail(struct qspinlock *lock, u32 tail)
> +{
> +       u32 old, new, val = atomic_read(&lock->val);
> +
> +       for (;;) {
> +               new = (val & _Q_LOCKED_PENDING_MASK) | tail;
> +               old = atomic_cmpxchg(&lock->val, val, new);
> +               if (old == val)
> +                       break;
> +
> +               val = old;
> +       }
> +       return old;
> +}
> 
> 
> >
> > Step 1 would be to get your architecute fixed such that it can provide
> > fwd progress guarantees for LL/SC. Otherwise there's absolutely no
> > point in building complex systems with it.
> 
> Quote Waiman's comment [1] on xchg16 optimization:
> 
> "This optimization is needed to make the qspinlock achieve performance
> parity with ticket spinlock at light load."
> 
> [1] https://lore.kernel.org/kvm/1429901803-29771-6-git-send-email-
> Waiman.Long@hp.com/
> 
> So for a non-xhg16 machine:
>  - ticket-lock for small numbers of CPUs
>  - qspinlock for large numbers of CPUs
> 
> Okay, I'll put all of them into the next patch 

I would suggest to have separate Kconfig opitons for ticket spinlock
in Linux RISC-V which will be disabled by default. This means Linux
RISC-V will use qspinlock by default and use ticket spinlock only when
ticket spinlock kconfig is enabled.

Regards,
Anup
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
