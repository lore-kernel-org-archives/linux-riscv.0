Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A6FC5AD49
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Jun 2025 20:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=195jX4rm9/6EJWO9SYUPpzL5mzREd61uYyeoB4Px86g=; b=IrvaYjFjwtY1wQ
	jDg9Ln8rIa+M7PJyQAyzYnoqAXF+CD9tOczzk4XzxDA+t8mi53ecduw8NQqFNUK0/NGTWiNb2Ulvy
	U0hpKhHYvg85VQoPqx8SrWOcMSEKTVtG8SpJXv0dIjb5g1YZhz+C9Y0HhexpTSI+quJGL/+vWjCiS
	YXHONgAZNAUmBIFU0RKlojjbuwbakqoXhdsIpQP++4mfyWLiKNQqcf9b6tJ111g4nK54p2kFXWZnr
	0cMql7RX6X0MM3GCLcrFTbP0GgS9k41iXsP+0KN03tsPxg/qjocAXfB3P294B7l8QVXf0ZgoF3D1r
	DG+EFXyZYLSoMQKJKhjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOMvr-00000002xaA-2vwy;
	Sun, 08 Jun 2025 20:47:55 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOMvp-00000002xZs-1FpV
	for linux-riscv@lists.infradead.org;
	Sun, 08 Jun 2025 20:47:54 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-b2f0fcee268so419402a12.3
        for <linux-riscv@lists.infradead.org>; Sun, 08 Jun 2025 13:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749415672; x=1750020472; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/NepSzNK7cHJVdKlMHYuPZmDL7EOzwuHy5xSr7Gp+s=;
        b=NAcWXF2249D4mc9cvc8SzMA5YEIFIdSgSltD3g1TiTK4lvDFNjUa8blLDrQLTdZ8Sj
         cEjC6ZhRVvigdWYWZQhg7NUbQj+YXKs3bJqPEpfr5+hOyndo4InFSjEx5eqXBdu8Z2qr
         ANAdAxqMdi1D35D81pDLtTduXNZuJUxFOFdrlTVJLm9BSSG4Yur7VWT5BgxrNeGoE/FY
         4jkPgvCWhm9iS2+LgMRE4vkUt8UNPnvWJN7x0nqMrilYVRJi3wAzOaF/uBP90uh1LKM4
         fP+5FZHQuxdHAAA1tnUWsOsnk1pfYE3l6vW/gKmJUiJa27AVms/CNMWxvQDgMdCKvvva
         PGOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749415672; x=1750020472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e/NepSzNK7cHJVdKlMHYuPZmDL7EOzwuHy5xSr7Gp+s=;
        b=hvj8xvUoGlsCJgiPY+85aR7vLxYq2l2m+n0mjalqWMym6fgOMLXCoLSorHrE2nET9f
         LzniP+GYJ4pWJWn3Z6RFf+M9Wpmau5IriIfvwcK6VCaoRfQIBlS9rq1rcRQDbt2a2GzM
         PflkXFOIlIhtOdy5LLlqWmj9Z91Lg/GaUFirMtIPiC8LNzRonTdV/9mS/9BSGM9mGOSQ
         OcsUW+KM93kI9arkd/t2qk63SN2ADnmrSJcMUnSUshFLTSAtaLdKuK7dMb7WiIIFjJHs
         x9LHxvKTW6NVS+uB2U+ZMpqeRgfiIEU8zSWewXA/Ror4ngjTgdL4dy3ARzoaY4WS3oJz
         LWsg==
X-Forwarded-Encrypted: i=1; AJvYcCV6ooSu1I6l5Ry6PP90EuIDweX3hooIOaUbu1gTaYt7k6FWatk5bfSy4jjyp4WarmmBjmiF6Dh6vpzUBA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxsOJ9N5q1OYuuQep7KonAlwIvyqpI62I/hbR17BVx+KLpny3xp
	bhOwz8eCsZKUzXnJ1LCW20R5PnecVx6PguARgzV+mJABrXccOBFC2vA6MAieIt8ZVXDubU+/5/u
	YgKSqikUr7FBq72wYUObd+8dB6aRJKPU=
X-Gm-Gg: ASbGncsToNJlciOwyWJpRqjXglEtRtTsk5p2sg9l2Bfv8ZX0Ak0F0nVVTJZQn5ZCz5e
	W7ZJN+IDc5AQSTPlU+AEJj1zYgu3tPMiGLhZCLbKv43odb/3j06zsD24m3/MF6mq5pSNwQYhAU9
	5JQwdleCHqQWpb4UcXGfY089plV8I2PgIs
X-Google-Smtp-Source: AGHT+IGMuXINEZm4WUqJIT66MF2vg+ybkmXgawlTKOKqE5f3w0CWVXxYZlA0lxfrGl70z+aRQlCRwjGEVMSn8hyBYU4=
X-Received: by 2002:a17:90b:4b85:b0:313:2bfc:94c with SMTP id
 98e67ed59e1d1-3134e43144amr5309627a91.8.1749415672501; Sun, 08 Jun 2025
 13:47:52 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250524211519eucas1p218997c69b98b14d3af2eb6bf4e9d3187@eucas1p2.samsung.com>
 <20250524-rust-next-pwm-working-fan-for-sending-v1-0-bdd2d5094ff7@samsung.com>
 <aDJGgLZ9tITwGBxq@x1> <b5f4af17-05ef-453d-8f04-283590ae5b87@samsung.com>
 <DA5YY0YF28GO.3DONTQDLY6VBD@kernel.org> <aEXBH5r05FkTxpV+@x1>
 <CANiq72k-FmZe3P_y6FjmiqXViqLKXkDqHY1-KLfmgwAe98oBAQ@mail.gmail.com> <aEXrZvpTD30a5OhT@x1>
In-Reply-To: <aEXrZvpTD30a5OhT@x1>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 8 Jun 2025 22:47:40 +0200
X-Gm-Features: AX0GCFtkgb9NQ12mbcXrlhdSwOY0B7uS6yd2CXG1hnJnfVtwyAWwRJ7-DZ7mFxY
Message-ID: <CANiq72mn4sRzmkFAJ0fKhwZMLUi33DBLNzyEF2BTPML_4Ya+Bg@mail.gmail.com>
Subject: Re: [PATCH RFC 0/6] Rust Abstractions for PWM subsystem with TH1520
 PWM driver
To: Drew Fustini <drew@pdp7.com>
Cc: Benno Lossin <lossin@kernel.org>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org, 
	linux-pwm@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_134753_336238_9150FFE7 
X-CRM114-Status: UNSURE (   8.47  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU3VuLCBKdW4gOCwgMjAyNSBhdCA5OjU44oCvUE0gRHJldyBGdXN0aW5pIDxkcmV3QHBkcDcu
Y29tPiB3cm90ZToKPgo+IFRoYW5rcyBmb3IgdGhlIHF1aWNrIHJlc3BvbnNlLiBJIHNlZW1lZCB0
byBoYXZlIHVwZGF0ZWQgaXQgd2l0aDoKPgo+ICBjYXJnbyBpbnN0YWxsIGJpbmRnZW4tY2xpCj4K
PiBBbmQgaXQgc2VlbXMgTGludXggaXMgbm93IGhhcHB5IDopCgpZb3UncmUgd2VsY29tZSEKCihC
eSB0aGUgd2F5LCBJIGFsd2F5cyByZWNvbW1lbmQgcGFzc2luZyBgLS1sb2NrZWRgIHRvIGBjYXJn
byBpbnN0YWxsYAp1bmxlc3MgdGhlcmUgaXMgYSBnb29kIHJlYXNvbiBub3QgdG8gLS0gc2FkbHkg
aXQgaXMgbm90IHRoZSBkZWZhdWx0CmZvciB0aGF0IHN1YmNvbW1hbmQpCgpDaGVlcnMsCk1pZ3Vl
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
