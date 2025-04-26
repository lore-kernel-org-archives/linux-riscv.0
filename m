Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7AD6C369CB
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Apr 2025 15:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kGMrSjv4iN2Wq2pU+aCJA4w3f6r4nNIKO7RVyr1wToM=; b=CrT/kWC76QRCDk
	5/sSRul4IElQMhMQ2tl3jInSuNfIX/1d4UTXt6Kw1SQ6O4scU4pHPMDEKJi0Iv3StbOB/eNiqrGm5
	zi2D4nbHV8shT0MN5g3b+fFC6z7GMUrZuuEzSyvwFyxtDO15qRywDy1rFtb63OnB6jCUhMTNMLq9n
	T/zV/PWS5/WwCBqBp/MRPrPYzOFpJQ/1m5qmk7dx6d1zjdNrJQBmTMFZ/Z9NTTL6hnOuZm0LFPcqv
	zB88Lg3fa0qIlfg1d9TSa/Cq0OhjiONVixmVemFF3Fdx49pqpDNrMjBJKhSuGKeMxNE2R3ITVM72i
	MB+m5fdctuw9LGVrREOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8hHv-00000002DYO-2VK9;
	Sat, 26 Apr 2025 15:17:55 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8hHt-00000002DXm-3gQ3
	for linux-riscv@lists.infradead.org;
	Sat, 26 Apr 2025 15:17:55 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5e6f4b3ebe5so6003290a12.0
        for <linux-riscv@lists.infradead.org>; Sat, 26 Apr 2025 08:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745680672; x=1746285472; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BNlY1Kyobnrt/7plmlszUhTRPyZa/aNAr5+UYAUEWpg=;
        b=WGHdw1eVuc4kLjaov6/4bYt5I6oR0CGqhIIacvpTsSffUfBvTvBFH19VKiZdZfqnSU
         rj6kFd5G1D2AS65lvNOBth8f2g0OKudvMUIBjUsbcCXPSCumxGliITfdQGWFvsj6UpzA
         DCJTdpirHNmP6LcXhrlT3NrOuooIG7fs/SA7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745680672; x=1746285472;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BNlY1Kyobnrt/7plmlszUhTRPyZa/aNAr5+UYAUEWpg=;
        b=nvcQcnCkZmRRR25K4UlxSP49uv/U+53omdBjTF3njtHIBZAahBiYReXNDSuvObyOyo
         XfXHIvGE0J7tsPVLiUGMB6Sw/sQfDlE4dQ6xYwc+4KZEXOnZAw+cGpwMcX/9HY+Tvc0g
         GkGhHADGYfciQ+c4bz8m539P9iSnm1hypzKTMLHgDpew7jHug2NMeof5lVUsnNFkoszh
         0JnJ65ezlJ0RipRuLtMGHL6p2n1/kTh2qa6AuzPfq/pr4ok3QyR6rpecXbhOJMV5wJmN
         FmMcRozF1LV2r8K1dcRN0W3lpexK6OQNhWtlA0cpXsvdeZ2SMld4aonToC88pZ/6FVVd
         UcoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlahcP2IO6ox8KlV4LiXwZ/GvkMsJx47k1487EkshSWHPpblWNXwsdyUqL1iMQxhC33LlHFumEfYZIFQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyhLe5DeGtDCWxVJoLGBmJpDj+NW0sWHpw+SzKlxX7DSyaDfgt8
	2vc83NrBV1J32cZLqef7C6fCWYCBiyx7SUX+IkqEIstCpaPThZ8PLWHWZcAQlIPkV71UfHBAFza
	7TNg=
X-Gm-Gg: ASbGnct0lnGwC0oL6V+jFU+4bp6XRQF+nAw7iDc1shCsZGlkgA1F2EbUUfYE01GArv5
	V4lxsxEMe3pJMR694tv5ng6jBdY8qhYhwlHw9uZ7lvC5gtgzCDkMn8xP3skwm1wqvaTiGaDIdnb
	HcDsHnyBSquqAIZ7/VgUtpp1GCCZC+foOsDENe3eAuIf675H+wdy8jMReoaf54IojwWnqbYGZzd
	7UKgBfVErdUhDm590K43ZnLsX4GybyrPjf1lI53pRaiunzUrM42VEjWCIdHDSvNdMf5SuQsPFsg
	46jfGMexczRCOy2czI4SQhQAJMr1w5CpCRJgvGaacXPESeazlflWkwggeQL8LwHDB6WqxuDN/4f
	cRu54zjTDMLibThBghCrOneI6ww==
X-Google-Smtp-Source: AGHT+IHSYizez7xOGk4ynPDaae9t0UIrx7nESAtkT37w78diwqmLHjy9myejIVC7AvbEx8rHUnC4pQ==
X-Received: by 2002:a05:6402:26cf:b0:5e5:d9e5:c4d7 with SMTP id 4fb4d7f45d1cf-5f73983c970mr2820830a12.28.1745680671964;
        Sat, 26 Apr 2025 08:17:51 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f703831dc3sm2758855a12.67.2025.04.26.08.17.51
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 08:17:51 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e6f4b3ebe5so6003269a12.0
        for <linux-riscv@lists.infradead.org>; Sat, 26 Apr 2025 08:17:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVZ8igRCJI3w/7I/EwGrR6pes9Je7/UmBickt5XpvCK8UZgKRUMxX8eDRo3m5iyIEWmyf91jhas5MyDfg==@lists.infradead.org
X-Received: by 2002:a17:907:7e95:b0:ac3:8895:2776 with SMTP id
 a640c23a62f3a-ace848c0439mr259814066b.5.1745680670908; Sat, 26 Apr 2025
 08:17:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250426065041.1551914-1-ebiggers@kernel.org>
In-Reply-To: <20250426065041.1551914-1-ebiggers@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 26 Apr 2025 08:17:34 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg_ArMFL9E9SehR2Z3pfV5QPut0XwbJs9mYWkRvcZcSRw@mail.gmail.com>
X-Gm-Features: ATxdqUFbLPq86s-2TFMi3kWckNkp7TWtoBPlYGSlRtiuXxSXCOJQKui7bzYM-j0
Message-ID: <CAHk-=wg_ArMFL9E9SehR2Z3pfV5QPut0XwbJs9mYWkRvcZcSRw@mail.gmail.com>
Subject: Re: [PATCH 00/13] Architecture-optimized SHA-256 library API
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org, 
	linux-s390@vger.kernel.org, x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_081754_058961_C4DE784A 
X-CRM114-Status: UNSURE (   8.48  )
X-CRM114-Notice: Please train this message.
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

On Fri, 25 Apr 2025 at 23:51, Eric Biggers <ebiggers@kernel.org> wrote:
>
> Following the example of several other algorithms (e.g. CRC32, ChaCha,
> Poly1305, BLAKE2s), this series refactors the kernel's existing
> architecture-optimized SHA-256 code to be available via the library API,
> instead of just via the crypto_shash API as it was before.  It also
> reimplements the SHA-256 crypto_shash API on top of the library API.

Well, this certainly looks a lot simpler, and avoids the duplicated
crypto glue setup for each architecture.

So this very much seems to be the RightThing(tm) to do.

               Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
