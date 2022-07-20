Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0335CCCA480
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jul 2022 15:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xNqvFXXiOZbQLTGzOTZUtweliyZZPVmK99M2dhTl/eQ=; b=xyS5PrQnC8p5wG
	D9cE8DxFaSY3RzgQ9Fu9eWXspExv3nIeGN8Z/i3Sc4SpYVxWqROUtTUEmavL4GNnXoLoznqvOjyjt
	wjyk7fcCjqewMqr35tH/5S6yGLDBFthq3F9hyBsm19GRtTXGpHxpBKpWQmAiRE93oQgQ3q0gDYdJ8
	74v/eKkErwEMLVgxqDZ2pFUqL4S18vgmwnfTtpvwyPcTaGVpuhzw1gs43RP9gT6rSmyjf+DYF6NLx
	MdQL/xiHRGuBuMD2hbJaS4rpD2p9bMZLUDwwW0CERKUwkdzmgjStPqHPkfYVCNLyME0tP25Hi0oeP
	u80co998gQ7L0dF4XsPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEBZI-007Wgu-DF; Wed, 20 Jul 2022 15:24:56 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEBZD-007Wc7-Af
	for linux-riscv@lists.infradead.org; Wed, 20 Jul 2022 15:24:52 +0000
Received: by mail-pj1-x102e.google.com with SMTP id l14-20020a17090a72ce00b001f20ed3c55dso2552683pjk.5
        for <linux-riscv@lists.infradead.org>; Wed, 20 Jul 2022 08:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=paOW2t9hSvLN0qsX4domrqdnSMll+/S/rhUQM1pkWRg=;
        b=J/uVoLcikLQJBT0xFlEg8ajNs9xL7ALWFsR00tgd24MEUI1aGZ3l6lzti4x33yK4+2
         iqS5uh9A+CkGE4S7Z/Bmp87ddJQl3GtMIEYQ8kR+M1PvKMRZFOeEzXYS85r2YNBgCMbs
         eAfFbeRsoH4G+AlVPZ4CkuCVXoDLhTYHyxrTWgZnXBFUgYby1SGBARog5+91t2PM7azE
         E5S96BykwsNAlUFT9ABNe0sKb2kGI9UugvUfNCgpBbB663pybDDw4SiMH7YYSp6pCtTm
         pJ161coo/nnBKqlzh/bFkbZAteaNHg+Fcl5pUMd5XiCL1ZS2RzjmvED8eOqSqmHku8d6
         yBmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=paOW2t9hSvLN0qsX4domrqdnSMll+/S/rhUQM1pkWRg=;
        b=L/KEfKcpOOLflrJ96toya4JAQZ16yOq5lV41l7kvwaCUanlXPsnxWWqVkUB7K9KhRE
         c5/cYaxYoHQOylgicUz9Oei1dBP0s/J7V0akO/OYwzAZlZWPXbL4MnNEp82j5MYyb9kQ
         8zdC7VhEI03T52aTnXRT0XsdYvDr9Uh07fysn2+Q8sHOxB7MlGH6T0SOvqbTv1lJXWCQ
         aGxlmId/MZwS/9KnaLpw7hJAprcziaN3lK+fxkLJO/CGVOm1zRHowmmHCzfAxnXfcLFe
         DR5w2QhEV2mj1zTc+rEh0R0W13kcLVTvCakmt4IhVKtfnj++fzSraW1FdVo3lbdagH/T
         INmw==
X-Gm-Message-State: AJIora8VMh3SEJaBjjtmLW1iEa5zMd7iXHxJytwCyNKD0+lvUfvNK3Gg
	P4ANvUDI44zSDA+U5ZJ/bV82WdGKUB8N4Q==
X-Google-Smtp-Source: AGRyM1u4d16rlHJpppdsGywOQ/RadLyXax3bndrtIMo0GKwoWAiSsXDREMxWjq/nSDRqbIuWX8wb7A==
X-Received: by 2002:a17:902:db11:b0:16c:3e90:12e5 with SMTP id m17-20020a170902db1100b0016c3e9012e5mr38763407plx.73.1658330690712;
        Wed, 20 Jul 2022 08:24:50 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([122.179.42.230])
        by smtp.gmail.com with ESMTPSA id w15-20020a1709026f0f00b0016cf8f0bdd5sm6013031plk.108.2022.07.20.08.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 08:24:50 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Atish Patra <atishp@atishpatra.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v7 7/7] RISC-V: Use IPIs for remote icache flush when possible
Date: Wed, 20 Jul 2022 20:53:48 +0530
Message-Id: <20220720152348.2889109-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220720152348.2889109-1-apatel@ventanamicro.com>
References: <20220720152348.2889109-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_082451_387646_956BD461 
X-CRM114-Status: GOOD (  11.31  )
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

If we have specialized interrupt controller (such as AIA IMSIC) which
allows supervisor mode to directly inject IPIs without any assistance
from M-mode or HS-mode then using such specialized interrupt controller,
we can do remote icache flushe directly from supervisor mode instead of
using the SBI RFENCE calls.

This patch extends remote icache flush functions to use supervisor mode
IPIs whenever direct supervisor mode IPIs.are supported by interrupt
controller.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/mm/cacheflush.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index 6cb7d96ad9c7..7c7e44aaf791 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -18,7 +18,7 @@ void flush_icache_all(void)
 {
 	local_flush_icache_all();
 
-	if (IS_ENABLED(CONFIG_RISCV_SBI))
+	if (IS_ENABLED(CONFIG_RISCV_SBI) && !riscv_use_ipi_for_rfence())
 		sbi_remote_fence_i(NULL);
 	else
 		on_each_cpu(ipi_remote_fence_i, NULL, 1);
@@ -66,7 +66,8 @@ void flush_icache_mm(struct mm_struct *mm, bool local)
 		 * with flush_icache_deferred().
 		 */
 		smp_mb();
-	} else if (IS_ENABLED(CONFIG_RISCV_SBI)) {
+	} else if (IS_ENABLED(CONFIG_RISCV_SBI) &&
+		   !riscv_use_ipi_for_rfence()) {
 		sbi_remote_fence_i(&others);
 	} else {
 		on_each_cpu_mask(&others, ipi_remote_fence_i, NULL, 1);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
