Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1CFAE936E4
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 20:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u/6ESRASCyBa/Z7mrmMzC7MaApXwQQrAj+ytzMw9uBQ=; b=OUxme7yagirXpt
	BODgm4W2Qe8VLamEAWBbFSqwMuixfqi7RIF7WgNalxnnlbCy6xSKVq5ebbI56AytFFR0NjY8vPdOE
	WNrJnFwauA6xUuDP4VCl2hvWmW6dJVaCeIsnedI+mzbeao6xbCDfRMrLGalSDB4nUJQc1TAiqe1Nr
	niaRG7H7EqYnwzyYIV3akbR5trSZTCUL7jhqdBzsuCTahu8R2M0IogkVaU3Gf25gSz4C7dSOJanKo
	6R8B6tjLQVmZN78Xm7+UZzFrkIn3TakfilLRqo1FZcaQeEfuoRE6WMDAURbIE9UqOH41fucgkuvy5
	45TpSp3M7wzeiVSDkYWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo8mr-000tEM-19;
	Wed, 04 Oct 2023 20:48:05 +0000
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo8mo-000tDP-0w
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 20:48:04 +0000
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-49d45964fcaso916739e0c.1
        for <linux-riscv@lists.infradead.org>; Wed, 04 Oct 2023 13:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696452480; x=1697057280; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HfMc2o3aeaMtgo1tIGkp8mKMdGYs27vkJXRJNkCUQ0A=;
        b=UyBp+RoUXtL7G8rfSdExHwHHgf2gNVkmLkTkmThbp4sa/l5OjI2JLTlNqmQwC4BXLz
         9JPiRNIEC0EKJUxKumc5I/svSZ2b4k3+0P9qgfe7saN/u3IU06y1H8/n4LjM5UJ27fOc
         4Z63Kaybm2h/sEnHFQYIn8upZNicSJD2nq6N16p5UeVHYU1MIqznrk6Y92mVlZI9sRJ2
         M0Zdi82po9u2Dc+19WlGT6OGkwFrnjpY397kbnRmEn+61r56TBfZziiIO+IyMA2L7qkc
         /llFEdSPXcj779Kh2Rmm1IwpctVmgJRDNq5yVciQGMT6UUttCg5+Td16898XTNYu9PYD
         Qjyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696452480; x=1697057280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HfMc2o3aeaMtgo1tIGkp8mKMdGYs27vkJXRJNkCUQ0A=;
        b=DUQsrM71/HnP8+y9dYk8Laf6lxMVHrujVUdMLeDhemU3Hfy5JeO0YZEjVhgMHCfNIl
         2ejWc2Kh7lT6R2Th2RBpCAlknb/4M7vlKDwm18Vrcjk/SA0iarIs/bRi7NH7o5KaMd/2
         +LbvYEBsDRB2C3RhrxtOnHygbZqL4ThsHhurG8AEBJsUqmtn4QhkNfYeR4FCxL+1lAdw
         FDJWUSM9akHqQhKDLYKmxSDc2h3w106tVfIdXsU9VJCGXdgphHJiUDA4z+G4Y6sxASpS
         T9vnD8A19euS7XZ8fLcjTgUoioYszixolgBnFXN4XeHQuNPTz1E79zeQggoCLeoRD81S
         3B7A==
X-Gm-Message-State: AOJu0YxhbxnXHg2iyjsXt0g7cIgPOS+xeeMRZ54LMPXRJHmNFxFps+pl
	cdEJJUyg1Zq7OBgrXFEUXHQRgzn9/eV2mOuVRtg=
X-Google-Smtp-Source: AGHT+IGz+I4KR7M4OtZmQSMxVqj0EW9sFvCy2VD93W9/vEp7JtwUuQn+RAVp3yVHNE7MpbzIb/Ew4ddKR/ZMgWxfe9A=
X-Received: by 2002:a05:6122:178a:b0:495:f495:bab1 with SMTP id
 o10-20020a056122178a00b00495f495bab1mr442731vkf.0.1696452478361; Wed, 04 Oct
 2023 13:47:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230921-th1520-mmc-v1-0-49f76c274fb3@baylibre.com>
 <CAOCHtYhnx1EpBM+o3xhdsicx5uqLidojK3f0HQ+VfyVv1ZXnVQ@mail.gmail.com>
 <CAOCHtYi5Ab5ppCmaQV3QuKQcpmJX+sHdAmtuEXhfq8xf5fFCYQ@mail.gmail.com>
 <ZRuamJuShOnvP1pr@x1> <ZR1M3FcdXrDmIGu2@xhacker> <CA+V-a8ugwqkQxnX-wwWCHVtBBtG=aVv=MZTc53LbpxtFA=N1_A@mail.gmail.com>
 <bc2b0b30-ab37-f336-c90e-eab570d393a2@arm.com> <c2ea3f34bb919293b850fab6ed42b61e3517ba35.camel@icenowy.me>
 <a568a9dd-bab2-1e23-c4d5-9f6475bdcc3b@arm.com> <CA+V-a8s1S4yTH19PVNSznAgUFoHRNoye9CfwjW6iy6PbQ9thew@mail.gmail.com>
 <CA+V-a8vbWW6=HTfR+FCPOB0bAa8M3Bbm_k=7+XbjOc3ybo6VNQ@mail.gmail.com>
 <20075b03-e3b0-4f29-9ba1-98eed361a44f@sifive.com> <498ffcef-2ff9-495b-8544-b87c5c2eb6e1@arm.com>
In-Reply-To: <498ffcef-2ff9-495b-8544-b87c5c2eb6e1@arm.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 4 Oct 2023 21:47:03 +0100
Message-ID: <CA+V-a8u3+k3c6RQsmSVH+iQkFo3s_iwAZS_OFBvGpxzx_i_Ftw@mail.gmail.com>
Subject: Re: [PATCH 0/6] RISC-V: Add eMMC support for TH1520 boards
To: Robin Murphy <robin.murphy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_134802_350811_80600CFB 
X-CRM114-Status: GOOD (  44.78  )
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Jisheng Zhang <jszhang@kernel.org>, Drew Fustini <dfustini@baylibre.com>, Adrian Hunter <adrian.hunter@intel.com>, Linux-MM <linux-mm@kvack.org>, Guo Ren <guoren@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>, Geert Uytterhoeven <geert+renesas@glider.be>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, Arnd Bergmann <arnd@arndb.de>, Han Gao <gaohan@iscas.ac.cn>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Jason Kridner <jkridner@beagleboard.org>, Paul Walmsley <paul.walmsley@sifive.com>, Robert Nelson <robertcnelson@gmail.com>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Xi Ruoyao <xry111@xry111.site>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBPY3QgNCwgMjAyMyBhdCA4OjM44oCvUE0gUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJw
aHlAYXJtLmNvbT4gd3JvdGU6Cj4KPiBPbiAyMDIzLTEwLTA0IDE5OjQ5LCBTYW11ZWwgSG9sbGFu
ZCB3cm90ZToKPiA+IE9uIDIwMjMtMTAtMDQgMTI6MTYgUE0sIExhZCwgUHJhYmhha2FyIHdyb3Rl
Ogo+ID4+IE9uIFdlZCwgT2N0IDQsIDIwMjMgYXQgNTowM+KAr1BNIExhZCwgUHJhYmhha2FyCj4g
Pj4gPHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPiB3cm90ZToKPiA+Pj4KPiA+Pj4gT24gV2Vk
LCBPY3QgNCwgMjAyMyBhdCAzOjE44oCvUE0gUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJt
LmNvbT4gd3JvdGU6Cj4gPj4+Pgo+ID4+Pj4gT24gMDQvMTAvMjAyMyAzOjAyIHBtLCBJY2Vub3d5
IFpoZW5nIHdyb3RlOgo+ID4+Pj4gWy4uLl0KPiA+Pj4+Pj4+PiBJIGJlbGlldmUgY29tbWl0IDQ4
NDg2MWUwOWYzZSAoInNvYzogcmVuZXNhczogS2NvbmZpZzogU2VsZWN0IHRoZQo+ID4+Pj4+Pj4+
IHJlcXVpcmVkIGNvbmZpZ3MgZm9yIFJaL0ZpdmUgU29DIikgY2FuIGNhdXNlIHJlZ3Jlc3Npb24g
b24gYWxsCj4gPj4+Pj4+Pj4gbm9uLWRtYS1jb2hlcmVudCByaXNjdiBwbGF0Zm9ybXMgd2l0aCBn
ZW5lcmljIGRlZmNvbmZpZy4gVGhpcyBpcwo+ID4+Pj4+Pj4+IGEgY29tbW9uIGlzc3VlLiBUaGUg
bG9naWMgaGVyZSBpczogZ2VuZXJpYyByaXNjdiBkZWZjb25maWcKPiA+Pj4+Pj4+PiBzZWxlY3Rz
Cj4gPj4+Pj4+Pj4gQVJDSF9SOUEwN0cwNDMgd2hpY2ggc2VsZWN0cyBETUFfR0xPQkFMX1BPT0ws
IHdoaWNoIGFzc3VtZXMgYWxsCj4gPj4+Pj4+Pj4gbm9uLWRtYS1jb2hlcmVudCByaXNjdiBwbGF0
Zm9ybXMgaGF2ZSBhIGRtYSBnbG9iYWwgcG9vbCwgdGhpcwo+ID4+Pj4+Pj4+IGFzc3VtcHRpb24K
PiA+Pj4+Pj4+PiBzZWVtcyBub3QgY29ycmVjdC4gQW5kIEkgYmVsaWV2ZSBETUFfR0xPQkFMX1BP
T0wgc2hvdWxkIG5vdCBiZQo+ID4+Pj4+Pj4+IHNlbGVjdGVkIGJ5IEFSQ0hfU09DRkFNSUxJWSwg
aW5zdGVhZCwgb25seSBBUkNIIHVuZGVyIHNvbWUKPiA+Pj4+Pj4+PiBzcGVjaWZpYwo+ID4+Pj4+
Pj4+IGNvbmRpdGlvbnMgY2FuIHNlbGVjdCBpdCBnbG9iYWx5LCBmb3IgZXhhbXBsZSBOT01NVSBB
Uk0gYW5kIHNvCj4gPj4+Pj4+Pj4gb24uCj4gPj4+Pj4+Pj4KPiA+Pj4+Pj4+PiBTaW5jZSB0aGlz
IGlzIGEgcmVncmVzc2lvbiwgd2hhdCdzIHByb3BlciBmaXg/IGFueSBzdWdnZXN0aW9uIGlzCj4g
Pj4+Pj4+Pj4gYXBwcmVjaWF0ZWQuCj4gPj4+Pj4+Cj4gPj4+Pj4+IEkgdGhpbmsgdGhlIGFuc3dl
ciBpcyB0byBub3Qgc2VsZWN0IERNQV9HTE9CQUxfUE9PTCwgc2luY2UgdGhhdCBpcwo+ID4+Pj4+
PiBvbmx5Cj4gPj4+Pj4KPiA+Pj4+PiBXZWxsIEkgdGhpbmsgZm9yIFJJU0MtViwgaXQncyBub3Qg
Tk9NTVUgb25seSBidXQgYXBwbGljYWJsZSBmb3IgZXZlcnkKPiA+Pj4+PiBjb3JlIHRoYXQgZG9l
cyBub3Qgc3VwcG9ydCBTdnBibXQgb3IgdmVuZG9yLXNwZWNpZmljIGFsdGVybmF0aXZlcywKPiA+
Pj4+PiBiZWNhdXNlIHRoZSBvcmlnaW5hbCBSSVNDLVYgcHJpdiBzcGVjIGRvZXMgbm90IGRlZmlu
ZSBtZW1vcnkgYXR0cmlidXRlcwo+ID4+Pj4+IGluIHBhZ2UgdGFibGUgZW50cmllcy4KPiA+Pj4+
Pgo+ID4+Pj4+IEZvciB0aGUgUmVuZXNhcy9BbmRlcyBjYXNlIEkgdGhpbmsgYSBwb29sIGlzIHNl
dCBieSBPcGVuU0JJIHdpdGgKPiA+Pj4+PiB2ZW5kb3Itc3BlY2lmaWMgTS1tb2RlIGZhY2lsaXR5
IGFuZCB0aGVuIHBhc3NlZCBpbiBEVCwgYW5kIHRoZSBTLW1vZGUKPiA+Pj4+PiAod2hpY2ggTU1V
IGlzIGVuYWJsZWQgaW4pIGp1c3Qgc2VlcyBmaXhlZCBtZW1vcnkgYXR0cmlidXRlcywgaW4gdGhp
cwo+ID4+Pj4+IGNhc2UgSSB0aGluayBETUFfR0xPQkFMX1BPT0wgaXMgbmVlZGVkLgo+ID4+Pj4K
PiA+Pj4+IE9oIHdvdywgaXMgdGhhdCByZWFsbHkgYSB0aGluZz8gSW4gdGhhdCBjYXNlLCBlaXRo
ZXIgeW91IGp1c3QgY2FuJ3QKPiA+Pj4+IHN1cHBvcnQgdGhpcyBwbGF0Zm9ybSBpbiBhIG11bHRp
LXBsYXRmb3JtIGtlcm5lbCwgb3Igc29tZW9uZSBuZWVkcyB0byBkbwo+ID4+Pj4gc29tZSBmaWRk
bHkgd29yayBpbiBkbWEtZGlyZWN0IHRvIGEpIGludHJvZHVjZSB0aGUgbm90aW9uIG9mIGFuIG9w
dGlvbmFsCj4gPj4+PiBnbG9iYWwgcG9vbCwKPiA+Pj4gTG9va2luZyBhdCB0aGUgY29kZSBbMF0g
d2UgZG8gaGF2ZSBjb21waWxlIHRpbWUgY2hlY2sgZm9yCj4gPj4+IENPTkZJR19ETUFfR0xPQkFM
X1BPT0wgaXJyZXNwZWN0aXZlIG9mIHRoaXMgYmVpbmcgcHJlc2VudCBpbiBEVCBvcgo+ID4+PiBu
b3QsIGluc3RlYWQgaWYgd2UgbWFrZSBpdCBjb21waWxlIHRpbWUgYW5kIHJ1bnRpbWUgY2hlY2sg
aWUgZWl0aGVyCj4gPj4+IGNoZWNrIGZvciBEVCBub2RlIG9yIHNlZSBpZiBwb29sIGlzIGF2YWls
YWJsZSBhbmQgb25seSB0aGVuIHByb2NlZWQKPiA+Pj4gZm9yIGFsbG9jYXRpb24gZm9ybSB0aGlz
IHBvb2wuCj4gPj4+Cj4gPj4+IFdoYXQgYXJlIHlvdXIgdGhvdWdodHMgb24gdGhpcz8KPiA+Pj4K
PiA+PiBTb21ldGhpbmcgbGlrZSB0aGUgYmVsb3c6Cj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9saW51eC9kbWEtbWFwLW9wcy5oIGIvaW5jbHVkZS9saW51eC9kbWEtbWFwLW9wcy5oCj4g
Pj4gaW5kZXggZjJmYzIwM2ZiOGExLi43YmY0MWE0NjM0YTQgMTAwNjQ0Cj4gPj4gLS0tIGEvaW5j
bHVkZS9saW51eC9kbWEtbWFwLW9wcy5oCj4gPj4gKysrIGIvaW5jbHVkZS9saW51eC9kbWEtbWFw
LW9wcy5oCj4gPj4gQEAgLTE5OCw2ICsxOTgsNyBAQCBpbnQgZG1hX3JlbGVhc2VfZnJvbV9nbG9i
YWxfY29oZXJlbnQoaW50IG9yZGVyLAo+ID4+IHZvaWQgKnZhZGRyKTsKPiA+PiAgIGludCBkbWFf
bW1hcF9mcm9tX2dsb2JhbF9jb2hlcmVudChzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwgdm9p
ZCAqY3B1X2FkZHIsCj4gPj4gICAgICAgICAgICAgICAgICBzaXplX3Qgc2l6ZSwgaW50ICpyZXQp
Owo+ID4+ICAgaW50IGRtYV9pbml0X2dsb2JhbF9jb2hlcmVudChwaHlzX2FkZHJfdCBwaHlzX2Fk
ZHIsIHNpemVfdCBzaXplKTsKPiA+PiArYm9vbCBkbWFfZ2xvYmFsX3Bvb2xfYXZhaWxhYmxlKHZv
aWQpOwo+ID4+ICAgI2Vsc2UKPiA+PiAgIHN0YXRpYyBpbmxpbmUgdm9pZCAqZG1hX2FsbG9jX2Zy
b21fZ2xvYmFsX2NvaGVyZW50KHN0cnVjdCBkZXZpY2UgKmRldiwKPiA+PiAgICAgICAgICAgICAg
ICAgIHNzaXplX3Qgc2l6ZSwgZG1hX2FkZHJfdCAqZG1hX2hhbmRsZSkKPiA+PiBAQCAtMjEzLDYg
KzIxNCwxMCBAQCBzdGF0aWMgaW5saW5lIGludAo+ID4+IGRtYV9tbWFwX2Zyb21fZ2xvYmFsX2Nv
aGVyZW50KHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLAo+ID4+ICAgewo+ID4+ICAgICAgICAg
IHJldHVybiAwOwo+ID4+ICAgfQo+ID4+ICtzdGF0aWMgaW5saW5lIGJvb2wgZG1hX2dsb2JhbF9w
b29sX2F2YWlsYWJsZSh2b2lkKQo+ID4+ICt7Cj4gPj4gKyAgICAgICByZXR1cm4gZmFsc2U7Cj4g
Pj4gK30KPiA+PiAgICNlbmRpZiAvKiBDT05GSUdfRE1BX0dMT0JBTF9QT09MICovCj4gPj4KPiA+
PiAgIC8qCj4gPj4gZGlmZiAtLWdpdCBhL2tlcm5lbC9kbWEvY29oZXJlbnQuYyBiL2tlcm5lbC9k
bWEvY29oZXJlbnQuYwo+ID4+IGluZGV4IGMyMWFiYzc3YzUzZS4uNjA1ZjI0M2I4MjYyIDEwMDY0
NAo+ID4+IC0tLSBhL2tlcm5lbC9kbWEvY29oZXJlbnQuYwo+ID4+ICsrKyBiL2tlcm5lbC9kbWEv
Y29oZXJlbnQuYwo+ID4+IEBAIC0yNzcsNiArMjc3LDE0IEBAIGludCBkbWFfbW1hcF9mcm9tX2Rl
dl9jb2hlcmVudChzdHJ1Y3QgZGV2aWNlCj4gPj4gKmRldiwgc3RydWN0IHZtX2FyZWFfc3RydWN0
ICp2bWEsCj4gPj4gICAjaWZkZWYgQ09ORklHX0RNQV9HTE9CQUxfUE9PTAo+ID4+ICAgc3RhdGlj
IHN0cnVjdCBkbWFfY29oZXJlbnRfbWVtICpkbWFfY29oZXJlbnRfZGVmYXVsdF9tZW1vcnkgX19y
b19hZnRlcl9pbml0Owo+ID4+Cj4gPj4gK2Jvb2wgZG1hX2dsb2JhbF9wb29sX2F2YWlsYWJsZSh2
b2lkKQo+ID4+ICt7Cj4gPj4gKyAgICAgICBpZiAoIWRtYV9jb2hlcmVudF9kZWZhdWx0X21lbW9y
eSkKPiA+PiArICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+ID4+ICsKPiA+PiArICAgICAg
IHJldHVybiB0cnVlOwo+ID4+ICt9Cj4gPj4gKwo+ID4+ICAgdm9pZCAqZG1hX2FsbG9jX2Zyb21f
Z2xvYmFsX2NvaGVyZW50KHN0cnVjdCBkZXZpY2UgKmRldiwgc3NpemVfdCBzaXplLAo+ID4+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZG1hX2FkZHJfdCAqZG1hX2hhbmRs
ZSkKPiA+PiAgIHsKPiA+PiBkaWZmIC0tZ2l0IGEva2VybmVsL2RtYS9kaXJlY3QuYyBiL2tlcm5l
bC9kbWEvZGlyZWN0LmMKPiA+PiBpbmRleCA5NTk2YWUxYWEwZGEuLmE1OTliYjczMWNlYiAxMDA2
NDQKPiA+PiAtLS0gYS9rZXJuZWwvZG1hL2RpcmVjdC5jCj4gPj4gKysrIGIva2VybmVsL2RtYS9k
aXJlY3QuYwo+ID4+IEBAIC0yMzUsNyArMjM1LDcgQEAgdm9pZCAqZG1hX2RpcmVjdF9hbGxvYyhz
dHJ1Y3QgZGV2aWNlICpkZXYsIHNpemVfdCBzaXplLAo+ID4+ICAgICAgICAgICAgICAgICAgICog
SWYgdGhlcmUgaXMgYSBnbG9iYWwgcG9vbCwgYWx3YXlzIGFsbG9jYXRlIGZyb20gaXQgZm9yCj4g
Pj4gICAgICAgICAgICAgICAgICAgKiBub24tY29oZXJlbnQgZGV2aWNlcy4KPiA+PiAgICAgICAg
ICAgICAgICAgICAqLwo+ID4+IC0gICAgICAgICAgICAgICBpZiAoSVNfRU5BQkxFRChDT05GSUdf
RE1BX0dMT0JBTF9QT09MKSkKPiA+PiArICAgICAgICAgICAgICAgaWYgKElTX0VOQUJMRUQoQ09O
RklHX0RNQV9HTE9CQUxfUE9PTCkgJiYKPiA+PiBkbWFfZ2xvYmFsX3Bvb2xfYXZhaWxhYmxlKCkp
Cj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBkbWFfYWxsb2NfZnJvbV9nbG9i
YWxfY29oZXJlbnQoZGV2LCBzaXplLAo+ID4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgZG1hX2hhbmRsZSk7Cj4gPgo+ID4gZG1hX2FsbG9jX2Zyb21fZ2xvYmFsX2Nv
aGVyZW50KCkgYWxyZWFkeSBjaGVja3MgZG1hX2NvaGVyZW50X2RlZmF1bHRfbWVtb3J5LCBzbwo+
ID4gdGhlIHNvbHV0aW9uIGNvdWxkIGJlIGV2ZW4gc2ltcGxlcjoKPiA+Cj4gPiAtLS0gYS9rZXJu
ZWwvZG1hL2RpcmVjdC5jCj4gPiArKysgYi9rZXJuZWwvZG1hL2RpcmVjdC5jCj4gPiBAQCAtMjMy
LDEyICsyMzIsMTIgQEAgdm9pZCAqZG1hX2RpcmVjdF9hbGxvYyhzdHJ1Y3QgZGV2aWNlICpkZXYs
IHNpemVfdCBzaXplLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBhdHRycyk7Cj4gPgo+ID4gICAgICAgICAgICAgICAvKgo+ID4gLSAgICAgICAgICAgICAg
KiBJZiB0aGVyZSBpcyBhIGdsb2JhbCBwb29sLCBhbHdheXMgYWxsb2NhdGUgZnJvbSBpdCBmb3IK
PiA+ICsgICAgICAgICAgICAgICogSWYgdGhlcmUgaXMgYSBnbG9iYWwgcG9vbCwgYWx3YXlzIHRy
eSB0byBhbGxvY2F0ZSBmcm9tIGl0IGZvcgo+ID4gICAgICAgICAgICAgICAgKiBub24tY29oZXJl
bnQgZGV2aWNlcy4KPiA+ICAgICAgICAgICAgICAgICovCj4gPiAtICAgICAgICAgICAgIGlmIChJ
U19FTkFCTEVEKENPTkZJR19ETUFfR0xPQkFMX1BPT0wpKQo+ID4gLSAgICAgICAgICAgICAgICAg
ICAgIHJldHVybiBkbWFfYWxsb2NfZnJvbV9nbG9iYWxfY29oZXJlbnQoZGV2LCBzaXplLAo+ID4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkbWFfaGFuZGxlKTsKPiA+ICsg
ICAgICAgICAgICAgcmV0ID0gZG1hX2FsbG9jX2Zyb21fZ2xvYmFsX2NvaGVyZW50KGRldiwgc2l6
ZSwgZG1hX2hhbmRsZSk7Cj4gPiArICAgICAgICAgICAgIGlmIChyZXQpCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgcmV0dXJuIHJldDsKPgo+IFNvIGlmIGFsbG9jYXRpb24gZmFpbHMgYmVjYXVz
ZSB0aGUgcG9vbCBpcyBmdWxsLCB3ZSBzaG91bGQgZ28gYWhlYWQgYW5kCj4gcmVtYXAgc29tZXRo
aW5nIHRoYXQgY2FuJ3Qgd29yaz8gOykKPgo+IFRoZSBkbWFfZ2xvYmFsX3Bvb2xfYXZhaWxhYmxl
KCkgaWRlYSBzb3J0IG9mIHdvcmtzLCBidXQgSSdtIHN0aWxsCj4gY29uY2VybmVkIGFib3V0IHRo
ZSBjYXNlIHdoZXJlIGl0ICpzaG91bGQqIGhhdmUgYmVlbiBhdmFpbGFibGUgYnV0IHRoZQo+IHBs
YXRmb3JtIGhhcyBiZWVuIG1pc2NvbmZpZ3VyZWQsIHNvIGFnYWluIHdlIGZhbGwgdGhyb3VnaCB0
bwo+CklmIHRoZSBwbGF0Zm9ybSBpcyBtaXNjb25maWd1cmVkIGl0IGlzIGJvdW5kIHRvIGZhaWwg
YW55d2F5IHNvIHNob3VsZAp3ZSBjb25zaWRlciB0aGF0IGFzIGEgdmFsaWQgY2FzZT8KCj4gRE1B
X0RJUkVDVF9SRU1BUCAic3VjY2Vzc2Z1bGx5IiByZXR1cm5pbmcgYSBjb2hlcmVudCBidWZmZXIg
dGhhdCBpc24ndCwKPiBhbmQgdGhlIHVzZXIncyBmaWxlc3lzdGVtIGdldHMgY29ycnVwdGVkLiBP
ciBhdCBiZXN0LCB0aGV5IGdldCBjb25mdXNlZAo+IGJ5IHdlaXJkIGVycm9ycyBmcm9tIHJhbmRv
bSBkZXZpY2VzIGdvaW5nIHdyb25nLiBUaGF0J3Mgd2h5IEkgc2FpZCBpdAo+IHdvdWxkIGJlIGZp
ZGRseSAtIHRoZSBjdXJyZW50IHN0YXRlIG9mIERNQV9HTE9CQUxfUE9PTCBhcyBhIGJpbmFyeQo+
IGFyY2gtd2lkZSB0aGluZyBpcyByZWxhdGl2ZWx5IHJvYnVzdCBhbmQgZWFzeSB0byByZWFzb24g
YWJvdXQsIGJ1dAo+IGF0dGVtcHRpbmcgdG8gZ2VuZXJhbGlzZSBpdCBmdXJ0aGVyIGlzLi4uIGxl
c3Mgc28uCj4KPiBUaGFua3MsCj4gUm9iaW4uCj4KCkNoZWVycywKUHJhYmhha2FyCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
