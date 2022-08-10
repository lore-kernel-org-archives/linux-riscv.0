Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99635C00140
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Aug 2022 14:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S93etzKQi2t57vcJoK1pjuOL2h2v8xcILGhewS9IsRw=; b=wMZwHXYJj4bhsf
	pNUBPqWMOIDdR4AHx010mzYNxpKe4YQ96D+78gApwRcSE0t2koDXl3Q0sbrpDoFs1SGBb75Hetwmg
	J/ZflIIFCWHQKrZ6smOtoqi3Zhn43ZvNZgCXG2mGUEkmcTAvCGDxVJqWKTGiyM/jxqrDckQD9jNw2
	Qo26G3TAhgpf050ZwyAG49SRs+nnwr+qJlLw5L4uTbHbgANHZOD9c8K+Vo6XExAoLlvEjCsWVnzjv
	i///7qUVE2vVuW+H+xXgrI3I9FRtpPa69M0ssuC1shhxoxJziIwUiuKjwx6XzGjlfRyy1SnGscLbB
	RGQIBS74iduPH9/jdh8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLmJf-00CDE1-Uv; Wed, 10 Aug 2022 14:04:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLmJR-00CD6k-CA
	for linux-riscv@lists.infradead.org; Wed, 10 Aug 2022 14:04:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660140237; x=1691676237;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6wm8qFNBUY4i8KtmlFHnTGwoCmChYaNk0zbrd4k51PQ=;
  b=KiqVKYNsWFOqZHGFlVd0FtFM02eVucn1POTZg4IgX6Sl3nauvu58UJZx
   xtUhKu3IjdB0ABiHpl8Z0UaD+U8ksaHktSqLIwUpsKOR0nSMNiEEKA1vb
   WYIyFGfiLZyZfU6Zh9O7Pl5WMwt6CPMKGwWlACz7rTGxj8ZhjWWSCIwiB
   jQn/HqmdPfkCOWd8cDp3nNfFFrKD8nJV9pPPXSlNyFAjKqvlS3LtUV7gH
   c4Jb4YoK36QsYYAU6gigQScLjLAkJLzCM/xrkaoWz6b0139iB+DlLG2fE
   ctchIqzx6Hse/DfbDIgNHEGFtwGwP1s/kj0YPIEEvd38R1cgA9wmplx3F
   g==;
X-IronPort-AV: E=Sophos;i="5.93,227,1654585200"; 
   d="scan'208";a="108427959"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Aug 2022 07:03:48 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 10 Aug 2022 07:03:48 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Wed, 10 Aug 2022 07:03:45 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <soc@kernel.org>, Daire McNamara <daire.mcnamara@microchip.com>
CC: Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>, "Thierry
 Reding" <thierry.reding@gmail.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>, Jassi Brar <jassisinghbrar@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
	<brgl@bgdev.pl>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Arnd
 Bergmann" <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Conor Dooley
	<conor.dooley@microchip.com>, Marc Kleine-Budde <mkl@pengutronix.de>
Subject: [RESEND PATCH 1/2] MAINTAINERS: add PolarFire SoC dt bindings
Date: Wed, 10 Aug 2022 15:02:43 +0100
Message-ID: <20220810140243.2685416-2-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220810140243.2685416-1-conor.dooley@microchip.com>
References: <20220810140243.2685416-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_070401_554177_E1873633 
X-CRM114-Status: UNSURE (   9.86  )
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

U28gZmFyIHdoZW4gSSBhZGRlZCBiaW5kaW5ncyBmb3IgdGhlIHBsYXRmb3JtIEkgbmV2ZXIgYWRk
ZWQgdGhlbSB0bwpvdXIgTUFJTlRBSU5FUlMgZW50cnkuIE5vIHRpbWUgbGlrZSB0aGUgcHJlc2Vu
dCB0byBpbXByb3ZlIHRoZSBjb3ZlcmFnZS4KCkNDOiBNYXJrIEJyb3duIDxicm9vbmllQGtlcm5l
bC5vcmc+CkNDOiBXb2xmcmFtIFNhbmcgPHdzYUBrZXJuZWwub3JnPgpDQzogVGhpZXJyeSBSZWRp
bmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4KQ0M6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1Lmts
ZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+CkNDOiBKYXNzaSBCcmFyIDxqYXNzaXNpbmdoYnJh
ckBnbWFpbC5jb20+CkNDOiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+
CkNDOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxicmdsQGJnZGV2LnBsPgpDQzogR3JlZyBLcm9haC1I
YXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KQ0M6IEFybmQgQmVyZ21hbm4gPGFy
bmRAYXJuZGIuZGU+CkNDOiBPbG9mIEpvaGFuc3NvbiA8b2xvZkBsaXhvbS5uZXQ+CkNDOiBNaWNo
YWVsIFR1cnF1ZXR0ZSA8bXR1cnF1ZXR0ZUBiYXlsaWJyZS5jb20+CkNDOiBTdGVwaGVuIEJveWQg
PHNib3lkQGtlcm5lbC5vcmc+ClN1Z2dlc3RlZC1ieTogTWFyayBCcm93biA8YnJvb25pZUBrZXJu
ZWwub3JnPgpBY2tlZC1ieTogTWFyYyBLbGVpbmUtQnVkZGUgPG1rbEBwZW5ndXRyb25peC5kZT4g
IyBmb3IgY2FuClNpZ25lZC1vZmYtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3Jv
Y2hpcC5jb20+Ci0tLQogTUFJTlRBSU5FUlMgfCA5ICsrKysrKysrKwogMSBmaWxlIGNoYW5nZWQs
IDkgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMK
aW5kZXggODY4YmJmMzE2MDNkLi5mZDBmMTBhMTEwZTcgMTAwNjQ0Ci0tLSBhL01BSU5UQUlORVJT
CisrKyBiL01BSU5UQUlORVJTCkBAIC0xNzUxMiw2ICsxNzUxMiwxNSBAQCBNOglDb25vciBEb29s
ZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgogTToJRGFpcmUgTWNOYW1hcmEgPGRhaXJl
Lm1jbmFtYXJhQG1pY3JvY2hpcC5jb20+CiBMOglsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCiBTOglTdXBwb3J0ZWQKK0Y6CURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9j
bG9jay9taWNyb2NoaXAsbXBmcy55YW1sCitGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZ3Bpby9taWNyb2NoaXAsbXBmcy1ncGlvLnlhbWwKK0Y6CURvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9pMmMvbWljcm9jaGlwLGNvcmVpMmMueWFtbAorRjoJRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21haWxib3gvbWljcm9jaGlwLG1wZnMtbWFpbGJveC55
YW1sCitGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L2Nhbi9taWNyb2No
aXAsbXBmcy1jYW4ueWFtbAorRjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3B3
bS9taWNyb2NoaXAsY29yZXB3bS55YW1sCitGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3Mvc29jL21pY3JvY2hpcC9taWNyb2NoaXAsbXBmcy1zeXMtY29udHJvbGxlci55YW1sCitG
OglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL21pY3JvY2hpcCxtcGZzLXNw
aS55YW1sCitGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL21pY3JvY2hp
cCxtcGZzLW11c2IueWFtbAogRjoJYXJjaC9yaXNjdi9ib290L2R0cy9taWNyb2NoaXAvCiBGOglk
cml2ZXJzL2NoYXIvaHdfcmFuZG9tL21wZnMtcm5nLmMKIEY6CWRyaXZlcnMvY2xrL21pY3JvY2hp
cC9jbGstbXBmcy5jCi0tIAoyLjM2LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
