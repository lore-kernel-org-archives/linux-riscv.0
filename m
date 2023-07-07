Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A18C001DF
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jul 2023 22:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TnQ8DQzou7JZVWjjKU423Tg1lCYEPLpvheeRKIvRYdQ=; b=Ru+SZwlsyp7RvB
	eEty0lsY5kfq/ARIk7QVsE8TU8WXcajU/kES5bclieu3u15ASe9gPBr2zCBeGa5r72f3Szqa+J2zC
	niFSaDh1P0+B3YNtGKNm62Nnf6+R+wQJYxGuL3AKkVvXqNlfhtynpwTqeYn1edJFSRissPo9thtcB
	BhnLDuRA2RV+Uf3JUt+QLN7VxlA31+dCFzFpXZ8YduuoJCDF8B7t9kgiNWTQus2TfbMTlPH7yoDE5
	Z0ppvw5g5PxsSdNZMBPRh5hvhv5WZBydRyaOa4nYwNouE6NK/iosv/1kRTl4rB9PT4a+STULK8Kpd
	W1Ay19PdrzRm1ow3sSYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHu8t-005qdl-2B;
	Fri, 07 Jul 2023 22:41:35 +0000
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qHu8r-005qd2-2p;
	Fri, 07 Jul 2023 22:41:33 +0000
Message-ID: <67dabd7d-5c3a-2016-a59a-4a0717e478dc@infradead.org>
Date: Fri, 7 Jul 2023 15:41:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] module: Ignore RISC-V mapping symbols too
Content-Language: en-US
To: Palmer Dabbelt <palmer@rivosinc.com>, mcgrof@kernel.org, thomas@t-8ch.de
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230707160051.2305-2-palmer@rivosinc.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230707160051.2305-2-palmer@rivosinc.com>
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



On 7/7/23 09:00, Palmer Dabbelt wrote:
> RISC-V has an extended form of mapping symbols that we use to encode
> the ISA when it changes in the middle of an ELF.  This trips up modpost
> as a build failure, I haven't yet verified it yet but I believe the
> kallsyms difference should result in stacks looking sane again.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Closes: https://lore.kernel.org/all/9d9e2902-5489-4bf0-d9cb-556c8e5d71c2@infradead.org/
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>


Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thanks.

> ---
> Changes since v1 <20230707054007.32591-1-palmer@rivosinc.com/>:
> 
> * Drop the unnecessary IS_RISCV define and just inline it.
> ---
>  include/linux/module_symbol.h | 12 +++++++++++-
>  kernel/module/kallsyms.c      |  2 +-
>  scripts/mod/modpost.c         |  2 +-
>  3 files changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/module_symbol.h b/include/linux/module_symbol.h
> index 7ace7ba30203..5b799942b243 100644
> --- a/include/linux/module_symbol.h
> +++ b/include/linux/module_symbol.h
> @@ -3,12 +3,22 @@
>  #define _LINUX_MODULE_SYMBOL_H
>  
>  /* This ignores the intensely annoying "mapping symbols" found in ELF files. */
> -static inline int is_mapping_symbol(const char *str)
> +static inline int is_mapping_symbol(const char *str, int is_riscv)
>  {
>  	if (str[0] == '.' && str[1] == 'L')
>  		return true;
>  	if (str[0] == 'L' && str[1] == '0')
>  		return true;
> +	/*
> +	 * RISC-V defines various special symbols that start with "$".  The
> +	 * mapping symbols, which exist to differentiate between incompatible
> +	 * instruction encodings when disassembling, show up all over the place
> +	 * and are generally not meant to be treated like other symbols.  So
> +	 * just ignore any of the special symbols.
> +	 */
> +	if (is_riscv)
> +		return str[0] == '$';
> +
>  	return str[0] == '$' &&
>  	       (str[1] == 'a' || str[1] == 'd' || str[1] == 't' || str[1] == 'x')
>  	       && (str[2] == '\0' || str[2] == '.');
> diff --git a/kernel/module/kallsyms.c b/kernel/module/kallsyms.c
> index ef73ae7c8909..78a1ffc399d9 100644
> --- a/kernel/module/kallsyms.c
> +++ b/kernel/module/kallsyms.c
> @@ -289,7 +289,7 @@ static const char *find_kallsyms_symbol(struct module *mod,
>  		 * and inserted at a whim.
>  		 */
>  		if (*kallsyms_symbol_name(kallsyms, i) == '\0' ||
> -		    is_mapping_symbol(kallsyms_symbol_name(kallsyms, i)))
> +		    is_mapping_symbol(kallsyms_symbol_name(kallsyms, i), IS_ENABLED(CONFIG_RISCV)))
>  			continue;
>  
>  		if (thisval <= addr && thisval > bestval) {
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index b29b29707f10..7c71429d6502 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1052,7 +1052,7 @@ static inline int is_valid_name(struct elf_info *elf, Elf_Sym *sym)
>  
>  	if (!name || !strlen(name))
>  		return 0;
> -	return !is_mapping_symbol(name);
> +	return !is_mapping_symbol(name, elf->hdr->e_machine == EM_RISCV);
>  }
>  
>  /* Look up the nearest symbol based on the section and the address */

-- 
~Randy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
