Return-Path: <SRS0=+l7Y=HK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD775C433DB
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Feb 2021 18:00:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CCE864EAA
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Feb 2021 18:00:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CCE864EAA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gGmh/d8zCMdA3jhBTj0Iu+8Z5Ns70RevvUZf8q6PtXY=; b=zx0z/+TuFeo5BpoO2kN64Yzpq
	Je9w4W+U1mtqhdy2ER2mYkGBYkbBXyWDlATKFCqf3my32pK5NRAef/BNxdY+o426S3lHiwR3f73TA
	RSxLoWZ9sz5Xfyygn3psJdZlBTXZUtDFQRULbxuBhHhpSNcLU2TcUrqXgDKWW+Hm+WTYTpYJn3HbY
	gTdo8d5dBUGif7zOlJGXjvODcZVJPXl4PAEn41DVHtHoJmzOHYVBVPLL2xZdQP5V6x5O3+XmLFkqn
	hqDHf3QfzwvYbCge0AR1oYjf7uHY/QT2g+6uDfKeDTmK+HyOfZAljJtcLrGqMntcJXoTSVrvNgpAA
	Vmqsx+NLg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9App-0007lW-Qg; Mon, 08 Feb 2021 18:00:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9Aoj-000798-KD
 for linux-riscv@lists.infradead.org; Mon, 08 Feb 2021 17:59:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E211C64EDC;
 Mon,  8 Feb 2021 17:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612807158;
 bh=N3IHvP9qsEjKvZNs4XAG/Gl7HN0ZoAJSQ1mcVF/2Ll4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CkQUzPV87NeEM75RsLVDPMMuH025VZlvczdauAEJ92tUPHSweIL6JVsxTMoM7xTuc
 F22fEARF1fh3MEZ7sMn2PONBGzMGtBZxfKzvi+3snA5Y069jLb2WTmF/NVcjK2AJFT
 hHfzqJtG9umvJturUo70x2XwwemkL6OGg9R4IrJThlyK+Wnyn1OD2YDW74SRJQvP69
 Ftmd9tTFNUW9yOCpj5kFyQBj9c/NQ4lYMjXB6emi/KMgOlZ4021+urDOUl6ANAdBPn
 IhgSc2ozGqTvoP7qf7X5HrbABKRxJzUWD1gKnrgWJcdb3gSmIgz0M7Vo0+wBbxh+lX
 E2n/ukKgxLG2A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 14/19] riscv: virt_addr_valid must check the
 address belongs to linear mapping
Date: Mon,  8 Feb 2021 12:58:53 -0500
Message-Id: <20210208175858.2092008-14-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210208175858.2092008-1-sashal@kernel.org>
References: <20210208175858.2092008-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_125921_958601_EFC0292E 
X-CRM114-Status: UNSURE (   9.77  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmerdabbelt@google.com>,
 Alexandre Ghiti <alex@ghiti.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Alexandre Ghiti <alex@ghiti.fr>

[ Upstream commit 2ab543823322b564f205cb15d0f0302803c87d11 ]

virt_addr_valid macro checks that a virtual address is valid, ie that
the address belongs to the linear mapping and that the corresponding
 physical page exists.

Add the missing check that ensures the virtual address belongs to the
linear mapping, otherwise __virt_to_phys, when compiled with
CONFIG_DEBUG_VIRTUAL enabled, raises a WARN that is interpreted as a
kernel bug by syzbot.

Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
Reviewed-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/include/asm/page.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index 3db261c4810fc..6a30794aa1eea 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -119,7 +119,10 @@ extern unsigned long min_low_pfn;
 
 #endif /* __ASSEMBLY__ */
 
-#define virt_addr_valid(vaddr)	(pfn_valid(virt_to_pfn(vaddr)))
+#define virt_addr_valid(vaddr)	({						\
+	unsigned long _addr = (unsigned long)vaddr;				\
+	(unsigned long)(_addr) >= PAGE_OFFSET && pfn_valid(virt_to_pfn(_addr));	\
+})
 
 #define VM_DATA_DEFAULT_FLAGS	(VM_READ | VM_WRITE | \
 				 VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
