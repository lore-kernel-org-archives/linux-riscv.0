Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D27ED5B161
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Dec 2025 03:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WUv399xqBsCR5v0z6PB/OCLZW6JBTHEkRTNrpl61bWE=; b=edq9bkt1vJCDJg
	drEict555DeQrq/rbuYX4EK/XsVi+cubyVB4OHsIg1k1UpX9wMQ07oAdoOFaS5DEANCTqdMC2Spzx
	UIpQ3+Vo83ewPtFtxwRFhVgJMb2yMYf6BegDa3wkRH1Ejezke+cMrm8aXlzcMaVvhbF2bakSSNl88
	OwUc+EE7lOcnKDaoXcyaarAtRAASOlNru4krfRUlO8//8tMmkPjZOxhLyANQMtdT6k0f4OKX+gMkk
	r7F0mLVtNZ4nmOs2YpKl1YVnJu8ZulC2Z76k4F3r2QClBUrYaG++74nXXQsBgoU+b0MaI6+4ExkaN
	FIXIta3eb/myTZpkwhEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVM1Z-00000004dwJ-3z1x;
	Tue, 16 Dec 2025 03:46:57 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVM1X-00000004dub-0DHD
	for linux-riscv@lists.infradead.org;
	Tue, 16 Dec 2025 03:46:56 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1765856813; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Z2dKmtO2ATHJFwnFhiqKHJBC2VDL6z5LvMSfklStHM/4T3gwfQR+lP1kHbrwapHBcrKEgH3xwGpwexui+z9cDU/SLCMmZMgUaxyxPHQhubwSh3ft/JnF0SaAIB1K3eGxwJkgBnDfAFsr1nkDoBD04WT82bRef5hZMw7RbS9/SSM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765856813; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Ug+ZDoA4Rf5aQ/L3KHfd427l87YDPU42ReTHvUHZ8eI=; 
	b=R/M7YKxD+FzeGOZOEcnxAIh9Vh8RyRKj9Ze6JrFj4Tf+HNvX1tB5PPRuKsTJCXY/hQM7LbnO1m2c6+TC719oWGbsxA44ACZNPw8O8CFfpBYnuL+1IGJzzba6pKhITXTIvEdpTzCK/sfB4WuI95S8YKf2Z7NlwsK087TMPRuwLLs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765856813;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=Ug+ZDoA4Rf5aQ/L3KHfd427l87YDPU42ReTHvUHZ8eI=;
	b=D83RnUHu5zapNG1/J+8VXR4ZpHiurHSa0xbecZXNY/xXgoZCCBoOaPio43cSBT5Y
	CUnid6R2AmvXfdrdW2aGRHqQFOmrsj3kKKep5PsgPJTjdW0M18Ym4xJfL2MnazI7YlF
	3IsDUTmZ7fTw+4I3tzxncIB8xIR4Oh/zb30ipUS0=
Received: by mx.zohomail.com with SMTPS id 1765856811386140.78787853841845;
	Mon, 15 Dec 2025 19:46:51 -0800 (PST)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Tue, 16 Dec 2025 11:39:46 +0800
Subject: [PATCH v3 6/6] MAINTAINERS: Add entry for Anlogic DR1V90 SoC
 drivers
MIME-Version: 1.0
Message-Id: <20251216-dr1v90-cru-v3-6-52cc938d1db0@pigmoral.tech>
References: <20251216-dr1v90-cru-v3-0-52cc938d1db0@pigmoral.tech>
In-Reply-To: <20251216-dr1v90-cru-v3-0-52cc938d1db0@pigmoral.tech>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Junhui Liu <junhui.liu@pigmoral.tech>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765856765; l=759;
 i=junhui.liu@pigmoral.tech; s=20250910; h=from:subject:message-id;
 bh=sFArHp8MxTT//WO8noDWEOyCEAt8z/zx+uO9S3+romA=;
 b=byowsbfcpmQVLRa60RaakgxIYq3+FbPv/WhkvWluy9LNYXVUAxemKPz93OapxIy4vS/7MCtqu
 ISXYnipt55nDcNJjmzWywkWrJRCn67AmmTZZHslc8f3OJOQSXOrbw3d
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=cgATWSU1KfGWmdwNmkPyHGnWgofhqqhE8Vts58wyxe4=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_194655_151521_32AA5B86 
X-CRM114-Status: UNSURE (   6.53  )
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
index 5b11839cba9de1e9e43f63787578edd8c429ca39..3aab1ee3e2864397fbf510ec506a0fa498588e99 100644
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
