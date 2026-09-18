Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A8DAC982DF
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 19:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fPO8HC8rGBQX/BI0fAbobNXlaydHlLqE1fFaZS4Z8ME=; b=VgwNkVTpeQ1dj9
	vO15BOLezo1eBMBMByLWvLDKN0cbqk6qLWAe2PbqVxI7sTa6nK0Ix8Q/iY589PblXoe2VyqA4r3ZN
	cTBafOl/jptH8E7VizjwjFh2ze3fwU9KV4ZQCeAtFTESDSJsg5KOygPNxllvdRbmplVH1snEZjQXv
	PtrJtRxCIRenscM3AAM4nLKjUmpHIKOwX2jZCFb8j5IwK0J1w1b01oItQsu34q4NrKVGS/wAYRgDi
	JpHo2itjrMRbtxz5L+cBDlonwntpvIC3Zu/Q+JGNCdfN2z+V6LgXk82nMu1xnnRPYTl2OAdQ2OQbi
	zl1jLlKzeJzer3U5JiCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7efL-0000000FSPs-0ucJ;
	Fri, 18 Sep 2026 19:54:35 +0000
Received: from mail.avm.de ([212.42.244.94])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7efH-0000000FSP0-3wOA;
	Fri, 18 Sep 2026 19:54:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fritz.com; s=mail;
	t=1789761269; bh=JKkgIua3kpizh32NNqU1zVU4J9KvaFpPPrVmLN48emc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y3Haz+T+fPTF6wAuhVZOXAxXZs67ULnV0g8BUG/DktxFVFrFAEr9eqX03SQrnV+vT
	 YZueGMLvfoe2AYpfP6aT9j2htVca0pIvRKlNddMMoHijDk+es3NOe66e0B/y/xSUpL
	 /ilOPtZp6TpJDHcJ8o5kk36gU04zB8RfdXt/gLj8a75Ty00NmsGG52Y/fUwxxpHzAI
	 /y2MRARUAhBeHzAHGfdXPJAklS2kpSf0phtNA0dGkDpFupKcxzbmLraYa7mL+oS91w
	 GvwQapwwZ1bNu6Kl1f6DPnr1MEwIZIclBDxMRjA/cxhzUAML+Cqv/JshxhDN/h/s9T
	 KtJb3aIuDhn8w==
Received: from [212.42.244.78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.57.1)
	(envelope-from <n.schier@fritz.com>)
	id 6aad96f4-03cd-7f0000032729-7f000001ad04-1
	for <multiple-recipients>; Fri, 18 Sep 2026 21:54:28 +0200
Received: from mail-auth.fritz.com (unknown [212.42.244.78])
	by mail.avm.de (Postfix) with ESMTPS;
	Fri, 18 Sep 2026 21:54:28 +0200 (CEST)
Date: Fri, 18 Sep 2026 21:54:27 +0200
From: Nicolas Schier <n.schier@fritz.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
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
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 10/20] kbuild: move the toolchain checks into
 init/Kconfig.toolchain
Message-ID: <20260918-athletic-agile-echidna-114f16@l-nschier-aarch64>
References: <20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org>
 <20260917-build-speedup-v3-10-9ecf4163ff36@kernel.org>
 <202609171149.6454DC6@keescook>
 <20260918010729.GB1585590@ax162>
 <aq1MG8I1BsUUDFkx@gremlin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aq1MG8I1BsUUDFkx@gremlin>
Organization: FRITZ! Technology GmbH
x-ms-reactions: disallow
X-purgate-ID: 149429::1789761268-177ACEE1-09F10706/0/0
X-purgate-type: clean
X-purgate-size: 2499
X-Notice: Whitelisted
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-pfmilter: host: postfix-mx-03  mail-id: EE9C1A02D1  external: no
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_125432_121428_8A46080B 
X-CRM114-Status: GOOD (  27.76  )
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

On Fri, Sep 18, 2026 at 03:35:57PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Thu, Sep 17, 2026 at 06:07:29PM -0700, Nathan Chancellor wrote:
> > On Thu, Sep 17, 2026 at 11:53:13AM -0700, Kees Cook wrote:
> > > On Thu, Sep 17, 2026 at 05:06:20PM +0100, Lorenzo Stoakes (ARM) wrote:
> > > > Move them into their own file, sourced from the top of init/Kconfig, so
> > > > that the next commit can add to them without growing init/Kconfig further.
> > > >
> > > > No functional change.
> > > >
> > > > Assisted-by: LLM
> > > > Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> > > > ---
> > > >  init/Kconfig           | 197 +-----------------------------------------------
> > > >  init/Kconfig.toolchain | 198 +++++++++++++++++++++++++++++++++++++++++++++++++
> > > >  2 files changed, 199 insertions(+), 196 deletions(-)
> > >
> > > Yeah, totally right to move to a separate file. I think, however, I
> > > would prefer this wasn't in init/ though. Kbuild uses scripts/ as its
> > > Makefile.$topic dumping ground, and Kconfig.include also lives there. To
> > > me, this new file should be scripts/Kconfig.toolchain instead. And
> > > arguably, this should be included by the top-level Kconfig rather than
> > > init/Kconfig...
> > >
> > > I defer to kbuild folks, though.
> >
> > We talked about this previously:
> >
> >   https://lore.kernel.org/aqPW1FsBVYHSWl1r@gremlin/
> >
> > I do feel like scripts/ is a better location given that these are really
> > things internal to Kbuild but I also see where Lorenzo is coming from
> > that scripts/ is a little weird for this to live for discoverability,
> > especially if we want people to put checks here instead of in a Makefile
> > directly. To be honest, it would be kind of nice to separate the Kbuild
> > parts of scripts into their own directory to make it clear what Kbuild
> > uses versus what users/contributors should use but that is obviously too
> > big of a project to tackle as a prerequisite for this.
> 
> Yeah it just seemed really weird/surprising to me (in the sense of
> 'principle of least surprise') to put that in scripts/ and it doesn't seem
> that traditionally anything else like this lives there.
> 
> But if you guys feel strongly enough I can put it there.
> 
> And agreed probably a 'third place' is the right way, but probably not
> right as part of this series :)

yeah, then I'd also slightly favor scripts/ for now.

Kind regards,
Nicolas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
