Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD49A606D835
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 09:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ceNZvlZt;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Y/gOJcAq;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=IyJLimh8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=c1ClA71PwzRkiC2rRJKsU9wCgvsWDgRUJg4W8NDCU0U=; b=ceNZvlZt41qlWYjoGGAk88TIZM
	RKy/ZGfbmbrUcCuJPkNXTD4XJ3/5zS60u423ubdPMLKr55Md4/XFFfjdt+exDe1kaXc+9kstO5d+Q
	luHvIWmBjs3d9c20JiSJtNbFiWfjvOXbZLsl57l7NKaLNlfprUgCDA9SHP1ipv6vh+fpgE4n7dELn
	JLdmCNNfD1iHidOMp/8je35xJleoyfmOFamyODCHL/SeMVlvJx+n4pyE8yYcTnFRcZTzuL4SnGGQh
	md/J6Ug2QOMpYTbUIUOyi3j8Q5UOvShcpdgpzBjSw/1P6yLE0OSa1m0PeJbtqEVdNYnA9PGBdwQcG
	hboE9a+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGJH-0000000BjJJ-2KNT;
	Fri, 06 Nov 2026 09:32:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGJF-0000000BjFt-1Ora;
	Fri, 06 Nov 2026 09:32:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=5QZ6o6JjR9MBHdZ2umi91SU/jrU4YivF8J5ejKsH45w=; b=Y/gOJcAqWyiXYr8kPD/TOrfo2C
	13ktaIhYFNWKNEKXV89dsyIIH39bmXQCT+fxCLewKKBQmrxR4FcSmSBAe9PUw8zMy6GQ7YCIlS4eA
	Yc71/2kN7mA7inGK09rOIY8SqQ37WVGtA8a3+xS8mVin84awaljwVsqjNxqds7PEtjB2z8UL78CZn
	lqASngps99DvLLfxpn+PwHaroEJ5BUiis/4qNCN0z/5UgjtTq1cFOu1NkgcFq1XXeFMLRfES0kXbC
	PWgfLF2Eew9ZJu1wNApUVRC3BmpQOydG6H3A9cniTOMYADl2NC19ZtBkilyd/phKG49nOHnZUlSFE
	b7Jr8oKA==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGJ8-000000042tM-211R;
	Fri, 06 Nov 2026 09:32:29 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E407BC69166;
	Fri,  6 Nov 2026 09:32:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 67EDE5FFBC;
	Fri,  6 Nov 2026 09:32:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9C438103292CA;
	Fri,  6 Nov 2026 10:32:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793957540; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5QZ6o6JjR9MBHdZ2umi91SU/jrU4YivF8J5ejKsH45w=;
	b=IyJLimh8+SZ5sqvGUtTtXYTsCrpfgNc4dWN6JZQiJzzpRvgbbD0Nup/ckVV9Rcly44soUO
	sR5E4Z8zF+hM+ifrUztJUoZgZWKaB2m+9wOB8Sog3Wcuy67+yS4G4tsX4GnHXNkYJAUUM5
	EiWnGp14xQ1tTa6iG1jPcC52sqDl7Y1RN8rgMvHB5WByDmJ3g6RrbFk5DyHjtfNevmr36c
	PdXR/nVzmrVhr0wds8GNIhXz5ag/a6cppMFAOUXa073e7uCHBW7oQkyzkiT7FjnFI/EzvE
	IIDGJQgklNcxSbfqPZTEmdpzT4jeppEBjjkUbVzkf57JQMBfmobNpd98/UGj4w==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Fri, 06 Nov 2026 10:30:12 +0100
Subject: [PATCH 15/25] riscv: add ARCH_METANOIA Kconfig entry
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261106-mt2824-v1-15-86087eaf5af4@bootlin.com>
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
X-CRM114-CacheID: sfid-20261106_093227_217726_9C08967B 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
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

QWRkIHN1cHBvcnQgZm9yIE1ldGFub2lhIFJJU0MtViBTb0NzIHN1Y2ggYXMgdGhlIE1UMjgyNC4g
VGhlIE1ldGFub2lhCk1UMjgyNCBpcyBidWlsdCBhcm91bmQgQW5kZXMgQVg0NU1QIGNvcmVzLCBz
byBzZWxlY3QgdGhlIEFuZGVzIGVycmF0YQp3b3JrYXJvdW5kcy4KClNpZ25lZC1vZmYtYnk6IEJl
bm/DrnQgTW9uaW4gPGJlbm9pdC5tb25pbkBib290bGluLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L0tj
b25maWcuc29jcyB8IDggKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcuc29jcyBiL2FyY2gvcmlzY3YvS2NvbmZp
Zy5zb2NzCmluZGV4IGNlY2JjZTBjNDk4My4uYWRjYjEwYmNhOTY2IDEwMDY0NAotLS0gYS9hcmNo
L3Jpc2N2L0tjb25maWcuc29jcworKysgYi9hcmNoL3Jpc2N2L0tjb25maWcuc29jcwpAQCAtMTgs
NiArMTgsMTQgQEAgY29uZmlnIEFSQ0hfRVNXSU4KIAkgIFRoaXMgZW5hYmxlcyBzdXBwb3J0IGZv
ciBFU1dJTiBTb0MgcGxhdGZvcm0gaGFyZHdhcmUsCiAJICBpbmNsdWRpbmcgdGhlIEVTV0lOIEVJ
Qzc3MDAgU29DLgogCitjb25maWcgQVJDSF9NRVRBTk9JQQorCWJvb2wgIk1ldGFub2lhIFNvQ3Mi
CisJZGVwZW5kcyBvbiBNTVUKKwlzZWxlY3QgQVJDSF9IQVNfUkVTRVRfQ09OVFJPTExFUgorCXNl
bGVjdCBFUlJBVEFfQU5ERVMKKwloZWxwCisJICBUaGlzIGVuYWJsZXMgc3VwcG9ydCBmb3IgTWV0
YW5vaWEgU29DIHBsYXRmb3Jtcy4KKwogY29uZmlnIEFSQ0hfTUlDUk9DSElQX1BPTEFSRklSRQog
CWRlZl9ib29sIEFSQ0hfTUlDUk9DSElQCiAKCi0tIAoyLjU2LjAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
