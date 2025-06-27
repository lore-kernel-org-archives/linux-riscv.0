Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF5BC77B7F
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jun 2025 19:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gZthwiUFR9NZbO7OAuFwI9ulRY+yObMw9ntBmJPGxG8=; b=kWQeU6fy9HxgTC
	blT+oPSR3kyt8mU7QioMu2AjnwjTShql7bG7GMyKnJ+b5kDY6R2NuhtYidCSjvmNcWqsJCaYuRwSx
	s9qiuzJ82QSovmgb9UWwDCOFbM7dyZCFxE6p814Otvse3lv+rkjijRIYGOsjH1eiBIzBzQaDpb2GP
	rj0ZIIOUAGn82fU626GS6XDppa0vwLrtFkwo6jL0rZdXn3CGLHEhtRkK54iKUrXQGiBfmhfQCpXn7
	fLtPREDVrHkknk57B9mG9xmiihNlwIwKsrWSKW6OI06M4veSi47RqXaZpEQxkjJtGn8tITXFkVhxi
	VcdkfICZDP3kIzh+CDNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVEta-0000000FerL-1vWI;
	Fri, 27 Jun 2025 19:37:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVEYQ-0000000Fc3z-0VQG
	for linux-riscv@lists.infradead.org;
	Fri, 27 Jun 2025 19:16:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E57835C6B9F;
	Fri, 27 Jun 2025 19:16:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7DD2C4CEE3;
	Fri, 27 Jun 2025 19:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751051764;
	bh=e3ItbkmjlCF+WHhbj2/fNpi4b7yR0M+6lB+y/2rBgh4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HeSdvolZ1UWrXJ9VSVn0ZS0DXIqe2eIXrXITt8duLo+CfF5vTXac+ssoZApecraH1
	 P6B34G+ZT4coa3ZcU6wxNroRRNJoZdFztXJD03a4AdF1WGj/t9kpNYDL/NfBJE4Wof
	 KmdnpV4SLP6BzmvZek6j0+ATHYvGhFeAd1DG8mXmgIsOfucxt3OywgB99zLXehfevR
	 mqU7rlqzqJtoNk10nnojKRiZNt0EB9GqJ5bK68DoJUsEIZlO21up/E/uvVTp+qY8Wt
	 bHmHC42juwXKYjbB+5rAmVCmyt4SIW3YdBju8ygb3Yey69lLMJjOUfvZszDV8BjyJY
	 3XsaCQMDAlyHw==
Date: Fri, 27 Jun 2025 20:15:55 +0100
From: Simon Horman <horms@kernel.org>
To: =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Cyrille Pitchen <cyrille.pitchen@atmel.com>,
	Harini Katakam <harini.katakam@xilinx.com>,
	Rafal Ozieblo <rafalo@cadence.com>,
	Haavard Skinnemoen <hskinnemoen@atmel.com>,
	Jeff Garzik <jeff@garzik.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Subject: Re: [PATCH net-next v2 16/18] MIPS: mobileye: add EyeQ5 DMA IOCU
 support
Message-ID: <20250627191555.GD1776@horms.kernel.org>
References: <20250627-macb-v2-0-ff8207d0bb77@bootlin.com>
 <20250627-macb-v2-16-ff8207d0bb77@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250627-macb-v2-16-ff8207d0bb77@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_121606_242907_36671F4E 
X-CRM114-Status: GOOD (  17.48  )
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

T24gRnJpLCBKdW4gMjcsIDIwMjUgYXQgMTE6MDk6MDJBTSArMDIwMCwgVGjDqW8gTGVicnVuIHdy
b3RlOgo+IEJvdGggQ2FkZW5jZSBHRU0gRXRoZXJuZXQgY29udHJvbGxlcnMgb24gRXllUTUgYXJl
IGhhcmR3aXJlZCB0aHJvdWdoIENNMwo+IElPIENvaGVyZW5jeSBVbml0cyAoSU9DVSkuIEZvciBE
TUEgY29oZXJlbnQgYWNjZXNzZXMsIEJJVCgzNikgbXVzdCBiZQo+IHNldCBpbiBETUEgYWRkcmVz
c2VzLgo+IAo+IEltcGxlbWVudCB0aGF0IGluIHBsYXRmb3JtLXNwZWNpZmljIGRtYV9tYXBfb3Bz
IHdoaWNoIGdldCBhdHRhY2hlZCB0bwo+IGJvdGggaW5zdGFuY2VzIG9mIGBjZG5zLGV5ZXE1LWdl
bWAgdGhyb3VnaCBhIG5vdGlmaWVyIGJsb2NrLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRow6lvIExl
YnJ1biA8dGhlby5sZWJydW5AYm9vdGxpbi5jb20+CgouLi4KCj4gZGlmZiAtLWdpdCBhL2FyY2gv
bWlwcy9tb2JpbGV5ZS9leWVxNS1pb2N1LWRtYS5jIGIvYXJjaC9taXBzL21vYmlsZXllL2V5ZXE1
LWlvY3UtZG1hLmMKCi4uLgoKPiArY29uc3Qgc3RydWN0IGRtYV9tYXBfb3BzIGV5ZXE1X2lvY3Vf
b3BzID0gewo+ICsJLmFsbG9jCQkJPSBleWVxNV9pb2N1X2FsbG9jLAo+ICsJLmZyZWUJCQk9IGV5
ZXE1X2lvY3VfZnJlZSwKPiArCS5hbGxvY19wYWdlc19vcAkJPSBkbWFfZGlyZWN0X2FsbG9jX3Bh
Z2VzLAo+ICsJLmZyZWVfcGFnZXMJCT0gZG1hX2RpcmVjdF9mcmVlX3BhZ2VzLAo+ICsJLm1tYXAJ
CQk9IGV5ZXE1X2lvY3VfbW1hcCwKPiArCS5nZXRfc2d0YWJsZQkJPSBleWVxNV9pb2N1X2dldF9z
Z3RhYmxlLAo+ICsJLm1hcF9wYWdlCQk9IGV5ZXE1X2lvY3VfbWFwX3BhZ2UsCj4gKwkudW5tYXBf
cGFnZQkJPSBleWVxNV9pb2N1X3VubWFwX3BhZ2UsCj4gKwkubWFwX3NnCQkJPSBleWVxNV9pb2N1
X21hcF9zZywKPiArCS51bm1hcF9zZwkJPSBleWVxNV9pb2N1X3VubWFwX3NnLAo+ICsJLmdldF9y
ZXF1aXJlZF9tYXNrCT0gZG1hX2RpcmVjdF9nZXRfcmVxdWlyZWRfbWFzaywKPiArfTsKPiArRVhQ
T1JUX1NZTUJPTChleWVxNV9pb2N1X29wcyk7CgpIaSBUaMOpbywKCkRvZXMgZXllcTVfaW9jdV9v
cHMgbmVlZCB0byBiZSBleHBvcnRlZD8KSWYgc28gaXQgc2hvdWxkIHByb2JhYmx5IGJlIGRlY2xh
cmVkIGluIGEgaGVhZGVyIGZpbGUgc29tZXdoZXJlLgpCdXQgSSBpZiBub3QgcHJvYmFibHkgdGhl
IEVYUE9SVF9TWU1CT0wgbGluZSBzaG91bGQgYmUKZHJvcHBlZCwgYW5kIHRoZSBzdHJ1Y3R1cmUg
bWFkZSBzdGF0aWMuCgpGbGFnZ2VkIGJ5IFNwYXJzZS4KCj4gKwo+ICtzdGF0aWMgaW50IGV5ZXE1
X2lvY3Vfbm90aWZpZXIoc3RydWN0IG5vdGlmaWVyX2Jsb2NrICpuYiwKPiArCQkJICAgICAgIHVu
c2lnbmVkIGxvbmcgZXZlbnQsCj4gKwkJCSAgICAgICB2b2lkICpkYXRhKQo+ICt7Cj4gKwlzdHJ1
Y3QgZGV2aWNlICpkZXYgPSBkYXRhOwo+ICsKPiArCS8qCj4gKwkgKiBJT0NVIHJvdXRpbmcgaXMg
aGFyZHdpcmVkOyB3ZSBtdXN0IHVzZSBvdXIgYWJvdmUgY3VzdG9tCj4gKwkgKiByb3V0aW5lcyBm
b3IgY2FjaGUtY29oZXJlbnQgRE1BIG9uIGV0aGVybmV0IGludGVyZmFjZXMuCj4gKwkgKi8KPiAr
CWlmIChldmVudCA9PSBCVVNfTk9USUZZX0FERF9ERVZJQ0UgJiYKPiArCSAgICBkZXZpY2VfaXNf
Y29tcGF0aWJsZShkZXYsICJtb2JpbGV5ZSxleWVxNS1nZW0iKSkgewo+ICsJCXNldF9kbWFfb3Bz
KGRldiwgJmV5ZXE1X2lvY3Vfb3BzKTsKPiArCQlyZXR1cm4gTk9USUZZX09LOwo+ICsJfQo+ICsK
PiArCXJldHVybiBOT1RJRllfRE9ORTsKPiArfQoKLi4uCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
