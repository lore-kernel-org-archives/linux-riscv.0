Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B7AC001DF
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jul 2023 17:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iVEh8fLyG63RYUOfz6Kc1dsSOwgpBmoWDlBeC/hVJoc=; b=VYTVgtnlNBij2O
	heyra9KQb2FCNcRvfNLg4VlnZNqiy1HQNhm/UKCW6aMf+0XSLj8sm9fr8dSPgzq+cCDmZ+L/EfM2a
	LGnVQEE0NtGeVj8u9mrmdhMURehpgfYEmsRe2QwYFV045KSQ6PdjFWZHC7b9E9MRkxqeXVX7uAPbB
	mLXROWmu/MqE9hOVM6SJHv7E+gKO4dMRei0yqdtetB9SqresXkTHNcwMbMLr6gjBe1vUvSOzCTV54
	/fflrPYzHyxs901sW+bn7cfrpoBmrKPAJSUHaJMvHKI4Me9lXSYcVA2uQA2h9FDtsrfuDmZjwOhsn
	FJ2nQ3RC5DpZI5zF5lNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOiWW-00BCRk-1O;
	Wed, 26 Jul 2023 17:42:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOiWQ-00BCOj-2w
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jul 2023 17:42:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 653ED61BE2;
	Wed, 26 Jul 2023 17:42:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77DC8C433C7;
	Wed, 26 Jul 2023 17:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690393321;
	bh=RjbahgfYdYfP9M0jz3QU7VVuCNTGt2mp4JwSqCgXXRU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ouY6VDnGf9dajj2sdjAkhLvZjqW5N1Y3zgUaCyGcY/YxkW42toVnmaoC52mvBfLVW
	 2Pd/oCvJPFpOn8co/x0eFGsgLtnP50fcs5pfH71IqkW0LtCm/zzmgEYdBTa/qcjYIM
	 JXxjZyVocmTsUGTNzTH1SaceWtAElLPJvk/m+yZ1+hfzj/fXXI5HAy/yHJ4a3nR+ky
	 1dNzuZ+/0dPDtdBTLz5Rzmz9TTCX18TMqbb8H14swnC9Ls0UnH5Qg30hW/omftwvGj
	 LW5GQBxIwgPx/Elabnok1W/h5NzV2k0JzWDC4v8C8q14jaJCZ490JxVIJ9ZpAsgTl2
	 iE1Y2xKZI5ILg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] riscv: vdso.lds.S: drop __alt_start and __alt_end symbols
Date: Thu, 27 Jul 2023 01:30:22 +0800
Message-Id: <20230726173024.3684-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230726173024.3684-1-jszhang@kernel.org>
References: <20230726173024.3684-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_104203_005693_82C15FD2 
X-CRM114-Status: UNSURE (   8.50  )
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

These two symbols are not used, remove them.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/kernel/vdso/vdso.lds.S | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/riscv/kernel/vdso/vdso.lds.S b/arch/riscv/kernel/vdso/vdso.lds.S
index 82ce64900f3d..d43fd7c7dd11 100644
--- a/arch/riscv/kernel/vdso/vdso.lds.S
+++ b/arch/riscv/kernel/vdso/vdso.lds.S
@@ -42,9 +42,7 @@ SECTIONS
 
 	. = ALIGN(4);
 	.alternative : {
-		__alt_start = .;
 		*(.alternative)
-		__alt_end = .;
 	}
 
 	.data		: {
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
