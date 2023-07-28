Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1CE1C001E0
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 13:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wEBUYptes+zmrkvyZNsdTdWGhQ1x8Vo1nE00JYV5A6Q=; b=qAb2rrrM1K4lxg
	z7vYjypHTbQDbQh1RnGOLU/WJFyZPAiFhuOJRBHyxjL40jZKSDyPFbYk8YKG25y4jdTp465+gkhrQ
	4LJunrXHJ/8XCvl7Fswx7QgfWxPMkXtCQ+zbyJiwq8X+uM8b3j0po6sj+LfAcUuOwo02WxCwJVk6+
	r9orGmoOWLAPn6gJyou6n2Xr/4j+6zWeVOFZNl+qtP7pmnxWIFEVMkSMCHPVf1o/fgqnSr+M5Ukhr
	gtlJcuPdtOZkYQHxNZJ9nOmelfnPbTqUaUbdu1Fp0prt72DUDzMR3hT0hV3ifBHYcuOEyEeM/+o0t
	BlR5xHhW8EBWriXD8kuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPNIW-003VHa-2e;
	Fri, 28 Jul 2023 13:14:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPNIP-003VDG-0z
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jul 2023 13:14:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1690550057; x=1722086057;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1wJYS/t9aNrnjqOOsSV5jOkrGngLW9L3uxJDr/wqxEA=;
  b=Zhx+Aa36XXssQwFsDpGWx5NiS7a/ryxvRB8gxUNNOWnQMo+Bxh8nEZVb
   UfREkuxMQbNPSIco8qKMOCpV6JHQrANi4JyS2ocaplTJJsLHFiwCxV8eY
   w36cozddL/qoAdi1w9gPoGIEkh9YmSKgsJuB0pKrezhf0J5FEvdfbUUQx
   Y3iJ9rlGBIVIQhBji+U7w/RslW8F8eqVi6udWJwkPBIAA1FxeHVS3g5JF
   Hm7wcAOwmjj0Y8/M1+Y8J/+q4TUM5mzcZ1oxuxKKxOeoQua87+4h4Jqup
   oPRZwx64yPmC3+DDi4jDqu+O3seNsmFSD/aqH2dWf9VlC65q95uK1MA4j
   A==;
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; 
   d="scan'208";a="238431506"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Jul 2023 06:14:10 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 28 Jul 2023 06:14:10 -0700
Received: from daire-X570.amer.actel.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Fri, 28 Jul 2023 06:14:08 -0700
From: <daire.mcnamara@microchip.com>
To: <conor.dooley@microchip.com>, <lpieralisi@kernel.org>, <kw@linux.com>,
	<robh@kernel.org>, <bhelgaas@google.com>, <linux-riscv@lists.infradead.org>,
	<linux-pci@vger.kernel.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: [PATCH v3 2/7] PCI: microchip: Enable building driver as a module
Date: Fri, 28 Jul 2023 14:13:56 +0100
Message-ID: <20230728131401.1615724-3-daire.mcnamara@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230728131401.1615724-1-daire.mcnamara@microchip.com>
References: <20230728131401.1615724-1-daire.mcnamara@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_061417_365988_3FB3AA60 
X-CRM114-Status: GOOD (  12.65  )
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
bGUgYnVpbGRpbmcgZHJpdmVyIGFzIGEgbW9kdWxlLiBUaGUgZXhwZWN0ZWQgdXNlIGNhc2UgaXMg
dGhlCmRyaXZlciBpcyBidWlsdCBhcyBhIG1vZHVsZSwgaXMgaW5zdGFsbGVkIHdoZW4gbmVlZGVk
LCBhbmQgY2Fubm90IGJlCnJlbW92ZWQgb25jZSBpbnN0YWxsZWQuCgpUaGUgZHJpdmVyIGhhcyAu
c3VwcHJlc3NfYmluZF9hdHRycyBzZXQgdG8gdHJ1ZS4KCkxpbms6IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2xpbnV4LXBjaS84N3kxd2diYWg4LndsLW1hekBrZXJuZWwub3JnLwpTdWdnZXN0ZWQt
Ynk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+ClNp
Z25lZC1vZmYtYnk6IERhaXJlIE1jTmFtYXJhIDxkYWlyZS5tY25hbWFyYUBtaWNyb2NoaXAuY29t
PgpBY2tlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KLS0t
CiBkcml2ZXJzL3BjaS9jb250cm9sbGVyL0tjb25maWcgICAgICAgICAgICAgICB8IDIgKy0KIGRy
aXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1taWNyb2NoaXAtaG9zdC5jIHwgMSArCiAyIGZpbGVz
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvcGNpL2NvbnRyb2xsZXIvS2NvbmZpZyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvS2Nv
bmZpZwppbmRleCA4ZDQ5YmFkN2Y4NDcuLmY0YWQwZTljY2E0NSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9wY2kvY29udHJvbGxlci9LY29uZmlnCisrKyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvS2Nv
bmZpZwpAQCAtMjE3LDcgKzIxNyw3IEBAIGNvbmZpZyBQQ0lFX01UNzYyMQogCSAgVGhpcyBzZWxl
Y3RzIGEgZHJpdmVyIGZvciB0aGUgTWVkaWFUZWsgTVQ3NjIxIFBDSWUgQ29udHJvbGxlci4KIAog
Y29uZmlnIFBDSUVfTUlDUk9DSElQX0hPU1QKLQlib29sICJNaWNyb2NoaXAgQVhJIFBDSWUgY29u
dHJvbGxlciIKKwl0cmlzdGF0ZSAiTWljcm9jaGlwIEFYSSBQQ0llIGNvbnRyb2xsZXIiCiAJZGVw
ZW5kcyBvbiBQQ0lfTVNJICYmIE9GCiAJc2VsZWN0IFBDSV9IT1NUX0NPTU1PTgogCWhlbHAKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1taWNyb2NoaXAtaG9zdC5jIGIv
ZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLW1pY3JvY2hpcC1ob3N0LmMKaW5kZXggZGQ1MjQ1
OTA0Yzg3Li41Yzg5Y2FhYWI4YzkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIv
cGNpZS1taWNyb2NoaXAtaG9zdC5jCisrKyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1t
aWNyb2NoaXAtaG9zdC5jCkBAIC0xMTM1LDUgKzExMzUsNiBAQCBzdGF0aWMgc3RydWN0IHBsYXRm
b3JtX2RyaXZlciBtY19wY2llX2RyaXZlciA9IHsKIH07CiAKIGJ1aWx0aW5fcGxhdGZvcm1fZHJp
dmVyKG1jX3BjaWVfZHJpdmVyKTsKK01PRFVMRV9MSUNFTlNFKCJHUEwiKTsKIE1PRFVMRV9ERVND
UklQVElPTigiTWljcm9jaGlwIFBDSWUgaG9zdCBjb250cm9sbGVyIGRyaXZlciIpOwogTU9EVUxF
X0FVVEhPUigiRGFpcmUgTWNOYW1hcmEgPGRhaXJlLm1jbmFtYXJhQG1pY3JvY2hpcC5jb20+Iik7
Ci0tIAoyLjI1LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
