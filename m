Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A398CD8CAC
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Oct 2023 17:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9KmtOtgXXZU6tYeHteSY57A1uxtQddPGOZt59cHevcU=; b=e/0/BRO58yiBL1
	R1+Vku/lKnwPRY2HLbb0wkcYc3HBD84E92GW0hgyNy43TvYRiKultPA/Jvd956tvmNcyl4HS7pn6O
	ZUw7y5DCZYbGhy5+sWVmT+T2aSkuRZgvewOkKR6xFPZCVXQcGI5FeXA50/3mdRIxYQMaHqxvusVbn
	StXK7FPqKJC9NqVrNhSGs9fQJwgt6RDw5rh8xZvYXrxYUXv0UNmk6QZ2HUoixk5w1A8WwCKDR4mjA
	g+3ADIeOb5TkeJnHJDPG2tCMxXphYT8KYhv3HrSOd/J6XPxuDv7X/beE55Z38gKu0aQY5Ka22rDfC
	Lb46jTITDpA7U23ptoww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqGB7-00Doah-1K;
	Tue, 10 Oct 2023 17:05:53 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqGB3-00DoTv-1S
	for linux-riscv@lists.infradead.org;
	Tue, 10 Oct 2023 17:05:51 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1c60cec8041so36498555ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 10 Oct 2023 10:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1696957541; x=1697562341; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Qqy4Lq8gbERMmKNa3SsbrCy4B07mso/bpWy+ieX3+w=;
        b=nxM9Gk+YKa2LT9B0uBpsZh6d9eyCxDTAnHa1FxLZ3W3++Bd4LABjzFveyB/VrmQ2ca
         YNFg9XOAGkJV2Cxcm6lsQPGjg6uSrrNiD8Dh8u1aIgF0YNv7ThafFxpxaGJrUS0VzoEO
         nj9JTKt+CHCnVSjQEXKDb0PriPELulZz30IGzTbB1stWJU7xz5ECqESTZPIBgqf4+XbQ
         1Rs3QvrtUH07oA9mV+d57T+sqAcNlQKYYmGrYO4TzYCEN3qsbuIWeJhI+tMs04Des4/0
         l22Kp9ukLRd9jlcmpnA+E+6j0ymFlArTUXHxaCtlGyreyX28k2tx5AXJwxGB1fAoHC8x
         J5uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696957541; x=1697562341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Qqy4Lq8gbERMmKNa3SsbrCy4B07mso/bpWy+ieX3+w=;
        b=VXua6HbbwCNmYoJxs6WXjkw1n0VTMj2ou4NtuYRA72en6IM2V2Yw59F2FxkeJ4fsCB
         hvO2lHpouQ5JwJHZq7CIa1vsyGkMoQKBwNEAy0lWKFNaJ53WakqtQ773LzGt1r+m3Nye
         uKljQJ7D15F1YJ9bftMJyLR/QJ+sDFEIVaPko5q1BckoO6mbZDHtrBVEMAU55d/cVdcg
         M82ol14tP5TNcnb/CkDAnFAF5UxihM/n9XRn7ORDD1gMmLOSY1VbGzAk6gH/xiiRXLm2
         aU76dkndPM/1c1zdSKVyyZDlZdDBu8Y8YtTAg2av63ouuLaaDi7pvjb7bfs5isSBwfSq
         guMg==
X-Gm-Message-State: AOJu0Yx5CaWxg0oB9JKgG91pCU8/+zTP4/OGvs/vNLbIFbjaam7Y6pJu
	x0XrvqNzYLO7wY9RYJ9cxnEXBg==
X-Google-Smtp-Source: AGHT+IERB4pxUt5nWI40xusQqE+9WUh0dFLmx7F6EOp9LBym2k+moLv9bgQcH5zXgP5QADPNDZuBnw==
X-Received: by 2002:a17:902:da89:b0:1c7:3aad:305e with SMTP id j9-20020a170902da8900b001c73aad305emr19217128plx.27.1696957541145;
        Tue, 10 Oct 2023 10:05:41 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id w19-20020a1709027b9300b001b89536974bsm11979868pll.202.2023.10.10.10.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 10:05:40 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Conor Dooley <conor@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 5/6] tty: Add SBI debug console support to HVC SBI driver
Date: Tue, 10 Oct 2023 22:35:02 +0530
Message-Id: <20231010170503.657189-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231010170503.657189-1-apatel@ventanamicro.com>
References: <20231010170503.657189-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_100549_491680_2A1FCD02 
X-CRM114-Status: GOOD (  16.38  )
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

From: Atish Patra <atishp@rivosinc.com>

RISC-V SBI specification supports advanced debug console
support via SBI DBCN extension.

Extend the HVC SBI driver to support it.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/tty/hvc/Kconfig         |  2 +-
 drivers/tty/hvc/hvc_riscv_sbi.c | 80 ++++++++++++++++++++++++++++++---
 2 files changed, 74 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/hvc/Kconfig b/drivers/tty/hvc/Kconfig
index 4f9264d005c0..6e05c5c7bca1 100644
--- a/drivers/tty/hvc/Kconfig
+++ b/drivers/tty/hvc/Kconfig
@@ -108,7 +108,7 @@ config HVC_DCC_SERIALIZE_SMP
 
 config HVC_RISCV_SBI
 	bool "RISC-V SBI console support"
-	depends on RISCV_SBI_V01
+	depends on RISCV_SBI
 	select HVC_DRIVER
 	help
 	  This enables support for console output via RISC-V SBI calls, which
diff --git a/drivers/tty/hvc/hvc_riscv_sbi.c b/drivers/tty/hvc/hvc_riscv_sbi.c
index 31f53fa77e4a..be8b7e351840 100644
--- a/drivers/tty/hvc/hvc_riscv_sbi.c
+++ b/drivers/tty/hvc/hvc_riscv_sbi.c
@@ -15,6 +15,7 @@
 
 #include "hvc_console.h"
 
+#ifdef CONFIG_RISCV_SBI_V01
 static int hvc_sbi_tty_put(uint32_t vtermno, const char *buf, int count)
 {
 	int i;
@@ -39,21 +40,86 @@ static int hvc_sbi_tty_get(uint32_t vtermno, char *buf, int count)
 	return i;
 }
 
-static const struct hv_ops hvc_sbi_ops = {
+static const struct hv_ops hvc_sbi_v01_ops = {
 	.get_chars = hvc_sbi_tty_get,
 	.put_chars = hvc_sbi_tty_put,
 };
+#endif
 
-static int __init hvc_sbi_init(void)
+static int hvc_sbi_dbcn_tty_put(uint32_t vtermno, const char *buf, int count)
 {
-	return PTR_ERR_OR_ZERO(hvc_alloc(0, 0, &hvc_sbi_ops, 16));
+	phys_addr_t pa;
+	struct sbiret ret;
+
+	if (is_vmalloc_addr(buf))
+		pa = page_to_phys(vmalloc_to_page(buf)) + offset_in_page(buf);
+	else
+		pa = __pa(buf);
+
+	ret = sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE,
+#ifdef CONFIG_32BIT
+		  count, pa, (u64)pa >> 32,
+#else
+		  count, pa, 0,
+#endif
+		  0, 0, 0);
+
+	if (ret.error)
+		return 0;
+
+	return count;
 }
-device_initcall(hvc_sbi_init);
 
-static int __init hvc_sbi_console_init(void)
+static int hvc_sbi_dbcn_tty_get(uint32_t vtermno, char *buf, int count)
 {
-	hvc_instantiate(0, 0, &hvc_sbi_ops);
+	phys_addr_t pa;
+	struct sbiret ret;
+
+	if (is_vmalloc_addr(buf))
+		pa = page_to_phys(vmalloc_to_page(buf)) + offset_in_page(buf);
+	else
+		pa = __pa(buf);
+
+	ret = sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_READ,
+#ifdef CONFIG_32BIT
+		  count, pa, (u64)pa >> 32,
+#else
+		  count, pa, 0,
+#endif
+		  0, 0, 0);
+
+	if (ret.error)
+		return 0;
+
+	return ret.value;
+}
+
+static const struct hv_ops hvc_sbi_dbcn_ops = {
+	.put_chars = hvc_sbi_dbcn_tty_put,
+	.get_chars = hvc_sbi_dbcn_tty_get,
+};
+
+static int __init hvc_sbi_init(void)
+{
+	int err;
+
+	if ((sbi_spec_version >= sbi_mk_version(2, 0)) &&
+	    (sbi_probe_extension(SBI_EXT_DBCN) > 0)) {
+		err = PTR_ERR_OR_ZERO(hvc_alloc(0, 0, &hvc_sbi_dbcn_ops, 16));
+		if (err)
+			return err;
+		hvc_instantiate(0, 0, &hvc_sbi_dbcn_ops);
+	} else {
+#ifdef CONFIG_RISCV_SBI_V01
+		err = PTR_ERR_OR_ZERO(hvc_alloc(0, 0, &hvc_sbi_v01_ops, 16));
+		if (err)
+			return err;
+		hvc_instantiate(0, 0, &hvc_sbi_v01_ops);
+#else
+		return -ENODEV;
+#endif
+	}
 
 	return 0;
 }
-console_initcall(hvc_sbi_console_init);
+device_initcall(hvc_sbi_init);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
