Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B940DE75459
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 18:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=GCBG9qiibDxAL6JdYUnreANNM+oWdMq6RM9XpQ/i+zA=; b=jSoqobA3asfPp5WQnTE6WBuvta
	TQbh3BFYIZ16ujaToomMSIesQziUJLFgJMcLNUhWLo+N5M2bKlKAyaTjODNHmzf/QvmXkpR5O/k9z
	2ZfG3vfEJ9kwTicbipgBLOIa/5k0tmsvq+CzO0tPLMO9QdJVOUQ5rM+oodPGzqmkECCHvQE8x7nUq
	+vRhDztxtR43ejLkhcbSE7bJr6ITT26mZWtxEoziwaCZYg+SnFBvJ0Bw/HUnzOMkLekWwrq5mH9ul
	m5UH3YaxQdnnKwJZzF1ZLtGFmCT7MqZ4anrOo2U02MvOPSQee1mu/RoxqtHYHZ8oUdaRt/BJIASsx
	opajExfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnk7G-00F778-1g;
	Tue, 03 Oct 2023 18:27:30 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnk7D-00F76H-0w
	for linux-riscv@lists.infradead.org;
	Tue, 03 Oct 2023 18:27:28 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-327be5fe4beso1172174f8f.3
        for <linux-riscv@lists.infradead.org>; Tue, 03 Oct 2023 11:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1696357643; x=1696962443; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XKEsyAv6XjAH8lDfghIcM7e9BN4zDNSRbHBKEya8cd8=;
        b=ZPyBjNMhw5wvuEWfcT3mVG8orJPlut0/l2Tir7o6rvqyva1kVaZ+2p+XzZK3dD1Lmg
         C1gNWvBegc3qyvo6EyRbJlTw1geeEIK4RCJUu1IYCpYW2s7QPSQab0eoeO38DM1sKbqB
         ADlvEr541Tmk9R9IoQIgA7cGlwX9dmepN8jtJ5yRBJu23XYtfK0KPvBxlXaLgQHKnQ+F
         HeFDFnW96H5YoeG8ivyMMzsTCZRgIS9D07s/jWaqxhccHlufKB7ABlzkcju6HuEbTd3p
         XpZAfbzeiJzWDXwOSKz5n8b3uQfJe1HCdd1cAiDgZRKeBZuzxtYe7mVSAfjr4P7qBMw4
         BBUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696357643; x=1696962443;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XKEsyAv6XjAH8lDfghIcM7e9BN4zDNSRbHBKEya8cd8=;
        b=nXYgHutHUuH0YCtJ+WE4QufQ3O+S/T9r/TPqh85GepND6WVvA1R+wnArHs7MlWIMhP
         EongdrN3f+TfkzHFTd7OkZlCE/rv+SgZ1nVgHy+p/S7dCG+RKP/921nlNU3C4UfQETBg
         7Kix+2DgKLF8rIaghwD5fI2vN24FJIzMDq9seSJk496tSDWTJwz+BIIi5IuhhzPcvqMX
         FakMn25Vj+EBfLJjymm/Xg5Yi+MReN035yexgbbFxSuM81QkkUQjx3w+6Xec7EzkLOfh
         YUkiclLmGEuvc8JUI3UCxVFDkxZ850T3mdCINaz4aVmfkO+rFYvSYmiNPYzIWqLfw2K8
         Seqw==
X-Gm-Message-State: AOJu0YzEOkpnQquKWfM9fzsHYmfCxg0gbTwUvIrb7aiQDW+p0udWvATc
	f4mn9mJBoW53LzwmhPxnr2kArt5/SKYnBtiBUYlmDg==
X-Google-Smtp-Source: AGHT+IFFlWyGOt0b75dfwwM1K65K2zojxoftJASga5Hu+zgw0aqN5/Z8ze3Y/z9ubr5U1wQ1TY3F3woRwx2wqOVdm9U=
X-Received: by 2002:a5d:6909:0:b0:317:e542:80a8 with SMTP id
 t9-20020a5d6909000000b00317e54280a8mr39860wru.15.1696357643542; Tue, 03 Oct
 2023 11:27:23 -0700 (PDT)
MIME-Version: 1.0
References: <20231003182407.32198-1-alexghiti@rivosinc.com>
In-Reply-To: <20231003182407.32198-1-alexghiti@rivosinc.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 3 Oct 2023 20:27:12 +0200
Message-ID: <CAHVXubgTkoWYEybsbXVbCMO4JaMAChaSq4BgqZZO9ih7OxwUyA@mail.gmail.com>
Subject: Re: [PATCH -fixes] riscv: Fix ftrace syscall handling which are now
 prefixed with __riscv_
To: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <keescook@chromium.org>, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_112727_331097_636935C5 
X-CRM114-Status: GOOD (  20.21  )
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

QENvbm9yIERvb2xleSBUaGlzIGZhaWxzIGNoZWNrcGF0Y2ggYnV0IHRoZSBkb2N1bWVudGF0aW9u
IGhlcmUgc3RhdGVzCnRoYXQgdGhpcyBpcyBob3cgdG8gZG86Cmh0dHBzOi8vZWxpeGlyLmJvb3Rs
aW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvRG9jdW1lbnRhdGlvbi90cmFjZS9mdHJhY2UtZGVz
aWduLnJzdCNMMjQ2CgpPbiBUdWUsIE9jdCAzLCAyMDIzIGF0IDg6MjTigK9QTSBBbGV4YW5kcmUg
R2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gZnRyYWNlIGNyZWF0ZXMg
ZW50cmllcyBmb3IgZWFjaCBzeXNjYWxsIGluIHRoZSB0cmFjZWZzIGJ1dCBoYXMgZmFpbGVkCj4g
c2luY2UgY29tbWl0IDA4ZDBjZTMwZTBlNCAoInJpc2N2OiBJbXBsZW1lbnQgc3lzY2FsbCB3cmFw
cGVycyIpIHdoaWNoCj4gcHJlZml4ZXMgYWxsIHJpc2N2IHN5c2NhbGxzIHdpdGggX19yaXNjdl8u
Cj4KPiBTbyBmaXggdGhpcyBieSBpbXBsZW1lbnRpbmcgYXJjaF9zeXNjYWxsX21hdGNoX3N5bV9u
YW1lKCkgd2hpY2ggYWxsb3dzIHVzCj4gdG8gaWdub3JlIHRoaXMgcHJlZml4Lgo+Cj4gQW5kIGFs
c28gaWdub3JlIGNvbXBhdCBzeXNjYWxscyBsaWtlIHg4Ni9hcm02NCBieSBpbXBsZW1lbnRpbmcK
PiBhcmNoX3RyYWNlX2lzX2NvbXBhdF9zeXNjYWxsKCkuCj4KPiBGaXhlczogMDhkMGNlMzBlMGU0
ICgicmlzY3Y6IEltcGxlbWVudCBzeXNjYWxsIHdyYXBwZXJzIikKPiBTaWduZWQtb2ZmLWJ5OiBB
bGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+Cj4gLS0tCj4gIGFyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vZnRyYWNlLmggfCAyMSArKysrKysrKysrKysrKysrKysrKysKPiAgMSBm
aWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2Z0cmFjZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9mdHJhY2UuaAo+
IGluZGV4IDc0MGE5NzkxNzFlNS4uMmIyZjVkZjdlZjJjIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vZnRyYWNlLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Z0
cmFjZS5oCj4gQEAgLTMxLDYgKzMxLDI3IEBAIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyBm
dHJhY2VfY2FsbF9hZGp1c3QodW5zaWduZWQgbG9uZyBhZGRyKQo+ICAgICAgICAgcmV0dXJuIGFk
ZHI7Cj4gIH0KPgo+ICsvKgo+ICsgKiBMZXQncyBkbyBsaWtlIHg4Ni9hcm02NCBhbmQgaWdub3Jl
IHRoZSBjb21wYXQgc3lzY2FsbHMuCj4gKyAqLwo+ICsjZGVmaW5lIEFSQ0hfVFJBQ0VfSUdOT1JF
X0NPTVBBVF9TWVNDQUxMUwo+ICtzdGF0aWMgaW5saW5lIGJvb2wgYXJjaF90cmFjZV9pc19jb21w
YXRfc3lzY2FsbChzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiArewo+ICsgICAgICAgcmV0dXJuIGlz
X2NvbXBhdF90YXNrKCk7Cj4gK30KPiArCj4gKyNkZWZpbmUgQVJDSF9IQVNfU1lTQ0FMTF9NQVRD
SF9TWU1fTkFNRQo+ICtzdGF0aWMgaW5saW5lIGJvb2wgYXJjaF9zeXNjYWxsX21hdGNoX3N5bV9u
YW1lKGNvbnN0IGNoYXIgKnN5bSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGNvbnN0IGNoYXIgKm5hbWUpCj4gK3sKPiArICAgICAgIC8qCj4gKyAgICAg
ICAgKiBTaW5jZSBhbGwgc3lzY2FsbCBmdW5jdGlvbnMgaGF2ZSBfX3Jpc2N2XyBwcmVmaXgsIHdl
IG11c3Qgc2tpcCBpdC4KPiArICAgICAgICAqIEhvd2V2ZXIsIGFzIHdlIGRlc2NyaWJlZCBhYm92
ZSwgd2UgZGVjaWRlZCB0byBpZ25vcmUgY29tcGF0Cj4gKyAgICAgICAgKiBzeXNjYWxscywgc28g
d2UgZG9uJ3QgY2FyZSBhYm91dCBfX3Jpc2N2X2NvbXBhdF8gcHJlZml4IGhlcmUuCj4gKyAgICAg
ICAgKi8KPiArICAgICAgIHJldHVybiAhc3RyY21wKHN5bSArIDgsIG5hbWUpOwo+ICt9Cj4gKwo+
ICBzdHJ1Y3QgZHluX2FyY2hfZnRyYWNlIHsKPiAgfTsKPiAgI2VuZGlmCj4gLS0KPiAyLjM5LjIK
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
