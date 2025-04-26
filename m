Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9666C369D5
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Apr 2025 14:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+XACp6X7UbpWbFHRAKRRB/1zoFQEFPp8bcFgpAvinOo=; b=1aO6iq8F1bQGiG
	7SjOf/0siDDRtz18m6ccqIAsFjer0fHJg2hd/XBrAV2doPRniGMS/I9epV8tLWgNiozVr2L36XVH8
	unhJFopgVEZT6L71eZ1REIRePvCNfHvPd6OhcAGsgv/zqE8qeDvaLpReaWPYWXRRCJiozv+gNdRtI
	nRiveDkU1AcK2l9N2FFwoRSut8tmVmK91dbYH0BmmUZ+xSYYoXcD9lc0IHz93rn/JAdUE4U1asaQ9
	KXJt0jvJsNyxP0Cq/97Rj8FjN9e7LskTjbsdRLxMNhT/GVRJsJ1iq/gegthOSoA+58LeQWpjfvDQL
	zaN3j6aj/lFfs2Iy9Glw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8gLt-000000029EP-17K9;
	Sat, 26 Apr 2025 14:17:57 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8gKK-0000000298p-3AeD
	for linux-riscv@lists.infradead.org;
	Sat, 26 Apr 2025 14:16:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7B4B7A4D387;
	Sat, 26 Apr 2025 14:10:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B38E3C4CEE2;
	Sat, 26 Apr 2025 14:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745676977;
	bh=N1YWiN0vUP+4GgolL3DpxN1tliOksTTr9DRMbL1qvM0=;
	h=From:To:Cc:Subject:Date:From;
	b=FMz1trMCj79iKTZy3+andh8lEk3lSz0Bxpuibpsq0nEw3s33ZWizckYBinIheg2Ox
	 Nex9FKhCEHcK8wtdOhb2g2oVekKixg+kUzID5KijKYihOoWehrnw5sZanGhr7CqbDo
	 g7/Lgdi35rt5lkHy2FGR1XVq+B8BN7+b9jbaw/O5+Lrm2p+wSb0J/rQmVmWAer4jIH
	 ehgAAiOFqPWq0N6EPH+gkfhtxbcyJPYqqFswgJulVzEWioYqSgOEOd+9L88ZK3WxFi
	 V3HCx6cKHu+6SaFjUwzhyR0FYVlygkudoEnOjJHRoHg0Y14LfreEOB1Kn5vCiMHgR3
	 bUBZFZMlHTlKA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jeff Xu <jeffxu@chromium.org>
Subject: [PATCH] riscv: enable mseal sysmap for RV64
Date: Sat, 26 Apr 2025 21:59:54 +0800
Message-ID: <20250426135954.5614-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_071620_857205_4C57D303 
X-CRM114-Status: UNSURE (   8.65  )
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

Provide support for CONFIG_MSEAL_SYSTEM_MAPPINGS for RV64, covering the
vdso, vvar.

Passed sysmap_is_sealed and mseal_test self tests.
Passed booting a buildroot rootfs image and a cli debian rootfs image.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Cc: Jeff Xu <jeffxu@chromium.org>
---
 arch/riscv/Kconfig       | 1 +
 arch/riscv/kernel/vdso.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index bbec87b79309..3cb0b05eef62 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -70,6 +70,7 @@ config RISCV
 	# LLD >= 14: https://github.com/llvm/llvm-project/issues/50505
 	select ARCH_SUPPORTS_LTO_CLANG if LLD_VERSION >= 140000
 	select ARCH_SUPPORTS_LTO_CLANG_THIN if LLD_VERSION >= 140000
+	select ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS if 64BIT && MMU
 	select ARCH_SUPPORTS_PAGE_TABLE_CHECK if MMU
 	select ARCH_SUPPORTS_PER_VMA_LOCK if MMU
 	select ARCH_SUPPORTS_RT
diff --git a/arch/riscv/kernel/vdso.c b/arch/riscv/kernel/vdso.c
index cc2895d1fbc2..3a8e038b10a2 100644
--- a/arch/riscv/kernel/vdso.c
+++ b/arch/riscv/kernel/vdso.c
@@ -136,7 +136,7 @@ static int __setup_additional_pages(struct mm_struct *mm,
 
 	ret =
 	   _install_special_mapping(mm, vdso_base, vdso_text_len,
-		(VM_READ | VM_EXEC | VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC),
+		(VM_READ | VM_EXEC | VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC | VM_SEALED_SYSMAP),
 		vdso_info->cm);
 
 	if (IS_ERR(ret))
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
