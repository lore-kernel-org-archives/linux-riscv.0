Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B324E83837
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Feb 2026 21:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=37INcdQxlNwrTfITzB9+r7843YyrEMkykCEi0lfwUw8=; b=AMUXejj/kldXQM
	k2+KkAyTvtbXz7aLQoU/SMT0nIuwfoW2rzWZmbmo2seiPqoYK2xoRk35IzQE8kiA1ypRb8rAOrL5E
	plZ7TxfKI8ZvV87/44oH7i9rQ4FqaJ5kvNmEONrVXiqRJyZyOvSyLry3uEYVKTXJSVhiSJadCbQB9
	9YVFtI/uN7aImlmjDagCCJJGiatkaXC7o8d3n1/biqAxFOcjTlXg4LFQM9UbjsFGFIjaK1o3SPOpZ
	R53yNNQm1x18g/ac7TYX4kDzq2mRdpEN3YG5rVn9Uh6SI4LO1wQyBjsfsLGHiyBFsydlyxnWcnJh/
	+SNtxtHpH+l1rh2NGddw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs6Z2-00000007JoS-3308;
	Mon, 16 Feb 2026 21:55:32 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs6Z0-00000007Jnj-1eVa
	for linux-riscv@lists.infradead.org;
	Mon, 16 Feb 2026 21:55:31 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-658b6757f7fso6958611a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 16 Feb 2026 13:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1771278928; x=1771883728; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EzboGAnIMK3FJgMc3HSFX0DsxdeJJrCNdZEcLcC7Khw=;
        b=HsqcSjdQrHCbMtN7HKT6cOQFREnIpDFZfI62HPzG+7e/GykWabJmu4UYPaRWk4kigh
         2f2XSxJOiF/HuYU7syrNSc36G60wJubBlD+zMpMSCuCk5/51UZ9okLWIyvCJNOtZyzeh
         vu1A76pb1Qqy2qfef7xCSk5txI2E6UEzHZ4vo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771278928; x=1771883728;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EzboGAnIMK3FJgMc3HSFX0DsxdeJJrCNdZEcLcC7Khw=;
        b=lcx7d5HxwNX/QtjzoXb68WtX+HDmHbVPySt3KOvI5QU0s32/eh7xCGsj3ZY8QpwUHp
         fffZOs7x6m6lk8Jk+HomRvf3CKgLjmdI6lgD/uC9W+y0U82vI2tSxlPj4gZy3NXa0WZt
         vwpbvmwVRffi3cXiWHrMkgtIKC+c/mfdVw5U9JMJM7ZIdHbhRK/5dRy/1+UTNzO5NDAz
         fbKN0dI6dPFjFNSxljHH/8xB9N7JfF5d4ypH5XXSQvK1IFc7J7Y6bXYJyOKibCD0gp6G
         YPw3VWnzpYODsB5jyZzAzINACVTEmzqQvx487ENY4flbQ30h00w4UH5AAoiHugryQAc1
         xlgw==
X-Forwarded-Encrypted: i=1; AJvYcCXnEXgha5OM3d1gdfaLLEwV9QeRbv8cjAL6wvm7A0VIWXgqWu6LW48tM1YY0KqxLZC5/R/ADwROk5n+6Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwI7ZmIywicZl4paom7eng6gWkaiEMJeWhfmIFP0MQPJ+te/9bk
	BgHQ80PEgOZUE6H5UicP5kRxLLPCJRnEkPb+CZlPNuWcWGlW8PygB2rqTNwIg4PcfsDgUGsQm6c
	8rwY0LA9ysw==
X-Gm-Gg: AZuq6aJy2hQw4a48I17kdzRGUNdZEwK8LybklOjExG4CE2wKUbzOn1bAFC16va00IbK
	J1EE/oC+5c9ZCybQqNyiYKFFApBm9nklRwq3/HHLPkoy3pPCiU1t/J5/bwcBhsII46sRoxMB1TA
	daLwKRG/Kr9nHDZoOpOf3rby6aMVAQtqcCJktCWzHUMUh5rBfMmm9Q89NiCRu4n8jBqEWYiuP3A
	d+18i9MTX0DmK7qAmJuDXgrMrzd48nNs+XMrW4QGaqgT9tgGEHtaTTRj1Ax3oBdkDKVGYll2CYO
	Zg9rj87Yg64cZ2plDrWtdQKP7pVvMqPHuiRifLXAv7td14PEhiVePU4MWzIM3HMCzaNHpNDWePk
	bSDbh9EN1TEEhl+VaP+2kqBvSPURQ1mfjSJhlTQPQ2azsaTZ+Rmp0QV/ddCvlp1OzBfOjxzmrv9
	IWTWn5wHfhQk1ZPoAHW0p2a+alAF2DLhedytLsbam+9JDf3E1jKeZL9EEM7dYG/QgG3mGwNUXq
X-Received: by 2002:a05:6402:27c8:b0:65c:3383:927c with SMTP id 4fb4d7f45d1cf-65c338399a0mr1314587a12.5.1771278928189;
        Mon, 16 Feb 2026 13:55:28 -0800 (PST)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad3e39bfsm2220318a12.22.2026.02.16.13.55.27
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 13:55:27 -0800 (PST)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b885e8c6727so559877866b.1
        for <linux-riscv@lists.infradead.org>; Mon, 16 Feb 2026 13:55:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUBl6BGJcaXEz9/syPYNjVBX5bCY7Mvch7kH/ysDzBa37xuBa14OjYMrX3arpzw+gEPGS/aRR3OkAVhoQ==@lists.infradead.org
X-Received: by 2002:a17:907:845:b0:b88:3877:d922 with SMTP id
 a640c23a62f3a-b8fc053d56emr493864866b.10.1771278927192; Mon, 16 Feb 2026
 13:55:27 -0800 (PST)
MIME-Version: 1.0
References: <c554c02e-a791-5c4a-d329-7632de7a194d@kernel.org>
 <CAHk-=whUXMRa3py11kpZiDMau8uauiwZCok2UMQAecTshfTrVA@mail.gmail.com>
 <2248971d-d69c-65fb-93b4-10f0d7d8bbad@kernel.org> <b2aae256-7d3c-447d-aa8b-5904848cff6a@sirena.org.uk>
In-Reply-To: <b2aae256-7d3c-447d-aa8b-5904848cff6a@sirena.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 16 Feb 2026 13:55:11 -0800
X-Gmail-Original-Message-ID: <CAHk-=whfQXKr3Sgoc7R1tPWFD3A1gEhUh=j7GGwz8yg_EQVhNA@mail.gmail.com>
X-Gm-Features: AaiRm50gwJl05eeU05fClghjglE3cAtVJtC75LdTLG_kyNwb2elwoUVktGjgYzY
Message-ID: <CAHk-=whfQXKr3Sgoc7R1tPWFD3A1gEhUh=j7GGwz8yg_EQVhNA@mail.gmail.com>
Subject: Re: [GIT PULL] RISC-V updates for v7.0
To: Mark Brown <broonie@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, debug@rivosinc.com, zong.li@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_135530_459057_7361C202 
X-CRM114-Status: GOOD (  10.20  )
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

On Mon, 16 Feb 2026 at 06:20, Mark Brown <broonie@kernel.org> wrote:
>
> If that's the part I think it is it's following the same pattern as
> shadow stacks, originally inherited from x86 then generalised.

That makes sense. I was looking at the speculation control ones -
which I honestly think are done much better in that they are a bit
more future-proof and won't need yet another random prctl just because
some architecture comes up with a slight variation on a theme.

They don't technically do the locking (the speculation control has a
different kind of locking), but because of how they do things - by
having separate "which control do you want to change", and "how do you
want to change it", it would actually be very natural to make "lock
it" just another thing.

So I actually wish we didn't have that shadow stack prctl - or this
new one - at all, and they'd just use the speculation mitigation
pattern instead.

I think the shadow stack case is probably too late to fix and people
presumably already use it, but maybe it's not too late to fix this new
control flow integrity case?

                 Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
