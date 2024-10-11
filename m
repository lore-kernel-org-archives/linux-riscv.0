Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12712D0D7BB
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Oct 2024 15:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sMHkYZkQ+xABgMbDY9YN+tiQhRwDk6Eia0fQV4xbmBA=; b=jSGc0nzLNQ0Sth
	+c2ohJ5oOnSilBMN7ZNkExdsBc2fBmV43yuAJoI6IPMpMYUAX2CUnPweg6enQqNKLpuG9ANtGWMdn
	QwWR2e7xiqj2/95tKUBJLU4GKdEV7gbgvG0XwAMxQgzP55Tel7oiQ2LMWY131IwcPTY3CXd2iCK60
	fClJrxrl7tjObqb+23zOjbfoiDqFjbxsRek4ZRbrXKhv0QdfU6boLEBayq07VvG/Ot6Pc+Y/tB8Mo
	RWJKTbW5tuFJSMfRLXfDYwrXNopVVWyUuLFe4NxiIDsqWFL07c0m5/Z/2n3Ao+GNeytQXe/iiHMvE
	gAJr9UBV++K7Imu8ovzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szHZN-0000000GnDC-2V6P;
	Fri, 11 Oct 2024 15:28:45 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szHUm-0000000GlvK-0gjc
	for linux-riscv@lists.infradead.org;
	Fri, 11 Oct 2024 15:24:01 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-4601a471aecso244851cf.1
        for <linux-riscv@lists.infradead.org>; Fri, 11 Oct 2024 08:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728660238; x=1729265038; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rJyLD+5sCaVL1I/s6JcwhAzF4bt83zRxkYYkYug2NjQ=;
        b=e8EAFujZbewFL91W61TF62CLQ7jHvgqpo6yBd9gxXF0uIbUaSjDlsx9yV1FSfkb+JD
         BW2L5a6Iv1lBh2kGR55mRCAUyiUoZnYbIKWKeJzjLEhYyLw0djtE6rxClVHindqU4WXp
         +esEpDBMoB8m3EPV1SjNrAED+z8nYEb8R0oF9YKsTVJU2QXdwdDqvAXJ9PrcgXbLWJ3l
         yDhKahHbpflHaZ4XRFx9ehNbtsWi5CDLo5NYbu8y6oT5Yt7eMsjr2G0CihdpjyqukGzI
         xLGBPIqoGZY70CQOkMspmp5AcPIhOkkk2ntqz+ZMnHZ9C9mKLB20UiIBObwx+LurLn0O
         FO0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728660238; x=1729265038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rJyLD+5sCaVL1I/s6JcwhAzF4bt83zRxkYYkYug2NjQ=;
        b=MT+ClkuvwvNH7M2VT6O5IjCP44+tCcDks5gZGmCLK0Wu37XgWQpExaGqxrC2a6sibX
         dzvl/eEKpdQPkKroWvzqXVDTTsC5zWcCPARRLUP2lKNYwEI/mUK0dfYboHHkz4nDF7Db
         oLJe1PCF2mimPkMV2JRla2mdNjoPMNyqEcmvvfXtny7jBP0rfQFdhb4ZJqJRXZT0/A2f
         gvuwtKAzhMbdZ7+vd7BE7T9UNaftEN7Mm0oANjHhRQMADzw7uOo+TbwVXJoSp286WwW6
         x8QJAUuxdRlic1ArjMxr7G/ovaegJpQDn7cEjAYwALlCiQZUGmryZJiQQxTHrk8+Qhw5
         h7nw==
X-Forwarded-Encrypted: i=1; AJvYcCWrYg+BMroKWN6SUbOE5TRyBmWNITC8/hMp7Oh3GbZDM8JIWprxuUfjUUqrbG0vXMQctQ794q7FG8MqcA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzpWIWSc5Aom40U33nmjqmLn9jWHKXNqQ/yNwfzjK7j4LDAd4gd
	E6HEIVx7GZTu+RLBfzRS7+A6UBTgaZcC2K7Ah5EoFe6ff8hDKLjdLjTm1af94RGJ5ROL1xYZdmy
	FN6BBoffWRCD7zahS6uCvF5NG0wTIdQYmY6dT
X-Google-Smtp-Source: AGHT+IHfcllIoreLPh5LQZRi63Z9gY+SjozCRNWADZolB8YwBJ2VdlJgtHx4ZWrWYxemGDRWFvy4vQZfgGpiBJs66xM=
X-Received: by 2002:ac8:7e4c:0:b0:45f:68d:f0e2 with SMTP id
 d75a77b69052e-4604ac3181amr4086721cf.2.1728660237401; Fri, 11 Oct 2024
 08:23:57 -0700 (PDT)
MIME-Version: 1.0
References: <20241011-tracepoint-v10-0-7fbde4d6b525@google.com>
 <20241011-tracepoint-v10-1-7fbde4d6b525@google.com> <20241011131316.5d6e5d10@eugeo>
In-Reply-To: <20241011131316.5d6e5d10@eugeo>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 11 Oct 2024 08:23:18 -0700
Message-ID: <CABCJKuesYQWvfScFaqv_rW5ZqAJNn4zK9iOFAmyTaYKO3S5hgw@mail.gmail.com>
Subject: Re: [PATCH v10 1/5] rust: add static_branch_unlikely for static_key_false
To: Gary Guo <gary@garyguo.net>
Cc: Alice Ryhl <aliceryhl@google.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Jason Baron <jbaron@akamai.com>, Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
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
X-CRM114-CacheID: sfid-20241011_082400_286533_061053AD 
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

T24gRnJpLCBPY3QgMTEsIDIwMjQgYXQgNToxM+KAr0FNIEdhcnkgR3VvIDxnYXJ5QGdhcnlndW8u
bmV0PiB3cm90ZToKPgo+IE9uIEZyaSwgMTEgT2N0IDIwMjQgMTA6MTM6MzQgKzAwMDAKPiBBbGlj
ZSBSeWhsIDxhbGljZXJ5aGxAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4KPiA+ICsjaWZuZGVmIENPTkZJ
R19KVU1QX0xBQkVMCj4gPiAraW50IHJ1c3RfaGVscGVyX3N0YXRpY19rZXlfY291bnQoc3RydWN0
IHN0YXRpY19rZXkgKmtleSkKPiA+ICt7Cj4gPiArICAgICByZXR1cm4gc3RhdGljX2tleV9jb3Vu
dChrZXkpOwo+ID4gK30KPiA+ICtFWFBPUlRfU1lNQk9MX0dQTChydXN0X2hlbHBlcl9zdGF0aWNf
a2V5X2NvdW50KTsKPgo+IF4gRXhwbGljaXQgZXhwb3J0IHNob3VsZCBiZSByZW1vdmVkLiBUaGlz
IG9ubHkgd29ya3MgYmVjYXVzZSB3ZSBkaWRuJ3QKPiByZW1vdmUgZXhwb3J0LmggZnJvbSBhbGwg
aGVscGVycy5jIHlldCwgYnV0IHRoZXJlJ3MgYSBwYXRjaCB0byBkbwo+IHRoYXQgYW5kIHRoaXMg
d2lsbCBzdG9wIHdvcmtpbmcuCgpXaGF0J3MgdGhlIGJlbmVmaXQgb2YgcmVtb3ZpbmcgZXhwbGlj
aXQgZXhwb3J0cyBmcm9tIHRoZSBSdXN0IGhlbHBlciBDCmNvZGU/IEl0IHJlcXVpcmVzIHNwZWNp
YWwgY2FzaW5nIHRoaW5ncyBsaWtlIG1vZHZlcnNpb25zIGZvciB0aGVzZQpmaWxlcywgc28gSSBh
c3N1bWUgdGhlcmUncyBhIHJlYXNvbiBmb3IgdGhpcy4gSSBhc2tlZCBhYm91dCBpdCBoZXJlLApi
dXQgbmV2ZXIgZ290IGEgcmVzcG9uc2U6CgpodHRwczovL2xvcmUua2VybmVsLm9yZy9ydXN0LWZv
ci1saW51eC9DQUJDSkt1ZHFBRXZMY2RxVHF5ZkUyK2lXK2plcUJwblRHZ1lKdnJaMGJ5NmhHZGZl
dlFAbWFpbC5nbWFpbC5jb20vCgpTYW1pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
