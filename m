Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 974C0EB64D9
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jul 2023 06:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wcXxXaAzKSHtse26iK//r51iPMxwLGbckKaBfAwt+pM=; b=cczmBGuXv/xzt7
	3YgU8HVb3AWq/TGLLksYXvBLRY/l50xSYcwiMTOxcja5NgZNrcUamqJkV9C0MOFmxj1+BRMtp4Mr1
	kW9S7rW1AbrTbsPxiJuHSLcvda2XVitZOwLxdwvie3hVNT2a6cE5WdkaLCuO3J4vUgvmKvaTSi1Ep
	ptS4dNhN1kn4tSdwXWD6z+CYxTI/15FD/FV/eZVxKbR3GLHd8bFXjt9yYNg84ylZIQNSdHL/D3a15
	5hi30ZoX79nvNbxpgJmXfMeVeJKNS+TaIrP0WpcXq5LexGcNveS9RYvOLqT/X8dOnRaFS73jZOM1H
	/cExk+l1KmpADD/vUZTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHec1-003i9l-0s;
	Fri, 07 Jul 2023 06:06:37 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHebx-003i6P-1b
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jul 2023 06:06:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1688709980; bh=aqrod6vM4sEPjl4JBQgL6DNpjvHEpvtdJNSsM28V3nw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iPzdB3qUPiU/rHl7MGbdtvaOHGUzJctTZIh6MlOFqoacFVfGVpxb71/CEfHKyFipa
	 dn+DEl005a5kV9Hs/PUHwpTTRSoldnMsSKGjD4DNGX0j9J6we/OwXWQrCnjidmVplk
	 mop6sYaHxRW/6ARPuUWjPHMEy224tDy1cv9mXE8g=
Date: Fri, 7 Jul 2023 08:06:19 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: mcgrof@kernel.org, rdunlap@infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] module: Ignore RISC-V mapping symbols too
Message-ID: <3e905882-7f96-4fc0-aecf-6054ed00372e@t-8ch.de>
References: <20230707054007.32591-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230707054007.32591-1-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_230633_709297_68CD036C 
X-CRM114-Status: GOOD (  12.12  )
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

On 2023-07-06 22:40:01-0700, Palmer Dabbelt wrote:
> RISC-V has an extended form of mapping symbols that we use to encode
> the ISA when it changes in the middle of an ELF.  This trips up modpost
> as a build failure, I haven't yet verified it yet but I believe the
> kallsyms difference should result in stacks looking sane again.

> [..]

> diff --git a/kernel/module/kallsyms.c b/kernel/module/kallsyms.c
> index ef73ae7c8909..1e988e542c5d 100644
> --- a/kernel/module/kallsyms.c
> +++ b/kernel/module/kallsyms.c
> @@ -12,6 +12,12 @@
>  #include <linux/bsearch.h>
>  #include "internal.h"
>  
> +#ifdef CONFIG_RISCV
> +#define IS_RISCV 1
> +#else
> +#define IS_RISCV 0
> +#endif
> +
>  /* Lookup exported symbol in given range of kernel_symbols */
>  static const struct kernel_symbol *lookup_exported_symbol(const char *name,
>  							  const struct kernel_symbol *start,
> @@ -289,7 +295,7 @@ static const char *find_kallsyms_symbol(struct module *mod,
>  		 * and inserted at a whim.
>  		 */
>  		if (*kallsyms_symbol_name(kallsyms, i) == '\0' ||
> -		    is_mapping_symbol(kallsyms_symbol_name(kallsyms, i)))
> +		    is_mapping_symbol(kallsyms_symbol_name(kallsyms, i), IS_RISCV))

IS_BUILTIN(CONFIG_RISCV) or IS_ENABLED(CONFIG_RISCV) ?

>  			continue;
>  
>  		if (thisval <= addr && thisval > bestval) {

> [..]

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
