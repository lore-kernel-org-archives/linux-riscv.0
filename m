Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E8AC88E6F
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 18:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1hFTmDtatwZc/qEmGGG5mAVl5dYvofpnc/zEQ+784kw=; b=nm7yctm13QNtk9
	f7/scUz3ZJ4pveZhoh+QbXBdeO49Uk1pQbEnXoM1sFynSu0gliAbQ7IzKWPvzHvlj9oOOgFvBLzss
	vDRAf/q0tLCa8z/E2c29u/IWK0774hnrZYhOXK7dgXcL8alAD8pwNb7J57+RbVN3h7yQMOXBU/Zxz
	SaxtfK1oX09AsZEV5TC2ULR/FNH65kS8NiGxVHsiDG/E6rxuZXaLcVUtv8VX8mTW7hn5JeL589VIC
	0fyXRzZh2mk9X8XaQwF6MK4QahdiF9Mn3iu4dUu07MKCpBkYPvZQijuRJSi1K1hlgTIsTJtjWgUWV
	kOxSpR3K8rV3ZBBbsOUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Ayl-00000004Q0v-17E3;
	Mon, 14 Sep 2026 18:00:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Ayj-00000004Q0V-1ah9;
	Mon, 14 Sep 2026 18:00:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 128CF60142;
	Mon, 14 Sep 2026 18:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0B891F00893;
	Mon, 14 Sep 2026 18:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789408827;
	bh=NXbbt1iUoauMs+fLO9RzZKe19lkdH+Cr594Dnv6SVKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ODZLqWaYMLu9jeAppJFzYzDYbmDcJaGKcKFa9maRrc6IVgd+L6cfnoF+W8eb4TyYP
	 VBuHxSYqLE0IKj4JLNPRHFMrajD3oqPR0Hli5WItdUw2yzXh5Fs1Z4z4Pk7XJ9ltAI
	 lK9ar1JcXgrjYpleMvYP9gD/0aeoVIW9MHRWXi6H63l0hudVVU0iyu3NXARJ9wAmpg
	 Ta47EUvAsb1kOr/kor+xnCOr7kifair0OdB5MBceq0djdxtfuvb8ncAwhxJHq7rgYO
	 0kgGIOgELBX9Z2bS9EIKYMvoB7j/ksCVXBCRHVF9/hI3IZndRa3knP+m3HefHNC/k0
	 1UIcN90vCw8zQ==
Date: Mon, 14 Sep 2026 11:00:27 -0700
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
Subject: Re: [PATCH v2 14/21] kbuild: batch module finalisation
Message-ID: <202609141056.6AE2C82E@keescook>
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <20260914-build-speedup-v2-14-39817ec5db23@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260914-build-speedup-v2-14-39817ec5db23@kernel.org>
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

On Mon, Sep 14, 2026 at 10:22:13AM +0100, Lorenzo Stoakes (ARM) wrote:
> Module finalisation on allmodconfig builds consists of a large number of
> very short-lived jobs, and the make job dispatcher cannot possibly dispatch
> jobs fast enough.

This "cannot possibly" sounds like a weird LLM language intensifier. I'd
rather a concrete description of the problem, not this kind of
(redundant?) vagueness.

> [...]
> Fix this by splitting modules.order into chunks of 128 at a time, run in
> parallel.

Why "128"? This seems tied to the 128-thread test machine, but ends up
getting hard-coded, but this choice of value needs some rationale, IMO.

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
