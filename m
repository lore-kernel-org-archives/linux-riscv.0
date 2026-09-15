Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95DE2C88E53
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 11:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6kXfB18e9L8iKmEE0m6slbZZ7ScHN4JEZks8sXzbG60=; b=gWgOIz42XANebE
	oEvxF6BkIpzZV99M1kZXQdaG57PKR4QyGTUgRwcfjFHTks/IkHVN34x7pdiiv/6cawi7rpwM2O3K6
	PLQPTt0tgw92dY2ZUMhwrMeMtWK85+vDqHxN1XZyTqrrFHv6aJRx9DaywxqcA9IFIK4WySuZ6lJ3O
	gbGhDOSqnQgs5NEyJ2xTotRfnBYHtd4BIO3b/h0Aaeufu7wKfgq/HaKWElZY0pRVqAMEggA5iZdIV
	ucH21G44vcBjiMMZ4b1uQQHSnwe53iGZj5EDnx5echMOckb6pZBwpqOP45edowZe1RRjJQHjwg8Fg
	rg0e780wQVNhwFZdXKGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6RMX-000000066ws-2eNg;
	Tue, 15 Sep 2026 11:30:09 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6RMT-000000066vq-1U1H
	for linux-riscv@lists.infradead.org;
	Tue, 15 Sep 2026 11:30:06 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-495437bb891so5802095e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 15 Sep 2026 04:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789471803; x=1790076603; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dGOErKOPioTgO3v0/s/JdPfHHqPEsYrQAaTIvwRdmxw=;
        b=gWsrXLbWzZH97Dmouja8+9D8MFOpVrZryLO48JTz77wLoc+HoZ9Io66PuSmM5P/oVG
         V6ruUkx8wM/jNi5n7h4mpQmJtbVzIEuNdLihomWXw/nOVxGn5G4thujY9CHhOFDR2KZl
         Ka0MwPs0LfBfT2UjV+V05LO6AlzBRMKaLSdunYjny6MdZKB0FdIzklhENSOMOXhA1Oij
         UmvnsvuzsxyzhH653zQr9NWMKqy62eLeduA1d2ZAeDBRIPxmUN/Vit/r+EtUvOzWgCkS
         cKA1NrR9UqjEsKuLM0DXCK5VnmYGUf7oxlstAOlzNnl0+Qqnpi2yQeY3gBa5+fm2Lirm
         uWtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789471803; x=1790076603;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dGOErKOPioTgO3v0/s/JdPfHHqPEsYrQAaTIvwRdmxw=;
        b=k7vePyau5GUpaKpDijS4SKvJUL/klNlEOwy7Cm+a6/tbLIzAcfdC37Z5MpaTLz9azt
         lHyUxyrPpT2pY8/XMyJoHj4fp8yJZOndZJXOBSrPSSqmmYRk0lWp/KnU8FQQ/sDuVfaZ
         yw6+ffkNrLmPlYXbl2q2P8dtPvEDyszRiEA8Wm/Bz5RANwYa+yryAqqN9loyYYDru+7i
         ycgsWrvq2vyTkVAg5hskCT6fIrGlF+/CQCj+cWXM0CjPIu8XQcFcuUEPZv3WmEc6JKN3
         qFkkaqhbp5MAM8XqClHIU4SVHKZLTGHGkxA1oFdPgBv3H/T0nI1CEbTqrLVjLUbOzvVy
         eIFg==
X-Forwarded-Encrypted: i=1; AKwUvBynicRFYVIBooGqJ/iPlyPrvK79+rs2bA6YjbjiAiyu4iLZ6H7FgG578MtIT2R79DZSFsaqSrlNcMpbvQ==@lists.infradead.org
X-Gm-Message-State: AFuF++mr11prVGFjy1CCJ9M6ptSb+gz657wue9kPulATrq5qT0CGsCDJ
	SjmNHy/FkMngSU9xJLsCQOwIH5xYY+WJZWjRF1ryyC/tU4i/gBKZyTsO
X-Gm-Gg: AYBFou3J8CUs8JRaLNF9guI8IwOxvt1aFiHgTX65fEgOS3W0LwJOSTRuDiWK1lQgx9F
	z8bPBBkGkO9qYSz+wVAxM/PcZZ27iWS++NQFRgYgfHvmwmrNoiy8Puv8N1WKqbuPux3xVJGkGr6
	niLZfS7XuFvXPEmgFbEVPS5ByVLZomzzWH5XB+A40V+ZuaaigkkNj3NKZVtcTOJFnMWXTrPi5AJ
	1ciE2jpVDReVFD0HMNGIFqg1gT1OQNBiLItqzYk/7LzFY4PO94noOoIe28tPafBV66nHBNOOZlZ
	CPBWTSugXqkLkyWLcarJ2I9sJHmGQOoG0/rbe8mb0HEExTDOdXXcYpVksY/bUCUInWb/tUQpv2/
	MBrZKLcblDNQaBTNWUTXsK+XdR2Mi3jDBKM7VMNA9HZr35wFpO5DmfGdVUW38Wd4LAovHAXxod2
	ersqS8NU5KyJlUDExbUMZwt6nC5LMFTy9q+P+ECpHEQb8McEMX/8MSatt2uu5e6L9LQdALrxyDP
	PlbdBO0GDjVywItoDXa1KvcDloSz0AH5jNp
X-Received: by 2002:a05:600c:33a1:b0:49d:28b1:260d with SMTP id 5b1f17b1804b1-49e7d74ce16mr30558965e9.12.1789471802734;
        Tue, 15 Sep 2026 04:30:02 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32d3c7sm31448164f8f.10.2026.09.15.04.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 04:30:02 -0700 (PDT)
Date: Tue, 15 Sep 2026 12:29:59 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>, Nick Desaulniers
 <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt
 <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, Alexey
 Gladkov <legion@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas
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
 <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, "Gustavo A. R.
 Silva" <gustavoars@kernel.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, Jens Axboe
 <axboe@kernel.dk>, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 17/21] objtool: decode instructions and resolve
 branch targets in parallel
Message-ID: <20260915122959.2348bf90@pumpkin>
In-Reply-To: <aqkR9Xqu-0Tem1zm@gremlin>
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
	<20260914-build-speedup-v2-17-39817ec5db23@kernel.org>
	<202609141112.F8983EE9C@keescook>
	<aqkR9Xqu-0Tem1zm@gremlin>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_043005_427592_20EC83ED 
X-CRM114-Status: GOOD (  17.96  )
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

On Tue, 15 Sep 2026 11:09:25 +0100
"Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:

> > > +static unsigned int decode_threads(unsigned long text_size)
> > > +{
> > > +	const long nr_cpus = sysconf(_SC_NPROCESSORS_ONLN);
> > > +
> > > +	if (text_size < DECODE_THREADED_MIN_TEXT || nr_cpus < 2)
> > > +		return 1;

The text_size check ought to be before the sysconf() call.

> > > +
> > > +	return min_t(unsigned int, nr_cpus, DECODE_MAX_THREADS);

Why min_t() -  you might as well make nr_cpus 'unsigned int'.

> > > +}  
> >
> > No, anything using _SC_NPROCESSORS_ONLN internally is wrong, whether its
> > pigz or objtool.  
> 
> Why? We shouldn't cap a 4 CPU box to 4 CPUs?

You almost certainly don't want to use more...
(Unless they end up waiting for disk)

> 
> The idea is that the empirically obtained 16 core limit should naturally be
> capped to the number of CPUs.

The 'empirical' limit is very likely to be system dependant.
There might also be situations where you don't want the build to run as fast
as possible because the system is performing other workloads.
(Not to mention if you have had to add tracing to find a bug.)

> 
> I guess in a world where make hands jobs off this could be dropped, though,
> if the complexity there seems worthwhile.

You need to pull tokens out of the make pipe :-)

David


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
