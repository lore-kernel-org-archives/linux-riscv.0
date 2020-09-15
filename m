Return-Path: <SRS0=oZWO=CY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CE8BC43461
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2020 02:12:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A868420678
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2020 02:12:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bhwgHEFD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="bj2SrGmq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="pnYQhzGF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A868420678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vz0158wxvKK8WwOLon4UN3sD/lUaKo2Er+Ss3Hi5fy0=; b=bhwgHEFDSNoC6Jbjh5y7P5cxs
	ZL59HDDk1veZyKzb793GtRbf5B+dUSQNftXVNJLvNpqaRA/R22b4yvXeAV7XFL/RrAb5ZCQpbjbwP
	rhJK1mz77AdAXYcANzul7E2SZQMJ0HbBhWhIre5alPFAKDRJM6iQelKf/gcep+mwtM9eWLPLrUCgu
	Kcy7Krdt5dgFQANppbhtlM9ucoljJpTVNHEbQ9TD8fFBroBaUV6+9+8tGSGxcc0J5NLYPIwFX891y
	hzj65ozSPX4B5YBUvAA5H0qrWt3ud8MRMHwfvRWo4osajAeyXdlcyljqJVQCpcQgaCcsYZDnqpmxw
	zGFb2ZCgA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kI0Rl-0007y1-7Z; Tue, 15 Sep 2020 02:11:53 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kI0Ri-0007xR-Tv
 for linux-riscv@lists.infradead.org; Tue, 15 Sep 2020 02:11:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1600135911; x=1631671911;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=s/lyV+g59O8o9vcWCBiKyXOv4uaclSixiA4ei1sRv/U=;
 b=bj2SrGmq/9VN/0GTGvMZXAzZDyIxmBal7uZB5xHHuTp1+kWH8I3OA1NQ
 T44aUgENxjUa0QbYbn67Fal7ibVj14G939IOisf4OWLagyYbjWkMq6NcI
 jJbrqot+dRBb0uFqevqutHS13uv0CHstPw/DEdJZuad0rAVSompZSP9lL
 yyYVJ5WHUiXLX8ykkMKQPh8yr4T5pNKDtBvEqzb7WXOmj3mJIqt4dLJPx
 kxuR7Bjcvl/2oFRclXBiCh7AC8+1lDrsZRrd3r80xWsBVR+pbru+Lzx/M
 vyokpJ+t4tR92hLeWEWkigeu1EkkVTMGcPcC1B1Wz2h2CndsNvYrK0u/L w==;
IronPort-SDR: m8GG447xFv1aTpi3Ll8pyWNYgoaj9TMmgGoT/GZvoqe+2RXTiUJnlVHvhY2G9VXfRnZPU7Ucna
 Vr1QYujBAC5RAfrx4/rDfGSSM2SAOVRPgShpVDe8RDXjitdUS4MZTOBdlcOm+/sfsWtNnRtmB4
 eG1fWetWFv6aA87Ffi4AlRoUy2QNjIlyCGVTCwxjUZprpI4iScLlzpeSJ/S+WAyV+lQa5nSXMs
 QeiPxjaUXjxr9H4gI1vmkGqEACEAo29HCjhmOZJWHP2PN/Ab2bCxTroGFDz0S7mUVomFWuk59y
 qTw=
X-IronPort-AV: E=Sophos;i="5.76,427,1592841600"; d="scan'208";a="151733378"
Received: from mail-dm6nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.102])
 by ob1.hgst.iphmx.com with ESMTP; 15 Sep 2020 10:11:48 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bBHXfuQI1qTgBkAYdnWbpf/jlPWQB6k8zmjnuz7fbhraRU62WE00LSuBhbTGQEv0fZFSWRq+ZFkRkWk30X7DqwTBSBRZVTUjIgDVM6oifA90Di87oahatQ3KLQSj2FTWAf5ovoReWxAqQXujgU1q3P3qU84v/+5zGO0AK2jhzc+Dql/VePO/HijvQqpOifcz5JXvzHL+s69egl6EKlbAE9JiBrMX/+cAehLbSNIitnwUBUbVlz9hdoZM/eY9bxHQapm6k8DViVtGjhqALUq746/ZOhAgZDxw1nI8LxUXOulxOMg6cyBnkryKcwLk45TLfrQqWSUR7BxvfNWWGPFbyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=te6ZiEvZpBJUwuO76VNnj4KDoGFfZuR/uifFxxrI6mA=;
 b=fmGUWaY3dm4xDC7ahHLtMmyifNv8Ronol2zXpLxqyvtl+lEpGpsqCgdr8y+nXNImtTZECy9VE01T21wMk5hTzqF2VCWl7MvMl6XHr52YtTp0rtuTUoxhqPxC5p/ZIJOQ7ubswDJSrqaA+Obdn3SpiW1AQtAAggebneoQPG0mZGnDg4PhPtHl+Kv4b691E29QKvcBclhD8sUBE9ySIYFex+q5rmkgg8Mqkbds1rM5SKwpTuHzvNTHeOjFJBKazqMYM+24u5XZ/d1uMlHTpOUrVk6YtijPEfmKNGgmdtPu9R6DaZwI0uT/RKkZ6JJGKyPGZb7VTqjWdYZn1K1WWihuRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=te6ZiEvZpBJUwuO76VNnj4KDoGFfZuR/uifFxxrI6mA=;
 b=pnYQhzGFTitL6p6/n/75JCFsrUTs9/6iYTnAX9I01mkQt9vaouS6rS5XHGkAlr88uQCnbcB3i7LAqXus2yAR/vTen2WiHUP1zbG7u2WUoqH9XV5ONppv0mrfS2rSnZYrYHr1/HhljawwnCk/fOQDILvdKPvaW+qCfIF7gv1vNZU=
Received: from DM6PR04MB6201.namprd04.prod.outlook.com (2603:10b6:5:127::32)
 by DM6PR04MB4811.namprd04.prod.outlook.com (2603:10b6:5:1f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Tue, 15 Sep
 2020 02:11:47 +0000
Received: from DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::607a:44ed:1477:83e]) by DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::607a:44ed:1477:83e%7]) with mapi id 15.20.3370.019; Tue, 15 Sep 2020
 02:11:47 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Palmer Dabbelt <palmerdabbelt@google.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: RE: [PATCH] RISC-V: Resurrect the MMIO timer implementation for
 M-mode systems
Thread-Topic: [PATCH] RISC-V: Resurrect the MMIO timer implementation for
 M-mode systems
Thread-Index: AQHWirrGhFoSIfuO5k6oZYkM2y9oYKlo85ZQ
Date: Tue, 15 Sep 2020 02:11:46 +0000
Message-ID: <DM6PR04MB6201E20439CC8FB561981AE78D200@DM6PR04MB6201.namprd04.prod.outlook.com>
References: <20200914165628.445087-1-palmerdabbelt@google.com>
In-Reply-To: <20200914165628.445087-1-palmerdabbelt@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [103.15.57.4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4ab16139-ce4a-4baf-e25f-08d8591cb30c
x-ms-traffictypediagnostic: DM6PR04MB4811:
x-ld-processed: b61c8803-16f3-4c35-9b17-6f65f441df86,ExtAddr
x-microsoft-antispam-prvs: <DM6PR04MB48116B96F7BE27A737D283988D200@DM6PR04MB4811.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lnyAL25BOiQeVGt0w2UosVozPA+BsLmDnBAzh2+6pyCBcq0Fjo1e8WiJsQPpMlaea5Dx/xi1ER4NFk4Uygvz7JPEI36KnQ5Z/0NOfU0XUpfYIJCI3L1X0euzmNcAHTYygvYn5EFSnLHxdn0Mo7IVZgRBPabIss5UoBrrxiaewZc1LCI6zS1QZMWV+AGVULiiINcQF8L1YpinAKVVdJ/UtdPRxxGXiHpmonObNSJeWOqZL465we7b3xXYjB0zZzkumatHQKB6dm53rDnJDLxkQ0wQkbBAuEZQ5oO2zXAw0OJXZUTn2R/A0sbNVvkj6hTCBPvmKAbzu0gIWTp8jx0BUw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB6201.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(396003)(376002)(366004)(26005)(316002)(6506007)(53546011)(33656002)(83380400001)(478600001)(8676002)(54906003)(86362001)(7696005)(2906002)(186003)(8936002)(71200400001)(52536014)(110136005)(66556008)(66446008)(64756008)(66946007)(66476007)(55016002)(4326008)(9686003)(5660300002)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 53QJ2i9MLp+rDlVlwEMAWtDONTzCUwn0BMSkqMuZp92eVGMEL2D4HmH0LXLPAHpICgeIqPsXhqWftWYQ1gZ+EegQ5xr52VeZIfMf5j62vG3FylGURuqkaJzEc4RthFhMI8udfNwgkpyDwUC7TpCT1xUNBh2vB9ZGgK/eMSGBpVE9VP9Kyje7HZgz3UGzMHT1YUk0YinsiH72lvedXzLjvtKdn7uj2pNkV/9clEtBa0KJHFMpdWtLhenoinFX2nSSXo6TGuEDGiUQ1wiansiA7nWeXCu1H73Fi3QR+0wijkADWIf+RfpBG4tdZYSXGLmtDnzo87qF9kVIhGR6EtPN9yhysY38P1fDvBoDL/SFvjSKuvP/eEfJgzT3RTgIH9kQM+OB543EUP+Mz+4Z0XfCUTPVnq3elUKoxzBBn5fXrn1O+O/evCS+VRENHfBlxLVCASatLtZMWEie45VJuEZY7ztI2ghjWtX6tQlsP1FZ0rvZOuNEBOkh3uBCJc5HwnwcbCWq9GIIVSYhMih36m613icQ5yM74ghxPph3RVmtkoh1iuNHpCXsnq2QXKUDEHfaRgNo+7mblEfo4Umsfdxesl3nN1uPmQu8j0KngqNUgvyj2qyfF5XV7jGL4j+I9cHHOQtasORS4lhCgHQpskviYw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6201.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ab16139-ce4a-4baf-e25f-08d8591cb30c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2020 02:11:46.9468 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KEFmZoHsoYUZkznYZq14R7jwvwKsQYMdzojbsSirgR7IJ6Ka/Eyudz5XEj/E/PO64wrXuMl7Aad4yttCD8P9kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB4811
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_221151_277676_6E626679 
X-CRM114-Status: GOOD (  35.38  )
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
Cc: "hch@infradead.org" <hch@infradead.org>, Anup Patel <anup@brainfault.org>,
 "kernel-team@android.com" <kernel-team@android.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



> -----Original Message-----
> From: Palmer Dabbelt <palmerdabbelt@google.com>
> Sent: 14 September 2020 22:27
> To: linux-riscv@lists.infradead.org
> Cc: hch@infradead.org; Anup Patel <Anup.Patel@wdc.com>; Palmer Dabbelt
> <palmerdabbelt@google.com>; kernel-team@android.com
> Subject: [PATCH] RISC-V: Resurrect the MMIO timer implementation for M-
> mode systems
> 
> The K210 doesn't implement rdtime in M-mode, and since that's where Linux
> runs in the NOMMU systems that means we can't use rdtime.  The K210 is
> the only system that anyone is currently running NOMMU or M-mode on, so
> here we're just inlining the timer read directly.
> 
> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
> ---
> I don't actually have a K210 so I haven't tested this.  If nobody else has the
> time to I'll put together a QEMU that doesn't support rdtime in M-mode, but
> I've yet to mess around with the !MMU stuff so that might take a little while.
> This certainly doesn't seem worse than what's there right now, though, as
> rdtime isn't valid in M-mode on the K210 (our only M-mode platform).

I think you missed my comments in the previous email thread.

I would request to make this patch bit more CLINT independent.

Please see inline below.

> ---
>  arch/riscv/include/asm/clint.h    | 26 ++++++++++++++++++++++++++
>  arch/riscv/include/asm/timex.h    | 27 +++++++++++++++++++++++++++
>  drivers/clocksource/timer-clint.c | 17 +++++++++++++++++
>  3 files changed, 70 insertions(+)
>  create mode 100644 arch/riscv/include/asm/clint.h
> 
> diff --git a/arch/riscv/include/asm/clint.h b/arch/riscv/include/asm/clint.h
> new file mode 100644 index 000000000000..0789fd37b40a
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
> + * This lives in the CLINT driver, but is accessed directly by timex.h
> +to avoid
> + * any overhead when accessing the MMIO timer.
> + *
> + * The ISA defines mtime as a 64-bit memory-mapped register that
> +increments at
> + * a constant frequency, but it doesn't define some other constraints
> +we depend
> + * on (most notably ordering constraints, but also some simpler stuff
> +like the
> + * memory layout).  Thus, this is called "clint_time_val" instead of
> +something
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

The entire asm/clint.h can be avoided by adding 
"extern u64 __iomem *riscv_mmio_time_val;"
here in n asm/timex.h

Also, this will make it bit more CLINT independent.

> 
> +#ifdef CONFIG_RISCV_M_MODE
> +
> +#include <asm/clint.h>
> +
> +#ifdef CONFIG_64BIT
> +static inline cycles_t get_cycles(void) {
> +	return readq_relaxed(clint_time_val);
> +}
> +#else /* !CONFIG_64BIT */
> +static inline u32 get_cycles(void)
> +{
> +	return readl_relaxed(((u32 *)clint_time_val)); } #define get_cycles
> +get_cycles
> +
> +static inline u32 get_cycles_hi(void)
> +{
> +	return readl_relaxed(((u32 *)clint_time_val) + 1); } #define
> +get_cycles_hi get_cycles_hi #endif /* CONFIG_64BIT */

Use riscv_mmio_time_val instead of clint_time_val above.

> +
> +#else /* CONFIG_RISCV_M_MODE */
> +
>  static inline cycles_t get_cycles(void)  {
>  	return csr_read(CSR_TIME);
> @@ -41,6 +66,8 @@ static inline u64 get_cycles64(void)  }  #endif /*
> CONFIG_64BIT */
> 
> +#endif /* !CONFIG_RISCV_M_MODE */
> +
>  #define ARCH_HAS_READ_CURRENT_TIMER
>  static inline int read_current_timer(unsigned long *timer_val)  { diff --git
> a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-clint.c
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

As-per, above suggestion drop this #include.

> 
>  #define CLINT_IPI_OFF		0
>  #define CLINT_TIMER_CMP_OFF	0x4000
> @@ -31,6 +36,10 @@ static u64 __iomem *clint_timer_val;  static unsigned
> long clint_timer_freq;  static unsigned int clint_timer_irq;
> 
> +#ifdef CONFIG_RISCV_M_MODE
> +u64 __iomem *clint_time_val;
> +#endif

Define and export "u64 __iomem *riscv_mmio_time_val" in
arch/riscv/kernel/time.c

This way no "clint_time_val" definition required here as well
and other MMIO timers can also set riscv_mmio_time_val.

> +
>  static void clint_send_ipi(const struct cpumask *target)  {
>  	unsigned int cpu;
> @@ -184,6 +193,14 @@ static int __init clint_timer_init_dt(struct
> device_node *np)
>  	clint_timer_val = base + CLINT_TIMER_VAL_OFF;
>  	clint_timer_freq = riscv_timebase;
> 
> +#ifdef CONFIG_RISCV_M_MODE
> +	/*
> +	 * Yes, that's an odd naming scheme.  time_val is public, but
> hopefully
> +	 * will die in favor of something cleaner.
> +	 */
> +	clint_time_val = clint_timer_val;
> +#endif
> +

Just set " riscv_mmio_time_val = clint_timer_val" here.

>  	pr_info("%pOFP: timer running at %ld Hz\n", np, clint_timer_freq);
> 
>  	rc = clocksource_register_hz(&clint_clocksource, clint_timer_freq);
> --
> 2.28.0.618.gf4bc123cb7-goog

Regards,
Anup


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
