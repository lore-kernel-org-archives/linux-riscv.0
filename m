Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51C2606A329
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 09:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RGA65Ao2;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=X6vvRrWD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ExuanxE2myDKno9O661nLBymrmMITIz0u9P1E/m3meU=; b=RGA65Ao2K6RtGokRMsEdE6EptR
	iPgn1iiigEcu2QNHBOsQVHyZ0VuakKQ2XPV3FGFHH+ogF37+VQoYS16wiGn7PgMnRPw3Hm1cpaOsW
	mmfhGnNSTPBKSQrDAgA4DitsfMF1L6kWpJekgXtxnzwJO6U0k7Ew/KzsSFbNShr7uORwiNhRSTy1M
	isinxFoFxb2wsyjwc8nE5BOvphbNu2haY/WKO9eSFktpkItMwa9zqK6NRk5mrZUSXAWsEdSnkjWrF
	x2lZaLxC1W+YOGpZ+0bO9Qy7U5pRrJhzbinu8ZY8GBdpnwZu7rK7rdYqOQEN/5ocbQ1yRSUzr9OjP
	mo8ZtLtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGId-0000000BiZu-1XsT;
	Fri, 06 Nov 2026 09:31:55 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGIY-0000000BiSU-0Vz0
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 09:31:54 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9322A1A1350;
	Fri,  6 Nov 2026 09:31:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5A1B75FFBC;
	Fri,  6 Nov 2026 09:31:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BF23910329258;
	Fri,  6 Nov 2026 10:31:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793957505; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/f+A9Mb+Dr9AA8h+IGk0mm9hM1KIlwRpJwCcjc3IH3E=;
	b=X6vvRrWDCBaEUkbIvoytSa35YPFuDIC8UF+uAHCLPrAdeiYysSLWa9DpcOc1UbsOI3f6xE
	nAIdK7YzElV0hpqezo21aqyGgqH9RIy3DuWBwILOnYdjnpoke1PZ1wfSukm657h2Y7irik
	A3EGcqQgODDTbQGvejpsfVNeIFuV9wkUEvZiCKa+Lf5r8LCfuDPM/nmdtyRsmTID9HAg8l
	JJipIhMiUR1xrSgQvdIrn36NfvOk9/5OG9WXS1+WUwDyoT0prQegBOe3htG9kenjvf80RD
	5gxrGzgN6wQM6Z0hm9Fab/I7GRxv7ybOWpN0JO0K2LCa/nabBakNbECFRAfong==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Fri, 06 Nov 2026 10:30:07 +0100
Subject: [PATCH 10/25] dt-bindings: mmc: snps,dwcmshc-sdhci: add Metanoia
 MT2824
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261106-mt2824-v1-10-86087eaf5af4@bootlin.com>
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
X-CRM114-CacheID: sfid-20261106_013150_423414_093B4C44 
X-CRM114-Status: UNSURE (   7.19  )
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

VGhlIE1ldGFub2lhIE1UMjgyNCBpbnRlZ3JhdGVzIHRoZSBTeW5vcHN5cyBEZXNpZ25XYXJlIE1v
YmlsZSBTdG9yYWdlCkhvc3QgQ29udHJvbGxlciBmb3IgZU1NQy9TRC4gQWRkIGl0cyBjb21wYXRp
YmxlIHN0cmluZy4KCk9yaWdpbmFsbHktYnk6IEp1biBDaGFuZyA8anVuLmNoYW5nQG1ldGFub2lh
LWNvbW0uY29tPgpTaWduZWQtb2ZmLWJ5OiBCZW5vw650IE1vbmluIDxiZW5vaXQubW9uaW5AYm9v
dGxpbi5jb20+Ci0tLQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9zbnBz
LGR3Y21zaGMtc2RoY2kueWFtbCB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
CgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9zbnBz
LGR3Y21zaGMtc2RoY2kueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
bWMvc25wcyxkd2Ntc2hjLXNkaGNpLnlhbWwKaW5kZXggY2Q4MjNhM2VmMjEzLi4wZWJkMGY5YzFk
NjIgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tbWMvc25w
cyxkd2Ntc2hjLXNkaGNpLnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL21tYy9zbnBzLGR3Y21zaGMtc2RoY2kueWFtbApAQCAtMjYsNiArMjYsNyBAQCBwcm9wZXJ0
aWVzOgogICAgICAgICAgIC0gY2FuYWFuLGsyMzAtZW1tYwogICAgICAgICAgIC0gY2FuYWFuLGsy
MzAtc2RpbwogICAgICAgICAgIC0gaHBlLGdzYy1kd2Ntc2hjCisgICAgICAgICAgLSBtZXRhbm9p
YSxtdDI4MjQtZHdjbXNoYwogICAgICAgICAgIC0gcm9ja2NoaXAscmszNTY4LWR3Y21zaGMKICAg
ICAgICAgICAtIHJvY2tjaGlwLHJrMzU4OC1kd2Ntc2hjCiAgICAgICAgICAgLSBzbnBzLGR3Y21z
aGMtc2RoY2kKCi0tIAoyLjU2LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
