Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB11C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Dec 2021 05:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/PHHe4b0xs/ajSeQJBwv0fI0zpJVCwTgZzPC6mUzMPE=; b=AdZrFZ/9CrtmYu
	8fXCXl2upBwrzVt92qghr0rpjXmkulqwNN3n7iPK2WuUIGWb/XxeCHZSsQWf3XowYP63e+9l0keTd
	RrnT77rNhlkGIAZqZ2dUD9Sy4kuqTuQzcbC2J6HDaY6UYtg0pVOq5C+uP6TCwe1r+CmQ9qg2bWwTo
	0jxaP1lorsCMdYCJTHQvv8QespFn0InwaHJU97uywSNzYGaWp8ZYbtmVuXo8n0uMIQw6kdsQbTIZr
	jqkBAtNBJ3ps3bHMsa8mYv0gbjwWAaFTduZGI1KukOPThfl/BprjEwbHittDOFBjz+0S81pFMvqEv
	wYqio8CN/eILtSyjUUEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt10N-00ENAX-Kl; Fri, 03 Dec 2021 05:21:07 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt0yp-00EMAb-NT; Fri, 03 Dec 2021 05:19:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6499AB825C2;
 Fri,  3 Dec 2021 05:19:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70A1FC53FAD;
 Fri,  3 Dec 2021 05:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638508769;
 bh=kRChCS06ixTKVgpe7b9Wuqso2wFqw6W6lFZFIfBAfZc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iE9FKuBVEQloHyNsn2y92aOUC57PTVDh6lCAmD20cAeOCFQUMGhsEPjGXDgPoryte
 Kctd+FU9xSTV1yrHfy9k8eFg57vj4/ezmXf5vLqWZDNF8pfWjTtLaglXNCg75UmdPE
 Wjn1LcXP7SwfC1HFqvSZhp5gzkhzaqkPYbvznZzG07by4zbpgVzbwQdOHngz3aWSWS
 ezpw/2GLRQTVCfT32lpGndQg2Ac52N67WsYfC6XnIexjTGK30ni4fjwHZ/tI3pSCsw
 rFyfAw1RYv/7ktRzNf9B3MouLWlYGP7QyVDkn5WZgu/+ngvWry3x0Su1hRuh+e5d3E
 QyPWDrnYBN1Fg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Will Deacon <will@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, hpa@zytor.com, Eric Biederman <ebiederm@xmission.com>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, kexec@lists.infradead.org
Subject: [RFC PATCH 4/5] arm64: mm: use IS_ENABLED(CONFIG_KEXEC_CORE) instead
 of #ifdef
Date: Fri,  3 Dec 2021 13:11:56 +0800
Message-Id: <20211203051157.2160-5-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211203051157.2160-1-jszhang@kernel.org>
References: <20211203051157.2160-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_211932_129831_44138AD1 
X-CRM114-Status: GOOD (  13.33  )
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

Replace the conditional compilation using "#ifdef CONFIG_KEXEC_CORE"
by a check for "IS_ENABLED(CONFIG_BLK_DEV_INITRD)", to simplify the
code and increase compile coverage.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/arm64/mm/init.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index a8834434af99..b4b8b4dc2d31 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -64,7 +64,6 @@ EXPORT_SYMBOL(memstart_addr);
  */
 phys_addr_t arm64_dma_phys_limit __ro_after_init;
 
-#ifdef CONFIG_KEXEC_CORE
 /*
  * reserve_crashkernel() - reserves memory for crash kernel
  *
@@ -78,6 +77,9 @@ static void __init reserve_crashkernel(void)
 	unsigned long long crash_max = arm64_dma_phys_limit;
 	int ret;
 
+	if (!IS_ENABLED(CONFIG_KEXEC_CORE))
+		return;
+
 	ret = parse_crashkernel(boot_command_line, memblock_phys_mem_size(),
 				&crash_size, &crash_base);
 	/* no crashkernel= or invalid value specified */
@@ -110,11 +112,6 @@ static void __init reserve_crashkernel(void)
 	crashk_res.start = crash_base;
 	crashk_res.end = crash_base + crash_size - 1;
 }
-#else
-static void __init reserve_crashkernel(void)
-{
-}
-#endif /* CONFIG_KEXEC_CORE */
 
 /*
  * Return the maximum physical address for a zone accessible by the given bits
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
