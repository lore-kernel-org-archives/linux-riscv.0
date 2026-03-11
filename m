Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C27112584F
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Mar 2026 16:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r0d0xjboM/RtaYSfPTrrxo2xvLfHksVKcrlvxtvrkus=; b=1F7QcvgNol5arA
	kAzQ90+JuTSzn9WWd/XmkVdkMIrrd+fLtshml5zPT6MrKx/VNe4dR+Bel1KJEKFDDwn7rpDD4ZUsj
	8Zi3NNscHhFlJPD3kf8tgjraF0/lZTvgHtDEGw73yGJccxlP0ydWg0ypjmC0sX45qB/37Gp4w1OIm
	Bb5OLqepzb1aOSb4TWMEheS13VCf+s81ToQlrvCn4F1VUES/HNXTAiBshIHqsMrUgz/3TtKlI8a0W
	0r35Qtn0QFi6tM24EzkesH8sIW+SWLtL7RlR4luA/cNgVaox9op6R4/DIMzJXMrf38yofdyHh1Pew
	39YVB/5XEE5NRp9XsaIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0M9y-0000000Btrc-0ycD;
	Wed, 11 Mar 2026 16:11:46 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0M9u-0000000BtrH-3ier
	for linux-riscv@lists.infradead.org;
	Wed, 11 Mar 2026 16:11:44 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9F0DF1A2D90;
	Wed, 11 Mar 2026 16:11:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6C1B260004;
	Wed, 11 Mar 2026 16:11:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 72C84103691F8;
	Wed, 11 Mar 2026 17:11:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773245499; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=h4UXzCKBp/AtRlL9HwQ21GZlqc5cwCvVv8lhtud2N4c=;
	b=ZJZW7xpWv7UWurgWYUo9/EK3dvUe54bVyyWqTUG4Qe9nSxyBccLHHEBqkzoFADwePBMNrb
	pVu77BHK1ZbermPxkrhmUJIurCC4i8oZs2/gyCNrsTt46EwGau1YlyAcPgD+0o84BpjRsw
	C+oiOP1TyNdHsez0ca9+rGG7LlNPXVU74EuWW+LAzJ1BjltcslbTi3AfOoeDCQz0hCBrmm
	RjWSlkLkJN3XZc1owWqHy7xaN0yrOcjZpoOpX+nk/eT0zcmY0KcfK09bkW1617VAA4nySL
	xJfvIaqKSyAnCjbUUSCBxgXsM8WeecG613XHwdutmMs0zmDghF7V5GacOrpG7g==
Date: Wed, 11 Mar 2026 17:11:29 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-gpio@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Thomas Gleixner <tglx@linutronix.de>, Daire McNamara
 <daire.mcnamara@microchip.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 3/4] soc: microchip: add mpfs gpio interrupt mux
 driver
Message-ID: <20260311171129.2c382b91@bootlin.com>
In-Reply-To: <20260311-vigorous-steadfast-04afdcc9e524@spud>
References: <20260311-tasting-friend-eae39148fb96@spud>
	<20260311-vigorous-steadfast-04afdcc9e524@spud>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_091143_073876_A3255741 
X-CRM114-Status: GOOD (  13.61  )
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

SGkgQ29ub3IsCgpPbiBXZWQsIDExIE1hciAyMDI2IDE1OjE3OjQwICswMDAwCkNvbm9yIERvb2xl
eSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cgo+IEZyb206IENvbm9yIERvb2xleSA8Y29ub3Iu
ZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4gCj4gT24gUG9sYXJGaXJlIFNvQyB0aGVyZSBhcmUgbW9y
ZSBHUElPIGludGVycnVwdHMgdGhhbiB0aGVyZSBhcmUgaW50ZXJydXB0Cj4gbGluZXMgYXZhaWxh
YmxlIG9uIHRoZSBQTElDLCBhbmQgYSBydW50aW1lIGNvbmZpZ3VyYWJsZSBtdXggaXMgdXNlZCB0
bwo+IGRlY2lkZSB3aGljaCBpbnRlcnJ1cHRzIGFyZSBhc3NpZ25lZCBkaXJlY3QgY29ubmVjdGlv
bnMgdG8gdGhlIFBMSUMgJgo+IHdoaWNoIGFyZSByZWxlZ2F0ZWQgdG8gc2hhcmluZyBhIGxpbmUu
Cj4gCj4gQWRkIGEgZHJpdmVyIHNvIHRoYXQgTGludXggY2FuIHNldCB0aGUgbXV4IGJhc2VkIG9u
IHRoZSBpbnRlcnJ1cHQKPiBtYXBwaW5nIGluIHRoZSBkZXZpY2V0cmVlLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4gLS0tCj4g
IE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAyICstCj4gIGRyaXZlcnMv
c29jL21pY3JvY2hpcC9LY29uZmlnICAgICAgIHwgIDExICsrCj4gIGRyaXZlcnMvc29jL21pY3Jv
Y2hpcC9NYWtlZmlsZSAgICAgIHwgICAxICsKPiAgZHJpdmVycy9zb2MvbWljcm9jaGlwL21wZnMt
aXJxbXV4LmMgfCAxODEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICA0IGZpbGVzIGNo
YW5nZWQsIDE5NCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL3NvYy9taWNyb2NoaXAvbXBmcy1pcnFtdXguYwo+IAoKTG9va3MgZ29vZC4K
ClJldmlld2VkLWJ5OiBIZXJ2ZSBDb2RpbmEgPGhlcnZlLmNvZGluYUBib290bGluLmNvbT4KCkJl
c3QgcmVnYXJkcywKSGVydsOpCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
