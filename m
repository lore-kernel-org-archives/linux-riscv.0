Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF42C71148
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 18:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=103k99LxdZ79cag0fSjkh6dJs9y+o5n+JcTh4zbNIWo=; b=igHE03BiVq6rkA
	76qupR0zQGBlEP9zrRaSF1tQS+kZbFnjeqas3+CLJ5ZmbWH2SXZbJAs/Bex4t3V9ti9zf6P3kdbHy
	P2DgU4jrZSKLGIKVJrKk4PNtW7gPpRms7evFDVCDN6U2ObLLkr/lXZUDDZUFcqRplTYsuZmts+aFu
	+lyZgLE+K0YKNnAPSzHmHhC38nDY3Py7aVSj13jtex2bWYUOCmiEEUa47o6636sn2Kz4RoILXzadZ
	hz4p6r/JZzVK2hgOwnz0kDTr+AcdhhJRxIlCkkvbBgZKsrM2QjxD0HAUfRSn1TyNNgNj0D73+yAWu
	PP0usBM8XMsZ5WdOIEBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ8yZ-0000000HHs3-0j3W;
	Fri, 13 Jun 2025 18:18:03 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ7O8-0000000H4CX-1Otn
	for linux-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 16:36:21 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-adf3b33f968so88232966b.0
        for <linux-riscv@lists.infradead.org>; Fri, 13 Jun 2025 09:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1749832578; x=1750437378; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=76g08zX1QgiOXgDWQ+4Q63FmolLqjqLzmJdnqen2jZI=;
        b=J+OGoIWhfw8m4eoQj9fWEQi/EdbEzDitC1iRtRYFj03eObtblOBYcjXjCyyaBTEj3N
         bf3XdyHTGyi+jw5+NdorkNcpyCyXssXbxis0GHL6LgeFW4SIMqGQl/r6RMNBTQxIwJfq
         Y7dCD+sessGS5pXPrM+BM5Is0U/gN9dQ+t5go=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749832578; x=1750437378;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=76g08zX1QgiOXgDWQ+4Q63FmolLqjqLzmJdnqen2jZI=;
        b=G7OoMH0Ams1Fdaa/hvFv6UGInClubdOTYFasAkZkapWocx217WBY2GtUaZhc1dexcb
         MlgOonkoZQgbW1r9k152JMDLRaQDc+UqeWT2zV+f0FKb0u9WDSHxoWi9H9MDK0OL8vHl
         m47E2GinXvA//ZfzbG45D//0qStqunRvDkHwDU3dfiNSkLZe8nvN8J5OO5SHQxdleVg/
         yN/0owvKBMALfG6nFgYWpdP7tVCy7qBbA4ECZRdgTg8f6AxUDZG/Kr99fPJHGH4BuPXr
         0nB9zBUvTqW/2O9yxTbKI5j2nmt2liSiMm6cy7jz4evHFRqEkToLQgJlUHdZicIHDi+u
         zl+w==
X-Forwarded-Encrypted: i=1; AJvYcCUdZjXurT/gHQf6Z3MzxeHQRMUQKixY5J23vw5v3n8n+l2119c3bHuV8dIIMT0iR1od98IV+iQz2REycg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyx3HfH5LxjO1/HSawjLKea+sq3rvni2NrMEMuqbzssdxXqouqP
	HSq23vhyCoJHOhIrYlUHG8HJrsl5401tmMIdnrD/1VH4UI8HQHBZTG3W0KjLp5BXf0zAka4rIDr
	hQT+2P1A+TQ==
X-Gm-Gg: ASbGncsPYUTVTuwf0EDi4YiBc79duPOCCSbO6baRLL4+HAfQTiPBh4x15CiBUrZWdOt
	QDaH3hTevvFaY0bR+g33tM/q4gEMJa6dxgTV5uOXQfyfeKdj3/goHPMSrBzyJlbve2v/xQrcB/Y
	3UctFmJ6hM3Fb4d4B1f2Dsp2A4FGa6grbInCmBP3xLiz/vLRA+O3q+RjMCgXnUmcGlHed2L+wsv
	1puwhskDYKvDNvNuG5tENablyaaqWKAeY8bT+EEdKlAvOP5srCq52vCSLuQXcTV9PnF6j/bp2R2
	xcmxnD1AkVTK0XE3yu1ICkkQc/gUXWaBKZ7ETdjbrEj9fq4Hc6VWrAxRXf/Ur6CzVxT5gcy1AnB
	PUgI/3qqSyX53P1MnR0gl+XUoqH+LTmGu/LKzMHgrElXe6hk=
X-Google-Smtp-Source: AGHT+IEoloQR1aHHV+WOppTAKuNOzD7AhC5NS7HDDqTWDDyXdNOiq3F/8zSrN0dxY584mtm78qEF4w==
X-Received: by 2002:a17:907:2d22:b0:aca:95eb:12e with SMTP id a640c23a62f3a-adf9f176fd2mr32808766b.24.1749832578442;
        Fri, 13 Jun 2025 09:36:18 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec8928c20sm151652966b.111.2025.06.13.09.36.16
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 09:36:16 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-60780d74bbaso3986530a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 13 Jun 2025 09:36:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWKjYD/StKFxwq8CUaD0QTEHRKfV3DbtyGExdL+4CGDOeMggpSTzO+dwc+iw/lg3SPYjc7kv7DwAmer2w==@lists.infradead.org
X-Received: by 2002:a05:6402:35cd:b0:602:427c:452b with SMTP id
 4fb4d7f45d1cf-608ce49d897mr365341a12.3.1749832576184; Fri, 13 Jun 2025
 09:36:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250611020923.1482701-8-ebiggers@kernel.org> <aEjo6YZn59m5FnZ_@gondor.apana.org.au>
 <20250611033957.GA1484147@sol> <aEj8J3ZIYEFp_XT4@gondor.apana.org.au>
 <20250611035842.GB1484147@sol> <20250613053624.GA163131@sol>
 <aEu5cyDOMcKteW_b@gondor.apana.org.au> <20250613055439.GB163131@sol>
 <CAMj1kXEDCRfCgvtuhRc+a=m1kVt-zkcCqi_=_WOFTmt4Hz2gGg@mail.gmail.com> <aEvjrhkLnB_GEKnV@gondor.apana.org.au>
In-Reply-To: <aEvjrhkLnB_GEKnV@gondor.apana.org.au>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 13 Jun 2025 09:35:59 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiewoOfhK=NVQT2uf+29Kngv9F9J6ObJRFUKi6n-=B06g@mail.gmail.com>
X-Gm-Features: AX0GCFu7lGsyyFJqLRh6z7a562txhJJOyTpVqIIzlie72BRGPF0wH2A3ccvLGV0
Message-ID: <CAHk-=wiewoOfhK=NVQT2uf+29Kngv9F9J6ObJRFUKi6n-=B06g@mail.gmail.com>
Subject: Re: [PATCH 07/16] crypto: sha512 - replace sha512_generic with
 wrapper around SHA-512 library
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Ard Biesheuvel <ardb@kernel.org>, Eric Biggers <ebiggers@kernel.org>, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org, 
	Jason@zx2c4.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_093620_367300_7B4C9EDB 
X-CRM114-Status: GOOD (  13.95  )
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

On Fri, 13 Jun 2025 at 01:39, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> First of all the export format is being made consistent so that
> any hardware hash can switch over to a software fallback after
> it has started, e.g., in the event of a memory allocation failure.

Can we please instead aim to *simplify* the crypto thing?

Just say that hw accelerators that have this kind of issue shouldn't
be used. At all. And certainly not be catered to by generic code.

The whole hw acceleration is very dubious to begin with unless it's
directly tied to the source (or destination) of the data in the first
place, so that there isn't extra data movement.

And if there are any software fallbacks, that "dubious to begin with"
pretty much becomes "entirely pointless".

If the point is that there are existing stupid hw drivers that already
do that fallback internally, then please just *keep* that kind of
idiocy and workarounds in the drivers.

It's actually *better* to have a broken garbage hardware driver - that
you can easily just disable on its own - than having a broken garbage
generic crypto layer that people just don't want to use at all because
it's such a ess.

This whole "make the mess that is the crypto layer EVEN MORE OF A
MESS" model of development is completely broken in my opinion.

There's a reason people prefer to have just the sw library without any
of the indirection or complexity of the crypto layer.

           Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
