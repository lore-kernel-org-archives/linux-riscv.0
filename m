Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7EEC48BC3
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Feb 2024 05:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kxjAJQ69ad771e+HhkqT953kkEJegMS+CHrmfzeDCkk=; b=oZ8COcL1Fh2jJC
	PEwc6oUOC7s7GJDaYnZAZ5cafoL8Feu48IHgqB0ZUUphAg8hfGTj2Wk0Oqd5WR2jG6G7Dx8EJ04f2
	GMZXtJ1lmoInsePvzSccinax7/VbNSd46zM9NLEXGb8z5poKFJR/0Alwoi6JmBaVuaAz4bFJ4tcVo
	oBUD+jLgwGFtHKKUhDUjYv7p10VNUiH4JUimUXdDcBdIIfy8fGo+laGT9I7fnVUpTwpJPQUwCKRpq
	Znqc6sDIwT1Y98jony5KXpTyIQEINcBTQpoII+N9iahGkO3Lk5t/fsPckYC4PPek/xE4d8PpPmN+Z
	0fxlgoBERti7/p6TAZug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcfNQ-0000000HEfB-18ID;
	Wed, 21 Feb 2024 05:42:40 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcfNN-0000000HEeM-0zNg
	for linux-riscv@lists.infradead.org;
	Wed, 21 Feb 2024 05:42:38 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2d243797703so29401531fa.3
        for <linux-riscv@lists.infradead.org>; Tue, 20 Feb 2024 21:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1708494154; x=1709098954; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w1d7hZavIMGB2x2hfQFp+lPTn6xdZ/fjiStm9f3KoRE=;
        b=notVOXJfTnUJRdR3SxHuAm2pRPjSepzs0UKqvu8oYJ1WATpQb3XVDlFxpIbF5M4+UZ
         qFLF5BumoPYql1fV1AplY1xMFTjBK9R8ViQbi9U80WCx0oxnxu9SS79LVizi9D8gOJa+
         AxqBQDnXgnN8+zQJdMc+wm5GjAYzTq4MsfFxgZGg7bRrAbraQQ5SqCgq1KsD9ZmwGDPU
         Vj48+HkawaswGYHIgUH76IB5Tm47/LvgrmO1Sn/c6KbxDHiqRGx06DGcEmY2bZxrh9md
         RAFnZFNqTFZKx70QEAiducdPmCBEfPGb3mmkp2spwSmSMiC8Q7hOK56dEEbcf3eJZh2S
         nlbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708494154; x=1709098954;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w1d7hZavIMGB2x2hfQFp+lPTn6xdZ/fjiStm9f3KoRE=;
        b=qBJ8B7b9e+W5sOZLIvxOuIv+gVn5XgedddcHGh8MKrS1McCEDqMvTP13FboUrl7Yxf
         SpXgeElM5r1+9cYVoky+fOEW1PMT8DnaENOlyfWBRlnMPAvb6yWGEbJ4CRs5x8RP5Hec
         E+UlhJEejvY3p7xqOTsCyUU7uv2x2/zTn5Wk0gttzsaSCYpEss5XLvHRCHgUod4uiZmm
         sJ4q3UZiQVk46iFp3G465gGqHO4LvN+FkvvE64l/RZektzH8JKtBfaPzSZjuzFeQ62yS
         or19i2yTcm7a9PBMakzZsIe0+5jv9Syk+i4pJ09i3OKHoh/EKwmhCioxX8h5DAmXQgyb
         BijA==
X-Forwarded-Encrypted: i=1; AJvYcCX1hxN2BhBVg17ywFAhR8Sbwor2yfBfIJhIOc7qqcaG3UFTd5rnmZ7O1uMGqEg8NNk9wZtA137AeEiEon92pJpwDbjyGg1i8uGhL8px6R6J
X-Gm-Message-State: AOJu0YxuZAtyOi4/d1nVhNqlXnvaXZ/GoG4LG07drnbMPiTViUVpTDWI
	lxpqFXAJ4fH1EdjdZjWqprrcQk/lBmCOJ4GHrA0UDhW+ewbG3N/aV4qBoeysed23Ul2XOnGz/LD
	yWMes5/UT+33dG4t1b2hzkVgcRyMY7L3l7KMXAA==
X-Google-Smtp-Source: AGHT+IFb84z/g0LynflqO9zK/rVG0kAAg34f4O3W488QJp1C1kHZnlxZ0aHySaTBe0gfXMZeky8a58K7CWioKkUsxPU=
X-Received: by 2002:a2e:9bc2:0:b0:2d2:3c72:516d with SMTP id
 w2-20020a2e9bc2000000b002d23c72516dmr4891326ljj.1.1708494153699; Tue, 20 Feb
 2024 21:42:33 -0800 (PST)
MIME-Version: 1.0
References: <20240220060718.823229-1-apatel@ventanamicro.com>
 <20240220060718.823229-11-apatel@ventanamicro.com> <87zfvvgsnr.ffs@tglx>
In-Reply-To: <87zfvvgsnr.ffs@tglx>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 21 Feb 2024 11:12:22 +0530
Message-ID: <CAK9=C2XhUQtYqe2t3HvjxMZw3ffbUCfGfBVrFHf0_Bxtpz-E9g@mail.gmail.com>
Subject: Re: [PATCH v13 10/13] irqchip: Add RISC-V advanced PLIC driver for direct-mode
To: Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_214237_284565_FD178912 
X-CRM114-Status: GOOD (  15.16  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBGZWIgMjAsIDIwMjQgYXQgNzoxMOKAr1BNIFRob21hcyBHbGVpeG5lciA8dGdseEBs
aW51dHJvbml4LmRlPiB3cm90ZToKPgo+IE9uIFR1ZSwgRmViIDIwIDIwMjQgYXQgMTE6MzcsIEFu
dXAgUGF0ZWwgd3JvdGU6Cj4gPiArLyoKPiA+ICsgKiBUbyBoYW5kbGUgYW4gQVBMSUMgZGlyZWN0
IGludGVycnVwdHMsIHdlIGp1c3QgcmVhZCB0aGUgQ0xBSU1JIHJlZ2lzdGVyCj4gPiArICogd2hp
Y2ggd2lsbCByZXR1cm4gaGlnaGVzdCBwcmlvcml0eSBwZW5kaW5nIGludGVycnVwdCBhbmQgY2xl
YXIgdGhlCj4gPiArICogcGVuZGluZyBiaXQgb2YgdGhlIGludGVycnVwdC4gVGhpcyBwcm9jZXNz
IGlzIHJlcGVhdGVkIHVudGlsIENMQUlNSQo+ID4gKyAqIHJlZ2lzdGVyIHJldHVybiB6ZXJvIHZh
bHVlLgo+ID4gKyAqLwo+ID4gK3N0YXRpYyB2b2lkIGFwbGljX2RpcmVjdF9oYW5kbGVfaXJxKHN0
cnVjdCBpcnFfZGVzYyAqZGVzYykKPiA+ICt7Cj4gPiArICAgICBzdHJ1Y3QgYXBsaWNfaWRjICpp
ZGMgPSB0aGlzX2NwdV9wdHIoJmFwbGljX2lkY3MpOwo+ID4gKyAgICAgc3RydWN0IGlycV9kb21h
aW4gKmlycWRvbWFpbiA9IGlkYy0+ZGlyZWN0LT5pcnFkb21haW47Cj4gPiArICAgICBzdHJ1Y3Qg
aXJxX2NoaXAgKmNoaXAgPSBpcnFfZGVzY19nZXRfY2hpcChkZXNjKTsKPiA+ICsgICAgIGlycV9o
d19udW1iZXJfdCBod19pcnE7Cj4gPiArICAgICBpbnQgaXJxOwo+ID4gKwo+ID4gKyAgICAgY2hh
aW5lZF9pcnFfZW50ZXIoY2hpcCwgZGVzYyk7Cj4gPiArCj4gPiArICAgICB3aGlsZSAoKGh3X2ly
cSA9IHJlYWRsKGlkYy0+cmVncyArIEFQTElDX0lEQ19DTEFJTUkpKSkgewo+ID4gKyAgICAgICAg
ICAgICBod19pcnEgPSBod19pcnEgPj4gQVBMSUNfSURDX1RPUElfSURfU0hJRlQ7Cj4gPiArICAg
ICAgICAgICAgIGlycSA9IGlycV9maW5kX21hcHBpbmcoaXJxZG9tYWluLCBod19pcnEpOwo+ID4g
Kwo+ID4gKyAgICAgICAgICAgICBpZiAodW5saWtlbHkoaXJxIDw9IDApKQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgIGRldl93YXJuX3JhdGVsaW1pdGVkKGlkYy0+ZGlyZWN0LT5wcml2LmRldiwK
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiaHdfaXJxICVs
dSBtYXBwaW5nIG5vdCBmb3VuZFxuIiwgaHdfaXJxKTsKPgo+IExhY2tzIGJyYWNrZXRzLiBTZWUg
RG9jdW1lbnRhdGlvbi4uLi4KCk9rYXksIEkgd2lsbCB1cGRhdGUuCgo+Cj4gPiArICAgICAgICAg
ICAgIGVsc2UKPiA+ICsgICAgICAgICAgICAgICAgICAgICBnZW5lcmljX2hhbmRsZV9pcnEoaXJx
KTsKPiA+ICsgICAgIH0KPiA+ICsKPiA+ICtzdGF0aWMgaW50IGFwbGljX2RpcmVjdF9zdGFydGlu
Z19jcHUodW5zaWduZWQgaW50IGNwdSkKPiA+ICt7Cj4gPiArICAgICBpZiAoYXBsaWNfZGlyZWN0
X3BhcmVudF9pcnEpCj4gPiArICAgICAgICAgICAgIGVuYWJsZV9wZXJjcHVfaXJxKGFwbGljX2Rp
cmVjdF9wYXJlbnRfaXJxLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpcnFf
Z2V0X3RyaWdnZXJfdHlwZShhcGxpY19kaXJlY3RfcGFyZW50X2lycSkpOwo+Cj4gRGl0dG8uCgpP
a2F5LCBJIHdpbGwgdXBkYXRlLgoKPgo+ID4gKyAgICAgcmV0dXJuIDA7Cj4gPiArfQo+Cj4gPiAr
dm9pZCBhcGxpY19pbml0X2h3X2dsb2JhbChzdHJ1Y3QgYXBsaWNfcHJpdiAqcHJpdiwgYm9vbCBt
c2lfbW9kZSkKPiA+ICt7Cj4gPiArICAgICB1MzIgdmFsOwo+ID4gKyNpZmRlZiBDT05GSUdfUklT
Q1ZfTV9NT0RFCj4gPiArICAgICB1MzIgdmFsSDsKPgo+IE5vIGNhbWVsIGNhc2UgcGxlYXNlLgoK
T2theS4KCj4KPiA+ICsKPiA+ICsgICAgIGlmIChtc2lfbW9kZSkgewo+ID4gKyAgICAgICAgICAg
ICB2YWwgPSBsb3dlcl8zMl9iaXRzKHByaXYtPm1zaWNmZy5iYXNlX3Bwbik7Cj4gPiArICAgICAg
ICAgICAgIHZhbEggPSBGSUVMRF9QUkVQKEFQTElDX3hNU0lDRkdBRERSSF9CQVBQTiwgdXBwZXJf
MzJfYml0cyhwcml2LT5tc2ljZmcuYmFzZV9wcG4pKTsKPiA+ICsgICAgICAgICAgICAgdmFsSCB8
PSBGSUVMRF9QUkVQKEFQTElDX3hNU0lDRkdBRERSSF9MSFhXLCBwcml2LT5tc2ljZmcubGh4dyk7
Cj4gPiArICAgICAgICAgICAgIHZhbEggfD0gRklFTERfUFJFUChBUExJQ194TVNJQ0ZHQUREUkhf
SEhYVywgcHJpdi0+bXNpY2ZnLmhoeHcpOwo+ID4gKyAgICAgICAgICAgICB2YWxIIHw9IEZJRUxE
X1BSRVAoQVBMSUNfeE1TSUNGR0FERFJIX0xIWFMsIHByaXYtPm1zaWNmZy5saHhzKTsKPiA+ICsg
ICAgICAgICAgICAgdmFsSCB8PSBGSUVMRF9QUkVQKEFQTElDX3hNU0lDRkdBRERSSF9ISFhTLCBw
cml2LT5tc2ljZmcuaGh4cyk7Cj4gPiArICAgICAgICAgICAgIHdyaXRlbCh2YWwsIHByaXYtPnJl
Z3MgKyBBUExJQ194TVNJQ0ZHQUREUik7Cj4gPiArICAgICAgICAgICAgIHdyaXRlbCh2YWxILCBw
cml2LT5yZWdzICsgQVBMSUNfeE1TSUNGR0FERFJIKTsKPiA+ICsgICAgIH0KPgo+IFRoYW5rcywK
Pgo+ICAgICAgICAgdGdseAoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
