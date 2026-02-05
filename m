Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B22ECD995
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Feb 2026 18:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1d0dBRX87jThfLgbGYHWaJ1dOzRGr8L5i3AXjnmey/Y=; b=djGEo5uTpOAsYY
	QDk0or07nIE2qsrBhYpUViH6X7H5iIb3RCtBvKdAO5dHBRTOgNN2smnaVL+4mjCoGgswOJUQZQsja
	j0L6H2Nddno0ywynhrCbm2m4l8WYLfDG7eAGSVkbx9PkT6HYt+ci+s8MWd8v9knSnj/9RqasSOZLU
	MrRoDqdQIowIrdtVxof8YCaLtMnsbXNYD0A/pwCBCi9NkfcaLxY1B2QAhqeCpbusWzXWmkUTwjeRU
	/rSukOSGkNNaImg0DNSNv68HaBqc1IqOn6JCtsN/p9Da4Vuv7KFpFRh3+uuOPyzf0ilRo+8pr2OEa
	geo8+XiGElYRyhNZ/uoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo4ON-0000000ANsW-09fW;
	Thu, 05 Feb 2026 18:47:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo4OL-0000000ANsL-2P55
	for linux-riscv@lists.infradead.org;
	Thu, 05 Feb 2026 18:47:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DAEA360010;
	Thu,  5 Feb 2026 18:47:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6819C4CEF7;
	Thu,  5 Feb 2026 18:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770317268;
	bh=xlt7tCr9N5Z8VZCWEEDmknncqKKsGQxBS+VomxFPp94=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TTB1ax84YQCaIuJBblnZHNHLcMTxGBol/UYmFOfbLYyWuB3izvBPvyrlmVMwIq3KA
	 yFDbAPWcIn4DdKJ+W33msfVNBpoQkQRPjU1f0GIFs4X0ACOEW2NVK8TlMM/WDEUSUv
	 DW7HIyePxoXyKjhgPB+fiG8veZBZPew4hrKKiXObG1liq82RVgPJLXieaKd/ijIDvR
	 JwA8vSXGvZF2/SVOIQ1SMYTHhac+CKYEUiM4tOlb6zBSg2y9MK9ggK53QPVgr3FI/s
	 Qewow3Iuk2j070bWCuPK092Q5+4VIB87ZWcp0YkQgXWL41Yz8ps8kE6+lobJfiuMa9
	 dM12TUp92DsHw==
Message-ID: <cb18f760-500b-4417-b706-cdc7448441a4@kernel.org>
Date: Thu, 5 Feb 2026 19:47:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] reset: tenstorrent: Add reset controller for
 Atlantis
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>,
 Joel Stanley <jms@oss.tenstorrent.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joel@jms.id.au,
 fustini@kernel.org, mpe@kernel.org, mpe@oss.tenstorrent.com,
 npiggin@oss.tenstorrent.com, agross@kernel.org, agross@oss.tenstorrent.com,
 bmasney@redhat.com
References: <20260202-atlantis-clocks-v5-0-0922e43acaba@oss.tenstorrent.com>
 <20260202-atlantis-clocks-v5-2-0922e43acaba@oss.tenstorrent.com>
 <20260205-spiffy-bizarre-doberman-184d2b@quoll>
 <CAEev2e_S9LYV609VmrHCqNneuTro=hbAjzgHFLAO6RD0_fErwA@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CAEev2e_S9LYV609VmrHCqNneuTro=hbAjzgHFLAO6RD0_fErwA@mail.gmail.com>
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

T24gMDUvMDIvMjAyNiAxNToxOCwgQW5pcnVkaCBTcmluaXZhc2FuIHdyb3RlOgo+IEhlbGxvIEty
enlzenRvZiwKPiAKPiBPbiBUaHUsIEZlYiA1LCAyMDI2IGF0IDM6MjfigK9BTSBLcnp5c3p0b2Yg
S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pgo+PiBPbiBNb24sIEZlYiAwMiwg
MjAyNiBhdCAwMTo0Njo1MFBNIC0wNjAwLCBBbmlydWRoIFNyaW5pdmFzYW4gd3JvdGU6Cj4+PiBk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9zb2MvdGVuc3RvcnJlbnQvYXRsYW50aXMtcHJjbS5oIGIvaW5j
bHVkZS9zb2MvdGVuc3RvcnJlbnQvYXRsYW50aXMtcHJjbS5oCj4+PiBuZXcgZmlsZSBtb2RlIDEw
MDY0NAo+Pj4gaW5kZXggMDAwMDAwMDAwMDAwLi44NDE1MTZjYmVmZDkKPj4+IC0tLSAvZGV2L251
bGwKPj4+ICsrKyBiL2luY2x1ZGUvc29jL3RlbnN0b3JyZW50L2F0bGFudGlzLXByY20uaAo+Pj4g
QEAgLTAsMCArMSwzMSBAQAo+Pj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIu
MC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkgKi8KPj4+ICsvKgo+Pj4gKyAqIFNoYXJlZCBkZWZpbml0
aW9ucyBmb3IgQXRsYW50aXMgUFJDTSBDbG9jayBhbmQgUmVzZXQgRHJpdmVycwo+Pj4gKyAqCj4+
PiArICogQ29weXJpZ2h0IChjKSAyMDI2IFRlbnN0b3JyZW50Cj4+PiArICovCj4+PiArI2lmbmRl
ZiBfX1NPQ19BVExBTlRJU19QUkNNX0hfXwo+Pj4gKyNkZWZpbmUgX19TT0NfQVRMQU5USVNfUFJD
TV9IX18KPj4+ICsKPj4+ICsjaW5jbHVkZSA8bGludXgvYml0cy5oPgo+Pj4gKyNpbmNsdWRlIDxs
aW51eC90eXBlcy5oPgo+Pj4gKwo+Pj4gK3N0cnVjdCBhdGxhbnRpc19wcmNtX2FkZXYgewo+Pj4g
KyAgICAgc3RydWN0IGF1eGlsaWFyeV9kZXZpY2UgYWRldjsKPj4+ICsgICAgIHN0cnVjdCByZWdt
YXAgKnJlZ21hcDsKPj4+ICt9Owo+Pgo+PiBEcm9wLCB0aGVyZSBpcyBubyBkcml2ZXItd2lkZSB1
c2VyIG9mIHRoaXMuCj4gCj4+Cj4+PiArCj4+PiArc3RhdGljIGlubGluZSBzdHJ1Y3QgYXRsYW50
aXNfcHJjbV9hZGV2ICoKPj4+ICt0b19hdGxhbnRpc19wcmNtX2FkZXYoc3RydWN0IGF1eGlsaWFy
eV9kZXZpY2UgKmFkZXYpCj4+Cj4+IFNhbWUgaGVyZS4KPj4KPj4gRG8gbm90IGFkZCBzeW1ib2xz
IHRvIGhlYWRlcnMgd2hpY2ggbm90aGluZyB1c2VzLiBUaGVzZSBhcmUgcHJpdmF0ZSB0bwo+PiB0
aGUgZHJpdmVyIHNvIHRoZXkgbXVzdCBzdGF5IE9OTFkgaW4gdGhlIGRyaXZlci4KPiAKPiBUaGUg
ZGVmaW5pdGlvbnMgaW4gdGhlc2UgZmlsZXMgYXJlIHNoYXJlZCBiZXR3ZWVuIHRoZSBjbG9jayBh
bmQgcmVzZXQKPiBkcml2ZXIgKHdoaWNoIGFyZSBpbiBkcml2ZXJzL2Nsay90ZW5zdG9ycmVudC8g
YW5kIGRyaXZlcnMvcmVzZXQvKSwKPiBoZW5jZSB0aGV5IGhhdmUgYmVlbiBwdXQgaGVyZS4KCgpB
aCwgYnV0IHRoZW4gSSB3b25kZXIgd2h5IHlvdXIgY2xvY2sgZHJpdmVyIG5lZWRzIHRvIGFjY2Vz
cyByZXNldCBkcml2ZXIKc3RydWN0dXJlcy4gT3IgdmljZSB2ZXJzYS4gWW91IGFyZSBvbmx5IGV4
cGVjdGVkIHRvIGdldCByZWdtYXAgZnJvbSB0aGUKcGFyZW50LCBubz8KCgpCZXN0IHJlZ2FyZHMs
CktyenlzenRvZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
