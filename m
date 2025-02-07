Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CAC6C02199
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 16:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MWm1gRfKHbL5YHWs//KaTiFNmKntZJzO7yxBuXpx+Fg=; b=4jnYhXUD3TeiHr
	9dkCqxKn0//3kBvjaSQ2MgK0anGRFVDfQgE+YstW9UGRz8KbrMRW6NZMAI10QbK1uPymlpQ1liKSL
	ZrWZUbOhBUjQY94oZ/5kUDbyh64MS95ieWp87R5jUWTlMZTc2REcR+HN8qoTOXleI6FaKtf1fWGFT
	QiAPaXl/y31mgMYhQ7swqHRadyS4FIWW0E7IpYagm77tTzOe92SK8Cz1ag5+lyQOTu4zh+evPUOxK
	J03ySK1OPpBmpLCSAnkdaKWkTH5QmKcpTJ0UnpQQ8VPMS6LeY+C9Zh67fxW6ZgZVSC9KNyGB+mtIh
	AxQ/LSPqPolKCB3jakEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgR5M-0000000AFLK-1I1o;
	Fri, 07 Feb 2025 16:20:08 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgR5J-0000000AFJG-3Scr
	for linux-riscv@lists.infradead.org;
	Fri, 07 Feb 2025 16:20:06 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43635796b48so13915145e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 07 Feb 2025 08:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738945204; x=1739550004; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uuW8lN3LlL4CuR3qOD5OEg9Po1ieu6WyRch8wZV6JCU=;
        b=CwG/vRE8eDHMpoFllGAwmc/V9oh+ev75UYBHzUiXEReX3vANv9CIoN1gItlsvdFhLW
         IJ8nNw6jCdtPyC+XDQznkDtk/oGsXCp4NqLvsCcY30/TqtriBPWKdfcbFrMhGSUH07tm
         ulZMYSc5rl1Qk1XyOcK0Xc48fT+P0849LgZER5ZWSnTcbkJBH6ueEeTBQp2ZMGtxbbr/
         +FUEUlC1SWd6zSny9437oKN91RnXcDT3uSlGcPZo6Rs/1oUhfwkl2Uv6712EG/fkBlLQ
         dmhS5EzLIZ2ARutG0bXFNUNzohI9Kxaqf8QPL4VP8lJywBW2JQXU6D/6CEzJjCD7oqSt
         1qJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738945204; x=1739550004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uuW8lN3LlL4CuR3qOD5OEg9Po1ieu6WyRch8wZV6JCU=;
        b=u42X+6RPhvSO82LBnrh/a4NbXEwXU/+FzTWoOSky9tZ8tuLCe6DyLdtaZNIe2MB6uv
         XSD+pirfbbdrfCs0Dw2dNZ7eaDmU2CCssNl0OYLzQHPDOEnurV5JWNGX4JA6URz0BG29
         lWEDrjG4nvKWMN6Q3h7vnY1xXmTj7hHkNMv/Svtmq14YdQpG4biKsIYgSgf74PdRpnex
         RuQy6XaQ23a+3njZXV0TYDkwBamuJGIuUhtGK9hPPJ9wF19oIBXYrb9vRRt2m5o++abM
         wOJ6eN+Cn2JdhlR9Vyhn9m3/NDDhdWHeyzIhw5I0Y6MQ4QkmRppQgJxVl+D4bopPq7xC
         WD3g==
X-Gm-Message-State: AOJu0Yy+Koa4lD3/+tgUphQ1D7vg4FYYj+dh8zzGdIzJA/weZi3QCCL+
	tcofqtC5oEgQpIN5CsOcXY2pC6ox9gmkuJF6GjTst3PjMz2iIrt7ekDgup/0eUXtBe0EYRuS8j3
	qf8o=
X-Gm-Gg: ASbGncuF1UohCdnrIoxMk2GwLQRbO1wHhYCVqZtUl79/WgVY5kfJs2th1CPh7I2oL7k
	2TaIu5lGMCpTfBkb49FSFYGdbzn0YeFRn7vQlxZ7d62c0CVTMHmtUD4UcGH/530BLFrxADhOsh1
	I6abPzaUu6fIpU7Vqc4b/zie4M9Zgo0jE8NS3UgcuLnYI4/LDGDHIuj514VMFXqTpuoospstlMv
	LoUeQzId6WcRz4mLlAjYWDEysieG7nDTjB2730ECXusX2+JvMfSy6g6s4Fq6+Y9cAt/Id9S7CBj
	TqdZ7GAdwzdn6ZC3lbfE3n9LCiFDJfRI8cGLCXS9HE3t7RENIJbap8pOFA==
X-Google-Smtp-Source: AGHT+IGMKi65e/Z5vWbx7WgCmphLVzyy3Q2WyYGIC9JFl7WcR1tKm4dOZKbtrD9rcb9U1JUgAquIdw==
X-Received: by 2002:a05:600c:6c01:b0:436:1b77:b5aa with SMTP id 5b1f17b1804b1-43912d22565mr59485145e9.8.1738945203976;
        Fri, 07 Feb 2025 08:20:03 -0800 (PST)
Received: from localhost (089144193052.atnat0002.highway.a1.net. [89.144.193.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391da96640sm62546005e9.8.2025.02.07.08.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 08:20:03 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	charlie@rivosinc.com,
	jesse@rivosinc.com,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 4/9] riscv: Change check_unaligned_access_speed_all_cpus to void
Date: Fri,  7 Feb 2025 17:19:44 +0100
Message-ID: <20250207161939.46139-15-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207161939.46139-11-ajones@ventanamicro.com>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_082005_860384_3580F076 
X-CRM114-Status: GOOD (  11.15  )
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

The return value of check_unaligned_access_speed_all_cpus() is always
zero, so make the function void so we don't need to concern ourselves
with it. The change also allows us to tidy up
check_unaligned_access_all_cpus() a bit.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/unaligned_access_speed.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index 02b485dc4bc4..780f1c5f512a 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -218,7 +218,7 @@ static int riscv_offline_cpu(unsigned int cpu)
 }
 
 /* Measure unaligned access speed on all CPUs present at boot in parallel. */
-static int __init check_unaligned_access_speed_all_cpus(void)
+static void __init check_unaligned_access_speed_all_cpus(void)
 {
 	unsigned int cpu;
 	unsigned int cpu_count = num_possible_cpus();
@@ -226,7 +226,7 @@ static int __init check_unaligned_access_speed_all_cpus(void)
 
 	if (!bufs) {
 		pr_warn("Allocation failure, not measuring misaligned performance\n");
-		return 0;
+		return;
 	}
 
 	/*
@@ -261,12 +261,10 @@ static int __init check_unaligned_access_speed_all_cpus(void)
 	}
 
 	kfree(bufs);
-	return 0;
 }
 #else /* CONFIG_RISCV_PROBE_UNALIGNED_ACCESS */
-static int __init check_unaligned_access_speed_all_cpus(void)
+static void __init check_unaligned_access_speed_all_cpus(void)
 {
-	return 0;
 }
 #endif
 
@@ -403,10 +401,10 @@ static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __alway
 
 static int __init check_unaligned_access_all_cpus(void)
 {
-	bool all_cpus_emulated;
 	int cpu;
 
-	all_cpus_emulated = check_unaligned_access_emulated_all_cpus();
+	if (!check_unaligned_access_emulated_all_cpus())
+		check_unaligned_access_speed_all_cpus();
 
 	if (!has_vector()) {
 		for_each_online_cpu(cpu)
@@ -417,9 +415,6 @@ static int __init check_unaligned_access_all_cpus(void)
 			    NULL, "vec_check_unaligned_access_speed_all_cpus");
 	}
 
-	if (!all_cpus_emulated)
-		return check_unaligned_access_speed_all_cpus();
-
 	return 0;
 }
 
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
