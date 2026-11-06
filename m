Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D503B606D832
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 09:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xRDSSTpW;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=S2GzPxSj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gYgIiMg/HXsMZ6VT5K2U0jfw/olqvwZLyYYuM1uywiU=; b=xRDSSTpWyTiom+3kruEHxZpOjK
	E45X/+EpUbh1EaXztwt5LO2YRrQXangwHiNRQbdf+Htbna6oA4Xk8KnlGzxDKQ2CexnBihfMTU5ux
	xLli9Rx8AYNZg/58KvWPd4P5FnPw7f8oiqsHIlX8onRnwi3+VEIJOtEivT9AlhJuRjg5mPTpVAoQY
	FrvL+T54aDl6X0EjMU/YWXBQQGeAgHSov4KIVteuJtIrpygmY9Tx966u1zGnz4TqEcQeAW2ThMn7o
	wEuGKSBT9Es32g74/kdfZwHRrqHoY6noWiz1btyjwH1L6tR2AByLBAIZPgedsBs3fxrALbiBOc8GE
	OxDB8Emw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGHf-0000000Bhvg-1tP8;
	Fri, 06 Nov 2026 09:30:55 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGHb-0000000Bhu2-0OsH;
	Fri, 06 Nov 2026 09:30:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5F6114E413F4;
	Fri,  6 Nov 2026 09:30:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1CC8B5FFBC;
	Fri,  6 Nov 2026 09:30:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D258E1032927D;
	Fri,  6 Nov 2026 10:30:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793957444; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SHm0AteFxuKOwxOjlVILodPtETBXP7hD3plfwEFTqSQ=;
	b=S2GzPxSjpvUeXv9HhBo+yI8ELQmXQ1gLJRsLtHsc1gB4qMc2Cg/yer5MpNZINHYd6b9zmX
	nq7LBhAvb2FeUUyUMweM3e69TEuOPH+PSjpqKP8iIBmmnTWtgmZWBLTQKaegy8Dvv3N+rl
	I09tiujlzMrDJcp/I3frt3C8KJ7QmCnR1ULbnEnsF+SgF3g8BFvNWwSifnCe01AGTUaUky
	hMAbU4DWJDyh6+CW5OHyxCAFIocJqTi6rSrx9SnrlMScKXNji3+G8d3dnG6Ha78Gt4fZs6
	iDReX4aecjwx6eI576V4QcUYA9YgMNZ2qUDDnd4ILBtpiIRIgPODLAdE08gwUw==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Fri, 06 Nov 2026 10:29:58 +0100
Subject: [PATCH 01/25] dt-bindings: vendor-prefixes: add Metanoia
 Communications
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261106-mt2824-v1-1-86087eaf5af4@bootlin.com>
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
X-CRM114-CacheID: sfid-20261106_013052_243751_1BD7C6F7 
X-CRM114-Status: UNSURE (   7.20  )
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

QWRkIHRoZSB2ZW5kb3IgcHJlZml4IGZvciBNZXRhbm9pYSBDb21tdW5pY2F0aW9ucyBJbmMuLCBh
IGZhYmxlc3MKc2VtaWNvbmR1Y3RvciBjb21wYW55IHNwZWNpYWxpemluZyBpbiB3aXJlbGluZSBh
bmQgNUcgcmFkaW8gYWNjZXNzCm5ldHdvcmtpbmcgY2hpcHMuCgpMaW5rOiBodHRwczovL21ldGFu
b2lhLWNvbW0uY29tL2Fib3V0LXVzL2NvbXBhbnktb3ZlcnZpZXcvCgpPcmlnaW5hbGx5LWJ5OiBK
dW4gQ2hhbmcgPGp1bi5jaGFuZ0BtZXRhbm9pYS1jb21tLmNvbT4KU2lnbmVkLW9mZi1ieTogQmVu
b8OudCBNb25pbiA8YmVub2l0Lm1vbmluQGJvb3RsaW4uY29tPgotLS0KIERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMueWFtbCB8IDIgKysKIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwKaW5kZXggNTQ3MWEwNmY5M2YxLi4w
ODU3NDlmYjhhNzIgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy92ZW5kb3ItcHJlZml4ZXMueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwKQEAgLTEwODcsNiArMTA4Nyw4IEBAIHBhdHRlcm5Q
cm9wZXJ0aWVzOgogICAgIGRlc2NyaXB0aW9uOiBDaXNjbyBNZXJha2ksIExMQwogICAiXm1lcnJp
aSwuKiI6CiAgICAgZGVzY3JpcHRpb246IE1lcnJpaSBUZWNobm9sb2d5IENvLiwgTHRkLgorICAi
Xm1ldGFub2lhLC4qIjoKKyAgICBkZXNjcmlwdGlvbjogTWV0YW5vaWEgQ29tbXVuaWNhdGlvbnMg
SW5jLgogICAiXm1ldGhvZGUsLioiOgogICAgIGRlc2NyaXB0aW9uOiBNZXRob2RlIEVsZWN0cm9u
aWNzLCBJbmMuCiAgICJebWljcmVsLC4qIjoKCi0tIAoyLjU2LjAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
