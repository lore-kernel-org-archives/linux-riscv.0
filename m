Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90EEED24470
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Oct 2024 17:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dlg0ToAYGVXqQVjWDEwrUyW+j7CnbjYuI5nEyTzVBMM=; b=rgjAskzx4yE/ut
	ilI6R2TjD88uUecq9VMZ8Py57/Ar0RbmzmMeTm7ZGfppoOpTFuVp81FBKgGB4ewTjD0+pvvPXMbHc
	XJ4B+BLXOiHpBkiU/EbpEnVZQv6LChyW545hXbwb8MxMJuYhE0xBTbibdrGsWw5tDEDyzVhnyNna3
	KcZHE1Zak0/4eh1aALkOQIuNw2a4zJNngkE9/gYPT8YnzG6L6PzvhzOjt+4aw39z5ltXhZDqXuq+j
	W9y6MXNDrQ5ZUHcQCMemgVMc5s8qQoUTldE5xbhUHNvnKXhFe44JYVEWdJ6tlU79yFA9VEP06qhMP
	4GEDv7O7AyzHjLRvHhEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szJoO-0000000HBhj-0BIE;
	Fri, 11 Oct 2024 17:52:24 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szJoK-0000000HBgG-1Gn2
	for linux-riscv@lists.infradead.org;
	Fri, 11 Oct 2024 17:52:21 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-4603d3e0547so11601cf.0
        for <linux-riscv@lists.infradead.org>; Fri, 11 Oct 2024 10:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728669137; x=1729273937; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nFVu/0Ci5Drk+gHVAbW8VDcAFM6IjgK0BzGcAxp3FVw=;
        b=XKvk47+tZmzF7l/SxH7cAqb79qNcwohVq3vuJRl18VuSCnyDxJbvzd43hlNOeZixQq
         fckTLT7jnU6iYtR8Shb2w1jVgFsLJe+QR+2nfOOt3bD2oRKjaTBsvLJe2zS9nZO9dMQd
         EmYwUJxhbwTLxzYvxPUPggSv8wCIvvy/BHrX69p90Y92uWgHs36NNk9GY3eYULbMWGQI
         t3RXdaRhE6Yd7uXIOVjHvmV03z/Q3P49IyIghwSMvQmUwn5+FyR+sURh5msqb2sYhSuu
         dKWB0V7jR8RkOM7eY2VKaYGsMmxlDHdOVYXprNoA8L3g5w3hCwtg53K/7zHnBEP7A02x
         uRyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728669137; x=1729273937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nFVu/0Ci5Drk+gHVAbW8VDcAFM6IjgK0BzGcAxp3FVw=;
        b=DNuhjpzlcGZExAVuCm7OqJC4myUbh8xJqF1kTDjkWwT9VGAgZF9XRdTGC8UeLKIeYU
         oZSsJcMdygA+bdlzwXH1s1naRlCu25dmf9nRlF7iVL9TlriI/g8Z53UM7Y3679DGfok1
         +QENYf3ZkUPHKGnmdXh6mUjp1UrfeOiskxWOLY7aOmq/JvTebNOEl9+8QcBZ4W1Ot+JD
         Dg0xLberVT3nZdmt5Gdw89GNkCGe0yMfVWEHHt6XfrpR4ZVOOzgG95SWCf5dJYXPb4U5
         SuUD7jyyI0bMTSoQNmezA/ux4ZmKK3m3uNnVij0f4dV/ljcKZ1DFb/VGgM+I4GgO+vO4
         9bLA==
X-Forwarded-Encrypted: i=1; AJvYcCUzUyXCE6ARtiJ/skhE9V03rUSDr05MJB9r2OmTSoMe11h8Kw3yqYGg8l595oxsX9rkf6J78yL3WET7mA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxXfvMTA9iYFjHBtmWxQwn6tFoc7nRPPqJfloEEeaib+3lHw3dy
	x0bqn0T9BdGLKkhdMtoLEAffsrDuEPZYjcOTz49IeB5gAER9c3W0Jq0fOGadwVUIYKBEJotnmkA
	NK/oy2RWStkwwrI3gpRHZOddsBrHCEscp3MdN
X-Google-Smtp-Source: AGHT+IEEPPLA8HdfmHuDQ6n+ZWN9VIwgJKQNohNKF/6PyZg/dJQ0X34S6H6r+67M6aytOK48Tol7C6iHV8tyTZjxViQ=
X-Received: by 2002:a05:622a:2d11:b0:447:f108:f80e with SMTP id
 d75a77b69052e-46058edff6amr144611cf.16.1728669136519; Fri, 11 Oct 2024
 10:52:16 -0700 (PDT)
MIME-Version: 1.0
References: <20241011-tracepoint-v10-0-7fbde4d6b525@google.com>
 <20241011-tracepoint-v10-1-7fbde4d6b525@google.com> <20241011131316.5d6e5d10@eugeo>
 <CABCJKuesYQWvfScFaqv_rW5ZqAJNn4zK9iOFAmyTaYKO3S5hgw@mail.gmail.com> <20241011171251.0bd53f01@eugeo>
In-Reply-To: <20241011171251.0bd53f01@eugeo>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 11 Oct 2024 10:51:37 -0700
Message-ID: <CABCJKue7qT9drhgrXPEjBO=gPw79vYELAZxz747Z8WMF=vj2MQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20241011_105220_364659_FF2651F7 
X-CRM114-Status: GOOD (  22.06  )
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

SGkgR2FyeSwKCk9uIEZyaSwgT2N0IDExLCAyMDI0IGF0IDk6MTLigK9BTSBHYXJ5IEd1byA8Z2Fy
eUBnYXJ5Z3VvLm5ldD4gd3JvdGU6Cj4KPiBPbiBGcmksIDExIE9jdCAyMDI0IDA4OjIzOjE4IC0w
NzAwCj4gU2FtaSBUb2x2YW5lbiA8c2FtaXRvbHZhbmVuQGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4g
PiBPbiBGcmksIE9jdCAxMSwgMjAyNCBhdCA1OjEz4oCvQU0gR2FyeSBHdW8gPGdhcnlAZ2FyeWd1
by5uZXQ+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBGcmksIDExIE9jdCAyMDI0IDEwOjEzOjM0ICsw
MDAwCj4gPiA+IEFsaWNlIFJ5aGwgPGFsaWNlcnlobEBnb29nbGUuY29tPiB3cm90ZToKPiA+ID4K
PiA+ID4gPiArI2lmbmRlZiBDT05GSUdfSlVNUF9MQUJFTAo+ID4gPiA+ICtpbnQgcnVzdF9oZWxw
ZXJfc3RhdGljX2tleV9jb3VudChzdHJ1Y3Qgc3RhdGljX2tleSAqa2V5KQo+ID4gPiA+ICt7Cj4g
PiA+ID4gKyAgICAgcmV0dXJuIHN0YXRpY19rZXlfY291bnQoa2V5KTsKPiA+ID4gPiArfQo+ID4g
PiA+ICtFWFBPUlRfU1lNQk9MX0dQTChydXN0X2hlbHBlcl9zdGF0aWNfa2V5X2NvdW50KTsKPiA+
ID4KPiA+ID4gXiBFeHBsaWNpdCBleHBvcnQgc2hvdWxkIGJlIHJlbW92ZWQuIFRoaXMgb25seSB3
b3JrcyBiZWNhdXNlIHdlIGRpZG4ndAo+ID4gPiByZW1vdmUgZXhwb3J0LmggZnJvbSBhbGwgaGVs
cGVycy5jIHlldCwgYnV0IHRoZXJlJ3MgYSBwYXRjaCB0byBkbwo+ID4gPiB0aGF0IGFuZCB0aGlz
IHdpbGwgc3RvcCB3b3JraW5nLgo+ID4KPiA+IFdoYXQncyB0aGUgYmVuZWZpdCBvZiByZW1vdmlu
ZyBleHBsaWNpdCBleHBvcnRzIGZyb20gdGhlIFJ1c3QgaGVscGVyIEMKPiA+IGNvZGU/IEl0IHJl
cXVpcmVzIHNwZWNpYWwgY2FzaW5nIHRoaW5ncyBsaWtlIG1vZHZlcnNpb25zIGZvciB0aGVzZQo+
ID4gZmlsZXMsIHNvIEkgYXNzdW1lIHRoZXJlJ3MgYSByZWFzb24gZm9yIHRoaXMuIEkgYXNrZWQg
YWJvdXQgaXQgaGVyZSwKPiA+IGJ1dCBuZXZlciBnb3QgYSByZXNwb25zZToKPiA+Cj4gPiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9ydXN0LWZvci1saW51eC9DQUJDSkt1ZHFBRXZMY2RxVHF5ZkUy
K2lXK2plcUJwblRHZ1lKdnJaMGJ5NmhHZGZldlFAbWFpbC5nbWFpbC5jb20vCj4gPgo+ID4gU2Ft
aQo+Cj4gQWgsIEkgZGlkbid0IHNhdyB0aGF0IGVtYWlsLCBwcm9iYWJseSBiZWNhdXNlIEkgYXJj
aGl2ZWQgdGhlIG1haWxzIGFmdGVyCj4gdGhlIHBhdGNoIGlzIGFwcGxpZWQuCgpTb21ldGltZXMg
eW91IG1pZ2h0IGdldCBwaW5ncyBhYm91dCBwYXRjaGVzIHRoYXQgYXJlIGFscmVhZHkgYXBwbGll
ZCB0b28uIDopCgo+IFdlJ3JlIHdvcmtpbmcgdG93YXJkcyBoYXZpbmcgYW4gb3B0aW9uIHRoYXQg
ZW5hYmxlcyBpbmxpbmluZyB0aGVzZQo+IGhlbHBlcnMgaW50byBSdXN0OyB3aGVuIHRoYXQgb3B0
aW9uIGlzIGVuYWJsZWQsIHRoZSBoZWxwZXJzIG11c3Qgbm90IGJlCj4gZXhwb3J0ZWQuIFNlZQo+
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3J1c3QtZm9yLWxpbnV4LzIwMjQwNTI5MjAyODE3LjM2
NDE5NzQtMS1nYXJ5QGdhcnlndW8ubmV0Lwo+IGFuZCBodHRwczovL2x3bi5uZXQvQXJ0aWNsZXMv
OTkzMTYzLy4KCkludGVyZXN0aW5nLCB0aGFua3MgZm9yIHRoZSBsaW5rcy4gSXQgd291bGQgaGF2
ZSBiZWVuIGhlbHBmdWwgdG8KZXhwbGFpbiB0aGUgbW90aXZhdGlvbiBmb3IgdGhlIGNoYW5nZSBh
bHNvIGluIHRoZSBwYXRjaCB0aGF0IHdhcwphcHBsaWVkLgoKRGlkIHlvdSBjb25zaWRlciB1c2lu
ZyB0aGUgcHJlcHJvY2Vzc29yIHRvIHNpbXBseSBza2lwIGV4cG9ydGluZyB0aGUKaGVscGVycyB3
aGVuIGNyb3NzLWxhbmd1YWdlIExUTyBpbmxpbmluZyBpcyB1c2VkPyBUaGlzIHdvdWxkIGFsbG93
IHVzCnRvIHVzZSB0aGUgZXhpc3RpbmcgQyBidWlsZCBydWxlcyBmb3IgdGhlIGNvZGUgaW5zdGVh
ZCBvZiBhZGRpbmcgYQpzZXBhcmF0ZSBydWxlIHRvIGhhbmRsZSBSdXN0LXN0eWxlIGV4cG9ydHMs
IGxpa2UgSSdtIGRvaW5nIGhlcmU6CgpodHRwczovL2dpdGh1Yi5jb20vc2FtaXRvbHZhbmVuL2xp
bnV4L2NvbW1pdC81NDUyNzdlNGQwNDMyZGFmYzUzMGIxNjE4ZjAxNTJhZWQ4MmFmMmY1Cgo+IEl0
J3MgYWxzbyBxdWl0ZSB0ZWRpb3VzIGZvciBldmVyeSBoZWxwZXIgdG8gY2FycnkgdGhpcyBleHBv
cnQuCgpJdCdzIGp1c3Qgb25lIGxpbmUgcGVyIGhlbHBlciwgYnV0IHN1cmUsIEkgZG8gc2VlIHlv
dXIgcG9pbnQuCgpTYW1pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
