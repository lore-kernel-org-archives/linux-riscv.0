Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED68C5AD49
	for <linux-riscv@archiver.kernel.org>; Thu, 29 May 2025 20:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O4buJAy7PM8TJnDYDUBpOVfT1et8ry2HwQjwHtVm9ec=; b=R+sFm4XgCUig4P
	aox/82DQrrkbkNqfxTnly80Dy7eJbORYMODyBoj21SKlJKSXf95ise/TaoXfqNGm7nUnVWYJuoyeR
	XkficXmJdoWwLcWnQyPnrcY2bldUXF12jFN1Q74rJxtCshOYWsa7LjXg9x5eUyO/Un16RzqjYYunG
	PPG42REXNYPGX6R+TvDn25lqQavSicvBhj2cjhPkYJACLb/xFRaZYL9ekc57oh01yoxKfrLc8jC1c
	ZfUZe+uNT5TtO43dkeh14kR9ua0cMaZKAFOTFPN/4mEM31oGObAH2kcIn9hDDwkuVnO4+3yDi5Igb
	whdd/GmWA/V2CaXcvn7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKjeP-0000000GTmq-3DhB;
	Thu, 29 May 2025 20:14:53 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKjeN-0000000GTmA-1hsn
	for linux-riscv@lists.infradead.org;
	Thu, 29 May 2025 20:14:52 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-ad89ee255easo231588266b.3
        for <linux-riscv@lists.infradead.org>; Thu, 29 May 2025 13:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1748549689; x=1749154489; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HVSRhT5MS1pvdu2dqLDEs9T4cWr5CB+FRQ66tAe+RVE=;
        b=KLXI5KNDVpVdaWJ+1MWCd1yH34gV9rdyVyz0l81LDHvGBTznz/ZG81ajC1xgHt+06J
         8eQlKJorylEHLubJitLb9GG9+mbvRreNoicQCtmI6M3Oi7QfLYOvtGyYDzosf2Trh6EO
         MXy5sMRTjrjB/BGTy4dUR/9myj/3WPRZL/wdk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748549689; x=1749154489;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HVSRhT5MS1pvdu2dqLDEs9T4cWr5CB+FRQ66tAe+RVE=;
        b=kNKQ/lpv2UFj3+BmK8zn3bcSFmLuqK/GPDDcnkZ/5P9T7jZWTNulOO4eZyz/P/ZC4+
         I4Pcc2IucGyACA9ZU3F5OmAInrrxnDoeuH56E8oQ7MMv+EmfbK6mbmuHQatqIzv1OAE3
         E7dpvObXn29vYGbqsoTqFodGBS8NGwrEfyGwMJJe1CIjyTH9B1g2SL1ju3BacJJqg5WP
         DF+IMjOUP8CJRbAWKIRul/zn7LQ4lTYy6BgBJYCY0NFkVsEynU+xjk01w5gW3anH2k7r
         6sROD6uPjtLQ05kzp5f7hcy+E24jT9dh5pimjOwRQvnn+00/xZpAWYt1bfdPqd585qhB
         8H3w==
X-Forwarded-Encrypted: i=1; AJvYcCX/UutLYt1z2xEhb1DFbnXu3URtnPdQbKT6SEhx/mGmq79bK5QCvMh+fPjZnZqaQQZD8W0+XB04z49kxQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxXyvSRAfMlvLaasO1UdAguvIE8WUagO3E7eo66c89yMcn//rA0
	dgv1pExXCBmA5uaPXCLfSd1HWb2t6z319cMB7BYKHnlPWYZhxyWFeQ8wOhHQW8LnghDVJL/iUNj
	SpV/b7CI=
X-Gm-Gg: ASbGnctRpWPL8woDB/9wOVTE7/KQaugsQCT0tBUIUR4tG3J7MgXeXLt4hhP+JXNcV+W
	Q1m6ctXYi01WyZ3svZ5dZP/VWNaxucfzz5JuyvmEjq5XKZ2ZtC/1EbwQ7GlPmvzm5p/nsJRYE/D
	ixYQMujlhXVAOHDVBpBl68T1tnrQM2DpUOZYYIOqBBSwvN6ZgEZtSjPw9tKwJpLjsy+kwd5QI+V
	5SUXc3IXl5/d4PTwEbkFBasVpwrYLPxPsaymDGLYmSmK4hAVfEyd5Ht4IFtbf953pGRxCxQH6QF
	dAP+SXqFF7fKWXBJZpUF05uCxXfMaWxqdmyCW1uWO+M/xY+Hwcanvx9bffLJwBBeN60maypPGDH
	/UUqmo/J4fmH7YFb0GgjRhTuE1A==
X-Google-Smtp-Source: AGHT+IEejgtUhTSox6IHwZXf3EN4FYfyq0noStd3qwhmTncqI5LS6LyXKO3mRgWPRCkaF1eilS9ksg==
X-Received: by 2002:a17:907:2d12:b0:ad2:2d75:d7fb with SMTP id a640c23a62f3a-adb322fa1c2mr73662266b.55.1748549689060;
        Thu, 29 May 2025 13:14:49 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada6ad394b9sm196804066b.132.2025.05.29.13.14.48
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 13:14:48 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-604bf67b515so2389637a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 29 May 2025 13:14:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWLNRtHtUOpXA1rW5w2zusZa+T+ePEI8FC9JKGKzjfxIDaqpP4tuZJ/19DrBpMCYJIdebtiq3a4eGia5Q==@lists.infradead.org
X-Received: by 2002:a05:6402:2346:b0:602:1d01:2883 with SMTP id
 4fb4d7f45d1cf-6056db10b4emr581444a12.1.1748549687775; Thu, 29 May 2025
 13:14:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250428170040.423825-1-ebiggers@kernel.org> <20250428170040.423825-9-ebiggers@kernel.org>
 <20250529110526.6d2959a9.alex.williamson@redhat.com> <20250529173702.GA3840196@google.com>
In-Reply-To: <20250529173702.GA3840196@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 29 May 2025 13:14:31 -0700
X-Gmail-Original-Message-ID: <CAHk-=whCp-nMWyLxAot4e6yVMCGANTUCWErGfvmwqNkEfTQ=Sw@mail.gmail.com>
X-Gm-Features: AX0GCFuiJcryO_X7sE1ePk8yCEY5HNa9j_jPT14Gm93VGY22kOHLk2kIn44ZkWY
Message-ID: <CAHk-=whCp-nMWyLxAot4e6yVMCGANTUCWErGfvmwqNkEfTQ=Sw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250529_131451_564294_4AA1CD9C 
X-CRM114-Status: GOOD (  18.08  )
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

On Thu, 29 May 2025 at 10:37, Eric Biggers <ebiggers@kernel.org> wrote:
>
> Long-term, I'd like to find a clean way to consolidate the library code for each
> algorithm into a single module.

No, while I think the current situation isn't great, I think the "make
it one single module" is even worse.

For most architectures - including s390 - you end up being in the
situation that these kinds of hw accelerated crypto things depend on
some CPU capability, and aren't necessarily statically always
available.

So these things end up having stupid extra overhead due to having some
conditional.

That extra overhead is then in turn minimized with tricks like static
branches, but that's all just just piling more ugly hacks on top
because it picked a bad choice to begin with.

So what's the *right* thing to do?

The right thing to do is to just link the right routine in the first
place, and *not* have static branch hackery at all. Because you didn't
need it.

And we already do runtime linking at module loading time. So if it's a
module, if the hardware acceleration doesn't exist, the module load
should just fail, and the loader should go on to load the next option.

Not any silly "one module to rule them all" hackery that only results
in worse code. Just a simple "if this module loads successfully,
you'll link the optimal hw acceleration".

Now, the problem with this all is the *non*modular case.

For modules, we already have the optimal solution in the form of
init-module error handling and runtime linking.

So I think the module case is "solved" (except the solution is not
what we actually do).

For the non-module case, the problem is that "I linked this
unconditionally, and now it turns out I run on hardware that doesn't
have the capability to run this".

And that's when you need to do things like static_call_update() to
basically do runtime re-linking of a static decision.

And currently we very much do this wrong. See how s390 and x86-64 (and
presumably others) basically have the *exact* same problems, but they
then mix static branches and static calls (in the case of x86-64) and
just have non-optimal code in general.

What I think the generic code should do (for the built-in case) is just have

        DEFINE_STATIC_CALL(sha256_blocks_fn, sha256_blocks_generic);

and do

        static_call(sha256_blocks_fn)(args..);

and then architecture code can do the static_call_update() to set
their optimal version.

And yeah, we'd presumably need multiple versions, since there's the
whole "is simd usable" thing. Although maybe that's going away?

                   Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
