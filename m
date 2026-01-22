Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98434D6CFAA
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 23:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sAupP6W3KbJXtXcU2+2g6M+TA831bIrJbg8jbSlFkEU=; b=NPJaToi29NYTkV
	L3oKLFgUJxE8QBxnOCZuj+jxOueZvINEhgcMx0ePtSHkYv7f8KFYwqAapPKmN+lacmaYb+nwQ8GDt
	0NuYQCMvLANo3lCmwvy5vRDbRbnsjl0pOU6+Tj5s9i7ZQfbIwGMkm5gMRR4hJSX1kItLsFfxCTOTC
	sfkBRxjxM6MKkJ8ZsxF0dP/ZuRIq9DoUZeV00eHN3+TRx0+XmLLzxWdOzbeK47++SBoMsp4KlV/P1
	9b0t46xG7St0ua8gY4YvHzKxrSM9ilkXfGRiNuZK/7c1MOq+qfSC+EPPi+fDnn7Z0sS3nrDmO/RaL
	LhuYa2KS1aXBINWvTPKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj47s-00000007t4L-1mdP;
	Thu, 22 Jan 2026 23:30:08 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj47p-00000007t40-1sGg
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 23:30:06 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-78fb5764382so17052157b3.0
        for <linux-riscv@lists.infradead.org>; Thu, 22 Jan 2026 15:30:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769124604; cv=none;
        d=google.com; s=arc-20240605;
        b=AhCV0+4yidUWwyKNFGdqLukWv3FDKILNZESD9pIRMSH4ir8nJMfTLrLa3ZIx14zRta
         wiX4hORNelU62B1VWjZe9RUVg8YdUDVJBDvPYiKaBr2ZvC42C87iw1SSvu00jhyov+kj
         ty+AoNZcdNTxlai+NoXTBtmtnRkcZhf/OprYzqrSxfS2PxfmO3K9+7HqqFkQ7GMVsYqB
         2+XKqbw5S7mJNI6qgDEtvchvh2Dn8KF7XBNLCM7G0AWWs0rshQgq2ik8XNtyXA3LmSM7
         ZYyoGtqjJiJoRYQ3hRczNcHagTRU7/86QEA0vufEdFavlQjH96vhWHS8lYrcHM6bem1y
         Tg2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZzbVEphzp0lpFkdctOwCC3UitWwAMjzu6W2b8ZRmyrc=;
        fh=Bbx+P04lPD/S6Hh7ZCAjcPrdBzDFa/5/LKWgklBLkSo=;
        b=ViN6V4tm7zhpijcszx0lliXTrePOb4g9MyYL5M2pClYqUagakpg6rY7kovFNfgKoHt
         VmgDtI3JMGWZUuk6W1tzMnn7NyJuX/lVlTZGb1j2LQDF+GQ1gxAXeR5KgzNyC/63BTRd
         xinebBTeOerU/IOxTEx0F9U7ubTZsJCEsU8sZegRX6wbcsjpb7LJKVA00w24c4TCzWmj
         G+qRlLFQRIvM1xLN0Gwkmohg8+PL3D/XstjyM0kZnzxhtieNEAaEee5j5O63igVSP4/Q
         FMZVEImqzVRX1KaBeXP1E+4eubcFBfZ7zWvzLKtlda/Sb9/SAaV1j1e15m4aK5LRucGu
         L3hQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1769124604; x=1769729404; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZzbVEphzp0lpFkdctOwCC3UitWwAMjzu6W2b8ZRmyrc=;
        b=V6C21zgzP1/huWTsD7qVBJiLbT77GoWVnms+XDjX7q+pjxHp9zZtYaajZcd6qjg3wp
         TSw/3pv3J41d1xTq/nx0BPE9Ba7RxrY8vOLBQnQQ1+3GSr4CbtajaNpVSGL3tGT0p5pl
         ZkvNycPsRVPtWc09WnpbRHBdgOPQDwr4eJom4TRID4A7FUlkydO/DcoFK2wJThmZi1Nj
         YE8Pol2LaU9EjXP3hWkx8LLnPKTOc0fiht3S8SU5crhZ6VRR8DsQEQUVz2GvJKE3mBTS
         FNhNrZ6jCUNLv4MoZd4O/N+8YEO79S+HQgTgXESSEJdYmxAQED73eRjdHoMBF7m8A5Xv
         BpsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769124604; x=1769729404;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZzbVEphzp0lpFkdctOwCC3UitWwAMjzu6W2b8ZRmyrc=;
        b=bEbLXptD67sjLQT2LOaDMg20psnyjWB/DjomX8ZVNfNb9Y3+HgQAe6DliU8lFVXMkB
         tQ+5PEM4N2+0CJzzS0HHHMe+0fIGIRtfNDz3EZxScEnlO+Jy5/V1QH10KNCGjpl2u6+P
         cpRjioElrv4JOKtl5FilflFKrys1Ef39ZtR3bH7j6drh2xBcvtW46AJjIdXyMTgrDdn1
         U7dx7yEfA/74seY70C2hMBoaChOv9zRpBRuw30AMGCdZs2B+jtIXfkf1qOsw5WOUiolf
         qOkvysiq9kGZUxwbJVj2aJAT0vhy0yVfRCO82gP3jHnwaWkgoxMGzb1vyU0xwPX+JUAK
         gezg==
X-Forwarded-Encrypted: i=1; AJvYcCUuyOB5REwXw8nEp7WukK1eQ19obgFaBlgTH5XYv0ASO5VWs450FLUSHvRR3BcfbHh9ugrjhh2oG+U0fQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxfZmmxQmctEgacDpYyslQw4c2xY5hwcPvNuDWh88ZmLLeUVjeF
	MpzfRchlBB0MIEJ7tMMa12aYKj4lL4EWt/u1nHljPtZxGiNvUEvXXYZigClAH6PIIzNgQZmABK6
	Ex8a0Wo9GurPjE+QTxy56gpq3AdLfCwBKVg2BB5x0Qg==
X-Gm-Gg: AZuq6aJYjXhsdRpI9RWXOzYQnRjIoMx/ARMIwVEEvCIR7z3/gPdoS3oUllkH9wqkZdX
	68NTMHOO/ZAJVjAioqPySL4Yd2Rs/awgMLHtTdmW4Q8sujedbj+WYbH5Ql6IoPWTu0CT7FQvVDD
	2RgJzwAA1hSsJJ5O2isADyG4EB1/OBVI8xTeLkR1YGW8O3touItHwmrZ5sW2UewBBcW88GT7ch1
	faVQu82N1Qp7/2rMzQ815FbF8nZPlNBV2jK4A905rswGKme7+mMJfTlF9NFAOUO4XmjbP2BJNUU
	1BNZgT4VabveOtcSBMl9SJtPC0M5EPNKcFul1vE5LxQC
X-Received: by 2002:a05:690c:6606:b0:794:148d:cafa with SMTP id
 00721157ae682-794398bad32mr11667487b3.11.1769124604288; Thu, 22 Jan 2026
 15:30:04 -0800 (PST)
MIME-Version: 1.0
References: <20260116-supm-ext-id-v1-0-5fcf778ba4a6@riscstar.com>
 <20260116-supm-ext-id-v1-1-5fcf778ba4a6@riscstar.com> <20260122-headlamp-champion-0bbad2551d33@spud>
In-Reply-To: <20260122-headlamp-champion-0bbad2551d33@spud>
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 23 Jan 2026 07:29:52 +0800
X-Gm-Features: AZwV_QiqHltdWQztFinjYgs1YM-vgVBcGnLo6nlvKPcvIzhDDwENE-Jg4kp04ew
Message-ID: <CAH1PCMY+FrxkT+qnAXbS75T=PTzGB_BkKWY1f3-anOjHwG9CkA@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: riscv: Add Supm extension description
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Evan Green <evan@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_153005_744732_974E9466 
X-CRM114-Status: GOOD (  19.02  )
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

T24gRnJpLCBKYW4gMjMsIDIwMjYgYXQgMjo1MuKAr0FNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBGcmksIEphbiAxNiwgMjAyNiBhdCAxMDoxMDozMUFNICsw
ODAwLCBHdW9kb25nIFh1IHdyb3RlOgo+ID4gQWRkIGRlc2NyaXB0aW9uIGZvciB0aGUgU3VwbSBl
eHRlbnNpb24uIFN1cG0gaW5kaWNhdGVzIHN1cHBvcnQgZm9yIHBvaW50ZXIKPiA+IG1hc2tpbmcg
aW4gdXNlciBtb2RlLiBTdXBtIGlzIG1hbmRhdG9yeSBmb3IgUlZBMjNTNjQuCj4gPgo+ID4gVGhl
IFN1cG0gZXh0ZW5zaW9uIGlzIHJhdGlmaWVkIGluIGNvbW1pdCBkNzAwMTFkZGU2YzIgKCJVcGRh
dGUgdG8gcmF0aWZpZWQKPiA+IHN0YXRlIikgb2YgcmlzY3Ytai1leHRlbnNpb24uCj4gPgo+ID4g
U2lnbmVkLW9mZi1ieTogR3VvZG9uZyBYdSA8Z3VvZG9uZ0ByaXNjc3Rhci5jb20+Cj4gPiAtLS0K
PiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55
YW1sIHwgMTcgKysrKysrKysrKysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0
aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbAo+ID4gaW5kZXggNGZmZDYxOTI2NTA1Li4xOTIy
ZGZmMDM3ODcgMTAwNjQ0Cj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCj4gPiBAQCAtMjYyLDYgKzI2MiwyMyBA
QCBwcm9wZXJ0aWVzOgo+ID4gICAgICAgICAgICAgIHJhdGlmaWVkIGluIFJJU0MtViBQcm9maWxl
cyBWZXJzaW9uIDEuMCwgd2l0aCBjb21taXQgYjFkODA2NjA1Zjg3Cj4gPiAgICAgICAgICAgICAg
KCJVcGRhdGVkIHRvIHJhdGlmaWVkIHN0YXRlLiIpCj4gPgo+ID4gKyAgICAgICAgLSBjb25zdDog
c3VwbQo+ID4gKyAgICAgICAgICBkZXNjcmlwdGlvbjogfAo+ID4gKyAgICAgICAgICAgIFRoZSBz
dGFuZGFyZCBTdXBtIGV4dGVuc2lvbiBmb3IgcG9pbnRlciBtYXNraW5nIHN1cHBvcnQgaW4gdXNl
cgo+ID4gKyAgICAgICAgICAgIG1vZGUgKFUtbW9kZSkgYXMgcmF0aWZpZWQgYXQgY29tbWl0IGQ3
MDAxMWRkZTZjMiAoIlVwZGF0ZSB0bwo+ID4gKyAgICAgICAgICAgIHJhdGlmaWVkIHN0YXRlIikg
b2YgcmlzY3Ytai1leHRlbnNpb24uCj4gPiArCj4gPiArICAgICAgICAgICAgU3VwbSByZXByZXNl
bnRzIGEgY29tYmluYXRpb24gb2YgdW5kZXJseWluZyBoYXJkd2FyZSBjYXBhYmlsaXR5Cj4gPiAr
ICAgICAgICAgICAgKFNtbnBtIG9yIFNzbnBtKSwgVS1tb2RlIGNvbnN1bWVyIHByaXZpbGVnZSBs
ZXZlbCwgYW5kIE0vUy1tb2RlCj4KPiBTaG91bGQgd2UgdGhlcmVmb3JlIG1ha2UgdGhpcyByZXF1
aXJlIHRoYXQgU21ucG0gb3IgU3NucG0gYXJlIHByZXNlbnQ/CgpJJ20gbm90IHN1cmUuIFdvdWxk
IFUtbW9kZSBEVEJzIHR5cGljYWxseSBvbWl0IHRoZSBwcml2aWxlZ2VkIGV4dGVuc2lvbnMgbGlr
ZQpTbW5wbS9Tc25wbSwgbWFraW5nIHN1Y2ggYSBkZXBlbmRlbmN5IGltcHJhY3RpY2FsPwoKLUd1
b2RvbmcKCj4KPiA+ICsgICAgICAgICAgICBzb2Z0d2FyZSBjb25maWd1cmF0aW9uIHRoYXQgZW5h
YmxlcyBwb2ludGVyIG1hc2tpbmcgZm9yIFUtbW9kZS4KPiA+ICsKPiA+ICsgICAgICAgICAgICBE
TyBOT1QgaW5jbHVkZSB0aGlzIHByb3BlcnR5IGluIGRldmljZSB0cmVlcyB0YXJnZXRpbmcgcHJp
dmlsZWdlZAo+ID4gKyAgICAgICAgICAgIHN5c3RlbSBzb2Z0d2FyZSAoUy1tb2RlIG9yIE0tbW9k
ZSkuCj4gPiArCj4gPiArICAgICAgICAgICAgVGhpcyBwcm9wZXJ0eSBpcyBvbmx5IGFwcHJvcHJp
YXRlIGluIGRldmljZSB0cmVlcyBwcm92aWRlZCB0bwo+ID4gKyAgICAgICAgICAgIFUtbW9kZSBz
b2Z0d2FyZSB3aGVyZSB0aGUgbmV4dC1oaWdoZXItcHJpdmlsZWdlLW1vZGUgc3VwcG9ydHMKPiA+
ICsgICAgICAgICAgICBTbW5wbSBvciBTc25wbSBhbmQgZW5hYmxlcyBpdCBmb3IgVS1tb2RlLgo+
ID4gKwo+ID4gICAgICAgICAgLSBjb25zdDogc3ZhZGUKPiA+ICAgICAgICAgICAgZGVzY3JpcHRp
b246IHwKPiA+ICAgICAgICAgICAgICBUaGUgc3RhbmRhcmQgU3ZhZGUgc3VwZXJ2aXNvci1sZXZl
bCBleHRlbnNpb24gZm9yIFNXLW1hbmFnZWQgUFRFIEEvRAo+ID4KPiA+IC0tCj4gPiAyLjQzLjAK
PiA+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
