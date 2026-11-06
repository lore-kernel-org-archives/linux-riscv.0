Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEC66082BC6
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 09:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sAmKnCHg;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Igpx+ZMr;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=R2gRVOsi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4bXkFJFzZfmCP1EENA7+7a/VoskwJGQKREg7r83JV6U=; b=sAmKnCHgIJrEA1HB0c9zDnA5GC
	mnP55PvOmlHu5Eu34ji7EZR+hroKpJ3RyHXcqmw9QoJuy5flGzL7/aV6EM12nA6M2MIbR7y0UiVm8
	z2B/prY98bUO0toHiX7uZ7T49cPzOACtRoS2DSXauZmCIGbIJWqpKm0R4NgXkMNBsmSwe/BhqLXM6
	6T+eUUfTKo7kzK93VSlnXlTadkBLY5DS+sllbvP3ZTDPwDfDwIX9jy9dT88w/HjALpBQui/hTog8y
	R9L79nUZRZmlzhcwg2j+1hdkZlcNVjTMVJJWQ9UbMeD5qRl7hx+AmaKuXUHUsEkLwTcVhF+1ncC6r
	7cU1JI5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGIn-0000000Bij1-3PCP;
	Fri, 06 Nov 2026 09:32:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGIm-0000000BihC-1ViM;
	Fri, 06 Nov 2026 09:32:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=CNZP50BWBrq5SlkS/TLDhwZqggqQ5ahbrtHLdVk2cSQ=; b=Igpx+ZMrxrMpFY3/awUR2aImR9
	W4iOTkxZr1SA0JDy72UnKyB787wdMlAoN4f5B9gWewD6wHA9ejvP/zqwfOflTtLZjX+cfW3cE/G2S
	2TMuB2sw3Nfbd1hJrtL636jPWOV1DVGnLv80IvaeV0Fzd9UO+W7tcfs729qipm6Z5baFZII/lqPXA
	X1oIZ2nU/rivYCxGFTqQvFaI/ob6aiuRWYGl8N+QAEQ664YOBpG5j5DLe7uRTd6kMPcEUzWMj9gQI
	aeYW8Mt2ITM0VvjaXEVWY8ZJBWcUB5vVi27c2AT9D6JAIQblVbLw3BJcoNnKoWhzxlbaDgtNMYEQD
	P0ysN68Q==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGIh-000000042ms-160M;
	Fri, 06 Nov 2026 09:32:02 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 556AB1A0C32;
	Fri,  6 Nov 2026 09:31:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 266995FFBC;
	Fri,  6 Nov 2026 09:31:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9597B103292D0;
	Fri,  6 Nov 2026 10:31:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793957511; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CNZP50BWBrq5SlkS/TLDhwZqggqQ5ahbrtHLdVk2cSQ=;
	b=R2gRVOsiMPmv9CMSij+H31YRu4WRa7A6biLsMzbtMe2ekfOeuaQbidN1f1Pf8cOuGPOB31
	IBwbP9S6vIEqkXmSxU6/Jjx8J7VZcJJUqRZC+2XxgG6RqC+lM/JSS4YmCmOS6BEl/vKk2N
	Gk6T/f5/VwP1YbrUvc5ZdBJ8Q/70J9Qro56xY1tGbA+TaoSRKiJN3Hquuy6FJUszJQEDpe
	lKG5xHA0ua0e5t+6BVnFkZ8T1AJOhaH7rInquLbulFrjCc7hiBBMZ293DhP8Dhd/8yIWV3
	LBT65BpuviBCTuUnp5NTuVRQi0TlMJnIOiJsB3zT/C5eCrSH7zN3sA68V2DpFg==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Fri, 06 Nov 2026 10:30:08 +0100
Subject: [PATCH 11/25] dt-bindings: spi: andestech,ae350-spi: make DMA and
 interrupts optional
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261106-mt2824-v1-11-86087eaf5af4@bootlin.com>
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
X-CRM114-CacheID: sfid-20261106_093200_659878_4FA9DB28 
X-CRM114-Status: GOOD (  10.00  )
X-Spam-Score: -0.2 (/)
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

VGhlIEFUQ1NQSTIwMCBjb250cm9sbGVyIGNhbiBiZSB1c2VkIGluIFBJTyBtb2RlLCB3aXRob3V0
IERNQSwgYW5kIFBJTwp0cmFuc2ZlcnMgY2FuIG9wdGlvbmFsbHkgdXNlIHRoZSBjb250cm9sbGVy
J3MgaW50ZXJydXB0LiBNYWtlIGRtYXMsCmRtYS1uYW1lcyBhbmQgaW50ZXJydXB0cyBvcHRpb25h
bCwgYW5kIHJlcXVpcmUgZG1hLW5hbWVzIGlmIGRtYXMgaXMKc3BlY2lmaWVkLgoKT3JpZ2luYWxs
eS1ieTogSnVuIENoYW5nIDxqdW4uY2hhbmdAbWV0YW5vaWEtY29tbS5jb20+ClNpZ25lZC1vZmYt
Ynk6IEJlbm/DrnQgTW9uaW4gPGJlbm9pdC5tb25pbkBib290bGluLmNvbT4KLS0tCiBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL2FuZGVzdGVjaCxhZTM1MC1zcGkueWFtbCB8
IDggKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9h
bmRlc3RlY2gsYWUzNTAtc3BpLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3Mvc3BpL2FuZGVzdGVjaCxhZTM1MC1zcGkueWFtbAppbmRleCAzODEwNDJlMDdmZDAuLjkxZTA0
ZjVkMzU0YSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Nw
aS9hbmRlc3RlY2gsYWUzNTAtc3BpLnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3NwaS9hbmRlc3RlY2gsYWUzNTAtc3BpLnlhbWwKQEAgLTI0LDYgKzI0LDkgQEAg
cHJvcGVydGllczoKICAgY2xvY2tzOgogICAgIG1heEl0ZW1zOiAxCiAKKyAgaW50ZXJydXB0czoK
KyAgICBtYXhJdGVtczogMQorCiAgIGRtYXM6CiAgICAgaXRlbXM6CiAgICAgICAtIGRlc2NyaXB0
aW9uOiBUcmFuc21pdCBGSUZPIERNQSBjaGFubmVsCkBAIC0zNCw2ICszNyw5IEBAIHByb3BlcnRp
ZXM6CiAgICAgICAtIGNvbnN0OiB0eAogICAgICAgLSBjb25zdDogcngKIAorZGVwZW5kZW5jaWVz
OgorICBkbWFzOiBbIGRtYS1uYW1lcyBdCisKIHBhdHRlcm5Qcm9wZXJ0aWVzOgogICAiQFswLTlh
LWZdKyQiOgogICAgIHR5cGU6IG9iamVjdApAQCAtNTUsOCArNjEsNiBAQCByZXF1aXJlZDoKICAg
LSBjb21wYXRpYmxlCiAgIC0gcmVnCiAgIC0gY2xvY2tzCi0gIC0gZG1hcwotICAtIGRtYS1uYW1l
cwogCiB1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlCiAKCi0tIAoyLjU2LjAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
