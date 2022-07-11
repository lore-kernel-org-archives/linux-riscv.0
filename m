Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22BD7C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jul 2022 17:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UDuuIfXPh1sqR2WxEudbIJ+sj0sQsnJvrpC2BfgRJso=; b=ZeWyLgIasw7mjZ
	J3qcZKX/5ctDM+TZqt1OpYzX9J58sSM2b6ia7I/0MkkDC2ZY1nxXi8cHbPkmmdPjYP91mzAgjadOl
	+ZtCBJZo0t3nfVMioG/oM5ipo2FONGRf7I5VtrMR/ExErUbVDVqTiabJfinehfBWmv0vtYQKpYKzS
	WS8PU4uDqivoqCW2oarPCqWnwDMWeuvsQ9oPH8DQy/Mna+YrtX7BkdskCi65pUDM42uYTX2FoGVoB
	ZyDVJuKDt6RuCDF62UF35WyN7p0fVvppjwzFOdVi9E+YcbIeZql2YtUhHgOpUw84uTckcpuBt6Pcy
	0gwdyICAtEt8If0/+SSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAxUg-003amO-Bi; Mon, 11 Jul 2022 17:46:50 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAxUb-003ag9-3f
	for linux-riscv@lists.infradead.org; Mon, 11 Jul 2022 17:46:46 +0000
Received: by mail-pj1-x1031.google.com with SMTP id a15so5472321pjs.0
        for <linux-riscv@lists.infradead.org>; Mon, 11 Jul 2022 10:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0Sgv21IkQ0c7ss/RxtMygO/Q/cken8+hd9VuAl5/nl8=;
        b=P89IaPfDJiWRHSo6zBLmhQbd7XMH8r0EWsEPfpbVk058AetLSOhGT4lo6XqgrqrFWb
         sDdmQ8iv8OQJ+f+UPcasXaE3zwfls6tI8MEJZXBJMzhxKzjmMtl1QyzKQ+2YNdH/H9Op
         Wse9yuEdi5cG2/XkKhxCaE/RY5qhXxlas2fAx9nbgzmZgBYg15cmGDSGHUVRE4oIbSEn
         R8AAxy/VJUdjXFuG6uNGt8OrbPltXQ9eT0njiqwzZD6MrOk6JYuWtZHqG6+xhsr1+0XV
         0Yh43ZONbPS0WrHxLVMhlu0sEMrKhjQeTyv+mqW8+LgZEQEytI7LCs2Q6aB19a3QKmRt
         MoPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0Sgv21IkQ0c7ss/RxtMygO/Q/cken8+hd9VuAl5/nl8=;
        b=7IUwtk3A8j7z/zZ+TUP4g7X59pJqPWWys2YzUw7lb/h7itSusn9TEVy0t5HdxNZ+kK
         kVpBe42CzbG6zuvFEgx8KQvFXl5sXXo+laDY/weJn5rsb49f6kCcAwwFsXKPzTMb1Rj5
         sqnlZY+m5F4d5Ld6Yun2Mm3JdqGtGa3DBlo/mDf1Fc7LRRhxfJqRwq6TUTPL5AqR75gn
         f+JbT95u2RH9/N7tQBjuq/V0JQC6tCOS7UKz6hGj/vRF5P+C9e1xDF7qgSWTCecATg6o
         cq58GKJc6hBs7uelXeQ0bhHn52IkR0nty0RCTQLyJp542xVi8TYXcIF8/hRqCCP6N0eb
         Wahg==
X-Gm-Message-State: AJIora+HXV8+3UGL3omkFZeZ7RRrV0pDPqX2XJOKsBAGn1RBUx50kY5q
	NETIOUIq4O2vQ+Ip7HImFR3tKw==
X-Google-Smtp-Source: AGRyM1uwy4SqoGXdZSGU9XupDTj6fIsTxcyHyFsJGzm31lf/2arfzc6EF4NjRqb/sNjEgUsL0zKFFg==
X-Received: by 2002:a17:902:ab96:b0:16a:6db6:2715 with SMTP id f22-20020a170902ab9600b0016a6db62715mr20279922plr.141.1657561603713;
        Mon, 11 Jul 2022 10:46:43 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id p10-20020a170902780a00b0016be9fa6807sm3236866pll.284.2022.07.11.10.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 10:46:43 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Guo Ren <guoren@kernel.org>,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: [v3  1/5] RISC-V: Fix counter restart during overflow for RV32
Date: Mon, 11 Jul 2022 10:46:28 -0700
Message-Id: <20220711174632.4186047-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711174632.4186047-1-atishp@rivosinc.com>
References: <20220711174632.4186047-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_104645_173558_1CDD1E46 
X-CRM114-Status: UNSURE (   8.28  )
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

Pass the upper half of the initial value of the counter correctly
for RV32.

Fixes: 4905ec2fb7e6 ("RISC-V: Add sscofpmf extension support")

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_sbi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index dca3537a8dcc..0cb694b794ae 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -525,8 +525,13 @@ static inline void pmu_sbi_start_overflow_mask(struct riscv_pmu *pmu,
 			hwc = &event->hw;
 			max_period = riscv_pmu_ctr_get_width_mask(event);
 			init_val = local64_read(&hwc->prev_count) & max_period;
+#if defined(CONFIG_32BIT)
+			sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, idx, 1,
+				  flag, init_val, init_val >> 32, 0);
+#else
 			sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, idx, 1,
 				  flag, init_val, 0, 0);
+#endif
 		}
 		ctr_ovf_mask = ctr_ovf_mask >> 1;
 		idx++;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
