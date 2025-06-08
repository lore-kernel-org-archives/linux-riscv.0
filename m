Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21274C5B552
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Jun 2025 17:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rE7QWuboqfgoGq3GLGfbBFL62ne+Y0dlxtUftM1gM5w=; b=3zxvS8wwJtRvB/
	7qPBOZO02PXx1Owaev56TuhObFOnLJLRZEVPsAGYNjpMI+xlVxjcDDBB418vbC6GYKLvX88DEU0kz
	I18lpfTprD6esKiEjqtylzctlf3C+mkCRN9T/D8uWOQVaI03zGX0psFa0ZvuPuf9Xci23zh2RHAmY
	nhOuSIlhgwqJtKN3/4uFHvB3KAsJ+/kyCxvlnBnE9NqyzG3UK5H3ejxlXsCTaLW1py+HzK2UVBd3A
	xnkZVbQnEUOlQMn8+fPHGbApnn4JhoznlBJNUksHTc2Bw3Sg4j4/RA/azsw0F8AmX8W3cA6D91WnS
	2zC/dsvXSzqxJj9ul3aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOJbP-00000002ozI-13oA;
	Sun, 08 Jun 2025 17:14:35 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOJbM-00000002oyz-1uyp
	for linux-riscv@lists.infradead.org;
	Sun, 08 Jun 2025 17:14:33 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-313862d48e7so63047a91.1
        for <linux-riscv@lists.infradead.org>; Sun, 08 Jun 2025 10:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749402871; x=1750007671; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RKQPMPxj4MfkIMcsHYvMcLK9KWRbyjeOgrUKCkOD1Ys=;
        b=UVUEIYsaEq1YoQm+MwUmjG7AQLag7FJ09gSY8eCM5zthPwmykWTtVH/LEO5FdWSaSI
         1qyBcViVPwm3OV2xhanC+Jh9y5Y6dzDgx/Bvzzm0tcpFT/cF/NJBqVjUNIuVe46ZNIUG
         L2QxEVHxJWlE+c3ylxpuBOfHSJIqco8KzHaKuRCFGXhTE75jK9gdRKynh9LNgXrkM33+
         Y77EtzAL/tsfgy0aValzRp0iCvQ6NPE4weoI6kXU2nmX7p4iJHdJ93+9Tk035RITtKIO
         tapwmmtEW5LdofbjZvzL2xqvk6cRAV0AGvqsOuUhpAt2lYY4ZfGouG2DV9v837uhbC19
         4l7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749402871; x=1750007671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RKQPMPxj4MfkIMcsHYvMcLK9KWRbyjeOgrUKCkOD1Ys=;
        b=q6bm41Bu6wNYYdqyXgBz0st6Rg/njCZJwU+fTcWizuooerpoP5sND2otSGTQtDbnWB
         82JpFN5lYOW+MF0BJ9Swzl84bJN219LWldD2csf1ec+myEIcFkJUk38tEePAlIUdHYJH
         V3Kf1ZlyZkczP8T7xR01pSysjy3qH2SKJzVnBrvgnra9nR7fC4B2K0UruP6TNX1tS+Bw
         QAyKLOZwkZUacEfqJZzAD6nI/ZOq0ohuTselM4yUgHjyw6aWJ6/8mtbQXRwf7gNG5esS
         NbsriX+aENeg/K0yoroQ97SyO4ycZkM86omxh5DrrFncfImp9+Z/5rXdUWKl10i/2+/7
         9c/g==
X-Forwarded-Encrypted: i=1; AJvYcCWutpthmX0deT4Jr1go5K3vcTKSCS+PFpfKZIDGSUS6XPn4JSq80mk9B/gMkHsJktU6USHAP2lq00zrdA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxiXROgrk1Kdnt1u8uwhNvG5jOjzHiR4aI0zig0fLTYWMNMB38u
	hvMxsmn9j70nmR+VcT9eAz2uTWg+5TckYNe+UrypMsKpya3tqawNufJmKkvqzFrz5nNIlAl3heg
	kzQhSbTR3Q6HLyJx1IroTpGNssrIrzZs=
X-Gm-Gg: ASbGncu5aZSuRCGzUAs9UgSzpKj4hnWpaA7AjVl7J//NMwqSdQpFcL7gJR5NF/ZBi2l
	t04bIiSYI3ajpJ0bk61GxtDXnlK7h05Bam/Se21HKwGyOBqiWAjUeOh4bV4PPxrMlGXLqkBi6Sp
	6L589jRdw5/Myo2CwJDQn7TcKAsg6K7/t3
X-Google-Smtp-Source: AGHT+IEBvvvrAwdUwi0gkdHeXQhnZUDJ4usrBz8GyLnmW1wPT6jaQZ8Mxnlnj8F8TSVPOxQPYUkvrhO9C3hSgDaoKWQ=
X-Received: by 2002:a17:90b:4b85:b0:313:2bfc:94c with SMTP id
 98e67ed59e1d1-3134e43144amr5102920a91.8.1749402871506; Sun, 08 Jun 2025
 10:14:31 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250524211519eucas1p218997c69b98b14d3af2eb6bf4e9d3187@eucas1p2.samsung.com>
 <20250524-rust-next-pwm-working-fan-for-sending-v1-0-bdd2d5094ff7@samsung.com>
 <aDJGgLZ9tITwGBxq@x1> <b5f4af17-05ef-453d-8f04-283590ae5b87@samsung.com>
 <DA5YY0YF28GO.3DONTQDLY6VBD@kernel.org> <aEXBH5r05FkTxpV+@x1>
In-Reply-To: <aEXBH5r05FkTxpV+@x1>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 8 Jun 2025 19:14:18 +0200
X-Gm-Features: AX0GCFumCLeEEJCyPi9ehiEGEBsNiIydEW7gHiOseH77d-yj2IMt7X5ttFs-zc4
Message-ID: <CANiq72k-FmZe3P_y6FjmiqXViqLKXkDqHY1-KLfmgwAe98oBAQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250608_101432_494672_6AB6F25F 
X-CRM114-Status: UNSURE (   7.85  )
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

T24gU3VuLCBKdW4gOCwgMjAyNSBhdCA2OjU44oCvUE0gRHJldyBGdXN0aW5pIDxkcmV3QHBkcDcu
Y29tPiB3cm90ZToKPgo+IEknbSBub3Qgc3VyZSBpZiB0aGF0IGJpbmRnZW4gd2FybmluZyBtYXR0
ZXJzPwoKSWYgeW91IGRvbid0IHNlZSB0aGUgYEZyb21CeXRlc1dpdGhOdWxFcnJvcmAgZXJyb3Is
IHRoZW4gaXQgc2hvdWxkIGJlCmZpbmUsIGJ1dCBJIHdvdWxkIHJlY29tbWVuZCB1c2luZyBhIG5l
d2VyIHZlcnNpb24gYW55d2F5LgoKSSBob3BlIHRoYXQgaGVscHMuCgpDaGVlcnMsCk1pZ3VlbAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
