Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76CDDC021A0
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Feb 2025 09:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0z3G0ier8Em4QA68TK/jvDqS5I6daJj44PZyrl4jU04=; b=pQLiGMopOahZ5G
	tdZsh/LGFPud8AqPuovNaoQD3YYj8niB3uJ0vAXY4yEsPII8ZgP8sHA1k/fm60aNSOrZCcBlmntqV
	TIP2iTKimuHtCiu1+RjxItiQ7n+RDrLCIBidtB4YRI+ep+f/zMKJOsJLrrg2c3hd9qMS2iHyng6NB
	NTJzE1+nAvsLnlBh1hsqI+K3Qs59p3WPlJsoH2dXXbjEZ10qXCic3HWNx4SgL5YhutQ22+azVikgZ
	RyP6ZNvnoQaCx+GmWaiplBEYVNaoAMinhaUtnh7yrmkyo7k7gg1yDwz8PMR+HiiAvOTSK/WEEBzO5
	ydcB2ez2dr6vNsvjoK+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjx4B-00000003rZZ-0j5F;
	Mon, 17 Feb 2025 09:05:27 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjwxT-00000003phZ-0Urn
	for linux-riscv@lists.infradead.org;
	Mon, 17 Feb 2025 08:58:32 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2fa7465baceso8397914a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 17 Feb 2025 00:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739782710; x=1740387510; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3sE/PXdSSokJ0Zgm0Fk4Pk1jUj6qdWvd3FyfD/aEiAI=;
        b=YTI0x0vRUb9YWQ04+sgcVVtc88GuuvBECDMnZzqwmUJ7I744CndG746sHHfkEpVgIZ
         uNXlb/e2hBETYq3yLHfPWLYXYWd3goKmVpZUkIjaj0WAYvjQ6py6CRVzgjVkULumg/HD
         pnPgA9XVCth+NgrXVmGW5ChFMwxYGBoujoLcxmqPeBgdV/zfljEssJKkRjgNJkK2VUCO
         zMaXcB7s0FCkGRQcAeteMnAiMXbFtcO8iT77S9l1tmdIcUCERC+2Fl9ufsgPiALseCqh
         p+dxdC5XUPIkxHFhd1uHsoZV9rPtid+AcaM5TJbB9tiZEbG3i+NAVh9UC6cTpZO2ciFo
         N46Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739782710; x=1740387510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3sE/PXdSSokJ0Zgm0Fk4Pk1jUj6qdWvd3FyfD/aEiAI=;
        b=UZFdBFobi8UvobaT8EPEyclWCZypoNlnG/Yp6IMji7uZ/xuseJRU3uUZu2+dBHCZsg
         MjwznTBvUW5mp1bNcPzJLJTzP3fhBwaWObFTeqzrSzx/8Ai8RCHFGQ5EsP84bhx+7sqz
         Qz9sN03iT5WXN6Wt3ZJleRhLleWR8jv1iDuB6oT915v8n8ayXKpzNZXeeRneFplTipK4
         Tm74jY2HQee1zKPdhqiFAKxNepkKUxOgql7dnY5PGXGPYb6anc0Z2gVBCR+cd1n31Rbb
         5kmLrMAlXur4+5l+hwKbWrlHUC1q8O70lmaSi8qz4WqXdJ8i8ic8z1Rpx7EHVYIAOT6T
         mvNw==
X-Forwarded-Encrypted: i=1; AJvYcCVGRSUoSOzH1xKc+coyqBmB9a+hUnEQUwmRFH7ki1ner7Y2J9MsbMoKz4dM8JMXVD6juQkNhzdFjlzBsw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzon3wU3b1gHHbuxII0smTO5UE74C12IbD4OsBrOF9ed5PXpP/C
	jcxUJfYNcR1Sw/x1o5tq/HDvNZTV+4jXnCHq8p2wEW9goM9Y7rKoqOtDvBPv/4E=
X-Gm-Gg: ASbGncuQRjhEBZncfvga4Y6kADStIRt4FwTpFJCdedolfn2LxJxuxjDA81patwnjcFo
	SXbkW8R9Ng0xMep1TGpFf3M0nXZmJdGcszpG+2O/rSaY8VbiEOK6/QrPo8eRRABRdQtn3kfb4GN
	0DQV+vmCmGBkYiDXNYMMi4hOP+8Jamtqk8qWFNEIY+3uaJC8r3vnhN3IyQ/Nzahp17+7Mb1ZCIp
	zeEzjW2+9YxfY+8p4nKrpUmRwO8QylPEPALb4UIRq7uiymdKwjwMJbqEl9sGxrKBwmvFCIyVFHd
	+TxKfNvjLA0dNNB16TtFHGPtbMEGMWHU3h4jrmz+mcM9souy3aHbYCY=
X-Google-Smtp-Source: AGHT+IG6/Z+Rri3hr4qvHP6StAr0ON9USjeH/PioUg2db6lXPHGQJycOyjvnq3k1DASkiPsG+dguug==
X-Received: by 2002:a05:6a00:a83:b0:732:2967:400 with SMTP id d2e1a72fcca58-732617bfe3amr12464017b3a.12.1739782710139;
        Mon, 17 Feb 2025 00:58:30 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([122.171.22.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73242546867sm7632018b3a.24.2025.02.17.00.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 00:58:29 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Subject: [PATCH v6 05/10] genirq: Introduce irq_can_move_in_process_context()
Date: Mon, 17 Feb 2025 14:26:51 +0530
Message-ID: <20250217085657.789309-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250217085657.789309-1-apatel@ventanamicro.com>
References: <20250217085657.789309-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_005831_155579_61118C00 
X-CRM114-Status: UNSURE (   9.60  )
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
