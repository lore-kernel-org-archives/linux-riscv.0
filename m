Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1224EC433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jan 2022 05:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tatxdkk+WJrhQXterg9bFbjpzORvzeKfo6rSEREDoVA=; b=uJtw6BWANvr7Gm
	vuUPVSQ4eUjZqs29TjA+qUUAckTUfbmCjWaYBvj2gdKj1KOAq0Cc0bbrf9GeURY58QQlqW8ep6TnS
	fgoCaVeDcC8J0qGMRtpYN72UzbuQ3u41Dflyr98TkPLsUOwMM4lYXdDLaZDjNdv496W3wPay7ZPCy
	AludlrgW4y81Aqzu+xgfpjESCQZ6FZaQsybMqqnwWyfOrrx0mGQkjb4RiKf96AbIS2G7PhUDxygrJ
	wHP7LzSaviUgaWr75bnFMjA8DYkUql36pyc4jbC56+z3Iq57uxXYJ1XiYDD6jdxTt+1FenXHAibMS
	CzBu5OXnyekXPNOO8Rgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDJlh-000RVC-HD; Fri, 28 Jan 2022 05:25:53 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDJlf-000RUe-5v
 for linux-riscv@lists.infradead.org; Fri, 28 Jan 2022 05:25:52 +0000
Received: by mail-pf1-x432.google.com with SMTP id v74so5151370pfc.1
 for <linux-riscv@lists.infradead.org>; Thu, 27 Jan 2022 21:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0e9yogaMLiWmOvC9vxOUuPR1xHD22ef7smp5tanFg+4=;
 b=hQLDE2JK5PLVwi5sPyGY3DuU3dDGa+74zauWKpxlzHdPT/TGezkvqGqSvfuD595csv
 kqNMjLttFs5lGF0n40ZTpPmdfB7fyDVhneRr8/zMOG20QU+ULpLB+yWRJ096c9si7nZ7
 J0Q6Vy+zuuguvNEh5x7jlj+AXFceYt6nu2rm5gfL81v0+yBVkBZXcuhyrY/k9HxAQoZq
 tDuE/GqS01lp1JlXU1HPzR7mDQn7AjdBc5sfNbqOQ2Rz2Em1n6COI/3OIjiD15nPcB4i
 L1OH95QNZKCBNHHgBStcVEgwoHHuU/Jnme5yW4Psn6X9Oma1m6LPdbOwvYDpMRkSNHnD
 Cf6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0e9yogaMLiWmOvC9vxOUuPR1xHD22ef7smp5tanFg+4=;
 b=bliqLEgjUlIHRD7I9f5vL/+k5qhnDKxdNwfEgOuMOHTESXZxFhHB4sd1qUVqlPuISV
 SlDIQymOde7t8UMeKFUmHTOi/axL8rn28E7ZUHlfxiDrITpvoXbPPva5Pa6S+OA7SlF7
 7vDosiXdTr7CepmQ20XeeGDlnwd4CxZL7egNF6t5/f5WkX8mXJWWOjntXYFiutcvGr1l
 xJZ86VYxRiW+WUD9fIYZs/4x2EjBKKfotbErLoT6bCTtDr/xS0dwiGdvBQr6vd9xk0Re
 V/s2z5RAIemuWVNdfDQ+/Dn+9BCRdajz8qKDOjQ0nZ9pWeNE9NkaWQfIV6oJ44gyQKbH
 oPAA==
X-Gm-Message-State: AOAM531jJzrBlc7SLPnWhcOJ5yeR3UJWKyLap7RQFUiwpwx/Bwh12AEe
 skUhOk2mW81n+gqnBHFpKCbFIg==
X-Google-Smtp-Source: ABdhPJyDPeruoVE6AI2zH5VGYkjVLdK85RQIuEj5RjEPrwpWiMZ2TMq+S9dZ8srKOXbrkEivf38XXw==
X-Received: by 2002:a65:68c3:: with SMTP id k3mr5390261pgt.353.1643347550561; 
 Thu, 27 Jan 2022 21:25:50 -0800 (PST)
Received: from localhost.localdomain ([122.171.184.231])
 by smtp.gmail.com with ESMTPSA id b20sm7731744pfv.134.2022.01.27.21.25.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 21:25:50 -0800 (PST)
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
Subject: [PATCH v2 1/6] RISC-V: Clear SIP bit only when using SBI IPI
 operations
Date: Fri, 28 Jan 2022 10:55:00 +0530
Message-Id: <20220128052505.859518-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220128052505.859518-1-apatel@ventanamicro.com>
References: <20220128052505.859518-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_212551_244576_DDEF99DA 
X-CRM114-Status: GOOD (  11.07  )
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
