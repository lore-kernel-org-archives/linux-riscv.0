Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61ED2606EE83
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 09:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=09UyEDI6;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=fhPaivNp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HiGW7OAVHDJxPZyPAgVnLPXUUUzGbVQbMcRM6hUnlKQ=; b=09UyEDI6uQ6bSUdFfLbMXrf2Xl
	fW/phulSOsIGDZJZWa6fP+i9zhJzGuk3RwlCeuPvgH/9ELrGV6KfKoQbYQf6TPtbqVMmOoecyhOQh
	qV8+4x+Jlpz7ehqZYfcK6z+2UeO0EvBz5mh0X/QQa2B9iDOppPNPd6g3G9Ocg7C0RVDe0oeaJGDld
	c7tqfZeR32vuhyG5tnKGbtQGBBV8F/h7c8uEaljn/dEE7lBYg1Ezv73rTnc9mt8REgsNYqsirkLBa
	cQcTwuz9ckMTgAUSNb+he96v41iWRoUopHS+FlZtiD7yg9iYixaBEW+loem3jcU4EXR2p4I5q1IVe
	SUTA3PVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGIA-0000000BiCC-2lyK;
	Fri, 06 Nov 2026 09:31:26 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGI6-0000000Bi8j-0dUF;
	Fri, 06 Nov 2026 09:31:25 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6CC944E413F4;
	Fri,  6 Nov 2026 09:31:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 39F6A5FFBC;
	Fri,  6 Nov 2026 09:31:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 30FA710329258;
	Fri,  6 Nov 2026 10:31:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793957476; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QLYkWtEN7WalqBEHRAOhsQQEXGo0FNnoMfBxTpC6uGY=;
	b=fhPaivNp/k0cCUWJfGKo8HFcZ2WHJAFR+CTRjfbiGfLQeZ4kwRAKx33IOsgm/CqXJFtJ5w
	sJr27DBLIQ/hLOd3HYo0MDZAPDgEz3b+bweWVoxCHjR7ChTrUZOX1Aaj+tzaZ2IrUAMCvI
	HPrqljvEQsNy3eku/1UFusY7pPLusv2wXDKsUveU3Q2+Mf2E8N66LRRw+9vwyfIx1kcqCS
	OWLMe7hEH8DGDchj/na0s7ySL0JF8dgLW2yCik+0XplHYtJSogsREUrEN8iIzmC9/I/NIA
	DElf9Yhie34muUDWk6bdzy6S94MxnTn2p8i1x9SjCfk8iKOEeKrBI45lexXPEg==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Fri, 06 Nov 2026 10:30:03 +0100
Subject: [PATCH 06/25] dt-bindings: cache: andestech,ax45mp-cache: add
 MT2824 compatible
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261106-mt2824-v1-6-86087eaf5af4@bootlin.com>
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
X-CRM114-CacheID: sfid-20261106_013122_330891_FEADF16A 
X-CRM114-Status: UNSURE (   7.77  )
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

VGhlIE1UMjgyNCByZXVzZXMgdGhlIEFYNDVNUCBMMiBjYWNoZSBjb250cm9sbGVyIHdpdGggaXRz
IG93biBjYWNoZQpjb25maWd1cmF0aW9uLiBBZGQgYSBTb0Mtc3BlY2lmaWMgY29tcGF0aWJsZSBp
biBjYXNlIHRoZXJlIGFyZSBhZGRpdGlvbmFsCmRpZmZlcmVuY2VzIGJldHdlZW4gdGhlIHR3byBp
bXBsZW1lbnRhdGlvbnMuCgpPcmlnaW5hbGx5LWJ5OiBKdW4gQ2hhbmcgPGp1bi5jaGFuZ0BtZXRh
bm9pYS1jb21tLmNvbT4KU2lnbmVkLW9mZi1ieTogQmVub8OudCBNb25pbiA8YmVub2l0Lm1vbmlu
QGJvb3RsaW4uY29tPgotLS0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jYWNo
ZS9hbmRlc3RlY2gsYXg0NW1wLWNhY2hlLnlhbWwgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9jYWNoZS9hbmRlc3RlY2gsYXg0NW1wLWNhY2hlLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvY2FjaGUvYW5kZXN0ZWNoLGF4NDVtcC1jYWNoZS55YW1sCmluZGV4IGIx
MzVmZmE0YWI2Yi4uYzk0MDQ0YTA0OWIyIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvY2FjaGUvYW5kZXN0ZWNoLGF4NDVtcC1jYWNoZS55YW1sCisrKyBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jYWNoZS9hbmRlc3RlY2gsYXg0NW1wLWNh
Y2hlLnlhbWwKQEAgLTMwLDYgKzMwLDcgQEAgcHJvcGVydGllczoKICAgICBpdGVtczoKICAgICAg
IC0gZW51bToKICAgICAgICAgICAtIGFuZGVzdGVjaCxxaWxhaS1heDQ1bXAtY2FjaGUKKyAgICAg
ICAgICAtIG1ldGFub2lhLG10MjgyNC1heDQ1bXAtY2FjaGUKICAgICAgICAgICAtIHJlbmVzYXMs
cjlhMDdnMDQzZi1heDQ1bXAtY2FjaGUKICAgICAgIC0gY29uc3Q6IGFuZGVzdGVjaCxheDQ1bXAt
Y2FjaGUKICAgICAgIC0gY29uc3Q6IGNhY2hlCgotLSAKMi41Ni4wCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
