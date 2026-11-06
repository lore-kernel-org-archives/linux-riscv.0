Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3DE60A2602
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 09:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yHVztIpG;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=qzjngm6W
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8hpU/eJAgzTE92s4oV49WhNfOUlWQ1NPooeQJ/AJW7Y=; b=yHVztIpGZhtM7hLLCgjheUeWLL
	1/J3pUuCfsnfR6JkG9apaYE3CdTt95g3AMgEGSniDzrmEyiwP0uHmPX4ozNmubRImrCfAkTVOwrNY
	2/8qWfymyYtm9HC6NaiuntqV4LAAmv4OY+FfVZmumTWGL7DO6ZbGdZwYCGMiMqNrT+Fr0irqX+jar
	3Ou4cS0HN/vP2TYZaqA0/2oCdB59M3Uc2yKjYSufP3GovE+kMRneUq71/VzbqfqT/ItiO9ffPRVtW
	3KixafTP6D+pi5ISNRy4ZZ0t8gmJ4n+bT1GdUG2qm2IAPwUs7uKNVcmg97gQhI9mW4bddRclwRgvp
	gKBCZsHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGK8-0000000BkAC-3pEj;
	Fri, 06 Nov 2026 09:33:28 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGK0-0000000Bjzj-2AXp;
	Fri, 06 Nov 2026 09:33:26 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 253DEC69168;
	Fri,  6 Nov 2026 09:33:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 843B35FFBC;
	Fri,  6 Nov 2026 09:33:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A2CAD10329258;
	Fri,  6 Nov 2026 10:33:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793957595; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xNxhGNlUd/QAYjwS9+p2YRVic4RXKhAhrhTTLAcBT1A=;
	b=qzjngm6WnCz2RSJjNd87zanbSOH2E4/m7iNJaRu8O8NApdI6HB0JwSC9zihCXzReroWlBy
	YbEr4t/R5C8POfP7mahglsIZLkb/jgbiht0kTGtezBFmH62HZx8bBVObq9zEUSYr2uCKn7
	OPsvspCzw7u0i+M5RJygf1N7C+c/GORrrW5f0oREYTS7xvfuFqeluPN0vC9w7IBImagl1I
	tvWtXPB6yRp/oxW/Z3wF3A41LIHDsu9DvFr7FvQTpdWc3eYenyQiltaVyrB9ADHBI8jAxK
	miLKg/TcH/bOQIYypD7IvoCCmyertaDVNtwFs3eR+bX+MJM+qpe1zItVfCFxrg==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Fri, 06 Nov 2026 10:30:19 +0100
Subject: [PATCH 22/25] phy: metanoia: add USB2 PHY driver
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261106-mt2824-v1-22-86087eaf5af4@bootlin.com>
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
X-CRM114-CacheID: sfid-20261106_013321_458909_51AB5ACE 
X-CRM114-Status: GOOD (  17.94  )
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

QWRkIGEgbWluaW1hbCByZXNldC1vbmx5IFBIWSBwcm92aWRlciBmb3IgdGhlIE1ldGFub2lhIE1U
MjgyNCBVU0IyIFBIWS4KSXQgZGVhc3NlcnRzIHRoZSBQSFkgcmVzZXQgcmVxdWlyZWQgYnkgdGhl
IERXQzIgVVNCIGNvbnRyb2xsZXIgb24gaW5pdAphbmQgYXNzZXJ0cyBpdCBhZ2FpbiBvbiBleGl0
LgoKT3JpZ2luYWxseS1ieTogSnVuIENoYW5nIDxqdW4uY2hhbmdAbWV0YW5vaWEtY29tbS5jb20+
ClNpZ25lZC1vZmYtYnk6IEJlbm/DrnQgTW9uaW4gPGJlbm9pdC5tb25pbkBib290bGluLmNvbT4K
LS0tCiBkcml2ZXJzL3BoeS9LY29uZmlnICAgICAgICAgICAgIHwgIDEgKwogZHJpdmVycy9waHkv
TWFrZWZpbGUgICAgICAgICAgICB8ICAxICsKIGRyaXZlcnMvcGh5L21ldGFub2lhL0tjb25maWcg
ICAgfCAxNiArKysrKysrKwogZHJpdmVycy9waHkvbWV0YW5vaWEvTWFrZWZpbGUgICB8ICAzICsr
CiBkcml2ZXJzL3BoeS9tZXRhbm9pYS9waHktdXNiMi5jIHwgODggKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysKIDUgZmlsZXMgY2hhbmdlZCwgMTA5IGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BoeS9LY29uZmlnIGIvZHJpdmVycy9waHkvS2NvbmZp
ZwppbmRleCAxMDVmYmU0MDhhYTIuLjczZWY2MWYxZjUzZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9w
aHkvS2NvbmZpZworKysgYi9kcml2ZXJzL3BoeS9LY29uZmlnCkBAIC0xODQsNiArMTg0LDcgQEAg
c291cmNlICJkcml2ZXJzL3BoeS9pbnRlbC9LY29uZmlnIgogc291cmNlICJkcml2ZXJzL3BoeS9s
YW50aXEvS2NvbmZpZyIKIHNvdXJjZSAiZHJpdmVycy9waHkvbWFydmVsbC9LY29uZmlnIgogc291
cmNlICJkcml2ZXJzL3BoeS9tZWRpYXRlay9LY29uZmlnIgorc291cmNlICJkcml2ZXJzL3BoeS9t
ZXRhbm9pYS9LY29uZmlnIgogc291cmNlICJkcml2ZXJzL3BoeS9taWNyb2NoaXAvS2NvbmZpZyIK
IHNvdXJjZSAiZHJpdmVycy9waHkvbW90b3JvbGEvS2NvbmZpZyIKIHNvdXJjZSAiZHJpdmVycy9w
aHkvbXNjYy9LY29uZmlnIgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9waHkvTWFrZWZpbGUgYi9kcml2
ZXJzL3BoeS9NYWtlZmlsZQppbmRleCBjNmRkMDIwMDNiYmUuLjU3OTkxYjUwOTc4YyAxMDA2NDQK
LS0tIGEvZHJpdmVycy9waHkvTWFrZWZpbGUKKysrIGIvZHJpdmVycy9waHkvTWFrZWZpbGUKQEAg
LTM2LDYgKzM2LDcgQEAgb2JqLSQoQ09ORklHX0dFTkVSSUNfUEhZKQkJKz0gYWxsd2lubmVyLwlc
CiAJCQkJCSAgIGxhbnRpcS8JXAogCQkJCQkgICBtYXJ2ZWxsLwlcCiAJCQkJCSAgIG1lZGlhdGVr
LwlcCisJCQkJCSAgIG1ldGFub2lhLwlcCiAJCQkJCSAgIG1pY3JvY2hpcC8JXAogCQkJCQkgICBt
b3Rvcm9sYS8JXAogCQkJCQkgICBtc2NjLwlcCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BoeS9tZXRh
bm9pYS9LY29uZmlnIGIvZHJpdmVycy9waHkvbWV0YW5vaWEvS2NvbmZpZwpuZXcgZmlsZSBtb2Rl
IDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLmI4YTQ5MDg1YmI5NQotLS0gL2Rldi9udWxsCisr
KyBiL2RyaXZlcnMvcGh5L21ldGFub2lhL0tjb25maWcKQEAgLTAsMCArMSwxNiBAQAorIyBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CisjCisjIFBoeSBkcml2ZXJzIGZvciBN
ZXRhbm9pYSBwbGF0Zm9ybXMKKyMKKworY29uZmlnIFBIWV9NRVRBTk9JQV9VU0IyCisJdHJpc3Rh
dGUgIk1ldGFub2lhIFVTQjIgUEhZIHJlc2V0IHN1cHBvcnQiCisJZGVwZW5kcyBvbiBPRiAmJiAo
QVJDSF9NRVRBTk9JQSB8fCBDT01QSUxFX1RFU1QpCisJZGVwZW5kcyBvbiBSRVNFVF9DT05UUk9M
TEVSCisJc2VsZWN0IEdFTkVSSUNfUEhZCisJaGVscAorCSAgRW5hYmxlIHRoaXMgdG8gc3VwcG9y
dCB0aGUgVVNCMiBQSFkgcmVzZXQgYmxvY2sgdGhhdCBpcyBwYXJ0CisJICBvZiBNZXRhbm9pYSBT
b0NzLgorCisJICBUaGlzIGRyaXZlciBvbmx5IHRvZ2dsZXMgdGhlIHJlc2V0IGxpbmUgb2YgdGhl
IFBIWSBuZWVkZWQgYnkKKwkgIHRoZSBEV0MyIFVTQiBjb250cm9sbGVyLgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9waHkvbWV0YW5vaWEvTWFrZWZpbGUgYi9kcml2ZXJzL3BoeS9tZXRhbm9pYS9NYWtl
ZmlsZQpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLmNlMWI1ZjhhZjE1
ZAotLS0gL2Rldi9udWxsCisrKyBiL2RyaXZlcnMvcGh5L21ldGFub2lhL01ha2VmaWxlCkBAIC0w
LDAgKzEsMyBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAorCitvYmotJChD
T05GSUdfUEhZX01FVEFOT0lBX1VTQjIpCSs9IHBoeS11c2IyLm8KZGlmZiAtLWdpdCBhL2RyaXZl
cnMvcGh5L21ldGFub2lhL3BoeS11c2IyLmMgYi9kcml2ZXJzL3BoeS9tZXRhbm9pYS9waHktdXNi
Mi5jCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uYjA2ZDQyM2VhZGE3
Ci0tLSAvZGV2L251bGwKKysrIGIvZHJpdmVycy9waHkvbWV0YW5vaWEvcGh5LXVzYjIuYwpAQCAt
MCwwICsxLDg4IEBACisvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5Cisv
KgorICogQ29weXJpZ2h0IChDKSAyMDI2IE1ldGFub2lhIENvbW11bmljYXRpb25zIEluYy4KKyAq
CisgKiBBdXRob3I6IEp1biBDaGFuZyA8anVuLmNoYW5nQG1ldGFub2lhLWNvbW0uY29tPgorICov
CisKKyNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KKyNpbmNsdWRlIDxsaW51eC9vZi5oPgorI2lu
Y2x1ZGUgPGxpbnV4L3BoeS9waHkuaD4KKyNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2Uu
aD4KKyNpbmNsdWRlIDxsaW51eC9yZXNldC5oPgorCitzdHJ1Y3QgbWV0YW5vaWFfdXNiMnBoeSB7
CisJc3RydWN0IHJlc2V0X2NvbnRyb2wgKnJlc2V0OworfTsKKworc3RhdGljIGludCBtZXRhbm9p
YV91c2IycGh5X2luaXQoc3RydWN0IHBoeSAqcGh5KQoreworCXN0cnVjdCBtZXRhbm9pYV91c2Iy
cGh5ICpwcml2ID0gcGh5X2dldF9kcnZkYXRhKHBoeSk7CisJaW50IHJldDsKKworCXJldCA9IHJl
c2V0X2NvbnRyb2xfZGVhc3NlcnQocHJpdi0+cmVzZXQpOworCWlmIChyZXQpCisJCWRldl9lcnIo
JnBoeS0+ZGV2LCAiZmFpbGVkIHRvIHJlc2V0IHBoeTogJWRcbiIsIHJldCk7CisKKwlyZXR1cm4g
cmV0OworfQorCitzdGF0aWMgaW50IG1ldGFub2lhX3VzYjJwaHlfZXhpdChzdHJ1Y3QgcGh5ICpw
aHkpCit7CisJc3RydWN0IG1ldGFub2lhX3VzYjJwaHkgKnByaXYgPSBwaHlfZ2V0X2RydmRhdGEo
cGh5KTsKKworCXJldHVybiByZXNldF9jb250cm9sX2Fzc2VydChwcml2LT5yZXNldCk7Cit9CisK
K3N0YXRpYyBjb25zdCBzdHJ1Y3QgcGh5X29wcyBtZXRhbm9pYV91c2IycGh5X29wcyA9IHsKKwku
aW5pdCA9IG1ldGFub2lhX3VzYjJwaHlfaW5pdCwKKwkuZXhpdCA9IG1ldGFub2lhX3VzYjJwaHlf
ZXhpdCwKKwkub3duZXIgPSBUSElTX01PRFVMRSwKK307CisKK3N0YXRpYyBpbnQgbWV0YW5vaWFf
dXNiMnBoeV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQoreworCXN0cnVjdCBw
aHlfcHJvdmlkZXIgKnBoeV9wcm92aWRlcjsKKwlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+
ZGV2OworCXN0cnVjdCBtZXRhbm9pYV91c2IycGh5ICpwcml2OworCXN0cnVjdCBwaHkgKnBoeTsK
KworCXByaXYgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKnByaXYpLCBHRlBfS0VSTkVMKTsK
KwlpZiAoIXByaXYpCisJCXJldHVybiAtRU5PTUVNOworCisJcHJpdi0+cmVzZXQgPSBkZXZtX3Jl
c2V0X2NvbnRyb2xfZ2V0X2V4Y2x1c2l2ZShkZXYsICJ1c2IyLXBoeSIpOworCWlmIChJU19FUlIo
cHJpdi0+cmVzZXQpKQorCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIocHJpdi0+
cmVzZXQpLAorCQkJCSAgICAgImZhaWxlZCB0byBnZXQgdXNiMi1waHkgcmVzZXRcbiIpOworCisJ
cGh5ID0gZGV2bV9waHlfY3JlYXRlKGRldiwgTlVMTCwgJm1ldGFub2lhX3VzYjJwaHlfb3BzKTsK
KwlpZiAoSVNfRVJSKHBoeSkpCisJCXJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgUFRSX0VSUihw
aHkpLAorCQkJCSAgICAgImZhaWxlZCB0byBjcmVhdGUgdXNiMiBwaHlcbiIpOworCisJcGh5X3Nl
dF9kcnZkYXRhKHBoeSwgcHJpdik7CisKKwlwaHlfcHJvdmlkZXIgPSBkZXZtX29mX3BoeV9wcm92
aWRlcl9yZWdpc3RlcihkZXYsIG9mX3BoeV9zaW1wbGVfeGxhdGUpOworCisJcmV0dXJuIFBUUl9F
UlJfT1JfWkVSTyhwaHlfcHJvdmlkZXIpOworfQorCitzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rl
dmljZV9pZCBtZXRhbm9pYV91c2IycGh5X29mX21hdGNoW10gPSB7CisJeyAuY29tcGF0aWJsZSA9
ICJtZXRhbm9pYSxtdDI4MjQtdXNiMi1waHkiIH0sCisJe30KK307CitNT0RVTEVfREVWSUNFX1RB
QkxFKG9mLCBtZXRhbm9pYV91c2IycGh5X29mX21hdGNoKTsKKworc3RhdGljIHN0cnVjdCBwbGF0
Zm9ybV9kcml2ZXIgbWV0YW5vaWFfdXNiMnBoeV9kcml2ZXIgPSB7CisJLnByb2JlID0gbWV0YW5v
aWFfdXNiMnBoeV9wcm9iZSwKKwkuZHJpdmVyID0geworCQkubmFtZSA9ICJtZXRhbm9pYS11c2Iy
LXBoeSIsCisJCS5vZl9tYXRjaF90YWJsZSA9IG1ldGFub2lhX3VzYjJwaHlfb2ZfbWF0Y2gsCisJ
fSwKK307Cittb2R1bGVfcGxhdGZvcm1fZHJpdmVyKG1ldGFub2lhX3VzYjJwaHlfZHJpdmVyKTsK
KworTU9EVUxFX0RFU0NSSVBUSU9OKCJNZXRhbm9pYSBVU0IyIFBIWSBkcml2ZXIiKTsKK01PRFVM
RV9BVVRIT1IoIkp1biBDaGFuZyA8anVuLmNoYW5nQG1ldGFub2lhLWNvbW0uY29tPiIpOworTU9E
VUxFX0xJQ0VOU0UoIkdQTCIpOwoKLS0gCjIuNTYuMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
