Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 903F3C3F6B0
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Aug 2022 06:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y5ZXERW4e1ZjR9cKYqRJabUHSnR2I1ZIqBIuWykrTnc=; b=tR3IzbSheOFsJw
	alnqQcCRIx6B2MxDHAiDd45Om1HLLV+PCaiG+WWasultvJeLYTNj9HGe8uPefL1wdpL0xMIy1l4OI
	MStYyttoypoH9af/clNHV7TfmqNpMpprYT22c80zyTuZvJp/xHhgPyziMpST47B5UiCewVovEIBr1
	cjEzFCVVTo83w0A3av4iEpA+gMccOYEssqz8JgOx4LLrBWuxWseipO3vtJuGeB8RCbJcxi8bz8m3u
	89eJIkqlnpuAiHvHLgHgSpXn5JV9y6sHK20AIwPBE0+NnhO0WQT7v9IBtTM2euCTxWxU99vm2LwG6
	W2nYof961lHdfvGWzZpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPIOg-003uRf-C0; Sat, 20 Aug 2022 06:55:54 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPIOd-003uQO-Ap
	for linux-riscv@lists.infradead.org; Sat, 20 Aug 2022 06:55:52 +0000
Received: by mail-oi1-x22b.google.com with SMTP id w196so6948651oiw.10
        for <linux-riscv@lists.infradead.org>; Fri, 19 Aug 2022 23:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=tQCr/IgKCdRHY8LSP1T2xhus9TIrH4sruSlDTlO3guE=;
        b=ei8+a9amYDoCpz1QI5IeR7TYam6l5ohxbZI/T1kt/X1fsxq0YHMoqW0v47Oz3RAAAg
         xqTBjui/X0e6KsM/aQoYTgFSvGmF99FFNS9LZ9IUUFXqS+2SsqVFFtlcCCus00feE1zn
         177JILJY5e9+mryKtBTtj6NEu3ew9G6pHpLNrGFtD75A/u7hyrlSrR2XB5HFYvS0WYpY
         rBvo9BaAWW58MQee7u1gevoo7SGHaBNpW9Z9OEUMw7wNbhzZ6vNcgkxJLop7lKC9ir4j
         91RjGjhY5ljxNPiJmQ7gCbcwEM4b0f+BBaOto7yzD/0WEU/f23NVdizyHYhVKRoQONRo
         X0yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=tQCr/IgKCdRHY8LSP1T2xhus9TIrH4sruSlDTlO3guE=;
        b=DsW49ndWCgqgFfxBWjDjHxrsAyUeiB073tLNup3eqgGXE6Sr2JAwWs+PonZjeFRINm
         NWTk2o0H2hoFb4kWw37vO8PnTyeOOtDcafVPs3ycrGTlTJ8nnjDQOz/SQpJck4Xy/bg/
         lPGuWJkersrFK7EPvaJkMMwVN8jt0E3yl9Z6kVsK8e+dAH58B4oSAQvko1axJSEYzfEC
         sWjbUDW0aXFVZFnry/jcy836aoM/PNiMF5pLJBm+8sGxqnqKBhUlJWLm6vIANYd2Fi+Z
         Q+SjradQt8FSkz+KNWvoMcxaxOKILp7FXM295TmgfONjnme6VY4e1pKG2LdPmMDpbQqz
         9CbA==
X-Gm-Message-State: ACgBeo2Z8b9chHIne92crw4doAOlH3twpPvLVZB+DSWANlyEGM9qhhqC
	GiQ3eqrVYG6qwm8Ayj6UMlLXOw==
X-Google-Smtp-Source: AA6agR5Oo0DXXb5svYgvBBGq7lg7ZNVbU0D0Ks8xh5M92bnwe0csVlpM4h+ggVcAl9pbcv+gygl2kA==
X-Received: by 2002:a05:6808:19a4:b0:343:300c:a1b2 with SMTP id bj36-20020a05680819a400b00343300ca1b2mr5420429oib.253.1660978549973;
        Fri, 19 Aug 2022 23:55:49 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.82.68])
        by smtp.gmail.com with ESMTPSA id h26-20020a9d641a000000b00636faf5e2d9sm1661098otl.39.2022.08.19.23.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 23:55:49 -0700 (PDT)
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
	Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v8 1/7] RISC-V: Clear SIP bit only when using SBI IPI operations
Date: Sat, 20 Aug 2022 12:24:40 +0530
Message-Id: <20220820065446.389788-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220820065446.389788-1-apatel@ventanamicro.com>
References: <20220820065446.389788-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_235551_414683_9981AEBF 
X-CRM114-Status: GOOD (  10.07  )
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

The software interrupt pending (i.e. [M|S]SIP) bit is writeable for
S-mode but read-only for M-mode so we clear this bit only when using
SBI IPI operations.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 arch/riscv/kernel/sbi.c | 8 +++++++-
 arch/riscv/kernel/smp.c | 2 --
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index 775d3322b422..fc614650a2e3 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -643,8 +643,14 @@ static void sbi_send_cpumask_ipi(const struct cpumask *target)
 	sbi_send_ipi(target);
 }
 
+static void sbi_ipi_clear(void)
+{
+	csr_clear(CSR_IP, IE_SIE);
+}
+
 static const struct riscv_ipi_ops sbi_ipi_ops = {
-	.ipi_inject = sbi_send_cpumask_ipi
+	.ipi_inject = sbi_send_cpumask_ipi,
+	.ipi_clear = sbi_ipi_clear
 };
 
 void __init sbi_init(void)
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index 760a64518c58..c56d67f53ea9 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -83,8 +83,6 @@ void riscv_clear_ipi(void)
 {
 	if (ipi_ops && ipi_ops->ipi_clear)
 		ipi_ops->ipi_clear();
-
-	csr_clear(CSR_IP, IE_SIE);
 }
 EXPORT_SYMBOL_GPL(riscv_clear_ipi);
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
