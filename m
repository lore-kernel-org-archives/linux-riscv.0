Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D5EC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jan 2022 05:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tatxdkk+WJrhQXterg9bFbjpzORvzeKfo6rSEREDoVA=; b=XhRnkQLN9C99D6
	0Z9Nz2rX++EEzt9XqvW+rDrZduWX2RJ7xCuSVFqPSYd8k9fqUBYwN0tE2HkMtsxkh6FQny5T72+r6
	tKmowWSWAqM21dBOsw79R3BJprh4FqtMniq6PkVMBkBS6aL+R86wnOydxd5YGT8OiuE/ABNM8zQrZ
	Up8XBeUYjlzJhzIfwto3lB8qTnY+x7fly8sW5bVsUj9scmgzNAG2Xdi4rqtO48H+Mx++OIeP8CDmH
	5DLDvMWjKlsv4lDF/JfOb1yG2V8AdvwOuU6u4AlvB4Lc3RXFp/6XeIefQjVtxfhOnWnXCqlu9Jqit
	1F1h9RU+F5jXQPkjSSDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCEcZ-006VlA-7e; Tue, 25 Jan 2022 05:43:59 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCEcW-006Vjt-Vw
 for linux-riscv@lists.infradead.org; Tue, 25 Jan 2022 05:43:58 +0000
Received: by mail-pg1-x535.google.com with SMTP id p125so17442801pga.2
 for <linux-riscv@lists.infradead.org>; Mon, 24 Jan 2022 21:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0e9yogaMLiWmOvC9vxOUuPR1xHD22ef7smp5tanFg+4=;
 b=JdjRBwA2ItC7x0XF8RUVHHfxzCxU1kMYhD6JAiAK4X1ZK/YVkC41CJ+dEp+zaG6MJQ
 Q4MxXzgel3SyV06z9ylbKff9jbTBYKtAVzoW/XHVqEAo7sG1iDDymGM/liKP46p5IuTf
 CE6LdggyIu3fHhOgeL9jofga7qXco/xs1JJjTHD1BZU9wICkTYUycnBMqRDhhkfpJ2mG
 aQ1eFN+HcDK69CWs42a63Gry5MqDCrzW9Q1nCNc+cHVGrBs5Me7W+yNheC6JKNW4RIyP
 Rdiw/1zqVLC9XUuPX5lyVylwTVu/14fOMxrPSwaXOz98UsaNb9Vie6OcTqEpvvOxOM7n
 f2ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0e9yogaMLiWmOvC9vxOUuPR1xHD22ef7smp5tanFg+4=;
 b=CULmjfWnv7dCEdW2oIx+RmsmAo7BO1osqqKBlzQMFLzKDxFUJN/mUWt9btMqh3m0pE
 wLpt4QCo46PqoykuTYjwdpQThriExE/xe5+a5bmHaOZvxOOLTxt1rsIlUJlymuXnIHFK
 YJ2yeG28Fb2ltVc/U0D608QhRSGC2L8jMZRoR3QDnV0B3UIdQgiRO9xMdQOCMm24MASe
 ktekGESS5VtPUD0kzFUuPEu63a4K93uFp8Bq6pYCubfTcsGnsNzb/D1IeOmcblp4yNK8
 WJQXgNXNMl2VHId1Pwa1oRz2GdxOLtYZ03JP0YU7wphIyfnlS1fN0hggXA6zKn26GnZh
 5gVA==
X-Gm-Message-State: AOAM532CkttwtdZtb+s2AadtQYMCnhay+W5Dd3LJNhac0Ywh9Crs6U4w
 lSFLG53d83v83QkFvfgJyR5j/w==
X-Google-Smtp-Source: ABdhPJwK3m1JgrMY4NThERVx9U54lSUa4lAfAW78tm/S+5/b0ojZID3Q2xcUGyh6aGHE08T6WnKLbQ==
X-Received: by 2002:a05:6a00:180e:b0:4c8:f0b8:2382 with SMTP id
 y14-20020a056a00180e00b004c8f0b82382mr8832309pfa.59.1643089435789; 
 Mon, 24 Jan 2022 21:43:55 -0800 (PST)
Received: from localhost.localdomain ([122.179.14.218])
 by smtp.gmail.com with ESMTPSA id c6sm19524508pfl.200.2022.01.24.21.43.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 21:43:55 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH 1/6] RISC-V: Clear SIP bit only when using SBI IPI operations
Date: Tue, 25 Jan 2022 11:12:12 +0530
Message-Id: <20220125054217.383482-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220125054217.383482-1-apatel@ventanamicro.com>
References: <20220125054217.383482-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220124_214357_053710_3F1F1E2B 
X-CRM114-Status: GOOD (  11.18  )
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
index f72527fcb347..9786fc641436 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -621,8 +621,14 @@ static void sbi_send_cpumask_ipi(const struct cpumask *target)
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
