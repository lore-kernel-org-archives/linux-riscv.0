Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C071C88E53
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 19:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bfqWOcv19npf2gnA9tdv4LNdssNXKNHakfVEy2KKP8Y=; b=rypxJSwJ46hGCJ
	xp1Lw3IYghkrZ/OtKTkoUYU7flqmrEE8ZHCSFB/A+yzKJVG3iPwRrdNs4ZuCZYe4uwqsA+2MA2KJc
	ktUQ6h5saAICmo/zwBtKuXJYXxY5xUABNfAM/2b6KmKmrbgU8cpNaL0HcIxpDV/BJbMO1Q/L4H2Rz
	p4L7AzEOqzFWXsLzjenkrBvGdzmX+hWpOtUBB28xDEonQiyOoH4x19ntZqixHlMeY8Bhko4D2FsBG
	M9mOmMMR7RdUChH9kJ+w3LS+eofkn4s9B5xFA+sNAp1+TEwyYGhUGome4Rq2HyjlWTkoeZlFHj28+
	/LKghrXY1LHrWz3wcXYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5713-0000000HZkk-33pD;
	Fri, 11 Sep 2026 19:34:29 +0000
Received: from mail.avm.de ([212.42.244.119])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5710-0000000HZk1-1p3o;
	Fri, 11 Sep 2026 19:34:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fritz.com; s=mail;
	t=1789155262; bh=1JfbmLy+b2xGLH17ANL6tQt8xAUXkYVFyRMRSFYKTI8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FhnZcspBrpigELbZTgL3IYBI0b+pFDqdiLuNUuMEvP1XCe3lb8wJ35046eFcsSlJv
	 6ly2ytvvQtvbyiWv6X2+0OM74cilE326ACJHMCheipzLn0tIWeTUo+b5OBdSyh2bH0
	 WyxyJXMmzBTzMLPFtiK+a5hx1kJyf6Uluud9RT3qAQe/f7lnqJI6E8x749lE+1GJKx
	 yCJcYDWKy/eRMhv63UeDEuL7M2u3eTE2ik8Kak8gec8vyjYrVhK/hjjE7re9rqOOQ3
	 Yt6uFUsJKm+lGKHzCkP/TOzn5zSViKBtjcAMf7qaK7wthDOMSth5CVx+0gr36hV3i3
	 iC02B5tSCJjqg==
Received: from [212.42.244.78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.57.1)
	(envelope-from <n.schier@fritz.com>)
	id 6aa457be-ea3f-7f0000032729-7f000001ab1c-1
	for <multiple-recipients>; Fri, 11 Sep 2026 21:34:22 +0200
Received: from mail-auth.fritz.com (unknown [212.42.244.78])
	by mail.avm.de (Postfix) with ESMTPS;
	Fri, 11 Sep 2026 21:34:22 +0200 (CEST)
Date: Fri, 11 Sep 2026 21:34:21 +0200
From: Nicolas Schier <n.schier@fritz.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: David Laight <david.laight.linux@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
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
	Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 12/23] kbuild: avoid re-running compiler and linker probes
Message-ID: <20260911-just-vanilla-seal-ea4f6a@l-nschier-aarch64>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <20260908-build-speedup-v1-12-5dc1ac01672d@kernel.org>
 <178901395292.3971858.13236774094648272066.b4-review@b4>
 <20260910-translucent-sweet-sidewinder-7acacb@l-nschier-aarch64>
 <20260911183333.1df0f2e2@pumpkin>
 <20260911-invaluable-indigo-seal-e31aec@l-nschier-aarch64>
 <aqRGYXKDzXZMXmmp@gremlin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aqRGYXKDzXZMXmmp@gremlin>
Organization: FRITZ! Technology GmbH
x-ms-reactions: disallow
X-purgate-ID: 149429::1789155262-F4C99720-D05EFFBE/0/0
X-purgate-type: clean
X-purgate-size: 1635
X-Notice: Whitelisted
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-pfmilter: host: postfix-mx-02  mail-id: A62CAA0468  external: no
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_123426_627253_D7A27969 
X-CRM114-Status: GOOD (  24.18  )
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

On Fri, Sep 11, 2026 at 07:24:50PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Fri, Sep 11, 2026 at 08:17:57PM +0200, Nicolas Schier wrote:
> > On Fri, Sep 11, 2026 at 06:33:33PM +0100, David Laight wrote:
> > > On Thu, 10 Sep 2026 17:42:35 +0200
> > > Nicolas Schier <n.schier@fritz.com> wrote:
> > >
> > > ...
> > > > Yes, skimming through the patch, I thought about that, too.  Moving more
> > > > cc option checks to Kconfig will make building out-of-tree kmods with a
> > > > different compiler more dangerous.  Maybe we will have to make the
> > > > warning in Makefile's prepare (external kmods) target a bit louder.
> > >
> > > One problem is that distributions have a nasty habit of shipping kernels
> > > that are compiled with a different compiler version to they actually
> > > ship as a compiler.
> > > In some cases the versions are clearly the same - but the version
> > > strings differ.
> >
> > yeah, I guess you hit the mark.
> 
> I mean this is a problem that already exists for any flags already specified in
> Kconfig.
> 
> Out-of-tree modules are historically something that we don't go to great lengths
> to support and haven't historically worried about breaking, either.
> 
> I'm sure distros can find ways around this if a problem were to arise. But I
> don't think it's something to worry about all that much.
> 
> I expect a _lot_ of these, in any case, would only require the compilers to be
> within a fair few major versions of one another anyway.

yes, I have similar thoughts about that.  But I think it's good that it 
has been mentioned here in public.

-- 
Nicolas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
