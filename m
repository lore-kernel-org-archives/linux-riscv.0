Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D1FBC5B572
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Aug 2026 13:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eG2WtuFOzi/aVlh0710Lr8JQUgZpN6OiNFLaynie7F8=; b=p+TxnBBZvYwmFa
	dGvv3kDjDVKONuhJis39vnSgs0Dlf2V3wMIO4B1wVM5j9gzSp+/tCNrKEtM7NRTHso+kYRhmbToFn
	KVUUSmr/p6yvSJ6u12QUBYEsKiuYK5+fx4MnfUDmRwFuLNT+6v0IdF8qtfVfekGfFZhi3k5KDNlU2
	wwmpkMmIj9a55eAkGS4SZFo1noTvrfVn076UN47Tt0Png7YllBl3xKDvIeqB+DphB+L64+nPG3R70
	WkxFlzi0D6x4qTYMFaeepXKawVuRvXALirSPVlxaZTaglqr2bxrsO7w8YnqMzi5qXcxo0VW4Jwi9q
	Lh/DjJT4K3BkZSF23MNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvxgM-00000006EzB-3Mk9;
	Mon, 17 Aug 2026 13:47:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvxgL-00000006Eyv-2hrh
	for linux-riscv@lists.infradead.org;
	Mon, 17 Aug 2026 13:47:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B1A19601FB;
	Mon, 17 Aug 2026 13:47:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43F9F1F00A3E;
	Mon, 17 Aug 2026 13:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786974436;
	bh=k1VQX/8T6qmRuZ70T/Bkc+hmL8lJxIvhiMcXNK7f0Wo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PWP+K52JNw7DpfYOStdKQ13D7jDg2yHZka6RQR4sVeVo0dlnOEtbo2pmcEnywnu/P
	 y73eS+NGv9M3qLuRCRrfszkFSdkK4yOcXRYMXw4FtE+L1XISeHkfYZIuJnzqbcpjkH
	 vlDOhnnKmAq/0S0QHZmRnUdjz4APXxt452ayoMJp5DftMZSR5dHmN1vQaa6Hk32VDy
	 7v8EqdgoAFWA+sS6z2doecA7erhDUGpkZPAYL+laASsqFrbwYwk98S4gm3T4wUm/hu
	 1jebrM5m0TkulYnXjlJYLI7A1SY4Hz1CPKunuxQbQBdWt0uBKi0BfT3oBhavOC9Cb1
	 ZvaqGNj76LwbQ==
Date: Mon, 17 Aug 2026 08:47:15 -0500
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Changhuang Liang <changhuang.liang@starfivetech.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH v5 03/21] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0-pinctrl
Message-ID: <20260817134715.GA18207-robh@kernel.org>
References: <20260810063650.239303-1-changhuang.liang@starfivetech.com>
 <20260810063650.239303-4-changhuang.liang@starfivetech.com>
 <178634991918.1014951.7989635238440361454.robh@kernel.org>
 <ZQ4PR01MB120202070B9006984B8677EAF2DE2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260810144012.GA1574021-robh@kernel.org>
 <ZQ4PR01MB12020D2031C400FF805791B7F2DD2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <ZQ4PR01MB120275B9C0CF6BCE8C88261CF2DA2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260814-shapeless-onyx-pronghorn-d423a9@quoll>
 <ZQ4PR01MB12022F6D6F71542033CF857BF2DA2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <CAD++jL=Q38HwraN1NEOxLf_hE+k=3Q6JP+DUgQsThfYve0t0RA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD++jL=Q38HwraN1NEOxLf_hE+k=3Q6JP+DUgQsThfYve0t0RA@mail.gmail.com>
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

T24gTW9uLCBBdWcgMTcsIDIwMjYgYXQgMDI6NDU6MjJQTSArMDIwMCwgTGludXMgV2FsbGVpaiB3
cm90ZToKPiBPbiBGcmksIEF1ZyAxNCwgMjAyNiBhdCAxOjIy4oCvUE0gQ2hhbmdodWFuZyBMaWFu
Zwo+IDxjaGFuZ2h1YW5nLmxpYW5nQHN0YXJmaXZldGVjaC5jb20+IHdyb3RlOgo+IAo+ID4gPiBZ
b3Ugc3RpbGwgZGlkIG5vdCBleHBsYWluIHRoZSBjZWxscyAtIG5laXRoZXIgaW4gcmVwbHkgbm9y
IGluIGNvbW1pdCAtIHRodXMgc3RhcnQKPiA+ID4gd2l0aCB0aGF0LiBXaHkgZG8geW91IG5lZWQg
aXQ/IE11bHRpcGxlIGNvbnRyb2xsZXJzIGhhdmUgZ3JvdXBwZWQgcGlucyBvcgo+ID4gPiBHUElP
cyBpbiByZWdpc3RlcnMsIHNvIGV4cGxhbmF0aW9uICJldmVyeSAzMiBHUElPcyBjb3JyZXNwb25k
IHRvIG9uZSByZWdpc3RlciIKPiA+ID4gdGVsbHMgbWUgbm90aGluZy4gV2h5IHdvdWxkIHRoYXQg
bWF0dGVyIGhvdyBtYW55IEdQSU9zIGlzIGluIG9uZSByZWdpc3Rlcj8KPiA+Cj4gPiBTaW5jZSBl
dmVyeSAzMiBHUElPcyBjb3JyZXNwb25kIHRvIG9uZSByZWdpc3RlciwgTGludXMgc3VnZ2VzdGVk
IGF0IHRoZSB0aW1lIHRoYXQgSSBjb3VsZCB0cnkgdXNpbmc6Cj4gPiBncGlvcyA9IDwmZ3BpbyBb
aW5zdGFuY2VdIG9mZnNldCBmbGFncz47Cj4gPiBncGlvLXJhbmdlcyA9IDwmcGluY3RybCBbZ3Bp
b19pbnN0YW5jZV0gZ3Bpb19vZmZzZXQgcGluX29mZnNldCBjb3VudD47Cj4gPgo+ID4gVGhlIGFk
dmFudGFnZSBvZiB1c2luZyB0aGlzIGlzIHRoYXQgaW4gYSBHUElPIGNvbnRyb2xsZXIgd2l0aCBt
b3JlIHRoYW4gMzIgR1BJT3MsIGV2ZXJ5IDMyIEdQSU9zCj4gPiBjYW4gYmUgdHJlYXRlZCBhcyBv
bmUgR1BJTyBiYW5rLiBUaGlzIHdheSwgaW4gdGhlIGRyaXZlciwgY29udmVydGluZyBwaW5fb2Zm
c2V0IHRvIGdwaW9fb2Zmc2V0IGRvZXMKPiA+IG5vdCByZXF1aXJlIGEgbGFyZ2UgbnVtYmVyIG9m
IC8zMiBhbmQgJTMyIG9wZXJhdGlvbnMuCj4gPgo+ID4gdGhlIGZvbGxvd2luZyBpcyBMaW51cydz
IG9yaWdpbmFsIHN1Z2dlc3Rpb24gYXQgdGhlIHRpbWUKPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2FsbC9DQUQrK2pMPXR2REJXSkhSR0dKdzRubm94X2tjSktuNWh3dnd6OXp4YWRNUmVkeXZS
aHdAbWFpbC5nbWFpbC5jb20vCj4gCj4gSnVzdCBjb3B5IHRoaXMgZXhwbGFuYXRpb24gaW50byB0
aGUgY29tbWl0IHNvIGl0IGlzIGNsZWFyIHdoeSB5b3UKPiBuZWVkIHRocmVlIGNlbGxzIGZvciB0
aGlzLgoKIkNhbiB1c2UgZ3Bpb2xpYiIgaXMgbm90IHJlYWxseSBqdXN0aWZpY2F0aW9uLiBOZWl0
aGVyIGlzIGF2b2lkaW5nIGEgCnNoaWZ0IGFuZC9vciBtYXNrLiBJIHN1cHBvc2UgdGhlcmUncyBz
b21lIGgvdyBhdHRyaWJ1dGUgaGVyZSB0byBqdXN0aWZ5IAppdD8gCgpSb2IKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
