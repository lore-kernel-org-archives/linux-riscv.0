Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E69DC88E53
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Sep 2026 10:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l0V38jmRIa0whLw0ZQFyEBUvmjLWUQyczHvbJoJLP54=; b=QJD+0HtCKGybdq
	2Sbf+V8ZKxFloPiBNdKHt37RCb7jrgnQOGj1HahlBLvtl1o3T0oj6Cfaow55XhRwOPQkedRcYMSHo
	rMBn23W+aYOSPu5ecKq5sQgA3nV8n9BXc7DxKCN/ldUFUSmerA8hvJ1/Yjww0RtpiUdEV4S+Cqw4R
	zaTBjx+O0xRLw+WRruxmGSjTGkespiZCcpAX88b22VsOp58wSOqzzc/IByF7mcSXtDBPI0B5HMxfe
	VmRYQ2KvN0TDSxOHZmJ1rstaO4iT9Xf70NKmwoODBX6U4zpMVj7rXXD+vPPo7pn0W5wKiD6EYX8Be
	uxl/v+/lxfhAO/JUW2Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5KZy-00000000lBw-058h;
	Sat, 12 Sep 2026 10:03:26 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5KZu-00000000lBC-26r9
	for linux-riscv@lists.infradead.org;
	Sat, 12 Sep 2026 10:03:24 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f635552aso323388f8f.2
        for <linux-riscv@lists.infradead.org>; Sat, 12 Sep 2026 03:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789207400; x=1789812200; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=78QJrighesf7VQwGx1w3HgeMelr4wZOukxrUbALylpM=;
        b=ayFlrRhgfRilSgRfbCOPHRMjOq0LEE3i774I6brz0XE6Y3XkrnOQbizHS7o7LIf9Qh
         2ys6rYObwe756xkrIoJklftdkPoP4Puh8FPFckfUYkg58d9NI5hmctNEUDA+Cmjju0Sy
         xXUR6e684uojPPhziwcrIUGj/uiK5rt7c4e9zvp+quAK0cQYZpj6QmDIffanuxWwjTJN
         MOqUFBwJ4ypT6r6Y0HNTkVcNdbR9WkNxm/kGXsSsVKaSgOqQmSf5j8WAYpC7QNvznYIs
         Mn9lHgzD6I3YumcALavjvJRJcruvGQ6UMD+mtsJI3xQsrq9avYjNs9JwZ2B917GoZLyl
         woZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789207400; x=1789812200;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=78QJrighesf7VQwGx1w3HgeMelr4wZOukxrUbALylpM=;
        b=Em40R+3FQEhEsOZtxp+ZwHK0rHxwUYcseLavZ9uEHq9ExVwGFXPiYyB06dZE4zAoZH
         HOJKrZT0JvGK4yKJKrm9jZNbM7mu+1mt2FwPfJ77R3tCcZ7VLBTUIu8SSt67frOEGjxb
         RnzYO0tNpe4l7Unbq4kBPjmbFRvMC+eUvN2LFDnBN1dWIiz2J9dlXGelX9UtyE9h06+X
         cMWYu3Ugzch+zPpFeNMxjBq4QdvVOBKsUyvSxQ9NLEE8KyQ6Gh71SilCfBWW+WtivEsG
         cDVHm7jT+wLlW/Y9qqrEDKioBG3UOkMrwwK/t5rlY+drjhB16bUawVnJ+wtkm7yPkClf
         UmUw==
X-Forwarded-Encrypted: i=1; AKwUvBwVK2W+iYneHDnAyfzbzoHqjdBCjKzvVRWMBeA9XymYELzxGMnTBoK6BNi6psdn9CxJ9ngSLvERDFeHpg==@lists.infradead.org
X-Gm-Message-State: AFuF++m96nx9brybNs3Wmb7DYy4ecPZy2VoNcp2W3O6CkWGYjE92vqWy
	0nToAJu/Ehj2mpx37UgM+dCgVfq9A4RVRT2FwHoqud9lSIk3MDPYeByp
X-Gm-Gg: AYBFou3kdhs4/jp83XUX7/yNF4sY38BE5p6skPeQW+F1D5p/xmzrMbEDCKOyw22w6GH
	95aBVuLgQPEauyXBp2cHBymA2XW/9hLhPWIn4dNhT4lbXVcWy7oKGB0unL3cwC11CBIuhSJdEkV
	3Yf7bgT1Arq02z0vOXE9KBXs1mNByf7+uhjXZB5G6xLHrmfJPK+qKAPwiu0GT6Hv4jhRRe5ZgZI
	Q3gwSAFbSgnfVOo9ioXsAaKRfrblOW85AupP3ZueXRnbHk3A8rSSxAJz6iRYGDqR+SXwtJCXpL0
	J8N0BdNA7bojMmuWEfIsRcNQFxcWz62w2NZ5qJTxEWUTWLblZULKpuFF/BKoCKP9xMnSJVbnFrl
	bICC7nvqP1diTczOai92sNzYQ/p9IytDDS73Mb6bs9b2gmmQEC5KIPr/NPrCUHa7xt3R/NLWQJf
	b67JZcixmrtLWVcRNsGFMJNtTrssH1n/w/s7zGhTltJB1gR7130BkXPoKjZi6Z4EBdchsoUPC+g
	AnCElo3xVNAb03Zm2czHiDTGWvlkHwfTnP434k4Ej9Kd+I=
X-Received: by 2002:a5d:5848:0:b0:481:512b:f0e7 with SMTP id ffacd0b85a97d-486f6c0a974mr2053384f8f.17.1789207400506;
        Sat, 12 Sep 2026 03:03:20 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486f301121asm7428212f8f.0.2026.09.12.03.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 03:03:20 -0700 (PDT)
Date: Sat, 12 Sep 2026 11:03:18 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Nicolas Schier <nsc@kernel.org>, Nick
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
Message-ID: <20260912110318.23bb6619@pumpkin>
In-Reply-To: <178901395292.3971858.13236774094648272066.b4-review@b4>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
	<20260908-build-speedup-v1-12-5dc1ac01672d@kernel.org>
	<178901395292.3971858.13236774094648272066.b4-review@b4>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_030322_578914_A0476319 
X-CRM114-Status: GOOD (  19.87  )
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

On Wed, 09 Sep 2026 21:19:12 -0700
Nathan Chancellor <nathan@kernel.org> wrote:

> > diff --git a/init/Kconfig b/init/Kconfig
> > index 8583d9f06c52..3c92c87254a3 100644
> > --- a/init/Kconfig
> > +++ b/init/Kconfig
> > @@ -144,6 +144,44 @@ config CC_HAS_ASSUME
> >  config CC_HAS_NO_PROFILE_FN_ATTR
> >  	def_bool $(success,echo '__attribute__((no_profile_instrument_function)) int x();' | $(CC) -x c - -c -o /dev/null -Werror)
> >  
> > +config CC_HAS_ZERO_INIT_PADDING_BITS
> > +	def_bool $(cc-option,-fzero-init-padding-bits=all)
> > +
> > +config CC_HAS_NO_STACK_CLASH_PROTECTION
> > +	def_bool $(cc-option,-fno-stack-clash-protection)
> > +
> > +config CC_HAS_NO_ADDRSIG
> > +	def_bool $(cc-option,-fno-addrsig)  
> 
> I am generally in favor of this proposal since I think these checks
> should be cached by Kconfig where possible to clear up running them
> twice. That said, I wonder if we should pick a better dumping ground for
> these checks other than init/Kconfig. Maybe init/Kconfig.tools or
> scripts/Kconfig.tools or something?
> 
> I also worry about backsliding and growing cc-option checks. Should we
> update the documentation to state that it is preferrable for these
> checks to live in Kconfig so that they can be properly cached?
> 

Thought...
Can some/all of the checks be done by running 'cc --help=xxx' once and
parsing the result?

Although I'm not really sure that shaving off 0.2 seconds really matters.
(I know the little bits add up, but there are much bigger delays.)

One thing that does annoy me is the delay before the first compile when
you do a -j1 build. I've not looked at what is being run.
This is all made worse because gmake doesn't stop on errors very well.
I fixed that in NetBSD's make about 25 years ago.
(IIRC it mostly required always getting a new token from the pipe.)

David

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
