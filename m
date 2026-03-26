Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33978106F2EA
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Mar 2026 08:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hX22uCL/QVhEX0IxcH+/n28ghDXoEQx+uewt9qYAdS4=; b=r8THVV57cCgUy5
	s6kHzJpgLeZd7UOquHw9IXSeVNbduX08sczWSlIq7z2XESgznvkLCk744K287nhPWKN4BRchLbsGF
	8lIs5uEw+ciZYvswv2kiCUon8CHhs7WPmhoft7AvDHQD8b2vMBxqetGSNFN59FP8GG6LznZY9QtKX
	RYprxdQYVLDg+TH8P9ZVQe9ybjtXS6rtspMfjftV53nZ4NYUk6KqmFmQ30OeXGirXqFPlZ9qZFLCh
	QCcxgMm+dDcw1kAIagK21vwPvpUSGxhQIKxXr/XKb50Dey53o4Wl4++2jIvMsWdx09NFAoFv7d8Zi
	Ce9ax6NdDaKg0N21t/gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5fvj-000000050wG-0azu;
	Thu, 26 Mar 2026 08:19:03 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5fvg-000000050kU-1xY0
	for linux-riscv@lists.infradead.org;
	Thu, 26 Mar 2026 08:19:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1774513107;
	bh=Studu0k/n9z14zDJV1h1L4Kn9GEQMK1n1wHuQJFah/Q=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=kqg/px8UYGFPmkLHRUUpCwSfAxigmicLLRHoFKJbjDNL7fAupcvpU8FfflN8nWL40
	 loWPixfTSKZs2dUgEd8lZBbxOwn1ux8xlw3K6dJ4JkrDPpc+bhznbh09/vJtFkMNr8
	 3KXpsDlshwnPmgy9Wk8AfZwsQjXrwxZb7APUA9Tk=
X-QQ-mid: zesmtpgz7t1774513105t6cf23f4d
X-QQ-Originating-IP: rhkr4OIM8wOQVb3/TfoSlxRrCFVj2YHp4XOnKSG7UTo=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 26 Mar 2026 16:18:22 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15177264318608331693
EX-QQ-RecipientCnt: 20
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 26 Mar 2026 16:17:21 +0800
Subject: [PATCH v2 6/7] clk: spacemit: k3: mark top_dclk as CLK_IS_CRITICAL
MIME-Version: 1.0
Message-Id: <20260326-k3-pdma-v2-6-ca94ca7bb595@linux.spacemit.com>
References: <20260326-k3-pdma-v2-0-ca94ca7bb595@linux.spacemit.com>
In-Reply-To: <20260326-k3-pdma-v2-0-ca94ca7bb595@linux.spacemit.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Guodong Xu <guodong@riscstar.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 dmaengine@vger.kernel.org, linux-clk@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774513072; l=1061;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=mv7b6gV7xcbyvtla4k2qyYdge7fji5fF/G64h63zMqU=;
 b=AOZZbqkbKXvFEXN8Ag51jUtNqfdKDsTUTnUdwSv5MzkOfejmRsTFHaeaDzqMP9iF7BGm5GZHK
 e9IQCiLlgqpDP/0lAuZ9ONcn+xlmOpjVoG9KAYrYXa+daCVUvsWCADP
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NoILeipjSpyOq0pzlqeFLWPuhc04CdLhScFKY+cNFlWnwwkukElxRKan
	bvi4rjsbQ3ILCiIEb+qHqxB3DTWiRj75innV+I4F3O/B6cIQGmKFBCsGpxXDrzFIb351h0p
	ZwiCJzeY9ufLdTTLFUV+CI3OOnSyVPFo2oA9U27hq4zkBQv1EJBEHZYTl1WmjM55CEJ+Nuw
	7VT2QEnA71mOsTu2dAa+LylL5woEUxTPYD4lZWdWqAsLGURGCtoUkbjtVFPHiVIzZSStKcL
	wxAg8ew9Y9kRy53k/d5qg+nfiY6VfZGikO7hHH5KoJZRdxcesvj07Ifbx9YNZ/+PKa/mbtc
	JfCdx8jCnNrR07I/3w0cboco14ZGHOKRbYXq0cvQMQ5/HeoMCWqXDZalVa5Ic30v373Kyrb
	u27JZtwQLD7bcXNGUbu9B/araWTcGPuBbWmQv/53Tz4Tmn349bDaXKuiOoiKKUFRsJFHZrH
	G03zRhar/DtRGw9rGJpsl/TiQUdnlQn+Yky1sQK0XvxG1BinH8elxQ8bEgTcP6PzKkWj7WF
	Dfn+WzeQj2VhAE3X8w4gd/DHl04E2zsoFCktYiPqJwBbnFWmBjwngC0XtIjZpzI+d4eWmE8
	dRFjuvOvwtwYRvI1cBw2OVJ3rWeq3kG3Oe0JqAe5a79OFHsyWGBj6MhBBWfNuK0I+YmhGXq
	k9eRw5DXNCw8GTFk0gQamrprIYC2JdAX7YdqDWJBjkYKFy+Spx9nLHdkcUsKX/wSFoq8ExY
	PDEWnZlPqmQnc8uxj2QjrmvpyIhgOqXRTZ93SMnFRJFRi+eFyu7FXsEiaG0pdp55M5Dofr8
	IIYgoNHGMHWiODEeBCtPMU7818wgMsQdxtBk1V25HxzrkRyJCdWEdP+CTvi0vlM///AAx99
	YIx+nORHiImvMgdt3R1XP3TbrNGDJTAm0ollJ+LFxyyrGSYI356+AkKKsRyL70janHuSMcP
	0xweNOImRX4oFJ5hXnl4u2RddrIL1H8sGVkcssc2aQKmLE78uIp2vXGs3jY9QfZrq5CsSoy
	JyCdeuEWpQFoQU2HmNJ8jWmJSRY/0grD5kGBdjcok6WDlOkqqhjbkBkbexxZeu0cseibccu
	ImlKcLSqzcuFi+USD5TZU99JqaiMmXXM0johuhdyqsLLHU77QHIEnE=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_011901_346737_95B5D4E3 
X-CRM114-Status: UNSURE (   9.59  )
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

top_dclk is the DDR bus clock. If it is gated by clk_disable_unused,
all memory-mapped bus transactions cease to function, causing DMA
engines to hang and general system instability.

Mark it CLK_IS_CRITICAL so the CCF never gates it during the
unused clock sweep.

Fixes: e371a77255b8 ("clk: spacemit: k3: add the clock tree")
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 drivers/clk/spacemit/ccu-k3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/spacemit/ccu-k3.c b/drivers/clk/spacemit/ccu-k3.c
index e98afd59f05c..bb8b75bdbdb3 100644
--- a/drivers/clk/spacemit/ccu-k3.c
+++ b/drivers/clk/spacemit/ccu-k3.c
@@ -846,7 +846,7 @@ static const struct clk_parent_data top_parents[] = {
 	CCU_PARENT_HW(pll6_d3),
 };
 CCU_MUX_DIV_GATE_FC_DEFINE(top_dclk, top_parents, APMU_TOP_DCLK_CTRL, 5, 3,
-			   BIT(8), 2, 3, BIT(1), 0);
+			   BIT(8), 2, 3, BIT(1), CLK_IS_CRITICAL);
 
 static const struct clk_parent_data ucie_parents[] = {
 	CCU_PARENT_HW(pll1_d8_307p2),

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
