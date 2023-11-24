Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F2DC61D97
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Nov 2023 07:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KubRPEetBC0+DUV+Tm7RpY4E5d9S3EehW74YoAiWd8A=; b=yhSZ7lX3A634gJ
	e9GOmjDwQ/RNCkxbrMCUDVHZWopA0gFhX0m9sODa4xQBPA+GThA2v8VXYM2m8bkobbMiRzz95gtq0
	hv08/TNZECN/QPTPrdp1cP2ZQHNSGtx7Q0jpjBLuFTlfkXHXfOhTvH/SfCFybnjaR1NRh4n0FjMcv
	aM9A8iI8WF/EEPwc4/+mw19ISnjzHDfVvab+69Vuv5elW8Q7UZ2YUG+0W/MncnA4/7xrz+HI/Yi6v
	TxE7+f3ReAEcmHYtGUHUfiJQxJblgz2WRsG5fNdtjhR9hUyBkoG9H6Wewbdwoipj4BwYsqtK4viuz
	aAwKNpnZwQ06IDg6GcAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6QKi-006La6-2w;
	Fri, 24 Nov 2023 07:10:36 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6QKg-006LYv-05
	for linux-riscv@lists.infradead.org;
	Fri, 24 Nov 2023 07:10:35 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-6d7e8da5e8dso843972a34.0
        for <linux-riscv@lists.infradead.org>; Thu, 23 Nov 2023 23:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1700809833; x=1701414633; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9VElKh7WOuKh8RiW2R0mJxQw2Lx4DpptCzfBSkBTAk=;
        b=esrXuF9gspDeW4hTg7qyzan5vjSA1XELKkvRniPsOL2FPy1l/Kst6nzKALj1iHbDIk
         +vtIAlFowuvmq7b0kDyK74j1+a4RvMRhz6g7+qTFrdd2G0HjHLdhgzQCWwIt+XJogJpd
         CiL9ZBuu8NF7UpwuD+l3/+3XMN5y20BLtFRKzmBXe0MCz/+zKMb6zIQ4NBfF2clbxPvG
         9Xr3bhxHE7E4a4VtwaVI37BNaPS98DegBgn793KERbSuLIMnbUbNK/8BrOefARDKZEdc
         hrISHW6xMBRWVh+8We9k9ak3uCoV5sAo4/vAvv6WdqIU2UoABNqb36EJEtczpo8q/uPM
         WMqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700809833; x=1701414633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z9VElKh7WOuKh8RiW2R0mJxQw2Lx4DpptCzfBSkBTAk=;
        b=Jsxq3TlG4EhZAn+zZG128eQLSfECxLoBkHrQL5QfL1mxDLq4/zuxaZ8Yl8Cujzh3ey
         a380DJPdKzLZJ4+sGd2v8x87iWmSjufRBR0IFppenK0UOwwEYAi0F693vo+3CnJQjqB1
         d1rUUfI+g66msdfXX+pEPk2KTRuWmCoAdclvsmp+PEI7cH4HYYtWkuidbuCoUS7nUd0X
         WXsDBRHMGiV5tDrjgL781hEITwfvuUqLofqH2RdFWavPI19GBdBVXI6RFNPZg2NNQfpp
         PMjzPB3NYHhmhHSmVeSJINMWZe6hya0t5AcqTLczRtv4c1WNGWE9KvQVGxIdvCCBYFS+
         hsEg==
X-Gm-Message-State: AOJu0YzHMZk9jF3jgBiYMTGLDwrIgp8SpBt3+UM65516B09uiSbX1K7Z
	OUEzeHACmLxtaxw+RfYxltrJzg==
X-Google-Smtp-Source: AGHT+IEG2s4ycd1mkqU7FpTGI5rAcibI7RkN0EhH6e4T2RQdhaX7LpOD9UkrqUiowsChg6UsME1p9w==
X-Received: by 2002:a05:6830:88:b0:6d3:1d04:54e with SMTP id a8-20020a056830008800b006d31d04054emr2059407oto.10.1700809832783;
        Thu, 23 Nov 2023 23:10:32 -0800 (PST)
Received: from localhost.localdomain ([106.51.83.242])
        by smtp.gmail.com with ESMTPSA id e5-20020a9d7305000000b006c61c098d38sm435532otk.21.2023.11.23.23.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 23:10:32 -0800 (PST)
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
Subject: [PATCH v5 2/5] RISC-V: Add SBI debug console helper routines
Date: Fri, 24 Nov 2023 12:39:02 +0530
Message-Id: <20231124070905.1043092-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231124070905.1043092-1-apatel@ventanamicro.com>
References: <20231124070905.1043092-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_231034_101915_4ED7FEBC 
X-CRM114-Status: GOOD (  12.89  )
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
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/sbi.h |  5 +++
 arch/riscv/kernel/sbi.c      | 66 ++++++++++++++++++++++++++++++++++++
 2 files changed, 71 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 66f3933c14f6..9eef25308d53 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -334,6 +334,11 @@ static inline unsigned long sbi_mk_version(unsigned long major,
 }
 
 int sbi_err_map_linux_errno(int err);
+
+extern bool sbi_debug_console_available;
+int sbi_debug_console_write(const char *bytes, unsigned int num_bytes);
+int sbi_debug_console_read(char *bytes, unsigned int num_bytes);
+
 #else /* CONFIG_RISCV_SBI */
 static inline int sbi_remote_fence_i(const struct cpumask *cpu_mask) { return -1; }
 static inline void sbi_init(void) {}
diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index 5a62ed1da453..e66e0999a800 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -7,6 +7,7 @@
 
 #include <linux/bits.h>
 #include <linux/init.h>
+#include <linux/mm.h>
 #include <linux/pm.h>
 #include <linux/reboot.h>
 #include <asm/sbi.h>
@@ -571,6 +572,66 @@ long sbi_get_mimpid(void)
 }
 EXPORT_SYMBOL_GPL(sbi_get_mimpid);
 
+bool sbi_debug_console_available;
+
+int sbi_debug_console_write(const char *bytes, unsigned int num_bytes)
+{
+	phys_addr_t base_addr;
+	struct sbiret ret;
+
+	if (!sbi_debug_console_available)
+		return -EOPNOTSUPP;
+
+	if (is_vmalloc_addr(bytes))
+		base_addr = page_to_phys(vmalloc_to_page(bytes)) +
+			    offset_in_page(bytes);
+	else
+		base_addr = __pa(bytes);
+	if (PAGE_SIZE < (offset_in_page(bytes) + num_bytes))
+		num_bytes = PAGE_SIZE - offset_in_page(bytes);
+
+	if (IS_ENABLED(CONFIG_32BIT))
+		ret = sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE,
+				num_bytes, lower_32_bits(base_addr),
+				upper_32_bits(base_addr), 0, 0, 0);
+	else
+		ret = sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE,
+				num_bytes, base_addr, 0, 0, 0, 0);
+
+	if (ret.error == SBI_ERR_FAILURE)
+		return -EIO;
+	return ret.error ? sbi_err_map_linux_errno(ret.error) : ret.value;
+}
+
+int sbi_debug_console_read(char *bytes, unsigned int num_bytes)
+{
+	phys_addr_t base_addr;
+	struct sbiret ret;
+
+	if (!sbi_debug_console_available)
+		return -EOPNOTSUPP;
+
+	if (is_vmalloc_addr(bytes))
+		base_addr = page_to_phys(vmalloc_to_page(bytes)) +
+			    offset_in_page(bytes);
+	else
+		base_addr = __pa(bytes);
+	if (PAGE_SIZE < (offset_in_page(bytes) + num_bytes))
+		num_bytes = PAGE_SIZE - offset_in_page(bytes);
+
+	if (IS_ENABLED(CONFIG_32BIT))
+		ret = sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_READ,
+				num_bytes, lower_32_bits(base_addr),
+				upper_32_bits(base_addr), 0, 0, 0);
+	else
+		ret = sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_READ,
+				num_bytes, base_addr, 0, 0, 0, 0);
+
+	if (ret.error == SBI_ERR_FAILURE)
+		return -EIO;
+	return ret.error ? sbi_err_map_linux_errno(ret.error) : ret.value;
+}
+
 void __init sbi_init(void)
 {
 	int ret;
@@ -612,6 +673,11 @@ void __init sbi_init(void)
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
