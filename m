Return-Path: <SRS0=E1a4=DE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08111C4346E
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Sep 2020 05:52:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5196823A03
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Sep 2020 05:52:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m97tumbJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="hBOZuuZH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="z90PRXvA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5196823A03
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dE4+LBP2D7A4cReUDzqfubkG9WWaSyS2zR53Mp9e0+k=; b=m97tumbJ7Rm+e9gHqbCRhfxor
	Dqx6yBlxHr/K0HoZc5jDX7NRLg5MhPECyzMBcrQDveEmLDr8wOqVNeIJydX37dQvLazXXcVHSJ3Ra
	UPVnyLu0LgmkYH6f3LDiyxOLBsYCSYyNKvf6zchCbRmNWzMLFZD2PdT39aPgBDBt7GNvtjTPzfIme
	JTLlUwaduTBYv4T+fL8NDOjoKB0Kc9f4U3/ELky7w0/vzadroXO0DejmrScH9YrgIPkJTYMurzSpO
	GKq2yTBCIyCbI1bEabbyi8Zx4NG7saalZZQnQvFVe0DAy7Hp7Qp0OWRMFgvCKqe+aeQ6NCmcRnQYa
	pQkKX7Miw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMPbk-0000zq-HN; Sun, 27 Sep 2020 05:52:24 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMPbi-0000zN-6p
 for linux-riscv@lists.infradead.org; Sun, 27 Sep 2020 05:52:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1601185942; x=1632721942;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Oc3CIyRUf42yVI1p1xeRnCbgGh7v1xtdItCpU6h2CYY=;
 b=hBOZuuZHc8+ff/7odSdozO29VwUJgp/+pvw1M/9Krwp+aAu+a8DmQ7Ci
 baJrYe8SXPu+RQxZTUscZQo9igMzsaDFMefr5Wu5uZeVvW7NRZTXpEpAh
 JK5BWVXf4V/5v7hTScpkJRKzideJfPxkxWBBNejF0dUeTJuE5D34FAfco
 dVXuF8MBvis1XSqa5yc6ONRFtMMrPfTt8IcUTOEsaIt3HpaVtUXnQ8BU9
 nbEl+kWgXSK7cBmD9RMyybai0pZdASRRW7JTikYeJTK4ysMwTD5BNAmHd
 iCr862vlYreOOlzYXtQXEgxomjmc2ZR+A5XklGgNieDO/57NUQvh243w9 w==;
IronPort-SDR: F0cBp7YETipPvKeTFZ/k8MwsP6DjULJN6NQXpxWcbjhOS6ADjqCaX0fureaZZLcM+AxO31ePS0
 u3ExM4/rpzQIgeBDG2Hdl7YF9k6P6bYu8NrSVWt07OY/FsquUr6715KZ4mO4DinwdW6DLw3R9M
 tK7V7on8N9g7OWfL+aV/T6ueP5g+xm4bSs3bzgj1ooS07SU6AmRbZv4mmxuAMU6JPgHooaT+D6
 RHG6oEnc7FFW2/5ZXZCTC8o/+QytVA/1IrkkrxrRSErhXZPLT2kscI024Y1FcNFpysvjjWhZNx
 Ol4=
X-IronPort-AV: E=Sophos;i="5.77,308,1596470400"; d="scan'208";a="258081547"
Received: from mail-co1nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.173])
 by ob1.hgst.iphmx.com with ESMTP; 27 Sep 2020 13:52:20 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZSK+nlU5h6gLWbRTr+C6rTsMD9q6mU4e/RM2gzjzUvDz2g25aUAsSVG0VjHMdWObRL5I3AGrtZlnwJbur7DTv7DU8Is6Hhp58KIAePKS/3mgWKK9z2IbOD2uqP09gWOa9XAPVsY8LcE5BlNcInZwinM3Esxt/4hFIXxHDql93s2bYNEkA/L0OWghaw18CeHWmEYoLBiEcRHkHxQHxlv1x6fsYJN0CF4fVez1kEeE0zV9QDwIUzr5f+BVKIvUh3WhiM1LDzxzHYb9QsQkH6xB8ShRRIg9XL/8SDHUP3uo09v/kLA+xwTJ2CUuNj/lXyf9gMW4vnRNbr2I3GccMMSLRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oc3CIyRUf42yVI1p1xeRnCbgGh7v1xtdItCpU6h2CYY=;
 b=horgKSHZcBUG1qDfN+R8xGSXvR3EsJL2n3oCbb4L3qDd2OUXNXUkGz7yvpQzSI7ncJbgrt043gdbXQJgXy61041PYTLHRqsLldYMxtKlBRBEQwAcxCiXyv50M27q/QTUkSjbxkIj3TWUsGgNlSBTVRmRO5P3nnNj5oFd8Wj7inMYdNmVE5pGTUpvphkZDkmWKEODTIXgGQm76cVfcgILtk8ZumE6gBiOxCcC/xBDrxpGPBwXLhzl7BPVg5DhRu6m05R/DfltKNmaU0SibzLE/R4cGYbYgTTE/NVUwd4c2WcEri35TzRzGCeheV1giVyaM5wzZwSfzf+2iB8fGuT8iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oc3CIyRUf42yVI1p1xeRnCbgGh7v1xtdItCpU6h2CYY=;
 b=z90PRXvAcMctXFrMEpJ+OcQf4a3SQdMsjrbvzIjJG4alMqnY2mDpeIeBTk+qjRrfgz1t/+boPf8GcI+JB5cO+++KqVo9755BiMw7gO11KWYZmwNxyrtZs9fB24uHld+zsIXQoVZZQ4aEQ3EUc/MbcNb7gQnQQnnJBU6LNWu8XOw=
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
 by CY4PR04MB0568.namprd04.prod.outlook.com (2603:10b6:903:b6::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Sun, 27 Sep
 2020 05:52:19 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::9124:2453:fe9c:9a7]) by CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::9124:2453:fe9c:9a7%12]) with mapi id 15.20.3412.024; Sun, 27 Sep 2020
 05:52:19 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>, "palmerdabbelt@google.com"
 <palmerdabbelt@google.com>, Anup Patel <Anup.Patel@wdc.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v3] RISC-V: Check clint_time_val before use
Thread-Topic: [PATCH v3] RISC-V: Check clint_time_val before use
Thread-Index: AQHWlJCbTT3SAnzKQkepz4y0A+6P2ql7+5eA
Date: Sun, 27 Sep 2020 05:52:19 +0000
Message-ID: <c0ec481bf0413f391b16415530d2606114ea150a.camel@wdc.com>
References: <20200927053916.879116-1-anup.patel@wdc.com>
In-Reply-To: <20200927053916.879116-1-anup.patel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5 (3.36.5-1.fc32) 
authentication-results: sifive.com; dkim=none (message not signed)
 header.d=none;sifive.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:8d3e:27aa:85c2:44b5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3319ebd6-0a99-427b-3358-08d862a97f0c
x-ms-traffictypediagnostic: CY4PR04MB0568:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR04MB0568983E505409C4B197A09EE7340@CY4PR04MB0568.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0JfD0t/RuZwCEc+4eEcekKzD8OWnjayIjJISCf85QWKbuupmTtOotMn5x4to9Twm54B0ik1NDU6Hqh3jWWC1Wa/zx3Ik9FWguNpJ1Hxbw8L9mhbFriT9Nz3kcmCiq/ePNmU4TJoS10/sSRsIPgx9JLqsUAmO//kSImUlkBnv1tjSrSEOoeI74bvwScSjCYcBHowfwQV66yfuE2y2kpjRCtjcn5QXD+W4X3HEl6NrSrxk5mF/I/0FaRNpf3B4prn34znYehnL8h+ZciECPq9v8+Njk9V+u39DrWVXV7C4Z14+NhI/D78MM2FivWIAhzsPp6HLDQ0UkgPjqIxRW5e9qnTaeM+ttwJ0fxgvZUkUqqkGystAwvbXmKzxQNLv7zvD
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39850400004)(346002)(376002)(366004)(66946007)(66446008)(5660300002)(64756008)(86362001)(71200400001)(66476007)(66556008)(8936002)(8676002)(91956017)(76116006)(83380400001)(2906002)(6486002)(6506007)(54906003)(2616005)(110136005)(316002)(36756003)(186003)(478600001)(6512007)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 8YwibrZmFvELN/RydPRol1syxbF/DXm41vlAcw3lkT/ZkuRO6H1yXtYxeawBv8tn5LDuCgeuBRrQ/Yv5hiC/hXwfkkZLhXFe4hy+tt1lG7uw+EYhhl6ehgXKy9T4F5OcCO4VLSwxOSRmDGjqIcg+peqoiK9sYQnU4XmLH/dSC50wOnUrXBGFnEU85e1gxiGRKR+D9U9eZXU3Q3cwop7/BS5+/KdiqmltfJNUytWDl2Ex/QiyloZdxfQVfzyVeUKT0A+wGJt12EhvTe47txUBPggDVnshyVgCn1BHPQht7mByjqw63GROflzNxSJO5t6w1Ie3FlLO9ii5m6TECFw9ogD7Jp3S8rG8KZpJ8lnmF3lADg3KxO71Hkm1x0dTw/3pDP8dcrsZbkobO3ibNaJrR7bki93ajimjO7YvQUieZaLQIcBGz8NVDdnelbaH8CyK+Qhq+A5f0zqydTslwRAzSXbc4O8SXxHkoLjdkElGBNc+4J9jXr+/Fh4mVl7RsB/2bs1OHiR3B34B7QDr6k70Y7wXM4a8zcymNzcthaLbk4DTdDdZh2eASNYAhIEhUJ1VZk1IWKoAcnrNd5rwqagAUo1SnuzucJFAd632vPQ56ovL0lqo9S9QsWI8VjwGgPaUOG2rkm8zS/Rb75bpfUbKRzuOp5Xj21WjfHOzgGG19cWjaI0TNC41lDMai3H1hvqlNfYGbawCpfkusfEXQJoOfw==
Content-ID: <8C962E43B0C09449AC3B8241DDDB84F2@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB3751.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3319ebd6-0a99-427b-3358-08d862a97f0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2020 05:52:19.1227 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DvTZ0JG0XTGiNODgbnoqDVeSJdWnCY6k+wpgfHDP/ewkJNDqNyfmItriHOyIKGgDTMZM1UPJ8Wz8GXfJcaWSpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0568
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200927_015222_401946_33744D61 
X-CRM114-Status: GOOD (  28.78  )
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
Cc: "anup@brainfault.org" <anup@brainfault.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Atish Patra <Atish.Patra@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, 2020-09-27 at 11:09 +0530, Anup Patel wrote:
> The NoMMU kernel is broken for QEMU virt machine from Linux-5.9-rc6
> because clint_time_val is used even before CLINT driver is probed
> at following places:
> 1. rand_initialize() calls get_cycles() which in-turn uses
>    clint_time_val
> 2. boot_init_stack_canary() calls get_cycles() which in-turn
>    uses clint_time_val
> 
> The issue#1 (above) is fixed by providing custom random_get_entropy()
> for RISC-V NoMMU kernel. For issue#2 (above), we remove dependency of
> boot_init_stack_canary() on get_cycles() and this is aligned with the
> boot_init_stack_canary() implementations of ARM, ARM64 and MIPS kernel.
> 
> Fixes: d5be89a8d118 ("RISC-V: Resurrect the MMIO timer implementation
> for M-mode systems")
> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
> Changes since v2:
>  - Take different approach and provide custom random_get_entropy() for
>    RISC-V NoMMU kernel
>  - Remove dependency of boot_init_stack_canary() on get_cycles()
>  - Hopefully we don't require to set clint_time_val = NULL in CLINT
>    driver with a different approach to fix.
> Changes since v1:
>  - Explicitly initialize clint_time_val to NULL in CLINT driver to
>    avoid hang on Kendryte K210
> ---
>  arch/riscv/include/asm/stackprotector.h |  4 ----
>  arch/riscv/include/asm/timex.h          | 13 +++++++++++++
>  2 files changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/stackprotector.h b/arch/riscv/include/asm/stackprotector.h
> index d95f7b2a7f37..5962f8891f06 100644
> --- a/arch/riscv/include/asm/stackprotector.h
> +++ b/arch/riscv/include/asm/stackprotector.h
> @@ -5,7 +5,6 @@
>  
>  #include <linux/random.h>
>  #include <linux/version.h>
> -#include <asm/timex.h>
>  
>  extern unsigned long __stack_chk_guard;
>  
> @@ -18,12 +17,9 @@ extern unsigned long __stack_chk_guard;
>  static __always_inline void boot_init_stack_canary(void)
>  {
>  	unsigned long canary;
> -	unsigned long tsc;
>  
>  	/* Try to get a semi random initial value. */
>  	get_random_bytes(&canary, sizeof(canary));
> -	tsc = get_cycles();
> -	canary += tsc + (tsc << BITS_PER_LONG/2);
>  	canary ^= LINUX_VERSION_CODE;
>  	canary &= CANARY_MASK;
>  
> diff --git a/arch/riscv/include/asm/timex.h b/arch/riscv/include/asm/timex.h
> index 7f659dda0032..ab104905d4db 100644
> --- a/arch/riscv/include/asm/timex.h
> +++ b/arch/riscv/include/asm/timex.h
> @@ -33,6 +33,19 @@ static inline u32 get_cycles_hi(void)
>  #define get_cycles_hi get_cycles_hi
>  #endif /* CONFIG_64BIT */
>  
> +/*
> + * Much like MIPS, we may not have a viable counter to use at an early point
> + * in the boot process. Unfortunately we don't have a fallback, so instead
> + * we just return 0.
> + */
> +static inline unsigned long random_get_entropy(void)
> +{
> +	if (unlikely(clint_time_val == NULL))
> +		return 0;
> +	return get_cycles();
> +}
> +#define random_get_entropy()	random_get_entropy()
> +
>  #else /* CONFIG_RISCV_M_MODE */
>  
>  static inline cycles_t get_cycles(void)

Did not reply to the patch... So again for Kendryte:

Tested-by: Damien Le Moal <damien.lemoal@wdc.com>


-- 
Damien Le Moal
Western Digital
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
