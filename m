Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B5DD29C50
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jan 2026 18:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KEHPqnBrwoNRkjg2jKnHdf+WGLCAaZuREdUTcd8PHfQ=; b=NUQ9r6dLGad528
	BXkmmKQNPMFWFCtb4A0tQkE1VS1w1AezqDQp+bidlsyODylXz63egq11o5NGsbBacJ/PnxmS67M/s
	fo5r8FrupsFeS5iOJl3r+y09RJQSXA9nTz2XXXOM0SLoFlbfpBeUKNH48sleVH3AYpk26gAVkHjq5
	V6nIUuwfzNvLsZZzJ8NrcPX5gcEKlPFxbuH2u5iQ0jxXA23Fz2jny2sG2PskCrcXJPQAJDvwvRhX4
	7dG/pOBsW8mfIzsmLerp2rpjHl0+KAe7bDbvl1BGju6eeNBY5p9zNz85/Sft67k8XA4dybPwnQKfM
	h+h0wEtGjUHlEl28QHGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhtZY-00000002gOl-2LfT;
	Mon, 19 Jan 2026 18:01:52 +0000
Received: from mail-dl1-x122e.google.com ([2607:f8b0:4864:20::122e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhtZU-00000002gOH-2iSf
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jan 2026 18:01:51 +0000
Received: by mail-dl1-x122e.google.com with SMTP id a92af1059eb24-12336c0ae91so411950c88.2
        for <linux-riscv@lists.infradead.org>; Mon, 19 Jan 2026 10:01:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768845708; cv=none;
        d=google.com; s=arc-20240605;
        b=irjUgCEFw8cqWWi/FgbQ/sKQXOWGatRrYiSAU50GNj0WrJuUO7wMZWNy9IkHUD1O1M
         5Lqxjqh7d1QCQs5o9HqYukvFLmhnjuCcTxCzz5PBKvn/qChJicdX5lrFsVjPoQl9Bo9O
         qL3DeVSYPnt5JnuRbnGkadT86HNj89hlHOsVfR15IFiivvEYCodT25QLhZOrQBIQQ4cV
         OVWCyLkuFf0pch/DCSwp6bWMjrPGH+PWHXDmiuzicyXvU8/GOZWVDCjBRsVm6mhytbPH
         DN6ocmF5qSirsp/lbmGaAKOOLGeQWvdLOhM0kZFxaPXdCUl9aQeyfzE1FFbT4MXIXgPT
         7eig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Mj1iZoozHo2mgRESpJHRS1ASPF5/w4G9hbGEhm4hd+o=;
        fh=EimrEJGbzFEVKFqGIRjR5aHRfpC7KCkDirZfx8Jsxdw=;
        b=hzm4J7AMm3QpeayVDROb3ds8BrAopDBpdh9y9uqWDCKLqv8W9h5rBSLZ4RNzx9TLW0
         9PX2BulBYe/uKi+JUWzejCZwhjbXkMPX4qjCnaRQKr/PipzXDAUiIAm0z8xWx4nsjrCk
         8grhWxBPgblK7G9yZtA4MQiJSjrMA2PfwarJ0ZfPOMKVZG244rdlWNJ6vG0vDrG9Mz4X
         2rVe/6FAAUpiu3ReeTrYtUXjELkUd+coiS08WtRJvyjz0jaeZk5A8SD4pJw/DmI2AXJu
         SaXKePu0rIPqaY9yVJpPT13PWLsAx1l4lp0kzr4tkNdHIUE+4YIju+sH0Gjz72W+y3Il
         GDhQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768845708; x=1769450508; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mj1iZoozHo2mgRESpJHRS1ASPF5/w4G9hbGEhm4hd+o=;
        b=ROSxOENx+oCOE8aAHyvsvZ9XYJtczXZCE2wOPXfJVu8F8I0b++0qAbBY9xFZnp/DFE
         Yjrz7EMuthCztyFFI0rqDAh9ZqWgCc/r7lKAW1geMu7Vvl9LpiT+VgIi/L7KmsvWn9s2
         N2PKd3J56Bh+grgJ+yr4H/96Jx1iWL7qtodwp+oDddUoQKjFEnCKgWzTQ0NekEvpr5+v
         PIxXBpILp3ocFeg6YFc07C6h0yM7B4oMnp1k9tCIUPF0YPpkYBhg2I9ddBuI1AHTtUs5
         xwS45XF3jCkPSTcC7fuavHIEeMKgxD9yZUm8nK1aTRU0jaXVXsLjgO/c7hefdKLHmUPb
         bZug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768845708; x=1769450508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mj1iZoozHo2mgRESpJHRS1ASPF5/w4G9hbGEhm4hd+o=;
        b=QVyYJ8aVzFj3ypzRxHgKAgXbZejTWRmeJWmSoDU+Zn9w81cFsS2LH1Fk5bTgSiEQBD
         wjeUtqfSBgkLZmhiHiiGtb55w7lFCqE4UKyKluYsRUGxbK6bm+Svv2n9FvcMdscqBYtX
         zRFsuNpD0dFama6TQr4LjpjTGMxeeqvwR3kaQ2DUldZHi+ZYmXxYvEW+eQVH9MsF6eIa
         xTijL9KrRlbKO/goc/+41K0ea5spgFu9TO20BOE0NdeHySfkVJs7EylFtLgFfMrKg058
         sCeHb/gNpBZIZ0nSqUWenjcw/HuE+++foTbeWgRdbcdSdbFmL+GfhAvIfE8Wtf5f1ozl
         zJRw==
X-Forwarded-Encrypted: i=1; AJvYcCUDCU1TYSdYoEvpj4JfmRJZI5a1TxXCYWkdg9gUadVPj/8LWRMmoaAh43hfshXTOirxMiUO/ZYJj7X3bA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzol7Q2Fja1PWLbZH0XajJuu8760B1qoBH/MdnsQsenY8dz56gT
	OggYIAcLYMCIOCJ4b7Y5m/slv019meqc6KILF41L/EPaUsOzfCglLnYvgJQpAql2u6bS9UDvi92
	/69gha6brl+kv15uTuiPWT03L261TV2c=
X-Gm-Gg: AZuq6aIIhFV03S3SOw3Mmvc25A5F2PdGhoYUewznjXXv/F2l4cDibtayGvFnVsviDiU
	pVOpJ2X7yhhg3ly5oCqdQ9UFDhcljWDpSNKaxoINJeIwm7j9AcH1p7oDBsrOyv8ewWMVPLyJ5lG
	wL2X5ixgvXv5uMEOBJxAG6Erv1FG3+JfW6QzOC7TGbs9BhDuZD46wXh0g+FyEd/tHtq5Wk9fwbf
	06pL+AVAlRXTbBA0e4Bd+Rvz69w8xpWhgO8Iwr33hv5Q0L64GE/zaBdf43uIDZJIeyJabyIDQM5
	GKbNAEzJkvDXsFFI8ZDHSMLobMCOuCVHtHnKmykiZEMmdShoEODGC95DVDKKys38S+MnUbxjgbl
	9Fqil2Pm7pYgV
X-Received: by 2002:a05:7300:6d06:b0:2b0:2e6:5363 with SMTP id
 5a478bee46e88-2b6f6f808a9mr129151eec.1.1768845707489; Mon, 19 Jan 2026
 10:01:47 -0800 (PST)
MIME-Version: 1.0
References: <20251222-cstr-pwm-v1-1-e8916d976f8d@gmail.com>
 <CAJ-ks9mrpcLaeiGjBcXNqTUwo00Y2MhhHWnWauou6exU1y920Q@mail.gmail.com> <2wmijhs5pbrynsgxuropvlxuozsubk7euybxzwc5ox2a3izfci@v6hzmzs5pmml>
In-Reply-To: <2wmijhs5pbrynsgxuropvlxuozsubk7euybxzwc5ox2a3izfci@v6hzmzs5pmml>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 19 Jan 2026 19:01:33 +0100
X-Gm-Features: AZwV_QiT9HJYrgBsJ2EfKS49UFQygV8XYXgkjsQ2HaIze_49iHqtRlkRLMtga98
Message-ID: <CANiq72mSxtO0s8xGhgYemfz9DvvwDzC0fsF2covGFspduDz5XA@mail.gmail.com>
Subject: Re: [PATCH] drivers: pwm: replace `kernel::c_str!` with C-Strings
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: Tamir Duberstein <tamird@gmail.com>, Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Michal Wilczynski <m.wilczynski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_100149_948473_8B826DD2 
X-CRM114-Status: UNSURE (   8.67  )
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

T24gTW9uLCBKYW4gMTksIDIwMjYgYXQgNTo1M+KAr1BNIFV3ZSBLbGVpbmUtS8O2bmlnIDx1a2xl
aW5la0BrZXJuZWwub3JnPiB3cm90ZToKPgo+IEkgZGlkLCBidXQgZ2l2ZW4gSSdtIG1vcmUgb3Ig
bGVzcyBydXN0IGlsbGl0ZXJhdGUgSSB3b3VsZCB3ZWxjb21lCj4gZmVlZGJhY2sgYnkgTWljaGFs
IFdpbGN6eW5za2kuIEkgb25seSBub3cgbm90aWNlIHRoYXQgaGUgd2Fzbid0IG9uIENjOgo+IHVw
IHRvIG5vdy4KClRoYW5rcyEKCkluIGNhc2UgaXQgaGVscHMsIGZvciBjb250ZXh0LCB0aGlzIGlz
IHBhcnQgb2YgYSBsb25nIG1pZ3JhdGlvbjoKCiAgICBodHRwczovL2dpdGh1Yi5jb20vUnVzdC1m
b3ItTGludXgvbGludXgvaXNzdWVzLzEwNzUKICAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2Fs
bC8yMDI1MDcwNC1jb3JlLWNzdHItcHJlcGFyZS12MS0wLWE5MTUyNDAzNzc4M0BnbWFpbC5jb20v
CgooQFRhbWlyOiBpbiB0aGUgZnV0dXJlLCBmb3IgcGF0Y2hlcyBsaWtlIHRoaXMsIGFuZCBlc3Bl
Y2lhbGx5IHNpbmNlCnRoZSBwYXRjaCB3YXMgc3BsaXQgZnJvbSBhIHNlcmllcyBhbmQgd2FzIGEg
bXVsdGktc3RlcC9tdWx0aS1jeWNsZQptaWdyYXRpb24gZXRjLiwgaXQgcHJvYmFibHkgaGVscHMg
dG8gZ2l2ZSBtYWludGFpbmVycyBzb21lIGNvbnRleHQKd2l0aCBMaW5rOiB0YWdzIHRvIHRoZSBv
bmVzIGFib3ZlKS4KCkNoZWVycywKTWlndWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
