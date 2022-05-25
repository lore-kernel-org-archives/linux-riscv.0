Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D633C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 25 May 2022 15:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P85HYw7vnTAHzv3KLShFrCKwNZYVA2yNbTpXe32qwDs=; b=Q5Vsi08J8tI+Kj
	b6YrIATKoYK6q7E2l0F8LBmYKkEyKqr9oyhWo9GLUdmPqyPUUhneEadhCiqUwPm5KFqMaf67ZDePH
	/E5vW8vtDpRIEAmDwF8gywpx/sxQYPMiLadJxGfLu0CpPXoq398pCawcWfkStJK2x7dukULqlLPGK
	VoFx8cHS1v4zMasi64v9QhZR/tmLbacDfC6VcNUrIgvmIsbHcL15zRAQKxeW7i9symkNVWaDQ1vl9
	zGA8ypqJAk1N74wNizuxQpLtKzdl176aGul8b9YKgZGFP1uHIG5JaTHDtuc39dpMlr7xsbTLoLg4o
	jRSghZklZNDwhDwJaOdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntsfq-00BWRz-DP; Wed, 25 May 2022 15:11:46 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntsfd-00BWKq-UW
	for linux-riscv@lists.infradead.org; Wed, 25 May 2022 15:11:35 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 31so19124247pgp.8
        for <linux-riscv@lists.infradead.org>; Wed, 25 May 2022 08:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u3hj7ydFHDyTF3uUIDzuU/DKrZho4pwFZBNazS2zRYc=;
        b=KjBynz0SRbfVN3qpMXC7kjtpgmOMzEDF8I0kN4EzFYmcp/sm5REo7Nlfa21pZ5OLVe
         Hh0YxZ78ieeuqraEzEy22mseLwehS/ARrNVnyRZUhpey1Xk+YrVBk536tFwnYRfxE7kD
         FgbAxpiogw7wRP6IEajjgeX2s2podEV2yFbUJPQktj9kfTXJKsGWahWkRrjgvWRQetMy
         8ydMLRvo69FdYjIR2/08s78ADO30emLwYV3bYUVNLnTSKVyrxgNwc60jhLBhvJCpg6OX
         733n3UOS7X/9+la7j0WBxnMSILir1P4SgmEYn5BNzLWNm6Pv13eMyM1d/wMrAy0aa9Z+
         h3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u3hj7ydFHDyTF3uUIDzuU/DKrZho4pwFZBNazS2zRYc=;
        b=I2k0EbVMMguDjy6tWLuqDuhdhk9C4/dxluqOpaD9j3m/S5UfyXUjIoux2nsG7bQN+w
         rS5lXDIo6o3RzwuZ5QP0CV7/0c/1H+SayZ4Y8KKMuj3yfuzd2/Mjdd9taWxVZ1/zWE5O
         ZSiQ6cjR5gJPZGbWpoaN+4+KMiF2FB4N/aofYaqPSa5FFNPjPUi9EVr5UI4UJ/o5A8tj
         srX9ipNMSop9pfvScqDb1NdpCBc0DL1rsQGt1DvFSdUWhG+O4gOIfg0Tw8SdVQuMzZ+e
         I/n5VlPfWGnyzs2Cb9ayCL2aY4f2Tx8ALs4LW+msWSgEbV6ETrU9srZSWG+jXnkwwnIT
         dJFA==
X-Gm-Message-State: AOAM532DTbc6G3BwgpVJ/K77Zj8G4/bqjlaRNZg0Pxqncr6myuEbVr2Y
	Q5VhgUApf7oqts7AcSOB1In0HQ==
X-Google-Smtp-Source: ABdhPJyR9tP9G0ssvONjCOVSdg70Xwqd7QhKiD+f4DqfrnhmEii7E7/6476AvAs2018HColuzqkvdQ==
X-Received: by 2002:a63:a06:0:b0:3c2:3345:bf99 with SMTP id 6-20020a630a06000000b003c23345bf99mr29126038pgk.477.1653491491632;
        Wed, 25 May 2022 08:11:31 -0700 (PDT)
Received: from kerodipc.Dlink ([49.206.9.238])
        by smtp.gmail.com with ESMTPSA id q16-20020a170902eb9000b00161b50c3db4sm9383129plg.94.2022.05.25.08.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 08:11:31 -0700 (PDT)
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
Subject: [PATCH 3/5] riscv: smp: Support for 64bit hartid
Date: Wed, 25 May 2022 20:41:04 +0530
Message-Id: <20220525151106.2176147-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220525151106.2176147-1-sunilvl@ventanamicro.com>
References: <20220525151106.2176147-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_081134_071102_27C4E0F3 
X-CRM114-Status: GOOD (  13.03  )
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

The hartid can be a 64bit value on RV64 platforms. This patch
modifies the hartid parameter in riscv_hartid_to_cpuid() as
unsigned long so that it can hold 64bit value on RV64 platforms.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
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
