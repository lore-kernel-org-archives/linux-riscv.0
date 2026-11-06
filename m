Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0DA606A33E
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 10:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=l5f6aJB5;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=H9OK/dkj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=B8q7U4Ojr60/YqYUEllnQGaCUGz3xrfnqZWSDv3DDME=; b=l5f6aJB5Hnfg5x+4remRj6X+aq
	mtp7hNXTxdGhT37f/53uFH5GvNkvmt99DQOIK2sn2vE0VwaNPKZYulgBCaTKXmbajITygw3ZCIwmP
	j14CrXchYVxsW0K0W7e9wweaQBTeajAulV4Oux7X2w462gj7oKQyALc4shVNGHuGgqjOfRPC/ExoQ
	zIIC1UjR8G92Z3GvMpSnt4/bCrkkK3vGqsP8nVgM/T9rCVwIk6M3tmKkgrwexFWSLKdF4RI3uRj/X
	kZ1vI/6soNCXz0ougojsm80JD/RAYxXcCcvZdVCyTUBOw5z7v7Tj3W9LKsiGfBkZ3w1LlMOZHQXve
	2Fv4NYAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGoO-0000000BqRy-1Vcc;
	Fri, 06 Nov 2026 10:04:44 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGoK-0000000BqPa-1Kcd;
	Fri, 06 Nov 2026 10:04:42 +0000
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 60E23200B4C;
	Fri, 06 Nov 2026 11:04:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793959478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E30LKCk16cx9qTN9HOhUZe7RDTiEawi3RYRVo2ca6qc=;
	b=H9OK/dkjxwsZIZIcV+Hn9L5EPukiz/UuPQboeBcOiGsnIgm8EU8hlNH8ZEfC8eT890B9do
	t/rVb6rpXkjXoACppi+7N/n7cVqNJSdPp8aqJEDW+PSEkbyYieVNpk7IxfAhDwiTKAo4xL
	ado3BN8BtQG2+jWeulvtNUN0sRI8hMB6TUrLMnMdIaBwnpvCOnLQNSnfJG05+Fg8G6ekNx
	wTLI3RyrFamrS95tpbWjU2DpyH0pHRLvdlYDV9INwKl9ANlUtS0gMOEillr9PYvhf0nAci
	tlHTWlWPibrPVmhg/UBeAtmwpkx0cSwSe2O4flM5/za76ilVe0iFc5wMSZZi8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793959478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E30LKCk16cx9qTN9HOhUZe7RDTiEawi3RYRVo2ca6qc=;
	b=U0A/V3EsJYIkir8OlEXILK/QpaaTBcw+TopekKMn/NBDo9BnMSPBGSaMxFf7b71vee5BSS
	XdsZo+oUKVHpOooM1bntAsnxElc4F0668OOL40DTxMbvJhD664+xzqWfSLGVl/6yrJlpx0
	q6jwNN8j5amCXX0YZPdqg8yCJpxmx8gZ0zcLYdUQD4ZzO+eqHr1xXCcj6TkRFQkYP14un5
	NbxmfHk72rsHovLcFS2Nqw/AjUPwzpyKA0petrgLmfqsG2bX2hmmJ+c7u9U2IfnGGJrnlv
	NI3igvN4DvRU3w2u+mblG4zqDHeDvwYjSEx41O+1t10D9V0xDChRkvNIBYFzYQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793959478; a=rsa-sha256;
	cv=none;
	b=E5AANVgEXfZ4XGSE7OrvMeYfjW72YCl7fwTT5Jh29NZsLDpdrZf+uFVSoGpiOmSlCUZeWI
	qzmWBNW9eUwtEarw1v4VhuAZbtXsakr1HiWvDX0mmQkT9A2VS580i4WJJjGhrxQkm1zBks
	vHvLQtN6ncJiArAuBrEnY5UkDDuuPUSy/OrFmA9WSiQRSmhdDeb88zX3PJPg/E3SBAAda/
	W2onN0t6PpOhdrPi6TixFlrTdDmqz9nHhtC0jkwPXdhg2YK5BUqySwvQfwouIwdO9W7Bdd
	3T2Ve0hH3P0NvEOdJOUpeSZdH4rtKXSrVPZxoL0qEmcKBThow//f+ymqktcRGg==
Message-ID: <35d9bc34110d1663af947189bc74f4ba758612cf.camel@pengutronix.de>
Subject: Re: [PATCH 24/25] riscv: add Metanoia MT2824 SoC and MT5824 EVB
 support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: =?ISO-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Jun Chang <jun.chang@metanoia-comm.com>, Paul
 Walmsley	 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou	
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Sebastian Reichel
	 <sre@kernel.org>, Vinod Koul <vkoul@kernel.org>, Neil Armstrong	
 <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, Conor
 Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Lad
 Prabhakar	 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Thomas Gleixner
 <tglx@kernel.org>,  Radu Rendec <radu@rendec.net>, Samuel Holland
 <samuel.holland@sifive.com>, Ben Zong-You Xie	 <ben717@andestech.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Ulf Hansson	 <ulfh@kernel.org>,
 Jisheng Zhang <jszhang@kernel.org>, CL Wang	 <cl634@andestech.com>, Mark
 Brown <broonie@kernel.org>, Greg Kroah-Hartman	
 <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Adrian Hunter
 <adrian.hunter@intel.com>, Minas Harutyunyan	 <hminas@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Randolph Sheng-Kai
 =?UTF-8?Q?Lin=28=E6=9E=97=E8=81=96=E5=87=B1=29?=
	 <randolph@andestech.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-pm@vger.kernel.org, linux-phy@lists.infradead.org, Paul Walmsley
	 <paul.walmsley@sifive.com>, linux-mmc@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-watchdog@vger.kernel.org
Date: Fri, 06 Nov 2026 11:04:38 +0100
In-Reply-To: <20261106-mt2824-v1-24-86087eaf5af4@bootlin.com>
References: <20261106-mt2824-v1-0-86087eaf5af4@bootlin.com>
	 <20261106-mt2824-v1-24-86087eaf5af4@bootlin.com>
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_020440_510818_043197A4 
X-CRM114-Status: GOOD (  15.95  )
X-Spam-Score: -2.1 (--)
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

T24gRnIsIDIwMjYtMTEtMDYgYXQgMTA6MzAgKzAxMDAsIEJlbm/DrnQgTW9uaW4gd3JvdGU6Cj4g
QWRkIHRoZSBkZXZpY2UgdHJlZSBmb3IgdGhlIE1ldGFub2lhIE1UMjgyNCwgYSBkdWFsLWNvcmUg
QW5kZXMKPiBBWDQ1TVAtYmFzZWQgU29DLCBhbmQgZm9yIHRoZSBNVDU4MjQgZXZhbHVhdGlvbiBi
b2FyZC4KPiAKPiBUaGUgU29DIGRldmljZSB0cmVlIGRlc2NyaWJlcyB0aGUgQ1BVcyBhbmQgdGhl
aXIgTDIgY2FjaGUsIHRoZSBQTElDLAo+IFBMSUNTVyBhbmQgUExNVCwgdGhlIHJlc2V0IGNvbnRy
b2xsZXIsIHRoZSByZWJvb3QgY29udHJvbGxlciwgdGhlCj4gd2F0Y2hkb2csIHR3byBVQVJUcywg
dGhlIFFTUEkgYW5kIGVpZ2h0IFNQSSBjb250cm9sbGVycywgdGhlIERXQwo+IE1TSEMgTU1DIGNv
bnRyb2xsZXIsIGFuZCB0aGUgVVNCMiBjb250cm9sbGVyLgo+IAo+IFRoZSBNVDU4MjQgRVZCIGVu
YWJsZXMgdGhlIHdhdGNoZG9nLCB0aGUgdHdvIFVBUlRzLCB0aGUgTU1DCj4gY29udHJvbGxlciwg
dGhlIFFTUEkgcG9ydCB3aXRoIGl0cyBTUEktTk9SIGZsYXNoLCB0aGUgZmlyc3QgdGhyZWUgU1BJ
Cj4gY29udHJvbGxlcnMsIGFuZCB0aGUgVVNCIGNvbnRyb2xsZXIuCj4gCj4gT3JpZ2luYWxseS1i
eTogSnVuIENoYW5nIDxqdW4uY2hhbmdAbWV0YW5vaWEtY29tbS5jb20+Cj4gU2lnbmVkLW9mZi1i
eTogQmVub8OudCBNb25pbiA8YmVub2l0Lm1vbmluQGJvb3RsaW4uY29tPgo+IC0tLQo+ICBhcmNo
L3Jpc2N2L2Jvb3QvZHRzL01ha2VmaWxlICAgICAgICAgICAgICAgIHwgICAxICsKPiAgYXJjaC9y
aXNjdi9ib290L2R0cy9tZXRhbm9pYS9NYWtlZmlsZSAgICAgICB8ICAgMiArCj4gIGFyY2gvcmlz
Y3YvYm9vdC9kdHMvbWV0YW5vaWEvbXQyODI0LmR0c2kgICAgfCAzMzAgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKwo+ICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL21ldGFub2lhL210NTgyNC1ldmIu
ZHRzIHwgIDgxICsrKysrKysKPiAgNCBmaWxlcyBjaGFuZ2VkLCA0MTQgaW5zZXJ0aW9ucygrKQo+
IApbLi4uXQo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL21ldGFub2lhL210Mjgy
NC5kdHNpIGIvYXJjaC9yaXNjdi9ib290L2R0cy9tZXRhbm9pYS9tdDI4MjQuZHRzaQo+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi41ZjczYzZkMzc2MGIKPiAtLS0g
L2Rldi9udWxsCj4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9tZXRhbm9pYS9tdDI4MjQuZHRz
aQo+IEBAIC0wLDAgKzEsMzMwIEBACj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BM
LTIuMCsgT1IgTUlUKQo+ICsvKgo+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjYgTWV0YW5vaWEgQ29t
bXVuaWNhdGlvbnMgSW5jLi4gQWxsIHJpZ2h0cyByZXNlcnZlZC4KPiArICovCj4gKwo+ICsjaW5j
bHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvaXJxLmg+Cj4gKwo+ICsvIHsK
Wy4uLl0KPiArCXNvYzogc29jIHsKWy4uLl0KPiArCj4gKwkJcmVib290OiByZWJvb3RAMTAwMDAw
MDQgewo+ICsJCQljb21wYXRpYmxlID0gIm1ldGFub2lhLG10MjgyNC1yZWJvb3QiOwo+ICsJCQly
ZWcgPSA8MHgwIDB4MTAwMDAwMDQgMHgwIDB4MDg+Owo+ICsJCX07Cj4gKwo+ICsJCXJzdDogcmVz
ZXQtY29udHJvbGxlckAxMDAwMDAwYyB7Cj4gKwkJCSNyZXNldC1jZWxscyA9IDwxPjsKPiArCQkJ
Y29tcGF0aWJsZSA9ICJtZXRhbm9pYSxtdDI4MjQtcmVzZXQiOwo+ICsJCQlyZWcgPSA8MHgwIDB4
MTAwMDAwMGMgMHgwIDB4MDQ+Owo+ICsJCX07CgpUaGlzIGxvb2tzIHVudXN1YWwuIEFyZSB5b3Ug
c3VyZSB0aGVzZSBhcmUgbm90IGJvdGggcGFydCBvZiBhIHNpbmdsZQpkZXZpY2UgQDEwMDAwMDAw
ID8KCnJlZ2FyZHMKUGhpbGlwcCAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
