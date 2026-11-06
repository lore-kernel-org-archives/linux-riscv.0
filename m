Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64307606EE96
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 09:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LAKwJY/j;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=afgbf5zi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=E8swaiOvXegkKjzp4ij8XsvDUhYeG7RpU5zQjVqcLYE=; b=LAKwJY/j5gTQjvn+Wc3aK0vqaG
	9wCybAWNq8RudESDK3wpKFQZWLt3SItBPxtUTFspBZAonfRi+maYHz7Smv1JNL17N6mbnL24dcwBv
	cgJS7G16CHtcyD6rPuVKsi79hu64IpyYdiKJWk1HJE6VJvEpMOxhBnLh3pvphfyLzLjlQOyzQ4Wuf
	kp/VIy8BoMVL7nRxgEDAPE2K8oUgAeLDOc+G/PzIbwwV5mqOepy3kDMxpcM1u08ZtTlbq0l170F15
	+V3czjTokLzoIq80QT0VYxeF+EWHHwb1HITb1NC1ydRz3GMytGnIAUYlWU+ReW4UW8S7FbbUlQ52R
	iPVJpQvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGIO-0000000BiMN-2rfm;
	Fri, 06 Nov 2026 09:31:40 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGIK-0000000BiIy-3DwC
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 09:31:39 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EB1621A0C32;
	Fri,  6 Nov 2026 09:31:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BEC8C5FFBC;
	Fri,  6 Nov 2026 09:31:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3D770103292CA;
	Fri,  6 Nov 2026 10:31:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793957491; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dGYVs8TEgGGOAbRpdMbC6rjsIyrgh7PeAJahuuixs7Y=;
	b=afgbf5ziCJaaBa6xX8Lhcriicf+ABvhzX1xI/3iuH1iI3bEnyB49sarXE2LXNlcaLL92pd
	IJ1hHRgtEDuTrTvdIBWMEOoLIvG+5ZsdzDYtUqxdPAQDIqYXFZ43DdC3zfOojqugJd9sCx
	ZgxroG8raOwWge2Jn+Sa0gyXkjTCWizM1G5OojdlmmmbowfI0A1UPnt0UNAuTbCMX2v8Oy
	vvwxRfy6Y0oCTcdBvw0VVZqQgQlBXOIlzDeiOmw2rpeiUxHlw6lgVgTf5BqDOGB0lHV/xR
	YgaO4Q1ns/9XXTaoHAJHJkmjxCbykJd9o8qyjjQ4Fy5IMl5LiLNk4j02Artfxg==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Fri, 06 Nov 2026 10:30:05 +0100
Subject: [PATCH 08/25] dt-bindings: interrupt-controller: andestech,plicsw:
 add Metanoia MT2824
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261106-mt2824-v1-8-86087eaf5af4@bootlin.com>
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
X-CRM114-CacheID: sfid-20261106_013136_971962_FC9B5E24 
X-CRM114-Status: UNSURE (   7.47  )
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

VGhlIE1ldGFub2lhIE1UMjgyNCBpbnRlZ3JhdGVzIHRoZSBBbmRlcyBQTElDU1cgc29mdHdhcmUg
aW50ZXJydXB0CmNvbnRyb2xsZXIuIEFkZCBpdHMgY29tcGF0aWJsZSBzdHJpbmcsIHdpdGggYW5k
ZXN0ZWNoLHBsaWNzdyBhcyBhCmZhbGxiYWNrLgoKT3JpZ2luYWxseS1ieTogSnVuIENoYW5nIDxq
dW4uY2hhbmdAbWV0YW5vaWEtY29tbS5jb20+ClNpZ25lZC1vZmYtYnk6IEJlbm/DrnQgTW9uaW4g
PGJlbm9pdC5tb25pbkBib290bGluLmNvbT4KLS0tCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9p
bnRlcnJ1cHQtY29udHJvbGxlci9hbmRlc3RlY2gscGxpY3N3LnlhbWwgICAgICAgfCAxICsKIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9hbmRlc3RlY2gscGxpY3N3
LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW50ZXJydXB0LWNvbnRy
b2xsZXIvYW5kZXN0ZWNoLHBsaWNzdy55YW1sCmluZGV4IGViMmViNjExYWMwOS4uYTYxZmU3Y2E5
MDIzIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW50ZXJy
dXB0LWNvbnRyb2xsZXIvYW5kZXN0ZWNoLHBsaWNzdy55YW1sCisrKyBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9hbmRlc3RlY2gscGxpY3N3
LnlhbWwKQEAgLTIzLDYgKzIzLDcgQEAgcHJvcGVydGllczoKICAgICBpdGVtczoKICAgICAgIC0g
ZW51bToKICAgICAgICAgICAtIGFuZGVzdGVjaCxxaWxhaS1wbGljc3cKKyAgICAgICAgICAtIG1l
dGFub2lhLG10MjgyNC1wbGljc3cKICAgICAgIC0gY29uc3Q6IGFuZGVzdGVjaCxwbGljc3cKIAog
ICByZWc6CgotLSAKMi41Ni4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
