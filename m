Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCFA0C982CC
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Sep 2026 03:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hEzLGsf4U8vs6mgY39q5RRtX4QEMA8Py/L6ofmGSkic=; b=2zRj6YxK89JIiQ
	YNRzJumkfD9hoPouP7cwvH47QsYBD1FHbRsusOyw+4tFHXzs0nQmxfjc9lsMQZEHxmamy5P0dWHQz
	6aScDlIDSXb8jSdmYVJn9RICmo3OilIXYQkejDgNILxKtzDfhyyEPyW4oPRJ1sNTjsqNlxRcgMzIu
	4kIqoOKXZYAOf04PDDVjK2x+iMoYrtF4dD+li5WPBvgZI1sD0CR+aVT9j/5iQdi9OMQAFfA3LO4D+
	DYj4RnTBBeZUpd9++GZ1QDtDMNWzjkA30OwdNvYI7ABF/CUICJA8/Vqwq9Mf5KC1rLnYH/Zc7srC7
	OWBHWa+S0/xGcyKRh4tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x88XT-0000000GpqH-2UE5;
	Sun, 20 Sep 2026 03:48:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x88XR-0000000Gpq2-3Rc1;
	Sun, 20 Sep 2026 03:48:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 00CF643A48;
	Sun, 20 Sep 2026 03:48:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA2AA1F00893;
	Sun, 20 Sep 2026 03:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789876104;
	bh=ybCr0oF8quCv/avwZgHBTOG1l69Dfvx6Rf/qRs6G0NM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YBC6aBoZFH8ZoVIjcCysvgKQWPCeAZnK7xSXqRi8+dyWiyNvuz6IjqFWVKI+gEzA3
	 oaMZt+GfiWWPwZO+L7WtXR6zTVPWm8J5aEQddxqJ9e8w9wdXf9cgyQkwYsShqX/3y3
	 N6q33sbNYcxGvAtrsYo3EEQ1xP8Sx7eo8YiTsMCwsBDDR8h5oUZoUzzWD7hn+yryq/
	 dmoy7MMUFxy9hhJgZ1IuBPQFuWfx1BGqdpXi0ELNTQT7jOC3pbUc6TgXZiNsFdvHgO
	 2IPsOuX8fnt1Lpf/zBLFIb5c3OeIqw4T36I3/T9Np3Fk0ATdmUGrQeHxMxPs1dTCJs
	 9OLkkJAmVBHTA==
Date: Sat, 19 Sep 2026 20:48:24 -0700
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
Message-ID: <202609192047.17BD9B1F@keescook>
References: <20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org>
 <20260917-build-speedup-v3-9-9ecf4163ff36@kernel.org>
 <202609171117.35BFDCC13@keescook>
 <aq6-KMkAx7q_xLO4@gremlin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aq6-KMkAx7q_xLO4@gremlin>
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

On Sat, Sep 19, 2026 at 05:57:36PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Thu, Sep 17, 2026 at 11:42:50AM -0700, Kees Cook wrote:
> > On Thu, Sep 17, 2026 at 05:06:19PM +0100, Lorenzo Stoakes (ARM) wrote:
> > > [...]
> > > +static bool next_line(const char **pos, const char *end, struct line *line)
> >
> > There is a lot of string handling in here. I know you're going for speed,
> > but it just feels like a python script doing all this would be much more
> > readable without wrecking speed compared to C much. Yes, C will win out,
> > but the maintainability of this helper does not fill me with joy. :P
> 
> Well I had the LLM look at that and for an allmodconfig python's startup time
> would take 40s of CPU time _alone_ and it'd kill the no op improvement. So C it
> has to be :)

Yikes, that's huge. C it is. ;)

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
