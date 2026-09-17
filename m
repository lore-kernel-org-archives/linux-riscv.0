Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1EE2C982D2
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 17:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hSJKXH954ZFZQ2pMAh/qjlIy6RSCMT9cJdB03VPSzMo=; b=pAJdLvTfW0CAnR
	y5b7gEbrrJCwDSRgWiErIkgOCkprHeYZw5ibLyYyi2XKj6iR7si4owoxwPtJooqTPMn1ORn5dVDqy
	Aii2IOeWuw/EClURmq5+FETgWhUwEj+J609ip6ii60ZI11sVnemuzBA8CWQJg7j/0n0l1I6R3K0Zg
	ttC25MYplFN0AVUcDPQJKlJpKAzjUtnCCtWRH5rqp7HPKkzzghLNa7TMkLRVAkqwGdLuScBbA6dMS
	o92puG3j7eqBHVgsKop7FAnLoq5VMkHMTBdA1SaWw9iUuV7nURUNH8qFCWoKpTMRA4WcBAUjqPxAE
	TNjxJ3cXlMau2aBPfDBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FtY-0000000C5Kg-2phC;
	Thu, 17 Sep 2026 17:27:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FtX-0000000C5KM-0BtE;
	Thu, 17 Sep 2026 17:27:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 37F616022F;
	Thu, 17 Sep 2026 17:27:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6ACF1F00893;
	Thu, 17 Sep 2026 17:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789666052;
	bh=qMtpgJuTFFb3pSh+VD0JmC7P3/MrF5Y7JmPuGW1JHOg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IKcDKMZp+ekNzsJWMv6ovbqCcUdMVOZ6MpkZcYayhKvAzV/c9ClPKNnre38GDO1dP
	 VnUSB2NySbj0dzneUmt3pEDLT5bQcZzSnv2wWgRFQfbkywnOoydZxU0Fr3fXchDfM+
	 X2W63kMbGbKmAF4/O+OGA5Py1tGRoL8F3H9HK41uSJlirs05rf7OQz9kYeUuNQab31
	 /puM/JcNmprsid2hI9cqCt/rE31IWuwsMruvrzyf1LRUn6ltb6gw3/tiPWIJbxOlgq
	 ZYgG+gfi+WPmnkiu9l/cZnTZCInU5er2bu9blhiS1YcACr8Q+pi1Vz/rYoY+ZwTY9w
	 qdLoJ1G9LuZRg==
Date: Thu, 17 Sep 2026 10:27:32 -0700
From: Kees Cook <kees@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Alexey Gladkov <legion@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 02/20] kallsyms: index symbols by token to speed up
 table compression
Message-ID: <202609171019.5DD874E@keescook>
References: <20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org>
 <20260917-build-speedup-v3-2-9ecf4163ff36@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260917-build-speedup-v3-2-9ecf4163ff36@kernel.org>
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

On Thu, Sep 17, 2026 at 05:06:12PM +0100, Lorenzo Stoakes (ARM) wrote:
> diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
> index 494852ade6d8..350d118c3b9e 100644
> --- a/scripts/kallsyms.c
> +++ b/scripts/kallsyms.c
> @@ -58,12 +58,47 @@ static unsigned int table_size, table_cnt;
>  static int all_symbols;
>  static int pc_relative;
>  
> +/* A dynamic array of symbols, encoded by symbol index. */
> +struct sym_arr {
> +	unsigned int *sym_indexes;
> +	unsigned int cnt, cap;
> +};
> +
>  static int token_profit[0x10000];
> +static struct sym_arr token_syms[0x10000];

Nit: since you're refactoring too, can 0x10000 be a #define so it's not
open-coded 3 places? (find_best_token() uses the value too, though
arguably it should actually just use ARRAY_SIZE(token_profit) instead).

> [...]
> -static void compress_symbols(const unsigned char *str, int idx)
> +static void compress_symbols(const unsigned char *str, int compressed_chr)
>  {
> -	unsigned int i, len, size;
> +	const unsigned int token_idx = sym_token_index(str, 0);
> +	struct sym_arr *arr = &token_syms[token_idx];
> +	unsigned int sym_idx, j, len, size;
>  	unsigned char *p1, *p2;
>  
> -	for (i = 0; i < table_cnt; i++) {
> +	/* Iterate through all symbols this token is found in and compress. */
> +	for (j = 0; j < arr->cnt; j++) {
> +		sym_idx = arr->sym_indexes[j];
>  
> -		len = table[i]->len;
> -		p1 = table[i]->sym;
> +		len = table[sym_idx]->len;
> +		p1 = table[sym_idx]->sym;
>  
> -		/* find the token on the symbol */

Why drop this comment? It's a little redundant to "find_token", but I
always question comment _removal_ when it's not solving an inaccuracy.

> [...]
> @@ -536,11 +643,14 @@ static void compress_symbols(const unsigned char *str, int idx)
>  
>  		} while (p2);
>  
> -		table[i]->len = len;
> +		table[sym_idx]->len = len;
>  
> -		/* increase the counts for this symbol's new tokens */

Same question here: the comment is still valid?

Otherwise, looks good to me.

Reviewed-by: Kees Cook <kees@kernel.org>


-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
