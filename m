Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B1EBC79FB7
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 15:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qI321/MOcvxUl+dyQEf3P3rosd6AfQTC1WOTdgcHD7s=; b=YGzrW9BLQ0CsmT
	3FlqNWvtewbGpeBbeHV/6mp1t8tj/8efzkLxDvQJJR3+cbSXuG5Y36JH6zsYARiMk//Ch+wmvhCrp
	VshDp+H4fp3+6U7BC85km2vLv+WerqgX6FG29rPbsXlWh7wID55tyT1YcO88ZyldrkGT4SwuLQF1m
	LI3yyyb1dJqbKGz5ZGCV2WQriYlYn6/1s0gqco6q9yiSbgBiNenJSl1a40bbyu776Fv9k1dNTCdBa
	6QTTypkqWcVtKkvF9ryc7PElYn8oyDsE2w0DaXyo8wS77ghT0moeBfFoix/DmOW8HvRXjY8Hg3glR
	GfluX6yaZ3+D939uWcuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4KJd-0000000CBLg-2uKf;
	Wed, 09 Sep 2026 15:34:25 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4KJb-0000000CBKg-1EWE
	for linux-riscv@lists.infradead.org;
	Wed, 09 Sep 2026 15:34:24 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-6a8eadb2e20so2779648a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 09 Sep 2026 08:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1788968061; x=1789572861; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/FowYqhA2IUhImtOTNUOvZbuU0tnu+Lv5LcROnzCHgI=;
        b=UYCEm0Kaj+/3amu4l4Mq6BYB6V0wegv2iJDy55vvWGY/fgzbF+AwyHOpYQNABF64z0
         74JOZ2nZ2nCkG4jV1IgPO+rq5u9RqKKsQlH9YW5bk+C9segJmZ+ZTFURgSK9h43e/GWt
         bA4tFzNDcH1xsUG4niOrZEtmMID+LB2bUPNZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788968061; x=1789572861;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/FowYqhA2IUhImtOTNUOvZbuU0tnu+Lv5LcROnzCHgI=;
        b=gdRWHR6pY3uUhhzvJSVVnruh0M7JVVGhKPrwT6postxuSjv4fouoVcMcMM3exXO3mY
         pBSY4faQ7Rx1usX2LxekQyo6wHZ51cKxAKlOKwLNe7zsWG3rNrcDA9RGSCmObLfd7o+u
         UYO1aCXuxWXORYHrwxvuI5uT2aUh2CeLmKNalN0g8SWN367Eud2ymVywWZxFgcIgxqXX
         ic3yLxaIBLeTsFXWtzknGGjzfEibAk8cF0jsxvn7bk7GJGK9xbdC9MeMW5LJp4/UmQbA
         OQsqlxRfdUnTcvmSs2c9nGxec7e847UJBQcIbzPxDQ5Qt164dZz/4wNAP1qkP/SXQzEM
         uW4Q==
X-Forwarded-Encrypted: i=1; AKwUvBwWCHyuWYTl26YQ1U38K39keWFo1dKsbuC6CUpg115tQHLeZSuQtVIcF/aCf2ZrLjBU63tqzRChu9UB/A==@lists.infradead.org
X-Gm-Message-State: AFuF++kVotkXkt5thWF/stCg13SEA75OP6By+4CfMm9VkWQntZd4L8g6
	CdXgPhjZL3N4uLoy0oMwgtbT5lDvTfytUAoWAHKK1I6cT6/cBIBYfg8pclVtH3NmRpnDSPNuN+c
	RwZ/kkPzz9w==
X-Gm-Gg: AYBFou0/oCF2J0scKdrgkLQtrbJuAtK8qPBoWNiuKNtmJUxp0FbhoS12FudrqwlPD74
	6AHzhZ1GccaaKnhXKOvhvWkRGEfzLXqOGJrIz3hzzO7Iz+YiM/fcbIAEKECHVr7UStynj2pg0xe
	Vhvfad0/QJWZ+1KANZpzoAYNJo5H+3lpswtdiaPI/xtt8Fz4viqdOOtE+LKx5YMbwCC1K5wMerh
	WQ0tJdZwCSyYpMSBQWmb9LQY5h5wXhQqx8KiG7/WifIMyAe5ChAklMFMxUWeqb+M2NRJtRK5aNP
	1jdJ7c4MifTmI6ybzc394jVvHHSzCnuMWauIokkDC7CtULQzz/vvEMoW4Y8S4ytRoWSesvrAVQO
	+VuwRTWvPWu106TbtX7RdqATszeWF5g3aIgID6v5xy21UVAjCMl3QkjFMSl2Xj3J+RbwUjbOZM4
	JNaJBkaukB3xmW4Jkpp1YanGVPqTKLwmGKAqax8VjfPfSi/8BT5Un9+/1YgcEZ4l3s8Y+qB0i8L
	TkeCja6UDrEYbRdbx5Nv/v1MscR4rchK4+ANDxV6fTNBjew
X-Received: by 2002:a05:6402:52c9:b0:69a:928:9405 with SMTP id 4fb4d7f45d1cf-6a7e8d4f100mr12654916a12.1.1788968061107;
        Wed, 09 Sep 2026 08:34:21 -0700 (PDT)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com. [209.85.128.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68c3f00sm7035991a12.12.2026.09.09.08.34.20
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 08:34:20 -0700 (PDT)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso87303185e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 09 Sep 2026 08:34:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzjGrVoD9BMaWAAteht2se3ISuEOSmYcO7WbI0no+c6QPJOrZurvkQkV9n1np0Dp84SdTNBK56J43In5w==@lists.infradead.org
X-Received: by 2002:a17:907:da4:b0:c26:1649:47af with SMTP id
 a640c23a62f3a-c26164955fcmr1368813666b.37.1788967618809; Wed, 09 Sep 2026
 08:26:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org> <20260908-build-speedup-v1-11-5dc1ac01672d@kernel.org>
In-Reply-To: <20260908-build-speedup-v1-11-5dc1ac01672d@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 9 Sep 2026 08:26:42 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiA_UJbKiu8fOezKV=MfEcaFuzZiuk8Fto-Bc1KrA=43Q@mail.gmail.com>
X-Gm-Features: AcwNN1UWYYtk4z7iDc5cI-l9BNT1_XTZBZ1EzZVT-QGEk4RrzSdK76DVFXE4iKE
Message-ID: <CAHk-=wiA_UJbKiu8fOezKV=MfEcaFuzZiuk8Fto-Bc1KrA=43Q@mail.gmail.com>
Subject: Re: [PATCH 11/23] kbuild: implement and use depcheck to check
 dependency timestamps
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Alexey Gladkov <legion@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_083423_359112_6AD0EF01 
X-CRM114-Status: GOOD (  18.44  )
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

On Tue, 8 Sept 2026 at 13:57, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
>
> Each object's .cmd file lists its header dependencies, which often
> consists of over a thousand dependencies.
>
> When little has changed in the tree, this is what make spends most of its
> time doing, spending over a second, single-threaded when parsing larger
> directory trees.

Side note: from some kernel build profiles I did long ago, I have this
memory of it being made much worse by the fact that we use

    "$(wildcard xyzzy)"

for all our config header files in those .cmd.o files. That then
causes extra work for 'make' for all of this.

And we do that 'wildcard' thing not because we want to actually match
a pattern, but because that was the only way to have 'make' not
complain about missing config headers.

I'm not even sure the original reason for it is relevant any more -
this is all a very dim memory from years and years ago when I actually
tried to look at profiles of 'make' itself (normally when I do kernel
build profiles I only look at the what the kernel part of the build
is, not user mode).

I just tried removing the 'wildcard' generation from
scripts/basic/fixdep.c and the kernel build didn't care about it at
all. The whole 'wildcard' trick goes all the way back to the original
commit that added that whole 'fixdep.c' phase.

Maybe the whole thing is entirely stale now and should be removed. I
probably just didn't trigger the situation where those extra
'wildcard' things matter. That whole thing is from a quarter century
ago, and nobody has dared look at that code since..

Or maybe 'make' is better at those wildcards these days - or other
things have shifted.

From those dim memories, make spent a lot of time doing filesystem
lookups (directory reading  and 'stat()' calls - the wildcard thing
triggered more getdents calls), but even more time just in string
handling.

               Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
