Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD59EB64DD
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 00:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gDj4c55PwEY7KMRLVnDeSP1duQU7MlUs9ShaQA1GWPI=; b=hbgKABuF16LfMI
	N75Pr0dPpaZnPZK5wDk3L4fWfkFZZ6oWD/K0YTu3YOVOwEYQPUW/BS0/cphL1SOgA6rEsKDc9+rT1
	n0eLIU33y5xWZ1oVbBkqUjKAfbHF3iHQ2Amp5pYDCywGjMJeADMpvuQQwMfdG4VBRZtZ4vVACdJ7D
	ytERna5BJOksunUleTzv3pfYkIbkUHlQM2KjFdq+QQWGev1Q3oFEnhwzSxG1Ri6yP9YBYjlAKKCP6
	h+3c9lUP+9Ql2yDIUhETXM7rMOrYgwSU4WyG8GGxmE0akSsIJRBfsu0ZkO+bOVCH2Y7fzLrf/ILIz
	/Th/cen+DUnSEnOrAWJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQH6N-00DErX-1H;
	Mon, 31 Jul 2023 00:49:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQH6K-00DEqo-25
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 00:49:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A063B60DFE
	for <linux-riscv@lists.infradead.org>; Mon, 31 Jul 2023 00:49:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F134C43391
	for <linux-riscv@lists.infradead.org>; Mon, 31 Jul 2023 00:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690764570;
	bh=HSe9skEoxlUTuOZvdtNJpMW/Hkn8jkbcfx3F/K4PLVY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=p+D7khP4AiP7n5c2GyfpNG+VVGVttTyGWAQRc+NtLtBozyiyHmuvJg4wLhYTRPoU3
	 O9cBmMMFPhdKcNDf02eZ/qCyEXOQjoZH9sC1zubZ+OvUqczlj8iMOoR0ScKqGqPZfi
	 /0GdSLc0GJj/ZdFSCR38HMGD1p2QSJoLhuRoaFnoe3zvSkoa/hOECqnC1pED6etxQL
	 aAOrXh8KdMZOjVBCN7o49+4wVhsaZQL4Zt9iVou7PcJs2jzmzXV1+Lbq68FSLQU/sM
	 UxduwZh/q3IBFeozIKt3xDmJ2r/x3wP2vzNIeAhaXc8QAvW3lwN3Br3OIZKpTpL6As
	 tvqnrlzZf/H/w==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-4fe383c1a26so376331e87.1
        for <linux-riscv@lists.infradead.org>; Sun, 30 Jul 2023 17:49:30 -0700 (PDT)
X-Gm-Message-State: ABy/qLYsYT5MiCb4tHCelGAXQgg2ruY3UYe8BpAGSRZGGEFDxCxwuzYo
	6JB+EdsTtXcdlP6HC8hgi6KMME4N+SEJo4wSFkg=
X-Google-Smtp-Source: APBJJlF7/ie/dP5ysn5qcMXEX8GaXG49PtXGNJVueUhetg/GlqbiKWs42dguiSGoTIKK9SRUFsaY3KxIgB75UtwPxKU=
X-Received: by 2002:ac2:5047:0:b0:4fb:92df:a27b with SMTP id
 a7-20020ac25047000000b004fb92dfa27bmr4330470lfm.39.1690764568411; Sun, 30 Jul
 2023 17:49:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230702203429.237615-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230702203429.237615-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <ZMZ6XB6gX2kFd/Nt@xhacker> <CAJM55Z8vF8_xq0QyByLUGM2W-8m6R-_6SdOFdLETV7J-yo5DMQ@mail.gmail.com>
 <92c00ddb-e956-4861-af80-5f5558c9a8f5@app.fastmail.com>
In-Reply-To: <92c00ddb-e956-4861-af80-5f5558c9a8f5@app.fastmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 31 Jul 2023 08:49:17 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTRHzT+CEtb1LVYdfCorVUdLvCh_eMxrmC=xjdQ_JS6Sg@mail.gmail.com>
Message-ID: <CAJF2gTTRHzT+CEtb1LVYdfCorVUdLvCh_eMxrmC=xjdQ_JS6Sg@mail.gmail.com>
Subject: Re: [PATCH v10 3/6] riscv: mm: dma-noncoherent: nonstandard cache
 operations support
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Arnd Bergmann <arnd@arndb.de>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Prabhakar <prabhakar.csengg@gmail.com>, "Conor.Dooley" <conor.dooley@microchip.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Andrew Jones <ajones@ventanamicro.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Samuel Holland <samuel@sholland.org>, 
	linux-riscv@lists.infradead.org, Christoph Hellwig <hch@infradead.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230730_174932_787211_18E74391 
X-CRM114-Status: GOOD (  21.86  )
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

T24gTW9uLCBKdWwgMzEsIDIwMjMgYXQgNDozNuKAr0FNIEFybmQgQmVyZ21hbm4gPGFybmRAYXJu
ZGIuZGU+IHdyb3RlOgo+Cj4gT24gU3VuLCBKdWwgMzAsIDIwMjMsIGF0IDE3OjQyLCBFbWlsIFJl
bm5lciBCZXJ0aGluZyB3cm90ZToKPiA+IE9uIFN1biwgMzAgSnVsIDIwMjMgYXQgMTc6MTEsIEpp
c2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiA+PiA+ICsKPiA+PiA+
ICBzdGF0aWMgaW5saW5lIHZvaWQgYXJjaF9kbWFfY2FjaGVfd2JhY2socGh5c19hZGRyX3QgcGFk
ZHIsIHNpemVfdCBzaXplKQo+ID4+ID4gIHsKPiA+PiA+ICAgICAgIHZvaWQgKnZhZGRyID0gcGh5
c190b192aXJ0KHBhZGRyKTsKPiA+PiA+Cj4gPj4gPiArI2lmZGVmIENPTkZJR19SSVNDVl9OT05T
VEFOREFSRF9DQUNIRV9PUFMKPiA+PiA+ICsgICAgIGlmICh1bmxpa2VseShub25jb2hlcmVudF9j
YWNoZV9vcHMud2JhY2spKSB7Cj4gPj4KPiA+PiBJJ20gd29ycmllZCBhYm91dCB0aGUgcGVyZm9y
bWFuY2UgaW1wYWN0IGhlcmUuCj4gPj4gRm9yIHVuaWZpZWQga2VybmVsIEltYWdlIHJlYXNvbiwg
UklTQ1ZfTk9OU1RBTkRBUkRfQ0FDSEVfT1BTIHdpbGwgYmUKPiA+PiBlbmFibGVkIGJ5IGRlZmF1
bHQsIHNvIHN0YW5kYXJkIENNTyBhbmQgVC1IRUFEJ3MgQ01PIHBsYXRmb3JtJ3MKPiA+PiBwZXJm
b3JtYW5jZSB3aWxsIGJlIGltcGFjdGVkLCBiZWNhdXNlIGV2ZW4gYW4gdW5saWtlbHkgaXMgcHV0
Cj4gPj4gaGVyZSwgdGhlIGNoZWNrIGFjdGlvbiBzdGlsbCBuZWVkcyB0byBiZSBkb25lLgo+ID4K
PiA+IE9uIElSQyBJIGFza2VkIHdoeSBub3QgdXNlIGEgc3RhdGljIGtleSBzbyB0aGUgb3Zlcmhl
YWQgaXMganVzdCBhCj4gPiBzaW5nbGUgbm9wIHdoZW4gdGhlIHN0YW5kYXJkIENNTyBvcHMgYXJl
IGF2YWlsYWJsZSwgYnV0IHRoZSBjb25zZW5zdXMKPiA+IHNlZW1lZCB0byBiZSB0aGF0IHRoZSBm
bHVzaGluZyB3b3VsZCBjb21wbGV0ZWx5IGRvbWluYXRlIHRoaXMgYnJhbmNoLgo+ID4gQW5kIG9u
IHBsYXRmb3JtcyB3aXRoIHRoZSBzdGFuZGFyZCBDTU8gb3BzIHRoZSBicmFuY2ggYmUgY29ycmVj
dGx5Cj4gPiBwcmVkaWN0ZWQgYW55d2F5Lgo+Cj4gTm90IGp1c3QgdGhlIGZsdXNoaW5nLCBidXQg
YWxzbyBsb2FkaW5nIGJhY2sgdGhlIGludmFsaWRhdGVkCj4gY2FjaGUgbGluZXMgYWZ0ZXJ3YXJk
cyBpcyBqdXN0IHZlcnkgZXhwZW5zaXZlLiBJIGRvbid0IHRoaW5rCj4geW91IHdvdWxkIGJlIGFi
bGUgdG8gbWVhc3VyZSBhIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgc3RhdGljCj4ga2V5IGFuZCBh
IGNvcnJlY3RseSBwcmVkaWN0ZWQgYnJhbmNoIG9uIGFueSByZWxldmFudCB1c2VjYXNlIGhlcmUu
Ck1heWJlIHdlIHNob3VsZCBtb3ZlIENNTyAmIFRIRUFEIG9wcyB0byB0aGUgbm9uY29oZXJlbnRf
Y2FjaGVfb3BzLCBhbmQKb25seSBrZWVwIG9uZSBvZiB0aGVtLgoKSSBwcmVmZXIgbm9uY29oZXJl
bnRfY2FjaGVfb3BzLCBpdCdzIG1vcmUgbWFpbnRhbmNlIHRoYW4gQUxURVJOQVRJVkUuCgpIZWlr
bywgSG93IGRvIHlvdSB0aGluayBhYm91dCB0aGlzPwoKPgo+ICAgICAgQXJuZAoKCgotLSAKQmVz
dCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
