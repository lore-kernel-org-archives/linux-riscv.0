Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 684E6C76196
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Mar 2023 03:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mew/DP1jtzytLGY8D6XiLunXzvqxXouwXYRXRUwzN+M=; b=ehoppJGteh+GgF
	Zgywr8VoSAqRp6IG+ck8AfU7lDJiMbDwHA+5Ti+ouPy+D697TVLsBfgiN+2FQCLULx06OSX88gp6c
	k/LVPGlXYKbj0QlhT90F5Zy/E37n1Xc++Dbjlw14L3NzRKNYUDyITA+KbdyWD1knN62O20Wygvb5Q
	JryqGdEm0jCHRZCV1EtWNiTry+ppkYnVMVoaYNRyDSxQrzplSdrdw+KkJfHLHFe5M1rVQS8pYrPmX
	X+PZ1evEfQFSFE+SZvGn+cz1v+H+sRiELcPlF9oCHaEuO53rbGYgStoATZ0hlhWKgUc8x8j6nImZE
	gg5c0kbKVEONVLWsgltw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph0OV-00D3qW-0q;
	Tue, 28 Mar 2023 03:53:11 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph0OS-00D3ot-35
	for linux-riscv@lists.infradead.org;
	Tue, 28 Mar 2023 03:53:10 +0000
Received: by mail-pl1-x636.google.com with SMTP id o11so10448391ple.1
        for <linux-riscv@lists.infradead.org>; Mon, 27 Mar 2023 20:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1679975587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fYuh0nFD6NwJIy6fdJnMZv8jO7haLudDJ7hSHLvipCc=;
        b=NRNMyNcfhSZoLR9QbApNoQGXQbsEn+nMfcydEcWh43W2IrC9oJayOkID0hWw2bbqud
         pNNWjHB5OsIh6Cr6PvSd/uU38XSrUeybs01nBOpjb3Mc5iQOwqktTIQcn5zoQcFz3Uon
         gZN2VHNBarpa5eMPfvR8p60EQQUFD3MgAC7OTC+P8WLF6SjIUUeuFkgZMQnC0CFB6IgA
         PVn+fVGZm45Qv46wtNxfOq3uHDxA6KA7bD3CMl22qgA1d01jGEqIE+in216JphBA2OfU
         PXT6kjzlmbUgKUhP0M2daD0hxQUifb4FoJbbIK2zDj8myPaBCwMg+jP2Jz4gv63cH92Q
         AyfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679975587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fYuh0nFD6NwJIy6fdJnMZv8jO7haLudDJ7hSHLvipCc=;
        b=JuOWF9zUI7rFV/bY84+4AxuDP2MAxhrk8tv3BKYG6j8IDYIpJVZtqDjcZ/nOIrjdbc
         bqN8+hbOSEAWLd7MmPws8iwY9E+8I/zg7NmsfLP8QUm2mDw+bTvYhBmDW1P0JOjQ9A06
         jHbKJl81ft32KvKtg74G5HAnJ/AKs/pXOvjvjtXud90WueoNKOEuMB2lW0hloYVEWhWo
         XHUaFeiRy6Dhv423Lj29dViR3XnBPHI1A/4sEiXONL4Py6QWnCzryEWhRxcA/ZwJ1sRr
         tXKNZtpi/3FUFLw1CwCMoQLedjkYn70a/afJVCejclP0ArePrxn/sINqOpjmDGGfLHpf
         Yv0w==
X-Gm-Message-State: AAQBX9dT6l8rnEcum8329LjqGHSxHxY7TE6agygoP/6ZerVEN6Hv9GvE
	9EWBq7rbdA17Z3E7h/ra04cqDw==
X-Google-Smtp-Source: AKy350bLV4PR6X0dU3ueROaof97i4KEfz0eeNx8Bf+3cEA9GQev1ByHDUyeQfvUumBlKcwHa7FSKNw==
X-Received: by 2002:a17:902:e80c:b0:19b:afb:b92e with SMTP id u12-20020a170902e80c00b0019b0afbb92emr18463729plg.40.1679975587300;
        Mon, 27 Mar 2023 20:53:07 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.82.104])
        by smtp.gmail.com with ESMTPSA id g6-20020a170902740600b0019cb534a824sm19880278pll.172.2023.03.27.20.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 20:53:06 -0700 (PDT)
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
	Atish Patra <atishp@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v18 6/7] RISC-V: Use IPIs for remote icache flush when possible
Date: Tue, 28 Mar 2023 09:22:22 +0530
Message-Id: <20230328035223.1480939-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230328035223.1480939-1-apatel@ventanamicro.com>
References: <20230328035223.1480939-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_205308_994036_7BF2DE75 
X-CRM114-Status: GOOD (  11.01  )
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
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/mm/cacheflush.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index fcd6145fbead..20cec5e7cdbf 100644
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
