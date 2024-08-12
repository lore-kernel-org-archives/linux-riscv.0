Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D79C3DA7F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Aug 2024 13:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lYonxHmdG0HKlsOmQPlU445Y5O6rgbEuJEhXbuYBJJM=; b=UAsy6NFi2MjwhU
	extiLxLIbro1j97SRGB8b/NRv2geSY8+TY81fOhHBMd0rlmiSpAm3cZyvua5ubBTWjJVKP2iIRHYB
	Pea5MmlCiDAgirNAOM32WSMGqCkHuHY1irSlR6W2NQZQqkv4L1u2QtTXuDvS6Nyudx7GlEg821Wwf
	flfWZer/qf/RjROcWxhe4x9aCKztmqf5gvOSnUPcNiPjP/jA3qJ4AcFvELiEqe6ieUhbZbfGb1RQH
	1bYSuq6gmTWW9aFstg0dGQNe+ozv2GT7/4gcxqVryHclxuE3TV1OnLNyKacdAAhKvGXCwDvIFpxOO
	iiaTOb+m5f7j29xAJOHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdVBJ-00000000Qz6-3rXg;
	Mon, 12 Aug 2024 13:33:53 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdVAj-00000000Qrd-3Qvp
	for linux-riscv@lists.infradead.org;
	Mon, 12 Aug 2024 13:33:52 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-368f92df172so2212089f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 12 Aug 2024 06:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723469592; x=1724074392; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yQGH4wTqdj6UgcbMWJ/OlXYfokf0rrWK3E7OaiXkuCI=;
        b=YiQ+Lu4M630Fut1oFB/z0OjYOBgdM1i0YyEpt3j7JTGLi8G3ZzgozFodCtB0HKFE4Y
         hrKpWaZlEw+B9hBr5Np7smtBJG0eZ2cNPCw0lpmiE9p629EkYvsVhXXaxX5xkP8lp8Gx
         BK+1Edx/oaqw3U1XhSVH7N43+x9oUfB2n9bEvxlflcwAK242TDk3ZcfrDESJUbOF/Ff6
         yi30hFLvIH19ZjHukGWpyfP7XTXJoLFHTXxK0fBrU6R6jfLY9V8ufKb14+rD/HeT8c7e
         TQM0Yza6NzCQIJcnMfaD+MHEQd6GT4Fq+7vWWXkiGf9HKatkILTz+eXMwmxHd2Ft3Kn4
         pR3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723469592; x=1724074392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yQGH4wTqdj6UgcbMWJ/OlXYfokf0rrWK3E7OaiXkuCI=;
        b=QZL9nLuJo1cG43g4TEfgbJHwWsdfyjeV9hz5bPIvEAtwFvOEbvH7v96pqXBxTHwc1G
         R6oMYDyyrq6Pcu1CusY25xKLZ0M/iSNjPm+zUXQUF9rQE1MYWFjJDyQA4yTnpW1QNktk
         gJJW4hBKgBa03RKNsQ8dRdR0dN/dZrO4JMn1WcJ7gvTuhJ6hf/Uy6vPlRQG2OO9hWE+d
         1TL7B9mg56jtXLHO+3ayguz7nCLlH3HV09i+lL2rSBsoi97YShlah4vv63wCUxK1wC0Y
         A6tH7nwwb91WaycPsfEM1YTrW6HfPXURASFN6lwV52SGX32CRtC6VK6nXyrTf+g6Mhm4
         JOug==
X-Forwarded-Encrypted: i=1; AJvYcCW6MMDZJBDvv46RBcwkSpdN0EkXJAQI6+nv0K9nO5lIsMT28KKjpuh+3Ogo4tEkEd5V/69/EeK28vp8JpG8NPJOnELpRJ+HAsqGdkebmgqr
X-Gm-Message-State: AOJu0Yzn8b95yTkDz2v3vOXFY/hXwlB+OVkYvJcHzY/4aPD3qMtmF0Q2
	TbAfzQ0+3nBL7CEgeVU/X23dLaEHwAVfYcZGBcs38vZE6krsDzBdd5mpspvAazg34gUIaO3m0Kr
	XbqiN5hCHAo8xRKd0agk3IJ8eot7GX2OXE/No
X-Google-Smtp-Source: AGHT+IHW60xClnCiQEYYTC8Z9PZ33xaYy4WZgALT6Q+LMP95jazFgPNu9OZ8W3SxyYi1G4TpTJOyz0WQCdXu9YQVFvk=
X-Received: by 2002:a05:6000:b42:b0:363:d980:9a9e with SMTP id
 ffacd0b85a97d-3716cd267abmr226021f8f.55.1723469591316; Mon, 12 Aug 2024
 06:33:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240808-tracepoint-v6-0-a23f800f1189@google.com> <20240808-tracepoint-v6-4-a23f800f1189@google.com>
In-Reply-To: <20240808-tracepoint-v6-4-a23f800f1189@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 12 Aug 2024 15:32:59 +0200
Message-ID: <CAH5fLggC_73YQGLLjUsGnsUjAr9vOS-ebG0=-dWGqS7euzzf4Q@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] jump_label: adjust inline asm to be consistent
To: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>
Cc: linux-trace-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
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
X-CRM114-CacheID: sfid-20240812_063317_872007_2722D6DC 
X-CRM114-Status: GOOD (  13.72  )
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

T24gVGh1LCBBdWcgOCwgMjAyNCBhdCA3OjIz4oCvUE0gQWxpY2UgUnlobCA8YWxpY2VyeWhsQGdv
b2dsZS5jb20+IHdyb3RlOgo+Cj4gVG8gYXZvaWQgZHVwbGljYXRpb24gb2YgaW5saW5lIGFzbSBi
ZXR3ZWVuIEMgYW5kIFJ1c3QsIHdlIG5lZWQgdG8KPiBpbXBvcnQgdGhlIGlubGluZSBhc20gZnJv
bSB0aGUgcmVsZXZhbnQgYGp1bXBfbGFiZWwuaGAgaGVhZGVyIGludG8gUnVzdC4KPiBUbyBtYWtl
IHRoYXQgZWFzaWVyLCB0aGlzIHBhdGNoIHVwZGF0ZXMgdGhlIGhlYWRlciBmaWxlcyB0byBleHBv
c2UgdGhlCj4gaW5saW5lIGFzbSB2aWEgYSBuZXcgQVJDSF9TVEFUSUNfQlJBTkNIX0FTTSBtYWNy
by4KPgo+IFRoZSBoZWFkZXIgZmlsZXMgYXJlIGFsbCB1cGRhdGVkIHRvIGRlZmluZSBhIEFSQ0hf
U1RBVElDX0JSQU5DSF9BU00gdGhhdAo+IHRha2VzIHRoZSBzYW1lIGFyZ3VtZW50cyBpbiBhIGNv
bnNpc3RlbnQgb3JkZXIgc28gdGhhdCBSdXN0IGNhbiB1c2UgdGhlCj4gc2FtZSBsb2dpYyBmb3Ig
ZXZlcnkgYXJjaGl0ZWN0dXJlLgo+Cj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8y
MDI0MDcyNTE4MzMyNS4xMjI4MjctNy1vamVkYUBrZXJuZWwub3JnIFsxXQoKVGhpcyBsaW5rIGlz
IGluIHRoZSB3cm9uZyBwbGFjZS4gSXQncyBzdXBwb3NlZCB0byBiZSBtZW50aW9uZWQgYXMgYQpk
ZXBlbmRlbmN5IGZvciB0aGlzIHNlcmllcy4gQWxzbywgSSBpbnRlbmRlZCB0byBoYXZlIHRoZSBz
YW1lIHRhZ3MKaGVyZSBhcyBJIGRpZCBvbiB0aGUgbGFzdCBwYXRjaC4KCkFsaWNlCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
