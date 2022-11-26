Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCDEEC4321E
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Nov 2022 17:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ysgmKz7NW7KfdsMi08e3DToJPY10FwUPG3Jf0OoTCw=; b=X9fqf1+2gx3RnJ
	68Q0YqETCOWCzIRAS4sy9AbW8+mI/Oo5qAKMPhL/8FbVNW6iJi+O93OB+v4CFYlRld6cEY1FtvrHg
	2j3nX9cQB3J9MmIcdHlkAxk9fYOH2aJW+LgRwcPfLphHgVYK+k9N+aTCxR6lmjuClfvJcifEnAwXT
	9pUYNgNO2cXPKNicGuFAuLodQW6YX6ujlrd1jibpQHIBcvbLrzS0XbuQjsZf/bF0KN9J4rXjLLuHX
	NqTnY/OzhdrCyEwyNJheJuzHf6FuiMAG521jS4Yv1zHGN1e0vm+yyNc7kgQ3b4uZQpX1Jp1fN27a5
	rVbiKr9G1EAK+XADIMMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyz5a-007Uqi-6a; Sat, 26 Nov 2022 17:35:42 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyz5W-007Uld-OC
	for linux-riscv@lists.infradead.org; Sat, 26 Nov 2022 17:35:40 +0000
Received: by mail-pf1-x429.google.com with SMTP id z17so1945886pff.1
        for <linux-riscv@lists.infradead.org>; Sat, 26 Nov 2022 09:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8+D6mfTqwfey0lLy9Lc3RpfTXi+1JUYYl3NRmY/n6Cg=;
        b=Zwh+Ahf+PgqpdmwI+hiwrJofafPo1sFBQ6IhDsfkFERh+5Gx5QG/aejVs6P5aJJjmF
         /RfUcP1ztUo+ceXPHow4SZF7bt3cOsKwJEayT7pptuzlQDh41whAJYNg1neIaBaE9wTY
         cRCdZCKcvTqwBNsHzAru2WW/bhu42orX7JAtQpE2PX3BNRBzCVjcLFCBbcqwRy9J0O6j
         YUOPHYluSq7pwYM6meho8d/yhogNg3hXYZ5D9JT6K1M7VYhxAnhcypyEYytXVMpCHUTn
         ITTcASdbPEtUP8QhbMuCgrEPvt2Y/l/qux7M7/UL8e9q1TTYIxVdGIIW7KWpZTm9o6pb
         SqVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8+D6mfTqwfey0lLy9Lc3RpfTXi+1JUYYl3NRmY/n6Cg=;
        b=CaQE6LoHsRNCM5lEUikNwn0zwP6qZMlW7nNQmpC27qkSxwQCeFNdLOoVSj06F2tKuH
         DWfNuVNd0gYwHPILsHT/t8kIp1yjkwnOJx9iSAw/pWCW/+4Uweqjv7Ss6CllbwGERPBF
         Baz5unGj1sdb5+AvJdYpVduenLh6MxHoBbCFH4CK8spCkBp1ZinRSjgjr6FYLpq+1Vmm
         45HA8EAsSzavshxY0bqgsScwBoPKfa08PcNtHhNXRpmvBKIs9RF49V265mG9xU2amliu
         aTpObAxN/CS69Scnen96wRETSmWose+OlaBHItZJLQPPYVNtNMJhbi9aaxvOAwxUknzE
         Z0OA==
X-Gm-Message-State: ANoB5pnBkYlFP3NCpjHUSVrKwDYZVtPaHQy78vWcp4y3xkqTEYGfDICP
	Hp+XHOlR7p595I6S7Lol5lWWtw==
X-Google-Smtp-Source: AA0mqf5dfIgCp17C7LQceJaVkBMaJSg5WjR+0IJyFoAGzJcOgVQZJMoxNB9lQFwQNI7UtlFh4ByEEw==
X-Received: by 2002:a05:6a00:26c4:b0:574:9a44:45eb with SMTP id p4-20020a056a0026c400b005749a4445ebmr12148774pfw.1.1669484137553;
        Sat, 26 Nov 2022 09:35:37 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id u11-20020a170902bf4b00b0017f7c4e260fsm5639813pls.150.2022.11.26.09.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 09:35:37 -0800 (PST)
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
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v12 7/7] RISC-V: Use IPIs for remote icache flush when possible
Date: Sat, 26 Nov 2022 23:04:53 +0530
Message-Id: <20221126173453.306088-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221126173453.306088-1-apatel@ventanamicro.com>
References: <20221126173453.306088-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221126_093538_818991_CBE1E676 
X-CRM114-Status: GOOD (  10.52  )
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
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/mm/cacheflush.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index 57b40a350420..f10cb47eac3a 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -19,7 +19,7 @@ void flush_icache_all(void)
 {
 	local_flush_icache_all();
 
-	if (IS_ENABLED(CONFIG_RISCV_SBI))
+	if (IS_ENABLED(CONFIG_RISCV_SBI) && !riscv_use_ipi_for_rfence())
 		sbi_remote_fence_i(NULL);
 	else
 		on_each_cpu(ipi_remote_fence_i, NULL, 1);
@@ -67,7 +67,8 @@ void flush_icache_mm(struct mm_struct *mm, bool local)
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
