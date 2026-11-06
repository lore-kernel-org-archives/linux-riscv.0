Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0C6606D82C
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 09:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0BZFaidD;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=n1j5ALbN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4hlvwWRXZJ9MWGE4J22HpvPNj7KDdsUmwoXuhroxv5o=; b=0BZFaidDAJWT8cZdIifm2Amt4O
	HAImJJNYPM5As5JDScgOR54x8froPnvzDUJ8M+wAX2yU/FKxHpGH04hl92at95Q/1BqgcFcrZMIy0
	VYgLsf04S78Xx+fVlG3nkLTxzvBUdJwMaGUvj20KGnVc+pWkUm73ltb+nZBsrtSwsza0YVrNDAEz6
	4DKbxnGVaCUoKz4NWVCIobujX0+Z/D/muifFwEGvUzQfBmUOrjbgNq7HZww9nF9DXzZIRdPNYX5rP
	Zzhb5slL5sEW8oJ/ff9o4dVx9w+XDlUGsqtF67pC/m6X7Sso8t05CHjwbG7UilhzmHO1+PD3h981e
	494aQNVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGHj-0000000Bhxr-2IqZ;
	Fri, 06 Nov 2026 09:30:59 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGHg-0000000BhvW-1qPR
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 09:30:57 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C5B474E413F5;
	Fri,  6 Nov 2026 09:30:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 91E855FFBC;
	Fri,  6 Nov 2026 09:30:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 23E3910329258;
	Fri,  6 Nov 2026 10:30:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793957451; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=b2DYExTYymKs+rj5qLFkdxVQ1f+JYX1uyypx3DzhTVs=;
	b=n1j5ALbNPpw1RFX1M9nj4YVJj634p46gxBZU1MJ5wj45z4wlJWSXL/5Bc1zCOnc0L5bw2z
	D0n3M0ZGB6qDz/+iCxGTxG6NGIs/dpCvxBqqcVUmbWuFc8bM3LyGuqzlI76pSD5tbqUCk4
	8VjMQ7iKwRN08hZzZSuJmrRjf4OC3T6T2lagge2RnBHe73UXtG/DjSkkhvUV640NakyRcG
	9ARLCroyVYbK+CUNT/rb0Wk/+p97mgtlTNeInPxU/MFjFQmPbn2UTGwlhybXThUSrqNA4x
	noKS40HU8IUuLu6u409P/3/WcS5R8PLj5fzvHq0iO54cg1IFv4ZBUVPNJfRxDQ==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Fri, 06 Nov 2026 10:29:59 +0100
Subject: [PATCH 02/25] dt-bindings: riscv: add Metanoia SoC-based boards
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261106-mt2824-v1-2-86087eaf5af4@bootlin.com>
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
X-CRM114-CacheID: sfid-20261106_013056_625098_69437FBE 
X-CRM114-Status: UNSURE (   9.15  )
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

RG9jdW1lbnQgdGhlIGNvbXBhdGlibGUgc3RyaW5ncyBvZiB0aGUgTWV0YW5vaWEgTVQyODI0IFNv
QyBhbmQgdGhlCk1UNTgyNCBldmFsdWF0aW9uIGJvYXJkLgoKT3JpZ2luYWxseS1ieTogSnVuIENo
YW5nIDxqdW4uY2hhbmdAbWV0YW5vaWEtY29tbS5jb20+ClNpZ25lZC1vZmYtYnk6IEJlbm/DrnQg
TW9uaW4gPGJlbm9pdC5tb25pbkBib290bGluLmNvbT4KLS0tCiAuLi4vZGV2aWNldHJlZS9iaW5k
aW5ncy9yaXNjdi9tZXRhbm9pYS55YW1sICAgICAgICB8IDI1ICsrKysrKysrKysrKysrKysrKysr
KysKIDEgZmlsZSBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L21ldGFub2lhLnlhbWwgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvbWV0YW5vaWEueWFtbApuZXcgZmlsZSBt
b2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLmE2NTE5MTc2MzBmYwotLS0gL2Rldi9udWxs
CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9tZXRhbm9pYS55
YW1sCkBAIC0wLDAgKzEsMjUgQEAKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4w
LW9ubHkgT1IgQlNELTItQ2xhdXNlKQorJVlBTUwgMS4yCistLS0KKyRpZDogaHR0cDovL2Rldmlj
ZXRyZWUub3JnL3NjaGVtYXMvcmlzY3YvbWV0YW5vaWEueWFtbCMKKyRzY2hlbWE6IGh0dHA6Ly9k
ZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIworCit0aXRsZTogTWV0YW5vaWEg
U29DLWJhc2VkIGJvYXJkcworCittYWludGFpbmVyczoKKyAgLSBKdW4gQ2hhbmcgPGp1bi5jaGFu
Z0BtZXRhbm9pYS1jb21tLmNvbT4KKworZGVzY3JpcHRpb246CisgIE1ldGFub2lhIFNvQy1iYXNl
ZCBib2FyZHMKKworcHJvcGVydGllczoKKyAgJG5vZGVuYW1lOgorICAgIGNvbnN0OiAnLycKKyAg
Y29tcGF0aWJsZToKKyAgICBvbmVPZjoKKyAgICAgIC0gaXRlbXM6CisgICAgICAgICAgLSBlbnVt
OgorICAgICAgICAgICAgICAtIG1ldGFub2lhLG10NTgyNC1ldmIKKyAgICAgICAgICAtIGNvbnN0
OiBtZXRhbm9pYSxtdDI4MjQKKworYWRkaXRpb25hbFByb3BlcnRpZXM6IHRydWUKCi0tIAoyLjU2
LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
