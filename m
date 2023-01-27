Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F35C38142
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jan 2023 19:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2GNBVw2l64xobiQ6YjiGA8kG6fRxYVazP31UfLEvKqk=; b=wcECVQ9zcfapOa
	ZxfGhdgX9o+En8coeI6i6K1pcPAE1J7TM7ltLLIgLYFYArQFdt4B0c0M1RIv6auhBySQJdIEvNxJS
	4bmKjOG40us5EVrHoG4jvVztvesDyDs2+EJbsZeRhQMtfXi1VD02xalWbaMwL9chobZ7llaQQh0MU
	dVrMtncvP/wpCjUhzIZ8+i/qryx4EULpWsyeh6bQpVCOwednb+9zXEq/nth9d5YeoT5CKvig4zj+x
	hsg1xoW+3PO3Hw/s+tbjH+++S3aNWKil0eDDY407qJtqq/QhrPHSvuhpuUjTj6G5hlmYmFH7Mz59G
	NBBMlCy6fu7Hqss0yRZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLURX-00G7Ej-1h; Fri, 27 Jan 2023 19:31:23 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLTQY-00G2aT-0Y
	for linux-riscv@lists.infradead.org; Fri, 27 Jan 2023 18:26:21 +0000
Received: by mail-pj1-x1030.google.com with SMTP id nm12-20020a17090b19cc00b0022c2155cc0bso5506750pjb.4
        for <linux-riscv@lists.infradead.org>; Fri, 27 Jan 2023 10:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cn2VkKN/WuIcEOyjejqwRSpO25aVX0itAsGTfYH0Pbw=;
        b=DAAXxtYjkQddNCj7UM7En6mqUmf3J2gzYsFadRPtlJg6aTcQ7YLch8H//JxlEijKk7
         5uxQ73XFulPZlp1QmIf6vQrIzjaSZg+PKSPJ3UkME9YpCFWvyWYP/k4BMD7A2aXG0iOr
         je+nSeC+7pEg35a+Jn4PQsXJfTRp5WdUJb2DW73Yn+WSuExXhf/39l5UMQta2v5BYmLX
         eHi9cQY4mXQ1MAatncFFmUs7n1voCzvRxMfNIgfWNoKB2Yt+UJ8yX8cBUxEdezG4CNU+
         BfL31EsqTfc+KOhOQi0xZ4vhH735HWHaTQ3Rtpsn7fIxeyWHSsET1qCBmGo3xlclDkCW
         /gXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cn2VkKN/WuIcEOyjejqwRSpO25aVX0itAsGTfYH0Pbw=;
        b=Dx9nxhOddNOI8VU8kxJZwDtWGKB+nTNXCn4D6tJ1f5SvrP86X8rdlycoPHopGmb2ri
         SdPDf2VSAbuZtct7fJupcx8Vx5yN2oGeUIg4E4HkpKDHiUErrhvOmVfOjY/ynVTlA0Wc
         zHHEDnUAd/9MpJmlPJZYzQZqJYDuOQ+oBpFwVRHYYjLq5frmBK4NOUOFCunRS1yfE/6A
         GUwydNxfjnnhKY36CQDqAT6T8oEgOrivPzj/0BrOQ4emE03fUeVgnJeZQL9SBmIhj1A2
         NSg7dHX9K4lxcKsugUAew/rwYEDmgZ9Q+/hEhxVHYsMIrRqcItYCN6Ei2tyHmiORX8Vx
         slvA==
X-Gm-Message-State: AO0yUKWtHz4dfHvttHZsjj3BG/Ek/FAxnkm17DPFjJV7QxTv1yNje6RU
	D1Rdgljn3W9ZHzxpjNCRKTqfbg==
X-Google-Smtp-Source: AK7set8r6nl3JNPXU8sjoTzHFKmJTI+gWSEYIL1CwiWtyssd72a/N86A2G/VJ1879ufSaeoYEoYbAg==
X-Received: by 2002:a17:902:db0d:b0:196:32fa:69a9 with SMTP id m13-20020a170902db0d00b0019632fa69a9mr6206312plx.51.1674843976411;
        Fri, 27 Jan 2023 10:26:16 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jc5-20020a17090325c500b00189d4c666c8sm3195219plb.153.2023.01.27.10.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 10:26:16 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v3 03/14] RISC-V: Improve SBI PMU extension related definitions
Date: Fri, 27 Jan 2023 10:25:47 -0800
Message-Id: <20230127182558.2416400-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230127182558.2416400-1-atishp@rivosinc.com>
References: <20230127182558.2416400-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_102618_076799_7290CF21 
X-CRM114-Status: GOOD (  12.38  )
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

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/sbi.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 4ca7fba..f21c026 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -171,7 +171,7 @@ enum sbi_pmu_fw_generic_events_t {
 	SBI_PMU_FW_IPI_SENT		= 6,
 	SBI_PMU_FW_IPI_RECVD		= 7,
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
