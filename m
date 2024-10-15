Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6363FD2169C
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Oct 2024 13:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z+6TPkzdosqY0OeKccDkvEJ6tyCwJfYELrSOGfXuMRM=; b=BRqXtSpcw5da1D
	L8jv2jjIZ2GUl4QVa/NYlbDOcULI35a4vV4V9+mARC1pEYvWC+Jb6b7jxjSFcuJngdsbb5VdwAnWz
	P05TXOogLytPyZdliSd5AyyKh+WhlnhO/r0h3GaPxSpdCHycgXk/T7YpU2bn0cUBmUr+h9LJClREb
	F92qH/jNcre7sYyzh7DbqxG+bWioXVObwxN706o7M2L507+8Q9t1TLnsHX422SFsRvpAaXAlp+VQU
	wR7N8LQtmp8+dJOfQGUGLBM6jcJIpUOzxQCYblzVvDkxRiK0N32i2tvisxmcEuXhLOaHJy4xrrIjW
	6VsfCvmCGX3cT3jEpk0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0hGg-00000008HTF-0KUq;
	Tue, 15 Oct 2024 13:07:18 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0hFW-00000008HKa-29UJ
	for linux-riscv@lists.infradead.org;
	Tue, 15 Oct 2024 13:06:08 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-37d447de11dso3878394f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 15 Oct 2024 06:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728997562; x=1729602362; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9UYUP5eDoCpJlZIv+2MviNVABJNyofFegvCIyfWDvSM=;
        b=W9xQCjLKS//T/lUGVlhiOXdXg6PqQA2gTv7ow4q/DsBOf9RF9yLgy2KJWDsifNUMWn
         0+f6MxokDUCwtaKNLaUn38fjpeUOrbHqG5DxlQnQC2bi4+6QMmWRMnzeopWCWPct/sUJ
         o3MfNa7gQDkBg/thVVVAFVMPDfa5SPmKxD5/G06tiYCNlZU+7CQEdIOl1FzAmt+bHnVc
         F47ML24QxSRtiFRhcnNYGxwuhmWBv6q6eka3NGPP8tzYwgVq/+OPy1DlHj3yCBB6hXJZ
         dASso/DynTzi2Dee3muZjSOuTWMe30co3vAUSqbZCDGfGDP3AMbgXyVaxrYh1KaqiuQ1
         j/DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728997562; x=1729602362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9UYUP5eDoCpJlZIv+2MviNVABJNyofFegvCIyfWDvSM=;
        b=lKDFGw1L+QgmO+Z0q2G7EjZ6rpsVRnPbO8XPoee1mdX1rDx3CgHyQ45XdT/3M/AC6W
         jF6d3VbsPrRS5CQLoaMb53+es/RHxkTsDMS00LzaipKS435u8Iys1eEPYVsoEih5xFdK
         Sh8pXPD6X3n0yQ7A0PH2815FB2PSkWOSimzvFvyAuEqJoMGcTLGVITbNZzqVCb0pglZr
         KvXTCuIyC18WuQOXB5UWQ0FtPIEgBp9ebj5yTy253UuPQ6nkUj5AbEvWVgs66j3kl+SA
         Wp591LNI4raPMd+sM/EFnTIQXoYletTgVguFlbC0g/5bP3H9X6fuyvn5CtW5qXt55zjb
         fvNA==
X-Forwarded-Encrypted: i=1; AJvYcCXlxhvtKXWPUPVFZi1+ZPCBdQwNYybTbvmbJmqIVsCqU4lbRjUH/TWTGbnCjvblSdNqxwtY9dC7ak2a8g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzAVW4wU5vqFX1CsY4tZ/KYeHOKI8g6e0AHs4DL8JEJbeNnB0wY
	x1JYie2xTBGQZzOvejk2WESl2r2SIjbgqC8kUxefoFISnSBFaiHHt8cZK/1bJfXyA4nOsiD4/lf
	evaMQOqqmWPW4fqElFrg4ZvgRsQg6hzfHIDak
X-Google-Smtp-Source: AGHT+IEIAKlwW8UiEFpPs4Fcbd4nUGuOBW7hWDjxjph18K+ejeS+IZz53ZJefCSDaToXnGBf3Uc6jj4wb7rxRNzd/8k=
X-Received: by 2002:adf:e98c:0:b0:37c:d4f8:3f2e with SMTP id
 ffacd0b85a97d-37d552d8b43mr9076130f8f.55.1728997561878; Tue, 15 Oct 2024
 06:06:01 -0700 (PDT)
MIME-Version: 1.0
References: <20241011-tracepoint-v10-0-7fbde4d6b525@google.com>
 <20241011-tracepoint-v10-5-7fbde4d6b525@google.com> <20241011152312.r5sy7k7hsunmmbfo@treble>
In-Reply-To: <20241011152312.r5sy7k7hsunmmbfo@treble>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 15 Oct 2024 15:05:49 +0200
Message-ID: <CAH5fLgh5EbHFn+47LpdVWjdYaq8fEm0Okm8fd1GwLprLqzt2pg@mail.gmail.com>
Subject: Re: [PATCH v10 5/5] rust: add arch_static_branch
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Peter Zijlstra <peterz@infradead.org>, 
	Jason Baron <jbaron@akamai.com>, Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
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
X-CRM114-CacheID: sfid-20241015_060606_603809_8A5905C3 
X-CRM114-Status: GOOD (  11.22  )
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

T24gRnJpLCBPY3QgMTEsIDIwMjQgYXQgNToyNOKAr1BNIEpvc2ggUG9pbWJvZXVmIDxqcG9pbWJv
ZUBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgT2N0IDExLCAyMDI0IGF0IDEwOjEzOjM4
QU0gKzAwMDAsIEFsaWNlIFJ5aGwgd3JvdGU6Cj4gPiArI1tjZmcoQ09ORklHX0pVTVBfTEFCRUwp
XQo+ID4gKyNbY2ZnKG5vdChDT05GSUdfSEFWRV9KVU1QX0xBQkVMX0hBQ0spKV0KPiA+ICttYWNy
b19ydWxlcyEgYXJjaF9zdGF0aWNfYnJhbmNoIHsKPiA+ICsgICAgKCRrZXk6cGF0aCwgJGtleXR5
cDp0eSwgJGZpZWxkOmlkZW50LCAkYnJhbmNoOmV4cHIpID0+IHsnbXlfbGFiZWw6IHsKPiA+ICsg
ICAgICAgICRjcmF0ZTo6YXNtISgKPiA+ICsgICAgICAgICAgICBpbmNsdWRlIShjb25jYXQhKGVu
diEoIk9CSlRSRUUiKSwgIi9ydXN0L2tlcm5lbC9hcmNoX3N0YXRpY19icmFuY2hfYXNtLnJzIikp
Owo+ID4gKyAgICAgICAgICAgIGxfeWVzID0gbGFiZWwgewo+ID4gKyAgICAgICAgICAgICAgICBi
cmVhayAnbXlfbGFiZWwgdHJ1ZTsKPiA+ICsgICAgICAgICAgICB9LAo+ID4gKyAgICAgICAgICAg
IHN5bWIgPSBzeW0gJGtleSwKPiA+ICsgICAgICAgICAgICBvZmYgPSBjb25zdCA6OmNvcmU6Om1l
bTo6b2Zmc2V0X29mISgka2V5dHlwLCAkZmllbGQpLAo+ID4gKyAgICAgICAgICAgIGJyYW5jaCA9
IGNvbnN0ICRjcmF0ZTo6anVtcF9sYWJlbDo6Ym9vbF90b19pbnQoJGJyYW5jaCksCj4gPiArICAg
ICAgICApOwo+ID4gKwo+ID4gKyAgICAgICAgYnJlYWsgJ215X2xhYmVsIGZhbHNlOwo+ID4gKyAg
ICB9fTsKPiA+ICt9Cj4gPiArCj4gPiArI1ttYWNyb19leHBvcnRdCj4gPiArI1tkb2MoaGlkZGVu
KV0KPiA+ICsjW2NmZyhDT05GSUdfSlVNUF9MQUJFTCldCj4gPiArI1tjZmcoQ09ORklHX0hBVkVf
SlVNUF9MQUJFTF9IQUNLKV0KPiA+ICttYWNyb19ydWxlcyEgYXJjaF9zdGF0aWNfYnJhbmNoIHsK
PiA+ICsgICAgKCRrZXk6cGF0aCwgJGtleXR5cDp0eSwgJGZpZWxkOmlkZW50LCAkYnJhbmNoOmV4
cHIpID0+IHsnbXlfbGFiZWw6IHsKPiA+ICsgICAgICAgICRjcmF0ZTo6YXNtISgKPiA+ICsgICAg
ICAgICAgICBpbmNsdWRlIShjb25jYXQhKGVudiEoIk9CSlRSRUUiKSwgIi9ydXN0L2tlcm5lbC9h
cmNoX3N0YXRpY19icmFuY2hfYXNtLnJzIikpOwo+ID4gKyAgICAgICAgICAgIGxfeWVzID0gbGFi
ZWwgewo+ID4gKyAgICAgICAgICAgICAgICBicmVhayAnbXlfbGFiZWwgdHJ1ZTsKPiA+ICsgICAg
ICAgICAgICB9LAo+ID4gKyAgICAgICAgICAgIHN5bWIgPSBzeW0gJGtleSwKPiA+ICsgICAgICAg
ICAgICBvZmYgPSBjb25zdCA6OmNvcmU6Om1lbTo6b2Zmc2V0X29mISgka2V5dHlwLCAkZmllbGQp
LAo+ID4gKyAgICAgICAgICAgIGJyYW5jaCA9IGNvbnN0IDIgfCAkY3JhdGU6Omp1bXBfbGFiZWw6
OmJvb2xfdG9faW50KCRicmFuY2gpLAo+ID4gKyAgICAgICAgKTsKPiA+ICsKPiA+ICsgICAgICAg
IGJyZWFrICdteV9sYWJlbCBmYWxzZTsKPiA+ICsgICAgfX07Cj4KPiBPdWNoLi4uIGNvdWxkIHdl
IGdldCByaWQgb2YgYWxsIHRoaXMgZHVwbGljYXRpb24gYnkgY29udGFpbmluZyB0aGUgaGFjawo+
IGJpdCB0byBBUkNIX1NUQVRJQ19CUkFOQ0hfQVNNKCkgbGlrZSBzbz8KCkdvb2QgaWRlYSwgdGhh
bmtzLgoKQWxpY2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
