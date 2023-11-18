Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2157C5AE4B
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Nov 2023 03:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oscK3efRbqf5XbA1r48+U9mO/baoPPYKcrLETyLnFto=; b=dJGjob0XlrE2EA
	12Sw6tDlirCD2PSkFB1TgA8pfR47+TjRs/+uXaTv34wDXaCJzNCB43+UstZhG+aGq9xZKoIdm2gqO
	HZ/8nuc8QXH1Jhq7CI682OqXtRx+JBFsDV0p3kRJQJacIpN5IRRIjyfMBU23eNa7FJ4iDYEtvnU39
	AMgUcUWh09NJG8iz6NjTdo3jULwH4jpL00ArFxou6kfPTPLjiUBsJycvadhDK+/ZH2X1nfgtFMG3q
	/n8IzDYQTLvUDK8cYYAOfG2IATBo0UTdWdiK5QdGLCPLaaPhQtmWmpCR1/VTtgNwVw5XzqrvXyyKF
	He3k94OSLyxwXXRuR9OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4CBK-007n4M-0s;
	Sat, 18 Nov 2023 03:39:42 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4CBH-007n2y-0L
	for linux-riscv@lists.infradead.org;
	Sat, 18 Nov 2023 03:39:40 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-5c184b3bbc4so2022521a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 17 Nov 2023 19:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1700278778; x=1700883578; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lUknxwWYXkt9C2M9pb/Z3CUGPfJIBZQMgmHAhH/xaf8=;
        b=SIikwndx7w+FI/njOSiUL5EbrIeUjyx95Bwepvkzom/fzHAwi36HtjkI0ca9fU+0ss
         ym2ERqhX+XEQChs1DaOeoeJF94kMwRkGf27MfGdbGN+qZ8fcmXZrkvlp24tr5WrONiya
         juS7DYQ0Jsl9XI+t4Lq3k917D3UMrdod2/B4ueACQ1woDikDmMqkoAuuaIZK3zK/708q
         AUwXAbIU4cJoOrFlxgGK8gMSL4dLyRk2Fyar6v1Pa9wRxZc2H2ODMSKijHJRFX76G0NM
         fWWjbZOSsNJRnn8PyLIlybTM7Johl+SJW30ZVcv5PxPve+BgQdkWRYfNjUvpSbCoN2dW
         BC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700278778; x=1700883578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lUknxwWYXkt9C2M9pb/Z3CUGPfJIBZQMgmHAhH/xaf8=;
        b=nuzhjxm08+N5z0CLT64qC5oXQ5070kUkZiouu8IHlOFcFzJ3Xu5NiomGGwT++K55l3
         gNWqZRlBzJcg5lBIjCjKFwTM1DUyhNztJuUObv0h0aImKN8iwn7yenWFbN6JB9g9+hoI
         RhE1clsr7cav7re3EfBaevS0CGIoGUzREtALYc4xO2NiDHF9UgC/WBr5gADGV3qeGMnJ
         3AvUfNCg5oGVbaJiEoWChukDgsBKJuWTvlhE5hks5krLIbslizz91nIi3ip2dkMuP6Sp
         pKLd3S4jQ3w6iM5YVaaHfHH8AoRL75ksUNeAqaDsg3zofrZItc2kcLi4NcYjuggCmI2I
         0oxw==
X-Gm-Message-State: AOJu0YyNtQqr0zVONJH0DEPfIDBWLhJ6lMOo30K4xPiwD07o1dupxygr
	DynzqMjxLJbx0F/8w8fkKzyVcQ==
X-Google-Smtp-Source: AGHT+IGETYioNALUjNhz6JIS+eO7DP/jwO69X1kH6NZN6oXPpq2gEGKYxgt01iCN0WIJkFYPAiCO9A==
X-Received: by 2002:a17:90b:1e02:b0:27d:7887:ddc5 with SMTP id pg2-20020a17090b1e0200b0027d7887ddc5mr1729418pjb.32.1700278778017;
        Fri, 17 Nov 2023 19:39:38 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.80.108])
        by smtp.gmail.com with ESMTPSA id cz8-20020a17090ad44800b00280fcbbe774sm2053823pjb.10.2023.11.17.19.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 19:39:37 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Conor Dooley <conor@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v4 2/5] RISC-V: Add SBI debug console helper routines
Date: Sat, 18 Nov 2023 09:08:56 +0530
Message-Id: <20231118033859.726692-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231118033859.726692-1-apatel@ventanamicro.com>
References: <20231118033859.726692-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_193939_158124_9AB75249 
X-CRM114-Status: GOOD (  10.79  )
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

Let us provide SBI debug console helper routines which can be
shared by serial/earlycon-riscv-sbi.c and hvc/hvc_riscv_sbi.c.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/sbi.h |  5 +++++
 arch/riscv/kernel/sbi.c      | 43 ++++++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 66f3933c14f6..ee7aef5f6233 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -334,6 +334,11 @@ static inline unsigned long sbi_mk_version(unsigned long major,
 }
 
 int sbi_err_map_linux_errno(int err);
+
+extern bool sbi_debug_console_available;
+int sbi_debug_console_write(unsigned int num_bytes, phys_addr_t base_addr);
+int sbi_debug_console_read(unsigned int num_bytes, phys_addr_t base_addr);
+
 #else /* CONFIG_RISCV_SBI */
 static inline int sbi_remote_fence_i(const struct cpumask *cpu_mask) { return -1; }
 static inline void sbi_init(void) {}
diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index 5a62ed1da453..73a9c22c3945 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -571,6 +571,44 @@ long sbi_get_mimpid(void)
 }
 EXPORT_SYMBOL_GPL(sbi_get_mimpid);
 
+bool sbi_debug_console_available;
+
+int sbi_debug_console_write(unsigned int num_bytes, phys_addr_t base_addr)
+{
+	struct sbiret ret;
+
+	if (!sbi_debug_console_available)
+		return -EOPNOTSUPP;
+
+	if (IS_ENABLED(CONFIG_32BIT))
+		ret = sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE,
+				num_bytes, lower_32_bits(base_addr),
+				upper_32_bits(base_addr), 0, 0, 0);
+	else
+		ret = sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE,
+				num_bytes, base_addr, 0, 0, 0, 0);
+
+	return ret.error ? sbi_err_map_linux_errno(ret.error) : ret.value;
+}
+
+int sbi_debug_console_read(unsigned int num_bytes, phys_addr_t base_addr)
+{
+	struct sbiret ret;
+
+	if (!sbi_debug_console_available)
+		return -EOPNOTSUPP;
+
+	if (IS_ENABLED(CONFIG_32BIT))
+		ret = sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_READ,
+				num_bytes, lower_32_bits(base_addr),
+				upper_32_bits(base_addr), 0, 0, 0);
+	else
+		ret = sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_READ,
+				num_bytes, base_addr, 0, 0, 0, 0);
+
+	return ret.error ? sbi_err_map_linux_errno(ret.error) : ret.value;
+}
+
 void __init sbi_init(void)
 {
 	int ret;
@@ -612,6 +650,11 @@ void __init sbi_init(void)
 			sbi_srst_reboot_nb.priority = 192;
 			register_restart_handler(&sbi_srst_reboot_nb);
 		}
+		if ((sbi_spec_version >= sbi_mk_version(2, 0)) &&
+		    (sbi_probe_extension(SBI_EXT_DBCN) > 0)) {
+			pr_info("SBI DBCN extension detected\n");
+			sbi_debug_console_available = true;
+		}
 	} else {
 		__sbi_set_timer = __sbi_set_timer_v01;
 		__sbi_send_ipi	= __sbi_send_ipi_v01;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
