Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FA8C61D85
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 10:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sTmKkZ0j+xOg24WGOkxcTNIpblBYXaOLJRVecQGTroA=; b=TWVzJ6DJr6W7BP
	/EynvB1dmUDfCWt6CJmAJDkb988tup4z31tjOc8Y2IY93Ycpl86iLiAmq5ZHCw88lra1MX/oCE2M5
	1lyHUA38wGKdmFjmRsHv3t3l9GEP8JqcSY/ip4RvZN4rChyd1Lpq2o03r6x4RWoErlkBxELTESb+T
	aZLrKE30mCa0qwddlkRFB3wp+EO6zKsGf/10rP/90p2JEA9NGci3oiDFHAwUm+rbRo9xl2Ma+piAt
	IiX8NXguZlJVJpoelMQ3X/MJG8YIaSN8kU5ZzjGYMZNweyd5l0L4Q3uZ4yzEVvK1Edn/feSGlkB9U
	agnw0fxaMPnAvRg1ALMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r67BT-004Pm0-0W;
	Thu, 23 Nov 2023 10:43:47 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r67BP-004Pku-3A
	for linux-riscv@lists.infradead.org;
	Thu, 23 Nov 2023 10:43:45 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6c33ab26dddso639349b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 23 Nov 2023 02:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1700736222; x=1701341022; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6sXx1tqGc4gio/QqB9Zb7ckRSF4i2cZOS4lFJoNm/Vo=;
        b=Ub/vsK2mOzAsDZBgjpr2pW/PUkkT0s+0FfmdetfDQUZXoLwoKJMhW+LwNDAmaPS2q5
         4zUvD9JBe/rbs2nlJgW/ImPUYkW63YCRsw0IRkwte7bCFi21Pc09ZFiiaQBmw052gzBD
         DgbHJgNcQ0qqG24lsqVKhHH3SuSEQ8MD8CLdNy6aRXakViJaC1BLd1i5nWNYp311B8mJ
         vx0Wpm4S7dModvKP9EVS6FFZCI6cymQY+LQpGz356+7+YlNJEI0WcJpFh1Zk1JOodIEz
         x353iqPMsWiq91Pb7gMybxdFsWZvaFX7/sLjR94pEgiBgdUWBcWdkVFK51sMy549tPLk
         1Wnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700736222; x=1701341022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6sXx1tqGc4gio/QqB9Zb7ckRSF4i2cZOS4lFJoNm/Vo=;
        b=r+ocaaBRHVVUO49svNAMbKjkDYZm2YMXW414Q/8nzuX4Vs+YS9giRCRMlKDRTsGHIV
         KBPHerrFi5+73COHgJZKpDEvo771qqxCx+JIeLH5fQVn3dEADk4Cu1UyRmG5sZ2ERcGg
         lPeJNruK3KMo71DcRruQTXOReZ9/oujPi+y2XudwNQlj0SncZ16A7ozwiWk036h/xdc7
         +96AL3oQxl4OaIJ/B7LtMk/sXgmq0C1bO1GRGV1tVEodpUC46YvSpn70BATxocwLkLra
         37jeim8dSZ1OA6WDOFjYzDtjue+Np8DuXazEfIVGq8B6239cpWi9u36eOWHWgDXbsu78
         BEAw==
X-Gm-Message-State: AOJu0Yz6SBf6pYBl/D9rHLPh6q9UzsRCIi6/d8GYN/t+gOPdmFQAcOnr
	DWI1Quf4OsTsNdY4zrlbjYYqypo1l1MwL0Hpkk4eGQ==
X-Google-Smtp-Source: AGHT+IGQemXED5MdhPDs8hDtb2L/rF6Iac2SFIvvm1TlJvtt3KBDFlw9g5du469cf44grjodKd7ZU/U/xKDe/AsrzAY=
X-Received: by 2002:a05:6a21:9982:b0:189:11e8:6237 with SMTP id
 ve2-20020a056a21998200b0018911e86237mr5725421pzb.51.1700736221598; Thu, 23
 Nov 2023 02:43:41 -0800 (PST)
MIME-Version: 1.0
References: <20231118033859.726692-1-apatel@ventanamicro.com>
 <20231118033859.726692-4-apatel@ventanamicro.com> <8c0f4eba-1923-4686-b07b-1f3b78b298e9@sifive.com>
In-Reply-To: <8c0f4eba-1923-4686-b07b-1f3b78b298e9@sifive.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 23 Nov 2023 16:13:29 +0530
Message-ID: <CAK9=C2U7gD2DC+zTGvSb+6uhmA=Y-nL2Mpn8tbp8R81g_6ruEA@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] tty/serial: Add RISC-V SBI debug console based earlycon
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Conor Dooley <conor@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_024344_021473_594F263F 
X-CRM114-Status: GOOD (  23.29  )
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

T24gV2VkLCBOb3YgMjIsIDIwMjMgYXQgNDoxMeKAr0FNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IEhpIEFudXAsCj4KPiBPbiAyMDIzLTExLTE3
IDk6MzggUE0sIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiBXZSBleHRlbmQgdGhlIGV4aXN0aW5nIFJJ
U0MtViBTQkkgZWFybHljb24gc3VwcG9ydCB0byB1c2UgdGhlIG5ldwo+ID4gUklTQy1WIFNCSSBk
ZWJ1ZyBjb25zb2xlIGV4dGVuc2lvbi4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbnVwIFBhdGVs
IDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBBbmRyZXcgSm9uZXMg
PGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy90dHkvc2VyaWFs
L0tjb25maWcgICAgICAgICAgICAgIHwgIDIgKy0KPiA+ICBkcml2ZXJzL3R0eS9zZXJpYWwvZWFy
bHljb24tcmlzY3Ytc2JpLmMgfCAyNCArKysrKysrKysrKysrKysrKysrKy0tLS0KPiA+ICAyIGZp
bGVzIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvdHR5L3NlcmlhbC9LY29uZmlnIGIvZHJpdmVycy90dHkvc2VyaWFs
L0tjb25maWcKPiA+IGluZGV4IDczMmM4OTNjOGQxNi4uMWYyNTk0YjhhYjlkIDEwMDY0NAo+ID4g
LS0tIGEvZHJpdmVycy90dHkvc2VyaWFsL0tjb25maWcKPiA+ICsrKyBiL2RyaXZlcnMvdHR5L3Nl
cmlhbC9LY29uZmlnCj4gPiBAQCAtODcsNyArODcsNyBAQCBjb25maWcgU0VSSUFMX0VBUkxZQ09O
X1NFTUlIT1NUCj4gPgo+ID4gIGNvbmZpZyBTRVJJQUxfRUFSTFlDT05fUklTQ1ZfU0JJCj4gPiAg
ICAgICBib29sICJFYXJseSBjb25zb2xlIHVzaW5nIFJJU0MtViBTQkkiCj4gPiAtICAgICBkZXBl
bmRzIG9uIFJJU0NWX1NCSV9WMDEKPiA+ICsgICAgIGRlcGVuZHMgb24gUklTQ1ZfU0JJCj4gPiAg
ICAgICBzZWxlY3QgU0VSSUFMX0NPUkUKPiA+ICAgICAgIHNlbGVjdCBTRVJJQUxfQ09SRV9DT05T
T0xFCj4gPiAgICAgICBzZWxlY3QgU0VSSUFMX0VBUkxZQ09OCj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy90dHkvc2VyaWFsL2Vhcmx5Y29uLXJpc2N2LXNiaS5jIGIvZHJpdmVycy90dHkvc2VyaWFs
L2Vhcmx5Y29uLXJpc2N2LXNiaS5jCj4gPiBpbmRleCAyN2FmYjBiNzRlYTcuLjUzNTFlMWUzMWY0
NSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvdHR5L3NlcmlhbC9lYXJseWNvbi1yaXNjdi1zYmku
Ywo+ID4gKysrIGIvZHJpdmVycy90dHkvc2VyaWFsL2Vhcmx5Y29uLXJpc2N2LXNiaS5jCj4gPiBA
QCAtMTUsMTcgKzE1LDMzIEBAIHN0YXRpYyB2b2lkIHNiaV9wdXRjKHN0cnVjdCB1YXJ0X3BvcnQg
KnBvcnQsIHVuc2lnbmVkIGNoYXIgYykKPiA+ICAgICAgIHNiaV9jb25zb2xlX3B1dGNoYXIoYyk7
Cj4gPiAgfQo+ID4KPiA+IC1zdGF0aWMgdm9pZCBzYmlfY29uc29sZV93cml0ZShzdHJ1Y3QgY29u
c29sZSAqY29uLAo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgKnMs
IHVuc2lnbmVkIG4pCj4gPiArc3RhdGljIHZvaWQgc2JpXzBfMV9jb25zb2xlX3dyaXRlKHN0cnVj
dCBjb25zb2xlICpjb24sCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0
IGNoYXIgKnMsIHVuc2lnbmVkIGludCBuKQo+ID4gIHsKPiA+ICAgICAgIHN0cnVjdCBlYXJseWNv
bl9kZXZpY2UgKmRldiA9IGNvbi0+ZGF0YTsKPiA+ICAgICAgIHVhcnRfY29uc29sZV93cml0ZSgm
ZGV2LT5wb3J0LCBzLCBuLCBzYmlfcHV0Yyk7Cj4gPiAgfQo+ID4KPiA+ICtzdGF0aWMgdm9pZCBz
YmlfZGJjbl9jb25zb2xlX3dyaXRlKHN0cnVjdCBjb25zb2xlICpjb24sCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBjaGFyICpzLCB1bnNpZ25lZCBpbnQgbikKPiA+
ICt7Cj4gPiArICAgICBzYmlfZGVidWdfY29uc29sZV93cml0ZShuLCBfX3BhKHMpKTsKPgo+IFRo
aXMgb25seSB3b3JrcyBmb3Igc3RyaW5ncyBpbiB0aGUgbGluZWFyIG1hcHBpbmcgb3IgdGhlIGtl
cm5lbCBtYXBwaW5nIChub3QKPiB2bWFsbG9jLCB3aGljaCBpbmNsdWRlcyB0aGUgc3RhY2spLiBT
byBJIGRvbid0IHRoaW5rIHdlIGNhbiB1c2UgX19wYSgpIGhlcmUuCgpJbiB3aGljaCBjYXNlLCB3
ZSBuZWVkIGV4dGVuZCBzYmlfZGVidWdfY29uc29sZV93cml0ZSgpIHRvCmRvIHRoZSB2YS10by1w
YSBjb252ZXJzaW9uIGZvciBib3RoIGVhcmx5Y29uLXJpc2N2LXNiaS5jIGFuZApodmNfcmlzY3Zf
c2JpLmMKCj4KPiA+ICt9Cj4gPiArCj4gPiAgc3RhdGljIGludCBfX2luaXQgZWFybHlfc2JpX3Nl
dHVwKHN0cnVjdCBlYXJseWNvbl9kZXZpY2UgKmRldmljZSwKPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgY29uc3QgY2hhciAqb3B0KQo+ID4gIHsKPiA+IC0gICAgIGRldmljZS0+
Y29uLT53cml0ZSA9IHNiaV9jb25zb2xlX3dyaXRlOwo+ID4gLSAgICAgcmV0dXJuIDA7Cj4gPiAr
ICAgICBpbnQgcmV0ID0gMDsKPiA+ICsKPiA+ICsgICAgIGlmIChzYmlfZGVidWdfY29uc29sZV9h
dmFpbGFibGUpIHsKPiA+ICsgICAgICAgICAgICAgZGV2aWNlLT5jb24tPndyaXRlID0gc2JpX2Ri
Y25fY29uc29sZV93cml0ZTsKPiA+ICsgICAgIH0gZWxzZSB7Cj4gPiArICAgICAgICAgICAgIGlm
IChJU19FTkFCTEVEKENPTkZJR19SSVNDVl9TQklfVjAxKSkKPgo+ICJlbHNlIGlmIiwgbm8gbmVl
ZCBmb3IgdGhlIGV4dHJhIGJsb2NrL2luZGVudGF0aW9uLgoKT2theSwgSSB3aWxsIHVwZGF0ZS4K
Cj4KPiBSZWdhcmRzLAo+IFNhbXVlbAo+Cj4gPiArICAgICAgICAgICAgICAgICAgICAgZGV2aWNl
LT5jb24tPndyaXRlID0gc2JpXzBfMV9jb25zb2xlX3dyaXRlOwo+ID4gKyAgICAgICAgICAgICBl
bHNlCj4gPiArICAgICAgICAgICAgICAgICAgICAgcmV0ID0gLUVOT0RFVjsKPiA+ICsgICAgIH0K
PiA+ICsKPiA+ICsgICAgIHJldHVybiByZXQ7Cj4gPiAgfQo+ID4gIEVBUkxZQ09OX0RFQ0xBUkUo
c2JpLCBlYXJseV9zYmlfc2V0dXApOwo+CgpSZWdhcmRzLApBbnVwCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
