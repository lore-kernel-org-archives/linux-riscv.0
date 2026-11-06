Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CF0606D83A
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 09:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wj9toWVm;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=n1AuxZIM;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Aii6yZfC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NPoqBxYx/0LzdzQBSh9C+wBVBfNODXQH5gt0heAOQ60=; b=wj9toWVm9AMyKzIgax4/wjNBBg
	0OBb7SY/X/1lunS9WqH0DQ2cvovf4dCjjljMb3dPd3EM7QDdH5aMm5631/uaZfLD2ajzoIUlGB1cD
	QilK+JsOJm11HVyV0JLtgJr00CmbQKxrcIE7lx5izhemQBvPQ8mXEtvPrm7J3NHn32Zexidh49VO0
	DdGAzexM1g5IiS50NZgoIHM7e7mmdWtwK7LKScjMm/jHmJzK23ZpaiB+1c6MHCdLNQb02hBSeS8fw
	KW7pPCP+DZBCxLNL+QOfpDeVFAVOFUz5KaehdVFoi7cKM/8IP609YkqDTpENqrCQkDst7cwNQ1NKB
	Osz4k1AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGJo-0000000Bjoe-0QcT;
	Fri, 06 Nov 2026 09:33:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGJl-0000000Bjkk-1GXJ;
	Fri, 06 Nov 2026 09:33:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=2eLb4/hEalOsNDyuK5k3PlmAjtiGDb2pfVtc2bnmxwo=; b=n1AuxZIMB54RuHOWDaF/0nO1Y5
	uMdGk2+oEdZW4b5MsRweNmYOjXT3ceQckSkgF7tlidB4TdrE6BhmUTsSiKMuutCp3S+FsQ4Jtxc95
	9XB05+IlE7f+eMWijT4R1EQqIC8TzwqrKoVDFPc+AHjITis4JeT4yKY7TQSS6noP25cYipEcpDCJC
	4jqbzrk9897JDCu2DkmeiUhlrKVTaayue9aruCMMTx16/jrHgogERT5wh9F1h/S/vWHz6/HlGourC
	twf41pwcFonZfbCSXT2G+cSIlpwhPHFI6jiytj3Wk4YQ9qfQUf9OxI6quTHRB7SkZyjeQfGsDHXSv
	Ae/iPlaA==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGJd-0000000432S-3XNF;
	Fri, 06 Nov 2026 09:33:02 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4F1FFC69166;
	Fri,  6 Nov 2026 09:32:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C88D65FFBC;
	Fri,  6 Nov 2026 09:32:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D245F103292DE;
	Fri,  6 Nov 2026 10:32:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793957571; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2eLb4/hEalOsNDyuK5k3PlmAjtiGDb2pfVtc2bnmxwo=;
	b=Aii6yZfCIFCI0GXPg8OhujaaRz8LvHYfq/WVQY8kq/0GFAavkecQEl59l9jBcTVDT/7y1T
	bgRfKxIE91ytduKR40xbBUZ72QfMzZI0gv0z7A2iiwLqC8z0Y2bTTIARIRTdmtkf0J380M
	XWFj37mrCCfsxxZ/u9O0qSwwlwubRG+10r35mMAaSM0gHJ4rkjiN8O8Bsic1jvQBQoDcgZ
	C0o8c5xi4LsQS27x/tV7lQ+fqwnOhA8b816EUHw6+DGCIvrDES5BO7wdIoXrtaRlVx7bpr
	buyhkvgx16/PDWR6uAP+2Rf2SwoIfPJXBaMdPGmZCOLvhRXc/AlSKb3RuKRoyA==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Fri, 06 Nov 2026 10:30:16 +0100
Subject: [PATCH 19/25] watchdog: atcwdt200: allow building for Metanoia
 SoCs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261106-mt2824-v1-19-86087eaf5af4@bootlin.com>
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
X-CRM114-CacheID: sfid-20261106_093300_718847_927DCC55 
X-CRM114-Status: GOOD (  11.57  )
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

VGhlIE1ldGFub2lhIE1UMjgyNCBpbnRlZ3JhdGVzIHRoZSBBbmRlcyBBVENXRFQyMDAgd2F0Y2hk
b2cuIEFsbG93IHRoZQpkcml2ZXIgdG8gYmUgYnVpbHQgZm9yIEFSQ0hfTUVUQU5PSUEuCgpPcmln
aW5hbGx5LWJ5OiBKdW4gQ2hhbmcgPGp1bi5jaGFuZ0BtZXRhbm9pYS1jb21tLmNvbT4KU2lnbmVk
LW9mZi1ieTogQmVub8OudCBNb25pbiA8YmVub2l0Lm1vbmluQGJvb3RsaW4uY29tPgotLS0KIGRy
aXZlcnMvd2F0Y2hkb2cvS2NvbmZpZyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvd2F0Y2hkb2cvS2NvbmZp
ZyBiL2RyaXZlcnMvd2F0Y2hkb2cvS2NvbmZpZwppbmRleCBmN2QwYTBjMmMwZWYuLjI0OTlhNjYx
MmY4NSAxMDA2NDQKLS0tIGEvZHJpdmVycy93YXRjaGRvZy9LY29uZmlnCisrKyBiL2RyaXZlcnMv
d2F0Y2hkb2cvS2NvbmZpZwpAQCAtMjE0OCw3ICsyMTQ4LDcgQEAgY29uZmlnIFdBVENIRE9HX1JU
QVMKIAogY29uZmlnIEFUQ1dEVDIwMF9XQVRDSERPRwogCXRyaXN0YXRlICJBbmRlcyBBVENXRFQy
MDAgV2F0Y2hkb2cgc3VwcG9ydCIKLQlkZXBlbmRzIG9uIEFSQ0hfQU5ERVMgfHwgQ09NUElMRV9U
RVNUCisJZGVwZW5kcyBvbiBBUkNIX0FOREVTIHx8IEFSQ0hfTUVUQU5PSUEgfHwgQ09NUElMRV9U
RVNUCiAJaGVscAogCSAgRHJpdmVyIGZvciB0aGUgQW5kZXMgQVRDV0RUMjAwIHdhdGNoZG9nIHRp
bWVyLiBJdCBwcm92aWRlcyBhY2Nlc3MgdG8KIAkgIHByb2dyYW1tYWJsZSByZXNldCBhbmQgaW50
ZXJydXB0IGNvdW50ZXJzIHdpdGggY2xvY2stc291cmNlIGRlcGVuZGVudAoKLS0gCjIuNTYuMAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
