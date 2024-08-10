Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 995C1C3DA7F
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Aug 2024 21:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AziaoEwhO9s6oVpy+sh1Mvpsb6xSUikN4FAfI8P+s3o=; b=AGCWGu1v/13Fct
	CYzVPNNAoYXUsTAg11VK+IV3vQ+MnFkq3z9AATGmw2SPzwniIshg0CUsJF7FKJcV40vu7av5Yji2d
	J/AlzUdzJSBpM05IJAoxf6n/exWc++V4Kxen8X7gi4TgSwpNTuTy+oRup0SQ0RIPYHHnVayzbtDT9
	BWuPyycgRGxDTuRrlFH9xzaRgK58937G6tN15ErgfwYyDaJFSosE7qRk5EmvuKizQzdSzFMI4vwQJ
	2XygcPNYugSjKiuVzZnkwr9L5GRByFRo1iTNAUOaEgyrzYLKwkRYCj96E/WB9yNE3r84cb80+geWY
	2DFuiLq3+tg91FRbpwqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sctt7-0000000EdiZ-0C0t;
	Sat, 10 Aug 2024 21:44:37 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sctt2-0000000Edh2-0fIy
	for linux-riscv@lists.infradead.org;
	Sat, 10 Aug 2024 21:44:34 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-428178fc07eso21148845e9.3
        for <linux-riscv@lists.infradead.org>; Sat, 10 Aug 2024 14:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723326266; x=1723931066; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aegy8mTt/HGU3nb35OmsyGSQvTR/N6vYdmjG0ALaZCI=;
        b=uDoPjxXQgL/vgy6NTmdnRcsF+DBwRbuXmAoj1zzygZSu6uwy5KWR9eeWUMy99AjEiI
         +Q5cs1O0NmyLUFdA4xBQk0qQT7DLdmEwYdlQtBy0LyJscWbKU08zP+YTcqvM3UVSP6DY
         k9O8ODZtpqHi3gNcwv0d8wALqRIgRsJizgcHhB2138u6jCImZBkI03RmwyQFjANvc9PQ
         z3ZdKtnlN5Wp82lV4ny/sv8a2bL9rD/Klxli4W431Vye6xv0j0yM8Ce9SlcgRinVdaet
         r1NgzccqtGt1zBe14k+KfkhEkjMV5YNChFpMCyELgu6VAC64bWw2EQjFOZ9E4l8mXKln
         ys9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723326266; x=1723931066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aegy8mTt/HGU3nb35OmsyGSQvTR/N6vYdmjG0ALaZCI=;
        b=sgDcWTDR0P1k3groL9tigUZ+b/NP8IWu5z4Nq5h5Dffw7h1XahmMiKlrw2xSq2aKjG
         0QY8aovqBwTPtaouwTCEAoVtLUFrQxRzudXDSKd1/e+fd2R9RhdOyEYxSPv2l4wnXDg7
         LdEjpk1q4Wc45VWKdIgNWMFbkcD8XHtk43ndQlu8VmWCrQOZjYRBGZ1gN/Hs/zIdmjE8
         HZLW8DT7CFJ0sPTJ5SR5PfI0qPNzpXTPtLByOyMfeDHR2CvhiVsoqsYpkq5P3iDgBSNq
         aaX8vDoSsttPPng9/DIC7/wt1+wnTjSCoSXWbKf/HSNFmv+mNQNV59+tDT1hE7Ntr3ta
         VG+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVegK4T+ojB1pLqI71NaWQGhxkCX2NRwDlukCgyiuDjjHWuEGZAJFGvQUQSXmwqY76neimAfay7G/wJOCl2wR3cIy3pUd2vXFKHpcGBV8Fq
X-Gm-Message-State: AOJu0YxP1liXgw6k7GjffBuNBcoRozyZuHs6KeCuWK4cgfO63d0Fj4fL
	QClDlTL0FhRG1DP4HR0w8TFC77Zcd1P8mPEUh9KIiedo7VWW/zbKhlvBeacmFUWQsmQXc+io7+I
	xRZL0PGjTGhzm+cRdXzZ7O1nOM3GoIu49lAdg
X-Google-Smtp-Source: AGHT+IGcGrvANhieaJ2VWvct+JSOLceO+y8m3RToV1+qGvsi7vy01ylyw5ydwKNucZvA36ZyGsWfJP7DYr6LPaNbUDo=
X-Received: by 2002:a5d:4562:0:b0:368:6337:4226 with SMTP id
 ffacd0b85a97d-36d5f2d0fb8mr2949257f8f.12.1723326266116; Sat, 10 Aug 2024
 14:44:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240808-tracepoint-v6-0-a23f800f1189@google.com>
 <20240808-tracepoint-v6-5-a23f800f1189@google.com> <20240810210359.GD11646@noisy.programming.kicks-ass.net>
In-Reply-To: <20240810210359.GD11646@noisy.programming.kicks-ass.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sat, 10 Aug 2024 23:44:13 +0200
Message-ID: <CAH5fLggwLOhP_6b==dc73uJCUBcu2fNQ7SCnqovv2hVXFtUHEQ@mail.gmail.com>
Subject: Re: [PATCH v6 5/5] rust: add arch_static_branch
To: Peter Zijlstra <peterz@infradead.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Jason Baron <jbaron@akamai.com>, Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	linux-trace-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Sean Christopherson <seanjc@google.com>, Uros Bizjak <ubizjak@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Mark Rutland <mark.rutland@arm.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Fuad Tabba <tabba@google.com>, 
	linux-arm-kernel@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <apatel@ventanamicro.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Samuel Holland <samuel.holland@sifive.com>, 
	linux-riscv@lists.infradead.org, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Bibo Mao <maobibo@loongson.cn>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, Andrew Morton <akpm@linux-foundation.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, loongarch@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240810_144432_248973_418F53F6 
X-CRM114-Status: GOOD (  13.58  )
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

T24gU2F0LCBBdWcgMTAsIDIwMjQgYXQgMTE6MDTigK9QTSBQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6
QGluZnJhZGVhZC5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBBdWcgMDgsIDIwMjQgYXQgMDU6MjM6
NDFQTSArMDAwMCwgQWxpY2UgUnlobCB3cm90ZToKPgo+ID4gKy8vLyBXcmFwcGVyIGFyb3VuZCBg
YXNtIWAgdGhhdCB1c2VzIGF0JnQgc3ludGF4IG9uIHg4Ni4KPiA+ICsvLyBVc2VzIGEgc2VtaWNv
bG9uIHRvIGF2b2lkIHBhcnNpbmcgYW1iaWd1aXRpZXMsIGV2ZW4gdGhvdWdoIHRoaXMgZG9lcyBu
b3QgbWF0Y2ggbmF0aXZlIGBhc20hYAo+ID4gKy8vIHN5bnRheC4KPiA+ICsjW2NmZyh0YXJnZXRf
YXJjaCA9ICJ4ODZfNjQiKV0KPiA+ICsjW21hY3JvX2V4cG9ydF0KPiA+ICttYWNyb19ydWxlcyEg
YXNtIHsKPiA+ICsgICAgKCQoJGFzbTpleHByKSwqIDsgJCgkcmVzdDp0dCkqKSA9PiB7Cj4gPiAr
ICAgICAgICA6OmNvcmU6OmFyY2g6OmFzbSEoICQoJGFzbSkqLCBvcHRpb25zKGF0dF9zeW50YXgp
LCAkKCRyZXN0KSogKQo+ID4gKyAgICB9Owo+ID4gK30KPiA+ICsKPiA+ICsvLy8gV3JhcHBlciBh
cm91bmQgYGFzbSFgIHRoYXQgdXNlcyBhdCZ0IHN5bnRheCBvbiB4ODYuCj4KPiBeIHRoZSBhYm92
ZSBsaW5lIHNlZW1zIG91dCBvZiBwbGFjZSBnaXZlbiB0aGUgJ25vdCcgYmVsb3cuCgpDb21tZW50
cyB3aXRoIHRocmVlIHNsYXNoZXMgYXJlIHdoYXQgZ2V0cyByZW5kZXJlZCBpbiB0aGUgaHRtbCB2
ZXJzaW9uCm9mIHRoZSBkb2NzIFsxXS4gVGhpcyB3YXksIHRoZSByZW5kZXJlZCBkb2NzIHdpbGwg
c2F5IHRoYXQgdGhlIGBhc20hYAptYWNybyBpcyBhIHdyYXBwZXIgYXJvdW5kIHRoZSBidWlsdC1p
biBgYXNtIWAgdGhhdCB1c2VzIGF0JnQgc3ludGF4IG9uCng4NiByZWdhcmRsZXNzIG9mIHdoaWNo
IHBsYXRmb3JtIHlvdSBidWlsZCB0aGUgZG9jcyBvbi4KClsxXTogaHR0cHM6Ly9ydXN0LmRvY3Mu
a2VybmVsLm9yZy9rZXJuZWwvCgo+ID4gKy8vIEZvciBub24teDg2IGFyY2hlcyB3ZSBqdXN0IHBh
c3MgdGhyb3VnaCB0byBgYXNtIWAuCj4gPiArI1tjZmcobm90KHRhcmdldF9hcmNoID0gIng4Nl82
NCIpKV0KPiAgICAgICAgICBeXl4KPiA+ICsjW21hY3JvX2V4cG9ydF0KPiA+ICttYWNyb19ydWxl
cyEgYXNtIHsKPiA+ICsgICAgKCQoJGFzbTpleHByKSwqIDsgJCgkcmVzdDp0dCkqKSA9PiB7Cj4g
PiArICAgICAgICA6OmNvcmU6OmFyY2g6OmFzbSEoICQoJGFzbSkqLCAkKCRyZXN0KSogKQo+ID4g
KyAgICB9Owo+ID4gK30KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
