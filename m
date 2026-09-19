Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4688EC982D8
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Sep 2026 16:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k223o9iOJMDwV0mc0B9thjOa6PU1sYms4Yuf0mhLXUo=; b=natMHiSxTqxVU9
	xYJ9Qycisjm6Zzq/GYChXODEoKOEBbhTIyptOZM3Sz8R8zMX3Ck0GbHMrzseu974k2Es94vtahc4b
	jb5gy/KJdfrC/pX5not5IHryjyeFAvIkEmA2rDgG6gXormK9aj/VCS658DV2MKfSphNXQwsvgnDWy
	AbsmaoR2qPWgePmYgFlbxkM/ahfirDN+F6ER59B4Znx90BgHdw6OXoQvPQ6xJsWp7f2qmrdYkqN5E
	iZb4v5Dc2+cmMOs17/04qgUJCsGSg1REoOGlTz019TryCIkqh8g6bA2DqLmSuTuS0sZ8WIZ5f6qzu
	Q5UdLVNXLvwcjQ1eahNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7yNu-0000000GXGq-1OcD;
	Sat, 19 Sep 2026 16:57:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7yNs-0000000GXGc-0K6T;
	Sat, 19 Sep 2026 16:57:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E2516601FB;
	Sat, 19 Sep 2026 16:57:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA83C1F000FF;
	Sat, 19 Sep 2026 16:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789837070;
	bh=KM2tgM0uGCVk8XtquigocG7Ha/ITFid2M5zaQUDm4hQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ib+jARSJmLUOsDlTIv6OHj4xq4E/O4XHgfSasYMyRp+ithI4n9jSi9LfO7VSVfVzq
	 fAEwEVs6MPaOZa0p6cJPeyyCIQs3Ltp4Ib1xghu0J0zwWP/aDQfem9610HBBpogQ19
	 9pAze5bqN3TKajzH/HiMyUzWsJKDwmpJHciJzkoWJ5XB+KrR+SATdwTFbhKQGzHDz7
	 gEVt5gieTXgYhfd1fhpInIP5tVos/meaA3Ie61J31lGNHoa23r5N6Xa1cYy9EU4k15
	 +EWis+F9CWyyXLXiHQ9NLpyLfNxa1acVucTWZR2ydIsoeVu0JVzUIAwfvwiJz+lJoT
	 LFgHHDsyIyt8Q==
Date: Sat, 19 Sep 2026 17:57:36 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Alexey Gladkov <legion@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, Jonathan Corbet <corbet@lwn.net>, 
	Randy Dunlap <rdunlap@infradead.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 09/20] kbuild: implement and use depcheck to check
 dependency timestamps
Message-ID: <aq6-KMkAx7q_xLO4@gremlin>
References: <20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org>
 <20260917-build-speedup-v3-9-9ecf4163ff36@kernel.org>
 <202609171117.35BFDCC13@keescook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202609171117.35BFDCC13@keescook>
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

On Thu, Sep 17, 2026 at 11:42:50AM -0700, Kees Cook wrote:
> On Thu, Sep 17, 2026 at 05:06:19PM +0100, Lorenzo Stoakes (ARM) wrote:
> > This can be done faster in C, so implement scripts/basic/depcheck to do so.
> >
> > It does as little work as possible, reading the .cmd files from a
> > directory's targets and running stat on each dependency only a single time.
>
> Doesn't this run the risk of missing transitive deps?
>
> C.cmd:	C.o depends on A.c and B.c and B.h
> B.cmd:	B.h depends on B.data and B.script
>
> depcheck looks at C.o and B.h's times and is happy so it drops C.cmd file,
> but then see B.script has changed compared to B.h, so it keeps B.cmd,
> and then the build runs and doesn't have the C.o dep list any more,
> and C.o goes unbuilt?

No, B.h's .cmd file is still in the fragment with the full dependency list, so
make remakes B.h from B.script and C.o's saved command line is there too.

But, as you mention in the follow up :), it screws up on next bit - C.o
depending on B.h with B.h just remade. Will reply to your follow-up on that!

>
> Also, I don't think this handles if_changed commands at all? The kbuild
> rebuild condition is timestamps plus if_changed's command-line check.

It does, the fragment always has the saved command line, only the dependency
list is dropped, so if_changed compares the same as before.

>
> > diff --git a/scripts/basic/depcheck.c b/scripts/basic/depcheck.c
> > new file mode 100644
> > index 000000000000..622101c33650
> > --- /dev/null
> > +++ b/scripts/basic/depcheck.c
> > @@ -0,0 +1,441 @@
> > [...]
> > +/* What fixdep writes, see above. */
> > +#define DEPS_PREFIX		"deps_"
> > +#define DEPS_RULE_PREFIX	"$(" DEPS_PREFIX
> > +#define RULE_SUFFIX		":"
> > +#define LINE_CONTINUATION	" \\"
> > +#define WILDCARD_OPEN		"$(wildcard "
> > +#define WILDCARD_CLOSE		")"
> > +#define CMD_SUFFIX		".cmd"
> > [...]
> > +static bool is_blank(char chr)
> > [...]
> > +static bool str_ends_with(const char *str, const char *suffix)
> > [...]
> > +static bool line_starts_with(const struct line *line, const char *prefix)
> > [...]
> > +static bool line_ends_with(const struct line *line, const char *suffix)
> > [...]
> > +static bool line_is_blank(const struct line *line)
> > [...]
> > +static bool line_is_continued(const struct line *line)
> > [...]
> > +static void line_strip_continuation(struct line *line)
> > [...]
> > +static void line_trim(struct line *line)
> > [...]
> > +static bool next_line(const char **pos, const char *end, struct line *line)
>
> There is a lot of sting handling in here. I know you're going for speed,
> but it just feels like a python script doing all this would be much more
> readable without wrecking speed compared to C much. Yes, C will win out,
> but the maintainability of this helper does not fill me with joy. :P

Well I had the LLM look at that and for an allmodconfig python's startup time
would take 40s of CPU time _alone_ and it'd kill the no op improvement. So C it
has to be :)

>
> > [...]
> > +static const struct dep *lookup_dep(const char *path)
> > +{
> > +	const unsigned int key = hash_str(path);
> > +	struct dep *dep;
> > +	struct stat st;
> > +
> > +	hash_for_each_possible(dep_table, dep, hnode, key) {
> > +		if (!strcmp(dep->path, path))
> > +			return dep;
> > +	}
> > +
> > +	dep = xmalloc(sizeof(*dep) + strlen(path) + 1);
> > +	strcpy(dep->path, path);
> > +	dep->exists = !stat(path, &st);
> > +	if (dep->exists)
> > +		dep->mtime = st.st_mtim;
>
> I realize you only check "mtime" after an "exists" check, but I bristle
> at leaving a time-stamp uninitialized. Can we just add an "else
> dep->mtime = 0" here?

Ack, done for v4!

>
> -Kees
>
> --
> Kees Cook

--
Cheers, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
