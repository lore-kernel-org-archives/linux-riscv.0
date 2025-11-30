Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 489E6CFD376
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Nov 2025 11:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=anXiC75qYjddInXHIvKdrmu3ZWFEkoixTOYFFsQTXJY=; b=h12JgEZMgU7BU1
	FKJBpX5X7cUIH3sc2AJ7PGdpWlTeESqdt3yt4PtS28Byqg0WKSvyF3sr5K6e2q3qSuN+YEDy4M5Ap
	PGqPf/EYm2K4kQLqLOPJ4PYxtT13/wlmt/6+0gLTKjHNlc7VskJjhS5rvUvg2tMw+F+0SsBYEgZC5
	RUsTwvSmdLYr4TtxLol7kKdZ2ij3SDOrEKTYZ1bp2juoqrYWIEdmTR/fnd6M/mWy2O7SWwD15HyOZ
	gdDhb7AhQySNLxP2GlKZDv5p/acmD05xl9F4ROg/ROluO6wuvBEA4GNGxR8LMXr7tGcTStXMEcqb7
	UaaxAJhJCYhb2Qs14acw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPfA7-00000002EPm-05dr;
	Sun, 30 Nov 2025 11:00:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPfA5-00000002EPe-0w9G
	for linux-riscv@lists.infradead.org;
	Sun, 30 Nov 2025 11:00:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CB1AA6017E
	for <linux-riscv@lists.infradead.org>; Sun, 30 Nov 2025 11:00:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49E92C19425
	for <linux-riscv@lists.infradead.org>; Sun, 30 Nov 2025 11:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764500411;
	bh=HcUSOr8pFH4bogJkhQNF+P8ZsaGFmP+aOBXx0g7EPSc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GRxq55PcF8BjjIKQg260KKv10ONwrz4WHdb0xp9lPpnGTZRzK3l8OHvMzpUmRZyLR
	 HfQ7IhDALrqMvTCiDxPUjlEjYHWL2cQDeKx1/YrorpFKeHnwPVBeqTcxgRVNtnm6ND
	 8/4PM+oD+UwbnXwbEhQ34xYn7YFi2IZifej7HvyXdBKn7fBJHJbgRUcB7DE4VEhSCi
	 mmpK7YIgGxMdAY7XTUBi00kWj/GkBvogvQVlAE12wXO5VeeHFyaE7QxIgHtXnU4pdD
	 1YE2x6d6y66MABP2zI2uVBXyf+Gs6E4IcNqpIEZMW6sXSrf5rZDHPYFJnMqpLPYXDk
	 gL+xb80EFmAkw==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59445ee9738so2595491e87.3
        for <linux-riscv@lists.infradead.org>; Sun, 30 Nov 2025 03:00:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWSY5ZuwMcG1bw+txTOOCYiTMKv64auCISa9EajRIg5VdzQNUEbQw4fo6/Jm1FuvY7idQ+SL3bxk4awYQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyCq7U74aaYylfXvkWg/uAPf/cwSbhJMJlGYqtZ1f7sOlDx1um5
	yzznmgcqzm+0TOKV7Io/ihx9j76sapwGaNeJooO3hNeSlMK5mopBMOEzobgGCU1ZNXKBNiPV2WW
	jKM4SVr0MQhpPP9wx8M/dm9jobj3Vj18=
X-Google-Smtp-Source: AGHT+IGnO6dzAJUT6KEbi1gvwpCyJ2aAu1tioQuHgoyT+Xl3tSHy8MSn/M+kly9aF3p55g1q1Jo0H+JQ11a6usKg+84=
X-Received: by 2002:a05:6512:400c:b0:57b:7c83:d33b with SMTP id
 2adb3069b0e04-596a3eebe6emr11828773e87.47.1764500409472; Sun, 30 Nov 2025
 03:00:09 -0800 (PST)
MIME-Version: 1.0
References: <b3cfcdac-0337-4db0-a611-258f2868855f@iscas.ac.cn>
In-Reply-To: <b3cfcdac-0337-4db0-a611-258f2868855f@iscas.ac.cn>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sun, 30 Nov 2025 11:59:58 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHesHJ2oFzGPewp2V=rA0-BU2Y_PffuDDhxioftOKZYHg@mail.gmail.com>
X-Gm-Features: AWmQ_blFeYmAOJ2_ZzYIefdJJ1xBVOENLu514PKVIHtnJT_go-rPKsUWnojoXbc
Message-ID: <CAMj1kXHesHJ2oFzGPewp2V=rA0-BU2Y_PffuDDhxioftOKZYHg@mail.gmail.com>
Subject: Re: lib/crypto: riscv: crypto_zvkb crashes on selftest if no
 misaligned vector support
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Jerry Shih <jerry.shih@sifive.com>, Eric Biggers <ebiggers@kernel.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Alexandre Ghiti <alex@ghiti.fr>, "Martin K. Petersen" <martin.petersen@oracle.com>, Han Gao <gaohan@iscas.ac.cn>, 
	linux-crypto@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
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

On Sun, 30 Nov 2025 at 10:13, Vivian Wang <wangruikang@iscas.ac.cn> wrote:
>
> Hi,
>
> We ran into a problem with chacha_zvkb, where having:
>
> - OpenSBI 1.7+ (for FWFT support)
> - CRYPTO_CHACHA20POLY1305=y and CRYPTO_SELFTESTS=y (and deps, of course)
> - Hardware with Zvkb support
> - Hardware *without* misaligned vector load/store support
>
> Leads to a crash on boot during selftest on a vlsseg8e32.v instruction,
> because it requires 4-byte alignment of the buffers.
>
> OpenSBI by default emulates vector misaligned operations, however Linux
> explicitly disables it with SBI FWFT while not providing vector
> misaligned emulation of its own.
>
> This can be reproduced by running everything in Spike without
> --misaligned, and is reproducible on stable 6.17.9, 6.18-rc1 and
> 6.18-rc7. See log at the end. Note that I had to fix chacha_zvkb
> somewhat to have it retain a frame pointer to get a stack trace - patch
> will be sent later.
>
> Setting cra_alignmask to 3 for everything in crypto/chacha.c "fixes"
> this, but there seems to be no obvious way to say "if use_zvkb then
> cra_alignmask = 3", and, not being familiar with the crypto API stuff, I
> can't figure out a good way to say "if riscv then cra_alignmask = 3" either.
>
> AFAICT, this problem was missed from the very start since commit
> bb54668837a0 ("crypto: riscv - add vector crypto accelerated ChaCha20").
>
> Please advise.
>

I'd suggest to only enable this version of the code if both Zicclsm
and Zvkb are supported (assuming that Zicclsm is the extension that
would result in these misaligned accesses to be permitted).

Playing with the cra_alignmask is likely insufficient, because it does
not fix the use cases that call the library interface directly.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
