Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D25C8C433FE
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Oct 2022 11:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zPl5RUpErF0vy5+N5qeYbYS2rUKk2m0Rw3wzJLSTmq8=; b=F4BdlOYTjJY2Zd
	nwxjAEuOK89vwYWDUgYbDUsdaGmVSaPtoF8epr63rHgTDTsjPuKWYoSBXZxwLbqeTk0FHHRGEgk7g
	hQg+ESC3vyWYGkLMXbf/2o+ydSR6iKxSiH0I0bQ6fvJzsvWnLUYHGROQ9jLvJLJv+2Ki/g6kT97QJ
	L2yhANbmfKHkebIm3qY7NUIa5hHBj3nP1KykOB0x8JSJTRK5bZxrmyZSmp9rEZfBlQH/xbRRejYns
	ydqTnd0PMPb+DIwYORNc6E/x6p+oTOyh7BJAbuZhxXWfsf0d3uHjcIc8k7epfHzmBRRV/vJuYLt85
	X2BiE1r0v5oQkOmjeS6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogldw-008hmn-AI; Fri, 07 Oct 2022 11:35:52 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogldt-008hlU-2G
	for linux-riscv@lists.infradead.org; Fri, 07 Oct 2022 11:35:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1665142549; x=1696678549;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MHG2thRoVjC0ho07WGF50KRaA5/RfSwJFArrPBDrMJ4=;
  b=iuJyOme/10VPYn5Zh964XyaK+3695R2P/IY3Uf5vGcaIKseQWkmDODGq
   uFthKvq8ZMAImDQBBTGSpLMvNxj89s322tVRh38saiWIuckJaKJOqKoxG
   PaVgyXE2B6+PIc+pC33ttcF01LKuXDl685SRFJKgxwMPOI1k1AMpYfk8Z
   uPw6QyuyPcSZqlIbbWacXyU/yYKw0V/q4iLt81O/LjhN5HPZXsDwkt6mF
   uNXoC63amKC4MHDkDeVrhxTil1UmPlYZIPxQsYGp35IZkCxLULOsRcL29
   dpXNNo+PJcDQ7hoYEDlrUTGXucUVPL4Q1t3vPKl3mwfuc4xAXYuooStjP
   Q==;
X-IronPort-AV: E=Sophos;i="5.95,166,1661842800"; 
   d="scan'208";a="177501339"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Oct 2022 04:35:48 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 7 Oct 2022 04:35:44 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Fri, 7 Oct 2022 04:35:42 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-pwm@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Conor Dooley
	<conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH v11 1/4] dt-bindings: pwm: fix microchip corePWM's pwm-cells
Date: Fri, 7 Oct 2022 12:35:10 +0100
Message-ID: <20221007113512.91501-2-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221007113512.91501-1-conor.dooley@microchip.com>
References: <20221007113512.91501-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_043549_189646_5261CEE0 
X-CRM114-Status: UNSURE (   8.42  )
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
ICAgICBkZXNjcmlwdGlvbjogfAotLSAKMi4zNy4zCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
