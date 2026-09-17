Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A90C982D0
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 19:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vXH9wjvFT/A9fDyczK1+52XKm2pYxTYfrGFqmdLS5Kc=; b=QalOYg0PkOScoI
	6O2B6lNYR1lBP3RbUs1MQDIUfDEBpNusBYQHuFGwVpMIKP4DxHQYAy79z/5Z+93y5dijGg14yoMtT
	RSioIKP5vlbPtAl7/vjbM2BgMbu7iDTiuB7NzB4mLzYBsDwXRiEFzAtdMWYCmMu1H5MjfKbqdL9kK
	fMFggLQFr03/tfnJACU44tbYYSRFejZxc7CiLgTHnx2zACivR0Cunb90VWIDKAq7sfScwsCYtpCNz
	Gh2jkroj1r6vkDktOHEqumWbW14ZoYy2rrGyKBiOv7jbpzTpSyDwltBnV+fUWQymjAw2+qZ2b/X0Q
	2JGR2XLi1F1BSre3I7dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7I0U-0000000CM61-3vh0;
	Thu, 17 Sep 2026 19:42:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7I0T-0000000CM5g-0xus;
	Thu, 17 Sep 2026 19:42:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4C94B400BB;
	Thu, 17 Sep 2026 19:42:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E94031F000FF;
	Thu, 17 Sep 2026 19:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789674172;
	bh=PkRN80BoSYgUIdgeE3XHmHynLUQObuBpZsM5VGJ/hZ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QEAswLsJV5CT5idl2b0sxECKt4RBnyFOYUhJeV8VSDp7LPI5q2uG0MitNu8vlrrGj
	 GgP3f04l+0g2WO7Dw5awGdDXIeJH1+hlD5eteCdUqsYsZsKEHJot2zsQGiqsRqy8QV
	 SXyJCnsalvj1JC+2CD4Ia7CbcDMentUQTCRQPyjilTKQXjJF/n1wcyHIpueWwqegca
	 iexi0eQKo1IVM6WiNYXwgSA66Y8LNUF1DQzWeuBGNKtPcG+iwHiFB2sW9lhh+LTGNT
	 i3DhH67X4z6x+NB5d58jYolAijG3u4bGwKbJBQaaayCSIrgwL4431CwUsDA/CZgmNo
	 sabJIf79IKUwQ==
Date: Thu, 17 Sep 2026 20:42:36 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
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
	Randy Dunlap <rdunlap@infradead.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 00/20] kbuild: significantly speed up kernel builds
Message-ID: <aqxCNyxYRzN2Oher@gremlin>
References: <20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org>
 <CAHk-=wjwtJQPW+MRAkQCcSGA1EZWehxBTUiEUUhdACCNHSKvTQ@mail.gmail.com>
 <aqwkk7FcQ0XWeqJW@gremlin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aqwkk7FcQ0XWeqJW@gremlin>
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

On Thu, Sep 17, 2026 at 06:36:18PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Thu, Sep 17, 2026 at 10:15:26AM -0700, Linus Torvalds wrote:
> > On Thu, 17 Sept 2026 at 09:06, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
> > >
> > >                 == defconfig FULL build ==
> > >
> > >                         before    after     delta
> > >                       ----------------------------------
> > > Threadripper, gcc        32.5s    26.3s     -6.1s (-19%)
> > > Threadripper, clang      34.5s    27.2s     -7.3s (-21%)
> > > EPYC, gcc                28.7s    20.6s     -8.1s (-28%)
> > > EPYC, clang              39.8s    32.2s     -7.6s (-19%)
> > > M2, gcc                 519.3s   512.4s     -6.9s (-1%)
> > > M2, clang               634.5s   569.4s    -65.1s (-10%)
> >
> > There's something odd going on with that M2 gcc build. Why is it such
> > an odd duck?
>
> Ugh dear lord I think the LLM somehow corrupted the numbers... Let me
> re-run those myself locally and come back with the actual times!

OK numbers are in:

M2, gcc			564.7s   512.1s    -52.6s (-9%)
M2, clang		615.1s   564.1s    -51.0s (-8%)

From the v1:

M2, gcc                 564.0s   512.4s    -51.6s (-9%)
M2, clang               616.1s   569.4s    -46.7s (-8%)

(Tested as per the cover letter pre-reqs, i.e. applying dependent series
first etc.)

Not sure on the -5s delta on the clang build :) that might have been me
being more disciplined this time to not use the laptop at the same time.

But broadly in line with the original numbers.

>
> >
> >              Linus
>
> --
> Cheers, Lorenzo

--
Cheers, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
