Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D54F8C44507
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 05:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Mime-Version:Message-Id:
	Subject:Cc:Date:From:To:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lQFLvJpnQgmPUPIO+0J8igdN5dVo3MB8WQpXlytlLY0=; b=0ew9P7jv6Yq62b
	viPsOZFoBOFHCUU0E9ooAQEEj8sxrSEtxHK9TO0ER+xR7XM2mVQTtCuV9wk52a/tqnZzNEWAPEcuC
	sN3ADVWsukYkANCofouGJFnzgyILuTUyF/JhErLytxL1ZIrO6euKtiWs+uS+MGzonQHpVZF11kmXK
	dYtNNaxaFwAXhHrCCc36jBnJM6q9bx4P8SPY4FwZeKQ/91/rFe6GjC/DaOefaBzdCNprAdKki5Uqx
	LXWoRMioaFiW8SCdojR+WqEpn/tABsPHE7MGo8DQCiBPZMQxnp8Bh4rVE1RiK4V9X5DIxD0Tsc289
	J+RGWgBqnqEkAjTXSwFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkbb2-00000001D3D-43jf;
	Fri, 17 Jul 2026 05:58:52 +0000
Received: from va-2-38.ptr.blmpb.com ([209.127.231.38])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkbaz-00000001D2q-2OTZ
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jul 2026 05:58:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1784267924; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=OT3eXxqmb/XPmAO9tbM/WEjKSVZyNX1DbPYlzSWo6Ng=;
 b=ERkq3/wQzBAASX44VlNg74VRGZT6QvOnV3ZKJQ95ajXwA7RJnRU0H5m0HtOcgn+i4a4NAv
 DjzQJDUXJjhRHFfpwd4HFTlWW+5t40W+FxFtKA6dTVsha/PahZMjKZdmxaxViezDqBoIZK
 XlR/y4KW9jP71yg026n137AUzw2Yp0Ruzmbh4xu6P1COGmiR3D10rfg3ryi/WI9bPL24Sy
 DXvU7SPV81HQtGw4FbaZazK8vf0X/wkYOmSoEWCztnBQUmcf+lP6lWetA5+vjTDoi2EV6h
 /Xf4PLz9rlsrRvhtsTlbJ9nDNdmAjDNuZRZf1PihwyZwnGGihvHP4ef6Tk2oCg==
In-Reply-To: <96c3e2f3-602e-497a-937e-b56047ca3a27@iscas.ac.cn>
X-Lms-Return-Path: <lba+26a59c492+e1556b+lists.infradead.org+yang.yicong@picoheart.com>
Content-Language: en-US
To: "Vivian Wang" <wangruikang@iscas.ac.cn>
From: "Yicong Yang" <yang.yicong@picoheart.com>
Date: Fri, 17 Jul 2026 13:58:39 +0800
User-Agent: Mozilla Thunderbird
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
Cc: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, 
	<linux-riscv@lists.infradead.org>, <yang.yicong@picoheart.com>, 
	<geshijian@picoheart.com>, <niehaitao@picoheart.com>, 
	<cuiyunhui@bytedance.com>
Subject: Re: [PATCH v1 2/3] riscv: errata: picoheart: Add workaround for cbo.clean errata
Message-Id: <3ac14150-a3f1-4512-bb97-357e4ba24459@picoheart.com>
Received: from [100.86.214.202] ([120.234.91.241]) by smtp.feishu.cn with ESMTPS; Fri, 17 Jul 2026 13:58:41 +0800
Mime-Version: 1.0
References: <20260715084724.26578-1-yang.yicong@picoheart.com> <20260715084724.26578-3-yang.yicong@picoheart.com> <96c3e2f3-602e-497a-937e-b56047ca3a27@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_225849_814169_FF05B73C 
X-CRM114-Status: GOOD (  22.04  )
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

On 7/17/26 10:44 AM, Vivian Wang wrote:
> On 7/15/26 16:47, Yicong Yang wrote:
>> cbo.clean may fail to write back the cacheline in a few very corner
>> cases on the affected Picoheart SoCs. Since cbo.flush is not affected,
>> the problem could be solved by promoting cbo.clean to cbo.flush to
>> keep the data coherent. So Implement and register Picoheart specific
>> riscv_nonstd_cache_ops for all the kernel space cache maintenance
>> operations. Implement riscv_nonstd_cache_ops->wback with cbo.clean
>> while other callbacks with corresponding CBO operations.
>>
>> This could solve the issue in the kernel space. For userspace, clear
>> the xenvcfg.CBCFE to trap the cbo.{clean, flush} and emulate
>> the cbo.clean with cbo.flush in the kernel space to avoid the issue.
>>
>> [...]
>>
>> diff --git a/arch/riscv/errata/picoheart/errata.c b/arch/riscv/errata/picoheart/errata.c
>> index 53b690878f78..9392c1634ece 100644
>> --- a/arch/riscv/errata/picoheart/errata.c
>> +++ b/arch/riscv/errata/picoheart/errata.c
>> @@ -5,20 +5,164 @@
>>   * Author: Yicong Yang <yang.yicong@picoheart.com>
>>   */
>>  
>> +#include <linux/align.h>
>>  #include <linux/cacheflush.h>
>>  #include <linux/cleanup.h>
>> +#include <linux/jump_label.h>
>>  #include <linux/kernel.h>
>>  #include <linux/memory.h>
>> +#include <linux/signal.h>
>>  #include <linux/string.h>
>> +#include <asm/asm-extable.h>
>>  #include <asm/alternative.h>
>> +#include <asm/cpufeature.h>
>> +#include <asm/dma-noncoherent.h>
>>  #include <asm/errata_list.h>
>> +#include <asm/insn.h>
>> +#include <asm/insn-def.h>
>>  #include <asm/text-patching.h>
>> +#include <asm/uaccess.h>
>>  #include <asm/vendor_extensions.h>
>>  #include <asm/vendorid_list.h>
>>  
>> +#ifdef CONFIG_ERRATA_PICOHEART_CBO_CLEAN
>> +
>> +static bool insn_is_cbo_clean_flush(u32 insn_buf)
>> +{
>> +	u32 rd, opcode, funct3, funct12;
>> +
>> +	/* CBO instructions don't have compressed variants */
>> +	if (GET_INSN_LENGTH(insn_buf) != 4)
>> +		return false;
>> +
>> +	rd = RV_EXTRACT_RD_REG(insn_buf);
>> +	opcode = insn_buf & __INSN_OPCODE_MASK;
>> +	funct3 = insn_buf & RV_INSN_FUNCT3_MASK;
>> +	funct12 = insn_buf & RV_INSN_FUNCT12_MASK;
>> +
>> +	if (rd != 0 || opcode != 15 || funct3 != RV_ENCODE_FUNCT3(CBO) ||
> 
> This opcode != 15 could be opcode != RVG_OPCODE_FENCE.
> 
> Well... I'm not sure how we should deal with the fact that it's called
> "FENCE". I'm more inclined to rename it to RVG_OPCODE_MISC_MEM because
> that's what it's supposed to be.

sounds reasonable to me. will rename and use it here.

> 
>> +	    (funct12 != RV_ENCODE_FUNCT12(CBO_CLEAN) &&
>> +	     funct12 != RV_ENCODE_FUNCT12(CBO_FLUSH)))
>> +		return false;
>> +
>> +	return true;
>> +}
>> +
>> +bool riscv_picoheart_illegal_insn_handler(struct pt_regs *regs)
>> +{
>> +	u32 __user *epc = (u32 __user *)regs->epc;
>> +	u32 insn = (u32)regs->badaddr;
>> +	void __user *line_addr;
>> +	int ret = 0;
>> +	u64 addr;
>> +	u32 rs1;
>> +
>> +	/* Do the emulation only for userspace on the sufferred platform */
>> +	if (!user_mode(regs) || !riscv_cpu_has_zicbom_errata())
> 
> user_mode(regs) is already checked below in the handler right? I think
> checking again here is unnecessary.

maybe not (or I miss somewhere)?

but the check here is to make sure we can bail out early for non-errata
cases to avoid running unnecessary stuffs.

> 
> Also, I'd rather riscv_cpu_has_zicbom_errata() to have the word
> "picoheart" in it, because "clean doesn't work, please flush instead" is
> still rather specific. We could always rename this later.
> 
>> [...]
>>
>> +static void picoheart_errata_cache_wback(phys_addr_t paddr, size_t size)
>> +{
>> +	void *vaddr = phys_to_virt(paddr);
>> +
>> +	ALT_CMO_OP(FLUSH, vaddr, size, riscv_cbom_block_size);
> 
> Do we really need this? ...

yes, this one line macro will make the code clear and simple. we
only need to handling the logic of ourself (replace cbo.clean with
cbo.flush) without caring about the underlying assemble and configs...

> 
>> +}
>> +
>> +static void picoheart_errata_cache_inv(phys_addr_t paddr, size_t size)
>> +{
>> +	void *vaddr = phys_to_virt(paddr);
>> +
>> +	ALT_CMO_OP(INVAL, vaddr, size, riscv_cbom_block_size);
>> +}
>> +
>> +static void picoheart_errata_cache_wback_inv(phys_addr_t paddr, size_t size)
>> +{
>> +	void *vaddr = phys_to_virt(paddr);
>> +
>> +	ALT_CMO_OP(FLUSH, vaddr, size, riscv_cbom_block_size);
>> +}
>> +
>> +struct riscv_nonstd_cache_ops picoheart_errata_cmo_ops = {
>> +	.wback = &picoheart_errata_cache_wback,
>> +	.inv = &picoheart_errata_cache_inv,
>> +	.wback_inv = &picoheart_errata_cache_wback_inv,
>> +};
>> +
>> +DEFINE_STATIC_KEY_FALSE(has_picoheart_cbo_clean_errata);
>> +
>> +static void picoheart_errata_probe_cbo_clean(unsigned int stage,
>> +					     unsigned long archid,
>> +					     unsigned long impid)
>> +{
>> +	if (!IS_ENABLED(CONFIG_ERRATA_PICOHEART_CBO_CLEAN))
>> +		return;
>> +
>> +	if (stage != RISCV_ALTERNATIVES_BOOT)
>> +		return;
>> +
>> +	if (!riscv_isa_extension_available(NULL, ZICBOM))
>> +		return;
> ... and this? Are there Picoheart CPUs with this specific archid or
> impid that *doesn't* support Zicbom? Or systems with firmware that
> doesn't enable Zicbom?

it's sanity to have this check as this errata is for Zicbom, in
case a certain version of firmware doesn't report Zicbom in any
unknown reasons.

thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
