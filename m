Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C08606EEA0
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 09:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TyZbnuBT;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=sH96Assb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dnK0BIp+690BOmiVNHMcHUlsk0ZEvfxntwIp7OS+1vI=; b=TyZbnuBTP0WbodoWOHHlMwp/PS
	G/kB6sAl4CV1Wp8GVXTJkWdPuZa8bBCqFPuXXFPaqwVls5ePpyc56CsJQO7If+rKlmX7YfiwNj0c4
	IVpXc1syJ2Y4ub5cJeEiTMLdh75weUilWx0saBaMvL23nYL2iS3ArdI23fZJyAtvH1wdDU8QePeSq
	aNE8IcJwF7HTp/66NQ200PbLaMemQ3sUEL0xb+32Lu8gzhp0n17LB8b38G+UDRe18S1pFz4sQEnt+
	UGt123A797ZBMub9X077SteSZy8OpM5O/AlVNlnWueHmC/SITAbTfv3OHiDa9VeWj9bykHP8ktlN/
	3omikbsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGKU-0000000BkTY-2i1p;
	Fri, 06 Nov 2026 09:33:50 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGKK-0000000BkHn-0IlP;
	Fri, 06 Nov 2026 09:33:49 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6B24C4E413F4;
	Fri,  6 Nov 2026 09:33:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3BFDE5FFBC;
	Fri,  6 Nov 2026 09:33:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F04BE1032927D;
	Fri,  6 Nov 2026 10:33:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793957615; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2gcBpW7vt5OU8YXQJfbV4bUtzoSw7Q3bqHQ5l79lfms=;
	b=sH96AssbUxB5aG/0XowfvzW81VpMWUOUXskSM+Myci6Mv5duQJ2M/gJwgOdye6cvLnfXU1
	bPloJLcbbdlsWtyQincx+DOIAluXS++kapk/UJvEWrnn3eUn3WQehGFNkTsuKnv/oLw9sg
	XL5Mot8T6LgVz+zS8ZARf3QfuY4xaX4/uaJzgSg/373UQNqh92H2/6ryqQyRSMQbcllAag
	c2t1CnEBl64wJ+lTMrJxYrkJ7Rak6tfLkI8wRPzeXO5b8EtDUqkbmt4173KWUNKKXJDLHy
	P3QaSbD1onMmbw9VY1as9+9dbE3VE7B+xTib6f6LIUSdzcnZTFnGLM4RJxmumw==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Fri, 06 Nov 2026 10:30:22 +0100
Subject: [PATCH 25/25] MAINTAINERS: add RISC-V Metanoia SoC support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261106-mt2824-v1-25-86087eaf5af4@bootlin.com>
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
X-CRM114-CacheID: sfid-20261106_013340_273307_387A9BB2 
X-CRM114-Status: UNSURE (   9.10  )
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
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

QWRkIGEgbWFpbnRhaW5lciBlbnRyeSBmb3IgdGhlIE1ldGFub2lhIE1UMjgyNCBTb0MsIGNvdmVy
aW5nIHRoZQpTb0Mtc3BlY2lmaWMgRFQgYmluZGluZ3MsIHRoZSBTb0MgYW5kIHRoZSBldmFsdWF0
aW9uIGJvYXJkIGRldmljZSB0cmVlcywKYW5kIHRoZSBwaHkgZHJpdmVyLgoKT3JpZ2luYWxseS1i
eTogSnVuIENoYW5nIDxqdW4uY2hhbmdAbWV0YW5vaWEtY29tbS5jb20+ClNpZ25lZC1vZmYtYnk6
IEJlbm/DrnQgTW9uaW4gPGJlbm9pdC5tb25pbkBib290bGluLmNvbT4KLS0tCiBNQUlOVEFJTkVS
UyB8IDExICsrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKaW5kZXggOTNhYmJiMzE1MDY1Li4z
MTA1NDRmOTYyMDQgMTAwNjQ0Ci0tLSBhL01BSU5UQUlORVJTCisrKyBiL01BSU5UQUlORVJTCkBA
IC0yNDA3Miw2ICsyNDA3MiwxNyBAQCBUOglnaXQgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L2lvbW11L2xpbnV4LmdpdAogRjoJRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2lvbW11L3Jpc2N2LGlvbW11LnlhbWwKIEY6CWRyaXZlcnMvaW9tbXUv
cmlzY3YvCiAKK1JJU0MtViBNRVRBTk9JQSBTb0MgU1VQUE9SVAorTToJSnVuIENoYW5nIDxqdW4u
Y2hhbmdAbWV0YW5vaWEtY29tbS5jb20+CitMOglsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCitTOglNYWludGFpbmVkCitGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
cGh5L21ldGFub2lhLHVzYjItcGh5LnlhbWwKK0Y6CURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9wb3dlci9yZXNldC9tZXRhbm9pYSxyZWJvb3QueWFtbAorRjoJRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jlc2V0L21ldGFub2lhLHJlc2V0LnlhbWwKK0Y6CURvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9tZXRhbm9pYS55YW1sCitGOglhcmNo
L3Jpc2N2L2Jvb3QvZHRzL21ldGFub2lhLworRjoJZHJpdmVycy9waHkvbWV0YW5vaWEvCisKIFJJ
U0MtViBNSUNST0NISVAgU1VQUE9SVAogTToJQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWlj
cm9jaGlwLmNvbT4KIFI6CVZhbGVudGluYSBGZXJuYW5kZXogPHZhbGVudGluYS5mZXJuYW5kZXph
bGFuaXNAbWljcm9jaGlwLmNvbT4KCi0tIAoyLjU2LjAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
