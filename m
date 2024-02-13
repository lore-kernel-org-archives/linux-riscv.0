Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 026A5C4829A
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 03:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/BghsH0I9HOiQxqa8ZLfH8XZoH70SMiVL79xTFgmDvM=; b=y5xF+6SBEfHkjr
	aog5IM+cIZX04gXnqAp/+wrVhH4V/Ley7UU2VZsUpmvlSbst1jSjY8HrjQVJyJk7d32eebFYm384A
	qguEO64EfRY1hSj3t0khqtlEabSvHIe1ukAbnltAbUhrHwd3OyxB8LOCPpA524dToxjNGvVNNq/7E
	A8IIanVztNfwU7u8Ahmi7/NC0FF9gFcyLtII9N5fMaCX69jgbI4AlKYJqi1kfk5lRHt/JktX4uRrP
	DRLr7kQnYn+2pv1zkspn2rgQLjQSE+aNFPy0DIPALvAU7/4bwEoScMvBhYKH6jlObauYmWipDZ94v
	wZ2EDpxtM0XBp2tovxJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZjcF-00000007rLP-0YRx;
	Tue, 13 Feb 2024 03:37:51 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZjcC-00000007rJt-0hvk
	for linux-riscv@lists.infradead.org;
	Tue, 13 Feb 2024 03:37:49 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3c031776e0cso2024251b6e.0
        for <linux-riscv@lists.infradead.org>; Mon, 12 Feb 2024 19:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1707795467; x=1708400267; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DbCTJ5IGhkP1LmE7TbGdUdt79kYAcBAyFyeC8QWmnbA=;
        b=Fda81RMSzPC+IelzNn7jGRv9y/rtXsRZ12AyuZuUDkOEamGm3XXVfipHfJovLezCG+
         FgaIqflhwUyDsTKdOoqnmYkwZ+KQtTptxr4UZuGgRA7+77ll+U6OO761uij4r1DOWzGK
         jCgS+Yks4ecnhSER+VbOvQqhhTMEGCSxz81DJr1XkvPlDkNQqUCAFuyecVWsu8yGmZjc
         wCwy9WC2FVwTLHd4Bjnf10aVtv2xExjaRiVrFdBxPmbzLkfxPo0NLXAmvHy+6ON/CsBs
         qtV/HRhjd1pcaxPBOTMCv4r2P/xb8UiERPlZDaoYcUU8th3Z+Qht3IYEQwwJVfQ5UNIe
         otnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707795467; x=1708400267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DbCTJ5IGhkP1LmE7TbGdUdt79kYAcBAyFyeC8QWmnbA=;
        b=OXDbmHKhfoI81YmZtMkkxMihSH+GqbHKTcUROPZdhfQf5o9OVxDSPdo43fngEQRfAq
         pBxFROOp5/apLJ7KR2y8weNOVZwMlRAUEZ/0j0AZuCDIAvjOeUoVqsVpq4M8Hww0F1MQ
         EUDNs/WDrpHgfd2Ai1dC7nfu8tsNfBOTiPJhjBya1nz7cK3zCtF7VFCsJNGzCSrNvkRu
         nA+xe8bdVvwVP39itLYNPP1XzJfogXQ+pg97RAmcFOMOAjTT6sebPUb/W5pbkE3Zbm0U
         84JDMWTEbG7SKTzxPLLmAmo9PQV7NzyNoDQUcXdBZF8yvSkOz7XHZMGcNxtbx3S/SWOc
         AsYw==
X-Forwarded-Encrypted: i=1; AJvYcCUUoW4cuC4XQBU9MKDU6fGefu4RufBHPc17SQegVcVsWaupcIvtJGiL4cq2aMIsZ/F/levZitme4gJM3PO1lzYYMo5xjtwWB57gXeFFZf+Y
X-Gm-Message-State: AOJu0YyMTgAQn0uKpK3h2BABoC2Bgi80jKxSn9TsocJD25rAaLKPAHEy
	h4Vkh+FR0wrFOsRAQSnU9/FGPlHZ61F0YytxubHk3MyG35I7gih2ytw1JLcf5zvoGwqiHx2XpZe
	t
X-Google-Smtp-Source: AGHT+IE+bElS9VOEBRZYkJMFWhhPq2JzIWq5hlj3C9o2gaDkJNP1gz6btAf9jVpFKefBHdsEY+u7+g==
X-Received: by 2002:a05:6808:298d:b0:3c0:2a95:d3c6 with SMTP id ex13-20020a056808298d00b003c02a95d3c6mr8180720oib.23.1707795466997;
        Mon, 12 Feb 2024 19:37:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVG/9tEvERy1/zBWmZWATN9vy2GlKgAccgGMVroA50EeE7/5k30EBoGfGzSPQVGrAPHngcjrgBYvF+RvNslSmRsSoRygVpR8QgfaonMsrMhR8Acp+tY2Km1utekPImLqFVD+seoCQDmoakBzopdLkYZdAgIlb3PDYm9oavZ06D3knOGVT+4oc8cObDPMQHZZNXQ3vsaHWtRonDxS4SpF6AEPKFEoBLA/OuzoSULbJ3HoFmYvyFM
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id v11-20020a056a00148b00b006e0334e3dd9sm6188633pfu.76.2024.02.12.19.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 19:37:46 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan O'Rear <sorear@fastmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	stable@vger.kernel.org
Subject: [PATCH -fixes v2 1/4] riscv: Fix enabling cbo.zero when running in M-mode
Date: Mon, 12 Feb 2024 19:37:32 -0800
Message-ID: <20240213033744.4069020-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213033744.4069020-1-samuel.holland@sifive.com>
References: <20240213033744.4069020-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_193748_230323_984DA287 
X-CRM114-Status: GOOD (  10.32  )
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

When the kernel is running in M-mode, the CBZE bit must be set in the
menvcfg CSR, not in senvcfg.

Cc: <stable@vger.kernel.org>
Fixes: 43c16d51a19b ("RISC-V: Enable cbo.zero in usermode")
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

 arch/riscv/include/asm/csr.h   | 2 ++
 arch/riscv/kernel/cpufeature.c | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 510014051f5d..2468c55933cd 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -424,6 +424,7 @@
 # define CSR_STATUS	CSR_MSTATUS
 # define CSR_IE		CSR_MIE
 # define CSR_TVEC	CSR_MTVEC
+# define CSR_ENVCFG	CSR_MENVCFG
 # define CSR_SCRATCH	CSR_MSCRATCH
 # define CSR_EPC	CSR_MEPC
 # define CSR_CAUSE	CSR_MCAUSE
@@ -448,6 +449,7 @@
 # define CSR_STATUS	CSR_SSTATUS
 # define CSR_IE		CSR_SIE
 # define CSR_TVEC	CSR_STVEC
+# define CSR_ENVCFG	CSR_SENVCFG
 # define CSR_SCRATCH	CSR_SSCRATCH
 # define CSR_EPC	CSR_SEPC
 # define CSR_CAUSE	CSR_SCAUSE
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 89920f84d0a3..c5b13f7dd482 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -950,7 +950,7 @@ arch_initcall(check_unaligned_access_all_cpus);
 void riscv_user_isa_enable(void)
 {
 	if (riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_ZICBOZ))
-		csr_set(CSR_SENVCFG, ENVCFG_CBZE);
+		csr_set(CSR_ENVCFG, ENVCFG_CBZE);
 }
 
 #ifdef CONFIG_RISCV_ALTERNATIVE
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
