Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6659606A337
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 09:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h1QAnYmV;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Ga3m9oBj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=769RhXUYk1j/O/ggpZBt6ca5GxnFbH0YnUNMdNyUIS4=; b=h1QAnYmVUWpnrVtg3TCYx882W9
	YID8BEzVZFCX0OKS0mtyt+pW1+NnMYRMJmLhncgXyzlOVRMTW3bG1KGQjdukCjawtCoW65aT4rJ3h
	aQTZT4fu1PgYjM7naFdaXiNTImkVOacvuQ06D9e5eDNu37+Myc5tYPruds2lLs73yvLgoOXLQF+Hz
	76G8cOA86hBReeQULgUudsQNS6fH6Uu2roZ9xAM4Ew7RSsZVWFyYQVCFAlIGQMFaKGT7o/Cf1PvTP
	burw8WEF65ohwU6MvWwkW3F1ci6gMlTUiZqUOdoGzl2BEn+UWay4ffgHmujLbbcpYyQDu3iCTDQNS
	Dju5mfJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGHq-0000000Bi0q-33vr;
	Fri, 06 Nov 2026 09:31:06 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGHn-0000000BhyP-2ENF
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 09:31:05 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D219AC69166;
	Fri,  6 Nov 2026 09:30:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 546585FFBC;
	Fri,  6 Nov 2026 09:31:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 78C59103292CA;
	Fri,  6 Nov 2026 10:30:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793957457; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9vU5fdChaB/2EW4T7XT51RLH1JOXsXIxQ5nWQ34YmVs=;
	b=Ga3m9oBjGIO5fOzDiTypkUtk2v53a1A13ExnNdsT9EXmnOO21NBoRNKKePIfbHQwTtdGgr
	S7uKPnMVyH4p/gCvWEqoXwYs3JXYleFYdbyM6nHgOYHLzEAfrqA9dV0mpYmhpeoNphSV6h
	3nW8cOEtrGXiKx3pdmXe9n0hPySYuw69viw0BG8XgRwzLek9hMvKkjrlDeN8NG/Lah/0Ff
	XxkrfuURApKzFnbFv2/8/qeGzMTN4wJ4Uxuu4OWvqYqJDZKRJurBPLni/vNHoej574NZc4
	XQOyLK4nILUARntumPj6sA/UySMzdhu/99ANFFqrRggQcmnuGYiZXy4BKFms7w==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Fri, 06 Nov 2026 10:30:00 +0100
Subject: [PATCH 03/25] dt-bindings: reset: add Metanoia MT2824
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261106-mt2824-v1-3-86087eaf5af4@bootlin.com>
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
X-CRM114-CacheID: sfid-20261106_013103_740344_FE13A4B2 
X-CRM114-Status: UNSURE (   9.80  )
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

RG9jdW1lbnQgdGhlIE1ldGFub2lhIE1UMjgyNCByZXNldCBjb250cm9sbGVyLCB3aGljaCBwcm92
aWRlcyB3YXJtIHJlc2V0CmFuZCBzeXN0ZW0gcmVzZXQgY29udHJvbHMgdGhyb3VnaCBtZW1vcnkt
bWFwcGVkIHJlZ2lzdGVycy4KCk9yaWdpbmFsbHktYnk6IEp1biBDaGFuZyA8anVuLmNoYW5nQG1l
dGFub2lhLWNvbW0uY29tPgpTaWduZWQtb2ZmLWJ5OiBCZW5vw650IE1vbmluIDxiZW5vaXQubW9u
aW5AYm9vdGxpbi5jb20+Ci0tLQogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcmVzZXQvbWV0YW5v
aWEscmVzZXQueWFtbCAgfCA0MCArKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgNDAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9yZXNldC9tZXRhbm9pYSxyZXNldC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3Jlc2V0L21ldGFub2lhLHJlc2V0LnlhbWwKbmV3IGZpbGUgbW9kZSAx
MDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi5mMTY5ZDFmYTkxOWMKLS0tIC9kZXYvbnVsbAorKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVzZXQvbWV0YW5vaWEscmVzZXQu
eWFtbApAQCAtMCwwICsxLDQwIEBACisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIu
MC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKKyVZQU1MIDEuMgorLS0tCiskaWQ6IGh0dHA6Ly9kZXZp
Y2V0cmVlLm9yZy9zY2hlbWFzL3Jlc2V0L21ldGFub2lhLHJlc2V0LnlhbWwjCiskc2NoZW1hOiBo
dHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKKwordGl0bGU6IE1l
dGFub2lhIFJlc2V0IENvbnRyb2xsZXIKKworbWFpbnRhaW5lcnM6CisgIC0gSnVuIENoYW5nIDxq
dW4uY2hhbmdAbWV0YW5vaWEtY29tbS5jb20+CisKK2Rlc2NyaXB0aW9uOgorICBNZXRhbm9pYSBy
ZXNldCBjb250cm9sbGVycyBwcm92aWRlIHdhcm0tcmVzZXQgYW5kIHN5c3RlbSByZXNldCBjb250
cm9scworICB2aWEgbWVtb3J5LW1hcHBlZCByZWdpc3RlcnMuCisKK3Byb3BlcnRpZXM6CisgIGNv
bXBhdGlibGU6CisgICAgZW51bToKKyAgICAgIC0gbWV0YW5vaWEsbXQyODI0LXJlc2V0CisKKyAg
cmVnOgorICAgIG1heEl0ZW1zOiAxCisKKyAgIiNyZXNldC1jZWxscyI6CisgICAgY29uc3Q6IDEK
KworcmVxdWlyZWQ6CisgIC0gY29tcGF0aWJsZQorICAtIHJlZworICAtICIjcmVzZXQtY2VsbHMi
CisKK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQorCitleGFtcGxlczoKKyAgLSB8CisgICAg
cnN0OiByc3QtY29udHJvbGxlckAxMDAwMDAwYyB7CisgICAgICAgIGNvbXBhdGlibGUgPSAibWV0
YW5vaWEsbXQyODI0LXJlc2V0IjsKKyAgICAgICAgcmVnID0gPDB4MTAwMDAwMGMgMHg0PjsKKyAg
ICAgICAgI3Jlc2V0LWNlbGxzID0gPDE+OworICAgIH07CgotLSAKMi41Ni4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
