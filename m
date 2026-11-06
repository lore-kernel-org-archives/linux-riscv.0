Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2E46082BFD
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 09:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0N5C+CzA;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=kaskxmAB;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=HaixeoNX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tKWCZRuGP7uKut7bl5hOX9S01ZLf7xsS5Tjazvb+GDo=; b=0N5C+CzAbA+ip3dCBmXjbcvlrD
	KwbByOLIsj60jJ0u1uMchejEuzzmSJXt+j9wnTQ/wYNKxGHTrheBkUEIMklLTdrVVQ3+wP6ahdqND
	V8jNPI7ZNP0lSOS2S9YrHP3fNIjD4YCbnlDmEL3+POlPZSoX7H6XPouasHDI8mZ5JW0utvppaXlpN
	NM2tPzv+5p75+uk+i0xJgXOVXDDptVVI/ldJ7OMMcwsi0n03wk7MWMJIEy9FBNbitrywImnjvtNQY
	mNcjsBgT7Ds51XCFgKFeB9iR3arfo70U3J+GUcCtXSqAWhYQWxdM4IhiI6zur5rmL3L2wtUvH4/8r
	xIV21kaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGJN-0000000BjQB-2bMW;
	Fri, 06 Nov 2026 09:32:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGJI-0000000BjKG-3YjH
	for linux-riscv@bombadil.infradead.org;
	Fri, 06 Nov 2026 09:32:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=gBhA5ne0HzBSBsjNMeB0b97akpJDk47Q1STTVSn0v1g=; b=kaskxmABdHhCz/boW1b5kKw/od
	ov8AWWnKE7z/yTKYOZC/bjy70OuxZftRDWOCncxTBA6dszKzg+KzCO8UUL0T89J4+9HD63Yy5BY07
	p8HwA7x0kC6XRENDJfUJarb3QJe5CvZQ/8bvqUNQobBUfa02N61LhTQgxyuOGQNLMSunEEV4IUND+
	JtP0PVRpR0niopwrIOeHQLRa0AtBqBNgQJNaslWZUhlD7nE0HtgZZ9I8JqfX/1xk3VQPYaR3kRBi4
	RuXQKYBj+7inTSlK6l4dUyWX1Vb6CJPXIItH3lf5Q8RptRBZpuGB0OjoKMtVvqk1EGKBXV7GPqwDo
	9eUK6CLg==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGJE-000000042w3-1UcR
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 09:32:34 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 887C71A0C32;
	Fri,  6 Nov 2026 09:32:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 586C15FFBC;
	Fri,  6 Nov 2026 09:32:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AFE461032927D;
	Fri,  6 Nov 2026 10:32:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793957547; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gBhA5ne0HzBSBsjNMeB0b97akpJDk47Q1STTVSn0v1g=;
	b=HaixeoNXbLBHSchvJYkZj08DvAcwni449GADLwNQTjY/eTlF+kt5/dEzlSVzXnxh1HCSgN
	WWbP9KCYAEY4VNrrTPCJJmtrUvLb263bmiiry2aOxSbttRDgOv7t6PSAit7uiXW4OpjNSI
	+xEQUj1vtvVNTLsNyJkI1cePniyzcJe6rFWzEyo06tgIDCIYLV05YnsFrvRcoLdore3o6v
	hzQyVRtXML3AwTE8aG+7oE/ab1IBh60uT3aqjpJAUtWGD9r8eHxXmLd4oJzuNHqQVEX0j4
	Rz+NI5WdWP5N7zdVlC9rtnEt5t9phhsb4+3q3+PO0a/mxxhYz96anvjPg5y3Jw==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Fri, 06 Nov 2026 10:30:13 +0100
Subject: [PATCH 16/25] reset: simple: add Metanoia MT2824 support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261106-mt2824-v1-16-86087eaf5af4@bootlin.com>
References: <20261106-mt2824-v1-0-86087eaf5af4@bootlin.com>
In-Reply-To: <20261106-mt2824-v1-0-86087eaf5af4@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jun Chang <jun.chang@metanoia-comm.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Sebastian Reichel <sre@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Jonathan Cameron <jic23@kernel.org>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Ben Zong-You Xie <ben717@andestech.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 Jisheng Zhang <jszhang@kernel.org>, CL Wang <cl634@andestech.com>, 
 Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Adrian Hunter <adrian.hunter@intel.com>, 
 Minas Harutyunyan <hminas@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Randolph_Sheng-Kai_Lin=28=E6=9E=97=E8=81=96=E5=87=B1=29?= <randolph@andestech.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org, 
 linux-phy@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 linux-mmc@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_093232_652553_EF8C4CEE 
X-CRM114-Status: GOOD (  13.78  )
X-Spam-Score: -0.2 (/)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhlIE1ldGFub2lhIE1UMjgyNCBpbnRlZ3JhdGVzIGEgc2ltcGxlIHJlc2V0IGNvbnRyb2xsZXIg
d2l0aCB0aGUgc2FtZQpyZWdpc3RlciBsYXlvdXQgYXMgdGhlIG90aGVyIHJlc2V0LXNpbXBsZSBj
b250cm9sbGVycy4gQWRkIGl0cyBjb21wYXRpYmxlCnN0cmluZyBhbmQgYnVpbGQgcmVzZXQtc2lt
cGxlIGZvciBBUkNIX01FVEFOT0lBIGJ5IGRlZmF1bHQuCgpPcmlnaW5hbGx5LWJ5OiBKdW4gQ2hh
bmcgPGp1bi5jaGFuZ0BtZXRhbm9pYS1jb21tLmNvbT4KU2lnbmVkLW9mZi1ieTogQmVub8OudCBN
b25pbiA8YmVub2l0Lm1vbmluQGJvb3RsaW4uY29tPgotLS0KIGRyaXZlcnMvcmVzZXQvS2NvbmZp
ZyAgICAgICAgfCAyICstCiBkcml2ZXJzL3Jlc2V0L3Jlc2V0LXNpbXBsZS5jIHwgMSArCiAyIGZp
bGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvcmVzZXQvS2NvbmZpZyBiL2RyaXZlcnMvcmVzZXQvS2NvbmZpZwppbmRleCBlZGE5
YzY5OGE5NWYuLmI0Mjc2OGQ3Yjg4YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9yZXNldC9LY29uZmln
CisrKyBiL2RyaXZlcnMvcmVzZXQvS2NvbmZpZwpAQCAtMjk3LDcgKzI5Nyw3IEBAIGNvbmZpZyBS
RVNFVF9TQ01JCiAKIGNvbmZpZyBSRVNFVF9TSU1QTEUKIAlib29sICJTaW1wbGUgUmVzZXQgQ29u
dHJvbGxlciBEcml2ZXIiIGlmIENPTVBJTEVfVEVTVCB8fCBFWFBFUlQKLQlkZWZhdWx0IEFSQ0hf
QVNQRUVEIHx8IEFSQ0hfQkNNQkNBIHx8IEFSQ0hfQklUTUFJTiB8fCBBUkNIX1JFQUxURUsgfHwg
QVJDSF9TT1BIR08gfHwgQVJDSF9TVE0zMiB8fCAoQVJDSF9JTlRFTF9TT0NGUEdBICYmIEFSTTY0
KSB8fCBBUkNIX1NVTlhJIHx8IEFSQworCWRlZmF1bHQgQVJDSF9BU1BFRUQgfHwgQVJDSF9CQ01C
Q0EgfHwgQVJDSF9CSVRNQUlOIHx8IEFSQ0hfTUVUQU5PSUEgfHwgQVJDSF9SRUFMVEVLIHx8IEFS
Q0hfU09QSEdPIHx8IEFSQ0hfU1RNMzIgfHwgKEFSQ0hfSU5URUxfU09DRlBHQSAmJiBBUk02NCkg
fHwgQVJDSF9TVU5YSSB8fCBBUkMKIAlkZXBlbmRzIG9uIEhBU19JT01FTQogCWhlbHAKIAkgIFRo
aXMgZW5hYmxlcyBhIHNpbXBsZSByZXNldCBjb250cm9sbGVyIGRyaXZlciBmb3IgcmVzZXQgbGlu
ZXMgdGhhdApkaWZmIC0tZ2l0IGEvZHJpdmVycy9yZXNldC9yZXNldC1zaW1wbGUuYyBiL2RyaXZl
cnMvcmVzZXQvcmVzZXQtc2ltcGxlLmMKaW5kZXggNzllOTRlY2ZlNGY1Li4xNzdkZjM2MjM1YTUg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcmVzZXQvcmVzZXQtc2ltcGxlLmMKKysrIGIvZHJpdmVycy9y
ZXNldC9yZXNldC1zaW1wbGUuYwpAQCAtMTQ4LDYgKzE0OCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3Qgb2ZfZGV2aWNlX2lkIHJlc2V0X3NpbXBsZV9kdF9pZHNbXSA9IHsKIAkJLmRhdGEgPSAmcmVz
ZXRfc2ltcGxlX2FjdGl2ZV9sb3cgfSwKIAl7IC5jb21wYXRpYmxlID0gImJyY20sYmNtNDkwOC1t
aXNjLXBjaWUtcmVzZXQiLAogCQkuZGF0YSA9ICZyZXNldF9zaW1wbGVfYWN0aXZlX2xvdyB9LAor
CXsgLmNvbXBhdGlibGUgPSAibWV0YW5vaWEsbXQyODI0LXJlc2V0IiB9LAogCXsgLmNvbXBhdGli
bGUgPSAic25wcyxkdy1oaWdoLXJlc2V0IiB9LAogCXsgLmNvbXBhdGlibGUgPSAic25wcyxkdy1s
b3ctcmVzZXQiLAogCQkuZGF0YSA9ICZyZXNldF9zaW1wbGVfYWN0aXZlX2xvdyB9LAoKLS0gCjIu
NTYuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
