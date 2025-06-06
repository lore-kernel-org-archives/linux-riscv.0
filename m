Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE7EC5AD49
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jun 2025 15:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C3ocovaQnpMcQrtCvTb6R0tbTwEDCWyOEy2W74Lzxrg=; b=elGPVeGvM5GtFG
	FSi5RsYXo6ToUTMZYrFF9qieV5fW0zjr7FWxKPtgUpVuO4CU9mRTCLQAoQqd4/YbAY8y69phzGiya
	Xg2Kb2ZF4WYKhAmcPi3YyIbBDgGcafN0brniguP00TRJsCYcXG/+CqCAW3p5FREYOwHWsc+3nSSGS
	kZDJv41lKxkEh2kbsKnsfLP2PW0fb+V6zTKz1i+N4MAjf6Fv2MA9EnJTC0qQVKWkvPbQ0Kj3Fz/1L
	4EEMB0nI186RkwZji4nqV7alhYFr/Qd30Of7I1mSqJD0E3KWMCYvbadKfmWmI4n7N3rI0Nmxi+24L
	OaKtC1P3AWwCkWyag4Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNYt2-00000000Vfw-1nEP;
	Fri, 06 Jun 2025 15:21:40 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNYt0-00000000Vfb-158s
	for linux-riscv@lists.infradead.org;
	Fri, 06 Jun 2025 15:21:39 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-312a806f002so216843a91.3
        for <linux-riscv@lists.infradead.org>; Fri, 06 Jun 2025 08:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749223297; x=1749828097; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6y/pTaKdTa3jjo68DaVXoYV6RDpz4d2nIZzF6qf145E=;
        b=J7qC11SIUL4JjyE5fDvxzWwRVJL8tx8KeJEhtKmNcfl34sS21WGxRDB2qJGyvw14s8
         0QuabFf0x2ebK1WpFM7UtYppvtblMCrK0s65p9O3xGA38uHT7x2XuIceNsrvt6lzjGAt
         s06CvrDSIT5xW+Jxn4ZUrI0O9+p8eO+FORNT1iXb+S3rUOZfhwuExTq21t8NM9cYTSrn
         OVU+NeJNdIr+9/5NYRpQ+epfEm+pYdq8qOXhs7k1PSxXVegSlphNWj/OI/mRyXk42KQ8
         UNS4QaT50Qz4PFrgJ2GwvboIxQwRNxAl7i+6/ogH959HHo4GFdDt/qJfAF24D2pQ3VpV
         Tvtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749223297; x=1749828097;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6y/pTaKdTa3jjo68DaVXoYV6RDpz4d2nIZzF6qf145E=;
        b=bRsMTbgsSQrT2aiWTwSbP+BkWed2DOJeQ9gQ2kteLrvD/7vN60YWL3wK9skhMemJwz
         xGjPo+ZYrHaQzQent6rhS9YqI6hHSuX8WJs1A21eU7P8RSG7J1YJLjBBfwIWrkBlLfOF
         FioFv3yzhCirpivCQW3UxUUtCKe7HYNk2Lth4ihC1XKKjxvtaB8awFS1Ym24/k/dZZ42
         XiEoQXvXkC0mlonTibLQFR0Rm6z4BocL7y0EId6tpBfYkIbmtHuskVUQbG52EFouLQJF
         Nr48O+ksEXT0rDvpRt8hxhCkr1VS7uGLu4YxdKbSo3bewl063JEy44zAmfzpsszYOSoc
         J3dw==
X-Forwarded-Encrypted: i=1; AJvYcCXMhRekTDxefgqwYSjueRoNx1Gqd2T4L87XibcnVAve+2o4AjhVS2YmRujvIdYdZH8gAnov6jeZzICAFg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz71xT1XGehZfGXihamdXb1pA0D+i5HCpnfVwDNXzLWWzOrVlfa
	Ke2AbIyH4tN4c8jH0mK4Cwj7WoCi3aZ4dXLRiw0R1+40OSabeZRMA6q0lMPP1gh4Cxs9imiPGw0
	qZgrK0XSX7eZubg1W2s0jSGCuYJrF3M4=
X-Gm-Gg: ASbGncvEivTPKzHVPaFt+hpLe+nSEbqe+odl/npegBYgDQC/alQZQf1iizag+ZbhY8a
	cieX6cvMR3gJGHqv2IWZbv0YsP3g+O7w38mfXJL4WR2EsOR2v2PCK/rySl7J5HXSBGSd3NZC+uY
	nkMqgQJsNUGpyKwUqwpgAcEtONiENkhMk8
X-Google-Smtp-Source: AGHT+IFyOIamAdvMd6PyTbKxN9A+KfVhNlUc26UeNq5/4kcHIWj1RvrgAIyHNMb7SFTTos+AIoRpMNq1w6r+sr9p6LI=
X-Received: by 2002:a17:90a:d006:b0:311:e9a6:332e with SMTP id
 98e67ed59e1d1-3134ded1839mr1619938a91.0.1749223297388; Fri, 06 Jun 2025
 08:21:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250524-rust-next-pwm-working-fan-for-sending-v1-0-bdd2d5094ff7@samsung.com>
 <CGME20250524211521eucas1p1929a51901c91d1a37e9f4c2da86ff7b0@eucas1p1.samsung.com>
 <20250524-rust-next-pwm-working-fan-for-sending-v1-2-bdd2d5094ff7@samsung.com>
 <q6dkihyfosi3k4mtrvyff54nbsjpovmujdbmoqhapo7daznpja@of2p5gtmcq2m> <b1c4792e-f997-4eba-a8ed-d2e3f76e3fdd@samsung.com>
In-Reply-To: <b1c4792e-f997-4eba-a8ed-d2e3f76e3fdd@samsung.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 6 Jun 2025 17:21:23 +0200
X-Gm-Features: AX0GCFvFtqr5rx5vUZL_23m9VolSo1UVOelTmGY--77dwJA0BboM7GZ90cFl2gw
Message-ID: <CANiq72kVvLogBSVKz0eRg6V4LDB1z7b-6y1WPLSQfXXLW7X3cw@mail.gmail.com>
Subject: Re: [PATCH RFC 2/6] pwm: Add Rust driver for T-HEAD TH1520 SoC
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org, 
	linux-pwm@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_082138_299101_FFC70F01 
X-CRM114-Status: GOOD (  11.87  )
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

T24gRnJpLCBKdW4gNiwgMjAyNSBhdCA0OjA44oCvUE0gTWljaGFsIFdpbGN6eW5za2kKPG0ud2ls
Y3p5bnNraUBzYW1zdW5nLmNvbT4gd3JvdGU6Cj4KPiBZb3UncmUgcmlnaHQsIHRoYW5rIHlvdS4g
VGhlIHdyYXBwaW5nX211bCBpcyB1bnNhZmUgZHVlIHRvIHRoZSBvdmVyZmxvdwo+IHJpc2sgeW91
IHBvaW50ZWQgb3V0LgoKV2hhdCBkbyB5b3UgbWVhbiBieSAidW5zYWZlIj8gYHdyYXBwaW5nX211
bGAgZG9lcyBub3QgdHJpZ2dlciBVQiBhbmQKaXQgaW50ZW50aW9uYWxseSBwcm92aWRlcyB3cmFw
cGluZyBhcml0aG1ldGljLgoKPiBUaGUgaWRlYWwgc29sdXRpb24gd291bGQgYmUgdG8gdXNlIHRo
ZSBrZXJuZWwncyBvd24gbXVsX3U2NF91NjRfZGl2X3U2NAo+IGhlbHBlciBmdW5jdGlvbi4KPgo+
IFJ1c3QgbWFpbnRhaW5lcnM6IFRoaXMgYmluZGluZyBkb2Vzbid0IHNlZW0gdG8gYmUgYXZhaWxh
YmxlIHlldC4gV291bGQgYQo+IHByZXBhcmF0b3J5IHBhdGNoIGludHJvZHVjaW5nIGEgbWluaW1h
bCBydXN0L2tlcm5lbC9tYXRoLnJzIHdpdGggIG9ubHkKPiB0aGlzIGJpbmRpbmcgYmUgdGhlIGJl
c3Qgd2F5IHRvIHByb2NlZWQ/IEl0IHNlZW1zIGxpa2UgYSB1c2VmdWwgdXRpbGl0eQo+IGZvciBt
b3JlIHRoYW4ganVzdCB0aGlzIGRyaXZlci4KClNvdW5kcyBnb29kIHRvIG1lLiBXZSBhbHNvIHJl
Y2VudGx5IGhhZCByZWxhdGVkIGRpc2N1c3Npb25zIGFib3V0CjY0LWJpdCBkaXZpc2lvbnMgaW4g
MzItYml0IGFyY2hpdGVjdHVyZXMgYW5kIGBjb25zdCBmbmBzLCB5b3UgbWF5IHdhbnQKdG8gdGFr
ZSBhIGxvb2s6CgogICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcnVzdC1mb3ItbGludXgvQ0FO
aXE3MmtlNDVlT3dja01oV0h2bXd4YzAzZHhyNHJueHhLdngrSHZXZEJMb3BaZnJRQG1haWwuZ21h
aWwuY29tLwogICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcnVzdC1mb3ItbGludXgvMjAyNTA1
MDIwMDQ1MjQuMjMwNTUzLTEtZnVqaXRhLnRvbW9ub3JpQGdtYWlsLmNvbS8KICAgIGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL3J1c3QtZm9yLWxpbnV4LzIwMjUwNTAxMDE1ODE4LjIyNjM3Ni0xLWZ1
aml0YS50b21vbm9yaUBnbWFpbC5jb20vCgpJIHdvdWxkIGFsc28gYmUgY2FyZWZ1bCBjaG9vc2lu
ZyB0aGUgbmFtZXM6IGlmIHRoZXkgYXJlIHN1cHBvc2VkIHRoZQpzYW1lIGJlaGF2aW9yLCB0aGVu
IHBsZWFzZSBwaWNrIHRoZSBzYW1lIG5hbWUgYXMgQy4gT3RoZXJ3aXNlLCB3ZQpzaG91bGQgYXZv
aWQgaXQuIEVpdGhlciB3YXksIHdlIHNob3VsZCBkb2N1bWVudCB0aGVtLgoKRm9yIGluc3RhbmNl
LCBpcyB0aGlzIHN1cHBvc2VkIHRvIGJlIGBtdWxfdTY0X3U2NF9kaXZfdTY0YD8gSSBndWVzcwpu
b3QsIGdpdmVuIGUuZy4gdGhlIGBjID09IDBgIGNhc2UuCgpJIGhvcGUgdGhhdCBoZWxwcyAmIHRo
YW5rcyEKCkNoZWVycywKTWlndWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
