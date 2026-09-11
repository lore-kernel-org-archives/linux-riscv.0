Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEAECC88E4D
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 18:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Z0z/ghui8r77tJi+XblWg15iVZztvUo48pQJxPCJdA=; b=2Yxq6wA4wZ+3nM
	SYbk3WgaVGfj3wAi+OQWOMzVyj3p+Jw+Bt48LjPz7C6wREA7NFDG++OrqxwQKJmalN2N/L6snRmAC
	4YbAJG6sX/9h/OR2FTKilohRqSxZPcDKs7a4jZ8DEIL5JT/45BseGOyrdhjguUFySuSp1k/CN2NhM
	ZMa90ZrJoHf6j8sHbfxbFY2wdg64y3ZqfFmrtIJrBA2gW16EckMIyZP32T1NitNz9x5qWegFlb/K8
	gG7y9XEb5iJNC9ghHN3K3EfA+K4agTuF54iAre58GkAgIIcf8jhX03l1+dqa1yj1gSrgcubwWo2at
	vpTgyRvS77Hps5CTPDow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x55p6-0000000HQTX-3yN3;
	Fri, 11 Sep 2026 18:18:05 +0000
Received: from mail.avm.de ([2001:bf0:244:244::120])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x55p4-0000000HQSs-00YG;
	Fri, 11 Sep 2026 18:18:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fritz.com; s=mail;
	t=1789150677; bh=4m5yk/k55asBFxV3Yrw4jckjF0Ccpy/QWIGf4quzAAg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=feKsbpggxPjO+L8yKkeMjSg6GdSQSLR9XKrPldZ9xwoiDTB1nada6e6Li3U1uvJBE
	 Bo9ycQtybDQsKVCVHFCI8iHDrDHnM45RxEWyVLs2ro3ntOgdpgJ11kkgAY9jdofcnW
	 LgO4oBww24RpJ58OsSW3XCpjW+FXiwHlRhE98b3U1MFCqvppGY+ughJOa04x0D4ZrC
	 peC9C90PMJA5fL176KDAzvRjAu7tZIyjUhEGV54N6o9V9ACcFMSWAMg0W3ImC2L1ai
	 cjCBFHzkytvnqjpewr3Nj6Uv8G3FTG6D8hkEPSX8PgDsKMcdUjYS53LHKCoY3pYAUs
	 rVNlWagNGbLcw==
Received: from [2001:bf0:244:244::78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.57.1)
	(envelope-from <n.schier@fritz.com>)
	id 6aa445d5-0449-7f0000032729-7f000001c01e-1
	for <multiple-recipients>; Fri, 11 Sep 2026 20:17:57 +0200
Received: from mail-auth.fritz.com (unknown [IPv6:2001:bf0:244:244::78])
	by mail.avm.de (Postfix) with ESMTPS;
	Fri, 11 Sep 2026 20:17:57 +0200 (CEST)
Date: Fri, 11 Sep 2026 20:17:57 +0200
From: Nicolas Schier <n.schier@fritz.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
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
Message-ID: <20260911-invaluable-indigo-seal-e31aec@l-nschier-aarch64>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <20260908-build-speedup-v1-12-5dc1ac01672d@kernel.org>
 <178901395292.3971858.13236774094648272066.b4-review@b4>
 <20260910-translucent-sweet-sidewinder-7acacb@l-nschier-aarch64>
 <20260911183333.1df0f2e2@pumpkin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260911183333.1df0f2e2@pumpkin>
Organization: FRITZ! Technology GmbH
x-ms-reactions: disallow
X-purgate-ID: 149429::1789150677-0CF8F965-95D5DB55/0/0
X-purgate-type: clean
X-purgate-size: 775
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-pfmilter: host: postfix-mx-01  mail-id: 4CFD1A0632  external: no
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_111802_670076_04F39535 
X-CRM114-Status: GOOD (  15.67  )
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

On Fri, Sep 11, 2026 at 06:33:33PM +0100, David Laight wrote:
> On Thu, 10 Sep 2026 17:42:35 +0200
> Nicolas Schier <n.schier@fritz.com> wrote:
> 
> ...
> > Yes, skimming through the patch, I thought about that, too.  Moving more 
> > cc option checks to Kconfig will make building out-of-tree kmods with a 
> > different compiler more dangerous.  Maybe we will have to make the 
> > warning in Makefile's prepare (external kmods) target a bit louder.
> 
> One problem is that distributions have a nasty habit of shipping kernels
> that are compiled with a different compiler version to they actually
> ship as a compiler.
> In some cases the versions are clearly the same - but the version
> strings differ.

yeah, I guess you hit the mark.

-- 
Nicolas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
