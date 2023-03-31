Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8852EC76196
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Mar 2023 10:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RThpo3SvHXf1Ofi565Yjh7VaMgRFHLAwVgf2Obpclas=; b=f4C0RisB85Jxk6
	9qYqUFEpW9fz0oznSyBJqeXlbH9aqxCReB9W7oYeyRrz+oyuMSR9Y1cL+USh2cvwTUvzzA5qcnwrs
	CFEcVEXwhhPci6naDvMhd8UxAcckOrk8OI4aDixAp1G5/+H29F0Ftu13ZJJi1wqn3BP1ujDo5R7bJ
	cYI0yYOog0DmGPjZT0v1d6Dul7mKft4j08qTkI5gdGqgTNGq8Zah0i+owN5njVYAVVHXcb6PneF4K
	HmheAHpQy9JoiaQputs9kXci+gsEWxkdBsjayjAVWpYPdiuGLlHPT1MHeS4sz66+VQCdUTROFXJjI
	nAgwQuIg4JYE21QbqNHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piC91-006xV7-1B;
	Fri, 31 Mar 2023 10:38:07 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piC8s-006xRP-12
	for linux-riscv@lists.infradead.org;
	Fri, 31 Mar 2023 10:37:59 +0000
Received: by mail-il1-x12b.google.com with SMTP id u8so11293043ilb.2
        for <linux-riscv@lists.infradead.org>; Fri, 31 Mar 2023 03:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680259076; x=1682851076;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QUiku2B78vEOH052ZN8XRaDAeW3h69Wsq5FDDUf//oM=;
        b=pI4yOYgL0ekEvp5y5Rs1jD0v72Hknn+4BAAYXJkuwySgS/8eGcwVLC4LpnaxmuiJAT
         DLBYCIN0PyuqrWohQKXduCRG3pf5ukRTeyIomgnHuTfKKpml+JUeK5DP/qAhxZ0rkRQX
         Mi3aP2yTG/n7rUFEpYFyi0ipMNAHtKAzbNQZHGNrxf6f7RT64DmKckmKF/Nf7JfrZk01
         KVZrYHsbfciCXovvxRAzNWArcSLE+ZtjiAdDubFTHLmh7HS50/b1WUl5H1k251GGiC0v
         DgDtAp6/4OoiHzAcoEcxiXMFVxUc5OZRvC1UKTpJiCdAlQOhIHX4X7ZJh3Sb/KbBVUv4
         xq5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680259076; x=1682851076;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QUiku2B78vEOH052ZN8XRaDAeW3h69Wsq5FDDUf//oM=;
        b=Dvgr8nI3WM6hKlBGx1fAC+m4rUla8C/hduBWndvyLrqUmZ4FqE14QOh7H6NeWvg+k4
         iFaLqyVS3X+APwqxRskrwEOLiCT6s0MakOQWrzlw4fYxqkvGq6m10bmRiStTWL02RWur
         EU0xMubjLVvxlPAJq/d9+3c10jB/tfYupb4K8pERAjf37sUKuHu4S8zqO/9IF4rZiEmi
         RdlsoaEe/TJGOjE7KAhmSCSTO4BLRPaOqC3w/AqqOLisYsm49rxZSH8nnODtR92nnyr2
         p2dS8NXlKmsUEyKOxgmzZoP4LE2LJ/ij5kVPWemJCXP5MoUgbKBSUbboPUmSx62Rm1tp
         jvvQ==
X-Gm-Message-State: AAQBX9dO1WMRl61MB5h6ZLxZrHKo88lZrv0K41m/t0Jgh64QfaSunkVN
	3Bdw52WbwxBMvLca9SyK0foyvEA2FpOHmT2cGBM=
X-Google-Smtp-Source: AKy350b+1wX54SGQACYQNp6bcyF5SliWY7u6rIqm1x12bFKcs3OKgJfvcculvD/olhBqGwByiFqeZeHcBWEJpYVDD2w=
X-Received: by 2002:a05:6e02:180f:b0:325:dae2:4238 with SMTP id
 a15-20020a056e02180f00b00325dae24238mr6073826ilv.2.1680259076444; Fri, 31 Mar
 2023 03:37:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230330204217.47666-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230330204217.47666-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <6ca5941a-8803-477d-8b40-17292decc5af@app.fastmail.com>
In-Reply-To: <6ca5941a-8803-477d-8b40-17292decc5af@app.fastmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 31 Mar 2023 11:37:30 +0100
Message-ID: <CA+V-a8tkiDXG37YjFKPxrGoXVQMVBemMdBcfb+uUDzBofOWH_A@mail.gmail.com>
Subject: Re: [PATCH v7 1/6] riscv: mm: dma-noncoherent: Switch using function
 pointers for cache management
To: Arnd Bergmann <arnd@arndb.de>
Cc: "Conor.Dooley" <conor.dooley@microchip.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	guoren <guoren@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Samuel Holland <samuel@sholland.org>, 
	linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_033758_360923_18369DDF 
X-CRM114-Status: GOOD (  39.75  )
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

SGkgQXJuZCwKClRoYW5rIHlvdSBmb3IgdGhlIHJldmlldy4KCk9uIFRodSwgTWFyIDMwLCAyMDIz
IGF0IDEwOjM04oCvUE0gQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4gd3JvdGU6Cj4KPiBP
biBUaHUsIE1hciAzMCwgMjAyMywgYXQgMjI6NDIsIFByYWJoYWthciB3cm90ZToKPiA+IEZyb206
IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4K
PiA+Cj4gPiBDdXJyZW50bHksIHNlbGVjdGluZyB3aGljaCBDTU9zIHRvIHVzZSBvbiBhIGdpdmVu
IHBsYXRmb3JtIGlzIGRvbmUgdXNpbmcKPiA+IGFuZCBBTFRFUk5BVElWRV9YKCkgbWFjcm8uIFRo
aXMgd2FzIG1hbmFnZWFibGUgd2hlbiB0aGVyZSB3ZXJlIGp1c3QgdHdvCj4gPiBDTU8gaW1wbGVt
ZW50YXRpb25zLCBidXQgbm93IHRoYXQgdGhlcmUgYXJlIG1vcmUgYW5kIG1vcmUgcGxhdGZvcm1z
IGNvbWluZwo+ID4gbmVlZGluZyBjdXN0b20gQ01PcywgdGhlIHVzZSBvZiB0aGUgQUxURVJOQVRJ
VkVfWCgpIG1hY3JvIGlzIHVubWFuYWdlYWJsZS4KPiA+Cj4gPiBUbyBhdm9pZCBzdWNoIGlzc3Vl
cyB0aGlzIHBhdGNoIHN3aXRjaGVzIHRvIHVzZSBvZiBmdW5jdGlvbiBwb2ludGVycwo+ID4gaW5z
dGVhZCBvZiBBTFRFUk5BVElWRV9YKCkgbWFjcm8gZm9yIGNhY2hlIG1hbmFnZW1lbnQgKHRoZSBv
bmx5IGRyYXdiYWNrCj4gPiBiZWluZyBwZXJmb3JtYW5jZSBvdmVyIHRoZSBwcmV2aW91cyBhcHBy
b2FjaCkuCj4gPgo+ID4gdm9pZCAoKmNsZWFuX3JhbmdlKSh1bnNpZ25lZCBsb25nIGFkZHIsIHVu
c2lnbmVkIGxvbmcgc2l6ZSk7Cj4gPiB2b2lkICgqaW52X3JhbmdlKSh1bnNpZ25lZCBsb25nIGFk
ZHIsIHVuc2lnbmVkIGxvbmcgc2l6ZSk7Cj4gPiB2b2lkICgqZmx1c2hfcmFuZ2UpKHVuc2lnbmVk
IGxvbmcgYWRkciwgdW5zaWduZWQgbG9uZyBzaXplKTsKPiA+Cj4gPiBUaGUgYWJvdmUgZnVuY3Rp
b24gcG9pbnRlcnMgYXJlIHByb3ZpZGVkIHRvIGJlIG92ZXJyaWRkZW4gZm9yIHBsYXRmb3Jtcwo+
ID4gbmVlZGluZyBDTU8uCj4gPgo+ID4gQ29udmVydCBaSUNCT00gYW5kIFQtSEVBRCBDTU8gdG8g
dXNlIGZ1bmN0aW9uIHBvaW50ZXJzLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IExhZCBQcmFiaGFr
YXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPgo+IFRoaXMgaXMg
bG9va2luZyBwcmV0dHkgZ29vZC4gVGhlcmUgYXJlIGEgZmV3IHRoaW5ncyB0aGF0IEkKPiBzdGls
bCBzZWUgc3RpY2tpbmcgb3V0LCBhbmQgSSB0aGluayBJJ3ZlIG1lbnRpb25lZCBzb21lIG9mCj4g
dGhlbSBiZWZvcmUsIGJ1dCBkb24ndCByZW1lbWJlciBpZiB0aGVyZSB3YXMgYSByZWFzb24gZm9y
Cj4gZG9pbmcgaXQgbGlrZSB0aGlzOgo+Cj4gPiArI2lmZGVmIENPTkZJR19FUlJBVEFfVEhFQURf
Q01PCj4KPiBJIHdvdWxkIHJlbmFtZSB0aGlzIHRvIG5vdCBjYWxsIHRoaXMgYW4gJ0VSUkFUQScg
YnV0Cj4ganVzdCBtYWtlIGl0IGEgZHJpdmVyLiBOb3QgaW1wb3J0YW50IHRob3VnaCwgYW5kIHRo
ZXJlCj4gd2FzIHByb2JhYmx5IGEgcmVhc29uIHlvdSBkaWQgaXQgbGlrZSB0aGlzLgo+CkFzIGFn
cmVlZCwgd2Ugd2lsbCBrZWVwIHRoaXMgYXMgaXMuCgo+ID4gK2V4dGVybiBzdHJ1Y3QgcmlzY3Zf
Y2FjaGVfb3BzIG5vbmNvaGVyZW50X2NhY2hlX29wczsKPiA+ICsKPiA+ICt2b2lkIHJpc2N2X25v
bmNvaGVyZW50X3JlZ2lzdGVyX2NhY2hlX29wcyhjb25zdCBzdHJ1Y3QgcmlzY3ZfY2FjaGVfb3Bz
Cj4gPiAqb3BzKTsKPiA+ICsKPiA+ICtzdGF0aWMgaW5saW5lIHZvaWQgcmlzY3ZfZG1hX25vbmNv
aGVyZW50X2NsZWFuKHZvaWQgKnZhZGRyLCBzaXplX3QKPiA+IHNpemUpCj4gPiArewo+ID4gKyAg
ICAgaWYgKG5vbmNvaGVyZW50X2NhY2hlX29wcy5jbGVhbl9yYW5nZSkgewo+ID4gKyAgICAgICAg
ICAgICB1bnNpZ25lZCBsb25nIGFkZHIgPSAodW5zaWduZWQgbG9uZyl2YWRkcjsKPiA+ICsKPiA+
ICsgICAgICAgICAgICAgbm9uY29oZXJlbnRfY2FjaGVfb3BzLmNsZWFuX3JhbmdlKGFkZHIsIHNp
emUpOwo+ID4gKyAgICAgfQo+ID4gK30KPgo+IFRoZSB0eXBlIGNhc2Ugc2hvdWxkIG5vdCBiZSBu
ZWNlc3NhcnkgaGVyZS4gSW5zdGVhZCBJIHdvdWxkCj4gbWFrZSB0aGUgY2FsbGJhY2tzIHVzZSAn
dm9pZCAqJyBhcyB3ZWxsLCBub3QgJ3Vuc2lnbmVkIGxvbmcnLgo+Ck9rLCBJJ2xsIHVwZGF0ZSB0
aGlzIG9uIHVzaW5nIHZvaWQgKgoKPiBJdCdzIHBvc3NpYmxlIHRoYXQgc29tZSBmdXR1cmUgY2Fj
aGUgY29udHJvbGxlciBkcml2ZXIgcmVxdWlyZXMKPiBwYXNzaW5nIHBoeXNpY2FsIGFkZHJlc3Nl
cywgYXMgaXMgY29tbW9uIGZvciBsYXN0IGxldmVsIGNhY2hlLAo+IGJ1dCBhcyBsb25nIGFzIGFs
bCBkcml2ZXJzIHBhc3MgdmlydHVhbCBhZGRyZXNzZXMsIGl0J3MgZWFzaWVyCj4gdG8gZG8gdGhl
IHBoeXNfdG9fdmlydCgpIGluIGNvbW1vbiBjb2RlLgo+CkFncmVlZC4KCj4gSXQgYWxzbyBzZWVt
cyB3cm9uZyB0byBoYXZlIHRoZSBmYWxsYmFjayBiZSB0byBkbyBub3RoaW5nCj4gd2hlbiB0aGUg
cG9pbnRlciBpcyBOVUxMLCBzaW5jZSB0aGF0IGNhbm5vdCBhY3R1YWxseSB3b3JrCj4gd2hlbiBh
IGRldmljZSBpcyBub3QgY2FjaGUgY29oZXJlbnQuCj4KSWYgdGhlIGRldmljZSBpcyBub24gY2Fj
aGUgY29oZXJlbnQgYW5kIGlmIGl0IGRvZXNuJ3Qgc3VwcG9ydCBaSUNCT00KSVNBIGV4dGVuc2lv
biB0aGUgZGV2aWNlIHdvbid0IHdvcmsgYW55d2F5LiBTbyBub24tY2FjaGUgY29oZXJlbnQKZGV2
aWNlcyB1bnRpbCB0aGV5IGhhdmUgdGhlaXIgQ01PIGNvbmZpZyBlbmFibGVkIHdvbid0IHdvcmsg
YW55d2F5LiBTbwpJIGRpZG4ndCBzZWUgYW55IGJlbmVmaXQgaW4gZW5hYmxpbmcgWklDQk9NIGJ5
IGRlZmF1bHQuIFBsZWFzZSBsZXQgbWUKa25vdyBpZiBJIGFtIG1pc3VuZGVyc3RhbmRpbmcuCgo+
IEkgd291bGQgZWl0aGVyIGluaXRpYWxpemUgdGhlIGZ1bmN0aW9uIHBvaW50ZXIgdG8gdGhlCj4g
emljYm9tIHZlcnNpb24gYW5kIHJlbW92ZSB0aGUgTlVMTCBjaGVjaywgb3Iga2VlcCB0aGUKPiBw
b2ludGVyIE5VTEwgYW5kIGhhdmUgYW4gZXhwbGljaXQKPiAnZWxzZSB6aWNib21fY2xlYW5fcmFu
Z2UoKScgZmFsbGJhY2suCj4KPiA+ICtzdGF0aWMgdm9pZCB6aWNib21fcmVnaXN0ZXJfY21vX29w
cyh2b2lkKQo+ID4gK3sKPiA+ICsgICAgIHJpc2N2X25vbmNvaGVyZW50X3JlZ2lzdGVyX2NhY2hl
X29wcygmemljYm9tX2Ntb19vcHMpOwo+ID4gK30KPiA+ICsjZWxzZQo+ID4gK3N0YXRpYyB2b2lk
IHppY2JvbV9yZWdpc3Rlcl9jbW9fb3BzKHZvaWQpIHt9Cj4gPiArI2VuZGlmCj4KPiBBcyBmYXIg
YXMgSSByZWNhbGwsIHRoZSAjZWxzZSBwYXRoIGhlcmUgd2FzIG5lZWRlZCBwcmV2aW91c2x5Cj4g
dG8gd29yayBhcm91bmQgYSBiaW51dGlscyBkZXBlbmRlbmN5LCBidXQgd2l0aCB0aGUgY3VycmVu
dAo+IGNvZGUsIGl0IHNob3VsZCBiZSBwb3NzaWJsZSB0byBqdXN0IGFsd2F5cyBlbmFibGUKPiBD
T05GSUdfUklTQ1ZfSVNBX1pJQ0JPTSB3aGVuIFJJU0NWX0RNQV9OT05DT0hFUkVOVCBpcyB1c2Vk
Lgo+CkFyZSB5b3Ugc3VnZ2VzdGluZyBzb21ldGhpbmcgbGlrZSBiZWxvdz8KCmRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tjb25maWcKaW5kZXggNGRhZGYzNWFj
NzIxLi5hNTVkZWU5OGNjZjggMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZworKysgYi9h
cmNoL3Jpc2N2L0tjb25maWcKQEAgLTI0Miw2ICsyNDIsNyBAQCBjb25maWcgUklTQ1ZfRE1BX05P
TkNPSEVSRU5UCiAgICAgICAgc2VsZWN0IEFSQ0hfSEFTX1NZTkNfRE1BX0ZPUl9DUFUKICAgICAg
ICBzZWxlY3QgQVJDSF9IQVNfU1lOQ19ETUFfRk9SX0RFVklDRQogICAgICAgIHNlbGVjdCBETUFf
RElSRUNUX1JFTUFQCisgICAgICAgc2VsZWN0IFJJU0NWX0lTQV9aSUNCT00KCiBjb25maWcgQVNf
SEFTX0lOU04KICAgICAgICBkZWZfYm9vbCAkKGFzLWluc3RyLC5pbnNuIHIgNTEkKGNvbW1hKSAw
JChjb21tYSkgMCQoY29tbWEpCnQwJChjb21tYSkgdDAkKGNvbW1hKSB6ZXJvKQpAQCAtNDY1LDcg
KzQ2Niw2IEBAIGNvbmZpZyBSSVNDVl9JU0FfWklDQk9NCiAgICAgICAgZGVwZW5kcyBvbiBNTVUK
ICAgICAgICBkZXBlbmRzIG9uIFJJU0NWX0FMVEVSTkFUSVZFCiAgICAgICAgZGVmYXVsdCB5Ci0g
ICAgICAgc2VsZWN0IFJJU0NWX0RNQV9OT05DT0hFUkVOVAogICAgICAgIGhlbHAKICAgICAgICAg
ICBBZGRzIHN1cHBvcnQgdG8gZHluYW1pY2FsbHkgZGV0ZWN0IHRoZSBwcmVzZW5jZSBvZiB0aGUg
WklDQk9NCiAgICAgICAgICAgZXh0ZW5zaW9uIChDYWNoZSBCbG9jayBNYW5hZ2VtZW50IE9wZXJh
dGlvbnMpIGFuZCBlbmFibGUgaXRzCgpCdXQgd2hhdCBpZiB0aGUgcGxhdGZvcm0gZG9lc24ndCBo
YXZlIHRoZSBaSUNCT00gSVNBIGV4dGVuc2lvbj8KCkNoZWVycywKUHJhYmhha2FyCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
