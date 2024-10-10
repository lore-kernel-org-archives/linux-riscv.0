Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 665CCCF11FD
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 15:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6DkUc90LG6DdNL5cpNdWpNqGcStvtQgVGubp/0SjLoU=; b=vcjzbekdP0w0zx
	GDQ7u770IixAK3RASGgB3Z/dHPAckLtTpOhJOY9uyBaFKO5RTo+kG41vF62ZeDrQlnmDJF4a+yrxD
	dJ9my6VvY/gM55aIESC7xGqN7/BJ/3WoFyizVT2Fd/AMfC5NocIPPvoO78kOGntCwg/66vtw/FNnM
	+IZqMoVLvdNnHRG9zKCRSeeV8F7U2Q9yrK0de+fLgEewFqcIZJJ01OIADwCvWL9zRvm4YhtZpqr/z
	sBLr1OXqR3T7dY9XkCSTpOlpJEmGYND52JSXYynE8rG5nWqGckD2Awv2cQbJGFUPi5ocu65Qdelp/
	SeAp7fQAdzT/Jp0nazBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syuxU-0000000DIcl-3ccV;
	Thu, 10 Oct 2024 15:20:08 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syuTH-0000000DBl7-1hs6;
	Thu, 10 Oct 2024 14:48:58 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-71de91427d5so122664b3a.2;
        Thu, 10 Oct 2024 07:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728571734; x=1729176534; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wk8mOEtaS0st9RtIbPiyvPicjXJuaraec7PuPjhsQZk=;
        b=gndPWn5T2QxIy/UNiHu/1Z3/S2fuM8eR5W+JD+Ig+m0+anKW0lTj1MIn4ASGSbAEWz
         9ezSuvAz0AArfwgfyTUzSe5t+hfxyRuxrHcSKiy17ztsUOsQGNVjBc2TEAOYnaT449E9
         rQHu4XkbymnhJb5hN9JC8180ilQXcZQdgGhEtb3WGT85KdgBBDq1DmFLNzEbholAcYgu
         AG8MZbP6U13GA/Md5gpN+kDBYCA5utot8206QcMaogq00NF918a9qFLkjELfkY/zonFI
         pjbmH2oDVz8dZJpQVhOuBszo7RWIaA3JVPxabXduApXulz3lpnHUBuykJRlmxcKmoljt
         cGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728571734; x=1729176534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wk8mOEtaS0st9RtIbPiyvPicjXJuaraec7PuPjhsQZk=;
        b=IBURGstt6X8g8iQtrD64B5afBzXW4OnZ3N5UxQ4hBUTh4xmxG9to3JUpt5TH12QWHG
         rIGPuh0IFubvbKZ37H9DFBKLldYH3qadozbtmf1jvdDrde1r0UCfrm0pVtsxpy1I0Dd7
         wc0Mv/bo2MbgyAmWiHdqRquDl//7pwdrmdFvFRt8LFQItmITS5UHz7oeWjOWmQ3aHrBq
         dCfW0Gjxu2Urr1vu3m/Xpu5hu9IC1Dx6Y5zchaeMQc24moyppFohQjxnMpqRM37VlL7v
         PNQn9xijOU8IlOLsF/oOh18KtA0bRgvjOEcvX7/oDZH/cwRYAmLBsC9VpskjYcJYEuzV
         zi7g==
X-Forwarded-Encrypted: i=1; AJvYcCVHnGT7lDaeauYYVdV3bbQqyKt85sBXjXg5l0N6NqvFCjc/vq16Ww15VMqeFh5rKiz/GeP7dtulEH6rBXjBleib@lists.infradead.org, AJvYcCXLHGWW7eBXXW0gYAs/UdD25qrB4Y9/6m7U0amVH68yzpKyIUk2GfcqqqHfIiAQ8NnIf3fdb5RpLpuwH2w=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywtbw+W6ZGMZ88/CcmkWgHj+r3eGxz2l/iqA1cy+hupiq0LcAgZ
	fnUsO5w2geKFeYtEHzpPA4wIN0YBcl0WKedoU8ZtejtXYoehg2MBQfonnt52OoCHFw7jCdL1mdd
	rdjYN1D2iZcUaO7fCRI01mcg1Z8c=
X-Google-Smtp-Source: AGHT+IEljzpMu1ACQ6sQRA8RzgwL3HdCJr8K4MQxtTnAtECkzV3J/8bQwyLAxm6Zuns2qv11cRQg+5TXDKwx0rMQsBI=
X-Received: by 2002:a05:6a21:3397:b0:1cf:2be2:5e5b with SMTP id
 adf61e73a8af0-1d8a3c59cb2mr3823983637.11.1728571733800; Thu, 10 Oct 2024
 07:48:53 -0700 (PDT)
MIME-Version: 1.0
References: <20241008-cfi-patchable-all-v1-1-512481fd731d@google.com>
 <ZwbAvEnrzu6UUgGl@J2N7QTR9R3> <CAH5fLgipBfd5pNKqniXqFudruyGaJG=LDc5MEf3Yxq1yRMmQcw@mail.gmail.com>
 <ZwewMw8jBh6OU-L_@J2N7QTR9R3> <20241010110344.GL14587@noisy.programming.kicks-ass.net>
 <20241010113748.GL33184@noisy.programming.kicks-ass.net> <CANiq72=kT9RFcQ3h5U+wAY0pDQQqGU7BTtiPJ-oiHNUG00z3=w@mail.gmail.com>
 <20241010130421.GG17263@noisy.programming.kicks-ass.net>
In-Reply-To: <20241010130421.GG17263@noisy.programming.kicks-ass.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 10 Oct 2024 16:48:41 +0200
Message-ID: <CANiq72kbApTtdLeow5L6G6t4Q_L-0zkDwfwyWcSb_e6P=kO06g@mail.gmail.com>
Subject: Re: [PATCH] cfi: rust: pass -Zpatchable-function-entry on all architectures
To: Peter Zijlstra <peterz@infradead.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Alice Ryhl <aliceryhl@google.com>, 
	Matthew Maurer <mmaurer@google.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Kees Cook <kees@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, 
	rust-for-linux@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_074855_461575_AD0D5B51 
X-CRM114-Status: GOOD (  15.86  )
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

T24gVGh1LCBPY3QgMTAsIDIwMjQgYXQgMzowNOKAr1BNIFBldGVyIFppamxzdHJhIDxwZXRlcnpA
aW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4KPiBBbHNvIG5vdCBydXN0LXNyYywgYmVjYXVzZSBmb3Ig
c29tZSByZWFzb24geW91J3JlIG5vdCBhY3R1YWxseQo+IGZyZWVzdGFuZGluZyA6LwoKSXQgaXMg
dGhlcmUsIGJ1dCBpdCBpcyBhIHN1Z2dlc3RlZCBwYWNrYWdlLCBzbyBJIHRoaW5rIHlvdSB3b3Vs
ZCBuZWVkCmUuZy4gYC0taW5zdGFsbC1zdWdnZXN0c2A6CgogICAgaHR0cHM6Ly9wYWNrYWdlcy5k
ZWJpYW4ub3JnL3RyaXhpZS9ydXN0LWFsbAoKUmVnYXJkaW5nIGZyZWVzdGFuZGluZywgd2UgdXNl
IGBub19zdGRgLCB3aGljaCBvbmUgY291bGQgYXJndWUgaXMKc2ltaWxhciB0byBDJ3MgZnJlZXN0
YW5kaW5nLiBUaGF0IGlzLCB3ZSB1c2UgYGNvcmVgLCB3aGljaCBpcyBhIHN1YnNldApvZiB0aGUg
ZnVsbCAoaG9zdGVkKSBzdGFuZGFyZCBsaWJyYXJ5LCBqdXN0IGxpa2UgQyByZXF1aXJlcyBzb21l
CmhlYWRlcnMgZXZlbiBpbiBmcmVlc3RhbmRpbmcuCgpIb3dldmVyLCBJIHRoaW5rIHlvdSBtZWFu
IG5vdCBldmVuIHVzaW5nIHRob3NlCmhlYWRlcnMvc291cmNlcy9saWJyYXJpZXMsIHdoaWNoIGlz
IGZhaXIuIFJ1c3QgY2FsbHMgdGhhdCBgbm9fY29yZWAsCmJ1dCBpdCBpcyBjdXJyZW50bHkgaW1w
cmFjdGljYWwgdG8gdXNlL21haW50YWluIGFuZCB0aGVyZSBhcmUgYSBsb3Qgb2YKdXNlZnVsIHRo
aW5ncyBpbiBgY29yZWAgd2Ugd2FudCB0byB1c2UgYW55d2F5LCBzdWNoIGFzIHRoZSBgUmVzdWx0
YAp0eXBlOgoKICAgIGh0dHBzOi8vZG9jLnJ1c3QtbGFuZy5vcmcvY29yZS8KClRoZXJlIGFyZSBz
b21lIHRoaW5ncyB0aGF0IHdlIGNvdWxkIHJlbW92ZSwgdGhvdWdoLCB3aGljaCBpcyB3aHkgSQph
c2tlZCBsb25nIGFnbyBmb3Igd2F5cyB0byByZW1vdmUgdW5uZWVkZWQgdGhpbmdzIGZvciB0aGUg
a2VybmVsCigibW9kdWxhcml6YXRpb24gb2YgYGNvcmVgIikuIFdlIGdvdCBgbm9fZnBfZm10X3Bh
cnNlYCwgaW1wbGVtZW50ZWQgYnkKR2FyeSBiYWNrIGluIDIwMjEsIGFuZCB3ZSBjb3VsZCBwZXJo
YXBzIGdldCBtb3JlIGluIHRoZSBmdXR1cmUgaWYKcmVhbGx5IG5lZWRlZC4KCj4gWWVhaCwgYnV0
IHRoZW4geW91IGhhdmUgdG8gZmlyc3Qga25vdyB0aGF0IHdlIGhhdmUgdGhpcyBmaWxlIHRvIGJl
Z2luCj4gd2l0aC4KClRoYXQgaXMgZmFpciwgYnV0IGhhcmQgdG8gZml4LiBXZSB0cnkgb3VyIGJl
c3QgdGhvdWdoOiB0aGUgIlJ1c3QiCmVudHJ5IGlzIGluIHRoZSBmcm9udCBwYWdlIG9mIHRoZSBr
ZXJuZWwgZG9jcyBhbHJlYWR5LCBhbmQgdGhlIGZpcnN0CnBhcmFncmFwaCBvZiB0aGF0IHBhZ2Ug
bGlua3MgdG8gdGhlICJRdWljayBTdGFydCIgZ3VpZGUuCgpDaGVlcnMsCk1pZ3VlbAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
