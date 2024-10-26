Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A5DD0C604
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Oct 2024 17:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KO9OeoAIMNwWD4j+6fpLCnTOp6VvED3Q5WsY0ekR25M=; b=jVp/s10vZSfweJ
	gUnCUDnKkVl6CYCnivmqvr/VOjee+MkxI8Il08B4RK7Zprp5KlO2vxnXq30x7awMnKLg5qCyRz3BU
	JDV8ayngujQshiJTbfNq94UUpIgVxrqg138w1/fiyvfOeEU66gOq3oBdXVNtlqXmjLnFZU4SVmk2E
	6IxdgI2LzRhAoZzVAlQBTDXrRasd/FqJBcLpmJ7tGENv52pEijZlK9tPrkpOed6hPpJueq55A3nOj
	WiC7fXk+FeDHfe8yTVP3aaAqqpfijSsCkD+ntknPN1MkgsnI49hL0mHAxXhoarK3QrGWfFhdfHfGT
	1RwCVvFd5oqxrDMonQlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4kNN-00000006xBp-37cr;
	Sat, 26 Oct 2024 17:14:57 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4kNF-00000006x7T-3ut0
	for linux-riscv@lists.infradead.org;
	Sat, 26 Oct 2024 17:14:51 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-7e6cbf6cd1dso1951209a12.3
        for <linux-riscv@lists.infradead.org>; Sat, 26 Oct 2024 10:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1729962889; x=1730567689; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wv7+Dx0EhtdMcX+vS16ls1Tc801PV63GFkQzeGMvPJc=;
        b=ncKITJrjWXcSw+g+uXfh2XHj4a4pd5OQ4OFzhBwLOdpJn3wGWxUdbwKlESvPWp1Hff
         zYYb6g7a3BWRzJZigcEju4EWncMEAu3YS6HlvdSPaE5kb13afq7Ox2RmPS6fcUlCN1VS
         z3yDNaJy5Xj2DnblaRp2VQE3YDU9NMzyqHpavLh2SF34Sct+p8+GmJtQdDucmQaelh/l
         LKPwFhV0RBs1FDqD31h9pkObBHSXOcuCQXjaiPPWvy+MOi+v3iKAXLkVD4/Wpsp/eyk7
         dagf3im96P6uWjUnt8zyQx/SVyZ8IpPCIqjw0He0UjTuZeBdvV5dB58myhsYuOz2gfRj
         9IVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729962889; x=1730567689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wv7+Dx0EhtdMcX+vS16ls1Tc801PV63GFkQzeGMvPJc=;
        b=lxLYiLH7PE1B3TpcFJnLo1rea9E7smMpRAxtVe/XOMJ0y7tjI4BKWUV9OHkM0HCZYu
         qiVjNndJwJVf5speTwb2ouWnJXzLconGhXiLrW3jSr+92yqAWKjgu6k2eyqebbOsJmIV
         iBT8V8+ccW6YTgwWxCEqUBJNeZYU0Pi2jJQUNWQiDjBcYn16KjrAb2j0hfp0TbHLmNJt
         HZzNJsbakUN+AZ5vMZ17XaNyLCaTJi9XQd3A9plp3h8Qg8B8CSKf6dXXnmE3l0fo+NC8
         kkCmn+DqPynT8Di155nEJrKCCO4ohoyyyMG448JnxyeDUE0vPIKvdmgv+GOTRv/oXnaq
         mVlg==
X-Forwarded-Encrypted: i=1; AJvYcCVspXmNaTVWKNz1AvPDVhnQNgFrvif6EOeNRGS/7L1536lWJU5TBmIvMmrabZTudgUs7IF5goVWRe4esw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwotdkcoK8OScWTMKV67hpwNwEHvA1f4WzULePI2cS9wJVZfUTL
	Gvxq/YY9SL55vemWVROnqC35RGS4pE1MZWeR0d4fk+TJP+XjGlC4fhofycqM3AA=
X-Google-Smtp-Source: AGHT+IEjLY5x3N7GeCdbR6UpuMygbezclirV4ORscEH6CuiNkRrH5F4MjYIKgmPWwSgRogFjiRq95g==
X-Received: by 2002:a17:90a:d807:b0:2da:9115:15ce with SMTP id 98e67ed59e1d1-2e8f106d6bdmr4079277a91.15.1729962888814;
        Sat, 26 Oct 2024 10:14:48 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e77e558114sm5663762a91.36.2024.10.26.10.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 10:14:48 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 4/6] asm-generic: Always define Elf_Rel and Elf_Rela
Date: Sat, 26 Oct 2024 10:13:56 -0700
Message-ID: <20241026171441.3047904-5-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241026171441.3047904-1-samuel.holland@sifive.com>
References: <20241026171441.3047904-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_101449_990256_788653E2 
X-CRM114-Status: UNSURE (   9.00  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

These definitions are useful for relocating the kernel image as well,
regardless of the type of relocations used for modules.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 include/asm-generic/module.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/include/asm-generic/module.h b/include/asm-generic/module.h
index 98e1541b72b7..a8622501b975 100644
--- a/include/asm-generic/module.h
+++ b/include/asm-generic/module.h
@@ -19,12 +19,8 @@ struct mod_arch_specific
 #define Elf_Dyn		Elf64_Dyn
 #define Elf_Ehdr	Elf64_Ehdr
 #define Elf_Addr	Elf64_Addr
-#ifdef CONFIG_MODULES_USE_ELF_REL
 #define Elf_Rel		Elf64_Rel
-#endif
-#ifdef CONFIG_MODULES_USE_ELF_RELA
 #define Elf_Rela	Elf64_Rela
-#endif
 #define ELF_R_TYPE(X)	ELF64_R_TYPE(X)
 #define ELF_R_SYM(X)	ELF64_R_SYM(X)
 
@@ -36,12 +32,8 @@ struct mod_arch_specific
 #define Elf_Dyn		Elf32_Dyn
 #define Elf_Ehdr	Elf32_Ehdr
 #define Elf_Addr	Elf32_Addr
-#ifdef CONFIG_MODULES_USE_ELF_REL
 #define Elf_Rel		Elf32_Rel
-#endif
-#ifdef CONFIG_MODULES_USE_ELF_RELA
 #define Elf_Rela	Elf32_Rela
-#endif
 #define ELF_R_TYPE(X)	ELF32_R_TYPE(X)
 #define ELF_R_SYM(X)	ELF32_R_SYM(X)
 #endif
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
