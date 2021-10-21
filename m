Return-Path: <SRS0=XH8j=PJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A53F9C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 11:43:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F58C610CB
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 11:43:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5F58C610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e83RfXkThtEAQmMzyfmATI6b/Gkx7EGm7QEmBgHB6nI=; b=l00xeZ0c3MblMD
	4XPtU1PKD/fEPbV+JOVeVh3roZJpgu0d1No7Ru7PupvsHeAtzH7zi95vf5Xq/dcSQ8LTC/nwChl1c
	pL5lY7CEJbg3SKUp3t5iEI/gVmt9wFLvuASkLISOBV+V3M7zWe3yL7rnrgOw2rVwjUNh/1CEej19v
	AGe9mVprmtp4Yu5BDdCMEddd6k5wn5aV3A6L7ICiFYAEIsVeEVjvhWf4gK2B4ZSxUVgY812OuHVJS
	RRnzaCHzKvKN7FBCFjuZoeFwhjaUJijq8qHoDRWWLWYKxm4rR0V9NQ8ZL3dspqXvtIX5K1mqU1zjM
	llYEg0u84XYqzfaa6xJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdWTJ-007NFM-KL; Thu, 21 Oct 2021 11:42:57 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdWTG-007NEd-IN
 for linux-riscv@lists.infradead.org; Thu, 21 Oct 2021 11:42:56 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HZlt60JQCzWlZk;
 Thu, 21 Oct 2021 19:41:02 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Thu, 21 Oct 2021 19:42:50 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.15; Thu, 21 Oct 2021 19:42:49 +0800
Message-ID: <352c54e1-b164-38d9-43fb-dbc28ab38ac7@huawei.com>
Date: Thu, 21 Oct 2021 19:42:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 2/2] riscv: switch to relative exception tables
Content-Language: en-US
To: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek
 <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>
References: <20211020220529.54ccf4e9@xhacker> <20211020220700.04bcdeca@xhacker>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <20211020220700.04bcdeca@xhacker>
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggeme709-chm.china.huawei.com (10.1.199.105) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_044254_988458_491342FD 
X-CRM114-Status: GOOD (  17.48  )
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



On 2021/10/20 22:07, Jisheng Zhang wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
> 
> Similar as other architectures such as arm64, x86 and so on, use
> offsets relative to the exception table entry values rather than
> absolute addresses for both the exception locationand the fixup.
> 
> However, RISCV label difference will actually produce two relocations,
> a pair of R_RISCV_ADD32 and R_RISCV_SUB32. Take below simple code for
> example:
> 
> $ cat test.S
> .section .text
> 1:
>          nop
> .section __ex_table,"a"
>          .balign 4
>          .long (1b - .)
> .previous
> 
> $ riscv64-linux-gnu-gcc -c test.S
> $ riscv64-linux-gnu-readelf -r test.o
> Relocation section '.rela__ex_table' at offset 0x100 contains 2 entries:
>    Offset          Info           Type           Sym. Value    Sym. Name + Addend
> 000000000000  000600000023 R_RISCV_ADD32     0000000000000000 .L1^B1 + 0
> 000000000000  000500000027 R_RISCV_SUB32     0000000000000000 .L0  + 0
> 
> The modpost will complain the R_RISCV_SUB32 relocation, so we need to
> patch modpost.c to skip this relocation for .rela__ex_table section.
> 
> After this patch, the __ex_table section size of defconfig vmlinux is
> reduced from 7072 Bytes to 3536 Bytes.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---



...
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index cb8ab7d91d30..0aa14b5bd124 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1830,6 +1830,27 @@ static int addend_mips_rel(struct elf_info *elf, Elf_Shdr *sechdr, Elf_Rela *r)
>   	return 0;
>   }
>   
> +#ifndef EM_RISCV
> +#define EM_RISCV		243
> +#endif
> +
> +#ifndef R_RISCV_SUB32
> +#define R_RISCV_SUB32		39
> +#endif
> +
> +static int addend_riscv_rela(struct elf_info *elf, Elf_Shdr *sechdr, Elf_Rela *r)
> +{
> +	unsigned int r_typ = ELF_R_TYPE(r->r_info);
> +	const char *fromsec;
> +
> +	fromsec = sech_name(elf, sechdr);
> +	fromsec += strlen(".rela");
> +
> +	if (!strcmp("__ex_table", fromsec) && r_typ == R_RISCV_SUB32)
> +		return 1;	/* skip this */
> +	return 0;
> +}
> +
>   static void section_rela(const char *modname, struct elf_info *elf,
>   			 Elf_Shdr *sechdr)
>   {
> @@ -1866,6 +1887,12 @@ static void section_rela(const char *modname, struct elf_info *elf,
>   		r_sym = ELF_R_SYM(r.r_info);
>   #endif
>   		r.r_addend = TO_NATIVE(rela->r_addend);
> +		switch (elf->hdr->e_machine) {
> +		case EM_RISCV:
> +			if (addend_riscv_rela(elf, sechdr, &r))
directly use
if (!strcmp("__ex_table", fromsec) && ELF_R_TYPE(r.r_info) == R_RISCV_SUB32)

> +				continue;
> +			break;
> +		}
>   		sym = elf->symtab_start + r_sym;
>   		/* Skip special sections */
>   		if (is_shndx_special(sym->st_shndx))
> diff --git a/scripts/sorttable.c b/scripts/sorttable.c
> index 6ee4fa882919..39e86e4acea3 100644
> --- a/scripts/sorttable.c
> +++ b/scripts/sorttable.c
> @@ -346,6 +346,7 @@ static int do_file(char const *const fname, void *addr)
>   	case EM_PARISC:
>   	case EM_PPC:
>   	case EM_PPC64:
> +	case EM_RISCV:
>   		custom_sort = sort_relative_table;
>   		break;
>   	case EM_ARCOMPACT:
> @@ -353,7 +354,6 @@ static int do_file(char const *const fname, void *addr)
>   	case EM_ARM:
>   	case EM_MICROBLAZE:
>   	case EM_MIPS:
> -	case EM_RISCV:
>   	case EM_XTENSA:
>   		break;
>   	default:
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
