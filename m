Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00F3C021A0
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Feb 2025 04:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0z3G0ier8Em4QA68TK/jvDqS5I6daJj44PZyrl4jU04=; b=YVG6VIDWoMrYFV
	oXjsv+2/ZVGs4Rb2QFhypEUM3+wT+WiMhhaEOXWBbs53hPtxr//y05UsYh5GG6C0iBghrnzFxVYkt
	VtqxK3co5E2BhLjYE8FFXO6HYA9W/A563LLwnbBciypifWgEnVT7U0/n2S4mXM7z2Ot4+rZwq5FRk
	IHO/ioqGP8xF0nVUyhRRs5GbJTiptRQpliADSFBq6uAkVNuraVK/sXDsPqY1fBgrA0GmDaFBMrndW
	5fbhoSv8xswqHUd7uQju5AU22c5GIrVaSGMlio+OaD/nBS30yybq4UTBJHjpZGU0y9EBqoiHZ6Rv9
	En2m5IW8EV1qRnbBqcHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgyt8-0000000E3ta-3rPD;
	Sun, 09 Feb 2025 04:25:46 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgylY-0000000E2SC-3xjR
	for linux-riscv@lists.infradead.org;
	Sun, 09 Feb 2025 04:17:58 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2fa51743d80so819356a91.2
        for <linux-riscv@lists.infradead.org>; Sat, 08 Feb 2025 20:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739074676; x=1739679476; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3sE/PXdSSokJ0Zgm0Fk4Pk1jUj6qdWvd3FyfD/aEiAI=;
        b=S+IYvifu3RJKwJ64EqOFpzfssoHjWXjmzBUswhqINnDP6hPZDYORuUwMINRTayjECM
         9ALJKzIBwXseW5eYWB0I7RbDEZh34iuq9B0j4jceX7CMNykSMElSkpO/pzzgqW2TZwiZ
         F32s0WvvOfJaiF2vE7R2jy2wuXfGOg0kw7cdTOjGu80uY0pgAR//6Pd4u1ijnCg/WPHS
         vtTs+DZPIOjD9Aa59uRfKuPmWSWwN6uwmOOPr1mJMGBU42QKBq933//Bp3yl7r2mQPd9
         +NrRF1e9P6xka8PqyzIHRHGrBMtyIb6op2UVxzSOHNnZ8BOBdxDfj9RwFZnHLBprdeRH
         7hmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739074676; x=1739679476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3sE/PXdSSokJ0Zgm0Fk4Pk1jUj6qdWvd3FyfD/aEiAI=;
        b=SpRNeFTTcf3BujgoK+nj1YxEKIkj74YfidIFS5daMkjAASa8Efm/UYRMQ3NKInmWsK
         xZowuP8SkJpr/tX5b1ebKc8KGEOeHMeBjL87HPAG4+NdGXMtycK5F2gzph17vv5u7jsR
         8YiEY9TJks8xqIFbAClAfKhbJck/g2EVTyoA6rDHpwJzq3i4W056caUDD95EgZYChAcv
         BS230zd9tS6+RraKngDLUesetInW3mLadJATWC07jd1LyTmC37vqYMFT2aVs/sLO43Dt
         okVAr6/jjLvsNENM0VTv7vf4xI9yAFKis+iEkNojmfNGfXlcgOk5BR3NgDdVBkaJ45Mn
         ou4A==
X-Forwarded-Encrypted: i=1; AJvYcCXNJ0HHnjFCKmUlxT7E0siuNI00K3JnYcUNRv7oaynvwcQZaxVVTMgIQZQ+iIBksqq8sRVGyQABC0QWyQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzZPoEOKWBSRGeEmQiYcBQsKhYQGfs7E7qbhSja/ompgkD6C8hC
	quIKdWROuBf+r/NgFwpPduNj474R1S2r6A+3gwN65a9SczaCVhCjNq92DaHx70I=
X-Gm-Gg: ASbGncvIRd4cYZjI3bZF7IWuGeFsDf6g0zLbM3CW1To8vYtsoLyGfG0ok6fUKKEXtBy
	sXri5GRrbsOHDdSc/I+pSiPmtwEqg5nZ7VHaFFeSMDDYmlrHtDsRC6YH1EfuhFiBRlZoKVaLBv7
	FlTl9a2nLM0rik/Ion/veKwbUArhh7podL6To0kUKIhjH1QBFcySz+ceOB3E0SuWUBC6/rt5tvR
	03IfwI8xZt9lpBMNauRzG0/fWf7BUFOvs3O4c6DGMN4Y/iX7SlXZQ5oY3yp/71DsizeAPI71skP
	NF+sFLpU6uIuyBqIwTL3h0E/dz5X35a1zrRTum4w8k6E89s8egWSnKc=
X-Google-Smtp-Source: AGHT+IHDq8j70VgdWYD0/5rZSoa9FGuz2H9SOfW3ipfEG4foQkrNVKZyKea9+xF989Gz8oAitxsVGw==
X-Received: by 2002:a05:6a00:a15:b0:727:d55e:4be3 with SMTP id d2e1a72fcca58-7305d463732mr13313591b3a.7.1739074676324;
        Sat, 08 Feb 2025 20:17:56 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73073eba116sm1898410b3a.124.2025.02.08.20.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 20:17:55 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Subject: [PATCH v5 05/11] genirq: Introduce irq_can_move_in_process_context()
Date: Sun,  9 Feb 2025 09:46:49 +0530
Message-ID: <20250209041655.331470-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250209041655.331470-1-apatel@ventanamicro.com>
References: <20250209041655.331470-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_201757_045888_3A3CBC1B 
X-CRM114-Status: UNSURE (   9.58  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Andrew Lunn <andrew@lunn.ch>, Atish Patra <atishp@atishpatra.org>, imx@lists.linux.dev, Marc Zyngier <maz@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, hpa@zytor.com, Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, Shawn Guo <shawnguo@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The interrupt controller drivers which use GENERIC_PENDING_IRQ
can move interrupts in process context for downstrean devices
which support atomic MSI configuration.

Introduce irq_can_move_in_process_context() which allows interrupt
controller drivers to test whether a particular interrupt can be
moved process context.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/linux/irq.h    |  2 ++
 kernel/irq/migration.c | 11 +++++++++++
 2 files changed, 13 insertions(+)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index 56f6583093d2..dd5df1e2d032 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -615,6 +615,7 @@ extern int irq_affinity_online_cpu(unsigned int cpu);
 #endif
 
 #if defined(CONFIG_SMP) && defined(CONFIG_GENERIC_PENDING_IRQ)
+bool irq_can_move_in_process_context(struct irq_data *data);
 void __irq_move_irq(struct irq_data *data);
 static inline void irq_move_irq(struct irq_data *data)
 {
@@ -623,6 +624,7 @@ static inline void irq_move_irq(struct irq_data *data)
 }
 void irq_move_masked_irq(struct irq_data *data);
 #else
+static inline bool irq_can_move_in_process_context(struct irq_data *data) { return true; }
 static inline void irq_move_irq(struct irq_data *data) { }
 static inline void irq_move_masked_irq(struct irq_data *data) { }
 #endif
diff --git a/kernel/irq/migration.c b/kernel/irq/migration.c
index e110300ad650..5acea2ac57be 100644
--- a/kernel/irq/migration.c
+++ b/kernel/irq/migration.c
@@ -127,3 +127,14 @@ void __irq_move_irq(struct irq_data *idata)
 	if (!masked)
 		idata->chip->irq_unmask(idata);
 }
+
+bool irq_can_move_in_process_context(struct irq_data *data)
+{
+	/*
+	 * Get top level irq_data when CONFIG_IRQ_DOMAIN_HIERARCHY is enabled,
+	 * and it should be optimized away when CONFIG_IRQ_DOMAIN_HIERARCHY is
+	 * disabled. So we avoid an "#ifdef CONFIG_IRQ_DOMAIN_HIERARCHY" here.
+	 */
+	data = irq_desc_get_irq_data(irq_data_to_desc(data));
+	return irq_can_move_pcntxt(data);
+}
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
