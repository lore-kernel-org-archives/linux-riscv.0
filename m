Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48970E77180
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Dec 2024 09:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gm57iS+wTwIAQxD/HHhmQ1ehAp2JSwYAYrm9gO9V6pM=; b=fBkbU94a5OEVaq
	0dM3RrviVhEHLGb/VSMNbdfIa3U6yxFxCWEOzgCd3zrR1iYA0LRCSCmZEObewgpqlf19tuJVeUyK+
	DHggxb/uzX0OmCaPy3LytnXXGeTftMq+8RNXzyTfTc4r+3khF9eoAaRzV7Q/USo3hfZtiAqdGXRAe
	zl9wj2CuJc/G2Cji6M4rDYm73yYluPRTus68TTgbOXn+Ls/bSsb6l/416eY4nDqZvN5xkCV6Goc6c
	3oKt9vyxj6dv+wLtMyeNW5TPvg3CPeR3Kgq+lKThVX9oZ5OuGidQgPWFfIg3lQuUnZ4AfpPKYKLID
	WmhyX1IS/XOtR148aMUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKwCJ-0000000AoJ4-3pcL;
	Tue, 10 Dec 2024 09:06:27 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKwBF-0000000Ao7U-2DJh
	for linux-riscv@lists.infradead.org;
	Tue, 10 Dec 2024 09:05:22 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-434a742481aso48133455e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 10 Dec 2024 01:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733821519; x=1734426319; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ep5OKFJpfszekExX4/IRcefemdiT8s+lNUZhAL6lYhw=;
        b=QtEHjbDXzCFUh/5hRuyOlYR1lPjZ77yw4e7ok6GrKCGeDIOYrHd9Ky8avNjejmQ2Cp
         xaSYKphSfGIy0qs+ahEaKuGktChLaIpyj7nQNwnWz5MJ93vTfBQMjHceMk7u0zItIjC/
         WdM1wWob/ZC9aE1dAtrcEHfMjQW1mGVgc2PXSLtc73CrryrZMp5GeBYwVj4BJoqBYLfK
         On54YV0RYpRZVihUGnZaaNUi2hjf6dApL41CH+qRFnzoood3xC0PAD3w4WTmM2XP3AG1
         Ltv7psQbuCxC2bK8h0jKhy71Qb8WvkIodF7k6O/A+o6JmmZFjmTSJsbRNojm/JGEzEZ+
         xJlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733821519; x=1734426319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ep5OKFJpfszekExX4/IRcefemdiT8s+lNUZhAL6lYhw=;
        b=JsXySrOfbI9VczENRn61bI2165DGWzd8PtfCpRJ0e7x3Cow62FLwbO1ZyFD2fWulDk
         eZePguOQ+0Qq09oostgE4RraKlju4Kh2QVVqbrlvSmsQ7hVfnhX1p7+YCA35AvrRpCbF
         XBlCb4lKlHcd8JeyfkjawLsM08OAaF4fFLEVHBGV7RHbuGUJllBJkF35KMxK1hhFlOSb
         i5dWZ9Hz+X05jUdxNFq/miF8RJxYsb6tt2SHTOw0Jp2MX9swf3ad2YTu2EsT+uakCkz6
         /TSNx825fDNRFMj3R0Mb/IQWGlAheJDUg4QzK1K3TaiLEGj2T/9IdbVdFvpANbL0YWSh
         a5cA==
X-Forwarded-Encrypted: i=1; AJvYcCWx4JYbOq/YDvIGB7ygGLmX4+fvPZIz8aUq4OqjS/arY4NOqdmXIoNcFVa81Dyn4Nb13CKPNG+VYZGYLw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyJq2vxzchIT+yNUB+mplVWzUIOP7+GsJyVYIrUmxhQ95jgUQbS
	vUMV4iuhlXZqSuMDvv9CRvBZdqc3KQpyY9/gJerxb0PF7OtvlGtnI5I/ufrze5aFUjpmpC7SqEk
	F4CyEGJMsuzAAyqklGiYfpoU6ueJfpKZfjdjFXFhjjT0hRxR+YTSN
X-Gm-Gg: ASbGncsdwySzEkqDylYTaHSdDo9AIsJ7wW1ejRQ7ZN0L0JWZkOrP15y5mbTMYb6pSLQ
	9Yw2riT7MK6l6fQT6rFTV3sXEoX9yQzti6IvEggNB1VaEWlecuUPXkNXMAuOwPH+IIg==
X-Google-Smtp-Source: AGHT+IGIVjgo6xFN35HYB1TgvILbI9Al6TSHNEWYp3ypNeyi+o9RjYaXrxzLsc97Z2zDVdAJ5OXIaoQOhG2vsZwboeY=
X-Received: by 2002:a05:6000:156f:b0:374:c4e2:3ca7 with SMTP id
 ffacd0b85a97d-3862b33e3cemr11655971f8f.5.1733821519043; Tue, 10 Dec 2024
 01:05:19 -0800 (PST)
MIME-Version: 1.0
References: <20241210001802.228725-1-fujita.tomonori@gmail.com> <20241210001802.228725-6-fujita.tomonori@gmail.com>
In-Reply-To: <20241210001802.228725-6-fujita.tomonori@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 10 Dec 2024 10:05:07 +0100
Message-ID: <CAH5fLgiShKMGo6AYWM-4S8JK+iDA+tUfz9uxkns82g0nLW--NQ@mail.gmail.com>
Subject: Re: [PATCH v1 5/5] rust: Add warn_on and warn_on_once
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	x86@kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, peterz@infradead.org, hpa@zytor.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org, 
	kernel@xen0n.name, tangyouling@loongson.cn, hejinyang@loongson.cn, 
	yangtiezhu@loongson.cn, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@kernel.org, tmgross@umich.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_010521_558401_6BBDD621 
X-CRM114-Status: GOOD (  13.79  )
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

T24gVHVlLCBEZWMgMTAsIDIwMjQgYXQgMToxOeKAr0FNIEZVSklUQSBUb21vbm9yaQo8ZnVqaXRh
LnRvbW9ub3JpQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBBZGQgd2Fybl9vbiBhbmQgd2Fybl9vbl9v
bmNlIG1hY3Jvcy4gV3JhcHBpbmcgdGhlIEMncyBXQVJOXyogYW5kIEJVR18qCj4gbWFjcm9zIGRv
ZXNuJ3Qgd29yayBzbyB0aGlzIHVzZXMgdGhlIGFzc2VtYmx5IGNvZGUgZXhwb3J0ZWQgYnkgdGhl
IEMKPiBzaWRlIHZpYSBBUkNIX1dBUk5fQVNNIG1hY3JvLiBMaWtlIHRoZSBzdGF0aWMgYnJhbmNo
IGNvZGUsIHRoaXMKPiBnZW5lcmF0ZXMgdGhlIGFzc2VtYmx5IGNvZGUgZm9yIHJ1c3QgZHluYW1p
Y2FsbHkgYnkgdXNpbmcgdGhlIEMKPiBwcmVwcm9jZXNzb3IuCj4KPiBmaWxlKCkhIG1hY3JvIGRv
ZXNuJ3Qgd29yayBmb3IgdGhlIFJ1c3QgaW5saW5lIGFzc2VtYmx5IGluIHRoZSBzYW1lCj4gd2F5
IGFzIF9fRklMRV9fIGZvciB0aGUgQyBpbmxpbmUgYXNzZW1ibHkuIFNvIHRoZSBjb2RlIHRvIGhh
bmRsZSBhCj4gZmlsZSBuYW1lIGlzIGRpZmZlcmVudCBmcm9tIHRoZSBDIGFzc2VtYmx5IGNvZGUg
KHNpbWlsYXIgdG8gdGhlCj4gYXJtNjQvbG9vbmdhcmNoIGFzc2VtYmx5KS4KPgo+IEFTTV9SRUFD
SEFCTEUgZGVmaW5pdGlvbiB3b3JrcyBpbiB0aGUgc2FtZSB3YXkgdG8gZ2V0IG9ianRvb2wncwo+
IHJlYWNoYWJsZSBhc20gY29kZS4gVGhlIGFyY2hpdGVjdHVyZXMgd2hpY2ggdXNlIG9ianRvb2wg
KHg4NiBhbmQKPiBsb29uZ2FyY2gpIG5lZWRzIGl0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogRlVKSVRB
IFRvbW9ub3JpIDxmdWppdGEudG9tb25vcmlAZ21haWwuY29tPgoKPiArI1ttYWNyb19leHBvcnRd
Cj4gKyNbZG9jKGhpZGRlbildCj4gKyNbY2ZnKGFsbChDT05GSUdfQlVHLCBub3QoQ09ORklHX1VN
TCkpKV0KPiArI1tjZmcoYW55KHRhcmdldF9hcmNoID0gIng4Nl82NCIsIHRhcmdldF9hcmNoID0g
InJpc2N2NjQiKSldCgo+ICsjW21hY3JvX2V4cG9ydF0KPiArI1tkb2MoaGlkZGVuKV0KPiArI1tj
ZmcoYWxsKENPTkZJR19CVUcsIG5vdChDT05GSUdfVU1MKSkpXQo+ICsjW2NmZyhhbnkodGFyZ2V0
X2FyY2ggPSAiYWFyY2g2NCIsIHRhcmdldF9hcmNoID0gImxvb25nYXJjaDY0IikpXQoKV2hhdCdz
IHRoZSByZWFzb24gZm9yIHRoaXMgYXJjaC1zcGVjaWZpYyBjb2RlPyBUaGUgZmlsZSEoKS9saW5l
ISgpCmludm9jYXRpb25zPyBDb3VsZCB0aGV5IGJlIHBhc3NlZCBhcyBhbiBhcmd1bWVudCB0byB0
aGUgYXNtIGluc3RlYWQgc28KdGhhdCB3ZSBkb24ndCBuZWVkIHRhcmdldF9hcmNoIGNmZ3M/IEkg
dW5kZXJzdGFuZCB0aGF0IHRoZXkgZG9uJ3Qgd29yawpleGFjdGx5IHRoZSBzYW1lIHdheSwgYnV0
IG1heWJlIGl0IGNvdWxkIHN0aWxsIHdvcms/Cgo+ICsjW21hY3JvX2V4cG9ydF0KPiArI1tkb2Mo
aGlkZGVuKV0KPiArI1tjZmcoYWxsKENPTkZJR19CVUcsIENPTkZJR19VTUwpKV0KPiArbWFjcm9f
cnVsZXMhIHdhcm5fZmxhZ3Mgewo+ICsgICAgKCRmbGFnczpleHByKSA9PiB7Cj4gKyAgICAgICAg
Ly8gU0FGRVRZOiBKdXN0IGFuIEZGSSBjYWxsLgo+ICsgICAgICAgIHVuc2FmZSB7Cj4gKyAgICAg
ICAgICAgICRjcmF0ZTo6YmluZGluZ3M6Ondhcm5fc2xvd3BhdGhfZm10KAo+ICsgICAgICAgICAg
ICAgICAgJGNyYXRlOjpjX3N0ciEoOjpjb3JlOjpmaWxlISgpKS5hc19wdHIoKSBhcyAqY29uc3Qg
Ojpjb3JlOjpmZmk6OmNfY2hhciwKPiArICAgICAgICAgICAgICAgIGxpbmUhKCkgYXMgaTMyLAo+
ICsgICAgICAgICAgICAgICAgJGZsYWdzIGFzIHUzMiwKPiArICAgICAgICAgICAgICAgIDo6Y29y
ZTo6cHRyOjpudWxsKCkgYXMgKmNvbnN0IDo6Y29yZTo6ZmZpOjpjX2NoYXIsCgpJIHdvbmRlciBp
ZiB0aGlzIGNvdWxkIGJlIHdyaXR0ZW4gdG8gdXRpbGl6ZSBMb2NhdGlvbjo6Y2FsbGVyKCkKaW5z
dGVhZCBzbyB0aGF0IGAjW3RyYWNrX2NhbGxlcl1gIHdvcmtzPwoKQWxpY2UKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
