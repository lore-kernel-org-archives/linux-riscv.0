Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E70E4C982D8
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Sep 2026 16:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qaR0OqG+kNbjpnvN38mE5sH5okD+cS0NHFcE8ZlI/9A=; b=ocnA+J1HFe8sup
	bAu6PKoar0FNaFXPETWxaMdIg7W+xY+ETFZsQr3lVAwSnoM1YORDCWJh5J/Q5B2P2E3fJrxMSxdhw
	mYjJrEpow+eRvBANKTARWSjpEboYkVmPQytJMcGqjbdq/r72+DuRlIOYzWrjx1SlIpLU5g8Gn+Dwd
	WZifxOhok484s6pFQpk2OwYVIeuCKxA2IQ4yZsZ4UKenBb66zxXC454b4ZO/Sh3z5qETZjRKnT1JL
	m2BlfR1chqjBodn4bRx6fDFwEiMDTR7lDqpfqUul5X93DAvIaqpbsUnT6F2b65zPQO30R8LVmSoOe
	ezhMlKJWpZrOi5dgs1TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7xtC-0000000GVXp-2xqZ;
	Sat, 19 Sep 2026 16:26:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7xtB-0000000GVXX-1gYV;
	Sat, 19 Sep 2026 16:26:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 96F2843522;
	Sat, 19 Sep 2026 16:26:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCFE91F000FF;
	Sat, 19 Sep 2026 16:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789835168;
	bh=eCbh8mfi6adhb6JroL0azQQMp93Leh+1Nif6bKAoa2k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YDVtxTFfI6xU/DPywHMbajyOUCDkZGlkv3d+iypqFADDMUIjfdHII98NSCshNfh5y
	 t4XJqUHrptMCUDegPcPxrhLflNnCCeBF224b9pF4ftNZoQhqqaYMzqv6oTpbynshL9
	 2vsg7ticySOLl+S/MejmLy9iUxDqGxRFsIRTtPlSr/TA8RmYNgSg0MuMYwGbznmr2h
	 qtOPLsQdiEu2cj26rIFitkPl3Sv8jSX2P5Xf/9vTJ4AA8YNW2joXFvMIE//WeMO3qG
	 dVjuWycXldhzpiv7SyMZsjadqF5HcMa3g4xU+WtG8sPtCzeaqVk5X7hMsDrcGwkCqO
	 JhggEWantwudQ==
Date: Sat, 19 Sep 2026 17:25:54 +0100
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
Subject: Re: [PATCH v3 07/20] kallsyms: reimplement mksysmap in C
Message-ID: <aq63cXS-Gl3LFgf9@gremlin>
References: <20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org>
 <20260917-build-speedup-v3-7-9ecf4163ff36@kernel.org>
 <202609171046.146CAE972B@keescook>
 <aq6zQng28spcTD88@gremlin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aq6zQng28spcTD88@gremlin>
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

On Sat, Sep 19, 2026 at 05:24:06PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Thu, Sep 17, 2026 at 11:07:31AM -0700, Kees Cook wrote:
> > On Thu, Sep 17, 2026 at 05:06:17PM +0100, Lorenzo Stoakes (ARM) wrote:
> >
> > These 2 functions kind of feel like they should live in elfparse instead?
>
> Ack, updated this and patch 4 to share code for v4!

Patch 6 even :)

--
Cheers, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
