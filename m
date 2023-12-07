Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA8BC4167B
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Dec 2023 08:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p+YJjE/gXZdudHcsMvkCf/z2iiRA2ggIbG/M3VxzBlI=; b=wMzQzdaAU2wZhZ
	hyMXLPKxKF5Dqr5m89IzfVqICgWHMcsJzLfqLgjYS2+Cu8gYohdYVkJyidPTXn1mnkLof25ubTo3t
	1RET9ZupNqcaeraXqMq9+jh9XvIZkb3Gn/xIPM/HlE10SNYQRXeYweGW+olACURi5rENEBeeojRi3
	CLtTivU5cRiUhH3OE7H76nPRyd1N2sp4E1EZE3z06Ya7Lr/ZqI8Pcub3NsN9GD1/OogrzLO82g4Il
	irtiAF5E4wHo30GprzI2M+viIgT6HGG4/5i3e/75v8iAl55uL+TaPCKwEM4ojNQ+Cs6jqgnCXvbiF
	CmG5++hMRP2xDdCSmkdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rB9fN-00CCby-1l;
	Thu, 07 Dec 2023 08:23:29 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rB9fK-00CCaP-38
	for linux-riscv@lists.infradead.org;
	Thu, 07 Dec 2023 08:23:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 1540EB82668
	for <linux-riscv@lists.infradead.org>; Thu,  7 Dec 2023 08:23:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF03FC433CA
	for <linux-riscv@lists.infradead.org>; Thu,  7 Dec 2023 08:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701937403;
	bh=yk6swEfuyRxghN0BW1FvsI13oCfcyxJGSxYDBp8aTtY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tyuz9FrzPf/fDcUa6SuBRAN8fJSbKpzRSIOJLn+4UP3+0E9bTArAZfATV8NbM+mxC
	 dohXtJu2DvNbOrKmaOUUzPvAGk0GYdYvSOmTHH6n3dkgQ/lI+2OVhO9QIwTBp1vsUx
	 zvKRhzKhUpBdieUNlU/jN+OGPfZC8pot9sXkJarO6S3SqX3Ey2uW9pVb9RBrsIn/Zs
	 AUkBnDErFb7DIpvNRvMm94UI6rnPSz1Pnr8GbO9vdXPstayATdEciaMoy1bqIcVJ/M
	 ZwwoD9WUvfLFfC48qxmkijrZXAqVui1BH5zRQVVPe80bPbYIYekocIIspBrXS/uHk7
	 lZ62rlOPt6XMQ==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a1da1017a09so72129766b.3
        for <linux-riscv@lists.infradead.org>; Thu, 07 Dec 2023 00:23:23 -0800 (PST)
X-Gm-Message-State: AOJu0YxdHjUf4Qh73KpwQUexauHablFb3IR2/sv605//joWDmIfD+wGj
	m16U3HWwNgkxv3LC2W9tlCGsldCF/yvUETqb6ds=
X-Google-Smtp-Source: AGHT+IFoCVyTLoIcwyDXDm0QqN3KpaIFbMYwNQTGB8nrfNWHSaJALJpdmDtfjqP8/m/GwnGLNHBEYi0kUL0Ufd0kiUM=
X-Received: by 2002:a17:906:1017:b0:a1e:42e1:293d with SMTP id
 23-20020a170906101700b00a1e42e1293dmr818321ejm.94.1701937402114; Thu, 07 Dec
 2023 00:23:22 -0800 (PST)
MIME-Version: 1.0
References: <20231206-th1520_mmc_dts-v8-0-69220e373e8f@baylibre.com> <20231206-th1520_mmc_dts-v8-2-69220e373e8f@baylibre.com>
In-Reply-To: <20231206-th1520_mmc_dts-v8-2-69220e373e8f@baylibre.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 7 Dec 2023 16:23:10 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTnhBZWZxad8=+9W38WL7sRFmugxAyDDzK=BUPK44q4qA@mail.gmail.com>
Message-ID: <CAJF2gTTnhBZWZxad8=+9W38WL7sRFmugxAyDDzK=BUPK44q4qA@mail.gmail.com>
Subject: Re: [PATCH v8 2/4] riscv: dts: thead: Add TH1520 mmc controllers and
 sdhci clock
To: Drew Fustini <dfustini@baylibre.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Jisheng Zhang <jszhang@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Jason Kridner <jkridner@beagleboard.org>, Robert Nelson <robertcnelson@beagleboard.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_002327_334582_4B6610C0 
X-CRM114-Status: GOOD (  14.83  )
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

T24gV2VkLCBEZWMgNiwgMjAyMyBhdCA0OjA54oCvUE0gRHJldyBGdXN0aW5pIDxkZnVzdGluaUBi
YXlsaWJyZS5jb20+IHdyb3RlOgo+Cj4gQWRkIG5vZGUgZm9yIHRoZSBmaXhlZCByZWZlcmVuY2Ug
Y2xvY2sgdXNlZCBmb3IgZW1tYyBhbmQgc2RpbyBub2Rlcy4KPiBBZGQgZW1tYyBub2RlIGZvciB0
aGUgMXN0IGR3Y21zaGMgaW5zdGFuY2Ugd2hpY2ggaXMgdHlwaWNhbGx5IGNvbm5lY3RlZAo+IHRv
IGFuIGVNTUMgZGV2aWNlLiBBZGQgc2RpbzAgbm9kZSBmb3IgdGhlIDJuZCBkd2Ntc2hjIGluc3Rh
bmNlIHdoaWNoIGlzCj4gdHlwaWNhbGx5IGNvbm5lY3RlZCB0byBtaWNyb1NEIHNsb3QuIEFkZCBz
ZGlvMSBub2RlIGZvciB0aGUgM3JkIGR3Y21zaGMKPiBpbnN0YW5jZSB3aGljaCBpcyB0eXBpY2Fs
bHkgY29ubmVjdGVkIHRvIGFuIFNESU8gV2lGaSBtb2R1bGUuIFRoZSBub2RlCj4gbmFtZXMgYXJl
IGJhc2VkIG9uIFRhYmxlIDEtMiBDOTEwL0M5MDYgbWVtb3J5IG1hcCBpbiB0aGUgVEgxNTIwIFN5
c3RlbQo+IFVzZXIgTWFudWFsLgo+Cj4gTGluazogaHR0cHM6Ly9naXQuYmVhZ2xlYm9hcmQub3Jn
L2JlYWdsZXYtYWhlYWQvYmVhZ2xldi1haGVhZC8tL3RyZWUvbWFpbi9kb2NzCj4gU2lnbmVkLW9m
Zi1ieTogRHJldyBGdXN0aW5pIDxkZnVzdGluaUBiYXlsaWJyZS5jb20+Cj4gLS0tCj4gIGFyY2gv
cmlzY3YvYm9vdC9kdHMvdGhlYWQvdGgxNTIwLmR0c2kgfCAzNCArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspCj4KPiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC90aDE1MjAuZHRzaSBiL2FyY2gv
cmlzY3YvYm9vdC9kdHMvdGhlYWQvdGgxNTIwLmR0c2kKPiBpbmRleCBiYTRkMmM2NzNhYzguLjhi
OTE1ZTIwNmYzYSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3RoZWFkL3RoMTUy
MC5kdHNpCj4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC90aDE1MjAuZHRzaQo+IEBA
IC0xNDYsNiArMTQ2LDEzIEBAIHVhcnRfc2NsazogdWFydC1zY2xrLWNsb2NrIHsKPiAgICAgICAg
ICAgICAgICAgI2Nsb2NrLWNlbGxzID0gPDA+Owo+ICAgICAgICAgfTsKPgo+ICsgICAgICAgc2Ro
Y2lfY2xrOiBzZGhjaS1jbG9jayB7Cj4gKyAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiZml4
ZWQtY2xvY2siOwo+ICsgICAgICAgICAgICAgICBjbG9jay1mcmVxdWVuY3kgPSA8MTk4MDAwMDAw
PjsKPiArICAgICAgICAgICAgICAgY2xvY2stb3V0cHV0LW5hbWVzID0gInNkaGNpX2NsayI7Cj4g
KyAgICAgICAgICAgICAgICNjbG9jay1jZWxscyA9IDwwPjsKPiArICAgICAgIH07Cj4gKwo+ICAg
ICAgICAgc29jIHsKPiAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJzaW1wbGUtYnVzIjsK
PiAgICAgICAgICAgICAgICAgaW50ZXJydXB0LXBhcmVudCA9IDwmcGxpYz47Cj4gQEAgLTMwNCw2
ICszMTEsMzMgQEAgZG1hYzA6IGRtYS1jb250cm9sbGVyQGZmZWZjMDAwMDAgewo+ICAgICAgICAg
ICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4gICAgICAgICAgICAgICAgIH07
Cj4KPiArICAgICAgICAgICAgICAgZW1tYzogbW1jQGZmZTcwODAwMDAgewo+ICsgICAgICAgICAg
ICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAidGhlYWQsdGgxNTIwLWR3Y21zaGMiOwo+ICsgICAg
ICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweGZmIDB4ZTcwODAwMDAgMHgwIDB4MTAwMDA+Owo+
ICsgICAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdHMgPSA8NjIgSVJRX1RZUEVfTEVWRUxf
SElHSD47Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgY2xvY2tzID0gPCZzZGhjaV9jbGs+Owo+
ICsgICAgICAgICAgICAgICAgICAgICAgIGNsb2NrLW5hbWVzID0gImNvcmUiOwo+ICsgICAgICAg
ICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4gKyAgICAgICAgICAgICAgIH07
Cj4gKwo+ICsgICAgICAgICAgICAgICBzZGlvMDogbW1jQGZmZTcwOTAwMDAgewo+ICsgICAgICAg
ICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAidGhlYWQsdGgxNTIwLWR3Y21zaGMiOwo+ICsg
ICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweGZmIDB4ZTcwOTAwMDAgMHgwIDB4MTAwMDA+
Owo+ICsgICAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdHMgPSA8NjQgSVJRX1RZUEVfTEVW
RUxfSElHSD47Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgY2xvY2tzID0gPCZzZGhjaV9jbGs+
Owo+ICsgICAgICAgICAgICAgICAgICAgICAgIGNsb2NrLW5hbWVzID0gImNvcmUiOwo+ICsgICAg
ICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4gKyAgICAgICAgICAgICAg
IH07Cj4gKwo+ICsgICAgICAgICAgICAgICBzZGlvMTogbW1jQGZmZTcwYTAwMDAgewo+ICsgICAg
ICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAidGhlYWQsdGgxNTIwLWR3Y21zaGMiOwo+
ICsgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweGZmIDB4ZTcwYTAwMDAgMHgwIDB4MTAw
MDA+Owo+ICsgICAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdHMgPSA8NzEgSVJRX1RZUEVf
TEVWRUxfSElHSD47Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgY2xvY2tzID0gPCZzZGhjaV9j
bGs+Owo+ICsgICAgICAgICAgICAgICAgICAgICAgIGNsb2NrLW5hbWVzID0gImNvcmUiOwo+ICsg
ICAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4gKyAgICAgICAgICAg
ICAgIH07Cj4gKwo+ICAgICAgICAgICAgICAgICB0aW1lcjA6IHRpbWVyQGZmZWZjMzIwMDAgewo+
ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAic25wcyxkdy1hcGItdGltZXIi
Owo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweGZmIDB4ZWZjMzIwMDAgMHgwIDB4
MTQ+Owo+Cj4gLS0KPiAyLjM0LjEKPgpSZXZpZXdlZC1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5l
bC5vcmc+CgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
