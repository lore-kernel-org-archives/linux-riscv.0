Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A36DC2BD09
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 08:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7hk6XCBO/UGKyvI0cSUHv/D+2AU85ITuZEFnQUQqS0M=; b=FcD5DIidSfe2sX
	FJkhWBm2T7CQw9uLhjP0JM7L+WIyRJ8g4bW+w4VfBVSBxv/ISFraioI9+GkVrvqwtg3XAIqgxOjWN
	dx94krG7ynh1YeDmPmsk0eqDLZR11SIgFZZnFa7ET4ZtnEVuIwN4g2449tdH/j4Zp24BLNUMRo1XA
	/crzLoknssj4Hz3UDu+BtoLCt5q6zu6O+H/TH5k14D0/+JDPNgu1AZ87qBaJniYXd0DjdFAnSZ7ln
	bXJvTNPOxr25X7EOQdIlLj7JE6Z62pZwzgHKERw4JrFsczFCVtz6jwmCJlfbttze0WiTPSrLsyesr
	1hn0WVNQ7WwoZuwMd4hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMkam-00000009mN3-2OWT;
	Thu, 27 Jun 2024 08:34:56 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMkaj-00000009mLH-3FyN
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jun 2024 08:34:55 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-52cdcd26d61so5894193e87.2
        for <linux-riscv@lists.infradead.org>; Thu, 27 Jun 2024 01:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719477292; x=1720082092; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jaHYq9qHI0Bww45jO0JOW2KKMuvYkD8u1X20gL+6tFY=;
        b=Nl8Au40jCuRyqnnDnaJELjOilPKdtjNeBgk0n6uql6wdhGTuz+fSvo6jtEr1mYhFIC
         7sjA+j/ITE5rAswUSjT+Kxk9oteOyFluteQiN/gAH97jsH67dKx5a1msU6IAk9d423yk
         2sNbQL6kHMpsMLX8LjqP6+tHveUsDulKRW03JnoQkB01nb8eMFFfqAQJbu59XfaUoRFn
         J1YTUZ8HJhr+GlDG0KaGkRfnSDZfO47CcIWw/FijkYWWyAcFM0YZu6leZ2MKBrUPARJF
         41w2mv2ZJS6qx+YClWfyhoNvhqS9es8WKsh0w6uF/j0ADqKnHVd2rYpK82aI9RjELAr8
         RISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719477292; x=1720082092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jaHYq9qHI0Bww45jO0JOW2KKMuvYkD8u1X20gL+6tFY=;
        b=oTjqB/J2m3Y0uu4qcbrnV55hN4E2xJIWJTbFxdNwLXKZni778DHPpG9fD2T+yVtOyB
         DO7Hg7/Cj1aITwcGsvaFsAAcOvuYqWBMelon4qhoFQpjt2n//9Unsfhd+Z8FSXZVqJn6
         902KY1Mpm0DLrU0ht6syiEC+QYTsNpD77nYjN0SvQbBmBFbs9dhae5XY0PzSUGTikpJ8
         +jXAo53C68+nVKd08xe/ES1XO7LHZAEAgCXe4+BXqB5HQk4oS0HCub2I9rG7KIskRZzR
         1VrVybsUipABHAisIv706KJsSZ36WmkZzhhjmxA3Y31ad23WtXOMCrrcI3J0j3hhlkoQ
         e2kg==
X-Forwarded-Encrypted: i=1; AJvYcCUBYzcw74NJGFLxZXup2hozLe6iKBEyvea6mqWSNyOScXVmqr8qLeUbVqetpVnpPvrMXNwNvuAaiAaanP8k4oswGHZz47NcQpHRyUYpMeVW
X-Gm-Message-State: AOJu0Yx2PbKuZTs/XecqmT63GLtdvEKiYyEEA+XmIEiefB4SRK0JMf84
	Hwii7ZzI0kuVlAEd6zAylSnfpp77T3IDfgpU6CAmRwSHi4LovtPjiqL75j1pt4IEg1lgEXompnd
	vI/2jqcBjF2OaLmbV2v2JzLRND2Fch/Uqer2R
X-Google-Smtp-Source: AGHT+IHlfk5WkDZhxtSr6xoYbVkipq/AGMIGI9Dxm9ats0II6c5lJlSMjq4hKwrgepsNKkozKV3mIVOymMLBYvUkPo4=
X-Received: by 2002:a05:6512:203b:b0:52c:df55:e112 with SMTP id
 2adb3069b0e04-52ce1832119mr6963173e87.6.1719477291466; Thu, 27 Jun 2024
 01:34:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240621-tracepoint-v3-0-9e44eeea2b85@google.com>
 <20240621-tracepoint-v3-1-9e44eeea2b85@google.com> <ZnrtuaUByT70tJY5@boqun-archlinux>
In-Reply-To: <ZnrtuaUByT70tJY5@boqun-archlinux>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 27 Jun 2024 10:34:39 +0200
Message-ID: <CAH5fLgjCAbz39-8EzBxxrWFXFg6VK=ts98BBvpEk8=RZoMuBSA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] rust: add static_key_false
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	linux-trace-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, "Peter Zijlstra (Intel)" <peterz@infradaed.org>, 
	Sean Christopherson <seanjc@google.com>, Uros Bizjak <ubizjak@gmail.com>, 
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
X-CRM114-CacheID: sfid-20240627_013453_924870_82641716 
X-CRM114-Status: GOOD (  24.71  )
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

T24gVHVlLCBKdW4gMjUsIDIwMjQgYXQgNjoxOOKAr1BNIEJvcXVuIEZlbmcgPGJvcXVuLmZlbmdA
Z21haWwuY29tPiB3cm90ZToKPgo+IEhpIEFsaWNlLAo+Cj4gT24gRnJpLCBKdW4gMjEsIDIwMjQg
YXQgMTA6MzU6MjZBTSArMDAwMCwgQWxpY2UgUnlobCB3cm90ZToKPiA+IEFkZCBqdXN0IGVub3Vn
aCBzdXBwb3J0IGZvciBzdGF0aWMga2V5IHNvIHRoYXQgd2UgY2FuIHVzZSBpdCBmcm9tCj4gPiB0
cmFjZXBvaW50cy4gVHJhY2Vwb2ludHMgcmVseSBvbiBgc3RhdGljX2tleV9mYWxzZWAgZXZlbiB0
aG91Z2ggaXQgaXMKPiA+IGRlcHJlY2F0ZWQsIHNvIHdlIGFkZCB0aGUgc2FtZSBmdW5jdGlvbmFs
aXR5IHRvIFJ1c3QuCj4gPgo+ID4gSXQgaXMgbm90IHBvc3NpYmxlIHRvIHVzZSB0aGUgZXhpc3Rp
bmcgQyBpbXBsZW1lbnRhdGlvbiBvZgo+ID4gYXJjaF9zdGF0aWNfYnJhbmNoIGJlY2F1c2UgaXQg
cGFzc2VzIHRoZSBhcmd1bWVudCBga2V5YCB0byBpbmxpbmUKPiA+IGFzc2VtYmx5IGFzIGFuICdp
JyBwYXJhbWV0ZXIsIHNvIGFueSBhdHRlbXB0IHRvIGFkZCBhIEMgaGVscGVyIGZvciB0aGlzCj4g
PiBmdW5jdGlvbiB3aWxsIGZhaWwgdG8gY29tcGlsZSBiZWNhdXNlIHRoZSB2YWx1ZSBvZiBga2V5
YCBtdXN0IGJlIGtub3duCj4gPiBhdCBjb21waWxlLXRpbWUuCj4gPgo+ID4gU2lnbmVkLW9mZi1i
eTogQWxpY2UgUnlobCA8YWxpY2VyeWhsQGdvb2dsZS5jb20+Cj4KPiBbQWRkIGxpbnV4LWFyY2gs
IGFuZCByZWxhdGVkIGFyY2ggbWFpbnRhaW5lcnMgQ2NlZF0KPgo+IFNpbmNlIGlubGluZSBhc21z
IGFyZSB0b3VjaGVkIGhlcmUsIHBsZWFzZSBjb25zaWRlciBjb3B5aW5nIGxpbnV4LWFyY2gKPiBh
bmQgYXJjaCBtYWludGFpbmVycyBuZXh0IHRpbWUgOy0pCgpXaWxsIGRvLgoKPiBGb3IgeDg2XzY0
IGFuZCBhcm02NCBiaXRzOgo+Cj4gQWNrZWQtYnk6IEJvcXVuIEZlbmcgPGJvcXVuLmZlbmdAZ21h
aWwuY29tPgo+Cj4gT25lIHRoaW5nIHRob3VnaCwgd2Ugc2hvdWxkIHNwbGl0IHRoZSBhcmNoLXNw
ZWNpZmljIGltcGxzIGludG8gZGlmZmVyZW50Cj4gZmlsZXMsIGZvciBleGFtcGxlOiBydXN0L2tl
cm5lbC9hcmNoL2FybTY0LnJzIG9yIHJ1c3QvYXJjaC9hcm02NC5ycy4KPiBUaGF0J2xsIGJlIGVh
c2llciBmb3IgYXJjaCBtYWludGFpbmVycyB0byB3YXRjaCB0aGUgUnVzdCBjaGFuZ2VzIHJlbGF0
ZWQKPiB0byBhIHBhcnRpY3VsYXIgYXJjaGl0ZWN0dXJlLgoKSXMgdGhhdCBob3cgeW91IHdvdWxk
IHByZWZlciB0byBuYW1lIHRoZXNlIGZpbGVzPyBZb3UgZG9uJ3Qgd2FudApzdGF0aWNfa2V5IHNv
bWV3aGVyZSBpbiB0aGUgZmlsZW5hbWU/Cgo+IEFub3RoZXIgdGhvdWdodCBpcyB0aGF0LCBjb3Vs
ZCB5b3UgaW1wbGVtZW50IGFuIGFyY2hfc3RhdGljX2JyYW5jaCEoKQo+IChpbnN0ZWFkIG9mIF9z
dGF0aWNfa2V5X2ZhbHNlISgpKSBhbmQgdXNlIGl0IGZvciBzdGF0aWNfa2V5X2ZhbHNlISgpCj4g
c2ltaWxhciB0byB3aGF0IHdlIGhhdmUgaW4gQz8gVGhlIGJlbmVmaXQgaXMgdGhhdCBhdCBsZWFz
dCBmb3IgbXlzZWxmCj4gaXQnbGwgYmUgZWFzaWVyIHRvIGNvbXBhcmUgdGhlIGltcGxlbWVudGF0
aW9uIGJldHdlZW4gQyBhbmQgUnVzdC4KCkkgY2FuIHRyeSB0byBpbmNsdWRlIHRoYXQuCgpBbGlj
ZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
