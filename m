Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155C6606A32F
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 09:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iQWoYwb9;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=CnxHq/U2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AXMZ+LYKpzCLsUcdHbeOyjnGWYsq23j2nLMYFBIfjdg=; b=iQWoYwb960XtGi6ZFM4C/I6Cjn
	x/dAYtAfPFhQGKAy788c1Bu9dJ6hl7bQX1qFygsOXTH2nV/LC1RFi4fj03IdqI/QzOMkVuHeZ+ERd
	pbwTBqXA7cSRby32bHIRb7Opagfu7QRZ/F+BamafuBq18q0QHRmiQFaSp1ufpZL6Xh8gN/sdV82U1
	PYIWaasm3ifoBFQzlxlINTEwdvohtF8FF4fIUFgWBsOqWUBd1jclNobEqAZs4Js7df0kraQw2y4/v
	hZBRlIrtfz0wag1a/HNxYLC4672EWYmgMi1WQxa7ZRNHgkHWA7HOjFebMltvD2oRIlIl9uiY6ZJPi
	8Wm6aTJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGI3-0000000Bi7f-1pXt;
	Fri, 06 Nov 2026 09:31:19 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGHz-0000000Bi5V-44rW
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 09:31:18 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id AB0CFC69166;
	Fri,  6 Nov 2026 09:31:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2E3A95FFBC;
	Fri,  6 Nov 2026 09:31:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4FCCB103292DE;
	Fri,  6 Nov 2026 10:31:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793957470; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Rmm2T837u6dJV1SdY4aEJnvjZ90dwHMyQK/XGmxJ8Z0=;
	b=CnxHq/U2S7LWHHBVur1CL8xQ66beHxCokAadstTZzGIqQZip3L+k0p1km6vxeiEtmL//ax
	CVYNIoiChcz11k2ixYMfnyX3GUUVl0X0a3zCcTQ5VpEdRwDluYpJM2OuBr8pYhDnBXy6XQ
	QU1+B5b/JCq+TAOWdbtCreuN2iFkbjy/kt+Fa5KMmmm8pp6hBhWDPt9HkXO27O4RfeERzu
	UGo6L1ESUHN3t6LtkpofKpNavxeMt1lXCvz99igo0vE+DNvrhLbqXXlX9M3hhwPrtMlhh6
	J6bWyvlzNth9aayy/7nZEsMKVDBrMO8LxTpCbZCPcmD0whhASwOmgZ9AMWxEjA==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Fri, 06 Nov 2026 10:30:02 +0100
Subject: [PATCH 05/25] dt-bindings: phy: add Metanoia USB2 PHY
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261106-mt2824-v1-5-86087eaf5af4@bootlin.com>
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
X-CRM114-CacheID: sfid-20261106_013116_177916_230F168E 
X-CRM114-Status: GOOD (  10.26  )
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

RG9jdW1lbnQgdGhlIFVTQjIgUEhZIGZvdW5kIGluIE1ldGFub2lhIE1UMjgyNCBTb0MuCgpPcmln
aW5hbGx5LWJ5OiBKdW4gQ2hhbmcgPGp1bi5jaGFuZ0BtZXRhbm9pYS1jb21tLmNvbT4KU2lnbmVk
LW9mZi1ieTogQmVub8OudCBNb25pbiA8YmVub2l0Lm1vbmluQGJvb3RsaW4uY29tPgotLS0KIC4u
Li9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9tZXRhbm9pYSx1c2IyLXBoeS55YW1sIHwgNDMgKysr
KysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDQzIGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L21ldGFub2lh
LHVzYjItcGh5LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L21l
dGFub2lhLHVzYjItcGh5LnlhbWwKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAw
MDAwLi4wNjA1ZTZkMGY2N2QKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvcGh5L21ldGFub2lhLHVzYjItcGh5LnlhbWwKQEAgLTAsMCArMSw0MyBA
QAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVz
ZQorJVlBTUwgMS4yCistLS0KKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvcGh5
L21ldGFub2lhLHVzYjItcGh5LnlhbWwjCiskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcv
bWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKKwordGl0bGU6IE1ldGFub2lhIFVTQjIgUEhZCisKK2Rl
c2NyaXB0aW9uOiB8CisgIFRoZSBNZXRhbm9pYSBNVDI4MjQgVVNCMiBQSFkgaXMgY29udHJvbGxl
ZCBzb2xlbHkgdGhyb3VnaCBhIHJlc2V0IGxpbmUuCisKK21haW50YWluZXJzOgorICAtIEp1biBD
aGFuZyA8anVuLmNoYW5nQG1ldGFub2lhLWNvbW0uY29tPgorCitwcm9wZXJ0aWVzOgorICBjb21w
YXRpYmxlOgorICAgIGNvbnN0OiBtZXRhbm9pYSxtdDI4MjQtdXNiMi1waHkKKworICByZXNldHM6
CisgICAgbWF4SXRlbXM6IDEKKworICByZXNldC1uYW1lczoKKyAgICBjb25zdDogdXNiMi1waHkK
KworICAiI3BoeS1jZWxscyI6CisgICAgY29uc3Q6IDAKKworcmVxdWlyZWQ6CisgIC0gY29tcGF0
aWJsZQorICAtIHJlc2V0cworICAtIHJlc2V0LW5hbWVzCisgIC0gIiNwaHktY2VsbHMiCisKK2Fk
ZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQorCitleGFtcGxlczoKKyAgLSB8CisgICAgdXNiMnBo
eTogdXNiMi1waHktcmVzZXQgeworICAgICAgICBjb21wYXRpYmxlID0gIm1ldGFub2lhLG10Mjgy
NC11c2IyLXBoeSI7CisgICAgICAgICNwaHktY2VsbHMgPSA8MD47CisgICAgICAgIHJlc2V0cyA9
IDwmcnN0IDE4PjsKKyAgICAgICAgcmVzZXQtbmFtZXMgPSAidXNiMi1waHkiOworICAgIH07Cgot
LSAKMi41Ni4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
