Return-Path: <SRS0=mXjn=FO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 919E6C4361B
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 13:53:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15DAB23119
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 13:53:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15DAB23119
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=Pb9zrYl4Wt0RiSVSe6uSI6Z6UdiDBO6A30FiLMJ2uJI=; b=mMqyAZW/j0XfIGLSK9IUadROq
	6JKk7kjp8G9r2ZIxHyEq3diRHFkPR//hEhBteeLYQDXb3ckQIwp+pWufqKeMcohT31qQY1j4yglt5
	FidBBHqMalE8b3M8UxixN1EO6ETv0pMp8EBkOB3hjBXqmQWukleyk4vDffuPaggclTTvqaoLWBpZ/
	bk5T65qKcEPaIqmTDvFQvziSnfGZFSHLfMNjcK/J/mLyJlmgF5qdMeFPJjYkwbhIrlrpTbfxV6GDu
	Ac3Ew6z4j+2EOB+tzlDpJzHlFykb+jdTkOW8zk8hhLCJkkSNDHcb+JreQmpowlXY89unxyNOg9YuH
	dTAS5aVkg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knMNq-0005oJ-Rj; Thu, 10 Dec 2020 13:53:26 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knMNm-0005m9-8r
 for linux-riscv@merlin.infradead.org; Thu, 10 Dec 2020 13:53:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To;
 bh=p4ti17RCLoPz4K5CHhqDSWbcTr1eQiXCBQqxfUvWro8=; b=gWtn6fSf7fStM25c5FigIaO67B
 mQZET0cMkrMoHd23KwmSYC7TdWSg5AV7clx5HpQ5UpSEg5aXL3QSfpF3VMhKMK7E/WbAyXlDi36qn
 TVpfRO5IVCETM32jcH4IoDxT5QBLImITKJgRSgdaUREiVhHDtxK/azDLkMbsDlomHGOeQAo7JTkMg
 YLSG3icPzwpY0JKB0j6BdR8+EnooHKSvR2KLkniq4ZhuKqxp/vvuBgM6v+IQTMnGolaVa4ac7okH6
 foziDpTq9I5BFXEj5qsq6Cza8BbxRT0Pq9Fm8mOfQ9SQIP7ClklLPQ9DEfAGDniSG7tdz/Hy2Fv6m
 Yd3tEm3g==;
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knMNX-00081z-PK
 for linux-riscv@lists.infradead.org; Thu, 10 Dec 2020 13:53:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607608387; x=1639144387;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=eS6SvZkNgQ7BcK9b6Ghm/mI8Wqp57UeYr6iq6V/Ts+A=;
 b=ZVHwlxQhDkFvsXmMxbla6MPK5p3ndJoASC+4TqWJv1m2LfPsADIGCPe4
 lY48iZ/bU+c1OUkre4dV41XjJTtVkxU6Q+64PBNx/oEB0WB0uJpehOwCw
 usN4zfkDK4eNG/gcyvi5EZPF+gfuw/s+txilmtcUHsmPkqWMX+RKPagKk
 iwhbqQZAfykNE+tWZYRhJJmyur0aRhu/nfw+fZEmS76GV/9anqJ2lDRtz
 jMm9Y60LsKYRsJH+GvfS+rN7xwIN1HdZJbzI6XmOkPotEvxvLstzZ/gpg
 t98idFOWBFjpvvOg2h/bTDri0ObGYqUTyjhNRqQbAU9Kk3TfnVJQ1fMCB g==;
IronPort-SDR: qAYLc5Ffv5vZBfug700xoPTQ3Mi30GJ+wznC+1vSKU7LqrO6eWMvl7PDmpV2hxVVLS9chlDvMZ
 2LKRJTJs8pMs3VtvEO4sSwdvUhOXhU/sOYyEPJuWIgloFPGybOX5WnIcnqyHF8emoJ9HkLHWZp
 UEfxhn09XpJLTEg41HXPvrq+7W3XDWGqrglDhDgRjs8nwW4HVVO+Y5WZe9XMZfRGkEcbcCndn9
 V1USPSKwFKllUkqVAOgUSKdiiucm1RZ0PxmClQ+fwfLumaO7JtqNdlgNY1WBiG/cZJvLkh/9LO
 hso=
X-IronPort-AV: E=Sophos;i="5.78,408,1599494400"; d="scan'208";a="159316023"
Received: from mail-mw2nam12lp2043.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.43])
 by ob1.hgst.iphmx.com with ESMTP; 10 Dec 2020 21:53:00 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ettZddPeERq/uPaFauGYst/wLvo262+5hMV27t2qScum6xtQ2M8PzWdBsx7adEwSjKA/JcuEuQutPgnlldyeuJSVc2LyhHY6a5+7rXoQgpJVM506wLRaapuZ5HjP+araymOc56i5L0dOSd/rRLwABIuYIlHNHTPgPSdxt581AgyLg9FPp1DdgXoXLyIPUg1nsatk9ep20IcqmIzqudoP6vdOaID25aiUVyJBxLlLNxQGuy7Y1bxcPY3YETQOhiE6Q0Xh6ma6xR/v+eLEXGIqf8uhre1cCcZh57M1zN/49w0ssFMruz8zCJOSp+86P2BLZ8ulMpjPYfDNCNMIseTiyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p4ti17RCLoPz4K5CHhqDSWbcTr1eQiXCBQqxfUvWro8=;
 b=GU4oYpt6KHRNQ98HgwLm3wZBYTV37zf3br7yRft6YLOtV7hbgDEkzLNTbrPZuMXBbySJI3El0c169ytV3wPid4/wVc4VkrMMuXdq1Of01XqsUDnV4L0Dp6vWgBeK5/bf4k6JlQonKeN0RzZo+YdTMxkB1gE0M/R74MU4lGHpQiZlNvUV79o7bMvHH1HWJtJKFGY8WVNbhqsbNz9o5d6lBeaB7qysroh4/7rHK0J3VIunnzOpgLQvm+XSKl+bJvbNRPMRwCmfTlKNf2DI6dx2QE2w2l9pf8lgOimUiARmwFPSz86XP1ROPIBp9yOyscOoHq/75UuoeX8uRIyKEbXs6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p4ti17RCLoPz4K5CHhqDSWbcTr1eQiXCBQqxfUvWro8=;
 b=dRmssp4fRh5nQ+RhmLUIbH9K3i5YuZmLizWH6gJ7eIuZelZckV/YRhOzNKqkIsTxOJTa0IY7Vr47Zve/j42iyVqkPjkfe2xWn8QViiVn7l1VeOX+ouYzjvpA2tm3kXeLJzCOa+I8JDMKnMkw2dbjXYcb2QAjYm6X/wdedNta41s=
Received: from CH2PR04MB6522.namprd04.prod.outlook.com (2603:10b6:610:34::19)
 by CH2PR04MB7125.namprd04.prod.outlook.com (2603:10b6:610:a3::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Thu, 10 Dec
 2020 13:52:57 +0000
Received: from CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a]) by CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a%7]) with mapi id 15.20.3632.023; Thu, 10 Dec 2020
 13:52:57 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v7 00/22] RISC-V Kendryte K210 support improvements
Thread-Topic: [PATCH v7 00/22] RISC-V Kendryte K210 support improvements
Thread-Index: AQHWzqYvKtn7lzf0bUaGE16+bO2s4w==
Date: Thu, 10 Dec 2020 13:52:57 +0000
Message-ID: <CH2PR04MB6522B5386D73AAE564D8D98AE7CB0@CH2PR04MB6522.namprd04.prod.outlook.com>
References: <20201210034003.222297-1-damien.lemoal@wdc.com>
 <CAMuHMdVbU2kjKU3EVN5kszPc=VQcgzYLemV6AOyg+YyZBfc31Q@mail.gmail.com>
 <5389e421f884c43ff6a806ac4ec95b43a93d02f7.camel@wdc.com>
 <CAMuHMdVnR2E6+ANYuZLvsTW8Od4Sa=wDtjnio4h3z=W2ePPGGw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:5911:8225:c337:ee37]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6ca7151b-7b37-4fc0-324a-08d89d12e66c
x-ms-traffictypediagnostic: CH2PR04MB7125:
x-microsoft-antispam-prvs: <CH2PR04MB712589654094F118DE76AC37E7CB0@CH2PR04MB7125.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8y9pVJVnX1Se3yiJMz3lZMjm6eDV5fGV8k0D+gqadTDkOePwNIemi8TuAgPsHby7LB/8z/0DIE8BHIKih7hfAhf4T4PL3JnKho8e/3RFsvHyQsVgx52+lbdU4r48xwAH11gTj2+mDNAKP1oDbOM6ieCnZyl9y4jFnt5/1eBA41vLwVxduWWZxPOrYe++w16d9+z0sATc8MKHunlkhJIXoxTHZ6bYAt02n5vYDDBLu92Jue984JKYszyiiiEh123BUxJw50FXcA56p2U7Wh1s2viDt1/8FGPQRgf0mfrl4W9pWeTKCoRyb5Rw/VFMELsAxg8PmNcWqbRYEJK3OeUugg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR04MB6522.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(136003)(346002)(8936002)(6916009)(71200400001)(5660300002)(54906003)(7696005)(76116006)(64756008)(66446008)(66476007)(52536014)(91956017)(66556008)(66946007)(86362001)(508600001)(4326008)(186003)(53546011)(55016002)(83380400001)(9686003)(2906002)(7416002)(33656002)(6506007)(8676002)(4001150100001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?vFWH+8OnHJW3yQA2yXkK8TiNPlAxEZNklnfvCNarQDJD1qKAsHQrNDdCjL1G?=
 =?us-ascii?Q?ZAcE4xgM5ai0gHMD7tFGcovPmIvV035uudcYiXzCKVQFL4XxfOdvB6uSR3n+?=
 =?us-ascii?Q?yL8lLVK/TUyDmqRvUy5FuNeuLPahQDcDxINMJmZCgDmizGiWhX0D0k6FFZbd?=
 =?us-ascii?Q?4iARM2zTpQtmpglytA1OQmwJE+CysOnKXshlGdy69G5TEmdxNT/ZV/Yjt4zq?=
 =?us-ascii?Q?+OtWuRk1OQIE4ZzAkP1gsMwqgFpPmzLfnDniAcEfokjmuvC/X0pT21PwMRwM?=
 =?us-ascii?Q?TCCg322ICm0YYuHg90w6PW85Pmz8EXYOr0uJ5XSmNby9fTAD75t5m+da4Jbc?=
 =?us-ascii?Q?Dfejf8L9kAfW9wPgSQArwx5BcfR3Xq1m3fEfFTjEAY3tD6PxMHM9shrGUACh?=
 =?us-ascii?Q?apqJIS9xak7j/sSexIY+5/9aFxg8E7ElK3wI/UCJzr9G1ozvKgR//ZeC7oR+?=
 =?us-ascii?Q?EFWl24EYwmzudigZbXSP+co3WsA/lVEWm+Ng2U0aHojQ/EQz++knasUNB22y?=
 =?us-ascii?Q?NWTFsRls884xQTEjtR5HZGd50z3QYNYSDncwdBPHHXDkGDO3MGxN/Uw30+ZD?=
 =?us-ascii?Q?JshCBv7Qb+/VpvLnS6vIrmkxNOb7lseI3jW3DRFaqSJn8BZmpIMG4+oPwiIt?=
 =?us-ascii?Q?DBH+f2yiWUj+bdU0GvBoPEtlDYqntSapoQxidYABb98ZOj2Z3TArKszLp3G4?=
 =?us-ascii?Q?c6vJfZFzUw4iTdkuzrnuunIcNkRTfqnxIq4v5HDy21m1eIkIhO2iJl9nfwAh?=
 =?us-ascii?Q?QgL/FPB4OK+LSCTZ484hJE6BPkaUjrHrHcWc6th2e8S5X5e+G3XjK/lRcNKL?=
 =?us-ascii?Q?nqRkRjHNWLOMUDiYBWRgPzX2jx6227+7bSDAHGQMctZyAnLDrp11NZ+gfcxQ?=
 =?us-ascii?Q?IS8XNyVKvhvdjL9pOMhUvQhiDKsa3QVdWOkOdY0Y7nWMOcNkvqkYsPH+pZg/?=
 =?us-ascii?Q?IlvKb1q1Wlossk/UG1Gl+z+xaQezE6k7F8yNSi4F/J2BEQLQ1CFgbw31qkvi?=
 =?us-ascii?Q?u5EhJVxPoBkLmEFkPpR2l3fz5kWaCc7LA4rfPpppQCNFdzftkdiLki5Ih4yk?=
 =?us-ascii?Q?s6lzHhCw?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6522.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ca7151b-7b37-4fc0-324a-08d89d12e66c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2020 13:52:57.2652 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sq0y1/HXEsGjsFhitPnrqWH9Nhvf73Z2fIgh1XisVDqcgc9+vwVnC1ebW6tOmrxQaVU/1IMiiLlYMJU+yjTFCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB7125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_135308_674267_9F74A3E5 
X-CRM114-Status: GOOD (  23.16  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "seanga2@gmail.com" <seanga2@gmail.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020/12/10 22:23, Geert Uytterhoeven wrote:
> Hi Damien,
> 
> On Thu, Dec 10, 2020 at 1:36 PM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
>> On Thu, 2020-12-10 at 11:04 +0100, Geert Uytterhoeven wrote:
>>> On Thu, Dec 10, 2020 at 4:41 AM Damien Le Moal <damien.lemoal@wdc.com> wrote:
>>>> Changes from v6:
>>>> * Annotate struct platform_driver variables with __refdata to avoid
>>>>   section mismatch compilation errors
>>>
>>> Blindly following the advice from kernel test robot <lkp@intel.com> is
>>> not always a good idea:
>>>
>>>     The variable k210_rst_driver references
>>>     the function __init set_reset_devices()
>>>     If the reference is valid then annotate the
>>>     variable with or __refdata (see linux/init.h) or name the variable:
>>>
>>> If your driver's probe function is annotated with __init, you cannot
>>> have a pointer to it in the driver structure, as any binding done after
>>> the freeing of initmem will cause a crash.  Adding the __refdata merely
>>> suppresses the warning, and won't avoid the crash.
>>
>> Hmm... I must be misunderstanding something here. free_initmem() is called from
>> kernel_init() right before starting the user init process. That is late enough
>> that all drivers are already probed and initialized. At least that is what I
>> thought, especially considering that none of the k210 drivers can be modules
>> and are all builtin. What am I missing here ?
> 
> For these specific cases, binding is indeed unlikely to happen after
> free_initmem(). In the generic case that is not true.
> However, you can still trigger it manually by unbinding and rebinding
> the device manually through sysfs.

Got it. Sending a v8 with the correction.

Thanks !

> 
>> So I think I will go with option 2. It is simpler and safer. We can always
>> revisit and optimize later. I would prefer this series to land first :)
> 
> Right. Correctness first, performance later.
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
