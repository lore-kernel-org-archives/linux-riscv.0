Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A82EE57D3
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Dec 2025 06:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vU0eEX7CrhCKf+tDZW7U2cmx/YrzAgi1f0Xds81u8Dc=; b=4IuIgoD6qw2Ma9
	k5JwhjYOvxgywlEwb5mXlDGWpoVkiYany5W/pbw/322R27SSEnmCK637odJ4OXHiljuYPfxuH96C4
	X8fqFI9P8fdO3dtjEVXzgBq9AhjihcCsaJMY6i7ZmTowbqdDe2sKh+N0HPf9fXALvWe7MlSEOqUa0
	nQQW2tUeohoxpIqykzIkBQRDIwfyrAbk6iUSaMP2vROUCvYEXcs8Wx5EwAWj1G3geiW38clTglVND
	LU3XGeoD6dK+ig3yAil0BMOfQ68hpDC8+sRLeLqyNtFtlBBi3qRpm/C2+xEQ0QlnlfFetQuiyMMb/
	DCniiCwlwZguCHsjMHZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vapwA-00000005jnn-2qCB;
	Wed, 31 Dec 2025 06:44:02 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vapw8-00000005jmj-3SFy
	for linux-riscv@lists.infradead.org;
	Wed, 31 Dec 2025 06:44:01 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1767163438; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VI7nF2C8647w9PGcx259dOFPOn5CUM9p4nYFJ9kKbKwwSDCkHU6jzZX4dc4dhvcV3X6aPTvgreKdTlKQo91uXmVNMbcHdzejTnH1VW3gqPi/nXY2gJ3AExKpQtVtIbKbfz7FJUA/v4xy6Xz9IBhocJIpd/G+/PyoLzuy1bzWOiU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1767163438; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1vYaaijdaEhbo2wB/eNaCW/MdEKtRIzlGEFILSYXQy8=; 
	b=D2c1pTYCOFp2t5bDVneZE/WXBBu6AUWtI7qKjlVg73RCGgg9ifjQGtF+C4h6y/QFThYvAjCqtrQu2Nxa/1s/udfnTtHszB7859aE0vCl17YRZrVQfeVI2sl/eu5A7U0fE4XYEWLdYrebWYEtep6dCW3trdakzoZ+B5ErW2sXK4o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1767163438;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=1vYaaijdaEhbo2wB/eNaCW/MdEKtRIzlGEFILSYXQy8=;
	b=rRPqzo2yGcvcTNXs13dUmKLPYGRIgn7Tty5BG0XaKqS4nW4GQY4NDlHxIio1smcU
	a5QxcEavZ2dZxJZfgut0SdSkwi39gFkgy7p4Tm7GOs0HKebEeA1Ga+IXr0YLp5KtFT4
	+DT1P5S1Dhpnd540AcvfgFueGPgSmRfOw9q4Mbvo=
Received: by mx.zohomail.com with SMTPS id 1767163436476260.22639634500354;
	Tue, 30 Dec 2025 22:43:56 -0800 (PST)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Wed, 31 Dec 2025 14:40:10 +0800
Subject: [PATCH v4 6/6] MAINTAINERS: Add entry for Anlogic DR1V90 SoC
 drivers
MIME-Version: 1.0
Message-Id: <20251231-dr1v90-cru-v4-6-1db8c877eb91@pigmoral.tech>
References: <20251231-dr1v90-cru-v4-0-1db8c877eb91@pigmoral.tech>
In-Reply-To: <20251231-dr1v90-cru-v4-0-1db8c877eb91@pigmoral.tech>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Junhui Liu <junhui.liu@pigmoral.tech>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767163372; l=703;
 i=junhui.liu@pigmoral.tech; s=20251228; h=from:subject:message-id;
 bh=ATqRXHl+ngDJnLDhjRAdulmSE2sYWI+H9pHj2pOMFLM=;
 b=9hYTT01ohMrx5HY6jjKFaUAW6j1OiNFZI+vC0O+9i5xl2myC1NY938DR96qqWQzShRaaJ78X8
 OndtaU11SFcBwWU+M4AbowdDSAbcj44hhcIPrG2s2LwkIqKNyIiCPpr
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=3vU0qIPJAH8blXmLyqBhKx+nLOjcLwwYhZXelEpw7h4=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_224400_917769_55A645C2 
X-CRM114-Status: UNSURE (   6.06  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add myself as maintainer of Anlogic DR1V90 SoC drivers.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5b11839cba9d..3aab1ee3e286 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1841,6 +1841,13 @@ M:	Jiaxun Yang <jiaxun.yang@flygoat.com>
 S:	Supported
 F:	drivers/rtc/rtc-goldfish.c
 
+ANLOGIC DR1V90 SOC DRIVERS
+M:	Junhui Liu <junhui.liu@pigmoral.tech>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+N:	dr1v90
+K:	dr1v90
+
 AOA (Apple Onboard Audio) ALSA DRIVER
 M:	Johannes Berg <johannes@sipsolutions.net>
 L:	linuxppc-dev@lists.ozlabs.org

-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
