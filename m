Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD0D9C3DA7D
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 17:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zvMStTE0RfEhXZUNApBPnuQCXvN3cPv1dXZ40Y71ako=; b=N3SYOVRZCr5uCm
	ojxHQzJ05VXBAb0GSgJy/VBLo6yNwiFg278nmKzHGoC1zSNMdOl4rqq5l0AVYoEL4Cc+e1rEI0OLT
	a2VgLZE7bxNbQuX4kukiEBra5h9066Ma+otMc/MnukWpCjyQY1Bpuqz6lRU96/zy1fmdt30cEcXpD
	cjurrGCyHQZEIIcHvrwONB0EpOo5AfzMzUj5D+A94u3ZhH3Qw1y/7BBh43DuMmNKmW+dhjCI7mlm8
	5tVB7HsBDPKHjV4a1r6PvaEYJjO+xj8KNdOBTdw+6axd0WD1Nu4wU9xGngF6H1yDOjDP2AnQ1crHj
	fIE4qLk4ksW1Z0crcIoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCkg4-003CVP-8K; Tue, 03 Jan 2023 17:02:16 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCi1v-001qfv-Sr
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 14:12:41 +0000
Received: by mail-pj1-x1030.google.com with SMTP id o1-20020a17090a678100b00219cf69e5f0so35999000pjj.2
        for <linux-riscv@lists.infradead.org>; Tue, 03 Jan 2023 06:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F7ob+2vX2/dVNm5GFakcAOJyyRuKnpkny5ZMoNumsbg=;
        b=SC2efmYBg1+mzWG7pzPU4iMr+PFRDzvoSWpPlMH6YKZt+hR0iPxqcmZWSNcJZCwK+V
         wGRjiEBBWXFHOjS8klcs14FF4xiO7xLK0pCoqBYolvIG1iykE4ltt2whCD6AO6Aso8Kn
         MzrWZDqM22mMPuAXNi7yVnIy/CsR5G1o0diamtaLsY1wKt4FJ+iavxU0hkGBvYYRtGxP
         +LGdmSucXk4gNVRAfh678TYbLDK0rOVPEpKdlx1zTtJ/AqLzEk8LgJ9q+0h9Lg16rfzH
         aHkp/bUkC7wYGRYNge/xd9Kd/a/t0IGbIYnEGcKqq8VqYT6t2dXt6RNKDrkctboafOl8
         TwTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F7ob+2vX2/dVNm5GFakcAOJyyRuKnpkny5ZMoNumsbg=;
        b=V/7BOe21y5cgHQP9vvF3/umkeAH0tMRqjNv2+xHWA2fmgbAX5VWGBr8zaCMCmkfP9x
         B1RKa8ZAUfCAhxY1JEekMOFBliyN3Jk1prV/SgxY2YIngmbUoV1iKSNWCTRVNgN/bCqs
         Yjhw+WUcJAsAmruJRLhjpTS0Zstf5BM6fnKi6F988KoQM7AjpK7qlbUpxgtSOX+Ermbb
         Degh84oJctBN/l/XizFA2w8wp+HCB1s1N0XuH39THCZgLeXy4nfxfNtRCt/LatlI2Q3r
         Sx4blQJ9d6JkZ5ddvtyhGIcMKLtzWkuK2PQjY7gWgzuzzhg4bPnXMqVOnwb6XnRwYYhh
         RCNg==
X-Gm-Message-State: AFqh2koUpMvhq/yUv/u+5nTquZueIRCF6YjNdnagutH8X1ENO1X99ilP
	6bKE29uovAZwxeUoZgC7fRChTg==
X-Google-Smtp-Source: AMrXdXsdaNFT9PfPhIcXX2+sh5QFHWfKnommCCIjPlGRE8sR3Zqyk6aDdAW9OIFDQIqGWaWuBKBr1g==
X-Received: by 2002:a17:903:2411:b0:192:d9dd:167d with SMTP id e17-20020a170903241100b00192d9dd167dmr3077913plo.43.1672755159141;
        Tue, 03 Jan 2023 06:12:39 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.85.241])
        by smtp.gmail.com with ESMTPSA id x16-20020a1709027c1000b00192b0a07891sm8598286pll.101.2023.01.03.06.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 06:12:38 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Atish Patra <atishp@atishpatra.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	Anup Patel <apatel@ventanamicro.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v16 1/9] RISC-V: Clear SIP bit only when using SBI IPI operations
Date: Tue,  3 Jan 2023 19:42:13 +0530
Message-Id: <20230103141221.772261-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103141221.772261-1-apatel@ventanamicro.com>
References: <20230103141221.772261-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_061240_344311_5C9B90D9 
X-CRM114-Status: GOOD (  10.58  )
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
