Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B22EFED2F9
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Mar 2026 10:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SNrgHJGLerRqJeFenDhkRI8otP4QFLCKwvVhO0nwGkU=; b=EuTojd7Nd2JqAt
	0KE6CLbMWeKfKLHIIktUI46Or8I58pxN49kCHmyWP+PlCf2+OGe1IJqWUQz03bxg0+YMdM0TGsXbZ
	nrlM/jrwD9LbNN/iCBbhPDvAPSkTl4rLCOEMc3PUe78bvLJtFASgbiUzqpBAdRxSVLi2M/EsJNtLw
	SXsDEWFFo/bCs4djgqcSRTMWTRCar8LEdzLgdJLvt7Xzp8ORVtB0CXrry7sgPCBtddUFVRDWPVXdA
	DnMxvzyf64mqJ4zIvchL0jQet0sE5YVJ/n0NfvMN+T2bEclXcZx+GU0R/65A3o31MnQm3m1/iS4Kb
	Ik7Mx65PEAZzePIKCkBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0d1m-0000000DqVt-0naW;
	Thu, 12 Mar 2026 10:12:26 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0d1j-0000000DqUw-3T6W
	for linux-riscv@bombadil.infradead.org;
	Thu, 12 Mar 2026 10:12:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=Lj7v8KqAHFpPD+bbuLSZdQfcrsKxuMLWjY2vWELEISw=; b=BAlTcVXPXwzMPGt/HFTcuHZZxl
	dOdSxET2t5x7YeFBy1P9iIGYHzqCBckRKpY7Hxz4mDi+anuxb2YUqiqd96OepmjhgR7sdPAseZHWe
	kydkxjv/dCw7GvT32LLVMdjw3WIBeaga78KYSVjs700FSXAyFFpCXN6EnXHhPszdPUPDYs9gGK5Km
	09IzMn2XGgl9X1gIxUVxshc8iiHMBaC62QYcDXM0FGCMTbv03e3pMQ9UasecjZS3CsWToStqzbV/7
	QwnKVuvGdiOb6fRTUvEALCIOAkGmbeBLMVZgaBM9mRtPf7Vdf+TjdWN/ocTmOk0Q4Z9GB/sXfnJMV
	IYUdSr1g==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0d1g-0000000BABM-3iz8
	for linux-riscv@lists.infradead.org;
	Thu, 12 Mar 2026 10:12:22 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 61335C4159D;
	Thu, 12 Mar 2026 10:12:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B21AB5FDEB;
	Thu, 12 Mar 2026 10:12:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6DFE610368916;
	Thu, 12 Mar 2026 11:11:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773310320; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Lj7v8KqAHFpPD+bbuLSZdQfcrsKxuMLWjY2vWELEISw=;
	b=hp+t8ykUahsGtr0cK+M2lXNRD8ODQBIMFRzp3qoMPndxGauz3WJl2gZGyJzv9rhO2BzEfB
	1mm3ifxAGhW7gOtndV6Gl3tkVBlR3+3FdlMpPy0imKO3GHrhGDWHURUtDsVGhnhSkWbVJ2
	vlZZOSiXo3OYnXKM2LtpoPcNH3F/FRg1j5daWQizrIAZNlRhcv3UAMgbjrRtuM3AZV/AOz
	Rse89qlv1VJlId9mybaJP8pnudgIBP8Vq0Xio+EdwngnUruw89lPzhcq1QXF9HEdxOEi+L
	D3g4uqfDV052jeAwt7ganfNXgo5JZ0TFE37HrOwHwaoi4ngOxPISMyqI6Z6X5w==
From: =?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>
To: theo.lebrun@bootlin.com
Cc: Ryan.Wanner@microchip.com,
	Valentina.FernandezAlanis@microchip.com,
	abin.joseph@amd.com,
	alex@ghiti.fr,
	andrew+netdev@lunn.ch,
	aou@eecs.berkeley.edu,
	claudiu.beznea@tuxon.dev,
	conor+dt@kernel.org,
	conor.dooley@microchip.com,
	conor@kernel.org,
	daire.mcnamara@microchip.com,
	dave.stevenson@raspberrypi.com,
	davem@davemloft.net,
	devicetree@vger.kernel.org,
	edumazet@google.com,
	gregory.clement@bootlin.com,
	krzk+dt@kernel.org,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org,
	nicolas.ferre@microchip.com,
	pabeni@redhat.com,
	palmer@dabbelt.com,
	pjw@kernel.org,
	richardcochran@gmail.com,
	robh@kernel.org,
	samuel.holland@sifive.com,
	sean.anderson@linux.dev,
	thomas.petazzoni@bootlin.com,
	vineeth.karumanchi@amd.com
Subject: [PATCH 1/3] net: macb: runtime detect MACB_CAPS_USRIO_DISABLED
Date: Thu, 12 Mar 2026 11:11:36 +0100
Message-ID: <20260312101138.465482-1-theo.lebrun@bootlin.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <DH0PZN0WJZC5.26KLH464PMMTP@bootlin.com>
References: <DH0PZN0WJZC5.26KLH464PMMTP@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_101220_967154_C671CBB2 
X-CRM114-Status: GOOD (  10.00  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RENGRzEgKGRlc2lnbiBjb25maWcgMSByZWdpc3RlcikgY2FycmllcyBhIGJpdCBpbmRpY2F0aW5n
IHdoZXRoZXIgVXNlcgpJL08gZmVhdHVyZSBoYXMgYmVlbiBlbmFibGVkIG9yIG5vdC4gVGhlIE1B
Q0IvR0VNIGRyaXZlciBoYXMgYSBjYXAgZmxhZwppbmRpY2F0aW5nIHRoYXQgSFcgaGFzIHRoZSBm
ZWF0dXJlIGRpc2FibGVkIChkZWZhdWx0IGlzIGVuYWJsZWQpLiBBZGQKdGhlIG1pc3NpbmcgY29u
bmVjdGlvbiBiZXR3ZWVuIERDRkcxIGJpdCBhbmQgTUFDQl9DQVBTX1VTUklPX0RJU0FCTEVELgoK
SW5kaXJlY3QgaW1wYWN0OiBhdm9pZCB1c2VsZXNzIHdyaXRlbCgpIG9uIFVTRVJJTyByZWdpc3Rl
cjsgdGhpcyBpcyBub3QKYW4gaW1wb3J0YW50IGZpeCBiZWNhdXNlIFVTRVJJTyBpcyBhbnl3YXkg
cmVhZC1vbmx5IHdoZW4gZmVhdHVyZSBpcwpkaXNhYmxlZC4KCklmIGZvciBzb21lIHJlYXNvbiBh
IGNvbXBhdGlibGUgc2V0cyBVU1JJT19ESVNBQkxFRCBidXQgRENGRzEgaW5kaWNhdGVzCml0IGlz
IGVuYWJsZWQsIHdlIHN0aWxsIGtlZXAgdGhlIGRpc2FibGVkIGNhcGFiaWxpdHkgZmxhZy4gVGhp
cyBlbnN1cmVzCndlIGRvbid0IGJyZWFrICJjZG5zLG5wNC1tYWNiIiB0aGF0IHNldHMgdGhlIGZs
YWcgZnJvbSBjb21wYXRpYmxlIG1hdGNoCmRhdGEuCgpTaWduZWQtb2ZmLWJ5OiBUaMOpbyBMZWJy
dW4gPHRoZW8ubGVicnVuQGJvb3RsaW4uY29tPgotLS0KIGRyaXZlcnMvbmV0L2V0aGVybmV0L2Nh
ZGVuY2UvbWFjYi5oICAgICAgfCAyICsrCiBkcml2ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNlL21h
Y2JfbWFpbi5jIHwgMiArKwogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNlL21hY2IuaCBiL2RyaXZlcnMvbmV0
L2V0aGVybmV0L2NhZGVuY2UvbWFjYi5oCmluZGV4IDhlNTMwNWY5YTc1NC4uMTY1MjdkYmFiODc1
IDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNlL21hY2IuaAorKysgYi9k
cml2ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNlL21hY2IuaApAQCAtNTI0LDYgKzUyNCw4IEBACiAj
ZGVmaW5lIEdFTV9JUlFDT1JfU0laRQkJCQkxCiAjZGVmaW5lIEdFTV9EQldERUZfT0ZGU0VUCQkJ
MjUKICNkZWZpbmUgR0VNX0RCV0RFRl9TSVpFCQkJCTMKKyNkZWZpbmUgR0VNX1VTRVJJT19PRkZT
RVQJCQk5CisjZGVmaW5lIEdFTV9VU0VSSU9fU0laRQkJCQkxCiAjZGVmaW5lIEdFTV9OT19QQ1Nf
T0ZGU0VUCQkJMAogI2RlZmluZSBHRU1fTk9fUENTX1NJWkUJCQkJMQogCmRpZmYgLS1naXQgYS9k
cml2ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNlL21hY2JfbWFpbi5jIGIvZHJpdmVycy9uZXQvZXRo
ZXJuZXQvY2FkZW5jZS9tYWNiX21haW4uYwppbmRleCA2YWM2ODczMTc4NGYuLmVjYWI3ZmRjOTYy
ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvY2FkZW5jZS9tYWNiX21haW4uYwor
KysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNlL21hY2JfbWFpbi5jCkBAIC00NDgxLDYg
KzQ0ODEsOCBAQCBzdGF0aWMgdm9pZCBtYWNiX2NvbmZpZ3VyZV9jYXBzKHN0cnVjdCBtYWNiICpi
cCwKIAkJCWJwLT5jYXBzIHw9IE1BQ0JfQ0FQU19JU1JfQ0xFQVJfT05fV1JJVEU7CiAJCWlmIChH
RU1fQkZFWFQoTk9fUENTLCBkY2ZnKSA9PSAwKQogCQkJYnAtPmNhcHMgfD0gTUFDQl9DQVBTX1BD
UzsKKwkJaWYgKCEoZGNmZyAmIEdFTV9CSVQoVVNFUklPKSkpCisJCQlicC0+Y2FwcyB8PSBNQUNC
X0NBUFNfVVNSSU9fRElTQUJMRUQ7CiAJCWRjZmcgPSBnZW1fcmVhZGwoYnAsIERDRkcxMik7CiAJ
CWlmIChHRU1fQkZFWFQoSElHSF9TUEVFRCwgZGNmZykgPT0gMSkKIAkJCWJwLT5jYXBzIHw9IE1B
Q0JfQ0FQU19ISUdIX1NQRUVEOwotLSAKMi41My4wCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
