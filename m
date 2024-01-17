Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA3BFC47258
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jan 2024 18:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jQh6OzexjDgBLz+28OIPzhmB+rEWN9yymUlL3Q1qej4=; b=oxjKv0WNv4zpTG
	ZMW0qKif7OaA25z3wMvG2hEK6ogoNoQeiNrXIjeiKm409A3ra8GHjghhtcqXH8aBJP+W8G80Ov/Is
	a6tM7DfuSawZ/WqgwqP2HP6u94hzanzD9UR55c3RBtR9vL7sy9527DoLC7shH/6zfiUdLjSX21uSa
	bSgFtJXo7SCsz8nxDDkttCxTdwPoE5I8ygga0VUOilm4t9tphKA0AU6RYxbQxEnVOFbR4CXk6kHr9
	oNAesTcpFYqei0TjKohvvzxFuj8bPzIwq6sC3RG1yyWIMGJDs8lCG70ZNScmNqCvvqTlnh5PPMx8S
	mqcoxTf6DWyOQztBL3bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQAZZ-000M2i-1b;
	Wed, 17 Jan 2024 18:23:33 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQAZX-000M1Y-0t
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jan 2024 18:23:32 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-5f0629e67f4so113669977b3.3
        for <linux-riscv@lists.infradead.org>; Wed, 17 Jan 2024 10:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705515809; x=1706120609; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eXio9NlaEYl1RqaWvINUW6RFO3slj0nXN/O8m9I0jP4=;
        b=VQfhS4ysiG5ZqKso3XLe5FG93Rg5etOzfv5hIwhPTE/wTk+sk1ITbX/1HXVtsEPKnk
         4gTh0U8DCXF98xCTWH/KDmvNW4bSVvGIuCNwXUks2ONLdq9aItnYy1MoA4cyZrGmGCHh
         MDVuLpj9n/P3aoMDjgRghQNZwZ+3DEnJ7+gyXWKVqhHUvWXuaWlguMzOpjVhkTpInVco
         XdISo8VT+K1smCOZfUBkGFQdzh4sHmMxVwjdVEjhxPiLozU6AZ8rLjIdjy78+Ad8e19D
         5UvS5tXDpyKvg3l3i6w/VwmczHD+iaAsr84lAkRZuDz3eE8eHB1vRde9/kHRjtmJSWdc
         3XsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705515809; x=1706120609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eXio9NlaEYl1RqaWvINUW6RFO3slj0nXN/O8m9I0jP4=;
        b=rvo30AbZIA2+h8C4oaoHBzVM7oCR7JjoBtCs/vXZg5Iyk2ZlBBVMX5HKeu7VyJYW19
         utqRnSfo7fMF6hqK9aTYDRuBag7gQx4w9scwz5Zw7hadfchppI6i05A3sM0iIP1mNYV6
         QJ5CykwHJxhn0IImZnYSQPrWMg+VLwrhWCT2odPLPnCIdKXr3N+oOuJ/CnlgobFUXHNC
         gwZd9mDMZYr57vryfvY+pvAcsIn72PpMb3bAvtiVDXFvtWoJ3fsjNg5Uq5+TdNfDUZ3g
         QnKa9puIre5K73Ui5Jhm51qskR+wlfo3AWsbSL2teOb9Rx8LdFmHaTT29WFLmZFp846U
         wR8Q==
X-Gm-Message-State: AOJu0YxkurNNxGQ50+iLlJOoR9+TUyF0bgFAgE8UQhpLD9E3rlKCecPz
	xyHhXmE74Q3aSEJODv+6egUkmUO7JZFk9lTlnvg=
X-Google-Smtp-Source: AGHT+IGCcH/dqD6Al/2l0bQOPWAl/S0LnMuPzV2EbQmMsbLH6gHDj92gaTx/RM0zC3S16n6n9hZ5JDh5aDxL4N2u3xg=
X-Received: by 2002:a81:ca46:0:b0:5e9:dca:1b14 with SMTP id
 y6-20020a81ca46000000b005e90dca1b14mr7334369ywk.7.1705515808771; Wed, 17 Jan
 2024 10:23:28 -0800 (PST)
MIME-Version: 1.0
References: <20230307102441.94417-1-conor.dooley@microchip.com>
 <20230608-dispatch-sneer-aa09bd7b2eb8@wendy> <CANiq72nnph7LS1fLRtHz8NJ91PWXPaUnm0EuoV3wrbvK398AnA@mail.gmail.com>
 <20230608-spiritism-gonad-5f5aff4c3a24@wendy> <20240117-swiftly-parasail-618d62972d6e@spud>
In-Reply-To: <20240117-swiftly-parasail-618d62972d6e@spud>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 17 Jan 2024 19:23:17 +0100
Message-ID: <CANiq72mVKCOAuK4Qe+8AHmpkFwyJsVfx8AqB7ccGi3DYpSSWcw@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] RISC-V: enable rust
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
X-CRM114-CacheID: sfid-20240117_102331_333591_2FCD8E15 
X-CRM114-Status: GOOD (  12.86  )
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

T24gV2VkLCBKYW4gMTcsIDIwMjQgYXQgMTI6MzHigK9QTSBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gNi42IGNhbWUgYW5kIHdlbnQsIGFuZCBJIGhhdmUgYmVlbiBi
dXN5IGRlYWxpbmcgd2l0aCB0aGUgb3RoZXIKPiByZXNwb25zaWJpbGl0aWVzIEkgbWVudGlvbmVk
IGFuZCBoYXZlIG5vdCBoYWQgYSBjaGFuY2UgdG8gbG9vayBoZXJlLgo+IEkgcmViYXNlZCB0aGlz
IHRvZGF5IGFuZCB0aGluZ3Mgc3RpbGwgd29yayBhcyB0aGV5IGRpZCB3aGVuIEkgc3VibWl0dGVk
Cj4gdGhpcyB2ZXJzaW9uLCBidXQgdGhpbmdzIGhhdmUgZ290dGVuIG11ZGRpZXIgb24gdGhlIExM
Vk0gc2lkZSBvZiB0aGluZ3MsCj4gYXMgbW9yZSByZWNlbnQgdmVyc2lvbnMgaGF2ZSBhZGRlZCB5
ZXQgbW9yZSBleHRlbnNpb24gc3VwcG9ydC4KClNvdW5kcyBmdW4gOikKCj4gTXkgaW5jbGluYXRp
b24gYXQgdGhpcyBwb2ludCBpcyB0byBlbmdhZ2UgaW4gYSBiaXQgb2YgTEFSUGluZyBhcyBhbgo+
IG9zdHJpY2gsIGFuZCBzb3J0YSBpZ25vcmUgdGhlc2UgY29uY2VybnMgaW5pdGlhbGx5LiBTcGVj
aWZpY2FsbHksIEknZAo+IGxpa2UgdG8gZHJvcCB0aGUgaWRlYSBvZiBoYXZpbmcgdGhlIGdjYyBz
dXBwb3J0LCBhbmQgcmVzdHJpY3QgdG8gTExWTT0xLgoKWWVhaCwgaWYgYExMVk09MWAgd29ya3Ms
IHRoZW4gSSB3b3VsZCBzdWdnZXN0IGdvaW5nIGFoZWFkIHdpdGggdGhhdC4KCihOb3cgdGhhdCBg
cnVzdGNfY29kZWdlbl9nY2NgIGlzIGhlcmUsIHdlIHdpbGwgbW92ZSB0byB0aGF0IGFuZCBmb3Jn
ZXQKYWJvdXQgbWl4ZWQgY29tcGlsZXIgYnVpbGRzLCBidXQgd2Ugc3RpbGwgaGF2ZSB0byBoYW5k
bGUgYGJpbmRnZW5gCmZsYWdzIHVudGlsIHdlIGhhdmUgYW4gYWx0ZXJuYXRpdmUgZm9yIHRoYXQp
Cgo+IFdoZW4gaXQgY29tZXMgdG8gYXN5bW1ldHJpY2FsIGV4dGVuc2lvbiBzdXBwb3J0IGJldHdl
ZW4gdGhlIEMgYW5kIFJ1c3QKPiB0b29sY2hhaW5zLCBJJ20gdGhpbmsgd2UgZGVhbCB3aXRoIHRo
YXQgYXMgd2UgZG8gZm9yIHRoZSBDIHRvb2xjaGFpbnMsCj4gc29ydCBpc3N1ZXMgb3V0IGFzLWFu
ZC13aGVuIHRoZXkgYXJyaXZlIHJhdGhlciB0aGFuIHB1bnQgdGhpcyBhZ2Fpbi4KClNvdW5kcyBn
b29kLCB0aGFua3MgYSBsb3QhCgpDaGVlcnMsCk1pZ3VlbAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
