Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44233CE7A8B
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Sep 2023 13:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bq9aXFuuHt2CIJexJd+yMeclZrgLMLa6q+oObG4jtz0=; b=RzByi8MuW3Flbr
	Jzp7K0vzfgQDSG57pf6ekSx06VypyfQV57hC3XbPNqmU5D/vXLgyo0nnQL4j1204vpdb4k1uGfIhh
	jQaXqEpMbPc/jlaTxp5Q3zOrlklLBcxh1jV+hlYafJMij64mQvVVFuDc9t63NkQK46Hz1NvIrPvFd
	BHI/ixK9Mt1WhC0LepFQtEc9J+Pu5A/79gNAfMyauK5dKUYU3f2qSPrJTFjaekbT1sfPtnjK/MYBN
	mhYsKUWXBUN3uVtUCD03g0rqkKJVz+JOg0wliDtsAcTnRFrYbKobvQQAc0Z73I7AqzIbQm6+r56F3
	dNrdV/gkEelc7KngvxPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkOzT-00CI7F-0t;
	Sun, 24 Sep 2023 13:17:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkOzQ-00CI68-2S
	for linux-riscv@lists.infradead.org;
	Sun, 24 Sep 2023 13:17:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4E29D60C2B;
	Sun, 24 Sep 2023 13:17:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1274EC433C9;
	Sun, 24 Sep 2023 13:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695561456;
	bh=DtqIs9kcf0Pi3SLAFZJF8tPo8Gqz8EzRzBMqGQhytyM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fP6tKk/03TdSdSfThpVR1xrFGX9NWRzrCJvTvPZThz8QoATh6QC5xMUvWbGaEGbdn
	 VyL96aL13rz6gKS77qTTkLnzHzkUICsLRJ65H5ki75QONRdtW2xo0vpeZW4Kz6F90Q
	 ubP1bBGFaGDXcB2S+WZGJVgBptxHfb7UdmU+ufaFHLrZvMZJgJAEoIYmFSj8fmpvv3
	 XKOwswRehveP/OkZV9YfDhCmaGfLQpTQGkg4RHi8+HHtUYwu3tVtLJirnexgKSdEOu
	 0IjBpKpOCcKnlw/OSLi8DTy3qbY0YGJZkWju2kONerDFV3xVDhO7ToC8wGyW6TbJeP
	 3rHXOxrVLqloA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.5 36/41] riscv: errata: fix T-Head dcache.cva encoding
Date: Sun, 24 Sep 2023 09:15:24 -0400
Message-Id: <20230924131529.1275335-36-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230924131529.1275335-1-sashal@kernel.org>
References: <20230924131529.1275335-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230924_061736_838633_600A2DF2 
X-CRM114-Status: GOOD (  10.37  )
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
Cc: Sergey Matyukevich <sergey.matyukevich@syntacore.com>, Sasha Levin <sashal@kernel.org>, aou@eecs.berkeley.edu, Drew Fustini <dfustini@baylibre.com>, samuel@sholland.org, prabhakar.mahadev-lad.rj@bp.renesas.com, Palmer Dabbelt <palmer@rivosinc.com>, conor.dooley@microchip.com, Guo Ren <guoren@kernel.org>, jszhang@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, linux-riscv@lists.infradead.org, ajones@ventanamicro.com, Heiko Stuebner <heiko@sntech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Icenowy Zheng <uwu@icenowy.me>

[ Upstream commit 8eb8fe67e2c84324398f5983c41b4f831d0705b3 ]

The dcache.cva encoding shown in the comments are wrong, it's for
dcache.cval1 (which is restricted to L1) instead.

Fix this in the comment and in the hardcoded instruction.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
Tested-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Reviewed-by: Guo Ren <guoren@kernel.org>
Tested-by: Drew Fustini <dfustini@baylibre.com>
Link: https://lore.kernel.org/r/20230912072410.2481-1-jszhang@kernel.org
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/include/asm/errata_list.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index fb1a810f3d8ce..feab334dd8329 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -100,7 +100,7 @@ asm volatile(ALTERNATIVE(						\
  * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
  *   0000001    01001      rs1       000      00000  0001011
  * dcache.cva rs1 (clean, virtual address)
- *   0000001    00100      rs1       000      00000  0001011
+ *   0000001    00101      rs1       000      00000  0001011
  *
  * dcache.cipa rs1 (clean then invalidate, physical address)
  * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
@@ -113,7 +113,7 @@ asm volatile(ALTERNATIVE(						\
  *   0000000    11001     00000      000      00000  0001011
  */
 #define THEAD_inval_A0	".long 0x0265000b"
-#define THEAD_clean_A0	".long 0x0245000b"
+#define THEAD_clean_A0	".long 0x0255000b"
 #define THEAD_flush_A0	".long 0x0275000b"
 #define THEAD_SYNC_S	".long 0x0190000b"
 
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
