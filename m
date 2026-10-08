Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F5DDCA600C
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Oct 2026 15:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=poCaD9laZs84P2jc8tvIFX0QVeB269PbomVambpQAl4=; b=aIyW2uhdr/zW0W
	nJqmb4WgaKAYSy+opKxvatPGjlaBkdygiExipa/1jaSP1gbSZ9LVKXSGb2/XbAmBByKoYx7+ibfXH
	Nxu+MbFBsmrXQ9YXEQM+ZoWsBm995RsmJcNDHq3YGFeJ8Ixl37auSLSwKk3d5PPXrf4geIWy4ndUA
	Ayz/DHcqcgu4e5zB/V1ShPwEbRyw+TjZbVlkAK/bx8rkFgDHixwacENePZDTXhyrOPvEavTdOrywg
	4OZeqTnLWHYd3bhu10nSddkdkUANaKcS8k0Us9KvszSJxrdQTnl6Ypf+uMmz+BJB5bKiNEa2udEOZ
	mbXSFtzVzvSC+7xHEwFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEpvh-00000004bGC-1OXx;
	Thu, 08 Oct 2026 15:21:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEpvg-00000004bFd-0Ql4
	for linux-riscv@lists.infradead.org;
	Thu, 08 Oct 2026 15:21:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 882326025A;
	Thu,  8 Oct 2026 15:21:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 586FD1F00893;
	Thu,  8 Oct 2026 15:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791472867;
	bh=pWhYf/PBAlBJrtYtS9eILNv9A1vD0y9OBe4mhmHYg8s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AjXZv1vpJX7GhaYYfjxgJkIW2LO+I6HbFxS/iSP7b0heDsreWRNcJtSLFUTsHG89q
	 HDN4y4Gbelr4WVSOdwOtvkYkdKqOCN66mlaj6bNt8ksQRpdm3iGlcC5x2DoEyilpMY
	 ew7vQXONJOI+IvtDnhjd7AH5KGRh4P8dtWf3qyqkC0qX4P56oV3SS9y7k1eN5hL2HA
	 Zcy703FrUtAkCyQcUOQKzTGwiePOgCDWCAFhjH1oOZg923rYtMiroJPNQaSjndck/8
	 WXQeGSMchNuF3Aw9OvunbdBQtUO7UokQAuHDewW4kQdulFJ/wIz40Q7smR/WvlcN91
	 WkyWt3HtB/7dA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 5/5] riscv: mm: unexport _pgtable_l4_enabled and _pgtable_l5_enabled
Date: Thu,  8 Oct 2026 23:00:45 +0800
Message-ID: <20261008150045.28905-6-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261008150045.28905-1-jszhang@kernel.org>
References: <20261008150045.28905-1-jszhang@kernel.org>
MIME-Version: 1.0
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

Now, these two vars are only used by kernel itself, especially the code
before MMU on. No modules users any more, unexport them.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/mm/init.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 6f51f265fb85..0d409acf9be0 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -59,8 +59,6 @@ EXPORT_SYMBOL(satp_mode);
 #ifdef CONFIG_64BIT
 bool _pgtable_l4_enabled __ro_after_init = true;
 bool _pgtable_l5_enabled __ro_after_init = true;
-EXPORT_SYMBOL(_pgtable_l4_enabled);
-EXPORT_SYMBOL(_pgtable_l5_enabled);
 #endif
 
 phys_addr_t phys_ram_base __ro_after_init;
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
