Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA14FC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 26 May 2022 01:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yvccxxuIxtFXjRP4JUu7EQfQvWGGKiVoqjQPFPedIs8=; b=jTAuCNSnxhiPbb
	AUqkTnHlx0Ys2lrPAnu10xKdaAf6CdEMZfJPar0dNumkaq+xnJGyyw1NovjPcIMwVNEksXciaTYd2
	S99G+BU/2I94U7y/TqesFB4ggvvQ4Tb23Q9aECbw6HkZCyFInp6m4TwO7ODxI6G8aRxCvqjwtQmrt
	lrT/fAOygJ5O+CECER2qlIgrJMKHnqV8VD2CIzdSiS0roxrxWxe8unJQfKgbnIH3KC74C+46YbPlY
	VItEZKb79B9D2/55sVILT1eOaccd5nrhZSzmXLLER6HAnFhswEzFAJ98h63bd8Oim3agfcLjPjwio
	1oTvpKIx0YyznZqJe64w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu2Ec-00DB6C-Ff; Thu, 26 May 2022 01:24:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu2EZ-00DB5j-M7
	for linux-riscv@lists.infradead.org; Thu, 26 May 2022 01:24:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 86105617B4
	for <linux-riscv@lists.infradead.org>; Thu, 26 May 2022 01:24:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EACE8C3411A
	for <linux-riscv@lists.infradead.org>; Thu, 26 May 2022 01:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653528254;
	bh=h29Wpo9WNSSCClBqRvkE/1UDvwtQro2iV5ICekkFg0E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HnLkrdzUKZET6sFjNk94lVrFfADVXmldK+Cqb5TseFdyEB+O1VgvoAJCOA+t5gPSS
	 ++wNl7MAA66DGFISBUFmoNXjQOTJw9Qf2uaHoXJ+0LDXsKENzVZ5Vmc+fzIV5nP+LD
	 UkFl9GNaswEIgNl6xcU13nPdlGf9hsHi3geB3NQIWRQ99ACQANez3Ydmh+IglG+kWR
	 acowA8Vciy44diZvcc/odmHRy385IdJkAg1Wi8Q5VrfCt/FRhxYYNf2tz4i266CU2T
	 V07cXiKsJ44G1KpXp0LOfIH1gbzVKl+VMrkSP7cjQ9TgcLJ9g/oRyx60/tN/aU9+f6
	 vrAnNXV1k0VjA==
Received: by mail-vs1-f47.google.com with SMTP id z6so154065vsp.0
        for <linux-riscv@lists.infradead.org>; Wed, 25 May 2022 18:24:13 -0700 (PDT)
X-Gm-Message-State: AOAM531qpWqFLN3M4g7Zs4ZX9jSjKWJ5bLzA76HI5/jfLCWvK3wSXiba
	4ggKEdmPkgEHfKGczbHXxhhDK9mC5tCeluyCwBU=
X-Google-Smtp-Source: ABdhPJzDBLXhCL5I+mYMzalA+1VZJA6Rk/32vZKSZkTuV6RAPU9mSbndplIQtMUmBRdymGunNwqmANVXOnUOInEmIS0=
X-Received: by 2002:a05:6102:151c:b0:337:d985:1764 with SMTP id
 f28-20020a056102151c00b00337d9851764mr4007910vsv.51.1653528252793; Wed, 25
 May 2022 18:24:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220526003339.2948309-1-guoren@kernel.org> <EC36D0A9-AE06-4C05-A31B-CC348881937D@jrtc27.com>
In-Reply-To: <EC36D0A9-AE06-4C05-A31B-CC348881937D@jrtc27.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 26 May 2022 09:24:01 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQvmKE5UYTmhQMd0MTF-CJm08_VHpcSqS7ik=MGtZ0Jag@mail.gmail.com>
Message-ID: <CAJF2gTQvmKE5UYTmhQMd0MTF-CJm08_VHpcSqS7ik=MGtZ0Jag@mail.gmail.com>
Subject: Re: [PATCH V2] riscv: compat: Using seperated vdso_maps for compat_vdso_info
To: Jessica Clarke <jrtc27@jrtc27.com>, Palmer Dabbelt <palmer@rivosinc.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Guenter Roeck <linux@roeck-us.net>, 
	Palmer Dabbelt <palmer@dabbelt.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-arch <linux-arch@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_182415_842776_1874BC9E 
X-CRM114-Status: GOOD (  28.01  )
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

T24gVGh1LCBNYXkgMjYsIDIwMjIgYXQgOTowMCBBTSBKZXNzaWNhIENsYXJrZSA8anJ0YzI3QGpy
dGMyNy5jb20+IHdyb3RlOgo+Cj4gT24gMjYgTWF5IDIwMjIsIGF0IDAxOjMzLCBndW9yZW5Aa2Vy
bmVsLm9yZyB3cm90ZToKPiA+Cj4gPiBGcm9tOiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFi
YS5jb20+Cj4gPgo+ID4gVGhpcyBpcyBhIGZpeHVwIGZvciB2ZHNvIGltcGxlbWVudGF0aW9uIHdo
aWNoIGNhdXNlZCBtdXNsIHRvCj4gPiBmYWlsLgo+ID4KPiA+IFsgICAxMS42MDAwODJdIFJ1biAv
c2Jpbi9pbml0IGFzIGluaXQgcHJvY2Vzcwo+ID4gWyAgIDExLjYyODU2MV0gaW5pdFsxXTogdW5o
YW5kbGVkIHNpZ25hbCAxMSBjb2RlIDB4MSBhdAo+ID4gMHgwMDAwMDAwMDAwMDAwMDAwIGluIGxp
YmMuc29bZmZmZmZmOGFkMzkwMDArYTQwMDBdCj4gPiBbICAgMTEuNjI5Mzk4XSBDUFU6IDAgUElE
OiAxIENvbW06IGluaXQgTm90IHRhaW50ZWQKPiA+IDUuMTguMC1yYzctbmV4dC0yMDIyMDUyMCAj
MQo+ID4gWyAgIDExLjYyOTQ2Ml0gSGFyZHdhcmUgbmFtZTogcmlzY3YtdmlydGlvLHFlbXUgKERU
KQo+ID4gWyAgIDExLjYyOTU0Nl0gZXBjIDogMDBmZmZmZmY4YWRhMTEwMCByYSA6IDAwZmZmZmZm
OGFkYTEzYzggc3AgOgo+ID4gMDBmZmZmZmZjNTgxOTlmMAo+ID4gWyAgIDExLjYyOTU4Nl0gIGdw
IDogMDBmZmZmZmY4YWQzOTAwMCB0cCA6IDAwZmZmZmZmOGFkZTA5OTggdDAgOgo+ID4gZmZmZmZm
ZmZmZmZmZmZmZgo+ID4gWyAgIDExLjYyOTU5OF0gIHQxIDogMDBmZmZmZmZjNTgxOWZkMCB0MiA6
IDAwMDAwMDAwMDAwMDAwMDAgczAgOgo+ID4gMDBmZmZmZmY4YWRlMGNjMAo+ID4gWyAgIDExLjYy
OTYxMF0gIHMxIDogMDBmZmZmZmY4YWRlMGNjMCBhMCA6IDAwMDAwMDAwMDAwMDAwMDAgYTEgOgo+
ID4gMDBmZmZmZmZjNTgxOWEwMAo+ID4gWyAgIDExLjYyOTYyMl0gIGEyIDogMDAwMDAwMDAwMDAw
MDAwMSBhMyA6IDAwMDAwMDAwMDAwMDAwMWUgYTQgOgo+ID4gMDBmZmZmZmZjNTgxOWIwMAo+ID4g
WyAgIDExLjYyOTYzNF0gIGE1IDogMDBmZmZmZmZjNTgxOWIwMCBhNiA6IDAwMDAwMDAwMDAwMDAw
MDAgYTcgOgo+ID4gMDAwMDAwMDAwMDAwMDAwMAo+ID4gWyAgIDExLjYyOTY0NV0gIHMyIDogMDBm
ZmZmZmY4YWRlMGFjOCBzMyA6IDAwZmZmZmZmOGFkZTBlYzggczQgOgo+ID4gMDBmZmZmZmY4YWRl
MDcyOAo+ID4gWyAgIDExLjYyOTY1Nl0gIHM1IDogMDBmZmZmZmY4YWRlMGE5MCBzNiA6IDAwMDAw
MDAwMDAwMDAwMDAgczcgOgo+ID4gMDBmZmZmZmZjNTgxOWU0MAo+ID4gWyAgIDExLjYyOTY2N10g
IHM4IDogMDBmZmZmZmY4YWRlMGNhMCBzOSA6IDAwZmZmZmZmOGFkZGJhNTAgczEwOgo+ID4gMDAw
MDAwMDAwMDAwMDAwMAo+ID4gWyAgIDExLjYyOTY3OF0gIHMxMTogMDAwMDAwMDAwMDAwMDAwMCB0
MyA6IDAwMDAwMDAwMDAwMDAwMDIgdDQgOgo+ID4gMDAwMDAwMDAwMDAwMDAwMQo+ID4gWyAgIDEx
LjYyOTY4OF0gIHQ1IDogMDAwMDAwMDAwMDAyMDAwMCB0NiA6IGZmZmZmZmZmZmZmZmZmZmYKPiA+
IFsgICAxMS42Mjk2OTldIHN0YXR1czogMDAwMDAwMDAwMDAwNDAyMCBiYWRhZGRyOiAwMDAwMDAw
MDAwMDAwMDAwCj4gPiBjYXVzZTogMDAwMDAwMDAwMDAwMDAwZAo+ID4KPiA+IFRoZSBsYXN0IF9f
dmRzb19pbml0KCZjb21wYXRfdmRzb19pbmZvKSByZXBsYWNlcyB0aGUgZGF0YSBpbiBub3JtYWwK
PiA+IHZkc29faW5mby4gVGhpcyBpcyBhbiBvYnZpb3VzIGJ1Zy4KPiA+Cj4gPiBSZXBvcnRlZC1i
eTogR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0Pgo+ID4gVGVzdGVkLWJ5OiBHdWVu
dGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+Cj4gPiBUZXN0ZWQtYnk6IEhlaWtvIFN0w7xi
bmVyIDxoZWlrb0BzbnRlY2guZGU+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5A
bGludXguYWxpYmFiYS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2Vy
bmVsLm9yZz4KPiA+IENjOiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQGRhYmJlbHQuY29tPgo+ID4g
LS0tCj4gPiBDaGFuZ2VzIGluIFYyOgo+ID4gLSBBZGQgVGVzdGVkLWJ5Cj4gPiAtIFJlbmFtZSB2
dmFyICYgdmRzbyBpbiAvcHJvYy88cGlkPi9tYXBzLgo+Cj4gV2h5PyBObyBvdGhlciBhcmNoaXRl
Y3R1cmUgcmVuYW1lcyBpdCB0byB0aGF0LCBhbmQgdmFyaW91cyBwaWVjZXMgb2YKPiBzb2Z0d2Fy
ZSBsb29rIGZvciB0aGUgbWFnaWMgW3Zkc29dIG5hbWUsIGluY2x1ZGluZyBHREIgYW5kIExMREIs
IHRob3VnaAo+IGJ5IG15IGNvdW50IHRoZXJlIGFyZSA1NyBzb3VyY2UgcGFja2FnZXMgaW4gRGVi
aWFuIHRoYXQgY29udGFpbiB0aGUKPiBzdHJpbmcgbGl0ZXJhbCAiW3Zkc29dIiAoaW5jbHVkaW5n
IHF1b3RlcyksIGluY2x1ZGluZyBGaXJlZm94LAo+IEFuZHJvaWQncyBBUlQsIGx2bTIgYW5kIGVs
ZnV0aWxzLgpPcHBzLCBUaHggZm9yIHBvaW50aW5nIHRoaXMgb3V0LiBBYmFuZG9uIHRoZSB2ZXJz
aW9uIG9mIHRoZSBwYXRjaC4gQFBhbG1lcgoKPgo+IEplc3MKPgo+ID4gLS0tCj4gPiBhcmNoL3Jp
c2N2L2tlcm5lbC92ZHNvLmMgfCAxNSArKysrKysrKysrKysrLS0KPiA+IDEgZmlsZSBjaGFuZ2Vk
LCAxMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2tlcm5lbC92ZHNvLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC92ZHNvLmMKPiA+IGlu
ZGV4IDUwZmU0Yzg3NzYwMy4uOTU3ZjE2NGM5Nzc4IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNj
di9rZXJuZWwvdmRzby5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC92ZHNvLmMKPiA+IEBA
IC0yMDYsMTIgKzIwNiwyMyBAQCBzdGF0aWMgc3RydWN0IF9fdmRzb19pbmZvIHZkc29faW5mbyBf
X3JvX2FmdGVyX2luaXQgPSB7Cj4gPiB9Owo+ID4KPiA+ICNpZmRlZiBDT05GSUdfQ09NUEFUCj4g
PiArc3RhdGljIHN0cnVjdCB2bV9zcGVjaWFsX21hcHBpbmcgcnZfY29tcGF0X3Zkc29fbWFwc1td
IF9fcm9fYWZ0ZXJfaW5pdCA9IHsKPiA+ICsgICAgIFtSVl9WRFNPX01BUF9WVkFSXSA9IHsKPiA+
ICsgICAgICAgICAgICAgLm5hbWUgICA9ICJbY29tcGF0IHZ2YXJdIiwKPiA+ICsgICAgICAgICAg
ICAgLmZhdWx0ID0gdnZhcl9mYXVsdCwKPiA+ICsgICAgIH0sCj4gPiArICAgICBbUlZfVkRTT19N
QVBfVkRTT10gPSB7Cj4gPiArICAgICAgICAgICAgIC5uYW1lICAgPSAiW2NvbXBhdCB2ZHNvXSIs
Cj4gPiArICAgICAgICAgICAgIC5tcmVtYXAgPSB2ZHNvX21yZW1hcCwKPiA+ICsgICAgIH0sCj4g
PiArfTsKPiA+ICsKPiA+IHN0YXRpYyBzdHJ1Y3QgX192ZHNvX2luZm8gY29tcGF0X3Zkc29faW5m
byBfX3JvX2FmdGVyX2luaXQgPSB7Cj4gPiAgICAgICAubmFtZSA9ICJjb21wYXRfdmRzbyIsCj4g
PiAgICAgICAudmRzb19jb2RlX3N0YXJ0ID0gY29tcGF0X3Zkc29fc3RhcnQsCj4gPiAgICAgICAu
dmRzb19jb2RlX2VuZCA9IGNvbXBhdF92ZHNvX2VuZCwKPiA+IC0gICAgIC5kbSA9ICZydl92ZHNv
X21hcHNbUlZfVkRTT19NQVBfVlZBUl0sCj4gPiAtICAgICAuY20gPSAmcnZfdmRzb19tYXBzW1JW
X1ZEU09fTUFQX1ZEU09dLAo+ID4gKyAgICAgLmRtID0gJnJ2X2NvbXBhdF92ZHNvX21hcHNbUlZf
VkRTT19NQVBfVlZBUl0sCj4gPiArICAgICAuY20gPSAmcnZfY29tcGF0X3Zkc29fbWFwc1tSVl9W
RFNPX01BUF9WRFNPXSwKPiA+IH07Cj4gPiAjZW5kaWYKPiA+Cj4gPiAtLQo+ID4gMi4zNi4xCj4g
Pgo+ID4KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiA+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YKPgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCk1MOiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9saW51eC1jc2t5LwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
