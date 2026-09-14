Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D47F1C88E75
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 22:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nnHtZ5zvSEbeV/pupAmYxRb/90z92qtJiWO+yQTE5vE=; b=ZVc+D+YolUBjEW
	NjcI7BmKpt77zpMm4C94Zpdz4L/iE8q0aayh5hhRoc3PDPCK/u9jae+Ss+bkBEY3G/zDtteziHBDY
	d0OeYpxko8Env6kGWkCU7yiYmIexj4NdG5KFm8/5bIXbCSGeqhi0rMm+H18W6SGo+wnRDG8TDY66V
	VrEiWkopcgxWQ1bH6ncHTSsa20SmhyU6Jy31rhcg/6ztz33R7wQjPJQ1VBRpL11KNZ9RC+YxFO3K1
	Q14rpSnJ3BpBUF2YWb2FUFXPn7y6qnYwO5ZDuJvHORc7UVd3ZK1SjqnSjbm21abT7RCq8aLFj8anc
	tnWSBLcsglX7SyZ4cyvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6FCD-00000004nHb-40Nq;
	Mon, 14 Sep 2026 22:30:41 +0000
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6FCB-00000004nGf-1vvd
	for linux-riscv@lists.infradead.org;
	Mon, 14 Sep 2026 22:30:41 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c254f705536so618785066b.1
        for <linux-riscv@lists.infradead.org>; Mon, 14 Sep 2026 15:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789425037; x=1790029837; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=doHeCbdvroV7mGBSmqv1XRXXxfYTXe+sNzLZzLwqdyM=;
        b=Ku+xLKOWRJO8cqj1Tu3EEt6hzu4fQAPRBvxxHZQdZkd6mwQXligX/+NHX1O6xNIalu
         MQuOh7YpZVq5+Sf2MYph/1RL3yR3uW9dG6DLjCFPXVGZgK3HcmIxv7BJYLWsSrgD9fEn
         duoA3RuiuDfps5KzW830vElD8e4DKByvq3qSk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789425037; x=1790029837;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=doHeCbdvroV7mGBSmqv1XRXXxfYTXe+sNzLZzLwqdyM=;
        b=CKHLMYIP9pWxO+7ETC0x1aJZeE1sKKB4Sp/COtIFT6kmSF0o9SjKMEYK2viRwFZmuO
         mvKkTA4yMuUbq6Dzuuqtlnsm6NDXpSkX6whn8LckQVXJNuHhVEarVZV7rxJ3G/6xqGSU
         0jrbY87x8vbJ5EJsz/+0pPWwOkWtXDt56ii+NMZRwkQWSdt7F3HSIcY+t/ibiBt6/3ya
         PjYte7jzlylgBj6dTFeWEqxzw8ybh8VViIbfL7LVpxZLU9cvKzr9B4vXmPoxvnYeSeKp
         j8BBNCnJv/cXsLOIb4w8Up7EMoCOAe5Mg4dwxPky8dwVnIG5xxihDFmPiTrTsome0AX7
         360Q==
X-Forwarded-Encrypted: i=1; AKwUvBym8RiE3/uXygn9H8k8d7vw4EnwaCyPsNWlhBfJEvDiXwOS0PTrnGziunyVfvffmoF2aO1/mG2qI0AXeA==@lists.infradead.org
X-Gm-Message-State: AFuF++kW07+/MRWc8EDgIdPFsG8/S5gcUBb139gtX7tmCrwMX39Fa+yG
	0Zfu17NeZU0wheYbVOpecmk/f1JRm1v4bdLMWe3KSmxWjIhp1M1XbHg3FFlkZ1Oal49bOV3WZzZ
	RIpS3dah5Fw==
X-Gm-Gg: AYBFou01S+YwyIii+xdu9Trz7LzFi8JrA9keoQQfu0cpmkFT2hrzYRHrTTG/fQ9afAl
	cm9wQ1g6TMSvaTBNCYXVEQIL/9AKmsD1DylOatUlk1br+FyQH21qkHFScp5cKLUmAGWc5Vd2p/6
	pohRPN2BaKO9G9NGBRxa5q43DYobSKzp/g5XdT2aTeNSbyN4yF7Ul17w3UJRGx3D1hbiBX0xOOJ
	N8JlQg2L9RHEwEMPaZ2/HkZIoTIq7MUTEMgheWkRHFEY4iW6BLZbybgR28vtb2EBhhZcSvl/oT8
	DqEWtRwg/R655lzj4SOZ1eFpqOF7N94OqjGwQ451MdjjgdOXoUkASiavUpaNs5O8LpNiGiksBZJ
	3pB6OuJpkqYi3lolCB6//UsEOQZtNx6rCj22sA7d+Gsm8JOR4i2t6lat9qtGX/cOUf8whdYd0QI
	q8DVcLk4w/JpsICjFv4s7Uyn4G9cKnpFvtLBxEYerOxQO98xPSz5UiTEFQve6wqLikGgZjH97ug
	tAEKXoAuQjp3kVQLzODtDlM2lTD+3VyOlosWSR1f+hSoo2XnWZaRPn6o/XW
X-Received: by 2002:a17:907:fd17:b0:c26:1648:a06f with SMTP id a640c23a62f3a-c29b8780bafmr256408866b.42.1789425037302;
        Mon, 14 Sep 2026 15:30:37 -0700 (PDT)
Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com. [74.125.228.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966067117sm490423566b.33.2026.09.14.15.30.36
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 15:30:36 -0700 (PDT)
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c294496989aso459142366b.3
        for <linux-riscv@lists.infradead.org>; Mon, 14 Sep 2026 15:30:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByrdwK4rx4wq4cs51VM1qcxUiAz0Qqg9usUUMrsR+w3jeMiBoZHqtYou77Cq3Uazhgy3SO20Skt+/BXpQ==@lists.infradead.org
X-Received: by 2002:a17:907:97c9:b0:c29:4415:2ebb with SMTP id
 a640c23a62f3a-c29b860109bmr315536666b.8.1789425035842; Mon, 14 Sep 2026
 15:30:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <20260914-build-speedup-v2-15-39817ec5db23@kernel.org> <aqhLhVMkNzf_4oJw@jpoimboe>
 <CAHk-=wiB9MX7vBDQ+WHTUVfSYubLhR-PbABewscqTsxRhg-LbQ@mail.gmail.com> <aqhmhmgrnN3Mw8yG@jpoimboe>
In-Reply-To: <aqhmhmgrnN3Mw8yG@jpoimboe>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 14 Sep 2026 15:30:19 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj3BKkCYtmfs5sORF_+Oumv2Gc8D+YxkMp9W2-mvLS=Ug@mail.gmail.com>
X-Gm-Features: AcwNN1UnWAKTndckmaJ94decAtfrWRGA6P58dk0oXtHcS9ajgGc6O7ZKSXjYJOY
Message-ID: <CAHk-=wj3BKkCYtmfs5sORF_+Oumv2Gc8D+YxkMp9W2-mvLS=Ug@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260914_153039_700697_38F8C9D4 
X-CRM114-Status: GOOD (  14.22  )
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

On Mon, 14 Sept 2026 at 15:23, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>
> There might be more efficient ways to structure the considerable amount
> of data, like replacing "struct instruction" with "struct basic_block"
> or so, but it's hard to know whether that would be a net positive.

Yeah, I was thinking that you'd only hash instructions as you find
them if they are obvious "I need this instruction", and then try to
hash them *again* if they are branch targets (and just have a "already
hashed" flag).

That way random number instructions would not be on the hash - unless
they become branch targets.

And you wouldn't ever really have to track any complicated decisions
(like that whole "basic block" thing - I agree that it's painful,
because the shape of a basic block will change over time as you find
branch targets).

But not a big deal. More an idle thought brought on by that other
patch that changed the hash table size, and this discussion that was
talking about the hashing - or not hashing - of sections.

So more of a "if it is easy and straightforward" kind of thing.

             Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
