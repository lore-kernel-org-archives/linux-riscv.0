Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 944EFC4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 14:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O6FupQ2Nu3ff5DpN5lRFWKhXQ6l98aB2vOtB33wZo2g=; b=pNUXP/NTB4cmk7
	iHG6yb10ItDfwRPnx+SyoBSzqizCoPnJFFFwlJH2JuOC6SZ502pNOH0NAHq7CX0+hEtZ7muooeqO2
	gIMTysNf34fCK2l4oz0RDAwN4r/ZSAcNXclZwIGCO/eowgVnBZOlwwycjgdRs9zLOATzillh+n+pY
	bhLbZQrYaDCpQfg9hpclFeJJqn7l1RwZpY8vSHlyFYYsbTSWyZOHJLBi5kUDqVnmoNgo4n08LvuQn
	H5eXcdU/IoQL4x3A3sr4F+J4c07W61KkWzkDNJl+77OhS9iQX+iB6PEXe8IJWuCpdib6+Pp/W1eit
	3nTgLBXNHwTMDWBdlTeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxq1y-005Swd-2b;
	Tue, 31 Oct 2023 14:47:46 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxq1v-005SvF-1p
	for linux-riscv@lists.infradead.org;
	Tue, 31 Oct 2023 14:47:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 3FFBBB810FB;
	Tue, 31 Oct 2023 14:47:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9743DC433C7;
	Tue, 31 Oct 2023 14:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698763661;
	bh=Lu+n2p2pZbXtBJDb9PGw8r8PEELlHYVE3usf7oO4ETw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oitGirTCWjbWfYHnitdDxJqMb7j5jLjmKI/Ey4XR/cl04TvK1J3uV4ZcHF9lOecE+
	 6RdVH0DweZ7hhLTAZ/Enszo8HBqwb0xCPIpOw9JDK0gTIcq3P/P/Pk/CtrqbIPPKAz
	 co9du/LUdGLt5Lig+5ZGZcFKCyC7elj49LsMXF72RRALMcJ2ugSn3gdSqjLOsz6rJh
	 8pf6VRh3+KslebVtRvpFUp+OTWQyyyV0YyCES1Z4u+1+yMBC6XyFq707L1C22+C2ab
	 7MX7LmChWX4cH1DjrpoIuPdtWx2dzLSLgErc1bzDqdDglf4i13GOk05Ka7lXhxvwcs
	 H5bUlTcJ7p+Fg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	tobias.schaffner@siemens.com,
	Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH RT v2 2/2] riscv: allow to enable RT
Date: Tue, 31 Oct 2023 22:35:21 +0800
Message-Id: <20231031143521.441-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231031143521.441-1-jszhang@kernel.org>
References: <20231031143521.441-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_074743_749032_60BE4CE2 
X-CRM114-Status: UNSURE (   7.09  )
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

Now, it's ready to enable RT on riscv.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 5f43b82691fc..b8e60ebaedf9 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -48,6 +48,7 @@ config RISCV
 	select ARCH_SUPPORTS_HUGETLBFS if MMU
 	select ARCH_SUPPORTS_PAGE_TABLE_CHECK if MMU
 	select ARCH_SUPPORTS_PER_VMA_LOCK if MMU
+	select ARCH_SUPPORTS_RT
 	select ARCH_USE_MEMTEST
 	select ARCH_USE_QUEUED_RWLOCKS
 	select ARCH_USES_CFI_TRAPS if CFI_CLANG
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
