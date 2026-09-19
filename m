Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB19C982D7
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Sep 2026 17:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gNeaMoc/HCi87QbGmBIXXwCI08bKWPb61lpJSHLSSkk=; b=vw4nmjZ8TI86oK
	yxOk55t303hVst2/6UuvshlCNNHN6awf43tfwTmCyFwmFcqkDa110CunWQ/41d3+y9LSVcPKjTxDo
	SFhKvcb4QxB2zanrSKeZzPWRmEMUsCVfD/axpSRtKqsQT2ZMUvT4/oxgbFSxzs3CGFZ3L5CKN2MUg
	MswbsUJkezCVpSiYH0H2HchKwHs7SaVwCgXR04ZhOucg1MDR1LifPtEWhenhAaTUeXHILh+U0cFPN
	SnA6aH1hgjAqd9xk6S23h2o9JMtJVwZW0CPMws42RxmfVklE383RzDWgXLGw16czkScIV4zPHL5Dj
	pRbgVBe9L+/ZbrQw0KYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7z6l-0000000GYmK-0GmE;
	Sat, 19 Sep 2026 17:44:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7z6j-0000000GYmA-1XqH;
	Sat, 19 Sep 2026 17:44:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BB82F43F04;
	Sat, 19 Sep 2026 17:44:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A72A11F000FF;
	Sat, 19 Sep 2026 17:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789839852;
	bh=plN+c/BYldO0ndQ5BcS5qGCDo4Hxnvos4lynYvhEHTo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UyjIipdw0tt8GXYTTY85zRh5fU/oDzYyGbnpiDXd9mc0DxbAGXWMNiiFraMESgiUt
	 I3SeGIMBcWTmorAmEhrShRdjbTRy2V9HjHkTI37D1HrVNj/9uHppjSHx0X9TD9jmqt
	 a8Nlc8m16jqnatgXe4mxAcSNuRy9loWMrE41gywF2Pj12ABb4US7KQnBV5W74MhQME
	 7k46wJDeQnMlIoYaZYlgL40fc6u1R1aGw0yvB6NgLzDsGhVtrMrAN0ry8iTi+MhDnR
	 EIA4u46W2q6JXXRJDK4wqs7opyUEVzX9nxLDiU4cQoABSxoZ7Uks175IbBpTLFZAIf
	 t1gZFBEcSPIvQ==
Date: Sat, 19 Sep 2026 18:43:58 +0100
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
Subject: Re: [PATCH v3 20/20] kbuild: compress the kernel with pigz if
 available
Message-ID: <aq7Jp_mKucBsuXff@gremlin>
References: <20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org>
 <20260917-build-speedup-v3-20-9ecf4163ff36@kernel.org>
 <202609170955.C6EABD8C@keescook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202609170955.C6EABD8C@keescook>
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

On Thu, Sep 17, 2026 at 09:58:04AM -0700, Kees Cook wrote:
> On Thu, Sep 17, 2026 at 05:06:30PM +0100, Lorenzo Stoakes (ARM) wrote:
> > Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> > ---
> >  Documentation/kbuild/kbuild.rst   | 17 +++++++++++++++++
> >  Documentation/process/changes.rst |  8 ++++++++
> >  Makefile                          |  5 ++++-
> >  kernel/Makefile                   |  6 +++++-
> >  scripts/Makefile.lib              |  4 ++--
> >  scripts/jobserver-exec            |  3 ++-
> >  tools/lib/python/jobserver.py     | 13 +++++++++++++
> >  7 files changed, 51 insertions(+), 5 deletions(-)
>
> Awesome; I love it. (I may send a follow-up to improve the PARALLELISM

Thanks! :)

> token so things can define the fallback instead of the hard-coded "1",
> but there is only one place I found where that might be useful, and it
> will be totally separate from this.)

Ack, seems like it's open season on improving this stuff now which is good
I think!

I also believe there is more performance to be got in future series ;)

>
> Reviewed-by: Kees Cook <kees@kernel.org>

Thanks! :)

>
> --
> Kees Cook

--
Cheers, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
