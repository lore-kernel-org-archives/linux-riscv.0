Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B9CDC2BD09
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 16:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=duyF18jlG8ajAZgO0mfYYnI3gcEzINI2KtTL6sHpk8k=; b=P+uf9aqLfKgB+O
	O78bZic7H/58UFOvITxKWcSxzQdznuVso7ujJSkDEvYCPQW6QR0U/HHxKSQ9u7sG4cYDr6X/1s/Nt
	jVCod8ZbLktRuq/I3Ped7JjrvvyNV+swwiX0c2RLnN8ErAAR3t6SCG6p0iNIkUH0gmRE4Np4MvOn7
	L0YrU55P44+9Cmslj4mPrtMT7UNDeapCRyZUrHkmh3t2wW8mUr9uYipZ9sYI77tJ7rfUToUgrkQth
	1rlS2UH21bdkM4STJpCk54wsYCVbVoYaHjW7mu7cs+VMf6IwkDshK7za2Oiz+7Cp7u5nHDtH7ukib
	S2gT7y/9woRh0KFqFodg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMryD-0000000B2NZ-07nF;
	Thu, 27 Jun 2024 16:27:37 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMry8-0000000B2Mk-28Ae;
	Thu, 27 Jun 2024 16:27:34 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-df481bf6680so7726048276.3;
        Thu, 27 Jun 2024 09:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719505651; x=1720110451; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=920O8PJb054pqxNaJJIQxYWqrCoZjbSlHkszY3iGPvs=;
        b=ZAS/vLaoh/S0uZUYpNxrwF9MX9/jmLkUvX76pmnvfuCY+traidUrZkFoKmnzEq92zX
         qG5uAlrCLkONOjFMdp5CZIYLhl5XigbIjHwe5wSCJIwCFRHrP7+BrRT5nMVwUwqtAWby
         l1M8KeRG6WWwh74HBRDMBEVbjYWBAIroaaFWT0XMhy7Ylani373LpG+aFGz8RNwLqAaD
         CkDx2yVrhVZ1GaYJGBTPkUzaLm6kIUPhz206+4sNY9oRf7GnLkcmWLABJTY9kmoKp5B0
         DATTTbCBLDM1i1nO+T/eVtDFQJNLScmab4qicf5kIJPoCTR8dMZSA4Q9iPAxKZhpmhpn
         KZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719505651; x=1720110451;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=920O8PJb054pqxNaJJIQxYWqrCoZjbSlHkszY3iGPvs=;
        b=sc6u62db67egTM3An0mlIll0Htk7/cvXZFKmB396beGS/xPdcwZho6L7DWeL66IMW8
         O6DR5ZJSeMc4chZYWgTKY+/kRye6NKDgtf+uWLpvEffnitTIlgzA0vyRzifiPK/IQCbr
         oGyf3zO1w2xJvYkp6tpT2dDBaKQgwGx+472v3KYlqCjbtoQ82mX7XcWXW0ZpGT029UZj
         QBys0vGj+Hxur3ZtQJTTK7W759CJ9f6V7smSQii/xdZDX97r44sBc3jnBqU0YK3J8qhw
         2XrBI0ueRAUQ0+OxEux24scx760Nl6/84Eei9XlLWjMXjNToTTWCmlq/YYhM0Tn2ogTP
         UApg==
X-Forwarded-Encrypted: i=1; AJvYcCUB32ZDYgqB5ekKWE3W4Qo6S2r+bb6Y/j+zEh0M6psiuLicATxG5TY312Y3C7gvbgDtuvzVfzAlRmhC6uCG+gSJo7ZpnVPO0F/Mf5xqYxEcgnMMd+8FpgK8bk9JbnbvtbQjWPSP09fDOlAa0bivjFmyGNXSXvM=
X-Gm-Message-State: AOJu0YxM8HNVwAijIJY0ANPcRK2oPirL1MEl3nm5+m2J1C0sYnbj15Wn
	0UNtOwyDMFOUgFJPyfwlJPLQ4NQPhUliZkhgwStGzhzxBG+1HDJK
X-Google-Smtp-Source: AGHT+IGwxxdsNJaSRrxxnarDfWOg8gwIpRPpDqBy5+0MsnlygCimQkzcmz4X9ntl94Mzzv8FRU5gdQ==
X-Received: by 2002:a25:c544:0:b0:df7:9773:4571 with SMTP id 3f1490d57ef6-e0303ed4c67mr13804035276.11.1719505651417;
        Thu, 27 Jun 2024 09:27:31 -0700 (PDT)
Received: from fauth2-smtp.messagingengine.com (fauth2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-44641fb7d6esm7172251cf.63.2024.06.27.09.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 09:27:31 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfauth.nyi.internal (Postfix) with ESMTP id E6C3E1200068;
	Thu, 27 Jun 2024 12:27:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Thu, 27 Jun 2024 12:27:29 -0400
X-ME-Sender: <xms:8ZJ9ZkwJQn3hGVjppSrTV0IZyrxtIWOEEpPcVprEZGpYEKndneZdBA>
    <xme:8ZJ9ZoRZfmuNC_KNH9Mloe836UALKfMuxCj6toj6ZkgMcIokFm-s7skTzdbFK2hxF
    a1FfTrhbD-VSodd5A>
X-ME-Received: <xmr:8ZJ9ZmUNST7F9h19vO8rHuGtFfi1CieIGpKmgCo01SoAAvDNjb7l9XcSn7VDoQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrtdeggddutddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpeeuohhq
    uhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrf
    grthhtvghrnhepvefghfeuveekudetgfevudeuudejfeeltdfhgfehgeekkeeigfdukefh
    gfegleefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedt
    ieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfh
    higihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:8ZJ9ZijeIlsxoOLKTT3HOtZOSh6yMswoZGAqWT-utfHKi1PTqMGvfg>
    <xmx:8ZJ9ZmBLlNoz_h24bDEAp5hVZIrDBw_SkEIY90BRdzCghwCBifhRrA>
    <xmx:8ZJ9ZjL0QopEp0Spd6lmQAPYta6FnBpwFrCXWW1ieXd4ByBmUrsDPQ>
    <xmx:8ZJ9ZtB2nPKWDSX_1IdDt2ch85T0JBrm7Lj26_uwmF-czPtXpHktkQ>
    <xmx:8ZJ9ZmxDzs_ruGAMdNA72uLCPg_m3GLOZAcirp7AKUUUeM4G9aA8ZuMo>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Jun 2024 12:27:29 -0400 (EDT)
Date: Thu, 27 Jun 2024 09:26:46 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,	Jason Baron <jbaron@akamai.com>,
 Ard Biesheuvel <ardb@kernel.org>,	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	linux-trace-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Peter Zijlstra (Intel)" <peterz@infradaed.org>,
	Sean Christopherson <seanjc@google.com>,	Uros Bizjak <ubizjak@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,	Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>,	Oliver Upton <oliver.upton@linux.dev>,
	Mark Rutland <mark.rutland@arm.com>,	Ryan Roberts <ryan.roberts@arm.com>,
 Fuad Tabba <tabba@google.com>,	linux-arm-kernel@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org,	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, Bibo Mao <maobibo@loongson.cn>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Andrew Morton <akpm@linux-foundation.org>,
	Tianrui Zhao <zhaotianrui@loongson.cn>, loongarch@lists.linux.dev
Subject: Re: [PATCH v3 1/2] rust: add static_key_false
Message-ID: <Zn2SxvgfbWbmVnYY@boqun-archlinux>
References: <20240621-tracepoint-v3-0-9e44eeea2b85@google.com>
 <20240621-tracepoint-v3-1-9e44eeea2b85@google.com>
 <ZnrtuaUByT70tJY5@boqun-archlinux>
 <CAH5fLgjCAbz39-8EzBxxrWFXFg6VK=ts98BBvpEk8=RZoMuBSA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH5fLgjCAbz39-8EzBxxrWFXFg6VK=ts98BBvpEk8=RZoMuBSA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_092732_599573_B93008A3 
X-CRM114-Status: GOOD (  31.47  )
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

T24gVGh1LCBKdW4gMjcsIDIwMjQgYXQgMTA6MzQ6MzlBTSArMDIwMCwgQWxpY2UgUnlobCB3cm90
ZToKPiBPbiBUdWUsIEp1biAyNSwgMjAyNCBhdCA2OjE44oCvUE0gQm9xdW4gRmVuZyA8Ym9xdW4u
ZmVuZ0BnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IEhpIEFsaWNlLAo+ID4KPiA+IE9uIEZyaSwg
SnVuIDIxLCAyMDI0IGF0IDEwOjM1OjI2QU0gKzAwMDAsIEFsaWNlIFJ5aGwgd3JvdGU6Cj4gPiA+
IEFkZCBqdXN0IGVub3VnaCBzdXBwb3J0IGZvciBzdGF0aWMga2V5IHNvIHRoYXQgd2UgY2FuIHVz
ZSBpdCBmcm9tCj4gPiA+IHRyYWNlcG9pbnRzLiBUcmFjZXBvaW50cyByZWx5IG9uIGBzdGF0aWNf
a2V5X2ZhbHNlYCBldmVuIHRob3VnaCBpdCBpcwo+ID4gPiBkZXByZWNhdGVkLCBzbyB3ZSBhZGQg
dGhlIHNhbWUgZnVuY3Rpb25hbGl0eSB0byBSdXN0Lgo+ID4gPgo+ID4gPiBJdCBpcyBub3QgcG9z
c2libGUgdG8gdXNlIHRoZSBleGlzdGluZyBDIGltcGxlbWVudGF0aW9uIG9mCj4gPiA+IGFyY2hf
c3RhdGljX2JyYW5jaCBiZWNhdXNlIGl0IHBhc3NlcyB0aGUgYXJndW1lbnQgYGtleWAgdG8gaW5s
aW5lCj4gPiA+IGFzc2VtYmx5IGFzIGFuICdpJyBwYXJhbWV0ZXIsIHNvIGFueSBhdHRlbXB0IHRv
IGFkZCBhIEMgaGVscGVyIGZvciB0aGlzCj4gPiA+IGZ1bmN0aW9uIHdpbGwgZmFpbCB0byBjb21w
aWxlIGJlY2F1c2UgdGhlIHZhbHVlIG9mIGBrZXlgIG11c3QgYmUga25vd24KPiA+ID4gYXQgY29t
cGlsZS10aW1lLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbGljZSBSeWhsIDxhbGljZXJ5
aGxAZ29vZ2xlLmNvbT4KPiA+Cj4gPiBbQWRkIGxpbnV4LWFyY2gsIGFuZCByZWxhdGVkIGFyY2gg
bWFpbnRhaW5lcnMgQ2NlZF0KPiA+Cj4gPiBTaW5jZSBpbmxpbmUgYXNtcyBhcmUgdG91Y2hlZCBo
ZXJlLCBwbGVhc2UgY29uc2lkZXIgY29weWluZyBsaW51eC1hcmNoCj4gPiBhbmQgYXJjaCBtYWlu
dGFpbmVycyBuZXh0IHRpbWUgOy0pCj4gCj4gV2lsbCBkby4KPiAKPiA+IEZvciB4ODZfNjQgYW5k
IGFybTY0IGJpdHM6Cj4gPgo+ID4gQWNrZWQtYnk6IEJvcXVuIEZlbmcgPGJvcXVuLmZlbmdAZ21h
aWwuY29tPgo+ID4KPiA+IE9uZSB0aGluZyB0aG91Z2gsIHdlIHNob3VsZCBzcGxpdCB0aGUgYXJj
aC1zcGVjaWZpYyBpbXBscyBpbnRvIGRpZmZlcmVudAo+ID4gZmlsZXMsIGZvciBleGFtcGxlOiBy
dXN0L2tlcm5lbC9hcmNoL2FybTY0LnJzIG9yIHJ1c3QvYXJjaC9hcm02NC5ycy4KPiA+IFRoYXQn
bGwgYmUgZWFzaWVyIGZvciBhcmNoIG1haW50YWluZXJzIHRvIHdhdGNoIHRoZSBSdXN0IGNoYW5n
ZXMgcmVsYXRlZAo+ID4gdG8gYSBwYXJ0aWN1bGFyIGFyY2hpdGVjdHVyZS4KPiAKPiBJcyB0aGF0
IGhvdyB5b3Ugd291bGQgcHJlZmVyIHRvIG5hbWUgdGhlc2UgZmlsZXM/IFlvdSBkb24ndCB3YW50
Cj4gc3RhdGljX2tleSBzb21ld2hlcmUgaW4gdGhlIGZpbGVuYW1lPwo+IAoKSSBjb3VsZCBoYXZl
IGJlZW4gbW9yZSBleHBsaWNpdC4gTXkgcHJlZmVyZW5jZSBpcyAoZm9yIGV4YW1wbGUgQVJNNjQp
CgoqCXdlIGhhdmUgYSBydXN0L2tlcm5lbC9hcmNoLnJzLCB3aGVyZSB3ZSBkbzoKCgkJI1tjZmco
Q09ORklHX0FSTTY0KV0KCQltb2QgYXJtNjQ6Oio7CgoJCSNbY2ZnKENPTkZJR19BUk02NCldCgkJ
cHViIHVzZSBhcm02NDo6KjsKCioJd2UgaGF2ZSBhIHJ1c3Qva2VybmVsL2FyY2gvYXJtNjQucnM6
CgoJCXB1YihjcmF0ZSkgbW9kIGp1bXBfbGFiZWw7CgoqCXdlIGhhdmUgYSBydXN0L2tlcm5lbC9h
cmNoL2FybTY0L2p1bXBfbGFiZWwucnMsIHdoZXJlIHdlIHB1dAoJQVJNNjQgYXJjaF9zdGF0aWNf
YnJhbmNoKCkgdGhlcmUuIChvciBzdGF0aWNfa2V5LnJzIGFuZAoJYXJjaF9zdGF0aWNfa2V5X2Zh
bHNlKCkpLgoKVGhlbiBsaW51eC1hcmNoIGNhbiB3YXRjaDoKCglydXN0L2tlcm5lbC9hcmNoLnJz
CglydXN0L2tlcm5lbC9hcmNoLwoKQW5kIEFSTTY0IG1haW50YWluZXJzIGNhbiB3YXRjaDoKCgly
dXN0L2tlcm5lbC9hcmNoL2FybTY0LnJzCglydXN0L2tlcm5lbC9hcmNoL2FybTY0CgpUaGlzIGlz
IHNpbWlsYXIgdG8gaG93IDxhc20vKi5oPiBhcmUgb3JnYW5pemVkIHRvZGF5LgoKRG9lcyB0aGlz
IG1ha2Ugc2Vuc2U/CgpSZWdhcmRzLApCb3F1bgoKPiA+IEFub3RoZXIgdGhvdWdodCBpcyB0aGF0
LCBjb3VsZCB5b3UgaW1wbGVtZW50IGFuIGFyY2hfc3RhdGljX2JyYW5jaCEoKQo+ID4gKGluc3Rl
YWQgb2YgX3N0YXRpY19rZXlfZmFsc2UhKCkpIGFuZCB1c2UgaXQgZm9yIHN0YXRpY19rZXlfZmFs
c2UhKCkKPiA+IHNpbWlsYXIgdG8gd2hhdCB3ZSBoYXZlIGluIEM/IFRoZSBiZW5lZml0IGlzIHRo
YXQgYXQgbGVhc3QgZm9yIG15c2VsZgo+ID4gaXQnbGwgYmUgZWFzaWVyIHRvIGNvbXBhcmUgdGhl
IGltcGxlbWVudGF0aW9uIGJldHdlZW4gQyBhbmQgUnVzdC4KPiAKPiBJIGNhbiB0cnkgdG8gaW5j
bHVkZSB0aGF0Lgo+IAo+IEFsaWNlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
