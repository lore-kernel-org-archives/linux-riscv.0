Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A38BAC00140
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Aug 2022 13:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VMRNSK8saTdCqhPPqsMb+e/Eyp6F7tfpKoNerZ2L024=; b=WsYDXSH1T1kSby
	D1jtHy+2IrYRCtK75Gg2f1aGu2FulngSjEwOJ8gQymYRQQrw8Zl4+qrhbuc9qnyZakLDdWNArOLZk
	22DgU29GQcWmvtDQNJq32Ko5mabzug/B4YPXYNFmvcWhT1R6tyeAC1oTFILFSnNHnqL6sBOL0P+nC
	equQbySTd6guBpMuSeVaMXf8JklxtCBA04O71cR72eR56wMKa48bQ5yQFN2o2/K+2GtTPnoFiiRhG
	rJTYyRkEc24ppvEQhHs5s6LBZkBdRqUlGXunN/rAgxQ+RDj5Wt7cIjbXa8878dtEpx7TndUxv/rMD
	kkUQIEg8PI7qf8j/l7JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIsDw-00EbKk-0o; Tue, 02 Aug 2022 13:46:16 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIsDk-00EbFj-3x; Tue, 02 Aug 2022 13:46:05 +0000
Received: by mail-io1-xd32.google.com with SMTP id 125so10653341iou.6;
        Tue, 02 Aug 2022 06:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ColewwI6l3g5ZDtLvTS82d/pMaZ2whxLZFnC491Bn6M=;
        b=Ix9fPoJ51D0qSPNpA+0N27SSr+MNMIyYRhiTE7KDWG2BBH2bO6g80DXYnJnms6YJjG
         agUuOKCD9wiLdQ++JXvVGshqkEc8jxhyZXYsdpoauxQCswodvgdOoEDts4s54Ghpbktb
         vUGPGAO5uX2H8URrsKOvTlDlM9wx7V0BdREsaLOQlEg9gcsSoCWN2ZqxBjxNBxXC98n7
         rmdqT/SparDIm/Ml8dTc/TzNdWkvacAdxkfHXMUkpv8D//AosWIR2t3EGy/AaSJxJ8IF
         oB9E+nbhcEuuHe8zonZZK1ucnrxX31t2oWw/hOQxYs7RO/jvYm6dpNY/E1kQfJvrcc6P
         XNEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ColewwI6l3g5ZDtLvTS82d/pMaZ2whxLZFnC491Bn6M=;
        b=bkJDBQRGveRb+nfg95vhF9j/5RX0FTTxj4tOkOqqDuBCzJYp39PNQGx+Gd+IZcyKrX
         I5mH1cEgLuEzEWRChA3fWFm7wZPNW6vyC9O96oZjbRw5LsNa+QhQsZIFVvItdTkTxPYa
         ddwM/9DmJ91bRTF7cO5r4Iy3NxO+PJ3UGsnZhoj/mEYhbrSOJngirLovgjHK4w2VzDWL
         4WnPtvDAZPf/8AseGl6q7WUjhJCBX4OsqUoBd0Gw+toFYmo7FqUH7XFzYks+EeEgcSXM
         V90NcNrGRMACaKbOF9Bm0JIis6wk2zCu2KwMKLZ/Pa3RvpoZ1M83e9mV2ZFdIwINPxvx
         Hguw==
X-Gm-Message-State: AJIora+Kgsy9q7jtrv2k0I+p0PnKHXyjeO0RVr5WndkW34vXZAYAASYH
	LizlsVf5DxuJXBwpkr67pCcuFHb3IdMLG/qS6PY=
X-Google-Smtp-Source: AGRyM1uCQS8jcQ0eTYdpzXJtMC+GsUZV7viJg2lh4yuiqsyHiT1OZ2XaNk9WVUmOTbXEr/cMDTnXeLewlffITgyBAM4=
X-Received: by 2002:a05:6638:dd1:b0:341:5666:dd0a with SMTP id
 m17-20020a0566380dd100b003415666dd0amr8504893jaj.199.1659447961680; Tue, 02
 Aug 2022 06:46:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220802015052.10452-1-ojeda@kernel.org> <YukYByl76DKqa+iD@casper.infradead.org>
In-Reply-To: <YukYByl76DKqa+iD@casper.infradead.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 2 Aug 2022 15:45:50 +0200
Message-ID: <CANiq72k7JKqq5-8Nqf3Q2r2t_sAffC8g86A+v8yBc=W-1--_Tg@mail.gmail.com>
Subject: Re: [PATCH v8 00/31] Rust support
To: Matthew Wilcox <willy@infradead.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jarkko Sakkinen <jarkko@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-um@lists.infradead.org, live-patching@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220802_064604_197968_81C1D5C5 
X-CRM114-Status: GOOD (  16.45  )
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

Hi Willy,

On Tue, Aug 2, 2022 at 2:26 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> None of this (afaict) has been discussed on linux-fsdevel.  And I may
> have missed somethiing, but I don't see the fs module in this series
> of patches.  Could linux-fsdevel be cc'd on the development of Rust
> support for filesystems in the future?

In order to provide example drivers and kernel modules, we need to
have some safe abstractions for them, thus we are adding some as we
need them.

More importantly, the abstractions also serve as a showcase of how
they may be written in the future if Rust support is merged.

This does not mean these abstractions are a final design or that we
plan to develop them independently of subsystem maintainers. In fact,
we would prefer the opposite: in the future, when the support is
merged and more people start having more experience with Rust, we hope
that the respective kernel maintainers start developing and
maintaining the abstractions themselves.

But we have to start somewhere, and at least provide enough examples
to serve as guidance and to show that it is actually possible to write
abstractions that restrict the amount of unsafe code.

And, of course, if you are already interested in developing them, that
would be actually great and we would love your input and/or that you
join us.

As for the `fs` module, I see in lore 2 patches didn't make it
through, but I didn't get a bounce (I do get bounces for the
rust-for-linux ML, but I was told that was fine as long as LKML got
them). Sorry about that... I will ask what to do.

Meanwhile, you can see the patches in this branch:

    https://github.com/Rust-for-Linux/linux.git rust-next

Cheers,
Miguel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
