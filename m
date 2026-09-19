Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A206C982D8
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Sep 2026 14:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c4YIvbmtzy+ry2p2gmer6BrI5XAAxSzlEwcyiULLdKA=; b=nKPI4kSsokkdZt
	LqToyqmxyKICiOvscxoWBhQ3AtsH6QZe68jQOap2I8xDGsYHZa4aJ4zjDekiaX1OVB/BaxRrHkt2n
	NmZg7GStmaIPLkvRIqk++Cy/ZVWWD8Vd0Mk9kCop6F+/KQHlXmgF+fpH3VIOoVFSyRynq0gOHxDsf
	oMDcIcs8+DdF4XIf4n3Dq8g0SHZ0uE09Kv7jcbe3jlxW1c74k8o6vKNKXiQt5Jnq769SF+rKoAvQs
	TAwqZuvQH+AMq+6LghEz6rSXADolZq5ABwLZnjos4/SLTdcN7xCnJqZuJYsuwfdcTbAClWhhDsGUG
	DVbWB7wUO0VedxxVjmbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7wMf-0000000GOxb-1KnA;
	Sat, 19 Sep 2026 14:48:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7wMd-0000000GOx7-2ZvG;
	Sat, 19 Sep 2026 14:48:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EAD0660AA4;
	Sat, 19 Sep 2026 14:48:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F34C71F000FF;
	Sat, 19 Sep 2026 14:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789829305;
	bh=o1ZQ7MH5wDXQsKPIVArWrFcpJvDeJlfsiVlJBRwpoXM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lm2k/vQkpX7W0rWLi5B6K5eTJR1tZUnSWZJ1Ng+jIx3YZF9kLqPaBrTmlJSsCX9nh
	 EuvRaBKJEEywI1N9lA1+7Ys7i3UdEigSw0oiv6tq1drO2Ro5ZD/N6xNN/PdGENyiry
	 OQze/hFxIhrCHYmcl3+sCa2wi/yoXq0DmLmIj16j+oHTE4uRFAk74RVtHyd4ldYTZf
	 IvdGdbPsJQiKDu0USoB8Ug/yRfNtvtJou/1NlysRZYAbRYTkXoHFZkW/B/7TV1HbsP
	 RKA2Vfq/eOWP6HnxXeDQnh98UFWvAUENLTjQPoGih+Xd6pZ8oFkDU/0ix1EBwESNRN
	 EJSaX1urbuaAw==
Date: Sat, 19 Sep 2026 15:48:11 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Nicolas Schier <n.schier@fritz.com>
Cc: Kees Cook <kees@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
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
Subject: Re: [PATCH v3 08/20] kbuild: cache list, composite object state per
 object
Message-ID: <aq6gjULjd5uP-AVA@gremlin>
References: <20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org>
 <20260917-build-speedup-v3-8-9ecf4163ff36@kernel.org>
 <202609171110.438BC7477A@keescook>
 <20260918-godlike-devious-perch-707bf6@l-nschier-aarch64>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260918-godlike-devious-perch-707bf6@l-nschier-aarch64>
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

On Fri, Sep 18, 2026 at 09:51:26PM +0200, Nicolas Schier wrote:
> On Thu, Sep 17, 2026 at 11:11:41AM -0700, Kees Cook wrote:
> > On Thu, Sep 17, 2026 at 05:06:18PM +0100, Lorenzo Stoakes (ARM) wrote:
> > > Fix the issue by caching this data and looking it up instead of getting it
> > > over and over again.
> >
> > Nit: I would describe this as "calculate these once". It _is_ caching,
> > but I think with Makefiles there is an implication the "caching" means
> > "write to disk". But maybe that's just me.

Ack!

>
> +1
>
> Reviewed-by: Nicolas Schier <n.schier@fritz.com>

And thanks! (also to Kees :)

>
> --
> Nicolas

--
Cheers, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
