Return-Path: <SRS0=PCma=HN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D83A7C433DB
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Feb 2021 02:32:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 876D064D99
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Feb 2021 02:32:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 876D064D99
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=D1cq8wP69xfLKX3T+V9ivmwDbHll77YBQVDYRJuxr8A=; b=GPkL0JdVMsDEfOpYwQ+k2DJFv
	rXf3aIl19Q7TGjjnCCsVHpxRcryfqgB76FAmNOsTcZJs7vKWb66fpSsNOCtSMxBibnN/KkTACd1L0
	etOQ9gd5scF9+nx+BOqE/Dlz3+6X47rqdoNZXjz8Knk3jFD2thVlWjMbJ94GAuoWKTQ+K3pR5dJjb
	/qBHTZRrnkeuJgdAL5ZGjkZcfllFPOw42wd/bs+j1c123tOvzymGNYMJSBR8zm4lQS280VWfudQBQ
	zvgdY4QKm0ehObwQ20WBHUBSMCnfZ10rByZCowxCSGTAlZ+tnzsQ9NzI8ShIhDST7GvqyfZd1sFll
	fGy0Z3acw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lA1mf-0007hk-Qq; Thu, 11 Feb 2021 02:32:45 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lA1mc-0007go-Hz
 for linux-riscv@lists.infradead.org; Thu, 11 Feb 2021 02:32:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1613010762; x=1644546762;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=iOQbfyBYzbs4H+5CMIzhSZOFbe7xh/6McfunzS6Ve5k=;
 b=hwL6pZKR/wO/qy3by2x0Nu5GwtYsrdH05Ani7Hfeu1/9pMCf25vd/MA8
 y9kkteUjuAwI+Yf2Q7QMMv2DL7IKL9SLOO35GgVsXihTj6j6pbqOjzeau
 Z1N/5wv+Npv9CjTKhyiH4id+ufTwYiObc/h/f15KWPO5i2JLGgy2FKUqk
 yWsjOAy5Q3aARASH8gYMtGOjbKffxI0ifn7hQhz8pjZILNmr4esEpeoFg
 0nkA3TUY1UO6OiF+k5pg4XJRhTOlxfgjcDosj5fx4s3BYwbW2xY4A11N5
 0YFCXSG6Zreowr/jBwSSA/XDtZ7ywoBPHPEwXLjUzdvNPfpFnDVzgvhft Q==;
IronPort-SDR: gRoJOO3Sn/dEvqgRXd6IDeNc7bCy8ycxIXb1MQ5383xiSm/mFIZpl3xhFxGsaYZlOfavIpDSCN
 hpEqSu3Xw/Nda8EcII7P9vQLukBVCCtlf6BroVdeYGHJkKPbN5Klt12/kyVnfQX21/j4Ls+RZn
 dfx6IYShQemZx+6Z4S3UULxwuLn2eyN8PdQ1wJ8A1Hj7jZ3tPysHfWo4YMFS/1Lf2ApfMSCDfV
 w8BLhmvOuSkQ2nREXyUSDrztYiJNaA9kJLMHfuhEGCpSv7aKxThVHR6q/Py93nZTZYP++DLoHX
 wTc=
X-IronPort-AV: E=Sophos;i="5.81,169,1610380800"; d="scan'208";a="164193872"
Received: from mail-bn8nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.177])
 by ob1.hgst.iphmx.com with ESMTP; 11 Feb 2021 10:32:38 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UCfoglzHgc3NG2fDRPWLFp+sIteBx8tvNQ/n+VkgLvfSbGzcdKuY5lR8f4mPBlwC/ODZvU3juvknmiuZEHgCfBWwxTHyCaupWy1WJ+VSRqGZvkA//BIZ60S42YMtHWsq0N+dmpVGHR//tPOmumgFv9eszhn98JgleDPDPoGT3pn+4P7BqOb9+kWuTtuJxn8VV7/lGpuDv/GPzHpviYulv9OeY7Ebf1pyO2Bkbn9O0C4Y2hQf+YzgywA/B2QboG507do6QWV7Fd5gmUqnFqFENy0DOUvTW9W5kJlQNZ8l1Py1IgoB4MOTTwesizZw4OBEZ4Z25Y65SUoMzTt51+3S0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P80sZ1xOZnp6cxmZpV32CN2ZG+qS7Gns7RGDw6dnwRs=;
 b=mlyfo3ZJiehkmGPl96LmqpLs0/tkUkwFQzzhfdZTpEPqKcNtqANVHxQh2e62SgSleg4cnv/bIGxuCtgc2u7xJRhige6++ME1Yjm6PwXqbHuYgzO36KaTIAuV0L7PNXUHErMbAhaLC2JVfSbh5gm1knX05YNDtmE7CX0azLVFJZoBTeBsW8zRTsfGBF1Nb99g+nMZJNXmYvuXxnCNhv6IREUGUB2rKvJ/CkYoGJ2hsvGHhzmKJfBP1qZN1Sv+ndhJue6j+n/u8jMWUymfgr+M4P9lqbEnX0SNrY9iREsBxp4Jh9K/V3VzF54VotPdqd/MpC8T2KjaVfweeNulK0mq6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P80sZ1xOZnp6cxmZpV32CN2ZG+qS7Gns7RGDw6dnwRs=;
 b=tBNFXu4myUdRAAoBVzjptmm7ltriHhDSCGyfLFzLiSVyFom3NATVhh/V7AAN2rwcKCr42PfVhXOotTlJAFEqcrZ0pzymlP+f4p1D/UA8YA80jTKdSD3EEubaM6MGUciQIx2aQl4BgukWuqtH8CuLUvLAXYJk4RVlH1xPNI3gtT8=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by MN2PR04MB6701.namprd04.prod.outlook.com (2603:10b6:208:1ef::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Thu, 11 Feb
 2021 02:32:36 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d%7]) with mapi id 15.20.3846.027; Thu, 11 Feb 2021
 02:32:36 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Stephen Boyd <sboyd@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v18 01/16] clk: Add RISC-V Canaan Kendryte K210 clock
 driver
Thread-Topic: [PATCH v18 01/16] clk: Add RISC-V Canaan Kendryte K210 clock
 driver
Thread-Index: AQHW/t9XApJD7mlFuEyRKf7oQMzIIQ==
Date: Thu, 11 Feb 2021 02:32:36 +0000
Message-ID: <BL0PR04MB651451075652392825BD1E60E78C9@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20210209123014.165928-1-damien.lemoal@wdc.com>
 <20210209123014.165928-2-damien.lemoal@wdc.com>
 <161292028178.418021.10953574123293354986@swboyd.mtv.corp.google.com>
 <BL0PR04MB6514E2ED802BAE7E6350E304E78D9@BL0PR04MB6514.namprd04.prod.outlook.com>
 <BL0PR04MB6514E16F46007EC1EEC5126EE78D9@BL0PR04MB6514.namprd04.prod.outlook.com>
 <161301058101.1254594.1361185438418159772@swboyd.mtv.corp.google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:4d23:6652:258b:81d8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c1238f29-4b2e-4c0c-161b-08d8ce354b5d
x-ms-traffictypediagnostic: MN2PR04MB6701:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR04MB670121D4E5192DF1CFE87B10E78C9@MN2PR04MB6701.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mBjbCM+FAsPyrVWtQ9SybUhqC0FTQtTekVgqNB2Ua1nqNqXNr/xYDvTWi968ZpzgWTcHyOkHGnSjvEjkZEbavkfS+2DAwP4yJr9zl3RpspWvAWqZtaC5G3mVcm9vMyYuhLHF51xfGH1/Ps3WZUM0yyAzyNB8XuxmOBxvfKF/6Kvt1sgIkGTKUOKnl7EYiTPD4Hh+ctULkkuw7vqzK4VswkteBudhamcV8EXNwm/B1wePkTqA42yIUdrcCF3IeK7OuLTuCiwlUZSXb+8T/oN4THeH5R2FXUKtInNzM6BonDBPy5erPOUDtoyb7cHGz4scbAcobO21Rcj1OPgCrrK22UotnEf9hsiSMadpYCf5wGYsiYvdFy5A5Y8WHdCCmnBxNtLP27SYrRA/wakfc4OgBH1JO8UYcTaUv+243dWogmw2BFzkjooAL4TSmexIRTmvt3dtXw7+XcH7Obzu9AV/1jC0ASr4eUscylb+Uv5Egw3YEjeD1eKBKiDmrghmle+KfQcLMDhOaS02iHAGiO7y0Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(376002)(396003)(346002)(39860400002)(4326008)(478600001)(66946007)(186003)(53546011)(71200400001)(86362001)(6506007)(7696005)(33656002)(83380400001)(8936002)(66476007)(66446008)(64756008)(66556008)(91956017)(76116006)(2906002)(8676002)(54906003)(316002)(9686003)(55016002)(110136005)(52536014)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?HJfcz81SKqthMCOZIzAEFCsne6HR5Kb8iZoTtqFMwEtmKKWiyBkcGugBtEOe?=
 =?us-ascii?Q?hEdRyhenASW2rD48s0v6FvAxcRGy/y8uRC1nh0ilxePUYAziX41sVCJxUQx4?=
 =?us-ascii?Q?FUEjBaUBlVo7DAxV6WX42q1PR4lihxZqnI62fzT3yDLRp5oNgNoXEKRWVpcJ?=
 =?us-ascii?Q?4Svl9gmceneshAEqWVH8TdB9hEs105sM+ER6jBALMEvrh8zpOs2MWNI86sSE?=
 =?us-ascii?Q?2vU7Skf/+sYVCeGs//cPoyiD/2nhxG42RPm995HWs8aQMD3kmgGV5ZTkMqGO?=
 =?us-ascii?Q?5WM/fLLHr5iXO9NfYN2Zss2l32fJjTKUD+++LD4K/XyDmy26eRmTuO9nHgLR?=
 =?us-ascii?Q?kr1C7CaApGSYKsIb0Synsx2ypU5zjnaDEtJ9qlGQppX0o0kKK1C1cS1yJihb?=
 =?us-ascii?Q?t2yFwB0FWLmkMfWcDkyvk8bPCnZkVip20Wj/znaqes26QZ3tzxSnWZ32TpQq?=
 =?us-ascii?Q?lguMEYdo8/3pY0wsX3dnrC2cFMMlpdZXXVhAUJp/Op3vuuqYsKavKjLCKSTm?=
 =?us-ascii?Q?H6igLQZFcO97CKLJ71kEL3cgGKqU2g0qcZWJb7ayHpZ362K5pKdDIC/ppJlC?=
 =?us-ascii?Q?bTs49Ja0CVN//FWcJfcMHgNcws2/Ya+PHgyxy+PijbqfjIvZSWQQhlZd6jw2?=
 =?us-ascii?Q?mcKWWOSeMWGqUmtY7deAN2ikphE0Wc3YCxRXeY8sdIHlZMpQHN0Kz2gBc7E0?=
 =?us-ascii?Q?xPCgSErjyg8ryUQjn7CJkqwoXhCOcJLsSZo7gmaR030GVbJoGU6etxIHz5yg?=
 =?us-ascii?Q?ngHfF4aFrH25G+EkINOCr+XmxOIZwx3BDcQpk6m+TgSK9yi7lTZ8qmaaHcrW?=
 =?us-ascii?Q?hb6BKJ9lwFiRZENtULQuk9vk+Olrig7P43ilXplvJBVVwxwAsG7scW5+dwI5?=
 =?us-ascii?Q?8EhYNIeRYe6jSNl9eY0MfvVD6kdjFMMfD/YEM7dmrkNwvV9r6LQohQVw6vWU?=
 =?us-ascii?Q?U+YXfjMSAps5HZp1Ief/gDAIUHrWcHdPiqjJIdzh0O7KLlPRchzLG4jrRGit?=
 =?us-ascii?Q?ioPDkfonyvLLmraLLenlXXcL9zCLErq3cDXCEn+MCSpy8PnMGvaPRg5YwzsM?=
 =?us-ascii?Q?uCIvINDiJZzj95Lxqmf+kjspn2aq0KJlWK4lWEqby1zIz9AsRUQwDu6qLGC2?=
 =?us-ascii?Q?Dp0vQpY9Dv41laU6++9eehwh2ezbhz/BqwUo4UuSfvp1zKG7AaRtg2JhIaBA?=
 =?us-ascii?Q?5lA6yQh+DgarfokMg3h84Cbv6XZRbv01ywpfSSRuWYHI/Et8K1rh8ynvBtFb?=
 =?us-ascii?Q?G59ZspnwqcQDgLJwzRj/tU2WXEKuU5aDAsn7jcMwpCNQsLHXserAUPpxWDvS?=
 =?us-ascii?Q?QwTMGfdtMndOO0KidedTvEZu9/I8zaJMDLPkyT2Q31CM4cQtY5DDHKi4vghN?=
 =?us-ascii?Q?HmU/6U+5MVlm91yreRQZfcejHVrXFN9S16xRe8bK7oG/9cNvUQ=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1238f29-4b2e-4c0c-161b-08d8ce354b5d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2021 02:32:36.4830 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ln7WiQUMpkL7kGKGyCasxsXKgG+GRFr0lo+oPN560ywl5bDLPIeUx9li2AXjQyhwXX2hpWS9zG+tnp1LMc6IPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6701
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_213243_079701_5D3482AA 
X-CRM114-Status: GOOD (  13.13  )
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
Cc: Atish Patra <Atish.Patra@wdc.com>,
 Michael Turquette <mturquette@baylibre.com>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-clk@" <"vger.kernel.org linux-clk"@vger.kernel.org>,
 Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2021/02/11 11:29, Stephen Boyd wrote:
> Quoting Damien Le Moal (2021-02-09 20:32:34)
>> On 2021/02/10 12:15, Damien Le Moal wrote:
>>> On 2021/02/10 10:24, Stephen Boyd wrote:
>>>>> +               return;
>>>>> +       }
>>>>> +
>>>>> +       in0 = of_clk_get_parent_name(np, 0);
>>>>
>>>> I'm still lost why we need to get the clk parent name here vs. using the
>>>> index approach and using clk_parent_data. There were some comments about
>>>> #clock-cells which didn't make sense to me. The fixed rate clk in DT
>>>> should have #clock-cells as it is a clk.
>>>
>>> It is like this because I could not get your suggested approach to work. I am
>>> using clk_parent_data[]->hw for specifying the parents of the clocks registered
>>> by this driver. But using this data structure, I failed to figure out how to
>>> specify the "in0" clock as a parent without using the clock name itself. The
>>> other option I see is using fw_name (I do not understand that one) and hw, but I
>>> do not have that pointer since the clock is registered by the common framework.
>>> What am I missing here ?
>>
>> Revisiting this, I think I got it. All I need to to is set ".index = 0" in
>> clk_parent_data[] of the clocks that have in0 as a parent. Very simple indeed. I
>> removed the ino clock name stuff.
>> Testing and sending out v19.
> 
> Great!

I posted v19 yesterday. I hope you got it.
Your review/ack would be very welcome :)

Thanks !


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
