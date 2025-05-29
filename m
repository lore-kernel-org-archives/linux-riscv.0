Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41107C54FB3
	for <linux-riscv@archiver.kernel.org>; Thu, 29 May 2025 23:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nYKPgr3FDN2VN29mSJOSLkXb6kQjst27oFZi2psGkjI=; b=K0ILTkrsAd0gF7
	tlCKHYWkaZE+J9vFmu2RN7a/nNMblYrvg99QgtbHTowt0dZYu/VrLeuSRfyXFlUN2HxOlG8roct1m
	lMMlHqyrinqWE/qnNee4aX68UuVtgoXJM8EWImZrhCucc8P7M1aklJt493VrJiK4eCtM0Ej+HF3aj
	fYZkfeJtdYQNMyncaMNhBCntFlIGUj3gR/mkQqui9MZVL6to5kndKzgUS3+bCAcNzMmIQMcDP6BPK
	67k8zo2Mcv7zD2efsIPeytz8LdQshxjD3Vhd0BnpT0nZR0oFP/tGa/bYtCiLIi+GObx0oSueAkenb
	DFhTSB2JroYSQ3f6zfug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKn7U-0000000Gm0G-1ui9;
	Thu, 29 May 2025 23:57:08 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKn5L-0000000GlmQ-3eWn
	for linux-riscv@lists.infradead.org;
	Thu, 29 May 2025 23:54:57 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-acae7e7587dso216077266b.2
        for <linux-riscv@lists.infradead.org>; Thu, 29 May 2025 16:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1748562893; x=1749167693; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VCpgeKXbWpRtz3XeS2MBk7nO0oA3f7brSdzLdQTvzhc=;
        b=W/f3EtQxlAUAU9kSP/8LXXhm203Jkqz9RgbNsQEl0eFZ0Kns57MaF/56fVRjjLpJLy
         RyTsdFGqL93+5LhHtEBK+fffVablYPbtRKS8H7otsI+PpDWjliJUY77rpud71J0BEUbE
         l2/0Tbjq8qvEtOvinP7NQSuPPy0e2NrEE0L20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748562893; x=1749167693;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VCpgeKXbWpRtz3XeS2MBk7nO0oA3f7brSdzLdQTvzhc=;
        b=b1CTexgLpz7/Rp9tWX9rJNQEPQU7CFmTv47P50vD/zaqqYPoFS0tva726txAobWyEb
         BV9Fxel6YdmO2MBH0C+Q0E6xj83sMt7fTMrld+EOBMW35QeYVHIYq062oa5+/aboW4IO
         /FdgjQRaf5c/j48tnMZe8AJR+lLIg7uSII99uUIHcXA0VvyYWdcFVLEXE8MxArV1hKy0
         SumM2loFizwsnFVVAyBj8kKDQyUXBvyslFtPpwvt5Dl5mblyAb1R5p6dY0xf51gQHAME
         UqRmA3IcZYZrJFKD09I6EZegYcDmOnKlEkRQb9z3jZviNu8N2AsHtO4FXYkN+H0d79YP
         JQSw==
X-Forwarded-Encrypted: i=1; AJvYcCXTJv1aA8lKBspRrXjbP9vGs+MOCn3zVzDoGRrt6w3+YbYttAmeFbmWK8vwy1hficvQpdQLJYro8Jj3Cg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx97DCuwmH32f2btN1n2Bw+O0EBkMAiAQJuWQYoLSGC59xeDRtM
	f+TfNL0p5MpZrTPFOP/rsP3z54HQqlcsVr69ldEbDhTQL5YhvY6wUc+eqIOjqRceJ/zOQxow2jw
	tAtMk3yc=
X-Gm-Gg: ASbGncvV4ou8Q+kSfNFllVYSzV/5g7yCo6dBt3a9uScA2FGLQfFIFLK/2XD6rM8cslR
	HhfTJ21LC1uLl1yHmZm3STban2kMPfW62hvsWBmmC03ElStigVrmawd1DUwexBS/RetSsOYdgWl
	LGn8c5yQeVlqfJ3PjQEg0L/RwqeMStCrfMMtTqLd7dyiMvAn6Ga9Xvf0RQbvft5Z5xFDxhtSR7y
	KZTZTfhaKXBOKjQ880ge7p6igW+wM398/oTk49MVegAKh0L7b2s4yD4ArMvfgE0m5nLnYwoVHod
	W1gU8uYQmb2ZadJOHzx1cJb8c0rLiPyNTaE1xEEuF0qPTw8fyub92Y2Ijd/HWhusfdPfD6AODr+
	iUDVdEbe9NlBFvdqRyM8zGs8xUQ==
X-Google-Smtp-Source: AGHT+IG1+C6rjMP+qWFZLDcVV8j3BI3F23fugSjeNZl3QWb4SzuBRPD7bS+KRPvdVUKMKWD+pbP6gA==
X-Received: by 2002:a17:906:6a21:b0:ad8:9c97:c2e9 with SMTP id a640c23a62f3a-adb3224582dmr137742266b.1.1748562893494;
        Thu, 29 May 2025 16:54:53 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82d75bsm225753266b.56.2025.05.29.16.54.51
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 16:54:51 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6020ff8d54bso2443875a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 29 May 2025 16:54:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV3Br4f9Tp8ltwqrAftWq5kSdzpGijatgI4JOMFHVupiMP2DTS3W07xrw8izj0pfLiBXmKMCKvxnnAGKA==@lists.infradead.org
X-Received: by 2002:a05:6402:35c6:b0:5f8:357e:bb1 with SMTP id
 4fb4d7f45d1cf-6056e1597eamr926476a12.22.1748562890813; Thu, 29 May 2025
 16:54:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250428170040.423825-1-ebiggers@kernel.org> <20250428170040.423825-9-ebiggers@kernel.org>
 <20250529110526.6d2959a9.alex.williamson@redhat.com> <20250529173702.GA3840196@google.com>
 <CAHk-=whCp-nMWyLxAot4e6yVMCGANTUCWErGfvmwqNkEfTQ=Sw@mail.gmail.com> <20250529211639.GD23614@sol>
In-Reply-To: <20250529211639.GD23614@sol>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 29 May 2025 16:54:34 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh+H-9649NHK5cayNKn0pmReH41rvG6hWee+oposb3EUg@mail.gmail.com>
X-Gm-Features: AX0GCFuuQZJkBnHy-mtAufGSUKbxBrKrMtOhVAT8ZxGCHwWeq3lbFPW0g13cPtE
Message-ID: <CAHk-=wh+H-9649NHK5cayNKn0pmReH41rvG6hWee+oposb3EUg@mail.gmail.com>
Subject: Re: [PATCH v4 08/13] crypto: s390/sha256 - implement library instead
 of shash
To: Eric Biggers <ebiggers@kernel.org>
Cc: Alex Williamson <alex.williamson@redhat.com>, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	sparclinux@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_165455_901870_74BBBDF1 
X-CRM114-Status: GOOD (  18.32  )
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

On Thu, 29 May 2025 at 14:16, Eric Biggers <ebiggers@kernel.org> wrote:
>
> So using crc32c() + ext4 + x86 as an example (but SHA-256 would be very
> similar), the current behavior is that ext4.ko depends on the crc32c_arch()
> symbol.

Yes, I think that's a good example.

I think it's an example of something that "works", but it certainly is
a bit hacky.

Wouldn't it be nicer if just plain "crc32c()" did the right thing,
instead of users having to do strange hacks just to get the optimized
version that they are looking for?

> Does any of the infrastructure to handle "this symbol is in multiple modules and
> they must be loaded in this particular order" actually exist, though?

Hmm. I was sure we already did that for other things, but looking
around, I'm not finding any cases.

Or rather, I _am_ finding cases where we export the same symbol from
different code, but all the ones I found were being careful to not be
active at the same time.

I really thought we had cases where depending on which module you
loaded you got different implementations, but it looks like it either
was some historical thing that no longer exists - or that I need to go
take my meds.

> IMO this sounds questionable compared to just using static keys and/or branches,
> which we'd need anyway to support the non-modular case.

I really wish the non-modular case used static calls, not static keys
like it does now.

In fact, that should work even for modular users.

Of course, not all architectures actually do the optimized thing, and
the generic fallback uses indirect calls through a function pointer,
but hey, if an architecture didn't bother with the rewriting code that
is fixable - if the architecture maintainer cares.

(On some architectures, indirect calls are not noticeably slower than
direct calls - because you have to load the address from some global
pointer area anyway - so not having the rewriting can be a "we don't
need it" thing)

               Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
