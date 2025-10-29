Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB6ACCF9EB
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 18:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7uGjtkchy1y8qd/MHNrjAAiPKfXiLIg+7K1iNL46PGc=; b=iAc51llzFJHasM
	k2EYrDPfhIUZZ9jhzqR16SZn4wP5DMkp89psBnhwwSN19f6JUtxzLCJ53/dlxt3q9hlFcHKdahvsW
	GkQRFNa9t3VtuKLFy0S/PayQ0zik306EjWC4V7fgzg3ERByENOxOtG3QefMHPM/oTLckvGS8y1Sct
	3dagkICLTAa8UpWGyocecLB3J17VujB6+uUKtRWDfcMRkV3eAD4pDITdWr45k7tOz00FWTQn4dnZv
	gdUW1RTZS04Q9VuCvKI2yDZpvIteFFZxI0MzuzF20zw8LNjZhc/MXHESwemgE6SiEGviNYgPPuC6e
	Zuw4avEHPp3Fbs5glvXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEAl5-00000002NiU-3asy;
	Wed, 29 Oct 2025 18:18:55 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEAl3-00000002NhR-1Zsf
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 18:18:54 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-294e5852bf6so168955ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 29 Oct 2025 11:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761761932; x=1762366732; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGHEJFApFyOFo7pmpc4STS/EO5YU8lCBDcbtrWvNjWI=;
        b=N+7CYx1K5PpQhoEFbdev+dv2xAtyq9Qp9JKga2GZOoOAoszbKoonbxJe7nn9WBPp6n
         rdCBfkXd389BcwTlYXEUR7puFzWs2N1Xzq5EaGF4u48Mnmi+v/rJYeyRXNN9zLNEvuWE
         rhfga0DVqYvNGSkeHgdSef3w/CZLLbzWHF2/aFG/eZDQ93JoHv4/iiJuMD9YFsDU5/4P
         uNH6sMnTzoLpzyuxzB3vAZNZH34cn4YPK9ivWh9f7u9bIC+tw9hnM6WCWYMge+nyeRlW
         S0zk4VV54CzN79Ud3d4hnLub8qEBPJ6Gu0IuszyJjsO1GEKsCeUNGC2kehQWZlB9MwEl
         8NUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761761932; x=1762366732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qGHEJFApFyOFo7pmpc4STS/EO5YU8lCBDcbtrWvNjWI=;
        b=cj5S+UFrcQ6HjIwXzNjcZYIdKN2gjKpV5roGubRtJltl95wORjx12zjW2M7HIlYFe9
         t2ZcAoxgZS4APftc0bLkLs5h3v5jRXNoMzUJKsjFi3JTRQU9upmArh1KbOzP6SK9jam7
         YnVfD32c0+T6Xe+N65OYQQWwuUYh7aKBg4vKOai5JT/UX3GjZWHhiGulldy9GcWOmDH5
         PH5xHy9JFQsQE6q1koNS1wPG65aXHSElTyVpZHbSW6KHxzN2a60N3S981HuWQZ374AT8
         4IMp3WLepVjs4hB+71CwOyGr0X0wMPG34O8HIu2SdnHQj7xRkt53mlolNJo225PnUQRy
         uR5Q==
X-Forwarded-Encrypted: i=1; AJvYcCV/jnomO3au2W76OloC2IUffr6BltIAFDIqAKC2mKNAJUcA3eZg4pQR+ZJraQsO11I3/Pb7dfTUFJpOrQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2QwRgWJWWwbkbZFhCZaPgqVwklMX7WbS+fmTgwVuam4TtRUXo
	4QtK5H8wKY6wZc3+/XjobCevuEhIhdhmfdKPxS+GcJWlb7je/KcXoU+EJbA40hoFGv7QN0GKR+H
	pP2TwR2YE5UPTTEFGLf/fG2aEoXx8F38=
X-Gm-Gg: ASbGncugUZQ4Xo+fFWifcgmbZvECt+DTg6Tiv4CA4KY5I9zjm5tdJhei2BRgXLJZaVT
	JCrTLFnpMPXyVbIYBDiUi3p5UWWObQxtqT7wAxrsNe848rFUz2d64IjPhGAmoTr+4VLI8zePzIo
	jloGt0683uovNo4zBH8rDtTi02xFLv19/+wv+G/MprSgfqXE1JwY5jlu/TlXHjr7PJnsV3kDXSc
	OFzaskd7gUwIE5jCmmTUa5F3/l7278Lf75gykq2hJBqsfv0nvw33mnaWYlh7Xez1JVK51oi85Jl
	VxE3Gb0Wn+zIHTvyuguo5COUeBFQmjDHivFysAFaEszsZvkDexj0QKqpgoz+HkhlvT9HusgBZt5
	5Wc7t/EOmXAaQyA==
X-Google-Smtp-Source: AGHT+IEUmxwJv4cATlvHI24p6sTswb9GOB92tay5pdawn1K9j7QGYDSkyOSrQLmeFPpDeZNCF+IzUDuiQtDiWnxBse8=
X-Received: by 2002:a17:902:ea05:b0:290:af0d:9381 with SMTP id
 d9443c01a7336-294deec2ed0mr25872405ad.7.1761761931934; Wed, 29 Oct 2025
 11:18:51 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20251028122315eucas1p159b65037cf6f3f710c1917e2464399b5@eucas1p1.samsung.com>
 <20251028-pwm_fixes-v1-0-25a532d31998@samsung.com> <2dedlnknikkrwg5f6ocuvjrogdjuqyg4sg6zkkao4w4yyvvsje@dkt7rco3fen3>
In-Reply-To: <2dedlnknikkrwg5f6ocuvjrogdjuqyg4sg6zkkao4w4yyvvsje@dkt7rco3fen3>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 29 Oct 2025 19:18:39 +0100
X-Gm-Features: AWmQ_bloR4yaxCgQSRgH9rsP_79aHVebA5y_V5RdiMta-mOKTPlfL_2N2hFhhSs
Message-ID: <CANiq72n8QvygNsdHjaMgYrXiErT82BkWm1XMkc3eUZB1Xy_uAQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] Introduce import_ns support for Rust
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_111853_416510_61D0A845 
X-CRM114-Status: UNSURE (   9.48  )
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

T24gV2VkLCBPY3QgMjksIDIwMjUgYXQgMTE6MDTigK9BTSBVd2UgS2xlaW5lLUvDtm5pZyA8dWts
ZWluZWtAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBJZiB5b3UgY291bGQgbWVudGlvbiB0aGUgY29t
bWFuZCB0aGF0IG1ha2VzIHRoaXMgd2FybmluZyB2aXNpYmxlLCBJJ2QgYmUKPiBnbGFkIHRvIGFk
ZCB0aGF0IHRvIG15IHJlcGVydG9pcmUgb2YgYnVpbGQgY2hlY2tzLgoKWWVhaCwgcGxlYXNlIGRv
IQoKSSBkbyBteSBiZXN0IHRvIGtlZXAgZXZlbiBsaW51eC1uZXh0IGFuZCBzdGFibGUga2VybmVs
cyBDbGlwcHkgY2xlYW4KYXMgbXVjaCBhcyBwb3NzaWJsZSwgc28gaXQgd291bGQgYmUgbmljZSB0
byBoYXZlIHRoYXQgQ2xpcHB5IGZpeCBhZGRlZAp0byAtbmV4dCBzb29uLgoKSSBoYXZlIG90aGVy
IHN0ZXBzIHRoYXQgbWFpbnRhaW5lcnMvY29udHJpYnV0b3JzIHNob3VsZCBydW4gaGVyZToKCiAg
ICBodHRwczovL3J1c3QtZm9yLWxpbnV4LmNvbS9jb250cmlidXRpbmcjc3VibWl0LWNoZWNrbGlz
dC1hZGRlbmR1bQoKRXNzZW50aWFsbHkgLyBtb3N0IGltcG9ydGFudGx5OiBgcnVzdGZtdGAsIGBy
dXN0ZG9jYCBhbmQgYENMSVBQWT0xYC4KCkkgYW0gc2VuZGluZyBhIGNvdXBsZSBmaXhlcyBmb3Ig
dGhvc2UuCgpUaGFua3MhCgpDaGVlcnMsCk1pZ3VlbAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
