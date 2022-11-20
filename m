Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF5B6C433FE
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Nov 2022 11:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N/INSGOpwaqvesuUbS6wIZ3uuRfEzKmxfWiyHkGJxcM=; b=PNo/iK4WiEPsqK
	pfqzscd+xWEwkxzVr2tDaCAEFEPGCfXDo02Ta1mtl4xhYjplEjUNpNEiUZ6pHE5ihaOley2Qr8p95
	zQ6KNPSHZlMI7bXcyLGBbvmwPnxKzqnJJVMH40dBjQVc91JpODzWv2cNWfu73gg8qPTyTF9D7HJIQ
	OOmTHP1EzNdefrzvNTtWWT3xTiVxT03IaMWyteuDGe4viUwhj7qYG6qdp3D8X3I+verFgzdhGAzpo
	W3YB75dXFFgryUQmkmOzBZLk9LJmfxbJdG8EnWPEAO2uW+EEAFlhZXNPxHEwjkefHO87pYLh+yQVo
	s5YBcxPM9SR2EUZQgaLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owiQM-003rma-J2; Sun, 20 Nov 2022 11:23:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owiQJ-003rm5-9J
	for linux-riscv@lists.infradead.org; Sun, 20 Nov 2022 11:23:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 83ED160C32;
	Sun, 20 Nov 2022 11:23:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E5F2C433D6;
	Sun, 20 Nov 2022 11:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668943421;
	bh=8PFD1joXMpo0BIBLMMAMUhQ88Ub256i63VmGt7znFMA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ak+99zcWQngP8/4sLvjEZHL5BhaaEgvSTPNGIGUEDpu2IcblbH1Kv0wbbnBxjsdE/
	 ZHMz221O0gTOFI6DOAq/VDmJsSvUUKHp+yjNQyIfQfpG/HO1YQP7HY+GfypE8fcY8M
	 AM+3Vq6c0mMnepP19/8QGnFtA49OFhKK23DIEcKnIIsilP0/a4NaTlGPnOPa5zhq3n
	 0FAe7zjy2LI9SQ05TyycfnGqJ9Fm5fIvDeIjSwS6TDn2hZ31sA3je35olQq7ijzVml
	 sFWL2BhgiUlQNcFdr6GrZgjHHG+ztei+++hm57Iw8Gzsf7g9MKMjB9DbVgVELDxOVu
	 7coGSy0dMEq4g==
Date: Sun, 20 Nov 2022 11:23:36 +0000
From: Conor Dooley <conor@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH 02/12] dt-bindings: riscv: Add T-HEAD C906 and C910
 compatibles
Message-ID: <Y3oOOOdG4e24ByEc@spud>
References: <20220815050815.22340-1-samuel@sholland.org>
 <20220815050815.22340-3-samuel@sholland.org>
 <76d9c4fb368dca87c64494b927706d0b18d712d2.camel@icenowy.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <76d9c4fb368dca87c64494b927706d0b18d712d2.camel@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221120_032343_384513_C53617BE 
X-CRM114-Status: GOOD (  18.00  )
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

T24gRnJpLCBOb3YgMDQsIDIwMjIgYXQgMTA6NTc6NThBTSArMDgwMCwgSWNlbm93eSBaaGVuZyB3
cm90ZToKPiDlnKggMjAyMi0wOC0xNeaYn+acn+S4gOeahCAwMDowOCAtMDUwMO+8jFNhbXVlbCBI
b2xsYW5k5YaZ6YGT77yaCj4gPiBUaGUgQzkwNiBhbmQgQzkxMCBhcmUgUklTQy1WIENQVSBjb3Jl
cyBmcm9tIFQtSEVBRCBTZW1pY29uZHVjdG9yLgo+ID4gTm90YWJseSwgdGhlIEM5MDYgY29yZSBp
cyB1c2VkIGluIHRoZSBBbGx3aW5uZXIgRDEgU29DLgo+IAo+IENvdWxkIHRoaXMgZ2V0IGFwcGxp
ZWQgZmlyc3Q/Cj4gCj4gQzkwNiBhbmQgQzkxMCBub3cgaGF2ZSBhIGZpeGVkLWNvbmZpZ3VyYXRp
b24gb3Blbi1zb3VyY2UgdmVyc2lvbiwgd2hpY2gKPiBtZWFucyB0aGVzZSBjb3JlcyBjb3VsZCBi
ZSBwbGF5ZWQgYnkgYW55b25lLCBhbmQgaGF2aW5nIHRoZW0gaW4gdGhlIERUCj4gYmluZGluZyBy
ZWFsbHkgaGVscHMgcGVvcGxlLiBJbiBhZGRpdGlvbiBJIGFtIGF3YXJlIG9mIHNvbWUgQzkwNi0K
PiBlcXVpcHBlZCBTb0Mgb3V0IG9mIEFsbHdpbm5lci4KCkkndmUgYXBwbGllZCB0aGlzIG9uZSBw
YXRjaCBhcyB2Ni4yIG1hdGVyaWFsIHNpbmNlIEkgZG91YnQgdGhpcyBzZXJpZXMgaXMKZ29ubmEg
bWFrZSBpdCAmIHRoZSBCb3VmZmFsb2xhYnMgZHQgaXMgZ29pbmcgdG8gbmVlZCB0aGlzIGNvbXBh
dGlibGUgdG9vLgpJIGFwcGxpZWQgaXQgb24gdG9wIG9mIHY2LjEtcmMxIGp1c3QgaW4gY2FzZToK
Cmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvY29ub3IvYy8wZDgxNDAwMGFkMzU4OWJmNGY2OWM5Y2Iy
NWEzYjc3YmJkNTVmZmVjCgo+IAo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBTYW11ZWwgSG9sbGFu
ZCA8c2FtdWVsQHNob2xsYW5kLm9yZz4KPiA+IC0tLQo+ID4gCj4gPiDCoERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9jcHVzLnlhbWwgfCAyICsrCj4gPiDCoDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9jcHVzLnlhbWwKPiA+IGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2NwdXMueWFtbAo+ID4gaW5kZXggODczZGQxMmY2
ZTg5Li5jZTIxNjFkOTExNWEgMTAwNjQ0Cj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcmlzY3YvY3B1cy55YW1sCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvcmlzY3YvY3B1cy55YW1sCj4gPiBAQCAtMzgsNiArMzgsOCBAQCBwcm9w
ZXJ0aWVzOgo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIHNpZml2ZSx1NQo+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIHNpZml2ZSx1Nwo+ID4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAtIGNhbmFhbixrMjEwCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgLSB0aGVhZCxjOTA2Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSB0aGVh
ZCxjOTEwCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiByaXNjdgo+ID4gwqDCoMKg
wqDCoMKgIC0gaXRlbXM6Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGVudW06Cj4gCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
