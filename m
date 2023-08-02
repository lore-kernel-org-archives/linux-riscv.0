Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29300C04E69
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 11:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k6+NMpkLRDSbZU5LMSrXRS8N2z+bZe8ygU4v0BhMJms=; b=dsBxiJoJarL51v
	IRF1KRWtRqJQasthETpMT7QJGqXp3ObO302YJ+RRB3xZCs3y+OgNNq4sCBwkQvE47ldtTNZ7OcCDP
	ZbMC7CPPihV1NYSYMUm3LLTcIhPRpIWQL5Af18K+XfPxITvqLtkhvXIFYQfIO6Abcsy6xpJlc0rWv
	LA6i3pbeKOGd2y5mKu8cFntRBqqIiSZtdXRDJ9EPB0CmaAnwhnfPD7pbjbuOOAphVGr5LdwsF18Yj
	2rH9LueD0F3w6Jkb5G/LPl6GyOL9mBLMMoHQWNtyLs5wH/xvlTR2YDNk2wkc1d6zJtSiDutlB5BXv
	OwRx2UEFEn+q4KbNLWVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qR9ns-004m5b-2y;
	Wed, 02 Aug 2023 11:14:08 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qR9nq-004m41-0l
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 11:14:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1690974846; x=1722510846;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+upP9bsbQbhCuHLUsyHfsie8k02JT+wkJ/OXUvH+dCU=;
  b=lrM4YatxbQ7g0Xa97OMVS4TzEagRsHcfV6oiyKtrxAnhWAoBwb9P/Ifs
   uP4CZWcgCelALy5rHiH6fWyxfa/RHsb7dAxGKgaDcqCcmdaHBbUt7n3mE
   Ghz/3dKptOt3GhdpjwmxuhMS1UyZwT2wbvu8rxohQRu75muTqv+XoAQUa
   6tStlFB8IKyAeJykr4cUvxL3X51c+3XL806ixZKwolKB3fLD9PgkX6qQO
   1TG2AIY2Z+8WzEQymSQsZDP88FykfTYZF1HCo1L6P6rQcODPVJfCNYgPS
   3hQyr1CrjbKaBWuVZPe2vBLAWN2vz3BfdCCbGMMbu3F5GE6RIWPj5vx7t
   A==;
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; 
   d="scan'208";a="223462648"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Aug 2023 04:14:01 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 2 Aug 2023 04:13:53 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Wed, 2 Aug 2023 04:13:50 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <palmer@dabbelt.com>
CC: <conor@kernel.org>, <conor.dooley@microchip.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Atish Patra <atishp@rivosinc.com>, Anup Patel
	<apatel@ventanamicro.com>, Alexandre Ghiti <alexghiti@rivosinc.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>, Song Shuai
	<suagrfillet@gmail.com>, JeeHeng Sia <jeeheng.sia@starfivetech.com>, "Petr
 Tesarik" <petrtesarik@huaweicloud.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [RFT 2/2] Revert "RISC-V: mark hibernation as nonportable"
Date: Wed, 2 Aug 2023 12:12:53 +0100
Message-ID: <20230802-chef-throng-d9de8b672a49@wendy>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230802-purse-hydrant-6f44f77364b0@wendy>
References: <20230802-purse-hydrant-6f44f77364b0@wendy>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=921; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=+upP9bsbQbhCuHLUsyHfsie8k02JT+wkJ/OXUvH+dCU=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCmnrIwVuNwC93y7J2XVkK/6/9F8O97lc2RvBM9Z2Hh3YuHx rK2OHaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZhI5ktGhomZ9d+dS0QK2WJO3ZFgdt WqPFWSUuq47fa0t5zly3yCaxn+KR3+ObNs0/lPHaUnqg1CpG8tu+WnzOdkF1E/j89m+dYj/AA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_041406_336234_426A6F6F 
X-CRM114-Status: UNSURE (   9.68  )
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

Revert commit ed309ce52218 ("RISC-V: mark hibernation as nonportable")
as the kernel now has a way to handle the "no-map"-less, PMP protected,
reserved memory nodes for the affected versions of OpenSBI.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/Kconfig | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 4c07b9189c86..47aef21073f9 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -866,11 +866,8 @@ menu "Power management options"
 
 source "kernel/power/Kconfig"
 
-# Hibernation is only possible on systems where the SBI implementation has
-# marked its reserved memory as not accessible from, or does not run
-# from the same memory as, Linux
 config ARCH_HIBERNATION_POSSIBLE
-	def_bool NONPORTABLE
+	def_bool y
 
 config ARCH_HIBERNATION_HEADER
 	def_bool HIBERNATION
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
