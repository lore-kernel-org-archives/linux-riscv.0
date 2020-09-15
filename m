Return-Path: <SRS0=oZWO=CY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 815ADC2D0E0
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2020 05:10:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E287B20770
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2020 05:10:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o1XKjDMs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="E7RoDddS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="EtCkYOCN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E287B20770
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=CWk6aMpejWQXTeDoBLN46Pm3h59/z/MUYyMlW2j0Agc=; b=o1XKjDMs31DWONobBZ5b3fhSB
	QL3FwnnZnVWXYgMYwEARvp09hw272lDkOQb+DBa9n0BYZ4HKVI6Ys1IruhKC6tCQWX+h97vkBVmCH
	/yMvShbJE6vejg7xz4kOVhygsqe4uDEqvZ5MYpVu2GfspXF1MGxVz5y800OCDJxaYtMiXggnfWfwV
	BSmSEv1dw9IaNlcjy8DhXHGjaLzqULWDXzhgRmeyxNxi/zYVwRr0i8+yI4FalpWqgvgspv19aNVm+
	bxPYmtvVdf376n/ACL59bmfp27UzcNaxgwbNng79nraTkfVryNW+ENSXTag5NGGuiLp1ep9SG+oGW
	nW3T++7Xw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kI3Dt-0000Tr-T4; Tue, 15 Sep 2020 05:09:45 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kI3Dq-0000TC-BT
 for linux-riscv@lists.infradead.org; Tue, 15 Sep 2020 05:09:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1600146582; x=1631682582;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=d6POLAhaA3Wj/lO4IeZYBT+Uj8Es0Gty0N+kx8Vj/Mk=;
 b=E7RoDddSyUyG1xK6x7rmUCZBHo2Q7/xjc7uHOUZV1M7akcgW+FLvEXLS
 jh6O/VOUXORnMNYeILjUZheAkGAsDNJ7vq+ozhVFfpq7gubv8Z9GjAmTU
 gGQVvR1moue89wG5jQ0v0rbcD6qNc2yysXXy/Snh+R3/04vRi/FRnuKi1
 UZj8CI65wHZ6QsAVJ23MiycmA/UZWSv5rkddE/eltMYwohwQNxcf3Sa7i
 hctzf6uGjTAh96dJLFDNCUplwyQOrjOhNFL3QP1mcpglS2cWNmCB00QuK
 zc8td5ZMJ/4LyTFL/DH91c8diuLOoY15wD8/xIqFjupByD+lRpmMxsw7M A==;
IronPort-SDR: +16QBKR93c//EwDLcACYMJQcpEZDnzsfzrkrngCJPA7fdKDk8c4OPhmQ4ajIqVmQ+GY2VIgVmU
 gHUQYcPHfTbPwGGTYb8axH5XYenhqJfo0UrlFRv/Dt70E0IqJN6A2QljGv/A1SoCBWVBi3tRcS
 Mqttl6HfEz/soZJHE++L5RmACnZUjvuVLfcjDLD/ja9ILDD4amNjxow/zv7ZkkSUG2Q+0tJhk+
 6S7nDY+r3Gv0cFU11Fv1850jx7Bl1OGv0YlkKKaXd240LvttohzNhjm8EL7wQU5d9f4yTMtuJ3
 8Tw=
X-IronPort-AV: E=Sophos;i="5.76,428,1592841600"; d="scan'208";a="151747396"
Received: from mail-mw2nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.103])
 by ob1.hgst.iphmx.com with ESMTP; 15 Sep 2020 13:08:42 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WQh855oIfF6mB6/+668yQs/b9QbqmwEpQjTfovuCkuoFQOeBs7q2245tSGz0xr0hkkWhqe0DysBVXl5BvdNL8w2awhOJs+zTTe144wpjhSAu2wcQubgF3l1jnAm3W46CiEHTvFLZ3N8QfUkDInvgNtOhI8a40q+J9ZkmHnHntXgLliaFOcoNdWpOkULSCJ8J0Ufpq3Gi16sRoyT0JMFX5v5KoD+Ee+mW9LHcrdCG5XiVU3ORp9OBrwWj8dDZZnKS+qLTWlPsjV4XjC/TyagvHnwV2XHBrt4bUvroxZ5ugYEfwY5UjO8XIjW5JAFCwpmyWaI4vZ/mw3aSOckaYn2Akw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jC5/rKjSjwujMRAePYjRBndshKSPbhbIDv2BoX1MZ7A=;
 b=RNzEfRpwv43bI7xBo+piLznanFHN+b7qTyEv0hSjZHTaO4QW50qzwiGsH5E9YFtvdDFmzHPBOF5k0B2d3vhqj8nJZ4HJleaeiA+maKNL186vKC8btfIA1TF6wyoqsMQHLwJgln0zb+WgEu3cEfCBMYTwmAwFcoVg4OZcd7qiV/ER3tK4a1ErYM0oE896t52hAmZQmnfWEk5kdQ1Cixv4Wg8A32ZGAyGnqxI97uKu1o4xCfdN7iOJhUY9gcRAoyd+SL6m8daiht3N2p3/nqFt2erXzOXhNmmJTyPSHS32skvdxrc46Z7QpWNqtOjMjCrdUgp7C6shNK1dI+akx41oZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jC5/rKjSjwujMRAePYjRBndshKSPbhbIDv2BoX1MZ7A=;
 b=EtCkYOCNt9f7CqFOmdmZSp5rCu+AuLVjgBn5SFuAen14nT/MNeb++0/hqmW7IjhBuQSlnQZQ9itAcXZKDeUpTZ0XM1QR+HThIdMIUthemvMJAOkfkn80Rfy1I4UzXrab2hJRaWI+ZRaCzch7pDs58ePAmv8zgc11rm4z53aamqw=
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
 by CY4PR04MB1225.namprd04.prod.outlook.com (2603:10b6:903:bc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Tue, 15 Sep
 2020 05:08:41 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::9124:2453:fe9c:9a7]) by CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::9124:2453:fe9c:9a7%12]) with mapi id 15.20.3370.019; Tue, 15 Sep 2020
 05:08:41 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Palmer Dabbelt <palmerdabbelt@google.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] RISC-V: Resurrect the MMIO timer implementation for
 M-mode systems
Thread-Topic: [PATCH] RISC-V: Resurrect the MMIO timer implementation for
 M-mode systems
Thread-Index: AQHWirrpPJWbe2PlHEeKVCGYd69a+w==
Date: Tue, 15 Sep 2020 05:08:40 +0000
Message-ID: <CY4PR04MB37515ACE2060497455E53D23E7200@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200914165628.445087-1-palmerdabbelt@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:f58c:fb44:b59e:e65e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: dc892ce3-92eb-44b8-a507-08d859356976
x-ms-traffictypediagnostic: CY4PR04MB1225:
x-ld-processed: b61c8803-16f3-4c35-9b17-6f65f441df86,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR04MB122585F620E8F8E40D97247AE7200@CY4PR04MB1225.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HP67BBjfFcWlZ1zoCQkb6C4I9Q26AAPOXogDnMgxR0fRrcEADBjzeXIa3+z5VfL4YiZ1/vWnJnqcOzwpsmwrmdq+oxDDLrGZLd4LjMBfUS1CVHhpTZ64ieD1lmdMPRqazR44dC+TTZXx9X8cwFdL6n4K7QiMd3ZXjuca1ckRvwR1lng2duB8pI+MeqTs8ZGDVDqGwujy/l1Qg/UHQGLQhrPDasjbbaZ1GCRpxW4ZfB1ptsTGgCAfHmmIMBvjONh6dTqdNBfA2T6bNR5u1trtVA2w72VrcDsgSQYQpADG+CdLoz80tnz1PdErBdEWMXWppMaGvKEr6A1JPD21Tw1Vdw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(39860400002)(346002)(376002)(86362001)(7696005)(186003)(2906002)(6506007)(53546011)(66476007)(64756008)(66446008)(66556008)(66946007)(76116006)(55016002)(91956017)(9686003)(4326008)(316002)(478600001)(52536014)(5660300002)(83380400001)(33656002)(8676002)(110136005)(54906003)(8936002)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: ymckl0RL+ceJiqztduHiAT3/gBCz/4pVLbEz3znikkIwRuUj1Ng0B5RCS27XVms/yGxi34OGnHzsUMJc/92wXtIiB3W2aSWvWzYVyCsmSlzYQjFTZ6XWV18gO9P0xYdfdlkK8XSbP3YPHOkt/+5c3xNaI0J/L6MX4L657+KZOn06Hd29n9gGGwUsRxudK9O/ftM95+D6nCrT/paX+r3aTxO1nNWn9xxZt9MJ6vfypIqYjd+wMHa7kMKNprwzW26vgcMFwECLmIZsckQnm6rJoJB5GGD19mFhT9y9eBWHhh5H7UTxbPjqtCUC/JuLbRIjjJ7FXTizHgHBtnL9f7U4Bt/Ckf1XQjx/zzTAt1TtWA8pdlQLmwVNKvMOTVQPEJG9yT80dZmbUyqkKbuHpGl/r1GjdVnvF4FNjr0ZMrtuXKR1/q8bliee62BbydBIb/TW+YljvPKw23CiOsDZe/5XswsOOCXNxDGDD/I3FPZZgWQapNdA0aljNqnaRmHL8jrsFEwFi3qvH1buLdLtnLEHABlkUCQjz8+wp+XfqfTsrvWn3EY21RIkxInkxkJrnCLNOINYbPOBk4PjOo5E+0l5Mkp/wTN64Ca556YoOW6/zda4b66HLUbQJEfJOANZUl1EOgo/v7TnmcEnqInrJJfVgGNyQyEXvxl+uC1OgsXXgEyNkuCdlbyjVZ9FoSSH5oP8vHqbArmM3gKlxUevQlxFgQ==
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB3751.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc892ce3-92eb-44b8-a507-08d859356976
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2020 05:08:40.9077 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XDwQ2qobIiuWfwjZ25Ju1uhWYdLWokMEQK9+Xot8wT8DiULXBAGNXmL6PLWtNereAgvapXd35TINci7cSVEPEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB1225
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_010943_023830_BC347C09 
X-CRM114-Status: GOOD (  27.76  )
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
Cc: "hch@infradead.org" <hch@infradead.org>, Anup Patel <Anup.Patel@wdc.com>,
 "kernel-team@android.com" <kernel-team@android.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020/09/15 2:17, Palmer Dabbelt wrote:
> The K210 doesn't implement rdtime in M-mode, and since that's where Linux runs
> in the NOMMU systems that means we can't use rdtime.  The K210 is the only
> system that anyone is currently running NOMMU or M-mode on, so here we're just
> inlining the timer read directly.
> 
> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
> ---
> I don't actually have a K210 so I haven't tested this.  If nobody else has the
> time to I'll put together a QEMU that doesn't support rdtime in M-mode, but
> I've yet to mess around with the !MMU stuff so that might take a little while.
> This certainly doesn't seem worse than what's there right now, though, as
> rdtime isn't valid in M-mode on the K210 (our only M-mode platform).

All kernels from 5.8.5 break flatbin user space with nommu. The start of  the
problem is Christoph's recent flatbin loader change which was backported to
5.8.5. But that change is correct and the problem is likely due to uclibc or
elf2flt. But I have not yet figured out the exact root cause.

So I can test this on Kendryte, but only boot the kernel and then crash in
userspace... I can test on top of 5.8.0 too, with a userspace running.


> ---
>  arch/riscv/include/asm/clint.h    | 26 ++++++++++++++++++++++++++
>  arch/riscv/include/asm/timex.h    | 27 +++++++++++++++++++++++++++
>  drivers/clocksource/timer-clint.c | 17 +++++++++++++++++
>  3 files changed, 70 insertions(+)
>  create mode 100644 arch/riscv/include/asm/clint.h
> 
> diff --git a/arch/riscv/include/asm/clint.h b/arch/riscv/include/asm/clint.h
> new file mode 100644
> index 000000000000..0789fd37b40a
> --- /dev/null
> +++ b/arch/riscv/include/asm/clint.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2020 Google, Inc
> + */
> +
> +#ifndef _ASM_RISCV_CLINT_H
> +#define _ASM_RISCV_CLINT_H
> +
> +#include <linux/types.h>
> +#include <asm/mmio.h>
> +
> +#ifdef CONFIG_RISCV_M_MODE
> +/*
> + * This lives in the CLINT driver, but is accessed directly by timex.h to avoid
> + * any overhead when accessing the MMIO timer.
> + *
> + * The ISA defines mtime as a 64-bit memory-mapped register that increments at
> + * a constant frequency, but it doesn't define some other constraints we depend
> + * on (most notably ordering constraints, but also some simpler stuff like the
> + * memory layout).  Thus, this is called "clint_time_val" instead of something
> + * like "riscv_mtime", to signify that these non-ISA assumptions must hold.
> + */
> +extern u64 __iomem *clint_time_val;
> +#endif
> +
> +#endif
> diff --git a/arch/riscv/include/asm/timex.h b/arch/riscv/include/asm/timex.h
> index a3fb85d505d4..7f659dda0032 100644
> --- a/arch/riscv/include/asm/timex.h
> +++ b/arch/riscv/include/asm/timex.h
> @@ -10,6 +10,31 @@
>  
>  typedef unsigned long cycles_t;
>  
> +#ifdef CONFIG_RISCV_M_MODE
> +
> +#include <asm/clint.h>
> +
> +#ifdef CONFIG_64BIT
> +static inline cycles_t get_cycles(void)
> +{
> +	return readq_relaxed(clint_time_val);
> +}
> +#else /* !CONFIG_64BIT */
> +static inline u32 get_cycles(void)
> +{
> +	return readl_relaxed(((u32 *)clint_time_val));
> +}
> +#define get_cycles get_cycles
> +
> +static inline u32 get_cycles_hi(void)
> +{
> +	return readl_relaxed(((u32 *)clint_time_val) + 1);
> +}
> +#define get_cycles_hi get_cycles_hi
> +#endif /* CONFIG_64BIT */
> +
> +#else /* CONFIG_RISCV_M_MODE */
> +
>  static inline cycles_t get_cycles(void)
>  {
>  	return csr_read(CSR_TIME);
> @@ -41,6 +66,8 @@ static inline u64 get_cycles64(void)
>  }
>  #endif /* CONFIG_64BIT */
>  
> +#endif /* !CONFIG_RISCV_M_MODE */
> +
>  #define ARCH_HAS_READ_CURRENT_TIMER
>  static inline int read_current_timer(unsigned long *timer_val)
>  {
> diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-clint.c
> index 8eeafa82c03d..d17367dee02c 100644
> --- a/drivers/clocksource/timer-clint.c
> +++ b/drivers/clocksource/timer-clint.c
> @@ -19,6 +19,11 @@
>  #include <linux/interrupt.h>
>  #include <linux/of_irq.h>
>  #include <linux/smp.h>
> +#include <linux/timex.h>
> +
> +#ifndef CONFIG_RISCV_M_MODE
> +#include <asm/clint.h>
> +#endif
>  
>  #define CLINT_IPI_OFF		0
>  #define CLINT_TIMER_CMP_OFF	0x4000
> @@ -31,6 +36,10 @@ static u64 __iomem *clint_timer_val;
>  static unsigned long clint_timer_freq;
>  static unsigned int clint_timer_irq;
>  
> +#ifdef CONFIG_RISCV_M_MODE
> +u64 __iomem *clint_time_val;
> +#endif
> +
>  static void clint_send_ipi(const struct cpumask *target)
>  {
>  	unsigned int cpu;
> @@ -184,6 +193,14 @@ static int __init clint_timer_init_dt(struct device_node *np)
>  	clint_timer_val = base + CLINT_TIMER_VAL_OFF;
>  	clint_timer_freq = riscv_timebase;
>  
> +#ifdef CONFIG_RISCV_M_MODE
> +	/*
> +	 * Yes, that's an odd naming scheme.  time_val is public, but hopefully
> +	 * will die in favor of something cleaner.
> +	 */
> +	clint_time_val = clint_timer_val;
> +#endif
> +
>  	pr_info("%pOFP: timer running at %ld Hz\n", np, clint_timer_freq);
>  
>  	rc = clocksource_register_hz(&clint_clocksource, clint_timer_freq);
> 


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
