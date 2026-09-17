Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D57C88E72
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 17:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w7Uo6w9rL3NCy57qsomtUdeRRJzKM4UwZmkhlpjaX4M=; b=z4WyXYdIYCYM8e
	KTl4VYhrFMzsdQfTV5qCoOfZVs+LnGvYu7T3HuZUXucUMNcfKGuA0wL9Z6rCthgAVj4BZWlhsq6kH
	CnzczU+jBXbj1gmMVyuvj+M9DCk+fWQJa0e6KJvrDy1b38CmeYudf4crZj6eWItPcUYfmC9ujGxF5
	UklEyP9qVGGD+lLQh1Mi2+89ZnOBDIX6JrmeFcLMEXP55aeLihNt2wGVFnv0rDZk+Wnx3EffB84a/
	CMEp6qXEvT9Nvi4wCuMOasbTeg4Pi/umfcq4t00Pkp6tGnbCAJMuNjG5qHi6A9tM5tJugMdxGoBEB
	zptzhG6aWartnrvLrNTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FUV-0000000C1ff-1rSK;
	Thu, 17 Sep 2026 17:01:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FUT-0000000C1ev-0qVG;
	Thu, 17 Sep 2026 17:01:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4EDD66020A;
	Thu, 17 Sep 2026 17:01:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9C7F1F000FF;
	Thu, 17 Sep 2026 17:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789664500;
	bh=cMuDnpqJUB2Uf77ZbSuAlr2PpXfKCDvn1QWiL0hTFpE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jjMFDSGyVlsre2OTckTLEm8iZBL2xUblNcOIL6hTWSU7fqk30T66IbsSK2lBLpw99
	 Li0P7WzjAKSSjpIhMssr2/0fCf0fePT4FXZNY5GuZ/FcFSms6av9+BT1r6C06UZ0B9
	 YyiYY8EBcVeOnXLjcd6vPNwWKdPZ7Ojf8w/cOCKB6I8RSa3RsWc+cc2xiueU4LSg6Y
	 mTS14dGRBrFfm6udeioEHK9A/Qe+EJHHb6efM8/5J03WRPVZuuozRUxr+mqbzw8IWB
	 vGGCU1Scz8EtSVp7LCMJD1RAOQFIbsQ3d9+6UsobnTpT5OVJDcELlyNi8o09hYdcU3
	 9Sr5bwOZ7smLA==
Date: Thu, 17 Sep 2026 10:01:39 -0700
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
Subject: Re: [PATCH v3 14/20] kbuild: batch module finalisation
Message-ID: <202609171000.CD7797EA3@keescook>
References: <20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org>
 <20260917-build-speedup-v3-14-9ecf4163ff36@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260917-build-speedup-v3-14-9ecf4163ff36@kernel.org>
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

On Thu, Sep 17, 2026 at 05:06:24PM +0100, Lorenzo Stoakes (ARM) wrote:
> With the .mod.S change in place, module finalisation on allmodconfig builds
> consists of a large number of very short-lived jobs.
> 
> For allmodconfig x86-64 this can be on the order of ~22,000 jobs of a few
> milliseconds in duration each.
> 
> Each job entails processing ~22k .cmd files, so the combination of heavy
> overhead and small individual job results in a lot of unnecessary and
> repeated work even with all cores being utilised.
> 
> The solution is to batch by a number of jobs. Determining which value makes
> sense was done empirically.
> 
> On a 128-thread threadripper box doing an allmodconfig build, best of
> 2, *.ko, *.mod.o deleted each time:
> 
>     modules per chunk    instances    wall
>     -----------------    ---------    ------
>                     1        11171    10.22s
>                     2         5586     6.72s
>                     4         2793     4.97s
>                     8         1397     4.26s
>                    16          699     4.05s
>                    32          350     4.05s
>                    64          175     4.07s
>                   128           88     4.05s
>                   256           44     4.03s
>                   512           22     4.18s
> 
> Wall time flattens for 16-256 module batches.
> 
> A slower/lower core machine will do better with fewer modules-per-batch, a
> faster/higher core machine will do better with more modules-per-batch.
> 
> Therefore, take the midpoint which works in the most margin in either
> direction - 128 modules per batch.

This is easy to tweak, so if we get negative feedback on this for
smaller machines, it's an easy fix.

> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
