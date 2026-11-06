Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7136C606A32D
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 09:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Bho9Vk7l;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=G2jvcPnt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iY0W7WnsR3aUb/qoz3kNLSYQ8dvJJJb6LLCw5HdAWZM=; b=Bho9Vk7l3Pr0FfT4yhPuVKhDq2
	cBCIkFOaeE5ay+Y5Xud/dqInTiXeK9Mckq9ewi6KOaxALZPh2EmB3gw9vtrrIdnw1k52KU21CcPGQ
	JOCy3Xw8BaGB1Wr+yceF2c1jXo5bASF0rg153BP/n3b8XxZOn7j5Ypjzy1zmc3fBLNT0sX3YH6NRI
	oEgmxmwHEoMEnxn/hFo3p0nEpx//W6dzgMMO1l+vftaXCJiUZdZK3PHqByNa5IuVYD1NFy5UEcgz1
	g86HK/acbvrjT+DbrQl9bP5u4m9qG1HukiFBkaxuy6HB8QooNRjs66hhgKp9AMWaYfz2byhFw6gku
	s4Mj+64A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGgH-0000000BpMA-2JJf;
	Fri, 06 Nov 2026 09:56:21 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGgD-0000000BpLN-31mD;
	Fri, 06 Nov 2026 09:56:20 +0000
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 74765200B4C;
	Fri, 06 Nov 2026 10:56:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793958975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O6bNKP/PWu+XhHEmy9+0v2gCYo8Y74jTDprqO0ZB8Cs=;
	b=G2jvcPntNwss+Z/2TmYHjQFOX70vsp8lMtTLKgrIIE2PS4bz+GMg4XOxPwkMiX0tTu2QmB
	4Hljng7r9uQKZqYd8Fz+4teUmFhPCMIUSxFOzrZqJkqWi6/mX64HYurOjhI3IwlzNW8ivY
	JMJstQbpm8DgKnmpTmeoQLgPdTzRCsstgB4P1wszniBLoPb1ZLOcxOtphn/L99NkUWT5cf
	JiV5RO1/TKWO4HD9YQoI/nmoCs6xTKreCxBVVcnRIOGuUj5/Vt/QBe7PuYsnZejWPBX1ld
	uYUnD3JLA/tgVoSJc3zuBhgcIimbE293URqqG/4hDi9R5SUsddzWgtbKSA9Log==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793958975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O6bNKP/PWu+XhHEmy9+0v2gCYo8Y74jTDprqO0ZB8Cs=;
	b=a4Ju+cfO+qKHeqZZYBM0ICfE0szqnKTzYxbj5BaTDGhCqpENFATxO9jautw6TPedCiCAty
	urdF0rANCIzYqDKn0h5nsx0nNOapYXF5qFZ1gw9c2FzC+X+eCrqgmsa6pZZ4X+pj5sCTCa
	SdA9xhi1ziOFz8uLSVrcLZ2Qt9C7WWkcBof0n4r2rN6dHar89Fe3IPbvC13TQRxWxpCeAN
	CtfXOm0B0foVCsRL6pdxY/cHbkwSk3jx6W28QqBmywQVrmQMCOVmxLhqvtl912fWbV2lYU
	ewB9t7zc5IrdgDG7hLhELuzURxpA6wjHIS8DAH/LQjDKBQ7fiZ2TYxkgU65ykg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793958975; a=rsa-sha256;
	cv=none;
	b=hIH/6oo6yZquWNoVc16a0oxuSsS+WSHDOlmQihFSed6sWHGES4oUYNF0K34N0SXBrqlf9m
	iHe9q4oJk6j3gnWMPvV3DqFiJpZniSf1+xNqZ7wKvDlClOQhH0Fp/HMNtaLBJ50/K7ej5/
	3TDVuLDgKuLFX12a2GOdAFq0RE70GbRXykX5uQkZkdGsgbUL+a9ldki61DFDTgVq7eU/f/
	lBLwlE4Ij4+vxC+7EniQglt00xDl1zn3s9iatii+9dE8IXwNtbRDyG2GEPajlO9lUYMZrt
	WcOMwSMGwPVves1L4q8rDNTnS5QI32gKTokqcw0HESWONpt+ZnOG6UCwTM24yg==
Message-ID: <f93de3b97219942fae8e3272f7c65c0d5f9fc9b8.camel@pengutronix.de>
Subject: Re: [PATCH 22/25] phy: metanoia: add USB2 PHY driver
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
Date: Fri, 06 Nov 2026 10:56:15 +0100
In-Reply-To: <20261106-mt2824-v1-22-86087eaf5af4@bootlin.com>
References: <20261106-mt2824-v1-0-86087eaf5af4@bootlin.com>
	 <20261106-mt2824-v1-22-86087eaf5af4@bootlin.com>
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_015617_933127_D5B0C986 
X-CRM114-Status: GOOD (  14.92  )
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
QWRkIGEgbWluaW1hbCByZXNldC1vbmx5IFBIWSBwcm92aWRlciBmb3IgdGhlIE1ldGFub2lhIE1U
MjgyNCBVU0IyIFBIWS4KPiBJdCBkZWFzc2VydHMgdGhlIFBIWSByZXNldCByZXF1aXJlZCBieSB0
aGUgRFdDMiBVU0IgY29udHJvbGxlciBvbiBpbml0Cj4gYW5kIGFzc2VydHMgaXQgYWdhaW4gb24g
ZXhpdC4KPiAKPiBPcmlnaW5hbGx5LWJ5OiBKdW4gQ2hhbmcgPGp1bi5jaGFuZ0BtZXRhbm9pYS1j
b21tLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBCZW5vw650IE1vbmluIDxiZW5vaXQubW9uaW5AYm9v
dGxpbi5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvcGh5L0tjb25maWcgICAgICAgICAgICAgfCAgMSAr
Cj4gIGRyaXZlcnMvcGh5L01ha2VmaWxlICAgICAgICAgICAgfCAgMSArCj4gIGRyaXZlcnMvcGh5
L21ldGFub2lhL0tjb25maWcgICAgfCAxNiArKysrKysrKwo+ICBkcml2ZXJzL3BoeS9tZXRhbm9p
YS9NYWtlZmlsZSAgIHwgIDMgKysKPiAgZHJpdmVycy9waHkvbWV0YW5vaWEvcGh5LXVzYjIuYyB8
IDg4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDUgZmlsZXMg
Y2hhbmdlZCwgMTA5IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9waHkv
S2NvbmZpZyBiL2RyaXZlcnMvcGh5L0tjb25maWcKPiBpbmRleCAxMDVmYmU0MDhhYTIuLjczZWY2
MWYxZjUzZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3BoeS9LY29uZmlnCj4gKysrIGIvZHJpdmVy
cy9waHkvS2NvbmZpZwo+IEBAIC0xODQsNiArMTg0LDcgQEAgc291cmNlICJkcml2ZXJzL3BoeS9p
bnRlbC9LY29uZmlnIgo+ICBzb3VyY2UgImRyaXZlcnMvcGh5L2xhbnRpcS9LY29uZmlnIgo+ICBz
b3VyY2UgImRyaXZlcnMvcGh5L21hcnZlbGwvS2NvbmZpZyIKPiAgc291cmNlICJkcml2ZXJzL3Bo
eS9tZWRpYXRlay9LY29uZmlnIgo+ICtzb3VyY2UgImRyaXZlcnMvcGh5L21ldGFub2lhL0tjb25m
aWciCj4gIHNvdXJjZSAiZHJpdmVycy9waHkvbWljcm9jaGlwL0tjb25maWciCj4gIHNvdXJjZSAi
ZHJpdmVycy9waHkvbW90b3JvbGEvS2NvbmZpZyIKPiAgc291cmNlICJkcml2ZXJzL3BoeS9tc2Nj
L0tjb25maWciCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGh5L01ha2VmaWxlIGIvZHJpdmVycy9w
aHkvTWFrZWZpbGUKPiBpbmRleCBjNmRkMDIwMDNiYmUuLjU3OTkxYjUwOTc4YyAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL3BoeS9NYWtlZmlsZQo+ICsrKyBiL2RyaXZlcnMvcGh5L01ha2VmaWxlCj4g
QEAgLTM2LDYgKzM2LDcgQEAgb2JqLSQoQ09ORklHX0dFTkVSSUNfUEhZKQkJKz0gYWxsd2lubmVy
LwlcCj4gIAkJCQkJICAgbGFudGlxLwlcCj4gIAkJCQkJICAgbWFydmVsbC8JXAo+ICAJCQkJCSAg
IG1lZGlhdGVrLwlcCj4gKwkJCQkJICAgbWV0YW5vaWEvCVwKPiAgCQkJCQkgICBtaWNyb2NoaXAv
CVwKPiAgCQkJCQkgICBtb3Rvcm9sYS8JXAo+ICAJCQkJCSAgIG1zY2MvCVwKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9waHkvbWV0YW5vaWEvS2NvbmZpZyBiL2RyaXZlcnMvcGh5L21ldGFub2lhL0tj
b25maWcKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uYjhhNDkw
ODViYjk1Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2RyaXZlcnMvcGh5L21ldGFub2lhL0tjb25m
aWcKPiBAQCAtMCwwICsxLDE2IEBACj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0y
LjAtb25seQo+ICsjCj4gKyMgUGh5IGRyaXZlcnMgZm9yIE1ldGFub2lhIHBsYXRmb3Jtcwo+ICsj
Cj4gKwo+ICtjb25maWcgUEhZX01FVEFOT0lBX1VTQjIKPiArCXRyaXN0YXRlICJNZXRhbm9pYSBV
U0IyIFBIWSByZXNldCBzdXBwb3J0Igo+ICsJZGVwZW5kcyBvbiBPRiAmJiAoQVJDSF9NRVRBTk9J
QSB8fCBDT01QSUxFX1RFU1QpCj4gKwlkZXBlbmRzIG9uIFJFU0VUX0NPTlRST0xMRVIKCk5vLCBp
dCBkb2Vzbid0LiBUaGlzIGlzIG9ubHkgcmVxdWlyZWQgZm9yIHJlc2V0IGNvbnRyb2xsZXIgZHJp
dmVycy4KVGhlIHJlc2V0IGNvbnRyb2wgQVBJIGlzIHN0dWJiZWQgb3V0IHdoZW4gUkVTRVRfQ09O
VFJPTExFUiBpcyBub3Qgc2V0LgoKCnJlZ2FyZHMKUGhpbGlwcAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
