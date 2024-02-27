Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D334C5478C
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 18:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U1hab29UWiWKVjf0Muq8leVPajWTwbtyMgx4/Uv6pBA=; b=ZMoq/AfXhueYmU
	DtOzQE8l8ID7ou6x8v3BV2s3O1XUfVegZIjfWU25zyDt/HCVpN1T/XEgv/4QF48A2qKVlJy+1Agix
	TtlmMOy+24nyfU8Sufw2e99S5rwYMg6PmAKonwvx6rph2i4/YoqvvKMCvUnGgha6wlhqZO0LjPhHy
	DZGhNzKlIPK4YHKkBtwg97uaMfz5IKx+SdvHeG4oURNucGqgCZvQ+I3uEiPFbYrBqJ9zg7jlqhWHS
	q5NRwwjJiyziNzYuqvlHzIk2+phZRizT8Gup0CcTyPU81A/jaY914FgyhcNLqEoKlJXYccLL3s2IW
	YLIX5iYqWepL6V2dcscw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf1vT-00000006Mxf-3rju;
	Tue, 27 Feb 2024 18:11:35 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf1vR-00000006Mx2-0yT9
	for linux-riscv@lists.infradead.org;
	Tue, 27 Feb 2024 18:11:34 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1d944e8f367so33397555ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 27 Feb 2024 10:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709057491; x=1709662291; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MMz4gkSGSqX8KBz3u9sPg+H10dtSow275aT+2BTX1/c=;
        b=RDtmaJZvjiwq+cIWt6RX2868jTp4XAwl4pwihzHpdkRLGvre7k1B12GAVLXDcFH09v
         mfJobu3Qgjx+waGFODX9wJbtikQJktl136gw+GmLvhoyDJMUT+HzRAjOntM5n8ePhKrj
         f491E+HbLlQ4lXUE4YQJu025OzhJUZ3M/Nfc7Ap/Z1EScR3S64QPYYrEWKMAVSIFPPFy
         kYiirw6UPIH9efNyV3uQkgzCQhbp3srCcwLbZ2V6fQazW234AbxbKwWPKX7HM9kJRLef
         qQmW8wVeOd3MAhgJlSSuLEgc2eUGxym0tcGVLqdLF8BWOAN8jrlz+Q438tInLn3bV7Pz
         tRvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709057491; x=1709662291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MMz4gkSGSqX8KBz3u9sPg+H10dtSow275aT+2BTX1/c=;
        b=fXyf2qgosmxLvt0zpHULguec08fffS2Atm1igv1cNKhnVhQSyIaEW4g5mWXnfO9Cza
         yL90KKrRhzMxCidgY/iRWouQTnYq/zOQYynneDPaPdG3jstORKpYlMY1ZC1JT6eyNmWK
         pgUNSR9+UFfXSeEK0O0pPUzXaydAWHfMS9KCrUgxcn9wdisrU3pcxBARvcS+8AsvCWZl
         +iNtUwrbzdhquNZI5n2G9BDBRU1BtmntiBclNswwmzBXnBY02o5tFoDWqSYD9hIU3T2i
         oW+qBc+pMe8Mbuy1y/6PYNeFgDQx375xCdkZI6EEd8lBjOj4YmKWAASWkFXQ3y9x+G03
         j06w==
X-Forwarded-Encrypted: i=1; AJvYcCVUxnGRygjx80Ya24XBsqHnWQ/hIw/vZ5b69I2NOdheVX9pcM2sqbNHrhU9r8mam03tzsBcRWLhgVqKwnUvLdpF5mFfwShOsaurbYiHFYUH
X-Gm-Message-State: AOJu0YzRoke8+glE6FxHheAzCIymTaIwu6M/wxx040gpz2rzdimJBu8s
	6BY7M/fUE4OvauBrSq7WKqmcVb8rbBVJI42NQrWItetKAKeyVDiAXpsgSJXYvaKRPbbmPvzlDcr
	KwfZ+vWV56kby5R0xuUvDqWa4i+I=
X-Google-Smtp-Source: AGHT+IEsUCrkq/OPRo37hLxEJi/HVswFjqS4zKGwkwKwXanq1jXthlIIw0jzgDza4ht+oCgXlPGyJKryUUW06LAmzOk=
X-Received: by 2002:a17:903:2309:b0:1dc:b4ef:b199 with SMTP id
 d9-20020a170903230900b001dcb4efb199mr3828629plh.36.1709057490589; Tue, 27 Feb
 2024 10:11:30 -0800 (PST)
MIME-Version: 1.0
References: <20240223-leverage-walmart-5424542cd8bd@spud> <20240223-employee-pessimism-03ba0b58db6b@spud>
 <CANiq72ngEZskjH0f=8+cJuQsFTK227bGCxe5G0STMHuPbZYnXg@mail.gmail.com>
 <20240227-resolved-deceit-4a59a6af5b71@wendy> <CANiq72mwM+4Oh-H5WmRoqQ_nE1w-eJ1wn-nEwS=BR9JRwzxMMQ@mail.gmail.com>
 <20240227-glove-underwire-f562a56cf2c7@wendy> <CANiq72=f03_bw9B8ww8UxHkVyP2F7ZPyvC+KWCyhO3Nk1yqdaw@mail.gmail.com>
 <20240227-swarm-serpent-2010b255f68a@wendy> <CANiq72=69uBBhKMrw5P8K6eDHPiwAw_Oj8g1aYcywEYhhUG8OA@mail.gmail.com>
 <20240227-timothy-jailbreak-01a9c29f3607@spud>
In-Reply-To: <20240227-timothy-jailbreak-01a9c29f3607@spud>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 27 Feb 2024 19:11:17 +0100
Message-ID: <CANiq72kQ8===wFLQNCR-XAo9KdtPr44UKvyi2074J88vh3kvyg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] scripts: generate_rust_target: enable building on RISC-V
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_101133_297542_DE786C4B 
X-CRM114-Status: GOOD (  16.97  )
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

T24gVHVlLCBGZWIgMjcsIDIwMjQgYXQgNjo0OOKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBObywgSSBkaWRuJ3QgYWN0dWFsbHkgdHJ5IGFueXRoaW5nLiBC
ZXR3ZWVuIHRyeWluZyB0byB0ZXN0IHRoZSBrY2ZpCj4gc3R1ZmYgb24gYXJtNjQgYW5kIHRoZSBv
dGhlciB3b3JrIEkgd2FzIGRvaW5nIHRvZGF5IEkgZGlkIG5vdCBoYXZlIGEKPiBjaGFuY2UgdG8g
YWN0dWFsbHkgcGxheSB3aXRoIHRoYXQgeWV0LgoKQXBvbG9naWVzLCBJIGRpZG4ndCBtZWFuIGl0
IHRoYXQgd2F5IC0tIEkgd2FzIGp1c3Qgd29uZGVyaW5nIGlmIGl0CmRpZG4ndCB3b3JrLiBObyBy
dXNoIG9uIG15IHNpZGUgKGluIGZhY3QsIEkgdGhvdWdodCB0aGlzIHdhcyBmb3IgNi4xMAphbnl3
YXkpLgoKPiBJdCBjb21lcyBkb3duIHRvIHlvdSB0aG91Z2ggSQo+IHN1cHBvc2UgLSB3b3VsZCB5
b3UgcmF0aGVyIGhhdmUgZ2VuZXJhdGVfcnVzdF90YXJnZXQgZW5hYmxlIHRoZQo+IGNvbXByZXNz
ZWQgaW5zdHJ1Y3Rpb25zIGRlcGVuZGluZyBvbiB0aGUgY29uZmlnIG9wdGlvbiBvciBoYXZlIHRo
ZQo+IE1ha2VmaWxlIGRpc2FibGUgaXQgaWYgY29tcHJlc3NlZCBpbnN0cnVjdGlvbnMgYXJlIG5v
dCBlbmFibGVkIGFuZCB1c2UKPiBhIGJ1aWx0aW4gdGFyZ2V0PwoKU28gdGhlIGN1c3RvbSB0YXJn
ZXQgc3VwcG9ydCBpcyB0aGVyZSBmb3IgZmxleGliaWxpdHkgcHVycG9zZXM6IHdlCndlcmUgdG9s
ZCBpcyB0aGF0IHNpbmNlIHRoZSB0YXJnZXQgc3BlYyBpcyB0b28gdGllZCB0byBMTFZNLCBpdCBp
cwp1bmxpa2VseSB0byBnZXQgc3RhYmlsaXplZCAoYXQgbGVhc3QgYXMgaXQgaXMpLCBhbmQgdGh1
cyB0aGV5CnByZWZlcnJlZCB0aGF0IHdlIGFzayBmb3Igd2hhdGV2ZXIgZmxhZ3MgaW4gYHJ1c3Rj
YCB3b3VsZCBiZSBuZWVkZWQgdG8KdHdlYWsgdGhpbmdzIGluIGFuIGV4aXN0aW5nIGJ1aWx0aW4g
dGFyZ2V0IChvciBhZGQgbmV3IGJ1aWx0LWluCnRhcmdldHMgaWYgbmVlZGVkKS4KClRodXMsIHdo
ZW4gYSBuZXcgYXJjaGl0ZWN0dXJlIGlzIGFkZGVkLCB0aGUgcXVlc3Rpb24gaXMgd2hldGhlciBv
bmUKY2FuIGFscmVhZHkgdXNlIHRoZSBmbGFncyBhcHByb2FjaCBvciBub3QuCgpGb3IgaW5zdGFu
Y2UsIHRvIGRpc2FibGUgdGhlIGNvbXByZXNzZWQgaW5zdHJ1Y3Rpb25zLCBmcm9tIHdoYXQgSSBj
YW4KdGVsbCwgdGhlIGZsYWcgSSBtZW50aW9uZWQgc2VlbXMgdG8gd29yaywgc28gdGhhdCBpcyBm
aW5lLiBIb3dldmVyLApmb3Igc29tZXRoaW5nIGxpa2UgdHdlYWtpbmcgdGhlIGRhdGEgbGF5b3V0
IGZvciBgbjY0YCBpbnN0ZWFkIG9mCmBuMzI6NjRgLCBJIGFtIG5vdCBhd2FyZSBvZiBhIHdheSB0
byBkbyBzbyB2aWEgYSBmbGFnIChidXQgSSBzZWUgbmV3ZXIKTExWTSB1c2VzIGBuMzI6NjRgLCBz
byB0aGF0IG1heSBiZSB0aGUgYmV0dGVyIG9uZSBhbnl3YXk6Cmh0dHBzOi8vZ29kYm9sdC5vcmcv
ei9FaDRjZmRlTXIpLgoKU28gaXQgYWxsIGRlcGVuZHMgb24gd2hldGhlciB5b3UgYXJlIGhhcHB5
IHdpdGggd2hhdCB0aGUgZmxhZ3MKYXBwcm9hY2ggYWxyZWFkeSBnaXZlIHlvdS4KCkkgaG9wZSB0
aGF0IGNsYXJpZmllcyBhIGJpdCEKCkNoZWVycywKTWlndWVsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
