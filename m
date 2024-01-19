Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63716C4725D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 11:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JDUalMeKXJxmjzUfDJ4lrDp27r/ZsN2DK9tT/X0yW50=; b=vPAPG79fx093u2
	7n27twU8V4acNvaY8LMgU4ReXPgeoP9L+PF9q3Gmt7SYZ2t/y+o94eJu4wsTbomV1lzTZjDwHNB24
	v053IvLLYYJ7G1phjHK93Gzs15SwVnCUJVBBqdppIH4p2u9QUw3z37tX70BqHNNgRzeviZ9GJbRpp
	JNlpw4lg+/GlwQFk3pouIMnyUDkCkyoVdhB6PoUTbVITMtIXV5hCbsFPjz2PFPaC7Uwo63P5rvz2s
	wqH+9zXBElflRLmwSMcJXyGm7hVxL0qv17iTpSfGgaESXIQtOkneN18L93gnfwvxVxwYCeXnOf2hm
	HMnwiYT1JMb/CDOjxqrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQn9Z-005ElV-0o;
	Fri, 19 Jan 2024 11:35:17 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQn9W-005Ek9-2t
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jan 2024 11:35:16 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3608bd50cbeso3160015ab.3
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jan 2024 03:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1705664113; x=1706268913; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HakN1bFuSJrmH5vBdRWtx03jEjEl7JQWSWUtuZHUeu4=;
        b=jt8x/xGps7ROKELbbuvzlXDREl6r2arm7bKPp1Zl2zvD2Lv625Uc+QIWL3nbewVtSd
         ou80sbcszBYWu08Gp6giNapSV7hrWa/LWPydCRkxLuDw5yaGEX0cYz/PdwTBr7tn+vlN
         T1mDf2TEmZ8pX5VkM/pNUC2o3Tv8NOn9RciMIevBZ4l5umDmivPDs4cpSqGQQYUNhcRS
         9JE9f4GIX8Lsw3YNH1ZuvloRvFvd80jNJDv5D8LD9oYpgakpLCpkyELDydGvt/ZzU6Gl
         S8UpgipXqTofpRcccac8jeLeBzsbJ3qgi4DmDo7mUe0cg8RKO6pxTcc6fkYN97OdklEE
         miMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705664113; x=1706268913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HakN1bFuSJrmH5vBdRWtx03jEjEl7JQWSWUtuZHUeu4=;
        b=XnsL+JuDIcoUPcl41fnhlnKUYnuIWZ0L7JIDGbrpqvEzQF0+dnzFrUOciDQzmT2d6g
         wyca0JhpuM5goCP6zMZi+EzOVWswFxGhV7rwPrMIPR/amHMFv9xjXecEDM22dX7zfDGt
         QqXzq0mywwSeOXJWpb6PBz6ug1ehcyCowJOWULfhCvcKnOZdqUJTjMoYlzgzAv1z/zQ4
         TJ8vwjANZvK2+NfW5h0rrEXrbO+yiX0n0UJiUy/YxMdzSiWs/CZfI1G8Ev4yJNuYC57I
         4RCqBdrFyvVVWQQUG8TiE2rMpaVvQrUCMOa1xU0oFWsaVs9/6vBrlZsIffiaey49Ep+a
         YQUQ==
X-Gm-Message-State: AOJu0YxGdLA+o5Xzilt8t96Wy1bKPOKP3z/YJQeiOu6qjKvwkF3zltHY
	slbt8yUhBjbR1+uIAUVDdFAghJdGGqOfElue+VI/PUcswfKs9d1DnvPqTe9rsT8=
X-Google-Smtp-Source: AGHT+IGFtjL8Em7K93L47SjMB1nw+F+/vUPksVOq3vIFdZf79/+q2KL2eT42Exg7xGjUxULzusxfHA==
X-Received: by 2002:a92:d643:0:b0:361:8f10:1a01 with SMTP id x3-20020a92d643000000b003618f101a01mr2827672ilp.18.1705664112618;
        Fri, 19 Jan 2024 03:35:12 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id a5-20020a92a305000000b0036062f40c51sm5347302ili.71.2024.01.19.03.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 03:35:12 -0800 (PST)
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
Subject: [PATCH v6 2/5] RISC-V: Add SBI debug console helper routines
Date: Fri, 19 Jan 2024 17:04:46 +0530
Message-Id: <20240119113449.492152-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240119113449.492152-1-apatel@ventanamicro.com>
References: <20240119113449.492152-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_033514_933033_951902EF 
X-CRM114-Status: GOOD (  12.81  )
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
index e0a8eca32ba5..13594efb24bd 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -351,6 +351,11 @@ static inline unsigned long sbi_mk_version(unsigned long major,
 }
 
 int sbi_err_map_linux_errno(int err);
+
+extern bool sbi_debug_console_available;
+ssize_t sbi_debug_console_write(const u8 *bytes, size_t num_bytes);
+ssize_t sbi_debug_console_read(u8 *bytes, size_t num_bytes);
+
 #else /* CONFIG_RISCV_SBI */
 static inline int sbi_remote_fence_i(const struct cpumask *cpu_mask) { return -1; }
 static inline void sbi_init(void) {}
diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index 5a62ed1da453..b06ad29f54b5 100644
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
+ssize_t sbi_debug_console_write(const u8 *bytes, size_t num_bytes)
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
+ssize_t sbi_debug_console_read(u8 *bytes, size_t num_bytes)
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
