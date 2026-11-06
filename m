Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62363606D818
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 09:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zLfByKRM;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=sAClafF5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CTK3Ndpgv1X8f4m2wv0W8YYlby1ga11K0U2rYDWI/mc=; b=zLfByKRM89f2ciP7KeCSGrvW6p
	dWgc0qaTkq74qisRyIviYpkIpo06vVsQdsi1PdqPErNv83O/EiNtsNN72k4rJBe/Ke0c2+x0/jaIA
	nkj6uozbd0S99hJDwpVfPZ1kXzS9yU8ZP2Zjb8Y9pL4mDyCXLRuH5e6Te8852wYC+k852XoPbXg6r
	9aBLTPCXEUSVo8DuOr5oeVNeqb6Ol0NQMZId6XDtA8rl/rHI0JtsPAH1AXeESNKTMiZr4vK7ARvzO
	GFy8j8cvyJqp6D2OoCJCwPNY8+FhiVDNi1/LORJC9fgHwdDkLqS18aaoP+gIIvLQQfVOBUDK4AEVI
	mVrMtdHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGJm-0000000Bjmj-2xEs;
	Fri, 06 Nov 2026 09:33:06 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGJV-0000000BjXd-2Jjq;
	Fri, 06 Nov 2026 09:33:04 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D933B1A0C32;
	Fri,  6 Nov 2026 09:32:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AD7745FFBC;
	Fri,  6 Nov 2026 09:32:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 47C34103292D4;
	Fri,  6 Nov 2026 10:32:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793957562; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Ol6OqvAnjB6xNfgKd5K3xVXQwuxfqgePZ/x70MPMbZ0=;
	b=sAClafF5dOAezz7dC47i/OrkTOw5xuRmEWg/B2Tb0Xvd159zH95MYBixLzaDBC5N5mNhQT
	jstSxmvOV2z04dn6vh4WiExtwmuhvBHzQ4X3FtduoPQrh1M00nwCBYh28Nw6mp1gYQDMBN
	VyxHbCINp7inn+84os5RZPoj2oPnsGTwdKWn3bAgci6/H2GBKZr7UCRr9/k7CyudIHU6BS
	wNiR2yp+fnOPHqXd7QQyQLcgr6s5uggxpexyKbwbTV3GV5NjIqigpjI4+IQlZ/rVpb0pbY
	EaUPEDnchwYltFiX1832wqGLFlmUEg3U47Oa6N6ydbP3PuvZAvZsLFSZnNuhgA==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Fri, 06 Nov 2026 10:30:15 +0100
Subject: [PATCH 18/25] spi: atcspi200: allow building for Metanoia SoCs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261106-mt2824-v1-18-86087eaf5af4@bootlin.com>
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
X-CRM114-CacheID: sfid-20261106_013249_995137_C3256501 
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

VGhlIE1ldGFub2lhIE1UMjgyNCBpbnRlZ3JhdGVzIHRoZSBBbmRlcyBBVENTUEkyMDAgU1BJIGNv
bnRyb2xsZXIuIEFsbG93CnRoZSBkcml2ZXIgdG8gYmUgYnVpbHQgZm9yIEFSQ0hfTUVUQU5PSUEu
CgpPcmlnaW5hbGx5LWJ5OiBKdW4gQ2hhbmcgPGp1bi5jaGFuZ0BtZXRhbm9pYS1jb21tLmNvbT4K
U2lnbmVkLW9mZi1ieTogQmVub8OudCBNb25pbiA8YmVub2l0Lm1vbmluQGJvb3RsaW4uY29tPgot
LS0KIGRyaXZlcnMvc3BpL0tjb25maWcgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3NwaS9LY29uZmlnIGIv
ZHJpdmVycy9zcGkvS2NvbmZpZwppbmRleCA0OTA4OGU1ODg2ZDMuLmY4MTg4ZGUxYjgwMiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9zcGkvS2NvbmZpZworKysgYi9kcml2ZXJzL3NwaS9LY29uZmlnCkBA
IC0xNTIsNyArMTUyLDcgQEAgY29uZmlnIFNQSV9BUk1BREFfMzcwMAogCiBjb25maWcgU1BJX0FU
Q1NQSTIwMAogCXRyaXN0YXRlICJBbmRlcyBBVENTUEkyMDAgU1BJIGNvbnRyb2xsZXIiCi0JZGVw
ZW5kcyBvbiBBUkNIX0FOREVTIHx8IENPTVBJTEVfVEVTVAorCWRlcGVuZHMgb24gQVJDSF9BTkRF
UyB8fCBBUkNIX01FVEFOT0lBIHx8IENPTVBJTEVfVEVTVAogCWhlbHAKIAkgIFNQSSBkcml2ZXIg
Zm9yIEFuZGVzIEFUQ1NQSTIwMCBTUEkgY29udHJvbGxlci4KIAkgIEFUQ1NQSTIwMCBjb250cm9s
bGVyIHN1cHBvcnRzIERNQSBhbmQgUElPIG1vZGVzLiBXaGVuIERNQQoKLS0gCjIuNTYuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
