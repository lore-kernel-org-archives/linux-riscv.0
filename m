Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEEF5D0EE38
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Oct 2024 21:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LeCyTKLrOWUUz2Vo+ooAWM4FMZa5vXRq7GqJTyAv++c=; b=XVoUdQvZFpdphl
	eTR9WFyhwAsNvfaJwOXWgW8NFz5ob8c5o5r0KL6BuCzFWOs4Xt261j99oksvxo8hdhH85gdkYy/ne
	ogwXJQWYDxn/Kz/nvx8KH2Ls+zeBHHyW6q4RsTyHVLZgcHLYmP7cgT3yY4vNE+IblsvyjfBPISLBl
	88uhxAcf+goWq5jITztbIWYVVV/4Zr0SK9QWnVN/VVniI7wgQhwPBgrOPzuo/WV23IaXLuRcIF+DU
	hyjbBfDDIxdZXVAxfHCRCmAO4+nCde0MQbNV9xWlb3ng7GQPxDljzAfmXewrfv35Sgjb6V1P8pmTN
	zI910oUINAeWeLdxQVGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szN9c-000000000TM-1NeU;
	Fri, 11 Oct 2024 21:26:32 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szN9Z-000000000S3-0eZO
	for linux-riscv@lists.infradead.org;
	Fri, 11 Oct 2024 21:26:30 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-45fb0ebb1d0so21121cf.1
        for <linux-riscv@lists.infradead.org>; Fri, 11 Oct 2024 14:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728681988; x=1729286788; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ka+AjjRuR/G5QQKRrwr0FE8Ey+JDrFkkvTACYvoWcLM=;
        b=U2VKogDDKiJRWHkqFdso2i3wBumFxnl3r0jxeijcql+QNgtirq9stzYLs/CpRKPSvL
         /iAONM8u2TIWUG5E1I/hupVJ2YH99RKM+VayKhbI8Z9sDyKc8yANSBVLHn1qUMu22gxL
         DKzw0OWT2jwL32Yaj/mfYq/8hqsxs8Dj+RBgAGykh+oDn1Ti4mjTnBaL4W1s5lq20sXJ
         RWN4yw/I9PMgXO7YdBy2v9R89296t5AHQQAGt6pbBpMgx12I+vxU6LLqOvWnMQlbFqol
         OZrW9AmKhMEYzUzMXKXRv/bqW1+pUE6hVcWR6q99gHhLsFD4Gkn+9jdDmQP3EO932JYn
         C5qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728681988; x=1729286788;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ka+AjjRuR/G5QQKRrwr0FE8Ey+JDrFkkvTACYvoWcLM=;
        b=ZaaLl3CCzwmkFxtdxUx4hMDS1/Dk/S7unaylv5dxAiatFrWtjZ+A/3mGGrSHKec5n0
         QWuXmk47b1f4zb3ygcfuS9Ntm3NVy5Wmsy9+Wf05mehEGS4cpoiqFgvRoiMUL+AuhjHL
         IGjsHbov0iPnum91vUmNMuxyNC0jgD2P40kjZ8MkL/VaxnZQABGlcD6kqh1AoJ8i5Y/i
         vdS2w+w+6EitEqOXG/8K0iCO/Y6N2Y528jF/WJX78YeVJr1KU+h4K7ziD5lIX6o4z6Ew
         8PxUWS4brk4N+SqN2yhtDCA5lVPytCgR1JHibSG1yz6pw+5aqb0ndY5aL1Pbg0on1gtP
         DEgw==
X-Forwarded-Encrypted: i=1; AJvYcCXGG0XNhNGZqKyCdNS5B94l7S8No33ius1XCfD9lx+QmOQAZKmJwjY71Sc6lY+HKh0sLc4fCTNRnji9hQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6ywxvzlMQXZAX/LMd8X3BgHiwMgmrsLV52RNL8eMOPEgV1vO8
	jyDe7ql9l+Cr2cRFIcLwVenCI7t6Xw4rivHYHVjxe7ERxDSU8zpFTRSyDLGKA7Q7ZSnluIZvIAP
	TwTLl7oAO3ET+Yv96cokb4uN6iuaehhJX4RXu
X-Google-Smtp-Source: AGHT+IEKEmVjWoOqBswBr3NiTYKK5Z9SghdMPP5nc66QbnU8P8zaScBXP/19wKkNBoIcY46P8FQCMYQuouKvAahW2eQ=
X-Received: by 2002:a05:622a:a60d:b0:460:48fc:3cd8 with SMTP id
 d75a77b69052e-46059bf45e5mr189701cf.5.1728681987767; Fri, 11 Oct 2024
 14:26:27 -0700 (PDT)
MIME-Version: 1.0
References: <20241011-tracepoint-v10-0-7fbde4d6b525@google.com>
 <20241011-tracepoint-v10-1-7fbde4d6b525@google.com> <20241011131316.5d6e5d10@eugeo>
 <CABCJKuesYQWvfScFaqv_rW5ZqAJNn4zK9iOFAmyTaYKO3S5hgw@mail.gmail.com>
 <20241011171251.0bd53f01@eugeo> <CABCJKue7qT9drhgrXPEjBO=gPw79vYELAZxz747Z8WMF=vj2MQ@mail.gmail.com>
 <CANiq72nOCkzTyJCydHOrkz3MRizb27sDO_5Y_cKEv3oZDNNqqQ@mail.gmail.com>
In-Reply-To: <CANiq72nOCkzTyJCydHOrkz3MRizb27sDO_5Y_cKEv3oZDNNqqQ@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 11 Oct 2024 14:25:49 -0700
Message-ID: <CABCJKuduZJ4aogg4A6idcMAPMa2N0d4f9aJgbR8HL0YEyTONmA@mail.gmail.com>
Subject: Re: [PATCH v10 1/5] rust: add static_branch_unlikely for static_key_false
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
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
X-CRM114-CacheID: sfid-20241011_142629_216904_7F5CA0F0 
X-CRM114-Status: GOOD (  12.68  )
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

T24gRnJpLCBPY3QgMTEsIDIwMjQgYXQgMTI6NDjigK9QTSBNaWd1ZWwgT2plZGEKPG1pZ3VlbC5v
amVkYS5zYW5kb25pc0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBPY3QgMTEsIDIwMjQg
YXQgNzo1MuKAr1BNIFNhbWkgVG9sdmFuZW4gPHNhbWl0b2x2YW5lbkBnb29nbGUuY29tPiB3cm90
ZToKPiA+Cj4gPiBJdCdzIGp1c3Qgb25lIGxpbmUgcGVyIGhlbHBlciwgYnV0IHN1cmUsIEkgZG8g
c2VlIHlvdXIgcG9pbnQuCj4KPiBJIGd1ZXNzIHdlIHdpbGwgaGF2ZSBhIGxvdCBvZiBoZWxwZXJz
IGFkZGVkIG92ZXIgdGltZSwgc28gZXZlbiBpZiBpdAo+IGlzIG9uZSBsaW5lLCBpdCBtYXkgZW5k
IHVwIGJlaW5nIGEgbG90IG9mIGxpbmVzIGluIHRvdGFsLiBUaGUgcnVsZXMKPiBzaG91bGQgc3Rh
eSBjb25zdGFudCwgd2hpY2ggd291bGQgYmUgYmV0dGVyLiBIYXZpbmcgc2FpZCB0aGF0LCBpdCBp
cwo+IHRydWUgdGhlIGV4dHJhIGNvbXBsZXhpdHkgb2YgdGhlIHJ1bGVzIGlzbid0IGdyZWF0IGVp
dGhlci4KCk15IG9ubHkgY29uY2VybiBpcyB0aGF0IGN1c3RvbSBDIGJ1aWxkIHJ1bGVzIG11c3Qg
YmUga2VwdCBpbiBzeW5jIHdpdGgKTWFrZWZpbGUuYnVpbGQgY2hhbmdlcywgd2hpbGUgRVhQT1JU
X1NZTUJPTCBsaW5lcyBzaG91bGQgYmUgYmFzaWNhbGx5Cm1haW50ZW5hbmNlLWZyZWUuIEhvd2V2
ZXIsIHBlcmhhcHMgdGhpcyBpc24ndCByZWFsbHkgYW4gaXNzdWUgc2luY2UKbW9zdCBvZiB0aGUg
Y29tcGxleGl0eSBpcyBhbHJlYWR5IGNvbnRhaW5lZCBpbiBydWxlX2NjX29fYyB0aGF0IHdlIGNh
bgpjb252ZW5pZW50bHkgcmV1c2UuIEFueXdheSwgSSB0aGluayB0aGlzIGlzIHNvbWV0aGluZyB3
ZSBjYW4gd29ycnkKYWJvdXQgbGF0ZXIgaWYgd2UgYWN0dWFsbHkgcnVuIGludG8gcHJvYmxlbXMu
IEkgd2FzIG1vc3RseSBpbnRlcmVzdGVkCmluIHRoZSByZWFzb25pbmcgYmVoaW5kIHRoZXNlIGNo
YW5nZXMuCgpTYW1pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
