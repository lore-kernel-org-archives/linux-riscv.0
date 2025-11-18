Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C96CEBF91
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Nov 2025 02:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ajjbW36/afZQvN6FTBpSHMYSh7aPnhkYzcXZ9il5IxY=; b=V8JIGKHoiW+Nhf
	u3tns0UKlks6LhJwDV4cI9FRevSP07VA2GWNSykEeEoLLKLcwjX1dszoO7zEbm4zheU5WhSQxp8mY
	xrOsuMzwo8xCqEOjkNdb9oRgJESnQavUKf9Lb0hQpE5joANcDLFEws157ds4bbiSeMKdKX+zLfVpd
	ukdV/N59s6EeJBLWjvdVIZ7hJqBgZ0VQ5KntP9UpCKSy9wOEOlDXgcEqJsgaOMCmC4Rh8fg0EQX2h
	gAySssIIrgXMbFrNVvS7UjxdBJhVob7yS2IgNdKlKhkzVPDRJ+I14jEu3oKQfSmUnT9TgMb79bv+m
	UujexEPHLydwJbXsYebA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLBnt-0000000HFPB-29tk;
	Tue, 18 Nov 2025 02:50:49 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLBnr-0000000HFNo-2LIm
	for linux-riscv@lists.infradead.org;
	Tue, 18 Nov 2025 02:50:48 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2955623e6faso46214415ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 17 Nov 2025 18:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1763434247; x=1764039047; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kWEVz8RQkOVIjQiYoeWau+DA1cwiHSk9Obrie6fKLfw=;
        b=U8mhEP9053py2SsW7pIq1pNEwPAb4vNejlxvPfT+IdrXQpR+LIWVnG/o3nbY4E9+MU
         UGwu9vhezMn+I0O1VLJdjgGq0RqmkDRSFRMZrjrteh3Wjvg8ZoyPO+EFCgPPW0mjPnkj
         t0qJJwz7ole7VTWmEmzLW0uQUXnkMJMCnf6t0GizmZXFrP/7U9GfiD0Gu+XzHDRP7TDp
         p+/3lN0cz/TPcqLhuL16xMxPoGDyaN2mrkGW/9Pv1xaO9ff+nlEf/KGnh3aM2sF3PlEe
         SAAc0T8JazfoxJwnNIVNUciVIy9ghpU532kpSh4k20py8IpdLQIVBUxOUFAu4OQfv2n+
         za9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763434247; x=1764039047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kWEVz8RQkOVIjQiYoeWau+DA1cwiHSk9Obrie6fKLfw=;
        b=d2LZXtqt2WffldpfC745pd3aKYOouJMH72k8Nnz+7dui/Vg3ZRYWIaJUYdcHHhjY6p
         xdUmz3EYbiddMWxFJQ1rbJ/bN0aTDzF7xFqC7wVCOEXsUoVlXxOzTNNfGxFqOSK3/lOu
         KulRxAKrOC2eS7Uhld0SKqIoEKWZ7NzKbHbS8Y2nQK3C/2b6lRUUQ8sJIlgxACPdarLK
         QfzL2glvfHO7xpFXqgDt8uiIIh1gPDhFqH2D812CQuBje6awUuhkrPrMS6z8hRK5+4YH
         OrUFrXMjZQb5g+lnYmZqJG1YaDKN/4BNHCe31GnIP3HQDtS0NVN2vU6zjYSI4tpZXzzQ
         oOwg==
X-Forwarded-Encrypted: i=1; AJvYcCWzKk3eqnnasZMpgiCELJFrlcAJf3Lsm+MJhxZNN99po9GFY71KXNLWYdRexHPukRZvdWNvQr6o1y5BPQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwXUcR4eLgZ3uLdTp8VnL+wEXIzDvvp/wa8vaVQgoN3INOpTjRt
	CRZCW8XEQ4VNk1W/SiTPnOQgmxBDckTk1CSYPG9T0RM4I9L1NJ2jV7VW6fOTBTAZbXE=
X-Gm-Gg: ASbGnctwi5GiNf3Oupd5SG2jclYRTOwVT97pa77JEcQf/J5SPe5npzESiru50bJ2W4K
	WaSkXc5wPpy+YoeQKW6wskkYAPnrMx6C94yYoJaTnwW1QnV0Udd8ONKpnIhmcuOFL5zknNfkhGZ
	ZUZ2UKxS7S79QF1M0NxaY8bRZ8ttOFpQXe2D15+nSAsMM9E2WzgzrAKBmmHjqObiM2UdU7IchFm
	TtUG7y52ENDr+5MGLLOKAvvTFK8TsnMk/EDogjTWUxGH38zYX0SJadTFDTD5iRzQbUuvLTCNMGN
	/zzF7ZmyWa4sZ2807xgliEdssqC33g2WqDULEc1UulJHhgsEUt8jxJ3Gmcy2TOyYpz54kqxJil5
	7MnXHbjS0Sy4BYbyoYEzf69g4kAhGSezuETM9eugYta7vmagAwfM3NxfSEn8ek4NvHqtbgvQo4c
	4PlA2TRI9dXMBT+ci9Ln0jFty/CqJruv4yGZD+LsWqtfPWxwE1za36Pc0=
X-Google-Smtp-Source: AGHT+IGL85XZMGDMjYt4p9QFeg1SqALgIf0bObXjxijZKjhO8FF3+whBNu6IOEORfCYvQK52DuCIGQ==
X-Received: by 2002:a17:902:d54f:b0:295:615d:f1d2 with SMTP id d9443c01a7336-2986a752816mr192072735ad.48.1763434246626;
        Mon, 17 Nov 2025 18:50:46 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c234809sm156022065ad.19.2025.11.17.18.50.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 17 Nov 2025 18:50:46 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: conor@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	cuiyunhui@bytedance.com,
	luxu.kernel@bytedance.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	jassisinghbrar@gmail.com,
	conor.dooley@microchip.com,
	valentina.fernandezalanis@microchip.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	maz@kernel.org,
	timothy.hayes@arm.com,
	lpieralisi@kernel.org,
	arnd@arndb.de,
	kees@kernel.org,
	tglx@linutronix.de,
	viresh.kumar@linaro.org,
	boqun.feng@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	cleger@rivosinc.com,
	atishp@rivosinc.com,
	ajones@ventanamicro.com
Subject: [PATCH v2 2/8] riscv: smp: move ipi_cpu_crash_stop() declaration to smp.h
Date: Tue, 18 Nov 2025 10:50:09 +0800
Message-Id: <20251118025015.42491-3-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20251118025015.42491-1-cuiyunhui@bytedance.com>
References: <20251118025015.42491-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_185047_602725_DF07E52A 
X-CRM114-Status: UNSURE (   9.11  )
X-CRM114-Notice: Please train this message.
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

Move ipi_cpu_crash_stop() declaration from smp.c to smp.h to enable
external reference, and rename it to cpu_crash_stop().

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/smp.h | 9 +++++++++
 arch/riscv/kernel/smp.c      | 9 ++-------
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
index 7ac80e9f22889..f53f1f0e7aa9e 100644
--- a/arch/riscv/include/asm/smp.h
+++ b/arch/riscv/include/asm/smp.h
@@ -54,6 +54,15 @@ void riscv_ipi_set_virq_range(int virq, int nr);
 /* Check other CPUs stop or not */
 bool smp_crash_stop_failed(void);
 
+#ifdef CONFIG_KEXEC_CORE
+void cpu_crash_stop(unsigned int cpu, struct pt_regs *regs);
+#else
+static inline void cpu_crash_stop(unsigned int cpu, struct pt_regs *regs)
+{
+	unreachable();
+}
+#endif
+
 /* Secondary hart entry */
 asmlinkage void smp_callin(void);
 
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index e650dec448176..9dbcb9a06a96d 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -78,7 +78,7 @@ static void ipi_stop(void)
 #ifdef CONFIG_KEXEC_CORE
 static atomic_t waiting_for_crash_ipi = ATOMIC_INIT(0);
 
-static inline void ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *regs)
+void cpu_crash_stop(unsigned int cpu, struct pt_regs *regs)
 {
 	crash_save_cpu(regs, cpu);
 
@@ -94,11 +94,6 @@ static inline void ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *regs)
 	for(;;)
 		wait_for_interrupt();
 }
-#else
-static inline void ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *regs)
-{
-	unreachable();
-}
 #endif
 
 static void send_ipi_mask(const struct cpumask *mask, enum ipi_message_type op)
@@ -134,7 +129,7 @@ static irqreturn_t handle_IPI(int irq, void *data)
 		ipi_stop();
 		break;
 	case IPI_CPU_CRASH_STOP:
-		ipi_cpu_crash_stop(cpu, get_irq_regs());
+		cpu_crash_stop(cpu, get_irq_regs());
 		break;
 	case IPI_IRQ_WORK:
 		irq_work_run();
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
