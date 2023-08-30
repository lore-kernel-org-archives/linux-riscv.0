Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F12F9C6FA8F
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 13:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p7gHobbN5IKAWvM26BbTmHfwP4qXXOydVGq98kF5xD0=; b=NPeDmkNMYQFRPp
	IkH/NfNTRyoTcSahZKkICtEWE5BB/t1HN8BAs/KS+W/FmSUnd9VvBwSFjAkf6uqq7P6Uf2whm+EH1
	oEMrJ/Yt9QrakJby5fWnG0+/K/JWY/RpT41yfQmVg4+CUGMbcpEI9cObWqfk0VJYZt+X/11EVJcmX
	GjUypHmQKWAgljeHM5Ku1hXgOPpgKUm9k2SzFnyfS/3Bgqf8yAKwmKbHeHvp8nKeeG07dLxjrgaOj
	o9b9so4lYaUn+89aUxKYUEBtuygM33FCUHbi0BKwwDNonZfMLazhYiYUHuhjCqj4uzhjFanKEYJle
	ac85TaCmiaIynSvv+hiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbL2q-00DX1c-1I;
	Wed, 30 Aug 2023 13:15:40 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbL2n-00DX0b-1r
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 13:15:39 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1bf55a81eeaso29975585ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 30 Aug 2023 06:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1693401336; x=1694006136; darn=lists.infradead.org;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EprF1uXyAHVR6ZTEqlGbvjAbCEeP9s8rUuKsD/Vy6Jk=;
        b=YnLgqju5/SjgIOEuWMmGTYmMMF4Pdfjy4XlVNekN3oZ8Ux5OulORXdVSufc//NkeOM
         8L7ioaxIWSVCvAOXvX8IBgWS3lQCeQ4X6wpJc5flU2xsKXLK2dD/0V+WaB6BQ8bYupAj
         C+IsupZmZMlGN2AH3sCHqDtNu4EBDYk2z7zX+Yrk0bTLGlMYBWC9NcZxJzXG07ymCPI1
         f3kQ9AoSnKOBgxEHTbXa/Qahv2LIeLA5Q3IoyXpt8iCMQQ9piYkkzfqEfJgg4C3B9bVL
         C5krtkQ1pJfibPvOMLuLwGyH8YjiEAh5cGG6LDcNLav1agfSUwFSXXYiYopnrh1mhc0W
         nsoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693401336; x=1694006136;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EprF1uXyAHVR6ZTEqlGbvjAbCEeP9s8rUuKsD/Vy6Jk=;
        b=V5KMSfx3HSmSDOeDY8NbrZGLFjDjq6VfZn8YjvZ5CvIofKTh7nDJvm4NFFDHelUszF
         nUFdYtMARAPo5PgddYicg/6604W26m/IawgkBLNA7hdUEeMRSEpnVtbgtNvhhRTA1QP9
         d1ra/2mR9Jxk5FmYmGkWjpFgwYXBFqN8YNvq1d/bqtAhhHYw/+oMJ4qk4gHDdnBz3R56
         KegQMp+722tUiZULXLT8zwmfW/aBgsNYnkC2MHIdDoehfvqYnkp3zIFmTxuFNwBMbtau
         Z1HjfZdQTrD/eBlj37BllpbI+bE/O8iWWe+PtZzCnz5vPUZALwYSEmlWsZkmAlmAqymt
         tsbA==
X-Gm-Message-State: AOJu0YxthuP+uSdWzY2cqvO/RJIn7wWnKZYJPhniXOY8Y8yuRVurdW9H
	U/Pb+wBDocmQajImAEdQdvKYgw==
X-Google-Smtp-Source: AGHT+IF8a0rUAhVVitf63UZwI8k32a0/mxdA0Wk7Zf1BpmVnyTXVtB5iS/e55nCjmj3fqFQZ5eeuCg==
X-Received: by 2002:a17:902:b948:b0:1b5:561a:5c9a with SMTP id h8-20020a170902b94800b001b5561a5c9amr1841082pls.39.1693401336356;
        Wed, 30 Aug 2023 06:15:36 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id x7-20020a170902820700b001b83e624eecsm11104947pln.81.2023.08.30.06.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 06:15:36 -0700 (PDT)
Subject: [PATCH v2 1/2] RISC-V: Provide pgtable_l5_enabled on rv32
Date: Tue, 29 Aug 2023 21:39:19 -0700
Message-ID: <20230830044129.11481-2-palmer@rivosinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230830044129.11481-1-palmer@rivosinc.com>
References: <20230830044129.11481-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org, suagrfillet@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_061537_834317_6AC98F0A 
X-CRM114-Status: GOOD (  11.73  )
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

A few of the other page table level helpers are defined on rv32, but not
pgtable_l5_enabled.  This adds the definition as a constant and converts
pgtable_l4_enabled to a constant as well.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/include/asm/pgtable-32.h | 3 +++
 arch/riscv/include/asm/pgtable.h    | 1 -
 arch/riscv/mm/init.c                | 2 ++
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/pgtable-32.h b/arch/riscv/include/asm/pgtable-32.h
index 59ba1fbaf784..49c42016f0ed 100644
--- a/arch/riscv/include/asm/pgtable-32.h
+++ b/arch/riscv/include/asm/pgtable-32.h
@@ -33,4 +33,7 @@
 					  _PAGE_WRITE | _PAGE_EXEC |	\
 					  _PAGE_USER | _PAGE_GLOBAL))
 
+static const __maybe_unused int pgtable_l4_enabled = 0;
+static const __maybe_unused int pgtable_l5_enabled = 0;
+
 #endif /* _ASM_RISCV_PGTABLE_32_H */
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 75970ee2bda2..dae884f52cc1 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -878,7 +878,6 @@ extern uintptr_t _dtb_early_pa;
 #define dtb_early_pa	_dtb_early_pa
 #endif /* CONFIG_XIP_KERNEL */
 extern u64 satp_mode;
-extern bool pgtable_l4_enabled;
 
 void paging_init(void);
 void misc_mem_init(void);
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 70fb31960b63..25ff8864e9bf 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -48,10 +48,12 @@ u64 satp_mode __ro_after_init = SATP_MODE_32;
 #endif
 EXPORT_SYMBOL(satp_mode);
 
+#ifdef CONFIG_64BIT
 bool pgtable_l4_enabled = IS_ENABLED(CONFIG_64BIT) && !IS_ENABLED(CONFIG_XIP_KERNEL);
 bool pgtable_l5_enabled = IS_ENABLED(CONFIG_64BIT) && !IS_ENABLED(CONFIG_XIP_KERNEL);
 EXPORT_SYMBOL(pgtable_l4_enabled);
 EXPORT_SYMBOL(pgtable_l5_enabled);
+#endif
 
 phys_addr_t phys_ram_base __ro_after_init;
 EXPORT_SYMBOL(phys_ram_base);
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
