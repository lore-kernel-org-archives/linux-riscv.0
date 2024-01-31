Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47171C47258
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 14:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=44ueLfFR9zjJ5E+Vrc7ybeooNBCiu6cikHU+BS+3IwE=; b=jbgAcwQIHdDR6qsIfVn9fU93k0
	KZj//8PBs/ix7fDbkH3Ao6l8CKzJpv2aA0HOQzI9V/zIwl9O8GooT7X5V1hZqUvsuPBD+Lp796tt8
	I0+QNjWoLeqYWXcGDC7IbYcygp+4YDKLOIeg91LNBMxd/S+wIEJw0MiHzkCu+R3m0Ko0br+4IHR1M
	sbRCamKykW2awhMmoac58Zgtj5k6gN5LnDocEuGefgob+Vs5bob8esie/FnX3pc1c8vLnjK4Egl5E
	iAkWAbimCEJ3Vx+uhbpLn5uZDX5UhnkMmi6bCK742SSyMnPB6WCT1gonSnAGXe3DNdZmOBAsQccR4
	f9yoTxIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVBWc-00000003sLo-23m8;
	Wed, 31 Jan 2024 14:25:14 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVBWZ-00000003sJq-3FaT
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 14:25:13 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-36376bf7f6dso12270605ab.3
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jan 2024 06:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1706711109; x=1707315909; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TCdqXoIsPm+7CCFBVcWTPm9olbyUcfWHTxGQ4zGSJS8=;
        b=mZbWUqcry+GIGwAHFNvvzI3mX3Bj5SOdT205X+6yhwJ1eqtDGSaDwEEQdeMESWoBwR
         JeOoTELYgMJfC2XhXILJITaR3ztpjBDTcuo+xu6oHUN4pBIMkw1PUWoahNOx3F+rRUQu
         QKJm6805wvjRC/JgIXlZ6GBAOKAJqVmyOwXxxNtp6vuVe3SUuDkzDdJlVSN7tQDEP3f9
         CtyOHlPb17o3Zts3EDJqWKv+JHR01rKapbXlVJrLdryGDG+zUtUJPArky4/lcquoCmlZ
         3IoqxdplY05qe1wN5buWTN/F45NOswDZaw0kyqqwqAg6JBP0diQU1qG19aZgP7+VJtX5
         UekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706711109; x=1707315909;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TCdqXoIsPm+7CCFBVcWTPm9olbyUcfWHTxGQ4zGSJS8=;
        b=YxNxI5fEN2khJWVddOg9qlxQbpkX+MOFkvhnLjgmQT9hytXh4zYAlFKS4ctEmgD45X
         0zksY18K/NI80wkCYPJSARUTW4IDCdlw4NJeAyGgNR161s6M1NHrr7Qi8LkqTKRLH0vA
         dXnK0WXHlApd7314Bje397u97dnktRBP8tq6GZKi4MXRi8M7O+vvwFe2vLvR/c/kqQEs
         Py1r8nTr0IwtfmIoLzGVBffqgMyfxDil26FkvgMz1mqBJwLUVB76n+ywHxftYlOdWVYd
         7GQm0eIGfBtmTaHpZ5lTMb2AJhPekidGs+k1BO3S4F5541dAhc7eA3f94UzA+odqHfgc
         9/+A==
X-Gm-Message-State: AOJu0Yx4L4EO2x0hpdGHipzUviRlProK0UINYU2fSIxRfhzfhRbMFN4u
	xHEJRFBOMS7WZB0mxBiiT+XYAksh2CLwHx6o5iOncFiqCJNRJI2v3ODWdd25NjbLCRqTrcxURVz
	GyJ2YLF4Impb4IbfCgfIT2Q8ExOuzwGvYUafjmA==
X-Google-Smtp-Source: AGHT+IFH2VtYLytH0SW5zTMxqRdyp3vZvC0Z3Ml7WZCuG3APx8Od85SOTNHygIXjIoIiqe7jBFaHe1NY51yyBpEX4cs=
X-Received: by 2002:a05:6e02:50b:b0:363:800b:3fe0 with SMTP id
 d11-20020a056e02050b00b00363800b3fe0mr1882367ils.8.1706711109572; Wed, 31 Jan
 2024 06:25:09 -0800 (PST)
MIME-Version: 1.0
References: <20231205085959.32177-1-zong.li@sifive.com> <CANXhq0r6A48q+ehayaURLO6snDEjzVJO6Ti+1we-57i0ORT9yg@mail.gmail.com>
 <CANXhq0qqv3MBEt8zsWBT+gkdyt1PD4ZjDSrznEotdFM7M7K+yQ@mail.gmail.com> <CANXhq0qNA5JO1xZLbuL6ig1Ddws0m2azMwCyqLFgN3B0VZmvEw@mail.gmail.com>
In-Reply-To: <CANXhq0qNA5JO1xZLbuL6ig1Ddws0m2azMwCyqLFgN3B0VZmvEw@mail.gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Wed, 31 Jan 2024 22:24:58 +0800
Message-ID: <CANXhq0o-MaEQY3m+0CNWK2Jv_pxqsjhhSJWtVR396wgKUzcbQw@mail.gmail.com>
Subject: Re: [PATCH] riscv: add CALLER_ADDRx support
To: palmer@dabbelt.com, Palmer Dabbelt <palmer@rivosinc.com>, paul.walmsley@sifive.com, 
	aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_062511_864143_E7FDACA1 
X-CRM114-Status: GOOD (  36.32  )
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

T24gVGh1LCBKYW4gMTgsIDIwMjQgYXQgODo1MOKAr0FNIFpvbmcgTGkgPHpvbmcubGlAc2lmaXZl
LmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIEphbiAxMCwgMjAyNCBhdCAxMTozM+KAr0FNIFpvbmcg
TGkgPHpvbmcubGlAc2lmaXZlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gRnJpLCBEZWMgMjksIDIw
MjMgYXQgMjozNOKAr1BNIFpvbmcgTGkgPHpvbmcubGlAc2lmaXZlLmNvbT4gd3JvdGU6Cj4gPiA+
Cj4gPiA+IE9uIFR1ZSwgRGVjIDUsIDIwMjMgYXQgNTowMOKAr1BNIFpvbmcgTGkgPHpvbmcubGlA
c2lmaXZlLmNvbT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBDQUxMRVJfQUREUnggcmV0dXJucyBj
YWxsZXIncyBhZGRyZXNzIGF0IHNwZWNpZmllZCBsZXZlbCwgdGhleSBhcmUgdXNlZAo+ID4gPiA+
IGZvciBzZXZlcmFsIHRyYWNlcnMuIFRoZXNlIG1hY3JvcyBldmVudHVhbGx5IHVzZQo+ID4gPiA+
IF9fYnVpbHRpbl9yZXR1cm5fYWRkcmVzcyhuKSB0byBnZXQgdGhlIGNhbGxlcidzIGFkZHJlc3Mg
aWYgYXJjaCBkb2Vzbid0Cj4gPiA+ID4gZGVmaW5lIHRoZWlyIG93biBpbXBsZW1lbnRhdGlvbi4K
PiA+ID4gPgo+ID4gPiA+IEluIFJJU0MtViwgX19idWlsdGluX3JldHVybl9hZGRyZXNzKG4pIG9u
bHkgd29ya3Mgd2hlbiBuID09IDAsIHdlIG5lZWQKPiA+ID4gPiB0byB3YWxrIHRoZSBzdGFjayBm
cmFtZSB0byBnZXQgdGhlIGNhbGxlcidzIGFkZHJlc3MgYXQgc3BlY2lmaWVkIGxldmVsLgo+ID4g
PiA+Cj4gPiA+ID4gZGF0YS5sZXZlbCBzdGFydGVkIGZyb20gJ2xldmVsICsgMycgZHVlIHRvIHRo
ZSBjYWxsIGZsb3cgb2YgZ2V0dGluZwo+ID4gPiA+IGNhbGxlcidzIGFkZHJlc3MgaW4gUklTQy1W
IGltcGxlbWVudGF0aW9uLiBJZiB3ZSBkb24ndCBoYXZlIGFkZGl0aW9uYWwKPiA+ID4gPiB0aHJl
ZSBpdGVyYXRpb24sIHRoZSBsZXZlbCBpcyBjb3JyZXNwb25kaW5nIHRvIGZvbGxvd3M6Cj4gPiA+
ID4KPiA+ID4gPiBjYWxsc2l0ZSAtPiByZXR1cm5fYWRkcmVzcyAtPiBhcmNoX3N0YWNrX3dhbGsg
LT4gd2Fsa19zdGFja2ZyYW1lCj4gPiA+ID4gfCAgICAgICAgICAgfCAgICAgICAgICAgICAgICAg
fCAgICAgICAgICAgICAgICAgIHwKPiA+ID4gPiBsZXZlbCAzICAgICBsZXZlbCAyICAgICAgICAg
ICBsZXZlbCAxICAgICAgICAgICAgbGV2ZWwgMAo+ID4gPiA+Cj4gPiA+ID4gU2lnbmVkLW9mZi1i
eTogWm9uZyBMaSA8em9uZy5saUBzaWZpdmUuY29tPgo+ID4gPiA+IC0tLQo+ID4gPiA+ICBhcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2Z0cmFjZS5oICAgIHwgIDUgKysrKwo+ID4gPiA+ICBhcmNoL3Jp
c2N2L2tlcm5lbC9NYWtlZmlsZSAgICAgICAgIHwgIDIgKysKPiA+ID4gPiAgYXJjaC9yaXNjdi9r
ZXJuZWwvcmV0dXJuX2FkZHJlc3MuYyB8IDQ4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Kwo+ID4gPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDU1IGluc2VydGlvbnMoKykKPiA+ID4gPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3Yva2VybmVsL3JldHVybl9hZGRyZXNzLmMKPiA+ID4g
Pgo+ID4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Z0cmFjZS5oIGIv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9mdHJhY2UuaAo+ID4gPiA+IGluZGV4IDJiMmY1ZGY3ZWYy
Yy4uNDI3NzdmOTFhOWM1IDEwMDY0NAo+ID4gPiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vZnRyYWNlLmgKPiA+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Z0cmFjZS5o
Cj4gPiA+ID4gQEAgLTI1LDYgKzI1LDExIEBACj4gPiA+ID4KPiA+ID4gPiAgI2RlZmluZSBBUkNI
X1NVUFBPUlRTX0ZUUkFDRV9PUFMgMQo+ID4gPiA+ICAjaWZuZGVmIF9fQVNTRU1CTFlfXwo+ID4g
PiA+ICsKPiA+ID4gPiArZXh0ZXJuIHZvaWQgKnJldHVybl9hZGRyZXNzKHVuc2lnbmVkIGludCBs
ZXZlbCk7Cj4gPiA+ID4gKwo+ID4gPiA+ICsjZGVmaW5lIGZ0cmFjZV9yZXR1cm5fYWRkcmVzcyhu
KSByZXR1cm5fYWRkcmVzcyhuKQo+ID4gPiA+ICsKPiA+ID4gPiAgdm9pZCBNQ09VTlRfTkFNRSh2
b2lkKTsKPiA+ID4gPiAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIGZ0cmFjZV9jYWxsX2Fk
anVzdCh1bnNpZ25lZCBsb25nIGFkZHIpCj4gPiA+ID4gIHsKPiA+ID4gPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9rZXJuZWwvTWFrZWZpbGUgYi9hcmNoL3Jpc2N2L2tlcm5lbC9NYWtlZmlsZQo+
ID4gPiA+IGluZGV4IGZlZTIyYTNkMWI1My4uNDBkMDU0OTM5YWUyIDEwMDY0NAo+ID4gPiA+IC0t
LSBhL2FyY2gvcmlzY3Yva2VybmVsL01ha2VmaWxlCj4gPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9r
ZXJuZWwvTWFrZWZpbGUKPiA+ID4gPiBAQCAtNyw2ICs3LDcgQEAgaWZkZWYgQ09ORklHX0ZUUkFD
RQo+ID4gPiA+ICBDRkxBR1NfUkVNT1ZFX2Z0cmFjZS5vID0gJChDQ19GTEFHU19GVFJBQ0UpCj4g
PiA+ID4gIENGTEFHU19SRU1PVkVfcGF0Y2gubyAgPSAkKENDX0ZMQUdTX0ZUUkFDRSkKPiA+ID4g
PiAgQ0ZMQUdTX1JFTU9WRV9zYmkubyAgICA9ICQoQ0NfRkxBR1NfRlRSQUNFKQo+ID4gPiA+ICtD
RkxBR1NfUkVNT1ZFX3JldHVybl9hZGRyZXNzLm8gPSAkKENDX0ZMQUdTX0ZUUkFDRSkKPiA+ID4g
PiAgZW5kaWYKPiA+ID4gPiAgQ0ZMQUdTX3N5c2NhbGxfdGFibGUubyArPSAkKGNhbGwgY2Mtb3B0
aW9uLC1Xbm8tb3ZlcnJpZGUtaW5pdCwpCj4gPiA+ID4gIENGTEFHU19jb21wYXRfc3lzY2FsbF90
YWJsZS5vICs9ICQoY2FsbCBjYy1vcHRpb24sLVduby1vdmVycmlkZS1pbml0LCkKPiA+ID4gPiBA
QCAtNDYsNiArNDcsNyBAQCBvYmoteSArPSBpcnEubwo+ID4gPiA+ICBvYmoteSAgKz0gcHJvY2Vz
cy5vCj4gPiA+ID4gIG9iai15ICArPSBwdHJhY2Uubwo+ID4gPiA+ICBvYmoteSAgKz0gcmVzZXQu
bwo+ID4gPiA+ICtvYmoteSAgKz0gcmV0dXJuX2FkZHJlc3Mubwo+ID4gPiA+ICBvYmoteSAgKz0g
c2V0dXAubwo+ID4gPiA+ICBvYmoteSAgKz0gc2lnbmFsLm8KPiA+ID4gPiAgb2JqLXkgICs9IHN5
c2NhbGxfdGFibGUubwo+ID4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9yZXR1
cm5fYWRkcmVzcy5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvcmV0dXJuX2FkZHJlc3MuYwo+ID4gPiA+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiA+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi5jMjAwOGQ0
YWE2ZTUKPiA+ID4gPiAtLS0gL2Rldi9udWxsCj4gPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJu
ZWwvcmV0dXJuX2FkZHJlc3MuYwo+ID4gPiA+IEBAIC0wLDAgKzEsNDggQEAKPiA+ID4gPiArLy8g
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQo+ID4gPiA+ICsvKgo+ID4gPiA+
ICsgKiBUaGlzIGNvZGUgY29tZSBmcm9tIGFyY2gvYXJtNjQva2VybmVsL3JldHVybl9hZGRyZXNz
LmMKPiA+ID4gPiArICoKPiA+ID4gPiArICogQ29weXJpZ2h0IChDKSAyMDIzIFNpRml2ZS4KPiA+
ID4gPiArICovCj4gPiA+ID4gKwo+ID4gPiA+ICsjaW5jbHVkZSA8bGludXgvZXhwb3J0Lmg+Cj4g
PiA+ID4gKyNpbmNsdWRlIDxsaW51eC9rcHJvYmVzLmg+Cj4gPiA+ID4gKyNpbmNsdWRlIDxsaW51
eC9zdGFja3RyYWNlLmg+Cj4gPiA+ID4gKwo+ID4gPiA+ICtzdHJ1Y3QgcmV0dXJuX2FkZHJlc3Nf
ZGF0YSB7Cj4gPiA+ID4gKyAgICAgICB1bnNpZ25lZCBpbnQgbGV2ZWw7Cj4gPiA+ID4gKyAgICAg
ICB2b2lkICphZGRyOwo+ID4gPiA+ICt9Owo+ID4gPiA+ICsKPiA+ID4gPiArc3RhdGljIGJvb2wg
c2F2ZV9yZXR1cm5fYWRkcih2b2lkICpkLCB1bnNpZ25lZCBsb25nIHBjKQo+ID4gPiA+ICt7Cj4g
PiA+ID4gKyAgICAgICBzdHJ1Y3QgcmV0dXJuX2FkZHJlc3NfZGF0YSAqZGF0YSA9IGQ7Cj4gPiA+
ID4gKwo+ID4gPiA+ICsgICAgICAgaWYgKCFkYXRhLT5sZXZlbCkgewo+ID4gPiA+ICsgICAgICAg
ICAgICAgICBkYXRhLT5hZGRyID0gKHZvaWQgKilwYzsKPiA+ID4gPiArICAgICAgICAgICAgICAg
cmV0dXJuIGZhbHNlOwo+ID4gPiA+ICsgICAgICAgfQo+ID4gPiA+ICsKPiA+ID4gPiArICAgICAg
IC0tZGF0YS0+bGV2ZWw7Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAgICAgcmV0dXJuIHRydWU7Cj4g
PiA+ID4gK30KPiA+ID4gPiArTk9LUFJPQkVfU1lNQk9MKHNhdmVfcmV0dXJuX2FkZHIpOwo+ID4g
PiA+ICsKPiA+ID4gPiArdm9pZCAqcmV0dXJuX2FkZHJlc3ModW5zaWduZWQgaW50IGxldmVsKQo+
ID4gPiA+ICt7Cj4gPiA+ID4gKyAgICAgICBzdHJ1Y3QgcmV0dXJuX2FkZHJlc3NfZGF0YSBkYXRh
Owo+ID4gPiA+ICsKPiA+ID4gPiArICAgICAgIGRhdGEubGV2ZWwgPSBsZXZlbCArIDM7Cj4gPiA+
ID4gKyAgICAgICBkYXRhLmFkZHIgPSBOVUxMOwo+ID4gPiA+ICsKPiA+ID4gPiArICAgICAgIGFy
Y2hfc3RhY2tfd2FsayhzYXZlX3JldHVybl9hZGRyLCAmZGF0YSwgY3VycmVudCwgTlVMTCk7Cj4g
PiA+ID4gKwo+ID4gPiA+ICsgICAgICAgaWYgKCFkYXRhLmxldmVsKQo+ID4gPiA+ICsgICAgICAg
ICAgICAgICByZXR1cm4gZGF0YS5hZGRyOwo+ID4gPiA+ICsgICAgICAgZWxzZQo+ID4gPiA+ICsg
ICAgICAgICAgICAgICByZXR1cm4gTlVMTDsKPiA+ID4gPiArCj4gPiA+ID4gK30KPiA+ID4gPiAr
RVhQT1JUX1NZTUJPTF9HUEwocmV0dXJuX2FkZHJlc3MpOwo+ID4gPiA+ICtOT0tQUk9CRV9TWU1C
T0wocmV0dXJuX2FkZHJlc3MpOwo+ID4gPiA+IC0tCj4gPiA+ID4gMi4xNy4xCj4gPiA+ID4KPiA+
ID4KPiA+ID4gSGkgUGFsbWVyIGFuZCBhbGwsCj4gPiA+IEkgd2FzIHdvbmRlcmluZyB3aGV0aGVy
IHRoaXMgcGF0Y2ggaXMgZ29vZCBmb3IgZXZlcnlvbmU/IFRoYW5rcwo+ID4KPiA+IEhpIFBhbG1l
ciwKPiA+IElzIHRoZXJlIGFueSBjaGFuY2UgdG8gaW5jbHVkZSB0aGlzIHBhdGNoIGluIDYuOC1y
YzE/IFRoYW5rcwo+Cj4gSGkgUGFsbWVyLAo+IEknbSBub3Qgc3VyZSBpZiB0aGlzIHBhdGNoIGlz
IGEgZmVhdHVyZSBvciBidWcgZml4LCB3b3VsZCB5b3UgY29uc2lkZXIKPiBpdCBmb3IgNi44LXJj
WD8gVGhhbmtzCgpIaSBQYWxtZXIsClNvcnJ5IGZvciBwaW5naW5nIHlvdSBhZ2Fpbi4gSSdtIG5v
dCBzdXJlIGlmIHlvdSBzYXcgdGhpcyBwYXRjaC4gVGhlCmlycXNvZmYgYW5kIHdha2V1cCB0cmFj
ZXIgd2lsbCB1c2UgQ0FMTEVSX0FERFIxIGFuZCBDQUxMRVJfQUREUjIgdG8Kb2J0YWluIHRoZSBj
YWxsZXIncyByZXR1cm4gYWRkcmVzcywgYnV0IHdlIGFyZSBjdXJyZW50bHkgZW5jb3VudGVyaW5n
CmFuIGlzc3VlIGluIHRoZSBSSVNDLVYgcG9ydCB3aGVyZSB0aGUgd3JvbmcgY2FsbGVyIGlzIGlk
ZW50aWZpZWQuIEkKZ3Vlc3MgeW91IGNhbiBlYXNpbHkgcmVwcm9kdWNlIHRoZSBzaXR1YXRpb24g
dXNpbmcgZnRyYWNlLiBDb3VsZCB5b3UKc2hhcmUgeW91ciB0aG91Z2h0cyBvbiB0aGlzIHdoZW4g
eW91IGhhdmUgdGhlIHRpbWUgdG8gdGFrZSBhIGxvb2s/ClRoYW5rcwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
