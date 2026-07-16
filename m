Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6650C44501
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 10:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TugGCdKrIgkAjaHfadxLj/CaGUZDfBCMCSP2XCtY8Jk=; b=21AbTsY63jqKk2
	7nRnAhMNuX09x2pykYv/F4VxKXSLlT0+VI0NmDbHqf861dyMhzawywXnMdaihHf+XF2Tw8pAYi9HJ
	jAo2UMVuB/T3cdhHSfc9dOg4rV+lKrURilRSt4o2d4bfGTdLJFwJEZ5buIcipuxEqImQ+eU1k0YRf
	GMV6EIFHjXFyqCb+QLCYExBRpK506L1nYim2ju217O0FSh9dANLJHt755bZ64ARy3s8NDNMM3opSW
	7BalC9XJpXUtvyNkK+w6w042TuAOuOa2VzINFqUfSG1x9QI8TYBp7fd7g+p5/+duYTrFBu9dl1LUW
	f1hapfdhZMuf29UKl/IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkJ9c-0000000GzSs-1j0r;
	Thu, 16 Jul 2026 10:17:20 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkJ9Z-0000000GzRU-0L5a
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 10:17:18 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-848882fdb18so3327707b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 16 Jul 2026 03:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784197035; x=1784801835; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vw1NvMyat53QVtE+hIRye2yunzultroK74cMYu74xfk=;
        b=S1RHdjxsrwk9jkGLJi2/V4I+HPgL84l6uXqf1XapMGvO/pd+TGgFVgbzWqrgBogqEL
         qpTavvPkoZ10TJy3/cD9NJkeE5ZlfAdJOMUudtO04eIivIfGFZdPD7Nz25hPZ00gxWet
         YkgF8vU5MVmqyRtnwM6EL/Jazt4inhtPk+r1SR0ySgn4/qfLA8Xbl4SVAO7wupnmB5q4
         Muge/kvt61wJN6VyCZB7B01WfQB2/z9QBQOU5zJH+4NNsWsTTgtNN9/Wmit5N29krQkv
         XQ+uzzquHTLGfYt208MmL5fVUT8xUEA2i9ZNdsmtXEOBtnEOgDuFqENOPz12r3ELU4uE
         N0iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784197035; x=1784801835;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vw1NvMyat53QVtE+hIRye2yunzultroK74cMYu74xfk=;
        b=svbi+QgkrYidywlm/h5hfvtg/ku+jyqmknuQ1FzLz743jwhjz+GMHv737fr0j+ZmFC
         R2sprrNabh80d8A5D+2YZ7n1jiAVggKtV+z52D9eg5QybBLvjJVV3zY4pQs+K5eP8Pr6
         W/CJnA+W5imkhru0B9+wS9H9uw3Den+8gZ06GsfpvvbWkIei22brz8b2aeeiKPkxZwA5
         zuE/a8KPCURHcDnHUH/eSlr34AcUIOPYCdensl3/ObzxfOYtW3YFQ1rn/yptdeSKqpOU
         yqv4DoXSoWp6OIny6KJidUCOKJIgTA45PQ2USDPC/6U4u95BD8xBixesUH4+MSmDPaXF
         fRfw==
X-Forwarded-Encrypted: i=1; AHgh+Ro1oMJR5FdXAr09MKNvIxGdXB9+/eFCQsAJ809DXLXzzi65SWlwUKvvgAtNQu9UZdUzWDse7klkKSdmJw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyUPEg3rzB1sFT5hAq3bUpide4x6Tt891lEh8s41TlW6FFs/Gq9
	g+NodvFGg1TA3AUPCRUrD+NrExucBvp+LnrWVZGwgywtC42FNvMlLsEx
X-Gm-Gg: AfdE7cncQo8eneqWstD9YAOjbc9XVFlcBiKlaS34WybVsHjWP3FLnpcZWVhDyFOlLCg
	QK6XOR9dE/y0RMOTKzpKaUAlsmboWqlSn/LLxHQmaxHeAh4zN8jxawuwnFDaL9e/zTftkAClK1w
	sAymTu4L3sBllSHjhUaryRwykne+Q7zbt13KdeIB2dgBK4kvKb7qqPNgH18ynZkpM36xW4IDBcj
	Y2WBaZgU2/0YwND9dTsGJSTlZri9ayQMh4qXy5DrJ0jKsgElcRtxPTolJkNPmpYpQoACYXW/6pR
	trDPfYAf/7ousgCN46kWuz3B73rZXDFx5X/pa4wvUIiab3LI7GNE/eIr7E2hdF4NIZ/wmhftlbu
	+xr/VA2QmHz9iFNabTgpZU3RaBA2sJ8T/TuDGvUCcjL748Ft5ZQxtcO9x2XrB6hASPfKL0XqnjN
	Wlj8I=
X-Received: by 2002:a05:6a00:12e2:b0:84a:2d5c:528c with SMTP id d2e1a72fcca58-84a6736d52amr5896132b3a.61.1784197035226;
        Thu, 16 Jul 2026 03:17:15 -0700 (PDT)
Received: from [192.168.0.13] ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f238930sm4576008b3a.3.2026.07.16.03.17.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 03:17:14 -0700 (PDT)
Message-ID: <4640558d-6536-45b1-ac8d-f5cbffe33d19@gmail.com>
Date: Thu, 16 Jul 2026 03:14:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] riscv: errata: picoheart: Add workaround for
 cbo.clean errata
To: Yicong Yang <yang.yicong@picoheart.com>, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org
Cc: geshijian@picoheart.com, niehaitao@picoheart.com, cuiyunhui@bytedance.com
References: <20260715084724.26578-1-yang.yicong@picoheart.com>
 <20260715084724.26578-3-yang.yicong@picoheart.com>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <20260715084724.26578-3-yang.yicong@picoheart.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_031717_304495_7813A43E 
X-CRM114-Status: GOOD (  36.48  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Yicong,

On 7/15/26 01:47, Yicong Yang wrote:
> cbo.clean may fail to write back the cacheline in a few very corner
> cases on the affected Picoheart SoCs. Since cbo.flush is not affected,
> the problem could be solved by promoting cbo.clean to cbo.flush to
> keep the data coherent. So Implement and register Picoheart specific
> riscv_nonstd_cache_ops for all the kernel space cache maintenance
> operations. Implement riscv_nonstd_cache_ops->wback with cbo.clean
> while other callbacks with corresponding CBO operations.
> 
> This could solve the issue in the kernel space. For userspace, clear
> the xenvcfg.CBCFE to trap the cbo.{clean, flush} and emulate
> the cbo.clean with cbo.flush in the kernel space to avoid the issue.
> 
> Signed-off-by: Yicong Yang <yang.yicong@picoheart.com>
> ---
>   arch/riscv/Kconfig.errata            |  12 +++
>   arch/riscv/errata/picoheart/errata.c | 144 +++++++++++++++++++++++++++
>   arch/riscv/include/asm/errata_list.h |  25 ++++-
>   arch/riscv/include/asm/insn.h        |   4 +
>   arch/riscv/kernel/cpufeature.c       |   3 +
>   arch/riscv/kernel/traps.c            |   4 +
>   6 files changed, 191 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
> index 374d7fcf7936..8ce5c0314321 100644
> --- a/arch/riscv/Kconfig.errata
> +++ b/arch/riscv/Kconfig.errata
> @@ -164,4 +164,16 @@ config ERRATA_PICOHEART
>   
>   	  Otherwise, please say "N" here to avoid unnecessary overhead.
>   
> +config ERRATA_PICOHEART_CBO_CLEAN
> +	bool "Apply Picoheart cbo.clean errata"
> +	depends on ERRATA_PICOHEART
> +	select RISCV_NONSTANDARD_CACHE_OPS
> +	default y
> +	help
> +	   This will apply the cbo.clean errata workaround on the affected
> +	   Picoheart SoCs where cbo.clean instructions may fail to write back
> +	   the cacheline in few corner cases.
> +
> +	   If you don't know what to do here, say "Y".
> +
>   endmenu # "CPU errata selection"
> diff --git a/arch/riscv/errata/picoheart/errata.c b/arch/riscv/errata/picoheart/errata.c
> index 53b690878f78..9392c1634ece 100644
> --- a/arch/riscv/errata/picoheart/errata.c
> +++ b/arch/riscv/errata/picoheart/errata.c
> @@ -5,20 +5,164 @@
>    * Author: Yicong Yang <yang.yicong@picoheart.com>
>    */
>   
> +#include <linux/align.h>
>   #include <linux/cacheflush.h>
>   #include <linux/cleanup.h>
> +#include <linux/jump_label.h>
>   #include <linux/kernel.h>
>   #include <linux/memory.h>
> +#include <linux/signal.h>
>   #include <linux/string.h>
> +#include <asm/asm-extable.h>
>   #include <asm/alternative.h>
> +#include <asm/cpufeature.h>
> +#include <asm/dma-noncoherent.h>
>   #include <asm/errata_list.h>
> +#include <asm/insn.h>
> +#include <asm/insn-def.h>
>   #include <asm/text-patching.h>
> +#include <asm/uaccess.h>
>   #include <asm/vendor_extensions.h>
>   #include <asm/vendorid_list.h>
>   
> +#ifdef CONFIG_ERRATA_PICOHEART_CBO_CLEAN
> +
> +static bool insn_is_cbo_clean_flush(u32 insn_buf)
> +{
> +	u32 rd, opcode, funct3, funct12;
> +
> +	/* CBO instructions don't have compressed variants */
> +	if (GET_INSN_LENGTH(insn_buf) != 4)
> +		return false;
> +
> +	rd = RV_EXTRACT_RD_REG(insn_buf);
> +	opcode = insn_buf & __INSN_OPCODE_MASK;
> +	funct3 = insn_buf & RV_INSN_FUNCT3_MASK;
> +	funct12 = insn_buf & RV_INSN_FUNCT12_MASK;
> +
> +	if (rd != 0 || opcode != 15 || funct3 != RV_ENCODE_FUNCT3(CBO) ||
> +	    (funct12 != RV_ENCODE_FUNCT12(CBO_CLEAN) &&
> +	     funct12 != RV_ENCODE_FUNCT12(CBO_FLUSH)))
> +		return false;
> +
> +	return true;
> +}
> +
> +bool riscv_picoheart_illegal_insn_handler(struct pt_regs *regs)
> +{
> +	u32 __user *epc = (u32 __user *)regs->epc;
> +	u32 insn = (u32)regs->badaddr;
> +	void __user *line_addr;
> +	int ret = 0;
> +	u64 addr;
> +	u32 rs1;
> +
> +	/* Do the emulation only for userspace on the sufferred platform */
> +	if (!user_mode(regs) || !riscv_cpu_has_zicbom_errata())
> +		return false;
> +
> +	if (!insn) {
> +		if (__get_user(insn, epc))

There's already the get_insn/__read_insn function in traps_misaligned.c.
Why not use that instead?

BTW, I just found that __get_user is not correct for fetching insns from
user. It doesn't set the MXR bit, and it'll fail if the userspace maps
the text page executable, but not readable.

> +			return false;
> +	}
> +
> +	if (!insn_is_cbo_clean_flush(insn))
> +		return false;
> +
> +	rs1 = RV_EXTRACT_RS1_REG(insn);
> +	addr = rs1 ? ((unsigned long *)regs)[rs1] : 0;
> +	line_addr = (void __user *)ALIGN_DOWN(addr, riscv_cbom_block_size);
> +
> +	if (!access_ok(line_addr, riscv_cbom_block_size)) {
> +		current->thread.bad_cause = EXC_STORE_PAGE_FAULT;
> +		goto err_map;
> +	}

I feel this needs to be reworked if we really want to handle insn fault
this way. It should not touch current->thread.bad_cause or directly call
do_trap. Rather, follow the pattern of riscv_v_first_use_handler.

> +
> +	__enable_user_access();
> +	asm volatile("\n"
> +		"1:	\n"
> +		CBO_FLUSH(%[addr])
> +		"2:	\n"
> +		_ASM_EXTABLE_UACCESS_ERR(1b, 2b, %[err])
> +	: [err] "+r" (ret)
> +	: [addr] "r" (untagged_addr(addr))
> +	: "memory");
> +	__disable_user_access();

It's not very maintainable. It should probably reuse some macros in
uaccess.h.

> +
> +	if (ret)
> +		goto err_map;
> +
> +	regs->epc += GET_INSN_LENGTH(insn);
> +	return true;
> +
> +err_map:
> +	/*
> +	 * We'll reach here if the target address is invalid.
> +	 * cbo.{flush ,clean} on invalid address will cause
> +	 * store page fault, update the cause and badaddr.
> +	 */
> +	regs->badaddr = addr;
> +	regs->cause = current->thread.bad_cause;
> +	do_trap(regs, SIGSEGV, SEGV_MAPERR, addr);

See comment above.

> +	return true;
> +}
> +
> +#endif /* CONFIG_ERRATA_PICOHEART_CBO_CLEAN */
> +
> +static void picoheart_errata_cache_wback(phys_addr_t paddr, size_t size)
> +{
> +	void *vaddr = phys_to_virt(paddr);
> +
> +	ALT_CMO_OP(FLUSH, vaddr, size, riscv_cbom_block_size);
> +}
> +
> +static void picoheart_errata_cache_inv(phys_addr_t paddr, size_t size)
> +{
> +	void *vaddr = phys_to_virt(paddr);
> +
> +	ALT_CMO_OP(INVAL, vaddr, size, riscv_cbom_block_size);
> +}
> +
> +static void picoheart_errata_cache_wback_inv(phys_addr_t paddr, size_t size)
> +{
> +	void *vaddr = phys_to_virt(paddr);
> +
> +	ALT_CMO_OP(FLUSH, vaddr, size, riscv_cbom_block_size);
> +}
> +
> +struct riscv_nonstd_cache_ops picoheart_errata_cmo_ops = {
> +	.wback = &picoheart_errata_cache_wback,
> +	.inv = &picoheart_errata_cache_inv,
> +	.wback_inv = &picoheart_errata_cache_wback_inv,
> +};
> +
> +DEFINE_STATIC_KEY_FALSE(has_picoheart_cbo_clean_errata);
> +
> +static void picoheart_errata_probe_cbo_clean(unsigned int stage,
> +					     unsigned long archid,
> +					     unsigned long impid)
> +{
> +	if (!IS_ENABLED(CONFIG_ERRATA_PICOHEART_CBO_CLEAN))
> +		return;
> +
> +	if (stage != RISCV_ALTERNATIVES_BOOT)
> +		return;
> +
> +	if (!riscv_isa_extension_available(NULL, ZICBOM))
> +		return;
> +
> +	if (archid != 0x804a555049544552 || impid != 0x100)
> +		return;
> +
> +	riscv_noncoherent_supported();
> +	riscv_noncoherent_register_cache_ops(&picoheart_errata_cmo_ops);
> +	static_branch_enable(&has_picoheart_cbo_clean_errata);
> +}
> +
>   static u32 picoheart_errata_probe(unsigned int stage, unsigned long archid,
>   				  unsigned long impid)
>   {
> +	picoheart_errata_probe_cbo_clean(stage, archid, impid);
>   	return 0;
>   }
>   
> diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
> index 6694b5ccdcf8..2b786decfa39 100644
> --- a/arch/riscv/include/asm/errata_list.h
> +++ b/arch/riscv/include/asm/errata_list.h
> @@ -117,6 +117,29 @@ asm volatile(ALTERNATIVE(						\
>   #define THEAD_C9XX_RV_IRQ_PMU			17
>   #define THEAD_C9XX_CSR_SCOUNTEROF		0x5c5
>   
> -#endif /* __ASSEMBLER__ */
> +#ifdef CONFIG_ERRATA_PICOHEART_CBO_CLEAN
> +
> +#include <linux/jump_label.h>
> +
> +DECLARE_STATIC_KEY_FALSE(has_picoheart_cbo_clean_errata);
> +
> +static inline bool riscv_cpu_has_zicbom_errata(void)
> +{
> +	return static_branch_unlikely(&has_picoheart_cbo_clean_errata);
> +}
> +
> +bool riscv_picoheart_illegal_insn_handler(struct pt_regs *regs);
> +
> +#else /* !CONFIG_ERRATA_PICOHEART_CBO_CLEAN */
> +
> +static inline bool riscv_cpu_has_zicbom_errata(void) { return false; }
> +static inline bool riscv_picoheart_illegal_insn_handler(struct pt_regs *regs)
> +{
> +	return false;
> +}
> +
> +#endif /* CONFIG_ERRATA_PICOHEART_CBO_CLEAN */
> +
> +#endif /* __ASSEMBLY__ */
>   
>   #endif
> diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
> index c3005573e8c9..5b7c0e6fabbd 100644
> --- a/arch/riscv/include/asm/insn.h
> +++ b/arch/riscv/include/asm/insn.h
> @@ -12,6 +12,7 @@
>   #define RV_INSN_FUNCT3_OPOFF	12
>   #define RV_INSN_OPCODE_MASK	GENMASK(6, 0)
>   #define RV_INSN_OPCODE_OPOFF	0
> +#define RV_INSN_FUNCT12_MASK	GENMASK(31, 20)
>   #define RV_INSN_FUNCT12_OPOFF	20
>   
>   #define RV_ENCODE_FUNCT3(f_)	(RVG_FUNCT3_##f_ << RV_INSN_FUNCT3_OPOFF)
> @@ -171,6 +172,7 @@
>   #define RVG_FUNCT3_JALR		0x0
>   #define RVG_FUNCT3_BEQ		0x0
>   #define RVG_FUNCT3_BNE		0x1
> +#define RVG_FUNCT3_CBO		0x2
>   #define RVG_FUNCT3_BLT		0x4
>   #define RVG_FUNCT3_BGE		0x5
>   #define RVG_FUNCT3_BLTU		0x6
> @@ -186,6 +188,8 @@
>   #define RVC_FUNCT4_C_EBREAK	0x9
>   
>   #define RVG_FUNCT12_EBREAK	0x1
> +#define RVG_FUNCT12_CBO_CLEAN	0x1
> +#define RVG_FUNCT12_CBO_FLUSH	0x2
>   #define RVG_FUNCT12_SRET	0x102
>   
>   #define RVG_MATCH_AUIPC		(RVG_OPCODE_AUIPC)
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 1fe647e03515..11ae0f00cc82 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -1208,6 +1208,9 @@ void __init riscv_user_isa_enable(void)
>   	if (!riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICBOP) &&
>   	    any_cpu_has_zicbop)
>   		pr_warn("Zicbop disabled as it is unavailable on some harts\n");
> +
> +	if (riscv_cpu_has_zicbom_errata())
> +		current->thread.envcfg &= ~ENVCFG_CBCFE;
>   }
>   
>   #ifdef CONFIG_RISCV_ALTERNATIVE
> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index 8c62c771a656..9cd21073babc 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -177,6 +177,10 @@ asmlinkage __visible __trap_section void do_trap_insn_illegal(struct pt_regs *re
>   		local_irq_enable();
>   
>   		handled = riscv_v_first_use_handler(regs);
> +
> +		if (!handled)
> +			handled = riscv_picoheart_illegal_insn_handler(regs);
> +

I don't think you should hack the common insn fault handler below and call
your handler function. At least you must ensure this is really a no-op on
other arch/platforms.

>   		if (!handled)
>   			do_trap_error(regs, SIGILL, ILL_ILLOPC, regs->epc,
>   				      "Oops - illegal instruction");

Have you considered putting this trap-n-emulate logic in the SBI firmware
such as OpenSBI, which I'd assume you are using? In OpenSBI, it's already
handling illegal instruction fault, and forwarding to OS if not known. Why
not handle it there? It'll probably be more efficient and, better, you can
support unpatched Linux and userspace, and even in Guest VM. Still, your
picoheart_errata_cmo_ops is required, to avoid the emulation overhead for
kernel cbo.clean as much as possible.

Bo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
