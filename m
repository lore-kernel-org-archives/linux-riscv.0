Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF09C46CD4
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 10:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kxZ8rpKDojI8nYf3E5REO3qJzb7szBvdhy0i0qtT9K8=; b=GyZwVAJd/ljycx
	fYJi112QCPVauIabYpQ+cSH6Gc68stj/+6iX8B4imgG0OlIyFJunnkcNfxrcErquc5yQHKWUy75xA
	a+uz4N+HtG5ixzVir2nVE9oVLlYjZUvpEDRQmfUgdudt5dALWFRI2UTcMt2tdbW2nw2L+cqtnFaaK
	yr3Drx1DBcwC6MrlsuRNZOe13xotK+VRTaMkKxhxHwLG+buGCmTw2DUQEtPL6DEwtbVS6fFl07dI4
	vt2x/TfwHdPybI78WuNBEO/fdQdWZnut8GkBBU08px2l9vZ7E0kgp6Xv5lFJ29+QuC9o4qiJTI7Vj
	6XUq+jIO+PwnNeCSRR8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFB3r-009rHo-3C;
	Mon, 18 Dec 2023 10:41:23 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFB3n-009rEm-1r
	for linux-riscv@lists.infradead.org;
	Mon, 18 Dec 2023 10:41:21 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-6d9d29a2332so1256704a34.0
        for <linux-riscv@lists.infradead.org>; Mon, 18 Dec 2023 02:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702896078; x=1703500878; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EzYVT3U62jOpimrVBwbFtsr3YzUGPIXyIVj0onyqTs4=;
        b=1DQPcLOOBaOGc2FlyGQ4UoCwtKurX3aslmJIux5Glvz5w27ADWfOQAgY5IJvBcXwJM
         fTWzBPnGCnrzUIYu5plll0zt3wNt2EhrptdKSBfxaCaYXT2e6H+U1UMQkS0dwRjshfIP
         v5GvDSffZk/kHTmtPX+o2IOfsH3DT2qJE8BggNgCAwGPKepp3fMIsqG4IN+S3dY5jAxy
         5ZzFg7FjzrtFajzjfCsqoFiDGvOXzk0u8zl8SvK+c61GXNX/wdZgViNmtLZJK9xNr1dJ
         UECLF1VjFN99iCDOkRLB2RArt32QafJhWtIgidtDr0GpuYqmt6AMNVZNI4UHEwQSuC8E
         ekGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702896078; x=1703500878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EzYVT3U62jOpimrVBwbFtsr3YzUGPIXyIVj0onyqTs4=;
        b=qZOSkYlfPVhUc4NTmBVFWGbquniY5PzADuaHtfAIZCeaeF85wTw81j6yqpXLD9KPUo
         k2B/aCeP6ShnwsLnHFbifmGge5Sq9i1gwqucfWwV/RxoiyOL4UyDPulkobVX2Kwlx0a5
         /lAZjpO+GZ7BlOtkrUZhSPwm3QHY+QVb3/Pp02F7IrC2YdXro366vTSouuj9LnqSFXNc
         yzAyEWjtHgGhTIgJSz9zNvlluAGXawX4apxHvfpXm5U/rG89xmED8QpT7OaZ7ZuY5itD
         kfiC4oFNZwfa5qa61kuVey6+rcluffRJcKxq1LfJzX04iGKdkqIuNKJnQayHIobdtW96
         sMZw==
X-Gm-Message-State: AOJu0Yw7TnL5WGJxWpmSSr6NO9W2sZY68SLf2lnplgJ892KYTWCewGBQ
	WYSOlYTioofADcdVQo6Q+WpYKg==
X-Google-Smtp-Source: AGHT+IHap3UnechuN3domT4X1LYxQydZehOxW5SUbyRuhBv7FJIHHp0fJMugr+7DMK4DyTgTcIzVvg==
X-Received: by 2002:a9d:7dc9:0:b0:6da:5056:62de with SMTP id k9-20020a9d7dc9000000b006da505662demr2117996otn.7.1702896078450;
        Mon, 18 Dec 2023 02:41:18 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 185-20020a4a1ac2000000b005907ad9f302sm574970oof.37.2023.12.18.02.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 02:41:18 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Subject: [v1 01/10] RISC-V: Fix the typo in Scountovf CSR name
Date: Mon, 18 Dec 2023 02:40:58 -0800
Message-Id: <20231218104107.2976925-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218104107.2976925-1-atishp@rivosinc.com>
References: <20231218104107.2976925-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_024119_643684_868111F0 
X-CRM114-Status: GOOD (  10.16  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The counter overflow CSR name is "scountovf" not "sscountovf".

Fix the csr name.

Fixes: 4905ec2fb7e6 ("RISC-V: Add sscofpmf extension support")
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/csr.h         | 2 +-
 arch/riscv/include/asm/errata_list.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 306a19a5509c..88cdc8a3e654 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -281,7 +281,7 @@
 #define CSR_HPMCOUNTER30H	0xc9e
 #define CSR_HPMCOUNTER31H	0xc9f
 
-#define CSR_SSCOUNTOVF		0xda0
+#define CSR_SCOUNTOVF		0xda0
 
 #define CSR_SSTATUS		0x100
 #define CSR_SIE			0x104
diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index 83ed25e43553..7026fba12eeb 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -152,7 +152,7 @@ asm volatile(ALTERNATIVE_2(						\
 
 #define ALT_SBI_PMU_OVERFLOW(__ovl)					\
 asm volatile(ALTERNATIVE(						\
-	"csrr %0, " __stringify(CSR_SSCOUNTOVF),			\
+	"csrr %0, " __stringify(CSR_SCOUNTOVF),				\
 	"csrr %0, " __stringify(THEAD_C9XX_CSR_SCOUNTEROF),		\
 		THEAD_VENDOR_ID, ERRATA_THEAD_PMU,			\
 		CONFIG_ERRATA_THEAD_PMU)				\
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
