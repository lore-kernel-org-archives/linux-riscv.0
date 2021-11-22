Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B41EEC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Nov 2021 12:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qh5HzpqvQlLL+hLUVWpsmUNjmepNI8e3jo04zn8MZ5s=; b=F0wuaROPvRL59HC+/jaVdPlFME
	Hl3dzbBV2Zjevc82YhorWt+SxQwvdr8LDaFiGdi/OsB2NX4OJm6gLGsiCk5QRd/zhkoQ7xh8lBspJ
	wU7MKP52aJfCB1pgUj365wZDUb0s99aw5Wht3Un86F0dF1zGKnucGY+5Be1EYa6w0E8TSezsuz2HH
	PIpJg7/E0uhCleE2LrO4w46DrfE1goxXvW9MwKFb5GevJ2CFeqHwCQ8mXt9gOQO2xZ0EiEqv0IOef
	oVqWbNL2KYO/xATQGlc+oNokE3BbFJyDnwC9tfz2zCZYRE+RnIdyYbam/efWFZUylNsLa2VpeN3gY
	hdiANhCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mp8OS-00GL8f-7U; Mon, 22 Nov 2021 12:25:56 +0000
Received: from imap2.colo.codethink.co.uk ([78.40.148.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mp8DI-00GHs2-M7
 for linux-riscv@lists.infradead.org; Mon, 22 Nov 2021 12:14:26 +0000
Received: from [167.98.27.226] (helo=[10.35.5.170])
 by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1mp8D8-0000j2-42; Mon, 22 Nov 2021 12:14:14 +0000
Subject: Re: [RFC PATCH 1/3] riscv: Correctly print supported extensions
To: Tsukasa OI <research_trasio@irq.a4lg.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org
References: <2d536b65-e6fd-873f-ed34-4aab7cca4771@irq.a4lg.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <49ec8592-a91f-27e9-03ad-2f0a37ad879e@codethink.co.uk>
Date: Mon, 22 Nov 2021 12:14:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <2d536b65-e6fd-873f-ed34-4aab7cca4771@irq.a4lg.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_041424_781204_25F9351D 
X-CRM114-Status: GOOD (  20.26  )
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

On 20/11/2021 08:53, Tsukasa OI wrote:
> This commit replaces BITS_PER_LONG with magic number 26.
> 
> Current ISA pretty-printing code expects extension 'a' (bit 0) through
> 'z' (bit 25).  Although bit 26 and higher is not currently used (thus never
> cause an issue in practice), it will be an annoying problem if we start to
> use those in the future.
> 
> This commit disables printing high bits for now.
> 
> Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
> ---
>   arch/riscv/kernel/cpufeature.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index d959d207a40d..6f2bf6ae4ae2 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -63,7 +63,7 @@ void __init riscv_fill_hwcap(void)
>   {
>   	struct device_node *node;
>   	const char *isa;
> -	char print_str[BITS_PER_LONG + 1];
> +	char print_str[26 + 1];
>   	size_t i, j, isa_len;
>   	static unsigned long isa2hwcap[256] = {0};
>   
> @@ -133,13 +133,13 @@ void __init riscv_fill_hwcap(void)
>   	}
>   
>   	memset(print_str, 0, sizeof(print_str));
> -	for (i = 0, j = 0; i < BITS_PER_LONG; i++)
> +	for (i = 0, j = 0; i < 26; i++)
>   		if (riscv_isa[0] & BIT_MASK(i))
>   			print_str[j++] = (char)('a' + i);
>   	pr_info("riscv: ISA extensions %s\n", print_str);
>   
>   	memset(print_str, 0, sizeof(print_str));
> -	for (i = 0, j = 0; i < BITS_PER_LONG; i++)
> +	for (i = 0, j = 0; i < 26; i++)
>   		if (elf_hwcap & BIT_MASK(i))
>   			print_str[j++] = (char)('a' + i);
>   	pr_info("riscv: ELF capabilities %s\n", print_str);
> 

Maybe add a warn on if there are bits set between 26 and BITS_PER_LONG ?



-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
