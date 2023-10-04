Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B1FBE7C4EC
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 18:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ymRjK9jx6eNTErrflmzM+eXAFULUcCXmXVMEMWq4MQI=; b=M82p1Q7f4mB2mN
	Nzg3Dyz7EWbrSSzAEZqpGBFn7yUBJvf3oP77y4CIQtWoEPQ7vTqaAOWVb6Sfa6BxBbuhwWUfUL1rw
	weQ8Mtu0kEFcb2UiPNOkdxijIWk+lA0yBQJwDaAID0X4orkF5/KDpBqbs9dwt+GxQlfPPEGlbs2mA
	IQDfB45or0TJ/FzqTDSnAmYey9cHwbO0Oo0zEY5cJ6kVg9g9RNLCf5HXENzruOWiWeq87rBK5Pjdp
	ZwnbfJ+3VxT8zN8uQt5+l90QgqqfOBmnYiPZ/DEwhLOhIdahonsuZ3IB6VMeaioViRJY0WGLv+W52
	/O/hgclGfgnqhiCQkPtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo6we-000jI2-1o;
	Wed, 04 Oct 2023 18:50:04 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo6wb-000jGt-1R
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 18:50:03 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-65d5a6230fcso593846d6.0
        for <linux-riscv@lists.infradead.org>; Wed, 04 Oct 2023 11:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1696445399; x=1697050199; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aLxg9fH8T1y0yGnPhHcUGUL8dVs76BY9tqGI34u50Bs=;
        b=dSRJKtyTGyPN0yrKufDv7lI9Kv48K6d1nWTMGNm9tEJ4lFqvuGAknq+udpoKwIWvGB
         ASWoI5XynBmjvIWrn4SH3yZUWWoFAvks8Cev7VG80Aq16MnNgmo8RNYnFZbRiLU21E9H
         RV7aOc6FEn+CuoBxzf+uXhIk6SJdVNnal55OAEX9NxETydKucu8ymyKHNbLEB4sp+d7S
         KP2s5t4gve/AW852YcHor1jOpgsYqaPXbC+5+E0ePJAO5ZVaeEezYGcGRjF32O+t+1x9
         7DvawgBl31ZS6VUPeYy6DmGt/lGQYkrMu6yfXCpX1TZC40Lzvjop0705PzRgaL079gV2
         u6tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696445399; x=1697050199;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aLxg9fH8T1y0yGnPhHcUGUL8dVs76BY9tqGI34u50Bs=;
        b=t+0grXR7nGVOztxD7XSzgn8h4mxU0T5RpeiDAcWmqOd7lzibEt4H5s0rYgBkkZyf4n
         k+ftYaas8Ix2MYLIlhMDQCfV0Zb604UNglkmS0C7T8ctMPaH38m17IkyVrE9VM0URq9x
         EuemXLRQIfcC0HJg4PPGp6GWlT8YB072jWJO3QrmxsNPz5GCXk+KXk1F7e8ldQ9Kdqvm
         YyoVn78mX6ORGzhhDE2+vhFw0Zh0UVwjELW9Ywx6g4LEj5TNtTF+dAMGS0/vJrmfNML5
         hb14cMKPur5vyYHjC40JCw5+yWoxln6EI/5dTKAxqLd1vU0hGTEUV++tu80g+hhYQah+
         EKQg==
X-Gm-Message-State: AOJu0YxwBDUNZGspy4oFvdI7yNvEXcksWZ0JmpNIkI3sF78iq1HGUeq9
	/JhluaCLfkkecgg11JejVoGZCA==
X-Google-Smtp-Source: AGHT+IENGPIAeevR+++9VNUaDLPyKIYbr+kdZo6T203e5mzPMqSIxUqcJDFLq+tp33c+F3IchycJlQ==
X-Received: by 2002:a0c:e54f:0:b0:64a:92e9:10e4 with SMTP id n15-20020a0ce54f000000b0064a92e910e4mr2602325qvm.63.1696445399373;
        Wed, 04 Oct 2023 11:49:59 -0700 (PDT)
Received: from ?IPV6:2600:1700:2000:b002:1d3e:176c:909c:5aed? ([2600:1700:2000:b002:1d3e:176c:909c:5aed])
        by smtp.gmail.com with ESMTPSA id x1-20020a0ce241000000b0065d89f4d537sm1516928qvl.45.2023.10.04.11.49.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Oct 2023 11:49:58 -0700 (PDT)
Message-ID: <20075b03-e3b0-4f29-9ba1-98eed361a44f@sifive.com>
Date: Wed, 4 Oct 2023 13:49:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] RISC-V: Add eMMC support for TH1520 boards
Content-Language: en-US
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Jisheng Zhang <jszhang@kernel.org>,
 Drew Fustini <dfustini@baylibre.com>, linux-kernel@vger.kernel.org,
 Linux-MM <linux-mm@kvack.org>, Guo Ren <guoren@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>,
 Arnd Bergmann <arnd@arndb.de>, Han Gao <gaohan@iscas.ac.cn>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Jason Kridner <jkridner@beagleboard.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Robert Nelson <robertcnelson@gmail.com>, linux-mmc@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>, Conor Dooley <conor@kernel.org>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Xi Ruoyao <xry111@xry111.site>, Fu Wei <wefu@redhat.com>
References: <20230921-th1520-mmc-v1-0-49f76c274fb3@baylibre.com>
 <CAOCHtYhnx1EpBM+o3xhdsicx5uqLidojK3f0HQ+VfyVv1ZXnVQ@mail.gmail.com>
 <CAOCHtYi5Ab5ppCmaQV3QuKQcpmJX+sHdAmtuEXhfq8xf5fFCYQ@mail.gmail.com>
 <ZRuamJuShOnvP1pr@x1> <ZR1M3FcdXrDmIGu2@xhacker>
 <CA+V-a8ugwqkQxnX-wwWCHVtBBtG=aVv=MZTc53LbpxtFA=N1_A@mail.gmail.com>
 <bc2b0b30-ab37-f336-c90e-eab570d393a2@arm.com>
 <c2ea3f34bb919293b850fab6ed42b61e3517ba35.camel@icenowy.me>
 <a568a9dd-bab2-1e23-c4d5-9f6475bdcc3b@arm.com>
 <CA+V-a8s1S4yTH19PVNSznAgUFoHRNoye9CfwjW6iy6PbQ9thew@mail.gmail.com>
 <CA+V-a8vbWW6=HTfR+FCPOB0bAa8M3Bbm_k=7+XbjOc3ybo6VNQ@mail.gmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <CA+V-a8vbWW6=HTfR+FCPOB0bAa8M3Bbm_k=7+XbjOc3ybo6VNQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_115001_505071_F769AC08 
X-CRM114-Status: GOOD (  30.20  )
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

T24gMjAyMy0xMC0wNCAxMjoxNiBQTSwgTGFkLCBQcmFiaGFrYXIgd3JvdGU6Cj4gT24gV2VkLCBP
Y3QgNCwgMjAyMyBhdCA1OjAz4oCvUE0gTGFkLCBQcmFiaGFrYXIKPiA8cHJhYmhha2FyLmNzZW5n
Z0BnbWFpbC5jb20+IHdyb3RlOgo+Pgo+PiBPbiBXZWQsIE9jdCA0LCAyMDIzIGF0IDM6MTjigK9Q
TSBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBoeUBhcm0uY29tPiB3cm90ZToKPj4+Cj4+PiBPbiAw
NC8xMC8yMDIzIDM6MDIgcG0sIEljZW5vd3kgWmhlbmcgd3JvdGU6Cj4+PiBbLi4uXQo+Pj4+Pj4+
IEkgYmVsaWV2ZSBjb21taXQgNDg0ODYxZTA5ZjNlICgic29jOiByZW5lc2FzOiBLY29uZmlnOiBT
ZWxlY3QgdGhlCj4+Pj4+Pj4gcmVxdWlyZWQgY29uZmlncyBmb3IgUlovRml2ZSBTb0MiKSBjYW4g
Y2F1c2UgcmVncmVzc2lvbiBvbiBhbGwKPj4+Pj4+PiBub24tZG1hLWNvaGVyZW50IHJpc2N2IHBs
YXRmb3JtcyB3aXRoIGdlbmVyaWMgZGVmY29uZmlnLiBUaGlzIGlzCj4+Pj4+Pj4gYSBjb21tb24g
aXNzdWUuIFRoZSBsb2dpYyBoZXJlIGlzOiBnZW5lcmljIHJpc2N2IGRlZmNvbmZpZwo+Pj4+Pj4+
IHNlbGVjdHMKPj4+Pj4+PiBBUkNIX1I5QTA3RzA0MyB3aGljaCBzZWxlY3RzIERNQV9HTE9CQUxf
UE9PTCwgd2hpY2ggYXNzdW1lcyBhbGwKPj4+Pj4+PiBub24tZG1hLWNvaGVyZW50IHJpc2N2IHBs
YXRmb3JtcyBoYXZlIGEgZG1hIGdsb2JhbCBwb29sLCB0aGlzCj4+Pj4+Pj4gYXNzdW1wdGlvbgo+
Pj4+Pj4+IHNlZW1zIG5vdCBjb3JyZWN0LiBBbmQgSSBiZWxpZXZlIERNQV9HTE9CQUxfUE9PTCBz
aG91bGQgbm90IGJlCj4+Pj4+Pj4gc2VsZWN0ZWQgYnkgQVJDSF9TT0NGQU1JTElZLCBpbnN0ZWFk
LCBvbmx5IEFSQ0ggdW5kZXIgc29tZQo+Pj4+Pj4+IHNwZWNpZmljCj4+Pj4+Pj4gY29uZGl0aW9u
cyBjYW4gc2VsZWN0IGl0IGdsb2JhbHksIGZvciBleGFtcGxlIE5PTU1VIEFSTSBhbmQgc28KPj4+
Pj4+PiBvbi4KPj4+Pj4+Pgo+Pj4+Pj4+IFNpbmNlIHRoaXMgaXMgYSByZWdyZXNzaW9uLCB3aGF0
J3MgcHJvcGVyIGZpeD8gYW55IHN1Z2dlc3Rpb24gaXMKPj4+Pj4+PiBhcHByZWNpYXRlZC4KPj4+
Pj4KPj4+Pj4gSSB0aGluayB0aGUgYW5zd2VyIGlzIHRvIG5vdCBzZWxlY3QgRE1BX0dMT0JBTF9Q
T09MLCBzaW5jZSB0aGF0IGlzCj4+Pj4+IG9ubHkKPj4+Pgo+Pj4+IFdlbGwgSSB0aGluayBmb3Ig
UklTQy1WLCBpdCdzIG5vdCBOT01NVSBvbmx5IGJ1dCBhcHBsaWNhYmxlIGZvciBldmVyeQo+Pj4+
IGNvcmUgdGhhdCBkb2VzIG5vdCBzdXBwb3J0IFN2cGJtdCBvciB2ZW5kb3Itc3BlY2lmaWMgYWx0
ZXJuYXRpdmVzLAo+Pj4+IGJlY2F1c2UgdGhlIG9yaWdpbmFsIFJJU0MtViBwcml2IHNwZWMgZG9l
cyBub3QgZGVmaW5lIG1lbW9yeSBhdHRyaWJ1dGVzCj4+Pj4gaW4gcGFnZSB0YWJsZSBlbnRyaWVz
Lgo+Pj4+Cj4+Pj4gRm9yIHRoZSBSZW5lc2FzL0FuZGVzIGNhc2UgSSB0aGluayBhIHBvb2wgaXMg
c2V0IGJ5IE9wZW5TQkkgd2l0aAo+Pj4+IHZlbmRvci1zcGVjaWZpYyBNLW1vZGUgZmFjaWxpdHkg
YW5kIHRoZW4gcGFzc2VkIGluIERULCBhbmQgdGhlIFMtbW9kZQo+Pj4+ICh3aGljaCBNTVUgaXMg
ZW5hYmxlZCBpbikganVzdCBzZWVzIGZpeGVkIG1lbW9yeSBhdHRyaWJ1dGVzLCBpbiB0aGlzCj4+
Pj4gY2FzZSBJIHRoaW5rIERNQV9HTE9CQUxfUE9PTCBpcyBuZWVkZWQuCj4+Pgo+Pj4gT2ggd293
LCBpcyB0aGF0IHJlYWxseSBhIHRoaW5nPyBJbiB0aGF0IGNhc2UsIGVpdGhlciB5b3UganVzdCBj
YW4ndAo+Pj4gc3VwcG9ydCB0aGlzIHBsYXRmb3JtIGluIGEgbXVsdGktcGxhdGZvcm0ga2VybmVs
LCBvciBzb21lb25lIG5lZWRzIHRvIGRvCj4+PiBzb21lIGZpZGRseSB3b3JrIGluIGRtYS1kaXJl
Y3QgdG8gYSkgaW50cm9kdWNlIHRoZSBub3Rpb24gb2YgYW4gb3B0aW9uYWwKPj4+IGdsb2JhbCBw
b29sLAo+PiBMb29raW5nIGF0IHRoZSBjb2RlIFswXSB3ZSBkbyBoYXZlIGNvbXBpbGUgdGltZSBj
aGVjayBmb3IKPj4gQ09ORklHX0RNQV9HTE9CQUxfUE9PTCBpcnJlc3BlY3RpdmUgb2YgdGhpcyBi
ZWluZyBwcmVzZW50IGluIERUIG9yCj4+IG5vdCwgaW5zdGVhZCBpZiB3ZSBtYWtlIGl0IGNvbXBp
bGUgdGltZSBhbmQgcnVudGltZSBjaGVjayBpZSBlaXRoZXIKPj4gY2hlY2sgZm9yIERUIG5vZGUg
b3Igc2VlIGlmIHBvb2wgaXMgYXZhaWxhYmxlIGFuZCBvbmx5IHRoZW4gcHJvY2VlZAo+PiBmb3Ig
YWxsb2NhdGlvbiBmb3JtIHRoaXMgcG9vbC4KPj4KPj4gV2hhdCBhcmUgeW91ciB0aG91Z2h0cyBv
biB0aGlzPwo+Pgo+IFNvbWV0aGluZyBsaWtlIHRoZSBiZWxvdzoKPiAKPiBkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9saW51eC9kbWEtbWFwLW9wcy5oIGIvaW5jbHVkZS9saW51eC9kbWEtbWFwLW9wcy5o
Cj4gaW5kZXggZjJmYzIwM2ZiOGExLi43YmY0MWE0NjM0YTQgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVk
ZS9saW51eC9kbWEtbWFwLW9wcy5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9kbWEtbWFwLW9wcy5o
Cj4gQEAgLTE5OCw2ICsxOTgsNyBAQCBpbnQgZG1hX3JlbGVhc2VfZnJvbV9nbG9iYWxfY29oZXJl
bnQoaW50IG9yZGVyLAo+IHZvaWQgKnZhZGRyKTsKPiAgaW50IGRtYV9tbWFwX2Zyb21fZ2xvYmFs
X2NvaGVyZW50KHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCB2b2lkICpjcHVfYWRkciwKPiAg
ICAgICAgICAgICAgICAgc2l6ZV90IHNpemUsIGludCAqcmV0KTsKPiAgaW50IGRtYV9pbml0X2ds
b2JhbF9jb2hlcmVudChwaHlzX2FkZHJfdCBwaHlzX2FkZHIsIHNpemVfdCBzaXplKTsKPiArYm9v
bCBkbWFfZ2xvYmFsX3Bvb2xfYXZhaWxhYmxlKHZvaWQpOwo+ICAjZWxzZQo+ICBzdGF0aWMgaW5s
aW5lIHZvaWQgKmRtYV9hbGxvY19mcm9tX2dsb2JhbF9jb2hlcmVudChzdHJ1Y3QgZGV2aWNlICpk
ZXYsCj4gICAgICAgICAgICAgICAgIHNzaXplX3Qgc2l6ZSwgZG1hX2FkZHJfdCAqZG1hX2hhbmRs
ZSkKPiBAQCAtMjEzLDYgKzIxNCwxMCBAQCBzdGF0aWMgaW5saW5lIGludAo+IGRtYV9tbWFwX2Zy
b21fZ2xvYmFsX2NvaGVyZW50KHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLAo+ICB7Cj4gICAg
ICAgICByZXR1cm4gMDsKPiAgfQo+ICtzdGF0aWMgaW5saW5lIGJvb2wgZG1hX2dsb2JhbF9wb29s
X2F2YWlsYWJsZSh2b2lkKQo+ICt7Cj4gKyAgICAgICByZXR1cm4gZmFsc2U7Cj4gK30KPiAgI2Vu
ZGlmIC8qIENPTkZJR19ETUFfR0xPQkFMX1BPT0wgKi8KPiAKPiAgLyoKPiBkaWZmIC0tZ2l0IGEv
a2VybmVsL2RtYS9jb2hlcmVudC5jIGIva2VybmVsL2RtYS9jb2hlcmVudC5jCj4gaW5kZXggYzIx
YWJjNzdjNTNlLi42MDVmMjQzYjgyNjIgMTAwNjQ0Cj4gLS0tIGEva2VybmVsL2RtYS9jb2hlcmVu
dC5jCj4gKysrIGIva2VybmVsL2RtYS9jb2hlcmVudC5jCj4gQEAgLTI3Nyw2ICsyNzcsMTQgQEAg
aW50IGRtYV9tbWFwX2Zyb21fZGV2X2NvaGVyZW50KHN0cnVjdCBkZXZpY2UKPiAqZGV2LCBzdHJ1
Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKPiAgI2lmZGVmIENPTkZJR19ETUFfR0xPQkFMX1BPT0wK
PiAgc3RhdGljIHN0cnVjdCBkbWFfY29oZXJlbnRfbWVtICpkbWFfY29oZXJlbnRfZGVmYXVsdF9t
ZW1vcnkgX19yb19hZnRlcl9pbml0Owo+IAo+ICtib29sIGRtYV9nbG9iYWxfcG9vbF9hdmFpbGFi
bGUodm9pZCkKPiArewo+ICsgICAgICAgaWYgKCFkbWFfY29oZXJlbnRfZGVmYXVsdF9tZW1vcnkp
Cj4gKyAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiArCj4gKyAgICAgICByZXR1cm4gdHJ1
ZTsKPiArfQo+ICsKPiAgdm9pZCAqZG1hX2FsbG9jX2Zyb21fZ2xvYmFsX2NvaGVyZW50KHN0cnVj
dCBkZXZpY2UgKmRldiwgc3NpemVfdCBzaXplLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBkbWFfYWRkcl90ICpkbWFfaGFuZGxlKQo+ICB7Cj4gZGlmZiAtLWdpdCBhL2tl
cm5lbC9kbWEvZGlyZWN0LmMgYi9rZXJuZWwvZG1hL2RpcmVjdC5jCj4gaW5kZXggOTU5NmFlMWFh
MGRhLi5hNTk5YmI3MzFjZWIgMTAwNjQ0Cj4gLS0tIGEva2VybmVsL2RtYS9kaXJlY3QuYwo+ICsr
KyBiL2tlcm5lbC9kbWEvZGlyZWN0LmMKPiBAQCAtMjM1LDcgKzIzNSw3IEBAIHZvaWQgKmRtYV9k
aXJlY3RfYWxsb2Moc3RydWN0IGRldmljZSAqZGV2LCBzaXplX3Qgc2l6ZSwKPiAgICAgICAgICAg
ICAgICAgICogSWYgdGhlcmUgaXMgYSBnbG9iYWwgcG9vbCwgYWx3YXlzIGFsbG9jYXRlIGZyb20g
aXQgZm9yCj4gICAgICAgICAgICAgICAgICAqIG5vbi1jb2hlcmVudCBkZXZpY2VzLgo+ICAgICAg
ICAgICAgICAgICAgKi8KPiAtICAgICAgICAgICAgICAgaWYgKElTX0VOQUJMRUQoQ09ORklHX0RN
QV9HTE9CQUxfUE9PTCkpCj4gKyAgICAgICAgICAgICAgIGlmIChJU19FTkFCTEVEKENPTkZJR19E
TUFfR0xPQkFMX1BPT0wpICYmCj4gZG1hX2dsb2JhbF9wb29sX2F2YWlsYWJsZSgpKQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgIHJldHVybiBkbWFfYWxsb2NfZnJvbV9nbG9iYWxfY29oZXJlbnQo
ZGV2LCBzaXplLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkbWFf
aGFuZGxlKTsKCmRtYV9hbGxvY19mcm9tX2dsb2JhbF9jb2hlcmVudCgpIGFscmVhZHkgY2hlY2tz
IGRtYV9jb2hlcmVudF9kZWZhdWx0X21lbW9yeSwgc28KdGhlIHNvbHV0aW9uIGNvdWxkIGJlIGV2
ZW4gc2ltcGxlcjoKCi0tLSBhL2tlcm5lbC9kbWEvZGlyZWN0LmMKKysrIGIva2VybmVsL2RtYS9k
aXJlY3QuYwpAQCAtMjMyLDEyICsyMzIsMTIgQEAgdm9pZCAqZG1hX2RpcmVjdF9hbGxvYyhzdHJ1
Y3QgZGV2aWNlICpkZXYsIHNpemVfdCBzaXplLAogCQkJCQkgICAgICBhdHRycyk7CgogCQkvKgot
CQkgKiBJZiB0aGVyZSBpcyBhIGdsb2JhbCBwb29sLCBhbHdheXMgYWxsb2NhdGUgZnJvbSBpdCBm
b3IKKwkJICogSWYgdGhlcmUgaXMgYSBnbG9iYWwgcG9vbCwgYWx3YXlzIHRyeSB0byBhbGxvY2F0
ZSBmcm9tIGl0IGZvcgogCQkgKiBub24tY29oZXJlbnQgZGV2aWNlcy4KIAkJICovCi0JCWlmIChJ
U19FTkFCTEVEKENPTkZJR19ETUFfR0xPQkFMX1BPT0wpKQotCQkJcmV0dXJuIGRtYV9hbGxvY19m
cm9tX2dsb2JhbF9jb2hlcmVudChkZXYsIHNpemUsCi0JCQkJCWRtYV9oYW5kbGUpOworCQlyZXQg
PSBkbWFfYWxsb2NfZnJvbV9nbG9iYWxfY29oZXJlbnQoZGV2LCBzaXplLCBkbWFfaGFuZGxlKTsK
KwkJaWYgKHJldCkKKwkJCXJldHVybiByZXQ7CgogCQkvKgogCQkgKiBPdGhlcndpc2UgcmVtYXAg
aWYgdGhlIGFyY2hpdGVjdHVyZSBpcyBhc2tpbmcgZm9yIGl0LiAgQnV0CgpSZWdhcmRzLApTYW11
ZWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
