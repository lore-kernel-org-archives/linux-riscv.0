Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 227B4C28B24
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Mar 2025 18:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CVpUqfYnysjm0fw6aJeiPCquNqErN0PaSFx8MaZIXC0=; b=kiA253uZBbrV9n
	jHeqWCvSrNdTcKNLz/rW14N7OTTOkQ50oZEEfDQCbFz2HCzy5CHX8MbATqMIe+vRgFwtEb3SIpfKs
	qd/ER6Y+0hjLcxrLxszvCAwQSFSIvULPF/AlwrYTz4YCn1j2CBqS8inAFWJvXroP/u/MF3TNDtiXb
	wbFYnCZILIGrd4sHtgTQbJHraOKk8kezCGXdjudF3Kq6lvdroc4uWFm5Qv/FdxnXMO17IHg6BU/Gr
	zjbf//eTygfixVTi0haERFoSdm3IvLX1FsQJbfFy6nDkbaumHQmdByLmH6kxDRRwGJxck3Soxp+01
	MHVwxCvf07JPsO2G8VHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqFVz-0000000BltN-47N9;
	Thu, 06 Mar 2025 18:00:11 +0000
Received: from bayard.4d2.org ([155.254.16.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqFVx-0000000BlrD-0S0R
	for linux-riscv@lists.infradead.org;
	Thu, 06 Mar 2025 18:00:10 +0000
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 9530AEC59F6;
	Thu, 06 Mar 2025 10:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1741284008; bh=BB4k9sCGkbf5g+pYpRa3583GKVlEvttSm9LNXnS04YI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kIMMxIC1TbcgCGUkVm86XhHmJ+cPzlaWghHeUSSBC/ZysmOVgw838PblEQ5n4LzUc
	 PMoAm9msDybc3+WcGMGQidRwlldnVVR+nyB+1BZkbmjem+PQETYGidqT6bd3LPGgU7
	 hN7RsHZcPOePep4rhCIlynksokLzyn5jXX3yXgvaLsvst8mMOlyiB0U4yaM/zuetDf
	 6Q8oPdFyfbwEnotun/SkphYZ7HN7Ozsz7NXEVDPTew1krBI+KZI3np6cXV2TDkvHML
	 tjqc0CHiKQqLAVLT9z23Sqz90gxRc1ZS0FG4g6fzxMDsxJJt9Qjw69CojAhr7ADjxU
	 krcctv+Y7NBcg==
X-Virus-Scanned: amavisd-new at 4d2.org
Authentication-Results: bayard.4d2.org (amavisd-new); dkim=pass (2048-bit key)
 header.d=4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3YlUjIGyC8xF; Thu,  6 Mar 2025 10:00:07 -0800 (PST)
Received: from localhost.localdomain (unknown [183.217.80.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 76327EC59F2;
	Thu, 06 Mar 2025 10:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1741284007; bh=BB4k9sCGkbf5g+pYpRa3583GKVlEvttSm9LNXnS04YI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LzMTo7U+pM1z1Yty+35WwORlLc/o/yp0orzGEexss4SgJRQX/2n4gO/rJjIcWSUi/
	 3ncA8ru/ERZXpFm3O+pPR4/p6StRos7wNOvFr9R8Ve/RAkwPIbHf55P4F0MJhGKGu2
	 tJBwG/urk21ybQf18D8xRVmiUQURSbxO/xuv0Fct+/CvoR6qIb++6aY2l6/Pch58u/
	 lWk6e4mg0BjPhd66yZPQKe/17v1sakRIZJ4cUsNTyfUxxGStZV3Rva1W0NGRtPJfh1
	 v/BRWhT2fHVgUdCA/9PEAE6eOZ+9KadmiZI39YFtIrZZrt4AszfItriESeBt9mfcdP
	 lFliMpi7iJjnw==
From: Haylen Chu <heylenay@4d2.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Yixun Lan <dlan@gentoo.org>
Cc: linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev,
	Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	Haylen Chu <heylenay@4d2.org>
Subject: [PATCH v5 4/5] clk: spacemit: k1: Add TWSI8 bus and function clocks
Date: Thu,  6 Mar 2025 17:57:50 +0000
Message-ID: <20250306175750.22480-6-heylenay@4d2.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306175750.22480-2-heylenay@4d2.org>
References: <20250306175750.22480-2-heylenay@4d2.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_100009_176614_2AC24DE9 
X-CRM114-Status: UNSURE (   9.93  )
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

The control register for TWSI8 clocks, APBC_TWSI8_CLK_RST, contains mux
selection bits, reset assertion bit and enable bits for function and bus
clocks. It has a quirk that reading always results in zero.

As a workaround, let's hardcode the mux value as zero to select
pll1_d78_31p5 as parent and treat twsi8_clk as a gate, whose enable mask
is combined from the real bus and function clocks to avoid the
write-only register being shared between two clk_hws, in which case
updates of one clk_hw zero the other's bits.

With a 1:1 factor serving as placeholder for the bus clock, the I2C-8
controller could be brought up, which is essential for boards attaching
power-management chips to it.

Signed-off-by: Haylen Chu <heylenay@4d2.org>
---
 drivers/clk/spacemit/ccu-k1.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 5974a0a1b5f6..44db48ae7131 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -558,6 +558,10 @@ static CCU_MUX_GATE_DEFINE(twsi7_clk, twsi_parents,
 			   APBC_TWSI7_CLK_RST,
 			   4, 3, BIT(1),
 			   0);
+static CCU_GATE_DEFINE(twsi8_clk, CCU_PARENT_HW(pll1_d78_31p5),
+		       APBC_TWSI8_CLK_RST,
+		       BIT(1) | BIT(0),
+		       0);
 
 static const struct clk_parent_data timer_parents[] = {
 	CCU_PARENT_HW(pll1_d192_12p8),
@@ -795,6 +799,8 @@ static CCU_GATE_DEFINE(twsi7_bus_clk, CCU_PARENT_HW(apb_clk),
 		       APBC_TWSI7_CLK_RST,
 		       BIT(0),
 		       0);
+static CCU_FACTOR_DEFINE(twsi8_bus_clk, CCU_PARENT_HW(apb_clk),
+			 1, 1);
 
 static CCU_GATE_DEFINE(timers1_bus_clk, CCU_PARENT_HW(apb_clk),
 		       APBC_TIMERS1_CLK_RST,
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
