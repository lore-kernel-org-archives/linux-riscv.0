Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC52AC4706C
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 19:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Fjbp/22Eox9fVQXGtwITp5I7P7ND8BiUsh1AHntJLe4=; b=159C1LN8YbmgxHqLGe55f8vKtl
	9GRVxc9c/d+okPBTrWYzrtCoGbhstChgQsh0NvmZTOAv5CSYVeqxWaNse+MQQjn9UjinnC2rbufRP
	NFC/v5LBBAihbCGkOTU/C8pdR6rxzNc1CFm1sVrzCypVJzzjmXu5ZZAlcl7qkw7rm5OyBY2Tys1F8
	8dTN+h6Zhax0f1FvDLX0nmiISQMeJEI/52KriljvEV2AEa+8mbF1diJjHDSWCxT0FQkkPiffRJ4T8
	wE1YhSAZAqEU1Ccjn/OF4irD+B3M20BIFumUEyoGp1MNfNgygfCukYjTM15FudNgkilpDj7rDgcfU
	ZCXwtG+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOMmu-003f3F-2J;
	Fri, 12 Jan 2024 19:01:52 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOMmr-003f2f-2j
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jan 2024 19:01:51 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-59898a3db56so1805831eaf.1
        for <linux-riscv@lists.infradead.org>; Fri, 12 Jan 2024 11:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1705086108; x=1705690908; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x2lTUUF/b6SvXMl2H80G+4OXlwpQirLA2PbuKSA+dX4=;
        b=G0z/WMk3wcAQSpWw7WhPzn+pHkdxSSdlDzoCH1kKGwPH34DvlHP7T3m9GDSbNDdWP5
         +pSytocVs6kXSG6srjAsoR4nmytHFEm//IiZJVmPW1ySh5SJpcLicje97PL+ZGSF7NmW
         EoHAkT7sRbwOY6DMj7nfieFNn3xrLN6/nxU4NXF1bmOGqyMRv8S/Hvm8igUvNs7QWY1M
         xdWtYM2NRbEdPgCchI46hdMIABe5itA4GnXMQW3MxGIUFoZNv/5YsxsNm1hDjKyWKVPn
         JQfUE1nRYR5KXnjPPegPiE6a0fhC25TpaRQluIYgtg5sWIKLmrMJbx781DwlVQNxJb+e
         gsKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705086108; x=1705690908;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x2lTUUF/b6SvXMl2H80G+4OXlwpQirLA2PbuKSA+dX4=;
        b=nZZXQg3hdPdEyJKfRGFyGU9c6Ci0z5+CQ0c0keqsa459J630Mjejq4xR17/L1EU3Fy
         ma36Jo6pGQ6RZahNtS22fhDVuyAHNhCwQf908pYfkq4U5+jd8Yc46kRxVA+d+LEBEx1S
         dhSrDUjd+vZ+hZH2UTxkmx0MYAEyiLCh3JxuKrQ5naEmnAACDLljU+tJJxEYNg7V8pSL
         ZvihClsXMYKlX1MpDoJ+ZQ9dqAZloeVK4m2gUrsAZK9Ym6jIlHlsmkGdSSwxcP0dfc3H
         ZhkRNUvuR2x7BU+J/36vQStef0K5CcBLzc8Dnq4zfeAJ7/G9z3NyGOwQKfHOI3tMowcw
         Eotw==
X-Gm-Message-State: AOJu0YxRQcvn270S3cMsfwhQnNypJuDld+m860lcy9l4VJLdT0vl6Uql
	KLjoKY3+6pYzhsnNO/OX0uquvXHeTyEe/w==
X-Google-Smtp-Source: AGHT+IGn80HU9HwQSa+yIQHHKmPV+tm9+b51Vcr6PyMCNvZ/Ymaz4UhxyW3leIfBuaNYyizIpa48hw==
X-Received: by 2002:a4a:4441:0:b0:596:4ac:7f91 with SMTP id o62-20020a4a4441000000b0059604ac7f91mr1057776ooa.12.1705086108593;
        Fri, 12 Jan 2024 11:01:48 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id x7-20020a4aaf47000000b005955765f4fasm779267oon.17.2024.01.12.11.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 11:01:48 -0800 (PST)
Date: Fri, 12 Jan 2024 11:01:48 -0800 (PST)
X-Google-Original-Date: Fri, 12 Jan 2024 11:01:46 PST (-0800)
Subject: Re: [v10, 00/10] riscv: support kernel-mode Vector
In-Reply-To: <CABgGipVuT_+M42_rteCb9OOjUToJxz2JGJQYCYqcjRGY3mMAdw@mail.gmail.com>
CC: bjorn@kernel.org, linux-riscv@lists.infradead.org,
  Paul Walmsley <paul.walmsley@sifive.com>, greentime.hu@sifive.com, guoren@linux.alibaba.com, charlie@rivosinc.com,
  Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, peterz@infradead.org, tglx@linutronix.de,
  ebiggers@kernel.org, aou@eecs.berkeley.edu
From: Palmer Dabbelt <palmer@dabbelt.com>
To: andy.chiu@sifive.com
Message-ID: <mhng-dcf9dd93-9e61-4ebe-976e-811071591589@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_110149_908073_93E762EA 
X-CRM114-Status: GOOD (  30.76  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAxMiBKYW4gMjAyNCAxMDo0NzoxOSBQU1QgKC0wODAwKSwgYW5keS5jaGl1QHNpZml2
ZS5jb20gd3JvdGU6Cj4gSGkgUGFsbWVyLAo+Cj4gT24gU2F0LCBKYW4gMTMsIDIwMjQgYXQgMjoz
NeKAr0FNIFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+IHdyb3RlOgo+Pgo+PiBP
biBGcmksIDEyIEphbiAyMDI0IDA4OjAzOjI0IFBTVCAoLTA4MDApLCBhbmR5LmNoaXVAc2lmaXZl
LmNvbSB3cm90ZToKPj4gPiBPbiBGcmksIEphbiAxMiwgMjAyNCBhdCAxMToyOeKAr1BNIEJqw7Zy
biBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+IHdyb3RlOgo+PiA+Pgo+PiA+PiBBbmR5LAo+PiA+
Pgo+PiA+PiA+IEhlbGxvOgo+PiA+PiA+Cj4+ID4+ID4gVGhpcyBzZXJpZXMgd2FzIGFwcGxpZWQg
dG8gcmlzY3YvbGludXguZ2l0IChmb3ItbmV4dCkKPj4gPj4gPiBieSBQYWxtZXIgRGFiYmVsdCA8
cGFsbWVyQHJpdm9zaW5jLmNvbT46Cj4+ID4+ID4KPj4gPj4KPj4gPj4gSSdtIGdldHRpbmcgc29t
ZSBib290IGlzc3VlcyB3aXRoIHRoaXMgc2VyaWVzIGFwcGxpZWQgdG8gcmlzY3YvZm9yLW5leHQu
Cj4+ID4+Cj4+ID4+IFRoZSBmdWxsIHJ1bnMgKHdpdGggbG9ncykgaXMgaGVyZToKPj4gPj4gaHR0
cHM6Ly9naXRodWIuY29tL2xpbnV4LXJpc2N2L2xpbnV4LXJpc2N2L2FjdGlvbnMvcnVucy83NDk4
NzA2MzI2Cj4+ID4+Cj4+ID4+IFR5cGljYWxseSBpdCBmYWlscyBpbiB0d28gd2F5czoKPj4gPj4g
VWJ1bnR1IHJvb3RmczoKPj4gPj4gLS04PC0tCj4+ID4+IFsgNC4zNDY0MTRdIChzZC1nZW5zKVs2
OF06IEZhaWxlZCB0byBleHRyYWN0IGZpbGUgbmFtZSBmcm9tICcnOiBJbnZhbGlkIGFyZ3VtZW50
Cj4+ID4+IFsgNC4zOTA4MzJdIHN5c3RlbWRbMV06IEZhaWxlZCB0byBmb3JrIG9mZiBzYW5kYm94
aW5nIGVudmlyb25tZW50IGZvciBleGVjdXRpbmcgZ2VuZXJhdG9yczogUHJvdG9jb2wgZXJyb3IK
Pj4gPj4gW0VTQ1swOzE7MzFtISEhISEhRVNDWzBtXSBGYWlsZWQgdG8gc3RhcnQgdXAgbWFuYWdl
ci4KPj4gPj4gWyA0LjQ0MDE2NF0gc3lzdGVtZFsxXTogRnJlZXppbmcgZXhlY3V0aW9uLgo+PiA+
PiAtLTg8LS0KPj4gPj4KPj4gPj4gb3I6Cj4+ID4+IC0tODwtLQo+PiA+PiBbICAgMTQuOTA5OTEy
XSAoc2QtZ2VucylbNzFdOiBBc3NlcnRpb24gJyFzdHJ2X2lzZW1wdHkoZGlycyknIGZhaWxlZCBh
dCBzcmMvc2hhcmVkL2V4ZWMtdXRpbC5jOjIxMSwgZnVuY3Rpb24gZXhlY3V0ZV9kaXJlY3Rvcmll
cygpLiBBYm9ydGluZy4KPj4gPj4gWyAgIDE1LjAwODQ4MF0gc3lzdGVtZFsxXTogRmFpbGVkIHRv
IGZvcmsgb2ZmIHNhbmRib3hpbmcgZW52aXJvbm1lbnQgZm9yIGV4ZWN1dGluZyBnZW5lcmF0b3Jz
OiBQcm90b2NvbCBlcnJvcgo+PiA+PiBbRVNDWzA7MTszMW0hISEhISFFU0NbMG1dIEZhaWxlZCB0
byBzdGFydCB1cCBtYW5hZ2VyLgo+PiA+PiBbICAgMTUuMTExOTg5XSBzeXN0ZW1kWzFdOiBGcmVl
emluZyBleGVjdXRpb24uCj4+ID4+IC0tODwtLQo+PiA+Pgo+PiA+PiBhbmQgQWxwaW5lIHdpdGg6
Cj4+ID4+IC0tODwtLQo+PiA+PiBbIDAuMDM2NzAzXSBLZXJuZWwgcGFuaWMgLSBub3Qgc3luY2lu
Zzoga21lbV9jYWNoZV9jcmVhdGVfdXNlcmNvcHk6IEZhaWxlZCB0byBjcmVhdGUgc2xhYiAncmlz
Y3ZfdmVjdG9yX2N0eCcuIEVycm9yIC0yMgo+PiA+PiBbIDAuMDM5MTk1XSBDUFU6IDAgUElEOiAw
IENvbW06IHN3YXBwZXIvMCBOb3QgdGFpbnRlZCA2LjcuMC1yYzEtZGVmY29uZmlnX3BsYWluLWdk
Zjk0NDcwNDE4MmUgIzEKPj4gPj4gWyAwLjA0MDc0NF0gSGFyZHdhcmUgbmFtZTogcmlzY3Ytdmly
dGlvLHFlbXUgKERUKQo+PiA+PiBbIDAuMDQxOTc1XSBDYWxsIFRyYWNlOgo+PiA+PiBbIDAuMDQy
ODEzXSBbPGZmZmZmZmZmODAwMDY3YTQ+XSBkdW1wX2JhY2t0cmFjZSsweDFjLzB4MjQKPj4gPj4g
WyAwLjA0NDgzMl0gWzxmZmZmZmZmZjgwOTQ1OTgwPl0gc2hvd19zdGFjaysweDJjLzB4MzgKPj4g
Pj4gWyAwLjA0NTcyNF0gWzxmZmZmZmZmZjgwOTUyMjE0Pl0gZHVtcF9zdGFja19sdmwrMHgzYy8w
eDU0Cj4+ID4+IFsgMC4wNDY4NDFdIFs8ZmZmZmZmZmY4MDk1MjI0MD5dIGR1bXBfc3RhY2srMHgx
NC8weDFjCj4+ID4+IFsgMC4wNDc0MjhdIFs8ZmZmZmZmZmY4MDk0NWU3Yz5dIHBhbmljKzB4MTA2
LzB4MjllCj4+ID4+IFsgMC4wNDc5OThdIFs8ZmZmZmZmZmY4MDE1ZjE0Yz5dIGttZW1fY2FjaGVf
Y3JlYXRlX3VzZXJjb3B5KzB4MjBlLzB4MjU4Cj4+ID4+IFsgMC4wNDg3ODZdIFs8ZmZmZmZmZmY4
MGEwNDRkYz5dIHJpc2N2X3Zfc2V0dXBfY3R4X2NhY2hlKzB4MmMvMHgzYwo+PiA+PiBbIDAuMDQ5
NTIxXSBbPGZmZmZmZmZmODBhMDNhNDg+XSBhcmNoX3Rhc2tfY2FjaGVfaW5pdCsweDEwLzB4MTgK
Pj4gPj4gWyAwLjA1NzgzMl0gWzxmZmZmZmZmZjgwYTA3MDZjPl0gZm9ya19pbml0KzB4NDIvMHgx
NjgKPj4gPj4gWyAwLjA1ODczN10gWzxmZmZmZmZmZjgwYTAwZDcwPl0gc3RhcnRfa2VybmVsKzB4
NmJhLzB4NzNhCj4+ID4+IC0tODwtLQo+PiA+Pgo+PiA+PiBUaGUgQWxwaW5lIGJvb3QgY2FuIGJl
IGZpeGVkIHdpdGggc29tZXRoaW5nIGxpa2U6Cj4+ID4+IC0tODwtLQo+PiA+PiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9rZXJuZWwvdmVjdG9yLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC92ZWN0b3Iu
Ywo+PiA+PiBpbmRleCBmOTc2OTcwM2ZkMzkuLjBhYzc5YTljZGJhNSAxMDA2NDQKPj4gPj4gLS0t
IGEvYXJjaC9yaXNjdi9rZXJuZWwvdmVjdG9yLmMKPj4gPj4gKysrIGIvYXJjaC9yaXNjdi9rZXJu
ZWwvdmVjdG9yLmMKPj4gPj4gQEAgLTUzLDYgKzUzLDkgQEAgaW50IHJpc2N2X3Zfc2V0dXBfdnNp
emUodm9pZCkKPj4gPj4KPj4gPj4gIHZvaWQgX19pbml0IHJpc2N2X3Zfc2V0dXBfY3R4X2NhY2hl
KHZvaWQpCj4+ID4+ICB7Cj4+ID4+ICsgICAgICAgaWYgKCFyaXNjdl92X3ZzaXplKQo+PiA+PiAr
ICAgICAgICAgICAgICAgcmV0dXJuOwo+PiA+PiArCj4+ID4+ICAgICAgICAgcmlzY3Zfdl91c2Vy
X2NhY2hlcCA9IGttZW1fY2FjaGVfY3JlYXRlX3VzZXJjb3B5KCJyaXNjdl92ZWN0b3JfY3R4IiwK
Pj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcmlzY3Zfdl92c2l6ZSwgMTYsIFNMQUJfUEFOSUMsCj4+ID4+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDAsIHJpc2N2X3ZfdnNp
emUsIE5VTEwpOwo+PiA+PiAtLTg8LS0KPj4gPgo+PiA+IFNvcnJ5IGZvciB0aGF0ISBJIGZvcmdv
dCB0byBkbyBhIGhhc192ZWN0b3IoKSBjaGVjayBiZWZvcmUgY3JlYXRpbmcKPj4gPiB0aGUgY2Fj
aGUuIEkgYW0gZ29pbmcgdG8gc2VuZCBhIHBhdGNoIHRvIGZpeCBpdC4KPj4KPj4gVGhleSBkb24n
dCBmYWlsIGZvciBtZSBlaXRoZXIsIHdoaWNoIGlzIGhvdyB0aGV5IGVuZGVkIHVwIG9uIGZvci1u
ZXh0Lgo+PiBTbyBzb3JyeSBJIG1pc3NlZCBpdC4KPj4KPj4gRG8geW91IGhhdmUgYSBmaXg/ICBP
dGhlcndpc2UgSSBjYW4ganVzdCBkcm9wIHRoZXNlIGZyb20gZm9yLW5leHQgYW5kIHdlCj4+IGNh
biBkbyBhIHYxMSAtLSBpdCdzIHRoZSB0aXAgb2YgZm9yLW5leHQsIHNvIHN0aWxsIHByZXR0eSBl
YXN5IHRhIGJhY2sKPj4gb3V0Lgo+Cj4gSSBkb24ndCBoYXZlIHRoZSBmdWxsIGZpeCBmb3Igbm93
LCBzbyBJIHRoaW5rIHdlIHNob3VsZCBkcm9wIHRvCj4gcHJldmVudCBibG9ja2luZyBvdGhlcnMn
IHdvcmtmbG93LgoKT0ssIEkgZHJvcHBlZCBpdC4KCj4KPj4KPj4gPgo+PiA+Pgo+PiA+PiBidXQg
d2l0aCB0aGlzICJmaXgiIGluIHBsYWNlIEkgc3RpbGwgZ2V0IFVidW50dSBib290IGZhaWx1cmVz
LiBUbwo+PiA+PiByZXByb2R1Y2UgdGhlIENJIGxvY2FsbHk6Cj4+ID4+Cj4+ID4+ICAgfCBnaXQg
ZmV0Y2ggaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4LXJpc2N2L2xpbnV4LXJpc2N2IGUyYWFkNzVi
MzQwZDY1YjBiZTRkMWE2ODlkYjNlMTBjNmVkM2YxOGUKPj4gPj4gICB8IGdpdCBjaGVja291dCBG
RVRDSF9IRUFECj4+ID4+ICAgfCBkb2NrZXIgcHVsbCBnaGNyLmlvL2xpbnV4LXJpc2N2L3B3LWJ1
aWxkZXItbXVsdGk6bGF0ZXN0Cj4+ID4+ICAgfCBkb2NrZXIgcnVuIC1pdCAtLXZvbHVtZSAkUFdE
Oi9idWlsZC9teS1saW51eCBnaGNyLmlvL2xpbnV4LXJpc2N2L3B3LWJ1aWxkZXItbXVsdGk6bGF0
ZXN0IGJhc2gKPj4gPj4gICB8ICMgSW4gY29udGFpbmVyCj4+ID4+ICAgfCBiYXNoIC1sCj4+ID4+
ICAgfCBta2RpciAtcCAvYnVpbGQva2VybmVscy9sb2dzCj4+ID4+ICAgfCAuZ2l0aHViL3Njcmlw
dHMvc2VyaWVzL3ByZXBhcmVfdGVzdHMuc2gKPj4gPj4gICB8IGNkIC9idWlsZC9teS1saW51eAo+
PiA+PiAgIHwgLmdpdGh1Yi9zY3JpcHRzL3Nlcmllcy9rZXJuZWxfYnVpbGRlci5zaCBydjY0IGRl
ZmNvbmZpZyBwbGFpbiBnY2MKPj4gPj4gICB8IC5naXRodWIvc2NyaXB0cy9zZXJpZXMvdGVzdF9y
dW5uZXIuc2ggcnY2NCBkZWZjb25maWcgcGxhaW4gZ2NjIHVidW50dQo+PiA+PiAgIHwgLmdpdGh1
Yi9zY3JpcHRzL3Nlcmllcy90ZXN0X3J1bm5lci5zaCBydjY0IGRlZmNvbmZpZyBwbGFpbiBnY2Mg
YWxwaW5lCj4+ID4KPj4gPiBJdCdzIHdlaXJkIHRoYXQgdGhlc2UgZXJyb3JzIGRvIG5vdCBzaG93
IHVwIGluIG15IHRlc3QgZW52aXJvbm1lbnQuIEkKPj4gPiB3aWxsIHRyeSB0byByZXByb2R1Y2Ug
aXQgd2l0aCB0aGUgc2NyaXB0IGFib3ZlLgo+PiA+Cj4+ID4+Cj4+ID4+IExvZ3MgaW4gL2J1aWxk
L3Rlc3RzL3J1bl90ZXN0Kgo+PiA+Pgo+PiA+PiBJJ2xsIGNvbnRpbnVlIHRvIGRlYnVnIGluIHRo
ZSBtZWFudGltZS4KPj4gPj4KPj4gPj4KPj4gPj4gQmrDtnJuCj4+ID4KPj4gPiBUaGFua3MsCj4+
ID4gQW5keQo+PiA+Cj4+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPj4gPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPj4gPiBsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCj4+ID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo+Cj4gU29ycnkgZm9yIHRoYXQhCj4KPiBUaGFua3MsCj4g
QW5keQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
