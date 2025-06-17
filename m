Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34032C71157
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jun 2025 21:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7kky862edrUhsBuVQm2ha8mzVFRjtyRRsSDgVTZMy+U=; b=eeTHeJLQT5/i3j
	qT3R7Fjfc79mdsYiJ5D3328KP1KnRJ/fM8PfYhMKESPNm35QXijwqkfhTRzQP3DZXhptu7OIPMyBC
	iOKDDnJ7ZcfIbHI0qQcNWUaSU8dVWbQ109IxH1OGtXeroyA8yNoLlwPnZhwbbgLVKfOhDDsVW+JB/
	F3ABHTFMg3YnCJFPQcegDsKNCkS3GKI5mgfsesYSZCreyQGEOFFi13JdctEzzyPWzP4UDCO0quQrD
	3MurJ+mi+QX6xjeb9d6lN4/xG+pBtWcRQHhJ6H2VVn5Guq4WsPsg7OpDxRH4Qf6KE+yvWFG9bu3e0
	HrXNhYnJrdRQzQESoDHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRdcj-00000008Pdb-0zWe;
	Tue, 17 Jun 2025 21:13:41 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRdZj-00000008PCl-2HRf
	for linux-riscv@lists.infradead.org;
	Tue, 17 Jun 2025 21:10:36 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-6071ac9dc3eso10773322a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 17 Jun 2025 14:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1750194633; x=1750799433; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NscEjg9Y1LWinfHLpsahI5dfBkkxck14FsEzSEH/mHM=;
        b=AWMA9lnHzQPplTC9N4ZVAQ6kTMfjxLIaJ2iIN8Q/At378KesXxeQy0gOHRnfSPQEVo
         /Ox3oXUb5XC1HN3l4z1yOfc5k4n0bM5aL7eWrl48fFmazb35PGtLo2XsVrJi28+J+Y0k
         K21B2aRZHqA4NwCF/vdtRsoEBQstWQKcqjRGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750194633; x=1750799433;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NscEjg9Y1LWinfHLpsahI5dfBkkxck14FsEzSEH/mHM=;
        b=nwdXuP3sQQYogc+DDurC0xfkC710OHZ0pyQTBtUf+VdZmoG2wexUCsv7ihivNTl4sP
         7ggHMkBH46josv+jbk1QYUsECAekoa6dLdsYJMPCvpjqEk1jX3MO8BhpfwxFhC/Vtkc9
         j9ejn54vx4Ul/pUYMlsvTjUcKhGHH2DoaP7aS/ZsUrAcoxscXz6xacihBX8JgyclNo1p
         aDuIPJBnEfMA1e+JBYh6OhFR4zugom76T+LNeWcTVNPH41qTzg+mpwBCg/QpZmt+AUAA
         fq+6w7VdI/0+xWZDP07TNyfcq8lbx00ZRlIeYupjKkt+16o6yFBoPaqXq++W610UtADO
         +anQ==
X-Forwarded-Encrypted: i=1; AJvYcCVa9R9tydEJaljRtrOL5YTi8ULPlu3j+6VGh1dzjfWpZU1aXYtPNC949rdwJ50ISRLk3HdYhNhKJR9X9A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy80fL8Q2cVXsK+bKCw6s68Rg2RrX+rkGPqCgiei3ljnp5n73Qs
	UKz03ZKbXgWPcqyw5iRJzRxanUq9AQaCMVATNmNKZdH6PWAGbIXhWQdlNh+AQaRSaqMA+Lg5InH
	AWpJXg4Q=
X-Gm-Gg: ASbGncsI6uA2LDPG52GkOtdbpCe5pSK73Z2cnpzvo/MO0Q9EGBGW8WULq0n9ywESj9J
	nRoMFJ3nQwoncX4FFkKpoxAuo5J5LgcGlV2E2UtX7UdJoahwRNFEonrzjuIrJHV3+Ar8JIVBA4g
	JZhFXpwsRQzk+tuLhxAGc6zKRnysQkalcunbW14LiNB2u+qiR0Rv5TFWYDqYtRnkLRJNyJZn2Wk
	YqCyaO1BVLP1t5nzVawglGe/IAtt8gIhLUH1L9O9tgExefqhOpfGtfWhSzescSUacRjgoAXwc2v
	Ro88ofHZgHTrkgfe7m345XHzeJGUraisg+VMb5somFh3snG1zsgTipcPWuRKkfg28MJUaq0Xk/y
	m9inm410HqQEzi/Qa8XP8lpz2blT3Hef06iG4
X-Google-Smtp-Source: AGHT+IEboTZgJDjss15Cepndo/s0Ehozstux+xENEAKmokyHP303blcO1c9h5G2yr4zRE+rn9CAjYw==
X-Received: by 2002:a05:6402:42c3:b0:604:e602:779a with SMTP id 4fb4d7f45d1cf-608d097ab9fmr14399012a12.28.1750194633332;
        Tue, 17 Jun 2025 14:10:33 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6095b1def4asm3912125a12.14.2025.06.17.14.10.32
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 14:10:32 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-605b9488c28so11911201a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 17 Jun 2025 14:10:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXB7FyTPyYl7e9xVuvpH6W5Rdw5RRncxT0rW3Qwwp3dIjcYY9pLVuavDj/ZeehvvbWxzv9YTVKFab44cw==@lists.infradead.org
X-Received: by 2002:a05:6402:5188:b0:607:f55d:7c56 with SMTP id
 4fb4d7f45d1cf-608d097a0a3mr14798722a12.25.1750194632040; Tue, 17 Jun 2025
 14:10:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250616014019.415791-1-ebiggers@kernel.org> <20250617060523.GH8289@sol>
 <CAHk-=wi5d4K+sF2L=tuRW6AopVxO1DDXzstMQaECmU2QHN13KA@mail.gmail.com>
 <20250617192212.GA1365424@google.com> <CAHk-=wiB6XYBt81zpebysAoya4T-YiiZEmW_7+TtoA=FSCA4XQ@mail.gmail.com>
 <20250617195858.GA1288@sol> <CAHk-=whJjS_wfxCDhkj2fNp1XPAbxDDdNwF1iqZbamZumBmZPg@mail.gmail.com>
 <20250617203726.GC1288@sol>
In-Reply-To: <20250617203726.GC1288@sol>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 17 Jun 2025 14:10:15 -0700
X-Gmail-Original-Message-ID: <CAHk-=whLENPVgWtHg5jt42he8Eb2pFzZngbvfSWXUmq64cyaAw@mail.gmail.com>
X-Gm-Features: AX0GCFteh8AxHdG-O3SktB-Vd7hTjMUC_EBJsHwrbakY8eEhqvV4OBO-zVcDyV4
Message-ID: <CAHk-=whLENPVgWtHg5jt42he8Eb2pFzZngbvfSWXUmq64cyaAw@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] SHA-512 library functions
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_141035_616450_6BE2E5B2 
X-CRM114-Status: GOOD (  13.84  )
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

On Tue, 17 Jun 2025 at 13:37, Eric Biggers <ebiggers@kernel.org> wrote:
>
> Okay.  For now I'll keep the test commits last and plan for a separate pull
> request with them, based on the first.  I fear I'll quickly run into
> interdependencies, in which case I'll need to fall back to "one pull request and
> spell things out very clearly".  But I'll try it.

Thanks.

Note that this "split it out" is really _only_ for when there's big
code movement and re-organization like this - it's certainly not a
general thing.

So you don't need to feel like I'm going to ask you to jump through
hoops in general for normal crypto library updates, this is really
only for these kinds of initial "big code movement" things.

> Just so it's clear, this is the diffstat of this patchset broken down by
> non-test code (patches 1-3 and 6-17) and tests (4-5):
>
>     Non-test:
>          65 files changed, 1524 insertions(+), 1756 deletions(-)
>
>     Test:
>          14 files changed, 2488 insertions(+)

Looks good. That's the kind of diffstat that makes me happy to pull:
the first one removes move code than it adds, and the second one very
clearly just adds tests.

So yes, this is the kind of thing that makes my life easy..

> Note that the non-test part includes kerneldoc comments.  I'll assume you aren't
> going to insist on those being in a separate "documentation" pull request...

Naah, they're relatively tiny, and don't skew the diffstat in huge ways.

             Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
