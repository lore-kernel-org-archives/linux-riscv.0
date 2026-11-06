Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182A46082BE6
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 09:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=40fvRowj;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Ck/X1cu3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=39R97wqIh2ujDKoWr5H4NDdhUYGjFz4JcJV9DVhN/GE=; b=40fvRowj89Ksi+cMnGYna0GOBb
	2fmt/+Qtin2UGye9P51IieYezONBZJ5j30Lcdt25y6sDEOR6I2bBlEPQvtykuy2OZJlYFyDJhT+SV
	RRmFJsA6mZGkKwLPmBBeNtDr0uKCTKiKkOKVdPK+pqddnCuWzemJu5kn2Aex27R2wH1TFjCOQnXu3
	ms3DCS7pl1/PNMOvevVRFYfMr9sDQtPwD20S3QlHbee/MgIYOUOXAY559iiR9YfiJPIr3xOm3NjkH
	SjIOnkBuMCR/msILXASRjZ7PlF96o76+DJuplFFCs3tuXCjAdmDFyxvB1fIljLIsivvNt9kgUY8eG
	U8xelGgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGIG-0000000BiGL-1uZu;
	Fri, 06 Nov 2026 09:31:32 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGID-0000000BiD1-0qnx;
	Fri, 06 Nov 2026 09:31:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 867794E413E9;
	Fri,  6 Nov 2026 09:31:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 39EAF5FFBC;
	Fri,  6 Nov 2026 09:31:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 686F91032927D;
	Fri,  6 Nov 2026 10:31:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793957483; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3Nu3XMIEg/cqml8i7yqfb1ECUIOMCmZ+Oaq/WIoYvAA=;
	b=Ck/X1cu3CujjL339giAfni+c0D/WjBlDkh9RFU+2NwqCv6VpS8Ac1RQkroUyatj+1acT5u
	2RP0rlnu75p67mCrwylxlvTg5TfoSv08okFYHueFJ0A7X4tCU61dZiK81C+QPDNSaHH+1M
	GsmdxFtSfSEabf8uq/p9M1Kly0PiGxCzW2PBfGFBxT30MaSeM+CqZjFqeGgfp/52eE9an6
	Rs589G4aZug0RjAmrUehh3ebYuegh6wVyjvdfV8C5m4VcaepH+pH2272YtdxwtvkgVzPzl
	blozOSwzNRGlNvJN5JF1EdxgcGkrDQyRsTlSadh/D+gqmgsMcMPq1VvDMwakjw==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Fri, 06 Nov 2026 10:30:04 +0100
Subject: [PATCH 07/25] dt-bindings: interrupt-controller:
 sifive,plic-1.0.0: add Metanoia MT2824
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261106-mt2824-v1-7-86087eaf5af4@bootlin.com>
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
X-CRM114-CacheID: sfid-20261106_013130_041429_0C9553A6 
X-CRM114-Status: UNSURE (   7.25  )
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

VGhlIE1ldGFub2lhIE1UMjgyNCBpbnRlZ3JhdGVzIHRoZSBBbmRlcyBOQ0VQTElDMTAwIHBsYXRm
b3JtLWxldmVsCmludGVycnVwdCBjb250cm9sbGVyLiBBZGQgaXRzIGNvbXBhdGlibGUgc3RyaW5n
LCB3aXRoIGFuZGVzdGVjaCxuY2VwbGljMTAwCmFzIGEgZmFsbGJhY2suCgpPcmlnaW5hbGx5LWJ5
OiBKdW4gQ2hhbmcgPGp1bi5jaGFuZ0BtZXRhbm9pYS1jb21tLmNvbT4KU2lnbmVkLW9mZi1ieTog
QmVub8OudCBNb25pbiA8YmVub2l0Lm1vbmluQGJvb3RsaW4uY29tPgotLS0KIC4uLi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL3NpZml2ZSxwbGljLTEuMC4wLnlhbWwg
ICAgICB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL3Np
Zml2ZSxwbGljLTEuMC4wLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
aW50ZXJydXB0LWNvbnRyb2xsZXIvc2lmaXZlLHBsaWMtMS4wLjAueWFtbAppbmRleCBjZGU0YmI2
OTE4OTcuLmI3NmUyZmM0Y2M4OCAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL3NpZml2ZSxwbGljLTEuMC4wLnlhbWwKKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVy
L3NpZml2ZSxwbGljLTEuMC4wLnlhbWwKQEAgLTU0LDYgKzU0LDcgQEAgcHJvcGVydGllczoKICAg
ICAgIC0gaXRlbXM6CiAgICAgICAgICAgLSBlbnVtOgogICAgICAgICAgICAgICAtIGFuZGVzdGVj
aCxxaWxhaS1wbGljCisgICAgICAgICAgICAgIC0gbWV0YW5vaWEsbXQyODI0LXBsaWMKICAgICAg
ICAgICAgICAgLSByZW5lc2FzLHI5YTA3ZzA0My1wbGljCiAgICAgICAgICAgLSBjb25zdDogYW5k
ZXN0ZWNoLG5jZXBsaWMxMDAKICAgICAgIC0gaXRlbXM6CgotLSAKMi41Ni4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
