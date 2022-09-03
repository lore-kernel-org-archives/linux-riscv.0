Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F12FECAAD4
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Sep 2022 16:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kxcf/Kx61aeVfybbYCcYc8KKp0wo9IyoSy9fgDWOEsE=; b=pT3wqgpOPLaDYA
	oWpRJsi5eSrVlg+CNk7XN1hmR6QERRGZauqx2k/QiunKWSs1zVU2rk4O7XC2Mw3kfymdYetYyUycx
	5QmUx75cPnySanDT8gK4X9POzuFR3knO35rV/A/apKzlDZYfzvqd4MZCosXgFEI9rZ9UcFn0Bo3MW
	gpPk1RQF154QFBXRW4PswV2T2e6/PjQs3kKHgJGHIm6lkbvK4F3lFSwPqUkCHnp+ocpgrQjiXRq74
	tFPXtIHCC+Ui9VHu2l+3fjW7y2UgIIviilXVPXQIY2gyWLqb/Hr+eQ/xWI0+h3NaVW8mE7s70gEx+
	eznLEcGRcBJQQK4ZFGxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUVmV-00DPQm-D6; Sat, 03 Sep 2022 16:14:03 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUVmS-00DPMP-Nq
	for linux-riscv@lists.infradead.org; Sat, 03 Sep 2022 16:14:02 +0000
Received: by mail-pj1-x1030.google.com with SMTP id ck21-20020a17090afe1500b002003ba5b71cso88082pjb.0
        for <linux-riscv@lists.infradead.org>; Sat, 03 Sep 2022 09:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=c13eLILpK8GkWj7laTCqdhoKnHDkAb339eaJW9sNtYg=;
        b=F3pJLPmaaleiWpOrar+aNNoD6kReHeL2nIkQ1y3pClTWIK/ur7vNg1ZPMpAw5jBI8X
         zSkJ+onNFYa5GL26sFC+CF4JLGYVM/L+F5I172rOAiH9tjqPRDYanlM+84zKtG3dlXnB
         6uSBOxWzVSAgFRve7id+WFj8XZaFgWbBvflt0ppClxSMmbwX/24JpzpcRIPTFCVzMpeQ
         4JTvOBDVvKnxRjsS4HLwQvQ665q1P7pGxNtG4Tz1bijFxyvgsYnI0QG+8DlCOP8fXYJ2
         RwEyvaGPaLF7TKz69h2AaGTZVrXg9JmU1Rkd7Mm2Gtkdu1euF2dzv4t55J/DHYYLV1Qo
         mfqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=c13eLILpK8GkWj7laTCqdhoKnHDkAb339eaJW9sNtYg=;
        b=QWpb9wwFErGHAgiqc79WhxUrSxiDBQ1z1+MJyd62LQXHmI4NUO6IkzS0+5ZLlLH5nj
         4gOAd5TIbrEXBsgZDgJ3IJYe5II2crDcFl4q5BQm+MXFcPe+NsjAzXxLx2Sed8GCJRsH
         9QLd9ACRuytACxUSTwh2v4ZrxCFkvPsHEkK3t4UdbHjjVz8iXp3lBzpo8Yx5TAQWQH/c
         16Fz2hk9ev8vIoZ4cJrwuq7is4UUlKpO9Dc9uHBZtnDmdK9UEey45wVlxQeXoN2nX38f
         B/hz+fvRjawfJg0HX0pxsYUgQt+rYuNx8z7MmY5hq5hb4RXJUZQhj4gi7SCdUrEOl9iM
         6eLw==
X-Gm-Message-State: ACgBeo0ZnI3xM3VpH8naWrjEbStyQr6Sxi2lzgrwlwHTJpbIVZgvBmhc
	WhjrkFyYM+pMjc9y/kOWoCbrqg==
X-Google-Smtp-Source: AA6agR6PtvLxGxJcxENhOmNOJYeB70nAWUBQoJLM8Ad8i0xbh9HyPThAT/ATycvrWLqkF2ekFSuJQg==
X-Received: by 2002:a17:902:a60c:b0:171:407d:16f8 with SMTP id u12-20020a170902a60c00b00171407d16f8mr40576670plq.58.1662221637625;
        Sat, 03 Sep 2022 09:13:57 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.86.115])
        by smtp.gmail.com with ESMTPSA id 4-20020a620504000000b00537b1aa9191sm4166738pff.178.2022.09.03.09.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Sep 2022 09:13:57 -0700 (PDT)
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
Subject: [PATCH v9 7/7] RISC-V: Use IPIs for remote icache flush when possible
Date: Sat,  3 Sep 2022 21:43:09 +0530
Message-Id: <20220903161309.32848-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220903161309.32848-1-apatel@ventanamicro.com>
References: <20220903161309.32848-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220903_091400_808011_E8792342 
X-CRM114-Status: GOOD (  11.09  )
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
index 336c5deea870..45bcf1f635c5 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -20,7 +20,7 @@ void flush_icache_all(void)
 {
 	local_flush_icache_all();
 
-	if (IS_ENABLED(CONFIG_RISCV_SBI))
+	if (IS_ENABLED(CONFIG_RISCV_SBI) && !riscv_use_ipi_for_rfence())
 		sbi_remote_fence_i(NULL);
 	else
 		on_each_cpu(ipi_remote_fence_i, NULL, 1);
@@ -68,7 +68,8 @@ void flush_icache_mm(struct mm_struct *mm, bool local)
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
