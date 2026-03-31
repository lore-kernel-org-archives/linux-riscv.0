Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 314E2FF60EC
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 08:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hX22uCL/QVhEX0IxcH+/n28ghDXoEQx+uewt9qYAdS4=; b=uw0h4TO3dmTiNZ
	oZSkgdKR2gzNhDjyldXXWEbIyimiyfGEitIt8tDZ3zaOkr99a/mpcw7n0gDSJm/jibsLY+1hZV3jF
	pEuMTIH+QzEHjaRWvpjciizgUhuSNTkTo/NnNKjMSNaDfUp3APtQ0Gwf0Vp1JJGUF9MhFpsY7eT7Z
	3aTsflHjQicj0EHsVzvsWawn18A1HoKmUjMRc39xLraraO1NWDcSaITmyfp8A9lqb19HJG504Uuxj
	dqUoNutCCib1Wh/fRQx0VKv0Z2gQYisVxYlrsZu/5ylnfCpO7/bKmzyhGFwnJUzmkmr0p0RPnzlPM
	h08BbRETHQankthqXcRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7USH-0000000CauF-399h;
	Tue, 31 Mar 2026 08:28:09 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7USE-0000000Cao2-2Blx
	for linux-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 08:28:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1774945656;
	bh=Studu0k/n9z14zDJV1h1L4Kn9GEQMK1n1wHuQJFah/Q=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=lNpnK1asHpWgYcFYBviHrmJ3weyxxzn+1HaS0pQWL0Q3ymyVUSUuC3G/wrNJEYTRH
	 0gj/hJqXGzOfAYyVFTf/hMqcjW54A7Sfq6vcprtj/ABkKVaEOVfUGFMoSvqfF1XS1A
	 CKnEfLYDD2nAtNH1nk1/QMCc7+pcppNB1CAQotgE=
X-QQ-mid: zesmtpsz7t1774945654td8ab8023
X-QQ-Originating-IP: TQhp/ZrVHPtl+vBXLGoCKFgoAIP7WeyphVUXqGQwDic=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 31 Mar 2026 16:27:30 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9390468519669649579
EX-QQ-RecipientCnt: 20
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 31 Mar 2026 16:27:07 +0800
Subject: [PATCH v3 4/5] clk: spacemit: k3: mark top_dclk as CLK_IS_CRITICAL
MIME-Version: 1.0
Message-Id: <20260331-k3-pdma-v3-4-a4e60dd8b4b3@linux.spacemit.com>
References: <20260331-k3-pdma-v3-0-a4e60dd8b4b3@linux.spacemit.com>
In-Reply-To: <20260331-k3-pdma-v3-0-a4e60dd8b4b3@linux.spacemit.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Guodong Xu <guodong@riscstar.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774945629; l=1061;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=mv7b6gV7xcbyvtla4k2qyYdge7fji5fF/G64h63zMqU=;
 b=AJE30IyHx1It2xMUW82/N9fT6bWetRXlmFgLKmw8Qq2CA36y4QcDv+Kg3aitBRBArZkC7n+vW
 M7oN34zm1lnBuDWKmXAGjwRhqvkvhjVlFBXZaYca5YuFLzxZ7drcvnc
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NpQK2HsutDKlISHv1CQePnnWSvlxEVyIWC3wVkDVF2viGUok+bRH48iz
	LRl1u6pGksO34sQPPobRmlTsKUkWSJuCvjl53Z7jW9vSqMcbOGM2dDN7LgEyM3p0y7/QUXy
	fX5S05s7YrUan0L1txsvLcGNOyKVRVPBBztnXLHQucy7LRasAhGIOfO6wxPPl+rOP1eB7MD
	MXO9akVwH7z17v+8Trc8jB7fvjbnKbIZNuNBSytzAS+YmHV0wHFpDfC1Hhw4NW1LoKRDPEU
	KWfakw3B1XHYGFsWD3RCJK32sJB9hePy/0AcPR3NGaS8gxISTcvvzypUGinIoywvZrMlkY6
	6lfdHQgmRrmza4XoVZloKopWH/wzmmIOH2byzvKvkFcnrxWMmnWUzJQoDbanlscKp4OlEmI
	Ci8YflbNnmsvM2ow6i9jyFrIxK7huWIL7J8ZjJzyMKidLoQTxvxMK3dJYUPiJAS4NXorx08
	9CNxkbj8dElKwyqAWU30um9v+Hg1TMMX7y/EPd5d0OaT1Cw+2uB1rerJxavQmujSR8kdj4N
	f57QJIpskK3ae0wxAExJWnl0LrKEYxxVX8a1QN9gDfD6gM+EQo39TZ+M8GgTTmGlIPp6r5K
	zUhYMXwXhb7NC1AztNFyplsH4YDM/elhDB8t17IZOAjfqzcnLcvxuNciZF02cGNSTKt+dBt
	0zcpqvgDCPWgS8o0Z4vYh5crp2QMYaPZc1S1V4wpPxshDqB6oLfM/o7atv+ZgcedXYwsNod
	ynQPAvDbW6GE42Ntd4zI6ZH2h3h7VrM6q6WsBtp90kOgQ9SsgYk1ksZacB9uWXk7V5bAiPs
	qFKNZsYZSQ508X+JC/HH4EBaV3FIdzmuqFdD8z9cC5sqgIg+E03NI3Q7nipFsEC0ZS3AZGQ
	4zFd2bZ2tWsE+oEibmow2rfOKokTt51TC8qSNRQQDtlfurbiky9v/Z1NrEFiOBJZe3vH5Jx
	RogKANw31fBYtCYQCJiNXfRxn7r4l/3dhmqYZ+YzOfyzo/C8I5Cgvhm0scqKtTIw4Yt9JvF
	XlETNg4oA1/m6YENFqnrdCZn0gJBUgc6qD7Fev+ufxRZ+6XzoQY62LCYPOmPPT2MCzuKntI
	bWP/hhJ58+qBJiIV/o7mkCp5T+UPWUhQv3WJP8vGmZhmzhKRdnywetILup3bT1HFqnWreUT
	JAVxajvkQXi1cMT+iKU7hXb6rA==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_012807_004094_96EA9C8D 
X-CRM114-Status: UNSURE (   9.14  )
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
