Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 778E8C4829E
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Feb 2024 05:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Edt41xFg/0mPSVdPgSBz9VI2WAoaZp8GRw2EMWiRN3s=; b=Mi4WhbuECOtvzO
	thJ5ieBtevP3Bpyq16fEXDoJpWMGiiWzOAOlDYz9nInAXJmxTK5ST28kmIYkad39PfnZhbziI2Q9H
	HPN0N9WEFFxNcCtAlNqZYayqE6PsjLLg61KVO2Q+Q7Rs0TswXk8SDVOntybcTQeyMpuFU6MjXKCHW
	oruQfwRfra99aayhLNQjA+8VKk7mp5pPsUPGhV/U46s+1sr7IRiFg9FtRoSYjB36QpmYknfimIlx8
	AGjczoXYh2gfKAoX8e4ChkoHTHCmFzMXsuK0PbX7oewydX9JMu+hUKa89ccMVKf+BxMDnh7UlUiJD
	iimSRNV8XFRmnfGWIGvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raUbo-0000000F3O9-3tc2;
	Thu, 15 Feb 2024 05:48:32 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raUbl-0000000F3NS-33HB
	for linux-riscv@lists.infradead.org;
	Thu, 15 Feb 2024 05:48:31 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-511ac32fe38so768015e87.1
        for <linux-riscv@lists.infradead.org>; Wed, 14 Feb 2024 21:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1707976107; x=1708580907; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kCR9TmSawra5wUvs4oISeBGT3tqyzqaDdzBDeohv99Y=;
        b=VKTjhmHLTCHv1pAi/kL7wff4woamwQs1nEYjhbQwYKagJ+Pn/i17p6UTnOdTs4juTD
         ZQTKYhyq/8uci4/TwTCTkbFM3yLNTrc2OhOZSYckHaO9/FsdGxAAiDvt3wWvdumZIgss
         4Oi0LE03ZB2nqVWE65/73LevgHBpY9LuQOte0+9wsXAu5Aq4mZToSsDH9IzIe1G2b8vG
         uAK9O3pkf+VcT93USCLQuO0CtBmpl1pqqdejUXO9wTZFiQ5omvmH1aWITGUk1gbMPloT
         hF4HGYP7vNVzx+P4RJBOTwmpGvFOlkxvzQ/tYSNw1AT3jqssatLdjFSfijeKPPu074z3
         K8Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707976107; x=1708580907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kCR9TmSawra5wUvs4oISeBGT3tqyzqaDdzBDeohv99Y=;
        b=t7z11Wn9Fik57O6MwLrFJSE0CY7eLtY8bXRpbJo4XBnloakrTg/W2TYLiXoQTYa6h+
         jYpMLRTaEzt+ltXytD6QgzYZaBm7EIsB5VJiijjQcsQy9r4oGHWtQs5mDCae+nTRDKp8
         D1NgpItXT63fDP2oHrKnPK0HDyuQHioYyAQ/yfPIY5axDp4SNEgiIaFfO0J52TUp/weT
         mR3S6uvz9MUeU+LpZ/h64uFIYU1d6NWNjhQssfK0wJv/zKZ2as7+QOqicz4m7dDzwy7/
         qyYprHc1iy8cIzsQsV8UMIRRGgHFZXwMTQ7GjirA2DmJNUTdbHqtk1154mi+9Z1VAA4y
         Z+9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUv4KEL9kfeYaeFxgBYfw4O3n51WJawCiMFZdVkL8B9rkTDQlUffILB6kHP1AHtTNjequzBfdP4c+2TagE6IYuUauOn6BnM1DcR8F3q/RrI
X-Gm-Message-State: AOJu0Yz623fcD2zbawcWxAMp4DfPJC8fMNMn2ZIoTWa0EonkhVUlC5aF
	h6yI5d/TYbXaOEThmtkhxr31klfxnl9u+wi6JN9sETiBwKSRC8gMksdb+WMj9P9DJqYtYaiiVX+
	xmN1h3LQE2yIQ+ORMrb+FqnHI96wS1qhunxbmtLCDDPoBDG30
X-Google-Smtp-Source: AGHT+IFXK7zSd2x0PSl1ap8TU3fQMItsMd1vzwFvuhYCp/fEDN7sIyRsPKR8EwxhBD/qfurWwSMNwN2P4fLnuwKJ9SA=
X-Received: by 2002:a05:6512:67:b0:511:82b5:b484 with SMTP id
 i7-20020a056512006700b0051182b5b484mr605399lfo.64.1707976107190; Wed, 14 Feb
 2024 21:48:27 -0800 (PST)
MIME-Version: 1.0
References: <20240127161753.114685-1-apatel@ventanamicro.com>
 <CAK9=C2Vwtj2gZg-P73yLMxu0rPXQ3YrRRuxq6HcpHMXgs-jHaw@mail.gmail.com> <87bk8ig6t2.ffs@tglx>
In-Reply-To: <87bk8ig6t2.ffs@tglx>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 15 Feb 2024 11:18:15 +0530
Message-ID: <CAK9=C2WsSSHgDF+7ruxx_QF0Lk+Dsx2F2Y-_NabnxrJ_qWhgGQ@mail.gmail.com>
Subject: Re: [PATCH v12 00/25] Linux RISC-V AIA Support
To: Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_214829_796530_7C466358 
X-CRM114-Status: GOOD (  21.15  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, "Ahmed S. Darwish" <darwi@linutronix.de>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBGZWIgMTUsIDIwMjQgYXQgMToyNOKAr0FNIFRob21hcyBHbGVpeG5lciA8dGdseEBs
aW51dHJvbml4LmRlPiB3cm90ZToKPgo+IEFudXAhCj4KPiBPbiBTYXQsIEphbiAyNyAyMDI0IGF0
IDIxOjUwLCBBbnVwIFBhdGVsIHdyb3RlOgo+ID4+IENoYW5nZXMgc2luY2UgdjExOgo+ID4+ICAt
IFJlYmFzZWQgb24gTGludXgtNi44LXJjMQo+ID4+ICAtIEluY2x1ZGVkIGtlcm5lbC9pcnEgcmVs
YXRlZCBwYXRjaGVzIGZyb20gImdlbmlycSwgaXJxY2hpcDogQ29udmVydCBBUk0KPiA+PiAgICBN
U0kgaGFuZGxpbmcgdG8gcGVyIGRldmljZSBNU0kgZG9tYWlucyIgc2VyaWVzIGJ5IFRob21hcy4K
PiA+PiAgICAoUEFUQ0g3LCBQQVRDSDgsIFBBVENIOSwgUEFUQ0gxNCwgUEFUQ0gxNiwgUEFUQ0gx
NywgUEFUQ0gxOCwgUEFUQ0gxOSwKPiA+PiAgICAgUEFUQ0gyMCwgUEFUQ0gyMSwgUEFUQ0gyMiwg
UEFUQ0gyMywgYW5kIFBBVENIMzIgb2YKPiA+PiAgICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGludXgtYXJtLWtlcm5lbC8yMDIyMTEyMTEzNTY1My4yMDg2MTEyMzNAbGludXRyb25peC5kZS8p
Cj4gPj4gIC0gVXBkYXRlZCBBUExJQyBNU0ktbW9kZSBkcml2ZXIgdG8gdXNlIHRoZSBuZXcgV0lS
RURfVE9fTVNJIG1lY2hhbmlzbS4KPiA+PiAgLSBVcGRhdGVkIElNU0lDIGRyaXZlciB0byBzdXBw
b3J0IHBlci1kZXZpY2UgTVNJIGRvbWFpbnMgZm9yIFBDSSBhbmQKPiA+PiAgICBwbGF0Zm9ybSBk
ZXZpY2VzLgo+ID4KPiA+IEkgaGF2ZSByZWJhc2VkIGFuZCBpbmNsdWRlZCAxMyBwYXRjaGVzICh3
aGljaCBhZGQgcGVyLWRldmljZSBNU0kgZG9tYWluCj4gPiBpbmZyYXN0cnVjdHVyZSkgZnJvbSB5
b3VyIHNlcmllcyBbMV0uIEluIHRoaXMgc2VyaWVzLCB0aGUgSU1TSUMgZHJpdmVyCj4gPiBpbXBs
ZW1lbnRzIHRoZSBtc2lfcGFyZW50X29wcyBhbmQgQVBMSUMgZHJpdmVyIGltcGxlbWVudHMgd2ly
ZWQtdG8tbXNpCj4gPiBicmlkZ2UgdXNpbmcgeW91ciBuZXcgaW5mcmFzdHJ1Y3R1cmUuCj4gPgo+
ID4gVGhlIHJlbWFpbmluZyAyNyBwYXRjaGVzIG9mIHlvdXIgc2VyaWVzIFsxXSByZXF1aXJlcyB0
ZXN0aW5nIG9uIEFSTQo+ID4gcGxhdGZvcm1zIHdoaWNoIEkgZG9uJ3QgaGF2ZS4gSSBzdWdnZXN0
IHRoZXNlIHJlbWFpbmluZyBwYXRjaGVzIHRvCj4gPiBnbyBhcyBzZXBhcmF0ZSBzZXJpZXMuCj4K
PiBPZiBjb3Vyc2UuIERhcndpIChpbiBDYykgaXMgZ29pbmcgdG8gd29yayBvbiB0aGUgQVJNIHBh
cnRzIHdoZW4gaGUKPiByZXR1cm5zIGZyb20gdmFjYXRpb24uIEknbSBnb2luZyB0byBhcHBseSB0
aGUgaW5mcmFzdHJ1Y3R1cmUgcGF0Y2hlcwo+ICgxLTEzKSBpbiB0aGUgbmV4dCBkYXlzIHNvIHRo
ZXkgYXJlIG91dCBvZiB0aGUgd2F5IGZvciB5b3UgYW5kIERhcndpLAo+IHVubGVzcyBzb21lb25l
IGhhcyBhbnkgb2JqZWN0aW9ucy4KPgo+IFRoYW5rcyBmb3IgcGlja2luZyB0aGlzIHVwIGFuZCBk
cml2aW5nIGl0IGZvcndhcmQhCgpUaGFua3MgVGhvbWFzLCBJIHdpbGwgYmUgc2VuZGluZyB2MTMg
b2YgdGhpcyBzZXJpZXMgbmV4dCB3ZWVrLgoKRm9yIHRoZSB0aW1lIGJlaW5nLCBJIHdpbGwgY2Fy
cnkgdGhlIDEzIGluZnJhc3RydWN0dXJlIHBhdGNoZXMgaW4KdGhpcyBzZXJpZXMgdW50aWwgdGhl
eSBsYW5kIGluIHVwc3RyZWFtIExpbnV4IHNvIHRoYXQgaXQgaXMgZWFzaWVyCmZvciBwZW9wbGUg
dG8gdHJ5IHRoaXMgc2VyaWVzLgoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
