Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596E260A6F50
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 09:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=whFxYSD9;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Uaf1vubf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tFf7OKY3P9TGgX0ZZ98CD0OWEVY/EIa0QeGpnurb70k=; b=whFxYSD9WFm9e+/cSceOwWkfmp
	n4ggv1R4gc1JU/WLOSFELw/v6DJmssE4hSqQ0zOiIn8wUmIjN/UHOO4wTrU6L9kiEKlyArHUqA1dj
	kl4nopc7qZTEjG+fO8etGxzXdLe8UgyTN/zZvCR5VsWTqzW4gNV6BOeF8lGgt2OvF4yWwHheLRmvH
	l9nhVRV08g9egk5Aq7owBLThyX9s4vjLNaUVkdOQ/1++POG6oyA1aHOsi5GJ4zvs46pRbInLY+e7S
	ZICQKQkcmGuCG/l6Bv9CGMyEsryDppAoz3KclmoI3V5LmqLwogMDVhVqP4Zge0kc7R6BaPWZ4CkDl
	ZhHlnHlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGKH-0000000BkGE-0KyA;
	Fri, 06 Nov 2026 09:33:37 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGK7-0000000Bk77-3spO;
	Fri, 06 Nov 2026 09:33:35 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 25F7B1A0C32;
	Fri,  6 Nov 2026 09:33:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E4EFA5FFBC;
	Fri,  6 Nov 2026 09:33:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B3588103292D0;
	Fri,  6 Nov 2026 10:33:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793957601; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0RogQ1G8sFuPL4PUjnb7jbOVpQtH3Ea/HTCj2EHRcDU=;
	b=Uaf1vubft392vPUEjlPdiMsZOXqUx6YcjaNdJ6p3x71SBq3oR9yiRAxW4XuNGO2+I3cy5/
	xCdXEiUPFsvXH+DW4t1Q0nVTKI9mTypDWwM2zzwnaZgSAl0YYQ4VEifZekZUbUwnYQ4I/t
	t/R9ycpAa+PqV1atzdc2SUaTRMl0AptT7KA/9SVgDXHIggncDS00AgGu3ewNW+2vXz8OKl
	7IBsjqnUA+9nOiMGrKu4PHINaP4cUqqWD58XXdw3HIYHRPXLziVVsXEB+GjZ++K9z9cowm
	2PCEOJ1VF7VPFaM//4fa+tRwJu4VfJh5vDEne/AYyFqPXTzqIUCURQPX36MINA==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Fri, 06 Nov 2026 10:30:20 +0100
Subject: [PATCH 23/25] usb: dwc2: add support for Metanoia MT2824
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261106-mt2824-v1-23-86087eaf5af4@bootlin.com>
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
X-CRM114-CacheID: sfid-20261106_013328_113211_15904118 
X-CRM114-Status: UNSURE (   9.77  )
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

QWRkIGNvcmUgcGFyYW1ldGVycyBmb3IgdGhlIE1ldGFub2lhIE1UMjgyNCBEV0MyIGNvbnRyb2xs
ZXI6IGhpZ2gtc3BlZWQKVVRNSSBQSFksIG5vIGhvc3QgRE1BLCBhbmQgbm8gT1RHIEhOUC9TUlAg
c3VwcG9ydC4KCk9yaWdpbmFsbHktYnk6IEp1biBDaGFuZyA8anVuLmNoYW5nQG1ldGFub2lhLWNv
bW0uY29tPgpTaWduZWQtb2ZmLWJ5OiBCZW5vw650IE1vbmluIDxiZW5vaXQubW9uaW5AYm9vdGxp
bi5jb20+Ci0tLQogZHJpdmVycy91c2IvZHdjMi9wYXJhbXMuYyB8IDEzICsrKysrKysrKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy91
c2IvZHdjMi9wYXJhbXMuYyBiL2RyaXZlcnMvdXNiL2R3YzIvcGFyYW1zLmMKaW5kZXggMDkxYmZj
ZmVmNzUzLi5kNmE2YTU4MWQwMjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdXNiL2R3YzIvcGFyYW1z
LmMKKysrIGIvZHJpdmVycy91c2IvZHdjMi9wYXJhbXMuYwpAQCAtMzAzLDYgKzMwMywxNyBAQCBz
dGF0aWMgdm9pZCBkd2MyX3NldF9zdG0zMm1wMTVfaHNvdGdfcGFyYW1zKHN0cnVjdCBkd2MyX2hz
b3RnICpoc290ZykKIAlwLT5oaXJkX3RocmVzaG9sZF9lbiA9IGZhbHNlOwogfQogCitzdGF0aWMg
dm9pZCBkd2MyX3NldF9tZXRhbm9pYV9tdDI4MjRfcGFyYW1zKHN0cnVjdCBkd2MyX2hzb3RnICpo
c290ZykKK3sKKwlzdHJ1Y3QgZHdjMl9jb3JlX3BhcmFtcyAqcCA9ICZoc290Zy0+cGFyYW1zOwor
CisJcC0+b3RnX2NhcHMuaG5wX3N1cHBvcnQgPSBmYWxzZTsKKwlwLT5vdGdfY2Fwcy5zcnBfc3Vw
cG9ydCA9IGZhbHNlOworCXAtPnNwZWVkID0gRFdDMl9TUEVFRF9QQVJBTV9ISUdIOworCXAtPmhv
c3RfZG1hID0gZmFsc2U7CisJcC0+cGh5X3R5cGUgPSBEV0MyX1BIWV9UWVBFX1BBUkFNX1VUTUk7
Cit9CisKIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgZHdjMl9vZl9tYXRjaF90YWJsZVtdID0g
ewogCXsgLmNvbXBhdGlibGUgPSAiYnJjbSxiY20yODM1LXVzYiIsIC5kYXRhID0gZHdjMl9zZXRf
YmNtX3BhcmFtcyB9LAogCXsgLmNvbXBhdGlibGUgPSAiaGlzaWxpY29uLGhpNjIyMC11c2IiLCAu
ZGF0YSA9IGR3YzJfc2V0X2hpc19wYXJhbXMgfSwKQEAgLTM0Nyw2ICszNTgsOCBAQCBjb25zdCBz
dHJ1Y3Qgb2ZfZGV2aWNlX2lkIGR3YzJfb2ZfbWF0Y2hfdGFibGVbXSA9IHsKIAkgIC5kYXRhID0g
ZHdjMl9zZXRfc3RtMzJtcDE1X2hzb3RnX3BhcmFtcyB9LAogCXsgLmNvbXBhdGlibGUgPSAiaW50
ZWwsc29jZnBnYS1hZ2lsZXgtaHNvdGciLAogCSAgLmRhdGEgPSBkd2MyX3NldF9zb2NmcGdhX2Fn
aWxleF9wYXJhbXMgfSwKKwl7IC5jb21wYXRpYmxlID0gIm1ldGFub2lhLG10MjgyNC11c2IiLAor
CSAgLmRhdGEgPSBkd2MyX3NldF9tZXRhbm9pYV9tdDI4MjRfcGFyYW1zIH0sCiAJe30sCiB9Owog
TU9EVUxFX0RFVklDRV9UQUJMRShvZiwgZHdjMl9vZl9tYXRjaF90YWJsZSk7CgotLSAKMi41Ni4w
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
