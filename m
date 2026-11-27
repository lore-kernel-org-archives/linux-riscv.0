Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00244606A31C
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2026 21:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x1cTCYkw;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DbVCTH86
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tzA29s97PuuZNycmYDq+9pl7hi2px1OpAfjdCr8+jeE=; b=x1cTCYkwjeAt+/Z5EJnnoUZEiW
	X807bAeG3+uRNWt7RFBvlp0ZHVUcoitx05QEMOq5TVMg8YcGAN1OvBp4f9sSr+yMrkbjubwmGPFDt
	x7j8iLPL7dpn6J86IZpOv8EjweOih8BZEvfCLqkkc0rbo2mD0IS/BRAPEu7uoQfimqrUjUNdlu9aj
	06o2BpLb/iqWenp0ps5GRD0Ww44L/R1sJtXvjXnERbb0wKfQ8JZXG7Wxf1I7SvjxfIsU8sW75ePhP
	P1Dn76+Xaeo10sEt5SjumzYOrb5nxo/eAnYvtJdUBdVhozKZgY2Gsu+zFupPUlXtZ4g3N+dkhG0J+
	utcI/xdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX38X-000000006FJ-2v0M;
	Fri, 27 Nov 2026 21:05:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX38W-000000006F5-0oeu;
	Fri, 27 Nov 2026 21:05:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B011240D61;
	Fri, 27 Nov 2026 21:05:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64C121F000C1;
	Fri, 27 Nov 2026 21:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795813539;
	bh=yrcUJkxPg9w4wieDebgOR1w4YdfQXDDgdmwz0kbg3us=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DbVCTH86F+6Hzu2TOHWp83P8NPz/WeUuXZ+aaZBNkYNAnMpjEoUqohdm+gTJheBJB
	 NvK2V8aOrMweg4bxYoBtiUA+Cr8UgIijMtSz5WLYmhqHc+4g6kVh38RgZR4oiOwgT0
	 DEOVyab6whMayvF9KVfEpJwAdXNPDYZFEm4R1j3mPHrr3vfdHPzadu16ZjIltSLtjK
	 w97Nt1oTvJ09ehkW3xlSe40y00umzwX4VKuXflh5TvvRjo+NmdW6sly2xaVuVDR8vX
	 YKJN6GANTAcs3an7zDuOgm9QjiL+0b1G/V/QawINUpJevdRTuAyuWuXRm2ZPztg6qo
	 /xmcxuvqsNVuw==
Date: Fri, 27 Nov 2026 13:05:38 -0800
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Wei Fu <wefu@redhat.com>,
	Drew Fustini <dfustini@tenstorrent.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Han Gao <rabenda.cn@gmail.com>
Subject: Re: [PATCH v4 2/2] phy: add a driver for T-Head TH1520 USB PHY
Message-ID: <awnwop97gErg2d9L@x1>
References: <20261103081444.1983071-1-zhengxingda@iscas.ac.cn>
 <20261103081444.1983071-3-zhengxingda@iscas.ac.cn>
 <awXrnQVKZBXKsV2c@thelio>
 <83e1a995131aaed2a7e1119f97254c6b460dbbb3.camel@iscas.ac.cn>
 <2da5ea0d928af93418c54f70ea52bd9b1f0fc36d.camel@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2da5ea0d928af93418c54f70ea52bd9b1f0fc36d.camel@iscas.ac.cn>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCBOb3YgMjYsIDIwMjYgYXQgMDU6NDE6MzNQTSArMDgwMCwgSWNlbm93eSBaaGVuZyB3
cm90ZToKPiDlnKggMjAyNi0xMS0yNuWbm+eahCAxNzozMyArMDgwMO+8jEljZW5vd3kgWmhlbmfl
hpnpgZPvvJoKPiA+IOWcqCAyMDI2LTExLTI05LqM55qEIDExOjU1IC0wODAw77yMRHJldyBGdXN0
aW5p5YaZ6YGT77yaCj4gPiA+IE9uIFR1ZSwgTm92IDAzLCAyMDI2IGF0IDA0OjE0OjQ0UE0gKzA4
MDAsIEljZW5vd3kgWmhlbmcgd3JvdGU6Cj4gPiA+ID4gVGhlIFVTQiBQSFkgb24gVC1IZWFkIFRI
MTUyMCBTb0MgaXMgYSBTeW5vcHN5cyBVU0IgMy4wIEZlbXRvUEhZLCB3aXRoCj4gPiA+ID4gc29t
ZSBQSFkgcGFyYW1ldGVycyBleHBvcnRlZCBhcyBhbm90aGVyIHN5c3RlbSBjb250cm9sbGVyIGFs
b25nIHdpdGggaXQuCj4gPiA+ID4gCj4gPiA+ID4gQSBmZXcgUEhZIHBhcmFtZXRlcnMgaGF2ZSB1
bnVzYWJsZSBkZWZhdWx0cy4gQWRkIGEgZHJpdmVyIHRoYXQgcHJvZ3JhbXMKPiA+ID4gPiB0aGVt
IGJlZm9yZSByZWxlYXNpbmcgdGhlIFBIWSBmcm9tIHJlc2V0IGluIGFkZGl0aW9uIHRvCj4gPiA+
ID4gY2xvY2svcmVzZXQvcmVndWxhdG9yIG1hbmFnZW1lbnQuCj4gPiA+ID4gCj4gPiA+ID4gU2ln
bmVkLW9mZi1ieTogSWNlbm93eSBaaGVuZyA8emhlbmd4aW5nZGFAaXNjYXMuYWMuY24+Cj4gPiA+
ID4gLS0tCj4gPiA+ID4gQ2hhbmdlcyBpbiB2NDoKPiA+ID4gPiAtIE1ha2UgZXhpdCBjYWxsYmFj
ayBhbHdheXMgc3VjY2VzcyB0byBwcmV2ZW50IFBIWSBzdGF0ZSBtYWNoaW5lIGRlc3luYwo+ID4g
PiA+ICAgd2l0aCBjbGsvcnN0IHN0YXRlIGFzIHN1Z2dlc3RlZCBieSBTYXNoaWtvLgo+ID4gPiA+
IC0gUmUtd3JhcCBzb21lIGNvbW1lbnRzIHRhcmdldHRpbmcgZnVsbCA4MCBjb2x1bW5zLgo+ID4g
PiA+IC0gVXNlIGRldl9lcnJfcHJvYmUgZm9yIFBIWSBjcmVhdGlvbiBlcnJvciBoYW5kbGluZywg
dG8gcHJldmVudCBzcGFtbWluZwo+ID4gPiA+ICAgdGhlIGtlcm5lbCBsb2cgd2l0aCAtRVBST0JF
X0RFRkVSLgo+ID4gPiA+IENoYW5nZXMgaW4gdjM6Cj4gPiA+ID4gLSBVc2UgZnNsZWVwKCkgdG8g
cmVwbGFjZSB1ZGVsYXkoKSwgYW5kIGFkZCBwcm9wZXIgaW5jbHVzaW9uIG9mCj4gPiA+ID4gICBs
aW51eC9kZWxheS5oIGZvciB0aGlzIGZ1bmN0aW9uLiAoZnNsZWVwKCkgc3VnZ2VzdGVkIGJ5IERy
ZXcgYW5kCj4gPiA+ID4gICBpbmNsdXNpb24gc3VnZ2VzdGVkIGJ5IFNhc2hpa28pCj4gPiA+ID4g
LSBBZGFwdCBEcmV3J3Mgc3VnZ2VzdGlvbiBvbiB0aGUgd29yZGluZyBvZiB0aGUgY29tbWl0IG1l
c3NhZ2UncyAybmQKPiA+ID4gPiAgIHBhcmFncmFwaC4KPiA+ID4gPiBDaGFuZ2VzIGluIHYyOgo+
ID4gPiA+IC0gUmVtb3ZlZCB1bnJlZmVyZW5jZWQgcmVnaXN0ZXIgbmFtZXMuCj4gPiA+ID4gLSBD
aGFuZ2VkIHRoZSBiZWhhdmlvciB0byBsZWF2aW5nIGJ1cyBjbG9jayBvbiBpbnN0ZWFkIG9mIGJp
bmRpbmcgaXQgdG8KPiA+ID4gPiAgIHRoZSByZWdtYXAuCj4gPiA+ID4gLSBSZW1vdmVkIGVhcmx5
IHJldHVybiBmb3IgcmVzZXQgZGVhc3NlcnQgZmFpbHVyZSBpbiBwaHkgZXhpdCBjYWxsYmFjay4K
PiA+ID4gPiAtIFR3ZWFrZWQgdGhlIEtjb25maWcgaXRlbSAocmVtb3ZlZCBkZWZhdWx0IHZhbHVl
IGFuZCBhZGRlZCAic2VsZWN0Cj4gPiA+ID4gICBSRUdNQVBfTU1JTykuCj4gPiA+ID4gCj4gPiA+
ID4gIGRyaXZlcnMvcGh5L0tjb25maWcgICAgICAgICAgICAgICAgfCAgIDEgKwo+ID4gPiA+ICBk
cml2ZXJzL3BoeS9NYWtlZmlsZSAgICAgICAgICAgICAgIHwgICAxICsKPiA+ID4gPiAgZHJpdmVy
cy9waHkvdGhlYWQvS2NvbmZpZyAgICAgICAgICB8ICAxMiArKwo+ID4gPiA+ICBkcml2ZXJzL3Bo
eS90aGVhZC9NYWtlZmlsZSAgICAgICAgIHwgICAyICsKPiA+ID4gPiAgZHJpdmVycy9waHkvdGhl
YWQvcGh5LXRoMTUyMC11c2IuYyB8IDE3OSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+
ID4gPiA+ICA1IGZpbGVzIGNoYW5nZWQsIDE5NSBpbnNlcnRpb25zKCspCj4gPiA+ID4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3BoeS90aGVhZC9LY29uZmlnCj4gPiA+ID4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL3BoeS90aGVhZC9NYWtlZmlsZQo+ID4gPiA+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgZHJpdmVycy9waHkvdGhlYWQvcGh5LXRoMTUyMC11c2IuYwo+ID4gPiAKPiA+ID4g
U29ycnkgZm9yIHRoZSBkZWxheSBpbiByZXZpZXcuIEkgdGhpbmsgYmluZGluZyBhbmQgZHJpdmVy
IGRpciBzaG91bGQgYmUKPiA+ID4gYWRkZWQgdW5kZXIgdGhlYWQgc29jIHN1cHBvcnQgaW4gTUFJ
TlRBSU5FUlMsIHJpZ2h0Pwo+ID4gCj4gPiBJIGFtIGFkZGluZyBpdCwgYnV0IG1heWJlIGl0J2Qg
YmUgd29ydGggdG8gYWRkIGEgTjogY2xhdXNlIGludG8gdGhlCj4gPiBNQUlOVEFJTkVSUyBmaWxl
Pwo+ID4gCj4gPiBBbHRob3VnaCB0aGlzIHdvdWxkbid0IGJlbG9uZyB0byB0aGlzIHBhdGNoc2V0
Lgo+IAo+IFdlbGwgdG8gcHJldmVudCBtZXJnaW5nIGNvbmZsaWN0LCBtYXliZSBpdCdkIGJlIGJl
dHRlciB0byBzdWJzdGl0dXRlIHRoZQo+IGZpbGUgbGlzdCB3aXRoIGFuIE46IGl0ZW0gaW4gYSBj
b21taXQgZ29pbmcgdGhyb3VnaCB0aGUgU29DIHRyZWUsIGFuZAo+IHByZXZlbnQgY2hhbmdpbmcg
dGhpcyBmaWxlIGluIHRoZSBQSFkgdHJlZS4KCk9rYXksIGdvb2QgaWRlYS4KClRoYW5rcywKRHJl
dwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
