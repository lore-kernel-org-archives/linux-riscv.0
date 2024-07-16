Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20958C3DA59
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jul 2024 08:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gHPCD8v7tVQTw9np9+Zr2Hv1qB06wQ68ze/p4ar5A2Y=; b=COpd19O+x4nAw+
	dM/vuqj0C6BJHaYbaUOKr+R+tFsiYz648ip5gPo7FY2GQclfn36QZOszomQBuAmnIqJnsjDL3Vige
	vvaSh0Niit+eC+wDQyoikOXRaZbM5SMdX1m+wpDmRTuebKuBu5NHW2ImehhEDgcQcK2I2dcrVJpkK
	JqTcnLGkeS94+jLbGDods8tzABuirMEGQJbdn/hjKi48G9C+xWLafY6ntZqiB7HsvUjStdZ22KWFI
	sizyPXKu0SI2m+mCevBhVJcT+i68zM4kRcdFf61TnXy+DGHGrjiE0fTSa6/7Vd2m/XJYoF/qTkbCg
	Xj5uX6sOMmnwNpm/l6XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTdb1-00000009jgr-3Y4W;
	Tue, 16 Jul 2024 08:31:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTdaz-00000009jfj-0865
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jul 2024 08:31:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 659E260B89
	for <linux-riscv@lists.infradead.org>; Tue, 16 Jul 2024 08:31:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1604AC116B1
	for <linux-riscv@lists.infradead.org>; Tue, 16 Jul 2024 08:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721118696;
	bh=2kz+oo4hvXnKaRt5/hsLQHWOz+6APQEp0QYjh31yuQw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AZGyLnFTUSndoi1qq1vTC86m17H3N0Ata4QJ7QsM8alCuSaiVb+pHGrSKqxIEgn2C
	 M6BNQjylV8CG5PBVEkVOmabBrIEvekvJl6oVsbCRtnwSubT6Hphze/dBLi0ZSCpaQg
	 rUNqVlzaWXrYFV8oEfC6705OQPbVBp1GmpXM5F5IjQ7c9uEjHGXiRWEEMnE5W2TV7q
	 /OXvZkBaLDQlBgypt5bYmbPv6TnmzKdJJD9MQgeuogjeOwT/kq90TZ9FIs8WjQ2o8A
	 iKiwlnliEU1yjOyCjuhkFgLEOgbWzEjHDOurI2yb5GlbR4hxYeGr7J1jAuGCVJ8dSi
	 QR9b0EPiDI9jA==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a77c2d89af8so587982866b.2
        for <linux-riscv@lists.infradead.org>; Tue, 16 Jul 2024 01:31:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXZpdCqw1ZLV68g2uzipwT/hiHwaW+9LoNHBMzF+1clGhoRVEr6F4SLX4pwqu0EpXBf5oYhyGTXyBqpijv+l+eD4n5VO4ARqgp8YuTTi0xY
X-Gm-Message-State: AOJu0YzqZSahtdLMXMpXL0Px7vfh0X2W01KslCy2ZKhTZquL0dnKyIyk
	VRFSfnTkdihGiIe2ReGVsZ2ZEb+sWvZc12FUm16OQpbSU6WewpmfBRUd3AeTAHTQMkUnqHOGUUn
	C02DZ0DwU2HXKU/KiqO1awxNNKOc=
X-Google-Smtp-Source: AGHT+IENmfFJO4NtBiyFIS7wDT+ResmSXEAvfaBWCMxivVTmQOzvNuWjmQb6hEDeD8CCrbTlhkCAiDs7OZdyZsj1qSQ=
X-Received: by 2002:a17:906:37d6:b0:a6f:12:8c45 with SMTP id
 a640c23a62f3a-a79eaa856a1mr80302366b.72.1721118694537; Tue, 16 Jul 2024
 01:31:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240626130347.520750-1-alexghiti@rivosinc.com>
 <20240626130347.520750-11-alexghiti@rivosinc.com> <CAJF2gTSG7HzV7mgZpkWLbSBNn2dRv_NaSmCimd+kRdU=EZrmmg@mail.gmail.com>
 <CAHVXubizLq=qZgVQ2vBFe5zVuLRP0DGw=UN4U_Wkx2P2xsP3Mw@mail.gmail.com>
 <a096151c-c349-455f-8939-3b739d73f016@redhat.com> <CAJF2gTRrZwVk2xyhF_PsJGKCfkvun-rifG8MjDBcGDt3YBuhPg@mail.gmail.com>
 <CAHVXubh00OyazGP2C6sg0N2=kWqV-HXpzEiZCDdex8hcmLEM2g@mail.gmail.com>
In-Reply-To: <CAHVXubh00OyazGP2C6sg0N2=kWqV-HXpzEiZCDdex8hcmLEM2g@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 16 Jul 2024 16:31:23 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRpXBS-YotgEO=cPGnwjYiUyda_wk_fQfA6j_QqdYHoQw@mail.gmail.com>
Message-ID: <CAJF2gTRpXBS-YotgEO=cPGnwjYiUyda_wk_fQfA6j_QqdYHoQw@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] riscv: Add qspinlock support based on Zabha extension
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Waiman Long <longman@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrea Parri <parri.andrea@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Leonardo Bras <leobras@redhat.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_013137_194997_193ADCCD 
X-CRM114-Status: GOOD (  37.09  )
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

T24gVHVlLCBKdWwgMTYsIDIwMjQgYXQgMjo0M+KAr1BNIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdo
aXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBIaSBHdW8sIFdhaW1hbiwKPgo+IE9uIFR1ZSwg
SnVsIDE2LCAyMDI0IGF0IDM6MDXigK9BTSBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4gd3Jv
dGU6Cj4gPgo+ID4gT24gVHVlLCBKdWwgMTYsIDIwMjQgYXQgMzozMOKAr0FNIFdhaW1hbiBMb25n
IDxsb25nbWFuQHJlZGhhdC5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiA3LzE1LzI0IDAzOjI3
LCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4gPiA+ID4gSGkgR3VvLAo+ID4gPiA+Cj4gPiA+ID4g
T24gU3VuLCBKdWwgNywgMjAyNCBhdCA0OjIw4oCvQU0gR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5v
cmc+IHdyb3RlOgo+ID4gPiA+PiBPbiBXZWQsIEp1biAyNiwgMjAyNCBhdCA5OjE04oCvUE0gQWxl
eGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3cm90ZToKPiA+ID4gPj4+IElu
IG9yZGVyIHRvIHByb2R1Y2UgYSBnZW5lcmljIGtlcm5lbCwgYSB1c2VyIGNhbiBzZWxlY3QKPiA+
ID4gPj4+IENPTkZJR19DT01CT19TUElOTE9DS1Mgd2hpY2ggd2lsbCBmYWxsYmFjayBhdCBydW50
aW1lIHRvIHRoZSB0aWNrZXQKPiA+ID4gPj4+IHNwaW5sb2NrIGltcGxlbWVudGF0aW9uIGlmIFph
YmhhIGlzIG5vdCBwcmVzZW50Lgo+ID4gPiA+Pj4KPiA+ID4gPj4+IE5vdGUgdGhhdCB3ZSBjYW4n
dCB1c2UgYWx0ZXJuYXRpdmVzIGhlcmUgYmVjYXVzZSB0aGUgZGlzY292ZXJ5IG9mCj4gPiA+ID4+
PiBleHRlbnNpb25zIGlzIGRvbmUgdG9vIGxhdGUgYW5kIHdlIG5lZWQgdG8gc3RhcnQgd2l0aCB0
aGUgcXNwaW5sb2NrCj4gPiA+ID4+IFRoYXQncyBub3QgdHJ1ZTsgd2UgdHJlYXQgc3BpbmxvY2sg
YXMgcXNwaW5sb2NrIGF0IGZpcnN0Lgo+ID4gPiA+IFRoYXQncyB3aGF0IEkgc2FpZDogd2UgaGF2
ZSB0byB1c2UgdGhlIHFzcGlubG9jayBpbXBsZW1lbnRhdGlvbiBhdAo+ID4gPiA+IGZpcnN0ICpi
ZWNhdXNlKiB3ZSBjYW4ndCBkaXNjb3ZlciB0aGUgZXh0ZW5zaW9ucyBzb29uIGVub3VnaCB0byB1
c2UKPiA+ID4gPiB0aGUgcmlnaHQgc3BpbmxvY2sgaW1wbGVtZW50YXRpb24gYmVmb3JlIHRoZSBr
ZXJuZWwgdXNlcyBhIHNwaW5sb2NrLgo+ID4gPiA+IEFuZCBzaW5jZSB0aGUgc3BpbmxvY2tzIGFy
ZSB1c2VkICpiZWZvcmUqIHRoZSBkaXNjb3Zlcnkgb2YgdGhlCj4gPiA+ID4gZXh0ZW5zaW9ucywg
d2UgY2Fubm90IHVzZSB0aGUgY3VycmVudCBhbHRlcm5hdGl2ZSBtZWNoYW5pc20gb3Igd2UnZAo+
ID4gPiA+IG5lZWQgdG8gZXh0ZW5kIGl0IHRvIGFkZCBhbiAiaW5pdGlhbCIgdmFsdWUgd2hpY2gg
ZG9lcyBub3QgZGVwZW5kIG9uCj4gPiA+ID4gdGhlIGF2YWlsYWJsZSBleHRlbnNpb25zLgo+ID4g
Pgo+ID4gPiBXaXRoIHFzcGlubG9jaywgdGhlIGxvY2sgcmVtYWlucyB6ZXJvIGFmdGVyIGEgbG9j
ay91bmxvY2sgc2VxdWVuY2UuIFRoYXQKPiA+ID4gaXMgbm90IHRoZSBjYXNlIHdpdGggdGlja2V0
IGxvY2suIEFzc3VtaW5nIHRoYXQgYWxsIHRoZSBkaXNjb3Zlcnkgd2lsbAo+ID4gPiBiZSBkb25l
IGJlZm9yZSBTTVAgYm9vdCwgdGhlIHFzcGlubG9jayBzbG93cGF0aCB3b24ndCBiZSBhY3RpdmF0
ZWQgYW5kCj4gPiA+IHNvIHdlIGRvbid0IG5lZWQgdGhlIHByZXNlbmNlIG9mIGFueSBleHRlbnNp
b24uIEkgYmVsaWV2ZSB0aGF0IGlzIHRoZQo+ID4gPiBtYWluIHJlYXNvbiB3aHkgcXNwaW5sb2Nr
IGlzIHVzZWQgYXMgdGhlIGluaXRpYWwgZGVmYXVsdCBhbmQgbm90IHRpY2tldAo+ID4gPiBsb2Nr
Lgo+ID4gVGh4IFdhaW1hbiwKPiA+IFllcywgcXNwaW5sb2NrIGlzIGEgY2xlYW4gZ3V5LCBidXQg
dGlja2V0IGxvY2sgaXMgYSBkaXJ0eSBvbmUuCj4KPiBHdXlzLCB3ZSBhbGwgYWdyZWUgb24gdGhh
dCwgdGhhdCdzIHdoeSBJIGtlcHQgdGhpcyBiZWhhdmlvdXIgaW4gdGhpcyBwYXRjaHNldC4KPgo+
ID4KPiA+IEhpIEFsZXhhbmRyZSwKPiA+IFRoZXJlZm9yZSwgdGhlIHN3aXRjaCBwb2ludChiZWZv
cmUgcmVzZXRfaW5pdCgpKSBpcyBsYXRlIGVub3VnaCB0bwo+ID4gY2hhbmdlIHRoZSBsb2NrIG1l
Y2hhbmlzbSwgYW5kIHRoaXMgc2F0aXNmaWVzIHRoZSByZXF1aXJlbWVudHMgb2YKPiA+IGFwcGx5
X2Jvb3RfYWx0ZXJuYXRpdmVzKCksIGFwcGx5X2Vhcmx5X2Jvb3RfYWx0ZXJuYXRpdmVzKCksIGFu
ZAo+ID4gYXBwbHlfbW9kdWxlX2FsdGVybmF0aXZlcygpLgo+Cj4gSSBjYW4ndCBmaW5kIHJlc2V0
X2luaXQoKS4KU29ycnkgZm9yIHRoZSB0eXBvLCByZXN0X2luaXQoKQo+Cj4gVGhlIGRpc2NvdmVy
eSBvZiB0aGUgZXh0ZW5zaW9ucyBpcyBkb25lIGluIHJpc2N2X2ZpbGxfaHdjYXAoKSBjYWxsZWQK
PiBmcm9tIHNldHVwX2FyY2goKQo+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xh
dGVzdC9zb3VyY2UvYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYyNMMjg4Lgo+IFNvICpiZWZvcmUq
IHRoaXMgcG9pbnQsIHdlIGhhdmUgbm8ga25vd2xlZGdlIG9mIHRoZSBhdmFpbGFibGUKPiBleHRl
bnNpb25zIG9uIHRoZSBwbGF0Zm9ybS4gIExldCdzIGltYWdpbmUgbm93IHRoYXQgd2UgdXNlIGFu
Cj4gYWx0ZXJuYXRpdmUgZm9yIHRoZSBxc3BpbmxvY2sgaW1wbGVtZW50YXRpb24sIGl0IHdpbGwg
bG9vayBsaWtlIHRoaXMKPiAoSSB1c2Ugb25seSB6YWJoYSBoZXJlLCB0aGF0J3MgYW4gZXhhbXBs
ZSk6Cj4KPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NwaW5sb2NrLmgKPiArKysgYi9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NwaW5sb2NrLmgKPiBAQCAtMTYsOCArMTYsMTIgQEAgREVD
TEFSRV9TVEFUSUNfS0VZX1RSVUUocXNwaW5sb2NrX2tleSk7Cj4gICNkZWZpbmUgU1BJTkxPQ0tf
QkFTRV9ERUNMQVJFKG9wLCB0eXBlLCB0eXBlX2xvY2spICAgICAgICAgICAgICAgICAgICAgXAo+
ICBzdGF0aWMgX19hbHdheXNfaW5saW5lIHR5cGUgYXJjaF9zcGluXyMjb3AodHlwZV9sb2NrIGxv
Y2spICAgICAgICAgICAgIFwKPiAgeyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gLSAgICAgICBpZiAoc3RhdGlj
X2JyYW5jaF91bmxpa2VseSgmcXNwaW5sb2NrX2tleSkpICAgICAgICAgICAgICAgICAgICAgXAo+
IC0gICAgICAgICAgICAgICByZXR1cm4gcXVldWVkX3NwaW5fIyNvcChsb2NrKTsgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwKPiArICAgICAgIGFzbSBnb3RvKEFMVEVSTkFUSVZFKCJqICVbbm9f
emFiaGFdIiwgIm5vcCIsIDAsICAgICAgICAgICAgICAgICBcCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBSSVNDVl9JU0FfRVhUX1pBQkhBLCAxKSAgICAgICAgICAgIFwK
PiArICAgICAgICAgICAgICAgICAgICAgICAgIDogOiA6IDogbm9femFiaGEpOyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAgcmV0dXJuIHF1
ZXVlZF9zcGluXyMjb3AobG9jayk7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwK
PiArbm9femFiaGE6ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcCj4gICAgICAgICByZXR1cm4gdGlja2V0X3NwaW5fIyNvcChsb2Nr
KTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICB9Cj4KPiBhcHBseV9lYXJs
eV9ib290X2FsdGVybmF0aXZlcygpIGNhbid0IGJlIHVzZWQgdG8gcGF0Y2ggdGhlIGFib3ZlCj4g
YWx0ZXJuYXRpdmUgc2luY2UgaXQgaXMgY2FsbGVkIGZyb20gc2V0dXBfdm0oKSwgd2F5IGJlZm9y
ZSB3ZSBrbm93IHRoZQo+IGF2YWlsYWJsZSBleHRlbnNpb25zLgo+IGFwcGx5X2Jvb3RfYWx0ZXJu
YXRpdmVzKCksIGluc3RlYWQsIGlzIGNhbGxlZCBhZnRlciByaXNjdl9maWxsX2h3Y2FwKCkKPiBh
bmQgdGhlbiB3aWxsIGJlIGFibGUgdG8gcGF0Y2ggdGhlIGFsdGVybmF0aXZlcyBjb3JyZWN0bHkK
PiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRlc3Qvc291cmNlL2FyY2gvcmlz
Y3Yva2VybmVsL3NldHVwLmMjTDI5MC4KPgo+IEJ1dCB0aGVuLCBiZWZvcmUgYXBwbHlfYm9vdF9h
bHRlcm5hdGl2ZXMoKSwgYW55IHVzZSBvZiBhIHNwaW5sb2NrCj4gKHByaW50ayBkb2VzIHNvKSB3
aWxsIHVzZSBhIHRpY2tldCBzcGlubG9jayBpbXBsZW1lbnRhdGlvbiwgYW5kIG5vdAo+IHRoZSBx
c3BpbmxvY2sgaW1wbGVtZW50YXRpb24uIEhvdyBkbyB5b3UgZml4IHRoYXQ/CldoeSAiYmVmb3Jl
IGFwcGx5X2Jvb3RfYWx0ZXJuYXRpdmVzKCksIGFueSB1c2Ugb2YgYSBzcGlubG9jayAocHJpbnRr
CmRvZXMgc28pIHdpbGwgdXNlIGEgdGlja2V0IHNwaW5sb2NrIGltcGxlbWVudGF0aW9uIiA/Cldl
IHRyZWF0IHFzcGlubG9jayBhcyB0aGUgaW5pdGlhbCBzcGlubG9jayBmb3JldmVyLCBzbyB0aGVy
ZSBpcyBvbmx5CnFzcGlubG9jayAtPiB0aWNrZXRfbG9jayBkaXJlY3Rpb24gYW5kIG5vIHJldmVy
c2UuCgo+Cj4gPgo+ID4gPgo+ID4gPiBDaGVlcnMsCj4gPiA+IExvbmdtYW4KPiA+ID4KPiA+Cj4g
Pgo+ID4gLS0KPiA+IEJlc3QgUmVnYXJkcwo+ID4gIEd1byBSZW4KCgoKLS0gCkJlc3QgUmVnYXJk
cwogR3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
