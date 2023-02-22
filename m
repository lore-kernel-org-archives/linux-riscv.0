Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75AFDC61DA4
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Feb 2023 16:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=eEFjds+W0B780IghyXIhiVunZPv4emIreql3H9NnE6Q=; b=JC+h8kGtEheMvk3cwfL79Vikvb
	QiaBcgn1Kf2QePNweVqFD0nAtxKnWpDAu5+iseQRjSejbsISbIE5dVYb8fiHhFLHtyXaFGs8X3V0y
	0rGw7sy/5b7cWQePZYqbz3KUh/CQEc26KE4IR+kiHDAj6/GcjmxmRCvUbrV/2VoA496vC1gP1bUJQ
	q0rxJxgk+lgPeGWDWuPz/EbM8hAlkUYNRqTeOtyF6Rx+jtgxDFsowou52CFLm5jBWufiICVyKMFIo
	s7/b8A2SIWAgs0i68UB6Z8DsLA41YgD0kQNAINsq/nT1QKtHLPfYajiQQWh4fSusIvygx+BJpe2u+
	rIKmWM+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUsGx-00D5FJ-Hc; Wed, 22 Feb 2023 16:47:15 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUsGu-00D5Db-Na
	for linux-riscv@lists.infradead.org; Wed, 22 Feb 2023 16:47:14 +0000
Received: by mail-pl1-x636.google.com with SMTP id u14so5513915ple.7
        for <linux-riscv@lists.infradead.org>; Wed, 22 Feb 2023 08:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9GR/QuY3oOoskYEjTiKtXBHhLh2d1Tp4gFJxiWtEgak=;
        b=WHKSUJKHCf6PCq+gaSdK0rceIkyiiGyk68lxUUZkUH8fFNl7S71/mI9sL++qmgcQQh
         LKDAiKo2D4xt7mEdQ7/0AgdIVKp3pRbGYHoCWz1ArfVv2WeDE4LMTBE6tMTTo8WfJTbi
         VvC9WeNQSlH0bXo322Yc8n05Ekxcgakfboih5rd81wwMmiv40/9lFef2C7heb3RmM9A5
         7TCSoZIJm+11ot/iy1j37w4fczkCUUXWcj8SMy6z3Cxez9h7WxIkSs1bg6legHpOePlc
         owFmIe4tu1SgGcgxkO9OT7Sx7+0Fy32hLRMho3Ob37CcUcPJ/f0r4eOGwumn8YrO0EGQ
         DHvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9GR/QuY3oOoskYEjTiKtXBHhLh2d1Tp4gFJxiWtEgak=;
        b=HzXs6uTVliZWNPJCtgpS8ceZM2NvgBy629fHXlwMDhkrf7TBfL4dafHF3jOdTBFayj
         X0pjRUy+eoUfQK2jWImYl1KXTwkJGIcldWnyiBJoW2Uq326AIkSWrrk7OUS/+uOr+45s
         7Y/OjHl671poI0wELGI4dTZWmDN4/Jk7AWnm3MkIJDV8x/oejOKPqQW8gnuYfkhXSZWT
         3JzXVNocbcyUYOeO6/qFQNwq4mloNlxa0O2j3CZ8Tq6Ja5fPNsHe8uKfQ9U0XniRE8Ib
         QqJOPj5Gkfhdsgz+T1TIjnAyI/NRr7s3OP2Ss2cLy+apnjjajFPfpLyWly1pNFmYF4gH
         cDqw==
X-Gm-Message-State: AO0yUKWJRMnYMH693eAapfQdL9eh1PSp2qgM6Nww3RL7VJI3ObaiOBx9
	aKAoPUh8Kwk9oxFTS8d0rNH10w==
X-Google-Smtp-Source: AK7set93tz62gSShSEh/KZvKg1wlle5DXbRohVspSLV1t/yE751SoMbfSa8UYaJuNudTxhMHSxi/Ww==
X-Received: by 2002:a05:6a20:3d82:b0:c7:6453:5654 with SMTP id s2-20020a056a203d8200b000c764535654mr10908411pzi.45.1677084431071;
        Wed, 22 Feb 2023 08:47:11 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id u7-20020aa78387000000b005897f5436c0sm823765pfm.118.2023.02.22.08.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 08:47:10 -0800 (PST)
Date: Wed, 22 Feb 2023 08:47:10 -0800 (PST)
X-Google-Original-Date: Wed, 22 Feb 2023 08:46:27 PST (-0800)
Subject: Re: [PATCH v1] RISC-V: take text_mutex during alternative patching
In-Reply-To: <3212670.oiGErgHkdL@diego>
CC: linux@roeck-us.net, ajones@ventanamicro.com, Conor Dooley <conor@kernel.org>,
  Conor Dooley <conor.dooley@microchip.com>, samuel@sholland.org, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: heiko@sntech.de
Message-ID: <mhng-72b23626-1921-454b-bba8-aec29b32048d@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_084712_828428_03D3622D 
X-CRM114-Status: GOOD (  39.09  )
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

T24gV2VkLCAyMiBGZWIgMjAyMyAwNzozOToxMSBQU1QgKC0wODAwKSwgaGVpa29Ac250ZWNoLmRl
IHdyb3RlOgo+IEFtIE1pdHR3b2NoLCAyMi4gRmVicnVhciAyMDIzLCAxNjozMToyNSBDRVQgc2No
cmllYiBBbmRyZXcgSm9uZXM6Cj4+IE9uIFdlZCwgRmViIDIyLCAyMDIzIGF0IDAzOjI3OjQzUE0g
KzAxMDAsIEFuZHJldyBKb25lcyB3cm90ZToKPj4gPiBPbiBUaHUsIEZlYiAxNiwgMjAyMyBhdCAw
NzozMzo1NUFNIC0wODAwLCBHdWVudGVyIFJvZWNrIHdyb3RlOgo+PiA+ID4gT24gMi8xNS8yMyAx
NDowMCwgSGVpa28gU3TDvGJuZXIgd3JvdGU6Cj4+ID4gPiBbIC4uLiBdCj4+ID4gPiA+IAo+PiA+
ID4gPiBTbyBub3cgSSd2ZSBhbHNvIHRlc3RlZCBQYWxtZXIncyBmb3ItbmV4dCBhdAo+PiA+ID4g
PiAgICBjb21taXQgZWM2MzExOTE5ZWE2ICgiTWVyZ2UgcGF0Y2ggc2VyaWVzICJyaXNjdjogT3B0
aW1pemUgZnVuY3Rpb24gdHJhY2UiIikKPj4gPiA+ID4gCj4+ID4gPiA+IGFnYWluIHdpdGggdGhl
IHNhbWUgdmFyaWFudHMKPj4gPiA+ID4gLSBxZW11LXJpc2N2MzIgd2l0aG91dCB6YmIKPj4gPiA+
ID4gLSBxZW11LXJpc2N2MzIgd2l0aCB6YmIKPj4gPiA+ID4gLSBxZW11LXJpc2N2NjQgd2l0aG91
dCB6YmIKPj4gPiA+ID4gLSBxZW11LXJpc2N2NjQgd2l0aCB6YmIKPj4gPiA+ID4gCj4+ID4gPiA+
IEFuZCBhbGwgb2YgdGhlbSBib290ZWQgZmluZSBpbnRvIGEgbmZzLXJvb3QgKGRlYmlhbiBmb3Ig
cmlzY3Y2NCBhbmQgYQo+PiA+ID4gPiBidWlsZHJvb3QgZm9yIHJpc2N2MzIpLgo+PiA+ID4gPiAK
Pj4gPiA+ID4gSSBldmVuIGZvcmNlZCBhIGJ1ZyBpbnRvIHRoZSB6YmIgY29kZSB0byBtYWtlIHN1
cmUgdGhlIHBhdGNoaW5nIHdvcmtlZAo+PiA+ID4gPiBjb3JyZWN0bHkgKHdoZXJlIHRoZSBrZXJu
ZWwgZmFpbGVkIGFzIGV4cGVjdGVkKS4KPj4gPiA+ID4gCj4+ID4gPiA+IFFlbXUtdmVyc2lvbiBm
b3IgbWUgd2FzIDcuMi41MCAodjcuMi4wLTc0NC1nNWEzNjMzOTI5YS1kaXJ0eSkKPj4gPiA+ID4g
Cj4+ID4gPiA+IEkgZGlkIHRyeSB0aGUgb25lIGZyb20gRGViaWFuLXN0YWJsZSAocWVtdS01LjIp
IGJ1dCB0aGF0IHdhcyB0b28gb2xkIGFuZAo+PiA+ID4gPiBkaWRuJ3Qgc3VwcG9ydCBaYmIgeWV0
Lgo+PiA+ID4gPiAKPj4gPiA+ID4gT25lIHRoaW5nIG9mIG5vdGUsIHRoZSAiYWN0aXZlIiAzMmJp
dCBjb25maWcgSSBoYWQsIHNvbWVob3cgZGlkbid0IHByb2R1Y2UKPj4gPiA+ID4gd29ya2luZyBp
bWFnZXMgYW5kIEkgbmVlZGVkIHRvIHN0YXJ0IGEgbmV3IGJ1aWxkIHVzaW5nIHRoZSBydjMyX2Rl
ZmNvbmZpZy4KPj4gPiA+ID4gCj4+ID4gPiA+IFNvIHJpZ2h0IG5vdywgSSdtIG5vdCBzdXJlIHdo
YXQgbW9yZSB0byB0ZXN0IHRob3VnaC4KPj4gPiA+ID4gCj4+ID4gPiAKPj4gPiA+IEFub3RoZXIg
ZXhhbXBsZToKPj4gPiA+IAo+PiA+ID4gLSBidWlsZCBkZWZjb25maWcKPj4gPiA+IC0gcnVuCj4+
ID4gPiAgIHFlbXUtc3lzdGVtLXJpc2N2NjQgLU0gdmlydCAtbSA1MTJNIC1uby1yZWJvb3QgLWtl
cm5lbCBhcmNoL3Jpc2N2L2Jvb3QvSW1hZ2UgXAo+PiA+ID4gICAgIC1zbmFwc2hvdCAtZGV2aWNl
IHZpcnRpby1ibGstZGV2aWNlLGRyaXZlPWQwIC1kcml2ZSBmaWxlPXJvb3Rmcy5leHQyLGlmPW5v
bmUsaWQ9ZDAsZm9ybWF0PXJhdyBcCj4+ID4gPiAgICAgLWFwcGVuZCAicm9vdD0vZGV2L3ZkYSBj
b25zb2xlPXR0eVMwLDExNTIwMCBlYXJseWNvbj11YXJ0ODI1MCxtbWlvLDB4MTAwMDAwMDAsMTE1
MjAwIiBcCj4+ID4gPiAgICAgLW5vZ3JhcGhpYyAtbW9uaXRvciBub25lCj4+ID4gPiAKPj4gPiA+
IFdpdGggQ09ORklHX1JJU0NWX0lTQV9aQkI9eSwgdGhhdCByZXN1bHRzIGluCj4+ID4gPiAKPj4g
PiA+IFsgICAgMC44MTgyNjNdIC9kZXYvcm9vdDogQ2FuJ3Qgb3BlbiBibG9ja2Rldgo+PiA+ID4g
WyAgICAwLjgxODg1Nl0gVkZTOiBDYW5ub3Qgb3BlbiByb290IGRldmljZSAiL2Rldi92ZGEiIG9y
IHVua25vd24tYmxvY2soMCwwKTogZXJyb3IgLTYKPj4gPiA+IFsgICAgMC44MTkxNzddIFBsZWFz
ZSBhcHBlbmQgYSBjb3JyZWN0ICJyb290PSIgYm9vdCBvcHRpb247IGhlcmUgYXJlIHRoZSBhdmFp
bGFibGUgcGFydGl0aW9uczoKPj4gPiA+IFsgICAgMC44MTk4MDhdIGZlMDAgICAgICAgICAgIDE2
Mzg0IHZkYQo+PiA+ID4gWyAgICAwLjgxOTk0NF0gIGRyaXZlcjogdmlydGlvX2Jsawo+PiA+ID4g
WyAgICAwLjgyMDUzNF0gS2VybmVsIHBhbmljIC0gbm90IHN5bmNpbmc6IFZGUzogVW5hYmxlIHRv
IG1vdW50IHJvb3QgZnMgb24gdW5rbm93bi1ibG9jaygwLDApCj4+ID4gPiBbICAgIDAuODIxMTAx
XSBDUFU6IDAgUElEOiAxIENvbW06IHN3YXBwZXIvMCBOb3QgdGFpbnRlZCA2LjIuMC1yYzgtbmV4
dC0yMDIzMDIxNi0wMDAwMi1nODAzMzI4MjVlMjQwICM0Cj4+ID4gPiBbICAgIDAuODIxNjcyXSBI
YXJkd2FyZSBuYW1lOiByaXNjdi12aXJ0aW8scWVtdSAoRFQpCj4+ID4gPiBbICAgIDAuODIyMDUw
XSBDYWxsIFRyYWNlOgo+PiA+ID4gWyAgICAwLjgyMjQyN10gWzxmZmZmZmZmZjgwMDA1M2U0Pl0g
ZHVtcF9iYWNrdHJhY2UrMHgxYy8weDI0Cj4+ID4gPiBbICAgIDAuODIyODM0XSBbPGZmZmZmZmZm
ODA3ZjkwZTQ+XSBzaG93X3N0YWNrKzB4MmMvMHgzOAo+PiA+ID4gWyAgICAwLjgyMzA4NV0gWzxm
ZmZmZmZmZjgwODAzYWVhPl0gZHVtcF9zdGFja19sdmwrMHgzYy8weDU0Cj4+ID4gPiBbICAgIDAu
ODIzMzUxXSBbPGZmZmZmZmZmODA4MDNiMTY+XSBkdW1wX3N0YWNrKzB4MTQvMHgxYwo+PiA+ID4g
WyAgICAwLjgyMzYwMV0gWzxmZmZmZmZmZjgwN2Y5NDRjPl0gcGFuaWMrMHgxMDIvMHgyOWUKPj4g
PiA+IFsgICAgMC44MjM4MzRdIFs8ZmZmZmZmZmY4MGEwMTVlMj5dIG1vdW50X2Jsb2NrX3Jvb3Qr
MHgxOGMvMHgyM2UKPj4gPiA+IFsgICAgMC44MjQxNDhdIFs8ZmZmZmZmZmY4MGEwMTg3Yz5dIG1v
dW50X3Jvb3QrMHgxZTgvMHgyMTgKPj4gPiA+IFsgICAgMC44MjQzOThdIFs8ZmZmZmZmZmY4MGEw
MTllZT5dIHByZXBhcmVfbmFtZXNwYWNlKzB4MTQyLzB4MTg0Cj4+ID4gPiBbICAgIDAuODI0NjU1
XSBbPGZmZmZmZmZmODBhMDExODI+XSBrZXJuZWxfaW5pdF9mcmVlYWJsZSsweDIzNi8weDI1YQo+
PiA+ID4gWyAgICAwLjgyNDkzNF0gWzxmZmZmZmZmZjgwODA0NjAyPl0ga2VybmVsX2luaXQrMHgx
ZS8weDEwYQo+PiA+ID4gWyAgICAwLjgyNTIwMV0gWzxmZmZmZmZmZjgwMDAzNTYwPl0gcmV0X2Zy
b21fZXhjZXB0aW9uKzB4MC8weDE2Cj4+ID4gPiBbICAgIDAuODI2MTgwXSAtLS1bIGVuZCBLZXJu
ZWwgcGFuaWMgLSBub3Qgc3luY2luZzogVkZTOiBVbmFibGUgdG8gbW91bnQgcm9vdCBmcyBvbiB1
bmtub3duLWJsb2NrKDAsMCkgXS0tLQo+PiA+ID4gCj4+ID4gPiBUaGlzIHdvcmtzIGZpbmUgaWYg
Q09ORklHX1JJU0NWX0lTQV9aQkIgaXMgbm90IGVuYWJsZWQuCj4+ID4gPiAKPj4gPiA+IFRlc3Rl
ZCB3aXRoIGdjYyAxMS4zLCBiaW51dGlscyAyLjM5LCBxZW11IHY3LjIuMCBhbmQgcWVtdSBidWls
dCBmcm9tIG1haW5saW5lLgo+PiA+ID4KPj4gPiAKPj4gPiBKdXN0IHRvICsxIHRoaXMsIEkgZ2V0
IHRoZSBzYW1lIHJlc3VsdCAodW5hYmxlIHRvIG1vdW50IHJvb3QgZnMpIHdpdGgKPj4gPiAKPj4g
PiAkUUVNVSAtY3B1IHJ2NjQsemJiPW9uIFwKPj4gPiAgICAgICAgIC1ub2dyYXBoaWMgXAo+PiA+
ICAgICAgICAgLW1hY2hpbmUgdmlydCBcCj4+ID4gICAgICAgICAta2VybmVsICRLRVJORUwgXAo+
PiA+ICAgICAgICAgLWFwcGVuZCAncm9vdD0vZGV2L3ZkYSBjb25zb2xlPXR0eVMwJyBcCj4+ID4g
ICAgICAgICAtZHJpdmUgZmlsZT1kaXNrLmV4dDQsZm9ybWF0PXJhdyxpZD1oZDAgXAo+PiA+ICAg
ICAgICAgLWRldmljZSB2aXJ0aW8tYmxrLXBjaSxkcml2ZT1oZDAKPj4gPiAKPj4gPiBrZXJuZWw6
ICAgbGF0ZXN0IHJpc2N2LWxpbnV4L2Zvci1uZXh0ICg4NjU4ZGIwYTRhMGYpLCBkZWZjb25maWcK
Pj4gPiBnY2M6ICAgICAgcmlzY3YtZ251LXRvb2xjaGFpbiAoMTIuMS4wKQo+PiA+IGJpbnV0aWxz
OiByaXNjdi1nbnUtdG9vbGNoYWluICgyLjM5KQo+PiA+IHFlbXU6ICAgICBsYXRlc3QgbWFzdGVy
ICg3OWI2NzdkNjU4ZDMpCj4+ID4gCj4+ID4gRmxpcHBpbmcgdGhlIFFFTVUgY3B1IHpiYiBwcm9w
ZXJ0eSBvZmYgYWxsb3dzIGJvb3QgdG8gc3VjY2VlZCwgaS5lLiBpdCdzCj4+ID4gbm90IG5lY2Vz
c2FyeSB0byBjb21waWxlIG91dCB0aGUgQ09ORklHX1JJU0NWX0lTQV9aQkIgY29kZSBmcm9tIHRo
ZQo+PiA+IGtlcm5lbCwgaXQncyBqdXN0IG5lY2Vzc2FyeSB0byBhdm9pZCB1c2luZyBpdC4KPj4g
Pgo+PiAKPj4gTG9va3MgbGlrZSBzb21ldGhpbmcgaW4gdGhlIHN0cm5jbXAgaW1wbGVtZW50YXRp
b24uIE9ubHkgY29tbWVudGluZyBpdAo+PiBvdXQgYWxsb3dzIGJvb3QgdG8gc3VjY2VlZC4KPgo+
IGFuZCBpbnRlcmVzdGluZ2x5IGl0IHNlZW1zIHRvIGJlIHNvbWV0aGluZyB2ZXJ5IHNwZWNpZmlj
LiBJLmUuIG15IHNldHVwIGlzCj4gbmZzcm9vdC1iYXNlZCAocWVtdSBpcyAianVzdCIgYW5vdGhl
ciBib2FyZCBpbiBteSBib2FyZGZhcm0pIGFuZCBib290aW5nCj4gaW50byBhbiBuZnMtcm9vdCB3
b3JrcyBxdWl0ZSBuaWNlbHkuCj4KPiBJIGd1ZXNzIEkgbmVlZCB0byBsb29rIGludG8gaG93IHRv
IGdldCBhbiBhY3R1YWwgZGlzay1pbWFnZSBpbiB0aGVyZS4KCkl0IGxvb2tzIGxpa2UgRHJldyBp
c24ndCB1c2luZyBhbiBpbml0cmQgKGFuZCB3aXRoIE5GUywgcHJlc3VtYWJseSB5b3UgCmFyZSk/
ICBUaGF0J3MgcHJvYmFibHkgYSBiaWcgZGlmZmVyZW5jZSBhcyB3ZWxsLgoKPgo+Cj4+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2xpYi9zdHJuY21wLlMgYi9hcmNoL3Jpc2N2L2xpYi9zdHJuY21w
LlMKPj4gaW5kZXggZWU0OTU5NTA3NWJlLi4wYmYwM2FiZTFjZWQgMTAwNjQ0Cj4+IC0tLSBhL2Fy
Y2gvcmlzY3YvbGliL3N0cm5jbXAuUwo+PiArKysgYi9hcmNoL3Jpc2N2L2xpYi9zdHJuY21wLlMK
Pj4gQEAgLTksNyArOSw3IEBACj4+ICAvKiBpbnQgc3RybmNtcChjb25zdCBjaGFyICpjcywgY29u
c3QgY2hhciAqY3QsIHNpemVfdCBjb3VudCkgKi8KPj4gIFNZTV9GVU5DX1NUQVJUKHN0cm5jbXAp
Cj4+IAo+PiAtICAgICAgIEFMVEVSTkFUSVZFKCJub3AiLCAiaiBzdHJuY21wX3piYiIsIDAsIFJJ
U0NWX0lTQV9FWFRfWkJCLCBDT05GSUdfUklTQ1ZfSVNBX1pCQikKPj4gKy8vICAgICBBTFRFUk5B
VElWRSgibm9wIiwgImogc3RybmNtcF96YmIiLCAwLCBSSVNDVl9JU0FfRVhUX1pCQiwgQ09ORklH
X1JJU0NWX0lTQV9aQkIpCj4+IAo+PiAgICAgICAgIC8qCj4+ICAgICAgICAgICogUmV0dXJucwo+
PiAKPj4gCj4+IFRoYW5rcywKPj4gZHJldwo+PiAKPgo+Cj4KPgo+Cj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
