Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54868F532D8
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Mar 2026 05:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6mk0tGW7F65LVSu6NgkxaY1OBFqj68OPYOzcYCjEhUk=; b=RnGEi7wy6m2Z/F
	RVKC5UM3Cmbux4nWaGBUNJcDwT4A9CI/w8MXxbMvoYOnJ+326XNHl9l/Yq83NVAHb4l4ngBVl7K8V
	K+qPZmY5xrJDii+7w5ovIuzAY9pl09QsDGZv3KTB684WUdXPispL+MwyLMcY0+ck/daaIklNixqbC
	cq2Gj6vyiebNND6Amfmm9g6EB20q1aS9R76fCFaQ+ViugvJRXn49gIwPAfQoGOYYDxtQ+pa+WLWKc
	VTNdagNej2CuCVZRffG9GbOC0i8Te0Lqr5vUksAUAK18IyIgFV9yZotDyaTSRO0+CAx2/CpdzJqkR
	iHh5PYmCZMbVbFr/cl9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uLZ-00000000aL9-2HMd;
	Tue, 24 Mar 2026 05:30:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uLW-00000000aK3-1qXw;
	Tue, 24 Mar 2026 05:30:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1FC68405B1;
	Tue, 24 Mar 2026 05:30:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB708C19424;
	Tue, 24 Mar 2026 05:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774330227;
	bh=526IhjsOFPVmG2tNWNSg5v0vlx2brzpXsRolpXsjTxo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IwWTEQB3juSgzdL+5oAblN8Vg5C2TndIzXIJ+/psD+qLI87dPTnoZjI03lh86g1OB
	 mpSx1LZMSw/DBe07y/3Zp7OwHRoXIwmNyksCLyArn6Wgy/ZHCvMbVGNpS90y0hARXP
	 F0cEESScMmvPYn5UufI98xv5QMoRbgZrZzhD7xIu0KifQHEz3rXAPZncO9dZT6B7kz
	 f7eteFWu1GwBo5+I9vrgiWwlDtSUwgSH1mRAXD6RYsxRwmK/CWvAd8Nwsx8c7aA7z2
	 z6dYz7z5nVUXZFH9xdB88UIr+/EMARSpJjWMql6MVkuv6lSlxP20W2BfZ5GZOiuE6l
	 rVsq+mtBjuYfg==
Date: Tue, 24 Mar 2026 11:00:10 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-scsi@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, netdev@vger.kernel.org, 
	spacemit@lists.linux.dev, UNGLinuxDriver@microchip.com, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: Re: [PATCH v5 phy-next 10/27] scsi: ufs: qcom: keep parallel track
 of PHY power state
Message-ID: <ezrcjjwtg5n76w4m65l27szu5mywx66ti3xuprkfcp3x6quvbf@2rew4zrnnbt2>
References: <20260319223241.1351137-1-vladimir.oltean@nxp.com>
 <20260319223241.1351137-11-vladimir.oltean@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260319223241.1351137-11-vladimir.oltean@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_223030_545727_7FDE0949 
X-CRM114-Status: GOOD (  26.68  )
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

T24gRnJpLCBNYXIgMjAsIDIwMjYgYXQgMTI6MzI6MjRBTSArMDIwMCwgVmxhZGltaXIgT2x0ZWFu
IHdyb3RlOgo+IEFzIGV4cGxhaW5lZCBpbiB0aGUgc2ltaWxhciB1ZnMtZXh5bm9zLmMgY2hhbmdl
LCBQSFkgY29uc3VtZXIgZHJpdmVycwo+IHNob3VsZCBub3QgbG9vayBhdCB0aGUgcGh5LT5wb3dl
cl9jb3VudCwgYmVjYXVzZSBpbiB0aGUgZ2VuZXJhbCBjYXNlCj4gdGhlcmUgbWlnaHQgYWxzbyBi
ZSBvdGhlciBjb25zdW1lcnMgd2hvIGhhdmUgY2FsbGVkIHBoeV9wb3dlcl9vbigpIHRvbywKPiBz
byB0aGUgZmFjdCB0aGF0IHRoZSBwb3dlcl9jb3VudCBpcyBub24temVybyBkb2VzIG5vdCBtZWFu
IHRoYXQgd2UgZGlkLgo+IAo+IE1vcmVvdmVyLCBzdHJ1Y3QgcGh5IHdpbGwgYmVjb21lIG9wYXF1
ZSBzb29uLCBzbyB0aGUgcWNvbSBVRlMgZHJpdmVyCj4gd2lsbCBub3QgYmUgYWJsZSB0byBhcHBs
eSB0aGlzIHBhdHRlcm4uIEtlZXAgcGFyYWxsZWwgdHJhY2sgb2YgdGhlIFBIWQo+IHBvd2VyIHN0
YXRlLCBpbnN0ZWFkIG9mIGxvb2tpbmcgYXQgYSBmaWVsZCB3aGljaCB3aWxsIGJlY29tZSB1bmF2
YWlsYWJsZQo+IChwaHktPnBvd2VyX2NvdW50KS4KPiAKPiBBYm91dCB0cmVhdGluZyB0aGUgcGh5
X3Bvd2VyX29mZigpIHJldHVybiBjb2RlOiBmcm9tIGFuIEFQSSBwZXJzcGVjdGl2ZSwKPiB0aGlz
IHNob3VsZCBoYXZlIHByb2JhYmx5IHJldHVybmVkIHZvaWQsIG90aGVyd2lzZSBjb25zdW1lcnMg
d291bGQgYmUKPiBzdHVjayBpbiBhIHN0YXRlIHRoZXkgY2FuJ3QgZXNjYXBlLiBUaGUgcHJvdmlk
ZXIsIHBoeS1xY29tLXFtcC11ZnMuYywKPiBkb2VzIHJldHVybiAwIGluIGl0cyBwb3dlcl9vZmYo
KSBpbXBsZW1lbnRhdGlvbi4gSSBjb25zaWRlciBpdCBzYWZlIHRvCj4gZGlzY2FyZCBwb3RlbnRp
YWwgZXJyb3JzIGZyb20gcGh5X3Bvd2VyX29mZigpIGluc3RlYWQgb2YgY29tcGxpY2F0aW5nCj4g
dGhlIHBoeV9wb3dlcmVkX29uIGxvZ2ljLgo+IAoKWW91IGNvdWxkIGV2ZW4gc2ltcGxpZnkgdGhl
IGNvZGUgYnkgZ2V0dGluZyByaWQgb2YgdGhlICdwaHlfcG93ZXJlZF9vbicgY2hlY2sKYWx0b2dl
dGhlci4gVGhlcmUgaXMgbm8gcmVhbCBuZWVkIHRvIHRyYWNrIHRoZSBQSFkgcG93ZXIgc3RhdGUg
aW4gdGhpcyBkcml2ZXIuCkl0IGlzIHNhZmUgdG8gY2FsbCBwaHlfcG93ZXJfb2ZmKCkgd2l0aG91
dCBhbnkgY2hlY2tzLgoKLSBNYW5pCgo+IFNpZ25lZC1vZmYtYnk6IFZsYWRpbWlyIE9sdGVhbiA8
dmxhZGltaXIub2x0ZWFuQG54cC5jb20+Cj4gLS0tCj4gQ2M6ICJKYW1lcyBFLkouIEJvdHRvbWxl
eSIgPEphbWVzLkJvdHRvbWxleUBIYW5zZW5QYXJ0bmVyc2hpcC5jb20+Cj4gQ2M6IE1hbml2YW5u
YW4gU2FkaGFzaXZhbSA8bWFuaUBrZXJuZWwub3JnPgo+IENjOiAiTWFydGluIEsuIFBldGVyc2Vu
IiA8bWFydGluLnBldGVyc2VuQG9yYWNsZS5jb20+Cj4gQ2M6IE5pdGluIFJhd2F0IDxxdWljX25p
dGlyYXdhQHF1aWNpbmMuY29tPgo+IAo+IHY0LT52NTogcGF0Y2ggaXMgbmV3Cj4gLS0tCj4gIGRy
aXZlcnMvdWZzL2hvc3QvdWZzLXFjb20uYyB8IDkgKysrKysrKy0tCj4gIGRyaXZlcnMvdWZzL2hv
c3QvdWZzLXFjb20uaCB8IDEgKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91ZnMvaG9zdC91ZnMtcWNv
bS5jIGIvZHJpdmVycy91ZnMvaG9zdC91ZnMtcWNvbS5jCj4gaW5kZXggMzc1ZmQyNGJhNDU4Li4z
YjhiZDk5NjgyMzUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy91ZnMvaG9zdC91ZnMtcWNvbS5jCj4g
KysrIGIvZHJpdmVycy91ZnMvaG9zdC91ZnMtcWNvbS5jCj4gQEAgLTUwOCw5ICs1MDgsMTAgQEAg
c3RhdGljIGludCB1ZnNfcWNvbV9wb3dlcl91cF9zZXF1ZW5jZShzdHJ1Y3QgdWZzX2hiYSAqaGJh
KQo+ICAJaWYgKHJldCkKPiAgCQlyZXR1cm4gcmV0Owo+ICAKPiAtCWlmIChwaHktPnBvd2VyX2Nv
dW50KQo+ICsJaWYgKGhvc3QtPnBoeV9wb3dlcmVkX29uKSB7Cj4gIAkJcGh5X3Bvd2VyX29mZihw
aHkpOwo+IC0KPiArCQlob3N0LT5waHlfcG93ZXJlZF9vbiA9IGZhbHNlOwo+ICsJfQo+ICAKPiAg
CS8qIHBoeSBpbml0aWFsaXphdGlvbiAtIGNhbGlicmF0ZSB0aGUgcGh5ICovCj4gIAlyZXQgPSBw
aHlfaW5pdChwaHkpOwo+IEBAIC01MzEsNiArNTMyLDcgQEAgc3RhdGljIGludCB1ZnNfcWNvbV9w
b3dlcl91cF9zZXF1ZW5jZShzdHJ1Y3QgdWZzX2hiYSAqaGJhKQo+ICAJCQlfX2Z1bmNfXywgcmV0
KTsKPiAgCQlnb3RvIG91dF9kaXNhYmxlX3BoeTsKPiAgCX0KPiArCWhvc3QtPnBoeV9wb3dlcmVk
X29uID0gdHJ1ZTsKPiAgCj4gIAlyZXQgPSBwaHlfY2FsaWJyYXRlKHBoeSk7Cj4gIAlpZiAocmV0
KSB7Cj4gQEAgLTEyNjgsNiArMTI3MCw3IEBAIHN0YXRpYyBpbnQgdWZzX3Fjb21fc2V0dXBfY2xv
Y2tzKHN0cnVjdCB1ZnNfaGJhICpoYmEsIGJvb2wgb24sCj4gIAkJCQlkZXZfZXJyKGhiYS0+ZGV2
LCAicGh5IHBvd2VyIG9mZiBmYWlsZWQsIHJldD0lZFxuIiwgZXJyKTsKPiAgCQkJCXJldHVybiBl
cnI7Cj4gIAkJCX0KPiArCQkJaG9zdC0+cGh5X3Bvd2VyZWRfb24gPSBmYWxzZTsKPiAgCQl9Cj4g
IAkJYnJlYWs7Cj4gIAljYXNlIFBPU1RfQ0hBTkdFOgo+IEBAIC0xMjc3LDYgKzEyODAsNyBAQCBz
dGF0aWMgaW50IHVmc19xY29tX3NldHVwX2Nsb2NrcyhzdHJ1Y3QgdWZzX2hiYSAqaGJhLCBib29s
IG9uLAo+ICAJCQkJZGV2X2VycihoYmEtPmRldiwgInBoeSBwb3dlciBvbiBmYWlsZWQsIHJldCA9
ICVkXG4iLCBlcnIpOwo+ICAJCQkJcmV0dXJuIGVycjsKPiAgCQkJfQo+ICsJCQlob3N0LT5waHlf
cG93ZXJlZF9vbiA9IHRydWU7Cj4gIAo+ICAJCQkvKiBlbmFibGUgdGhlIGRldmljZSByZWYgY2xv
Y2sgZm9yIEhTIG1vZGUqLwo+ICAJCQlpZiAodWZzaGNkX2lzX2hzX21vZGUoJmhiYS0+cHdyX2lu
Zm8pKQo+IEBAIC0xNDY3LDYgKzE0NzEsNyBAQCBzdGF0aWMgdm9pZCB1ZnNfcWNvbV9leGl0KHN0
cnVjdCB1ZnNfaGJhICpoYmEpCj4gIAo+ICAJdWZzX3Fjb21fZGlzYWJsZV9sYW5lX2Nsa3MoaG9z
dCk7Cj4gIAlwaHlfcG93ZXJfb2ZmKGhvc3QtPmdlbmVyaWNfcGh5KTsKPiArCWhvc3QtPnBoeV9w
b3dlcmVkX29uID0gZmFsc2U7Cj4gIAlwaHlfZXhpdChob3N0LT5nZW5lcmljX3BoeSk7Cj4gIH0K
PiAgCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdWZzL2hvc3QvdWZzLXFjb20uaCBiL2RyaXZlcnMv
dWZzL2hvc3QvdWZzLXFjb20uaAo+IGluZGV4IDExMTFhYjM0ZGEwMS4uNzJjZTA2ODdmYTQyIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvdWZzL2hvc3QvdWZzLXFjb20uaAo+ICsrKyBiL2RyaXZlcnMv
dWZzL2hvc3QvdWZzLXFjb20uaAo+IEBAIC0yODIsNiArMjgyLDcgQEAgc3RydWN0IHVmc19xY29t
X2hvc3Qgewo+ICAJc3RydWN0IGNsa19idWxrX2RhdGEgKmNsa3M7Cj4gIAl1MzIgbnVtX2Nsa3M7
Cj4gIAlib29sIGlzX2xhbmVfY2xrc19lbmFibGVkOwo+ICsJYm9vbCBwaHlfcG93ZXJlZF9vbjsK
PiAgCj4gIAlzdHJ1Y3QgaWNjX3BhdGggKmljY19kZHI7Cj4gIAlzdHJ1Y3QgaWNjX3BhdGggKmlj
Y19jcHU7Cj4gLS0gCj4gMi40My4wCj4gCgotLSAK4K6u4K6j4K6/4K614K6j4K+N4K6j4K6p4K+N
IOCumuCupOCuvuCumuCuv+CuteCuruCvjQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
