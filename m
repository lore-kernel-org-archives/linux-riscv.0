Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A48F2C61DD9
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Aug 2026 17:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=14Zty5hXcTua6OytXEdJUInNF9ORooogsFSKWUJWrr0=; b=qZGs9reuUTrBKz
	9ZYKrpH3WoAgO04u7bar+zH5t3sknUznkGxl/MoT3hctO1Pl2Ws3YVSvqrbSEYNvhnTFnVEIXR1yO
	CsgL+z/q6QcBwCL7sKQZpZ92yy0gIQqX/hqQgxf9alsZhahG1c+q8t+EZayteBA/t68TezDFMSu7K
	Id+cbktjQUuightIsBfJahbMYtaqw9ULvV8pIiFCkhBfonNbTlMz5Ps/gdrtCJHmVKqEuII+px6yY
	EY5l9eGNahTgZmVsmsr5l5Elz2QXfQzPmmDxvxt9RrKMfuIgs+XsRCoJv1SomuVh0pHDaJxfFmRhf
	6GcG33ST0bnLVnGsC1Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0jLj-00000007xiw-3Kbo;
	Sun, 30 Aug 2026 17:29:43 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0jLh-00000007xiZ-2VIB
	for linux-riscv@lists.infradead.org;
	Sun, 30 Aug 2026 17:29:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Content-Type:From:Reply-To:Subject:Content-ID:
	Content-Description:In-Reply-To:References:X-Debbugs-Cc;
	bh=y8EWALKMsn0yqDus0dEK4QAKpzd7V5rJBTqkM69q4yw=; b=VJ2Y3h/sKsuShouVP+qsI5feF8
	07lGE4m9SSc3zoeeIiPkTebNEkflogG4Tl1LVrJuS+Asx0tCrqqdUFuipcSUQ59nhz30/WVOEngjP
	QEpCvWiab4PwtoWhEJR2G0Ya8G2JOfUE5yFa9viPgRpjL1O/EGfq70w7ZdQ95hS/OMtMa5KHl26uD
	GZD+MC18iBWox9uZ5Pn5u830EH1Kpza/hw/fAdVxrHbrkdGc8xaVKe1kxtdmEWh7Pwd1Q+kZXUTfQ
	OlMXXOi5s/QiOSOMsHZc9CAu/HxVSqn36iJL13Z1IPzFsAQfd5JuQhMbsd40TaMzaYqSk1qRpObre
	kMBKl7wA==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1x0jLd-0000000AClZ-1vsa;
	Sun, 30 Aug 2026 19:29:37 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Yixun Lan <dlan@kernel.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	stable@kernel.org,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH] clk: spacemit: k3: add 2.0 GHz PLL3 and PLL4 rates
Date: Sun, 30 Aug 2026 19:28:54 +0200
Message-ID: <20260830172925.3245444-1-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_102941_637098_35CA829C 
X-CRM114-Status: UNSURE (   9.30  )
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

Starting with version k3-br-v1.0.7, the vendor U-Boot configures the C0
and C1 CPU clock domains (X100 cores) to 2.0 GHz instead of 2.2 GHz.
PLL3 feeds C0 and PLL4 feeds C1, but their rate tables currently contain
only the 2.2 GHz overclocking operating point. This causes the linux
kernel to hang at boot.

Add the 2.0 GHz configuration in both tables to fix the issue. Tested
with both k3-br-v1.0.5 (X100 running at 2.2 GHz) and k3-br-v1.0.7 (X100
cores running at 2.0 GHz).

Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: stable@kernel.org
Fixes: e371a77255b8 ("clk: spacemit: k3: add the clock tree")
Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 drivers/clk/spacemit/ccu-k3.c | 2 ++
 1 file changed, 2 insertions(+)

The related U-Boot change is available at:
https://github.com/spacemit-com/uboot-2022.10/commit/274f664150dade144df265baf7dc8e15dd9cce52

diff --git a/drivers/clk/spacemit/ccu-k3.c b/drivers/clk/spacemit/ccu-k3.c
index d676a692bccb4..40a2dab1a2a71 100644
--- a/drivers/clk/spacemit/ccu-k3.c
+++ b/drivers/clk/spacemit/ccu-k3.c
@@ -30,10 +30,12 @@ static const struct ccu_pll_rate_tbl pll2_rate_tbl[] = {
 };
 
 static const struct ccu_pll_rate_tbl pll3_rate_tbl[] = {
+	CCU_PLLA_RATE(2000000000UL, 0x0b292aaa, 0x0000ab00, 0xa0558686),
 	CCU_PLLA_RATE(2200000000UL, 0x0b2d3555, 0x00005500, 0xa0558787),
 };
 
 static const struct ccu_pll_rate_tbl pll4_rate_tbl[] = {
+	CCU_PLLA_RATE(2000000000UL, 0x0b292aaa, 0x0000ab00, 0xa0558686),
 	CCU_PLLA_RATE(2200000000UL, 0x0b2d3555, 0x00005500, 0xa0558787),
 };
 
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
