Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE9FEC61DA4
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Feb 2023 02:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g8t6uEO7JRDPO2cSZoOuQR+AuRZtf3LkEykjR/u+z7g=; b=ukKYqPNRWN4KOp
	uOVHCaPkwSiaUMi4C3VA4c2cFA5mT5l1q7j+fMBl9p/2p4sHEuEG8JZ5go0tTllh1LqQmaELieaqZ
	98uO1z43vdly4Da4dpnjsic0LeEdRfO71G5QcttXgoPq18al930ToWBGyQyWufnM4sjw1c10+0Fl1
	foVWOnuiX4gJTYLjd5r0P01GYavzf4KyqXbOTD98A2iC5LCtQ9dZgBK/ZUzJV9Za8YLLakVe7hPT6
	ZZxzeb9vyTvrILF3K+WMzQQs1u6WC7B7+mjYYR/JCk6vNYQMIimjqlezFX/ItgdWEneOhi2dmheNP
	JVeIeg1V4wRkt2xku27g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOUaH-005rjc-9y; Sun, 05 Feb 2023 02:16:49 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOTd8-005oCm-2n
	for linux-riscv@lists.infradead.org; Sun, 05 Feb 2023 01:15:44 +0000
Received: by mail-pj1-x1034.google.com with SMTP id d6-20020a17090ae28600b00230aa72904fso247243pjz.5
        for <linux-riscv@lists.infradead.org>; Sat, 04 Feb 2023 17:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F7aws7WJ+JgPsYmq926ziPATo3zeqcvvVIk1K0OdXFk=;
        b=ods8cMcvC3DpjZZR8bGgLD7ZNWo8QbUY9a4HZQfzW7vURdsGqIrTNu7ICMWqoAtScj
         Yx30htgBuZcmHrWBKyTUJp0WsB4vLdkAb6GrAxHGlcyU3b004ZtHvRH5dXj8dgTgLITY
         DLDWzlUdgpPN9W6IoylBlqJsk7avLcNO3jB4yt8SzPkMJB7ZNv2qwn14JaTNk60fzLFs
         y4G6lwUX9ah6AZBCMe5cBjLS0JBCJD9GwtqeeYfg2B69ndI1gHBLymtSRsmAjsKGe3Gm
         38RCAIWcLCKiLTFNe77yEti+lpSyAYtWq/6GZT72WWk4hr/Jo0frhn1+/Ch7mqKSPfhI
         N67g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F7aws7WJ+JgPsYmq926ziPATo3zeqcvvVIk1K0OdXFk=;
        b=7R4a3+W21cq1R38RBKzC8ixLwXPJ6YU2NC+WJS1jFp6f2gww+7Z5G44T2h4mrJmlt4
         ZR/BqHRnnxVvx4cKhm2cE0uoJc9NWKgz1VSc9qyHCVpOpE4/FaUNTbhty8DXPYvJ4vjb
         Pfqzn6YBsxOZDioW3EK4oNAgYo8WRB6ArJceQKmND4T/MeSRwk0B73ir69KWQ7RQcV7P
         joMMclG9FJ4woNaw4aV/GKZQatiDhFW3lhK7eMOC/tQo4W27DKxhTaJpP6VW6j6UUMzN
         YhqBK4c37+mmQ6SG0z04eZgae4KkPIaarhx3o+qQaCaitgdeyEhtoCzRU7NiXdwj5cER
         iF6g==
X-Gm-Message-State: AO0yUKW+vQpvN/sSYBXzzx/11u1PY9XG0IZW1wmejY3VUshq0PhOKpXS
	s5aPG7eCCCxsP7be8p5F6XOaqQ==
X-Google-Smtp-Source: AK7set8GVQ8++sqLaN2nZNAa4EHITi4jHN0uS1FuLRSz+mHDHpLf9ZyU0a48Dr//OxxMMBMg7Zre6A==
X-Received: by 2002:a17:90b:390b:b0:230:8ddd:3878 with SMTP id ob11-20020a17090b390b00b002308ddd3878mr3799853pjb.42.1675559725511;
        Sat, 04 Feb 2023 17:15:25 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id c7-20020a17090a020700b0023080c4c3bcsm2721917pjc.31.2023.02.04.17.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Feb 2023 17:15:25 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v5 03/14] RISC-V: Improve SBI PMU extension related definitions
Date: Sat,  4 Feb 2023 17:15:04 -0800
Message-Id: <20230205011515.1284674-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230205011515.1284674-1-atishp@rivosinc.com>
References: <20230205011515.1284674-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230204_171542_192186_46093A01 
X-CRM114-Status: GOOD (  10.76  )
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

This patch fixes/improve few minor things in SBI PMU extension
definition.

1. Align all the firmware event names.
2. Add macros for bit positions in cache event ID & ops.

The changes were small enough to combine them together instead
of creating 1 liner patches.

Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/sbi.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 4ca7fba..945b7be 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -169,9 +169,9 @@ enum sbi_pmu_fw_generic_events_t {
 	SBI_PMU_FW_ILLEGAL_INSN		= 4,
 	SBI_PMU_FW_SET_TIMER		= 5,
 	SBI_PMU_FW_IPI_SENT		= 6,
-	SBI_PMU_FW_IPI_RECVD		= 7,
+	SBI_PMU_FW_IPI_RCVD		= 7,
 	SBI_PMU_FW_FENCE_I_SENT		= 8,
-	SBI_PMU_FW_FENCE_I_RECVD	= 9,
+	SBI_PMU_FW_FENCE_I_RCVD		= 9,
 	SBI_PMU_FW_SFENCE_VMA_SENT	= 10,
 	SBI_PMU_FW_SFENCE_VMA_RCVD	= 11,
 	SBI_PMU_FW_SFENCE_VMA_ASID_SENT	= 12,
@@ -215,6 +215,9 @@ enum sbi_pmu_ctr_type {
 #define SBI_PMU_EVENT_CACHE_OP_ID_CODE_MASK 0x06
 #define SBI_PMU_EVENT_CACHE_RESULT_ID_CODE_MASK 0x01
 
+#define SBI_PMU_EVENT_CACHE_ID_SHIFT 3
+#define SBI_PMU_EVENT_CACHE_OP_SHIFT 1
+
 #define SBI_PMU_EVENT_IDX_INVALID 0xFFFFFFFF
 
 /* Flags defined for config matching function */
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
