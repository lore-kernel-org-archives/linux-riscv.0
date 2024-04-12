Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D6B4C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 12:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GgCcfakpYk7TjpDOQk+itRVQ8z9eBTbFHw/byYjtX/o=; b=mQVi3Ww1f0FbV/
	H8uf9W0RNxl0AnrlHaH4/yj7pI1HklgJ2Lj3WX7aFqfTdCEO52x5cVxzFCc/InuNHmuAwoMy4ag62
	wG57iy8jSgJhiVera5DEbYNoa/+vvIz+XAui56YHfa3zR3Th8BaMniETP/+S+P3h/mjG8r9N0QXIs
	6WlC60b8yo8qroVDcJ/6ukK0FiIQq6ImjhCtcslcv/9dkRWxzRbQrUrva4sH9XaKz8x9TPlvuxQEx
	wv7f6nxQvV0LfISRawF8QwVwdBxO+QYPZACeGLFnsHafatWYXQJYo+AgXRFU9oXKrslxdr3cnxf4I
	CKC5hoDh7aX/7FB+rQZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvGAP-0000000H94r-2fU4;
	Fri, 12 Apr 2024 12:38:05 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvGAM-0000000H93F-0J0w
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 12:38:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C62B6CE38AB
	for <linux-riscv@lists.infradead.org>; Fri, 12 Apr 2024 12:37:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB8F3C113CD
	for <linux-riscv@lists.infradead.org>; Fri, 12 Apr 2024 12:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712925474;
	bh=C0wVk5cOtI3tAGSa3X+/7Lo5QFB431pX7oYKu/xlIg4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NfSqe5ywT9N1aTLIrHBScsTlGElesoeZ2B4h01aGvwgLuo7e/GXmSnp1YdGBOzxhd
	 ncO601AARHmgdyKTS+w8dEW6WOOBT7aJs6xA3/gETK2O2rAyZrlDcJELUgumpVNSoC
	 PM2SG7Pq8qzdHTYAJ65ho3rM5lI/pLVhePj6Z5PEdVA8G25LV4l/+hbMvZXuT759cS
	 PvAvpIKJIThrUf9EobZoeRgutQGI9grhb8jukktuID3mc4HHqXuhpL8m5NqDL45T2V
	 tY3Tm0lmPYNVIAmJRmHIU90aUWm7YdO7prErJLpWO7OK3Pp+3WiL+/W/eAeD/1DS8o
	 6t8QvDFFuyMvQ==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-516d727074eso1086135e87.0
        for <linux-riscv@lists.infradead.org>; Fri, 12 Apr 2024 05:37:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVtUgG1CU81L1Jnx0EiaALg32GZ6qBG1mGOOuPgLQhySfOhoo9LY1yNjPYFTcBTezgvwvHQzI2S69zs/+OdHnVmkxK+4PvsrJ6sI08z3fzZ
X-Gm-Message-State: AOJu0YymAFSUi1UVrkm4vzgMIj/bRIaMoYLoZzkmDXb9F/AyTc3KjPR6
	1la9RzU/12Qp8iJMiQm49y2Sn/KjAKKxcstInCa21z+J3zWd0XnCl4OWQY9oGPEFqddSaHLXAZD
	S4EEfLSV8QTIFTXes3mpJ6vgPgg==
X-Google-Smtp-Source: AGHT+IEPdekwyhDzkGjzMModGVmVX+iai4Ht/W6b6ZsLvIi1Pt2LX57dciG3IUlZb1DPGcgZeVS0Urn1rk9Ty5lLfV0=
X-Received: by 2002:ac2:4248:0:b0:516:cc2d:f6a1 with SMTP id
 m8-20020ac24248000000b00516cc2df6a1mr1489141lfl.51.1712925473235; Fri, 12 Apr
 2024 05:37:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240412112931.285507-1-apatel@ventanamicro.com>
In-Reply-To: <20240412112931.285507-1-apatel@ventanamicro.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 12 Apr 2024 07:37:40 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJBpN2qNgiKs_nL+JxM7qaaQkd4Gk06UNefp3gB1HQ7_w@mail.gmail.com>
Message-ID: <CAL_JsqJBpN2qNgiKs_nL+JxM7qaaQkd4Gk06UNefp3gB1HQ7_w@mail.gmail.com>
Subject: Re: [PATCH] of: property: Add fw_devlink support for interrupt-map property
To: Anup Patel <apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_053802_495719_AA6CED94 
X-CRM114-Status: GOOD (  21.05  )
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
Cc: devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBBcHIgMTIsIDIwMjQgYXQgNjoyOeKAr0FNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IFNvbWUgb2YgdGhlIFBDSSBjb250cm9sbGVycyAoc3Vj
aCBhcyBnZW5lcmljIFBDSSBob3N0IGNvbnRyb2xsZXIpCj4gdXNlICJpbnRlcnJ1cHQtbWFwIiBE
VCBwcm9wZXJ0eSB0byBkZXNjcmliZSB0aGUgbWFwcGluZyBiZXR3ZWVuCj4gUENJIGVuZHBvaW50
cyBhbmQgUENJIGludGVycnVwdCBwaW5zLgoKSSB3b3VsZCBnbyBhcyBmYXIgYXMgc2F5aW5nIHRo
YXQncyB0aGUgb25seSBjYXNlIGFzIHRoYXQncyB0aGUgb25seQpjYXNlIHdoZXJlIHRoZSBpbnRl
cnJ1cHRzIGFyZSBub3QgZGVzY3JpYmVkIGluIERULgoKPiBDdXJyZW50bHksIHRoZXJlIGlzIG5v
IGZ3X2RldmxpbmsgY3JlYXRlZCBiYXNlZCBvbiAiaW50ZXJydXB0LW1hcCIKPiBEVCBwcm9wZXJ0
eSBzbyBpbnRlcnJ1cHQgY29udHJvbGxlciBpcyBub3QgZ3VhcmFudGVlZCB0byBiZSBwcm9iZWQK
PiBiZWZvcmUgUENJIGhvc3QgY29udHJvbGxlci4gVGhpcyBtYWlubHkgYWZmZWN0cyBSSVNDLVYg
cGxhdGZvcm1zCj4gd2hlcmUgYm90aCBQQ0kgaG9zdCBjb250cm9sbGVyIGFuZCBpbnRlcnJ1cHQg
Y29udHJvbGxlcnMgYXJlIHByb2JlZAo+IGFzIHJlZ3VsYXIgcGxhdGZvcm0gZGV2aWNlcy4KClRo
YXQncyAqZXZlcnkqIHN5c3RlbSB3aXRoIFBDSSByZWFsbHkuCgo+IFRoaXMgY3JlYXRlcyBmd19k
ZXZsaW5rIGJldHdlZW4gY29uc3VtZXJzIChQQ0kgaG9zdCBjb250cm9sbGVyKSBhbmQKPiBzdXBw
bGllciAoaW50ZXJydXB0IGNvbnRyb2xsZXIpIGJhc2VkIG9uICJpbnRlcnJ1cHQtbWFwIiBEVCBw
cm9wZXJ0eS4KPgo+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWlj
cm8uY29tPgo+IC0tLQo+ICBkcml2ZXJzL29mL3Byb3BlcnR5LmMgfCA1MyArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA1MyBpbnNl
cnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9vZi9wcm9wZXJ0eS5jIGIvZHJpdmVy
cy9vZi9wcm9wZXJ0eS5jCj4gaW5kZXggYTYzNThlZTk5Yjc0Li5jY2JiYjY1MWE4OWEgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9vZi9wcm9wZXJ0eS5jCj4gKysrIGIvZHJpdmVycy9vZi9wcm9wZXJ0
eS5jCj4gQEAgLTEzMTEsNiArMTMxMSw1OCBAQCBzdGF0aWMgc3RydWN0IGRldmljZV9ub2RlICpw
YXJzZV9pbnRlcnJ1cHRzKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsCj4gICAgICAgICByZXR1cm4g
b2ZfaXJxX3BhcnNlX29uZShucCwgaW5kZXgsICZzdXBfYXJncykgPyBOVUxMIDogc3VwX2FyZ3Mu
bnA7Cj4gIH0KPgo+ICtzdGF0aWMgc3RydWN0IGRldmljZV9ub2RlICpwYXJzZV9pbnRlcnJ1cHRf
bWFwKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBjb25zdCBjaGFyICpwcm9wX25hbWUsIGludCBpbmRleCkKPiAr
ewo+ICsgICAgICAgc3RydWN0IGRldmljZV9ub2RlICp0biwgKmlwYXIsICpzdXBucCA9IE5VTEw7
Cj4gKyAgICAgICB1MzIgYWRkcmNlbGxzLCBpbnRjZWxscywgY2VsbHM7Cj4gKyAgICAgICBjb25z
dCBfX2JlMzIgKmltYXAsICppbWFwX2VuZDsKPiArICAgICAgIGludCBpLCBpbWFwbGVuOwo+ICsK
PiArICAgICAgIGlmICghSVNfRU5BQkxFRChDT05GSUdfT0ZfSVJRKSkKPiArICAgICAgICAgICAg
ICAgcmV0dXJuIE5VTEw7Cj4gKwo+ICsgICAgICAgaWYgKHN0cmNtcChwcm9wX25hbWUsICJpbnRl
cnJ1cHQtbWFwIikpCj4gKyAgICAgICAgICAgICAgIHJldHVybiBOVUxMOwo+ICsKPiArICAgICAg
IGlwYXIgPSBvZl9ub2RlX2dldChucCk7Cj4gKyAgICAgICBkbyB7Cj4gKyAgICAgICAgICAgICAg
IGlmICghb2ZfcHJvcGVydHlfcmVhZF91MzIoaXBhciwgIiNpbnRlcnJ1cHQtY2VsbHMiLCAmaW50
Y2VsbHMpKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ICsgICAgICAgICAgICAg
ICB0biA9IGlwYXI7Cj4gKyAgICAgICAgICAgICAgIGlwYXIgPSBvZl9pcnFfZmluZF9wYXJlbnQo
aXBhcik7Cj4gKyAgICAgICAgICAgICAgIG9mX25vZGVfcHV0KHRuKTsKPiArICAgICAgIH0gd2hp
bGUgKGlwYXIpOwo+ICsgICAgICAgaWYgKCFpcGFyKQo+ICsgICAgICAgICAgICAgICByZXR1cm4g
TlVMTDsKPiArICAgICAgIGFkZHJjZWxscyA9IG9mX2J1c19uX2FkZHJfY2VsbHMoaXBhcik7Cj4g
KyAgICAgICBvZl9ub2RlX3B1dChpcGFyKTsKPiArCj4gKyAgICAgICBpbWFwID0gb2ZfZ2V0X3By
b3BlcnR5KG5wLCAiaW50ZXJydXB0LW1hcCIsICZpbWFwbGVuKTsKPiArICAgICAgIGlmICghaW1h
cCB8fCBpbWFwbGVuIDw9IChhZGRyY2VsbHMgKyBpbnRjZWxscykpCj4gKyAgICAgICAgICAgICAg
IHJldHVybiBOVUxMOwo+ICsgICAgICAgaW1hcF9lbmQgPSBpbWFwICsgaW1hcGxlbjsKPiArCj4g
KyAgICAgICBmb3IgKGkgPSAwOyBpIDw9IGluZGV4ICYmIGltYXAgPCBpbWFwX2VuZDsgaSsrKSB7
Cj4gKyAgICAgICAgICAgICAgIGlmIChzdXBucCkKPiArICAgICAgICAgICAgICAgICAgICAgICBv
Zl9ub2RlX3B1dChzdXBucCk7Cj4gKwo+ICsgICAgICAgICAgICAgICBpbWFwICs9IGFkZHJjZWxs
czsKPiArICAgICAgICAgICAgICAgaW1hcCArPSBpbnRjZWxsczsKPiArCj4gKyAgICAgICAgICAg
ICAgIHN1cG5wID0gb2ZfZmluZF9ub2RlX2J5X3BoYW5kbGUoYmUzMl90b19jcHUoaW1hcFswXSkp
Owo+ICsgICAgICAgICAgICAgICBpZiAoIXN1cG5wKQo+ICsgICAgICAgICAgICAgICAgICAgICAg
IHJldHVybiBOVUxMOwo+ICsgICAgICAgICAgICAgICBpbWFwICs9IDE7Cj4gKwo+ICsgICAgICAg
ICAgICAgICBpZiAob2ZfcHJvcGVydHlfcmVhZF91MzIoc3VwbnAsICIjaW50ZXJydXB0LWNlbGxz
IiwgJmNlbGxzKSkKPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gTlVMTDsKPiArICAg
ICAgICAgICAgICAgaW1hcCArPSBjZWxsczsKClRoaXMgaXMgd3JvbmcuIFRlY2huaWNhbGx5LCB5
b3UgY2FuIGhhdmUgI2FkZHJlc3MtY2VsbHMgdG9vLgoKVGhlIGJpZ2dlciBwcm9ibGVtIEkgaGF2
ZSBpcyB0aGlzIGNyZWF0ZXMgMiBzZXRzIG9mICdpbnRlcnJ1cHQtbWFwJwpwYXJzaW5nIGNvZGUu
IFlvdXIgdmVyc2lvbiBza2lwcyBhIGxvdCBvZiB0aGluZ3MgbGlrZSB3aGV0aGVyIHRoZQppbnRl
cnJ1cHQgY29udHJvbGxlciBpcyBhdmFpbGFibGUgYW5kIHRoZXJlJ3MgdGhlIGxpc3Qgb2YKJ2lu
dGVycnVwdC1tYXAnIGFidXNlcnMgdG8gdGhpbmsgYWJvdXQuCgpSb2IKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
