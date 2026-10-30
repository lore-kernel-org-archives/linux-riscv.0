Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0134B606A31E
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2026 22:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YTNXQExo;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CyowhQHe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EJqmsBD0CR1Vr8sxPDshvT0TUHWLNee8Je933ObEBvA=; b=YTNXQExozKW7oOfbj3ibmXVgs0
	f4law2UyQfYvuXKR/LwvEluOE/LAPoYe53T4DpuI+kxJScSm9+S/eWVpH6sUmTw4jQJ4R1Yl7EXXf
	K/iwSyNTLSYH2t3cpOCQbCfXbNf/UZcETk+jWfRjV8McsIMMoJit/o+zQXN06g5p1DvT36yB48rKo
	q35GuKRfI1eQsDawETnDu7rW74aJ0zp5VUtLHB6Pu91xgbeTB72qM/BD6vRQce1UjgqyaadcSg5Db
	871An2rSKT6Cy/W11G481JA44jS1Ggtg4sQIQMHE8PrJ/+FIoXvFZY9XWVJ6SIkyf7y0+sd5zrk76
	n/dH9ubA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMurO-0000000Cfau-2dg5;
	Fri, 30 Oct 2026 22:14:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMurN-0000000Cfam-1HgU
	for linux-riscv@lists.infradead.org;
	Fri, 30 Oct 2026 22:14:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2259B60233;
	Fri, 30 Oct 2026 22:14:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CDEC1F000C1;
	Fri, 30 Oct 2026 22:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793398443;
	bh=v96p8NzzJuOeaoy5WFJozQBW1mtjfbl/LCeCCkWteFs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CyowhQHe5fz4QAIGy6UHWgpltzIXUiXysdD2zazgsYDuqVolAp8VEcVMJNz1JVKba
	 G3UhLW+RCtqEVyWmzcpxKNJwBgwccXe2sihbaeDYMA7MjdbidCftV/5OoZc76BSbyb
	 y2iRRlafgM01L2L8TsLcZ56b49Qnl0dGDvVzz+KIcD2TPd5kTknhkyKP75XIgelBs6
	 Fp9fcLeWhbVYWlosxpMyDGz97/a4U+3Hhw0XpDpqnAGg8jqm0JaHA8hAYuvjezZHq6
	 FF3Mq19qpYc7s91TQiVW+hQiNY4LNp8eRD91TALZiTojpOSKiyxuWG2YDqR8yAkJYi
	 BEPTYBmwV53nw==
From: Sasha Levin <sashal@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	David Hildenbrand <david@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org
Subject: [PATCH linux-next] riscv/mm: fix up the mm-fixes merge of free_pmd_table()
Date: Fri, 30 Oct 2026 18:14:01 -0400
Message-ID: <20261030221401.155797-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <as0D2sHzh_UnNF5L@sirena.org.uk>
References: <as0D2sHzh_UnNF5L@sirena.org.uk>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The mm-fixes merge reuses an older resolution of the conflict in
remove_pud_mapping() and keeps the free_pmd_table() call that passes
is_vmemmap. Commit f998a21c2ba5 ("riscv/mm: fix hotplug page-table
destructor handling") in mm-fixes removed that argument, so a riscv
build with CONFIG_MEMORY_HOTPLUG fails:

  arch/riscv/mm/init.c:1657:35: error: too many arguments to function call, expected 2, have 3

Drop the argument to match the mm-fixes version of the call.

Fixes: f383866da287 ("Merge branch 'for-next-fixes' of https://git.kernel.org/pub/scm/linux/kernel/git/mm/linux.git")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
Mark, this applies on top of next-20261030 and is meant to be folded into
the mm-fixes merge resolution. Next/merge.log says it was resolved using
a previous resolution, I think the one from the risc-v/mm conflict on
2026-10-12, which had the same problem (next-20261012 has it too).

Build tested with clang: riscv defconfig plus MEMORY_HOTPLUG and
MEMORY_HOTREMOVE, W=1 build of arch/riscv/mm/ (also mm/memory_hotplug.o and
mm/sparse-vmemmap.o), and plain defconfig.

 arch/riscv/mm/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 2400537a01215..e822fce0af4b0 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1654,7 +1654,7 @@ static void __meminit remove_pud_mapping(pud_t *pud_base, unsigned long addr, un
 		remove_pmd_mapping(pmd_base, addr, next, is_vmemmap, altmap);
 
 		if (pgtable_l4_enabled())
-			free_pmd_table(pmd_base, pudp, is_vmemmap);
+			free_pmd_table(pmd_base, pudp);
 	}
 }
 

base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
