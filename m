Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 538D1C98321
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jan 2026 10:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q6J4MX5DXghTDpw8ORBbrv1+92BkYqrqzhSW+p9nsFs=; b=AA/3nEfblrY3lo
	h5Y2gL++aLCTlkcaJmNrXxfZ/2uwJSyq1UQ0d1cwFl2COHPqUu4VHcwnB7n6UKH9g9a7FNgb/d982
	noen1lkF9sI1n93HGha9Uyvd1Kk7I/xpvLjLXFO9SldV+sTY7YGgpG70KVdlhnAZ0W0DMNsZMJqMq
	y6tCz+iGle5uhGLSf2o1+hLKtOu3bxq3WTd2QtoFQbTQ2HFlXVGxO4Id5odegueXfYi09UL+8wtnz
	RA7bF22hNtH6czyXLrsTmMkBb5w9a+TURmqKxw9wUTGCYUzzqqo0hPb2PCUBHrTkJhHoEo4pzMlj+
	YVBABhfkZDg7/YA78FRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vh3Hs-0000000FQtn-35FP;
	Sat, 17 Jan 2026 10:12:08 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vh3Hq-0000000FQtB-1qD9
	for linux-riscv@lists.infradead.org;
	Sat, 17 Jan 2026 10:12:07 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1768644722; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OKJyt+wl9GRYaZNuL2HojPyQRmff3OENDlcg+FHoYVjVvoONapvECKXTc84wQwkWv23W3v4jifoQgfM72+qDgfgS/FkJff1RgX/xUslZfg9Ovu1uUF+ymo+Qsx3EIp+tSBcie/Oe84fzedPMmOAYC5YL4Z2YOT6wfMIYU9+etA4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768644722; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+PJwbsCjeL6ZMwDjx33KA6Ejndk0qEwRwBHqTWZvm3o=; 
	b=J0i5T/xA8Ks/P9yMGTP/FwicNau3JbqFrwXqQgvfgFpl2zVWjsYisZmlM36Bl6gA0q/URMDN6U6jwG6wOvQrRglY5ETcZ9fhLaGMjZT+DAt0DZbMpbF+dd7o6srUXF02+0dRGEn/BTl7p1p1s3fPjL6kn4y9mrby4CiUiJ9RamQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768644722;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=+PJwbsCjeL6ZMwDjx33KA6Ejndk0qEwRwBHqTWZvm3o=;
	b=OkkAesZ+ztKKEecOcFgflwEqU1uGBX6Lq28XZxIxj/FqUsemZLipEOrHTHB22vqc
	JU6aGcDqyAuikb+TspKdkzMH6Nb9RlTJJBdaN8EexbTzMuQGSHJJju9Dm2gCo7MO9VJ
	uRH480Trmlj1xtjZxhCYT2QeI4HcL9cNkvj0zxpY=
Received: by mx.zohomail.com with SMTPS id 1768644721081835.1354482909551;
	Sat, 17 Jan 2026 02:12:01 -0800 (PST)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Sat, 17 Jan 2026 18:06:22 +0800
Subject: [PATCH 1/2] reset: canaan: k230: drop OF dependency and enable by
 default
MIME-Version: 1.0
Message-Id: <20260117-k230-reset-dt-v1-1-c8cbaef1e1ac@pigmoral.tech>
References: <20260117-k230-reset-dt-v1-0-c8cbaef1e1ac@pigmoral.tech>
In-Reply-To: <20260117-k230-reset-dt-v1-0-c8cbaef1e1ac@pigmoral.tech>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Junhui Liu <junhui.liu@pigmoral.tech>, Conor Dooley <conor@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768644706; l=885;
 i=junhui.liu@pigmoral.tech; s=20251228; h=from:subject:message-id;
 bh=abEe4zvJORGN3X/yMWvKTSB5fdrqCB2zPWi6bzldic8=;
 b=o5RsGMteqrJnt1c218SGzBuWKmZHY5FB8+4eXwxjnJ4sZMCrApu9QMqDkw7LD6OKKDHBGX2lP
 kPPRuAb5CWLBgCyuw/pzaEKGjS8fX1wFcSXs5VkHMAXWS+MBIZuFdMb
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=3vU0qIPJAH8blXmLyqBhKx+nLOjcLwwYhZXelEpw7h4=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260117_021206_540823_0CC69E96 
X-CRM114-Status: GOOD (  10.33  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The driver doesn't use any symbols depending on CONFIG_OF, so drop the
dependency. Also, enable it by default when ARCH_CANAAN is selected.

Fixes: 360a7a647759 ("reset: canaan: add reset driver for Kendryte K230")
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 drivers/reset/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 78b7078478d4..b3b9e0f9d8c4 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -150,7 +150,7 @@ config RESET_K210
 config RESET_K230
 	tristate "Reset controller driver for Canaan Kendryte K230 SoC"
 	depends on ARCH_CANAAN || COMPILE_TEST
-	depends on OF
+	default ARCH_CANAAN
 	help
 	  Support for the Canaan Kendryte K230 RISC-V SoC reset controller.
 	  Say Y if you want to control reset signals provided by this

-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
