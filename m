Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CAD4C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Apr 2022 10:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ocd9qmWMAigU7CblVmQshg/J3LAxcGjD/O5avmjwFR4=; b=twSDbXOOQyRVzj
	HFyfDegzkBEqhN/y8f9ptvPFkXBVThtnAwChaeXOKY5g3tCChtezNhu6bcszS11hRmIv6QYfheXuu
	JYo0h7N7b0GEJk8BXTccUaty3BKmbAga8sR7Yx+Ejv7JjXRA8H7lAjWKFc6ouGhHVBCazF3dvvn/r
	OUp8Q0GCjoeT030QCBIbPCFNFN+4C8s11+J+vfGa0v88kPjE/zUFgCigwOQ5raZuxow2Ljk5EixAB
	WDwmJrF4QIqddWFWY15mUFjTOQc9TYJeheM4F31/TEbEVRZaR8f9nS83BXoLm3FVN66LMRzt62TNI
	WlLQKuRK2lzloGktwKQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngP0y-00GNPN-VS; Mon, 18 Apr 2022 10:53:52 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngP0v-00GNNo-QX
 for linux-riscv@lists.infradead.org; Mon, 18 Apr 2022 10:53:51 +0000
Received: by mail-pj1-x1035.google.com with SMTP id
 mp16-20020a17090b191000b001cb5efbcab6so16930669pjb.4
 for <linux-riscv@lists.infradead.org>; Mon, 18 Apr 2022 03:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FXY/vIDKe6DGMfSlwt+/9lV29k2hg5m2ZOntq1vLjB8=;
 b=QXXTOyqVuuKkoq8b1kO8880sqs4cB30u1SB+JN6mvVX9aOsBZVj0DMSBhaBOEPo50L
 k5kDTVeo3AQ7lB9xPQ+Jrj1eu0wk1MyHAqGHKndl168NltYb7EbkMcwM5ABxpeidGnmM
 oQttTT+Uqn5jSiTXPDmlDFaZzda/rrKLdVIQVO+QnSkg/t+sgiAJmqIUZkgkKaUZ/4ny
 I4UCGSd98jAjVdiXOEOHXlyzuN64aNnxDYdQ3u96e36NPN0r3UPHCc/kb4RQmB98lTiB
 ayJFyZ7AhCoqaGOOXlYULvOEn7eLChsDcOavWZEKFQFUv3/ACMd/A2Bv8/ztDxvvnKmZ
 /Sng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FXY/vIDKe6DGMfSlwt+/9lV29k2hg5m2ZOntq1vLjB8=;
 b=79DmUa0vDTqstpEwSWu6SiM8i5XEu1l4A7TeI5lNIm7zhLI8TNWOhvTMTeuJRVyV6g
 l8ZFZGf6XzHeVEtS6IwMf8SncPpCWOjGJGmp/6DBW4lEyZzJccr/UzeanmpB/psvHfuP
 bNKyp4yRtEM8Fn838+2k/G1bEKZvE6vgYScsqWrB+cMieVaD2xCjiaZCfJ9lBCXG/lUp
 krB5S4GwF+kLetdPWyarRB2cIJE1SiE/dAjNE+z0bBUdiVZFA81Rts7fKWZu0Spzz6Z1
 GGCgw4G+Tb/L+vIdW9EeIrQ8UzeySzBKBhGsTP24t1IrrzLT3yaP78OOHLTbquwcZbZl
 /EqQ==
X-Gm-Message-State: AOAM530tFfL6MehjtLlgeiD3qM4Vrj9GZbVT0JX78v0TckRGWPAC4VNs
 xvfnwV6+RCcd8bodms3ePQb4Jw==
X-Google-Smtp-Source: ABdhPJxHoV7pRbGuX0v6KWZJcBc+2b+ZE6cVGbSFaA0unByQ9Zz3d2AYJMzP97oILzqzuXejkluWVg==
X-Received: by 2002:a17:90b:1d8a:b0:1d2:7aae:33fc with SMTP id
 pf10-20020a17090b1d8a00b001d27aae33fcmr8359944pjb.242.1650279227826; 
 Mon, 18 Apr 2022 03:53:47 -0700 (PDT)
Received: from localhost.localdomain ([122.172.241.223])
 by smtp.gmail.com with ESMTPSA id
 j13-20020a056a00130d00b004f1025a4361sm12986278pfu.202.2022.04.18.03.53.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 03:53:47 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v6 1/7] RISC-V: Clear SIP bit only when using SBI IPI
 operations
Date: Mon, 18 Apr 2022 16:22:59 +0530
Message-Id: <20220418105305.1196665-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220418105305.1196665-1-apatel@ventanamicro.com>
References: <20220418105305.1196665-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220418_035349_895283_C02A3BFD 
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
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
