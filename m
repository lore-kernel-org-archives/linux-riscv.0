Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F1D2C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jul 2022 17:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pRqv/GPVvARMvAtpN9PYsh2fNGtWMSGAzMm+xiJnFpQ=; b=B/D2QUAIKnTL/V
	Bl+FO+Ypht/zWDRdtbAnL8N7jn+wodI9tb44xi99tSfhL+Vn+WY2HKX0y2n/BW2zRtk6p3zK8j2PV
	a+ky6lyadIIVoqin3Vqh0rCg9TkTvqu+qcs352x09faMxTD/hHzkHl3+eJ2ptiVisYrjiU8BYr3lX
	ElhC2yMJaSZ0ndUhH7aMYTVQYmcpk3gzYOW76SiTu9YtZT0mptkfU3Ur4v0hLko973PRmbpeTffg0
	0NM8PtCuN/GTxQFmjWewHGCpdsByattkMyayZhvOmCLPmkz+XFFIbwaCpnlWGtpapnP1+7etUPDle
	zaKRsmkEPWdkAEET9IJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAxUl-003apu-Hj; Mon, 11 Jul 2022 17:46:55 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAxUd-003ahr-Nm
	for linux-riscv@lists.infradead.org; Mon, 11 Jul 2022 17:46:49 +0000
Received: by mail-pg1-x52a.google.com with SMTP id s27so5310710pga.13
        for <linux-riscv@lists.infradead.org>; Mon, 11 Jul 2022 10:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sDSNj3lh6sTDX65OlCD100Y9q85i9QCNDNF32ttMwM0=;
        b=u3VR8WAkynCBOJ8n0dSu67CSUM1scF+iq2HkJHHwWNCnCzIicRNMFcHK+9f0MZBUKQ
         2aXzF3fJ2mSF/+/pXnxqh2DTiPjFsIQHBlpw9mwaQZQwXWVMG1Tm8cmVlOY07txFp/dW
         ZD1VpBG/GdY26VU7j8RIWu88xaedmSxqrUubsg6pCNJxJUjE6UhSZsXkVVtzmdGuQ0e9
         zx/pZSfjxadzXscPBqTtjVyAGHeqKieBkSg3veGkPyQD6B3MwJJuS1NbTFiUg3ak5Jwd
         XKyyefVrH/G6lP4dpA8Y9wSPXHR3C5iUpIV+fwToNTXH+opA8A8zr5fKwNdlhvhludvn
         nHrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sDSNj3lh6sTDX65OlCD100Y9q85i9QCNDNF32ttMwM0=;
        b=shFpcb4c0cCnB+tO6vUG+Cn7wfOqDLi/2VF+sbH9ePoJVKz/Q9nhb41QRoRfxvAKR1
         2BebU6khRj8lz/ns9Pg3+3rZe/U7+K6pVmzEAN8F1PH9B0CaL1+ydCCbeSy9rvXPHEJL
         jw468SKq4wplIf1cQqhR3e0+kLujUmbx0Fqpki570f7AXGPVxyunP7K45+FvfG4IaAYc
         WD+xke70Skd7f7i0d52jVqh2xPSGBQ9rle3tNj/E8hkgTHOrwFgqrRCFGAFpW7J4htq8
         mXk3EZZGHSE3E7/Tj6kKtkN+ysrk/5h58+Rg2Cb0uNrxuM6wk6V/WZxLDL6hj+vejZlQ
         dXhw==
X-Gm-Message-State: AJIora8myWU1d1Dp39e5SaEzSuxfinonOXtZtChILNVvLJg1h13KNa45
	LEOxxEskkKYdIYpZX6Hok4mUgg==
X-Google-Smtp-Source: AGRyM1sIjQ1yNU2YHO1M9vKkr0zih6h/RokRxyqSx3Rq6iQfnUyNXXET1eBJmKXi1sEon9yRbHennQ==
X-Received: by 2002:a05:6a00:1d18:b0:52a:c350:6538 with SMTP id a24-20020a056a001d1800b0052ac3506538mr10510717pfx.7.1657561606627;
        Mon, 11 Jul 2022 10:46:46 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id p10-20020a170902780a00b0016be9fa6807sm3236866pll.284.2022.07.11.10.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 10:46:46 -0700 (PDT)
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
Subject: [v3  4/5] RISC-V: Move counter info definition to sbi header file
Date: Mon, 11 Jul 2022 10:46:31 -0700
Message-Id: <20220711174632.4186047-5-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711174632.4186047-1-atishp@rivosinc.com>
References: <20220711174632.4186047-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_104647_822437_8DFAD8B7 
X-CRM114-Status: GOOD (  10.11  )
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

Counter info encoding format is defined by the SBI specificaiton.
KVM implementation of SBI PMU extension will also leverage this definition.
Move the definition to common sbi header file from the sbi pmu driver.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/sbi.h | 14 ++++++++++++++
 drivers/perf/riscv_pmu_sbi.c | 14 --------------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 9e3c2cf1edaf..d633ac0f5a32 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -122,6 +122,20 @@ enum sbi_ext_pmu_fid {
 	SBI_EXT_PMU_COUNTER_FW_READ,
 };
 
+union sbi_pmu_ctr_info {
+	unsigned long value;
+	struct {
+		unsigned long csr:12;
+		unsigned long width:6;
+#if __riscv_xlen == 32
+		unsigned long reserved:13;
+#else
+		unsigned long reserved:45;
+#endif
+		unsigned long type:1;
+	};
+};
+
 #define RISCV_PMU_RAW_EVENT_MASK GENMASK_ULL(55, 0)
 #define RISCV_PMU_RAW_EVENT_IDX 0x20000
 
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index bae614c73b14..24124546844c 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -21,20 +21,6 @@
 #include <asm/sbi.h>
 #include <asm/hwcap.h>
 
-union sbi_pmu_ctr_info {
-	unsigned long value;
-	struct {
-		unsigned long csr:12;
-		unsigned long width:6;
-#if __riscv_xlen == 32
-		unsigned long reserved:13;
-#else
-		unsigned long reserved:45;
-#endif
-		unsigned long type:1;
-	};
-};
-
 /*
  * RISC-V doesn't have hetergenous harts yet. This need to be part of
  * per_cpu in case of harts with different pmu counters
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
