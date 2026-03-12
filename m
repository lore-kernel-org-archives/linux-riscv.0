Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D55F8FED2F9
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Mar 2026 10:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=356DD9Pv3DKHlrdrY4rQJMTN+tvXMqTOJotXEh+4QvQ=; b=kF6AHPwQQdIuVT
	fSFmYyrxECH7GlgPx8sQA7DnFbesDAayZqcGUpLj2CP1tvZZN7JaTbGQ52+h+Y9e5RZvjfJzinm2q
	3JxCcgjqiddiK3kFLySm/+zQ7t1wgu1nIwZOJ8mH0YrTCEaFnSPDmXxJttHqd3tyalViUnxnACyr6
	BTE5OZ96LLbVaNZhXGXkWqNxhcCQQVpCwkop9LV/PUyitRfzVSVKiNKlEI798wwVJN/3PxcN4N88M
	/UTSQC4D6M7F6fDTheNMD2WrNPXJFkpbZoiQheaCSYWuYA55iOci4oCU9QGuthbCYnS+1pKUVpqzC
	zkWjSe3z/IxkCgz4McSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0d1a-0000000DqSH-2LcR;
	Thu, 12 Mar 2026 10:12:14 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0d1Y-0000000DqRQ-1vt5
	for linux-riscv@lists.infradead.org;
	Thu, 12 Mar 2026 10:12:13 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 19E0C1A2DEB;
	Thu, 12 Mar 2026 10:12:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DF6365FDEB;
	Thu, 12 Mar 2026 10:12:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3782310369C61;
	Thu, 12 Mar 2026 11:12:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773310327; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZScxyatlTWwp4VNBkqTha4B6duYhO6GHXUx9ibpGkcE=;
	b=uTy1jOSgn+W8bTv2Bu4HIkJ8axtG/wxKhMn+PbT6zK+r5oqzCkIgeV0QZcW/LQGyWkDjIC
	21cUmsPqAuliL36gz5dC82ca7VnYBtrVVlmCYMFT9c+OGPOzrVTACPxsT/Jsp79ELcW9ZL
	yDHOVpcBarPpgEcakALDfZgunbdvLRP/lvbcGrwswLN2uzGPCP0LewYtKmyi3mzm6oqtYa
	uQ+JpyQUuK7PfkpMx+RFci2j2NzaSgbgR0ci0gGlLRxhydcEChudsq5l6rvSM2BHdZhO6x
	BF/fUQAiyBZ0xoCx4Z+5LKINSwkONA2qgogKbav9QeWb1pIqGRpxAWSKWSdxFw==
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
Subject: [PATCH 2/3] net: macb: set MACB_CAPS_USRIO_DISABLED if no usrio config is provided
Date: Thu, 12 Mar 2026 11:11:37 +0100
Message-ID: <20260312101138.465482-2-theo.lebrun@bootlin.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312101138.465482-1-theo.lebrun@bootlin.com>
References: <DH0PZN0WJZC5.26KLH464PMMTP@bootlin.com>
 <20260312101138.465482-1-theo.lebrun@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_031212_697554_CABDB34A 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
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

YnAtPnVzcmlvIGlzIGNvcGllZCBkaXJlY3RseSBmcm9tIGR0X2NvbmYtPnVzcmlvIGluIG1hY2Jf
cHJvYmUoKS4KCklmIGR0X2NvbmYtPnVzcmlvIGlzIE5VTEwsIHdlIGRvIG5vdCB3YW50IHRvIGxh
bmQgaW4gVVNSSU8gd3JpdGUKY29kZXBhdGhzIHdoaWNoIGRlcmVmZXJlbmNlIGJwLT51c3Jpby4g
SW5oZXJpdCBhdXRvbWF0aWNhbGx5Ck1BQ0JfQ0FQU19VU1JJT19ESVNBQkxFRCB0byBhdm9pZCB0
aG9zZS4KClRoaXMgbWVhbnMgYSBtYWNiX2NvbmZpZyB0aGF0IHdhbnRzIHRvIGRpc2FibGUgdXNy
aW8gY2FuIHNpbXBseSBkcm9wCml0cyAudXNyaW8gZmllbGQsIHJhdGhlciB0aGFuIGFkZCB0aGUg
ZGlzYWJsZWQgY2FwYWJpbGl0eSBleHBsaWNpdGx5LgoKTml0OiBkcm9wIHRoZSBkdF9jb25mIE5V
TEwgY2hlY2sgYmVjYXVzZSB0aGUgcG9pbnRlciBpcyBhbHdheXMgdmFsaWQuCgpTaWduZWQtb2Zm
LWJ5OiBUaMOpbyBMZWJydW4gPHRoZW8ubGVicnVuQGJvb3RsaW4uY29tPgotLS0KIGRyaXZlcnMv
bmV0L2V0aGVybmV0L2NhZGVuY2UvbWFjYl9tYWluLmMgfCA2ICsrKystLQogMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L25ldC9ldGhlcm5ldC9jYWRlbmNlL21hY2JfbWFpbi5jIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQv
Y2FkZW5jZS9tYWNiX21haW4uYwppbmRleCBlY2FiN2ZkYzk2MmQuLjk3MjQ5OWFhNDE5MSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvY2FkZW5jZS9tYWNiX21haW4uYworKysgYi9k
cml2ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNlL21hY2JfbWFpbi5jCkBAIC00NDcwLDggKzQ0NzAs
MTAgQEAgc3RhdGljIHZvaWQgbWFjYl9jb25maWd1cmVfY2FwcyhzdHJ1Y3QgbWFjYiAqYnAsCiB7
CiAJdTMyIGRjZmc7CiAKLQlpZiAoZHRfY29uZikKLQkJYnAtPmNhcHMgPSBkdF9jb25mLT5jYXBz
OworCWJwLT5jYXBzID0gZHRfY29uZi0+Y2FwczsKKworCWlmICghZHRfY29uZi0+dXNyaW8pCisJ
CWJwLT5jYXBzIHw9IE1BQ0JfQ0FQU19VU1JJT19ESVNBQkxFRDsKIAogCWlmIChod19pc19nZW0o
YnAtPnJlZ3MsIGJwLT5uYXRpdmVfaW8pKSB7CiAJCWJwLT5jYXBzIHw9IE1BQ0JfQ0FQU19NQUNC
X0lTX0dFTTsKLS0gCjIuNTMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
