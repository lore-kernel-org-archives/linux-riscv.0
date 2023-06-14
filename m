Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C84EB64D8
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jun 2023 15:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RO3vjZG/NjlkQyQ2aQPVr1zKx7UHtmknyC5snYUiVUA=; b=GB6z6rf3kgVush
	JXYWeUw5XoBMcL+V7bC4PbkS0ywZZrSiOIIx/5Z11Fvzsy+1NrR9KzeE1vLVjrRwnvYHsZdiKvs4s
	oFavB9LgdiIi/E4iGf6pdzuzdjfLDcFEEaBe24inokyWbMPloE3IK7P6NynibXmO8wSkDLc06wvcX
	qxoQKlrd503lnGUqmg+pAjL6u0iaOU0SL54HLCyQ6c4baq5pUBV9k1PFOOCGvg5PW7s0QXW3KF0td
	4CynVzZZW/yavlIsL1v03/bo2tvQrlAKsnJ0nxVVXSOZTBMraPf5oUe0WGa0zWwZ+Z5DhhMZFrVkb
	ky6mSOafNNDo1fdSHfEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9SrY-00C8YD-1x;
	Wed, 14 Jun 2023 15:56:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9SrV-00C8W7-1v
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jun 2023 15:56:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1686758206; x=1718294206;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=t0VLlU5N6re3pNoF7YVhEoPU3Oi/i8z/lOc/SQ76fqc=;
  b=Muxe2J6z7ikiDu8bIHfvAEdktCKg5RmzXr9Hc0s85lAK0mv91bmFZabi
   W735q8HUNkxI89vTHWL5A+epsXtr5lr/lVJlYD0sWIsIrewmaiJDaUmQ8
   KAJHyzPyHcSbcTxQ5kIYkgV5LBLzsmFIRL4SGabZqXmzDVVTxRveSXLEm
   +vdSOUiA+F328+vetWY+m5EHVKLzwx1mQlp5+0ntz80gFcUhn2GCxsctp
   7hMduyljk2jMyr8NE0oKqbwW4LgqJSApl/3G9FcVqRvo8sit/UxQYZCd+
   3BV4Ucziw7XUTe7ZZvswxdAV7u/aIIoj7MCeYDWQjJ5XndT9iLonaGqhi
   Q==;
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; 
   d="scan'208";a="216048426"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Jun 2023 08:56:44 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 14 Jun 2023 08:56:07 -0700
Received: from daire-X570.emdalo.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Wed, 14 Jun 2023 08:56:05 -0700
From: <daire.mcnamara@microchip.com>
To: <conor.dooley@microchip.com>, <lpieralisi@kernel.org>, <kw@linux.com>,
	<robh@kernel.org>, <bhelgaas@google.com>, <linux-pci@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: [PATCH v1 3/8] PCI: microchip: enable building this driver as a module
Date: Wed, 14 Jun 2023 16:55:51 +0100
Message-ID: <20230614155556.4095526-4-daire.mcnamara@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230614155556.4095526-1-daire.mcnamara@microchip.com>
References: <20230614155556.4095526-1-daire.mcnamara@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_085645_692658_3305CF58 
X-CRM114-Status: GOOD (  13.01  )
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

RnJvbTogRGFpcmUgTWNOYW1hcmEgPGRhaXJlLm1jbmFtYXJhQG1pY3JvY2hpcC5jb20+CgpFbmFi
bGUgYnVpbGRpbmcgdGhpcyBkcml2ZXIgYXMgYSBtb2R1bGUuIFRoZSBleHBlY3RlZCB1c2UgY2Fz
ZSBpcyB0aGUKZHJpdmVyIGlzIGJ1aWx0IGFzIGEgbW9kdWxlLCBpcyBpbnN0YWxsZWQgd2hlbiBu
ZWVkZWQsIGFuZCBjYW5ub3QgYmUKcmVtb3ZlZCBvbmNlIGluc3RhbGxlZC4KClRoZSByZW1vdmUo
KSBjYWxsYmFjayBpcyBub3QgaW1wbGVtZW50ZWQgYXMgcmVtb3ZpbmcgYSBkcml2ZXIgd2l0aApJ
TlR4IGFuZCBNU0kgaW50ZXJydXB0IGhhbmRsaW5nIGlzIGluaGVyZW50bHkgdW5zYWZlLgoKTGlu
azogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcGNpLzg3eTF3Z2JhaDgud2wtbWF6QGtl
cm5lbC5vcmcvClN1Z2dlc3RlZC1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5p
Z0BwZW5ndXRyb25peC5kZT4KU2lnbmVkLW9mZi1ieTogRGFpcmUgTWNOYW1hcmEgPGRhaXJlLm1j
bmFtYXJhQG1pY3JvY2hpcC5jb20+CkFja2VkLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xl
eUBtaWNyb2NoaXAuY29tPgotLS0KIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvS2NvbmZpZyAgICAg
ICAgICAgICAgIHwgMiArLQogZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLW1pY3JvY2hpcC1o
b3N0LmMgfCAxICsKIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9LY29uZmlnIGIvZHJpdmVy
cy9wY2kvY29udHJvbGxlci9LY29uZmlnCmluZGV4IDhkNDliYWQ3Zjg0Ny4uZjRhZDBlOWNjYTQ1
IDEwMDY0NAotLS0gYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL0tjb25maWcKKysrIGIvZHJpdmVy
cy9wY2kvY29udHJvbGxlci9LY29uZmlnCkBAIC0yMTcsNyArMjE3LDcgQEAgY29uZmlnIFBDSUVf
TVQ3NjIxCiAJICBUaGlzIHNlbGVjdHMgYSBkcml2ZXIgZm9yIHRoZSBNZWRpYVRlayBNVDc2MjEg
UENJZSBDb250cm9sbGVyLgogCiBjb25maWcgUENJRV9NSUNST0NISVBfSE9TVAotCWJvb2wgIk1p
Y3JvY2hpcCBBWEkgUENJZSBjb250cm9sbGVyIgorCXRyaXN0YXRlICJNaWNyb2NoaXAgQVhJIFBD
SWUgY29udHJvbGxlciIKIAlkZXBlbmRzIG9uIFBDSV9NU0kgJiYgT0YKIAlzZWxlY3QgUENJX0hP
U1RfQ09NTU9OCiAJaGVscApkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2ll
LW1pY3JvY2hpcC1ob3N0LmMgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUtbWljcm9jaGlw
LWhvc3QuYwppbmRleCA3MzA0NmJhZDE1MjEuLjVlZmQ0ODBlNDJmYSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9wY2kvY29udHJvbGxlci9wY2llLW1pY3JvY2hpcC1ob3N0LmMKKysrIGIvZHJpdmVycy9w
Y2kvY29udHJvbGxlci9wY2llLW1pY3JvY2hpcC1ob3N0LmMKQEAgLTExNDEsNSArMTE0MSw2IEBA
IHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIG1jX3BjaWVfZHJpdmVyID0gewogfTsKIAog
YnVpbHRpbl9wbGF0Zm9ybV9kcml2ZXIobWNfcGNpZV9kcml2ZXIpOworTU9EVUxFX0xJQ0VOU0Uo
IkdQTCIpOwogTU9EVUxFX0RFU0NSSVBUSU9OKCJNaWNyb2NoaXAgUENJZSBob3N0IGNvbnRyb2xs
ZXIgZHJpdmVyIik7CiBNT0RVTEVfQVVUSE9SKCJEYWlyZSBNY05hbWFyYSA8ZGFpcmUubWNuYW1h
cmFAbWljcm9jaGlwLmNvbT4iKTsKLS0gCjIuMjUuMQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
