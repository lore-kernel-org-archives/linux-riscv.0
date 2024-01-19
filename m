Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 298E8C4725D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 11:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PiUqKpkbZNhUH/77b3bY6LJAw9XNxvu0Ofb6oPkdInM=; b=IqTsn96BUROy+C
	GhsMJakFasNN9GD85KHrM1soMgnK84amv+u1zMTt3ZrPXlIq02FL9cDC+j9EXJzM8sDxEgD/qU5MV
	CtCQHd350b9/nDVKlDosb54ICMjzFdkG1VhUgjgCeSAPW8Sy/RrNFMqaocGAW/ejdntz8caW+WL19
	XY+7OtR8X19FL8lPpiJBe4R1orhIlvtGoTtJUZkDzgbdG6XcIS72ERJxEANxpNYbYjsKLGMT+x/9L
	oF12/jNz4FUgEFPHqYbV/1KX5d7FyJQdyGz89KzdlzCiXW/nzD46J9eiZ0hQc8LhaQNwhqWMZqgQw
	FkUjNywmhJKGnZ/NI7Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQn9k-005Eq5-2u;
	Fri, 19 Jan 2024 11:35:28 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQn9i-005Eot-1b
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jan 2024 11:35:27 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-36091f4d8easo2129985ab.2
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jan 2024 03:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1705664124; x=1706268924; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JB3Vj18FKp8kzrC7fP7ko88EXDexTWBrSVK1Kjp8q3Q=;
        b=iV7KoVa2LGYIJDgN3zk6KWHrsFMwPjgNA3gGHOK4HHVu5AKbqvlWPhr+WSHM2w8Fms
         KV7gTHtBzVotilBy+FWvJNPhwUcR033FcPmioMTWN4z5CtgouLmDl5EZr4t2hj6uk8LJ
         0YQzQN04oTBtC0gov0Ol9xKJCPxTjPfZy7nge9/G2jiW/B2aK/I8Pp0R7MokqZ5tR4g2
         g02bY4q4vgNDXQaE2fOY9uze+EX7UQCXLq1mRXBjP0xvqnu8LxM1Dbp9ootYcXV9F6YC
         zHsg6KrPBBQty0A7H/TCjw+XDkODxCZZbNPHrbDu5hvLvdN+dsrQxpNqrODlXO+t6C1s
         sIHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705664124; x=1706268924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JB3Vj18FKp8kzrC7fP7ko88EXDexTWBrSVK1Kjp8q3Q=;
        b=D/bZ6PxoRrUJoy6Ary1Va8NoAgfeHGt7QdkFrxD5evdU5uKBBDTmyrko77XyBjk0/N
         7hzA65zRk78CCJ5Flj9xktx6IuOR7Ct3cUzS8U3+g5fCOQRefOOMF40xQvyFvs7b8Sy8
         LA4aZIHgn1tTXB47U9r2xF8R6ozANEaWOuPtmtnlp4vYtPdef/Dvr0MASf26u+iu1frf
         RUZkvOs9HGGh8CwaO+wcVgWPIaxFb8d5Llhi86f7SsHG9zBL0aZ6TP5+WxTfYy696Jme
         pBnB0FbuDqfzqTIjMq5/i5LZF5FM7eBhOC2VFWizFoTBh7LcWoyGyKpUSyzi471iOCFH
         Y1RQ==
X-Gm-Message-State: AOJu0YxPfbpGerH/UenGfyD6kheOE0qFa/UuoKM3rqrOfAXymZbcWgMK
	mW65s1M36pwusVdHc6y+ERCXZgEV7AkT6poOWOEQcm2+SGcMFmN+apD0zDSEA4A=
X-Google-Smtp-Source: AGHT+IGd1T1w9ctzUQVdgV1cwoeDle40sUshSYKn5r2via60aXBN96+yVuKGmlEjCGjfQyn1G3wsRg==
X-Received: by 2002:a92:2908:0:b0:361:99a3:5bc4 with SMTP id l8-20020a922908000000b0036199a35bc4mr2763048ilg.12.1705664124322;
        Fri, 19 Jan 2024 03:35:24 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id a5-20020a92a305000000b0036062f40c51sm5347302ili.71.2024.01.19.03.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 03:35:23 -0800 (PST)
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
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v6 4/5] tty: Add SBI debug console support to HVC SBI driver
Date: Fri, 19 Jan 2024 17:04:48 +0530
Message-Id: <20240119113449.492152-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240119113449.492152-1-apatel@ventanamicro.com>
References: <20240119113449.492152-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_033526_535706_AEC649D7 
X-CRM114-Status: GOOD (  13.94  )
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
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/tty/hvc/Kconfig         |  2 +-
 drivers/tty/hvc/hvc_riscv_sbi.c | 37 ++++++++++++++++++++++++++-------
 2 files changed, 31 insertions(+), 8 deletions(-)

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
index a72591279f86..cede8a572594 100644
--- a/drivers/tty/hvc/hvc_riscv_sbi.c
+++ b/drivers/tty/hvc/hvc_riscv_sbi.c
@@ -40,21 +40,44 @@ static ssize_t hvc_sbi_tty_get(uint32_t vtermno, u8 *buf, size_t count)
 	return i;
 }
 
-static const struct hv_ops hvc_sbi_ops = {
+static const struct hv_ops hvc_sbi_v01_ops = {
 	.get_chars = hvc_sbi_tty_get,
 	.put_chars = hvc_sbi_tty_put,
 };
 
-static int __init hvc_sbi_init(void)
+static ssize_t hvc_sbi_dbcn_tty_put(uint32_t vtermno, const u8 *buf, size_t count)
 {
-	return PTR_ERR_OR_ZERO(hvc_alloc(0, 0, &hvc_sbi_ops, 16));
+	return sbi_debug_console_write(buf, count);
 }
-device_initcall(hvc_sbi_init);
 
-static int __init hvc_sbi_console_init(void)
+static ssize_t hvc_sbi_dbcn_tty_get(uint32_t vtermno, u8 *buf, size_t count)
 {
-	hvc_instantiate(0, 0, &hvc_sbi_ops);
+	return sbi_debug_console_read(buf, count);
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
+	if (sbi_debug_console_available) {
+		err = PTR_ERR_OR_ZERO(hvc_alloc(0, 0, &hvc_sbi_dbcn_ops, 256));
+		if (err)
+			return err;
+		hvc_instantiate(0, 0, &hvc_sbi_dbcn_ops);
+	} else if (IS_ENABLED(CONFIG_RISCV_SBI_V01)) {
+		err = PTR_ERR_OR_ZERO(hvc_alloc(0, 0, &hvc_sbi_v01_ops, 256));
+		if (err)
+			return err;
+		hvc_instantiate(0, 0, &hvc_sbi_v01_ops);
+	} else {
+		return -ENODEV;
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
