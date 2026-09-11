Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74779C88E53
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 21:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ek5FZH2eQFpdx2s35CTQbkbKkSXxsTh6YA3F0uBBJ54=; b=ATqKDxrjRKb61g
	Wb/wzc0WN0wg3MgofuUBClZzXYnvDx0W+Yo0KvS/rezG3AaMg1DAbvOK02m9pAC8TSoOF0e505DhD
	KbRcoUC5QX330Hb+5PExA8ZRfheRO61IPF8ehMa8DAi0IP7LSqAg4Wgy5/RGyB0sHZwooKxR4nLo4
	iWM513WBJNfvYHKhPlYeawQMLUjEnP/Xpzzo5zr8y8mcR/Ig6lI3dNOtBTNevTITTOrlGE7Fb2iF1
	MOZJNteqmt3mNncuv/cxCZ3X2idXQC5jfDn8LZikZR+taEzulxmw1L1vkCqfmT/UqC5Z8srBXHOAX
	75o4nYdwmSH+Cd/mnw3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x58Mx-000000008SM-2glO;
	Fri, 11 Sep 2026 21:01:11 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x58Mt-000000008RG-2old
	for linux-riscv@lists.infradead.org;
	Fri, 11 Sep 2026 21:01:09 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f6351831so138351f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 11 Sep 2026 14:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789160465; x=1789765265; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W18BjSa6bE823jCNrSo5QAggwLMczPlVTE3fEsKx2B8=;
        b=J4ablJoMCW3s6lzl/WX8+/LHKEFKG+ayEtGUwYhBXsfQTfAWkszpeStmfvVCMcdOa7
         67Pd3BAmNwFRPOPNxG++SgRhrAAZQqJ7/phFOV29Xr7cmjaGaAR2LWpz0ID4fXno+Zwc
         F7PW08utAxe8t9ZmasHiHfsuxxCosCGWWdE1khjriAFDrFd/2jbGIj75i6HAX8ELWldT
         Bvup8ii5q2KR4EHFY0lpXkhAoSwjFEbBkN995hGT/JX2sV0xqQUH5Pbu1WCoVbVecWy1
         mO1iE6hrjJarY1N3qBHqHY3W/8qwBFDIhbj866PHD7ROGQQaVLnB4MdHtcuGvw10gQ9V
         dp/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789160466; x=1789765266;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W18BjSa6bE823jCNrSo5QAggwLMczPlVTE3fEsKx2B8=;
        b=OZNM1aC7FmiG1hVBOrRuL/ySyUqmDyiWlL3PNPXcN66iv9tD3D9yxZL+GjOLmJ33Hv
         DszXijHINXViVl83RBtjUON6EvLbRMgkMLpKJQ0ZcIfvAn7H5ZN4DfP4qtut1MG1x3n/
         mo6PScb/1ZpDx2fPVKUe3M6O5todcYUq2XgDmd0d98JEe5ml9s65PgXq8AKbobRvT1kR
         TgwG7pmy7GUcmP2xLFTDci7cNzUY6cSQviUw6gqm6rM4DaPrE5dmev0Eb6vLfMyF4Iwa
         +AQhFsew2If0W3wkW9Oi2wwVlNjJ/0bKUaKsr1136iT3N9HkaB/piK9aeahCh+spZHs6
         7Rww==
X-Forwarded-Encrypted: i=1; AKwUvByK+HCQCLRbxe0rqG62td2UsWbUnN7VLs4K/pBN+UyJv3j5LiIbbxk9yiSbY2buUM5Q7ZRt/5eRQytDGw==@lists.infradead.org
X-Gm-Message-State: AFuF++nuvbXnNh8VZgUyhVP+O8rqkZYtWqR0HLlk59mW8O0coBCcN3C+
	Uke9B/fivNiA//EmqjEd1QFDQzvdrambCLeermEr/ntwTVbbmxG/EB2j
X-Gm-Gg: AYBFou2tNlQX6y34wwDPPGXhhzdBvE063CletBXouvQm+pucUZv6m04et3d1jrdR+kT
	SRNsweJweoUvbs4DTncbCY8VKRboLUE3dANoUolnrZl/st6rHnDN6mLN5BrWKaNAS/kaPLxitQT
	aiQ1dnYR3xcV0jXXzYajTtlVU10/UsRXHzpMnHxmrHVd/FDx3XBNIDmytekbiWI/nR2O+bPnBoT
	gcWsG0LxX32tD9DXjZHRO1L7rWXgG5pg3dX7YjGG73ay1EyF8dd2fVtQK0ed7mTLirMDDP9Mle6
	y3v2syfOY8LfnnNm/Hfq3oXzhSFDB0+k8nh6nVW6Wkk6Qlul8+Jq6YFnH35dvUrFSv2zsTsctO3
	/yg+ONDASuFmOFpYEXHr/aZMpjb2C8W9/navkKaVLxRTM61SY/hWPrZgv+wKUxx7t/tJ5IBaKyD
	m6GPRffaDcr3CDOBiFkaWVXa373+nqnHgrfZ93TQH6XNPXM6eekZnNjQuLBascguNFIdclD0TaH
	Kc6nbr36KhLOYmN4tnuSaygJfgKQ8v6Nhjy
X-Received: by 2002:a05:6000:646:b0:485:8ca8:caa with SMTP id ffacd0b85a97d-486eb34c229mr5448307f8f.52.1789160465448;
        Fri, 11 Sep 2026 14:01:05 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb359f38sm7798317f8f.30.2026.09.11.14.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 14:01:05 -0700 (PDT)
Date: Fri, 11 Sep 2026 22:01:02 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Nicolas Schier <n.schier@fritz.com>, Nathan Chancellor
 <nathan@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, Masahiro Yamada
 <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>, Thomas Gleixner
 <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, Ilias Apalodimas
 <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun
 Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?UTF-8?B?QmrDtnJu?=
 Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir
 Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, Jonathan Corbet
 <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 12/23] kbuild: avoid re-running compiler and linker
 probes
Message-ID: <20260911220102.1d3d696a@pumpkin>
In-Reply-To: <aqRGYXKDzXZMXmmp@gremlin>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
	<20260908-build-speedup-v1-12-5dc1ac01672d@kernel.org>
	<178901395292.3971858.13236774094648272066.b4-review@b4>
	<20260910-translucent-sweet-sidewinder-7acacb@l-nschier-aarch64>
	<20260911183333.1df0f2e2@pumpkin>
	<20260911-invaluable-indigo-seal-e31aec@l-nschier-aarch64>
	<aqRGYXKDzXZMXmmp@gremlin>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_140107_742603_881EC56B 
X-CRM114-Status: GOOD (  28.32  )
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

On Fri, 11 Sep 2026 19:24:50 +0100
"Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:

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

That is true at the moment when the version of the compiler being used
is checked.
For instance it doesn't matter if modules are compiled without 'asm goto
with output'.
But if you putting the options in Kconfig the compiler being used better
not be older - or it might not support the options.
It isn't too bad if the compile fails, but some are silent.

IIRC it is Ubuntu that has different version strings for the same compiler
version, and Oracle that ships kernels compiled with much newer compilers
that they install by default.

David

> 
> >
> > --
> > Nicolas  
> 
> --
> Cheers, Lorenzo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
