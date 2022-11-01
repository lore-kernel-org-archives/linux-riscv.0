Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19479C4332F
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Nov 2022 14:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YslXAxz/JJDC8/4H7oVzJMyxIoyU6VGZk1TEWcdA0iM=; b=CBuJVtLBj3EW+z
	hH/WDT2tGgowRm3bkS+cwrAJLsdzAI6KucyXdwR5JLTvQ0FmWYC6WnFaJWWCuVUQQ9cIWWk96a85I
	GVEDYXa5/8fI1fuXs51ta25BC/MbhOfk8IIG9XJfo0f4FUFpydqnoMneiZaggR+Lm+3fY6CcvjSK9
	78A4eBHZYSt55SgBKN3Jl0B7EWM9M1q/itBLq2z4OIOUQ/xoxllaa3xer/B95VZtzzNiGUJSm4i7E
	QUYlu8aUI30qDfweErL0Hu/MTRoyMLERyewNKN67Zf3gdDf9aNDsi9nUNKqVXgJ2T3wd0Yfev/RvO
	LaHJKeCZnH5SMybHHVrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opsM4-005VRn-Fd; Tue, 01 Nov 2022 14:35:04 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opsM1-005VNc-Mn
	for linux-riscv@lists.infradead.org; Tue, 01 Nov 2022 14:35:03 +0000
Received: by mail-pf1-x42b.google.com with SMTP id i3so13598651pfc.11
        for <linux-riscv@lists.infradead.org>; Tue, 01 Nov 2022 07:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NR0zkcTR64wHAjX9AnDry5ZpqjNrgt1ho9rCOwWk1u4=;
        b=PrmfwbdEoaA+/aYLn6KyPDuRPIrF4ku2zpK97abpZpsznZm3urteLLw9eV0BBgWNwM
         Bjo54YGJEsSxkGd4Trm8DnISuPbfN4cRiqrZXElAhSWk+T6LuEebogO1ylpJrCtLrLk+
         0HPxBa8a25+1p1YfDdYLr+uXUeXNpKLHGnoZ0+m1i7AV4BqdVpHtxlzeKv1CJukCveEJ
         I0CQ57IhbBLeODYGchxZnqqbt6rH9n5Vi8m9aV7H3xN/mZrk0pS5BLi0G7odfFT8KJ8D
         5HERjnKGl3waiShgzUrwLCgmZERsHYutExRuYTM6/kmqaliV9H/tva8mc3Hz8j2kJhhH
         eI6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NR0zkcTR64wHAjX9AnDry5ZpqjNrgt1ho9rCOwWk1u4=;
        b=CqQqCIdQR3G/d5ivFt6yNkNt0NFMbbZGWk49kjyO6c6dLllX+1ohPd6L/cqo8Tfmo1
         1XYZ3jX0LlSuxuiZUgvLIUBq61x76uWKZRCerQklQcG3onQ6GjuPZjcJy4kR/1jZSGdb
         8H4UiYpQNoQHt/1avZtOwC6dkRGSHwTtmX0qoJacsUT3qYEz7TxpDKSNuJkwldwOx7NJ
         /N8qZIvvKA6l8wRcGmBxpok9soDdMnAVZCq5RYlgLpEouNVxA0/HGAENUXn0wUm99YLZ
         6bKMmQHixGCSi2USzBb9oc3HqfPjLzSrSxFAGM0Qx7u0OLTUurNt7WjAIfl8AUxJSh3L
         rPXg==
X-Gm-Message-State: ACrzQf0+WgPnRZylO9bhtvF42qAVIbBHeWJHXFw3Ic5euEzAxdHTWPG1
	t/P6tQewoMjKwhlekpMl74C1zA==
X-Google-Smtp-Source: AMsMyM5ziTFAirnAfSVMBfXauwPF5l+do40/tZsapEiJXWEdNzYhHb0bMdaYzsJPlxk7HV/celXeBQ==
X-Received: by 2002:a63:eb03:0:b0:46f:80a3:737d with SMTP id t3-20020a63eb03000000b0046f80a3737dmr141167pgh.447.1667313299873;
        Tue, 01 Nov 2022 07:34:59 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.80.52])
        by smtp.gmail.com with ESMTPSA id o20-20020a170903009400b0018685aaf41dsm6449055pld.18.2022.11.01.07.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 07:34:59 -0700 (PDT)
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
Subject: [PATCH v10 7/7] RISC-V: Use IPIs for remote icache flush when possible
Date: Tue,  1 Nov 2022 20:04:00 +0530
Message-Id: <20221101143400.690000-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221101143400.690000-1-apatel@ventanamicro.com>
References: <20221101143400.690000-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221101_073501_774188_684711E2 
X-CRM114-Status: GOOD (  11.54  )
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
