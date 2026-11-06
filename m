Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6627A606A326
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 11:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eOvqpCeH;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DRtzz8Ow
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=S5m0sKE4MhurarodcRf++lJoChFyeViV3LFxKRAwH30=; b=eOvqpCeHTNtiOyZUkGS9aHyP/n
	tQlj7nHyMJTdAR0WYb5VzX8k3zfeeaQRKjDqNw0rCi85Fz6K4BUr3yiRauhVlWjCRk52zGk9j1s2n
	iywo46rrUAG17e9Xpu533Nv325HVdXbbirYLrt6dpPL9YFdN5SJzkN+2MvbQfPZuBrFCrLISI5b5A
	59JQr+1sn3+VmUinU2STH17Mxo4vW6eURBWQw12dM04xnrZSVX3vXUIpe2nn/1jYR5yFPjifAbkJ3
	pygavwv9ZfxXQizh/Buf4zShr4lQCsDBwq8gzKSoICiEmyyd0ivRn8v7wsU3P3MP4ALQE1iGDwqqU
	oPuJkwCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIWN-0000000CE5O-2we9;
	Fri, 06 Nov 2026 11:54:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIWM-0000000CE4m-331Q;
	Fri, 06 Nov 2026 11:54:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7AFF341815;
	Fri,  6 Nov 2026 11:54:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A36C1F008A1;
	Fri,  6 Nov 2026 11:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793966054;
	bh=zeUGkAr+dd5pvA9ddLYxv09ZmZOzgKimQinHuYdcXGY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DRtzz8OwVZ8h54GrjlHTDasRVBAtPcFhfr0YDhT28zp43jVnv922ia2GefpiSxLaP
	 yJXFCDtltMQPVRqKI9XDeUNQsQFV2xMb9f3OCVoNPlwI38PEUXRH+kADoZWdAgOsK5
	 Bn+IngDuAfKSFPhD+fzi3S3NK4SMCmXifiAivN6Cm7tvLub7p769OUi04UjLkAj4Jc
	 vTSVJ0E76oZyp9PUYzhzqHCSQHGHz9R0kOSBm/lYfSzttPRp3SiPh+J1Q0SyMHCR4j
	 5ysZKp2SKvW9jfZOfQ8/bOogtll/OOaT4woBxUVwTacfXodHtYRkjWtlBIRJDHa9iN
	 zdKoYNy5p7M5w==
Date: Fri, 6 Nov 2026 12:54:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?Q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jun Chang <jun.chang@metanoia-comm.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Sebastian Reichel <sre@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Samuel Holland <samuel.holland@sifive.com>, Ben Zong-You Xie <ben717@andestech.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, CL Wang <cl634@andestech.com>, Mark Brown <broonie@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Adrian Hunter <adrian.hunter@intel.com>, 
	Minas Harutyunyan <hminas@synopsys.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Randolph Sheng-Kai =?utf-8?B?TGluKOael+iBluWHsSk=?= <randolph@andestech.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org, linux-phy@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, linux-mmc@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 13/25] dt-bindings: usb: dwc2: add Metanoia MT2824
Message-ID: <20261106-dexterous-predictable-pelican-ae2094@quoll>
References: <20261106-mt2824-v1-0-86087eaf5af4@bootlin.com>
 <20261106-mt2824-v1-13-86087eaf5af4@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261106-mt2824-v1-13-86087eaf5af4@bootlin.com>
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

T24gRnJpLCBOb3YgMDYsIDIwMjYgYXQgMTA6MzA6MTBBTSArMDEwMCwgQmVub8OudCBNb25pbiB3
cm90ZToKPiBEb2N1bWVudCB0aGUgbWV0YW5vaWEsbXQyODI0LXVzYiBjb21wYXRpYmxlLCB3aGlj
aCBmYWxscyBiYWNrIHRvIHRoZQo+IGdlbmVyaWMgc25wcyxkd2MyIGJpbmRpbmcsIHNvIHRoYXQg
dGhlIERXQzIgVVNCIGNvbnRyb2xsZXIgb24gdGhlIE1ldGFub2lhCj4gTVQyODI0IFNvQyBjYW4g
YmUgZGVzY3JpYmVkIGluIGRldmljZSB0cmVlcy4KClRoaXMgaXMgY29tcGxldGVseSByZWR1bmRh
bnQgY29tbWl0IG1zZy4gWW91IHJlcGVhdCBzdWJqZWN0IGFuZCBkaWZmLCBzbwpvYnZpb3VzIHRo
aW5ncywgd2hpbGUgY29tcGxldGVseSBza2lwcGluZyBub24tb2J2aW91cyBwYXJ0IC0gd2h5IGRv
IHlvdQp0aGluZyB0aGV5IGFyZSBjb21wYXRpYmxlLgoKPiAKPiBPcmlnaW5hbGx5LWJ5OiBKdW4g
Q2hhbmcgPGp1bi5jaGFuZ0BtZXRhbm9pYS1jb21tLmNvbT4KClBsZWFzZSBkcm9wIChvciByZWFk
IHN1Ym1pdHRpbmcgcGF0Y2hlcyBpZiB5b3UgbmVlZCBvdGhlciB0YWdzKQoKPiBTaWduZWQtb2Zm
LWJ5OiBCZW5vw650IE1vbmluIDxiZW5vaXQubW9uaW5AYm9vdGxpbi5jb20+Cj4gLS0tCj4gIERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvZHdjMi55YW1sIHwgMSArCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2R3YzIueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy91c2IvZHdjMi55YW1sCj4gaW5kZXggNmMzYTEwOTkxYjhiLi44OThj
ODNlNTc4NDMgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3VzYi9kd2MyLnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
dXNiL2R3YzIueWFtbAo+IEBAIC01NSw2ICs1NSw3IEBAIHByb3BlcnRpZXM6Cj4gICAgICAgICAg
ICAgICAgLSBhbWxvZ2ljLG1lc29uLWcxMmEtdXNiCj4gICAgICAgICAgICAgICAgLSBhbWxvZ2lj
LG1lc29uLWExLXVzYgo+ICAgICAgICAgICAgICAgIC0gaW50ZWwsc29jZnBnYS1hZ2lsZXgtaHNv
dGcKPiArICAgICAgICAgICAgICAtIG1ldGFub2lhLG10MjgyNC11c2IKPiAgICAgICAgICAgIC0g
Y29uc3Q6IHNucHMsZHdjMgoKSXMgaXQgdGhlbiBjb21wYXRpYmxlIHdpdGggRFdDMj8gWW91ciBk
cml2ZXIgY29kZSBzdWdnZXN0cyBub3QuCgo+ICAgICAgICAtIGNvbnN0OiBhbWNjLGR3Yy1vdGcK
PiAgICAgICAgLSBjb25zdDogYXBtLGFwbTgyMTgxLWR3Yy1vdGcKPiAKPiAtLSAKPiAyLjU2LjAK
PiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
