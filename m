Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6001C77B7D
	for <linux-riscv@archiver.kernel.org>; Sun,  7 May 2023 09:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B71iBJk/qn5vUmJDvFE+N56k/3PceOqH7lAUyhKyLiI=; b=R5+SvyH0lu2kNI
	qXdtk96ZYpWVHq52MzAmHOhCDT3UCwKLGFDgzVCzkOw2x/n4ttgCdGmg+ynxVV0H+qoRPr1tdRFPf
	4ja7ZI5AXbd7Mkld8ixkgro1cwezJ8M/WEMh8v9Y9cfB5R+T0oxEKY3ieL90oTrkOZ+Ul1oyLpb7L
	sUfV8V8CPakmX+ehZmlwVWp7iK0U1JLQxyoEH0CUMPhgKSh60ELq0wOVAZ4YyH5xF1eQ0M09knnXW
	7ZX8ggoSOyH3jRzmvIENnBwKLszZB4bWdFbJgwU3CV+JPiMQfrBpoyWjUCrUdr1WEZgjZkj8AuijW
	2hdO+Rya6kIT1KUHxtow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvb2x-00FfBq-1R;
	Sun, 07 May 2023 09:51:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvb2s-00FfAN-2l;
	Sun, 07 May 2023 09:51:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8AFBC2F4;
	Sun,  7 May 2023 02:51:49 -0700 (PDT)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A8D73F64C;
	Sun,  7 May 2023 02:51:02 -0700 (PDT)
Date: Sun, 7 May 2023 10:50:45 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Maksim Kiselev <bigunclemax@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>, Maxime Ripard <mripard@kernel.org>,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 1/5] dt-bindings: spi: sun6i: add DT bindings for
 Allwinner R329/D1/R528/T113s SPI
Message-ID: <20230507105045.085fa058@slackpad.lan>
In-Reply-To: <835082fe07b77db8598aebabe98a74c2c5ac47d1.camel@aosc.io>
References: <20230506232616.1792109-1-bigunclemax@gmail.com>
	<20230506232616.1792109-2-bigunclemax@gmail.com>
	<835082fe07b77db8598aebabe98a74c2c5ac47d1.camel@aosc.io>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230507_025111_013388_A1619101 
X-CRM114-Status: GOOD (  18.17  )
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

T24gU3VuLCAwNyBNYXkgMjAyMyAxMjowNjo1OCArMDgwMApJY2Vub3d5IFpoZW5nIDxpY2Vub3d5
QGFvc2MuaW8+IHdyb3RlOgoKSGksCgo+IOWcqCAyMDIzLTA1LTA35pif5pyf5pel55qEIDAyOjI2
ICswMzAw77yMTWFrc2ltIEtpc2VsZXblhpnpgZPvvJoKPiA+IExpc3RlZCBhYm92ZSBBbGx3aW5u
ZXIgU29DcyBoYXMgdHdvIFNQSSBjb250cm9sbGVycy4gRmlyc3QgaXMgdGhlCj4gPiByZWd1bGFy
Cj4gPiBTUEkgY29udHJvbGxlciBhbmQgdGhlIHNlY29uZCBvbmUgaGFzIGFkZGl0aW9uYWwgZnVu
Y3Rpb25hbGl0eSBmb3IKPiA+IE1JUEktREJJIFR5cGUgQy4KPiA+IAo+ID4gQWRkIGNvbXBhdGli
bGUgc3RyaW5ncyBmb3IgdGhlc2UgY29udHJvbGxlcnMKPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTog
TWFrc2ltIEtpc2VsZXYgPGJpZ3VuY2xlbWF4QGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gwqAuLi4v
ZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvYWxsd2lubmVyLHN1bjZpLWEzMS1zcGkueWFtbMKgwqAg
fCA3Cj4gPiArKysrKysrCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKPiA+
IAo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkv
YWxsd2lubmVyLHN1bjZpLQo+ID4gYTMxLXNwaS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3NwaS9hbGx3aW5uZXIsc3VuNmktCj4gPiBhMzEtc3BpLnlhbWwKPiA+IGlu
ZGV4IGRlMzZjNmEzNGEwZi4uODA3ZGRlNDU3ZTNiIDEwMDY0NAo+ID4gLS0tIGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9hbGx3aW5uZXIsc3VuNmktYTMxLQo+ID4gc3Bp
LnlhbWwKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvYWxs
d2lubmVyLHN1bjZpLWEzMS0KPiA+IHNwaS55YW1sCj4gPiBAQCAtMjEsNiArMjEsNyBAQCBwcm9w
ZXJ0aWVzOgo+ID4gwqDCoMKgwqAgb25lT2Y6Cj4gPiDCoMKgwqDCoMKgwqAgLSBjb25zdDogYWxs
d2lubmVyLHN1bjZpLWEzMS1zcGkKPiA+IMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBhbGx3aW5uZXIs
c3VuOGktaDMtc3BpCj4gPiArwqDCoMKgwqDCoCAtIGNvbnN0OiBhbGx3aW5uZXIsc3VuNTBpLXIz
Mjktc3BpCj4gPiDCoMKgwqDCoMKgwqAgLSBpdGVtczoKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
IC0gZW51bToKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBhbGx3aW5uZXIsc3Vu
OGktcjQwLXNwaQo+ID4gQEAgLTI4LDYgKzI5LDEyIEBAIHByb3BlcnRpZXM6Cj4gPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gYWxsd2lubmVyLHN1bjUwaS1oNjE2LXNwaQo+ID4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGFsbHdpbm5lcixzdW5pdi1mMWMxMDBzLXNwaQo+
ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBjb25zdDogYWxsd2lubmVyLHN1bjhpLWgzLXNwaQo+
ID4gK8KgwqDCoMKgwqAgLSBpdGVtczoKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqAgLSBlbnVtOgo+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gYWxsd2lubmVyLHN1bjIwaS1kMS1zcGkK
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGFsbHdpbm5lcixzdW4yMGktZDEtc3Bp
LWRiaSAgCgpUaGlzIGNvbnN0cnVjdCBkb2Vzbid0IGNvdmVyIHRoZSB0aHJlZSBjb21wYXRpYmxl
IHN0cmluZyBjYXNlLCBzaW5jZSB3ZQpvbmx5IGdldCB0byBjaG9vc2UgZnJvbSBvbmUgb2YgdGhl
IGVudW1zLCBhbmQgYWx3YXlzIGhhdmUgdHdvIHN0cmluZ3MgLQpoZW5jZSBteSBjaGFsbGVuZ2Ug
dG8gZmluZCB0aGUgc2hvcnRlc3Qgc2VxdWVuY2UgOy0pCgo+IEluIHRoaXMgY2FzZSBJIHdpbGwg
cHJlZmVyIHRvIGxpc3QgYWxsIDQgY29tcGF0aWJsZXMgaWYgYmFja3dhcmQKPiBjb21wYXRpYmls
aXR5IGlzIHVzZWQ6Cj4gImFsbHdpbm5lcixzdW4yMGktZDEtc3BpLWRiaSIsICJhbGx3aW5uZXIt
c3VuMjBpLWQxLXNwaSIsCj4gImFsbHdpbm5lcixzdW41MGktcjMyOS1zcGktZGJpIiwgImFsbHdp
bm5lciwgc3VuNTBpLXIzMjktc3BpIiwgaW4gY2FzZQo+IGlmIHdlIHdlcmUgZ2FpbmluZyBzdXBw
b3J0IGZvciBlaXRoZXIgcXVpcmtzIG9mIEQxIGNvbnRyb2xsZXIgb3IKPiBTUElfREJJIGNvbnRy
b2xsZXJzLgoKSSBzZWUgd2hlcmUgeW91IGFyZSBjb21pbmcgZnJvbSwgYnV0IHRoYXQgb3JkZXIg
ZG9lc24ndCBsb29rIHJpZ2h0LApzaW5jZSB3ZSBnbyBiYWNrIGZyb20gREJJIHRvIG5vcm1hbCBh
bmQgdGhlbiBiYWNrIGFnYWluLiBBbmQKImFsbHdpbm5lci1zdW4yMGktZDEtc3BpIiBpcyBub3Qg
YSBzdXBlciBzZXQgb2YKImFsbHdpbm5lcixzdW41MGktcjMyOS1zcGktZGJpIi4KSW4gY2FzZSB3
ZSB3aWxsIG5lZWQgYSBEMSBxdWlyaywgd2UgY291bGQga2V5IHRoaXMgdG8gdGhlIEQxIERCSQpj
b21wYXRpYmxlIGFzIHdlbGwsIEkgdGhpbmssIHNvIHRoaXMgdGhyZWUgc3RyaW5nIHZlcnNpb24g
c2hvdWxkIHdvcmsuCgpDaGVlcnMsCkFuZHJlCgo+IAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIC0gYWxsd2lubmVyLHN1bjUwaS1yMzI5LXNwaS1kYmkKPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqAgLSBjb25zdDogYWxsd2lubmVyLHN1bjUwaS1yMzI5LXNwaQo+ID4gwqAKPiA+IMKgwqAg
cmVnOgo+ID4gwqDCoMKgwqAgbWF4SXRlbXM6IDEgIAo+IAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
