Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8756EEB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 05:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vQkAP9UB1l56NLgXmzZZpTmRU7qswuKz/F5Ii6Lwdtg=; b=thl2uBh/TyEp6Q
	FrQf6gvgi4iLnx8BL6XMMXDgOHO7gdRSyOt4CvixoGjvHLB6sV9Qd5990y9e8fKA2MytJWX+Z1URh
	L18siILOCrIH5XUbw0mW464W3RKePH6oIDsdFI+pUuXyS0EginENVAEiukpAkcCCAxSXFAIn1xj0g
	zMscgFC0YE9xzX4Vvs0ytZDxEzDfIL8nAtGlfRDN3D/wejcaUpEtMtmBLalZpSv0mao3pFrpAxpiL
	GJXErZFbF+pgK5mwX9wES7WdL+7bkWjsZH+L3I5gwow1xsWekJM4E0WNnpN7XaF6J46sL6Em/F7ay
	1WFlh1MQrf+GzKY+5u2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMM6U-009orM-02;
	Thu, 20 Jul 2023 05:21:30 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMM6Q-009oqn-1i
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 05:21:28 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-76731802203so43964785a.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 22:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1689830485; x=1690435285;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/wbrMMQ8KV+niCaXh6uJjaEC3/Z2Le24zOgdMFKpH7A=;
        b=E/Zr9Jc6xEoShH0RQk2rvrcWAkbs2qJx8iGl9hbMHK7GaotEkfJngBuGG9PbGp8wVl
         wxoOpW7hEK/Uqmvksp1lfkKE6jtuimBAy9kR4ZHGFnhdoiM5QQIV6xIM6zB0uZ6A7Lr3
         /kljX445kk9wmORbSRIkspJM2rskoX8+4nF8q+xNmo3dsDPuIDvAjwsFKphO4I61OWpu
         CsF0hFAK2KiX9pWO+ZVlaPeEWYAuZZXG95Fb7mxBqnbAnisVFCRiWr9CWV7EGYYFvi9u
         tIkfz5kwp+4BU5MuqY2Z8YpqxuBhAjXPRhRzb02vogAW0IW/cwIUKT2YEXRRvjq16EE+
         sEBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689830485; x=1690435285;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/wbrMMQ8KV+niCaXh6uJjaEC3/Z2Le24zOgdMFKpH7A=;
        b=XA8N3IE74cpyVzslnDE+VvDl79AYKGZLxFe8KQg4ibNHyfvYqvPxwJHbrKSaKHYzgZ
         +52lGWu2FSjK6ZQDgYpfjsOMv3QxaSWNXd13jj1R0vKMgrbIK4AQt55xsXMLxniBpcyu
         foNNJdmGeN/VUHA1SXeBwJinRul6YMXyVZnawdPSBHeQc6cSvjFbIdyorb3s//ci7lMk
         CyUAA+OQvHuYR0DeuX/YGj1X7igkl7uWYmW1kRyWFxvH14FVp5Yo8SDtdUrsF37O63ZS
         +nLCX1/ylodsTEA4NfPobCceLfDnLpDO4r8R6WC80S1wF88AkB5zp9MGHe18PacL/A8/
         ny+w==
X-Gm-Message-State: ABy/qLbkgpkGjNXEI3TFmESAJo6KJGIMKkyS2MEmvv80CiTmMXLd7Kw4
	kcRiHYiaCi4xxU8uKx/lvz2m44DTjg+Mei56oDK8ow==
X-Google-Smtp-Source: APBJJlHEOy19qtlkcGaHDIuc9mnNrYFhv8bdTodnJgm6v5jJ1iiM+01UseayFLO3E6jvX5MG6G8Qjpj5SRf478QYNEM=
X-Received: by 2002:a05:620a:6407:b0:760:69ca:7a1a with SMTP id
 pz7-20020a05620a640700b0076069ca7a1amr20891834qkn.1.1689830484880; Wed, 19
 Jul 2023 22:21:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230719113542.2293295-1-apatel@ventanamicro.com>
 <20230719113542.2293295-4-apatel@ventanamicro.com> <CAGETcx9zAF2ipO0s-6-zjyvn1JWt7OUS9G=cQ6OwyOPuqh-pBA@mail.gmail.com>
In-Reply-To: <CAGETcx9zAF2ipO0s-6-zjyvn1JWt7OUS9G=cQ6OwyOPuqh-pBA@mail.gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 20 Jul 2023 10:51:13 +0530
Message-ID: <CAK9=C2WZYn_TFZVY2a-DMaGzTesHUotDA2YJCjM6dYmcyyZ1og@mail.gmail.com>
Subject: Re: [PATCH v6 03/14] drivers: irqchip/riscv-intc: Mark all INTC nodes
 as initialized
To: Saravana Kannan <saravanak@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_222126_575413_C146C8BB 
X-CRM114-Status: GOOD (  31.77  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Frank Rowand <frowand.list@gmail.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBKdWwgMjAsIDIwMjMgYXQgMzo0NeKAr0FNIFNhcmF2YW5hIEthbm5hbiA8c2FyYXZh
bmFrQGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBKdWwgMTksIDIwMjMgYXQgNDozNuKA
r0FNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+Cj4gPiBU
aGUgUklTQy1WIElOVEMgbG9jYWwgaW50ZXJydXB0cyBhcmUgcGVyLUhBUlQgKG9yIHBlci1DUFUp
IHNvCj4gPiB3ZSBjcmVhdGUgSU5UQyBJUlEgZG9tYWluIG9ubHkgZm9yIHRoZSBJTlRDIG5vZGUg
YmVsb25naW5nIHRvCj4gPiB0aGUgYm9vdCBIQVJULiBUaGlzIG1lYW5zIG9ubHkgdGhlIGJvb3Qg
SEFSVCBJTlRDIG5vZGUgd2lsbCBiZQo+ID4gbWFya2VkIGFzIGluaXRpYWxpemVkIGFuZCBvdGhl
ciBJTlRDIG5vZGVzIHdvbid0IGJlIG1hcmtlZCB3aGljaAo+ID4gcmVzdWx0cyBkb3duc3RyZWFt
IGludGVycnVwdCBjb250cm9sbGVycyAoc3VjaCBhcyBJTVNJQyBhbmQgQVBMSUMKPiA+IGRpcmVj
dC1tb2RlKSBub3QgYmVpbmcgcHJvYmVkIGR1ZSB0byBtaXNzaW5nIGRldmljZSBzdXBwbGllcnMu
Cj4gPgo+ID4gVG8gYWRkcmVzcyB0aGlzIGlzc3VlLCB3ZSBtYXJrIGFsbCBJTlRDIG5vZGUgZm9y
IHdoaWNoIHdlIGRvbid0Cj4gPiBjcmVhdGUgSVJRIGRvbWFpbiBhcyBpbml0aWFsaXplZC4KPiA+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4K
PiA+IC0tLQo+ID4gIGRyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW50Yy5jIHwgMTAgKysrKysr
KysrLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
PiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbnRjLmMgYi9k
cml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWludGMuYwo+ID4gaW5kZXggNjVmNGEyYWZiMzgxLi40
ZTI3MDRiYzI1ZmIgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWlu
dGMuYwo+ID4gKysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbnRjLmMKPiA+IEBAIC0x
NTUsOCArMTU1LDE2IEBAIHN0YXRpYyBpbnQgX19pbml0IHJpc2N2X2ludGNfaW5pdChzdHJ1Y3Qg
ZGV2aWNlX25vZGUgKm5vZGUsCj4gPiAgICAgICAgICAqIGZvciBlYWNoIElOVEMgRFQgbm9kZS4g
V2Ugb25seSBuZWVkIHRvIGRvIElOVEMgaW5pdGlhbGl6YXRpb24KPiA+ICAgICAgICAgICogZm9y
IHRoZSBJTlRDIERUIG5vZGUgYmVsb25naW5nIHRvIGJvb3QgQ1BVIChvciBib290IEhBUlQpLgo+
ID4gICAgICAgICAgKi8KPiA+IC0gICAgICAgaWYgKHJpc2N2X2hhcnRpZF90b19jcHVpZChoYXJ0
aWQpICE9IHNtcF9wcm9jZXNzb3JfaWQoKSkKPiA+ICsgICAgICAgaWYgKHJpc2N2X2hhcnRpZF90
b19jcHVpZChoYXJ0aWQpICE9IHNtcF9wcm9jZXNzb3JfaWQoKSkgewo+ID4gKyAgICAgICAgICAg
ICAgIC8qCj4gPiArICAgICAgICAgICAgICAgICogVGhlIElOVEMgbm9kZXMgb2YgZWFjaCBDUFUg
YXJlIHN1cHBsaWVycyBmb3IgZG93bnN0cmVhbQo+ID4gKyAgICAgICAgICAgICAgICAqIGludGVy
cnVwdCBjb250cm9sbGVycyAoc3VjaCBhcyBJTVNJQyBhbmQgQVBMSUMgZGlyZWN0LW1vZGUpCj4g
PiArICAgICAgICAgICAgICAgICogc28gd2Ugc2hvdWxkIG1hcmsgYW4gSU5UQyBub2RlIGFzIGlu
aXRpYWxpemVkIGlmIHdlIGFyZQo+ID4gKyAgICAgICAgICAgICAgICAqIG5vdCBjcmVhdGluZyBJ
UlEgZG9tYWluIGZvciBpdC4KPiA+ICsgICAgICAgICAgICAgICAgKi8KPgo+IEknbSBhIGJpdCBj
b25mdXNlZCBieSB0aGlzLiBJZiB0aG9zZSBub24tYm9vdCBDUFVzIElOVEMgZG9lc24ndCBoYXZl
Cj4gYW4gSVJRIGRvbWFpbiwgd2h5IGFyZSB0aGUgZG93bnN0cmVhbSBpbnRlcnJ1cHQgY29udHJv
bGxlcnMgbGlzdGluZwo+IHRoZXNlIG5vbi1ib290IENQVSBJTlRDcyBhcyBhbiB1cHN0cmVhbSBp
bnRlcnJ1cHQgY29udHJvbGxlcj8KCkRvd25zdHJlYW0gaW50ZXJydXB0IGNvbnRyb2xsZXJzIChz
dWNoIGFzIFBMSUMsIEFQTElDIGRpcmVjdC1tb2RlLApvciBJTVNJQykgdXNlICJpbnRlcnJ1cHRz
LWV4dGVuZGVkIiBEVCBwcm9wZXJ0eSB0byBhc3NvY2lhdGUgdGhlaXIKTU1JTyByZXNvdXJjZXMg
d2l0aCB0YXJnZXQgQ1BVLgoKRm9yIGV4YW1wbGU6IElmIHdlIGhhdmUgNCBDUFVzIHRoZW4gUExJ
QyB3aWxsIHR5cGljYWxseSBoYXZlIDIgUExJQwpNTUlPIGNvbnRleHRzIGZvciBlYWNoIENQVSB3
aGVyZSBvbmUgY29udGV4dCBpcyBmb3IgTS1tb2RlIGFuZAphbm90aGVyIGNvbnRleHQgaXMgZm9y
IFMtbW9kZS4gSW4gdGhpcyBjYXNlLCB0aGVyZSBhcmUgdG90YWwgOCBQTElDCk1NSU8gY29udGV4
dHMgYW5kIHRoZSBhcnJhbmdlbWVudCBvZiB0aGVzZSBNTUlPIHJlc291cmNlcyBpcwpwbGF0Zm9y
bSBzcGVjaWZpYyBzbyAiaW50ZXJydXB0cy1leHRlbmRlZCIgRFQgcHJvcGVydHkgaXMgdXNlZCBi
eQpQTElDIGRyaXZlciB0byBkaXNjb3ZlciB0aGUgYXJyYW5nZW1lbnQgb2YgUExJQyBNTUlPIGNv
bnRleHRzCmFuZCB0aGVpciBtYXBwaW5nIHRvIHRhcmdldCBDUFUuCgpTaW1pbGFyIHRvIHRoZSBh
Ym92ZSBleGFtcGxlLCB0aGUgQVBMSUMgZGlyZWN0LW1vZGUgaGFzIHBlci1DUFUKSURDIE1NSU8g
cmVnaXN0ZXJzIGFuZCAiaW50ZXJydXB0cy1leHRlbmRlZCIgRFQgcHJvcGVydHkgaXMgdXNlZAp0
byBkaXNjb3ZlciBhcnJhbmdlbWVudCBvZiB0aGVzZSBJREMgTU1JTyByZWdpc3RlcnMgYW5kIHRo
ZWlyCm1hcHBpbmcgdG8gdGhlIHRhcmdldCBDUFUuCgo+Cj4gVGhpcyBpcyBtb3JlIG9mIGEgcXVl
c3Rpb24gb2YgdGhlIGV4aXN0aW5nIGJlaGF2aW9yIHRoYXQgdGhpcyBwYXRjaCwKPiBidXQgdGhp
cyBwYXRjaCBoaWdobGlnaHRzIHRoZSBleGlzdGluZyBvZGRpdHkuCj4KPiAtU2FyYXZhbmEKPgo+
ID4gKyAgICAgICAgICAgICAgIGZ3bm9kZV9kZXZfaW5pdGlhbGl6ZWQob2ZfZndub2RlX2hhbmRs
ZShub2RlKSwgdHJ1ZSk7Cj4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gPiArICAgICAg
IH0KPiA+Cj4gPiAgICAgICAgIHJldHVybiByaXNjdl9pbnRjX2luaXRfY29tbW9uKG9mX25vZGVf
dG9fZndub2RlKG5vZGUpKTsKPiA+ICB9Cj4gPiAtLQo+ID4gMi4zNC4xCj4gPgoKUmVnYXJkcywK
QW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
