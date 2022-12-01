Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE961C4321E
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 13:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R3Ru3IgErXyyAIdxPGP1vOiy3XUmGIbVRhHyVIFu4Lo=; b=K0BRT/46dYwmhI
	wssomXJjuz1Bp5jNigVfcA0TZJv9fshm5j4Xn23XAW08qTtVnvozDhYZx/0iyoixc4pDXr3RwMdL7
	+7FLLM4JVG5RVhYpIEvbSd+BcI1XKy5AEHEtTW1ggShndO5e7uTvj4fo0iyVvlDgVjZ8cApne7n06
	rf9B6pnhwdM2lT4DnHG0xO9/GaNxA9EAlb2l6ApCMllbn4ZL21vfaDymOEbB2Bc2SxKj2c5wypMWC
	qLXNysfJRCIE3D4qBVJ7JBLmugpuH2CHvpR2W7kpe5AibHwITdZFeZKZD2X/M5lXzt2YM5yDXum/c
	B1aAERt2R8IgsOER4a4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0jHm-007aD3-Lo; Thu, 01 Dec 2022 13:07:30 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0jCL-007SWF-K7
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 13:01:54 +0000
Received: by mail-pf1-x433.google.com with SMTP id 21so1800776pfw.4
        for <linux-riscv@lists.infradead.org>; Thu, 01 Dec 2022 05:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TXLvXXdTgugvaqwC5VnS0gtZiRjZW9Lq1RMlH39mGsc=;
        b=Xkgq6BQEcFPJ5gCrHCsooCg52GmidmDXMGoan1daErh1grF+4UP8R2qCE/AfVy4SPR
         mi05nAdiO1Fijqvm9IHmjhusQlLovEASiwF7RUe50Txg9SMFnQUm3zw8z6RgaHS+X1MX
         SMPwXqyQBnDVycEPRl/QfCpIYGuHVwX7256QrD30JY+kk6fl8mVTIbP5pIFdYch4qLHi
         ufLP1xmFa7uCnlFjq4D8AorWOEhVZOZjRqP0i7+Phce7XTHW/BGrBzwbws5yj8HhmH+T
         EfHudL9kzCtj3v5sMBexNnmVFjTT/h/CO0p7eawyY0Jb4jlomf+t5/DAc9nzFeq3uTOc
         isJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TXLvXXdTgugvaqwC5VnS0gtZiRjZW9Lq1RMlH39mGsc=;
        b=xdv3PrueS9Qm/4R+sSLPth1PQGvkYC7mR1Y64N07VxGE86tio9t+SgZ3ZycJB9xT1p
         wX3L04XFUMusQdQ3yppVzbQobTKfm7PKGdtOYCC3iHyUkyv/t1L4hMgzjSDEOMZBokMc
         3vCYgcwD/v1Xu2m/VnLJyg1CVXFfwmgjZZ05oJet8RI3bQqXXEa2fGBaed6gnnzE5LmS
         BVX822bOW9j96bQnXutky0Q266FrYIw/9c5LZUR5dcPzT7oFuJ1zQp89mKWlFLZHCQPR
         cmIBKgrKmIizeRgWyDFYv7yTYsWSntu3KtNVq1Ux2GplJyeGBu1ch7d4RiSdK3sB+MDD
         yoJQ==
X-Gm-Message-State: ANoB5pm/uHnpJFSUVrP+F3L8/LbpGbXmN+O2cYPfSOBFGE4BmNI90WYz
	N8dR8RaXHTNip2D31GpLLCPHqg==
X-Google-Smtp-Source: AA0mqf5sVUGjUM+G6chuxm/fIpO2kBg+LSHQjHKLRSuED7OGm3sCl1RGRCdcBdb5BEnmnpVXTycpCQ==
X-Received: by 2002:a63:a61:0:b0:478:2d2c:6e82 with SMTP id z33-20020a630a61000000b004782d2c6e82mr15446563pgk.136.1669899709811;
        Thu, 01 Dec 2022 05:01:49 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.81.69])
        by smtp.gmail.com with ESMTPSA id l4-20020a17090a384400b00212c27abcaesm4855856pjf.17.2022.12.01.05.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 05:01:49 -0800 (PST)
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
Subject: [PATCH v14 1/8] RISC-V: Clear SIP bit only when using SBI IPI operations
Date: Thu,  1 Dec 2022 18:31:28 +0530
Message-Id: <20221201130135.1115380-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221201130135.1115380-1-apatel@ventanamicro.com>
References: <20221201130135.1115380-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_050153_714688_8C52AB78 
X-CRM114-Status: GOOD (  10.08  )
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
