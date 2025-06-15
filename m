Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C63EBC71135
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Jun 2025 19:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S2HOKY24dJYQAdrpBTaCCelozTHB1dwk/KLqkGpWFtM=; b=vKpmlwjCQNmNVu
	rfmPMj/GcFVXpGOYG6QF2qLtgKVtJTB+hcnI5BkpHUuQzisuI8Cn7iQ7xqW3qN3ImrGKkOH9yCy8M
	9PDuXIKlKR69ccopb/V4HImI5uNspVY2f4xap8PTmybtduwiqAldZoMLsghlqR+ewNx0WX3M5L8wn
	1DepxWkN2IBa82jkQ/EkLqZLp49LISmjn3jkZmTg+rar1Bt7INyzKb4gMdY/9VAjV8HbZFNBWaBYH
	NzdiSyVOZbqrpXs4YIKYxAv+HVII5qmW/YMr2HQ2UU4AxJssRxvLZUSdtecd7p+eCE1h3XaNNZg50
	ib3l6HGmchCSJqc78wrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQtAu-00000002mI3-3DK4;
	Sun, 15 Jun 2025 19:37:52 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQtAr-00000002mHK-3vtD
	for linux-riscv@lists.infradead.org;
	Sun, 15 Jun 2025 19:37:51 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-606c5c9438fso7898811a12.2
        for <linux-riscv@lists.infradead.org>; Sun, 15 Jun 2025 12:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1750016267; x=1750621067; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9Bm1Ypz9xIQ9oSWoxmBY5SZFvMd6ktsJLpK/MNzMMqc=;
        b=D0vObgpwjHMt0Gxsyt4Y5N7jXtY7Gl1hK0LYPnKfBUohU+lKbxIeKH/yQ5LyFWGqYu
         qVTCTzgWng/iW0NXdhMKyEObWcdEc2SfrRePmrWz/52UNZHdDwtRYW/GtxC56m11nZ7s
         JSbMTd9eOBSTSevUlhAkkMjGX2RKZjfoQNQkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750016267; x=1750621067;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Bm1Ypz9xIQ9oSWoxmBY5SZFvMd6ktsJLpK/MNzMMqc=;
        b=FCwitBnOh3H1yXVpIynb+JLSs+F8tudAkj0Enwue9v0a6ZvVj/+FmAVIami8URR6yw
         3gnKKF4W+Zy72hgEPD6lzpuxY0b4v9JW+LD2GDyZlg/K1a2PGd+GKi+ET2FoVt5v70zv
         naVS5pYPWnJfm6GMqG6oXE3ohzC1oEb2BwSnGEw9qJL6n3x8+AoAuPHeBGonp8bw35ye
         rQFhyHuM/an1dbnzITJMOxqD2jchaSrdIoWgvfNxIulalGP4PA2h/MOhOFRU8INWGg+p
         9/K6+o9nTorP8V3DJg3MEiITDlFJ3kVc0uiDu+KbDlrYlrbRY6VDi10880Y56tGs1j+Z
         vZbA==
X-Forwarded-Encrypted: i=1; AJvYcCWAz9XijH8tVFWybG6JfZ/c5Xmg/CzCSLbhllTRMMUmNocA50fxaRAIhoyDSx31BCV+83CEEfd9VUf9Ug==@lists.infradead.org
X-Gm-Message-State: AOJu0YzOLbf53dfcrrBRtn78D7r5JQoTEkCWjsngBQ1UuHoA9zqcwu+g
	af2MixuG8AswLHLkT4gp4rx//lOgaImcv04vedB2s9Y1GfPE3qQfDdB630wLFkKijB6ZYI2A0+p
	eYOkocSA=
X-Gm-Gg: ASbGncs04Bx4EUTWvrbPAjO0RohOiCXqmQaQwT25hw0V53v8LBSASSjD9eH+qf9O7Pc
	dIgYfLA/X6ZbswrfzMKDpzirFnG+VIa8+oeiQb3w0/NSkrzBWi8e1/SRT1mmMIzYCtqiJDkscXE
	9qfDCrpZQAuFWpCyfKwhSvFeUniWoYlybJ5c9JSJREzhtXSfIT0p11xFNf6PWoWBNQV6Vbinl3U
	Oj4jbOEbXmXySo1qKh7leSv+77QaucKdkAVgFnOGeQJWi32yeCHiPb/zkXH8iTNrbhCJgm1u6I0
	htmKE5kiBEPLiVT9AL9xu8hxwaxGlsH2KJcRU4+FtAqJdOx0xkRJKRc+HOdbkRZNrakabJuFHYi
	FeSeUxZmcvYSYqD0Td9SdED1oEv49RsYHZXJX
X-Google-Smtp-Source: AGHT+IH5UeLQz0kG4my/FyTVcaNuLGRO2KTNtXiaLdcb53J3S+odNmS9OReP2JvH38grHvcrlODKtA==
X-Received: by 2002:a17:907:7e98:b0:ade:5ba:40e6 with SMTP id a640c23a62f3a-adfad3137cemr711582366b.18.1750016267415;
        Sun, 15 Jun 2025 12:37:47 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60900cdd4f1sm1955045a12.2.2025.06.15.12.37.46
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Jun 2025 12:37:46 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-60700a745e5so8678184a12.3
        for <linux-riscv@lists.infradead.org>; Sun, 15 Jun 2025 12:37:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVJYrVGP+INHDJYyciyo3xMhDT2PcN4bB+3Il6WrW6/ICKrT56LPpVEn5rPBg7teFjcDJo3p4OPYwjtxg==@lists.infradead.org
X-Received: by 2002:a05:6402:50cc:b0:5f3:26bb:8858 with SMTP id
 4fb4d7f45d1cf-608d09a2d16mr6285703a12.34.1750016266135; Sun, 15 Jun 2025
 12:37:46 -0700 (PDT)
MIME-Version: 1.0
References: <aEjo6YZn59m5FnZ_@gondor.apana.org.au> <20250611033957.GA1484147@sol>
 <aEj8J3ZIYEFp_XT4@gondor.apana.org.au> <20250611035842.GB1484147@sol>
 <20250613053624.GA163131@sol> <aEu5cyDOMcKteW_b@gondor.apana.org.au>
 <20250613055439.GB163131@sol> <aEvmmr0huGGd2Psv@gondor.apana.org.au>
 <20250615031807.GA81869@sol> <CAMj1kXGd93Kg0Vs8ExLhK=fxhRBASU9sOPfgYUogv+rwVqgUsg@mail.gmail.com>
 <20250615184638.GA1480@sol>
In-Reply-To: <20250615184638.GA1480@sol>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 15 Jun 2025 12:37:29 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiAh0fnfm-LomMWDV=OGhCHCp0C_7xZASE_8pZ3ZP0CXg@mail.gmail.com>
X-Gm-Features: AX0GCFsirgA8Ga0u26X0ToUgNd-a86j5gL8Na8fIUJo1Hy2_joO0gogaJwm_iSM
Message-ID: <CAHk-=wiAh0fnfm-LomMWDV=OGhCHCp0C_7xZASE_8pZ3ZP0CXg@mail.gmail.com>
Subject: Re: [PATCH] crypto: ahash - Stop legacy tfms from using the set_virt
 fallback path
To: Eric Biggers <ebiggers@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, x86@kernel.org, Jason@zx2c4.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_123750_259583_6B6DE39C 
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

On Sun, 15 Jun 2025 at 11:47, Eric Biggers <ebiggers@kernel.org> wrote:
>
> So yes, QCE seems to have only one queue, and even that one queue is *much*
> slower than just using the CPU.  It's even slower than the generic C code.

Honestly, I have *NEVER* seen an external crypto accelerator that is
worth using unless it's integrated with the target IO.

Now, it's not my area of expertise either, so there may well be some
random case that I haven't heard about, but the only sensible use-case
I'm aware of is when the network card just does all the offloading and
just does the whole SSL thing (or IPsec or whatever, but if you care
about performance you'd be better off using wireguard and doing it all
on the CPU anyway)

And even then, people tend to not be happy with the results, because
the hardware is too inflexible or too rare.

(Replace "network card" with "disk controller" if that's your thing -
the basic idea is the same: it's worthwhile if it's done natively by
the IO target, not done by some third party accelerator - and while
I'm convinced encryption on the disk controller makes sense, I'm not
sure I'd actually *trust* it from a real cryptographic standpoint if
you really care about it, because some of those are most definitely
black boxes with the trust model seemingly being based on the "Trust
me, Bro" approach to security).

The other case is the "key is physically separate and isn't even under
kernel control at all", but then it's never about performance in the
first place (ie security keys etc).

Even if the hardware crypto engine is fast - and as you see, no they
aren't - any possible performance is absolutely killed by lack of
caches and the IO overhead.

This seems to also be pretty much true of async SMP crypto on the CPU
as well.  You can get better benchmarks by offloading the crypto to
other CPU's, but I'm not convinced it's actually a good trade-off in
reality. The cost of scheduling and just all the overhead of
synchronization is very very real, and the benchmarks where it looks
good tend to be the "we do nothing else, and we don't actually touch
the data anyway, it's just purely about pointless benchmarking".

Just the set-up costs for doing things asynchronously can be higher
than the cost of just doing the operation itself.

             Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
