Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB06CEBF91
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Nov 2025 02:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DmM2C5eGLU4m3R5kJvWfBcpoZIc40v2W604iaq30wK8=; b=vZy1z3Sn8Pj52r
	ZcAU1tbhFIbhxK7mpDLWPLb5m/vBMAgIq8+3GXpR6WFzqHfyfc4ldr+3bR9xzf1w99IR4LuYfC4qF
	HgzqdpZ9KwP6Rn7bgaFLrZwPRNmjKKxWbojqdgN+vY5SOdY1/13Rudh2ALnFfJalpn1Ev9K8HpeYM
	zof8gZRNv4dy/9UloQBA/XmynOQEn0mSliefgr3qLMaszhJ8VfPCnPmc/9nHPKDrM24iK3m89Xglf
	fEnmvT2/VQj3SoOrrZKliAscDHwlvnASnT9o7UHq6KCiniYOoB1UJU1asH4jrANV8oUjBjIq/62YC
	YLc5Ob9M9yXzNvfoT14A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLBoC-0000000HFdj-3xFH;
	Tue, 18 Nov 2025 02:51:08 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLBo9-0000000HFaW-1TXz
	for linux-riscv@lists.infradead.org;
	Tue, 18 Nov 2025 02:51:07 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-297ef378069so47901155ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 17 Nov 2025 18:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1763434264; x=1764039064; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XJksfD4U0cDLfoIbXP0YubpPCI3TvE92NJsSBNS+FsA=;
        b=BeVTbaj/75sbbUDq2e3cxDkXVQ/PFcy5N8spVwkxQWgO7ADp+la4BBqN3dm09RyzQd
         2hwNPt3jGomzNn0H9nI8elAU7X0tiVqyBmXFS77eXJXuaYF31NCZJqHhWgiCaDqRlu3u
         UQ6gciNNCOXDfMAm10Sb56sE1jGuqm5IMfPT1o8kKiHY6Sm53DNXl/kL9C5XJyItEJxJ
         tU8srj2zVL8GyBQUNbpsmlLK6CXECOutAfr0eIrCch0gL7Mmf/EIbicDhdJylm+SPiG7
         Kv49wnSCvUp++H76Oi0MU/r27ZyiR7IlUdiCB9cP/ksh0DK+sF4+BH2K2Bg/j0fnJPRW
         owvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763434264; x=1764039064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XJksfD4U0cDLfoIbXP0YubpPCI3TvE92NJsSBNS+FsA=;
        b=vKxs7HokYHw6wmFA/UAKMxqj8KZrISRsefVef/GJNVhUT7U8pF4jwUksuXMHSWuYhy
         dhd8S0B1qmUX0F+gqd/WXvXQnFxkmw9EAcZ33kwKVuIVDMwZGnDCfbe+rpsJXtjSds6a
         CT8XMMlMcTvLXDLCjPfSaP4IrFEVer/xFQseYxdUjnHpgJq3r0jNAR/7DCyZHj3QnFSv
         3B/AdiaZYbOtHovIH80gMCAOd5caP8ffq5O0ffucJFu1aOo1EqokvOwTpYq87oV9m57a
         gIt8hVsCMvIppAk4ll3XXmL8ksKYs5OVkmMAJwZngSF/Q3ynd1J7q4IsKczgTzLInj+7
         TFCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQyQWRCECfUu7eOyUAd43BnO88Ak3JSo2pwCM0b/RmhE/vjvjt9dmCIaQc2CwxGpTcCj23+iDQqJhfrg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyT03RZITRLs+DcSHrXHV4pWSILGvb0C86Rg8yzue8ap+M97vio
	e8s73LMOcbP3u4qULnL3qdQTxWCKtslYN4S8LzFShXSoujCbeaGgc31sYKe8//+vuJE=
X-Gm-Gg: ASbGncuE2OvZQSS5UhkL8RL6eyCryYeby7T0uhbciSzsgtwCdc4jj/GEBYtiAMRrIMC
	4g0y43hp1beUCB+aaxHtjcg13hgeSFz3+gzk2L02RSwhYlCSOkwp+umluVL0E5VELEtfJWNpKkm
	eJLvzBr3u1VnOZq3ZgMtaiLpwGpI7dMiVYkKuBsIHmXx+N6I0c5BtL7y4skGmfz1TtjEa2iGoRC
	wLX6xoaxNqIjmHuwiDDMqDlGFGZ9qh/wmRPZbz9a3nVclJUkrHt2A+AzwXbdfN+F9GvpMoePDy/
	Ma5Oe2HYqNT0J01iqPLtwLVYOJVcy6Kl6jJxpvkWlQgRZH70RXV6+Az30MkoU5SuppM2v6R07bL
	yUL+EsA9MKBOZ6gmAeiCdy49K/9P+Q73omSFJCEIDoa01IAgjHbDeR0DbgkC01Du2lPk9NXRpB9
	hWV9QFBND7WiYQghJxPWnelxpkX2cTXETnoLFb2ICyHy4j
X-Google-Smtp-Source: AGHT+IHUrf4tzQ4QAd55756K9aAEGttwNKbLYjQAXfC3iSXdMuBwKEL2rgWxGptF89ockka7jwkNdw==
X-Received: by 2002:a17:902:f684:b0:298:4f73:d872 with SMTP id d9443c01a7336-2986a6ceb65mr178814085ad.21.1763434264377;
        Mon, 17 Nov 2025 18:51:04 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c234809sm156022065ad.19.2025.11.17.18.50.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 17 Nov 2025 18:51:03 -0800 (PST)
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
Subject: [PATCH v2 4/8] riscv: smp: use NMI for crash stop
Date: Tue, 18 Nov 2025 10:50:11 +0800
Message-Id: <20251118025015.42491-5-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20251118025015.42491-1-cuiyunhui@bytedance.com>
References: <20251118025015.42491-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_185105_581975_ABC48A5F 
X-CRM114-Status: GOOD (  12.97  )
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

Use NMI instead of IPI for crash stop if RISC-V SSE NMI is supported.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/kernel/smp.c                | 14 +++++++++++++-
 drivers/firmware/riscv/riscv_sse_nmi.c | 10 ++++++++++
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index 669325e68a21a..07ccc28f52172 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -16,6 +16,7 @@
 #include <linux/kgdb.h>
 #include <linux/percpu.h>
 #include <linux/profile.h>
+#include <linux/riscv_sse_nmi.h>
 #include <linux/smp.h>
 #include <linux/sched.h>
 #include <linux/seq_file.h>
@@ -300,7 +301,18 @@ void crash_smp_send_stop(void)
 	atomic_set(&waiting_for_crash_ipi, num_other_online_cpus());
 
 	pr_crit("SMP: stopping secondary CPUs\n");
-	send_ipi_mask(&mask, IPI_CPU_CRASH_STOP);
+
+	/*
+	 * IPI performs better than NMI, but attempting IPI first and
+	 * falling back to NMI on failure requires recording CPUs that failed
+	 * to stop. This adds complexity to cpu_crash_stop(). Since this operation
+	 * is rare and typically in the final phase, directly replace IPI
+	 * with NMI.
+	 */
+	if (!nmi_support())
+		send_ipi_mask(&mask, IPI_CPU_CRASH_STOP);
+	else
+		send_nmi_mask(&mask, LOCAL_NMI_CRASH);
 
 	/* Wait up to one second for other CPUs to stop */
 	timeout = USEC_PER_SEC;
diff --git a/drivers/firmware/riscv/riscv_sse_nmi.c b/drivers/firmware/riscv/riscv_sse_nmi.c
index 1763f43961ab6..e4c20dce40f9a 100644
--- a/drivers/firmware/riscv/riscv_sse_nmi.c
+++ b/drivers/firmware/riscv/riscv_sse_nmi.c
@@ -10,6 +10,9 @@
 #include <asm/sbi.h>
 #include <asm/smp.h>
 
+#define NMI_HANDLE(mask, func, ...) \
+	do { if (type & (mask)) func(__VA_ARGS__); } while (0)
+
 bool nmi_available;
 static struct sse_event *local_nmi_evt;
 static atomic_t local_nmi_arg = ATOMIC_INIT(LOCAL_NMI_NONE);
@@ -48,6 +51,13 @@ void send_nmi_mask(cpumask_t *mask, enum local_nmi_type type)
 
 static int local_nmi_handler(u32 evt, void *arg, struct pt_regs *regs)
 {
+	enum local_nmi_type type = atomic_read((atomic_t *)arg);
+	unsigned int cpu = smp_processor_id();
+
+	NMI_HANDLE(LOCAL_NMI_CRASH, cpu_crash_stop, cpu, regs);
+
+	atomic_set(&local_nmi_arg, LOCAL_NMI_NONE);
+
 	return 0;
 }
 
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
