Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2122606D820
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 09:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FYcZCiF4;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=OQyJWD9x
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=S6qf1tRiTUaNQFqSaXKHWOt7ihfDSEC6v88r0DsGt3M=; b=FYcZCiF43jWn3QZv2ocDy/Xirc
	6zT6APbSo0c4ttOl9m/xtTDQVpV73L4lQ72wSLhFjbhUdpWAHY/7RwP/3c7DxmJx/B1c/MMMGQd0+
	8Q5vG73DniZcCnMYpvnca+AYzcbu/wtBNZXoU7YjYyiSa2/aw5sUlvfy2zhrt8XfHAVj9kC1VJ8kL
	W3eVxe/nnxuGs2cMK4KCBVjSIILjZQ+P2QYg0kJXnpEtF6LBJRH2cWIhptUJrrYSTH1K2dJCIeECl
	gHxhI62figNQmcO/1sPA8DD2AUwt/p1/2VI/ldHOUzhP6KGT2lIkh9ROsFmw0DndbMMYj94Pn9/od
	2QSi9ksQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGJ3-0000000Bj25-137X;
	Fri, 06 Nov 2026 09:32:21 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGIt-0000000BipA-44IE
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 09:32:19 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6F94E1A0C32;
	Fri,  6 Nov 2026 09:32:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 42DF65FFBC;
	Fri,  6 Nov 2026 09:32:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9238A10329258;
	Fri,  6 Nov 2026 10:31:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793957526; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=r8to7uUebSCnf0zunQqvwVepFOpmM8Tnf1sXmdneWKU=;
	b=OQyJWD9xuTkSU5khP8Rf0sWaL1PR/MwXKZba/rv5SX1Fgk6aWj+Dn3G0YZsUOdbGj0XvF4
	3G7C0QycFmCVBYiqPj+hSWTrwhN2Y2qbo74SyO/mIeZQZuohSamG5BIqezzDsnvCOtv2nh
	VpB9uJcJaOTkNmhHRQETLejawaipp/djMPDc+8HO09RJM5z9us6ZSn78ZVDfQ00c6K57cX
	WFhr+4okRFPTsmA/eaj36cyrKNTeLbwOLfFz0V8f0h+/x3Qi1TFNckEw7Z6fvxrxmx2ao7
	xgkLmDitwwhnCORZDtqEPnK7CiyGv8zvUMqQGN3BujwvujCznAQht8uom9kOZg==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Fri, 06 Nov 2026 10:30:10 +0100
Subject: [PATCH 13/25] dt-bindings: usb: dwc2: add Metanoia MT2824
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261106-mt2824-v1-13-86087eaf5af4@bootlin.com>
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
X-CRM114-CacheID: sfid-20261106_013212_187367_C65C7DB6 
X-CRM114-Status: UNSURE (   7.70  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RG9jdW1lbnQgdGhlIG1ldGFub2lhLG10MjgyNC11c2IgY29tcGF0aWJsZSwgd2hpY2ggZmFsbHMg
YmFjayB0byB0aGUKZ2VuZXJpYyBzbnBzLGR3YzIgYmluZGluZywgc28gdGhhdCB0aGUgRFdDMiBV
U0IgY29udHJvbGxlciBvbiB0aGUgTWV0YW5vaWEKTVQyODI0IFNvQyBjYW4gYmUgZGVzY3JpYmVk
IGluIGRldmljZSB0cmVlcy4KCk9yaWdpbmFsbHktYnk6IEp1biBDaGFuZyA8anVuLmNoYW5nQG1l
dGFub2lhLWNvbW0uY29tPgpTaWduZWQtb2ZmLWJ5OiBCZW5vw650IE1vbmluIDxiZW5vaXQubW9u
aW5AYm9vdGxpbi5jb20+Ci0tLQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Vz
Yi9kd2MyLnlhbWwgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAt
LWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvZHdjMi55YW1sIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9kd2MyLnlhbWwKaW5kZXggNmMz
YTEwOTkxYjhiLi44OThjODNlNTc4NDMgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy91c2IvZHdjMi55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy91c2IvZHdjMi55YW1sCkBAIC01NSw2ICs1NSw3IEBAIHByb3BlcnRpZXM6CiAg
ICAgICAgICAgICAgIC0gYW1sb2dpYyxtZXNvbi1nMTJhLXVzYgogICAgICAgICAgICAgICAtIGFt
bG9naWMsbWVzb24tYTEtdXNiCiAgICAgICAgICAgICAgIC0gaW50ZWwsc29jZnBnYS1hZ2lsZXgt
aHNvdGcKKyAgICAgICAgICAgICAgLSBtZXRhbm9pYSxtdDI4MjQtdXNiCiAgICAgICAgICAgLSBj
b25zdDogc25wcyxkd2MyCiAgICAgICAtIGNvbnN0OiBhbWNjLGR3Yy1vdGcKICAgICAgIC0gY29u
c3Q6IGFwbSxhcG04MjE4MS1kd2Mtb3RnCgotLSAKMi41Ni4wCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
