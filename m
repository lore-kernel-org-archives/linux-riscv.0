Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B65C4829E
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Feb 2024 19:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vJzZ0lKcyAGTuL/fkP1ssD49EWGiocDcc5mtwPL2MMs=; b=LqOUKdZPbEkoCe
	3aa7zFj6XebK3wK4/+sBEU9P3MiFCmHeNkFw+Qylq3sr8JLNXUrUTbis1E6xbf6lHZSNN2T52I14Y
	TxzS54LR88OES0h/77rEsfmQPwYBPRhcIcozmlXab1jLpq5skmrqwUu60VWmUFoJwvef7KwRAYiSd
	pQ/kD2sATaizW593cCdFv9PYPJQZ+berKTZf/VbYOCLUartNxzjDm6RJek8xmZgMt3nOmEQ1Syx8V
	8DyRZVMdsCKKC/+uvU215eTcE4FOg+63d4tByT051TnTIydOQLosi92eLqSAhzbQpuM15vqrXsjgB
	gLabpE73moaytYTSiIBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZbiL-00000006jBP-3Gd2;
	Mon, 12 Feb 2024 19:11:37 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZbiI-00000006jAA-21h7
	for linux-riscv@lists.infradead.org;
	Mon, 12 Feb 2024 19:11:36 +0000
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-dc75c5e3151so90551276.1
        for <linux-riscv@lists.infradead.org>; Mon, 12 Feb 2024 11:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707765093; x=1708369893; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uShb6ZcgqhX2ALUmZCWrjlz3y5tvNFOTevE37zcmKJA=;
        b=OxM+scgjp8IlAH7kVNJRwmFnFjQUrRf1HEmAfetZ1asoG+XFZqUm6SF6zqV0z508o0
         9KvdGcoUrYSg3Stgy8Lu5PkNaJ7RypGkBUreebVlX5MOHMIRj59yYn3kVX0zzWeeaRH5
         Bcy+OA6N0AsohOjuyL/vHOxE6TqMmQZFl0EzgXUPzbNy1qBqG5XmVlfM+fAhPgTqq/H8
         2us4RiUXhkFagERt5m1wVdYlSVvB1nGmPz8fqbWGWh9J767EVtFMhjy3I0BuAaFO9sbz
         dXGHa2M+6+E4titcHdBann8muuxrbIfgsobBg6ArNdx3weRtAVldRnDYfEbpy5gu3dQZ
         7BYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707765093; x=1708369893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uShb6ZcgqhX2ALUmZCWrjlz3y5tvNFOTevE37zcmKJA=;
        b=gJT45KSp+3ZlykHbKwS5yLdVTPOhU6imDtFk0qlxRvmZ2sLvLLuOlPf+AbAPU7WLbS
         CscK3K7+RyCjaY1zc2On1i8CJGu4E3DRPB3osRbaE5Q6Os+1ytl0ZtyE0Vc6Bbl3ksJg
         vwYU9bzzKzwuCtO4cRfwl6vdFQ0sQE1gk0r7amolnwovHXgwpGo+li2r198GrvnA65gg
         G5Fs8RhJo2pZLGm56w5pP65A19V8RZ+mTwp7U6FJP/ur0sstb5/uXE5HHy0QFkVOwSqY
         Hm0or+zxL1pv9V9TcmYdHzN3f1Ygm/UtJ2xT0yXrGwNplBJQPD1MPRibxSgghaNvWfuX
         ldLA==
X-Forwarded-Encrypted: i=1; AJvYcCWr85IER1OTsoLqPhqcgT5haKtMdayxHhgo/r9EmK5bVRpCZ6v9+SntWsjCxe5YLuVVCullr1ANSoqoJ5HOmzWcC5s21LrTuTopKi16TXnj
X-Gm-Message-State: AOJu0YxQgd5cdbJv4hBJ419TOwHMRO6Zfn/JJNeSOgBgNaL9s7MRcdI9
	pwrvQoGy6JRuFRwJ4iyKMePK4GiF7lG6jAFnH7TGaI6zaxtgQoflk6Dpbq8GLXKLPhGgxMwTSwI
	ShywPSaXHTsh8q7JdRhEQdEhi3Fs=
X-Google-Smtp-Source: AGHT+IHqXLnUCxAsb7XvKnFAPSGDB3hUHETodqtr+uDm3QdrNT5WCj6II1sL9VaSLYPlv+uufOR+eCV6bruG7EgGquo=
X-Received: by 2002:a05:6902:4e6:b0:dc7:4758:7802 with SMTP id
 w6-20020a05690204e600b00dc747587802mr6000531ybs.48.1707765092762; Mon, 12 Feb
 2024 11:11:32 -0800 (PST)
MIME-Version: 1.0
References: <20240117-swiftly-parasail-618d62972d6e@spud> <CANiq72mVKCOAuK4Qe+8AHmpkFwyJsVfx8AqB7ccGi3DYpSSWcw@mail.gmail.com>
 <20240118-implode-delirium-eefdd86e170e@spud> <CANiq72nx1s_nyvPW86jL7eiOxROr18LfOJqNtw8L42CP+gkhRg@mail.gmail.com>
 <20240125-bucked-payroll-47f82077b262@wendy> <CANiq72k7n0aZrifRRU08N8qLkNe+2EZwijZy5sM7M56n2xYHgQ@mail.gmail.com>
 <20240125-lazy-thrower-744aacc6632a@wendy> <CANiq72kb+_utZrYHtoKZQtQazikmkjpVUHpTBcaANizduMF5QQ@mail.gmail.com>
 <20240126-eccentric-jaywalker-3560e2151a92@spud> <CANiq72nu2NXUWYanHZd5EXgX4P_v673EWn6SCRW60Es9naraQQ@mail.gmail.com>
 <20240209-rage-keg-1b2982cd17d9@spud> <CALNs47sRqAbE=u3=_ciO2oge7Afz-6GBBhW+BwcLRET-TsuxTg@mail.gmail.com>
 <CAOcBZORDaHHH3jTL3GO7OsDubhhyQE0Uy2uAjJpiRzrKBgqaOw@mail.gmail.com>
In-Reply-To: <CAOcBZORDaHHH3jTL3GO7OsDubhhyQE0Uy2uAjJpiRzrKBgqaOw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 12 Feb 2024 20:11:21 +0100
Message-ID: <CANiq72=VBFvB9O9c84YxpBBftpfNnnXx-+Xes0h8h6rN3EN5pA@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] RISC-V: enable rust
To: Ramon de C Valle <rcvalle@google.com>
Cc: Trevor Gross <tmgross@umich.edu>, Conor Dooley <conor@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Matthew Maurer <mmaurer@google.com>, Sami Tolvanen <samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_111134_548301_BEA3C1E0 
X-CRM114-Status: UNSURE (   7.92  )
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

T24gTW9uLCBGZWIgMTIsIDIwMjQgYXQgODowMuKAr1BNIFJhbW9uIGRlIEMgVmFsbGUgPHJjdmFs
bGVAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4KPiBTb3JyeSBmb3IgdGhlIGxhdGUgcmVwbHkuIFNhbWkg
bWlnaHQgYmUgdGhlIGJlc3QgcGVyc29uIHRvIGFuc3dlciB0aGlzLCBidXQgS0NGSSAobm90IENG
SSkgdGVzdHMgYXJlIGxvd2VyZWQgYnkgcGFzc2VzIHRoYXQgYXJlIGFyY2hpdGVjdHVyZSBzcGVj
aWZpYyAoc2VlIGh0dHBzOi8vcmV2aWV3cy5sbHZtLm9yZy9EMTE5Mjk2KSwgc28gd2UnZCBuZWVk
IHRvIGFkZCBzdXBwb3J0IGZvciBSSVNDLVYuIFRoZXJlIGlzIG5vIGFkZGl0aW9uYWwgd29yayBy
ZXF1aXJlZCBpbiB0aGUgUnVzdCBjb21waWxlciBiZXNpZGVzIGVuYWJsaW5nIGl0IGZvciB0aGUg
bmV3IHRhcmdldC4KClRoYW5rcyBhIGxvdCBSYW1vbiEKClRoZW4gZm9yIFJJU0MtViBsZXQncyBn
byBmb3IgdGhlIGBkZXBlbmRzIG9uYCBmb3IgdGhlIG1vbWVudCwgYW5kIHdlCmNhbiByZW1vdmUg
d2hlbiB0aGUgc3VwcG9ydCBsYW5kcyBmb3IgUklTQy1WIChpZGVhbGx5IHdoZW4gc29tZW9uZSBo
YXMKbWFuYWdlZCB0byBib290IGl0IGF0IGxlYXN0IHVuZGVyIHNvbWUgY29uZmlndXJhdGlvbiku
CgpDaGVlcnMsCk1pZ3VlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
