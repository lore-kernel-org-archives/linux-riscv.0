Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52428CAC581
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Sep 2025 17:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9r7Cbm3cWOUfRKy8D0IQKnfvxh8eadQ+p2CrYK6jF7g=; b=rLC9Jtmfd/RjnW
	g3fPnb6a41Kr0P87YKMgf2oOZvQaDWfvdQQNi45xmPoySbHd1B3M+dWiG3Kzo2XjR178jOgSykZHk
	vVvjqNLAgljPabIjzyrBUUKOFQucwDONdK8Ecwz3ecEmRr9bLGBffHvL1URY92B2VkNOHtYtw72O/
	AmU21ICP0DahR1Fy+S7jn12EcAiQJ0LXgXHcPccAL1KUJyotcd976XHp42g6pjEQoGlcaaJ6cn1gX
	eeRzx2yNq1mgSmNPJk0f/bRPooDCi74Uem5gLaHJ+SlgnHYQaBD6Sr/Bt0znIInBbOdreMjo3mDTC
	NarvfEGCmHdxlS/fUHhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfUx-000000019Rs-2PC1;
	Mon, 08 Sep 2025 17:17:47 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvcyl-000000009SE-3v04
	for linux-riscv@lists.infradead.org;
	Mon, 08 Sep 2025 14:36:24 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-24b150fb800so11970925ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 08 Sep 2025 07:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757342183; x=1757946983; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FIVWf3bpKmjp75cp07PUchurcybMcPfdUSIyZqVIJkQ=;
        b=TxuuwLLAK7CxHELT5LTKl7mibFiQI+W5hB1GP2Flan/jFmRUBaYlOyHl4PWlEj9Rdw
         b83KBr4P+WglGW+GnLNjUubwLwIyKikCf51aPKeEEUzV3936O/G1/NYYhyuloks5ccGm
         IQ8nBw3KzaXSbzXqXI9yxRpkliTeAwnEiNedrlHWEr3QsiSXWPHNHXhNZgo8xDCdcZ3H
         3f9zfrrpmGAKVzXeqc7VFi50RdpCWCbRjBedXQLnA0F2JWpD5dB9OZjGPkcsA+5iDoBk
         LfOSWOjDjZZybIRfNnr/QnZMc8Tf9suSQZ78JRoHktu9LNmZke+1H5TuvNUog4HM7Pe5
         Bc9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757342183; x=1757946983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FIVWf3bpKmjp75cp07PUchurcybMcPfdUSIyZqVIJkQ=;
        b=D4GYR2TcTyul3lw1rbageuFVr8u8U9CtgQ2uHq3B1AcYNCIb8nj1ftjEptlw7EA1H+
         MYJhsati6tZ9k/3JeYYLQJG28mtl5Z3POy2qKqWDUwkssgCdrigUN1LmJMdmJbvj9W9Y
         MUoJntNwfw0PHXwE9GrO6k4jcIkIsCmfs2NTOY9i8aUzWDzs/I/7qfAiFrzAynyeuyBw
         AhGp/n332ChDNirPpDfR6ZwzauTYbKl+4KM36DsnWHPpa15pRSTCOHajrCGv35h2eQ0f
         USHgvkKINsLJqC+j3cizGex7wr+sWnSewhN65lRPa3kDw7yNKmjZNLeOJ1SIZGvQ0L0p
         bZbg==
X-Forwarded-Encrypted: i=1; AJvYcCUKmosf23C69zqvlJnYRWe+LovPrK87XfStiJOzJP7RaLpR0K5fZubdeuTUbecNYimOyjuVj9Hd7U5eiA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2mt+r539WeWbYxsuCwFztGkJJc8FHy6CeFAL/IP2SIuPAhTWd
	39gZAaXdUMor98gg4nxhwVHHZ90oBMuWcm97j6XQsBLimSxZJ3YfIUamDJkAjEQi0sXnvBq2GjB
	eVt/GJ2wwUop3COn+vrE8EKZe/z81DXI=
X-Gm-Gg: ASbGncvw9aW7FZNT4MphncrrecdOEMmLvCQ8KqYmfiT8AVBUIj6QwRO5bkv2sklRl85
	HK+i1I7N1Wkj4RpOWDjZbgxrkZuLjYMLqq9vZWksVYaoSqFb6Xn5DYm5QBugxxnxul9YSOhDEev
	PIBAgJvoZZwgA3uWcfA0xk/DQstxV657DgCVM49PB4HAProBbSAtMtei7LfajcfKlcNoR4AFvry
	+isFiGNk/TCLrRVv6Ibb1VitkS0EB8cKtVGW49Z1Gnv2yeDX/LBZtJbs2/DXEMI7RwPid2u66np
	1cFGTTl1ZVTHAQjhoYfaOu8SUA==
X-Google-Smtp-Source: AGHT+IEds3iCyTuDUwiTjHRJ7lLf/Q2xjxTJDIKMpnFx1aFKpliIcBsGFm3iFx+addcMcQGerU8ggQutMgqEUUjcd3Y=
X-Received: by 2002:a17:903:18c:b0:24c:cc2c:9da5 with SMTP id
 d9443c01a7336-25173ea24a3mr62209635ad.6.1757342183075; Mon, 08 Sep 2025
 07:36:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250908-distill-lint-1ae78bcf777c@spud>
In-Reply-To: <20250908-distill-lint-1ae78bcf777c@spud>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 8 Sep 2025 16:36:09 +0200
X-Gm-Features: AS18NWB-MWPE9egfDgR8swoEM8VNIC5oT99W_zIRlpTR_s6ZNeMwU8I66RyA-sw
Message-ID: <CANiq72mw36RzCtNVax650fJ=+cYjuGNF722_Mn2Oy1FAvxWc8Q@mail.gmail.com>
Subject: Re: [PATCH v1] rust: cfi: only 64-bit arm and x86 support CFI_CLANG
To: Conor Dooley <conor@kernel.org>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	stable@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Kees Cook <kees@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Matthew Maurer <mmaurer@google.com>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, linux-riscv@lists.infradead.org, 
	rust-for-linux@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_073623_974855_7BC554FE 
X-CRM114-Status: GOOD (  15.09  )
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

T24gTW9uLCBTZXAgOCwgMjAyNSBhdCAzOjEz4oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IEZyb206IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3Jv
Y2hpcC5jb20+Cj4KPiBUaGUga2VybmVsIHVzZXMgdGhlIHN0YW5kYXJkIHJ1c3RjIHRhcmdldHMg
Zm9yIG5vbi14ODYgdGFyZ2V0cywgYW5kIG91dAo+IG9mIHRob3NlIG9ubHkgNjQtYml0IGFybSdz
IHRhcmdldCBoYXMga2NmaSBzdXBwb3J0IGVuYWJsZWQuIEZvciB4ODYsIHRoZQo+IGN1c3RvbSA2
NC1iaXQgdGFyZ2V0IGVuYWJsZXMga2NmaS4KPgo+IFRoZSBIQVZFX0NGSV9JQ0FMTF9OT1JNQUxJ
WkVfSU5URUdFUlNfUlVTVEMgY29uZmlnIG9wdGlvbiB0aGF0IGFsbG93cwo+IENGSV9DTEFORyB0
byBiZSB1c2VkIGluIGNvbWJpbmF0aW9uIHdpdGggUlVTVCBkb2VzIG5vdCBjaGVjayB3aGV0aGVy
IHRoZQo+IHJ1c3RjIHRhcmdldCBzdXBwb3J0cyBrY2ZpLiBUaGlzIGJyZWFrcyB0aGUgYnVpbGQg
b24gcmlzY3YgKGFuZAo+IHByZXN1bWFibHkgMzItYml0IGFybSkgd2hlbiBDRklfQ0xBTkcgYW5k
IFJVU1QgYXJlIGVuYWJsZWQgYXQgdGhlIHNhbWUKPiB0aW1lLgo+Cj4gT3JkaW5hcmlseSwgYSBy
dXN0Yy1vcHRpb24gY2hlY2sgd291bGQgYmUgdXNlZCB0byBkZXRlY3QgdGFyZ2V0IHN1cHBvcnQK
PiBidXQgdW5mb3J0dW5hdGVseSBydXN0Yy1vcHRpb24gZmlsdGVycyBvdXQgdGhlIHRhcmdldCBm
b3IgcmVhc29ucyBnaXZlbgo+IGluIGNvbW1pdCA0NmUyNGE1NDVjZGI0ICgicnVzdDoga2FzYW4v
a2J1aWxkOiBmaXggbWlzc2luZyBmbGFncyBvbiBmaXJzdAo+IGJ1aWxkIikuIEFzIGEgcmVzdWx0
LCBpZiB0aGUgaG9zdCBzdXBwb3J0cyBrY2ZpIGJ1dCB0aGUgdGFyZ2V0IGRvZXMgbm90LAo+IGUu
Zy4gd2hlbiBidWlsZGluZyBmb3IgcmlzY3Ygb24geDg2XzY0LCB0aGUgYnVpbGQgd291bGQgcmVt
YWluIGJyb2tlbi4KPgo+IEluc3RlYWQsIG1ha2UgSEFWRV9DRklfSUNBTExfTk9STUFMSVpFX0lO
VEVHRVJTX1JVU1RDIGRlcGVuZCBvbiB0aGUgb25seQo+IHR3byBhcmNoaXRlY3R1cmVzIHdoZXJl
IHRoZSB0YXJnZXQgdXNlZCBzdXBwb3J0cyBpdCB0byBmaXggdGhlIGJ1aWxkLgo+Cj4gQ0M6IHN0
YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBGaXhlczogY2E2MjdlNjM2NTUxZSAoInJ1c3Q6IGNmaTog
YWRkIHN1cHBvcnQgZm9yIENGSV9DTEFORyB3aXRoIFJ1c3QiKQo+IFNpZ25lZC1vZmYtYnk6IENv
bm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+CgpJZiB5b3UgYXJlIHRha2lu
ZyB0aGlzIHRocm91Z2ggUklTQy1WOgoKQWNrZWQtYnk6IE1pZ3VlbCBPamVkYSA8b2plZGFAa2Vy
bmVsLm9yZz4KCkNoZWVycywKTWlndWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
