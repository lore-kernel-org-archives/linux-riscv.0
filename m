Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EA5606A332
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 09:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YtzDQMG6;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=IL80sULf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yufMjWwgffM33r+k8ibGWrcmRy150fUhpQIenS1eafg=; b=YtzDQMG6Q8OtKocys8/2IAKk8J
	CDzchZGKreOhWlQ5/cRVWVy64bGwrxeEHB/af76BJ81eXC01HB3HdMEHYATbizi1QWoWpO5aH/2jd
	VCKNaC8+e/LH4HxKr1/hYF2KX0mT8pUyfsPI3hSyC7QEWwZ4PLLXoPCzl6yzjBcmKo43+1z8PfCaA
	f3kT/pJlTa8q5QbZYoAo1oZpSHzhH8OQv3RwZitpScUNU77zHq7QaOdk3ID1sjJv0+Ol7cBS9rvq8
	Bi4Nej3Z15HI1GBHte6yLp/1zTZ7EjaQU/WabqM59aqR0K65Uk98hSLy6jtEV9VMpmfJq7tI1RzHX
	FHsrrPSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGHx-0000000Bi53-3fcm;
	Fri, 06 Nov 2026 09:31:13 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGHt-0000000Bi1S-1xQv
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 09:31:12 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DA2C34E413F4;
	Fri,  6 Nov 2026 09:31:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A565E5FFBC;
	Fri,  6 Nov 2026 09:31:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BEC47103292D3;
	Fri,  6 Nov 2026 10:30:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793957463; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FEY+pNQv3raFD6ItQ5TruQMpIhIehZiBlMa2MptY0Ko=;
	b=IL80sULffVhHJjUPB6lq/meZSVUj5X67ZG4gALd59IoF1PC+QcnS+ZtkR41hdmJaMtm+E5
	DgOFn5AYSlbgiiercLioIm6i38rNtfjIKd/icYFG85nDE7/Nf0/t0FD4hjG5jv+CEKh4m9
	r1HoesTUtas6qvAbxoRtPS+7mivpPruzXbIMxstzFue5GFKHwYX1HiKcKLZVh4YOs3J3Xb
	iYJDxrPYo1r2EOllL694SVGgrxYw2gQHpgIDloPEfR8G/UVTFpPl418WOI91Wb8HddFiH9
	pqNCxMwN7mTFZjyS1p+hSAYTIOPu0ZtKl6DfoNTL52GoCbGBR+BEgXR/YoCD1Q==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Fri, 06 Nov 2026 10:30:01 +0100
Subject: [PATCH 04/25] dt-bindings: power: reset: add Metanoia MT2824
 reboot
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261106-mt2824-v1-4-86087eaf5af4@bootlin.com>
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
X-CRM114-CacheID: sfid-20261106_013109_641885_C5300FC7 
X-CRM114-Status: GOOD (  11.82  )
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

RG9jdW1lbnQgdGhlIE1ldGFub2lhIE1UMjgyNCByZWJvb3QgcmVnaXN0ZXIsIHdoaWNoIHRoZSBm
aXJtd2FyZSB3cml0ZXMKaW4gbWFjaGluZSBtb2RlIHRvIHBlcmZvcm0gYSB3YXJtIHN5c3RlbSBy
ZWJvb3QuIE9wZW5TQkkgaGFzIGEgc3lzdGVtCnJlc2V0IGRyaXZlciBmb3IgaXQuCgpPcmlnaW5h
bGx5LWJ5OiBKdW4gQ2hhbmcgPGp1bi5jaGFuZ0BtZXRhbm9pYS1jb21tLmNvbT4KU2lnbmVkLW9m
Zi1ieTogQmVub8OudCBNb25pbiA8YmVub2l0Lm1vbmluQGJvb3RsaW4uY29tPgotLS0KIC4uLi9i
aW5kaW5ncy9wb3dlci9yZXNldC9tZXRhbm9pYSxyZWJvb3QueWFtbCAgICAgIHwgMzQgKysrKysr
KysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcG93ZXIvcmVzZXQvbWV0
YW5vaWEscmVib290LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcG93
ZXIvcmVzZXQvbWV0YW5vaWEscmVib290LnlhbWwKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXgg
MDAwMDAwMDAwMDAwLi4yNjcwZmU3YWI5M2YKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcG93ZXIvcmVzZXQvbWV0YW5vaWEscmVib290LnlhbWwK
QEAgLTAsMCArMSwzNCBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25s
eSBPUiBCU0QtMi1DbGF1c2UpCislWUFNTCAxLjIKKy0tLQorJGlkOiBodHRwOi8vZGV2aWNldHJl
ZS5vcmcvc2NoZW1hcy9wb3dlci9yZXNldC9tZXRhbm9pYSxyZWJvb3QueWFtbCMKKyRzY2hlbWE6
IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIworCit0aXRsZTog
TWV0YW5vaWEgTVQyODI0IFJlYm9vdCBDb250cm9sbGVyCisKK21haW50YWluZXJzOgorICAtIEp1
biBDaGFuZyA8anVuLmNoYW5nQG1ldGFub2lhLWNvbW0uY29tPgorCitkZXNjcmlwdGlvbjoKKyAg
VGhlIE1ldGFub2lhIE1UMjgyNCByZWJvb3QgY29udHJvbGxlciBwcm92aWRlcyBhIHN5c3RlbSB3
YXJtIHJlYm9vdCB0aHJvdWdoCisgIGEgbWVtb3J5LW1hcHBlZCByZWdpc3Rlci4gSXQgaXMgdXNl
ZCBieSB0aGUgZmlybXdhcmUgaW4gbWFjaGluZSBtb2RlLgorCitwcm9wZXJ0aWVzOgorICBjb21w
YXRpYmxlOgorICAgIGNvbnN0OiBtZXRhbm9pYSxtdDI4MjQtcmVib290CisKKyAgcmVnOgorICAg
IG1heEl0ZW1zOiAxCisKK3JlcXVpcmVkOgorICAtIGNvbXBhdGlibGUKKyAgLSByZWcKKworYWRk
aXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCisKK2V4YW1wbGVzOgorICAtIHwKKyAgICByZWJvb3Q6
IHJlYm9vdEAxMDAwMDAwNCB7CisgICAgICBjb21wYXRpYmxlID0gIm1ldGFub2lhLG10MjgyNC1y
ZWJvb3QiOworICAgICAgcmVnID0gPDB4MTAwMDAwMDQgMHg4PjsKKyAgICB9OwoKLS0gCjIuNTYu
MAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
