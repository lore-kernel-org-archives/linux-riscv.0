Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1886EC433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Nov 2022 09:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=njYKbyd1VthkjBJtFQDKRzKIUoo1w78pByJIshjF4So=; b=Pj+qWXudU3Buep
	6VG9iQlVlroSmQZK8iC7Bh0L8nfnynlKsfNPdBCeIf/9hCESPREAOSO2+uzXP+Pt7vdsuZIL3XqUd
	ehppOZCA4lNbZTXbjOqqPN44wXQJgSOvucnzgOswlWLZXQMD081aWwhLV2wo9ROLqH7UdPuhAmTMG
	gL0gIWFQWZtrSrVTnCOpabx0YR7KOxE0BJ5EYXxr8noiZoLmBCaxa+e/Mijl5a+nVtaWdZ2hrOIPv
	wp/ouL0ZvVEGbLFkoS0hkDsxatH7rFeTnbZcCW/GZxKRTtIA9oSfqDVH7sJO4727t1pg4VPAZEu3p
	YpY1p8SJ4mtU2DlizUBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVwN-00HEbo-KU; Mon, 14 Nov 2022 09:39:43 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVwL-00HEZR-Es
	for linux-riscv@lists.infradead.org; Mon, 14 Nov 2022 09:39:42 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-13be3ef361dso11836092fac.12
        for <linux-riscv@lists.infradead.org>; Mon, 14 Nov 2022 01:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RwWFYCYJumXDNukDFpgq6aZHdE7ume2pA+aIBGQJqXE=;
        b=Xi1BnJtNMYRdJZ2TbhlC5Q0oACc5D9Aao30md8TQAP7uC1rk/+NR0kDINIYj1rv17o
         iPv6xJH8fVEVgQbecalQ4Hc/D2XO48FBcLJLOrSH/FlYSGHtPGFcV2h7LGlbDp8z7vsz
         iGfn3RIcwaG5bqkyhZPxJjPMNnnk8hgHvykzW+UpvBN3OepJrbqEU/aXYy0eeeSIBbab
         cIwu3k83fQCNoCQrCdSwJPWQ5lfJWIX+2OQllT8E0fl+nUZTCwtyq//p9Yio3lQvLJhj
         DwzCsiLDk8oVmXBSAmYLcAQIPiaVGHnRQWa7jMdkbNrp3Fx4bnpUpsRBVYS7BxGEHdpx
         IOJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RwWFYCYJumXDNukDFpgq6aZHdE7ume2pA+aIBGQJqXE=;
        b=tdac32Q2nkJWNa2d/Sx1KGPGbPJp/fNhm2iM/BF2MzMFRuHSvNZXtyWZ2GgVTTWp/s
         T1mKUBTfRVD6pc/6/RgHmB83+s/XWBKpe7iqMPEaJ8HODr+C0p8a4p/P9ZEny8Ko1ivX
         UBTGw7ID4W3GSE3J8fnNNyiCML7C3Uav9AKublW+N3lpep96XtHDWLfX1RNqNHGwFwqm
         qhySklWBv/+vwVIxuyPDmwpN4hSeyCod2yan23PaRdyA2/utg2F1mHHm52/QoGjGYPuA
         F209xA2og7kCME/nBRwiEfiePaa2T6We2/pMGBzyM2zQ1L4QeRIcr7evCu/wcErEEY6u
         GFiA==
X-Gm-Message-State: ANoB5pn1kYTBMn3UkZBrKmNsCi2iGgfG/r0QW3RBykbuvDIHNGFyjNnj
	H4nsMaKHHoDpVrD9/IPyr2Otbw==
X-Google-Smtp-Source: AA0mqf4n/MGOfR3c293RCkhSYFOhnOqRp7IrAuEe9A9pVPkEO4n5/3QXx/pmoP3HyVk+tCvAQtY7+g==
X-Received: by 2002:a05:6870:b0f:b0:13b:b20d:5c6d with SMTP id lh15-20020a0568700b0f00b0013bb20d5c6dmr6290794oab.250.1668418778314;
        Mon, 14 Nov 2022 01:39:38 -0800 (PST)
Received: from anup-ubuntu64-vm.. ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id l12-20020a4ae38c000000b0049f3bdd791esm3222677oov.26.2022.11.14.01.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 01:39:38 -0800 (PST)
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
Subject: [PATCH v11 1/7] RISC-V: Clear SIP bit only when using SBI IPI operations
Date: Mon, 14 Nov 2022 15:08:58 +0530
Message-Id: <20221114093904.1669461-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221114093904.1669461-1-apatel@ventanamicro.com>
References: <20221114093904.1669461-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_013941_522693_665237A3 
X-CRM114-Status: GOOD (  10.40  )
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
