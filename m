Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6610AC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jul 2022 17:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S76wlMH+UJySB8N8Sx9kU2UvCydDvOwk272/1/O4mQU=; b=cHVj3D87O3+BuJ
	qEg9DhvIVgj75Sdh3Hq88iyreRKWfEMH/ffU3jFnLEJbh/HR17/bKjYdbOUGkeBoU6aWfWDiBFyfS
	p0hygSd1Hk3DUrBRoObbmvLrFtcFoh+rhsZ9nbTeofHiXbs6ZdqDD8JQ/3PrUrzmfg1wsqOIxcMYU
	foBi0yGP8VWOmYeheQ2dP4ZIFlwoCKgc2oL/A47361ntwBsdhWjxpIMZz8Kl5haXB+WXxGrGWY0W0
	4l80g3YP3FwpDUUs/9MmgIsOg5c/iDfNP4YDTkZK5JgCZUQcEmKGSAsvKGuRTq/EeiRED7NHStb1v
	yWskvjpH5XMktX05Kqeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAxUn-003ar0-9p; Mon, 11 Jul 2022 17:46:57 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAxUe-003aih-NB
	for linux-riscv@lists.infradead.org; Mon, 11 Jul 2022 17:46:50 +0000
Received: by mail-pj1-x102a.google.com with SMTP id v4-20020a17090abb8400b001ef966652a3so9071173pjr.4
        for <linux-riscv@lists.infradead.org>; Mon, 11 Jul 2022 10:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qEKWlCC7AAQFkN2lQOBvhkrAmVJAiIHFQ4je7dwmiQk=;
        b=2A9Jrfj4QVotrraU60+KHLujeQqELkBCK2o0SIBWPzhzCkkHCw+z8s0bbAF0KbeYxc
         zbVZelo4wIQOgJAdaUr7IR7bsty4mvle+P+vWkHvPPztirQRuk+aX4pul4bXl4AjBdic
         imIEgWcf+p+9JjAsfKIerhclb/r9lB6t59zkrgNAswZSUXRyzf3CqJ1L/iRrmkpiI7NM
         3Zc8AIUmQjWzoyBrJi2LhUzBgWt3Fs/NwejCUXcnMSDSf5RqEm75DexU1hoeN3T4sUge
         7cHa2vTeM6N7sIxrWDQF/2YbULcMwE8DfBJi8CMeC6jtd1x6y0LIQCbfqKw77qdv+2ku
         V+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qEKWlCC7AAQFkN2lQOBvhkrAmVJAiIHFQ4je7dwmiQk=;
        b=LK/oUJpt4xq1pdt5EPjZiWRmPWAPW1xdzvqlp+je2xXFJrt3urb4vwfjeY10X612Sq
         BuKHHHvPUUOchX7niDtL3l8Sle4BSTNLI/3YQwD4w/VzobMabusOr7Tqrh72StzK6p44
         tqhpDQ4V2+vTNchvOkb02rlJSBDKef6IO/Yi76GB327WBUvqBY/34jJ2SxF4WIC3SkMc
         8bRpgdov3plyf5OtzHUo9BWRT+qj/y3ZqGzwA5NQavE7c5D+Jsjd6U3cJcneE6+ODrVn
         8l2y0hPjOWo5xKHEZW2FUWFbkKaD/FAzsuDIIjbXSZQOKB9d8VguxOUh4jSEkUvEEZN+
         QnMA==
X-Gm-Message-State: AJIora/DxQlcycEMqheaUCcjtPR6/QeHH6bt20Sv+W8EKL+jX3RBXPP1
	qXB5qUnDdmlOQ/uu9oOCgtjKBw==
X-Google-Smtp-Source: AGRyM1vDlkAyeYhMVtonPQR3SHvSE41Bb3Dw5m4IwtJFN0pmrxdwI062w3PGSAnkB/fmansJQkKpng==
X-Received: by 2002:a17:902:d651:b0:16b:f55e:c626 with SMTP id y17-20020a170902d65100b0016bf55ec626mr20295734plh.78.1657561607597;
        Mon, 11 Jul 2022 10:46:47 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id p10-20020a170902780a00b0016be9fa6807sm3236866pll.284.2022.07.11.10.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 10:46:47 -0700 (PDT)
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
Subject: [v3  5/5] RISC-V: Improve SBI definitions
Date: Mon, 11 Jul 2022 10:46:32 -0700
Message-Id: <20220711174632.4186047-6-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711174632.4186047-1-atishp@rivosinc.com>
References: <20220711174632.4186047-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_104648_776212_4CB3C917 
X-CRM114-Status: UNSURE (   9.31  )
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

Fixed few typos and bit fields not aligned with the spec. Define other
related macros that will be useful in the future.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/sbi.h | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index d633ac0f5a32..2a0ef738695e 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -136,7 +136,7 @@ union sbi_pmu_ctr_info {
 	};
 };
 
-#define RISCV_PMU_RAW_EVENT_MASK GENMASK_ULL(55, 0)
+#define RISCV_PMU_RAW_EVENT_MASK GENMASK_ULL(47, 0)
 #define RISCV_PMU_RAW_EVENT_IDX 0x20000
 
 /** General pmu event codes specified in SBI PMU extension */
@@ -203,12 +203,26 @@ enum sbi_pmu_ctr_type {
 	SBI_PMU_CTR_TYPE_FW,
 };
 
+/* Helper macros to decode event idx */
+#define SBI_PMU_EVENT_IDX_OFFSET 20
+#define SBI_PMU_EVENT_IDX_MASK 0xFFFFF
+#define SBI_PMU_EVENT_IDX_CODE_MASK 0xFFFF
+#define SBI_PMU_EVENT_IDX_TYPE_MASK 0xF0000
+#define SBI_PMU_EVENT_RAW_IDX 0x20000
+#define SBI_PMU_FIXED_CTR_MASK 0x07
+
+#define SBI_PMU_EVENT_CACHE_ID_CODE_MASK 0xFFF8
+#define SBI_PMU_EVENT_CACHE_OP_ID_CODE_MASK 0x06
+#define SBI_PMU_EVENT_CACHE_RESULT_ID_CODE_MASK 0x01
+
+#define SBI_PMU_EVENT_IDX_INVALID 0xFFFFFFFF
+
 /* Flags defined for config matching function */
 #define SBI_PMU_CFG_FLAG_SKIP_MATCH	(1 << 0)
 #define SBI_PMU_CFG_FLAG_CLEAR_VALUE	(1 << 1)
 #define SBI_PMU_CFG_FLAG_AUTO_START	(1 << 2)
 #define SBI_PMU_CFG_FLAG_SET_VUINH	(1 << 3)
-#define SBI_PMU_CFG_FLAG_SET_VSNH	(1 << 4)
+#define SBI_PMU_CFG_FLAG_SET_VSINH	(1 << 4)
 #define SBI_PMU_CFG_FLAG_SET_UINH	(1 << 5)
 #define SBI_PMU_CFG_FLAG_SET_SINH	(1 << 6)
 #define SBI_PMU_CFG_FLAG_SET_MINH	(1 << 7)
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
