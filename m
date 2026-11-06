Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B312A6082BD4
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 09:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sGGtm9/C;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=wzk0AKUh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gw/JyyBvj8XHvupB5rwj0Sc1Z0Jj0G4TPXoezRvHaFo=; b=sGGtm9/CLGD0Fi7Gq8Dn5yfSt2
	bn7twrzKLADtoQE4Fu0oXbKNza4ndM26AIbLbiIhXJIoN1O5i2v5gYJMLS5K6W0hZwka4+LrkWCBa
	cBWrkeDDuVSVV+fu26RteKMhgOA8moi5yTOP1h90nfH0r/7L85p6I/UwXD5ymusrVJKGzuPQppZza
	3m79tGyyldC5Ru6TEKEzp7Qrtpy0T+ToaNXdglguO3pH6+VW7Fbt5wEXyNo+EZMzJsUbKZCH1Bqe8
	vzk4DZj0JDNRP9t0scoCtWMtU0lLhBawqRB9cEXTY/WXsYrO+DMoRzq4hxlE/K0vI4SzZg3tlZJFp
	MnCDwmYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGIv-0000000Bis5-0JTH;
	Fri, 06 Nov 2026 09:32:13 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGIn-0000000BihA-03td;
	Fri, 06 Nov 2026 09:32:11 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4D4E24E413E9;
	Fri,  6 Nov 2026 09:32:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 207F95FFBC;
	Fri,  6 Nov 2026 09:32:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AC820103292DF;
	Fri,  6 Nov 2026 10:31:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793957519; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6dIjK3KQyPYo7BGeihqe5v2Q2WzvnIFuvucFmY8UZiM=;
	b=wzk0AKUhHtXWvefoMAkphBOjTffVQzMnfddS4ZbG16AEUdu4SGMZCgxM1nEu40Kovb0ZbB
	iiLRa03CunEJO+Gevda0SIEUaPwlx8z9towgjqw1NDpmIbPJZPdFIs6dpV/D0R2jjvZUsY
	6sf+galb57+IV19d56T/C04vO/3WBIGf93TBBVoy1qHZAn57/yK8985rTav7wfm3pB4ew4
	Tyb9hTHbz8Pgu8snCkrUXvWIhuir5xo/wPaNKJg9be66FdvG0Wc1+G9ltqQZ/YHxpb74Gr
	8KVzL7vI6mKbgG14ahBCIhzqaxnuCA440p6LVcxQKW3fJ4nbA10u11XVAvcYlg==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Fri, 06 Nov 2026 10:30:09 +0100
Subject: [PATCH 12/25] dt-bindings: spi: andestech,ae350-spi: add Metanoia
 MT2824
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261106-mt2824-v1-12-86087eaf5af4@bootlin.com>
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
X-CRM114-CacheID: sfid-20261106_013205_202953_23593B23 
X-CRM114-Status: UNSURE (   7.45  )
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

VGhlIE1ldGFub2lhIE1UMjgyNCBpbnRlZ3JhdGVzIHRoZSBBbmRlcyBBVENTUEkyMDAgU1BJIGNv
bnRyb2xsZXIuIEFkZAppdHMgY29tcGF0aWJsZSBzdHJpbmcsIHdpdGggYW5kZXN0ZWNoLGFlMzUw
LXNwaSBhcyBhIGZhbGxiYWNrLgoKT3JpZ2luYWxseS1ieTogSnVuIENoYW5nIDxqdW4uY2hhbmdA
bWV0YW5vaWEtY29tbS5jb20+ClNpZ25lZC1vZmYtYnk6IEJlbm/DrnQgTW9uaW4gPGJlbm9pdC5t
b25pbkBib290bGluLmNvbT4KLS0tCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
c3BpL2FuZGVzdGVjaCxhZTM1MC1zcGkueWFtbCB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3NwaS9hbmRlc3RlY2gsYWUzNTAtc3BpLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3Mvc3BpL2FuZGVzdGVjaCxhZTM1MC1zcGkueWFtbAppbmRleCA5MWUwNGY1ZDM1NGEu
LjZlNWRkODE3NWFhOSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3NwaS9hbmRlc3RlY2gsYWUzNTAtc3BpLnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3NwaS9hbmRlc3RlY2gsYWUzNTAtc3BpLnlhbWwKQEAgLTE1LDYgKzE1
LDcgQEAgcHJvcGVydGllczoKICAgICAgIC0gaXRlbXM6CiAgICAgICAgICAgLSBlbnVtOgogICAg
ICAgICAgICAgICAtIGFuZGVzdGVjaCxxaWxhaS1zcGkKKyAgICAgICAgICAgICAgLSBtZXRhbm9p
YSxtdDI4MjQtc3BpCiAgICAgICAgICAgLSBjb25zdDogYW5kZXN0ZWNoLGFlMzUwLXNwaQogICAg
ICAgLSBjb25zdDogYW5kZXN0ZWNoLGFlMzUwLXNwaQogCgotLSAKMi41Ni4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
