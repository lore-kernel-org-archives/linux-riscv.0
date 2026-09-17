Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81117C982D0
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 18:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B2l8R0Zv82GgYb4aMYHTtN517YtRnFrs8jUPxO3OPik=; b=obzdrN5t8XTv4N
	zFEVCReESNRI20TZET4tfYvGBMZ8TWNlCoPvOvtZnr8jEOXbHe0C6JyCuxgqtthA16+em1RUKOPbo
	5wEbWGcyNycFN05t3hNhVwXYJtm/8GVf2eSfWavWLs0doQDmPqUaJlecEWRsWofWNXzaPqzFfHZaR
	uk7l23U9xIVN3rxRWoQ7wyDt0YqnvqCuZGOUz6kAf8IYzAimV2/yyeRfeErHDOGFpEukG/Z+jXLS/
	7VXq2CDth1BctSOYbdMr5dYVh/EKWtmXMeDT6Mavu0QRz8Qnu9Na7/NY7PRnPO0gwfIYR91yFGIOk
	bA8LKvmr+GxePTddmr/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7H4O-0000000CGdE-3y8m;
	Thu, 17 Sep 2026 18:42:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7H4N-0000000CGd3-1auk;
	Thu, 17 Sep 2026 18:42:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C74F760209;
	Thu, 17 Sep 2026 18:42:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70B9F1F00899;
	Thu, 17 Sep 2026 18:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789670570;
	bh=G9OjC0DvXbYSXJMCvKYfaBrtdLJ3dmS1MuuNFWcE17Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JeRYA7rh2zFrLoDrvkT3tOXHVvhkH6bjWJLZn/UYBnyI/ZxTQuMpD4weCvEGIZTcG
	 owAKqMoYSujslwmt67lCRILKcm1QQujCJnXPf9/zFmbeLalGQAj9uGlImhcFU8hi4n
	 K5fVxPWxyFUEls6aBpw9ShMjMfl0WOH2r8XGMGht2rzxe0kiJEE6YuSbCY/NjwgLsw
	 VKkhwQcTAK+r8jPrWsADcjEs6fEvUkheY+IZbuY6sLFh7iES+AX9CDJ+9svfBn0z4N
	 LehTASVD2b0Yx5mbf1rARYwQS+8jA7iPbWlZbnr+Ck6iM4NNpf/iX7gAOh6RGVhvN2
	 0V/NpIFtEHFjw==
Date: Thu, 17 Sep 2026 11:42:50 -0700
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
Subject: Re: [PATCH v3 09/20] kbuild: implement and use depcheck to check
 dependency timestamps
Message-ID: <202609171117.35BFDCC13@keescook>
References: <20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org>
 <20260917-build-speedup-v3-9-9ecf4163ff36@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260917-build-speedup-v3-9-9ecf4163ff36@kernel.org>
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

On Thu, Sep 17, 2026 at 05:06:19PM +0100, Lorenzo Stoakes (ARM) wrote:
> This can be done faster in C, so implement scripts/basic/depcheck to do so.
> 
> It does as little work as possible, reading the .cmd files from a
> directory's targets and running stat on each dependency only a single time.

Doesn't this run the risk of missing transitive deps?

C.cmd:	C.o depends on A.c and B.c and B.h
B.cmd:	B.h depends on B.data and B.script

depcheck looks at C.o and B.h's times and is happy so it drops C.cmd file,
but then see B.script has changed compared to B.h, so it keeps B.cmd,
and then the build runs and doesn't have the C.o dep list any more,
and C.o goes unbuilt?

Also, I don't think this handles if_changed commands at all? The kbuild
rebuild condition is timestamps plus if_changed's command-line check.

> diff --git a/scripts/basic/depcheck.c b/scripts/basic/depcheck.c
> new file mode 100644
> index 000000000000..622101c33650
> --- /dev/null
> +++ b/scripts/basic/depcheck.c
> @@ -0,0 +1,441 @@
> [...]
> +/* What fixdep writes, see above. */
> +#define DEPS_PREFIX		"deps_"
> +#define DEPS_RULE_PREFIX	"$(" DEPS_PREFIX
> +#define RULE_SUFFIX		":"
> +#define LINE_CONTINUATION	" \\"
> +#define WILDCARD_OPEN		"$(wildcard "
> +#define WILDCARD_CLOSE		")"
> +#define CMD_SUFFIX		".cmd"
> [...]
> +static bool is_blank(char chr)
> [...]
> +static bool str_ends_with(const char *str, const char *suffix)
> [...]
> +static bool line_starts_with(const struct line *line, const char *prefix)
> [...]
> +static bool line_ends_with(const struct line *line, const char *suffix)
> [...]
> +static bool line_is_blank(const struct line *line)
> [...]
> +static bool line_is_continued(const struct line *line)
> [...]
> +static void line_strip_continuation(struct line *line)
> [...]
> +static void line_trim(struct line *line)
> [...]
> +static bool next_line(const char **pos, const char *end, struct line *line)

There is a lot of sting handling in here. I know you're going for speed,
but it just feels like a python script doing all this would be much more
readable without wrecking speed compared to C much. Yes, C will win out,
but the maintainability of this helper does not fill me with joy. :P

> [...]
> +static const struct dep *lookup_dep(const char *path)
> +{
> +	const unsigned int key = hash_str(path);
> +	struct dep *dep;
> +	struct stat st;
> +
> +	hash_for_each_possible(dep_table, dep, hnode, key) {
> +		if (!strcmp(dep->path, path))
> +			return dep;
> +	}
> +
> +	dep = xmalloc(sizeof(*dep) + strlen(path) + 1);
> +	strcpy(dep->path, path);
> +	dep->exists = !stat(path, &st);
> +	if (dep->exists)
> +		dep->mtime = st.st_mtim;

I realize you only check "mtime" after an "exists" check, but I bristle
at leaving a time-stamp uninitialized. Can we just add an "else
dep->mtime = 0" here?

-Kees

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
