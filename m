Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F13C77B60
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Apr 2023 09:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=exX5XYzsX6zSANmj4IjAAGMP9Viu3N9cyr05IpSfTy8=; b=UeUj1xx3tw/i8s
	zHwRS/owAUQ1lCki3MtKIAIgyolaFMBm2jn+3IoWcp0KckRWG9fhwKbMQSX7eZGqvgbWCndmNdcmX
	QZL8HIIvRVJtJT7h35FeUjeU4F2MHFfkfkboeZQqvc1IVkZaMKM0Ad1auMtjHL/7dx5I/MlXL8CzW
	UCO+znU1yDccai8eF/7B+/WkOgNDed8ShZF8frx9FE1TEtxLVS8VCp+srSZMjlbC5xaSDcd5/OlNF
	9knRsB/qsIykmbzh48/d17lebYY7vngX6Y0nmE35F7pSxQdPkmAnJAMgeSc+xVYZVOFHpvCnvLNZc
	kxzoAClieA6CQudbDQ5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psgsO-00CT1E-2K;
	Sat, 29 Apr 2023 09:28:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psgsL-00CT0i-0m
	for linux-riscv@lists.infradead.org;
	Sat, 29 Apr 2023 09:28:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 997146102C;
	Sat, 29 Apr 2023 09:28:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21F0EC433EF;
	Sat, 29 Apr 2023 09:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682760496;
	bh=VWFkSOEdLdYHiOdgaiiVB7fGkgZE49crp4dpjlI65Pc=;
	h=From:To:Cc:Subject:Date:From;
	b=rIuKB6f9FU/nOuER/hZBfRxBtPrbmVPSaatDgZSQTuMxIruWz+zyg6uN+AVpLrbwg
	 ebwOVS4j6jzTn7iSCRogr8mssHL6IQJpzrdZgXPtY0jzlXNPSADDb/gCkRELWtQbvg
	 198idl0zmdk2zXNL3MdgLVggZpwemYkSF/PkPZz3OtEDz+UFMvRaRIl5PYoFTu2PLL
	 Aj3fWqQpWcbf+LTJsyXEjfaQ+sOWgU9/0xBSkdT7Xy97Glwr+Ngjuh7jK+RjyGJmpH
	 jQLwddcGImZH/FuEXb1J3e7p+Zta8GKtbhIgEx2hEBcUzq7hmpKj+uIfHWa3OYc3vt
	 9KTHdmaIMpZEg==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Lukas Bulwhan <lukas.bulwhan@gmail.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] RISC-V: fixup in-flight collision with ARCH_WANT_OPTIMIZE_VMEMMAP rename
Date: Sat, 29 Apr 2023 10:27:33 +0100
Message-Id: <20230429-trilogy-jolly-12bf5c53d62d@spud>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1730; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=za3FgcteiUKmO+H+px6+yeLYMnrjzvzxzBnY3YJjDjs=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCk+j5nlwlhrWx1mp2WnevlaT5OJLjq8msNet8duVwHP4 d/aD106SlkYxDgYZMUUWRJv97VIrf/jssO55y3MHFYmkCEMXJwCMJGY7YwML+Kf1SiVv3kqbHJq 8n7pBtX7Lk56rHmXVeo5lwq/CugNZ2S45nD2olPVyTt908PnnVt7gaOb+f0WE58jIsedd77gXn6 FDwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230429_022817_336047_0DF3B7BC 
X-CRM114-Status: GOOD (  10.93  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Lukas warned that ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP had been
renamed in the mm tree & that RISC-V would need a fixup as part of the
merge. The warning was missed however, and RISC-V is selecting the
orphaned Kconfig option.

Fixes: 89d77f71f493 ("Merge tag 'riscv-for-linus-6.4-mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux")
Reported-by: Lukas Bulwhan <lukas.bulwhan@gmail.com>
Link: https://lore.kernel.org/linux-riscv/CAKXUXMyVeg2kQK_edKHtMD3eADrDK_PKhCSVkMrLDdYgTQQ5rg@mail.gmail.com/
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
I guess you picking this up for your second PR makes the most sense
Palmer?

CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Linus Torvalds <torvalds@linux-foundation.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
CC: Lukas Bulwhan <lukas.bulwhan@gmail.com>
CC: linux-riscv@lists.infradead.org
CC: linux-kernel@vger.kernel.org
---
 arch/riscv/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 5c88ac4b52be..e1bdb3fb16cc 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -46,9 +46,9 @@ config RISCV
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
 	select ARCH_WANT_FRAME_POINTERS
 	select ARCH_WANT_GENERAL_HUGETLB if !RISCV_ISA_SVNAPOT
-	select ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
 	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
 	select ARCH_WANT_LD_ORPHAN_WARN if !XIP_KERNEL
+	select ARCH_WANT_OPTIMIZE_VMEMMAP
 	select ARCH_WANTS_THP_SWAP if HAVE_ARCH_TRANSPARENT_HUGEPAGE
 	select BINFMT_FLAT_NO_DATA_START_OFFSET if !MMU
 	select BUILDTIME_TABLE_SORT if MMU
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
