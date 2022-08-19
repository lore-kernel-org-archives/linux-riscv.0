Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 580FBC32771
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 08:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9yp5G4SSgfyGQT3+qKJsSEiSt0RGkXjXAPeW5GGxlWs=; b=fJ9tKu8zxGZjtF
	L50bQtOTk/G9qqBg8+8pcK7kLeV9NdBCYXTYAL0gO25aDUzfevaBgNvThfQAD8WNl2O+kLtYfKM2O
	tmIeZWm6d6KIMHF71vg16zwjiJB028F0nvAboShoUxEb3lkwqNxhU2+fFvT3ahKw0hcjwktg7FAHy
	+uNwLByqw+YtHjflfv5KQt0fY8MGIi7VCmPl3/PH2ZW/Ka8saEcswJ/Os4qAT6Ehs2rS1P1IjfNlr
	T06DeJL64g4cledzTopmU9jA5FdlMoipSbSQlBMcWDN65vZYKopjsNw2xrlz263Y1s1kQEg9XTGvG
	nVixjQV57XlrEdYh1Qtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOxpV-004RfC-AA; Fri, 19 Aug 2022 08:58:13 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOxpR-004Rad-Td
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 08:58:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660899490; x=1692435490;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ziIKS5pUN4XvJWFDzWjnZe0+IpFs3iXynkoSh+5gFuY=;
  b=aOTMyLcGzX07W39dEPW7wOPe07qj9eoG78pmGajSFDlG0ia3O6hkPro5
   U58wjrugCVcETn+OWgEuGj4Ox3WNt+9jEZTPODExCKHYd/oRO6EWctBOd
   3mieYu+Sa8Xh7QSqidj0A+1l5VB4lZHk8bDuovNsu/d2TEhPvUlmB97Fd
   r3TNmzgdMqjABsslJtYuCbcXwl0sKFPOFgNmq+YQZ0zPtN+L2pK8gtoTg
   sZBysUlkv4G6HHSh3IAfoy5j77efL85/qhhIamiGc1JARfy/Aq4fK7Ded
   08qAukXAIwUocMC0Dz0f//7guKIVhyaNMy6WiWH4Fa6tNy+cuF0mDlxD/
   A==;
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; 
   d="scan'208";a="170004569"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Aug 2022 01:58:09 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 19 Aug 2022 01:58:08 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Fri, 19 Aug 2022 01:58:06 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-pwm@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Conor Dooley
	<conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH v9 1/4] dt-bindings: pwm: fix microchip corePWM's pwm-cells
Date: Fri, 19 Aug 2022 09:57:01 +0100
Message-ID: <20220819085703.4161266-2-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220819085703.4161266-1-conor.dooley@microchip.com>
References: <20220819085703.4161266-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_015810_051111_D9E9DF4B 
X-CRM114-Status: UNSURE (   8.62  )
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

Y29yZVBXTSBpcyBjYXBhYmxlIG9mIGludmVydGVkIG9wZXJhdGlvbiBidXQgdGhlIGJpbmRpbmcg
cmVxdWlyZXMKXCNwd20tY2VsbHMgb2YgMi4gRXhwYW5kIHRoZSBiaW5kaW5nIHRvIHN1cHBvcnQg
c2V0dGluZyB0aGUgcG9sYXJpdHkuCgpGaXhlczogZGY3N2Y3NzM1Nzg2ICgiZHQtYmluZGluZ3M6
IHB3bTogYWRkIG1pY3JvY2hpcCBjb3JlcHdtIGJpbmRpbmciKQpBY2tlZC1ieTogUm9iIEhlcnJp
bmcgPHJvYmhAa2VybmVsLm9yZz4KQWNrZWQtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWlu
ZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+ClNpZ25lZC1vZmYtYnk6IENvbm9yIERvb2xleSA8Y29u
b3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Ci0tLQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3B3bS9taWNyb2NoaXAsY29yZXB3bS55YW1sIHwgNCArKystCiAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3B3bS9taWNyb2NoaXAsY29yZXB3bS55YW1sIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3B3bS9taWNyb2NoaXAsY29yZXB3bS55YW1s
CmluZGV4IGE3ZmFlMTc3MmE4MS4uY2Q4ZTlhODkwN2Y4IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcHdtL21pY3JvY2hpcCxjb3JlcHdtLnlhbWwKKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3B3bS9taWNyb2NoaXAsY29yZXB3bS55
YW1sCkBAIC0zMCw3ICszMCw5IEBAIHByb3BlcnRpZXM6CiAgICAgbWF4SXRlbXM6IDEKIAogICAi
I3B3bS1jZWxscyI6Ci0gICAgY29uc3Q6IDIKKyAgICBlbnVtOiBbMiwgM10KKyAgICBkZXNjcmlw
dGlvbjoKKyAgICAgIFRoZSBvbmx5IGZsYWcgc3VwcG9ydGVkIGJ5IHRoZSBjb250cm9sbGVyIGlz
IFBXTV9QT0xBUklUWV9JTlZFUlRFRC4KIAogICBtaWNyb2NoaXAsc3luYy11cGRhdGUtbWFzazoK
ICAgICBkZXNjcmlwdGlvbjogfAotLSAKMi4zNi4xCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
