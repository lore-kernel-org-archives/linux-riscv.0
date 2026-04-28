Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48EEFFF8868
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Apr 2026 10:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xUPwYZVzQygwxM2cEUG6AS5fhzDfCwBQy5d7/XxOJUc=; b=KmKtY45EXe7X6r
	++6Bpc6U5qails8un6EIwm9vos883YPOt9vaoQ6l5Mi6mdTp8F/wwvevXPwrouruDUoM1SHoXr/hb
	6x1QOZz6Nl8SU2QpKWOuj88qwFM+jmPETlhBPc+zkYxAlZCU8ugNA1XAiU2fUecDL0aI/e2lkqM3e
	7DyxIwVZPfeAB2qS+6H6abb9vxF8AUw23d3ckYWjeOYuW0Fx1w65UXmm4//4yglLNN4vFdgc8gdX/
	biXRLMvA/F3LaldYpXqksCG6feivv2a37c6dfQ/OZVwgwJGlBsu7wX6BrPg7TnVWtbM5xH3CK/AKl
	DyVM2sFBAClklYm0RcIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHfm2-00000001BdC-0GDr;
	Tue, 28 Apr 2026 10:34:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHfm0-00000001Bd6-2gLp
	for linux-riscv@lists.infradead.org;
	Tue, 28 Apr 2026 10:34:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BF0FF6014C
	for <linux-riscv@lists.infradead.org>; Tue, 28 Apr 2026 10:34:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74A5EC2BCB8
	for <linux-riscv@lists.infradead.org>; Tue, 28 Apr 2026 10:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777372475;
	bh=gfkP8u/is+YdXUFtrO/ofQ1MfyxFL2J12FWjzi6PQRE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IadyuzCcEFJRKbK1/nNcNjLcPqQVstV9hLpn7AAkd6qYTkJFJMlogQgOEPeqrgWck
	 Fqg96jElAD2FXMXcsqG6d7vqpIZPq3iaC5FuOnHEr6VCoRgmVruv1z+h0f15AG+tow
	 NgjExlmnunaOXmqQwSacVbgwUorzt+VgqfTNKiaptnQNEbzSuzZXuK3L55ZD0zHQNB
	 oLajaIuOvF4zywmbGTpjgt/SV7Jwq6vDERMdqH3QRbFcfnO4q+3nneqnVvLUph7voD
	 lKpO9RZCIwNMgijsqVAQPywrc8VANaQbJJJHunh6wBFfWfFYZ2nGxrb8TAAudzVEbs
	 mP/AmRSUBQ6uQ==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38ccde812ecso110337191fa.0
        for <linux-riscv@lists.infradead.org>; Tue, 28 Apr 2026 03:34:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ87qTqEXAcPsnJ/o/vKRtpBF+JrQhHFtPQg46C5kdAL+AycgwkOnhfKYEpsQOPQH9BDl8aYROkn1XZsxA==@lists.infradead.org
X-Gm-Message-State: AOJu0YynAwhqqvZ7d9OMRvPR3EEPbdLviAo9IKfY8uoEwrFzIBhyce4L
	AOLKy0EkBQaYDvJkKt8aNEO080QE1OTVFTXOaBGUyVZkVpvuMOIq8hAfd/QmGhscS6s9c0s4Zr4
	YTkux7CKAKmouLKoi1EGrxX+qV/34dXw=
X-Received: by 2002:a05:651c:4406:10b0:38e:8aff:b657 with SMTP id
 38308e7fff4ca-392403e0b2cmr6629161fa.22.1777372474178; Tue, 28 Apr 2026
 03:34:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260424111330.702272-1-changhuang.liang@starfivetech.com> <20260424111330.702272-2-changhuang.liang@starfivetech.com>
In-Reply-To: <20260424111330.702272-2-changhuang.liang@starfivetech.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 28 Apr 2026 12:34:22 +0200
X-Gmail-Original-Message-ID: <CAD++jLkJZ3R9H1jmB0xS90w7AiboxmUkrVf0q3kb9Os=QEVe9w@mail.gmail.com>
X-Gm-Features: AVHnY4JRDyRgCHQroy6EcXp3lxK1Vk4EH6R59HQQOsESeJNnC-Dck6eQQIL6w6Q
Message-ID: <CAD++jLkJZ3R9H1jmB0xS90w7AiboxmUkrVf0q3kb9Os=QEVe9w@mail.gmail.com>
Subject: Re: [PATCH v1 01/20] dt-bindings: pinctrl: Add starfive,jhb100-sys0-pinctrl
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <pjw@kernel.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
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

SGkgQ2hhbmdodWFuZywKCnRoYW5rcyBmb3IgeW91ciBwYXRjaCEKCk9uIEZyaSwgQXByIDI0LCAy
MDI2IGF0IDE6MTPigK9QTSBDaGFuZ2h1YW5nIExpYW5nCjxjaGFuZ2h1YW5nLmxpYW5nQHN0YXJm
aXZldGVjaC5jb20+IHdyb3RlOgoKPiBBZGQgcGluY3RybCBiaW5kaW5ncyBmb3IgU3RhckZpdmUg
SkhCMTAwIFNvQyBTeXN0ZW0tMChzeXMwKSBwaW5jdHJsCj4gY29udHJvbGxlci4KPgo+IFNpZ25l
ZC1vZmYtYnk6IENoYW5naHVhbmcgTGlhbmcgPGNoYW5naHVhbmcubGlhbmdAc3RhcmZpdmV0ZWNo
LmNvbT4KKC4uLikKPiArICAgICAgICBwcm9wZXJ0aWVzOgo+ICsgICAgICAgICAgcGlubXV4Ogo+
ICsgICAgICAgICAgICBkZXNjcmlwdGlvbjogfAo+ICsgICAgICAgICAgICAgIFRoZSBsaXN0IG9m
IEdQSU9zIGFuZCB0aGVpciBmdW5jdGlvbiBzZWxlY3QuCj4gKyAgICAgICAgICAgICAgVGhlIFBJ
Tk1VWCBtYWNyb3MgYXJlIHVzZWQgdG8gY29uZmlndXJlIHRoZQo+ICsgICAgICAgICAgICAgIGZ1
bmN0aW9uIHNlbGVjdGlvbi4KPiArCj4gKyAgICAgICAgICBiaWFzLWRpc2FibGU6IHRydWUKPiAr
Cj4gKyAgICAgICAgICBiaWFzLXB1bGwtdXA6Cj4gKyAgICAgICAgICAgIHR5cGU6IGJvb2xlYW4K
PiArCj4gKyAgICAgICAgICBiaWFzLXB1bGwtZG93bjoKPiArICAgICAgICAgICAgdHlwZTogYm9v
bGVhbgo+ICsKPiArICAgICAgICAgIGRyaXZlLXN0cmVuZ3RoOgo+ICsgICAgICAgICAgICBlbnVt
OiBbIDIsIDQsIDgsIDEyIF0KPiArCj4gKyAgICAgICAgICBkcml2ZS1zdHJlbmd0aC1taWNyb2Ft
cDoKPiArICAgICAgICAgICAgZW51bTogWyAyMDAwLCA0MDAwLCA4MDAwLCAxMjAwMCBdCj4gKwo+
ICsgICAgICAgICAgaW5wdXQtZW5hYmxlOiB0cnVlCj4gKwo+ICsgICAgICAgICAgaW5wdXQtZGlz
YWJsZTogdHJ1ZQo+ICsKPiArICAgICAgICAgIGlucHV0LXNjaG1pdHQtZW5hYmxlOiB0cnVlCj4g
Kwo+ICsgICAgICAgICAgaW5wdXQtc2NobWl0dC1kaXNhYmxlOiB0cnVlCj4gKwo+ICsgICAgICAg
ICAgc2xldy1yYXRlOgo+ICsgICAgICAgICAgICBlbnVtOiBbIDAsIDEgXQo+ICsgICAgICAgICAg
ICBkZWZhdWx0OiAwCj4gKyAgICAgICAgICAgIGRlc2NyaXB0aW9uOiB8Cj4gKyAgICAgICAgICAg
ICAgICAwOiBzbG93IChoYWxmIGZyZXF1ZW5jeSkKPiArICAgICAgICAgICAgICAgIDE6IGZhc3QK
PiArCj4gKyAgICAgICAgICBzdGFyZml2ZSxkZWJvdW5jZS13aWR0aDoKPiArICAgICAgICAgICAg
JHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyCj4gKyAgICAgICAg
ICAgIGRlZmF1bHQ6IDAKPiArICAgICAgICAgICAgZGVzY3JpcHRpb246Cj4gKyAgICAgICAgICAg
ICAgRGVib3VuY2Ugd2lkdGggMCA9IERpc2FibGVkLCBPdGhlcnMgPSA4MG5zKk4gc3RhZ2VzCgpU
aGUgYXJndW1lbnQgdG8gdGhlIGV4aXN0aW5nCmlucHV0LWRlYm91bmNlIGlzIGV4cHJlc3NlZCBp
biBtaWNyb3NlY29uZHMuIEp1c3QgcmVjYWxjdWxhdGUKdGhhdCB2YWx1ZSB0byB5b3VyICJ3aWR0
aCI/IElmIHlvdSBuZWVkIG1vcmUgZ3JhbnVsYXJpdHkgYWRkIGEKZ2VuZXJpYyBwcm9wZXJ0eSBp
bnB1dC1kZWJvdW5kLW5hbm9zZWNvbmRzID0gPC4uLj47CgpUaGUgY29kZSB5b3Ugc3VibWl0dGVk
IGNvbnRhaW5zIHRoZXNlIHVuZG9jdW1lbnRlZCBwcm9wZXJ0aWVzLApjb3BpZWQgZnJvbSB0aGUg
ZHJpdmVyIHJldmlldzoKCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgcGluY29uZl9nZW5lcmljX3Bh
cmFtcyBqaGIxMDBfY3VzdG9tX2JpbmRpbmdzW10gPSB7Cj4gKyAgICAgICB7ICJzdGFyZml2ZSxn
bWFjLXZzZWwiLCBTVEFSRklWRV9QSU5fQ09ORklHX0dNQUNfVlNFTCwgMCB9LAoKQ2FuJ3QgeW91
IHVzZSB0aGUgZXhpc3RpbmcgInBvd2VyLXNvdXJjZSIgaW5zdGVhZD8gSXQncyBmaW5lIGlmIGl0
J3Mgb25seQphcHBsaWNhYmxlIHRvIGEgZmV3IHBpbnMuIFRoaXMgaXMgb3Zlcmx5IHNwZWNpZmlj
LgoKPiArICAgICAgIHsgInN0YXJmaXZlLGRyaXZlLWkyYy1mYXN0LW1vZGUiLCBTVEFSRklWRV9Q
SU5fRFJJVkVfSTJDX0ZBU1RfTU9ERSwgMCB9LAo+ICsgICAgICAgeyAic3RhcmZpdmUsZHJpdmUt
aTJjLWZhc3QtbW9kZS1wbHVzIiwgU1RBUkZJVkVfUElOX0RSSVZFX0kyQ19GQVNUX01PREVfUExV
UywgMCB9LAoKSXQncyBub3Qgc3BlY2lhbCB0aGF0IHRoaW5ncyBhcmUgZm9yIGkyYy4gVXNlIHRo
ZSBnZW5lcmljCnNsZXctcmF0ZSBmb3IgdGhlc2UgdHdvLCBpdCBkZXNjcmliZXMgaG93IGZhc3Qg
c29tZXRoaW5nIGlzLgoKPiArICAgICAgIHsgInN0YXJmaXZlLGkyYy1vcGVuLWRyYWluLXB1bGwt
dXAtb2htIiwgU1RBUkZJVkVfUElOX09QRU5fRFJBSU5fUFVMTFVQX1NFTEVDVCwgMCB9LAoKVXNl
IHRoZSBleGlzdGluZyBkcml2ZS1vcGVuLWRyYWluOyB3aXRoIHRoZSBleGlzdGluZyBiaWFzLXB1
bGwtdXAgPSA8b2htcz47CnR3byBwcm9wZXJ0aWVzLiBObyBuZWVkIHRvIGJlIGZhbmN5IGFuZCBj
cmVhdGUgYSBuZXcgcHJvcGVydHkgZm9yIHRoaXMuCgo+ICsgICAgICAgeyAic3RhcmZpdmUsdmdh
LXJ0ZSIsIFNUQVJGSVZFX1BJTl9WR0FfUlRFX1NFTEVDVCwgMCB9LAoKTm8gaWRlYSB3aGF0IHRo
aXMgaXMuLi4KCllvdXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
