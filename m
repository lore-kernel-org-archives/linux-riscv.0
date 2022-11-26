Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68101C47088
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Nov 2022 17:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=njYKbyd1VthkjBJtFQDKRzKIUoo1w78pByJIshjF4So=; b=nOjOgFUOIlP7ml
	wTC5539xNCVSHVvK+H21WTxH8l0ZJA3ceikGLgyDMoo1oO+f4E3a3whxsQZ4GPIfXJsMsDnalHgkj
	m9q9XzytQiKxW29I5L4/bBHIu6jwXZ/r14ATSYIfz0HXoZRRsTqpKXWtvZ2j0FKGgXdThZst2nUHM
	ZgXnkDo0hUH04HLVXf7il8yJex+d7xPOreFwJIaovuAMPURBK4/dBFjRxUJrrKw513NeSwRGA4igE
	pPX9PY8sEu+4sywPqrehkSfzMK38iBr72/kM4fX+reRKqknbjodYASKrWdykLBk/wlexduYSHuR/9
	QPZSLCiU2cTls69f9LzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyz56-007UT1-66; Sat, 26 Nov 2022 17:35:12 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyz53-007US5-Nc
	for linux-riscv@lists.infradead.org; Sat, 26 Nov 2022 17:35:10 +0000
Received: by mail-pg1-x536.google.com with SMTP id f3so6382843pgc.2
        for <linux-riscv@lists.infradead.org>; Sat, 26 Nov 2022 09:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RwWFYCYJumXDNukDFpgq6aZHdE7ume2pA+aIBGQJqXE=;
        b=MwU705xJfUSSthvCC2sCblhJGza3LUZ6vZ+xE5SfJhDq1VVPVBRVRY4SjvFc1a6dpF
         DmqFF0Cnpi5WwEys551+bUiSJJgGozG0jq4ZTu7erwDTn8wYTbNjNqL7wBBcQhRN9boW
         bYX1cXyn7E9RHOMSexxdCwW0xMCfAEzJTvQbnuje58RHifyiTaz+z5166w4uZrueOiSH
         UihbKxtFRwE1qwShwdRekG2IQGpH9qP4gEyzOhxOvmT1fn6iXz2d0IzBPpoirXW944bX
         OlWsFpNHLjAW/qkDxFGJRry+R97zBwLfBpFUEPvrjyMOJRJs7pjtGZaHPx7fbIWGTNkG
         RM+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RwWFYCYJumXDNukDFpgq6aZHdE7ume2pA+aIBGQJqXE=;
        b=DmrLcMAUDsEoopAu0XLKnTPLNc76KV0UEdqQzrSNjJvLDvQfLDuZUrEY9CxUvNpRcn
         nqKHh7vqSPvrDckMOBWnIrjWfMpjD7yPqwGwQMhUhJR2hoXON8322+hjO7BhK9DVJZ92
         Ik8HVr9ZDyE+2sIv9d+inLQtMS672rarkpycSSTDaUFwNZHfa1mQsw4pJQ9X7xlRbcgz
         6g+7GwXCzQmSTPbAo7YhN6xORkY5FOG90DfbgmeWB4Joflvpl7hpwmhtaOfjKDOLs6pN
         m4EXTBr+HNub7ZtrfIapaAEOxbgCXJ+sAZwtfMKLitB7hHAQnodKvypy7MjOjtblx84k
         JZUw==
X-Gm-Message-State: ANoB5pmxQdZh2HN8M7KlhqqoaFmnacDbRJ2lKpeUBGl3ynLkwv0jJEeE
	L2gpqkMawB2fhsQ0p0OkmZezIQ==
X-Google-Smtp-Source: AA0mqf4ibNWUxq21jp2gH963hS7vCNyCn0MP75l7OIuyiXZGb9912g+Gqdf1XMO7PYUQKUhjUzNkQg==
X-Received: by 2002:a63:5d63:0:b0:462:85d6:6276 with SMTP id o35-20020a635d63000000b0046285d66276mr21009901pgm.293.1669484108516;
        Sat, 26 Nov 2022 09:35:08 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id u11-20020a170902bf4b00b0017f7c4e260fsm5639813pls.150.2022.11.26.09.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 09:35:08 -0800 (PST)
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
	Bin Meng <bmeng.cn@gmail.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v12 1/7] RISC-V: Clear SIP bit only when using SBI IPI operations
Date: Sat, 26 Nov 2022 23:04:47 +0530
Message-Id: <20221126173453.306088-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221126173453.306088-1-apatel@ventanamicro.com>
References: <20221126173453.306088-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221126_093509_786203_8F124B0B 
X-CRM114-Status: GOOD (  10.09  )
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
Reviewed-by: Atish Patra <atishp@rivosinc.com>
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
