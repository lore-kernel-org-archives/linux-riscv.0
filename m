Return-Path: <SRS0=oZWO=CY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45745C43461
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2020 12:56:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A017420684
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2020 12:56:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1w7quXJG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="OCjZaoXr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="mmVUjplj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A017420684
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JaoVHe8D4XnNB5YoF6HaqCVe16lRDaneE2XeUF80wHg=; b=1w7quXJGTMDkqSIShFtfZ4ADB
	pfWdCvkn5e7qOfGSeE/KKX/syR49hfw/FcbxVTFgeTsW5g4L+kA72qeKEgy2iEe9G29pPcryb1e3h
	yVcxOWcUrIFHoKkBNcJ3OpeKk7Hacvpagp9znuAP6gOeBS4TR8LrQk9HYAX5z4Og7OsD8v1Lu+EGh
	y9fVIK9wtdmB2H3sqOSA10IdW4zsBFHKeqV8QxMGQcPtfaaDZujYCcJbv5hHBaw9YGMYO0lAuZvAE
	vpB5vqbbYsv4oJIoOeBDOvllC+/DQCBHBYPXszZEE36DbtscPy8LuQS3cGp5G7+g1YVi/SzG5uumS
	TOanl7mtg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIAVf-0005UT-Jt; Tue, 15 Sep 2020 12:56:35 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIAVa-0005TN-BV
 for linux-riscv@lists.infradead.org; Tue, 15 Sep 2020 12:56:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1600174591; x=1631710591;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Y7N+Py0njm+3ug5BTdf9PITExWl8Eat+Zc5RsAoNN1Q=;
 b=OCjZaoXrWfb1QFSsrcl+y3kQM97ffVGH15FeLKaPhfRkaYNQ9/TUzjot
 /inAarbjNQd9p+QctJGOj/TQar8prmbMFGEeUIiX2S/NO7UOrDXOgnG8l
 yhPet41M+nOxPsPOjQTCipQaxNWBpFKlnU117GRaq6gfU7ZXdNnJVkv4P
 DxdJ1Hr2w+KfQc/EkLPxJT9L/gSP8gwQ2a//Xw/Gfkij/x5IaDPiXBm+K
 A8pbwXinYiBHyGRLyeDHd22DGsU8J0k5QCzVsEXSXGpF7MPW8NpLUKRAm
 3WN2bs4aQRutwZK2s0HGMutsTDCsJaAdkTsrfAmDfkOS8K+xl4MshxFCE g==;
IronPort-SDR: jhdgBqaBWVosob6KGhgwA5gagrVn8fEr2HEUVZjpdkyrl8ZDF0VPdl3UQStFgWPfMGuVSPDUUX
 416g8LDy0NvezIv9BhU/bGBhJfJ7oMpIxYhg4jWabCRga1qu/J8JbqXHZQRAsmfh1G879Igwxt
 qeAPkHVRwGQPCOT4JUxFvsi5rWkexzOUSWAQNkSgD2iqZWmeRoNL7V6qtiP7wrxuDgeAl14dfu
 Zoi+kf8qoIbz9QjgR3yTYsXE9CUSODpTO/j2dzfpUlKnkq+q0GLUF7VaoqYW2D1bD0JU+UMWli
 wak=
X-IronPort-AV: E=Sophos;i="5.76,430,1592841600"; d="scan'208";a="151784936"
Received: from mail-dm6nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.169])
 by ob1.hgst.iphmx.com with ESMTP; 15 Sep 2020 20:56:30 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y0qYF9EfIF2X7Xm5OaMHWd7N6ti6U73uETFJoK3Sjcy5Z2jNn+RUEVkKzjFO6xyhFfaXhgDnagH7tbr4eLp6K4tkN0xaxY4JJKnhL71wn34F0EGOIubmEIaYw5VqLmZe8prG2Cvgr+dEpRD2zM2i5c0eCYjITkoV+XXblzGyrGMFIfjSGKgkGGqmOYl36AMUo+SKBfHe0Qfq1UZPVyL2SDohtYcQysRHoZlEL2flcWe5KLb4B5y7XEbgq4/1OsmSDKRyp6xyIWZGbxJl+NT9zzbpSKWPJ0PrBI45d0qZ3a8dMmlnwm6YXrv5oY+8ixOfz5a42AN90nIbTfefqKYyQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y7N+Py0njm+3ug5BTdf9PITExWl8Eat+Zc5RsAoNN1Q=;
 b=W3rbrx0O78/IB2EE655OPI97am2xQi+a1JMjK0rcTsDDKVwGPlTS8ODRpQc9UwKqsS7mVkcOwuvgO59cFXYs/yeV/VdA0a6grOkcME6OUdsCUhbkTQucqXLJt3b3pzfT9dEa8RWG5L5tSjbLV5MeCq2HUBjAz7eb7Qf3jCM+NL3GCztXbc5qgmBRnPpYx7FhVrEDB5CMpFb12f+SJ2iB6Z8xys1XqF8EcSsqe9uIIZoIM3DR68C6msWUb3Zr44QvXMkZ9JdQAj1nYAgbgSKXQzaqNPA1XeqnlyyHX/lAw5DAqdCgmwrh48EMU0PMqVu57d1REhRMmkjKGANQ1hSiTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y7N+Py0njm+3ug5BTdf9PITExWl8Eat+Zc5RsAoNN1Q=;
 b=mmVUjpljK/Dqsx5yLygMcDd7mvE6R29WNHnWBG7QVfMXRKP1/olhPHR9qmW9g3j5DEw2kwRdDp56b2yQzwGeR5UvOPtgczYtB6dmbTEC5BPWY6ITibcxuxW/8pQcyd9616hXk5pD2abvcUmQx+nTCyfKH4BvFHyll5WKKAcRAII=
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
 by CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.17; Tue, 15 Sep
 2020 12:56:28 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::9124:2453:fe9c:9a7]) by CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::9124:2453:fe9c:9a7%12]) with mapi id 15.20.3370.019; Tue, 15 Sep 2020
 12:56:28 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "palmerdabbelt@google.com" <palmerdabbelt@google.com>
Subject: Re: [PATCH] RISC-V: Resurrect the MMIO timer implementation for
 M-mode systems
Thread-Topic: [PATCH] RISC-V: Resurrect the MMIO timer implementation for
 M-mode systems
Thread-Index: AQHWirrpPJWbe2PlHEeKVCGYd69a+6lpqcgA
Date: Tue, 15 Sep 2020 12:56:27 +0000
Message-ID: <d2685e76a423cc5de2e654857e98142a1d269237.camel@wdc.com>
References: <20200914165628.445087-1-palmerdabbelt@google.com>
In-Reply-To: <20200914165628.445087-1-palmerdabbelt@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5 (3.36.5-1.fc32) 
authentication-results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:62d1:16e6:ecb1:d604]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 28159a0d-6d13-4fc8-9919-08d85976c2c2
x-ms-traffictypediagnostic: CY4PR04MB3751:
x-ld-processed: b61c8803-16f3-4c35-9b17-6f65f441df86,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR04MB3751583ACC2643CCDE400B18E7200@CY4PR04MB3751.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xc/nZ3ndneHm6F/va41za2XzC8Q/ScHdynGQDdyuF8IHk3uI2qj5HgGj+SoyBKDKmrkXVVvawUR16DHKfpXbVtgEXCeTUU/nwIul2OmkI68QqEC7IYJsnx2HP/Ctfm1zISgoCRiDVd6dJZaGczsaSVo/1Xa43/6dLvWGzQqrHiZUfyokbImMR9/SKprDNrjjoF7Fv6P9uDay+4J8R80UaAfYqRW6UalV1+WJDJLabJcGPpTS7ZeY087o0zSYKOpVh3luprXcLdZtPRyyc6BNeXGrH+kvt8skr3rs+BhbDHHblYHTgA1fpygBHzrBww1NU6Lbm85q5rrFXPh7W0xAIw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(346002)(366004)(39860400002)(186003)(83380400001)(4326008)(316002)(71200400001)(6486002)(2906002)(478600001)(2616005)(6512007)(5660300002)(6506007)(110136005)(36756003)(66946007)(8676002)(8936002)(86362001)(66446008)(64756008)(76116006)(54906003)(66476007)(66556008)(91956017);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: Pm9jUkaTxltqI1HkBtMrynmvcz8gi7pInr2kb7AJH1ikhFNOf4IoeGILO2UGbG6pzbQqf1KxNwB9Lzk4A4DxVMbNMYog92qJWSjpRLIAwpk0gJTaRKUbM66YhwElyBLvnTQM/w+Rte/Tr1qb1XJFzPuN87nBSEPFeu90rmMj0iaHLYJGBxQu81TlMI9irTQJEd+nqO5PqcwFvHcVr3Ar+8L20vZuUIfZ13elN3Xxsgjj8jlJv6JNizWvpNRcQXRMY6jaK6ffpJNspR5GTILpVRa0UtRS/cF85EUnV48KcUYJyJ1VA3DMrSV1bmDJpAeZpDIRHdtBT2Hejaqqos3Bh+h6EJ66Vk0LWNVMGRwxccqaL0FlgseVxrRdKZ8bDzkxjHO5mXgLSvdSMsuzvpjL+gUNIhNw968nCRqTN4qxJaLHDaOOtMMyo4PVsT3DsoIneTo0Uuv5lkUVGomYimk/EzbYn5T4P4F1VJcSH8Wzl5ewsdbdbdq/icxL31/KRKwp4ZJacDtZkz/LuFAfxpA7N5U4aJ+8H8f4kP/mX6CRc3nr7ErqG8BX3G+VjDaSVkaJVavDzzg53T4qS1/S4AMj81S+J50uynoA+SujIajwaYVz2JsqGd+vaiUoGFM6abRe9q560p9cVO6paZSEm9NG+T5hxVXZ1GwTxjt0CR1i/h2DdPLNU1U+G9svjtZCvRTaSRnuy5O9sVafXDnfxgPtTQ==
Content-ID: <86655E1131B5F14C8B2C7F2DB0383B80@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB3751.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28159a0d-6d13-4fc8-9919-08d85976c2c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2020 12:56:27.9112 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bPO7gdUNAoLoQCYlyk81X442asBdjfP/w0I1F9n9u5Q2w3dypREBBWQxz5XDYUe/JbWGWzpM6KxtDOJro69IvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB3751
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_085631_807320_73C61A46 
X-CRM114-Status: GOOD (  33.47  )
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

On Mon, 2020-09-14 at 09:56 -0700, Palmer Dabbelt wrote:
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

With the Kendryte device tree patch that I sent, this works.

Tested-by: Damien Le Moal <damien.lemoal@wdc.com>

-- 
Damien Le Moal
Western Digital Research
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
