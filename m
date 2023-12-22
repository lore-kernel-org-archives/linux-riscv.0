Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D02C41535
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 10:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sOcqofgCthulp1pMO9FGit4iRkgqTi2qPayv1ZAl/r0=; b=r7Oz/ux+pya6WT
	ryMz+oZq/4Rtgcn6rfBmjGSzWuBmBkKBbMWDutBdZ7MVwj/FqXLRPeVo6BoDW6BQBZ73zbuVUJeFT
	uhkzBjI07MQ7cxwTjoznoSpCAykAbcQlOaIKYMigjiA6M5DMpL9dTdV6fEf7jee3uez/omf/GD4ph
	jz1r2qxgkL5sRqwOSoP/0WQQPSqOIEsRtnS9HK2pDv3C9wYfWwN6dVu1ey4nitfepObQlG+vNLV+E
	+IGNqBw2ef7H7I6KWlZpW2N1JhHqZa3yNsqSuEUH7kOPDQaQ2YeYJrWtoG0rcbNOaisqXURcgo21E
	pp2Jt/bIA1K6XeOaKVBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGdEa-005bNF-25;
	Fri, 22 Dec 2023 10:58:28 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGdEX-005bMb-2v
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 10:58:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5BEE5CE2102
	for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 10:58:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99D80C433CD
	for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 10:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703242702;
	bh=rx0yFkBMTzEKmeuPIJF0NkC0FcPPbYT0ES9Ktaas1Js=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=e/SgMjafWtX7oFyc+/Edvx1ULuDrXO8dELE7z49a9UZelCttdzwMhmHJBIFeBoXK+
	 WWUCWWpIsQF1EPh/t+KMFXopc7/icNBdG9oXYqtkK7UVG6/+PhXdmM3AEP1Ne6qhen
	 U7yYbDdIKnzZQ736MPs78UDq2F7WLh+56H8BeLaGNPm53TTKQG4Zc0KEVOkrnMaS74
	 7vcEM556eH3SRnQ0wuPYo+wDdsQdyPW5qv4N8HZw0ehLjJ+LECgcSfSfDSutjMP2C9
	 gqamLZWDDkBDXs23z+XERbm0WrHAJ0zo7wIKXKtv6LdUBHo9QMufho3zOwUNZFVOme
	 n9pGSY5WMAW5w==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-554546fb201so453150a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 02:58:22 -0800 (PST)
X-Gm-Message-State: AOJu0YyTlo/e3LaEzX/0yhFH0v5dNIHKIGDiXre1xao2pw7zmWEvTrNs
	S1esUUZ6fTNFab+NSH0yawVLsQrNKSk2NDo3t1g=
X-Google-Smtp-Source: AGHT+IElKKg9ui7lnL2gmCS7LtcXrm7B9npYlOycyGGC9DotVDc1J6zrzMmuubqPzV1joWM8riti1xMQhugUikKE/O0=
X-Received: by 2002:a05:6402:4410:b0:54a:f8e9:a9a8 with SMTP id
 y16-20020a056402441000b0054af8e9a9a8mr674023eda.20.1703242701023; Fri, 22 Dec
 2023 02:58:21 -0800 (PST)
MIME-Version: 1.0
References: <20231221154702.2267684-1-guoren@kernel.org> <20231221154702.2267684-2-guoren@kernel.org>
 <ZYTriK9hjOFQou9Z@LeoBras> <CAJF2gTT=EQzsuYMHr3FLb82Gi325PqWMEOAzfc6fg=go+gKP_g@mail.gmail.com>
 <ZYUHg3kIMYdNSOSr@ghost>
In-Reply-To: <ZYUHg3kIMYdNSOSr@ghost>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 22 Dec 2023 18:58:09 +0800
X-Gmail-Original-Message-ID: <CAJF2gTS-Mbhyygw-iWOE7Wj51iOfgnN43az-7yOko1dDU_mj1w@mail.gmail.com>
Message-ID: <CAJF2gTS-Mbhyygw-iWOE7Wj51iOfgnN43az-7yOko1dDU_mj1w@mail.gmail.com>
Subject: Re: [PATCH V2 1/4] riscv: mm: Fixup compat mode boot failure
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Leonardo Bras <leobras@redhat.com>, linux-kernel@vger.kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, alexghiti@rivosinc.com, 
	xiao.w.wang@intel.com, david@redhat.com, panqinglin2020@iscas.ac.cn, 
	rick.p.edgecombe@intel.com, willy@infradead.org, bjorn@rivosinc.com, 
	conor.dooley@microchip.com, cleger@rivosinc.com, 
	linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>, 
	stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_025826_415237_864FB5F8 
X-CRM114-Status: GOOD (  35.92  )
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

SGVsbG8gQ2hhcmxpZSwKCk9uIEZyaSwgRGVjIDIyLCAyMDIzIGF0IDExOjUw4oCvQU0gQ2hhcmxp
ZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIERlYyAy
MiwgMjAyMyBhdCAxMDo1NzoxNkFNICswODAwLCBHdW8gUmVuIHdyb3RlOgo+ID4gT24gRnJpLCBE
ZWMgMjIsIDIwMjMgYXQgOTo1MeKAr0FNIExlb25hcmRvIEJyYXMgPGxlb2JyYXNAcmVkaGF0LmNv
bT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEhlbGxvIEd1byBSZW4sCj4gPiA+Cj4gPiA+IE9uIFRodSwg
RGVjIDIxLCAyMDIzIGF0IDEwOjQ2OjU4QU0gLTA1MDAsIGd1b3JlbkBrZXJuZWwub3JnIHdyb3Rl
Ogo+ID4gPiA+IEZyb206IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KPiA+ID4g
Pgo+ID4gPiA+IEluIENPTVBBVCBtb2RlLCB0aGUgU1RBQ0tfVE9QIGlzIDB4ODAwMDAwMDAsIGJ1
dCB0aGUgVEFTS19TSVpFIGlzCj4gPiA+ID4gMHg3ZmZmMDAwLiBXaGVuIHRoZSB1c2VyIHN0YWNr
IGlzIHVwb24gMHg3ZmZmMDAwLCBpdCB3aWxsIGNhdXNlIGEgdXNlcgo+ID4gPiA+IHNlZ21lbnQg
ZmF1bHQuIFNvbWV0aW1lcywgaXQgd291bGQgY2F1c2UgYm9vdCBmYWlsdXJlIHdoZW4gdGhlIHdo
b2xlCj4gPiA+ID4gcm9vdGZzIGlzIHJ2MzIuCj4gPiA+Cj4gPiA+IENoZWNraW5nIGlmIEkgZ2V0
IHRoZSBzY2VuYXJpbzoKPiA+ID4KPiA+ID4gSW4gcGd0YWJsZS5oOgo+ID4gPiAjaWZkZWYgQ09O
RklHXzY0QklUCj4gPiA+ICNkZWZpbmUgVEFTS19TSVpFXzY0ICAgIChQR0RJUl9TSVpFICogUFRS
U19QRVJfUEdEIC8gMikKPiA+ID4gI2RlZmluZSBUQVNLX1NJWkVfTUlOICAgKFBHRElSX1NJWkVf
TDMgKiBQVFJTX1BFUl9QR0QgLyAyKQo+ID4gPgo+ID4gPiAjaWZkZWYgQ09ORklHX0NPTVBBVAo+
ID4gPiAjZGVmaW5lIFRBU0tfU0laRV8zMiAgICAoX0FDKDB4ODAwMDAwMDAsIFVMKSAtIFBBR0Vf
U0laRSkKPiA+ID4gI2RlZmluZSBUQVNLX1NJWkUgICAgICAgKHRlc3RfdGhyZWFkX2ZsYWcoVElG
XzMyQklUKSA/IFwKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgIFRBU0tfU0laRV8zMiA6
IFRBU0tfU0laRV82NCkKPiA+ID4gI2Vsc2UKPiA+ID4gWy4uLl0KPiA+ID4KPiA+ID4gTWVhbmlu
ZyBDT05GSUdfQ09NUEFUIGlzIG9ubHkgYXZhaWxhYmxlIGluIENPTkZJR182NEJJVCwgYW5kIFRB
U0tfU0laRSBpbgo+ID4gPiBjb21wYXQgbW9kZSBpcyBlaXRoZXIgVEFTS19TSVpFXzMyIG9yIFRB
U0tfU0laRV82NCBkZXBlbmRpbmcgb24gdGhlIHRocmVhZF9mbGFnLgo+ID4gPgo+ID4gPiBmcm9t
IHByb2Nlc3Nvci5oOgo+ID4gPiAjaWZkZWYgQ09ORklHXzY0QklUCj4gPiA+ICNkZWZpbmUgREVG
QVVMVF9NQVBfV0lORE9XICAgICAgKFVMKDEpIDw8IChNTUFQX1ZBX0JJVFMgLSAxKSkKPiA+ID4g
I2RlZmluZSBTVEFDS19UT1BfTUFYICAgICAgICAgICBUQVNLX1NJWkVfNjQKPiA+ID4gWy4uLl0K
PiA+ID4gI2RlZmluZSBTVEFDS19UT1AgICAgICAgICAgICAgICBERUZBVUxUX01BUF9XSU5ET1cK
PiA+ID4KPiA+ID4KPiA+ID4gd2hlcmU6Cj4gPiA+ICNkZWZpbmUgTU1BUF9WQV9CSVRTIChpc19j
b21wYXRfdGFzaygpID8gVkFfQklUU19TVjMyIDogTU1BUF9WQV9CSVRTXzY0KQo+ID4gPiB3aXRo
IE1NQVBfVkFfQklUU182NCBiZWluZyBlaXRoZXIgNDggb3IgMzcuCj4gPiA+Cj4gPiA+IEluIGNv
bXBhdCBtb2RlLAo+ID4gPiBTVEFDS19UT1AgPSAxIDw8ICgzMiAtIDEpICAgICAgIC0+IDB4ODAw
MDAwMDAKPiA+ID4gVEFTS19TSVpFID0gMHg4MDAwMDAwIC0gNGsgICAgICAtPiAweDdmZmZmMDAw
Cj4gPiA+Cj4gPiA+IElJVUMsIHlvdXIgc3VnZ2VzdGlvbiBpcyB0byBtYWtlIFRBU0tfU0laRSA9
IFNUQUNLX1RPUCBpbiBjb21wYXQgbW9kZSBvbmx5Lgo+ID4gWWVzLCBpdCBjYXVzZXMgdGhlIHBy
b2JsZW0sIHdoaWNoIGNhdXNlcyB0aGUgYm9vdCB0byBmYWlsLgo+Cj4gSSB0aGluayB3aGF0IExl
b25hcmRvIGlzIGdldHRpbmcgYXQgaXMgdGhhdCBpdCBpcyBvZGQgdGhhdCBpdCB3b3VsZAo+IGNh
dXNlIGJvb3QgaXNzdWVzIGlmIFRBU0tfU0laRSBpcyBub3QgZXF1YWwgU1RBQ0tfVE9QLiBUaGlz
IHNlZW1zCj4gaW5kaWNhdGl2ZSBvZiBhIGRpZmZlcmVudCBwcm9ibGVtLiBXaGlsZSB0aGlzIG1h
eSBmaXggdGhlIGlzc3VlLCBpdAo+IHNob3VsZCBiZSB2YWxpZCBmb3IgVEFTS19TSVpFIHRvIGJl
IGxlc3MgdGhhbiBTVEFDS19UT1AuClNvcnJ5LCBJIGRvbid0IG1ha2Ugc2Vuc2UgaGVyZS4gV2h5
IGRvIHlvdSB0aGluayBTVEFDS19UT1AgY291bGQgPiBUQVNLX1NJWkU/ClRBU0tfU0laRSBpcyB0
aGUgaGlnaGVzdCBwcmlvcml0eSBvZiB0aGUgYWRkcmVzcyBsaW1pdGF0aW9uIGZvcgp1c2VyLXNw
YWNlIGFkZHJlc3MsIHJpZ2h0PwoKRG8geW91IG1lYW46ClNUQUNLX1RPUCBjb3VsZCA+IE1NQVBf
RU5EPwoKPgo+IC0gQ2hhcmxpZQo+Cj4gPgo+ID4gPgo+ID4gPiBUaGVuIHdoeSBub3Q6Cj4gPiA+
ICNpZmRlZiBDT05GSUdfQ09NUEFUCj4gPiA+ICNkZWZpbmUgVEFTS19TSVpFXzMyICAgIFNUQUNL
X1RPUAo+ID4gWWVzLCBpdCdzIHRoZSBzb2x1dGlvbiB0aGF0IEkgdGhpbmsgYXQgZmlyc3QuIEJ1
dCBJIGRpZG4ndCBmaW5kIGFueQo+ID4gcHJvYmxlbSB3aXRoIDB4N2ZmZmYwMDAgfiAweDgwMDAw
MDAwLCBhbmQgdGhlbiBJIHJlbW92ZWQgdGhpcyBnYXAgdG8KPiA+IHVuaWZ5IGl0IHdpdGggU3Yz
OSBhbmQgU3Y0OC4KPiA+Cj4gPiA+Cj4gPiA+IFdpdGggc29tZSBjb21tZW50cyBleHBsYWluaW5n
IHdoeSB0aGVyZSBpcyBubyBuZWVkIHRvIHJlc2VydmUgYSBQQUdFX1NJWkUKPiA+ID4gaW4gdGhl
IFRBU0tfU0laRV8zMi4KPiA+IEF0IGZpcnN0LCBJIHdhbnRlZCB0byBwdXQgYSBpbnZhbGlkIHBh
Z2UgYmV0d2VlbiB0aGUgdXNlciAmIGtlcm5lbAo+ID4gc3BhY2UsIGJ1dCBpdCBzZWVtcyB1c2Vs
ZXNzLgo+ID4KPiA+ID4KPiA+ID4gRG9lcyB0aGF0IG1ha2Ugc2Vuc2U/Cj4gPiA+Cj4gPiA+IFRo
YW5rcyEKPiA+ID4gTGVvCj4gPiA+Cj4gPiA+ID4KPiA+ID4gPiBGcmVlaW5nIHVudXNlZCBrZXJu
ZWwgaW1hZ2UgKGluaXRtZW0pIG1lbW9yeTogMjIzNksKPiA+ID4gPiBSdW4gL3NiaW4vaW5pdCBh
cyBpbml0IHByb2Nlc3MKPiA+ID4gPiBTdGFydGluZyBpbml0OiAvc2Jpbi9pbml0IGV4aXN0cyBi
dXQgY291bGRuJ3QgZXhlY3V0ZSBpdCAoZXJyb3IgLTE0KQo+ID4gPiA+IFJ1biAvZXRjL2luaXQg
YXMgaW5pdCBwcm9jZXNzCj4gPiA+ID4gLi4uCj4gPiA+ID4KPiA+ID4gPiBDYzogc3RhYmxlQHZn
ZXIua2VybmVsLm9yZwo+ID4gPiA+IEZpeGVzOiBhZGQyY2M2YjY1MTUgKCJSSVNDLVY6IG1tOiBS
ZXN0cmljdCBhZGRyZXNzIHNwYWNlIGZvciBzdjM5LHN2NDgsc3Y1NyIpCj4gPiA+ID4gU2lnbmVk
LW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+ID4gPiA+IFNpZ25l
ZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgo+ID4gPiA+IC0tLQo+ID4gPiA+
ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaCB8IDIgKy0KPiA+ID4gPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPiA+ID4KPiA+ID4gPiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggYi9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+ID4gPiA+IGluZGV4IGFiMDAyMzViMDE4Zi4uNzRmZmIy
MTc4ZjU0IDEwMDY0NAo+ID4gPiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJs
ZS5oCj4gPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiA+ID4g
PiBAQCAtODgxLDcgKzg4MSw3IEBAIHN0YXRpYyBpbmxpbmUgcHRlX3QgcHRlX3N3cF9jbGVhcl9l
eGNsdXNpdmUocHRlX3QgcHRlKQo+ID4gPiA+ICAjZGVmaW5lIFRBU0tfU0laRV9NSU4gICAgICAg
IChQR0RJUl9TSVpFX0wzICogUFRSU19QRVJfUEdEIC8gMikKPiA+ID4gPgo+ID4gPiA+ICAjaWZk
ZWYgQ09ORklHX0NPTVBBVAo+ID4gPiA+IC0jZGVmaW5lIFRBU0tfU0laRV8zMiAoX0FDKDB4ODAw
MDAwMDAsIFVMKSAtIFBBR0VfU0laRSkKPiA+ID4gPiArI2RlZmluZSBUQVNLX1NJWkVfMzIgKF9B
QygweDgwMDAwMDAwLCBVTCkpCj4gPiA+Cj4gPiA+Cj4gPiA+Cj4gPiA+Cj4gPiA+ID4gICNkZWZp
bmUgVEFTS19TSVpFICAgICh0ZXN0X3RocmVhZF9mbGFnKFRJRl8zMkJJVCkgPyBcCj4gPiA+ID4g
ICAgICAgICAgICAgICAgICAgICAgICBUQVNLX1NJWkVfMzIgOiBUQVNLX1NJWkVfNjQpCj4gPiA+
ID4gICNlbHNlCj4gPiA+ID4gLS0KPiA+ID4gPiAyLjQwLjEKPiA+ID4gPgo+ID4gPgo+ID4KPiA+
Cj4gPiAtLQo+ID4gQmVzdCBSZWdhcmRzCj4gPiAgR3VvIFJlbgoKCgotLSAKQmVzdCBSZWdhcmRz
CiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
