Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0ACBC48260
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Feb 2024 17:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C8XqFLwxpFO4KPx0cCDb+Z1d4Yzr3Rbo1mhebxSIT+4=; b=Q5Nr7enwGhUVFf
	c4c78cMx7yZM/Q00qSvd0JO1P3YpUG9F3Ix8FcpcA0eMe0Hc4cYg4E9K5ys7dlytfQil04BmEJ5bz
	tZJbbtrLj3FwW60IMfkyYyd+gxyCBAdhLV9SmnH/Sfz7ntpWFCqo5iB08OLpscopMrIqCjrYrhuZL
	uWExg7AS5nY2wNAVksulqHDDLL6+ODhyjoQdMf641H01q3NRXkX4OW9YxUG6PToAPIqB6bxTBODnB
	i3c27TRNzug1zMY0ufjnP29kfyC4PCsQNPy7rUb43BHMDmQgWbyYLGrZD+UwASo+fUzOhDnR+vcpD
	EPnwU5tZBQgd0Ax8drbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb1kU-000000038dS-20Le;
	Fri, 16 Feb 2024 17:11:42 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb1kR-000000038WF-1d6X
	for linux-riscv@lists.infradead.org;
	Fri, 16 Feb 2024 17:11:40 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-363bd37434dso2411805ab.1
        for <linux-riscv@lists.infradead.org>; Fri, 16 Feb 2024 09:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1708103492; x=1708708292; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=havUKwIuQeWK4aYu8DNjs5scwGn6QvvJ9tZ1EDA7AU4=;
        b=e915OAxS9lO6LNBzpNjj/JdajCKIzuYVAB7SJsiR29ICvLGGwNAay/6l31krmxNz32
         Ny7uFQLUAMAwaxBr1vcdW0Ef0CYMtM2hHgE9MnHuclmesUfcmBHprL9IrT7U2uWGMt5F
         F1UrAfwPNPCpkxYLBKHdfftOo4giw+RAEJSkv1F+JFSidlvOGW2m2nb3wKKwCxlXIYSd
         q0/kGWRzfM+ss0FEVkT512ERI53b9QPaZCmca19GiU54WzCF+8erATqs+bsuOyGRfVqp
         SRnmmQLdRJWoPRVuV13PnIWWLONs79Skhot5QiioD+5xVjADL64INrh65QUxpzpS8oE+
         lTvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708103492; x=1708708292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=havUKwIuQeWK4aYu8DNjs5scwGn6QvvJ9tZ1EDA7AU4=;
        b=o8Sr0Aw4c6eG6wrAgmAleLM1j+TWRRBO9LGySQz4UO5XenLx0qSQkt8ZB5jzCxzMLS
         vyRFap2Q4nvlaFrcvsuXhK0UNMW0riwexTrmLRToWAoMNbkhcj2ViVshB4FslD++9uaj
         D4bulT9+NV2o64aWtDv9qYBKXudE3aga6aeJahm/5a8ABb7HGFzcqgHtdVdZQFewls3q
         eDbkKQ7OvGjXSv74SvM/elB2IxDmOd0h/gYMg0Jvpbu/NnmsrVBzYRANEWFKyLhgYk/l
         hasO1hsOzCJirsE4nWY+HEfrAI6f4leH/4F6k2xz/RxSx2PhWXTh4N4XpYz10z9RGp3Q
         0nEA==
X-Forwarded-Encrypted: i=1; AJvYcCX5vWWTxcxmMQnLRW9PmbGpynzlM5CCNKbd96N+B0oXxpPE4L4RljcVI+suDwjL8emsGNEuzNAhBILT/ASo0KL6G4+X5kdU0qF6ev9EJzFQ
X-Gm-Message-State: AOJu0YxxUM+qQIChu9aLoYs9/ynyjbT7Pc2v9l+t24GH2yi1rw1waOtp
	H9gbE5v2bDsF4gunnefdb7crB3LCDA+8wrda+XX4ZcvK7OZ1X1vqWMRfGMO2U5Bn30CzvtnNlI7
	zScqfRpn+Zfh1RF3W11VwvtYq3xSJIDav4XIz/A==
X-Google-Smtp-Source: AGHT+IF3UAIIWYzEtaz8JDQbpsYiGjzgT5lx1iMPisr8gmFJym7YV9W/quLrJxzPRfygtku2OzFcTAaXVtDz1/yCGVc=
X-Received: by 2002:a92:c5a6:0:b0:364:1984:f10f with SMTP id
 r6-20020a92c5a6000000b003641984f10fmr4861690ilt.30.1708103492171; Fri, 16 Feb
 2024 09:11:32 -0800 (PST)
MIME-Version: 1.0
References: <20240127161753.114685-1-apatel@ventanamicro.com>
 <20240127161753.114685-15-apatel@ventanamicro.com> <87jzn4ctks.ffs@tglx>
In-Reply-To: <87jzn4ctks.ffs@tglx>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 16 Feb 2024 22:41:20 +0530
Message-ID: <CAAhSdy2aeyJBcMVre12jGwU52oP9Z=1emB-bcYxygdR3QhP+6w@mail.gmail.com>
Subject: Re: [PATCH v12 14/25] irqchip/sifive-plic: Convert PLIC driver into a
 platform driver
To: Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_091139_643137_611A68EB 
X-CRM114-Status: GOOD (  22.26  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBGZWIgMTYsIDIwMjQgYXQgOTowM+KAr1BNIFRob21hcyBHbGVpeG5lciA8dGdseEBs
aW51dHJvbml4LmRlPiB3cm90ZToKPgo+IE9uIFNhdCwgSmFuIDI3IDIwMjQgYXQgMjE6NDcsIEFu
dXAgUGF0ZWwgd3JvdGU6Cj4gPiArICAgICBwcml2LT5pcnFkb21haW4gPSBpcnFfZG9tYWluX2Ny
ZWF0ZV9saW5lYXIoZGV2LT5md25vZGUsIG5yX2lycXMgKyAxLAo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZwbGljX2lycWRvbWFpbl9vcHMsIHBy
aXYpOwo+ID4gKyAgICAgaWYgKFdBUk5fT04oIXByaXYtPmlycWRvbWFpbikpCj4gPiArICAgICAg
ICAgICAgIHJldHVybiAtRU5PTUVNOwo+Cj4gV2hpbGUgc29tZSBvZiB0aGUgc3R1ZmYgaXMgY2xl
YW5lZCB1cCBieSBkZXZtLCB0aGUgZXJyb3IgaGFuZGxpbmcgaW4KPiB0aGlzIGNvZGUgbG9va3Mg
cHJldHR5IGZyYWdpbGUgYXMgaXQgbGVhdmVzIGluaXRpYWxpemVkIGNvbnRleHRzLAo+IGhhcmR3
YXJlIHN0YXRlLCBjaGFpbmVkIGhhbmRsZXJzIGV0Yy4gYXJvdW5kLgoKU3VyZSwgbGV0IG1lIHRy
eSB0byBpbXByb3ZlIHRoZSBlcnJvciBoYW5kbGluZy4KCj4KPiBUaGUgcXVlc3Rpb24gaXMgd2hl
dGhlciB0aGUgc3lzdGVtIGNhbiBhY3R1YWxseSBib290IG9yIHdvcmsgYXQgYWxsIGlmCj4gYW55
IG9mIHRoaXMgZmFpbHMuCgpPbiBwbGF0Zm9ybXMgd2l0aCBQTElDLCB0aGUgUExJQyBvbmx5IG1h
bmFnZXMgd2lyZWQgaW50ZXJydXB0cwp3aGVyZWFzIElQSXMgYXJlIHByb3ZpZGVkIHRocm91Z2gg
U0JJIChmaXJtd2FyZSBpbnRlcmZhY2UpIHNvIGEKc3lzdGVtIGNhbiBhY3R1YWxseSBjb250aW51
ZSBhbmQgYm9vdCBmdXJ0aGVyIHdpdGhvdXQgUExJQy4KCkluIGZhY3QsIHdlIGRvIGhhdmUgYSBz
eW50aGV0aWMgcGxhdGZvcm0gKG5hbWVseSBRRU1VIHNwaWtlKQp3aGVyZSB0aGVyZSBpcyBubyBQ
TElDIGluc3RhbmNlIGFuZCBMaW51eCBib290cyB1c2luZyBTQkkgYmFzZWQKcG9sbGluZyBjb25z
b2xlLgoKPgo+ID4gKwo+ID4gICAgICAgLyoKPiA+ICAgICAgICAqIFdlIGNhbiBoYXZlIG11bHRp
cGxlIFBMSUMgaW5zdGFuY2VzIHNvIHNldHVwIGNwdWhwIHN0YXRlCj4gPiAtICAgICAgKiBhbmQg
cmVnaXN0ZXIgc3lzY29yZSBvcGVyYXRpb25zIG9ubHkgd2hlbiBjb250ZXh0IGhhbmRsZXIKPiA+
IC0gICAgICAqIGZvciBjdXJyZW50L2Jvb3QgQ1BVIGlzIHByZXNlbnQuCj4gPiArICAgICAgKiBh
bmQgcmVnaXN0ZXIgc3lzY29yZSBvcGVyYXRpb25zIG9ubHkgYWZ0ZXIgY29udGV4dCBoYW5kbGVy
cwo+ID4gKyAgICAgICogb2YgYWxsIG9ubGluZSBDUFVzIGFyZSBpbml0aWFsaXplZC4KPiA+ICAg
ICAgICAqLwo+ID4gLSAgICAgaGFuZGxlciA9IHRoaXNfY3B1X3B0cigmcGxpY19oYW5kbGVycyk7
Cj4gPiAtICAgICBpZiAoaGFuZGxlci0+cHJlc2VudCAmJiAhcGxpY19jcHVocF9zZXR1cF9kb25l
KSB7Cj4gPiArICAgICBjcHVocF9zZXR1cCA9IHRydWU7Cj4gPiArICAgICBmb3JfZWFjaF9vbmxp
bmVfY3B1KGNwdSkgewo+ID4gKyAgICAgICAgICAgICBoYW5kbGVyID0gcGVyX2NwdV9wdHIoJnBs
aWNfaGFuZGxlcnMsIGNwdSk7Cj4gPiArICAgICAgICAgICAgIGlmICghaGFuZGxlci0+cHJlc2Vu
dCkgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGNwdWhwX3NldHVwID0gZmFsc2U7Cj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gPiArICAgICAgICAgICAgIH0KPiA+ICsgICAg
IH0KPiA+ICsgICAgIGlmIChjcHVocF9zZXR1cCkgewo+ID4gICAgICAgICAgICAgICBjcHVocF9z
ZXR1cF9zdGF0ZShDUFVIUF9BUF9JUlFfU0lGSVZFX1BMSUNfU1RBUlRJTkcsCj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICJpcnFjaGlwL3NpZml2ZS9wbGljOnN0YXJ0aW5nIiwK
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGxpY19zdGFydGluZ19jcHUsIHBs
aWNfZHlpbmdfY3B1KTsKPiA+ICAgICAgICAgICAgICAgcmVnaXN0ZXJfc3lzY29yZV9vcHMoJnBs
aWNfaXJxX3N5c2NvcmVfb3BzKTsKPiA+IC0gICAgICAgICAgICAgcGxpY19jcHVocF9zZXR1cF9k
b25lID0gdHJ1ZTsKPgo+IEkgZG9uJ3QgdGhpbmsgdGhhdCByZW1vdmluZyB0aGUgc2V0dXAgcHJv
dGVjdGlvbiBpcyBjb3JyZWN0Lgo+Cj4gQXNzdW1lIHlvdSBoYXZlIG1heGNwdXM9TiBvbiB0aGUg
a2VybmVsIGNvbW1hbmQgbGluZSwgdGhlbiB0aGUgYWJvdmUKPiBmb3JfZWFjaF9vbmxpbmVfY3B1
KCkgbG9vcCB3b3VsZCByZXN1bHQgaW4gY3B1aHBfc2V0dXAgPT0gdHJ1ZSB3aGVuIHRoZQo+IGlu
c3RhbmNlcyBmb3IgdGhlIG5vdCBvbmxpbmVkIENQVXMgYXJlIHNldCB1cCwgbm8/CgpBIHBsYXRm
b3JtIGNhbiBoYXZlIG11bHRpcGxlIFBMSUMgaW5zdGFuY2VzIHdoZXJlIGVhY2ggUExJQwppbnN0
YW5jZSB0YXJnZXRzIGEgc3Vic2V0IG9mIEhBUlRzIChvciBDUFVzKS4KClByZXZpb3VzbHkgKGJl
Zm9yZSB0aGlzIHBhdGNoKSwgd2Ugd2VyZSBwcm9iaW5nIFBMSUMgdmVyeSBlYXJseSBzbyBvbgph
IHBsYXRmb3JtIHdpdGggbXVsdGlwbGUgUExJQyBpbnN0YW5jZXMsIHdlIG5lZWQgdG8gZW5zdXJl
IHRoYXQgY3B1aHAKc2V0dXAgaXMgZG9uZSBvbmx5IGFmdGVyIFBMSUMgY29udGV4dCBhc3NvY2lh
dGVkIHdpdGggYm9vdCBDUFUgaXMKaW5pdGlhbGl6ZWQgaGVuY2UgdGhlIHBsaWNfY3B1aHBfc2V0
dXBfZG9uZSBjaGVjay4KClRoaXMgcGF0Y2ggY29udmVydHMgUExJQyBkcml2ZXIgaW50byBhIHBs
YXRmb3JtIGRyaXZlciBzbyBub3cgUExJQwppbnN0YW5jZXMgYXJlIHByb2JlZCBhZnRlciBhbGwg
YXZhaWxhYmxlIENQVXMgYXJlIGJyb3VnaHQtdXAuIEluIHRoaXMKY2FzZSwgdGhlIGNwdWhwIHNl
dHVwIG11c3QgYmUgZG9uZSBvbmx5IGFmdGVyIFBMSUMgY29udGV4dCBvZiBhbGwKYXZhaWxhYmxl
IENQVXMgYXJlIGluaXRpYWxpemVkIG90aGVyd2lzZSBzb21lIG9mIHRoZSBDUFVzIGNyYXNoCmlu
IHBsaWNfc3RhcnRpbmdfY3B1KCkgZHVlIHRvIGxhY2sgb2YgUExJQyBjb250ZXh0IGluaXRpYWxp
emF0aW9uLgoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
