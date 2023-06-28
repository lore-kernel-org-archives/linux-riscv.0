Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2128CEB64DC
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 17:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b7sJfJzlrVug/2ENexIth+DnOSGsoHm6v3l1eRVWX0E=; b=2qeuYSH7dsKTGV
	OHyEOiNUNA7ZuA2sH5g6eYnD5rxT1Vm9sbBIxdX8zaG8dYE4QHF2oSd621st3d18cTuy+hwcdvJ3B
	RHTSzKxx3ReTYxnTBWxcabeO68lZVboKvzxwQLaT+L7nA1AJV9/1oEC/I0hIPzUqJeQK9hLiKZTdO
	t2EsEZsQoo5Gc/l1E4L+jKiSfAkWNHh49zd9US21lzTmdeyb7wKHz89gVc38cPhamXa7XSm4/1uqC
	C2XySRwrUwE0fvpzDUjcJfh/3YQ2qYnYSu43lOJ+sHL1+j3lM5Tg7a74/uMZODFB3r9NwmjBogYqE
	M+vafkS3E4tjLubZSMtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEYZv-00GEQ2-17;
	Wed, 28 Jun 2023 17:03:39 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEYZr-00GEOX-0P
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jun 2023 17:03:37 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f95bf5c493so8447820e87.3
        for <linux-riscv@lists.infradead.org>; Wed, 28 Jun 2023 10:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1687971811; x=1690563811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1fGniKrnRVqiskki+vMFs5QmWoxWcrUy88Xnd4dtv6E=;
        b=UVR8HYdK9gFstICmY4hAkepr0QKxMKfOXwIhsNDGim9/jjneMNoGUKuh3t5n7laOBp
         98wea9zROg8nb/7ZIrwfNifWqxofTMNzvvd0NQDsxf5rGU3Iz0FwyQ8THq3cLB79bRmt
         jIeRJhjwn8Yn9BwkKcX6v9sKJ1ggN+WO/SEh4oDq/2ZleU+of05aCoazBHAgI0nCPOVb
         fyiAAjRcdMdX46BfAWosXPvHaLIDJz1wbqO5Ye5W9vwoU9KUXjQXm0qT9JQGWe5d3lpE
         6lTH94fx+GY7QDRXBFFs6agFadAmy1GMr/OueUfknMBIY6659OlXC7eF9w3SlP16RU70
         rXMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687971811; x=1690563811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1fGniKrnRVqiskki+vMFs5QmWoxWcrUy88Xnd4dtv6E=;
        b=M+kLunxD2FU+27Nz6oCqpds45BVY/7pKIGr1t9UXkZ+fNoMPKvmxnll2n9xguC2M/P
         rxckiaAeZfRM61uwsGdtj6zNLbCN4rZ+t3DNni5V2zHi8EWAdWnwBY6MyLjG7kZc5vxL
         YXhsIsYGj54zXUVG0YW9+FNttMYTTbcEnGwIQMEFFqmDbqVGlHWaiV2U8fCNvPwCg/R3
         Xns7B84OcY/t234pH+3mANxxpYUysqCNFUY8m7jjKFmFu12F8hk2ucKsMNAdefXbxFKP
         emESgz99zueZ/9ew9a45JD3Fek2jjK8shpcJUbIIWMbiBaAHt4edpn86dTJ3Xb5ivVDZ
         UqdQ==
X-Gm-Message-State: AC+VfDznOmu4hDqf4F6CJonbs2h8vY1cxAAX7yrnW+doYlxphZMU9Aen
	CNNgpXL+hWBoN1lWmnfam6lkJXfwUY2gaxgrt9iNpw==
X-Google-Smtp-Source: ACHHUZ5J1P85vLM25PblVSGE1F5G9PmOIFlymdbV93aCEGjSE0olGYNnab2Irx0SdIHbinxXdEqWJZdBltfet/iGYLo=
X-Received: by 2002:a05:6512:3ec:b0:4fa:fc12:2bdd with SMTP id
 n12-20020a05651203ec00b004fafc122bddmr6092614lfq.40.1687971811374; Wed, 28
 Jun 2023 10:03:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230626165736.65927-1-bjorn@kernel.org> <CABgGipWUO6bXQQzMCXxpkv4MYTpH3MUtPHUVe-=VhsZk3HPNMg@mail.gmail.com>
 <87tturnabk.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87tturnabk.fsf@all.your.base.are.belong.to.us>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Thu, 29 Jun 2023 01:03:19 +0800
Message-ID: <CABgGipUFPv0TOWdz_3LofARZ0DH6H2sSzxBD0t=h2-YhmzC2OQ@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: Discard vector state on syscalls
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	linux-kernel@vger.kernel.org, linux@rivosinc.com, 
	Palmer Dabbelt <palmer@rivosinc.com>, =?UTF-8?Q?R=C3=A9mi_Denis=2DCourmont?= <remi@remlab.net>, 
	Darius Rad <darius@bluespec.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_100335_199049_AD9D5504 
X-CRM114-Status: GOOD (  35.44  )
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

T24gV2VkLCBKdW4gMjgsIDIwMjMgYXQgNjozNeKAr1BNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gQW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4gd3Jp
dGVzOgo+Cj4gPiBPbiBUdWUsIEp1biAyNywgMjAyMyBhdCAxMjo1N+KAr0FNIEJqw7ZybiBUw7Zw
ZWwgPGJqb3JuQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4+Cj4gPj4gRnJvbTogQmrDtnJuIFTDtnBl
bCA8Ympvcm5Acml2b3NpbmMuY29tPgo+ID4+Cj4gPj4gVGhlIFJJU0MtViB2ZWN0b3Igc3BlY2lm
aWNhdGlvbiBzdGF0ZXM6Cj4gPj4gICBFeGVjdXRpbmcgYSBzeXN0ZW0gY2FsbCBjYXVzZXMgYWxs
IGNhbGxlci1zYXZlZCB2ZWN0b3IgcmVnaXN0ZXJzCj4gPj4gICAodjAtdjMxLCB2bCwgdnR5cGUp
IGFuZCB2c3RhcnQgdG8gYmVjb21lIHVuc3BlY2lmaWVkLgo+ID4+Cj4gPj4gVGhlIHZlY3RvciBy
ZWdpc3RlcnMgYXJlIHNldCB0byBhbGwgMXMsIHZpbGwgaXMgc2V0IChpbnZhbGlkKSwgYW5kIHRo
ZQo+ID4+IHZlY3RvciBzdGF0dXMgaXMgc2V0IHRvIEluaXRpYWwuCj4gPj4KPiA+PiBUaGF0IHdh
eSB3ZSBjYW4gcHJldmVudCB1c2Vyc3BhY2UgZnJvbSBhY2NpZGVudGFsbHkgcmVseWluZyBvbiB0
aGUKPiA+PiBzdGF0ZWQgc2F2ZS4KPiA+Pgo+ID4+IFLDqW1pIHBvaW50ZWQgb3V0IFsxXSB0aGF0
IHdyaXRpbmcgdG8gdGhlIHJlZ2lzdGVycyBtaWdodCBiZQo+ID4+IHN1cGVyZmx1b3VzLCBhbmQg
c2V0dGluZyB2aWxsIGlzIHN1ZmZpY2llbnQuCj4gPj4KPiA+PiBMaW5rOiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9saW51eC1yaXNjdi8xMjc4NDMyNi45VVBQSzNNQWVCQGJhc2lsZS5yZW1sYWIu
bmV0LyAjIFsxXQo+ID4+IFN1Z2dlc3RlZC1ieTogRGFyaXVzIFJhZCA8ZGFyaXVzQGJsdWVzcGVj
LmNvbT4KPiA+PiBTdWdnZXN0ZWQtYnk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMu
Y29tPgo+ID4+IFN1Z2dlc3RlZC1ieTogUsOpbWkgRGVuaXMtQ291cm1vbnQgPHJlbWlAcmVtbGFi
Lm5ldD4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5j
b20+Cj4gPj4gLS0tCj4gPj4gdjEtPnYyOgo+ID4+ICAgUHJvcGVyIHJlZ2lzdGVyIHJlc3RvcmUg
Zm9yIGluaXRpYWwgc3RhdGUgKEFuZHkpCj4gPj4gICBTZXQgcmVnaXN0ZXJzIHRvIDFzLCBhbmQg
bm90IDBzIChEYXJpdXMpCj4gPj4gLS0tCj4gPj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmVj
dG9yLmggfCA0MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0KPiA+PiAgYXJjaC9y
aXNjdi9rZXJuZWwvdHJhcHMuYyAgICAgICB8ICAyICsrCj4gPj4gIDIgZmlsZXMgY2hhbmdlZCwg
NDEgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92
ZWN0b3IuaAo+ID4+IGluZGV4IDA0YzBiMDdiZjZjZC4uOTNkNzAyZDk5ODhjIDEwMDY0NAo+ID4+
IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmVjdG9yLmgKPiA+PiArKysgYi9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5oCj4gPj4gQEAgLTEzOSwxNCArMTM5LDQ5IEBAIHN0YXRp
YyBpbmxpbmUgdm9pZCByaXNjdl92X3ZzdGF0ZV9zYXZlKHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFz
aywKPiA+PiAgICAgICAgIH0KPiA+PiAgfQo+ID4+Cj4gPj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBf
X3Jpc2N2X3ZfdnN0YXRlX2Rpc2NhcmQodm9pZCkKPiA+PiArewo+ID4+ICsgICAgICAgdW5zaWdu
ZWQgbG9uZyB2bCwgdnR5cGVfaW52YWwgPSAxVUwgPDwgKEJJVFNfUEVSX0xPTkcgLSAxKTsKPiA+
PiArCj4gPj4gKyAgICAgICByaXNjdl92X2VuYWJsZSgpOwo+ID4+ICsgICAgICAgYXNtIHZvbGF0
aWxlICgKPiA+PiArICAgICAgICAgICAgICAgIi5vcHRpb24gcHVzaFxuXHQiCj4gPj4gKyAgICAg
ICAgICAgICAgICIub3B0aW9uIGFyY2gsICt2XG5cdCIKPiA+PiArICAgICAgICAgICAgICAgInZz
ZXR2bGkgICAgICAgICUwLCB4MCwgZTgsIG04LCB0YSwgbWFcblx0Igo+ID4+ICsgICAgICAgICAg
ICAgICAidm12LnYuaSAgICAgICAgdjAsIC0xXG5cdCIKPiA+PiArICAgICAgICAgICAgICAgInZt
di52LmkgICAgICAgIHY4LCAtMVxuXHQiCj4gPj4gKyAgICAgICAgICAgICAgICJ2bXYudi5pICAg
ICAgICB2MTYsIC0xXG5cdCIKPiA+PiArICAgICAgICAgICAgICAgInZtdi52LmkgICAgICAgIHYy
NCwgLTFcblx0Igo+ID4+ICsgICAgICAgICAgICAgICAidnNldHZsICAgICAgICAgJTAsIHgwLCAl
MVxuXHQiCj4gPj4gKyAgICAgICAgICAgICAgICIub3B0aW9uIHBvcFxuXHQiCj4gPj4gKyAgICAg
ICAgICAgICAgIDogIj0mciIgKHZsKSA6ICJyIiAodnR5cGVfaW52YWwpIDogIm1lbW9yeSIpOwo+
ID4+ICsgICAgICAgcmlzY3Zfdl9kaXNhYmxlKCk7Cj4gPj4gK30KPiA+PiArCj4gPj4gK3N0YXRp
YyBpbmxpbmUgdm9pZCByaXNjdl92X3ZzdGF0ZV9kaXNjYXJkKHN0cnVjdCBwdF9yZWdzICpyZWdz
KQo+ID4+ICt7Cj4gPj4gKyAgICAgICBpZiAoIXJpc2N2X3ZfdnN0YXRlX3F1ZXJ5KHJlZ3MpKQo+
ID4+ICsgICAgICAgICAgICAgICByZXR1cm47Cj4gPj4gKwo+ID4+ICsgICAgICAgX19yaXNjdl92
X3ZzdGF0ZV9kaXNjYXJkKCk7Cj4gPj4gKyAgICAgICByaXNjdl92X3ZzdGF0ZV9vbihyZWdzKTsK
PiA+PiArfQo+ID4+ICsKPiA+PiAgc3RhdGljIGlubGluZSB2b2lkIHJpc2N2X3ZfdnN0YXRlX3Jl
c3RvcmUoc3RydWN0IHRhc2tfc3RydWN0ICp0YXNrLAo+ID4+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+ID4+ICB7Cj4gPj4g
LSAgICAgICBpZiAoKHJlZ3MtPnN0YXR1cyAmIFNSX1ZTKSAhPSBTUl9WU19PRkYpIHsKPiA+PiAt
ICAgICAgICAgICAgICAgc3RydWN0IF9fcmlzY3Zfdl9leHRfc3RhdGUgKnZzdGF0ZSA9ICZ0YXNr
LT50aHJlYWQudnN0YXRlOwo+ID4+IC0KPiA+PiArICAgICAgIHN0cnVjdCBfX3Jpc2N2X3ZfZXh0
X3N0YXRlICp2c3RhdGUgPSAmdGFzay0+dGhyZWFkLnZzdGF0ZTsKPiA+PiArICAgICAgIHVuc2ln
bmVkIGxvbmcgc3RhdHVzID0gcmVncy0+c3RhdHVzICYgU1JfVlM7Cj4gPj4gKwo+ID4+ICsgICAg
ICAgc3dpdGNoIChzdGF0dXMpIHsKPiA+PiArICAgICAgIGNhc2UgU1JfVlNfSU5JVElBTDoKPiA+
PiArICAgICAgICAgICAgICAgX19yaXNjdl92X3ZzdGF0ZV9kaXNjYXJkKCk7Cj4gPj4gKyAgICAg
ICAgICAgICAgIGJyZWFrOwo+ID4+ICsgICAgICAgY2FzZSBTUl9WU19DTEVBTjoKPiA+PiArICAg
ICAgIGNhc2UgU1JfVlNfRElSVFk6Cj4gPj4gICAgICAgICAgICAgICAgIF9fcmlzY3Zfdl92c3Rh
dGVfcmVzdG9yZSh2c3RhdGUsIHZzdGF0ZS0+ZGF0YXApOwo+ID4+ICAgICAgICAgICAgICAgICBf
X3Jpc2N2X3ZfdnN0YXRlX2NsZWFuKHJlZ3MpOwo+ID4+ICsgICAgICAgICAgICAgICBicmVhazsK
PiA+PiAgICAgICAgIH0KPiA+PiAgfQo+ID4+Cj4gPj4gQEAgLTE3OCw2ICsyMTMsNyBAQCBzdGF0
aWMgaW5saW5lIGJvb2wgcmlzY3Zfdl92c3RhdGVfY3RybF91c2VyX2FsbG93ZWQodm9pZCkgeyBy
ZXR1cm4gZmFsc2U7IH0KPiA+PiAgI2RlZmluZSBfX3N3aXRjaF90b192ZWN0b3IoX19wcmV2LCBf
X25leHQpICAgICBkbyB7fSB3aGlsZSAoMCkKPiA+PiAgI2RlZmluZSByaXNjdl92X3ZzdGF0ZV9v
ZmYocmVncykgICAgICAgICAgICAgICBkbyB7fSB3aGlsZSAoMCkKPiA+PiAgI2RlZmluZSByaXNj
dl92X3ZzdGF0ZV9vbihyZWdzKSAgICAgICAgICAgICAgICAgICAgICAgIGRvIHt9IHdoaWxlICgw
KQo+ID4+ICsjZGVmaW5lIHJpc2N2X3ZfdnN0YXRlX2Rpc2NhcmQocmVncykgICAgICAgICAgIGRv
IHt9IHdoaWxlICgwKQo+ID4+Cj4gPj4gICNlbmRpZiAvKiBDT05GSUdfUklTQ1ZfSVNBX1YgKi8K
PiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jIGIvYXJjaC9y
aXNjdi9rZXJuZWwvdHJhcHMuYwo+ID4+IGluZGV4IDUxNTg5NjFlYTk3Ny4uNWZmNjNhNzg0YTZk
IDEwMDY0NAo+ID4+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKPiA+PiArKysgYi9h
cmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4gPj4gQEAgLTI5Niw2ICsyOTYsOCBAQCBhc21saW5r
YWdlIF9fdmlzaWJsZSBfX3RyYXBfc2VjdGlvbiB2b2lkIGRvX3RyYXBfZWNhbGxfdShzdHJ1Y3Qg
cHRfcmVncyAqcmVncykKPiA+PiAgICAgICAgICAgICAgICAgcmVncy0+ZXBjICs9IDQ7Cj4gPj4g
ICAgICAgICAgICAgICAgIHJlZ3MtPm9yaWdfYTAgPSByZWdzLT5hMDsKPiA+Pgo+ID4+ICsgICAg
ICAgICAgICAgICByaXNjdl92X3ZzdGF0ZV9kaXNjYXJkKHJlZ3MpOwo+ID4+ICsKPiA+PiAgICAg
ICAgICAgICAgICAgc3lzY2FsbCA9IHN5c2NhbGxfZW50ZXJfZnJvbV91c2VyX21vZGUocmVncywg
c3lzY2FsbCk7Cj4gPj4KPiA+PiAgICAgICAgICAgICAgICAgaWYgKHN5c2NhbGwgPCBOUl9zeXNj
YWxscykKPiA+Pgo+ID4+IGJhc2UtY29tbWl0OiA0ODg4MzNjY2RjYWMxMThkYTE2NzAxZjRlZTA2
NzNiMjBiYTQ3ZmUzCj4gPj4gLS0KPiA+PiAyLjM5LjIKPiA+Pgo+ID4KPiA+IEhpLCB0aGUgYWJv
dmUgcGFydCBsb29rcyBnb29kIHRvIG1lLiBJbiB0aGUgY29udGV4dCBvZiBrZXJuZWwtbW9kZQo+
ID4gdmVjdG9yLCBpdCB3b3VsZCBhbHNvIGJlIGdvb2QgdG8ganVzdCBkaXNjYXJkIFYtY29udGV4
dCBhdCB0aGUgc3lzY2FsbAo+ID4gZW50cnkuIFNvIHRoZSBrZXJuZWwgY2FuIGZyZWVseSB1c2Ug
VmVjdG9yIGlmIG5lZWRlZC4gSSB3aWxsIHJlYmFzZSBteQo+ID4gd29yayBvbiB0b3Agb2YgeW91
cnMuCj4KPiBPayEKPgo+ID4gQW5vdGhlciBwYXJ0IHRoYXQganVzdCBjYW1lIGludG8gbXkgbWlu
ZCBpcyB0aGUgb25lIGZvciBwdHJhY2UuIERvIHdlCj4gPiBuZWVkIHRvIGRpc2FsbG93LCBvciBp
bW1lZGlhdGVseSByZXR1cm4gYWxsIC0xIGlmIHRoZSB0cmFjZWUgcHJvY2Vzcwo+ID4gaXMgaW4g
dGhlIHN5c2NhbGwgcGF0aD8gSXQgc2VlbXMgdGhhdCB3ZSBhcmUgbGlrZWx5IHRvIGdldCBzdGFs
ZQo+ID4gdmFsdWVzIG9uIGRhdGFwIGlmIGEgdHJhY2VlIGlzIGJlaW5nIHRyYWNlZCBkdXJpbmcg
YSBzeXNjYWxsLgo+Cj4gSG1tLCBjb3VsZCB5b3UgZWxhYm9yYXRlIGEgYml0IG9uIHdoZW4gdGhl
IHRyYWNlciB3b3VsZCBnZXQgc3RhbGUgcmVncz8KClllcCwgY29uc2lkZXIgdGhhdCBvdXIgdHJh
Y2VyIHByb2Nlc3MgYXR0YWNoZXMgdG8gYSB0cmFjZWUgd2l0aApQVFJBQ0VfU1lTQ0FMTC4gVGhl
biwgdGhlIHRyYWNlZSB3aWxsIGxldCB0aGUgdHJhY2VyIHRvIGluc3BlY3QgaXQKd2hlbmV2ZXIg
aXQgbWFrZXMgYSBzeXNjYWxsLiBUaGUgdHJhY2VyIHdhbnRzIHRvIGluc3BlY3QgVi1yZWdpc3Rl
cnMKYXQgdGhlc2UgUFRSQUNFX1NZU0NBTEwgc3RvcHMuIEFzc3VtZSB0aGUgdHJhY2VlIGNvbnRl
eHQgc3dpdGNoZXMgb3V0CmJlZm9yZSBiZWluZyBpbnNwZWN0ZWQgKFNhZGx5IEkgZGlkbid0IGZp
bmQgdGhpcyBwYXJ0IGluIHRoZSBjb2RlLCBzbwptYXliZSBJIHdhcyB3cm9uZykuIE5vdywgd2Ug
c2V0IGFsbCBWLXJlZ3MgdG8gLTEgYW5kIFZTIHRvICdPbicKZW50ZXJpbmcgYSBzeXNjYWxsLiBI
b3dldmVyLCAtMSB3aWxsIG5vdCBiZSBzYXZlZCBpbnRvIGRhdGFwLCB3aGljaAp0aGUgdHJhY2Vy
IGNvcGllcyBmcm9tLCBiZWNhdXNlIHJpc2N2X3ZfdnN0YXRlX3NhdmUoKSBvbmx5IHNhdmVzCndo
ZW5ldmVyIFZTIGlzICdEaXJ0eScuIFdlIGludGVudGlvbmFsbHkgd2FudCB0aGlzIGJlY2F1c2Ug
aXQgc2F2ZXMKdW5uZWNlc3NhcnkgY29udGV4dCBzYXZlcy4gQXMgYSByZXN1bHQsIHdoYXQgd2Ug
d2lsbCBnZXQgd2l0aCBSRUdTRVRfVgp3aWxsIG5vdCByZWZsZWN0IHRoZSBsYXRlc3Qgb25lLCBh
bmQgd2hhdCB3ZSBzZXQgd2lsbCBnZXQgbG9zdCBzaW5jZQpWUz0nT04nIHJlc3RvcmVzIFYgdG8g
LTEuCgpTaW5jZSB3ZSBhcmUgcGxhbm5pbmcgdG8gZGlzY2FyZCBWIHJlZ2lzdGVycyBvbiBzeXNj
YWxsLCBkb2VzIGl0IG1ha2UKc2Vuc2UgdG8gYWxzbyBtYWtlIHB0cmFjZSBhd2FyZSBvZiB0aGlz
PyBPciwganVzdCBsZWF2ZSBpdCBhcy1pdApiZWNhdXNlIHJlYWRpbmcvd3JpdGluZyBWIHJlZ2lz
dGVyIGF0IHN5c2NhbGwgaXMgbm90IG1lYW5pbmdmdWwKYWxyZWFkeS4KClRoYW5rcywKQW5keQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
