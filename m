Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CBDBC678D5
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 17:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DKkm67/hxgZbHFQJphHWdBA0DHYzQYe0MpL6lYveN9A=; b=Km2808RcP3fqI7
	ibYhAUv9JglLyKH3zDMM5bZilZGQWAPlMAU8AQQNHEN11F2Di07VviIy09U5WKqBL1iL6xlYN9Bmo
	xNsOUmipaBqfo8W7UDULmqrtjN2A8e0WdciJBioTWvfdqre16shWWznpdbKj8HOFp2PQuVaoP/aA4
	yWJIn9cz5R60YSb9koN80CAOqYjPPUUrVW1chdkajf1j0Ch2I3xvc3FLbFWaSoVWaHwnDNt9WdI16
	7NPyaByxHPyhFlalyP6Hsnu6xy5FZ1H8thF0yPmml75EbcXxf0wNG2wboQnJwcrMwvvOQTig0pIkz
	fY6Y37oZfoY+WJikgfMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZbBK-001olf-3Q; Tue, 07 Mar 2023 17:32:58 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZbBH-001oiJ-2Y
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 17:32:56 +0000
Received: by mail-pf1-x42b.google.com with SMTP id x7so6591142pff.7
        for <linux-riscv@lists.infradead.org>; Tue, 07 Mar 2023 09:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1678210370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bBw3TUvFHk4RKUwdqt9BFDNXuR7r1OX9/mPGk36mvP4=;
        b=no8qYmaEO+2AGv/Ic0WpAXhLuyjcpmP+pddKfSSqCaCJt71sjedirQTG5rKbhWo0VO
         LbeOdWHltmNGIhPh4VVLPe8P5FMb29kcKyVbQU5NovEd9UTjfP/gi9mg8iWkPgw5xuNZ
         a/bqLpllTxdQABnMfcHSDA7BAhWlFaFFc1NVdJDeT6F77CHXS4Xa4dZUwk2lJ/Rd6zj8
         p/TYLthWsJW2lXPKQa+KoHE5/C7R5grh6KH+lvllRdXaKOTVwfZDBHCDJoLsWerQb4IP
         KL8KUpFZ+eHG0Hnr4LbUCzwyraOdF7O4veUu1+YmM3Hp41EBZlNT/TapTa8XVGvOr1fF
         TLKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678210370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bBw3TUvFHk4RKUwdqt9BFDNXuR7r1OX9/mPGk36mvP4=;
        b=RvOSCKPx6iKjVAoHTVxPN4MaEDHBd8TJspydz98LFy9H4tn+K/ARb1sAG/nNmrhBPG
         vAPU7c8tqk+f6sohypBJrYoOrVIicgPmTnIH0f8ZVw5mq5x6NHX3bI7nrGpVFMrHI4n7
         w6LCaaczH9ZOAksBr/5fmHdGN7Y5Ae1QYgBDa/oCYLphKj4+YBKqWv+IyWwyoAHGUNGe
         jh98leM5v3s4XFU/XSCEuM9CX5ewPGdZsgtQ1H2Zs7zwFg5cqt6BhKmQY8EA4bCXOtg/
         d/BRuP6IORyNUX08oU8qTDX/TxeLcSV5YjDWESHiEbeFpmHMnTbE+Q7bXbK1P9Yqyw7g
         B6/w==
X-Gm-Message-State: AO0yUKXGnT59kSsLQuvYy1LX/CDgiJPul3Ju+BbihosFSV4EcBFpCu8+
	FJMsPG8UtKfjXIvntefN0RvGsA==
X-Google-Smtp-Source: AK7set9VDW+R8Pvm7Nwl6Z27bo4m6udIt0gmbM7cBQHWzoLcG66d1Q09gvMWXcvjsWgwx+3bYcCocg==
X-Received: by 2002:a62:1c07:0:b0:5a8:a467:f975 with SMTP id c7-20020a621c07000000b005a8a467f975mr13843121pfc.17.1678210370359;
        Tue, 07 Mar 2023 09:32:50 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id 1-20020a630301000000b004fb11a7f2d4sm7996185pgd.57.2023.03.07.09.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 09:32:49 -0800 (PST)
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
	asahi@lists.linux.dev,
	Anup Patel <apatel@ventanamicro.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	Atish Patra <atishp@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v17 1/7] RISC-V: Clear SIP bit only when using SBI IPI operations
Date: Tue,  7 Mar 2023 23:02:25 +0530
Message-Id: <20230307173231.2189275-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307173231.2189275-1-apatel@ventanamicro.com>
References: <20230307173231.2189275-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_093255_147799_FA96EA52 
X-CRM114-Status: GOOD (  10.52  )
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
