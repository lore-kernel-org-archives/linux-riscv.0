Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C0CC43219
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Nov 2022 14:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=njYKbyd1VthkjBJtFQDKRzKIUoo1w78pByJIshjF4So=; b=y6Bsyf/Rd11J98
	MwpowbXuGtWNu4YPD7u4RfOYKCaAwNGQcylws4AWSC0cLg6/dnZasuI3uzWQsYvQ0U+lyg0/QZGBQ
	N7/RdcGWE1RH7nY30Md/5hHkEzCAyLeOIlLof9fxKnIr/KAvXqD6OdhkCnr1WR2UcBGZXHaTz4/Yr
	GH84oar+UZ5OQXmw0E/KVGWpE0FGnnBLfd71d1jf/KMQKIt6cY3xaqS3E2X4byOoRVoraFplQPzyu
	i9T6cFftdmPtHnVyV/0c4F6+1zmm/2ayU6TJKoE3sTw3O0z+so/38Rzln+YDKYuoJhvIyUpfcc1zI
	xg5H7TmHIXaO2B5iav0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opsLh-005VCc-I3; Tue, 01 Nov 2022 14:34:41 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opsLf-005VBG-Lq
	for linux-riscv@lists.infradead.org; Tue, 01 Nov 2022 14:34:40 +0000
Received: by mail-pg1-x536.google.com with SMTP id s196so13588126pgs.3
        for <linux-riscv@lists.infradead.org>; Tue, 01 Nov 2022 07:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RwWFYCYJumXDNukDFpgq6aZHdE7ume2pA+aIBGQJqXE=;
        b=GFcmRIesUWIz/XTK/DZOnuFn9hhDBdvIgSX+tNR4YNV02qbkLgAb0VRAQzpftjbynm
         i67Zt2PpSUy3ObjokrZCMzlwwwcRqRUz2/FZY0cprReKwAky0iyKfRQ2qPcRFVCebn4/
         tcdO4dftOeCtLKTNKhgjtGlxbbZovxnenlGQdbc1bhh0XZbFj66iqJh79gQUpgINBLFa
         1uy5vR2ZquzfPKjcwVnsoQzQEEiGgHu4uD5JtPfbzTrEx6nwnOre74V7wuRpy7JyIPEy
         UA3L2tSHdvrXvsh16MFn5OKFZvg4eK3o9g/Mh5LJ/sWbJkDCBVi4Bwg8wovl4YVBGNjt
         if3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RwWFYCYJumXDNukDFpgq6aZHdE7ume2pA+aIBGQJqXE=;
        b=ChbyEOkSDJE7cJ0H9Mcd+qATg04McrfwIwK+ZZm7FdFo7SyB3FQoPFObr77EvsenRZ
         qDQ9AM0LF3sTP1um8r0veO34Jc5yb6thBVb4iQ1XuU5MINnmND0fu6dcANJFAWy0iW0l
         ypxfcKyQ6PBh8aMf5gGsbyhijBZtXCMLEA4cshIvfEXotK+FZtgFlheyOm3Qh70WaDlH
         XaWzW0m8IWVRQCsXCC2w1OknT6RJXRMJpa1yklYxLPF2SsiS+JyT2tEoQ/Ia8rS2439t
         mEURHlUJVox9hJuXrXQ+kobs/gPhcIw1TzudpQhW6IY4wHwC6V6rtjrgLujHWjTnchRd
         FFlA==
X-Gm-Message-State: ACrzQf3esS1qNdRiET73etdrmUoWxWhjyJTGaagIVzhTVlqbjk84GUgO
	jkEmbjNY7W+IzluhkTQ3PL+gwA==
X-Google-Smtp-Source: AMsMyM5o6B9od63fp9tZyjjhp++8fvomY8nAOhDDu44nFRorJDvpVOxvp8UIvFvTaMmL0/Pq5YO+4g==
X-Received: by 2002:a05:6a00:1f06:b0:56c:ee8a:29f7 with SMTP id be6-20020a056a001f0600b0056cee8a29f7mr20213771pfb.44.1667313277494;
        Tue, 01 Nov 2022 07:34:37 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.80.52])
        by smtp.gmail.com with ESMTPSA id o20-20020a170903009400b0018685aaf41dsm6449055pld.18.2022.11.01.07.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 07:34:37 -0700 (PDT)
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
Subject: [PATCH v10 1/7] RISC-V: Clear SIP bit only when using SBI IPI operations
Date: Tue,  1 Nov 2022 20:03:54 +0530
Message-Id: <20221101143400.690000-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221101143400.690000-1-apatel@ventanamicro.com>
References: <20221101143400.690000-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221101_073439_729267_DEB4290C 
X-CRM114-Status: GOOD (  10.90  )
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
