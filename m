Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C3DCEACCC
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 14:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bCGUk9hcIrv/sw4W/FHLxj/Nfxb03O4DvM4pkbhgR68=; b=e2w1Qczk+4omQJ
	5NGc5eRh7ZIogWu+HXpQL4Wr9SjzJ7ZiB54M6ASP5j+7fb/SPT6LdDSZsCN8ERm56xG9FFmTb4twX
	Ksd1wgEpqWMZDXdzM+NSOf6gnzcUbnlMI2CVfwHMeACP8q0QgZugIaJSVXVG5G8QuEULVoOFUgj89
	uPzBKKhnIqfvuXsOgdqSf0SzCrcTrOt8fJ3STQLoefE3mYPoMlqs0BfQRG5OAJrplEYGD0FiKrVxJ
	35hhU3YBVLnnlXRzD0b/NDZ90rEaaNJeJY/2JasM8YzfWVIRtZ4pMizN6kWrfA8MyqSgWbcKT3cwx
	5jnKgysQZxSwsCDClmWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svde1-000000036On-2XWq;
	Tue, 01 Oct 2024 14:14:29 +0000
Received: from mail-wr1-f48.google.com ([209.85.221.48])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svdd8-00000003654-1o0w
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 14:13:35 +0000
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-37ce9644daaso1623928f8f.3
        for <linux-riscv@lists.infradead.org>; Tue, 01 Oct 2024 07:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727792012; x=1728396812; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5obgxVfAZEyoG+iqtZvjYkscvrOCzI2Q3//aei7Jed8=;
        b=oA2l4eqdoVmeHBMJ9Fi2mtjJT3KBhohLnuYHW4xn5XxdHxnbpIEArXW3rvVJ1hSw8W
         WGQS/RUILIb7hGct6jXiyQdiwDUpv/auOUhAgD1ZsbtXefSozl7JIMtTB1dGP0yUWXcP
         ntIdS0OzrPycEnR5v8Qf3LyMNVIBYLZYYAgk4eIZl0QhYnNd9J3Kx9DRkGBQPrkskA8r
         +ZwkHAK37wEYbM4bUQJCPs0n12KidMi3lLzcAhinRPdiAbrZY7AtMoso9FP7y+SYtI9y
         YodsCr4cA3DIBJ8XZR+iFzklvdk3UsY3+i+27o0nLHFtJn6kix42Q2HmBSb/G/80rnOg
         CBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727792012; x=1728396812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5obgxVfAZEyoG+iqtZvjYkscvrOCzI2Q3//aei7Jed8=;
        b=IDBmrNmchvLVrHXI5WHfMiJaC9NdEZ4cqyzhloKQTDhtToJLdqfS2L2ORhLMoKQRRW
         Fgndf+F4EEto54A+Rxrm3griQhJIMXjiiqc5HMLrF6BvDqz6zAjAGK+sdfaoxZk7y/9r
         VWrJPSozwLfWp3orrKApgbZUSucbpEO600V4fO3W/HRU9umHaXMc88lV6ER03/oK0VU8
         77FDrlwE3d+zacc5GAGqSlMdh5H0TMayjY3FpyxGbxUWzV8oydIPHEpNVsJmT8pbSpC5
         XGbfSWvEfOcwa4bcIrPgIjI46WiE/kNECqpjglwTmPF7UlTzmKNsulWgbYtjThU2FCVa
         L1Zg==
X-Forwarded-Encrypted: i=1; AJvYcCVKid7MUimGFX0pI/AAYC7vtMYB77L4Tent4SRxGmg1r4B8ztPRV4jzSzGQej/aIZJCdhK5XWBZDEv13Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxXjKdtmAJKDS65d1lp03hTA6DcTEQFXT5yGfN+Gvb/0SXkLces
	v+sjdIeVu05vIADVvB6xBKraE9oRChClYKJmqV8xNzNs26HHfkjdlundSaB3PvebBMlsn5FZ0Cs
	xJ5if8qUjR7JWSzMIxeDzDHcHDDJ/RMh0YrXz
X-Google-Smtp-Source: AGHT+IEGav/rdbRGd4XLNTrqSljOoF/btIXDS4OkzP2Czz8bQKx69WPhqo0AphFZ55+q0RxYyyAvw7unwTk9BVpCMtE=
X-Received: by 2002:a5d:4e09:0:b0:37c:cd0d:208f with SMTP id
 ffacd0b85a97d-37cd5aed7d3mr9191230f8f.49.1727792011796; Tue, 01 Oct 2024
 07:13:31 -0700 (PDT)
MIME-Version: 1.0
References: <20241001-tracepoint-v9-0-1ad3b7d78acb@google.com>
 <20241001-tracepoint-v9-1-1ad3b7d78acb@google.com> <20241001101201.7a43726d@gandalf.local.home>
In-Reply-To: <20241001101201.7a43726d@gandalf.local.home>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 1 Oct 2024 16:13:18 +0200
Message-ID: <CAH5fLggkS-W93KoNANGpKuCgExJ40oNEtC1JtF1ffJyjhZ9Q8g@mail.gmail.com>
Subject: Re: [PATCH v9 1/5] rust: add generic static_key_false
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
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
X-CRM114-CacheID: sfid-20241001_071334_495732_6643506D 
X-CRM114-Status: GOOD (  29.22  )
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

T24gVHVlLCBPY3QgMSwgMjAyNCBhdCA0OjEx4oCvUE0gU3RldmVuIFJvc3RlZHQgPHJvc3RlZHRA
Z29vZG1pcy5vcmc+IHdyb3RlOgo+Cj4gT24gVHVlLCAwMSBPY3QgMjAyNCAxMzoyOTo1OCArMDAw
MAo+IEFsaWNlIFJ5aGwgPGFsaWNlcnlobEBnb29nbGUuY29tPiB3cm90ZToKPgo+ID4gQWRkIGp1
c3QgZW5vdWdoIHN1cHBvcnQgZm9yIHN0YXRpYyBrZXkgc28gdGhhdCB3ZSBjYW4gdXNlIGl0IGZy
b20KPiA+IHRyYWNlcG9pbnRzLiBUcmFjZXBvaW50cyByZWx5IG9uIGBzdGF0aWNfa2V5X2ZhbHNl
YCBldmVuIHRob3VnaCBpdCBpcwo+ID4gZGVwcmVjYXRlZCwgc28gd2UgYWRkIHRoZSBzYW1lIGZ1
bmN0aW9uYWxpdHkgdG8gUnVzdC4KPiA+Cj4gPiBUaGlzIHBhdGNoIG9ubHkgcHJvdmlkZXMgYSBn
ZW5lcmljIGltcGxlbWVudGF0aW9uIHdpdGhvdXQgY29kZSBwYXRjaGluZwo+ID4gKG1hdGNoaW5n
IHRoZSBvbmUgdXNlZCB3aGVuIENPTkZJR19KVU1QX0xBQkVMIGlzIGRpc2FibGVkKS4gTGF0ZXIK
PiA+IHBhdGNoZXMgYWRkIHN1cHBvcnQgZm9yIGlubGluZSBhc20gaW1wbGVtZW50YXRpb25zIHRo
YXQgdXNlIHJ1bnRpbWUKPiA+IHBhdGNoaW5nLgo+ID4KPiA+IFdoZW4gQ09ORklHX0pVTVBfTEFC
RUwgaXMgdW5zZXQsIGBzdGF0aWNfa2V5X2NvdW50YCBpcyBhIHN0YXRpYyBpbmxpbmUKPiA+IGZ1
bmN0aW9uLCBzbyBhIFJ1c3QgaGVscGVyIGlzIGRlZmluZWQgZm9yIGBzdGF0aWNfa2V5X2NvdW50
YCBpbiB0aGlzCj4gPiBjYXNlLiBJZiBSdXN0IGlzIGNvbXBpbGVkIHdpdGggTFRPLCB0aGlzIGNh
bGwgc2hvdWxkIGdldCBpbmxpbmVkLiBUaGUKPiA+IGhlbHBlciBjYW4gYmUgZWxpbWluYXRlZCBv
bmNlIHdlIGhhdmUgdGhlIG5lY2Vzc2FyeSBpbmxpbmUgYXNtIHRvIG1ha2UKPiA+IGF0b21pYyBv
cGVyYXRpb25zIGZyb20gUnVzdC4KPiA+Cj4gPiBSZXZpZXdlZC1ieTogQm9xdW4gRmVuZyA8Ym9x
dW4uZmVuZ0BnbWFpbC5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbGljZSBSeWhsIDxhbGljZXJ5
aGxAZ29vZ2xlLmNvbT4KPiA+IC0tLQo+ID4gIHJ1c3QvYmluZGluZ3MvYmluZGluZ3NfaGVscGVy
LmggfCAgMSArCj4gPiAgcnVzdC9oZWxwZXJzL2hlbHBlcnMuYyAgICAgICAgICB8ICAxICsKPiA+
ICBydXN0L2hlbHBlcnMvanVtcF9sYWJlbC5jICAgICAgIHwgMTUgKysrKysrKysrKysrKysrCj4g
PiAgcnVzdC9rZXJuZWwvanVtcF9sYWJlbC5ycyAgICAgICB8IDI5ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrCj4gPiAgcnVzdC9rZXJuZWwvbGliLnJzICAgICAgICAgICAgICB8ICAxICsK
PiA+ICA1IGZpbGVzIGNoYW5nZWQsIDQ3IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0
IGEvcnVzdC9iaW5kaW5ncy9iaW5kaW5nc19oZWxwZXIuaCBiL3J1c3QvYmluZGluZ3MvYmluZGlu
Z3NfaGVscGVyLmgKPiA+IGluZGV4IGFlODJlOWM5NDFhZi4uZTA4NDZlN2U5M2U2IDEwMDY0NAo+
ID4gLS0tIGEvcnVzdC9iaW5kaW5ncy9iaW5kaW5nc19oZWxwZXIuaAo+ID4gKysrIGIvcnVzdC9i
aW5kaW5ncy9iaW5kaW5nc19oZWxwZXIuaAo+ID4gQEAgLTE0LDYgKzE0LDcgQEAKPiA+ICAjaW5j
bHVkZSA8bGludXgvZXRodG9vbC5oPgo+ID4gICNpbmNsdWRlIDxsaW51eC9maXJtd2FyZS5oPgo+
ID4gICNpbmNsdWRlIDxsaW51eC9qaWZmaWVzLmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L2p1bXBf
bGFiZWwuaD4KPiA+ICAjaW5jbHVkZSA8bGludXgvbWRpby5oPgo+ID4gICNpbmNsdWRlIDxsaW51
eC9waHkuaD4KPiA+ICAjaW5jbHVkZSA8bGludXgvcmVmY291bnQuaD4KPiA+IGRpZmYgLS1naXQg
YS9ydXN0L2hlbHBlcnMvaGVscGVycy5jIGIvcnVzdC9oZWxwZXJzL2hlbHBlcnMuYwo+ID4gaW5k
ZXggMzBmNDAxNDlmM2E5Li4xN2UxYjYwZDE3OGYgMTAwNjQ0Cj4gPiAtLS0gYS9ydXN0L2hlbHBl
cnMvaGVscGVycy5jCj4gPiArKysgYi9ydXN0L2hlbHBlcnMvaGVscGVycy5jCj4gPiBAQCAtMTIs
NiArMTIsNyBAQAo+ID4gICNpbmNsdWRlICJidWlsZF9hc3NlcnQuYyIKPiA+ICAjaW5jbHVkZSAi
YnVpbGRfYnVnLmMiCj4gPiAgI2luY2x1ZGUgImVyci5jIgo+ID4gKyNpbmNsdWRlICJqdW1wX2xh
YmVsLmMiCj4gPiAgI2luY2x1ZGUgImt1bml0LmMiCj4gPiAgI2luY2x1ZGUgIm11dGV4LmMiCj4g
PiAgI2luY2x1ZGUgInBhZ2UuYyIKPiA+IGRpZmYgLS1naXQgYS9ydXN0L2hlbHBlcnMvanVtcF9s
YWJlbC5jIGIvcnVzdC9oZWxwZXJzL2p1bXBfbGFiZWwuYwo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uMGU5ZWQxNTkwM2Y2Cj4gPiAtLS0gL2Rldi9udWxs
Cj4gPiArKysgYi9ydXN0L2hlbHBlcnMvanVtcF9sYWJlbC5jCj4gPiBAQCAtMCwwICsxLDE1IEBA
Cj4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPiA+ICsKPiA+ICsvKgo+
ID4gKyAqIENvcHlyaWdodCAoQykgMjAyNCBHb29nbGUgTExDLgo+ID4gKyAqLwo+ID4gKwo+ID4g
KyNpbmNsdWRlIDxsaW51eC9qdW1wX2xhYmVsLmg+Cj4gPiArCj4KPiBOaXQsIHRoZSBhYm92ZSBs
aW5lIGhhcyBhIHNwdXJpb3VzIHNwYWNlLgoKVGhhbmtzLiBMb29rcyBsaWtlIHRoZSBmdW5jdGlv
biBib2R5IGFsc28gdXNlcyA3IHNwYWNlcyBpbnN0ZWFkIG9mIGEKdGFiLiBJJ2xsIGZpeCBpdC4K
CkFsaWNlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
