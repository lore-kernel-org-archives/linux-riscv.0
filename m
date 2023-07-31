Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D42EC001E0
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 15:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XM6hVe29uEYAVU+OJTaW69AaSOA1cptTPmlQGPYnr7Q=; b=gJBxnw+gPsPEpF
	j9QLPMJbcp2KGFo+PqrVIQmf59FvuyBHkmVD93W9rz1RJSt6+awmNSLL/8jqiq1EbLdJsYUMoT6PB
	T1PfbX4I/uA5DitLaRtJcouwaZuy56Yq0qNpf7IPI0pUm9BvhTegEH524fM//9CvOac5ErRX51csD
	yPQd+Rtk6bRwFaFIV/Fu7bp85FKnhmqxujyc7ZPnOC9KKSHIHCVb/xaY1rj+gBV27JAgvPPV3uNc6
	68CquF/uLdhnFL5hlyvRFY2LJfpr6+lq6UqbpCWH7vau9+bKT0VEWkKKZk9ggmceP8QH/F0ILLxFl
	uJ3m605tdhNh/0Dy6aPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQVFA-00GPKM-3A;
	Mon, 31 Jul 2023 15:55:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQVF8-00GPH0-04
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 15:55:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D2C68611EF;
	Mon, 31 Jul 2023 15:55:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E5CDC433C7;
	Mon, 31 Jul 2023 15:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690818931;
	bh=NpBtSIJSQAMZgop0+UrbZFjO72hykmWioT0INVInNzM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xsiktcq6yFo8bOa1grhEAGYy7DsiCxGQ61akQuSRbSwgdbkw9u2hCxXeagc3bSYfW
	 UxwX+nPP9ioKXtvf/dOVtbUtbW2QUKfnDjPwdLPZ9Yj03LIV2NnploqVk+yNOSQKo3
	 lIn23gUH61k3GeZ5aAm5B6WjRfJtwyxQcnJQUrOwTKIbGN3u24EsVzIOF4eQBSnCt9
	 LeW53R+OyWgIL3cnlrgbfVVFuoeW1fiusxzu2NwTtIEErbXofC/yCejdXWSm/BHL3P
	 Ynnp4jVgwfx1aj7I1kiGCuh2tIXDsSltWmnH+32lJC8m8QqxE3Vavb8Hx4QTLfD1n4
	 zSSrN7Jy0bO2Q==
Date: Mon, 31 Jul 2023 23:43:52 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: guoren <guoren@kernel.org>,
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	"Conor.Dooley" <conor.dooley@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andrew Jones <ajones@ventanamicro.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel@sholland.org>,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@infradead.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v10 3/6] riscv: mm: dma-noncoherent: nonstandard cache
 operations support
Message-ID: <ZMfWuHPdcHuIeUHQ@xhacker>
References: <20230702203429.237615-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230702203429.237615-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <ZMZ6XB6gX2kFd/Nt@xhacker>
 <CAJM55Z8vF8_xq0QyByLUGM2W-8m6R-_6SdOFdLETV7J-yo5DMQ@mail.gmail.com>
 <92c00ddb-e956-4861-af80-5f5558c9a8f5@app.fastmail.com>
 <CAJF2gTTRHzT+CEtb1LVYdfCorVUdLvCh_eMxrmC=xjdQ_JS6Sg@mail.gmail.com>
 <8b3466e4-a295-4249-bd05-2edbf7b3f6e3@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8b3466e4-a295-4249-bd05-2edbf7b3f6e3@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_085534_159249_06CBA7F2 
X-CRM114-Status: GOOD (  27.94  )
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

T24gTW9uLCBKdWwgMzEsIDIwMjMgYXQgMDc6Mzk6MzBBTSArMDIwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBPbiBNb24sIEp1bCAzMSwgMjAyMywgYXQgMDI6NDksIEd1byBSZW4gd3JvdGU6Cj4g
PiBPbiBNb24sIEp1bCAzMSwgMjAyMyBhdCA0OjM24oCvQU0gQXJuZCBCZXJnbWFubiA8YXJuZEBh
cm5kYi5kZT4gd3JvdGU6Cj4gPj4KPiA+PiBPbiBTdW4sIEp1bCAzMCwgMjAyMywgYXQgMTc6NDIs
IEVtaWwgUmVubmVyIEJlcnRoaW5nIHdyb3RlOgo+ID4+ID4gT24gU3VuLCAzMCBKdWwgMjAyMyBh
dCAxNzoxMSwgSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPiB3cm90ZToKPiA+Pgo+
ID4+ID4+ID4gKwo+ID4+ID4+ID4gIHN0YXRpYyBpbmxpbmUgdm9pZCBhcmNoX2RtYV9jYWNoZV93
YmFjayhwaHlzX2FkZHJfdCBwYWRkciwgc2l6ZV90IHNpemUpCj4gPj4gPj4gPiAgewo+ID4+ID4+
ID4gICAgICAgdm9pZCAqdmFkZHIgPSBwaHlzX3RvX3ZpcnQocGFkZHIpOwo+ID4+ID4+ID4KPiA+
PiA+PiA+ICsjaWZkZWYgQ09ORklHX1JJU0NWX05PTlNUQU5EQVJEX0NBQ0hFX09QUwo+ID4+ID4+
ID4gKyAgICAgaWYgKHVubGlrZWx5KG5vbmNvaGVyZW50X2NhY2hlX29wcy53YmFjaykpIHsKPiA+
PiA+Pgo+ID4+ID4+IEknbSB3b3JyaWVkIGFib3V0IHRoZSBwZXJmb3JtYW5jZSBpbXBhY3QgaGVy
ZS4KPiA+PiA+PiBGb3IgdW5pZmllZCBrZXJuZWwgSW1hZ2UgcmVhc29uLCBSSVNDVl9OT05TVEFO
REFSRF9DQUNIRV9PUFMgd2lsbCBiZQo+ID4+ID4+IGVuYWJsZWQgYnkgZGVmYXVsdCwgc28gc3Rh
bmRhcmQgQ01PIGFuZCBULUhFQUQncyBDTU8gcGxhdGZvcm0ncwo+ID4+ID4+IHBlcmZvcm1hbmNl
IHdpbGwgYmUgaW1wYWN0ZWQsIGJlY2F1c2UgZXZlbiBhbiB1bmxpa2VseSBpcyBwdXQKPiA+PiA+
PiBoZXJlLCB0aGUgY2hlY2sgYWN0aW9uIHN0aWxsIG5lZWRzIHRvIGJlIGRvbmUuCj4gPj4gPgo+
ID4+ID4gT24gSVJDIEkgYXNrZWQgd2h5IG5vdCB1c2UgYSBzdGF0aWMga2V5IHNvIHRoZSBvdmVy
aGVhZCBpcyBqdXN0IGEKPiA+PiA+IHNpbmdsZSBub3Agd2hlbiB0aGUgc3RhbmRhcmQgQ01PIG9w
cyBhcmUgYXZhaWxhYmxlLCBidXQgdGhlIGNvbnNlbnN1cwo+ID4+ID4gc2VlbWVkIHRvIGJlIHRo
YXQgdGhlIGZsdXNoaW5nIHdvdWxkIGNvbXBsZXRlbHkgZG9taW5hdGUgdGhpcyBicmFuY2guCj4g
Pj4gPiBBbmQgb24gcGxhdGZvcm1zIHdpdGggdGhlIHN0YW5kYXJkIENNTyBvcHMgdGhlIGJyYW5j
aCBiZSBjb3JyZWN0bHkKPiA+PiA+IHByZWRpY3RlZCBhbnl3YXkuCj4gPj4KPiA+PiBOb3QganVz
dCB0aGUgZmx1c2hpbmcsIGJ1dCBhbHNvIGxvYWRpbmcgYmFjayB0aGUgaW52YWxpZGF0ZWQKPiA+
PiBjYWNoZSBsaW5lcyBhZnRlcndhcmRzIGlzIGp1c3QgdmVyeSBleHBlbnNpdmUuIEkgZG9uJ3Qg
dGhpbmsKPiA+PiB5b3Ugd291bGQgYmUgYWJsZSB0byBtZWFzdXJlIGEgZGlmZmVyZW5jZSBiZXR3
ZWVuIHRoZSBzdGF0aWMKCkkgcmVhZCB0aGlzIGFzOiB0aGUgY2FjaGUgY2xlYW4vaW52IGlzIHNv
IGV4cGVuc2l2ZSB0aGF0IHRoZSBzdGF0aWMKa2V5IHNhdmluZyBwZXJjZW50YWdlIGlzIHRyaXZp
YWwsIGlzIHRoaXMgdW5kZXJzdGFuZGluZyByaWdodD8KCnRoaXMgY291bGQgYmUgbWVhc3VyZWQg
Ynkgd3JpdGluZyBhIHNtYWxsIGJlbmNobWFyayBrZXJuZWwgbW9kdWxlCndoaWNoIGp1c3QgY2Fs
bHMgY2FjaGUgY2xlYW4vaW52IGEgYnVmKGZvciBleGFtcGxlIDE1MDBCeXRlcylpbiBhIGxvb3Au
IAoKPiA+PiBrZXkgYW5kIGEgY29ycmVjdGx5IHByZWRpY3RlZCBicmFuY2ggb24gYW55IHJlbGV2
YW50IHVzZWNhc2UgaGVyZS4KPiA+IE1heWJlIHdlIHNob3VsZCBtb3ZlIENNTyAmIFRIRUFEIG9w
cyB0byB0aGUgbm9uY29oZXJlbnRfY2FjaGVfb3BzLCBhbmQKPiA+IG9ubHkga2VlcCBvbmUgb2Yg
dGhlbS4KPiA+Cj4gPiBJIHByZWZlciBub25jb2hlcmVudF9jYWNoZV9vcHMsIGl0J3MgbW9yZSBt
YWludGFuY2UgdGhhbiBBTFRFUk5BVElWRS4KPiAKPiBJIHRoaW5rIG1vdmluZyB0aGUgVEhFQUQg
b3BzIGF0IHRoZSBzYW1lIGxldmVsIGFzIGFsbCBub25zdGFuZGFyZAo+IG9wZXJhdGlvbnMgbWFr
ZXMgc2Vuc2UsIGJ1dCBJJ2Qgc3RpbGwgbGVhdmUgQ01PIGFzIGFuIGV4cGxpY2l0Cj4gZmFzdCBw
YXRoIHRoYXQgYXZvaWRzIHRoZSBpbmRpcmVjdCBicmFuY2guIFRoaXMgc2VlbXMgbGlrZSB0aGUg
cmlnaHQKPiB0aGluZyB0byBkbyBib3RoIGZvciByZWFkYWJpbGl0eSBhbmQgZm9yIHBsYXRmb3Jt
cyBvbiB3aGljaCB0aGUKPiBpbmRpcmVjdCBicmFuY2ggaGFzIGEgbm90aWNlYWJsZSBvdmVyaGVh
ZC4KPiAKPiAgICAgQXJuZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
