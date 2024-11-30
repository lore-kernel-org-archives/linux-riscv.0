Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26340D73606
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Nov 2024 15:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IMstODbjXKtU9LascqViIdb+ykwYWVi9pbidGOTOq8Q=; b=VTw7uJfq65rI9H
	C9JJz3fI/cFnLpFiibtHSdiziudVk8hPAyVnHUuNboiukWH+kDkil/WBVNBNihQ2nkDCXZN8v+qzn
	mk2Oa8XS0Dqorj4jDmtBrf1a/nPjSLOKSq3AjMI/f15LWOFmRVt0VdSTQQj3MAQqCFT/614mOwIIb
	+cvLdjkXM9sicMhUWSzM9reafosO9cV3Fe3zZrkaaq1JZ0HcwivL7DTGCrXeW+iYwPkJrSaWXztro
	CAJp1u6nUOu8mT837717Ft+UM+Jdq0t700E1thk7NwEBQjnclGUqmQUL8dqp41/Z4DezDoQwM8hdA
	ypb7sVk4HoLRxDLhVTyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHPWL-00000002Equ-1Xzz;
	Sat, 30 Nov 2024 15:36:33 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHPWH-00000002Eos-3Dmx
	for linux-riscv@lists.infradead.org;
	Sat, 30 Nov 2024 15:36:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 520A4A40328
	for <linux-riscv@lists.infradead.org>; Sat, 30 Nov 2024 15:34:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C3D6C4CECC
	for <linux-riscv@lists.infradead.org>; Sat, 30 Nov 2024 15:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732980988;
	bh=i2wtbIqmpawPaNp5Btdx5Ar7zkC857Xk8v4whaZ01vs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CiO7CeS2vsEIgTLlls4gOdNxdqWDV6mk4yi8iXoCspP3vDrRwMQfReixKraH7cjeI
	 0FHLGd+mi4RaTkM/mneIM+9rCreIJPnOf7+9eDCPeA36bhQV0qWFrJ6ENgTjS/foMm
	 WFF3cKrpqN0fa3OZsaR4LplpY3GTK1lJopKyws07napUANn9AnKOBXeKaVP5yrPqX4
	 G5lPmcSWpLP083O5ydfiY/B4s4w7RxN/9BCjVHuKK3AJVSW+XU5nVt7rWR33p3U02E
	 H+YnY4Kq+j3mwH1bDPYoRAxYixrpjK7AgaDdhn+ZdjJIkkO7dyrHZg2zx4B1+bRD6g
	 CNd5qmx1DW1HA==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aa545dc7105so408970866b.3
        for <linux-riscv@lists.infradead.org>; Sat, 30 Nov 2024 07:36:28 -0800 (PST)
X-Gm-Message-State: AOJu0Yzd1+VM4jcc6LQRaAufA08jUXZ3OUTM6UNRPZXSTdWAUUzVuPoD
	z/RTxsL8X+zma2uFXTsh3oTnkNCWN4TuaYOuM22ylfWCt7XUpaBUC5JOg1eiNfWT70RYJ60zSeE
	hno5IJder5+uPxNYO06K5ZG1mVxs=
X-Google-Smtp-Source: AGHT+IFCbSZTXAOHJScz3jShbtoC55XaWETe6KCUxwT/Fq9CLf8JLid4BoIIEkr2VsAivDhAk3kDfg+Q5MIIOdO5iyI=
X-Received: by 2002:a17:906:c4d5:b0:aa5:392a:f5a7 with SMTP id
 a640c23a62f3a-aa581066f35mr1161420066b.57.1732980987180; Sat, 30 Nov 2024
 07:36:27 -0800 (PST)
MIME-Version: 1.0
References: <20241130115355.3316160-1-guoren@kernel.org> <CAJF2gTQhfr-wsj2VZwwP7sWq=yp9HtT_kzzr68xh1VpKLSbybQ@mail.gmail.com>
In-Reply-To: <CAJF2gTQhfr-wsj2VZwwP7sWq=yp9HtT_kzzr68xh1VpKLSbybQ@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 30 Nov 2024 23:36:15 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRcaZhHdETFk9KbL1rUdO-U4dX8Ydta7ViAUQ3unrbScg@mail.gmail.com>
Message-ID: <CAJF2gTRcaZhHdETFk9KbL1rUdO-U4dX8Ydta7ViAUQ3unrbScg@mail.gmail.com>
Subject: Re: [PATCH] riscv: Fixup boot failure when CONFIG_RT_MUTEXES=y
To: paul.walmsley@sifive.com, palmer@dabbelt.com, guoren@kernel.org, 
	bjorn@rivosinc.com, conor@kernel.org, leobras@redhat.com, 
	peterz@infradead.org, parri.andrea@gmail.com, will@kernel.org, 
	longman@redhat.com, boqun.feng@gmail.com, arnd@arndb.de, 
	alexghiti@rivosinc.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241130_073629_955241_91575911 
X-CRM114-Status: GOOD (  22.57  )
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

T24gU2F0LCBOb3YgMzAsIDIwMjQgYXQgODowMuKAr1BNIEd1byBSZW4gPGd1b3JlbkBrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IE9uIFNhdCwgTm92IDMwLCAyMDI0IGF0IDc6NTTigK9QTSA8Z3VvcmVu
QGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IEZyb206IEd1byBSZW4gPGd1b3JlbkBsaW51eC5h
bGliYWJhLmNvbT4KPiA+Cj4gPiBXaGVuIENPTkZJR19SVF9NVVRFWEVTPXksIG11dGV4X2xvY2st
PnJ0X211dGV4X3RyeV9hY3F1aXJlIHdvdWxkCj4gQ29ycmVjdDogQ09ORklHX0RFQlVHX1JUX01V
VEVYRVM9eQpBYmFuZG9uZWQuCgpIZXJlIGlzIHRoZSBSRVNFTkQgUEFUQ0g6Cmh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjQxMTMwMTUzMzEwLjMzNDk0ODQtMS1ndW9yZW5A
a2VybmVsLm9yZy8KCj4KPiA+IGNoYW5nZSBmcm9tIHJ0X211dGV4X2NtcHhjaGdfYWNxdWlyZSB0
byBydF9tdXRleF9zbG93dHJ5bG9jaygpOgo+ID4gICAgICAgICByYXdfc3Bpbl9sb2NrX2lycXNh
dmUoJmxvY2stPndhaXRfbG9jaywgZmxhZ3MpOwo+ID4gICAgICAgICByZXQgPSBfX3J0X211dGV4
X3Nsb3d0cnlsb2NrKGxvY2spOwo+ID4gICAgICAgICByYXdfc3Bpbl91bmxvY2tfaXJxcmVzdG9y
ZSgmbG9jay0+d2FpdF9sb2NrLCBmbGFncyk7Cj4gPgo+ID4gQmVjYXVzZSBxdWV1ZWRfc3Bpbl8j
b3BzIHRvIHRpY2tldF8jb3BzIGlzIGNoYW5nZWQgb25lIGJ5IG9uZSBieQo+ID4ganVtcF9sYWJl
bCwgcmF3X3NwaW5fbG9jay91bmxvY2sgd291bGQgY2F1c2UgYSBkZWFkbG9jayBkdXJpbmcgdGhl
Cj4gPiBjaGFuZ2luZy4KPiA+Cj4gPiBUaGF0IG1lYW5zIGluIGFyY2gvcmlzY3Yva2VybmVsL2p1
bXBfbGFiZWwuYzoKPiA+IDEuCj4gPiBhcmNoX2p1bXBfbGFiZWxfdHJhbnNmb3JtX3F1ZXVlKCkg
LT4KPiA+IG11dGV4X2xvY2soJnRleHRfbXV0ZXgpOyArLT4gcmF3X3NwaW5fbG9jayAgLT4gcXVl
dWVkX3NwaW5fbG9jawo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgIHwtPiByYXdfc3Bpbl91
bmxvY2sgLT4gcXVldWVkX3NwaW5fdW5sb2NrCj4gPiBwYXRjaF9pbnNuX3dyaXRlIC0+IGNoYW5n
ZSB0aGUgcmF3X3NwaW5fbG9jayB0byB0aWNrZXRfbG9jawo+ID4gbXV0ZXhfdW5sb2NrKCZ0ZXh0
X211dGV4KTsKPiA+IC4uLgo+ID4KPiA+IDIuIC8qIERpcnR5IHRoZSBsb2NrIHZhbHVlICovCj4g
PiBhcmNoX2p1bXBfbGFiZWxfdHJhbnNmb3JtX3F1ZXVlKCkgLT4KPiA+IG11dGV4X2xvY2soJnRl
eHRfbXV0ZXgpOyArLT4gcmF3X3NwaW5fbG9jayAtPiAqdGlja2V0X2xvY2sqCj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgfC0+IHJhd19zcGluX3VubG9jayAtPiAqcXVldWVkX3NwaW5fdW5s
b2NrKgo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAvKiBCVUc6IHRpY2tldF9sb2NrIHdp
dGggcXVldWVkX3NwaW5fdW5sb2NrICovCj4gPiBwYXRjaF9pbnNuX3dyaXRlICAtPiAgY2hhbmdl
IHRoZSByYXdfc3Bpbl91bmxvY2sgdG8gdGlja2V0X3VubG9jawo+ID4gbXV0ZXhfdW5sb2NrKCZ0
ZXh0X211dGV4KTsKPiA+IC4uLgo+ID4KPiA+IDMuIC8qIERlYWQgbG9jayAqLwo+ID4gYXJjaF9q
dW1wX2xhYmVsX3RyYW5zZm9ybV9xdWV1ZSgpIC0+Cj4gPiBtdXRleF9sb2NrKCZ0ZXh0X211dGV4
KTsgKy0+IHJhd19zcGluX2xvY2sgLT4gdGlja2V0X2xvY2sgLyogZGVhZGxvY2shICovCj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgfC0+IHJhd19zcGluX3VubG9jayAtPiB0aWNrZXRfdW5s
b2NrCj4gPiBwYXRjaF9pbnNuX3dyaXRlIC0+IGNoYW5nZSBvdGhlciByYXdfc3Bpbl8jb3AgLT4g
dGlja2V0XyNvcAo+ID4gbXV0ZXhfdW5sb2NrKCZ0ZXh0X211dGV4KTsKPiA+Cj4gPiBTbywgdGhl
IHNvbHV0aW9uIGlzIHRvIGRpc2FibGUgbXV0ZXggdXNhZ2Ugb2YKPiA+IGFyY2hfanVtcF9sYWJl
bF90cmFuc2Zvcm1fcXVldWUoKSBkdXJpbmcgZWFybHlfYm9vdF9pcnFzX2Rpc2FibGVkLCBqdXN0
Cj4gPiBsaWtlIHdlIGhhdmUgZG9uZSBmb3Igc3RvcF9tYWNoaW5lLgo+ID4KPiA+IFJlcG9ydGVk
LWJ5OiBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBH
dW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBHdW8g
UmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KPiA+IEZpeGVzOiBhYjgzNjQ3ZmFkYWUgKCJyaXNjdjog
QWRkIHFzcGlubG9jayBzdXBwb3J0IikKPiA+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xpbnV4LXJpc2N2L0NBSkYyZ1RRd1lUR2luQm1DU2dWVW9QdjBfcTRFUHRfK1dpeWZVQTFIVmlB
S2dVenhBZ0BtYWlsLmdtYWlsLmNvbS9ULyNtZjQ4OGU2MzQ3ODE3ZmNhMDNiYjkzYTdkMzRkZjMz
ZDg2MTViMzc3NQo+ID4gQ2M6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+Cj4g
PiBDYzogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgo+ID4gLS0tCj4g
PiAgYXJjaC9yaXNjdi9rZXJuZWwvanVtcF9sYWJlbC5jIHwgMTIgKysrKysrKysrLS0tCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiA+Cj4gPiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvanVtcF9sYWJlbC5jIGIvYXJjaC9yaXNjdi9r
ZXJuZWwvanVtcF9sYWJlbC5jCj4gPiBpbmRleCA2ZWVlNmY3MzZmNjguLjY1NGVkMTU5YzgzMCAx
MDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2p1bXBfbGFiZWwuYwo+ID4gKysrIGIv
YXJjaC9yaXNjdi9rZXJuZWwvanVtcF9sYWJlbC5jCj4gPiBAQCAtMzYsOSArMzYsMTUgQEAgYm9v
bCBhcmNoX2p1bXBfbGFiZWxfdHJhbnNmb3JtX3F1ZXVlKHN0cnVjdCBqdW1wX2VudHJ5ICplbnRy
eSwKPiA+ICAgICAgICAgICAgICAgICBpbnNuID0gUklTQ1ZfSU5TTl9OT1A7Cj4gPiAgICAgICAg
IH0KPiA+Cj4gPiAtICAgICAgIG11dGV4X2xvY2soJnRleHRfbXV0ZXgpOwo+ID4gLSAgICAgICBw
YXRjaF9pbnNuX3dyaXRlKGFkZHIsICZpbnNuLCBzaXplb2YoaW5zbikpOwo+ID4gLSAgICAgICBt
dXRleF91bmxvY2soJnRleHRfbXV0ZXgpOwo+ID4gKyAgICAgICBpZiAoZWFybHlfYm9vdF9pcnFz
X2Rpc2FibGVkKSB7Cj4gPiArICAgICAgICAgICAgICAgcmlzY3ZfcGF0Y2hfaW5fc3RvcF9tYWNo
aW5lID0gMTsKPiA+ICsgICAgICAgICAgICAgICBwYXRjaF9pbnNuX3dyaXRlKGFkZHIsICZpbnNu
LCBzaXplb2YoaW5zbikpOwo+ID4gKyAgICAgICAgICAgICAgIHJpc2N2X3BhdGNoX2luX3N0b3Bf
bWFjaGluZSA9IDA7Cj4gPiArICAgICAgIH0gZWxzZSB7Cj4gPiArICAgICAgICAgICAgICAgbXV0
ZXhfbG9jaygmdGV4dF9tdXRleCk7Cj4gPiArICAgICAgICAgICAgICAgcGF0Y2hfaW5zbl93cml0
ZShhZGRyLCAmaW5zbiwgc2l6ZW9mKGluc24pKTsKPiA+ICsgICAgICAgICAgICAgICBtdXRleF91
bmxvY2soJnRleHRfbXV0ZXgpOwo+ID4gKyAgICAgICB9Cj4gPgo+ID4gICAgICAgICByZXR1cm4g
dHJ1ZTsKPiA+ICB9Cj4gPiAtLQo+ID4gMi40MC4xCj4gPgo+Cj4KPiAtLQo+IEJlc3QgUmVnYXJk
cwo+ICBHdW8gUmVuCgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
