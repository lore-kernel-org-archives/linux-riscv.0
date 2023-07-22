Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BADC0015E
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jul 2023 23:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZmHyNG/qNMHPHdTVuiS4A9j5fwz5ryJJfrwhclx2T64=; b=1z97ftbRJryJRj
	RxavqQkOLhsXcdyqRa9gaZAghgyY4lCpqdMejGrTPSMp4dBHmv3BgP2fUx2dbRmgnnYJv+ZFQznQq
	XTv9fByC803FwSDuQlce0Ol80oqg9P7ZmBMqQzyPPgFnFvUjApskX3NNb3bHJkxOFnj1DVo8p45gN
	CbV1sbkLT7tn2OnT1CB+1o4x6y6mM9nsvBgembLJU1mn0RiJMXo/eAAem/gVfReJonX5tQvAC9e5Y
	oPa8LVIwymR3BBDfVvaA7zm6ENhDkiG0o7WpCL3GUORf6n194/P+S/gfJ6TW+JvA97250478DaU/A
	zfsRbqi4nquLtMjDfNvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNLe8-00HSKA-1P;
	Sat, 22 Jul 2023 23:04:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNLe4-00HSJK-0r
	for linux-riscv@lists.infradead.org;
	Sat, 22 Jul 2023 23:04:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B7BA460C0F
	for <linux-riscv@lists.infradead.org>; Sat, 22 Jul 2023 23:04:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90B56C433D9
	for <linux-riscv@lists.infradead.org>; Sat, 22 Jul 2023 23:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690067054;
	bh=jHDurJCKvh+0DW2iz6/hNYVkG/b77t0wwifyBKWDoQ0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MM/VZcc9SSBG8sY3FioZUC8DvEhQpaWmbfjX+U0MDN/20a0ucLWbu2BhVQGCEwiiA
	 JDTVGSHOaULmhXZUQvN5C6TiiZ4LhyNlGwROSFaEG6nVfv3WYUjYM4at2hxF+mzr2V
	 Gd2Vgrzl0ASWzX/d4PaPkzEuV5h4gmcphEiigE5EsHLFiHK68BMNUAM1HdSxARiRjf
	 jGAA++1lFJXoTaf8PfWHsNWDj7dNRHKregqHxVYAQ+QuBCOnC4ExInEhI5IiddAg/Y
	 MQlPREmH+Brr7r8j3e/m+bi/S2CprY/5g0CNTFIud1kKXaJkW6GcXtgPGmVbUNDd6q
	 CPCTmRz4yzebg==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-98e39784a85so895333966b.1
        for <linux-riscv@lists.infradead.org>; Sat, 22 Jul 2023 16:04:14 -0700 (PDT)
X-Gm-Message-State: ABy/qLYK6S5OuxOdZPxYU98gaA0+xXFrEtquW3MBwq3S1Td6qffdPm8i
	5lGRe1Eg8Q2Tk/DCxgQ9XdEG9ytmsbWGYWCQN5Y=
X-Google-Smtp-Source: APBJJlHEIAEKlsJ3S8q5nOLrJPnA7QWosr2T4LRq/I7my9NOXv77NsFxailpjiAeFkQL3gGB0DohcUF9YxjSgXhYwFY=
X-Received: by 2002:a17:906:5a53:b0:994:5457:269e with SMTP id
 my19-20020a1709065a5300b009945457269emr6034479ejc.0.1690067052821; Sat, 22
 Jul 2023 16:04:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230722-upstream-beaglev-ahead-dts-v1-0-ccda511357f4@baylibre.com>
 <20230722-upstream-beaglev-ahead-dts-v1-1-ccda511357f4@baylibre.com>
In-Reply-To: <20230722-upstream-beaglev-ahead-dts-v1-1-ccda511357f4@baylibre.com>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 23 Jul 2023 07:04:01 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTTJM8o+rTciXE2W29OaCTi+CPrSWx0+4XFA8yQBEGm9w@mail.gmail.com>
Message-ID: <CAJF2gTTTJM8o+rTciXE2W29OaCTi+CPrSWx0+4XFA8yQBEGm9w@mail.gmail.com>
Subject: Re: [PATCH 1/3] riscv: dts: thead: add BeagleV Ahead board device tree
To: Drew Fustini <dfustini@baylibre.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Robert Nelson <robertcnelson@beagleboard.org>, 
	Jason Kridner <jkridner@beagleboard.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230722_160416_391979_65A298D2 
X-CRM114-Status: GOOD (  18.43  )
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

UmV2aWV3ZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgoKT24gU3VuLCBKdWwgMjMs
IDIwMjMgYXQgNTo1NuKAr0FNIERyZXcgRnVzdGluaSA8ZGZ1c3RpbmlAYmF5bGlicmUuY29tPiB3
cm90ZToKPgo+IFRoZSBCZWFnbGVWIEFoZWFkIHNpbmdsZSBib2FyZCBjb21wdXRlciB1c2VzIHRo
ZSBULUhlYWQgVEgxNTIwIFNvQy4KPiBBZGQgYSBtaW5pbWFsIGRldmljZSB0cmVlIHRvIHN1cHBv
cnQgYmFzaWMgdWFydC9ncGlvL2RtYWMgZHJpdmVycyBzbwo+IHRoYXQgYSB1c2VyIGNhbiBib290
IHRvIGEgYmFzaWMgc2hlbGwuCj4KPiBMaW5rOiBodHRwczovL2JlYWdsZWJvYXJkLm9yZy9iZWFn
bGV2LWFoZWFkCj4gU2lnbmVkLW9mZi1ieTogRHJldyBGdXN0aW5pIDxkZnVzdGluaUBiYXlsaWJy
ZS5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQvTWFrZWZpbGUgICAgICAg
ICAgICAgICAgIHwgIDIgKy0KPiAgYXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC90aDE1MjAtYmVh
Z2xldi1haGVhZC5kdHMgfCA2MSArKysrKysrKysrKysrKysrKysrKysrCj4gIDIgZmlsZXMgY2hh
bmdlZCwgNjIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQvTWFrZWZpbGUgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3Ro
ZWFkL01ha2VmaWxlCj4gaW5kZXggZTMxMWZjOWE1OTM5Li5iNTVhMTcxMjdjMmIgMTAwNjQ0Cj4g
LS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC9NYWtlZmlsZQo+ICsrKyBiL2FyY2gvcmlz
Y3YvYm9vdC9kdHMvdGhlYWQvTWFrZWZpbGUKPiBAQCAtMSwyICsxLDIgQEAKPiAgIyBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+IC1kdGItJChDT05GSUdfQVJDSF9USEVBRCkgKz0g
dGgxNTIwLWxpY2hlZS1waS00YS5kdGIKPiArZHRiLSQoQ09ORklHX0FSQ0hfVEhFQUQpICs9IHRo
MTUyMC1saWNoZWUtcGktNGEuZHRiIHRoMTUyMC1iZWFnbGV2LWFoZWFkLmR0Ygo+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3RoZWFkL3RoMTUyMC1iZWFnbGV2LWFoZWFkLmR0cyBi
L2FyY2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQvdGgxNTIwLWJlYWdsZXYtYWhlYWQuZHRzCj4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLmMzMTVlNWJkM2QyZAo+IC0t
LSAvZGV2L251bGwKPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3RoZWFkL3RoMTUyMC1iZWFn
bGV2LWFoZWFkLmR0cwo+IEBAIC0wLDAgKzEsNjEgQEAKPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IEdQTC0yLjAKPiArLyoKPiArICogQ29weXJpZ2h0IChDKSAyMDIzIEppc2hlbmcgWmhh
bmcgPGpzemhhbmdAa2VybmVsLm9yZz4KPiArICogQ29weXJpZ2h0IChDKSAyMDIzIERyZXcgRnVz
dGluaSA8ZGZ1c3RpbmlAYmF5bGlicmUuY29tPgo+ICsgKi8KPiArCj4gKy9kdHMtdjEvOwo+ICsK
PiArI2luY2x1ZGUgInRoMTUyMC5kdHNpIgo+ICsKPiArLyB7Cj4gKyAgICAgICBtb2RlbCA9ICJC
ZWFnbGVWIEFoZWFkIjsKPiArICAgICAgIGNvbXBhdGlibGUgPSAiYmVhZ2xlLGJlYWdsZXYtYWhl
YWQiLCAidGhlYWQsdGgxNTIwIjsKPiArCj4gKyAgICAgICBhbGlhc2VzIHsKPiArICAgICAgICAg
ICAgICAgZ3BpbzAgPSAmZ3BpbzA7Cj4gKyAgICAgICAgICAgICAgIGdwaW8xID0gJmdwaW8xOwo+
ICsgICAgICAgICAgICAgICBncGlvMiA9ICZncGlvMjsKPiArICAgICAgICAgICAgICAgZ3BpbzMg
PSAmZ3BpbzM7Cj4gKyAgICAgICAgICAgICAgIHNlcmlhbDAgPSAmdWFydDA7Cj4gKyAgICAgICAg
ICAgICAgIHNlcmlhbDEgPSAmdWFydDE7Cj4gKyAgICAgICAgICAgICAgIHNlcmlhbDIgPSAmdWFy
dDI7Cj4gKyAgICAgICAgICAgICAgIHNlcmlhbDMgPSAmdWFydDM7Cj4gKyAgICAgICAgICAgICAg
IHNlcmlhbDQgPSAmdWFydDQ7Cj4gKyAgICAgICAgICAgICAgIHNlcmlhbDUgPSAmdWFydDU7Cj4g
KyAgICAgICB9Owo+ICsKPiArICAgICAgIGNob3NlbiB7Cj4gKyAgICAgICAgICAgICAgIHN0ZG91
dC1wYXRoID0gInNlcmlhbDA6MTE1MjAwbjgiOwo+ICsgICAgICAgfTsKPiArCj4gKyAgICAgICBt
ZW1vcnlAMCB7Cj4gKyAgICAgICAgICAgICAgIGRldmljZV90eXBlID0gIm1lbW9yeSI7Cj4gKyAg
ICAgICAgICAgICAgIHJlZyA9IDwweDAgIDB4MDAwMDAwMDAgIDB4MSAweDAwMDAwMDAwPjsKPiAr
Cj4gKyAgICAgICB9Owo+ICt9Owo+ICsKPiArJm9zYyB7Cj4gKyAgICAgICBjbG9jay1mcmVxdWVu
Y3kgPSA8MjQwMDAwMDA+Owo+ICt9Owo+ICsKPiArJm9zY18zMmsgewo+ICsgICAgICAgY2xvY2st
ZnJlcXVlbmN5ID0gPDMyNzY4PjsKPiArfTsKPiArCj4gKyZhcGJfY2xrIHsKPiArICAgICAgIGNs
b2NrLWZyZXF1ZW5jeSA9IDw2MjUwMDAwMD47Cj4gK307Cj4gKwo+ICsmdWFydF9zY2xrIHsKPiAr
ICAgICAgIGNsb2NrLWZyZXF1ZW5jeSA9IDwxMDAwMDAwMDA+Owo+ICt9Owo+ICsKPiArJmRtYWMw
IHsKPiArICAgICAgIHN0YXR1cyA9ICJva2F5IjsKPiArfTsKPiArCj4gKyZ1YXJ0MCB7Cj4gKyAg
ICAgICBzdGF0dXMgPSAib2theSI7Cj4gK307Cj4KPiAtLQo+IDIuMzQuMQo+CgoKLS0gCkJlc3Qg
UmVnYXJkcwogR3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
