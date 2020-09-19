Return-Path: <SRS0=zSrB=C4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8D6FC43463
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Sep 2020 04:54:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4169F20789
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Sep 2020 04:54:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ixjtkrYF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="im71vbnp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="z5nZA9Lj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4169F20789
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7kC9PR82rssb1nIq+T8iCTijY+ZVlRU3Bsg83JyAmBQ=; b=ixjtkrYFU9/9DUL0bhHq+20j6
	w2aAg6o9PYVYNW5hZ2G1SODicBIHehOO389a521bjU/6w+5+sb8O7n0eyjP7CvYKayKqDTz4i/Dex
	9CQ5G/yqA/1le5fXA4x3mjCm8+XqmRVzS3/TkKbZq+VOZrIR6F5P1LlHQNkWyY1wDZ9ContkA8emK
	iw2WBueE6RMFYDC7AAeHryWJW36aTinv3XvvVmAoKb6nLOeFLl+RlHvtIOzdpWLoWDbuZVjuTpWKQ
	OjFnGKNJ+aTkCtVhgat263OutohHaaD/auUwgLlomB7ddT/7/rZ0Ov/xIClsjV+AnTFxeY2AJS+pe
	a/141rUzQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJUtT-00040o-7b; Sat, 19 Sep 2020 04:54:39 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJUtP-0003zu-HI
 for linux-riscv@lists.infradead.org; Sat, 19 Sep 2020 04:54:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1600491275; x=1632027275;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9hThLK41PQZ3ZQPtgjTT7y+zs6NYompxABi/Uvi2bcs=;
 b=im71vbnp7dvQNmXwns2dS5HvoOb7ZELmargJLb3Dw4DF4wAofBXElcPJ
 Vv1K8NyYY2GrS3oqs+bdaVgI0AIChqMXw2T3J/b+HtF3X/6L1Z+umW/dc
 XkbLEsD9fNk5Nm9O5R690jt1Je3oxjyWCXgP+k4R01GiquGkl9RC/zEti
 IIYHKTtJW+j8apFXXoJNCqYp5UYFDRMqME+g6cSyEd1ZXAL/sHHwB0I+E
 3qCYbw6V4EllucFoVWcDDFqK7e30Hqg+K9pQaV5yHJD/pbGjfAdOsaryY
 ef2ddgduZ87VAp1Lxyo7Axr+eddZXvmsr1dbsUePgAIF3xzx6MIRx+QfX Q==;
IronPort-SDR: qasy7SQjdf6IG7hCKzqlXe3KIGvKok85U+R7oxg4zW4+CjiuXZmkCQFz3tvHhiKfBpfqaRBQZA
 s9IU2dbsENsxagV3fxreh/qNs9NPfvJZhTvfQ1lwm/Z3tt/94p3YOdV4N825XRf3rEsVgvvfMQ
 P6XbfAPbWn1sxZwLGop7i2CyMSp4vCDNTN5bC23eQrVtR6WT97xtetb9Oua9477HfhTyYYeMx4
 q/7jZnwuwbPQKGQNyAlz+fULqxkHS5Ec0cABo9TRH9wh3sFmRv6fvM3FUtIWHLitDYz5YX883V
 /mk=
X-IronPort-AV: E=Sophos;i="5.77,277,1596470400"; d="scan'208";a="147791641"
Received: from mail-bn7nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.105])
 by ob1.hgst.iphmx.com with ESMTP; 19 Sep 2020 12:54:13 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uq9j52kqxQWaFFMUZGeXRC79svWdOQIc+L8dsnlvROS21+9G3JQG5XZl7T+HDE07QVVdat0oy4QF6udEvvtdZwHUwoTiZGo8EeSR1pkoImT54/dbEP4GwcSdEWV0W9LvqtOuzFXqTGjrdi4Nq8FJaKfOV7IgxdpPdS1nM6NCcHlXNYwNkGmIM17dfAwKFLz4CuYxUHR8qE6UhADo+vpMTKrO7v0Tmj/UUGJY4SQ6hBxXU1Pd6mkUJcUTvoAHpML4ejd9XDDflfaxP6zjQAKFCzf88TmCGy0+bvKyrH6NfBI0o6wa0kH2XLh3U4+E6qlDZaXqfEVcgqdOK0EFfldEDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9hThLK41PQZ3ZQPtgjTT7y+zs6NYompxABi/Uvi2bcs=;
 b=NjbKtyVQcPnk5Mnet4uk1Mr+c2DgdRbqA8HpoLjMwutC+uqHAI0z2cHpY244KtbSjGLdUUn9tXsf8lFYEBGAkeb0RLrGjPrGQdGr53qHLFhCTKqc9nmFpoMo/Jlk9ZY7JQDZEWemQi+SigEVGJHI39E3hxYMCK1v7csGFkN9Wu3rD6oT2mKkisxtEahEXHVyq/fVjYEVmfmulBZfvINaHmzStRilYiBuTTwQCHPJ38XthQIyEW0MX4myykd4Z60H6BSczIn21j/qgOYwRiMcs6dbZuRiJESxW09ZLXjlGzrzVAaxJvL28RvfGh3MBU6ChXoOVdX6fnz3CJgNAp0DNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9hThLK41PQZ3ZQPtgjTT7y+zs6NYompxABi/Uvi2bcs=;
 b=z5nZA9LjzlO4mTnmRAPF/BUD1zKD3FF3GhCqbErNDFqH+oQqJUoaI48RkXLAhDTNgHmjIJP0yQ3elGlkwBdIpqxz4lX01zcqU/qfNhyGgplzwcW4pC5YTsllqA9amqsWUtT3xMnR2PWy52WDcyIdFQK7j+rMttwLqhjC6Ih+o1Q=
Received: from DM6PR04MB6201.namprd04.prod.outlook.com (2603:10b6:5:127::32)
 by DM5PR04MB0828.namprd04.prod.outlook.com (2603:10b6:3:fa::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15; Sat, 19 Sep
 2020 04:54:10 +0000
Received: from DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::607a:44ed:1477:83e]) by DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::607a:44ed:1477:83e%7]) with mapi id 15.20.3370.019; Sat, 19 Sep 2020
 04:54:10 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Palmer Dabbelt <palmerdabbelt@google.com>
Subject: RE: [PATCH] RISC-V: Resurrect the MMIO timer implementation for
 M-mode systems
Thread-Topic: [PATCH] RISC-V: Resurrect the MMIO timer implementation for
 M-mode systems
Thread-Index: AQHWirrGhFoSIfuO5k6oZYkM2y9oYKlo85ZQgAZXRQCAAAoI8IAAEpsAgAAEDtA=
Date: Sat, 19 Sep 2020 04:54:10 +0000
Message-ID: <DM6PR04MB620117BFF87616738EEFE2DB8D3C0@DM6PR04MB6201.namprd04.prod.outlook.com>
References: <DM6PR04MB62013EB500376B0B7EFDFCAB8D3C0@DM6PR04MB6201.namprd04.prod.outlook.com>
 <mhng-79ded15c-f87f-410f-875d-dc8457958f65@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-79ded15c-f87f-410f-875d-dc8457958f65@palmerdabbelt-glaptop1>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [122.171.209.51]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8c9eb5ba-b8ed-415e-c90b-08d85c580c11
x-ms-traffictypediagnostic: DM5PR04MB0828:
x-ld-processed: b61c8803-16f3-4c35-9b17-6f65f441df86,ExtAddr
x-microsoft-antispam-prvs: <DM5PR04MB08288F658C31133F7C9D18B38D3C0@DM5PR04MB0828.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ltnZ9UNCVn6FtXBbFxRg3RMNWTmwnpH607ZmDXWbJ33oBeDnjK5mXqJVNDjEuQWQKiae3qvQIn3mfntaj6NUTxHNws3IvVrzdlRotOZYZktUCU/+KWLbtzrQdRCdSMviYWSlqvQRhTMweB0kvG9Dg1cude/IPlaaOW1bpu8H/qCd1RqOFzcqA3lSafb7pQ7c5eqAxijVmY7bI/btiJhmihIPO1DQnRLMfYc6zq7du2KTgDBR/sASwF6yTxr8kDKUh5nCkxnezgYO+Q09eNcQ5yPuoio7yuX04FnU6REL3+keNUSAxq590ecE5z7MG1G8zjoAybrWHtSEnQwi9JKoXQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB6201.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(346002)(376002)(396003)(136003)(2906002)(478600001)(53546011)(316002)(30864003)(186003)(26005)(66946007)(8936002)(55016002)(54906003)(52536014)(7696005)(9686003)(64756008)(76116006)(8676002)(66476007)(66446008)(66556008)(71200400001)(33656002)(83380400001)(6506007)(86362001)(5660300002)(6916009)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: wcttmGwfI4qY7jDUaTOhADm+Zyd1CCdLswUEAMDrfKp5WHoPKBHbit08Fpd8ZYbMHP22Dv38KKjj8QH1zksmfoygP8pQd6W9lR+qUnq+AI3ajBlStPa0iVD1MWYInUSkTgkq41gIeXJSa5BH+UhWClEZ/x9a5WYP9SDYqnJ7qCS6/gUvWE321iisY12FmqgMFHtyxV9hoq0U2EkJ5/7YOxKCt0TQvKp1RP2bEtO2bzV8+za/QKCM6L30VOfuvlVYfbVmMfikeLMpXuE5/d9uy90DErWWkzzVT/w80LC2gzpkDYkCcA8iXYWcAa39C+NcSpEBNjnrWxzHx9aOp8q/MrPINNBisNjqPlvuYRBvGRDMEEBQ731HiWQ0u7ZoyFbbRoHjPYrq2CGNu8IuxsJEnLx7TT0y5+uw8cNCkvC8pDS2HJ+H0bOndge8D7H1uwmfxbS+1gPxWy70XlMWz7a4yKPy8CrtaTLC4F/hwMndOL0VLqWIEneaKI05cK3HntuNBwvLyu56+Lxxx8YwH2p/onnA2u7YICUAadypTwQAYj69bpbw2brqO9YVJvCBWQTRT5TX0fWGrgOJqRK6gjGmjf1paq67g3+qkcmCNvWjfqNi3GgmN777EmRaZgWsEbpaSMnBYg1VzyXkasUi297ZKA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6201.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c9eb5ba-b8ed-415e-c90b-08d85c580c11
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2020 04:54:10.1245 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mf0bV3/0jf+NY5SnWpuKpcyWyOaKJKG/5QpVHlv0Rvv6qxTE7TBZZII1Rz3558+IhOTLNcVLGiOJlbjeRGkRBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB0828
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200919_005435_960289_E03052C8 
X-CRM114-Status: GOOD (  40.51  )
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
> Sent: 19 September 2020 10:07
> To: Anup Patel <Anup.Patel@wdc.com>
> Cc: linux-riscv@lists.infradead.org; hch@infradead.org; kernel-
> team@android.com; anup@brainfault.org
> Subject: RE: [PATCH] RISC-V: Resurrect the MMIO timer implementation for
> M-mode systems
> 
> On Fri, 18 Sep 2020 20:32:12 PDT (-0700), Anup Patel wrote:
> >
> >
> >> -----Original Message-----
> >> From: Palmer Dabbelt <palmerdabbelt@google.com>
> >> Sent: 19 September 2020 08:24
> >> To: Anup Patel <Anup.Patel@wdc.com>
> >> Cc: linux-riscv@lists.infradead.org; hch@infradead.org; kernel-
> >> team@android.com; anup@brainfault.org
> >> Subject: RE: [PATCH] RISC-V: Resurrect the MMIO timer implementation
> >> for M-mode systems
> >>
> >> On Mon, 14 Sep 2020 19:11:46 PDT (-0700), Anup Patel wrote:
> >> >
> >> >
> >> >> -----Original Message-----
> >> >> From: Palmer Dabbelt <palmerdabbelt@google.com>
> >> >> Sent: 14 September 2020 22:27
> >> >> To: linux-riscv@lists.infradead.org
> >> >> Cc: hch@infradead.org; Anup Patel <Anup.Patel@wdc.com>; Palmer
> >> >> Dabbelt <palmerdabbelt@google.com>; kernel-team@android.com
> >> >> Subject: [PATCH] RISC-V: Resurrect the MMIO timer implementation
> >> >> for
> >> >> M- mode systems
> >> >>
> >> >> The K210 doesn't implement rdtime in M-mode, and since that's
> >> >> where Linux runs in the NOMMU systems that means we can't use
> >> >> rdtime.  The
> >> >> K210 is the only system that anyone is currently running NOMMU or
> >> >> M-mode on, so here we're just inlining the timer read directly.
> >> >>
> >> >> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
> >> >> ---
> >> >> I don't actually have a K210 so I haven't tested this.  If nobody
> >> >> else has the time to I'll put together a QEMU that doesn't support
> >> >> rdtime in M-mode, but I've yet to mess around with the !MMU stuff
> >> >> so
> >> that might take a little while.
> >> >> This certainly doesn't seem worse than what's there right now,
> >> >> though, as rdtime isn't valid in M-mode on the K210 (our only
> >> >> M-mode
> >> platform).
> >> >
> >> > I think you missed my comments in the previous email thread.
> >> >
> >> > I would request to make this patch bit more CLINT independent.
> >> >
> >> > Please see inline below.
> >> >
> >> >> ---
> >> >>  arch/riscv/include/asm/clint.h    | 26
> ++++++++++++++++++++++++++
> >> >>  arch/riscv/include/asm/timex.h    | 27
> +++++++++++++++++++++++++++
> >> >>  drivers/clocksource/timer-clint.c | 17 +++++++++++++++++
> >> >>  3 files changed, 70 insertions(+)  create mode 100644
> >> >> arch/riscv/include/asm/clint.h
> >> >>
> >> >> diff --git a/arch/riscv/include/asm/clint.h
> >> >> b/arch/riscv/include/asm/clint.h new file mode 100644 index
> >> >> 000000000000..0789fd37b40a
> >> >> --- /dev/null
> >> >> +++ b/arch/riscv/include/asm/clint.h
> >> >> @@ -0,0 +1,26 @@
> >> >> +/* SPDX-License-Identifier: GPL-2.0-only */
> >> >> +/*
> >> >> + * Copyright (C) 2020 Google, Inc  */
> >> >> +
> >> >> +#ifndef _ASM_RISCV_CLINT_H
> >> >> +#define _ASM_RISCV_CLINT_H
> >> >> +
> >> >> +#include <linux/types.h>
> >> >> +#include <asm/mmio.h>
> >> >> +
> >> >> +#ifdef CONFIG_RISCV_M_MODE
> >> >> +/*
> >> >> + * This lives in the CLINT driver, but is accessed directly by
> >> >> +timex.h to avoid
> >> >> + * any overhead when accessing the MMIO timer.
> >> >> + *
> >> >> + * The ISA defines mtime as a 64-bit memory-mapped register that
> >> >> +increments at
> >> >> + * a constant frequency, but it doesn't define some other
> >> >> +constraints we depend
> >> >> + * on (most notably ordering constraints, but also some simpler
> >> >> +stuff like the
> >> >> + * memory layout).  Thus, this is called "clint_time_val" instead
> >> >> +of something
> >> >> + * like "riscv_mtime", to signify that these non-ISA assumptions
> >> >> +must
> >> hold.
> >> >> + */
> >> >> +extern u64 __iomem *clint_time_val; #endif
> >> >> +
> >> >> +#endif
> >> >> diff --git a/arch/riscv/include/asm/timex.h
> >> >> b/arch/riscv/include/asm/timex.h index a3fb85d505d4..7f659dda0032
> >> >> 100644
> >> >> --- a/arch/riscv/include/asm/timex.h
> >> >> +++ b/arch/riscv/include/asm/timex.h
> >> >> @@ -10,6 +10,31 @@
> >> >>
> >> >>  typedef unsigned long cycles_t;
> >> >
> >> > The entire asm/clint.h can be avoided by adding "extern u64 __iomem
> >> > *riscv_mmio_time_val;"
> >> > here in n asm/timex.h
> >> >
> >> > Also, this will make it bit more CLINT independent.
> >>
> >> Except that, as per the comments, it's not CLINT independent.
> >
> > We just need some 64bit MMIO register. It could be CLINT TIME register
> > or some other timer. I don't see anything CLINT specific apart from
> > the variable name "clint_time_val".
> 
> No, clint_time_val has other constraints.  The comment I added to describe
> these after you asked the first time is only a few lines above this:
> 
>     +#ifdef CONFIG_RISCV_M_MODE
>     +/*
>     + * This lives in the CLINT driver, but is accessed directly by timex.h to avoid
>     + * any overhead when accessing the MMIO timer.
>     + *
>     + * The ISA defines mtime as a 64-bit memory-mapped register that
> increments at
>     + * a constant frequency, but it doesn't define some other constraints we
> depend
>     + * on (most notably ordering constraints, but also some simpler stuff like
> the
>     + * memory layout).  Thus, this is called "clint_time_val" instead of
> something
>     + * like "riscv_mtime", to signify that these non-ISA assumptions must
> hold.
>     + */
>     +extern u64 __iomem *clint_time_val;
>     +#endif
> 
> To be more detailed, there's two issues:
> 
> * The ISA doesn't define a memory layout.  This one is a bit pedantic, as
>   there's an example of how to use the mtime/mtimeh split that would only
> work
>   for this layout, but those sorts of things tend to be non-canonical in the ISA
>   manual.
> * The ISA doesn't define any ordering constraints on mtime.  This one is way
>   more important, as right now we have a big pile of implicit ordering
>   constraints on IO regions that are required to make systems actually work.
>   IIUC the argument right now is that we're just relying on the various device
>   specifications to provide these (ie, if you have PCI then you better respect
>   their memory ordering consraints for your system), but I'm not sure that's
> as
>   strong of a position as we should be taking.
> 
>   RISC-V defines no orderings, however, for mtime.  IIRC there are some
>   implicit orderings on rdtime that we depend on (though I can't dig the text
> out
>   of the ISA tonight) but those aren't guaranteed by the ISA for mtime.  This
> all
>   works on SiFive's systems because the CLINT provides these guarntees, but
>   that's not generally the case for mtime as defined by RISC-V.
> 
>   Since mtime is a RISC-V specific thing we can't rely on some other
>   specification like we do for other devices.  We could, of course, fence
>   around this but that's likely to be way more expensive than the predictable
>   indirection that was called out as being too slow in the first place.
> 
> So this really is a CLINT-specific register.  That all seems a bit too much for the
> commit text, though, so I'm inclined to leave it as is.

That's why I had made it a callback function which CLINT driver can set and
other timer drivers can also set it. This way we are not mandating CLINT for
NoMMU kernel.

There is one more issue in your patch. You need to check "clint_time_val"
for NULL before using it because some parts of kernel will call delay timer
before CLINT driver is probed.

Regards,
Anup

> 
> >
> > Regards,
> > Anup
> >
> >>
> >> >> +#ifdef CONFIG_RISCV_M_MODE
> >> >> +
> >> >> +#include <asm/clint.h>
> >> >> +
> >> >> +#ifdef CONFIG_64BIT
> >> >> +static inline cycles_t get_cycles(void) {
> >> >> +	return readq_relaxed(clint_time_val); } #else /* !CONFIG_64BIT
> >> >> +*/ static inline u32 get_cycles(void) {
> >> >> +	return readl_relaxed(((u32 *)clint_time_val)); } #define
> >> >> +get_cycles get_cycles
> >> >> +
> >> >> +static inline u32 get_cycles_hi(void) {
> >> >> +	return readl_relaxed(((u32 *)clint_time_val) + 1); } #define
> >> >> +get_cycles_hi get_cycles_hi #endif /* CONFIG_64BIT */
> >> >
> >> > Use riscv_mmio_time_val instead of clint_time_val above.
> >> >
> >> >> +
> >> >> +#else /* CONFIG_RISCV_M_MODE */
> >> >> +
> >> >>  static inline cycles_t get_cycles(void)  {
> >> >>  	return csr_read(CSR_TIME);
> >> >> @@ -41,6 +66,8 @@ static inline u64 get_cycles64(void)  }  #endif
> >> >> /* CONFIG_64BIT */
> >> >>
> >> >> +#endif /* !CONFIG_RISCV_M_MODE */
> >> >> +
> >> >>  #define ARCH_HAS_READ_CURRENT_TIMER  static inline int
> >> >> read_current_timer(unsigned long *timer_val)  { diff --git
> >> >> a/drivers/clocksource/timer-clint.c
> >> >> b/drivers/clocksource/timer-clint.c
> >> >> index 8eeafa82c03d..d17367dee02c 100644
> >> >> --- a/drivers/clocksource/timer-clint.c
> >> >> +++ b/drivers/clocksource/timer-clint.c
> >> >> @@ -19,6 +19,11 @@
> >> >>  #include <linux/interrupt.h>
> >> >>  #include <linux/of_irq.h>
> >> >>  #include <linux/smp.h>
> >> >> +#include <linux/timex.h>
> >> >> +
> >> >> +#ifndef CONFIG_RISCV_M_MODE
> >> >> +#include <asm/clint.h>
> >> >> +#endif
> >> >
> >> > As-per, above suggestion drop this #include.
> >> >
> >> >>
> >> >>  #define CLINT_IPI_OFF		0
> >> >>  #define CLINT_TIMER_CMP_OFF	0x4000
> >> >> @@ -31,6 +36,10 @@ static u64 __iomem *clint_timer_val;  static
> >> >> unsigned long clint_timer_freq;  static unsigned int
> >> >> clint_timer_irq;
> >> >>
> >> >> +#ifdef CONFIG_RISCV_M_MODE
> >> >> +u64 __iomem *clint_time_val;
> >> >> +#endif
> >> >
> >> > Define and export "u64 __iomem *riscv_mmio_time_val" in
> >> > arch/riscv/kernel/time.c
> >> >
> >> > This way no "clint_time_val" definition required here as well and
> >> > other MMIO timers can also set riscv_mmio_time_val.
> >> >
> >> >> +
> >> >>  static void clint_send_ipi(const struct cpumask *target)  {
> >> >>  	unsigned int cpu;
> >> >> @@ -184,6 +193,14 @@ static int __init clint_timer_init_dt(struct
> >> >> device_node *np)
> >> >>  	clint_timer_val = base + CLINT_TIMER_VAL_OFF;
> >> >>  	clint_timer_freq = riscv_timebase;
> >> >>
> >> >> +#ifdef CONFIG_RISCV_M_MODE
> >> >> +	/*
> >> >> +	 * Yes, that's an odd naming scheme.  time_val is public, but
> >> >> hopefully
> >> >> +	 * will die in favor of something cleaner.
> >> >> +	 */
> >> >> +	clint_time_val = clint_timer_val; #endif
> >> >> +
> >> >
> >> > Just set " riscv_mmio_time_val = clint_timer_val" here.
> >> >
> >> >>  	pr_info("%pOFP: timer running at %ld Hz\n", np,
> >> >> clint_timer_freq);
> >> >>
> >> >>  	rc = clocksource_register_hz(&clint_clocksource,
> >> >> clint_timer_freq);
> >> >> --
> >> >> 2.28.0.618.gf4bc123cb7-goog
> >> >
> >> > Regards,
> >> > Anup
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
