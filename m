Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF2CD778BC
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jan 2026 22:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YWN0ZysUmon7xraUkSOiCg3ckDaD3cSJurzQWfMmibA=; b=2SYDg2KmF/Gh+8
	SMy5nUkfYtZlUfkPw4y87FOTO8LLWXQsnd0A6BYwUHqOpP+rHaLi1cU4CAXFLZ8voA8PEKSVQCPOO
	OrOZqkJjv9OoxrGQzO2lxNFjZsU9xSFjBY4LyJPUup0DDEFWydw/MWUKi8+DgcmSU4RzHx9fQF7OH
	Pk2wuQoD0qUkLsTLWlBoJYU4+x7nqdM4X1iuuoU3FaUptGlfqR4C8tnUgzndWi5yBcv0IClzEJL9A
	cqQWwduMVJ0l5dw3hR/RyrNynYgLbkn369MG+SHbWyMKGIWmrmPr3IHcjszo33EeptycVA39x8I7p
	SY58fMvN9hEVwR9KPjIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjPh3-00000009YTj-33MA;
	Fri, 23 Jan 2026 22:31:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjPh1-00000009YT1-0Dja
	for linux-riscv@lists.infradead.org;
	Fri, 23 Jan 2026 22:31:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9D5A1400E0;
	Fri, 23 Jan 2026 22:31:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6DCBC116D0;
	Fri, 23 Jan 2026 22:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769207509;
	bh=HyVIiSrJJIt7GX/lLQJuD1cL5dFgVqaR0/nP435+22k=;
	h=From:Date:Subject:To:Cc:From;
	b=pgGVlCzCgYMcOs9xVbUI1i0nDPLUhoLLjEnVZeaJruwMMObft7qFsw7Piz6foD8Ne
	 jjcl2rk9co8DvIJ78xZbO8G/ppAwHIILYpYOgoDs9krH/mGw0nY/00JeWWFc5Bngoc
	 nZmG+7nnA9TTdEi23LO+v810xhYKn8rurg/5a6kVrl4Pl2MvFUaw4+LteysMaVlLYC
	 BPVbzYwyrvGXW+MZ+2IeAvpXpGf25GwF8NwGpB40LY+nTWuTxKoag12S6SNUElAqMf
	 Do4ae6hbzCANGGzbGjLHBo8lX23bYiyJL/9l5KBui89G5uM+757bCAfzVRFpsOehk4
	 VJYHefCmHGiVA==
From: Yixun Lan <dlan@kernel.org>
Date: Sat, 24 Jan 2026 06:31:28 +0800
Subject: [PATCH] riscv: defconfig: spacemit: k3: enable clock support
MIME-Version: 1.0
Message-Id: <20260124-06-k3-clk-defconfig-v1-1-802674ef2762@kernel.org>
X-B4-Tracking: v=1; b=H4sIAMD2c2kC/x3MQQqAIBBA0avErBvQNIOuEi1KxxoMC4UIpLsnL
 d/i/wKZElOGsSmQ6ObMZ6yQbQN2X+JGyK4aOtEZIWWPwmBQaI+Ajrw9o+cNSa+KtNLaiQFqeSX
 y/PzXaX7fD0Wje8BlAAAA
X-Change-ID: 20260115-06-k3-clk-defconfig-e4b3e4344d07
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 spacemit@lists.linux.dev, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1123; i=dlan@kernel.org;
 h=from:subject:message-id; bh=HyVIiSrJJIt7GX/lLQJuD1cL5dFgVqaR0/nP435+22k=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpc/bQO3/YysBjB+08qB/g/sLBKStT/t+0Uy+q/
 YY1zKVOFGuJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaXP20BsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+3iWQ/9Ht8S3fHsF5xv9fnMTZD6ZmRPjgyHOz47srRkCHjTVA395ClrdCmoT
 mpwk+Y9AJR50ioswjGt3ii/MtCPU1kvNXSUkYUqUNkzy/WO27Nx4OCkx/EjkwU7brXrp9jWQKCl
 DVtuwbcxJM+si8mxhmxtAuBoOXX4FGO39iGB2F6dN26DVPDQDRJqx8c6FCa3p51Tu+isDsiH5DR
 RbExD5QeFtiP3OuL/jt6CAlu1nHs5Cfpea1+5Y28C46lAZJfEslWu/oxawdykK6JEopOxyBXvri
 vcr2GWdvj7e7rnyKzL0e8pCNhDhH5LH+AFhCetBVCNH/NdtvCJIyFZSZ84wobZ3Uv+kHt9iyEpV
 6qS2WyTAqMNMm9gQLmURbjCiost7OklBz3IHMIqXXKKxCjA/yrMPlWMwVI5YSaiDxipWi4xDgvE
 FD74m6BfAmcESGo6pNDQNs44/2VxNdz4cr0gr8FS69pcrgzbuEGVBFxBkE/tSJ2QuvWV9UFoE4t
 T2lERh/V7tq+HLc+eUPqRbqTW8j9ZqC+Sq/YvQ6q5SKr64oL9v9NuDXICfIQcWnBg7bcWnc5xqZ
 fGmXdx/oS9Ad7fWGyw6CwhQQffpJOP7P/cB80G8jEobFv1kqW+y6hjx5VxbfjDx7TJzpkbPtIyz
 8Ch++sE54f/BFuBZC5Csl3VdJsGvpw=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_143151_140852_C462641D 
X-CRM114-Status: UNSURE (   9.60  )
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

Enable the clock driver support for SpacemiT K3 SoC, configure it as
built-in by default, but users should be able to change it as kernel
module if needed.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
This patch depend on clock PR [1] which already accepted by clock
maintainer.

Link: https://lore.kernel.org/spacemit/20260114092742-GYC7933267@gentoo.org/ [1]
---
 arch/riscv/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index cd736a1d657e..6ce600081a6b 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -255,8 +255,8 @@ CONFIG_CLK_SOPHGO_CV1800=y
 CONFIG_CLK_SOPHGO_SG2042_PLL=y
 CONFIG_CLK_SOPHGO_SG2042_CLKGEN=y
 CONFIG_CLK_SOPHGO_SG2042_RPGATE=y
-CONFIG_SPACEMIT_CCU=y
 CONFIG_SPACEMIT_K1_CCU=y
+CONFIG_SPACEMIT_K3_CCU=y
 CONFIG_SUN8I_DE2_CCU=m
 CONFIG_SUN50I_IOMMU=y
 CONFIG_RPMSG_CHAR=y

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260115-06-k3-clk-defconfig-e4b3e4344d07

Best regards,
-- 
Yixun Lan <dlan@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
