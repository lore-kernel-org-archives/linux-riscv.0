Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0161C4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Feb 2022 06:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	Mime-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oitBxF7rQiMmfu7AWdSFKiMlenYfvLqqIYGHnXLg7m8=; b=437nfxeSWz+OPh
	sbBD7VwaA3k+pSQ4Kuyq3H3JtIWbL2Y4xjfNWYEKSSm1DXOjjd0yCXTm3JYxucAx0wbQlSEyuI8xw
	ZtWeURVkA8nvBH+oekkY40xF9sM1u+BHVJKd3v90KiJnzCssrPKJEwj3jFy1TQx7zEwWisOS8t5xZ
	kN+5Kru+n8vxogOTinqoRSSM2dxjVRt5sd8NLsvW245zhe3INmGb1uw1sUBqGGsGOmHuMhb/sHIo+
	Aac8PceAPM0CUUQBKErGULxyCX4bLDDwgHKdWaDFUtMefBzQvTMluThF5u4sPPzCMtWvY18FokDva
	YdDc9vWSCPRmmil3M5Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIlrA-009UTg-Jb; Sat, 12 Feb 2022 06:26:04 +0000
Received: from mail-sender-0.a4lg.com ([2401:2500:203:30b:4000:6bfe:4757:0])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIlr6-009UTM-Lh
 for linux-riscv@lists.infradead.org; Sat, 12 Feb 2022 06:26:03 +0000
Message-ID: <ae93358e-e117-b43d-faad-772c529f846c@irq.a4lg.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
 s=2017s01; t=1644647150;
 bh=efO97KCUmmyjZDhn+NvSvQNaLsHcYa5QOTSJAPgdhiA=;
 h=Date:Mime-Version:Subject:To:References:From:In-Reply-To:
 Content-Type:Content-Transfer-Encoding;
 b=QLUqe+li3aLz5man5GGiti1nCUWxVTXUhPiOB+UtSTc6F1nEPC5WjLxfbebRpWf4c
 lKvzglQKzOY5OzcHLQ/M6Fqp0tpEhV9fm7J8rmVNalVlvIMoyLIiepaJm0Arc1T/zg
 0ECHmZnbXPL0C5kGVW/cjI7GRudMUBaAdDgHSx9I=
Date: Sat, 12 Feb 2022 15:25:48 +0900
Mime-Version: 1.0
Subject: Re: [PATCH v2 2/6] RISC-V: Minimal parser for "riscv, isa" strings
Content-Language: en-US
To: linux-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>,
 Anup Patel <Anup.Patel@wdc.com>
References: <20220210214018.55739-1-atishp@rivosinc.com>
 <20220210214018.55739-3-atishp@rivosinc.com>
From: Tsukasa OI <research_trasio@irq.a4lg.com>
In-Reply-To: <20220210214018.55739-3-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220211_222601_133871_80AB9CF7 
X-CRM114-Status: GOOD (  28.49  )
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

Hi Atish,

Your patches for new RISC-V extension framework seems good.  I was busy
working on GNU Binutils and (though I'm not completely convinced) it's
okay with "isa-ext" approach of Anup.

And thanks for using my parser for new ISA extension framework.

Still, I will raise an issue with your "improvement" and propose new
version of PATCH 1-3/6 (as replies to this e-mail).

(I also corrected indent on PATCH 3/6 though this is not functional).

Thanks,
Tsukasa

On 2022/02/11 6:40, Atish Patra wrote:
> From: Tsukasa OI <research_trasio@irq.a4lg.com>
> 
> Current hart ISA ("riscv,isa") parser don't correctly parse:
> 
> 1. Multi-letter extensions
> 2. Version numbers
> 
> All ISA extensions ratified recently has multi-letter extensions
> (except 'H'). The current "riscv,isa" parser that is easily confused
> by multi-letter extensions and "p" in version numbers can be a huge
> problem for adding new extensions through the device tree.
> 
> Leaving it would create incompatible hacks and would make "riscv,isa"
> value unreliable.
> 
> This commit implements minimal parser for "riscv,isa" strings.  With this,
> we can safely ignore multi-letter extensions and version numbers.
> 
> Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
> [Improved commit text and fixed a bug around 's' in base extension]
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/kernel/cpufeature.c | 67 ++++++++++++++++++++++++++++------
>  1 file changed, 56 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index dd3d57eb4eea..e19ae4391a9b 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -7,6 +7,7 @@
>   */
>  
>  #include <linux/bitmap.h>
> +#include <linux/ctype.h>
>  #include <linux/of.h>
>  #include <asm/processor.h>
>  #include <asm/hwcap.h>
> @@ -66,7 +67,7 @@ void __init riscv_fill_hwcap(void)
>  	struct device_node *node;
>  	const char *isa;
>  	char print_str[NUM_ALPHA_EXTS + 1];
> -	size_t i, j, isa_len;
> +	int i, j;
>  	static unsigned long isa2hwcap[256] = {0};
>  
>  	isa2hwcap['i'] = isa2hwcap['I'] = COMPAT_HWCAP_ISA_I;
> @@ -92,23 +93,67 @@ void __init riscv_fill_hwcap(void)
>  			continue;
>  		}
>  
> -		i = 0;
> -		isa_len = strlen(isa);
>  #if IS_ENABLED(CONFIG_32BIT)
>  		if (!strncmp(isa, "rv32", 4))
> -			i += 4;
> +			isa += 4;
>  #elif IS_ENABLED(CONFIG_64BIT)
>  		if (!strncmp(isa, "rv64", 4))
> -			i += 4;
> +			isa += 4;
>  #endif
> -		for (; i < isa_len; ++i) {
> -			this_hwcap |= isa2hwcap[(unsigned char)(isa[i])];
> +		for (; *isa; ++isa) {
> +			const char *ext = isa++;
> +			bool ext_long, ext_err = false;

To address an issue reported in
<https://lore.kernel.org/all/202202111616.z7nZoKYj-lkp@intel.com/T/>,
we'd be better to initialize ext_long with false.

> +
> +			switch (*ext) {
> +			case 's':
> +			case 'x':
> +			case 'z':
> +				/**
> +				 * 's' is a special case because:
> +				 * It can be present in base extension for supervisor
> +				 * Multi-letter extensions can start with 's' as well for
> +				 * Supervisor extensions (i.e. sstc, sscofpmf, svinval)
> +				 */
> +				if (*ext == 's' && ext[-1] != '_')
> +					break;

I think you added this for QEMU bug workaround (I will describe leter)
but this will raise an issue.

QEMU generates invalid ISA string on "riscv,isa" such like:
"rv64imafdcsuh".  QEMU handles 'S' as a single-letter extension and can
easily confuse my parser (handles this as 'Suh' non-existent extension).

Atish tried to address this issue by handling \2 of "([^_])(S)"
as a single-letter 'S' extension.

It's okay for QEMU-generated ones and full ISA strings like
"rv64imafdc_svinval_svnapot".  However, it causes problems on
"rv64imafdcsvinval_svnapot" (no underscore before "svinval").  This is
still a valid ISA string (with existing extensions) but confuses
Atish's parser.

The best solution is to fix **ONLY** QEMU and not make this exception.

If we need QEMU workaround now, how about checking \2 of "([^_])(SU)"
as single-letter 'S' and 'U' extensions?

Here's the background for my new workaround:

1.  Linux requires U-mode.
2.  QEMU always generates invalid ISA string containing "SU"
    for RISC-V with MSU modes.
3.  There's no standard extensions starting with 'Su'
    (there's even no discussions/drafts about them).

Following is related dumps from QEMU and Spike with my test Busybox image
(with some notes):

QEMU + RV64GC (with hypervisor enabled) w/o Atish's workaround
=-===========================================================================-=
processor	: 0
hart		: 0
isa		: rv64imafdcsuh
isa-ext		: 
mmu		: sv48

riscv,isa (DTS) : rv64imafdcsuh   ("suh" is handled as an extension)
dmesg:
[    0.000000] riscv: ISA extensions acdfim  (hypervisor not detected!)
[    0.000000] riscv: ELF capabilities acdfim
=-===========================================================================-=

QEMU + RV64GC (with hypervisor enabled) w/ Atish's workaround
=-===========================================================================-=
processor	: 0
hart		: 0
isa		: rv64imafdcsuh
isa-ext		: 
mmu		: sv48

riscv,isa (DTS) : rv64imafdcsuh   ("suh" is handled as 'S', 'U' and 'H')
dmesg:
[    0.000000] riscv: ISA extensions acdfhimsu (extra 'S' and 'U' are harmless)
[    0.000000] riscv: ELF capabilities acdfim
=-===========================================================================-=

QEMU + RV64GC (with hypervisor enabled) w/ Tsukasa's new workaround
=-===========================================================================-=
processor	: 0
hart		: 0
isa		: rv64imafdcsuh
isa-ext		: 
mmu		: sv48

riscv,isa (DTS) : rv64imafdcsuh   ("suh" is handled as 'S', 'U' and 'H')
dmesg:
[    0.000000] riscv: ISA extensions acdfhimsu (same as Atish's workaround)
[    0.000000] riscv: ELF capabilities acdfim
=-===========================================================================-=

Spike + rv64imafdc_svinval_svnapot w/ Atish's workaround
=-===========================================================================-=
processor	: 0
hart		: 0
isa		: rv64imafdc
isa-ext		: svinval svnapot 
mmu		: sv48

riscv,isa (DTS) : rv64imafdc_svinval_svnapot
dmesg:
[    0.000000] Found ISA extension svinval
[    0.000000] Found ISA extension svnapot
[    0.000000] riscv: ISA extensions acdfim
[    0.000000] riscv: ELF capabilities acdfim
=-===========================================================================-=

Spike + rv64imafdcsvinval_svnapot w/ Atish's workaround
=-===========================================================================-=
processor	: 0
hart		: 0
isa		: rv64imafdcsvinval
isa-ext		: svnapot 
mmu		: sv48

riscv,isa (DTS) : rv64imafdcsvinval_svnapot
dmesg:
[    0.000000] Found ISA extension svnapot        (no 'Svinval' is found!)
[    0.000000] riscv: ISA extensions acdfilmnsv   ('V' et al. should not be here!)
[    0.000000] riscv: ELF capabilities acdfim
=-===========================================================================-=

Spike + rv64imafdcsvinval_svnapot w/ Tsukasa's new workaround
=-===========================================================================-=
processor	: 0
hart		: 0
isa		: rv64imafdcsvinval
isa-ext		: svinval svnapot 
mmu		: sv48

riscv,isa (DTS) : rv64imafdcsvinval_svnapot
dmesg:
[    0.000000] Found ISA extension svinval
[    0.000000] Found ISA extension svnapot
[    0.000000] riscv: ISA extensions acdfim
[    0.000000] riscv: ELF capabilities acdfim
=-===========================================================================-=


> +				ext_long = true;
> +				/* Multi-letter extension must be delimited */
> +				for (; *isa && *isa != '_'; ++isa)
> +					if (!islower(*isa) && !isdigit(*isa))
> +						ext_err = true;
> +				/* ... but must be ignored. */
> +				break;
> +			default:

> +				ext_long = false;

A line above is removed on my new patches.

> +				if (!islower(*ext)) {
> +					ext_err = true;
> +					break;
> +				}
> +				/* Find next extension */
> +				if (!isdigit(*isa))
> +					break;
> +				while (isdigit(*++isa))
> +					;
> +				if (*isa != 'p')
> +					break;
> +				if (!isdigit(*++isa)) {
> +					--isa;
> +					break;
> +				}
> +				while (isdigit(*++isa))
> +					;
> +				break;
> +			}
> +			if (*isa != '_')
> +				--isa;
>  			/*
> -			 * TODO: X, Y and Z extension parsing for Host ISA
> -			 * bitmap will be added in-future.
> +			 * TODO: Full version-aware handling including
> +			 * multi-letter extensions will be added in-future.
>  			 */
> -			if ('a' <= isa[i] && isa[i] < 'x')
> -				this_isa |= (1UL << (isa[i] - 'a'));
> +			if (ext_err || ext_long)
> +				continue;
> +			this_hwcap |= isa2hwcap[(unsigned char)(*ext)];
> +			this_isa |= (1UL << (*ext - 'a'));
>  		}
>  
>  		/*

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
