Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C09F1C76196
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Mar 2023 03:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DKkm67/hxgZbHFQJphHWdBA0DHYzQYe0MpL6lYveN9A=; b=og8pOlOx7oKb0/
	z1FssO4BoqzrER8unYB3oI2TGBlVztOyPU7iqyPsVR9u4VJ1m+fopbhEO7T5DgRyczxHbRj/6bSUy
	Hsia0LCBx2DDDHDq1KZtPBqbWofzb10PVM4RzTJpGsUcIum8GtHMFvKzNbsbPVowDTqFbwJ9baDT5
	9tnrGCOUmwXSzrWCBCNdcpHqP4GfC3VXNlkCn65XoR68Bnwa/9lQZUzTbuq//DRqznmAxBk8zUg2z
	HOlkuR/qgHkdxWqbSZT0R2jD5tez0nR9uLBTsZDgdKPpJxA5vYcgTxvTs4CmvRYZnwB6QayWlxu2l
	vXTtDuXwiK9ZAlly7bOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph0O8-00D3iP-0C;
	Tue, 28 Mar 2023 03:52:48 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph0O5-00D3hO-25
	for linux-riscv@lists.infradead.org;
	Tue, 28 Mar 2023 03:52:46 +0000
Received: by mail-pj1-x102a.google.com with SMTP id q102so9643265pjq.3
        for <linux-riscv@lists.infradead.org>; Mon, 27 Mar 2023 20:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1679975564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bBw3TUvFHk4RKUwdqt9BFDNXuR7r1OX9/mPGk36mvP4=;
        b=lnlrjHXkDmMDlzuUoycXwQD48f4L24SZZA8SsdN6lNfctWR678XvWa5Cgq7gF+a4sM
         Kjf/fXmcYtyaxGY2EG52YmQko+UyiCDDaCYU+vx6ADZo2peUKOin3yAqtVp/UVhvtWR7
         kDnHIUAHHJ8FGb9x8jyrt7hEn+A2PKH3AMfsmPG5JZDaMlFCSQrezJ12Bc9HsgTJF7/x
         NrbqW+fRijYgcQZgHqcYetFZeYV6yQKd8KliP1t50+GlFyMAi/tLBKZJNZEUGegyjXnx
         V1N1mxiJOKfi0V/KiIfkXKqND56Aul8y95QTqnMzVHSV2E9d9sl5Ap47lQhcxCcUVTSr
         1Kuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679975564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bBw3TUvFHk4RKUwdqt9BFDNXuR7r1OX9/mPGk36mvP4=;
        b=qlhiNpr2FJUFIeQ6Ue0bw4cljxKeU2M6IZUA2YAKWrLLb26IwwVsHsW74jtHJwTZOW
         NIiATQy9sozMMR14bK3xgrGaXBCPi8IsfSbGZFS3NOLZSqkFxxsOjYl57p3z0nfW9vAT
         Na9aSKtOKMGXm9BaSNQtQOnpQPBI8fE8osiCw83V5lS1zPbRpSyAV9ItQHWSmRXrcveZ
         1G3VXDcnTqIX0x6V8+AaD3EP7V4urd/JK6Mea6n3T6w78YMfokNsuVlcUHV0Ls0daxTj
         mPnMxYFQnPyA6BP0kjoEQzdrlxK39gbU3+s9QGycSMOyZv9lVPaAkcAiqNquiBl8NY67
         4pDQ==
X-Gm-Message-State: AAQBX9ftDWx0ZUf3PUI5Kq2LUEvZOQ5QMVdek9K+axMP8L7Rbe1XQ8lG
	4DnvxUr81EI8LzqCZ7cwuOwLqg==
X-Google-Smtp-Source: AKy350afybI3qRbx5wQdWX4X4jL41bTX0UZlK8bMwkiS3yLjNrVxA7e/p3UM1qRey92yO0/nqdTlkQ==
X-Received: by 2002:a17:902:ec8f:b0:1a1:af34:ab35 with SMTP id x15-20020a170902ec8f00b001a1af34ab35mr18073772plg.2.1679975563972;
        Mon, 27 Mar 2023 20:52:43 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.82.104])
        by smtp.gmail.com with ESMTPSA id g6-20020a170902740600b0019cb534a824sm19880278pll.172.2023.03.27.20.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 20:52:43 -0700 (PDT)
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
	Atish Patra <atishp@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v18 1/7] RISC-V: Clear SIP bit only when using SBI IPI operations
Date: Tue, 28 Mar 2023 09:22:17 +0530
Message-Id: <20230328035223.1480939-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230328035223.1480939-1-apatel@ventanamicro.com>
References: <20230328035223.1480939-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_205245_685153_FE5EF1AE 
X-CRM114-Status: GOOD (  10.59  )
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
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/kernel/sbi.c | 8 +++++++-
 arch/riscv/kernel/smp.c | 2 --
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index 5c87db8fdff2..ac99a70ead6a 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -646,8 +646,14 @@ static void sbi_send_cpumask_ipi(const struct cpumask *target)
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
index 8c3b59f1f9b8..8a12768c09ee 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -112,8 +112,6 @@ void riscv_clear_ipi(void)
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
