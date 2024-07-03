Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 030AAC2BD09
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 13:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zwggEiYJHHyph1PFeO3ugVOw8ACmyZLWxN+UXqbwwjQ=; b=jUuBuIGVM4IhiG
	6hb7hzHn/54LIcrr9cGa49iSiHCB4zMpBCOLy3pMHqK3y+14nr35MHttNCe89vcyTXU1Dx0yGvjKv
	4GxtdxUaKtjhI+7fnFWvDK02o47aJCNxYId94TvCuz4P35DFkSNoihTQobXfJlvV5gxYzNxn7OrVn
	9MxG9Q+WERJfzwjvHAQ5YnsBNNQmuTE/PeRzmlapO6Cw6NMHECF1DuM7wejg+WgODD62r0isD2QGt
	89wnDn9/d8F3dbGdIpASHt/LS5VLqX59dQY+shNFko2JB7i7Vk62zjw4I81us7vbe2yNOuxfqiqLM
	g+w53TVAFFFz3COFLqow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOznE-0000000AGgQ-1AMy;
	Wed, 03 Jul 2024 13:13:04 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOznB-0000000AGfr-2Na8
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jul 2024 13:13:02 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-52cdcd26d61so6007426e87.2
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jul 2024 06:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720012379; x=1720617179; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0NKJh1yZ1elVP56CeXKI4BwpSL1VRHDS3kGX7TjqJRc=;
        b=cnK/ZHqwc+jzGFm48y5UFEyYyxZvwQAySpTOos0zrFVXnAUvej5OQ18QV1M3UtJvxy
         s6d8c8RUVG0+DXXcSbgBjoS5Yjre38epiw0zU/v4kO5CJnR8j4NiVRQI45l5AjYiNKEx
         OwbmGcVDtPVeoXyvPO7BrlQOIYJkEPE6CIfbyfI0p6fhxePUEWMMf4IO8VUjMWvilT1B
         CkV9G/OJ3iEeEeQmX7dBZ0OD9UpLraopEo1V7CasMQk8BHmclvgNN8mud5/j7PA+rClR
         MhcUFVRKGV7rGHFie8SG3Lvy3/b45Z24LI/CsEdFxmv9yNHw4NY35Rh3FccioSZkjce9
         5r4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720012379; x=1720617179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0NKJh1yZ1elVP56CeXKI4BwpSL1VRHDS3kGX7TjqJRc=;
        b=IhE0Om95XfxeSWaCCOEnk0hyltk6UAwTYWoRx6RS2yCe23S5w2H47OC0O2Wo2zv1OQ
         RXrN2l7ozu40Zbx2b42ZCr3v6RpbuT9Gd3A3BeMn2rLvCmjBUntIl5G5RqulDZlH5WUc
         G4H0TYLEzxLHc085GpWR12KhsxOQXr9G86GxZ9KdYpM7Mcu1yw1O+tPClV7wfCnl84cg
         YbyT/u1hIWXyHHhArHKDg19dQ0DvgB6lrMDKGZLSe2kjGTihxEUJCNnWmc+6hDfjIrza
         9YM9plYxydOHrvSGWWNl5q0gMC5Aj497fdiEESO7pHuBVG1wjar0VlMC0IjcqRTRrsLN
         Ng0w==
X-Forwarded-Encrypted: i=1; AJvYcCXRoASdsXJw5S/Gm5UbO/q0IBFofLuWp5EThsMv/JpLnNbsnRSEFj1OgQfJbgwM0740BgvnjpYiUW9BTq3wIuXFaZLur6Sez6SmP/4Sm9WQ
X-Gm-Message-State: AOJu0YziucwR6W4x3aC9QiCKufqbNB2TNa767zlR6JLO3eFuFyCEGxIZ
	lwX0dbZY7fStnMMtGG+lk/An3/FwlBjff7p5vbv2bXh/mxxwgj8lZf4bn/y/fv7WK2ndCPMgaoy
	DQRbDHx084lT1BdOt+sj6Sq+zr0A=
X-Google-Smtp-Source: AGHT+IEKCloal0IFPzdNkFkI2Hak2EZ742ax7plHna9yjqGCtPy3jRYVNeZ8SGON8Mm/M4XafoTTnS7CcgCDH0A9M9M=
X-Received: by 2002:a05:6512:60c:b0:52e:9b92:4999 with SMTP id
 2adb3069b0e04-52e9b924c0cmr234740e87.2.1720012378657; Wed, 03 Jul 2024
 06:12:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240701121355.262259-2-kanakshilledar@gmail.com>
 <20240701121355.262259-4-kanakshilledar@gmail.com> <f8604c68-8866-447b-a874-562bdad1df79@sifive.com>
 <23gvjkszxvf6zehiqetjfmtf67nlpnnfmhgx234jnxwrtmbdpr@4yv64sz2kpcs> <20240703-garbage-explicit-bd95f8deb716@wendy>
In-Reply-To: <20240703-garbage-explicit-bd95f8deb716@wendy>
From: Kanak Shilledar <kanakshilledar@gmail.com>
Date: Wed, 3 Jul 2024 18:42:46 +0530
Message-ID: <CAGLn_=tieSCGWix-0mGC7n8MnD46WPxuWh9xhtB6r+YZry463g@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] spi: dw-mmio: update dw_spi_mmio_of_match struct
 with thead
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Serge Semin <fancer.lancer@gmail.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-spi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_061301_667224_B44AF9D1 
X-CRM114-Status: GOOD (  36.35  )
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

SGksClNvLCBJIHdpbGwgZHJvcCB0aGlzIHBhdGNoLgpJbiB0aGUgbmV4dCB2ZXJzaW9uIChpLmUu
IHYyKSBvZiB0aGlzIHBhdGNoc2V0LCBkbyBJIG5lZWQgdG8gaW5jbHVkZQp0aGUgZHQtYmluZGlu
ZyBwYXRjaCBhcyBpdCBpcyBhbHJlYWR5IGluIGZvci1uZXh0LgpJIGFtIHdhaXRpbmcgZm9yIGNv
bW1lbnRzIG9uIHRoZSBkZXZpY2V0cmVlIGZpbGVzIGJlZm9yZSBzZW5kaW5nIHRoZQp2MiAoaWYg
cmVxdWlyZWQpLgoKVGhhbmtzIGFuZCBSZWdhcmRzLApLYW5hayBTaGlsbGVkYXIKCk9uIFdlZCwg
SnVsIDMsIDIwMjQgYXQgMTI6NTnigK9QTSBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNy
b2NoaXAuY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgSnVsIDAxLCAyMDI0IGF0IDA5OjU3OjIwUE0g
KzAzMDAsIFNlcmdlIFNlbWluIHdyb3RlOgo+ID4gSGkgZm9sa3MKPiA+Cj4gPiBPbiBNb24sIEp1
bCAwMSwgMjAyNCBhdCAwODoxNzoyOUFNIC0wNTAwLCBTYW11ZWwgSG9sbGFuZCB3cm90ZToKPiA+
ID4gSGkgS2FuYWssCj4gPiA+Cj4gPiA+IE9uIDIwMjQtMDctMDEgNzoxMyBBTSwgS2FuYWsgU2hp
bGxlZGFyIHdyb3RlOgo+ID4gPiA+IHVwZGF0ZWQgdGhlIHN0cnVjdCBvZl9kZXZpY2VfaWQgZHdf
c3BpX21taW9fb2ZfbWF0Y2ggdG8gaW5jbHVkZQo+ID4gPiA+IHRoZSB1cGRhdGVkIGNvbXBhdGli
bGUgdmFsdWUgZm9yIFRIMTUyMCBTb0MgKCJ0aGVhZCx0aDE1MjAtc3BpIikKPiA+ID4gPiB0byBp
bml0aWFsaXplIHdpdGggZHdfc3BpX3Bzc2lfaW5pdCgpLgo+ID4gPiA+Cj4gPiA+ID4gU2lnbmVk
LW9mZi1ieTogS2FuYWsgU2hpbGxlZGFyIDxrYW5ha3NoaWxsZWRhckBnbWFpbC5jb20+Cj4gPiA+
ID4gLS0tCj4gPiA+ID4gQ2hhbmdlcyBpbiB2MjoKPiA+ID4gPiAtIFNlcGFyYXRlZCBmcm9tIGEg
c2luZ2xlIHBhdGNoIGZpbGUuCj4gPiA+ID4gLS0tCj4gPiA+ID4gIGRyaXZlcnMvc3BpL3NwaS1k
dy1tbWlvLmMgfCAxICsKPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4g
PiA+ID4KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zcGkvc3BpLWR3LW1taW8uYyBiL2Ry
aXZlcnMvc3BpL3NwaS1kdy1tbWlvLmMKPiA+ID4gPiBpbmRleCA4MTk5MDdlMzMyYzQuLjM5ZTNk
NDZlYmY1ZCAxMDA2NDQKPiA+ID4gPiAtLS0gYS9kcml2ZXJzL3NwaS9zcGktZHctbW1pby5jCj4g
PiA+ID4gKysrIGIvZHJpdmVycy9zcGkvc3BpLWR3LW1taW8uYwo+ID4gPiA+IEBAIC00MTksNiAr
NDE5LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgZHdfc3BpX21taW9fb2Zf
bWF0Y2hbXSA9IHsKPiA+ID4gPiAgIHsgLmNvbXBhdGlibGUgPSAibWljcm9jaGlwLHNwYXJ4NS1z
cGkiLCBkd19zcGlfbXNjY19zcGFyeDVfaW5pdH0sCj4gPiA+ID4gICB7IC5jb21wYXRpYmxlID0g
ImNhbmFhbixrMjEwLXNwaSIsIGR3X3NwaV9jYW5hYW5fazIxMF9pbml0fSwKPiA+ID4gPiAgIHsg
LmNvbXBhdGlibGUgPSAiYW1kLHBlbnNhbmRvLWVsYmEtc3BpIiwgLmRhdGEgPSBkd19zcGlfZWxi
YV9pbml0fSwKPiA+ID4gPiArIHsgLmNvbXBhdGlibGUgPSAidGhlYWQsdGgxNTIwLXNwaSIsIC5k
YXRhID0gZHdfc3BpX3Bzc2lfaW5pdH0sCj4gPiA+Cj4gPiA+IFlvdXIgYmluZGluZyByZXF1aXJl
cyBzbnBzLGR3LWFwYi1zc2kgYXMgYSBmYWxsYmFjayBjb21wYXRpYmxlIHN0cmluZywgd2hpY2gg
aXMKPiA+ID4gYWxyZWFkeSBzdXBwb3J0ZWQgYnkgdGhpcyBkcml2ZXIgYW5kIHVzZXMgdGhlIHNh
bWUgbWF0Y2ggZGF0YS4gU28geW91IGRvbid0IG5lZWQKPiA+ID4gdGhpcyBwYXRjaDsgaXRzIG9u
bHkgZWZmZWN0IGlzIHRvIG1ha2UgdGhlIGtlcm5lbCBsYXJnZXIuCj4gPgo+ID4gQWdyZWUgd2l0
aCBTYW11ZWwgY29tbWVudC4gSW5kZWVkIHRoZXJlIGlzIG5vIHBvaW50IGluIGFkZGluZyB0aGUK
PiA+IHZlbmRvci1zcGVjaWZpYyBkZXZpY2UtbmFtZSBzdXBwb3J0ZWQgaW4gdGhlIGRyaXZlciBp
ZiB0aGUgZmFsbGJhY2sKPiA+IGNvbXBhdGlibGUgd29ya3MgYXMtaXMuCj4KPiBGV0lXLCBNYXJr
IHBpY2tlZCB1cCB0aGUgYmluZGluZyBhbG9uZSBzbyBJIHRoaW5rIHRoZXJlJ3Mgbm90aGluZyBm
b3IKPiBLYW5hayB0byBkbyBoZXJlICYgdGhlIGRyaXZlciBwYXRjaCBzaG91bGQganVzdCBiZSBm
b3Jnb3R0ZW4gYWJvdXQgOikKPgo+ID4gPkZyb20gdGhhdCBwZXJzcGVjdGl2ZSB3ZSBzaG91bGRu
J3QgaGF2ZSBtZXJnZWQgaW4gdGhlIHBhdGNoIGFkZGluZyB0aGUKPiA+IFJlbmVzYXMgUlpOMSBT
UEkgZGV2aWNlIG5hbWUgc3VwcG9ydCwgc2luY2UgdGhlIGdlbmVyaWMgZmFsbGJhY2sKPiA+IGNv
bXBhdGlibGUgd29ya3MgZm9yIGl0LiBPbiB0aGUgY29udHJhcnkgdGhlIE1pY3Jvc2VtaSBPY2Vs
b3QvSmFndWFyMgo+ID4gU29DIFNQSSBEVC1iaW5kaW5ncyBzaG91bGRuJ3QgaGF2ZSBiZWVuIGRl
ZmluZWQgd2l0aCB0aGUgZ2VuZXJpYwo+ID4gZmFsbGJhY2sgY29tcGF0aWJsZSBzaW5jZSBzaG91
bGQgdGhlIGRldmljZSBiZSBib3VuZCB2aWEgdGhlIGdlbmVyaWMKPiA+IG5hbWUgaXQgd29uJ3Qg
d29yayBhcyBleHBlY3RlZC4KPiA+Cj4gPiBBbHRob3VnaCwgaXQncyBiZXR0ZXIgdG8gaGVhciBv
dXQgd2hhdCBSb2IsIENvbm9yIG9yIEtyenlzenRvZiB0aGluawo+ID4gYWJvdXQgdGhpcy4KPgo+
IEkgYWdyZWUgd2l0aCB3aGF0IHlvdSd2ZSB3cml0dGVuLiBJZiB0aGUgZmFsbGJhY2sgd29ya3Mg
aWRlbnRpY2FsbHksIHRoZW4KPiB0aGUgc3BlY2lmaWMgY29tcGF0aWJsZSBzaG91bGRuJ3QgYmUg
YWRkZWQgaGVyZS4gQW5kIGlmIHRoZSBmYWxsYmFjawo+IHdpbGwgY2F1c2UgdGhlIGRldmljZSB0
byBtaXNiZWhhdmUgKG9yIG5vdCBiZWhhdmUgYXQgYWxsKSwgdGhlbiBpdAo+IHNob3VsZCBub3Qg
aGF2ZSBiZWVuIGFkZGVkLgo+IEknbSBub3Qgc3VyZSBpZiB0aGUgTWljcm9zZW1pIHN0dWZmIGlz
IGluIHRoZSAid29uJ3Qgd29yayB7LHByb3Blcmx5fSIKPiBjYW1wIG9yIGluIHRoZSAid2lsbCB3
b3JrIGluIGEgbGltaXRlZCBmYXNoaW9uIiBjYW1wLiBUaGUgbGF0dGVyIHdvdWxkCj4gYmUgc3Vp
dGFibGUgZm9yIGEgZmFsbGJhY2ssIHRoZSBmb3JtZXIgbm90Lgo+Cj4gQ2hlZXJzLAo+IENvbm9y
Lgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
