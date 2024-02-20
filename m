Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62BD8C48BC3
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 16:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tagxLEbAQURFszMqLHWT3xb7yY+Kiz23XAe7Gxrpfy4=; b=IhmNZ4K2a+gLpf
	AlJw+OBa77fDJoBSQRCf/xs3NTOQ8C0GYb0NP3ITQPRrN5BTMjNjQHVUBQYzG8DnUXEOtnQEulf7G
	z+3aFJAL17JjGgliosJncQzqgXJheIK9u+xlSif47+uPbtDoehQoLDKO+5SqYVxQTkGq2lM5Wfz0V
	x8l9VbejzhgEiktDQUKdJD2gXGwNNWVA1ivD2aI/DDSPwC3emlRF8iBv8a0LLeMBAsOZG4qL/G0eF
	bM5LzA8GrCkaFJVRORBE6uEd4oAa6spuT4WTLkNIolucYA3Rd8j92DL3Y6pbNzRJHwhhwd99ic18h
	QKnsIQcTDb8Ka9g4UnhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcT44-0000000FVBy-0ju1;
	Tue, 20 Feb 2024 16:33:52 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcT3x-0000000FV8f-0izZ
	for linux-riscv@lists.infradead.org;
	Tue, 20 Feb 2024 16:33:49 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-512aafb3ca8so2616616e87.3
        for <linux-riscv@lists.infradead.org>; Tue, 20 Feb 2024 08:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1708446823; x=1709051623; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p25ro1Z6UmFNJOpkPhd7azDHdv/Ire7OveuzPMEDrco=;
        b=bc9SeVfIIgbC+1bP+sOkipJxfgx0k27I61ocE+880s5xMBUotTs/+wHcnJyS2E0MJG
         fp11zhGrwuHLbJLypc9fqgM6wpDR/HYolmqLetuNIkjU+0RjE/7Gp5mgWhee2s+3+mCh
         xIxAAucl1N93KjmK+LcJmepKN/ljYddIslLzKSKpRXOYv6tBRupxF7YhFG3WmCCMg2Kv
         mhtPYNcPHOxSsI61rpYHYSTFNcyExUEjrXYuDdJJMpiRugOqqi90SAHb+S35lXx500Va
         1PahMdnwkfnJXqARMqAlsXnrGGxI3eXjxeaYswdkScg1yjcttzHBqHoLmdu7R60VqBKx
         Bzfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708446823; x=1709051623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p25ro1Z6UmFNJOpkPhd7azDHdv/Ire7OveuzPMEDrco=;
        b=Zvz4nNpUz9j1FcC0LFNuFXaEPDrXem0yB4MeCy/f4d2G8vQnMZ6WfROX0PEib5o+ka
         av6p1gI4MGheiApX7tNlHHPt/l8bUQaiGfbi5Kh3Xlb16xSL96Tpin7koIME/h+UjoI0
         9HX2wJS5USCYk/GGpvPF0Kv4r9UZzvEDIqqhnUcrM9Eb3uTOe1TULlomRRbPPbQjIh/q
         mqJ5BTdlTOhogOmxvgvqF1l3dXnAewoWFRkLVRYK2szeyedooB/t7Wp1ib5ebu/6s8Tk
         LghdiMe5gojTH2Iz7GM1N9C4q7VWLoSpWxuIxrFIlbllsujD8jc9Xwp8dIwbk4xq8YEd
         Ao3A==
X-Forwarded-Encrypted: i=1; AJvYcCXxKDSHqjsfccwI5KdbK8VlbzBA0YvbI1f/KcKIu2+9sU/UnakFvAhh3vE4R69P+U1v3Uq2GTJrd0zQ/XVYdpNdfOWD0K0xvBZcHH1DDkP2
X-Gm-Message-State: AOJu0YwdQv0ajOX9w4afCJzu2rabLUIZZEwAhXXQF20whNsyp562r5oi
	RpDmXDtrXNPZNqSymOIZsqZk6wxe5mP80qLAUYOhxuOTma4rT9Wm00y6Kdq73m9dSRFaIM95OKX
	OSfdofI+46wGh+BuNW2Tki6xvTif4jbF/nTVbHQ==
X-Google-Smtp-Source: AGHT+IFEg/QXz9A3XAObYPJXzmoOxIf/e+fzIofGOJqhDrldapT9nC1GUC4P6dVl9adY5fSs8xH8AWe5ez3rD0APoiA=
X-Received: by 2002:a05:6512:3d91:b0:512:9d11:ae00 with SMTP id
 k17-20020a0565123d9100b005129d11ae00mr9428461lfv.52.1708446822973; Tue, 20
 Feb 2024 08:33:42 -0800 (PST)
MIME-Version: 1.0
References: <20240220060718.823229-1-apatel@ventanamicro.com>
 <20240220060718.823229-7-apatel@ventanamicro.com> <87a5nvi8dv.ffs@tglx>
In-Reply-To: <87a5nvi8dv.ffs@tglx>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 20 Feb 2024 22:03:31 +0530
Message-ID: <CAK9=C2XQVnoEEzjwnb7ZSM90vbdTU=9yteAYXOhbkSoDcEGnKg@mail.gmail.com>
Subject: Re: [PATCH v13 06/13] irqchip: Add RISC-V incoming MSI controller
 early driver
To: Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_083345_273357_FD4FCC2D 
X-CRM114-Status: GOOD (  27.47  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBGZWIgMjAsIDIwMjQgYXQgNjo0NeKAr1BNIFRob21hcyBHbGVpeG5lciA8dGdseEBs
aW51dHJvbml4LmRlPiB3cm90ZToKPgo+IE9uIFR1ZSwgRmViIDIwIDIwMjQgYXQgMTE6MzcsIEFu
dXAgUGF0ZWwgd3JvdGU6Cj4gPiBUaGUgUklTQy1WIGFkdmFuY2VkIGludGVycnVwdCBhcmNoaXRl
Y3R1cmUgKEFJQSkgc3BlY2lmaWNhdGlvbgo+ID4gZGVmaW5lcyBhIG5ldyBNU0kgY29udHJvbGxl
ciBjYWxsZWQgaW5jb21pbmcgbWVzc2FnZSBzaWduYWxsZWQKPiA+IGludGVycnVwdCBjb250cm9s
bGVyIChJTVNJQykgd2hpY2ggbWFuYWdlcyBNU0kgb24gcGVyLUhBUlQgKG9yCj4gPiBwZXItQ1BV
KSBiYXNpcy4gSXQgYWxzbyBzdXBwb3J0cyBJUElzIGFzIHNvZnR3YXJlIGluamVjdGVkIE1TSXMu
Cj4gPiAoRm9yIG1vcmUgZGV0YWlscyByZWZlciBodHRwczovL2dpdGh1Yi5jb20vcmlzY3Yvcmlz
Y3YtYWlhKQo+ID4KPiA+IExldCB1cyBhZGQgYW4gZWFybHkgaXJxY2hpcCBkcml2ZXIgZm9yIFJJ
U0MtViBJTVNJQyB3aGljaCBzZXRzCj4gPiB1cCB0aGUgSU1TSUMgc3RhdGUgYW5kIHByb3ZpZGUg
SVBJcy4KPgo+IHMvTGV0IHVzIGFkZC9BZGQvCgpPa2F5LCBJIHdpbGwgdXBkYXRlLgoKPgo+ID4g
KyNlbHNlCj4gPiArc3RhdGljIHZvaWQgaW1zaWNfaXBpX3N0YXJ0aW5nX2NwdSh2b2lkKQo+ID4g
K3sKPiA+ICt9Cj4gPiArCj4gPiArc3RhdGljIHZvaWQgaW1zaWNfaXBpX2R5aW5nX2NwdSh2b2lk
KQo+ID4gK3sKPiA+ICt9Cj4gPiArCj4gPiArc3RhdGljIGludCBfX2luaXQgaW1zaWNfaXBpX2Rv
bWFpbl9pbml0KHZvaWQpCj4gPiArewo+ID4gKyAgICAgcmV0dXJuIDA7Cj4gPiArfQo+Cj4gUGxl
YXNlIGNvbmRlbnNlIHRoaXMgaW50bwo+Cj4gc3RhdGljIHZvaWQgaW1zaWNfaXBpX3N0YXJ0aW5n
X2NwdSh2b2lkKSB7IH0KPiBzdGF0aWMgdm9pZCBpbXNpY19pcGlfZHlpbmdfY3B1KHZvaWQpIHsg
fQo+IHN0YXRpYyBpbnQgX19pbml0IGltc2ljX2lwaV9kb21haW5faW5pdCh2b2lkKSB7IHJldHVy
biAwOyB9Cj4KPiBObyBwb2ludCBpbiB3YXN0aW5nIHNwYWNlIGZvciB0aGVzZSBzdHVicy4KClN1
cmUsIEkgd2lsbCB1cGRhdGUuCgo+Cj4gPiArICogVG8gaGFuZGxlIGFuIGludGVycnVwdCwgd2Ug
cmVhZCB0aGUgVE9QRUkgQ1NSIGFuZCB3cml0ZSB6ZXJvIGluIG9uZQo+ID4gKyAqIGluc3RydWN0
aW9uLiBJZiBUT1BFSSBDU1IgaXMgbm9uLXplcm8gdGhlbiB3ZSB0cmFuc2xhdGUgVE9QRUkuSUQg
dG8KPiA+ICsgKiBMaW51eCBpbnRlcnJ1cHQgbnVtYmVyIGFuZCBsZXQgTGludXggSVJRIHN1YnN5
c3RlbSBoYW5kbGUgaXQuCj4gPiArICovCj4gPiArc3RhdGljIHZvaWQgaW1zaWNfaGFuZGxlX2ly
cShzdHJ1Y3QgaXJxX2Rlc2MgKmRlc2MpCj4gPiArewo+ID4gKyAgICAgc3RydWN0IGlycV9jaGlw
ICpjaGlwID0gaXJxX2Rlc2NfZ2V0X2NoaXAoZGVzYyk7Cj4gPiArICAgICBpbnQgZXJyLCBjcHUg
PSBzbXBfcHJvY2Vzc29yX2lkKCk7Cj4gPiArICAgICBzdHJ1Y3QgaW1zaWNfdmVjdG9yICp2ZWM7
Cj4gPiArICAgICB1bnNpZ25lZCBsb25nIGxvY2FsX2lkOwo+ID4gKwo+ID4gKyAgICAgY2hhaW5l
ZF9pcnFfZW50ZXIoY2hpcCwgZGVzYyk7Cj4gPiArCj4gPiArICAgICB3aGlsZSAoKGxvY2FsX2lk
ID0gY3NyX3N3YXAoQ1NSX1RPUEVJLCAwKSkpIHsKPiA+ICsgICAgICAgICAgICAgbG9jYWxfaWQg
PSBsb2NhbF9pZCA+PiBUT1BFSV9JRF9TSElGVDsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgaWYg
KGxvY2FsX2lkID09IElNU0lDX0lQSV9JRCkgewo+ID4gKyNpZmRlZiBDT05GSUdfU01QCj4KPiAg
ICAgICAgIGlmIChJU19FTkFCTEVEKENPTkZJR19TTVApKQoKT2theSwgSSB3aWxsIHVwZGF0ZS4K
Cj4KPiA+ICsgICAgICAgICAgICAgICAgICAgICBpcGlfbXV4X3Byb2Nlc3MoKTsKPiA+ICsjZW5k
aWYKPiA+ICsgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiA+ICsgICAgICAgICAgICAg
fQo+Cj4gPiArCj4gPiArLyogTVVTVCBiZSBjYWxsZWQgd2l0aCBscHJpdi0+bG9jayBoZWxkICov
Cj4KPiBJbnN0ZWFkIG9mIGEgY29tbWVudCB3aGljaCBjYW5ub3QgYmUgZW5mb3JjZWQganVzdCBo
YXZlCj4KPiAgICAgICAgIGxvY2tkZXBfYXNzZXJ0X2hlbGQoJmxwcml2LT5sb2NrKTsKPgo+IHJp
Z2h0IGF0IHRoZSB0b3Agb2YgdGhlIGZ1bmN0aW9uLiBUaGF0IGRvY3VtZW50cyB0aGUgcmVxdWly
ZW1lbnQgYW5kCj4gbGV0cyBsb2NrZGVwIHllbGwgaWYgbm90IGZvbGxvd2VkLgo+Cj4gPiArI2lm
ZGVmIENPTkZJR19TTVAKPiA+ICtzdGF0aWMgdm9pZCBpbXNpY19sb2NhbF90aW1lcl9jYWxsYmFj
ayhzdHJ1Y3QgdGltZXJfbGlzdCAqdGltZXIpCj4gPiArewo+ID4gKyAgICAgc3RydWN0IGltc2lj
X2xvY2FsX3ByaXYgKmxwcml2ID0gdGhpc19jcHVfcHRyKGltc2ljLT5scHJpdik7Cj4gPiArICAg
ICB1bnNpZ25lZCBsb25nIGZsYWdzOwo+ID4gKwo+ID4gKyAgICAgcmF3X3NwaW5fbG9ja19pcnFz
YXZlKCZscHJpdi0+bG9jaywgZmxhZ3MpOwo+ID4gKyAgICAgX19pbXNpY19sb2NhbF9zeW5jKGxw
cml2KTsKPiA+ICsgICAgIHJhd19zcGluX3VubG9ja19pcnFyZXN0b3JlKCZscHJpdi0+bG9jaywg
ZmxhZ3MpOwo+ID4gK30KPiA+ICsKPiA+ICsvKiBNVVNUIGJlIGNhbGxlZCB3aXRoIGxwcml2LT5s
b2NrIGhlbGQgKi8KPgo+IERpdHRvCj4KPiA+ICtzdGF0aWMgdm9pZCBfX2ltc2ljX3JlbW90ZV9z
eW5jKHN0cnVjdCBpbXNpY19sb2NhbF9wcml2ICpscHJpdiwgdW5zaWduZWQgaW50IGNwdSkKPgo+
ID4gK3ZvaWQgaW1zaWNfdmVjdG9yX21hc2soc3RydWN0IGltc2ljX3ZlY3RvciAqdmVjKQo+ID4g
K3sKPiA+ICsgICAgIHN0cnVjdCBpbXNpY19sb2NhbF9wcml2ICpscHJpdjsKPiA+ICsKPiA+ICsg
ICAgIGxwcml2ID0gcGVyX2NwdV9wdHIoaW1zaWMtPmxwcml2LCB2ZWMtPmNwdSk7Cj4gPiArICAg
ICBpZiAoV0FSTl9PTigmbHByaXYtPnZlY3RvcnNbdmVjLT5sb2NhbF9pZF0gIT0gdmVjKSkKPiA+
ICsgICAgICAgICAgICAgcmV0dXJuOwo+Cj4gV0FSTl9PTl9PTkNFKCksIG5vPwo+Cj4gPiArYm9v
bCBpbXNpY192ZWN0b3JfaXNlbmFibGVkKHN0cnVjdCBpbXNpY192ZWN0b3IgKnZlYykKPiA+ICt7
Cj4gPiArICAgICBzdHJ1Y3QgaW1zaWNfbG9jYWxfcHJpdiAqbHByaXYgPSBwZXJfY3B1X3B0cihp
bXNpYy0+bHByaXYsIHZlYy0+Y3B1KTsKPiA+ICsgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4g
PiArICAgICBib29sIHJldDsKPiA+ICsKPiA+ICsgICAgIHJhd19zcGluX2xvY2tfaXJxc2F2ZSgm
bHByaXYtPmxvY2ssIGZsYWdzKTsKPiA+ICsgICAgIHJldCA9IHZlYy0+ZW5hYmxlOwo+ID4gKyAg
ICAgcmF3X3NwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmxwcml2LT5sb2NrLCBmbGFncyk7Cj4KPiBJ
J20gbm90IHN1cmUgd2hhdCB5b3UgYXJlIHRyeWluZyB0byBwcm90ZWN0IGhlcmUuIHZlYy0+ZW5h
YmxlIGNhbgo+IG9idmlvdXNseSBjaGFuZ2UgcmlnaHQgYWZ0ZXIgdGhlIGxvY2sgaXMgZHJvcHBl
ZC4gU28gdGhhdCdzIGp1c3QgYQo+IHNuYXBzaG90LCB3aGljaCBpcyBub3QgYW55IGJldHRlciB0
aGFuIHVzaW5nCj4KPiAgICAgICAgICAgUkVBRF9PTkNFKHZlYy0+ZW5hYmxlKTsKPgo+IGFuZCBh
IGNvcnJlc3BvbmRpbmcgV1JJVEVfT05DRSgpIGF0IHRoZSB1cGRhdGUgc2l0ZSwgd2hpY2ggb2J2
aW91c2x5Cj4gbmVlZHMgc2VyaWFsaXphdGlvbi4KPgo+ID4gK3N0YXRpYyB2b2lkIF9faW5pdCBp
bXNpY19sb2NhbF9jbGVhbnVwKHZvaWQpCj4gPiArewo+ID4gKyAgICAgaW50IGNwdTsKPiA+ICsg
ICAgIHN0cnVjdCBpbXNpY19sb2NhbF9wcml2ICpscHJpdjsKPgo+ICAgICAgICAgc3RydWN0IGlt
c2ljX2xvY2FsX3ByaXYgKmxwcml2Owo+ICAgICAgICAgaW50IGNwdTsKPgo+IFBsZWFzZS4KPgo+
ID4gK3ZvaWQgaW1zaWNfc3RhdGVfb2ZmbGluZSh2b2lkKQo+ID4gK3sKPiA+ICsjaWZkZWYgQ09O
RklHX1NNUAo+ID4gKyAgICAgc3RydWN0IGltc2ljX2xvY2FsX3ByaXYgKmxwcml2ID0gdGhpc19j
cHVfcHRyKGltc2ljLT5scHJpdik7Cj4gPiArI2VuZGlmCj4KPiBZb3UgY2FuIG1vdmUgdGhhdCBp
bnRvIHRoZSAjaWZkZWYgYmVsb3cuCj4KPiA+ICsgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4g
PiArCj4gPiArICAgICByYXdfc3Bpbl9sb2NrX2lycXNhdmUoJmltc2ljLT5tYXRyaXhfbG9jaywg
ZmxhZ3MpOwo+ID4gKyAgICAgaXJxX21hdHJpeF9vZmZsaW5lKGltc2ljLT5tYXRyaXgpOwo+ID4g
KyAgICAgcmF3X3NwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmltc2ljLT5tYXRyaXhfbG9jaywgZmxh
Z3MpOwo+ID4gKwo+ID4gKyNpZmRlZiBDT05GSUdfU01QCj4gPiArICAgICByYXdfc3Bpbl9sb2Nr
X2lycXNhdmUoJmxwcml2LT5sb2NrLCBmbGFncyk7Cj4gPiArICAgICBXQVJOX09OX09OQ0UodHJ5
X3RvX2RlbF90aW1lcl9zeW5jKCZscHJpdi0+dGltZXIpIDwgMCk7Cj4gPiArICAgICByYXdfc3Bp
bl91bmxvY2tfaXJxcmVzdG9yZSgmbHByaXYtPmxvY2ssIGZsYWdzKTsKPiA+ICsjZW5kaWYKPiA+
ICt9Cj4KPgo+IFRoYW5rcywKPgo+ICAgICAgICAgdGdseAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
