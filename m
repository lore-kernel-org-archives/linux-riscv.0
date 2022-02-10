Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1480C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Feb 2022 05:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xpb7/xp/TKn0xVq1wTi5intW+1n06WOz8ETdO/bPXL4=; b=n8WA5E7kIMtIkn
	ioqPd7pdhcIOE4+klPrn+bpQj+EZu0lPzLecKDfXdFqISl8umEOmMH3rpMEXK8WM1G1dzgf7RQ1Wo
	BYevoNrQDz4ZtnJOj3vF11fZJzdV/dSSASXplF8FU3Yx+BzvJyVuNuxLnWdIP5LOMktnY/PzPq5nB
	J2f81ibTxaGNGVqSWoGbcfUayMGnKeW61LWRq7moT/W8eW8k6GcSOWXg49sQNVN07GbP+04ovw9U6
	JQMBJRst6GBjIaciXIgFdzq2Q3NJt4sJ5uvqVmxtEhiu9Bn2uyi9DvueE8M4avRZydRQIKi4BBK56
	lFfRXiylCj9N6KrWufAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nI2Mu-002fnw-7C; Thu, 10 Feb 2022 05:51:48 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nI2Lj-002fBt-6Z
 for linux-riscv@lists.infradead.org; Thu, 10 Feb 2022 05:50:40 +0000
Received: by mail-pf1-x436.google.com with SMTP id i6so6448482pfc.9
 for <linux-riscv@lists.infradead.org>; Wed, 09 Feb 2022 21:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W6DnRCcGid35hmRCVAHPT4/JHmCQ1pX6LaO+zPetyxw=;
 b=mSBtH4Ca3FDB67dCd9NJOO5/JXrDvLAO3zTmf+dcTUfKJYtyIBbQVcQmfc+TqTl7O7
 xZUysJohgWhF1eU0KpHG1mIuaQozOmy7kcfTjI6Vk6c7pnGAPt7Qexkgl4m1au+q80Ds
 6IPqOLJ/JAMR8MRuKn3Md7bRY9JFCSTY+fKt7YBZrnVdf0bOPO9Nxzl4Kh5KDIJP11I+
 +DfQDh5FJxLD7W4+LDs3w14PivdoAcBpuuc8NApLyqbWA9JvpDHf/uXzsaDi+G8RFPfc
 gJd337B7Zpc7vKgbDUSm9CddVhEyD86YvhhkzDHPdAgBfy1/smNKGgImbnM8dAwsuKcc
 YCzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W6DnRCcGid35hmRCVAHPT4/JHmCQ1pX6LaO+zPetyxw=;
 b=Kui+6pzglmpBIWCQ/+2PLbXTOk4KGkDBT2enECZZZgODdYC+V1C6Yd3V5PaduiketW
 iYssqc2iKYiavemzcShGTcrEAuTdFWG1ddwPJgjuNHmY5y2JzAtzxMjW/jCbj3dtd8it
 IIUzdSb0pfWDB5yCWrgX0PYJeroMcdJKngW4Jwa4OsrkuEwEq027PZ6jzUKWaoD3mck0
 euECW5lSuE8N7/H8vVRI8WaVXbmJWxkzCIwvrOrk4fe9KD4CbRx2qP0sBdxVa8tu23Da
 rfxZKl1u6eTbonlPsZ9UDhf23jrZhIKzwP/HKVkWpJIVC5tGqUcUajhKy7T6wE/Syyu1
 Mchg==
X-Gm-Message-State: AOAM5334zPOP9JdqtyJ91AmWI2KekfcLKQPMSbAHzzEfJgDkb95ZXm1r
 jD6Q0rKEjsNGeQ5eXwerzvEE9A==
X-Google-Smtp-Source: ABdhPJzzvcYAQEszqDrWPIi2o/8I39cAGJzw5p5FlegiJjt/V5sGZEn9o5ZpjEdFVmLscqWyK8zTMg==
X-Received: by 2002:a63:4b17:: with SMTP id y23mr4834549pga.489.1644472234077; 
 Wed, 09 Feb 2022 21:50:34 -0800 (PST)
Received: from localhost.localdomain ([122.179.114.46])
 by smtp.gmail.com with ESMTPSA id s32sm15192270pfw.80.2022.02.09.21.50.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 21:50:33 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>
Cc: Sandeep Tripathy <milun.tripathy@gmail.com>,
 Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Liush <liush@allwinnertech.com>, Anup Patel <anup@brainfault.org>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvm-riscv@lists.infradead.org,
 Anup Patel <apatel@ventanamicro.com>, Guo Ren <guoren@kernel.org>
Subject: [PATCH v11 2/8] RISC-V: Rename relocate() and make it global
Date: Thu, 10 Feb 2022 11:19:41 +0530
Message-Id: <20220210054947.170134-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220210054947.170134-1-apatel@ventanamicro.com>
References: <20220210054947.170134-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_215035_279052_046FC2CB 
X-CRM114-Status: GOOD (  11.15  )
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

From: Anup Patel <anup.patel@wdc.com>

The low-level relocate() function enables mmu and relocates
execution to link-time addresses. We rename relocate() function
to relocate_enable_mmu() function which is more informative.

Also, the relocate_enable_mmu() function will be used in the
resume path when a CPU wakes-up from a non-retentive suspend
so we make it global symbol.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/kernel/head.S | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 2363b43312fc..5f4c6b6c4974 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -90,7 +90,8 @@ pe_head_start:
 
 .align 2
 #ifdef CONFIG_MMU
-relocate:
+	.global relocate_enable_mmu
+relocate_enable_mmu:
 	/* Relocate return address */
 	la a1, kernel_map
 	XIP_FIXUP_OFFSET a1
@@ -185,7 +186,7 @@ secondary_start_sbi:
 	/* Enable virtual memory and relocate to virtual address */
 	la a0, swapper_pg_dir
 	XIP_FIXUP_OFFSET a0
-	call relocate
+	call relocate_enable_mmu
 #endif
 	call setup_trap_vector
 	tail smp_callin
@@ -329,7 +330,7 @@ clear_bss_done:
 #ifdef CONFIG_MMU
 	la a0, early_pg_dir
 	XIP_FIXUP_OFFSET a0
-	call relocate
+	call relocate_enable_mmu
 #endif /* CONFIG_MMU */
 
 	call setup_trap_vector
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
