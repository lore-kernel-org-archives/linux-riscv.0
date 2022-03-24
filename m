Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64CDBC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Mar 2022 15:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ocd9qmWMAigU7CblVmQshg/J3LAxcGjD/O5avmjwFR4=; b=CwLPHnbZwobbV5
	Zb07gdmEiXPI8CgIbezjEWaOX9EegPyURyazs0ErlYdYjcmDgrZTL1ekiUjsc+kkFTWllAdeIn3gk
	OzRb89EI2jhj+O3ovi/Y2O2AfFB7cK9Ou0k1VjsPn2ntQvTE/P68+KD2gMKAG52SIMuE1ReIdgduS
	xyu1uc5Al5rNVeS61kIgtC3DEn6Ll7E2fmB06i8q7MJKWKUqbAmCM/9LgFEvb3JbtSkUSj1VnHcUU
	y74XKxGU/REi+l8rv0p0CgKuu6vlCPlt8+dWvAJcTbBhLqN/486j4AXt0h3wZAzrZFKByazc1p7CA
	gJ5TBBKA1QcQk+8Viwiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXPAB-00H0IS-87; Thu, 24 Mar 2022 15:14:11 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXPA8-00H0H7-Em
 for linux-riscv@lists.infradead.org; Thu, 24 Mar 2022 15:14:09 +0000
Received: by mail-pl1-x62a.google.com with SMTP id y6so2463400plg.2
 for <linux-riscv@lists.infradead.org>; Thu, 24 Mar 2022 08:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FXY/vIDKe6DGMfSlwt+/9lV29k2hg5m2ZOntq1vLjB8=;
 b=YH0pga0nH+hTQEyIpNZBYZatw8FxQm2nGkd2/zpBue/3WRbXwcKiiYjIG9ax+XvKIN
 MWjR7uEOiwOBkq7D3ClmPUehk7iAHqVpV4pR9IFRe6klZ7St78eBtj0DMEwUAXyVaKQD
 OUnac9ZmcBxSHPEPOX8RI7gCBOhjrc9dxXGIwhkNO4dIsWb4CG5WE+sCgkyliupA9nPi
 cUDzGaoBypyQjftTYm2rQy5AGqUFilAf6nyVXRkG+QHPmu/mNQh/Q3j5PqkqwnwTf7ah
 10tnnG49mAw1el9XrIW4aZXmsV3uNSCBVXdvIfHIsKSZpvRYCHgweGW5ePh9NzulDNt0
 fr/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FXY/vIDKe6DGMfSlwt+/9lV29k2hg5m2ZOntq1vLjB8=;
 b=HmJQA34fARxtnaVDJ2flIYHVhjzgZsrWz5qpKrczHGT4N5Gw7g7g2tgkBWefRL1POe
 jkxY9xPy3QpcCWbTWEfrSzr3u7rffN2PrGH9+AhloR4UhypQu1VlqYMmlY5GDgPA20im
 omgz0S2ALT+QN4PsNlp2fUNQ1czyoZrOq33T1YYzQuYFfjTJiVDQL1PhQJSZdgzPW212
 sStrN0PAR071NlYUmKNyGs7D8IxtTPA4NgCzm9ZqNjIZeUeyNh6MuypESoM5YTayRbek
 bc56uoVKOcxei3EYpnMfMnFrr0+68Ot7xzA7aobGORK/csfT1tvyLowxujIvZRO4TpQV
 4ARQ==
X-Gm-Message-State: AOAM530eha48DS3gvVsz6a/6zV3dlXK2zS0d+bdaXGx4D3prC/Zv9qId
 gcjT+2azxTUvhxc6RiAWz9CMKA==
X-Google-Smtp-Source: ABdhPJwHZOgsKhQJ7Ku0lsVbVm2H7/rpiV59GL6iAn9aKaGBEUj/tWKXjIuMiznBvk0IxlzTEVuL+g==
X-Received: by 2002:a17:902:b948:b0:153:9994:b587 with SMTP id
 h8-20020a170902b94800b001539994b587mr6392779pls.68.1648134847714; 
 Thu, 24 Mar 2022 08:14:07 -0700 (PDT)
Received: from localhost.localdomain ([122.171.187.87])
 by smtp.gmail.com with ESMTPSA id
 f16-20020a056a00239000b004fa7103e13csm4166065pfc.41.2022.03.24.08.14.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 08:14:07 -0700 (PDT)
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
Subject: [PATCH v5 1/7] RISC-V: Clear SIP bit only when using SBI IPI
 operations
Date: Thu, 24 Mar 2022 20:42:52 +0530
Message-Id: <20220324151258.943896-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220324151258.943896-1-apatel@ventanamicro.com>
References: <20220324151258.943896-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220324_081408_540286_74250309 
X-CRM114-Status: GOOD (  10.85  )
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
