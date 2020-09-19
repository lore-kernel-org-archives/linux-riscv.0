Return-Path: <SRS0=zSrB=C4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7393C43463
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Sep 2020 03:32:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2859206FB
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Sep 2020 03:32:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j3xPT0AC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="poJVuT4/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="XHvRMzDb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2859206FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TUF64A5qlTE335+/Sm9jiWtO/jmI98YlwjQc0/ju0Gk=; b=j3xPT0ACqELvOXLBas9sDLVPb
	YWmsyh9G9TpryK+estCnR0ZSwJIeqTokdC+WiRHLd3QQ5yM7d+jSW9DFJ/CfyZp/PP8umpLWPVzWn
	B+fRZ7wKZPdVZAVxhW6zLivNUNiVI3mQsgNroPZ61IlVEkuwn2gfBMDix57CyL/dfYv1iHNyzB2WL
	36tQXqmnGzO9wBdHa/uhK0krCRrjsMXnjcFlfFsawp8GslSxcoX6PhvOVhDDHCfFswAseO+pMcnEf
	DIdM2MbD7s8SNso6RN138wANILwur/DuRPYRQq1gZKB1iaOXx3tqvoV8Y2rR7yX1XCj2Vnrw63uq4
	7hSPhssyw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJTbp-0001Eg-Nu; Sat, 19 Sep 2020 03:32:21 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJTbm-0001Du-7k
 for linux-riscv@lists.infradead.org; Sat, 19 Sep 2020 03:32:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1600486339; x=1632022339;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MxD37zJEYAITU3E770FLrWInIkKwUE54Dm5NHVWZT2I=;
 b=poJVuT4/EKP+Is8sx3CJuE5ww1wpFBpTCIhNuEatOdTCiq1dTtmy7AUa
 Vo6LpbiYOn9i+vkO0OdYa+M5vgi02Y2ilTQeKn2ANIpyBwCNPmjVlo9o4
 sMvAG6GaH8LflArrD3bpTjuDTWbmzs8g11p7r0jGBWx89Fh0lE544A95O
 LoULn96TULi0dRKZ9+t7yk7kd5w6XZqAolKOxNCbc8JEXZFXhtc0mAjHY
 iP+A9Q+Pi10uxVjX5/FMjRZHmwLogC2d/8qIuM+OUIqDhazTwfXTf4fZi
 e+sIBcBh9xryexrDxO5462a89es07kpSckgcrCuT/xPHsRhQFpt5MJAVi w==;
IronPort-SDR: x8E5eJxgiloQb0GC20uc2ByAfN7gSTcISkffoxCZrOZvoRvWWc5oqHxkIqnKMJGYnpseBZtlGZ
 vGnByLpKHxt3NyfTp7eYLrlwAUtE3PeFE5o6v4YvVqtQT9S9aJM07JADP/1BnVOPy2CFXp8Jul
 QqLpbo+rtxBGeW4k8aqGHt5ic3vYtnntvpaQwhgTROiPFF0nBON8pB+01YZwFzu3M1VgT9veXH
 ddjNXPQj3+Szhnkl97MAPy8swLvQMuCfp2LIO20GUwQRnoqSUFSsW0Tf/I7OTSs56vGV6xJ2Ll
 8U0=
X-IronPort-AV: E=Sophos;i="5.77,277,1596470400"; d="scan'208";a="147788552"
Received: from mail-bn7nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.100])
 by ob1.hgst.iphmx.com with ESMTP; 19 Sep 2020 11:32:15 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nsqWBKFfynbMORu3h5t6cJEJTgj9Q5yeDEvDs004eGeWOJNt1i/KdGMOfrqcxS4YauOLleSzpF9EVZMSN5rk63pA68rORszA54fVzAKLC9sIMq4UUgOPz/9FmrIri9IKQm/GCAbX52NHV+9+UgiWREugEhmpwWiOkgTZeCREutqkAR4WXCO4OBAiAdhnZcAFEl89ixZHakn2MlM3csSHJVBbs6Jw7mu8HqkZ7WA+avtr8xObHu+u6dci0x5zod9aOTTLgx/ow+AyRd9A4d6CY1pT5B53M1A6hJMsoW2VKuMMUXfGDtEHI1z+S5baaf2MIPphrqrNUwufVu5XOsA8lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MxD37zJEYAITU3E770FLrWInIkKwUE54Dm5NHVWZT2I=;
 b=nQHxx47ZQx+cPK1O7A7SB1MWy/ANOcRc37SsR9V+np0sm13YYL0saeNiSyJEc6YansA3uqCs7Bt5Pbi8YuLTsxnbYlf8dkx9p1fU/GMASmN2Hwq/NH4A3RWhWY1cFyfMLaLrZGsZTAaDXsFP/yAyQf/OTF4trO5L0rhqUen3od31NLHxKEPsU3OfJijb9nmIifbUQzWj7Gl7122KnChx27P1DPr55h1GIbOp+4TxJJzjA8xuxlnlZzvjb4zF2A39o9cp5TwlxJXKHxmA83q4nOSlCy2q/ZyQxRn2mOlPkaisNee+jELMbsMAGQ/u8t9EHdGMP7xHe/tO81LcnuoVCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MxD37zJEYAITU3E770FLrWInIkKwUE54Dm5NHVWZT2I=;
 b=XHvRMzDbGipGDmSnDQp4ig551kWCShHhqqcH88Z59D4krdeAN5AauNCyETbA39fXlajQTJ7PC6OYX+U0HdklFESoOpc0+ZWz3SffnH5kL37TUkBp6vU2exQuI494Bn97z264JKI1QKpoB3AIhyWaTQzyui192/oG60PlyRtGe+E=
Received: from DM6PR04MB6201.namprd04.prod.outlook.com (2603:10b6:5:127::32)
 by DM6PR04MB4459.namprd04.prod.outlook.com (2603:10b6:5:2b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Sat, 19 Sep
 2020 03:32:12 +0000
Received: from DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::607a:44ed:1477:83e]) by DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::607a:44ed:1477:83e%7]) with mapi id 15.20.3370.019; Sat, 19 Sep 2020
 03:32:12 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Palmer Dabbelt <palmerdabbelt@google.com>
Subject: RE: [PATCH] RISC-V: Resurrect the MMIO timer implementation for
 M-mode systems
Thread-Topic: [PATCH] RISC-V: Resurrect the MMIO timer implementation for
 M-mode systems
Thread-Index: AQHWirrGhFoSIfuO5k6oZYkM2y9oYKlo85ZQgAZXRQCAAAoI8A==
Date: Sat, 19 Sep 2020 03:32:12 +0000
Message-ID: <DM6PR04MB62013EB500376B0B7EFDFCAB8D3C0@DM6PR04MB6201.namprd04.prod.outlook.com>
References: <DM6PR04MB6201E20439CC8FB561981AE78D200@DM6PR04MB6201.namprd04.prod.outlook.com>
 <mhng-02b0ff1d-50e3-4b73-94ef-0a7736caeca9@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-02b0ff1d-50e3-4b73-94ef-0a7736caeca9@palmerdabbelt-glaptop1>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [122.171.209.51]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b8917a80-e3d3-42f5-c7f9-08d85c4c98e7
x-ms-traffictypediagnostic: DM6PR04MB4459:
x-ld-processed: b61c8803-16f3-4c35-9b17-6f65f441df86,ExtAddr
x-microsoft-antispam-prvs: <DM6PR04MB44592DECCC8721E7E700A88D8D3C0@DM6PR04MB4459.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WQS0HBEBGndU3W9Z/na6frrK9wlEvOnW3fT2i+bvupWZ2gLVgldYk2pGFkeb5R5Ny2K/6rPAzR7RXsDR55lzPaUizR5O5RA8915ej5H8DfOqblGYpNTy0FtVmmB0RhheAqbYp8LJvP138x8nsLjnIFON80G4yD/Cr4p3yo35KEqPIsqNRClRiKPGL1E991s4vmxmT5SSnmzQfKSAQ1ly2QjwIFlFYIArVD0auWByQw+hBM4j4vT0nUKpntgrmi6tthJQayKB23fOcvCTy8lbYtKVTKdVtYdrw//k9Vk63I7XKfYrFKzjH3KzHdhTHo66ts9szaE7AXOw5kbZP9cg0zikkSuGYQ35KyAiWckiN/jkEiLGUljkl6PxdFOnfKbW
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB6201.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(396003)(136003)(39860400002)(66476007)(66446008)(66946007)(8676002)(66556008)(86362001)(64756008)(33656002)(52536014)(8936002)(4326008)(53546011)(6506007)(186003)(76116006)(26005)(7696005)(9686003)(55016002)(316002)(54906003)(71200400001)(6916009)(5660300002)(478600001)(83380400001)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: qBRhWIMZEBhaNWidWA36KjaqPoN0bU/t92FRvDft70JaRAuhqcOByJfSqs5XrPLq8GYlQxFdPp5bOex6jrRyY8djbk7pWAEORCLkDH88w7G1+Bf0MOrQnZ4B/QWvdXYbazb/X10Fh05uBPpwoU53QGBsVE8Wk4nKqR+lVm/EDbzbo06VUAW6g5iU/vKrFVkS1x6hNtrWNX/RaXDZJLNzbZvlQ9eO/SG+rlZd8Xn8tpX6WBYnQ033uw4FjmAqMvnn61rwPA0PoecWyJlJcjJQX8IQ8dab5wbYLMnF26LAzVd4ue1YeIlHyJPjFVs5Z2k9t0oi9O8oJyGA50dXIQEqBdWDAoZoD9YWR4iPJ9zsljAKB2LmqYjc/T2sKWl02lVK7176Xzu35NcTAMqaSPSAtXNEEFCxQxwt/xs3T2jWrA/XsZ9ygILxriaVBc61/L9235DyPPZFWM5ypn22hfeKtShITFmlNRMMJAK9zOG9EjmfZSwPH8S/gBstYjqGtuDt89WSmL9CTNziA70dxCvJEe7yGvpJss2xa+fZBfMf3BCC/+fsZqmYWdoiAcuhhYLIE/6msN0NM9/dFltNhhaaR/mmkpWMFTe2n7CjKEaARaZvKTcWSMUEE4xrWuTjh1RCv5lSniXaAfBu2+TbDEXZzg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6201.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8917a80-e3d3-42f5-c7f9-08d85c4c98e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2020 03:32:12.4192 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0SnR0niX7zdo/xGp4o0cXWBpeXWUbpVWBu0e0iibma/IZpynQmqSDfpgI1vkvB1avhvfkneJ1zN+kRz84cG0Aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB4459
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200918_233218_629811_718450A2 
X-CRM114-Status: GOOD (  40.03  )
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
Cc: "hch@infradead.org" <hch@infradead.org>,
 "anup@brainfault.org" <anup@brainfault.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "kernel-team@android.com" <kernel-team@android.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



> -----Original Message-----
> From: Palmer Dabbelt <palmerdabbelt@google.com>
> Sent: 19 September 2020 08:24
> To: Anup Patel <Anup.Patel@wdc.com>
> Cc: linux-riscv@lists.infradead.org; hch@infradead.org; kernel-
> team@android.com; anup@brainfault.org
> Subject: RE: [PATCH] RISC-V: Resurrect the MMIO timer implementation for
> M-mode systems
> 
> On Mon, 14 Sep 2020 19:11:46 PDT (-0700), Anup Patel wrote:
> >
> >
> >> -----Original Message-----
> >> From: Palmer Dabbelt <palmerdabbelt@google.com>
> >> Sent: 14 September 2020 22:27
> >> To: linux-riscv@lists.infradead.org
> >> Cc: hch@infradead.org; Anup Patel <Anup.Patel@wdc.com>; Palmer
> >> Dabbelt <palmerdabbelt@google.com>; kernel-team@android.com
> >> Subject: [PATCH] RISC-V: Resurrect the MMIO timer implementation for
> >> M- mode systems
> >>
> >> The K210 doesn't implement rdtime in M-mode, and since that's where
> >> Linux runs in the NOMMU systems that means we can't use rdtime.  The
> >> K210 is the only system that anyone is currently running NOMMU or
> >> M-mode on, so here we're just inlining the timer read directly.
> >>
> >> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
> >> ---
> >> I don't actually have a K210 so I haven't tested this.  If nobody
> >> else has the time to I'll put together a QEMU that doesn't support
> >> rdtime in M-mode, but I've yet to mess around with the !MMU stuff so
> that might take a little while.
> >> This certainly doesn't seem worse than what's there right now,
> >> though, as rdtime isn't valid in M-mode on the K210 (our only M-mode
> platform).
> >
> > I think you missed my comments in the previous email thread.
> >
> > I would request to make this patch bit more CLINT independent.
> >
> > Please see inline below.
> >
> >> ---
> >>  arch/riscv/include/asm/clint.h    | 26 ++++++++++++++++++++++++++
> >>  arch/riscv/include/asm/timex.h    | 27 +++++++++++++++++++++++++++
> >>  drivers/clocksource/timer-clint.c | 17 +++++++++++++++++
> >>  3 files changed, 70 insertions(+)
> >>  create mode 100644 arch/riscv/include/asm/clint.h
> >>
> >> diff --git a/arch/riscv/include/asm/clint.h
> >> b/arch/riscv/include/asm/clint.h new file mode 100644 index
> >> 000000000000..0789fd37b40a
> >> --- /dev/null
> >> +++ b/arch/riscv/include/asm/clint.h
> >> @@ -0,0 +1,26 @@
> >> +/* SPDX-License-Identifier: GPL-2.0-only */
> >> +/*
> >> + * Copyright (C) 2020 Google, Inc
> >> + */
> >> +
> >> +#ifndef _ASM_RISCV_CLINT_H
> >> +#define _ASM_RISCV_CLINT_H
> >> +
> >> +#include <linux/types.h>
> >> +#include <asm/mmio.h>
> >> +
> >> +#ifdef CONFIG_RISCV_M_MODE
> >> +/*
> >> + * This lives in the CLINT driver, but is accessed directly by
> >> +timex.h to avoid
> >> + * any overhead when accessing the MMIO timer.
> >> + *
> >> + * The ISA defines mtime as a 64-bit memory-mapped register that
> >> +increments at
> >> + * a constant frequency, but it doesn't define some other
> >> +constraints we depend
> >> + * on (most notably ordering constraints, but also some simpler
> >> +stuff like the
> >> + * memory layout).  Thus, this is called "clint_time_val" instead of
> >> +something
> >> + * like "riscv_mtime", to signify that these non-ISA assumptions must
> hold.
> >> + */
> >> +extern u64 __iomem *clint_time_val;
> >> +#endif
> >> +
> >> +#endif
> >> diff --git a/arch/riscv/include/asm/timex.h
> >> b/arch/riscv/include/asm/timex.h index a3fb85d505d4..7f659dda0032
> >> 100644
> >> --- a/arch/riscv/include/asm/timex.h
> >> +++ b/arch/riscv/include/asm/timex.h
> >> @@ -10,6 +10,31 @@
> >>
> >>  typedef unsigned long cycles_t;
> >
> > The entire asm/clint.h can be avoided by adding "extern u64 __iomem
> > *riscv_mmio_time_val;"
> > here in n asm/timex.h
> >
> > Also, this will make it bit more CLINT independent.
> 
> Except that, as per the comments, it's not CLINT independent.

We just need some 64bit MMIO register. It could be CLINT TIME register
or some other timer. I don't see anything CLINT specific apart from the
variable name "clint_time_val".

Regards,
Anup

> 
> >> +#ifdef CONFIG_RISCV_M_MODE
> >> +
> >> +#include <asm/clint.h>
> >> +
> >> +#ifdef CONFIG_64BIT
> >> +static inline cycles_t get_cycles(void) {
> >> +	return readq_relaxed(clint_time_val); } #else /* !CONFIG_64BIT */
> >> +static inline u32 get_cycles(void) {
> >> +	return readl_relaxed(((u32 *)clint_time_val)); } #define get_cycles
> >> +get_cycles
> >> +
> >> +static inline u32 get_cycles_hi(void) {
> >> +	return readl_relaxed(((u32 *)clint_time_val) + 1); } #define
> >> +get_cycles_hi get_cycles_hi #endif /* CONFIG_64BIT */
> >
> > Use riscv_mmio_time_val instead of clint_time_val above.
> >
> >> +
> >> +#else /* CONFIG_RISCV_M_MODE */
> >> +
> >>  static inline cycles_t get_cycles(void)  {
> >>  	return csr_read(CSR_TIME);
> >> @@ -41,6 +66,8 @@ static inline u64 get_cycles64(void)  }  #endif /*
> >> CONFIG_64BIT */
> >>
> >> +#endif /* !CONFIG_RISCV_M_MODE */
> >> +
> >>  #define ARCH_HAS_READ_CURRENT_TIMER
> >>  static inline int read_current_timer(unsigned long *timer_val)  {
> >> diff --git a/drivers/clocksource/timer-clint.c
> >> b/drivers/clocksource/timer-clint.c
> >> index 8eeafa82c03d..d17367dee02c 100644
> >> --- a/drivers/clocksource/timer-clint.c
> >> +++ b/drivers/clocksource/timer-clint.c
> >> @@ -19,6 +19,11 @@
> >>  #include <linux/interrupt.h>
> >>  #include <linux/of_irq.h>
> >>  #include <linux/smp.h>
> >> +#include <linux/timex.h>
> >> +
> >> +#ifndef CONFIG_RISCV_M_MODE
> >> +#include <asm/clint.h>
> >> +#endif
> >
> > As-per, above suggestion drop this #include.
> >
> >>
> >>  #define CLINT_IPI_OFF		0
> >>  #define CLINT_TIMER_CMP_OFF	0x4000
> >> @@ -31,6 +36,10 @@ static u64 __iomem *clint_timer_val;  static
> >> unsigned long clint_timer_freq;  static unsigned int clint_timer_irq;
> >>
> >> +#ifdef CONFIG_RISCV_M_MODE
> >> +u64 __iomem *clint_time_val;
> >> +#endif
> >
> > Define and export "u64 __iomem *riscv_mmio_time_val" in
> > arch/riscv/kernel/time.c
> >
> > This way no "clint_time_val" definition required here as well and
> > other MMIO timers can also set riscv_mmio_time_val.
> >
> >> +
> >>  static void clint_send_ipi(const struct cpumask *target)  {
> >>  	unsigned int cpu;
> >> @@ -184,6 +193,14 @@ static int __init clint_timer_init_dt(struct
> >> device_node *np)
> >>  	clint_timer_val = base + CLINT_TIMER_VAL_OFF;
> >>  	clint_timer_freq = riscv_timebase;
> >>
> >> +#ifdef CONFIG_RISCV_M_MODE
> >> +	/*
> >> +	 * Yes, that's an odd naming scheme.  time_val is public, but
> >> hopefully
> >> +	 * will die in favor of something cleaner.
> >> +	 */
> >> +	clint_time_val = clint_timer_val;
> >> +#endif
> >> +
> >
> > Just set " riscv_mmio_time_val = clint_timer_val" here.
> >
> >>  	pr_info("%pOFP: timer running at %ld Hz\n", np, clint_timer_freq);
> >>
> >>  	rc = clocksource_register_hz(&clint_clocksource, clint_timer_freq);
> >> --
> >> 2.28.0.618.gf4bc123cb7-goog
> >
> > Regards,
> > Anup
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
