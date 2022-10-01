Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E912DC433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Oct 2022 11:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CnnvO8hD98f0l6JlMDUcn/DpZaadAM4CxfE3PLZT/Bs=; b=baJsKg/4ao6Q1D
	HHyMvDvo7XrpfcMJTnur75ktN6GcoR/gQVlKI5hRLvBWk7cFXvKaY5wdsBd6PxvF5JtYX1XTPIZJi
	T1zKgnY8ktIjQmY6Ogu8H+cPxt+hHVH9GTgI2o7YjDjDKUnM53xYtuXS5RCTGnxJQCd5EzWDZLd7Q
	+63zJ/coqNxHmoCktB/G+TwguvkmNoeEoA8Z7bpoytsUrdTvRCDNzKlrCFBqg1s/8kj2YKkIblnoP
	jaRoC7ce5ykt0EEf55ck1tWNN11YirKqiSbQRjrsQwRSDBQn64yXQYpe26OHKGhphwbmSfeRbsi42
	bFEYXAweyzcx5ylbwFEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeaSU-00EIop-QP; Sat, 01 Oct 2022 11:15:02 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeaSQ-00EInW-V2
	for linux-riscv@lists.infradead.org; Sat, 01 Oct 2022 11:15:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4D91DB80E63;
	Sat,  1 Oct 2022 11:14:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 353DDC433C1;
	Sat,  1 Oct 2022 11:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664622895;
	bh=06zggjHa8kTBjzns75XbCc45MBQbTfIwinmOKApewzQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qK4LDBiC9y8EK1KCnuG2t8wKBHZ4BZ9Irq+tLn1Ev1VSRh2ywrpnAkWNyu+QcS0r0
	 +0LnGgmf8aFMyCNAKp7+RKkB/REOYW1RfhMeG8o7CN01Vx/+fqz1sDjzDlbrKvMpAG
	 Da7F1ejhJDbzaDZoO92IjdRPwSriLDZfp0Ozlc2LquSpF5tknkQl1dqTvKA+AZVU+E
	 WINvoI56EqsTQSOfvVRAvXFB6Bi5fLGkGClbKZ33b8lFKizqd/z1FHJ9XLx7ovgjdo
	 cQOWd4eJAUDqXPNwWCNdwx41cryB8tNvpZ3seLIF5ATBAB/myHlj/PlkJYFpZVu3Kd
	 U7/aTDryQ8tvw==
Date: Sat, 1 Oct 2022 12:14:49 +0100
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@linux.starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 28/30] RISC-V: Add StarFive JH7110 VisionFive2 board
 device tree
Message-ID: <YzghKZ2E8AN1ajnI@spud>
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
 <20220930075353.6842-1-hal.feng@linux.starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220930075353.6842-1-hal.feng@linux.starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221001_041459_313675_D11F23AC 
X-CRM114-Status: GOOD (  25.24  )
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

T24gRnJpLCBTZXAgMzAsIDIwMjIgYXQgMDM6NTM6NTNQTSArMDgwMCwgSGFsIEZlbmcgd3JvdGU6
Cj4gRnJvbTogRW1pbCBSZW5uZXIgQmVydGhpbmcgPGtlcm5lbEBlc21pbC5kaz4KPiAKPiBBZGQg
YSBtaW5pbWFsIGRldmljZSB0cmVlIGZvciBTdGFyRml2ZSBKSDcxMTAgVmlzaW9uRml2ZTIgYm9h
cmQuCj4gU3VwcG9ydCBib290aW5nIGFuZCBiYXNpYyBjbG9jay9yZXNldC9waW5jdHJsL3VhcnQg
ZHJpdmVycy4KPgoKSSB3b3VsZCBsaWtlIHRvIHNlZSBhIGxpbmsgdG8gdGhlIHB1YmxpY2x5IGF2
YWlsYWJsZSBkYXRhc2hlZXQgb3IKZG9jdW1lbnRhdGlvbiBmb3IgdGhlIGJvYXJkIChhbmQgZm9y
IHRoZSBTb0MgaW4gcGF0Y2ggMjgpIHBsZWFzZS4KCj4gU2lnbmVkLW9mZi1ieTogRW1pbCBSZW5u
ZXIgQmVydGhpbmcgPGtlcm5lbEBlc21pbC5kaz4KPiBTaWduZWQtb2ZmLWJ5OiBKaWFubG9uZyBI
dWFuZyA8amlhbmxvbmcuaHVhbmdAc3RhcmZpdmV0ZWNoLmNvbT4KCkRpdHRvIGZyb20gcGF0Y2gg
MjggcmU6IHRoZSBTb0IgY2hhaW4uCgo+IFNpZ25lZC1vZmYtYnk6IEhhbCBGZW5nIDxoYWwuZmVu
Z0BsaW51eC5zdGFyZml2ZXRlY2guY29tPgo+IC0tLQoKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAtc3RhcmZpdmUtdmlzaW9uZml2ZS12Mi5kdHMgYi9h
cmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC1zdGFyZml2ZS12aXNpb25maXZlLXYy
LmR0cwo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi42YjlmZTMy
YzdlYWMKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2
ZS9qaDcxMTAtc3RhcmZpdmUtdmlzaW9uZml2ZS12Mi5kdHMKPiBAQCAtMCwwICsxLDkxIEBACj4g
Ky8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wIE9SIE1JVAo+ICsvKgo+ICsgKiBD
b3B5cmlnaHQgKEMpIDIwMjIgU3RhckZpdmUgVGVjaG5vbG9neSBDby4sIEx0ZC4KPiArICogQ29w
eXJpZ2h0IChDKSAyMDIyIEVtaWwgUmVubmVyIEJlcnRoaW5nIDxrZXJuZWxAZXNtaWwuZGs+Cj4g
KyAqLwo+ICsKPiArL2R0cy12MS87Cj4gKyNpbmNsdWRlICJqaDcxMTAuZHRzaSIKPiArI2luY2x1
ZGUgPGR0LWJpbmRpbmdzL2dwaW8vZ3Bpby5oPgo+ICsjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcGlu
Y3RybC9waW5jdHJsLXN0YXJmaXZlLWpoNzExMC5oPgo+ICsKPiArLyB7Cj4gKwltb2RlbCA9ICJT
dGFyRml2ZSBWaXNpb25GaXZlIFYyIjsKPiArCWNvbXBhdGlibGUgPSAic3RhcmZpdmUsdmlzaW9u
Zml2ZS12MiIsICJzdGFyZml2ZSxqaDcxMTAiOwo+ICsKPiArCWFsaWFzZXMgewo+ICsJCXNlcmlh
bDAgPSAmdWFydDA7Cj4gKwl9OwoKU2hvdWxkIHdlIGFsc28gaGF2ZSBhIGNob3NlbiBub2RlIGhl
cmU/Cgo+ICsKPiArCWNwdXMgewo+ICsJCXRpbWViYXNlLWZyZXF1ZW5jeSA9IDw0MDAwMDAwPjsK
PiArCX07Cj4gKwo+ICsJbWVtb3J5QDQwMDAwMDAwIHsKPiArCQlkZXZpY2VfdHlwZSA9ICJtZW1v
cnkiOwo+ICsJCXJlZyA9IDwweDAgMHg0MDAwMDAwMCAweDEgMHgwPjsKCldoYXQgaXMgZ29pbmcg
dG8gaGFwcGVuIHRvIHRoZSAyIEdCIHZhcmlhbnQgaWYgdGhleSBhdHRlbXB0IHRvIHVzZSB0aGlz
CmRldmljZXRyZWU/Cgo+ICsJfTsKPiArCj4gKwlyZXNlcnZlZC1tZW1vcnkgewo+ICsJCSNhZGRy
ZXNzLWNlbGxzID0gPDI+Owo+ICsJCSNzaXplLWNlbGxzID0gPDI+Owo+ICsJCXJhbmdlczsKPiAr
Cj4gKwkJbGludXgsY21hIHsKPiArCQkJY29tcGF0aWJsZSA9ICJzaGFyZWQtZG1hLXBvb2wiOwo+
ICsJCQlyZXVzYWJsZTsKPiArCQkJc2l6ZSA9IDwweDAgMHgyMDAwMDAwMD47Cj4gKwkJCWFsaWdu
bWVudCA9IDwweDAgMHgxMDAwPjsKPiArCQkJYWxsb2MtcmFuZ2VzID0gPDB4MCAweGEwMDAwMDAw
IDB4MCAweDIwMDAwMDAwPjsKPiArCQkJbGludXgsY21hLWRlZmF1bHQ7Cj4gKwkJfTsKPiArCj4g
KwkJZTI0X21lbTogZTI0QGMwMDAwMDAwIHsKCkkgaGFkIGEgY29udmVyc2F0aW9uIHByZXZpb3Vz
bHkgd2l0aCBJY2Vub3d5IFswXSBhYm91dCB0aGUgZTI0IG9uIHRoZQpqaDcxMDAgdGhhdCBkaWRu
J3QgcmVhbGx5IGNvbWUgdG8gYSBjb25jbHVzaW9uIGFib3V0IGhvdyB0byByZXByZXNlbnQKaXQg
dGhlcmUgLSBidXQgbG9va3MgbGlrZSB5b3UndmUgZGVjaWRlZCB0aGF0IGl0IHNob3VsZCBiZSBh
IHJlbW90ZXByb2MKZm9yIHRoZSBqaDcxMDA/CgpJcyB0aGlzIGFub3RoZXIgc2l0dWF0aW9uIHdo
ZXJlIHBlcmlwaGVyYWxzIGFwcGVhciBhdCBkaWZmZXJlbnQKYWRkcmVzc2VzIGZvciB0aGUgZTI0
IGNvbXBhcmVkIHRvIHRoZSB1NzRzPyBPciBoYXMgdGhhdCBjaGFuZ2VkIGZvciB0aGUKamg3MTAw
LCBhbmQgcmVhbGx5IHRoZSBlMjQgc2hvdWxkIGJlIGRlc2NyaWJlZCBpbiB0aGUgQ1BVcyBub2Rl
PyBJZiBpdAppcyB0aGUgbGF0dGVyLCB5b3UgY2FuIHBpY2sgdGhlIGZpcnN0IHBhdGNoIGZyb20g
WzBdIGludG8geW91ciBzZXJpZXMuCgowIC0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
cmlzY3YvZTg1NDM4MzhjZDIyMWFiNjY5OWRhMTZjOTg1ZWVkNzUxNGRhYTc4Ni5jYW1lbEBpY2Vu
b3d5Lm1lLwoKPiArCQkJcmVnID0gPDB4MCAweGMwMTEwMDAwIDB4MCAweGYwMDAwPjsKPiArCQkJ
bm8tbWFwOwo+ICsJCX07Cj4gKwo+ICsJCXhycF9yZXNlcnZlZDogeHJwYnVmZmVyQGYwMDAwMDAw
IHsKCiJGb2xsb3dpbmcgdGhlIGdlbmVyaWMtbmFtZXMgcmVjb21tZW5kZWQgcHJhY3RpY2UsIG5v
ZGUgbmFtZXMgc2hvdWxkCnJlZmxlY3QgdGhlIHB1cnBvc2Ugb2YgdGhlIG5vZGUgKGllLiDigJxm
cmFtZWJ1ZmZlcuKAnSBvciDigJxkbWEtcG9vbOKAnSkuIgoKSSB0cmllZCBnb29nbGluZyBhcm91
bmQgZm9yIGFuIGV4cGxhbmF0aW9uIGZvciB3aGF0IHRoZSB4cnAgd2FzLCBhbmQgYWxsCkkgY291
bGQgZmluZCB3YXMgdGhpcyBvdXQtb2YtdHJlZSB0ZXh0IGJpbmRpbmc6Cmh0dHBzOi8vZ2l0aHVi
LmNvbS9mb3NzLXh0ZW5zYS94cnAvYmxvYi9tYXN0ZXIveHJwLWtlcm5lbC9jZG5zJTJDeHJwLWh3
LXNpbXBsZSUyQ3YxLnR4dAoKVGhhbmtzLApDb25vci4KCj4gKwkJCXJlZyA9IDwweDAgMHhmMDAw
MDAwMCAweDAgMHgwMWZmZmZmZj4sCj4gKwkJCSAgICAgIDwweDAgMHhmMjAwMDAwMCAweDAgMHgw
MDAwMTAwMD4sCj4gKwkJCSAgICAgIDwweDAgMHhmMjAwMTAwMCAweDAgMHgwMGZmZjAwMD4sCj4g
KwkJCSAgICAgIDwweDAgMHhmMzAwMDAwMCAweDAgMHgwMDAwMTAwMD47Cj4gKwkJfTsKPiArCj4g
Kwl9Owo+ICsKPiArCWdwaW8tcmVzdGFydCB7Cj4gKwkJY29tcGF0aWJsZSA9ICJncGlvLXJlc3Rh
cnQiOwo+ICsJCWdwaW9zID0gPCZncGlvIDM1IEdQSU9fQUNUSVZFX0hJR0g+Owo+ICsJCXByaW9y
aXR5ID0gPDIyND47Cj4gKwl9Owo+ICt9Owo+ICsKPiArJmdwaW8gewo+ICsJdWFydDBfcGluczog
dWFydDAtcGlucyB7Cj4gKwkJdWFydDAtcGlucy10eCB7Cj4gKwkJCXN0YXJmaXZlLHBpbnMgPSA8
UEFEX0dQSU81PjsKPiArCQkJc3RhcmZpdmUscGluLWlvY29uZmlnID0gPElPKEdQSU9fSUUoMSkg
fCBHUElPX0RTKDMpKT47Cj4gKwkJCXN0YXJmaXZlLHBpbi1ncGlvLWRvdXQgPSA8R1BPX1VBUlQw
X1NPVVQ+Owo+ICsJCQlzdGFyZml2ZSxwaW4tZ3Bpby1kb2VuID0gPE9FTl9MT1c+Owo+ICsJCX07
Cj4gKwo+ICsJCXVhcnQwLXBpbnMtcnggewo+ICsJCQlzdGFyZml2ZSxwaW5zID0gPFBBRF9HUElP
Nj47Cj4gKwkJCXN0YXJmaXZlLHBpbm11eCA9IDxQQURfR1BJTzZfRlVOQ19TRUwgMD47Cj4gKwkJ
CXN0YXJmaXZlLHBpbi1pb2NvbmZpZyA9IDxJTyhHUElPX0lFKDEpIHwgR1BJT19QVSgxKSk+Owo+
ICsJCQlzdGFyZml2ZSxwaW4tZ3Bpby1kb2VuID0gPE9FTl9ISUdIPjsKPiArCQkJc3RhcmZpdmUs
cGluLWdwaW8tZGluID0gIDxHUElfVUFSVDBfU0lOPjsKPiArCQl9Owo+ICsJfTsKPiArfTsKPiAr
Cj4gKyZvc2Mgewo+ICsJY2xvY2stZnJlcXVlbmN5ID0gPDI0MDAwMDAwPjsKPiArfTsKPiArCj4g
KyZ1YXJ0MCB7Cj4gKwlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwo+ICsJcGluY3RybC0wID0g
PCZ1YXJ0MF9waW5zPjsKPiArCXN0YXR1cyA9ICJva2F5IjsKPiArfTsKPiAtLSAKPiAyLjE3LjEK
PiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
