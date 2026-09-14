Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B11CC88E73
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 20:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XHBsJq///mkhOBHzjyiNGxda8FeZJQ93V2J+7+jwkPQ=; b=2jSqDST7TuIdbR
	vLnN8Rltg5bWbSkJxauV1LCxFBh1uI1tysXNRiZbf3YffL60jx9tCWZwrfE6It45eeb+FMrbR47mu
	UkOP+7/dpm9JsOcwslhCYsiaR2cVkN6QlcPiPGl+eGwCYrfXQL5YvDaPh8IvMoQ3P0AflqxCLiVZH
	FfoM88hRce1SPbPKkP9McPjkwbqsoyVL5/3Q9jSz4CYD2QrpUJY6aDbEqk0Q5P/gjc62Dl4zq3FoW
	xUtU3A8vp4Vtj+o1n4hkmL433w2yNYE3P9kpgibqJm1V6utchfqrmBXrFDITAoMBlhnD+XFi/Rg+i
	LZ5tMFoojPk5WBhKg27Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6D3m-00000004ZpJ-1Q8s;
	Mon, 14 Sep 2026 20:13:50 +0000
Received: from mail-ed2-x0e.google.com ([2a00:1450:4864:33::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6D3k-00000004Zov-19Ve
	for linux-riscv@lists.infradead.org;
	Mon, 14 Sep 2026 20:13:49 +0000
Received: by mail-ed2-x0e.google.com with SMTP id 4fb4d7f45d1cf-6a9dfe4dfc0so2430847a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 14 Sep 2026 13:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789416826; x=1790021626; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FhpCYoKplrM1IaRlncQiHxwpj03BaeP0oenEDpXOAEg=;
        b=iADMsX8ZzKFsqlmEloY1oiv3Xj13mxG5NYg8txftrYhKvA7PNFiyTrb25QofaF4sbg
         VQdlL7dl62w6Rw2qUcXUKWqItYhZ2P3ZTM3TuQgqO+3feYL7OaKgc2UqUtfRTUM/xxO7
         OdYy2xQ8JCN+9+aQ/GbOi2XkwW2xvagCuWIcM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789416826; x=1790021626;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FhpCYoKplrM1IaRlncQiHxwpj03BaeP0oenEDpXOAEg=;
        b=mIWQ5ktBs7cZvB/E1ogRdfHsKrYF2RId/Eg9kMZz4YIdlhEEzbvGnLgll6jXAK6fe9
         r5QHABZmToEOmTXlhLBq8AL7Ii+ee3P79KjmAsQ4qEyhZHVeHhVE6inQrlsWaObzWJNT
         JXPPhwqz2j24u7wzoo200v9WcOfDS5g5BhRE2gK1hFfc+Fd3K5EzlllwY0tuAhrwSMpa
         EV8Hk5VWe5aFcqyyqNuQYdjpKnmo6IBzeKKuaxOz/x7tDc7k0KaFgZV845JKFMrVYgFr
         k46GU1MVYxdNzLlno3iShDE5JZ9SuaXEnFisxYSVa3erFqOKk3Jzuiar8lzav4pKeM+H
         MfoA==
X-Forwarded-Encrypted: i=1; AKwUvBzzu1KFYnf8WP8oECoiZ8jN2Aak3DKW/MDd2LSklK7GDd24IT7sd5f3tDrED5dKyjUPfgojrn2RFCRclg==@lists.infradead.org
X-Gm-Message-State: AFuF++lPMwPeuwebuom26ELVKlkM/fD3xmENIXlDx0J0LTC4kd6ilYaX
	T8ay6XrrsROfj6g0hXw5WBkxK9MqdqoBVk9AKrjv+cnwVfEddVbBO9hbEtfY1NN2Pscea8r7L8D
	Xe3gfWFFPzQ==
X-Gm-Gg: AYBFou1xPodj0CZNshX9RMCBuhDOdqJ9f1YF6RUXJfaYtT0lJpJTK+pwGKG+mjdzC8g
	TGjMc5aP7zATQ9N1Y8sI/yi7DkiQDgGLKyoovWbbsPWgxJAiA0V+t8NH/uD2bL0c5RWqSWiP6l8
	dAcm2xCh6qRz0nx3QyQcShF4+u9cG2RafCZhXRQ9qHJ/KO2Nh/syeTOEgb0If7EU/sw0n7Dquk0
	zZKURYf8JhQInA/g/Wpw9Orwm4ED6srNlHaztVcJOzSX9S4KoFWsKU4fBcQQEx7JwsVKkqqqxtD
	7H9ZU+hEfybzttva1Td81Wv134HNnrzAsm9S7vjciSig357BO4s/Ym/qmXdGh9W4vcjBe4WnEo/
	NMAaKSSCy/ZlBEkytCIvqMTKXQvkFkR+wISeLgcmv+9Syyf5rDZxXmHU9YaEYm3uVSIv2HS4154
	aMLF8c6IGczLfQeRTmloQQD+kFcJvZLkEdhWRSlPa0NbxJLgARqPcWeSdMTm3Anbtwwk7lodRWa
	M2Vzyx6PXunTnlHpYteRuQF8Vj9BBSsrMH7K/KBvgrkzo2dTAsyEo7P+A+A
X-Received: by 2002:a05:6402:2b94:b0:6a9:d30d:2e9e with SMTP id 4fb4d7f45d1cf-6a9f61e84b8mr2627115a12.2.1789416826385;
        Mon, 14 Sep 2026 13:13:46 -0700 (PDT)
Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com. [74.125.228.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b58314fasm4598675a12.3.2026.09.14.13.13.46
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 13:13:46 -0700 (PDT)
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f55efebso403644966b.1
        for <linux-riscv@lists.infradead.org>; Mon, 14 Sep 2026 13:13:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBymZ5ylUSikthAqj874DviouIC5wqWHGHZPc3+j1zw92cxQHJ+Mtpyk8esLhLClQ55F9dR2TQzvI2a04A==@lists.infradead.org
X-Received: by 2002:a17:907:6d1f:b0:c25:5faf:b207 with SMTP id
 a640c23a62f3a-c29b84c9a48mr280688866b.3.1789416413732; Mon, 14 Sep 2026
 13:06:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <20260914-build-speedup-v2-15-39817ec5db23@kernel.org> <aqhLhVMkNzf_4oJw@jpoimboe>
In-Reply-To: <aqhLhVMkNzf_4oJw@jpoimboe>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 14 Sep 2026 13:06:37 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiB9MX7vBDQ+WHTUVfSYubLhR-PbABewscqTsxRhg-LbQ@mail.gmail.com>
X-Gm-Features: AcwNN1XwkDuRyfqGBvPSv1hGEYJIl2TPFZFoOf2g9mdtKKeoU1aAJmlE5veL8PE
Message-ID: <CAHk-=wiB9MX7vBDQ+WHTUVfSYubLhR-PbABewscqTsxRhg-LbQ@mail.gmail.com>
Subject: Re: [PATCH v2 15/21] objtool: cache relocations, do less work
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Alexey Gladkov <legion@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Peter Zijlstra <peterz@infradead.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>, linux-hardening@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_131348_337756_158AF4DE 
X-CRM114-Status: GOOD (  17.67  )
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

On Mon, 14 Sept 2026 at 12:44, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>
> BTW, I found another initialization bug: klp-post-link.c uses
> elf_create_section() to create a reloc section, so it missing the
> initialization of rsec->hashed in elf_create_rela_section().  But that's
> moot if we just get rid of the hashing.

Talking about "getting rid of the hashing": the instruction hashing is
obviously a big deal judging by the hash size expansion in that other
patch.

Do we actually look up all instructions by hash in the first place?
From a quick glance, it looks like almost every user of "find_insn()"
is looking for just certain *kinds* of instructions: calls, branches,
returns, endbr.  And branch targets.

Maybe stack updates? I didn't check.

Yet we seem to hash them all - even if they are just some random
ALU-only instruction that is in the middle of a function and never a
target of anything and has no impact on any code flow.

So the question becomes: do we actually need to hash those
instructions at all? Are they ever actually looked up?

I don't know this codebase at all, so maybe that's just a really
stupid question. Feel free to look at me condescendinly, shake your
head and say "Poor Linus has lost the plot".

[ And yes, I see that whole "next_insn_same_sec()" thing, which
obviously *does* look up all the instructions when you iterate over
that function, but it strikes me that using a hash table for that is a
bit strange when the natural way to do it would be with juyst a
"struct instruction *next" field instead.. ]

So if hashing was such a big deal that it showed up clearly on
profiles, maybe the answer isn't just a "make the hash table larger".
If a "next" field were to not only make the hash table much smaller,
but also mean that next_insn_same_{func,sec}() would become a "follow
one pointer", mayeb hashing would become rather cheaper?

Stupid? Or maybe "not completely stupid, but too painful to change"?

         Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
