Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14038C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Mar 2022 04:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ocd9qmWMAigU7CblVmQshg/J3LAxcGjD/O5avmjwFR4=; b=XqiyUTz8HAUAWl
	+XmD4LADJWeWu91yE8oXUFz54X6ePyf04NQLnWYP4EGbbdaQakVl1LhAtHV5016iz/0boxgThWkmq
	BJsnG5lvzmztqB0Uvp7Ac4ockTQqEM1QhGkASZkAGmhu1FpfSnRGYMM0GFe6f3N7QWKwqLwdUKUxZ
	HDATFnEUTgGO7ssVQ09RU3drMlZqPVlqXCsgrQopo8dWxwLYwIHATZTDk1br9Gxkt0mD1U9h8dCCK
	kOBCBq7lhg1Iepy/Zkm+bYev4GqnPXaLKaxCId2z4mBr6g6UQ3PjFNA2kqn5nmpnfVQobCw+4rSNq
	At6fEwcGybAnHaYM2fKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOu7Y-00Et2X-NQ; Tue, 01 Mar 2022 04:28:20 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOu7V-00Et17-S3
 for linux-riscv@lists.infradead.org; Tue, 01 Mar 2022 04:28:19 +0000
Received: by mail-wr1-x436.google.com with SMTP id b5so18524613wrr.2
 for <linux-riscv@lists.infradead.org>; Mon, 28 Feb 2022 20:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FXY/vIDKe6DGMfSlwt+/9lV29k2hg5m2ZOntq1vLjB8=;
 b=YbnXH3Ozn3b9HuBAgiYG8VYMa0eOjwf/1cC77kCVzifGNvBgFVcGkgDMYeYYXRH8KX
 es6Pci779Tb3Cls9xAqKDX7GugD/Dsd0qxsy1LhmQWF/bbrE8sLledQ46d/t+kJLM2h0
 2nmhVFLz2WzopUZldR98pJSf/E8XpEbqU48o35VqiBNyAyxKX2DN3GSu0MMBnvkRciC/
 O1IwurKtAWLHLohAVHuabupg3Ft23YKFTT8vUUIwDPmZTFyiRoY6XHjAEbOmT27Df7Bw
 gFWwGDuJ/qUEX+T6jMQDGDhAN8v10v8UUjwEqgGcdip8k1mxrmdUrLi+barpR2/V09sJ
 1Zvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FXY/vIDKe6DGMfSlwt+/9lV29k2hg5m2ZOntq1vLjB8=;
 b=I47q6TPUaTwArbTD2ZeilnZ1wnjNdX1894mac5pKclaRL8Q25d7z2cM2K5unc4KaQy
 c+FpJPoPFQQfNiVptSSyyo2TxGv34eoy9wjzDAARTBHg/3zU1x0f5gghQcPlIk/CuiO0
 5rxFaFogBGWV1RRpp0bQ/c9ZsBBtkHGm3OPh3VpOJZffa31/4f3+KC/7sknJq9U0eAUR
 9wuKohnMPswo1JSu3MIWowAjBisz+qgIumfEgEHT8O55jUpsYo5IU7JagFr69864aueV
 Zs8w1tRWgZMwaORN0Co+bW12q84h8JNvaDv7liUnnXtjORJGED78lXNV6QIsIfOiybWr
 CwQQ==
X-Gm-Message-State: AOAM532xRRH94H91Dq/OHDrCeG0bJWKPC1XzeO+7p4TJX+ndgcyez08k
 34e0ZRlp9CLp9DiRhPdWi/gA5w==
X-Google-Smtp-Source: ABdhPJyDCf0PIM7Cz+LWsyEXEFiULxZskjWLp/zzvJEeRGlDKz00FVkpH24DcxMgGallV6oJWtBFeQ==
X-Received: by 2002:a05:6000:11c8:b0:1f0:d64:fb0c with SMTP id
 i8-20020a05600011c800b001f00d64fb0cmr908247wrx.279.1646108896435; 
 Mon, 28 Feb 2022 20:28:16 -0800 (PST)
Received: from localhost.localdomain ([122.179.35.69])
 by smtp.gmail.com with ESMTPSA id
 2-20020a1c1902000000b00380d3873d6asm1209107wmz.43.2022.02.28.20.28.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 20:28:16 -0800 (PST)
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
Subject: [PATCH v4 1/6] RISC-V: Clear SIP bit only when using SBI IPI
 operations
Date: Tue,  1 Mar 2022 09:57:17 +0530
Message-Id: <20220301042722.401113-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301042722.401113-1-apatel@ventanamicro.com>
References: <20220301042722.401113-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_202817_928717_5CF57B8E 
X-CRM114-Status: GOOD (  11.20  )
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
