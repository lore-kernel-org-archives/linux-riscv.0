Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8861C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 27 May 2022 05:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hl11xCfAMh30C0c5nNTJE/bOVbDFENpqyRvZv2k6Fqk=; b=u8IeMIU+pPyNMu
	9VRj8ZObugSpCmFm7Js35JckWkGTHQ/sDf0Dd43qm7DdRqHShGBBM64CFsPolWEts+aL0Ynb9uEUL
	ynBjke8w+L0J+9k0u7Qfafrd5S+onXFHAeu00aa1qWVW0131oz8qowOD1IydKmIp9Y4qUdOudslHf
	nAdQEdjJmR517B/iNiwpUw6KGZfskZXxp1aODhkMvw8PCWVUWk3namRnPdRWQfP1HZczNlDc3thQz
	FfQ2lYoTaTELGIvxfNdNXU+tb7xKTchyC/ydVzEMJ1PdeQSPe96v3nKINN/5sDkMcMmzLWOheYG2/
	+9dIbBfyHXMHRP2eul+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuSMS-00Gf5i-59; Fri, 27 May 2022 05:18:08 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuSMO-00Gf3t-6B
	for linux-riscv@lists.infradead.org; Fri, 27 May 2022 05:18:05 +0000
Received: by mail-pj1-x1036.google.com with SMTP id u12-20020a17090a1d4c00b001df78c7c209so6215354pju.1
        for <linux-riscv@lists.infradead.org>; Thu, 26 May 2022 22:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y6kuVNgzuJS/Kj6UaKHoVmtYOVzfNBOjCT817HUi7zA=;
        b=oJAxQxrd2Jt3TYFo94eMzAsBg8hvvQFF9aSeDB/A+fB8tsaMUMkb5IXJQ6HbX9tmmG
         tUSqV6uLdpCmBe0FHOICUI8YT/ufNZwQV802XZm4u4C/1nFYr++PzjYw5y3G6Zce3sWB
         F7vMcSuSqs8tppVLuq1oV/IAlVKYTyMcJB2E1dpzFsygxMNja78Uul1LhCqSOu/Ip2+I
         a3pH5HExzRPDEunHrqQRDdBYpqOvPIy6lZlf/4aS+gqLkozivrjUKEPg49r1z9BQgHGt
         sfINzzPOQ4cjOG4T3yMFHP7HeAiUzw32D2U7CUiBF384S//wJoT/oe+c9OrUV5xIXfIF
         20jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y6kuVNgzuJS/Kj6UaKHoVmtYOVzfNBOjCT817HUi7zA=;
        b=o4/sqZZdM1YxNDz2vtMi6BO2yUZj3rIHA/hqCFv6OdHta0gKZPJZv+KjdakbmHh75K
         GtbBo2g4rTtGhFm9d5sfHZhBg44r3wqy5LqZ6t5oCQGag1kukoxohRaRE7Yt35sZqXXj
         LmNvpZyI5FUlHLqj8Zkpfp7NjosQWYHFiLpNcx6JNQaai3aZqnt5z/8pEPcmtDL9/Fqv
         RpStbzFRVy/PL7CLdQK/ijgwlTxRyBqt2VgkAzlkwmrDRzLGkNF+WP7BaHn07bCT53WJ
         LFL9URWxxv2Z4AJtWn/B1IkTmlx8F9t1oncXtfxzcPzTEesJiKOjAufUmnbxjx6b5Fs2
         OAFA==
X-Gm-Message-State: AOAM532CuLc9Hx6biVG0fMFNC1ou+vMgILB9tiMMuueuIS4dpkYl2eY+
	8dwHpItP9PDmu5XuCSx+Wg+azw==
X-Google-Smtp-Source: ABdhPJxNHAA7YtmlpCTaoLU9Je5eUyJxrNCvecvMqG8B873dWMhvfzophWQNCIAWw+WYsWH8YLAzrg==
X-Received: by 2002:a17:902:c1c6:b0:163:8394:9d34 with SMTP id c6-20020a170902c1c600b0016383949d34mr4742595plc.78.1653628683388;
        Thu, 26 May 2022 22:18:03 -0700 (PDT)
Received: from kerodipc.Dlink ([49.206.9.238])
        by smtp.gmail.com with ESMTPSA id j34-20020a634a62000000b003c14af5063fsm2459003pgl.87.2022.05.26.22.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 22:18:03 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Atish Patra <atishp@rivosinc.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Anup Patel <apatel@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org,
	Sunil V L <sunil.vl@gmail.com>,
	Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH V3 3/5] riscv: smp: Add 64bit hartid support on RV64
Date: Fri, 27 May 2022 10:47:41 +0530
Message-Id: <20220527051743.2829940-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220527051743.2829940-1-sunilvl@ventanamicro.com>
References: <20220527051743.2829940-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_221804_301569_40315555 
X-CRM114-Status: GOOD (  12.30  )
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

The hartid can be a 64bit value on RV64 platforms.

Modify the hartid parameter in riscv_hartid_to_cpuid() as
unsigned long so that it can hold 64bit value on RV64 platforms.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/smp.h | 4 ++--
 arch/riscv/kernel/smp.c      | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
index 23170c933d73..d3443be7eedc 100644
--- a/arch/riscv/include/asm/smp.h
+++ b/arch/riscv/include/asm/smp.h
@@ -42,7 +42,7 @@ void arch_send_call_function_ipi_mask(struct cpumask *mask);
 /* Hook for the generic smp_call_function_single() routine. */
 void arch_send_call_function_single_ipi(int cpu);
 
-int riscv_hartid_to_cpuid(int hartid);
+int riscv_hartid_to_cpuid(unsigned long hartid);
 
 /* Set custom IPI operations */
 void riscv_set_ipi_ops(const struct riscv_ipi_ops *ops);
@@ -70,7 +70,7 @@ static inline void show_ipi_stats(struct seq_file *p, int prec)
 {
 }
 
-static inline int riscv_hartid_to_cpuid(int hartid)
+static inline int riscv_hartid_to_cpuid(unsigned long hartid)
 {
 	if (hartid == boot_cpu_hartid)
 		return 0;
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index b5d30ea92292..018e7dc45df6 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -47,7 +47,7 @@ static struct {
 	unsigned long bits ____cacheline_aligned;
 } ipi_data[NR_CPUS] __cacheline_aligned;
 
-int riscv_hartid_to_cpuid(int hartid)
+int riscv_hartid_to_cpuid(unsigned long hartid)
 {
 	int i;
 
@@ -55,7 +55,7 @@ int riscv_hartid_to_cpuid(int hartid)
 		if (cpuid_to_hartid_map(i) == hartid)
 			return i;
 
-	pr_err("Couldn't find cpu id for hartid [%d]\n", hartid);
+	pr_err("Couldn't find cpu id for hartid [%lu]\n", hartid);
 	return -ENOENT;
 }
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
