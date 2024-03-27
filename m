Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC83EC54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 03:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OrME+h2PiDHcuxTQzOFi9+YPaCgMxVP855aRoe+tc78=; b=WO0bnZx3k9REh9
	cWfLmYNi94jmR08QHjsDI9SHky5bqO0H1q77Z6vU7s1OXcaXDdupQrQHZgkWb1zoDxF7cgdWyk3xQ
	zQDtvkwJfZUzfoKTbg6sBnGe3zTJFhPTu3mnJvjiTOl1DWpUhsVhlugX/JfACHuDSYF9sX/yO4aPG
	cIYV1fDPgQXmmK944Ln3U29+PQF2ZhftoEKJ/Jz747qh47wk98OGAryzXBprm0jGsxG3O73sfpgER
	WgWnaRdoVP5qwi5S15laKMzEj4ey+iRUrEzZ8i0cnOz6U2A3k8cwSJgiXStuN9O4OiRNDjiC2aAbC
	87QphoCwytwkn97wj4EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpKMW-00000007Mg2-18bC;
	Wed, 27 Mar 2024 03:54:04 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpKMS-00000007Mes-48qD
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 03:54:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 63864CE24EB;
	Wed, 27 Mar 2024 03:53:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B3A9C433F1;
	Wed, 27 Mar 2024 03:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711511635;
	bh=ulvcpLx+NFREbJcC6mgnYfcNd9XXhjYFOTNXexXblnU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y2+sBsB0xMtY8p5K3dNLUlO+HXVhB17rEhtLEjhtbkjM/rzaw9tzkyDKQpeVfA4Y/
	 vVd97axWQEiV2b/o8CWhLqw+mKdtiNn7a+xMd2OVyLbNeO4fwiVV/rgveXW+zK4i3l
	 rPb+LVrV3wuElxqHr4Wm+Rf9W5y6K9YCG7OYduqN+BQw4iLY93RPp3CYo/iG6kUOTu
	 CzmDTlwiTdH60P3HhBwmVyO2oJ7ghs2LO+AXDBUVIukfBE/2PkIbzrsiHPHX7vfxAq
	 iBCtiyAPo0cnhHC3EzacTzcxsetsljU/B+KqC85lxAub7JVbrdRCVX1kcoIuFToOLo
	 kXVsSUjDmnvQw==
Date: Wed, 27 Mar 2024 11:40:37 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Charles Lohr <lohr85@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, cleger@rivosinc.com,
	Conor Dooley <conor@kernel.org>, samuel.holland@sifive.com,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>, ajones@ventanamicro.com,
	dlemoal@kernel.org, Bjorn Topel <bjorn@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH] riscv: deprecate CONFIG_MMU=n
Message-ID: <ZgOVNYkmXbXVCReV@xhacker>
References: <a49546e8-6749-4458-98da-67fd37b7df18@rivosinc.com>
 <mhng-a3b495e6-aca6-4137-a3c1-8fcacafd8596@palmer-ri-x1c9a>
 <ZfLxip96o5MVjHAF@xhacker>
 <ZfL1buKdDI-p5b9X@xhacker>
 <ZgGteKG_a3KGn5wV@xhacker>
 <CAGu26P_tUpSvXqdSz3pOdPNHbe6MyEYJ2XCHo8pD8jeE5pT+_Q@mail.gmail.com>
 <ZgNzBwsmeibHMjvc@xhacker>
 <CAGu26P-CqdsQzNTNDidBUg=pxU3vs7QhNEajokGKe7p8M2sLBA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGu26P-CqdsQzNTNDidBUg=pxU3vs7QhNEajokGKe7p8M2sLBA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_205401_240054_D52FE051 
X-CRM114-Status: GOOD (  12.68  )
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

T24gVHVlLCBNYXIgMjYsIDIwMjQgYXQgMDY6MzQ6MDlQTSAtMDcwMCwgQ2hhcmxlcyBMb2hyIHdy
b3RlOgo+IFNvcnJ5LCBpZiB5b3UgZG9uJ3QgbWluZCBjbGFyaWZ5aW5nLCBkbyB5b3Uga25vdyB3
aGljaCB2ZXJzaW9uIHlvdQo+IHVzZWQsIHdoZXJlIHlvdSBnb3QgaXQsIGFuZCBpZiB5b3UgaGFk
IHRvIGFwcGx5IGFueSBwYXRjaGVzPwoKSGksCgpydjMyIHVjbGliYyB0b29sY2hhaW4gaXMgYmFz
ZWQgb24gZ2NjMTIuMiwgd2hpbGUgcnY2NCB1Y2xpYmMgaXMgYmFzZWQgb24KZ2NjMTMuMgoKSSBi
dWlsdCB0aGVtIHdpdGggdGhlIG1haW5saW5lIGJ1aWxkcm9vdCwgYW5kIHJ2MzIgdG9vbGNoYWlu
IHdhcyBidWlsdAphIHllYXIgYWdvLCBJIGZvcmdldCB3aGV0aGVyIHRoZXJlIHdhcyBwYXRjaGVz
IGFwcGxpZWQuIEkgbWF5IGFwcGx5CnBhdGNoZXMgZnJvbSB5b3VyIG1pbmktcnYzMmltYSByZXBv
LiBUaGUgcnY2NCB0b29sY2hhaW4gd2FzIGJ1aWx0IGEKbW9udGggYWdvLCBubyBwYXRjaCBpcyBh
cHBsaWVkLgoKVGhhbmtzCj4gCj4gQ2hhcmxlcwo+IAo+IE9uIFR1ZSwgTWFyIDI2LCAyMDI0IGF0
IDY6MjjigK9QTSBKaXNoZW5nIFpoYW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4K
PiA+IE9uIFR1ZSwgTWFyIDI2LCAyMDI0IGF0IDAxOjI1OjA4UE0gLTA3MDAsIENoYXJsZXMgTG9o
ciB3cm90ZToKPiA+ID4gSmlzaGVuZywgYXJlIHlvdSB1c2luZyBtdXNsIG9yIHVjbGliYz8gSSd2
ZSBiZWVuIGhhdmluZyBkaWZmaWN1bHR5Cj4gPiA+IGdldHRpbmcgbmV3IHZlcnNpb25zIG9mIGVh
Y2ggd29ya2luZyB3aXRoIHRoZSBuZXdlciBrZXJuZWxzIHdpdGgKPiA+ID4gc3lzdGVtIGNhbGxz
IG5vdCBsaW5pbmcgdXAuCj4gPgo+ID4gSGkgQ2hhcmxlcywKPiA+Cj4gPiBJIHRlc3RlZCBub21t
dSBsaW51eCB3aXRoIHVjbGliYywgYm90aCBydjMyIGFuZCBydjY0Cj4gPgo+ID4gVGhhbmtzCj4g
Pgo+ID4gPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
