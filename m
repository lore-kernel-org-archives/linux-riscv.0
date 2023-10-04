Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93865E7C4E2
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 17:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V9Phj2ELSCedXZsTie5hDN19CR+WjgZbnayDqL+Y92Y=; b=fJA2pVyJtHQ10H
	leAWVUDyaIAgLrG5nFbA411NszmNzndax+fiXUj3QtkjyRRb1Hj5MRBe90hyoxTtVxzZeaa//A2iy
	VOoLszjruHhghxmEwbXbd3HljboMwk3W9SPGMaOOMoznKuQOXVZx7a9vLXHg5AcJr7SZEnkXX/79L
	+CZqk/4/dKJgmJDN7GzpLvBOOfLPx6xn/st0ida5pE8jM3lIyaHZQCroovVNWxAE+r2VsnwBVRAkN
	ZpvetIk3OCK09uOUhVGy2v/OGVRDF7pZm9YQtMtF7KwDA3oGDzoRm1pgvTBmAQgSBLF0gzcdTC//k
	D86J+ASUj4FSgkktEOaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo5Ur-000ZoL-2a;
	Wed, 04 Oct 2023 17:17:17 +0000
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo5Uo-000ZjU-2N
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 17:17:16 +0000
Received: by mail-vk1-xa2d.google.com with SMTP id 71dfb90a1353d-495c10cec8aso43856e0c.1
        for <linux-riscv@lists.infradead.org>; Wed, 04 Oct 2023 10:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696439817; x=1697044617; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mKXyXyIVrMhHeTBplf68Sne/yJwO2VWXOvGeFVZVVI0=;
        b=hpgIFNVi7GAn9UrnybN5Em1VXbfRW2cE6ld1HqwCoiBaMc0r/HyBjxYH2K75xOT8tH
         zk6vDlW2foLG9E7QMaLz5YO+du/hqyhI6TSwjLjbomQaLI36CbCoWwpKLDWq59RZ5QOy
         sepAZOFDyX3a2Sj4Pi+TczuK0kB3mDLUVpjF7gNnTthFrvhiS4f2s56zbBtmA/brrf20
         c1pxprzMo+6K/zKNjITWbBRz1vxvABxZ0MoDd/OA7GWUh0OqJWnjWoDo5/Q4Sl/Wcj8Z
         v4MMmqcrQaQy9FTtSA1NpkQmpnEW3JvzwbeFEUq2mBhfdGJWrbrRbtqzIBbQ80xSz60D
         8kwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696439817; x=1697044617;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mKXyXyIVrMhHeTBplf68Sne/yJwO2VWXOvGeFVZVVI0=;
        b=jwDJ7KWP5/OCu2c6oVl/qpfPfTERtS1Pbt5VfhdAmVXzsj76HO0Grwhse0sHSvVYTF
         /suuH0G/gqANHQqgqm9v/KKkdPNgCz1zcu3ta0fnt48gq58NVgw0cXlhV5OaxdWbQCFY
         x1T7//UXW8sUQcqhY5rEra1viQQbHfz/tHjDQrFigrix/s3diKTHvtfnNR9P2nfAW9sW
         tm/cfALaiNvFuLF/26AoPb6bWaTR05JukG1nd5H7oq8GJhxZsKkfJL30qTyLYDRkS5LW
         Z3fCNzBuyzMb4bvXEZNl8kEJUDxMiTR5oX1MG7JhiH4L6/LY/o4GyzM9o5yRp/sgp6tb
         u5Fw==
X-Gm-Message-State: AOJu0YzlbuMN1FdUcbXMwXVJ1EuoRXuqsEfjQmqQDu4ss/OxRvj61kID
	AjBp/4eJ1Mmko6YXlDacxjh8q+I7gUSS4f9sqX4=
X-Google-Smtp-Source: AGHT+IHdD/dOCM5nfzumZAEL0jBE4Ej5n+lk/beg05IUH4Dkjqn+RFPEswXegljO4k7vBq4bJ7qVDHX8OYS1n4TIRH4=
X-Received: by 2002:a1f:4f86:0:b0:495:c10c:ec39 with SMTP id
 d128-20020a1f4f86000000b00495c10cec39mr2674807vkb.2.1696439816668; Wed, 04
 Oct 2023 10:16:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230921-th1520-mmc-v1-0-49f76c274fb3@baylibre.com>
 <CAOCHtYhnx1EpBM+o3xhdsicx5uqLidojK3f0HQ+VfyVv1ZXnVQ@mail.gmail.com>
 <CAOCHtYi5Ab5ppCmaQV3QuKQcpmJX+sHdAmtuEXhfq8xf5fFCYQ@mail.gmail.com>
 <ZRuamJuShOnvP1pr@x1> <ZR1M3FcdXrDmIGu2@xhacker> <CA+V-a8ugwqkQxnX-wwWCHVtBBtG=aVv=MZTc53LbpxtFA=N1_A@mail.gmail.com>
 <bc2b0b30-ab37-f336-c90e-eab570d393a2@arm.com> <c2ea3f34bb919293b850fab6ed42b61e3517ba35.camel@icenowy.me>
 <a568a9dd-bab2-1e23-c4d5-9f6475bdcc3b@arm.com> <CA+V-a8s1S4yTH19PVNSznAgUFoHRNoye9CfwjW6iy6PbQ9thew@mail.gmail.com>
In-Reply-To: <CA+V-a8s1S4yTH19PVNSznAgUFoHRNoye9CfwjW6iy6PbQ9thew@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 4 Oct 2023 18:16:01 +0100
Message-ID: <CA+V-a8vbWW6=HTfR+FCPOB0bAa8M3Bbm_k=7+XbjOc3ybo6VNQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] RISC-V: Add eMMC support for TH1520 boards
To: Robin Murphy <robin.murphy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_101714_773644_73F577AD 
X-CRM114-Status: GOOD (  35.68  )
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Jisheng Zhang <jszhang@kernel.org>, Drew Fustini <dfustini@baylibre.com>, linux-kernel@vger.kernel.org, Linux-MM <linux-mm@kvack.org>, Guo Ren <guoren@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>, Geert Uytterhoeven <geert+renesas@glider.be>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, Arnd Bergmann <arnd@arndb.de>, Han Gao <gaohan@iscas.ac.cn>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Jason Kridner <jkridner@beagleboard.org>, Paul Walmsley <paul.walmsley@sifive.com>, Robert Nelson <robertcnelson@gmail.com>, linux-mmc@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>, Conor Dooley <conor@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Xi Ruoyao <xry111@xry111.site>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBPY3QgNCwgMjAyMyBhdCA1OjAz4oCvUE0gTGFkLCBQcmFiaGFrYXIKPHByYWJoYWth
ci5jc2VuZ2dAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgT2N0IDQsIDIwMjMgYXQgMzox
OOKAr1BNIFJvYmluIE11cnBoeSA8cm9iaW4ubXVycGh5QGFybS5jb20+IHdyb3RlOgo+ID4KPiA+
IE9uIDA0LzEwLzIwMjMgMzowMiBwbSwgSWNlbm93eSBaaGVuZyB3cm90ZToKPiA+IFsuLi5dCj4g
PiA+Pj4+IEkgYmVsaWV2ZSBjb21taXQgNDg0ODYxZTA5ZjNlICgic29jOiByZW5lc2FzOiBLY29u
ZmlnOiBTZWxlY3QgdGhlCj4gPiA+Pj4+IHJlcXVpcmVkIGNvbmZpZ3MgZm9yIFJaL0ZpdmUgU29D
IikgY2FuIGNhdXNlIHJlZ3Jlc3Npb24gb24gYWxsCj4gPiA+Pj4+IG5vbi1kbWEtY29oZXJlbnQg
cmlzY3YgcGxhdGZvcm1zIHdpdGggZ2VuZXJpYyBkZWZjb25maWcuIFRoaXMgaXMKPiA+ID4+Pj4g
YSBjb21tb24gaXNzdWUuIFRoZSBsb2dpYyBoZXJlIGlzOiBnZW5lcmljIHJpc2N2IGRlZmNvbmZp
Zwo+ID4gPj4+PiBzZWxlY3RzCj4gPiA+Pj4+IEFSQ0hfUjlBMDdHMDQzIHdoaWNoIHNlbGVjdHMg
RE1BX0dMT0JBTF9QT09MLCB3aGljaCBhc3N1bWVzIGFsbAo+ID4gPj4+PiBub24tZG1hLWNvaGVy
ZW50IHJpc2N2IHBsYXRmb3JtcyBoYXZlIGEgZG1hIGdsb2JhbCBwb29sLCB0aGlzCj4gPiA+Pj4+
IGFzc3VtcHRpb24KPiA+ID4+Pj4gc2VlbXMgbm90IGNvcnJlY3QuIEFuZCBJIGJlbGlldmUgRE1B
X0dMT0JBTF9QT09MIHNob3VsZCBub3QgYmUKPiA+ID4+Pj4gc2VsZWN0ZWQgYnkgQVJDSF9TT0NG
QU1JTElZLCBpbnN0ZWFkLCBvbmx5IEFSQ0ggdW5kZXIgc29tZQo+ID4gPj4+PiBzcGVjaWZpYwo+
ID4gPj4+PiBjb25kaXRpb25zIGNhbiBzZWxlY3QgaXQgZ2xvYmFseSwgZm9yIGV4YW1wbGUgTk9N
TVUgQVJNIGFuZCBzbwo+ID4gPj4+PiBvbi4KPiA+ID4+Pj4KPiA+ID4+Pj4gU2luY2UgdGhpcyBp
cyBhIHJlZ3Jlc3Npb24sIHdoYXQncyBwcm9wZXIgZml4PyBhbnkgc3VnZ2VzdGlvbiBpcwo+ID4g
Pj4+PiBhcHByZWNpYXRlZC4KPiA+ID4+Cj4gPiA+PiBJIHRoaW5rIHRoZSBhbnN3ZXIgaXMgdG8g
bm90IHNlbGVjdCBETUFfR0xPQkFMX1BPT0wsIHNpbmNlIHRoYXQgaXMKPiA+ID4+IG9ubHkKPiA+
ID4KPiA+ID4gV2VsbCBJIHRoaW5rIGZvciBSSVNDLVYsIGl0J3Mgbm90IE5PTU1VIG9ubHkgYnV0
IGFwcGxpY2FibGUgZm9yIGV2ZXJ5Cj4gPiA+IGNvcmUgdGhhdCBkb2VzIG5vdCBzdXBwb3J0IFN2
cGJtdCBvciB2ZW5kb3Itc3BlY2lmaWMgYWx0ZXJuYXRpdmVzLAo+ID4gPiBiZWNhdXNlIHRoZSBv
cmlnaW5hbCBSSVNDLVYgcHJpdiBzcGVjIGRvZXMgbm90IGRlZmluZSBtZW1vcnkgYXR0cmlidXRl
cwo+ID4gPiBpbiBwYWdlIHRhYmxlIGVudHJpZXMuCj4gPiA+Cj4gPiA+IEZvciB0aGUgUmVuZXNh
cy9BbmRlcyBjYXNlIEkgdGhpbmsgYSBwb29sIGlzIHNldCBieSBPcGVuU0JJIHdpdGgKPiA+ID4g
dmVuZG9yLXNwZWNpZmljIE0tbW9kZSBmYWNpbGl0eSBhbmQgdGhlbiBwYXNzZWQgaW4gRFQsIGFu
ZCB0aGUgUy1tb2RlCj4gPiA+ICh3aGljaCBNTVUgaXMgZW5hYmxlZCBpbikganVzdCBzZWVzIGZp
eGVkIG1lbW9yeSBhdHRyaWJ1dGVzLCBpbiB0aGlzCj4gPiA+IGNhc2UgSSB0aGluayBETUFfR0xP
QkFMX1BPT0wgaXMgbmVlZGVkLgo+ID4KPiA+IE9oIHdvdywgaXMgdGhhdCByZWFsbHkgYSB0aGlu
Zz8gSW4gdGhhdCBjYXNlLCBlaXRoZXIgeW91IGp1c3QgY2FuJ3QKPiA+IHN1cHBvcnQgdGhpcyBw
bGF0Zm9ybSBpbiBhIG11bHRpLXBsYXRmb3JtIGtlcm5lbCwgb3Igc29tZW9uZSBuZWVkcyB0byBk
bwo+ID4gc29tZSBmaWRkbHkgd29yayBpbiBkbWEtZGlyZWN0IHRvIGEpIGludHJvZHVjZSB0aGUg
bm90aW9uIG9mIGFuIG9wdGlvbmFsCj4gPiBnbG9iYWwgcG9vbCwKPiBMb29raW5nIGF0IHRoZSBj
b2RlIFswXSB3ZSBkbyBoYXZlIGNvbXBpbGUgdGltZSBjaGVjayBmb3IKPiBDT05GSUdfRE1BX0dM
T0JBTF9QT09MIGlycmVzcGVjdGl2ZSBvZiB0aGlzIGJlaW5nIHByZXNlbnQgaW4gRFQgb3IKPiBu
b3QsIGluc3RlYWQgaWYgd2UgbWFrZSBpdCBjb21waWxlIHRpbWUgYW5kIHJ1bnRpbWUgY2hlY2sg
aWUgZWl0aGVyCj4gY2hlY2sgZm9yIERUIG5vZGUgb3Igc2VlIGlmIHBvb2wgaXMgYXZhaWxhYmxl
IGFuZCBvbmx5IHRoZW4gcHJvY2VlZAo+IGZvciBhbGxvY2F0aW9uIGZvcm0gdGhpcyBwb29sLgo+
Cj4gV2hhdCBhcmUgeW91ciB0aG91Z2h0cyBvbiB0aGlzPwo+ClNvbWV0aGluZyBsaWtlIHRoZSBi
ZWxvdzoKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2RtYS1tYXAtb3BzLmggYi9pbmNsdWRl
L2xpbnV4L2RtYS1tYXAtb3BzLmgKaW5kZXggZjJmYzIwM2ZiOGExLi43YmY0MWE0NjM0YTQgMTAw
NjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvZG1hLW1hcC1vcHMuaAorKysgYi9pbmNsdWRlL2xpbnV4
L2RtYS1tYXAtb3BzLmgKQEAgLTE5OCw2ICsxOTgsNyBAQCBpbnQgZG1hX3JlbGVhc2VfZnJvbV9n
bG9iYWxfY29oZXJlbnQoaW50IG9yZGVyLAp2b2lkICp2YWRkcik7CiBpbnQgZG1hX21tYXBfZnJv
bV9nbG9iYWxfY29oZXJlbnQoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIHZvaWQgKmNwdV9h
ZGRyLAogICAgICAgICAgICAgICAgc2l6ZV90IHNpemUsIGludCAqcmV0KTsKIGludCBkbWFfaW5p
dF9nbG9iYWxfY29oZXJlbnQocGh5c19hZGRyX3QgcGh5c19hZGRyLCBzaXplX3Qgc2l6ZSk7Citi
b29sIGRtYV9nbG9iYWxfcG9vbF9hdmFpbGFibGUodm9pZCk7CiAjZWxzZQogc3RhdGljIGlubGlu
ZSB2b2lkICpkbWFfYWxsb2NfZnJvbV9nbG9iYWxfY29oZXJlbnQoc3RydWN0IGRldmljZSAqZGV2
LAogICAgICAgICAgICAgICAgc3NpemVfdCBzaXplLCBkbWFfYWRkcl90ICpkbWFfaGFuZGxlKQpA
QCAtMjEzLDYgKzIxNCwxMCBAQCBzdGF0aWMgaW5saW5lIGludApkbWFfbW1hcF9mcm9tX2dsb2Jh
bF9jb2hlcmVudChzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKIHsKICAgICAgICByZXR1cm4g
MDsKIH0KK3N0YXRpYyBpbmxpbmUgYm9vbCBkbWFfZ2xvYmFsX3Bvb2xfYXZhaWxhYmxlKHZvaWQp
Cit7CisgICAgICAgcmV0dXJuIGZhbHNlOworfQogI2VuZGlmIC8qIENPTkZJR19ETUFfR0xPQkFM
X1BPT0wgKi8KCiAvKgpkaWZmIC0tZ2l0IGEva2VybmVsL2RtYS9jb2hlcmVudC5jIGIva2VybmVs
L2RtYS9jb2hlcmVudC5jCmluZGV4IGMyMWFiYzc3YzUzZS4uNjA1ZjI0M2I4MjYyIDEwMDY0NAot
LS0gYS9rZXJuZWwvZG1hL2NvaGVyZW50LmMKKysrIGIva2VybmVsL2RtYS9jb2hlcmVudC5jCkBA
IC0yNzcsNiArMjc3LDE0IEBAIGludCBkbWFfbW1hcF9mcm9tX2Rldl9jb2hlcmVudChzdHJ1Y3Qg
ZGV2aWNlCipkZXYsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLAogI2lmZGVmIENPTkZJR19E
TUFfR0xPQkFMX1BPT0wKIHN0YXRpYyBzdHJ1Y3QgZG1hX2NvaGVyZW50X21lbSAqZG1hX2NvaGVy
ZW50X2RlZmF1bHRfbWVtb3J5IF9fcm9fYWZ0ZXJfaW5pdDsKCitib29sIGRtYV9nbG9iYWxfcG9v
bF9hdmFpbGFibGUodm9pZCkKK3sKKyAgICAgICBpZiAoIWRtYV9jb2hlcmVudF9kZWZhdWx0X21l
bW9yeSkKKyAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKKworICAgICAgIHJldHVybiB0cnVl
OworfQorCiB2b2lkICpkbWFfYWxsb2NfZnJvbV9nbG9iYWxfY29oZXJlbnQoc3RydWN0IGRldmlj
ZSAqZGV2LCBzc2l6ZV90IHNpemUsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBkbWFfYWRkcl90ICpkbWFfaGFuZGxlKQogewpkaWZmIC0tZ2l0IGEva2VybmVsL2RtYS9kaXJl
Y3QuYyBiL2tlcm5lbC9kbWEvZGlyZWN0LmMKaW5kZXggOTU5NmFlMWFhMGRhLi5hNTk5YmI3MzFj
ZWIgMTAwNjQ0Ci0tLSBhL2tlcm5lbC9kbWEvZGlyZWN0LmMKKysrIGIva2VybmVsL2RtYS9kaXJl
Y3QuYwpAQCAtMjM1LDcgKzIzNSw3IEBAIHZvaWQgKmRtYV9kaXJlY3RfYWxsb2Moc3RydWN0IGRl
dmljZSAqZGV2LCBzaXplX3Qgc2l6ZSwKICAgICAgICAgICAgICAgICAqIElmIHRoZXJlIGlzIGEg
Z2xvYmFsIHBvb2wsIGFsd2F5cyBhbGxvY2F0ZSBmcm9tIGl0IGZvcgogICAgICAgICAgICAgICAg
ICogbm9uLWNvaGVyZW50IGRldmljZXMuCiAgICAgICAgICAgICAgICAgKi8KLSAgICAgICAgICAg
ICAgIGlmIChJU19FTkFCTEVEKENPTkZJR19ETUFfR0xPQkFMX1BPT0wpKQorICAgICAgICAgICAg
ICAgaWYgKElTX0VOQUJMRUQoQ09ORklHX0RNQV9HTE9CQUxfUE9PTCkgJiYKZG1hX2dsb2JhbF9w
b29sX2F2YWlsYWJsZSgpKQogICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gZG1hX2FsbG9j
X2Zyb21fZ2xvYmFsX2NvaGVyZW50KGRldiwgc2l6ZSwKICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGRtYV9oYW5kbGUpOwoKCkNoZWVycywKUHJhYmhha2FyCgo+IFswXSBo
dHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni42LXJjNC9zb3VyY2Uva2VybmVsL2Rt
YS9kaXJlY3QuYyNMMjM4Cj4KPiA+IGFuZCBiKSBtYWtlIGl0IHNvbWVob3cgY29wZSB3aXRoIERN
QV9ESVJFQ1RfUkVNQVAgYmVpbmcKPiA+IGVuYWJsZWQgYnV0IG5vbi1mdW5jdGlvbmFsLgo+ID4K
PiBETUFfRElSRUNUX1JFTUFQIGNvbmZpZyBvcHRpb24gaXMgc2VsZWN0ZWQgYnkgTk9OQ09IRVJF
TkVUIGNvbmZpZyBvcHRpb24gYW55d2F5Lgo+Cj4gQ2hlZXJzLAo+IFByYWJoYWthcgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
