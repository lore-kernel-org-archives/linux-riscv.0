Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5813BC5479D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 12:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aYNa5H9iU+WJ+uBsFQY1/W2tWSQk0winuzjv5G3d1UE=; b=u2BbpfuGl6b6bX
	palRGtIOKD8rbz7/XO8kfv8TQGtc0h62tlYoayqbRg3gCyJNOXjoksg6CW2z16FangzFq1FiQKtr7
	2hP9fS0TS7uRzHWGTTSJADSqnnAPb9EzRVkxfob/F/b2yJmMD3qibd5e2g+acK+xJq1RKzf9GbTkQ
	+lsOi7b5d1f2CBNmZFgMBA3rlWG+ftSBE523TjCnanP/k47VYft1v5Z0YtNLYeHfuXmunuHyBRDV3
	TUpM329xlTMElDcQFkN2HEIAqEfDI+ofjj31ww5lnU0HOC6jnavRbR8u0nh1CCpE7GXSNrL8wpt7m
	JdDNeLVU4sf4Tus+hpXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFabw-00BMtz-JX; Wed, 11 Jan 2023 12:53:44 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFabs-00BMpg-Vo
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 12:53:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1673441621; x=1704977621;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CtYtMqom2J9I0DmzuoWWejdtPTMTCbaJhTt8au9b2pg=;
  b=X5LiQYn5ZpQ6E35sjjtaTK4MW3jNUNZ9EWrj2ZMsR6vgwTwmFbMqLvCX
   md/WFINiHZ6lLcVGm7ojS2LmKru4l+6GpGId7pp+T0QYy2iczLpjLs8I/
   t5CCzMStn2BxYuX1WGkJOlabbyIhmI5z0f2zK4g9Ig4GlLop6xtZv+XZ/
   xcUHXckvEciC5u+hMPxz1RmuSx5o5sLJXt8XxKStRENICqrjoPSCl9HoY
   Uw8KPznpczRmr6p6Ijc84B1BBFLwD6j6RBgYAAmAh47x3U2175ESmlCVD
   r1PKdgGEhNdy/kafHyrhKrUHx/MK5KS5nZQlRB9UTsCC0zB3MNYIMsX+3
   A==;
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; 
   d="scan'208";a="196330285"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Jan 2023 05:53:41 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 11 Jan 2023 05:53:40 -0700
Received: from daire-X570.amer.actel.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Wed, 11 Jan 2023 05:53:37 -0700
From: <daire.mcnamara@microchip.com>
To: <conor.dooley@microchip.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <lpieralisi@kernel.org>,
	<kw@linux.com>, <bhelgaas@google.com>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-pci@vger.kernel.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: [PATCH v3 03/11] PCI: microchip: enable building this driver as a module
Date: Wed, 11 Jan 2023 12:53:15 +0000
Message-ID: <20230111125323.1911373-4-daire.mcnamara@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230111125323.1911373-1-daire.mcnamara@microchip.com>
References: <20230111125323.1911373-1-daire.mcnamara@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_045341_049700_C15861D0 
X-CRM114-Status: GOOD (  10.86  )
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
bmFtYXJhQG1pY3JvY2hpcC5jb20+Ci0tLQogZHJpdmVycy9wY2kvY29udHJvbGxlci9LY29uZmln
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9LY29uZmlnIGIvZHJpdmVycy9wY2kv
Y29udHJvbGxlci9LY29uZmlnCmluZGV4IDc2ODA2ZGM1MmQxYi4uZmQwMDViM2Y4YTI0IDEwMDY0
NAotLS0gYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL0tjb25maWcKKysrIGIvZHJpdmVycy9wY2kv
Y29udHJvbGxlci9LY29uZmlnCkBAIC0yOTEsNyArMjkxLDcgQEAgY29uZmlnIFBDSV9MT09OR1NP
TgogCSAgTG9vbmdzb24gc3lzdGVtcy4KIAogY29uZmlnIFBDSUVfTUlDUk9DSElQX0hPU1QKLQli
b29sICJNaWNyb2NoaXAgQVhJIFBDSWUgaG9zdCBicmlkZ2Ugc3VwcG9ydCIKKwl0cmlzdGF0ZSAi
TWljcm9jaGlwIEFYSSBQQ0llIGhvc3QgYnJpZGdlIHN1cHBvcnQiCiAJZGVwZW5kcyBvbiBQQ0lf
TVNJCiAJc2VsZWN0IFBDSV9NU0lfSVJRX0RPTUFJTgogCXNlbGVjdCBHRU5FUklDX01TSV9JUlFf
RE9NQUlOCi0tIAoyLjI1LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
