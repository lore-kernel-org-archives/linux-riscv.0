Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76235C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jul 2022 15:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EjlZpKTHI6aW5IiBlVdFHEAb9+moUWn1ap5yySvJaWE=; b=xdG5wAxfFfl7o4
	F4cbqRXOhcNzARICSuHEn/IGpDULwpeQa5pfUjBnXNCRIa4C7tGFjKUDGTdwINaqeDJY68PIC3zVM
	eYCgIm6Uot7ENvafalJNQI/QxPXuRKjM5m0SQonBRSy6WntWlBZKwb3P9yPqP6IGPuVfXcF9c+v0m
	Yx2ZoxDk5kjV4A2WsWTtZ2oRP4avCMy7OXGGV2hP60C1Ik4JiPCYKyhVeD7h1o3lzUe6c8U3aWth0
	NpEOqF+gryTZ1K3rt4i3MkXgTrRuUcCvYlzwXxIX4oHIjqoZFZjKPaMTSX0ST6Jv5CW9m0+7MeEJQ
	nTpqny2sdr8geJaTPWpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEBYu-007WKV-Co; Wed, 20 Jul 2022 15:24:32 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEBYr-007WG2-Ul
	for linux-riscv@lists.infradead.org; Wed, 20 Jul 2022 15:24:31 +0000
Received: by mail-pj1-x102a.google.com with SMTP id o18so3894257pjs.2
        for <linux-riscv@lists.infradead.org>; Wed, 20 Jul 2022 08:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qHl3w50eHPbDg8ZW9/eV6YU7JVWrKk8VX9CvtFNZ+jA=;
        b=CRupW9tTNawaIQTrxX8Gz790wRJKCLMsKZHqI4BYN6FTc/X1mqQ53iS5jjJT545EKa
         knnqpNlH1IJn1r0oT/mGT7ID0LMZt/hPrOEDFWXGxLJcAgrA+GTjyOSFe5oEAA1zmxGq
         qiG0H+7DcalIICdNFdMBc5b/mgfhXD8ESWbLk1YSsEQ6PUcPoZ3/UpJd6wnsJfhiSLFU
         OTEZDuunttdQhu8chXvv5I46P6m4Cwa4cS38gBgbFijPruzGiq5yQPuc1AQOYDF70tyR
         0SCFQsO4M1P4iiMUEQxiQBKGw4lVPr0tAcS19wMRx6CqjEA44zD61MAi73klmTNSba5C
         N4mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qHl3w50eHPbDg8ZW9/eV6YU7JVWrKk8VX9CvtFNZ+jA=;
        b=GQrNrRzlR/synJmxNruC1SkFIuJushR12wJwjs/2CyZQuLGfrX7H90Q4YFCfGVGLzm
         u1MmWtv+FSoUNGwR8LcSafmcLPWGPMeGxfbw5SGaV487sumTeeJeKp+GtFqPbR8EvGTx
         UHLAlU2R9MqAn3vqbFQF2qGDT6BQEeKRiUyvycOdF+mULJL2Gr7mV1cGA7L+ygoprG8c
         Gt91zKHRcBKCcubVsl7uDosfV7lKBR9lcfRiB5XKaH3TxAI1L6grPcJXM6vzI3QwWvyi
         /AadpCDJm5LGAqkv3IwzXu8+lkyaOVyLpfIV0dlLAwm5ewPymCYTUPY07EFAJQu7sY48
         Vbnw==
X-Gm-Message-State: AJIora8dbKnRbTh38qiD2AtBQm5NQ2/AAplVAeTf0WFlcifrAu+6dY5X
	wQ9GpG6u2uE1LKzlMcNrC1UbdA==
X-Google-Smtp-Source: AGRyM1vb6D/rdAEnHi7mvaOCx/awuQho72gqkUgQnU7xQI4Im1bHybG17U2f/wflrhirS5zSlkZMcA==
X-Received: by 2002:a17:90a:6404:b0:1f1:f935:7878 with SMTP id g4-20020a17090a640400b001f1f9357878mr5918503pjj.218.1658330666925;
        Wed, 20 Jul 2022 08:24:26 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([122.179.42.230])
        by smtp.gmail.com with ESMTPSA id w15-20020a1709026f0f00b0016cf8f0bdd5sm6013031plk.108.2022.07.20.08.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 08:24:26 -0700 (PDT)
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
Subject: [PATCH v7 1/7] RISC-V: Clear SIP bit only when using SBI IPI operations
Date: Wed, 20 Jul 2022 20:53:42 +0530
Message-Id: <20220720152348.2889109-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220720152348.2889109-1-apatel@ventanamicro.com>
References: <20220720152348.2889109-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_082430_015258_89828ACD 
X-CRM114-Status: GOOD (  10.68  )
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
index b5d30ea92292..6fd8b3cbec1b 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -89,8 +89,6 @@ void riscv_clear_ipi(void)
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
