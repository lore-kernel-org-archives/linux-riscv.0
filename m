Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA69CCD0438
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jan 2026 05:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Po/JPb82xg+27GRrVnyq3USlTz/WrAA7VeUCV0Rfq+Y=; b=cuR8awqTDfnck/
	eknu93Pww8EENZi2DDRAJ01Vw714EYaxzbda3zjcyAGBXxJTiJiUhpPW74hyuvJaZs32cMwnicSJi
	inlUR3be6hMx5mszGCM0YUcP7UiqsV9M7FKRjW6/eexwjzJvXq1Kuokti5BqTniS1TevfIo7IPggP
	fOhP1916AnXlNq8cJm/NtICoGxiG1mbwVBu9Dx2PO2zAoF6npJMVzAPuil8Mg72uS6FZwty1CWkND
	66XfEmi+4FFLwnMz3bqHQrlCfjSNJxfw62RoDtgB3vFV3SytYfSRYU0p/YNWYoyvHFh+fZsK5oyPN
	aJJ4L7NNyH3EB1ACmz9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vczTn-0000000CRGC-1eZg;
	Tue, 06 Jan 2026 05:19:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vczTk-0000000CRFr-0SDv;
	Tue, 06 Jan 2026 05:19:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 073FA6011E;
	Tue,  6 Jan 2026 05:19:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7117FC116C6;
	Tue,  6 Jan 2026 05:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767676774;
	bh=h2nYGKojRr759U41EwbB4BsmLSlNtVAL8aBfQlF4xTY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fn7eNbq+r0jsnqP0Mix+RIWDvZUr1tdAgbjsrEGr2Ms9oW27hgMlnJw0ZkpSpIB7H
	 VFVpNZUQpOrDUTBWHMpyZi9/eKY0Qb+AnhG52J5zL8WWqo88g/p5j0J5Zy85RsIztz
	 P2mn8L1AGv1qK0pNNdB/HsIJIkBXeXj+VG0BiSfhQJOHcPXQkEZQG6mMUihoezwrSB
	 w8K6ZeXkX1jI/ZfTN4Zm7awLzTo9nbMlCOwvaMpLHDKzcXwj3pixaITdVMhWoVjGKB
	 KrSBHZeR6A15yHPveYgjG/D2gFY70Y8Q5JReXwCWQqbWYvWeEnIvCRk91nnGFYGIc8
	 dYoNqcI1m3mfg==
Date: Tue, 6 Jan 2026 10:49:19 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Sumit Kumar <sumit.kumar@oss.qualcomm.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Richard Zhu <hongxing.zhu@nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Yue Wang <yue.wang@amlogic.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Greentime Hu <greentime.hu@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Chuanhua Lei <lchuanhua@maxlinear.com>, 
	Marek Vasut <marek.vasut+renesas@gmail.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Pratyush Anand <pratyush.anand@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/2] PCI: dwc: Add multi-port controller support
Message-ID: <m5ukeugo2lazipljqpubyvm7j3xk2j5o7i2xgdbkkhii57xmyk@lh32qdzjhe4n>
References: <20260105-dt-parser-v1-0-b11c63cb5e2c@oss.qualcomm.com>
 <20260105-dt-parser-v1-2-b11c63cb5e2c@oss.qualcomm.com>
 <aVvkmkd5mWPmxeiS@ryzen>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aVvkmkd5mWPmxeiS@ryzen>
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

T24gTW9uLCBKYW4gMDUsIDIwMjYgYXQgMDU6MTk6MzhQTSArMDEwMCwgTmlrbGFzIENhc3NlbCB3
cm90ZToKPiBPbiBNb24sIEphbiAwNSwgMjAyNiBhdCAwNTo1Nzo1NVBNICswNTMwLCBTdW1pdCBL
dW1hciB3cm90ZToKPiA+IFRoZSBjdXJyZW50IERlc2lnbldhcmUgUENJZSBSQyBpbXBsZW1lbnRh
dGlvbiBzdXBwb3J0cyBvbmx5IHRoZSBjb250cm9sbGVyCj4gPiAoSG9zdCBCcmlkZ2UpIG5vZGUg
Zm9yIHNwZWNpZnlpbmcgdGhlIFJvb3QgUG9ydCBwcm9wZXJ0aWVzIGluIGFuIGFzc3VtcHRpb24K
PiA+IHRoYXQgdGhlIHVuZGVybHlpbmcgcGxhdGZvcm0gb25seSBzdXBwb3J0cyBhIHNpbmdsZSBy
b290IFBvcnQgcGVyCj4gPiBjb250cm9sbGVyIGluc3RhbmNlLiBUaGlzIGxpbWl0cyBzdXBwb3J0
IGZvciBtdWx0aS1wb3J0IGNvbnRyb2xsZXJzIHdoZXJlCj4gPiBkaWZmZXJlbnQgcG9ydHMgbWF5
IGhhdmUgZGlmZmVyZW50IGxhbmUgY29uZmlndXJhdGlvbnMgYW5kIHNwZWVkIGxpbWl0cy4KPiA+
IAo+ID4gSW50cm9kdWNlIGEgc2VwYXJhdGUgZHdfcGNpZV9wb3J0IHN0cnVjdHVyZSB0byBlbmFi
bGUgbXVsdGktcG9ydCBzdXBwb3J0Lgo+ID4gRWFjaCBSb290IFBvcnQgY2FuIGhhdmUgaW5kZXBl
bmRlbnQgbGFuZSBjb3VudCwgc3BlZWQgbGltaXQgdGhyb3VnaCBwY2llQE4KPiA+IGNoaWxkIG5v
ZGVzIGluIGRldmljZSB0cmVlLiBBZGQgZHdfcGNpZV9wYXJzZV9yb290X3BvcnRzKCkKPiA+IEFQ
SSB0byBwYXJzZSB0aGVzZSBjaGlsZCBub2Rlcy4KPiA+IAo+ID4gRXF1YWxpemF0aW9uIHByZXNl
dHMgYW5kIGxpbmsgd2lkdGggZGV0ZWN0aW9uIGN1cnJlbnRseSB1c2UgY29tbW9uIERCSQo+ID4g
c3BhY2UgZm9yIGFsbCB0aGUgcm9vdCBwb3J0cy4gUGVyLXBvcnQgREJJIHNwYWNlIGFzc2lnbm1l
bnQgZm9yIHRoZXNlCj4gPiBmZWF0dXJlcyB3aWxsIGJlIGFkZGVkIGluIGZ1dHVyZS4KPiA+IAo+
ID4gU2lnbmVkLW9mZi1ieTogU3VtaXQgS3VtYXIgPHN1bWl0Lmt1bWFyQG9zcy5xdWFsY29tbS5j
b20+Cj4gCj4gSGVsbG8gU3VtaXQsCj4gCj4gSXMgdGhlcmUgYSByZWFzb24gd2h5IHlvdSByZXBy
ZXNlbnQgdGhpcyBhcyBhIGxpc3Qgb2YgcG9ydHMgcmF0aGVyIHRoYW4gYQo+IHNpbXBsZSBhcnJh
eT8KPiAKPiBUaGUgbnVtYmVyIG9mIHBvcnRzIGlzIGtub3duIGJ5IHBhcnNpbmcgdGhlIGRldmlj
ZSB0cmVlLCBzbyBpdCBzaG91bGQgYmUKPiBzdGF0aWMsIG5vPwo+IAo+IEF0IGxlYXN0IHRvIG1l
LCB0aGlzIHNlZW0gc2ltaWxhciB0byBlLmcuIGhvdyBhIGdwaW9fZGV2aWNlIGhhcyBtdWx0aXBs
ZQo+IGdwaW9fZGVzY3JpcHRvcnMgInN0cnVjdCBncGlvX2Rlc2MgKmRlc2NzIjoKPiBodHRwczov
L2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvYmxvYi9tYXN0ZXIvZHJpdmVycy9ncGlvL2dwaW9s
aWIuaCNMNjhDMS1MNjhDMjYKPiAKPiBBIGxpc3QgaXMgdXN1YWxseSB1c2VkIGZvciBzb21ldGhp
bmcgdGhhdCBpcyBkeW5hbWljLgo+IEkgZG9uJ3QgdGhpbmsgdGhhdCB0aGUgbnVtYmVyIG9mIHBv
cnRzIHRvIGEgUENJZSBjb250cm9sbGVyIHdpbGwgYmUgZHluYW1pYy4KPiAKPiBJIGNhbiBzZWUg
dGhhdCBzdHJ1Y3QgcWNvbV9wY2llIGluIHBjaWUtcWNvbS5jIGhhcyBzdHJ1Y3QgbGlzdF9oZWFk
IHBvcnRzLAo+IGJ1dCB0aGF0IGRvZXMgbm90IG5lY2Vzc2FyaWx5IG1lYW4gdGhhdCB3ZSBuZWVk
IHRvIGhhdmUgYSBsaXN0IG9mIHBvcnRzIGluCj4gcGNpZS1kZXNpZ253YXJlLWhvc3QuYy4gKHBj
aWUtcWNvbSBjb3VsZCBhbHNvIGJlIG1vZGlmaWVkIHRvIGhhdmUgYW4gYXJyYXkKPiBvZiBwb3J0
cyBpZiB0aGVyZSBpcyBhIGRlc2lyZSBmb3Igc2ltaWxhciBkZXNpZ24gcGF0dGVybi4pCj4gCgpP
bmx5IHJlYXNvbiB3aHkgSSB3ZW50IHdpdGggbGlzdHMgaW4gcGNpZS1xY29tIGlzIGZsZXhpYmls
aXR5LiBUaGVyZSBhcmUgdXNlZnVsCmhlbHBlcnMgYXZhaWxhYmxlIGZvciB0cmF2ZXJzaW5nIHRo
ZSBsaXN0cyBhbmQgdGhleSBzZWVtIG11Y2ggbW9yZSBlbGVnYW50IHRvCnVzZSByYXRoZXIgdGhh
biBtYW51YWxseSB0cmF2ZXJzaW5nIHRoZSBhcnJheSBpbiBDLgoKQnV0IHRvIGJlIGZyYW5rLCBJ
IGRvbid0IHJlYWxseSBjYXJlIHdoaWNoIG9uZSBpcyB1c2VkIGFzIHRoZXJlIGlzIGdvaW5nIHRv
IGJlCm9ubHkgYSBoYW5kZnVsIG9mIHBvcnRzIGF0IG1heCBhbnl3YXkgYW5kIHRoZXJlIGlzIG5v
dCBtdWNoIG92ZXJoZWFkLgoKLSBNYW5pCgotLSAK4K6u4K6j4K6/4K614K6j4K+N4K6j4K6p4K+N
IOCumuCupOCuvuCumuCuv+CuteCuruCvjQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
