Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C865606A326
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 11:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Wn8U//Dm;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ESf9+xCG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OjFGJPmz3hOOyECkzN+wagQlfQSgTVNMj4tcgMWpTx4=; b=Wn8U//DmchcBvc+zfSlB+5+rau
	Ox8JJ9XRhpwvHg2peS4dmB0Y7ZVBl6ERF4JU6S7x10EYvqgNE01JW3YnZZryRfdXUrPJZsZcrGlNr
	GfKNEUnwfOrwzdto71u4RLsb+cMmvNu6nocb6sRwau/FXCsqqJu0zk4fX2mPuyO/B/ZjExZjnDFW2
	v5fNVK3R5wCn4LjTNaA71/wvNWKMW9Hwg01ObWB1WGgAI3PesAa7TZl6gIQ4YdrWj7UPmE7zeD0Af
	2Jp6mdMcmMKgPCji/7c7472dRpb3VifzDyUU7sXOM4TZd5XA1rL0LsOr+rxBY1T+r8DLp6eOphaP3
	CdrL6hVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIRm-0000000CCWx-2xGV;
	Fri, 06 Nov 2026 11:49:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIRl-0000000CCWM-2lNv;
	Fri, 06 Nov 2026 11:49:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0FD7943425;
	Fri,  6 Nov 2026 11:49:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA2E91F008A4;
	Fri,  6 Nov 2026 11:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793965768;
	bh=pvAK8vumV1CMjx7B9+4wQQ+5r1Xl3bHb8AOs+rHc89k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ESf9+xCGMJOB8JJ24Z9JidY98q6I3VG1LS5xQUaWbDSnIun3yQuj2X+4l+3TBybsW
	 M85ANVNZeyV7zC914Cl8UnpY+2E0gwb2p9YdpiBk8N3LuekyQtbAjKEzKFQHhXkTQM
	 ny5W4HFdt5mIzoUT6X1H/uigMZ0PLB2m870aZdLmhfcLFpvR2Sxw0txQymUcy4qVgq
	 spFx2BzmJdXXc7zAeUYxLRytLBpPZnLraoa1g3CM/4nheX1TRGXU9uCHvkbN6GOVYo
	 tx3mPBdLpQd//K0e9NFcMMnlWHmupctEwHdQISS6N8uOd8UQ8N7coTjWUYRvTMobJe
	 YcHIOlOG4mwaQ==
Date: Fri, 6 Nov 2026 12:49:25 +0100
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
Subject: Re: [PATCH 11/25] dt-bindings: spi: andestech,ae350-spi: make DMA
 and interrupts optional
Message-ID: <20261106-agate-sponge-of-influence-993ee9@quoll>
References: <20261106-mt2824-v1-0-86087eaf5af4@bootlin.com>
 <20261106-mt2824-v1-11-86087eaf5af4@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261106-mt2824-v1-11-86087eaf5af4@bootlin.com>
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCBOb3YgMDYsIDIwMjYgYXQgMTA6MzA6MDhBTSArMDEwMCwgQmVub8OudCBNb25pbiB3
cm90ZToKPiBUaGUgQVRDU1BJMjAwIGNvbnRyb2xsZXIgY2FuIGJlIHVzZWQgaW4gUElPIG1vZGUs
IHdpdGhvdXQgRE1BLCBhbmQgUElPCgpNYXliZSB0aGUgYWUzNTAtc3BpIGNhbm5vdCBhbmQgb25s
eSB5b3VyIHZhcmlhbnQgY2FuPwoKPiB0cmFuc2ZlcnMgY2FuIG9wdGlvbmFsbHkgdXNlIHRoZSBj
b250cm9sbGVyJ3MgaW50ZXJydXB0LiBNYWtlIGRtYXMsCj4gZG1hLW5hbWVzIGFuZCBpbnRlcnJ1
cHRzIG9wdGlvbmFsLCBhbmQgcmVxdWlyZSBkbWEtbmFtZXMgaWYgZG1hcyBpcwo+IHNwZWNpZmll
ZC4KPiAKPiBPcmlnaW5hbGx5LWJ5OiBKdW4gQ2hhbmcgPGp1bi5jaGFuZ0BtZXRhbm9pYS1jb21t
LmNvbT4KClBsZWFzZSBkcm9wLCBhcyBtZW50aW9uZWQgaW4gZWFybGllciBtZXNzYWdlLgoKQmVz
dCByZWdhcmRzLApLcnp5c3p0b2YKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
