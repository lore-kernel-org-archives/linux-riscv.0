Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CAB2C71148
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 15:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gKaJivyct9hMW67hxofUDfln3njPVxFC9GOGRxqfNus=; b=g75nJbi65vGqJR
	umq4vI+Q5CP2R1QaOUULToB7NSCYf6y0clu1LWtIh9BoJzbwLuwoOquSysIWGhaH7V2RJtt6c8jOv
	WQl3OTHfGY3Dk43EFfWc0ZRvSt6KaJ4VlMWVY6VJNNIS9H8l0huR/soB36WFXQxyMHBz7XPzrOJIF
	C00wu8KTS3YR+HJQMCv/+DR7r5g7hZRrEpmpoVdiNtTUK6uWOsdUZj8Jl4Q/cxW3JTEE2tBp+LsDH
	rYxDKd27/kZeSwAPoMJ7lPwZfPcTASsVWPQZSpi2IqLHYEknKq3ygcy0ouEXBVRyRO3R2JLoBf+QR
	vkOMkPUDOCNZ7/rstZXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6DR-0000000Gr0v-0CDU;
	Fri, 13 Jun 2025 15:21:13 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ57P-0000000Gdgq-1d3H
	for linux-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 14:10:56 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4530e6f4db4so2137715e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 13 Jun 2025 07:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749823854; x=1750428654; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YCwDooc5Gsj0hNyVB/vl+qIPOuR8M4GMrDeO1ReDJTw=;
        b=lSY10vCfqIVk48yl5xjTJ+g3qXW8aaVnHyvrw0PhDCdrreotfWFZ8NNxKCVtLKKSru
         6Qxf0Z7Hbw60QCVdWqcNFSrePqS7iQJCGj1bwMsLWOC9R5WREwUvXWCJkvF0RDgg1sQQ
         XCX4Sisuhn/kgOxkGs4v6Bga/esl0HBEUX1f+L2iZo1x+uQTvs6uo97RBgNt0CGtjkhu
         uLEfgdfKcv6M7LzdUOwxv1+W7hkb5HmtoO5rDNi4ay5ISiZUg37l+wCe07r+QoFD1Y0c
         O+Bml7Y5ygIFqKV/CkysWF9z3vn3Su7lJk6ADHxaRLN6Q+kSB6zd0fGkxNXqXuVDTulR
         MAyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749823854; x=1750428654;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YCwDooc5Gsj0hNyVB/vl+qIPOuR8M4GMrDeO1ReDJTw=;
        b=k+fkO2/QsKKnAXxuUEZOhFddijXpwkVSqYNreUo7kyhTiKCAB7OKxvK2g65gMgLqEn
         oSumjKVnsraEarNF6u8cOjnLq504TI8H5L1wrxoqZNdS6mJjdM4O3WCjDk9sBWY+oRLs
         xLIBPtKw1rZPpMnwgMEIenjKA6WJUpOGAEwMPA0dZp29ddnUvyKEW4UKjd3BU9NCkTCp
         K57ymEJg//PwwEsWoUL1wEka/HfhZcyPUXLvIab0AMfurRYlyMDtVhUJeIwpUHcjhTH9
         JwbagEgfOaGoTc/XsVZxY++z1cDfwJBCpDq3z5OXndCUcoj2h6YLfOHiXzLHEfF1WyR8
         uw4w==
X-Gm-Message-State: AOJu0YzR9VXvxoxs4Gf7YT9LFI/mZYlBQsO2WmCjhGg247jj1duG9r0U
	+WRXLZo0x4mZiwGv26ZPhkwoqg68cunEfgwgLc3jGjQIzIbTKVFG8cn0+jra23xgJdL61SefHdU
	uWyghVVw=
X-Gm-Gg: ASbGncvg6Jh8+/L6fiU256uUqC5+AOOe6oKuj3lwj/lZQ4gtFaTl9bmXLR2/sWu01SY
	gXHSTLfx5hSCgIqWNyev41D+WjsyeSFw4zkRe5iXksHouTI45bEVWwOy/3E4pwLQr3zpHMnyv4K
	4FbZWKrHIbAoNlPT73Og5DrAKYHFu/TXY0UwH/m/M0mInHBynYpI2vFtN4Ox8eSDRaQdvr2103c
	1JXIoczqYRK0Gyd3enVasLUY5yQ6KprstCaP7DP/L0DfXpl0V9zcIcQ7mD2/KMncbOyNy6YdNhw
	vTaQMOxItizyaVK6Ae2gcseZ9T10Cz3xAudeXUl2qf7i9o8eXT2u1k3hZXGI+V7Jy4Ps0MhfvtJ
	EY2pR
X-Google-Smtp-Source: AGHT+IG4GeDYIccMx3Bp09h1EiucZJUl0jOo1LzwGgmCUjMutG0m5EDpaCILXiv1gNh0ijozMoQ+aA==
X-Received: by 2002:a05:600c:a414:b0:453:9b3:5b70 with SMTP id 5b1f17b1804b1-45334b07e86mr10021225e9.8.1749823853636;
        Fri, 13 Jun 2025 07:10:53 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:3c9f:2b68:ce36:f64b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea15b0sm54247605e9.11.2025.06.13.07.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 07:10:52 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 13 Jun 2025 16:10:52 +0200
Message-Id: <DALGSCDW0GIG.10I22KD2SCSNX@ventanamicro.com>
Subject: Re: [PATCH 2/2] RISC-V: make use of variadic sbi_ecall
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Atish Patra" <atishp@rivosinc.com>, "Andrew Jones"
 <ajones@ventanamicro.com>, =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?=
 <cleger@rivosinc.com>, "Anup Patel" <apatel@ventanamicro.com>
To: "David Laight" <david.laight.linux@gmail.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250612145754.2126147-2-rkrcmar@ventanamicro.com>
 <20250612145754.2126147-4-rkrcmar@ventanamicro.com>
 <20250613115459.6293f929@pumpkin>
In-Reply-To: <20250613115459.6293f929@pumpkin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_071055_428998_437DF210 
X-CRM114-Status: GOOD (  18.98  )
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

MjAyNS0wNi0xM1QxMTo1NDo1OSswMTowMCwgRGF2aWQgTGFpZ2h0IDxkYXZpZC5sYWlnaHQubGlu
dXhAZ21haWwuY29tPjoKPiBPbiBUaHUsIDEyIEp1biAyMDI1IDE2OjU3OjU1ICswMjAwCj4gUmFk
aW0gS3LEjW3DocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4+IFRoZSBu
ZXcgc2JpX2VjYWxsIGRvZXNuJ3QgaGF2ZSB0byBsaXN0IGFsbCA4IGFyZ3VtZW50cyBhbnltb3Jl
LCBzbyBvbmx5Cj4+IHBhc3MgdGhlIGFjdHVhbCBudW1iZXJzIG9mIGFyZ3VtZW50cyBmb3IgZWFj
aCBTQkkgZnVuY3Rpb24uCj4+IAo+PiBUcmFpbGluZyAwIGlzIHNvbWV0aW1lcyBpbnRlbnRpb25h
bC4KPiAuLi4KPj4gQEAgLTYzMCwxMCArNjMwLDEwIEBAIHN0YXRpYyBpbnQgcG11X3NiaV9zbmFw
c2hvdF9zZXR1cChzdHJ1Y3QgcmlzY3ZfcG11ICpwbXUsIGludCBjcHUpCj4+ICAJaWYgKElTX0VO
QUJMRUQoQ09ORklHXzMyQklUKSkKPj4gIAkJcmV0ID0gc2JpX2VjYWxsKFNCSV9FWFRfUE1VLCBT
QklfRVhUX1BNVV9TTkFQU0hPVF9TRVRfU0hNRU0sCj4+ICAJCQkJY3B1X2h3X2V2dC0+c25hcHNo
b3RfYWRkcl9waHlzLAo+PiAtCQkJCSh1NjQpKGNwdV9od19ldnQtPnNuYXBzaG90X2FkZHJfcGh5
cykgPj4gMzIsIDAsIDAsIDAsIDApOwo+PiArCQkJCSh1NjQpKGNwdV9od19ldnQtPnNuYXBzaG90
X2FkZHJfcGh5cykgPj4gMzIpOwo+Cj4gVGhhdCBkb2Vzbid0IGxvb2sgcmlnaHQgKGFuZCBvdGhl
ciBzaW1pbGFyIG9uZXMpLgoKVGhpcyBvbmUgaXMgd3JvbmcsIGJ1dCBiZWNhdXNlIEkgbWlzc2Vk
IHRoZSBmbGFncy4gIFRoaXMgcGF0Y2ggc2hvdWxkCmhhdmUgYmVlbjoKCgkJcmV0ID0gc2JpX2Vj
YWxsKFNCSV9FWFRfUE1VLCBTQklfRVhUX1BNVV9TTkFQU0hPVF9TRVRfU0hNRU0sCgkJCQljcHVf
aHdfZXZ0LT5zbmFwc2hvdF9hZGRyX3BoeXMsCgkJCQkodTY0KShjcHVfaHdfZXZ0LT5zbmFwc2hv
dF9hZGRyX3BoeXMpID4+IDMyLCAwKTsKCkknbGwgZml4IHRoYXQgaW4gdjIsIHRoYW5rcy4gIEkg
dGhpbmsgeW91IG1pZ2h0IGJlIHJlZmVycmluZyB0byB0aGUgZmFjdAp0aGF0IHRoZSBjb2RlIHdv
dWxkIG1ha2UgbW9yZSBzZW5zZSBhczoKCgkJcmV0ID0gc2JpX2VjYWxsKFNCSV9FWFRfUE1VLCBT
QklfRVhUX1BNVV9TTkFQU0hPVF9TRVRfU0hNRU0sCgkJCQlsb3dlcl8zMl9iaXRzKGNwdV9od19l
dnQtPnNuYXBzaG90X2FkZHJfcGh5cyksCgkJCQl1cHBlcl8zMl9iaXRzKGNwdV9od19ldnQtPnNu
YXBzaG90X2FkZHJfcGh5cykpCgpJIGZ1bGx5IGFncmVlIHdpdGggdGhhdCwgYnV0IGl0J3MgYSBk
aWZmZXJlbnQgcGF0Y2guLi4gSSB3b3VsZCBldmVuCnNwZWNpYWwgY2FzZSB0aGUgYGlmYCB3aXRo
IENPTkZJR18zMkJJVCAmJiBDT05GSUdfUEhZU19BRERSX1RfNjRCSVQgdG8KbWFrZSBpdCBleHRy
YSBjbGVhciB3aHkgd2UncmUgZG9pbmcgc3VjaCBhIHdlaXJkIHRoaW5nLgoKPiBUaGUgdmFsdWVz
IGFyZSBzdGlsbCA2NGJpdCAtIHNvIGdldCBwYXNzZWQgYXMgdHdvIDMyYml0IHZhbHVlcyAoaW4g
c29tZSB3YXkpCj4gc28gdGhhdCB2YXJhcmdzIGNvZGUgd2lsbCBnZXQgdGhlIHdyb25nIHZhbHVl
cy4KClRoZSBTQkkgZnVuY3Rpb24gcHJvdG90eXBlIGxvb2tzIGxpa2UgdGhpcyBpbiB0aGUgc3Bl
Y2lmaWNhdGlvbjoKCiAgc3RydWN0IHNiaXJldCBzYmlfcG11X3NuYXBzaG90X3NldF9zaG1lbSh1
bnNpZ25lZCBsb25nIHNobWVtX3BoeXNfbG8sCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHNobWVtX3BoeXNfaGksCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGZsYWdzKQoKU0JJIGRl
ZmluZXMgbG9uZyB0byBiZSB0aGUgbmF0aXZlIHJlZ2lzdGVyIHdpZHRoLCAzMi1iaXQgd2l0aApD
T05GSUdfMzJCSVQsIGFuZCB0aGVyZWZvcmUgdXNlcyAyIHJlZ2lzdGVycyB0byBwYXNzIHRoZSBw
aHlzaWNhbAphZGRyZXNzLCBiZWNhdXNlIHRoZSBwaHlzaWNhbCBhZGRyZXNzIGNhbiBiZSB1cCB0
byAzNCBiaXRzIG9uIFJWMzIuCgpUaGUgbWFjcm8gd2lsbCByZXN1bHQgaW4gdGhlIHNhbWUgYXJn
dW1lbnRzIGFzIGJlZm9yZSwgYW5kIGl0IGlzIHdoYXQKdGhlIHNiaV9lY2FsbCBhY3R1YWxseSBz
aG91bGQgZG8uCgo+IEkgZ3Vlc3MgdGhlIHByZXZpb3VzIGNoYW5nZSB3YXNuJ3QgdGVzdGVkIG9u
IDMyYml0PwoKSXQgd2Fzbid0IGV2ZW4gY29tcGlsZWQsIGJlY2F1c2UgNjQtYml0IHBoeXNfYWRk
cl90IG9uIENPTkZJR18zMkJJVApyZXF1aXJlcyBDT05GSUdfUEhZU19BRERSX1RfNjRCSVQsIGJ1
dCB0aGF0IGNvbmZpZyBjb21iaW5hdGlvbiBzZWVtcwppbXBvc3NpYmxlIGF0IHRoaXMgcG9pbnQu
CiIodTY0KShjcHVfaHdfZXZ0LT5zbmFwc2hvdF9hZGRyX3BoeXMpID4+IDMyKSIgaXMgYSBmYW5j
eSB3YXkgdG8gc2F5IDAuCgpJZiB3ZSB3ZXJlIGFibGUgdG8gY29tcGlsZSB3aXRoIENPTkZJR19Q
SFlTX0FERFJfVF82NEJJVCwgSSB0aGluayB0aGUKcGF0Y2ggd291bGQgcHJvZHVjZSB0aGUgZGVz
aXJlZCByZXN1bHQsIGhvcGVmdWxseSB3aXRoIGEgd2FybmluZyB0aGF0CndlJ3JlIGltcGxpY2l0
bHkgY2FzdGluZyB1NjQgdG8gdTMyLCBidXQgdGhhdCB3YXMgdGhlcmUgZXZlbiBiZWZvcmUgdGhp
cwpwYXRjaC4KCkVuYWJsaW5nIENPTkZJR19QSFlTX0FERFJfVF82NEJJVCB3aWxsIGhhdmUgaXRz
IHNoYXJlIG9mIGlzc3VlcyAtLQpJIG5vdGljZWQgYSBidWcgd2hlcmUgb3RoZXIgMzItYml0IGZ1
bmN0aW9uIChTQklfRVhUX05BQ0xfU0VUX1NITUVNKQpmb3JnZXRzIHRvIHBhc3MgdGhlIHVwcGVy
IHBhcnQgb2YgdGhlIHBoeXNpY2FsIGFkZHJlc3MsIGJ1dCBJIGRpZG4ndAppbmNsdWRlIGl0IGlu
IHRoaXMgc2VyaWVzLCBiZWNhdXNlIGl0IG1hZGUgbm8gZGlmZmVyZW5jZSByaWdodCBub3cuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
