Return-Path: <SRS0=dJHb=C5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFDD1C43465
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Sep 2020 03:32:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE1A62075E
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Sep 2020 03:32:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rY5eQLPA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="DyEfPURw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="p/eHLvek"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE1A62075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Content-ID:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Cc:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xJxkyOFTQGB7h2XCbu+wuOpuCOq5EVal64mDUyF6M1E=; b=rY5eQLPAf93vU1XeExeD8tz3X1
	rbsQFO7YE0WWmbIazolP5WZ2Eo8PGL1aSSLZCcrP3FRfEdOs4F7b9LkbOZqrK79aMSuDNbH5HU2s+
	EI9Dgd+ttpXFhd+N6307s5nf4ZTzQQQIDi5b4CcLs01K9irh+F9xxXXlD97en8wWPvvk99kTxep4P
	lztpn9oacwVxDibFHRiF0ca6TL+pORnYB9g7A4KO9ktEtXE1i884DZZ1q71OR2T5CV2a31NHlTghm
	NixpPka3FTVDDvk1kxOxEhGkqWFhdkDL9jwx7eWnqYAPx6MF3RxcQ6oY3/uhcT6qhWaDE+pbhZd9K
	jLuvKcNQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJq4l-0000hJ-Ai; Sun, 20 Sep 2020 03:31:43 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJq4h-0000gM-Lh
 for linux-riscv@lists.infradead.org; Sun, 20 Sep 2020 03:31:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1600572700; x=1632108700;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=6+kyTSGSbjXnuLLp2PRc5FZG7d/69A0F3G/GUrqeczE=;
 b=DyEfPURwuORs7r7+1E8ueBu34s3x2ZdjkhE58LL/XYKBb9oKmVZYnk/K
 Ad+w7ZK5udWNNGBivUt644E6fASpqEuj5gnrHQRNkU8XFe2KAyD3cUTH1
 gb6g0NvZsGF6O+faEt2odi+1C2FvY2iYFl6C6zKJl+85STfCOaMFfRoZg
 Hd/EJy7FGw2uigHODTa7FZ/jRPXFZxk+qB8EhzkikEGqC/vkfy7onJeSr
 Gs0gloKT3rfR83M7bQd5k9pxsPtx8TfrxEu4M/iOWaHEc5cfcLfsDut2L
 /YfHeBVjNWXxZzTB8nmoGTlyADOGv/josWVnvrAdDSLS8DQBzll0qgc5v Q==;
IronPort-SDR: eXgqpnODBLa3u79ScBjtcqY5aCzFSS8AkF8GV/K6cvZG9Y20s7fPoJ64Vwc03AN4J3tiIrcGAB
 ehgdD098SZvv22pEB9s/cmeiBnGsxTfMT2CPs3cspYQPUyEOky9DykUQvAI11aIzsNnb07Q5V0
 B43cFCKuyxjafEXto3ocpvuuKH0R9KRVv3HltrRW/U174ED9gdp6IOlV0SuMnflALZ2H6JCFQt
 Tx8MZY/wLfNpiaRNnnKyWVhQzdEbvGVJROpqwMykGEcczoJuTFS+pTcuHZ0TYSB18r2nogKaiR
 klc=
X-IronPort-AV: E=Sophos;i="5.77,281,1596470400"; d="scan'208";a="152185577"
Received: from mail-mw2nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.105])
 by ob1.hgst.iphmx.com with ESMTP; 20 Sep 2020 11:31:36 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=atKXi43UlYLbnnT2VClbZqPSjS/x64qliHJkW+aPhnYJ5Ccrm6SSQNF1RSLAUEhlgehEnjASpvj/yhVHSw+s2sh+ehch1jPvNgQ8wCiBrA3iRUIl8CMlZJjyTSn7h4dGrvIdpH7l1fi9lIVBQg/MlXPNxtmyIEDMZI36vxajbsQ5PpVHNxBpIkrHw9wYtazgXsBSY31XxYyVIAQ+nbegXurdJj5joiUR/Oqk0IXeUXUSfoGXzaanfuuj60ppoIgK6PaCtHZyb4RXH4GlIJPAN2xhPzPnZb3ufuNTaWqLVAX6JBHuNGdSiLH5t6BNIuuuBb1qQATNHcU5bbD/RmHODg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6+kyTSGSbjXnuLLp2PRc5FZG7d/69A0F3G/GUrqeczE=;
 b=n68AfTtmLvMJI2Ef/Uw6MpNH94rYUlsToRLRkepPl/fdN82r3EL2srHXgrctrKhsgCoHGrVwvYa8IHS4sR6A4+GA693WDm5hTLHPD7V4JFvGsPVdtGsn2Ar5JajiRoRqhy3HWVTm5mWwwwwp/E42tcZeDtI9CgNaa8tN0u2VjA12juZ54/mzm5laZntj6dTtariK6vr6LWFeipO9vMTFT32U5nYw+mAPH9SbMWhpF5Dp3zZBLnpiOAIxFkyePITdvFbMrmXjRiXTVlRI7OQYBDOGw6vETCADEYXtevRcmDvtwpYLd3tjBvDTuLZUDOUIB+CgV6jWMvEXnfAyxbHSPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6+kyTSGSbjXnuLLp2PRc5FZG7d/69A0F3G/GUrqeczE=;
 b=p/eHLvek6z4P4ePDPb3a6WE51RBwtFfpKzyf+nskk1n9UJKxhistHK06OQdq/E5pGXbYyvjpaWitXUUwVb0OpknUDq9pSq58HZQvLd9VDZXFFxNX7OmWyqeUd9MF2I9g7vbqi+9H+EvyMJc1LtBBgN2L8G300VVTpMXzPYHx+r8=
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
 by CY4PR04MB0968.namprd04.prod.outlook.com (2603:10b6:910:51::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Sun, 20 Sep
 2020 03:31:33 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::9124:2453:fe9c:9a7]) by CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::9124:2453:fe9c:9a7%12]) with mapi id 15.20.3391.015; Sun, 20 Sep 2020
 03:31:33 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "palmerdabbelt@google.com" <palmerdabbelt@google.com>
Subject: Re: [PATCH v2] RISC-V: Resurrect the MMIO timer implementation for
 M-mode systems
Thread-Topic: [PATCH v2] RISC-V: Resurrect the MMIO timer implementation for
 M-mode systems
Thread-Index: AQHWjsKCu1m5ixzMo0enHif1SK9OCKlw31oA
Date: Sun, 20 Sep 2020 03:31:32 +0000
Message-ID: <0b1c4df9426810bf3288729193e6045f8b328ea6.camel@wdc.com>
References: <20200919202141.2072628-1-palmerdabbelt@google.com>
In-Reply-To: <20200919202141.2072628-1-palmerdabbelt@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5 (3.36.5-1.fc32) 
authentication-results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:8d3e:27aa:85c2:44b5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2af2a6c9-63cd-4648-94d6-08d85d15abd4
x-ms-traffictypediagnostic: CY4PR04MB0968:
x-microsoft-antispam-prvs: <CY4PR04MB09687650B602CDF52F2C9EC8E73D0@CY4PR04MB0968.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2xTId2ycZ/LGDP5Mt0+5xbE7BkD1CtIEQX+0XJtdgS+pALsZqSybLr780plfJwMq+4cmHAIKG2zjj9Gaw6YVgelLq35CbKBvoTO/EOozSnjYmLkJ9EQD3Q/lzaOgmpFgbxYo0ySDtqYAZEW/e3cbozEAZJWXtftp72ZmefMV4TU7KtIySY4LDAHMH7hGm2aPXvWBduItnJWvZ9VJ9S2FmrBNoIpHnvywO9AVMoAgLBLKxSWXYc4xx7zHAtXsMnRCrt/gXDInBmucx6WYch2QGS4ypc3KyR1aRDx8apO8liP2yt2Tgc65meTdyL7QdnS3WLdpOfG/b22ibwEN1J9AVwIv7975VLTbBHVS0WcPz3Xl/IY6kAkNG4Ff7ZQD9FW/
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(396003)(346002)(376002)(366004)(136003)(316002)(186003)(2906002)(83380400001)(8676002)(86362001)(91956017)(76116006)(36756003)(5660300002)(6512007)(8936002)(110136005)(66946007)(6506007)(66446008)(71200400001)(64756008)(66476007)(6486002)(478600001)(66556008)(2616005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: NJhh9SB7Js1IJswZofGGS77qBSbaBdO3Ja860yfSCZfHIeBv+qlLcnt19u5LP/lXFb5MFaFnAZqLjpA0XwuiuJ74MMqemsA22EDnni8x06Cul2nKPNEycksehNgIB3mmCiKw38GGpb1uCnu0eUQfpFjBm1nLWE7ITRdpUYbABZU9L0fCCcLFgpqmi6+pjDx6KcApglaHK2OWAoj4YeiNTePR5AlQGVW1qEqXjVqMa/pClcjus08Rav4q7D7gABwgVD7Pw7PO0ZpL3cmtqVcw33HCVHutxtSoqbKQbC5hi19Q1EDQJwyCyhg+oZvCAMq5qrLbMLurCX5KwmZCF/+uPmrm933uUPJs5CfKBAe8S2IBtpWuhkpYOLYfwc4bKceQvgw78G07N4Fh8wxd2yXNWOP2sBIPfjT56McZ3QFKQtyli0ZtvgEajBFJ9OJih6y3EfXjaXPwPPFA21WN5DknM1ZiVVnYWNpZn94yqZDaaeRstaqaTjOkX18uN05xcmGZ7WH8yOKRGwBkdKogEfqdL88Il/Gk6q2pheNU9RkXA5qhU1uZZhpN4zd7uGCB7AWXr4LvFQb7g4r2BkAWYmTzFGPIYU39J9TtSbsYThdD91Ty4/neoMa9af46GIWmQ+cVHllRBjeFgZ7NPkVDXqO54yo2KeH5j798lBDTJKGcU+jJcg/U0VM9ijwVVwgUmkU0GQcaB/sg+/g2B3WV/3PrEA==
x-ms-exchange-transport-forked: True
Content-ID: <A7C4B8C344D9BB4698E4DF5750C3A56F@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB3751.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2af2a6c9-63cd-4648-94d6-08d85d15abd4
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2020 03:31:33.0037 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kFZb4QwIIB5GGDvXors+o82jEVjW53yyPQJJZBS29yrY1F8GfkOmxikwmnAq0tiX/Tf+FOrlYJRjWfliIoIU8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0968
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200919_233140_090090_CB8C3272 
X-CRM114-Status: GOOD (  33.24  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 2020-09-19 at 13:21 -0700, Palmer Dabbelt wrote:
> The K210 doesn't implement rdtime in M-mode, and since that's where Linux runs
> in the NOMMU systems that means we can't use rdtime.  The K210 is the only
> system that anyone is currently running NOMMU or M-mode on, so here we're just
> inlining the timer read directly.
> 
> This also adds the CLINT driver as an !MMU dependency, as it's currently the
> only timer driver availiable for these systems and without it we get a build
> failure for some configurations.
> 
> Tested-by: Damien Le Moal <damien.lemoal@wdc.com>
> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>

There is no changelog... What changed from V1 ? Do I need to test again ?

> ---
>  arch/riscv/Kconfig                |  1 +
>  arch/riscv/include/asm/clint.h    | 26 ++++++++++++++++++++++++++
>  arch/riscv/include/asm/timex.h    | 27 +++++++++++++++++++++++++++
>  drivers/clocksource/timer-clint.c | 17 +++++++++++++++++
>  4 files changed, 71 insertions(+)
>  create mode 100644 arch/riscv/include/asm/clint.h
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index df18372861d8..7766e1289468 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -32,6 +32,7 @@ config RISCV
>  	select ARCH_WANT_FRAME_POINTERS
>  	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
>  	select CLONE_BACKWARDS
> +	select CLINT_TIMER if !MMU
>  	select COMMON_CLK
>  	select EDAC_SUPPORT
>  	select GENERIC_ARCH_TOPOLOGY if SMP
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

-- 
Damien Le Moal
Western Digital
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
