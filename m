Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E412C83F1A
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jul 2025 04:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:Mime-Version
	:Subject:From:In-Reply-To:Cc:To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XsfVSuSa+nV44bN1D0alnN2CQnpUND1cstEOqrIb7vA=; b=X5M3MpgsGQIC3x
	nuJe0BR7jDz+OXZdwy3hQ2LbiOVpPLiur5H1j4j1gg3BS6nXFfzf61f8Eg9hphp4ZaWGPmLlyKuXg
	3eCVMBKkiWrosOLijw/3OIQlqhfEbFDDyyY0CswMwrav5VpYGyTCYgThfHL2iNHF3x4+9cNHHjOJn
	FN79++x0zF1ZrKwWwUp2dqh4u6sDzDQXo2LkfxDXJ29CrahguaqDfUJLJ2qsjBJuLuUr5radzCvv0
	XadnnqQbJpNb1mWypmJOGVoBbBytkAIzLk3h8n8+FsX9ME7B9v/k6uSc5zgfIP8DXIAlM57r0bhwY
	Q7TdUiFt2k8lb5YXxqJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue4k5-00000001G6F-0lpa;
	Tue, 22 Jul 2025 04:36:41 +0000
Received: from sg-1-22.ptr.blmpb.com ([118.26.132.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue4k2-00000001G5r-1l5u
	for linux-riscv@lists.infradead.org;
	Tue, 22 Jul 2025 04:36:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1753158986;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=+9bctTJiffn2opVe6FpoBhDjVwlWXbhmCqBuDxg7YuU=;
 b=eBPi1HEK4Y0OTs29Ex/2n2ev1I78/pmbpCll0MI1g2xHErWui1Ud/JTCpDtQnrIWfVTuNT
 HRmpc8W9WkHNKa8N5SWk2U+jz5/l4jGuQ+U2kKM3MnEPMpGuyoLcPPy4nipWRlnn8Po1BT
 qz5dQUWfLiL0oNlCweRaDLc6K4b0Dk9KDh5wbULEd6Cpd+h2hJZNyvD2npIRW99xVHy5Si
 r86Caiy0NaroPZeJ0gV70T8ze3OdwdbbjVZ8tEXMTlPV/wSrGNOBNznpSt+oVdeXHCoInN
 igdEk52X3hRwiDw2mI1b8EPIWPxpHbLUSPfNvl49arnjA7aFrEPWX4Wr0Dw+mg==
To: "Junhui Liu" <junhui.liu@pigmoral.tech>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Original-From: Nutty Liu <liujingqi@lanxincomputing.com>
In-Reply-To: <20250722-satp-from-fdt-v1-2-5ba22218fa5f@pigmoral.tech>
From: "Nutty Liu" <liujingqi@lanxincomputing.com>
Subject: Re: [PATCH 2/2] riscv: mm: Use mmu-type from FDT to limit SATP mode
User-Agent: Mozilla Thunderbird
Received: from [127.0.0.1] ([116.237.111.137]) by smtp.feishu.cn with ESMTPS; Tue, 22 Jul 2025 12:36:23 +0800
Mime-Version: 1.0
References: <20250722-satp-from-fdt-v1-0-5ba22218fa5f@pigmoral.tech> <20250722-satp-from-fdt-v1-2-5ba22218fa5f@pigmoral.tech>
Date: Tue, 22 Jul 2025 12:36:20 +0800
Message-Id: <590ddc94-afce-412f-911d-2cc67d4a7e4a@lanxincomputing.com>
Content-Language: en-US
X-Lms-Return-Path: <lba+2687f1548+9fc9b1+lists.infradead.org+liujingqi@lanxincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_213638_889370_26B203AD 
X-CRM114-Status: GOOD (  28.18  )
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

On 7/22/2025 12:53 AM, Junhui Liu wrote:
> Some RISC-V implementations may hang when attempting to write an
> unsupported SATP mode, even though the latest RISC-V specification
> states such writes should have no effect. To avoid this issue, the
> logic for selecting SATP mode has been refined:
>
> The kernel now determines the SATP mode limit by taking the minimum of
> the value specified by the kernel command line (noXlvl) and the
> "mmu-type" property in the device tree (FDT). If only one is specified,
> use that.
> - If the resulting limit is sv48 or higher, the kernel will probe SATP
>    modes from this limit downward until a supported mode is found.
> - If the limit is sv39, the kernel will directly use sv39 without
>    probing.
>
> This ensures SATP mode selection is safe and compatible with both
> hardware and user configuration, minimizing the risk of hangs.
>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>   arch/riscv/kernel/pi/fdt_early.c | 40 ++++++++++++++++++++++++++++++++++++++++
>   arch/riscv/kernel/pi/pi.h        |  1 +
>   arch/riscv/mm/init.c             | 11 ++++++++---
>   3 files changed, 49 insertions(+), 3 deletions(-)
Reviewed-by: Nutty Liu <liujingqi@lanxincomputing.com>

Thanks,
Nutty
>
> diff --git a/arch/riscv/kernel/pi/fdt_early.c b/arch/riscv/kernel/pi/fdt_early.c
> index 9bdee2fafe47e4a889132ebe2d0d360717c464e9..a12ff8090f190331f555d9e22ce4d1b3e940bceb 100644
> --- a/arch/riscv/kernel/pi/fdt_early.c
> +++ b/arch/riscv/kernel/pi/fdt_early.c
> @@ -3,6 +3,7 @@
>   #include <linux/init.h>
>   #include <linux/libfdt.h>
>   #include <linux/ctype.h>
> +#include <asm/csr.h>
>   
>   #include "pi.h"
>   
> @@ -183,3 +184,42 @@ bool fdt_early_match_extension_isa(const void *fdt, const char *ext_name)
>   
>   	return ret;
>   }
> +
> +/**
> + *  set_satp_mode_from_fdt - determine SATP mode based on the MMU type in fdt
> + *
> + * @dtb_pa: physical address of the device tree blob
> + *
> + *  Returns the SATP mode corresponding to the MMU type of the first enabled CPU,
> + *  0 otherwise
> + */
> +u64 set_satp_mode_from_fdt(uintptr_t dtb_pa)
> +{
> +	const void *fdt = (const void *)dtb_pa;
> +	const char *mmu_type;
> +	int node, parent;
> +
> +	parent = fdt_path_offset(fdt, "/cpus");
> +	if (parent < 0)
> +		return 0;
> +
> +	fdt_for_each_subnode(node, fdt, parent) {
> +		if (!fdt_node_name_eq(fdt, node, "cpu"))
> +			continue;
> +
> +		if (!fdt_device_is_available(fdt, node))
> +			continue;
> +
> +		mmu_type = fdt_getprop(fdt, node, "mmu-type", NULL);
> +		if (!mmu_type)
> +			break;
> +
> +		if (!strcmp(mmu_type, "riscv,sv39"))
> +			return SATP_MODE_39;
> +		else if (!strcmp(mmu_type, "riscv,sv48"))
> +			return SATP_MODE_48;
> +		break;
> +	}
> +
> +	return 0;
> +}
> diff --git a/arch/riscv/kernel/pi/pi.h b/arch/riscv/kernel/pi/pi.h
> index 21141d84fea603fdfc439e12a8c3216f1527c65f..3fee2cfddf7cfb8179af6f2d9b69a0d5e412fad7 100644
> --- a/arch/riscv/kernel/pi/pi.h
> +++ b/arch/riscv/kernel/pi/pi.h
> @@ -14,6 +14,7 @@ u64 get_kaslr_seed(uintptr_t dtb_pa);
>   u64 get_kaslr_seed_zkr(const uintptr_t dtb_pa);
>   bool set_nokaslr_from_cmdline(uintptr_t dtb_pa);
>   u64 set_satp_mode_from_cmdline(uintptr_t dtb_pa);
> +u64 set_satp_mode_from_fdt(uintptr_t dtb_pa);
>   
>   bool fdt_early_match_extension_isa(const void *fdt, const char *ext_name);
>   
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index d03e02a92379f2338a4f4df0ab797a7859b83dfc..0f30fa875abf92a201579ac6469958b0d95b5a58 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -816,6 +816,7 @@ static __meminit pgprot_t pgprot_from_va(uintptr_t va)
>   
>   #if defined(CONFIG_64BIT) && !defined(CONFIG_XIP_KERNEL)
>   u64 __pi_set_satp_mode_from_cmdline(uintptr_t dtb_pa);
> +u64 __pi_set_satp_mode_from_fdt(uintptr_t dtb_pa);
>   
>   static void __init disable_pgtable_l5(void)
>   {
> @@ -855,18 +856,22 @@ static void __init set_mmap_rnd_bits_max(void)
>    * underlying hardware: establish 1:1 mapping in 4-level page table mode
>    * then read SATP to see if the configuration was taken into account
>    * meaning sv48 is supported.
> + * The maximum SATP mode is limited by both the command line and the "mmu-type"
> + * property in the device tree, since some platforms may hang if an unsupported
> + * SATP mode is attempted.
>    */
>   static __init void set_satp_mode(uintptr_t dtb_pa)
>   {
>   	u64 identity_satp, hw_satp;
>   	uintptr_t set_satp_mode_pmd = ((unsigned long)set_satp_mode) & PMD_MASK;
> -	u64 satp_mode_cmdline = __pi_set_satp_mode_from_cmdline(dtb_pa);
> +	u64 satp_mode_limit = min_not_zero(__pi_set_satp_mode_from_cmdline(dtb_pa),
> +					   __pi_set_satp_mode_from_fdt(dtb_pa));
>   
>   	kernel_map.page_offset = PAGE_OFFSET_L5;
>   
> -	if (satp_mode_cmdline == SATP_MODE_48) {
> +	if (satp_mode_limit == SATP_MODE_48) {
>   		disable_pgtable_l5();
> -	} else if (satp_mode_cmdline == SATP_MODE_39) {
> +	} else if (satp_mode_limit == SATP_MODE_39) {
>   		disable_pgtable_l5();
>   		disable_pgtable_l4();
>   		return;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
