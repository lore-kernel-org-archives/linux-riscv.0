Return-Path: <SRS0=trcm=IH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 821E4C433DB
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Mar 2021 08:55:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECFA364F7B
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Mar 2021 08:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECFA364F7B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vuox83nai8Nx0mOUeA6w7eH2USj8QQ+G6385I69ywhQ=; b=SAdt1JqW57fDesO05DqwuiRtv
	yvNiZtqRVd1sEbCW4UTr8KjmnffcgWpCP3QLT3dCwPP0+uIgi18OmerbL0MuNTCkl1xNyT/4jwRi1
	VjPAqRqPWV5I+sl/I0QRiqwsbv5wD+gAORTGVpS4w9+4HW2L/i4GcdiEy6J/Tn0SyVKD1+/Rk2DKG
	Xe0DmNSJW/zzgxiO2i8oOKI7bXGtWW0p+IsgFWny0ca/d2aslVMeP+/zLBIRzvxjwuKxA5hlf2jwE
	7C9sTvnvFTe1uDMyoeMtJZY3E47LAOnnl36Q346qTddK6KFfs5YC1AVj7R8I0KEVo0QuyPiA4L4N1
	Axa45Uddg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJY9F-0046Di-DC; Tue, 09 Mar 2021 08:55:25 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJY97-0046Cn-4U
 for linux-riscv@lists.infradead.org; Tue, 09 Mar 2021 08:55:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1615280117; x=1646816117;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=vQ2iUk8pdEp/vIy0+/WaJ0bFGLu1V5jN0TBsjzqi4yQ=;
 b=NC+NpKjsX5lhUscjAWEx2PbXreFKoiv8vQMNddNNv0rrakIyfSmHqOqv
 TMltZz9KtEBQT/i9fubOwQvcDGB4MOfk1PC2lppRXjxvOsjStTPZTv6vQ
 K0iGDqJIXNjq5YJu5mSrpO8Z4L9rCaZgXGV1oCmuIetjnMATsSFEWwrXC
 oTnK263icdWFRarI5d7Po6zFYMj/7qgJQ9zCX+XZGCdsOgFnrLXQNwXE/
 PdRIbOow2VElHvj59HP6xtyFJJdbRKP94eYo8EYR2t/7NZqkP2+WpR7qG
 fJUbPckGejMlDHb9YR1vXw5dtdsf6lg7nwgki3hf10bIsdwrHq1v7dzmv g==;
IronPort-SDR: pEIbPrBD6f2mgv3MA/VubRyh0cuKTxguSBrXLK5c/u3CEp2y48cG0EqfxeMwLHBxYTjwONdoGG
 eoq+/PmiwdoUwEqV8X2nfBDmglDNnzk5ltRu7Yfzi7G5ErZODBTUJjpe8BhLT2SbPeXgrtfdu5
 2Q41QNuietCwKivBRIbFLg5cEF8zUgfsX5WHw/kAMcy75Q3l/aMPbx9yASeYI518g3RBluTnns
 ntaxQE1ofPw6LidpDkY7U0XQXOKvPClworCGM/cSY6PuJ42KExjYrdJS9jRqc+jB+BgATx1X/O
 Z9s=
X-IronPort-AV: E=Sophos;i="5.81,234,1610434800"; d="scan'208";a="46775929"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Mar 2021 01:55:12 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 9 Mar 2021 01:55:12 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Tue, 9 Mar 2021 01:55:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WrTnLDEUc/r2C3q9YgVRzBBS19c7bS55B+wUtpGq4H82X/SZRqfoIKw5EkJo5hiakuiMgIZmjFNBV/IYV/0PHT653yiIEZb2D0/dXiEseWrvADGsUoXr0zmvcsrve2DdrafLxL3zhUJiUVE44+wD0F4AZF1B+crrBbY46faElx5zAguur+CTFfMWaEcUs0+t59oa7yGTMrz46uNGejtJnNXqN85tnzSigcnPL072Ay6xvS6FUMWJaXlQEaVRKkEDEtUsIbxZn470ZqyGZyP8LL0OZKPWN84eISawhDszCNhVSQ0+xlGYDXZ6bR+vjoXnpt8/hleg0yKCOHhWVy7PEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQ2iUk8pdEp/vIy0+/WaJ0bFGLu1V5jN0TBsjzqi4yQ=;
 b=dWRHQAED6zbvNF4qZ0be6ZbkOVlCL0NsBbdZBwJzCyYgYFUV5L2L4ffH+6klDz3U27nbtnywgWKm8SQGap8eeW7cMhXK7b3BEs3b/tflYowz6kb009tcxR3uKKx4lUGOr77kLzfH3IigpDMKn5ygCsqSnziRhbDKDEAEkJRufpXE2oL2pAI4XpuZb8f5QiddAkrLIENnQKQGNVaGd53bFOUmcm3iN4uzdLwOW65bBEGu27wigc8M+v4QPlISeKfzntN/BF/oB+eYgKlNt2AWtOnLWMc6K3BrBuAYSAvV1RT4ewGrcdB9T18mfBTs4x0++saXdAML3ZxO0775exNTxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQ2iUk8pdEp/vIy0+/WaJ0bFGLu1V5jN0TBsjzqi4yQ=;
 b=TZgroSBVRpnfEpxh1uhpEQx8eSVUO9yEgWvyKMMadSr1WblBV2O2udY0dQ9L/XSWnHxNvUCUHnVuc+4F+dIyb3hER38ql293mJ9pt27cGfJtkgPpxiAjEuct4hd5gjIK7BAet8zPNCWUK17S43Hh7aOsSQeZRKMdL0foHMxElPA=
Received: from DM6PR11MB3420.namprd11.prod.outlook.com (2603:10b6:5:69::31) by
 DM5PR11MB1307.namprd11.prod.outlook.com (2603:10b6:3:15::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17; Tue, 9 Mar 2021 08:55:11 +0000
Received: from DM6PR11MB3420.namprd11.prod.outlook.com
 ([fe80::d405:a5f2:bb71:38d7]) by DM6PR11MB3420.namprd11.prod.outlook.com
 ([fe80::d405:a5f2:bb71:38d7%2]) with mapi id 15.20.3890.038; Tue, 9 Mar 2021
 08:55:11 +0000
From: <Claudiu.Beznea@microchip.com>
To: <schwab@linux-m68k.org>, <linux-riscv@lists.infradead.org>
CC: <ckeepax@opensource.cirrus.com>, <andrew@lunn.ch>, <w@1wt.eu>,
 <Nicolas.Ferre@microchip.com>, <daniel@0x0f.com>,
 <alexandre.belloni@bootlin.com>, <pthombar@cadence.com>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: macb broken on HiFive Unleashed
Thread-Topic: macb broken on HiFive Unleashed
Thread-Index: AQHXFMHoahDKGMtKyEOMLOHZmc0vJQ==
Date: Tue, 9 Mar 2021 08:55:10 +0000
Message-ID: <04a7e801-9a55-c926-34ad-3a7665077a4e@microchip.com>
References: <87tupl30kl.fsf@igel.home>
In-Reply-To: <87tupl30kl.fsf@igel.home>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [82.76.227.253]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0aced231-f9d4-4f3d-928c-08d8e2d90c0e
x-ms-traffictypediagnostic: DM5PR11MB1307:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB1307C3943A6DD10A387CD74587929@DM5PR11MB1307.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kNSIQ9X9UVwQGpODm7M7reAYrEW6VFK55lhJNWCPeWlfiAMnkE2C9bWzWR0baAt1pgx8Mr+j/Gn2ZdCRSyZ/L4/YdSNXkf/nsUaa3iQU7N4wk8VL3ZlM8YoVZkpLNZupRSnz3gxBmy+tWtevLGjXKJBtpricOPrFxUjBDy0oJNkjdZG7af+G5o6QE+WMAPsQjwa3F12qoEM9kjvjv6PzJVEuc1douZtbOrTs8AZJGaanp73lXuNMnOgYvjdf3vTo8n4i+4G88VA3Pg/9C0zo7cUrmSXwOen06cbJRs9VVSlVj7vmhSXTeNH13cTlY1w2P0q51Kk3i1ruE/y/yvL+lENIjy3JmLJcomjtiFw3ucKK5H6Ek2ieVr9g4ms2nDrwuvSDv+x99wsBq9v3oiB/M87Xfmb/BDZoV2kxBlABaI7EaE6cpuaDT4AQQ3aYRWCKt6+AclXDLEhM/pS9lIRQZB8G73O/XrqBg8SAdDgnDxpl86qslE+WU82Fo6nhGlS8F5BV22w/Hf7jQmbePQbuuDTbeEuSR+yvimlWv/mlIHQF1WdUBzqYubLyRlFf6xkoC3VHalCB8N2RbAjVxgHq5XwQT+ZGSSCUnWFidBmayfo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3420.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(136003)(39860400002)(366004)(396003)(376002)(346002)(36756003)(4326008)(54906003)(83380400001)(6512007)(316002)(7416002)(2906002)(186003)(86362001)(64756008)(66946007)(66446008)(6506007)(66556008)(6486002)(66476007)(110136005)(31696002)(76116006)(8936002)(53546011)(71200400001)(2616005)(8676002)(478600001)(26005)(31686004)(5660300002)(91956017)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?Q0MxdlBwb3ZuZU5vTUwvYU1nYXVlTzRyMDl6b3RKeHlaV29DaHpoYkc5ZVgz?=
 =?utf-8?B?ZkNTUjRaZlRJb3hIbVR3UW1nSVB6L3A2YWpNektCcWdhOHpHdFdmZVR6YWcw?=
 =?utf-8?B?d1lJOXhtMEZmc2JsYlNBVTdCYThZQUJoZ3Zhc00yTVNjZ01PNFhLRGtOYmsy?=
 =?utf-8?B?amZ0MTRIa1J5Z1dFUUdKcmJVL0owK2xETXNvUUdHR2VMdDJ3bWpuSEVBTjNI?=
 =?utf-8?B?V0txQVUyRVZzUkZwS0VYRnVWWU5GSThBQU9pS3VFS0k4SUZVWkhyb1RMWTBF?=
 =?utf-8?B?RFVtR1c2WlVOd3Rvb1lTRzVNT2NoYmxhZi81anpvbmNGbC9hOHZSMmxsMmlK?=
 =?utf-8?B?YVFneUNOSTYrdC8veXVXOW0yY3cxeVcyUWhYdFFlVTdZWWt4THEwUGNIbEhI?=
 =?utf-8?B?SlhBWnhiRnFidk1UNnlIclNZL3UraDVCNm4rZExoK1g4cFoxaHJoQ0hoaTU0?=
 =?utf-8?B?UDF5MFg4UGdaYnJ4VzdPTmxjZC9vVTlaTWlqem5RQ1B5MVFTNjBtL1NvN04w?=
 =?utf-8?B?N3Q2d2J5bXRPUkgrc3Axd1g3cCtPbE1aWXJWSWtrbml6czByUlRXb0lERytm?=
 =?utf-8?B?bXMvdklERmxZUHJrVWk1bkY1TStjalpkMS9HanVpTjd4ajFFMW45aWFqWlN2?=
 =?utf-8?B?cThDWm1lVXBYaDE0NmpxR0Via2xOdUpnb2NDTXFaNkpsRFhIVzJ5bDdxeGxU?=
 =?utf-8?B?Wm15Mi9OSlhmQ2pxUkZlMklYNW9TR2pSNVllRzUrcGtaamFIR1VFZHhnZi9Z?=
 =?utf-8?B?TzNoUTByZ3F6ZkZRZktHMVUvS1lIZ1EvMFRZeUc2ZjcrM0VKNGRnbUFCVk5I?=
 =?utf-8?B?Tm1lSGpRaFdrM3IxdzVmdmIvUm05ZDRBam5RRjRaem1tZnVRcHBLNjBESHJh?=
 =?utf-8?B?aVlvWnNpaUFWbWx0QWp0Znp3a0xFcWx5dkVZQmphRHptTGd5dkFvUzUyN3Fr?=
 =?utf-8?B?dzMvZ3JibnRzMnNnN0NDNkRiM0VGdzNnSXFOMS9ZQ0J4UmpBU01PRTQ5UWVJ?=
 =?utf-8?B?ZUlhTUsvZUJyamlBZTBLZFVPRUErcVJBeGxyVStjZHpaZ3krbUlMV29TTlVv?=
 =?utf-8?B?dVlhZ1orTXRQVHkvTnFOVUMza0dqUXNUZkUxL1N2VWhmU0FxZ2N1Q3Z4d3gx?=
 =?utf-8?B?NmZySGFIUTdDNUF5QXRpREhsRUlZMkU1dnRXdm1MM2RHMEFEbFZNYmRZUXcy?=
 =?utf-8?B?SEtlQnViazIrTWRxeFppN1U1WmZyMXZaQlpaR3ppUE9PdTBMOXBHb2J0Vmp6?=
 =?utf-8?B?NWxFVWc2R2FXMDhjTjc5anFWUnNiWTZQa2xBcVVLdnNOa1FjaUlPalpINUt0?=
 =?utf-8?B?WmNuVm00Q3BYZlNRTzRuenhuM3Y0VWVFMUZuY2hyak9iVGU4YW9WTFh2d2NU?=
 =?utf-8?B?bXc3RTB5UlJObW90UVZuck8rTktWTUNDdWUwbnNLU2x6T3QxNUhtZGo3NEpB?=
 =?utf-8?B?TG9kZHNMeFpMcEU5NzMrZE1wKytaYUZiMEVGOGMxcCtwcnVqSDJkVzFUbStO?=
 =?utf-8?B?NmhRSklkL1MvY3ptYkNNbUkwY2h6bS9lTlBDUndVZTAremUweXV2WFArSklP?=
 =?utf-8?B?NTExeFRGRWVEZDh4Z0NrWUQxYnRCYW0wZTdFYVNzaGJrSGNLZ0R1czdEcExI?=
 =?utf-8?B?R2FTVVR6SnpCWmYyMVNUQjJKWWNWcDhmcUpUUnFiQ2ZYZkRiYmVpS0k2RTFp?=
 =?utf-8?B?SG5hM1VwY09BbW50QUNHSVNsVW5JZzUybVFWU0VZWWpZYUVabWlnd0RuaDI4?=
 =?utf-8?Q?ebQydwKS1zLONBxmoE=3D?=
Content-ID: <21A5A2BFD6DACF4F9D63FBA7E9201545@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3420.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aced231-f9d4-4f3d-928c-08d8e2d90c0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2021 08:55:10.8418 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VL2NSpFTffFLUqPxPnIyxtdjQx28N0PWyd99OrM+IyzH8noSDIEFhJiRSdZVCNUXzcaM1hBvG2QlhR+ynUhhdBZ2XKilNULzJ5Rp/q0auBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1307
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210309_085518_953431_7CA4F3BC 
X-CRM114-Status: GOOD (  13.33  )
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

Hi Andreas,

On 08.03.2021 21:30, Andreas Schwab wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> One of the changes to the macb driver between 5.10 and 5.11 has broken
> the SiFive HiFive Unleashed.  These are the last messages before the
> system hangs:
> 
> [   12.468674] libphy: Fixed MDIO Bus: probed
> [   12.746518] macb 10090000.ethernet: Registered clk switch 'sifive-gemgxl-mgmt'
> [   12.753119] macb 10090000.ethernet: GEM doesn't support hardware ptp.
> [   12.760178] libphy: MACB_mii_bus: probed
> [   12.881792] MACsec IEEE 802.1AE
> [   12.944426] macb 10090000.ethernet eth0: Cadence GEM rev 0x10070109 at 0x10090000 irq 16 (70:b3:d5:92:f1:07)
> 

I don't have a SiFive HiFive Unleashed to investigate this. Can you check
if reverting commits on macb driver b/w 5.10 and 5.11 solves your issues:

git log --oneline v5.10..v5.11 -- drivers/net/ethernet/cadence/
1d0d561ad1d7 net: macb: Correct usage of MACB_CAPS_CLK_HW_CHG flag
1d608d2e0d51 Revert "macb: support the two tx descriptors on at91rm9200"
700d566e8171 net: macb: add support for sama7g5 emac interface
ec771de654e4 net: macb: add support for sama7g5 gem interface
f4de93f03ed8 net: macb: unprepare clocks in case of failure
38493da4e6a8 net: macb: add function to disable all macb clocks
daafa1d33cc9 net: macb: add capability to not set the clock rate
edac63861db7 net: macb: add userio bits as platform configuration
9e6cad531c9d net: macb: Fix passing zero to 'PTR_ERR'
0012eeb370f8 net: macb: fix NULL dereference due to no pcs_config method
e4e143e26ce8 net: macb: add support for high speed interface

Thank you,
Claudiu Beznea

> Andreas.
> 
> --
> Andreas Schwab, schwab@linux-m68k.org
> GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
> "And now for something completely different."
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
